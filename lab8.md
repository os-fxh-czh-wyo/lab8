# Lab8 实验报告

### 练习1：完成读文件操作的实现

> 首先了解打开文件的处理流程，然后参考本实验后续的文件读写操作的过程分析，填写在 kern/fs/sfs/sfs_inode.c中 的sfs_io_nolock()函数，实现读文件中数据的代码。

**解答**：补充的代码如下：

```c++
    // (1) 处理起始块的非对齐部分
    if ((blkoff = offset % SFS_BLKSIZE) != 0) 
    {
        size = (nblks != 0) ? (SFS_BLKSIZE - blkoff) : (endpos - offset);
        if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) { // 加载起始块的磁盘块号
            goto out;
        }
        if ((ret = sfs_buf_op(sfs, buf, size, ino, blkoff)) != 0) { // 读/写起始块的非对齐部分
            goto out;
        }
        alen += size;
        if (nblks == 0) {
            goto out;
        }
        buf += size, blkno ++, nblks --;
    }
    // (2) 处理中间的对齐块
    size = SFS_BLKSIZE;
    while (nblks != 0) {
        if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) { // 加载当前块的磁盘块号
            goto out;
        }
        if ((ret = sfs_block_op(sfs, buf, ino, 1)) != 0) { // 读/写当前块
            goto out;
        }
        alen += size, buf += size, blkno ++, nblks --;
    }
    // (3) 处理结束块的非对齐部分
    if ((size = endpos % SFS_BLKSIZE) != 0) {
        if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) { // 加载结束块的磁盘块号
            goto out;
        }
        if ((ret = sfs_buf_op(sfs, buf, size, ino, 0)) != 0) { // 读/写结束块的非对齐部分
            goto out;
        }
        alen += size;
    }
```

- 实现要点：函数把一次读/写请求分为三部分处理——首块的块内偏移段、若干整块、以及尾块的块内偏移段。首尾使用 `sfs_buf_op`（指向 `sfs_rbuf`/`sfs_wbuf`，可处理块内偏移），整块使用 `sfs_block_op`（指向 `sfs_rblock`/`sfs_wblock`，按整块高效读写）。每次实际访问前用 `sfs_bmap_load_nolock` 将文件的逻辑块索引映射（并在写时必要时分配）到磁盘块号 `ino`。

### 练习2：成基于文件系统的执行程序机制的实现

> 改写proc.c中的load_icode函数和其他相关函数，实现基于文件系统的执行程序机制。执行：make qemu。如果能看看到sh用户程序的执行界面，则基本成功了。如果在sh用户界面上可以执行exit, hello（更多用户程序放在user目录下）等其他放置在sfs文件系统中的其他执行程序，则可以认为本实验基本成功。

**解答 :**

- 该实现的核心主要在于`load_icode`函数。
  
  ```c++
  int ret = -E_NO_MEM;
  struct mm_struct *mm;
  if ((mm = mm_create()) == NULL) {
      goto bad_mm;
  }
  if (setup_pgdir(mm) != 0) {
      goto bad_pgdir_cleanup_mm;
  }
  ```

- 创建新的内存管理器，并设置页目录
  
  ```c++
  struct elfhdr __elf, *elf = &__elf;
  if ((ret = load_icode_read(fd, elf, sizeof(struct elfhdr), 0)) != 0) {
      goto bad_elf_cleanup_pgdir;
  }
  if (elf->e_magic != ELF_MAGIC) {
      ret = -E_INVAL_ELF;
      goto bad_elf_cleanup_pgdir;
  }
  ```

- 读取和验证ELF文件头
  
  ```c++
  struct proghdr __ph, *ph = &__ph;
  uint32_t vm_flags, perm, phnum;
  for (phnum = 0; phnum < elf->e_phnum; phnum ++) {
      off_t phoff = elf->e_phoff + sizeof(struct proghdr) * phnum;
      if ((ret = load_icode_read(fd, ph, sizeof(struct proghdr), phoff)) != 0) {
          goto bad_cleanup_mmap;
      }
      if (ph->p_type != ELF_PT_LOAD) {
          continue ;
      }
      if (ph->p_filesz > ph->p_memsz) {
          ret = -E_INVAL_ELF;
          goto bad_cleanup_mmap;
      }
      if (ph->p_filesz == 0) {
          continue ;
      }
  ```

