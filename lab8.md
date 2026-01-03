# Lab8 实验报告


### 练习1：完成读文件操作的实现

> 首先了解打开文件的处理流程，然后参考本实验后续的文件读写操作的过程分析，填写在 kern/fs/sfs/sfs_inode.c中 的sfs_io_nolock()函数，实现读文件中数据的代码。

**解答：**补充的代码如下：

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



**实验结果**：



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