- 遍历并处理程序段
  
  ```c++
  end = ph->p_va + ph->p_memsz;
  if (start < la) {
      /* ph->p_memsz == ph->p_filesz */
      if (start == end) {
          continue ;
      }
      off = start + PGSIZE - la, size = PGSIZE - off;
      if (end < la) {
          size -= la - end;
      }
      memset(page2kva(page) + off, 0, size);
      start += size;
      assert((end < la && start == end) || (end >= la && start == la));
  }
  while (start < end) {
      if ((page = pgdir_alloc_page(mm->pgdir, la, perm)) == NULL) {
          ret = -E_NO_MEM;
          goto bad_cleanup_mmap;
      }
      off = start - la, size = PGSIZE - off, la += PGSIZE;
      if (end < la) {
          size -= la - end;
      }
      memset(page2kva(page) + off, 0, size);
      start += size;
  }
  ```

- 为未初始化的数据BSS段分配内存并清零
  
  ```c++
  uint32_t argv_size=0, i;
  for (i = 0; i < argc; i ++) {
      argv_size += strnlen(kargv[i],EXEC_MAX_ARG_LEN + 1)+1;
  }
  uintptr_t stacktop = USTACKTOP - (argv_size/sizeof(long)+1)*sizeof(long);
  char** uargv=(char **)(stacktop  - argc * sizeof(char *));
  argv_size = 0;
  for (i = 0; i < argc; i ++) {
      uargv[i] = strcpy((char *)(stacktop + argv_size ), kargv[i]);
      argv_size +=  strnlen(kargv[i],EXEC_MAX_ARG_LEN + 1)+1;
  }
  stacktop = (uintptr_t)uargv - sizeof(int);
  *(int *)stacktop = argc;
  ```

- 设置命令行参数
  
  ```c++
  struct trapframe *tf = current->tf;
  memset(tf, 0, sizeof(struct trapframe));
  tf->gpr.sp = stacktop;
  tf->epc = elf->e_entry;
  tf->status = (read_csr(sstatus) & ~SSTATUS_SPP) | SSTATUS_SPIE;
  ret = 0;
  ```

- 设置陷阱帧

### 扩展练习 Challenge 1：完成基于“UNIX的PIPE机制”的设计方案

> 如果要在ucore里加入UNIX的管道（Pipe）机制，至少需要定义哪些数据结构和接口？（接口给出语义即可，不必具体实现。数据结构的设计应当给出一个（或多个）具体的C语言struct定义。在网络上查找相关的Linux资料和实现，请在实验报告中给出设计实现”UNIX的PIPE机制“的概要设方案，你的设计应当体现出对可能出现的同步互斥问题的处理。）

**解答：**

#### 一、核心数据结构设计

```c
/* 管道缓冲区结构 */
struct pipe_buffer {
    char *data;              // 环形缓冲区数据区
    size_t size;             // 缓冲区总大小（如 4KB）
    size_t read_pos;         // 读指针位置
    size_t write_pos;        // 写指针位置
    size_t count;            // 当前缓冲区中的数据量
};

/* 管道 inode 结构（扩展 inode） */
struct pipe_inode {
    struct inode inode_base;       // 基础 inode（用于 VFS 集成）
    struct pipe_buffer buffer;     // 环形缓冲区
    semaphore_t read_sem;          // 读同步信号量（缓冲区非空）
    semaphore_t write_sem;         // 写同步信号量（缓冲区未满）
    lock_t lock;                   // 互斥锁保护缓冲区操作
    int readers;                   // 当前读端打开的进程数
    int writers;                   // 当前写端打开的进程数
    wait_queue_t read_wait;        // 读等待队列
    wait_queue_t write_wait;       // 写等待队列
};

/* 扩展文件描述符标志（区分读端/写端） */
#define FD_PIPE_READ   0x01
#define FD_PIPE_WRITE  0x02
```

#### 二、关键接口设计

**1. 管道创建接口**

```c
int pipe_create(int fd[2]);
```

- 语义：创建一个匿名管道，返回两个文件描述符 `fd[0]`（读端）和 `fd[1]`（写端）。
- 实现要点：
  - 分配 `pipe_inode` 并初始化环形缓冲区（默认 4KB）。
  - 初始化同步原语：`read_sem`（初值 0，表示缓冲区空）、`write_sem`（初值 `size`，表示可写空间）、`lock`（互斥锁）。
  - 在当前进程的文件表中分配两个 `file` 结构，分别指向该 `pipe_inode`，并标记读/写权限。
  - `readers = 1, writers = 1`。

**2. 管道读接口**

```c
ssize_t pipe_read(struct file *file, char *buf, size_t len);
```

- 语义：从管道读端读取最多 `len` 字节到 `buf`，阻塞直到有数据可读或写端全部关闭。
- 实现要点：
  - 获取 `lock` 保护缓冲区。
  - 若 `count == 0` 且 `writers > 0`，释放 `lock` 并在 `read_wait` 上等待（由写操作唤醒）；若 `writers == 0`，返回 EOF（0）。
  - 从 `read_pos` 开始拷贝数据到 `buf`，更新 `read_pos`（循环回绕）和 `count`。
  - 释放 `lock`，唤醒 `write_wait` 中的写进程（缓冲区有空间）。

**3. 管道写接口**

```c
ssize_t pipe_write(struct file *file, const char *buf, size_t len);
```

- 语义：向管道写端写入最多 `len` 字节，阻塞直到有空间可写或读端全部关闭。
- 实现要点：
  - 获取 `lock`。
  - 若 `readers == 0`，返回 `-EPIPE` 错误（向无读端的管道写会触发 SIGPIPE）。
  - 若 `count == size`（缓冲区满），释放 `lock` 并在 `write_wait` 上等待（由读操作唤醒）。
  - 从 `write_pos` 开始拷贝 `buf` 到缓冲区，更新 `write_pos`（循环）和 `count`。
  - 释放 `lock`，唤醒 `read_wait` 中的读进程（缓冲区有数据）。

**4. 管道关闭接口**

```c
int pipe_close(struct file *file);
```

- 语义：关闭管道的一端（读或写），减少对应计数器。
- 实现要点：
  - 根据 `file->flags` 判断关闭的是读端还是写端，相应地 `readers--` 或 `writers--`。
  - 若 `readers == 0`，唤醒所有 `write_wait` 中的写进程（使其返回 `-EPIPE`）。
  - 若 `writers == 0`，唤醒所有 `read_wait` 中的读进程（使其返回 EOF）。
  - 若 `readers == 0 && writers == 0`，释放 `pipe_inode` 和缓冲区资源。

#### 三、同步互斥问题处理

1. **互斥访问缓冲区**：
   
   - 使用自旋锁或互斥锁（`lock`）保护 `read_pos`、`write_pos`、`count` 的并发修改。
   - 所有读/写操作在访问缓冲区前必须先获取锁，操作完成后释放。

2. **读写阻塞与唤醒**：
   
   - **读阻塞**：缓冲区空（`count == 0`）且有写端（`writers > 0`）时，读进程在 `read_wait` 队列上休眠。
   - **写阻塞**：缓冲区满（`count == size`）且有读端（`readers > 0`）时，写进程在 `write_wait` 队列上休眠。
   - **唤醒机制**：
     - 写操作成功后唤醒 `read_wait`（可能有多个读者）。
     - 读操作成功后唤醒 `write_wait`（可能有多个写者）。
     - 使用条件变量或等待队列实现高效唤醒（避免忙等）。

3. **边界情况**：
   
   - **写端全关闭**：读进程被唤醒并返回 EOF（0），不再阻塞。
   - **读端全关闭**：写进程被唤醒并返回 `-EPIPE` 错误，模拟 UNIX 的 SIGPIPE 信号。
   - **环形缓冲区回绕**：读/写指针到达缓冲区末尾时循环回 0（通过模运算实现）。

#### 四、与 VFS 集成

- 将 `pipe_inode` 注册为特殊的 inode 类型（如 `S_IFIFO`）。

- 在 `file_operations` 中注册 `pipe_read`、`pipe_write`、`pipe_close` 等操作。

- `pipe()` 系统调用实现：
  
  ```c
  int sys_pipe(int *fd_array) {
      int ret = pipe_create(fd_array);
      if (ret == 0) {
          copy_to_user(fd_array, ...); // 将 fd[0], fd[1] 拷贝到用户空间
      }
      return ret;
  }
  ```

### 扩展练习 Challenge 2：完成基于“UNIX的软连接和硬连接机制”的设计方案

> 如果要在ucore里加入UNIX的软连接和硬连接机制，至少需要定义哪些数据结构和接口？（接口给出语义即可，不必具体实现。数据结构的设计应当给出一个（或多个）具体的C语言struct定义。在网络上查找相关的Linux资料和实现，请在实验报告中给出设计实现”UNIX的软连接和硬连接机制“的概要设方案，你的设计应当体现出对可能出现的同步互斥问题的处理。）

**解答：**

#### 一、数据结构设计

```c

// 在原有inode结构基础上扩展
struct inode {
    uint32_t i_no;                 // inode编号
    uint32_t i_mode;               // 文件类型和权限
    uint32_t i_nlinks;            // 硬链接计数（新增）
    uint32_t i_size;              // 文件大小
    uint32_t i_blocks;            // 占用的磁盘块数
    uint32_t i_atime;             // 访问时间
    uint32_t i_mtime;             // 修改时间
    uint32_t i_ctime;             // 创建时间
    uint32_t i_uid;               // 所有者ID
    uint32_t i_gid;               // 组ID
    uint32_t i_flags;             // 标志位（新增）
    
    // 链接相关信息
    uint32_t i_link_target_inode;  // 硬链接的目标inode（新增）
    char *i_link_path;            // 软链接的目标路径（新增）
    
    // 同步原语
    struct spinlock lock;         // inode锁（新增）
    struct semaphore sem;         // 读写信号量（新增）
    
    // 原有字段
};
// 目录项结构
struct dirent {
    uint32_t d_ino;               // inode编号
    uint16_t d_reclen;            // 记录长度
    uint8_t d_type;               // 文件类型
    uint8_t d_namelen;            // 文件名长度
    char d_name[FS_MAX_FNAME_LEN]; // 文件名
    
    // 链接相关标志
    uint8_t d_link_flag;          // 链接标志位（新增）
    uint32_t d_target_ino;        // 链接目标in
};

// 文件系统超级块
struct super_block {
    // 原有字段
    uint32_t s_magic;             // 文件系统魔数
    uint32_t s_blocksize;         // 块大小
    uint32_t s_inode_count;       // inode总数
    uint32_t s_block_count;       // 块总数
    
    // 链接相关
    uint32_t s_max_links;         // 最大链接数（新增）
    uint32_t s_symlink_depth;     // 软链接最大深度（新增）
    
    // 同步原语
    struct spinlock s_lock;       // 超级块锁（新增）
};

```

#### 二、接口设计

```c
// 1. 创建硬链接
int vfs_hardlink(const char *oldpath, const char *newpath);
/*
 * 语义：创建一个新的目录项newpath，指向oldpath对应的inode
 * 参数：oldpath - 已存在文件的路径，newpath - 新建链接的路径
 * 返回：成功返回0，失败返回错误码
 * 同步：需要获取oldpath对应inode的锁
 */

// 2. 创建软链接
int vfs_symlink(const char *target, const char *linkpath);
/*
 * 语义：创建一个符号链接文件linkpath，内容指向target
 * 参数：target - 目标路径，linkpath - 软链接路径
 * 返回：成功返回0，失败返回错误码
 * 同步：需要创建新的inode，需要inode分配锁
 */

// 3. 读取链接
int vfs_readlink(const char *path, char *buf, size_t bufsize);
/*
 * 语义：读取软链接的内容
 * 参数：path - 软链接路径，buf - 存储目标路径的缓冲区，bufsize - 缓冲区大小
 * 返回：成功返回读取的字节数，失败返回错误码
 * 同步：需要获取inode的读锁
 */

// 4. 删除链接
int vfs_unlink(const char *path);
/*
 * 语义：删除一个链接（硬链接或软链接）
 * 参数：path - 要删除的链接路径
 * 返回：成功返回0，失败返回错误码
 * 同步：需要获取inode的锁，递减链接计数
 */

// 5. 检查链接循环
int vfs_check_link_cycle(const char *path, uint32_t max_depth);
/*
 * 语义：检查软链接是否形成循环
 * 参数：path - 起始路径，max_depth - 最大检查深度
 * 返回：无循环返回0，检测到循环返回错误码
 * 同步：需要递归获取路径上各inode的锁
 */
```

辅助接口：

```c
// 1. 获取链接信息
int vfs_get_link_info(const char *path, struct link_info *info);
/*
 * 语义：获取链接的详细信息
 * 参数：path - 路径，info - 链接信息结构
 * 返回：成功返回0，失败返回错误码
 */

// 2. 解析链接
int vfs_resolve_link(const char *path, char *resolved, size_t size);
/*
 * 语义：解析链接，返回实际路径
 * 参数：path - 路径，resolved - 存储解析后路径，size - 缓冲区大小
 * 返回：成功返回0，失败返回错误码
 */

// 3. 链接计数操作
int vfs_inc_link_count(struct inode *inode);
int vfs_dec_link_count(struct inode *inode);
/*
 * 语义：增加/减少inode的链接计数
 * 参数：inode - 目标inode
 * 返回：成功返回0，失败返回错误码
 * 同步：需要inode锁保护
 */
```

#### 三、同步互斥的处理

```bash
层级1: 超级块锁 (s_lock)
  ├── 保护文件系统全局结构
  ├── 保护inode位图
  └── 保护块位图

层级2: 目录锁
  ├── 保护目录项操作
  ├── 防止目录项竞争
  └── 与父目录inode锁关联

层级3: inode锁 (lock)
  ├── 保护inode元数据
  ├── 保护链接计数
  └── 保护数据块指针

层级4: 读写信号量 (sem)
  ├── 控制并发读写
  ├── 允许多个读，单一写
  └── 防止读写竞争
```