
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	00014297          	auipc	t0,0x14
ffffffffc0200004:	00028293          	mv	t0,t0
ffffffffc0200008:	00a2b023          	sd	a0,0(t0) # ffffffffc0214000 <boot_hartid>
ffffffffc020000c:	00014297          	auipc	t0,0x14
ffffffffc0200010:	ffc28293          	addi	t0,t0,-4 # ffffffffc0214008 <boot_dtb>
ffffffffc0200014:	00b2b023          	sd	a1,0(t0)
ffffffffc0200018:	c02132b7          	lui	t0,0xc0213
ffffffffc020001c:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200020:	037a                	slli	t1,t1,0x1e
ffffffffc0200022:	406282b3          	sub	t0,t0,t1
ffffffffc0200026:	00c2d293          	srli	t0,t0,0xc
ffffffffc020002a:	fff0031b          	addiw	t1,zero,-1
ffffffffc020002e:	137e                	slli	t1,t1,0x3f
ffffffffc0200030:	0062e2b3          	or	t0,t0,t1
ffffffffc0200034:	18029073          	csrw	satp,t0
ffffffffc0200038:	12000073          	sfence.vma
ffffffffc020003c:	c0213137          	lui	sp,0xc0213
ffffffffc0200040:	c02002b7          	lui	t0,0xc0200
ffffffffc0200044:	04a28293          	addi	t0,t0,74 # ffffffffc020004a <kern_init>
ffffffffc0200048:	8282                	jr	t0

ffffffffc020004a <kern_init>:
ffffffffc020004a:	00091517          	auipc	a0,0x91
ffffffffc020004e:	01650513          	addi	a0,a0,22 # ffffffffc0291060 <buf>
ffffffffc0200052:	00097617          	auipc	a2,0x97
ffffffffc0200056:	8be60613          	addi	a2,a2,-1858 # ffffffffc0296910 <end>
ffffffffc020005a:	1141                	addi	sp,sp,-16 # ffffffffc0212ff0 <bootstack+0x1ff0>
ffffffffc020005c:	8e09                	sub	a2,a2,a0
ffffffffc020005e:	4581                	li	a1,0
ffffffffc0200060:	e406                	sd	ra,8(sp)
ffffffffc0200062:	64a0b0ef          	jal	ffffffffc020b6ac <memset>
ffffffffc0200066:	4da000ef          	jal	ffffffffc0200540 <cons_init>
ffffffffc020006a:	0000b597          	auipc	a1,0xb
ffffffffc020006e:	6ae58593          	addi	a1,a1,1710 # ffffffffc020b718 <etext+0x4>
ffffffffc0200072:	0000b517          	auipc	a0,0xb
ffffffffc0200076:	6c650513          	addi	a0,a0,1734 # ffffffffc020b738 <etext+0x24>
ffffffffc020007a:	12c000ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020007e:	1ac000ef          	jal	ffffffffc020022a <print_kerninfo>
ffffffffc0200082:	5f4000ef          	jal	ffffffffc0200676 <dtb_init>
ffffffffc0200086:	29b020ef          	jal	ffffffffc0202b20 <pmm_init>
ffffffffc020008a:	355000ef          	jal	ffffffffc0200bde <pic_init>
ffffffffc020008e:	477000ef          	jal	ffffffffc0200d04 <idt_init>
ffffffffc0200092:	7a9030ef          	jal	ffffffffc020403a <vmm_init>
ffffffffc0200096:	210070ef          	jal	ffffffffc02072a6 <sched_init>
ffffffffc020009a:	61b060ef          	jal	ffffffffc0206eb4 <proc_init>
ffffffffc020009e:	11f000ef          	jal	ffffffffc02009bc <ide_init>
ffffffffc02000a2:	1fe050ef          	jal	ffffffffc02052a0 <fs_init>
ffffffffc02000a6:	452000ef          	jal	ffffffffc02004f8 <clock_init>
ffffffffc02000aa:	329000ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc02000ae:	7db060ef          	jal	ffffffffc0207088 <cpu_idle>

ffffffffc02000b2 <readline>:
ffffffffc02000b2:	7179                	addi	sp,sp,-48
ffffffffc02000b4:	f406                	sd	ra,40(sp)
ffffffffc02000b6:	f022                	sd	s0,32(sp)
ffffffffc02000b8:	ec26                	sd	s1,24(sp)
ffffffffc02000ba:	e84a                	sd	s2,16(sp)
ffffffffc02000bc:	e44e                	sd	s3,8(sp)
ffffffffc02000be:	c901                	beqz	a0,ffffffffc02000ce <readline+0x1c>
ffffffffc02000c0:	85aa                	mv	a1,a0
ffffffffc02000c2:	0000b517          	auipc	a0,0xb
ffffffffc02000c6:	67e50513          	addi	a0,a0,1662 # ffffffffc020b740 <etext+0x2c>
ffffffffc02000ca:	0dc000ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02000ce:	4481                	li	s1,0
ffffffffc02000d0:	497d                	li	s2,31
ffffffffc02000d2:	00091997          	auipc	s3,0x91
ffffffffc02000d6:	f8e98993          	addi	s3,s3,-114 # ffffffffc0291060 <buf>
ffffffffc02000da:	108000ef          	jal	ffffffffc02001e2 <getchar>
ffffffffc02000de:	842a                	mv	s0,a0
ffffffffc02000e0:	ff850793          	addi	a5,a0,-8
ffffffffc02000e4:	3ff4a713          	slti	a4,s1,1023
ffffffffc02000e8:	ff650693          	addi	a3,a0,-10
ffffffffc02000ec:	ff350613          	addi	a2,a0,-13
ffffffffc02000f0:	02054963          	bltz	a0,ffffffffc0200122 <readline+0x70>
ffffffffc02000f4:	02a95f63          	bge	s2,a0,ffffffffc0200132 <readline+0x80>
ffffffffc02000f8:	cf0d                	beqz	a4,ffffffffc0200132 <readline+0x80>
ffffffffc02000fa:	0e6000ef          	jal	ffffffffc02001e0 <cputchar>
ffffffffc02000fe:	009987b3          	add	a5,s3,s1
ffffffffc0200102:	00878023          	sb	s0,0(a5)
ffffffffc0200106:	2485                	addiw	s1,s1,1
ffffffffc0200108:	0da000ef          	jal	ffffffffc02001e2 <getchar>
ffffffffc020010c:	842a                	mv	s0,a0
ffffffffc020010e:	ff850793          	addi	a5,a0,-8
ffffffffc0200112:	3ff4a713          	slti	a4,s1,1023
ffffffffc0200116:	ff650693          	addi	a3,a0,-10
ffffffffc020011a:	ff350613          	addi	a2,a0,-13
ffffffffc020011e:	fc055be3          	bgez	a0,ffffffffc02000f4 <readline+0x42>
ffffffffc0200122:	70a2                	ld	ra,40(sp)
ffffffffc0200124:	7402                	ld	s0,32(sp)
ffffffffc0200126:	64e2                	ld	s1,24(sp)
ffffffffc0200128:	6942                	ld	s2,16(sp)
ffffffffc020012a:	69a2                	ld	s3,8(sp)
ffffffffc020012c:	4501                	li	a0,0
ffffffffc020012e:	6145                	addi	sp,sp,48
ffffffffc0200130:	8082                	ret
ffffffffc0200132:	eb81                	bnez	a5,ffffffffc0200142 <readline+0x90>
ffffffffc0200134:	4521                	li	a0,8
ffffffffc0200136:	00905663          	blez	s1,ffffffffc0200142 <readline+0x90>
ffffffffc020013a:	0a6000ef          	jal	ffffffffc02001e0 <cputchar>
ffffffffc020013e:	34fd                	addiw	s1,s1,-1
ffffffffc0200140:	bf69                	j	ffffffffc02000da <readline+0x28>
ffffffffc0200142:	c291                	beqz	a3,ffffffffc0200146 <readline+0x94>
ffffffffc0200144:	fa59                	bnez	a2,ffffffffc02000da <readline+0x28>
ffffffffc0200146:	8522                	mv	a0,s0
ffffffffc0200148:	098000ef          	jal	ffffffffc02001e0 <cputchar>
ffffffffc020014c:	00091517          	auipc	a0,0x91
ffffffffc0200150:	f1450513          	addi	a0,a0,-236 # ffffffffc0291060 <buf>
ffffffffc0200154:	94aa                	add	s1,s1,a0
ffffffffc0200156:	00048023          	sb	zero,0(s1)
ffffffffc020015a:	70a2                	ld	ra,40(sp)
ffffffffc020015c:	7402                	ld	s0,32(sp)
ffffffffc020015e:	64e2                	ld	s1,24(sp)
ffffffffc0200160:	6942                	ld	s2,16(sp)
ffffffffc0200162:	69a2                	ld	s3,8(sp)
ffffffffc0200164:	6145                	addi	sp,sp,48
ffffffffc0200166:	8082                	ret

ffffffffc0200168 <cputch>:
ffffffffc0200168:	1101                	addi	sp,sp,-32
ffffffffc020016a:	ec06                	sd	ra,24(sp)
ffffffffc020016c:	e42e                	sd	a1,8(sp)
ffffffffc020016e:	3e0000ef          	jal	ffffffffc020054e <cons_putc>
ffffffffc0200172:	65a2                	ld	a1,8(sp)
ffffffffc0200174:	60e2                	ld	ra,24(sp)
ffffffffc0200176:	419c                	lw	a5,0(a1)
ffffffffc0200178:	2785                	addiw	a5,a5,1
ffffffffc020017a:	c19c                	sw	a5,0(a1)
ffffffffc020017c:	6105                	addi	sp,sp,32
ffffffffc020017e:	8082                	ret

ffffffffc0200180 <vcprintf>:
ffffffffc0200180:	1101                	addi	sp,sp,-32
ffffffffc0200182:	872e                	mv	a4,a1
ffffffffc0200184:	75dd                	lui	a1,0xffff7
ffffffffc0200186:	86aa                	mv	a3,a0
ffffffffc0200188:	0070                	addi	a2,sp,12
ffffffffc020018a:	00000517          	auipc	a0,0x0
ffffffffc020018e:	fde50513          	addi	a0,a0,-34 # ffffffffc0200168 <cputch>
ffffffffc0200192:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0200196:	ec06                	sd	ra,24(sp)
ffffffffc0200198:	c602                	sw	zero,12(sp)
ffffffffc020019a:	0760b0ef          	jal	ffffffffc020b210 <vprintfmt>
ffffffffc020019e:	60e2                	ld	ra,24(sp)
ffffffffc02001a0:	4532                	lw	a0,12(sp)
ffffffffc02001a2:	6105                	addi	sp,sp,32
ffffffffc02001a4:	8082                	ret

ffffffffc02001a6 <cprintf>:
ffffffffc02001a6:	711d                	addi	sp,sp,-96
ffffffffc02001a8:	02810313          	addi	t1,sp,40
ffffffffc02001ac:	f42e                	sd	a1,40(sp)
ffffffffc02001ae:	75dd                	lui	a1,0xffff7
ffffffffc02001b0:	f832                	sd	a2,48(sp)
ffffffffc02001b2:	fc36                	sd	a3,56(sp)
ffffffffc02001b4:	e0ba                	sd	a4,64(sp)
ffffffffc02001b6:	86aa                	mv	a3,a0
ffffffffc02001b8:	0050                	addi	a2,sp,4
ffffffffc02001ba:	00000517          	auipc	a0,0x0
ffffffffc02001be:	fae50513          	addi	a0,a0,-82 # ffffffffc0200168 <cputch>
ffffffffc02001c2:	871a                	mv	a4,t1
ffffffffc02001c4:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc02001c8:	ec06                	sd	ra,24(sp)
ffffffffc02001ca:	e4be                	sd	a5,72(sp)
ffffffffc02001cc:	e8c2                	sd	a6,80(sp)
ffffffffc02001ce:	ecc6                	sd	a7,88(sp)
ffffffffc02001d0:	c202                	sw	zero,4(sp)
ffffffffc02001d2:	e41a                	sd	t1,8(sp)
ffffffffc02001d4:	03c0b0ef          	jal	ffffffffc020b210 <vprintfmt>
ffffffffc02001d8:	60e2                	ld	ra,24(sp)
ffffffffc02001da:	4512                	lw	a0,4(sp)
ffffffffc02001dc:	6125                	addi	sp,sp,96
ffffffffc02001de:	8082                	ret

ffffffffc02001e0 <cputchar>:
ffffffffc02001e0:	a6bd                	j	ffffffffc020054e <cons_putc>

ffffffffc02001e2 <getchar>:
ffffffffc02001e2:	1141                	addi	sp,sp,-16
ffffffffc02001e4:	e406                	sd	ra,8(sp)
ffffffffc02001e6:	3d0000ef          	jal	ffffffffc02005b6 <cons_getc>
ffffffffc02001ea:	dd75                	beqz	a0,ffffffffc02001e6 <getchar+0x4>
ffffffffc02001ec:	60a2                	ld	ra,8(sp)
ffffffffc02001ee:	0141                	addi	sp,sp,16
ffffffffc02001f0:	8082                	ret

ffffffffc02001f2 <strdup>:
ffffffffc02001f2:	7179                	addi	sp,sp,-48
ffffffffc02001f4:	f406                	sd	ra,40(sp)
ffffffffc02001f6:	f022                	sd	s0,32(sp)
ffffffffc02001f8:	ec26                	sd	s1,24(sp)
ffffffffc02001fa:	84aa                	mv	s1,a0
ffffffffc02001fc:	3fc0b0ef          	jal	ffffffffc020b5f8 <strlen>
ffffffffc0200200:	842a                	mv	s0,a0
ffffffffc0200202:	0505                	addi	a0,a0,1
ffffffffc0200204:	5bd010ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0200208:	87aa                	mv	a5,a0
ffffffffc020020a:	c911                	beqz	a0,ffffffffc020021e <strdup+0x2c>
ffffffffc020020c:	8622                	mv	a2,s0
ffffffffc020020e:	85a6                	mv	a1,s1
ffffffffc0200210:	e42a                	sd	a0,8(sp)
ffffffffc0200212:	4ea0b0ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc0200216:	67a2                	ld	a5,8(sp)
ffffffffc0200218:	943e                	add	s0,s0,a5
ffffffffc020021a:	00040023          	sb	zero,0(s0)
ffffffffc020021e:	70a2                	ld	ra,40(sp)
ffffffffc0200220:	7402                	ld	s0,32(sp)
ffffffffc0200222:	64e2                	ld	s1,24(sp)
ffffffffc0200224:	853e                	mv	a0,a5
ffffffffc0200226:	6145                	addi	sp,sp,48
ffffffffc0200228:	8082                	ret

ffffffffc020022a <print_kerninfo>:
ffffffffc020022a:	1141                	addi	sp,sp,-16
ffffffffc020022c:	0000b517          	auipc	a0,0xb
ffffffffc0200230:	51c50513          	addi	a0,a0,1308 # ffffffffc020b748 <etext+0x34>
ffffffffc0200234:	e406                	sd	ra,8(sp)
ffffffffc0200236:	f71ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020023a:	00000597          	auipc	a1,0x0
ffffffffc020023e:	e1058593          	addi	a1,a1,-496 # ffffffffc020004a <kern_init>
ffffffffc0200242:	0000b517          	auipc	a0,0xb
ffffffffc0200246:	52650513          	addi	a0,a0,1318 # ffffffffc020b768 <etext+0x54>
ffffffffc020024a:	f5dff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020024e:	0000b597          	auipc	a1,0xb
ffffffffc0200252:	4c658593          	addi	a1,a1,1222 # ffffffffc020b714 <etext>
ffffffffc0200256:	0000b517          	auipc	a0,0xb
ffffffffc020025a:	53250513          	addi	a0,a0,1330 # ffffffffc020b788 <etext+0x74>
ffffffffc020025e:	f49ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200262:	00091597          	auipc	a1,0x91
ffffffffc0200266:	dfe58593          	addi	a1,a1,-514 # ffffffffc0291060 <buf>
ffffffffc020026a:	0000b517          	auipc	a0,0xb
ffffffffc020026e:	53e50513          	addi	a0,a0,1342 # ffffffffc020b7a8 <etext+0x94>
ffffffffc0200272:	f35ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200276:	00096597          	auipc	a1,0x96
ffffffffc020027a:	69a58593          	addi	a1,a1,1690 # ffffffffc0296910 <end>
ffffffffc020027e:	0000b517          	auipc	a0,0xb
ffffffffc0200282:	54a50513          	addi	a0,a0,1354 # ffffffffc020b7c8 <etext+0xb4>
ffffffffc0200286:	f21ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020028a:	00000717          	auipc	a4,0x0
ffffffffc020028e:	dc070713          	addi	a4,a4,-576 # ffffffffc020004a <kern_init>
ffffffffc0200292:	00097797          	auipc	a5,0x97
ffffffffc0200296:	a7d78793          	addi	a5,a5,-1411 # ffffffffc0296d0f <end+0x3ff>
ffffffffc020029a:	8f99                	sub	a5,a5,a4
ffffffffc020029c:	43f7d593          	srai	a1,a5,0x3f
ffffffffc02002a0:	60a2                	ld	ra,8(sp)
ffffffffc02002a2:	3ff5f593          	andi	a1,a1,1023
ffffffffc02002a6:	95be                	add	a1,a1,a5
ffffffffc02002a8:	85a9                	srai	a1,a1,0xa
ffffffffc02002aa:	0000b517          	auipc	a0,0xb
ffffffffc02002ae:	53e50513          	addi	a0,a0,1342 # ffffffffc020b7e8 <etext+0xd4>
ffffffffc02002b2:	0141                	addi	sp,sp,16
ffffffffc02002b4:	bdcd                	j	ffffffffc02001a6 <cprintf>

ffffffffc02002b6 <print_stackframe>:
ffffffffc02002b6:	1141                	addi	sp,sp,-16
ffffffffc02002b8:	0000b617          	auipc	a2,0xb
ffffffffc02002bc:	56060613          	addi	a2,a2,1376 # ffffffffc020b818 <etext+0x104>
ffffffffc02002c0:	04e00593          	li	a1,78
ffffffffc02002c4:	0000b517          	auipc	a0,0xb
ffffffffc02002c8:	56c50513          	addi	a0,a0,1388 # ffffffffc020b830 <etext+0x11c>
ffffffffc02002cc:	e406                	sd	ra,8(sp)
ffffffffc02002ce:	17c000ef          	jal	ffffffffc020044a <__panic>

ffffffffc02002d2 <mon_help>:
ffffffffc02002d2:	1101                	addi	sp,sp,-32
ffffffffc02002d4:	e822                	sd	s0,16(sp)
ffffffffc02002d6:	e426                	sd	s1,8(sp)
ffffffffc02002d8:	ec06                	sd	ra,24(sp)
ffffffffc02002da:	0000f417          	auipc	s0,0xf
ffffffffc02002de:	93640413          	addi	s0,s0,-1738 # ffffffffc020ec10 <commands>
ffffffffc02002e2:	0000f497          	auipc	s1,0xf
ffffffffc02002e6:	97648493          	addi	s1,s1,-1674 # ffffffffc020ec58 <commands+0x48>
ffffffffc02002ea:	6410                	ld	a2,8(s0)
ffffffffc02002ec:	600c                	ld	a1,0(s0)
ffffffffc02002ee:	0000b517          	auipc	a0,0xb
ffffffffc02002f2:	55a50513          	addi	a0,a0,1370 # ffffffffc020b848 <etext+0x134>
ffffffffc02002f6:	0461                	addi	s0,s0,24
ffffffffc02002f8:	eafff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02002fc:	fe9417e3          	bne	s0,s1,ffffffffc02002ea <mon_help+0x18>
ffffffffc0200300:	60e2                	ld	ra,24(sp)
ffffffffc0200302:	6442                	ld	s0,16(sp)
ffffffffc0200304:	64a2                	ld	s1,8(sp)
ffffffffc0200306:	4501                	li	a0,0
ffffffffc0200308:	6105                	addi	sp,sp,32
ffffffffc020030a:	8082                	ret

ffffffffc020030c <mon_kerninfo>:
ffffffffc020030c:	1141                	addi	sp,sp,-16
ffffffffc020030e:	e406                	sd	ra,8(sp)
ffffffffc0200310:	f1bff0ef          	jal	ffffffffc020022a <print_kerninfo>
ffffffffc0200314:	60a2                	ld	ra,8(sp)
ffffffffc0200316:	4501                	li	a0,0
ffffffffc0200318:	0141                	addi	sp,sp,16
ffffffffc020031a:	8082                	ret

ffffffffc020031c <mon_backtrace>:
ffffffffc020031c:	1141                	addi	sp,sp,-16
ffffffffc020031e:	e406                	sd	ra,8(sp)
ffffffffc0200320:	f97ff0ef          	jal	ffffffffc02002b6 <print_stackframe>
ffffffffc0200324:	60a2                	ld	ra,8(sp)
ffffffffc0200326:	4501                	li	a0,0
ffffffffc0200328:	0141                	addi	sp,sp,16
ffffffffc020032a:	8082                	ret

ffffffffc020032c <kmonitor>:
ffffffffc020032c:	7131                	addi	sp,sp,-192
ffffffffc020032e:	e952                	sd	s4,144(sp)
ffffffffc0200330:	8a2a                	mv	s4,a0
ffffffffc0200332:	0000b517          	auipc	a0,0xb
ffffffffc0200336:	52650513          	addi	a0,a0,1318 # ffffffffc020b858 <etext+0x144>
ffffffffc020033a:	fd06                	sd	ra,184(sp)
ffffffffc020033c:	f922                	sd	s0,176(sp)
ffffffffc020033e:	f526                	sd	s1,168(sp)
ffffffffc0200340:	ed4e                	sd	s3,152(sp)
ffffffffc0200342:	e556                	sd	s5,136(sp)
ffffffffc0200344:	e15a                	sd	s6,128(sp)
ffffffffc0200346:	e61ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020034a:	0000b517          	auipc	a0,0xb
ffffffffc020034e:	53650513          	addi	a0,a0,1334 # ffffffffc020b880 <etext+0x16c>
ffffffffc0200352:	e55ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200356:	000a0563          	beqz	s4,ffffffffc0200360 <kmonitor+0x34>
ffffffffc020035a:	8552                	mv	a0,s4
ffffffffc020035c:	391000ef          	jal	ffffffffc0200eec <print_trapframe>
ffffffffc0200360:	0000fa97          	auipc	s5,0xf
ffffffffc0200364:	8b0a8a93          	addi	s5,s5,-1872 # ffffffffc020ec10 <commands>
ffffffffc0200368:	49bd                	li	s3,15
ffffffffc020036a:	0000b517          	auipc	a0,0xb
ffffffffc020036e:	53e50513          	addi	a0,a0,1342 # ffffffffc020b8a8 <etext+0x194>
ffffffffc0200372:	d41ff0ef          	jal	ffffffffc02000b2 <readline>
ffffffffc0200376:	842a                	mv	s0,a0
ffffffffc0200378:	d96d                	beqz	a0,ffffffffc020036a <kmonitor+0x3e>
ffffffffc020037a:	00054583          	lbu	a1,0(a0)
ffffffffc020037e:	4481                	li	s1,0
ffffffffc0200380:	e99d                	bnez	a1,ffffffffc02003b6 <kmonitor+0x8a>
ffffffffc0200382:	8b26                	mv	s6,s1
ffffffffc0200384:	fe0b03e3          	beqz	s6,ffffffffc020036a <kmonitor+0x3e>
ffffffffc0200388:	0000f497          	auipc	s1,0xf
ffffffffc020038c:	88848493          	addi	s1,s1,-1912 # ffffffffc020ec10 <commands>
ffffffffc0200390:	4401                	li	s0,0
ffffffffc0200392:	6582                	ld	a1,0(sp)
ffffffffc0200394:	6088                	ld	a0,0(s1)
ffffffffc0200396:	2a80b0ef          	jal	ffffffffc020b63e <strcmp>
ffffffffc020039a:	478d                	li	a5,3
ffffffffc020039c:	c149                	beqz	a0,ffffffffc020041e <kmonitor+0xf2>
ffffffffc020039e:	2405                	addiw	s0,s0,1
ffffffffc02003a0:	04e1                	addi	s1,s1,24
ffffffffc02003a2:	fef418e3          	bne	s0,a5,ffffffffc0200392 <kmonitor+0x66>
ffffffffc02003a6:	6582                	ld	a1,0(sp)
ffffffffc02003a8:	0000b517          	auipc	a0,0xb
ffffffffc02003ac:	53050513          	addi	a0,a0,1328 # ffffffffc020b8d8 <etext+0x1c4>
ffffffffc02003b0:	df7ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02003b4:	bf5d                	j	ffffffffc020036a <kmonitor+0x3e>
ffffffffc02003b6:	0000b517          	auipc	a0,0xb
ffffffffc02003ba:	4fa50513          	addi	a0,a0,1274 # ffffffffc020b8b0 <etext+0x19c>
ffffffffc02003be:	2dc0b0ef          	jal	ffffffffc020b69a <strchr>
ffffffffc02003c2:	c901                	beqz	a0,ffffffffc02003d2 <kmonitor+0xa6>
ffffffffc02003c4:	00144583          	lbu	a1,1(s0)
ffffffffc02003c8:	00040023          	sb	zero,0(s0)
ffffffffc02003cc:	0405                	addi	s0,s0,1
ffffffffc02003ce:	d9d5                	beqz	a1,ffffffffc0200382 <kmonitor+0x56>
ffffffffc02003d0:	b7dd                	j	ffffffffc02003b6 <kmonitor+0x8a>
ffffffffc02003d2:	00044783          	lbu	a5,0(s0)
ffffffffc02003d6:	d7d5                	beqz	a5,ffffffffc0200382 <kmonitor+0x56>
ffffffffc02003d8:	03348b63          	beq	s1,s3,ffffffffc020040e <kmonitor+0xe2>
ffffffffc02003dc:	00349793          	slli	a5,s1,0x3
ffffffffc02003e0:	978a                	add	a5,a5,sp
ffffffffc02003e2:	e380                	sd	s0,0(a5)
ffffffffc02003e4:	00044583          	lbu	a1,0(s0)
ffffffffc02003e8:	2485                	addiw	s1,s1,1
ffffffffc02003ea:	8b26                	mv	s6,s1
ffffffffc02003ec:	e591                	bnez	a1,ffffffffc02003f8 <kmonitor+0xcc>
ffffffffc02003ee:	bf59                	j	ffffffffc0200384 <kmonitor+0x58>
ffffffffc02003f0:	00144583          	lbu	a1,1(s0)
ffffffffc02003f4:	0405                	addi	s0,s0,1
ffffffffc02003f6:	d5d1                	beqz	a1,ffffffffc0200382 <kmonitor+0x56>
ffffffffc02003f8:	0000b517          	auipc	a0,0xb
ffffffffc02003fc:	4b850513          	addi	a0,a0,1208 # ffffffffc020b8b0 <etext+0x19c>
ffffffffc0200400:	29a0b0ef          	jal	ffffffffc020b69a <strchr>
ffffffffc0200404:	d575                	beqz	a0,ffffffffc02003f0 <kmonitor+0xc4>
ffffffffc0200406:	00044583          	lbu	a1,0(s0)
ffffffffc020040a:	dda5                	beqz	a1,ffffffffc0200382 <kmonitor+0x56>
ffffffffc020040c:	b76d                	j	ffffffffc02003b6 <kmonitor+0x8a>
ffffffffc020040e:	45c1                	li	a1,16
ffffffffc0200410:	0000b517          	auipc	a0,0xb
ffffffffc0200414:	4a850513          	addi	a0,a0,1192 # ffffffffc020b8b8 <etext+0x1a4>
ffffffffc0200418:	d8fff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020041c:	b7c1                	j	ffffffffc02003dc <kmonitor+0xb0>
ffffffffc020041e:	00141793          	slli	a5,s0,0x1
ffffffffc0200422:	97a2                	add	a5,a5,s0
ffffffffc0200424:	078e                	slli	a5,a5,0x3
ffffffffc0200426:	97d6                	add	a5,a5,s5
ffffffffc0200428:	6b9c                	ld	a5,16(a5)
ffffffffc020042a:	fffb051b          	addiw	a0,s6,-1
ffffffffc020042e:	8652                	mv	a2,s4
ffffffffc0200430:	002c                	addi	a1,sp,8
ffffffffc0200432:	9782                	jalr	a5
ffffffffc0200434:	f2055be3          	bgez	a0,ffffffffc020036a <kmonitor+0x3e>
ffffffffc0200438:	70ea                	ld	ra,184(sp)
ffffffffc020043a:	744a                	ld	s0,176(sp)
ffffffffc020043c:	74aa                	ld	s1,168(sp)
ffffffffc020043e:	69ea                	ld	s3,152(sp)
ffffffffc0200440:	6a4a                	ld	s4,144(sp)
ffffffffc0200442:	6aaa                	ld	s5,136(sp)
ffffffffc0200444:	6b0a                	ld	s6,128(sp)
ffffffffc0200446:	6129                	addi	sp,sp,192
ffffffffc0200448:	8082                	ret

ffffffffc020044a <__panic>:
ffffffffc020044a:	00096317          	auipc	t1,0x96
ffffffffc020044e:	41e33303          	ld	t1,1054(t1) # ffffffffc0296868 <is_panic>
ffffffffc0200452:	715d                	addi	sp,sp,-80
ffffffffc0200454:	ec06                	sd	ra,24(sp)
ffffffffc0200456:	f436                	sd	a3,40(sp)
ffffffffc0200458:	f83a                	sd	a4,48(sp)
ffffffffc020045a:	fc3e                	sd	a5,56(sp)
ffffffffc020045c:	e0c2                	sd	a6,64(sp)
ffffffffc020045e:	e4c6                	sd	a7,72(sp)
ffffffffc0200460:	02031e63          	bnez	t1,ffffffffc020049c <__panic+0x52>
ffffffffc0200464:	4705                	li	a4,1
ffffffffc0200466:	103c                	addi	a5,sp,40
ffffffffc0200468:	e822                	sd	s0,16(sp)
ffffffffc020046a:	8432                	mv	s0,a2
ffffffffc020046c:	862e                	mv	a2,a1
ffffffffc020046e:	85aa                	mv	a1,a0
ffffffffc0200470:	0000b517          	auipc	a0,0xb
ffffffffc0200474:	51050513          	addi	a0,a0,1296 # ffffffffc020b980 <etext+0x26c>
ffffffffc0200478:	00096697          	auipc	a3,0x96
ffffffffc020047c:	3ee6b823          	sd	a4,1008(a3) # ffffffffc0296868 <is_panic>
ffffffffc0200480:	e43e                	sd	a5,8(sp)
ffffffffc0200482:	d25ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200486:	65a2                	ld	a1,8(sp)
ffffffffc0200488:	8522                	mv	a0,s0
ffffffffc020048a:	cf7ff0ef          	jal	ffffffffc0200180 <vcprintf>
ffffffffc020048e:	0000b517          	auipc	a0,0xb
ffffffffc0200492:	51250513          	addi	a0,a0,1298 # ffffffffc020b9a0 <etext+0x28c>
ffffffffc0200496:	d11ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020049a:	6442                	ld	s0,16(sp)
ffffffffc020049c:	4501                	li	a0,0
ffffffffc020049e:	4581                	li	a1,0
ffffffffc02004a0:	4601                	li	a2,0
ffffffffc02004a2:	48a1                	li	a7,8
ffffffffc02004a4:	00000073          	ecall
ffffffffc02004a8:	730000ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02004ac:	4501                	li	a0,0
ffffffffc02004ae:	e7fff0ef          	jal	ffffffffc020032c <kmonitor>
ffffffffc02004b2:	bfed                	j	ffffffffc02004ac <__panic+0x62>

ffffffffc02004b4 <__warn>:
ffffffffc02004b4:	715d                	addi	sp,sp,-80
ffffffffc02004b6:	e822                	sd	s0,16(sp)
ffffffffc02004b8:	02810313          	addi	t1,sp,40
ffffffffc02004bc:	8432                	mv	s0,a2
ffffffffc02004be:	862e                	mv	a2,a1
ffffffffc02004c0:	85aa                	mv	a1,a0
ffffffffc02004c2:	0000b517          	auipc	a0,0xb
ffffffffc02004c6:	4e650513          	addi	a0,a0,1254 # ffffffffc020b9a8 <etext+0x294>
ffffffffc02004ca:	ec06                	sd	ra,24(sp)
ffffffffc02004cc:	f436                	sd	a3,40(sp)
ffffffffc02004ce:	f83a                	sd	a4,48(sp)
ffffffffc02004d0:	fc3e                	sd	a5,56(sp)
ffffffffc02004d2:	e0c2                	sd	a6,64(sp)
ffffffffc02004d4:	e4c6                	sd	a7,72(sp)
ffffffffc02004d6:	e41a                	sd	t1,8(sp)
ffffffffc02004d8:	ccfff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02004dc:	65a2                	ld	a1,8(sp)
ffffffffc02004de:	8522                	mv	a0,s0
ffffffffc02004e0:	ca1ff0ef          	jal	ffffffffc0200180 <vcprintf>
ffffffffc02004e4:	0000b517          	auipc	a0,0xb
ffffffffc02004e8:	4bc50513          	addi	a0,a0,1212 # ffffffffc020b9a0 <etext+0x28c>
ffffffffc02004ec:	cbbff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02004f0:	60e2                	ld	ra,24(sp)
ffffffffc02004f2:	6442                	ld	s0,16(sp)
ffffffffc02004f4:	6161                	addi	sp,sp,80
ffffffffc02004f6:	8082                	ret

ffffffffc02004f8 <clock_init>:
ffffffffc02004f8:	02000793          	li	a5,32
ffffffffc02004fc:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc0200500:	c0102573          	rdtime	a0
ffffffffc0200504:	67e1                	lui	a5,0x18
ffffffffc0200506:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc020050a:	953e                	add	a0,a0,a5
ffffffffc020050c:	4581                	li	a1,0
ffffffffc020050e:	4601                	li	a2,0
ffffffffc0200510:	4881                	li	a7,0
ffffffffc0200512:	00000073          	ecall
ffffffffc0200516:	0000b517          	auipc	a0,0xb
ffffffffc020051a:	4b250513          	addi	a0,a0,1202 # ffffffffc020b9c8 <etext+0x2b4>
ffffffffc020051e:	00096797          	auipc	a5,0x96
ffffffffc0200522:	3407b923          	sd	zero,850(a5) # ffffffffc0296870 <ticks>
ffffffffc0200526:	b141                	j	ffffffffc02001a6 <cprintf>

ffffffffc0200528 <clock_set_next_event>:
ffffffffc0200528:	c0102573          	rdtime	a0
ffffffffc020052c:	67e1                	lui	a5,0x18
ffffffffc020052e:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc0200532:	953e                	add	a0,a0,a5
ffffffffc0200534:	4581                	li	a1,0
ffffffffc0200536:	4601                	li	a2,0
ffffffffc0200538:	4881                	li	a7,0
ffffffffc020053a:	00000073          	ecall
ffffffffc020053e:	8082                	ret

ffffffffc0200540 <cons_init>:
ffffffffc0200540:	4501                	li	a0,0
ffffffffc0200542:	4581                	li	a1,0
ffffffffc0200544:	4601                	li	a2,0
ffffffffc0200546:	4889                	li	a7,2
ffffffffc0200548:	00000073          	ecall
ffffffffc020054c:	8082                	ret

ffffffffc020054e <cons_putc>:
ffffffffc020054e:	1101                	addi	sp,sp,-32
ffffffffc0200550:	ec06                	sd	ra,24(sp)
ffffffffc0200552:	100027f3          	csrr	a5,sstatus
ffffffffc0200556:	8b89                	andi	a5,a5,2
ffffffffc0200558:	ef95                	bnez	a5,ffffffffc0200594 <cons_putc+0x46>
ffffffffc020055a:	47a1                	li	a5,8
ffffffffc020055c:	00f50a63          	beq	a0,a5,ffffffffc0200570 <cons_putc+0x22>
ffffffffc0200560:	4581                	li	a1,0
ffffffffc0200562:	4601                	li	a2,0
ffffffffc0200564:	4885                	li	a7,1
ffffffffc0200566:	00000073          	ecall
ffffffffc020056a:	60e2                	ld	ra,24(sp)
ffffffffc020056c:	6105                	addi	sp,sp,32
ffffffffc020056e:	8082                	ret
ffffffffc0200570:	4781                	li	a5,0
ffffffffc0200572:	4521                	li	a0,8
ffffffffc0200574:	4581                	li	a1,0
ffffffffc0200576:	4601                	li	a2,0
ffffffffc0200578:	4885                	li	a7,1
ffffffffc020057a:	00000073          	ecall
ffffffffc020057e:	02000513          	li	a0,32
ffffffffc0200582:	00000073          	ecall
ffffffffc0200586:	4521                	li	a0,8
ffffffffc0200588:	00000073          	ecall
ffffffffc020058c:	dff9                	beqz	a5,ffffffffc020056a <cons_putc+0x1c>
ffffffffc020058e:	60e2                	ld	ra,24(sp)
ffffffffc0200590:	6105                	addi	sp,sp,32
ffffffffc0200592:	a581                	j	ffffffffc0200bd2 <intr_enable>
ffffffffc0200594:	e42a                	sd	a0,8(sp)
ffffffffc0200596:	642000ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc020059a:	6522                	ld	a0,8(sp)
ffffffffc020059c:	47a1                	li	a5,8
ffffffffc020059e:	00f50a63          	beq	a0,a5,ffffffffc02005b2 <cons_putc+0x64>
ffffffffc02005a2:	4581                	li	a1,0
ffffffffc02005a4:	4601                	li	a2,0
ffffffffc02005a6:	4885                	li	a7,1
ffffffffc02005a8:	00000073          	ecall
ffffffffc02005ac:	60e2                	ld	ra,24(sp)
ffffffffc02005ae:	6105                	addi	sp,sp,32
ffffffffc02005b0:	a50d                	j	ffffffffc0200bd2 <intr_enable>
ffffffffc02005b2:	4785                	li	a5,1
ffffffffc02005b4:	bf7d                	j	ffffffffc0200572 <cons_putc+0x24>

ffffffffc02005b6 <cons_getc>:
ffffffffc02005b6:	1101                	addi	sp,sp,-32
ffffffffc02005b8:	ec06                	sd	ra,24(sp)
ffffffffc02005ba:	100027f3          	csrr	a5,sstatus
ffffffffc02005be:	8b89                	andi	a5,a5,2
ffffffffc02005c0:	4801                	li	a6,0
ffffffffc02005c2:	e7d5                	bnez	a5,ffffffffc020066e <cons_getc+0xb8>
ffffffffc02005c4:	00091697          	auipc	a3,0x91
ffffffffc02005c8:	e9c68693          	addi	a3,a3,-356 # ffffffffc0291460 <cons>
ffffffffc02005cc:	07f00713          	li	a4,127
ffffffffc02005d0:	4501                	li	a0,0
ffffffffc02005d2:	4581                	li	a1,0
ffffffffc02005d4:	4601                	li	a2,0
ffffffffc02005d6:	4889                	li	a7,2
ffffffffc02005d8:	00000073          	ecall
ffffffffc02005dc:	0005079b          	sext.w	a5,a0
ffffffffc02005e0:	0207cd63          	bltz	a5,ffffffffc020061a <cons_getc+0x64>
ffffffffc02005e4:	02e78963          	beq	a5,a4,ffffffffc0200616 <cons_getc+0x60>
ffffffffc02005e8:	d7e5                	beqz	a5,ffffffffc02005d0 <cons_getc+0x1a>
ffffffffc02005ea:	00091797          	auipc	a5,0x91
ffffffffc02005ee:	07a7a783          	lw	a5,122(a5) # ffffffffc0291664 <cons+0x204>
ffffffffc02005f2:	20000593          	li	a1,512
ffffffffc02005f6:	02079613          	slli	a2,a5,0x20
ffffffffc02005fa:	9201                	srli	a2,a2,0x20
ffffffffc02005fc:	2785                	addiw	a5,a5,1
ffffffffc02005fe:	9636                	add	a2,a2,a3
ffffffffc0200600:	20f6a223          	sw	a5,516(a3)
ffffffffc0200604:	00a60023          	sb	a0,0(a2)
ffffffffc0200608:	fcb794e3          	bne	a5,a1,ffffffffc02005d0 <cons_getc+0x1a>
ffffffffc020060c:	00091797          	auipc	a5,0x91
ffffffffc0200610:	0407ac23          	sw	zero,88(a5) # ffffffffc0291664 <cons+0x204>
ffffffffc0200614:	bf75                	j	ffffffffc02005d0 <cons_getc+0x1a>
ffffffffc0200616:	4521                	li	a0,8
ffffffffc0200618:	bfc9                	j	ffffffffc02005ea <cons_getc+0x34>
ffffffffc020061a:	00091797          	auipc	a5,0x91
ffffffffc020061e:	0467a783          	lw	a5,70(a5) # ffffffffc0291660 <cons+0x200>
ffffffffc0200622:	00091717          	auipc	a4,0x91
ffffffffc0200626:	04272703          	lw	a4,66(a4) # ffffffffc0291664 <cons+0x204>
ffffffffc020062a:	4501                	li	a0,0
ffffffffc020062c:	00f70f63          	beq	a4,a5,ffffffffc020064a <cons_getc+0x94>
ffffffffc0200630:	02079713          	slli	a4,a5,0x20
ffffffffc0200634:	9301                	srli	a4,a4,0x20
ffffffffc0200636:	2785                	addiw	a5,a5,1
ffffffffc0200638:	20f6a023          	sw	a5,512(a3)
ffffffffc020063c:	96ba                	add	a3,a3,a4
ffffffffc020063e:	20000713          	li	a4,512
ffffffffc0200642:	0006c503          	lbu	a0,0(a3)
ffffffffc0200646:	00e78763          	beq	a5,a4,ffffffffc0200654 <cons_getc+0x9e>
ffffffffc020064a:	00081b63          	bnez	a6,ffffffffc0200660 <cons_getc+0xaa>
ffffffffc020064e:	60e2                	ld	ra,24(sp)
ffffffffc0200650:	6105                	addi	sp,sp,32
ffffffffc0200652:	8082                	ret
ffffffffc0200654:	00091797          	auipc	a5,0x91
ffffffffc0200658:	0007a623          	sw	zero,12(a5) # ffffffffc0291660 <cons+0x200>
ffffffffc020065c:	fe0809e3          	beqz	a6,ffffffffc020064e <cons_getc+0x98>
ffffffffc0200660:	e42a                	sd	a0,8(sp)
ffffffffc0200662:	570000ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0200666:	60e2                	ld	ra,24(sp)
ffffffffc0200668:	6522                	ld	a0,8(sp)
ffffffffc020066a:	6105                	addi	sp,sp,32
ffffffffc020066c:	8082                	ret
ffffffffc020066e:	56a000ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0200672:	4805                	li	a6,1
ffffffffc0200674:	bf81                	j	ffffffffc02005c4 <cons_getc+0xe>

ffffffffc0200676 <dtb_init>:
ffffffffc0200676:	7179                	addi	sp,sp,-48
ffffffffc0200678:	0000b517          	auipc	a0,0xb
ffffffffc020067c:	37050513          	addi	a0,a0,880 # ffffffffc020b9e8 <etext+0x2d4>
ffffffffc0200680:	f406                	sd	ra,40(sp)
ffffffffc0200682:	f022                	sd	s0,32(sp)
ffffffffc0200684:	b23ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200688:	00014597          	auipc	a1,0x14
ffffffffc020068c:	9785b583          	ld	a1,-1672(a1) # ffffffffc0214000 <boot_hartid>
ffffffffc0200690:	0000b517          	auipc	a0,0xb
ffffffffc0200694:	36850513          	addi	a0,a0,872 # ffffffffc020b9f8 <etext+0x2e4>
ffffffffc0200698:	00014417          	auipc	s0,0x14
ffffffffc020069c:	97040413          	addi	s0,s0,-1680 # ffffffffc0214008 <boot_dtb>
ffffffffc02006a0:	b07ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02006a4:	600c                	ld	a1,0(s0)
ffffffffc02006a6:	0000b517          	auipc	a0,0xb
ffffffffc02006aa:	36250513          	addi	a0,a0,866 # ffffffffc020ba08 <etext+0x2f4>
ffffffffc02006ae:	af9ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02006b2:	6018                	ld	a4,0(s0)
ffffffffc02006b4:	0000b517          	auipc	a0,0xb
ffffffffc02006b8:	36c50513          	addi	a0,a0,876 # ffffffffc020ba20 <etext+0x30c>
ffffffffc02006bc:	10070163          	beqz	a4,ffffffffc02007be <dtb_init+0x148>
ffffffffc02006c0:	57f5                	li	a5,-3
ffffffffc02006c2:	07fa                	slli	a5,a5,0x1e
ffffffffc02006c4:	973e                	add	a4,a4,a5
ffffffffc02006c6:	431c                	lw	a5,0(a4)
ffffffffc02006c8:	d00e06b7          	lui	a3,0xd00e0
ffffffffc02006cc:	eed68693          	addi	a3,a3,-275 # ffffffffd00dfeed <end+0xfe495dd>
ffffffffc02006d0:	0087d59b          	srliw	a1,a5,0x8
ffffffffc02006d4:	0187961b          	slliw	a2,a5,0x18
ffffffffc02006d8:	0187d51b          	srliw	a0,a5,0x18
ffffffffc02006dc:	0ff5f593          	zext.b	a1,a1
ffffffffc02006e0:	0107d79b          	srliw	a5,a5,0x10
ffffffffc02006e4:	05c2                	slli	a1,a1,0x10
ffffffffc02006e6:	8e49                	or	a2,a2,a0
ffffffffc02006e8:	0ff7f793          	zext.b	a5,a5
ffffffffc02006ec:	8dd1                	or	a1,a1,a2
ffffffffc02006ee:	07a2                	slli	a5,a5,0x8
ffffffffc02006f0:	8ddd                	or	a1,a1,a5
ffffffffc02006f2:	00ff0837          	lui	a6,0xff0
ffffffffc02006f6:	0cd59863          	bne	a1,a3,ffffffffc02007c6 <dtb_init+0x150>
ffffffffc02006fa:	4710                	lw	a2,8(a4)
ffffffffc02006fc:	4754                	lw	a3,12(a4)
ffffffffc02006fe:	e84a                	sd	s2,16(sp)
ffffffffc0200700:	0086541b          	srliw	s0,a2,0x8
ffffffffc0200704:	0086d79b          	srliw	a5,a3,0x8
ffffffffc0200708:	01865e1b          	srliw	t3,a2,0x18
ffffffffc020070c:	0186d89b          	srliw	a7,a3,0x18
ffffffffc0200710:	0186151b          	slliw	a0,a2,0x18
ffffffffc0200714:	0186959b          	slliw	a1,a3,0x18
ffffffffc0200718:	0104141b          	slliw	s0,s0,0x10
ffffffffc020071c:	0106561b          	srliw	a2,a2,0x10
ffffffffc0200720:	0107979b          	slliw	a5,a5,0x10
ffffffffc0200724:	0106d69b          	srliw	a3,a3,0x10
ffffffffc0200728:	01c56533          	or	a0,a0,t3
ffffffffc020072c:	0115e5b3          	or	a1,a1,a7
ffffffffc0200730:	01047433          	and	s0,s0,a6
ffffffffc0200734:	0ff67613          	zext.b	a2,a2
ffffffffc0200738:	0107f7b3          	and	a5,a5,a6
ffffffffc020073c:	0ff6f693          	zext.b	a3,a3
ffffffffc0200740:	8c49                	or	s0,s0,a0
ffffffffc0200742:	0622                	slli	a2,a2,0x8
ffffffffc0200744:	8fcd                	or	a5,a5,a1
ffffffffc0200746:	06a2                	slli	a3,a3,0x8
ffffffffc0200748:	8c51                	or	s0,s0,a2
ffffffffc020074a:	8fd5                	or	a5,a5,a3
ffffffffc020074c:	1402                	slli	s0,s0,0x20
ffffffffc020074e:	1782                	slli	a5,a5,0x20
ffffffffc0200750:	9001                	srli	s0,s0,0x20
ffffffffc0200752:	9381                	srli	a5,a5,0x20
ffffffffc0200754:	ec26                	sd	s1,24(sp)
ffffffffc0200756:	4301                	li	t1,0
ffffffffc0200758:	488d                	li	a7,3
ffffffffc020075a:	943a                	add	s0,s0,a4
ffffffffc020075c:	00e78933          	add	s2,a5,a4
ffffffffc0200760:	4e05                	li	t3,1
ffffffffc0200762:	4018                	lw	a4,0(s0)
ffffffffc0200764:	0087579b          	srliw	a5,a4,0x8
ffffffffc0200768:	0187169b          	slliw	a3,a4,0x18
ffffffffc020076c:	0187561b          	srliw	a2,a4,0x18
ffffffffc0200770:	0107979b          	slliw	a5,a5,0x10
ffffffffc0200774:	0107571b          	srliw	a4,a4,0x10
ffffffffc0200778:	0107f7b3          	and	a5,a5,a6
ffffffffc020077c:	8ed1                	or	a3,a3,a2
ffffffffc020077e:	0ff77713          	zext.b	a4,a4
ffffffffc0200782:	8fd5                	or	a5,a5,a3
ffffffffc0200784:	0722                	slli	a4,a4,0x8
ffffffffc0200786:	8fd9                	or	a5,a5,a4
ffffffffc0200788:	05178763          	beq	a5,a7,ffffffffc02007d6 <dtb_init+0x160>
ffffffffc020078c:	0411                	addi	s0,s0,4
ffffffffc020078e:	00f8e963          	bltu	a7,a5,ffffffffc02007a0 <dtb_init+0x12a>
ffffffffc0200792:	07c78d63          	beq	a5,t3,ffffffffc020080c <dtb_init+0x196>
ffffffffc0200796:	4709                	li	a4,2
ffffffffc0200798:	00e79763          	bne	a5,a4,ffffffffc02007a6 <dtb_init+0x130>
ffffffffc020079c:	4301                	li	t1,0
ffffffffc020079e:	b7d1                	j	ffffffffc0200762 <dtb_init+0xec>
ffffffffc02007a0:	4711                	li	a4,4
ffffffffc02007a2:	fce780e3          	beq	a5,a4,ffffffffc0200762 <dtb_init+0xec>
ffffffffc02007a6:	0000b517          	auipc	a0,0xb
ffffffffc02007aa:	34250513          	addi	a0,a0,834 # ffffffffc020bae8 <etext+0x3d4>
ffffffffc02007ae:	9f9ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02007b2:	64e2                	ld	s1,24(sp)
ffffffffc02007b4:	6942                	ld	s2,16(sp)
ffffffffc02007b6:	0000b517          	auipc	a0,0xb
ffffffffc02007ba:	36a50513          	addi	a0,a0,874 # ffffffffc020bb20 <etext+0x40c>
ffffffffc02007be:	7402                	ld	s0,32(sp)
ffffffffc02007c0:	70a2                	ld	ra,40(sp)
ffffffffc02007c2:	6145                	addi	sp,sp,48
ffffffffc02007c4:	b2cd                	j	ffffffffc02001a6 <cprintf>
ffffffffc02007c6:	7402                	ld	s0,32(sp)
ffffffffc02007c8:	70a2                	ld	ra,40(sp)
ffffffffc02007ca:	0000b517          	auipc	a0,0xb
ffffffffc02007ce:	27650513          	addi	a0,a0,630 # ffffffffc020ba40 <etext+0x32c>
ffffffffc02007d2:	6145                	addi	sp,sp,48
ffffffffc02007d4:	bac9                	j	ffffffffc02001a6 <cprintf>
ffffffffc02007d6:	4058                	lw	a4,4(s0)
ffffffffc02007d8:	0087579b          	srliw	a5,a4,0x8
ffffffffc02007dc:	0187169b          	slliw	a3,a4,0x18
ffffffffc02007e0:	0187561b          	srliw	a2,a4,0x18
ffffffffc02007e4:	0107979b          	slliw	a5,a5,0x10
ffffffffc02007e8:	0107571b          	srliw	a4,a4,0x10
ffffffffc02007ec:	0107f7b3          	and	a5,a5,a6
ffffffffc02007f0:	8ed1                	or	a3,a3,a2
ffffffffc02007f2:	0ff77713          	zext.b	a4,a4
ffffffffc02007f6:	8fd5                	or	a5,a5,a3
ffffffffc02007f8:	0722                	slli	a4,a4,0x8
ffffffffc02007fa:	8fd9                	or	a5,a5,a4
ffffffffc02007fc:	04031463          	bnez	t1,ffffffffc0200844 <dtb_init+0x1ce>
ffffffffc0200800:	1782                	slli	a5,a5,0x20
ffffffffc0200802:	9381                	srli	a5,a5,0x20
ffffffffc0200804:	043d                	addi	s0,s0,15
ffffffffc0200806:	943e                	add	s0,s0,a5
ffffffffc0200808:	9871                	andi	s0,s0,-4
ffffffffc020080a:	bfa1                	j	ffffffffc0200762 <dtb_init+0xec>
ffffffffc020080c:	8522                	mv	a0,s0
ffffffffc020080e:	e01a                	sd	t1,0(sp)
ffffffffc0200810:	5e90a0ef          	jal	ffffffffc020b5f8 <strlen>
ffffffffc0200814:	84aa                	mv	s1,a0
ffffffffc0200816:	4619                	li	a2,6
ffffffffc0200818:	8522                	mv	a0,s0
ffffffffc020081a:	0000b597          	auipc	a1,0xb
ffffffffc020081e:	24e58593          	addi	a1,a1,590 # ffffffffc020ba68 <etext+0x354>
ffffffffc0200822:	6510a0ef          	jal	ffffffffc020b672 <strncmp>
ffffffffc0200826:	6302                	ld	t1,0(sp)
ffffffffc0200828:	0411                	addi	s0,s0,4
ffffffffc020082a:	0004879b          	sext.w	a5,s1
ffffffffc020082e:	943e                	add	s0,s0,a5
ffffffffc0200830:	00153513          	seqz	a0,a0
ffffffffc0200834:	9871                	andi	s0,s0,-4
ffffffffc0200836:	00a36333          	or	t1,t1,a0
ffffffffc020083a:	00ff0837          	lui	a6,0xff0
ffffffffc020083e:	488d                	li	a7,3
ffffffffc0200840:	4e05                	li	t3,1
ffffffffc0200842:	b705                	j	ffffffffc0200762 <dtb_init+0xec>
ffffffffc0200844:	4418                	lw	a4,8(s0)
ffffffffc0200846:	0000b597          	auipc	a1,0xb
ffffffffc020084a:	22a58593          	addi	a1,a1,554 # ffffffffc020ba70 <etext+0x35c>
ffffffffc020084e:	e43e                	sd	a5,8(sp)
ffffffffc0200850:	0087551b          	srliw	a0,a4,0x8
ffffffffc0200854:	0187561b          	srliw	a2,a4,0x18
ffffffffc0200858:	0187169b          	slliw	a3,a4,0x18
ffffffffc020085c:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200860:	0107571b          	srliw	a4,a4,0x10
ffffffffc0200864:	01057533          	and	a0,a0,a6
ffffffffc0200868:	8ed1                	or	a3,a3,a2
ffffffffc020086a:	0ff77713          	zext.b	a4,a4
ffffffffc020086e:	0722                	slli	a4,a4,0x8
ffffffffc0200870:	8d55                	or	a0,a0,a3
ffffffffc0200872:	8d59                	or	a0,a0,a4
ffffffffc0200874:	1502                	slli	a0,a0,0x20
ffffffffc0200876:	9101                	srli	a0,a0,0x20
ffffffffc0200878:	954a                	add	a0,a0,s2
ffffffffc020087a:	e01a                	sd	t1,0(sp)
ffffffffc020087c:	5c30a0ef          	jal	ffffffffc020b63e <strcmp>
ffffffffc0200880:	67a2                	ld	a5,8(sp)
ffffffffc0200882:	473d                	li	a4,15
ffffffffc0200884:	6302                	ld	t1,0(sp)
ffffffffc0200886:	00ff0837          	lui	a6,0xff0
ffffffffc020088a:	488d                	li	a7,3
ffffffffc020088c:	4e05                	li	t3,1
ffffffffc020088e:	f6f779e3          	bgeu	a4,a5,ffffffffc0200800 <dtb_init+0x18a>
ffffffffc0200892:	f53d                	bnez	a0,ffffffffc0200800 <dtb_init+0x18a>
ffffffffc0200894:	00c43683          	ld	a3,12(s0)
ffffffffc0200898:	01443703          	ld	a4,20(s0)
ffffffffc020089c:	0000b517          	auipc	a0,0xb
ffffffffc02008a0:	1dc50513          	addi	a0,a0,476 # ffffffffc020ba78 <etext+0x364>
ffffffffc02008a4:	4206d793          	srai	a5,a3,0x20
ffffffffc02008a8:	0087d31b          	srliw	t1,a5,0x8
ffffffffc02008ac:	00871f93          	slli	t6,a4,0x8
ffffffffc02008b0:	42075893          	srai	a7,a4,0x20
ffffffffc02008b4:	0187df1b          	srliw	t5,a5,0x18
ffffffffc02008b8:	0187959b          	slliw	a1,a5,0x18
ffffffffc02008bc:	0103131b          	slliw	t1,t1,0x10
ffffffffc02008c0:	0107d79b          	srliw	a5,a5,0x10
ffffffffc02008c4:	420fd613          	srai	a2,t6,0x20
ffffffffc02008c8:	0188de9b          	srliw	t4,a7,0x18
ffffffffc02008cc:	01037333          	and	t1,t1,a6
ffffffffc02008d0:	01889e1b          	slliw	t3,a7,0x18
ffffffffc02008d4:	01e5e5b3          	or	a1,a1,t5
ffffffffc02008d8:	0ff7f793          	zext.b	a5,a5
ffffffffc02008dc:	01de6e33          	or	t3,t3,t4
ffffffffc02008e0:	0065e5b3          	or	a1,a1,t1
ffffffffc02008e4:	01067633          	and	a2,a2,a6
ffffffffc02008e8:	0086d31b          	srliw	t1,a3,0x8
ffffffffc02008ec:	0087541b          	srliw	s0,a4,0x8
ffffffffc02008f0:	07a2                	slli	a5,a5,0x8
ffffffffc02008f2:	0108d89b          	srliw	a7,a7,0x10
ffffffffc02008f6:	0186df1b          	srliw	t5,a3,0x18
ffffffffc02008fa:	01875e9b          	srliw	t4,a4,0x18
ffffffffc02008fe:	8ddd                	or	a1,a1,a5
ffffffffc0200900:	01c66633          	or	a2,a2,t3
ffffffffc0200904:	0186979b          	slliw	a5,a3,0x18
ffffffffc0200908:	01871e1b          	slliw	t3,a4,0x18
ffffffffc020090c:	0ff8f893          	zext.b	a7,a7
ffffffffc0200910:	0103131b          	slliw	t1,t1,0x10
ffffffffc0200914:	0106d69b          	srliw	a3,a3,0x10
ffffffffc0200918:	0104141b          	slliw	s0,s0,0x10
ffffffffc020091c:	0107571b          	srliw	a4,a4,0x10
ffffffffc0200920:	01037333          	and	t1,t1,a6
ffffffffc0200924:	08a2                	slli	a7,a7,0x8
ffffffffc0200926:	01e7e7b3          	or	a5,a5,t5
ffffffffc020092a:	01047433          	and	s0,s0,a6
ffffffffc020092e:	0ff6f693          	zext.b	a3,a3
ffffffffc0200932:	01de6833          	or	a6,t3,t4
ffffffffc0200936:	0ff77713          	zext.b	a4,a4
ffffffffc020093a:	01166633          	or	a2,a2,a7
ffffffffc020093e:	0067e7b3          	or	a5,a5,t1
ffffffffc0200942:	06a2                	slli	a3,a3,0x8
ffffffffc0200944:	01046433          	or	s0,s0,a6
ffffffffc0200948:	0722                	slli	a4,a4,0x8
ffffffffc020094a:	8fd5                	or	a5,a5,a3
ffffffffc020094c:	8c59                	or	s0,s0,a4
ffffffffc020094e:	1582                	slli	a1,a1,0x20
ffffffffc0200950:	1602                	slli	a2,a2,0x20
ffffffffc0200952:	1782                	slli	a5,a5,0x20
ffffffffc0200954:	9201                	srli	a2,a2,0x20
ffffffffc0200956:	9181                	srli	a1,a1,0x20
ffffffffc0200958:	1402                	slli	s0,s0,0x20
ffffffffc020095a:	00b7e4b3          	or	s1,a5,a1
ffffffffc020095e:	8c51                	or	s0,s0,a2
ffffffffc0200960:	847ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200964:	85a6                	mv	a1,s1
ffffffffc0200966:	0000b517          	auipc	a0,0xb
ffffffffc020096a:	13250513          	addi	a0,a0,306 # ffffffffc020ba98 <etext+0x384>
ffffffffc020096e:	839ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200972:	01445613          	srli	a2,s0,0x14
ffffffffc0200976:	85a2                	mv	a1,s0
ffffffffc0200978:	0000b517          	auipc	a0,0xb
ffffffffc020097c:	13850513          	addi	a0,a0,312 # ffffffffc020bab0 <etext+0x39c>
ffffffffc0200980:	827ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200984:	009405b3          	add	a1,s0,s1
ffffffffc0200988:	15fd                	addi	a1,a1,-1
ffffffffc020098a:	0000b517          	auipc	a0,0xb
ffffffffc020098e:	14650513          	addi	a0,a0,326 # ffffffffc020bad0 <etext+0x3bc>
ffffffffc0200992:	815ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200996:	00096797          	auipc	a5,0x96
ffffffffc020099a:	ee97b523          	sd	s1,-278(a5) # ffffffffc0296880 <memory_base>
ffffffffc020099e:	00096797          	auipc	a5,0x96
ffffffffc02009a2:	ec87bd23          	sd	s0,-294(a5) # ffffffffc0296878 <memory_size>
ffffffffc02009a6:	b531                	j	ffffffffc02007b2 <dtb_init+0x13c>

ffffffffc02009a8 <get_memory_base>:
ffffffffc02009a8:	00096517          	auipc	a0,0x96
ffffffffc02009ac:	ed853503          	ld	a0,-296(a0) # ffffffffc0296880 <memory_base>
ffffffffc02009b0:	8082                	ret

ffffffffc02009b2 <get_memory_size>:
ffffffffc02009b2:	00096517          	auipc	a0,0x96
ffffffffc02009b6:	ec653503          	ld	a0,-314(a0) # ffffffffc0296878 <memory_size>
ffffffffc02009ba:	8082                	ret

ffffffffc02009bc <ide_init>:
ffffffffc02009bc:	1141                	addi	sp,sp,-16
ffffffffc02009be:	00091597          	auipc	a1,0x91
ffffffffc02009c2:	cfa58593          	addi	a1,a1,-774 # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc02009c6:	4505                	li	a0,1
ffffffffc02009c8:	00091797          	auipc	a5,0x91
ffffffffc02009cc:	ca07a023          	sw	zero,-864(a5) # ffffffffc0291668 <ide_devices>
ffffffffc02009d0:	00091797          	auipc	a5,0x91
ffffffffc02009d4:	ce07a423          	sw	zero,-792(a5) # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc02009d8:	00091797          	auipc	a5,0x91
ffffffffc02009dc:	d207a823          	sw	zero,-720(a5) # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc02009e0:	00091797          	auipc	a5,0x91
ffffffffc02009e4:	d607ac23          	sw	zero,-648(a5) # ffffffffc0291758 <ide_devices+0xf0>
ffffffffc02009e8:	e406                	sd	ra,8(sp)
ffffffffc02009ea:	24c000ef          	jal	ffffffffc0200c36 <ramdisk_init>
ffffffffc02009ee:	00091797          	auipc	a5,0x91
ffffffffc02009f2:	cca7a783          	lw	a5,-822(a5) # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc02009f6:	c385                	beqz	a5,ffffffffc0200a16 <ide_init+0x5a>
ffffffffc02009f8:	00091597          	auipc	a1,0x91
ffffffffc02009fc:	d1058593          	addi	a1,a1,-752 # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc0200a00:	4509                	li	a0,2
ffffffffc0200a02:	234000ef          	jal	ffffffffc0200c36 <ramdisk_init>
ffffffffc0200a06:	00091797          	auipc	a5,0x91
ffffffffc0200a0a:	d027a783          	lw	a5,-766(a5) # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc0200a0e:	c39d                	beqz	a5,ffffffffc0200a34 <ide_init+0x78>
ffffffffc0200a10:	60a2                	ld	ra,8(sp)
ffffffffc0200a12:	0141                	addi	sp,sp,16
ffffffffc0200a14:	8082                	ret
ffffffffc0200a16:	0000b697          	auipc	a3,0xb
ffffffffc0200a1a:	12268693          	addi	a3,a3,290 # ffffffffc020bb38 <etext+0x424>
ffffffffc0200a1e:	0000b617          	auipc	a2,0xb
ffffffffc0200a22:	13260613          	addi	a2,a2,306 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0200a26:	45c5                	li	a1,17
ffffffffc0200a28:	0000b517          	auipc	a0,0xb
ffffffffc0200a2c:	14050513          	addi	a0,a0,320 # ffffffffc020bb68 <etext+0x454>
ffffffffc0200a30:	a1bff0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0200a34:	0000b697          	auipc	a3,0xb
ffffffffc0200a38:	14c68693          	addi	a3,a3,332 # ffffffffc020bb80 <etext+0x46c>
ffffffffc0200a3c:	0000b617          	auipc	a2,0xb
ffffffffc0200a40:	11460613          	addi	a2,a2,276 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0200a44:	45d1                	li	a1,20
ffffffffc0200a46:	0000b517          	auipc	a0,0xb
ffffffffc0200a4a:	12250513          	addi	a0,a0,290 # ffffffffc020bb68 <etext+0x454>
ffffffffc0200a4e:	9fdff0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0200a52 <ide_device_valid>:
ffffffffc0200a52:	478d                	li	a5,3
ffffffffc0200a54:	00a7ef63          	bltu	a5,a0,ffffffffc0200a72 <ide_device_valid+0x20>
ffffffffc0200a58:	00251793          	slli	a5,a0,0x2
ffffffffc0200a5c:	97aa                	add	a5,a5,a0
ffffffffc0200a5e:	00091717          	auipc	a4,0x91
ffffffffc0200a62:	c0a70713          	addi	a4,a4,-1014 # ffffffffc0291668 <ide_devices>
ffffffffc0200a66:	0792                	slli	a5,a5,0x4
ffffffffc0200a68:	97ba                	add	a5,a5,a4
ffffffffc0200a6a:	4388                	lw	a0,0(a5)
ffffffffc0200a6c:	00a03533          	snez	a0,a0
ffffffffc0200a70:	8082                	ret
ffffffffc0200a72:	4501                	li	a0,0
ffffffffc0200a74:	8082                	ret

ffffffffc0200a76 <ide_device_size>:
ffffffffc0200a76:	478d                	li	a5,3
ffffffffc0200a78:	02a7e163          	bltu	a5,a0,ffffffffc0200a9a <ide_device_size+0x24>
ffffffffc0200a7c:	00251793          	slli	a5,a0,0x2
ffffffffc0200a80:	97aa                	add	a5,a5,a0
ffffffffc0200a82:	00091717          	auipc	a4,0x91
ffffffffc0200a86:	be670713          	addi	a4,a4,-1050 # ffffffffc0291668 <ide_devices>
ffffffffc0200a8a:	0792                	slli	a5,a5,0x4
ffffffffc0200a8c:	97ba                	add	a5,a5,a4
ffffffffc0200a8e:	4398                	lw	a4,0(a5)
ffffffffc0200a90:	4501                	li	a0,0
ffffffffc0200a92:	c709                	beqz	a4,ffffffffc0200a9c <ide_device_size+0x26>
ffffffffc0200a94:	0087e503          	lwu	a0,8(a5)
ffffffffc0200a98:	8082                	ret
ffffffffc0200a9a:	4501                	li	a0,0
ffffffffc0200a9c:	8082                	ret

ffffffffc0200a9e <ide_read_secs>:
ffffffffc0200a9e:	1141                	addi	sp,sp,-16
ffffffffc0200aa0:	e406                	sd	ra,8(sp)
ffffffffc0200aa2:	0816b793          	sltiu	a5,a3,129
ffffffffc0200aa6:	cba9                	beqz	a5,ffffffffc0200af8 <ide_read_secs+0x5a>
ffffffffc0200aa8:	478d                	li	a5,3
ffffffffc0200aaa:	0005081b          	sext.w	a6,a0
ffffffffc0200aae:	04a7e563          	bltu	a5,a0,ffffffffc0200af8 <ide_read_secs+0x5a>
ffffffffc0200ab2:	00281793          	slli	a5,a6,0x2
ffffffffc0200ab6:	97c2                	add	a5,a5,a6
ffffffffc0200ab8:	0792                	slli	a5,a5,0x4
ffffffffc0200aba:	00091817          	auipc	a6,0x91
ffffffffc0200abe:	bae80813          	addi	a6,a6,-1106 # ffffffffc0291668 <ide_devices>
ffffffffc0200ac2:	97c2                	add	a5,a5,a6
ffffffffc0200ac4:	0007a883          	lw	a7,0(a5)
ffffffffc0200ac8:	02088863          	beqz	a7,ffffffffc0200af8 <ide_read_secs+0x5a>
ffffffffc0200acc:	100008b7          	lui	a7,0x10000
ffffffffc0200ad0:	0515f463          	bgeu	a1,a7,ffffffffc0200b18 <ide_read_secs+0x7a>
ffffffffc0200ad4:	1582                	slli	a1,a1,0x20
ffffffffc0200ad6:	9181                	srli	a1,a1,0x20
ffffffffc0200ad8:	00d58733          	add	a4,a1,a3
ffffffffc0200adc:	02e8ee63          	bltu	a7,a4,ffffffffc0200b18 <ide_read_secs+0x7a>
ffffffffc0200ae0:	00251713          	slli	a4,a0,0x2
ffffffffc0200ae4:	0407b883          	ld	a7,64(a5)
ffffffffc0200ae8:	60a2                	ld	ra,8(sp)
ffffffffc0200aea:	00a707b3          	add	a5,a4,a0
ffffffffc0200aee:	0792                	slli	a5,a5,0x4
ffffffffc0200af0:	00f80533          	add	a0,a6,a5
ffffffffc0200af4:	0141                	addi	sp,sp,16
ffffffffc0200af6:	8882                	jr	a7
ffffffffc0200af8:	0000b697          	auipc	a3,0xb
ffffffffc0200afc:	0a068693          	addi	a3,a3,160 # ffffffffc020bb98 <etext+0x484>
ffffffffc0200b00:	0000b617          	auipc	a2,0xb
ffffffffc0200b04:	05060613          	addi	a2,a2,80 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0200b08:	02200593          	li	a1,34
ffffffffc0200b0c:	0000b517          	auipc	a0,0xb
ffffffffc0200b10:	05c50513          	addi	a0,a0,92 # ffffffffc020bb68 <etext+0x454>
ffffffffc0200b14:	937ff0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0200b18:	0000b697          	auipc	a3,0xb
ffffffffc0200b1c:	0a868693          	addi	a3,a3,168 # ffffffffc020bbc0 <etext+0x4ac>
ffffffffc0200b20:	0000b617          	auipc	a2,0xb
ffffffffc0200b24:	03060613          	addi	a2,a2,48 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0200b28:	02300593          	li	a1,35
ffffffffc0200b2c:	0000b517          	auipc	a0,0xb
ffffffffc0200b30:	03c50513          	addi	a0,a0,60 # ffffffffc020bb68 <etext+0x454>
ffffffffc0200b34:	917ff0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0200b38 <ide_write_secs>:
ffffffffc0200b38:	1141                	addi	sp,sp,-16
ffffffffc0200b3a:	e406                	sd	ra,8(sp)
ffffffffc0200b3c:	0816b793          	sltiu	a5,a3,129
ffffffffc0200b40:	cba9                	beqz	a5,ffffffffc0200b92 <ide_write_secs+0x5a>
ffffffffc0200b42:	478d                	li	a5,3
ffffffffc0200b44:	0005081b          	sext.w	a6,a0
ffffffffc0200b48:	04a7e563          	bltu	a5,a0,ffffffffc0200b92 <ide_write_secs+0x5a>
ffffffffc0200b4c:	00281793          	slli	a5,a6,0x2
ffffffffc0200b50:	97c2                	add	a5,a5,a6
ffffffffc0200b52:	0792                	slli	a5,a5,0x4
ffffffffc0200b54:	00091817          	auipc	a6,0x91
ffffffffc0200b58:	b1480813          	addi	a6,a6,-1260 # ffffffffc0291668 <ide_devices>
ffffffffc0200b5c:	97c2                	add	a5,a5,a6
ffffffffc0200b5e:	0007a883          	lw	a7,0(a5)
ffffffffc0200b62:	02088863          	beqz	a7,ffffffffc0200b92 <ide_write_secs+0x5a>
ffffffffc0200b66:	100008b7          	lui	a7,0x10000
ffffffffc0200b6a:	0515f463          	bgeu	a1,a7,ffffffffc0200bb2 <ide_write_secs+0x7a>
ffffffffc0200b6e:	1582                	slli	a1,a1,0x20
ffffffffc0200b70:	9181                	srli	a1,a1,0x20
ffffffffc0200b72:	00d58733          	add	a4,a1,a3
ffffffffc0200b76:	02e8ee63          	bltu	a7,a4,ffffffffc0200bb2 <ide_write_secs+0x7a>
ffffffffc0200b7a:	00251713          	slli	a4,a0,0x2
ffffffffc0200b7e:	0487b883          	ld	a7,72(a5)
ffffffffc0200b82:	60a2                	ld	ra,8(sp)
ffffffffc0200b84:	00a707b3          	add	a5,a4,a0
ffffffffc0200b88:	0792                	slli	a5,a5,0x4
ffffffffc0200b8a:	00f80533          	add	a0,a6,a5
ffffffffc0200b8e:	0141                	addi	sp,sp,16
ffffffffc0200b90:	8882                	jr	a7
ffffffffc0200b92:	0000b697          	auipc	a3,0xb
ffffffffc0200b96:	00668693          	addi	a3,a3,6 # ffffffffc020bb98 <etext+0x484>
ffffffffc0200b9a:	0000b617          	auipc	a2,0xb
ffffffffc0200b9e:	fb660613          	addi	a2,a2,-74 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0200ba2:	02900593          	li	a1,41
ffffffffc0200ba6:	0000b517          	auipc	a0,0xb
ffffffffc0200baa:	fc250513          	addi	a0,a0,-62 # ffffffffc020bb68 <etext+0x454>
ffffffffc0200bae:	89dff0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0200bb2:	0000b697          	auipc	a3,0xb
ffffffffc0200bb6:	00e68693          	addi	a3,a3,14 # ffffffffc020bbc0 <etext+0x4ac>
ffffffffc0200bba:	0000b617          	auipc	a2,0xb
ffffffffc0200bbe:	f9660613          	addi	a2,a2,-106 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0200bc2:	02a00593          	li	a1,42
ffffffffc0200bc6:	0000b517          	auipc	a0,0xb
ffffffffc0200bca:	fa250513          	addi	a0,a0,-94 # ffffffffc020bb68 <etext+0x454>
ffffffffc0200bce:	87dff0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0200bd2 <intr_enable>:
ffffffffc0200bd2:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc0200bd6:	8082                	ret

ffffffffc0200bd8 <intr_disable>:
ffffffffc0200bd8:	100177f3          	csrrci	a5,sstatus,2
ffffffffc0200bdc:	8082                	ret

ffffffffc0200bde <pic_init>:
ffffffffc0200bde:	8082                	ret

ffffffffc0200be0 <ramdisk_write>:
ffffffffc0200be0:	00856783          	lwu	a5,8(a0)
ffffffffc0200be4:	1141                	addi	sp,sp,-16
ffffffffc0200be6:	e406                	sd	ra,8(sp)
ffffffffc0200be8:	8f8d                	sub	a5,a5,a1
ffffffffc0200bea:	8732                	mv	a4,a2
ffffffffc0200bec:	00f6f363          	bgeu	a3,a5,ffffffffc0200bf2 <ramdisk_write+0x12>
ffffffffc0200bf0:	87b6                	mv	a5,a3
ffffffffc0200bf2:	6914                	ld	a3,16(a0)
ffffffffc0200bf4:	00959513          	slli	a0,a1,0x9
ffffffffc0200bf8:	00979613          	slli	a2,a5,0x9
ffffffffc0200bfc:	9536                	add	a0,a0,a3
ffffffffc0200bfe:	85ba                	mv	a1,a4
ffffffffc0200c00:	2fd0a0ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc0200c04:	60a2                	ld	ra,8(sp)
ffffffffc0200c06:	4501                	li	a0,0
ffffffffc0200c08:	0141                	addi	sp,sp,16
ffffffffc0200c0a:	8082                	ret

ffffffffc0200c0c <ramdisk_read>:
ffffffffc0200c0c:	00856783          	lwu	a5,8(a0)
ffffffffc0200c10:	1141                	addi	sp,sp,-16
ffffffffc0200c12:	e406                	sd	ra,8(sp)
ffffffffc0200c14:	8f8d                	sub	a5,a5,a1
ffffffffc0200c16:	872a                	mv	a4,a0
ffffffffc0200c18:	8532                	mv	a0,a2
ffffffffc0200c1a:	00f6f363          	bgeu	a3,a5,ffffffffc0200c20 <ramdisk_read+0x14>
ffffffffc0200c1e:	87b6                	mv	a5,a3
ffffffffc0200c20:	6b18                	ld	a4,16(a4)
ffffffffc0200c22:	05a6                	slli	a1,a1,0x9
ffffffffc0200c24:	00979613          	slli	a2,a5,0x9
ffffffffc0200c28:	95ba                	add	a1,a1,a4
ffffffffc0200c2a:	2d30a0ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc0200c2e:	60a2                	ld	ra,8(sp)
ffffffffc0200c30:	4501                	li	a0,0
ffffffffc0200c32:	0141                	addi	sp,sp,16
ffffffffc0200c34:	8082                	ret

ffffffffc0200c36 <ramdisk_init>:
ffffffffc0200c36:	7179                	addi	sp,sp,-48
ffffffffc0200c38:	f022                	sd	s0,32(sp)
ffffffffc0200c3a:	ec26                	sd	s1,24(sp)
ffffffffc0200c3c:	842e                	mv	s0,a1
ffffffffc0200c3e:	84aa                	mv	s1,a0
ffffffffc0200c40:	05000613          	li	a2,80
ffffffffc0200c44:	852e                	mv	a0,a1
ffffffffc0200c46:	4581                	li	a1,0
ffffffffc0200c48:	f406                	sd	ra,40(sp)
ffffffffc0200c4a:	2630a0ef          	jal	ffffffffc020b6ac <memset>
ffffffffc0200c4e:	4785                	li	a5,1
ffffffffc0200c50:	06f48a63          	beq	s1,a5,ffffffffc0200cc4 <ramdisk_init+0x8e>
ffffffffc0200c54:	4789                	li	a5,2
ffffffffc0200c56:	00090617          	auipc	a2,0x90
ffffffffc0200c5a:	3ba60613          	addi	a2,a2,954 # ffffffffc0291010 <arena>
ffffffffc0200c5e:	0001b597          	auipc	a1,0x1b
ffffffffc0200c62:	0b258593          	addi	a1,a1,178 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200c66:	08f49363          	bne	s1,a5,ffffffffc0200cec <ramdisk_init+0xb6>
ffffffffc0200c6a:	06c58763          	beq	a1,a2,ffffffffc0200cd8 <ramdisk_init+0xa2>
ffffffffc0200c6e:	40b604b3          	sub	s1,a2,a1
ffffffffc0200c72:	86a6                	mv	a3,s1
ffffffffc0200c74:	167d                	addi	a2,a2,-1
ffffffffc0200c76:	0000b517          	auipc	a0,0xb
ffffffffc0200c7a:	fa250513          	addi	a0,a0,-94 # ffffffffc020bc18 <etext+0x504>
ffffffffc0200c7e:	e42e                	sd	a1,8(sp)
ffffffffc0200c80:	d26ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200c84:	65a2                	ld	a1,8(sp)
ffffffffc0200c86:	57fd                	li	a5,-1
ffffffffc0200c88:	1782                	slli	a5,a5,0x20
ffffffffc0200c8a:	0094d69b          	srliw	a3,s1,0x9
ffffffffc0200c8e:	0785                	addi	a5,a5,1
ffffffffc0200c90:	e80c                	sd	a1,16(s0)
ffffffffc0200c92:	e01c                	sd	a5,0(s0)
ffffffffc0200c94:	c414                	sw	a3,8(s0)
ffffffffc0200c96:	02040513          	addi	a0,s0,32
ffffffffc0200c9a:	0000b597          	auipc	a1,0xb
ffffffffc0200c9e:	fd658593          	addi	a1,a1,-42 # ffffffffc020bc70 <etext+0x55c>
ffffffffc0200ca2:	18b0a0ef          	jal	ffffffffc020b62c <strcpy>
ffffffffc0200ca6:	00000717          	auipc	a4,0x0
ffffffffc0200caa:	f6670713          	addi	a4,a4,-154 # ffffffffc0200c0c <ramdisk_read>
ffffffffc0200cae:	00000797          	auipc	a5,0x0
ffffffffc0200cb2:	f3278793          	addi	a5,a5,-206 # ffffffffc0200be0 <ramdisk_write>
ffffffffc0200cb6:	70a2                	ld	ra,40(sp)
ffffffffc0200cb8:	e038                	sd	a4,64(s0)
ffffffffc0200cba:	e43c                	sd	a5,72(s0)
ffffffffc0200cbc:	7402                	ld	s0,32(sp)
ffffffffc0200cbe:	64e2                	ld	s1,24(sp)
ffffffffc0200cc0:	6145                	addi	sp,sp,48
ffffffffc0200cc2:	8082                	ret
ffffffffc0200cc4:	0001b617          	auipc	a2,0x1b
ffffffffc0200cc8:	04c60613          	addi	a2,a2,76 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200ccc:	00013597          	auipc	a1,0x13
ffffffffc0200cd0:	34458593          	addi	a1,a1,836 # ffffffffc0214010 <_binary_bin_swap_img_start>
ffffffffc0200cd4:	f8c59de3          	bne	a1,a2,ffffffffc0200c6e <ramdisk_init+0x38>
ffffffffc0200cd8:	7402                	ld	s0,32(sp)
ffffffffc0200cda:	70a2                	ld	ra,40(sp)
ffffffffc0200cdc:	64e2                	ld	s1,24(sp)
ffffffffc0200cde:	0000b517          	auipc	a0,0xb
ffffffffc0200ce2:	f2250513          	addi	a0,a0,-222 # ffffffffc020bc00 <etext+0x4ec>
ffffffffc0200ce6:	6145                	addi	sp,sp,48
ffffffffc0200ce8:	cbeff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200cec:	0000b617          	auipc	a2,0xb
ffffffffc0200cf0:	f5460613          	addi	a2,a2,-172 # ffffffffc020bc40 <etext+0x52c>
ffffffffc0200cf4:	03200593          	li	a1,50
ffffffffc0200cf8:	0000b517          	auipc	a0,0xb
ffffffffc0200cfc:	f6050513          	addi	a0,a0,-160 # ffffffffc020bc58 <etext+0x544>
ffffffffc0200d00:	f4aff0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0200d04 <idt_init>:
ffffffffc0200d04:	14005073          	csrwi	sscratch,0
ffffffffc0200d08:	00000797          	auipc	a5,0x0
ffffffffc0200d0c:	47c78793          	addi	a5,a5,1148 # ffffffffc0201184 <__alltraps>
ffffffffc0200d10:	10579073          	csrw	stvec,a5
ffffffffc0200d14:	000407b7          	lui	a5,0x40
ffffffffc0200d18:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200d1c:	8082                	ret

ffffffffc0200d1e <print_regs>:
ffffffffc0200d1e:	610c                	ld	a1,0(a0)
ffffffffc0200d20:	1141                	addi	sp,sp,-16
ffffffffc0200d22:	e022                	sd	s0,0(sp)
ffffffffc0200d24:	842a                	mv	s0,a0
ffffffffc0200d26:	0000b517          	auipc	a0,0xb
ffffffffc0200d2a:	f5a50513          	addi	a0,a0,-166 # ffffffffc020bc80 <etext+0x56c>
ffffffffc0200d2e:	e406                	sd	ra,8(sp)
ffffffffc0200d30:	c76ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d34:	640c                	ld	a1,8(s0)
ffffffffc0200d36:	0000b517          	auipc	a0,0xb
ffffffffc0200d3a:	f6250513          	addi	a0,a0,-158 # ffffffffc020bc98 <etext+0x584>
ffffffffc0200d3e:	c68ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d42:	680c                	ld	a1,16(s0)
ffffffffc0200d44:	0000b517          	auipc	a0,0xb
ffffffffc0200d48:	f6c50513          	addi	a0,a0,-148 # ffffffffc020bcb0 <etext+0x59c>
ffffffffc0200d4c:	c5aff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d50:	6c0c                	ld	a1,24(s0)
ffffffffc0200d52:	0000b517          	auipc	a0,0xb
ffffffffc0200d56:	f7650513          	addi	a0,a0,-138 # ffffffffc020bcc8 <etext+0x5b4>
ffffffffc0200d5a:	c4cff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d5e:	700c                	ld	a1,32(s0)
ffffffffc0200d60:	0000b517          	auipc	a0,0xb
ffffffffc0200d64:	f8050513          	addi	a0,a0,-128 # ffffffffc020bce0 <etext+0x5cc>
ffffffffc0200d68:	c3eff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d6c:	740c                	ld	a1,40(s0)
ffffffffc0200d6e:	0000b517          	auipc	a0,0xb
ffffffffc0200d72:	f8a50513          	addi	a0,a0,-118 # ffffffffc020bcf8 <etext+0x5e4>
ffffffffc0200d76:	c30ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d7a:	780c                	ld	a1,48(s0)
ffffffffc0200d7c:	0000b517          	auipc	a0,0xb
ffffffffc0200d80:	f9450513          	addi	a0,a0,-108 # ffffffffc020bd10 <etext+0x5fc>
ffffffffc0200d84:	c22ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d88:	7c0c                	ld	a1,56(s0)
ffffffffc0200d8a:	0000b517          	auipc	a0,0xb
ffffffffc0200d8e:	f9e50513          	addi	a0,a0,-98 # ffffffffc020bd28 <etext+0x614>
ffffffffc0200d92:	c14ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d96:	602c                	ld	a1,64(s0)
ffffffffc0200d98:	0000b517          	auipc	a0,0xb
ffffffffc0200d9c:	fa850513          	addi	a0,a0,-88 # ffffffffc020bd40 <etext+0x62c>
ffffffffc0200da0:	c06ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200da4:	642c                	ld	a1,72(s0)
ffffffffc0200da6:	0000b517          	auipc	a0,0xb
ffffffffc0200daa:	fb250513          	addi	a0,a0,-78 # ffffffffc020bd58 <etext+0x644>
ffffffffc0200dae:	bf8ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200db2:	682c                	ld	a1,80(s0)
ffffffffc0200db4:	0000b517          	auipc	a0,0xb
ffffffffc0200db8:	fbc50513          	addi	a0,a0,-68 # ffffffffc020bd70 <etext+0x65c>
ffffffffc0200dbc:	beaff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200dc0:	6c2c                	ld	a1,88(s0)
ffffffffc0200dc2:	0000b517          	auipc	a0,0xb
ffffffffc0200dc6:	fc650513          	addi	a0,a0,-58 # ffffffffc020bd88 <etext+0x674>
ffffffffc0200dca:	bdcff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200dce:	702c                	ld	a1,96(s0)
ffffffffc0200dd0:	0000b517          	auipc	a0,0xb
ffffffffc0200dd4:	fd050513          	addi	a0,a0,-48 # ffffffffc020bda0 <etext+0x68c>
ffffffffc0200dd8:	bceff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200ddc:	742c                	ld	a1,104(s0)
ffffffffc0200dde:	0000b517          	auipc	a0,0xb
ffffffffc0200de2:	fda50513          	addi	a0,a0,-38 # ffffffffc020bdb8 <etext+0x6a4>
ffffffffc0200de6:	bc0ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200dea:	782c                	ld	a1,112(s0)
ffffffffc0200dec:	0000b517          	auipc	a0,0xb
ffffffffc0200df0:	fe450513          	addi	a0,a0,-28 # ffffffffc020bdd0 <etext+0x6bc>
ffffffffc0200df4:	bb2ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200df8:	7c2c                	ld	a1,120(s0)
ffffffffc0200dfa:	0000b517          	auipc	a0,0xb
ffffffffc0200dfe:	fee50513          	addi	a0,a0,-18 # ffffffffc020bde8 <etext+0x6d4>
ffffffffc0200e02:	ba4ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e06:	604c                	ld	a1,128(s0)
ffffffffc0200e08:	0000b517          	auipc	a0,0xb
ffffffffc0200e0c:	ff850513          	addi	a0,a0,-8 # ffffffffc020be00 <etext+0x6ec>
ffffffffc0200e10:	b96ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e14:	644c                	ld	a1,136(s0)
ffffffffc0200e16:	0000b517          	auipc	a0,0xb
ffffffffc0200e1a:	00250513          	addi	a0,a0,2 # ffffffffc020be18 <etext+0x704>
ffffffffc0200e1e:	b88ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e22:	684c                	ld	a1,144(s0)
ffffffffc0200e24:	0000b517          	auipc	a0,0xb
ffffffffc0200e28:	00c50513          	addi	a0,a0,12 # ffffffffc020be30 <etext+0x71c>
ffffffffc0200e2c:	b7aff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e30:	6c4c                	ld	a1,152(s0)
ffffffffc0200e32:	0000b517          	auipc	a0,0xb
ffffffffc0200e36:	01650513          	addi	a0,a0,22 # ffffffffc020be48 <etext+0x734>
ffffffffc0200e3a:	b6cff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e3e:	704c                	ld	a1,160(s0)
ffffffffc0200e40:	0000b517          	auipc	a0,0xb
ffffffffc0200e44:	02050513          	addi	a0,a0,32 # ffffffffc020be60 <etext+0x74c>
ffffffffc0200e48:	b5eff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e4c:	744c                	ld	a1,168(s0)
ffffffffc0200e4e:	0000b517          	auipc	a0,0xb
ffffffffc0200e52:	02a50513          	addi	a0,a0,42 # ffffffffc020be78 <etext+0x764>
ffffffffc0200e56:	b50ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e5a:	784c                	ld	a1,176(s0)
ffffffffc0200e5c:	0000b517          	auipc	a0,0xb
ffffffffc0200e60:	03450513          	addi	a0,a0,52 # ffffffffc020be90 <etext+0x77c>
ffffffffc0200e64:	b42ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e68:	7c4c                	ld	a1,184(s0)
ffffffffc0200e6a:	0000b517          	auipc	a0,0xb
ffffffffc0200e6e:	03e50513          	addi	a0,a0,62 # ffffffffc020bea8 <etext+0x794>
ffffffffc0200e72:	b34ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e76:	606c                	ld	a1,192(s0)
ffffffffc0200e78:	0000b517          	auipc	a0,0xb
ffffffffc0200e7c:	04850513          	addi	a0,a0,72 # ffffffffc020bec0 <etext+0x7ac>
ffffffffc0200e80:	b26ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e84:	646c                	ld	a1,200(s0)
ffffffffc0200e86:	0000b517          	auipc	a0,0xb
ffffffffc0200e8a:	05250513          	addi	a0,a0,82 # ffffffffc020bed8 <etext+0x7c4>
ffffffffc0200e8e:	b18ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e92:	686c                	ld	a1,208(s0)
ffffffffc0200e94:	0000b517          	auipc	a0,0xb
ffffffffc0200e98:	05c50513          	addi	a0,a0,92 # ffffffffc020bef0 <etext+0x7dc>
ffffffffc0200e9c:	b0aff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200ea0:	6c6c                	ld	a1,216(s0)
ffffffffc0200ea2:	0000b517          	auipc	a0,0xb
ffffffffc0200ea6:	06650513          	addi	a0,a0,102 # ffffffffc020bf08 <etext+0x7f4>
ffffffffc0200eaa:	afcff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200eae:	706c                	ld	a1,224(s0)
ffffffffc0200eb0:	0000b517          	auipc	a0,0xb
ffffffffc0200eb4:	07050513          	addi	a0,a0,112 # ffffffffc020bf20 <etext+0x80c>
ffffffffc0200eb8:	aeeff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200ebc:	746c                	ld	a1,232(s0)
ffffffffc0200ebe:	0000b517          	auipc	a0,0xb
ffffffffc0200ec2:	07a50513          	addi	a0,a0,122 # ffffffffc020bf38 <etext+0x824>
ffffffffc0200ec6:	ae0ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200eca:	786c                	ld	a1,240(s0)
ffffffffc0200ecc:	0000b517          	auipc	a0,0xb
ffffffffc0200ed0:	08450513          	addi	a0,a0,132 # ffffffffc020bf50 <etext+0x83c>
ffffffffc0200ed4:	ad2ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200ed8:	7c6c                	ld	a1,248(s0)
ffffffffc0200eda:	6402                	ld	s0,0(sp)
ffffffffc0200edc:	60a2                	ld	ra,8(sp)
ffffffffc0200ede:	0000b517          	auipc	a0,0xb
ffffffffc0200ee2:	08a50513          	addi	a0,a0,138 # ffffffffc020bf68 <etext+0x854>
ffffffffc0200ee6:	0141                	addi	sp,sp,16
ffffffffc0200ee8:	abeff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200eec <print_trapframe>:
ffffffffc0200eec:	1141                	addi	sp,sp,-16
ffffffffc0200eee:	e022                	sd	s0,0(sp)
ffffffffc0200ef0:	85aa                	mv	a1,a0
ffffffffc0200ef2:	842a                	mv	s0,a0
ffffffffc0200ef4:	0000b517          	auipc	a0,0xb
ffffffffc0200ef8:	08c50513          	addi	a0,a0,140 # ffffffffc020bf80 <etext+0x86c>
ffffffffc0200efc:	e406                	sd	ra,8(sp)
ffffffffc0200efe:	aa8ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200f02:	8522                	mv	a0,s0
ffffffffc0200f04:	e1bff0ef          	jal	ffffffffc0200d1e <print_regs>
ffffffffc0200f08:	10043583          	ld	a1,256(s0)
ffffffffc0200f0c:	0000b517          	auipc	a0,0xb
ffffffffc0200f10:	08c50513          	addi	a0,a0,140 # ffffffffc020bf98 <etext+0x884>
ffffffffc0200f14:	a92ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200f18:	10843583          	ld	a1,264(s0)
ffffffffc0200f1c:	0000b517          	auipc	a0,0xb
ffffffffc0200f20:	09450513          	addi	a0,a0,148 # ffffffffc020bfb0 <etext+0x89c>
ffffffffc0200f24:	a82ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200f28:	11043583          	ld	a1,272(s0)
ffffffffc0200f2c:	0000b517          	auipc	a0,0xb
ffffffffc0200f30:	09c50513          	addi	a0,a0,156 # ffffffffc020bfc8 <etext+0x8b4>
ffffffffc0200f34:	a72ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200f38:	11843583          	ld	a1,280(s0)
ffffffffc0200f3c:	6402                	ld	s0,0(sp)
ffffffffc0200f3e:	60a2                	ld	ra,8(sp)
ffffffffc0200f40:	0000b517          	auipc	a0,0xb
ffffffffc0200f44:	09850513          	addi	a0,a0,152 # ffffffffc020bfd8 <etext+0x8c4>
ffffffffc0200f48:	0141                	addi	sp,sp,16
ffffffffc0200f4a:	a5cff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200f4e <interrupt_handler>:
ffffffffc0200f4e:	11853783          	ld	a5,280(a0)
ffffffffc0200f52:	472d                	li	a4,11
ffffffffc0200f54:	0786                	slli	a5,a5,0x1
ffffffffc0200f56:	8385                	srli	a5,a5,0x1
ffffffffc0200f58:	08f76063          	bltu	a4,a5,ffffffffc0200fd8 <interrupt_handler+0x8a>
ffffffffc0200f5c:	0000e717          	auipc	a4,0xe
ffffffffc0200f60:	cfc70713          	addi	a4,a4,-772 # ffffffffc020ec58 <commands+0x48>
ffffffffc0200f64:	078a                	slli	a5,a5,0x2
ffffffffc0200f66:	97ba                	add	a5,a5,a4
ffffffffc0200f68:	439c                	lw	a5,0(a5)
ffffffffc0200f6a:	97ba                	add	a5,a5,a4
ffffffffc0200f6c:	8782                	jr	a5
ffffffffc0200f6e:	0000b517          	auipc	a0,0xb
ffffffffc0200f72:	0e250513          	addi	a0,a0,226 # ffffffffc020c050 <etext+0x93c>
ffffffffc0200f76:	a30ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200f7a:	0000b517          	auipc	a0,0xb
ffffffffc0200f7e:	0b650513          	addi	a0,a0,182 # ffffffffc020c030 <etext+0x91c>
ffffffffc0200f82:	a24ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200f86:	0000b517          	auipc	a0,0xb
ffffffffc0200f8a:	06a50513          	addi	a0,a0,106 # ffffffffc020bff0 <etext+0x8dc>
ffffffffc0200f8e:	a18ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200f92:	0000b517          	auipc	a0,0xb
ffffffffc0200f96:	07e50513          	addi	a0,a0,126 # ffffffffc020c010 <etext+0x8fc>
ffffffffc0200f9a:	a0cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200f9e:	1141                	addi	sp,sp,-16
ffffffffc0200fa0:	e406                	sd	ra,8(sp)
ffffffffc0200fa2:	d86ff0ef          	jal	ffffffffc0200528 <clock_set_next_event>
ffffffffc0200fa6:	00096797          	auipc	a5,0x96
ffffffffc0200faa:	8ca7b783          	ld	a5,-1846(a5) # ffffffffc0296870 <ticks>
ffffffffc0200fae:	0785                	addi	a5,a5,1
ffffffffc0200fb0:	00096717          	auipc	a4,0x96
ffffffffc0200fb4:	8cf73023          	sd	a5,-1856(a4) # ffffffffc0296870 <ticks>
ffffffffc0200fb8:	644060ef          	jal	ffffffffc02075fc <run_timer_list>
ffffffffc0200fbc:	dfaff0ef          	jal	ffffffffc02005b6 <cons_getc>
ffffffffc0200fc0:	60a2                	ld	ra,8(sp)
ffffffffc0200fc2:	0ff57513          	zext.b	a0,a0
ffffffffc0200fc6:	0141                	addi	sp,sp,16
ffffffffc0200fc8:	55b0706f          	j	ffffffffc0208d22 <dev_stdin_write>
ffffffffc0200fcc:	0000b517          	auipc	a0,0xb
ffffffffc0200fd0:	0a450513          	addi	a0,a0,164 # ffffffffc020c070 <etext+0x95c>
ffffffffc0200fd4:	9d2ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200fd8:	bf11                	j	ffffffffc0200eec <print_trapframe>

ffffffffc0200fda <exception_handler>:
ffffffffc0200fda:	11853783          	ld	a5,280(a0)
ffffffffc0200fde:	473d                	li	a4,15
ffffffffc0200fe0:	10f76e63          	bltu	a4,a5,ffffffffc02010fc <exception_handler+0x122>
ffffffffc0200fe4:	0000e717          	auipc	a4,0xe
ffffffffc0200fe8:	ca470713          	addi	a4,a4,-860 # ffffffffc020ec88 <commands+0x78>
ffffffffc0200fec:	078a                	slli	a5,a5,0x2
ffffffffc0200fee:	97ba                	add	a5,a5,a4
ffffffffc0200ff0:	439c                	lw	a5,0(a5)
ffffffffc0200ff2:	1101                	addi	sp,sp,-32
ffffffffc0200ff4:	ec06                	sd	ra,24(sp)
ffffffffc0200ff6:	97ba                	add	a5,a5,a4
ffffffffc0200ff8:	86aa                	mv	a3,a0
ffffffffc0200ffa:	8782                	jr	a5
ffffffffc0200ffc:	e42a                	sd	a0,8(sp)
ffffffffc0200ffe:	0000b517          	auipc	a0,0xb
ffffffffc0201002:	17a50513          	addi	a0,a0,378 # ffffffffc020c178 <etext+0xa64>
ffffffffc0201006:	9a0ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020100a:	66a2                	ld	a3,8(sp)
ffffffffc020100c:	1086b783          	ld	a5,264(a3)
ffffffffc0201010:	60e2                	ld	ra,24(sp)
ffffffffc0201012:	0791                	addi	a5,a5,4
ffffffffc0201014:	10f6b423          	sd	a5,264(a3)
ffffffffc0201018:	6105                	addi	sp,sp,32
ffffffffc020101a:	0330606f          	j	ffffffffc020784c <syscall>
ffffffffc020101e:	60e2                	ld	ra,24(sp)
ffffffffc0201020:	0000b517          	auipc	a0,0xb
ffffffffc0201024:	17850513          	addi	a0,a0,376 # ffffffffc020c198 <etext+0xa84>
ffffffffc0201028:	6105                	addi	sp,sp,32
ffffffffc020102a:	97cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020102e:	60e2                	ld	ra,24(sp)
ffffffffc0201030:	0000b517          	auipc	a0,0xb
ffffffffc0201034:	18850513          	addi	a0,a0,392 # ffffffffc020c1b8 <etext+0xaa4>
ffffffffc0201038:	6105                	addi	sp,sp,32
ffffffffc020103a:	96cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020103e:	60e2                	ld	ra,24(sp)
ffffffffc0201040:	0000b517          	auipc	a0,0xb
ffffffffc0201044:	19850513          	addi	a0,a0,408 # ffffffffc020c1d8 <etext+0xac4>
ffffffffc0201048:	6105                	addi	sp,sp,32
ffffffffc020104a:	95cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020104e:	60e2                	ld	ra,24(sp)
ffffffffc0201050:	0000b517          	auipc	a0,0xb
ffffffffc0201054:	1a050513          	addi	a0,a0,416 # ffffffffc020c1f0 <etext+0xadc>
ffffffffc0201058:	6105                	addi	sp,sp,32
ffffffffc020105a:	94cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020105e:	60e2                	ld	ra,24(sp)
ffffffffc0201060:	0000b517          	auipc	a0,0xb
ffffffffc0201064:	1a850513          	addi	a0,a0,424 # ffffffffc020c208 <etext+0xaf4>
ffffffffc0201068:	6105                	addi	sp,sp,32
ffffffffc020106a:	93cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020106e:	60e2                	ld	ra,24(sp)
ffffffffc0201070:	0000b517          	auipc	a0,0xb
ffffffffc0201074:	02050513          	addi	a0,a0,32 # ffffffffc020c090 <etext+0x97c>
ffffffffc0201078:	6105                	addi	sp,sp,32
ffffffffc020107a:	92cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020107e:	60e2                	ld	ra,24(sp)
ffffffffc0201080:	0000b517          	auipc	a0,0xb
ffffffffc0201084:	03050513          	addi	a0,a0,48 # ffffffffc020c0b0 <etext+0x99c>
ffffffffc0201088:	6105                	addi	sp,sp,32
ffffffffc020108a:	91cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020108e:	60e2                	ld	ra,24(sp)
ffffffffc0201090:	0000b517          	auipc	a0,0xb
ffffffffc0201094:	04050513          	addi	a0,a0,64 # ffffffffc020c0d0 <etext+0x9bc>
ffffffffc0201098:	6105                	addi	sp,sp,32
ffffffffc020109a:	90cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020109e:	60e2                	ld	ra,24(sp)
ffffffffc02010a0:	0000b517          	auipc	a0,0xb
ffffffffc02010a4:	04850513          	addi	a0,a0,72 # ffffffffc020c0e8 <etext+0x9d4>
ffffffffc02010a8:	6105                	addi	sp,sp,32
ffffffffc02010aa:	8fcff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010ae:	60e2                	ld	ra,24(sp)
ffffffffc02010b0:	0000b517          	auipc	a0,0xb
ffffffffc02010b4:	04850513          	addi	a0,a0,72 # ffffffffc020c0f8 <etext+0x9e4>
ffffffffc02010b8:	6105                	addi	sp,sp,32
ffffffffc02010ba:	8ecff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010be:	60e2                	ld	ra,24(sp)
ffffffffc02010c0:	0000b517          	auipc	a0,0xb
ffffffffc02010c4:	05850513          	addi	a0,a0,88 # ffffffffc020c118 <etext+0xa04>
ffffffffc02010c8:	6105                	addi	sp,sp,32
ffffffffc02010ca:	8dcff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010ce:	60e2                	ld	ra,24(sp)
ffffffffc02010d0:	0000b517          	auipc	a0,0xb
ffffffffc02010d4:	09050513          	addi	a0,a0,144 # ffffffffc020c160 <etext+0xa4c>
ffffffffc02010d8:	6105                	addi	sp,sp,32
ffffffffc02010da:	8ccff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010de:	60e2                	ld	ra,24(sp)
ffffffffc02010e0:	6105                	addi	sp,sp,32
ffffffffc02010e2:	b529                	j	ffffffffc0200eec <print_trapframe>
ffffffffc02010e4:	0000b617          	auipc	a2,0xb
ffffffffc02010e8:	04c60613          	addi	a2,a2,76 # ffffffffc020c130 <etext+0xa1c>
ffffffffc02010ec:	0b200593          	li	a1,178
ffffffffc02010f0:	0000b517          	auipc	a0,0xb
ffffffffc02010f4:	05850513          	addi	a0,a0,88 # ffffffffc020c148 <etext+0xa34>
ffffffffc02010f8:	b52ff0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02010fc:	bbc5                	j	ffffffffc0200eec <print_trapframe>

ffffffffc02010fe <trap>:
ffffffffc02010fe:	00095717          	auipc	a4,0x95
ffffffffc0201102:	7ca73703          	ld	a4,1994(a4) # ffffffffc02968c8 <current>
ffffffffc0201106:	11853583          	ld	a1,280(a0)
ffffffffc020110a:	cf21                	beqz	a4,ffffffffc0201162 <trap+0x64>
ffffffffc020110c:	10053603          	ld	a2,256(a0)
ffffffffc0201110:	0a073803          	ld	a6,160(a4)
ffffffffc0201114:	1101                	addi	sp,sp,-32
ffffffffc0201116:	ec06                	sd	ra,24(sp)
ffffffffc0201118:	10067613          	andi	a2,a2,256
ffffffffc020111c:	f348                	sd	a0,160(a4)
ffffffffc020111e:	e432                	sd	a2,8(sp)
ffffffffc0201120:	e042                	sd	a6,0(sp)
ffffffffc0201122:	0205c763          	bltz	a1,ffffffffc0201150 <trap+0x52>
ffffffffc0201126:	eb5ff0ef          	jal	ffffffffc0200fda <exception_handler>
ffffffffc020112a:	6622                	ld	a2,8(sp)
ffffffffc020112c:	6802                	ld	a6,0(sp)
ffffffffc020112e:	00095697          	auipc	a3,0x95
ffffffffc0201132:	79a68693          	addi	a3,a3,1946 # ffffffffc02968c8 <current>
ffffffffc0201136:	6298                	ld	a4,0(a3)
ffffffffc0201138:	0b073023          	sd	a6,160(a4)
ffffffffc020113c:	e619                	bnez	a2,ffffffffc020114a <trap+0x4c>
ffffffffc020113e:	0b072783          	lw	a5,176(a4)
ffffffffc0201142:	8b85                	andi	a5,a5,1
ffffffffc0201144:	e79d                	bnez	a5,ffffffffc0201172 <trap+0x74>
ffffffffc0201146:	6f1c                	ld	a5,24(a4)
ffffffffc0201148:	e38d                	bnez	a5,ffffffffc020116a <trap+0x6c>
ffffffffc020114a:	60e2                	ld	ra,24(sp)
ffffffffc020114c:	6105                	addi	sp,sp,32
ffffffffc020114e:	8082                	ret
ffffffffc0201150:	dffff0ef          	jal	ffffffffc0200f4e <interrupt_handler>
ffffffffc0201154:	6802                	ld	a6,0(sp)
ffffffffc0201156:	6622                	ld	a2,8(sp)
ffffffffc0201158:	00095697          	auipc	a3,0x95
ffffffffc020115c:	77068693          	addi	a3,a3,1904 # ffffffffc02968c8 <current>
ffffffffc0201160:	bfd9                	j	ffffffffc0201136 <trap+0x38>
ffffffffc0201162:	0005c363          	bltz	a1,ffffffffc0201168 <trap+0x6a>
ffffffffc0201166:	bd95                	j	ffffffffc0200fda <exception_handler>
ffffffffc0201168:	b3dd                	j	ffffffffc0200f4e <interrupt_handler>
ffffffffc020116a:	60e2                	ld	ra,24(sp)
ffffffffc020116c:	6105                	addi	sp,sp,32
ffffffffc020116e:	2840606f          	j	ffffffffc02073f2 <schedule>
ffffffffc0201172:	555d                	li	a0,-9
ffffffffc0201174:	00c050ef          	jal	ffffffffc0206180 <do_exit>
ffffffffc0201178:	00095717          	auipc	a4,0x95
ffffffffc020117c:	75073703          	ld	a4,1872(a4) # ffffffffc02968c8 <current>
ffffffffc0201180:	b7d9                	j	ffffffffc0201146 <trap+0x48>
	...

ffffffffc0201184 <__alltraps>:
ffffffffc0201184:	14011173          	csrrw	sp,sscratch,sp
ffffffffc0201188:	00011463          	bnez	sp,ffffffffc0201190 <__alltraps+0xc>
ffffffffc020118c:	14002173          	csrr	sp,sscratch
ffffffffc0201190:	712d                	addi	sp,sp,-288
ffffffffc0201192:	e002                	sd	zero,0(sp)
ffffffffc0201194:	e406                	sd	ra,8(sp)
ffffffffc0201196:	ec0e                	sd	gp,24(sp)
ffffffffc0201198:	f012                	sd	tp,32(sp)
ffffffffc020119a:	f416                	sd	t0,40(sp)
ffffffffc020119c:	f81a                	sd	t1,48(sp)
ffffffffc020119e:	fc1e                	sd	t2,56(sp)
ffffffffc02011a0:	e0a2                	sd	s0,64(sp)
ffffffffc02011a2:	e4a6                	sd	s1,72(sp)
ffffffffc02011a4:	e8aa                	sd	a0,80(sp)
ffffffffc02011a6:	ecae                	sd	a1,88(sp)
ffffffffc02011a8:	f0b2                	sd	a2,96(sp)
ffffffffc02011aa:	f4b6                	sd	a3,104(sp)
ffffffffc02011ac:	f8ba                	sd	a4,112(sp)
ffffffffc02011ae:	fcbe                	sd	a5,120(sp)
ffffffffc02011b0:	e142                	sd	a6,128(sp)
ffffffffc02011b2:	e546                	sd	a7,136(sp)
ffffffffc02011b4:	e94a                	sd	s2,144(sp)
ffffffffc02011b6:	ed4e                	sd	s3,152(sp)
ffffffffc02011b8:	f152                	sd	s4,160(sp)
ffffffffc02011ba:	f556                	sd	s5,168(sp)
ffffffffc02011bc:	f95a                	sd	s6,176(sp)
ffffffffc02011be:	fd5e                	sd	s7,184(sp)
ffffffffc02011c0:	e1e2                	sd	s8,192(sp)
ffffffffc02011c2:	e5e6                	sd	s9,200(sp)
ffffffffc02011c4:	e9ea                	sd	s10,208(sp)
ffffffffc02011c6:	edee                	sd	s11,216(sp)
ffffffffc02011c8:	f1f2                	sd	t3,224(sp)
ffffffffc02011ca:	f5f6                	sd	t4,232(sp)
ffffffffc02011cc:	f9fa                	sd	t5,240(sp)
ffffffffc02011ce:	fdfe                	sd	t6,248(sp)
ffffffffc02011d0:	14001473          	csrrw	s0,sscratch,zero
ffffffffc02011d4:	100024f3          	csrr	s1,sstatus
ffffffffc02011d8:	14102973          	csrr	s2,sepc
ffffffffc02011dc:	143029f3          	csrr	s3,stval
ffffffffc02011e0:	14202a73          	csrr	s4,scause
ffffffffc02011e4:	e822                	sd	s0,16(sp)
ffffffffc02011e6:	e226                	sd	s1,256(sp)
ffffffffc02011e8:	e64a                	sd	s2,264(sp)
ffffffffc02011ea:	ea4e                	sd	s3,272(sp)
ffffffffc02011ec:	ee52                	sd	s4,280(sp)
ffffffffc02011ee:	850a                	mv	a0,sp
ffffffffc02011f0:	f0fff0ef          	jal	ffffffffc02010fe <trap>

ffffffffc02011f4 <__trapret>:
ffffffffc02011f4:	6492                	ld	s1,256(sp)
ffffffffc02011f6:	6932                	ld	s2,264(sp)
ffffffffc02011f8:	1004f413          	andi	s0,s1,256
ffffffffc02011fc:	e401                	bnez	s0,ffffffffc0201204 <__trapret+0x10>
ffffffffc02011fe:	1200                	addi	s0,sp,288
ffffffffc0201200:	14041073          	csrw	sscratch,s0
ffffffffc0201204:	10049073          	csrw	sstatus,s1
ffffffffc0201208:	14191073          	csrw	sepc,s2
ffffffffc020120c:	60a2                	ld	ra,8(sp)
ffffffffc020120e:	61e2                	ld	gp,24(sp)
ffffffffc0201210:	7202                	ld	tp,32(sp)
ffffffffc0201212:	72a2                	ld	t0,40(sp)
ffffffffc0201214:	7342                	ld	t1,48(sp)
ffffffffc0201216:	73e2                	ld	t2,56(sp)
ffffffffc0201218:	6406                	ld	s0,64(sp)
ffffffffc020121a:	64a6                	ld	s1,72(sp)
ffffffffc020121c:	6546                	ld	a0,80(sp)
ffffffffc020121e:	65e6                	ld	a1,88(sp)
ffffffffc0201220:	7606                	ld	a2,96(sp)
ffffffffc0201222:	76a6                	ld	a3,104(sp)
ffffffffc0201224:	7746                	ld	a4,112(sp)
ffffffffc0201226:	77e6                	ld	a5,120(sp)
ffffffffc0201228:	680a                	ld	a6,128(sp)
ffffffffc020122a:	68aa                	ld	a7,136(sp)
ffffffffc020122c:	694a                	ld	s2,144(sp)
ffffffffc020122e:	69ea                	ld	s3,152(sp)
ffffffffc0201230:	7a0a                	ld	s4,160(sp)
ffffffffc0201232:	7aaa                	ld	s5,168(sp)
ffffffffc0201234:	7b4a                	ld	s6,176(sp)
ffffffffc0201236:	7bea                	ld	s7,184(sp)
ffffffffc0201238:	6c0e                	ld	s8,192(sp)
ffffffffc020123a:	6cae                	ld	s9,200(sp)
ffffffffc020123c:	6d4e                	ld	s10,208(sp)
ffffffffc020123e:	6dee                	ld	s11,216(sp)
ffffffffc0201240:	7e0e                	ld	t3,224(sp)
ffffffffc0201242:	7eae                	ld	t4,232(sp)
ffffffffc0201244:	7f4e                	ld	t5,240(sp)
ffffffffc0201246:	7fee                	ld	t6,248(sp)
ffffffffc0201248:	6142                	ld	sp,16(sp)
ffffffffc020124a:	10200073          	sret

ffffffffc020124e <forkrets>:
ffffffffc020124e:	812a                	mv	sp,a0
ffffffffc0201250:	b755                	j	ffffffffc02011f4 <__trapret>

ffffffffc0201252 <default_init>:
ffffffffc0201252:	00090797          	auipc	a5,0x90
ffffffffc0201256:	55678793          	addi	a5,a5,1366 # ffffffffc02917a8 <free_area>
ffffffffc020125a:	e79c                	sd	a5,8(a5)
ffffffffc020125c:	e39c                	sd	a5,0(a5)
ffffffffc020125e:	0007a823          	sw	zero,16(a5)
ffffffffc0201262:	8082                	ret

ffffffffc0201264 <default_nr_free_pages>:
ffffffffc0201264:	00090517          	auipc	a0,0x90
ffffffffc0201268:	55456503          	lwu	a0,1364(a0) # ffffffffc02917b8 <free_area+0x10>
ffffffffc020126c:	8082                	ret

ffffffffc020126e <default_check>:
ffffffffc020126e:	711d                	addi	sp,sp,-96
ffffffffc0201270:	e0ca                	sd	s2,64(sp)
ffffffffc0201272:	00090917          	auipc	s2,0x90
ffffffffc0201276:	53690913          	addi	s2,s2,1334 # ffffffffc02917a8 <free_area>
ffffffffc020127a:	00893783          	ld	a5,8(s2)
ffffffffc020127e:	ec86                	sd	ra,88(sp)
ffffffffc0201280:	e8a2                	sd	s0,80(sp)
ffffffffc0201282:	e4a6                	sd	s1,72(sp)
ffffffffc0201284:	fc4e                	sd	s3,56(sp)
ffffffffc0201286:	f852                	sd	s4,48(sp)
ffffffffc0201288:	f456                	sd	s5,40(sp)
ffffffffc020128a:	f05a                	sd	s6,32(sp)
ffffffffc020128c:	ec5e                	sd	s7,24(sp)
ffffffffc020128e:	e862                	sd	s8,16(sp)
ffffffffc0201290:	e466                	sd	s9,8(sp)
ffffffffc0201292:	2f278363          	beq	a5,s2,ffffffffc0201578 <default_check+0x30a>
ffffffffc0201296:	4401                	li	s0,0
ffffffffc0201298:	4481                	li	s1,0
ffffffffc020129a:	ff07b703          	ld	a4,-16(a5)
ffffffffc020129e:	8b09                	andi	a4,a4,2
ffffffffc02012a0:	2e070063          	beqz	a4,ffffffffc0201580 <default_check+0x312>
ffffffffc02012a4:	ff87a703          	lw	a4,-8(a5)
ffffffffc02012a8:	679c                	ld	a5,8(a5)
ffffffffc02012aa:	2485                	addiw	s1,s1,1
ffffffffc02012ac:	9c39                	addw	s0,s0,a4
ffffffffc02012ae:	ff2796e3          	bne	a5,s2,ffffffffc020129a <default_check+0x2c>
ffffffffc02012b2:	89a2                	mv	s3,s0
ffffffffc02012b4:	743000ef          	jal	ffffffffc02021f6 <nr_free_pages>
ffffffffc02012b8:	73351463          	bne	a0,s3,ffffffffc02019e0 <default_check+0x772>
ffffffffc02012bc:	4505                	li	a0,1
ffffffffc02012be:	6c7000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc02012c2:	8a2a                	mv	s4,a0
ffffffffc02012c4:	44050e63          	beqz	a0,ffffffffc0201720 <default_check+0x4b2>
ffffffffc02012c8:	4505                	li	a0,1
ffffffffc02012ca:	6bb000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc02012ce:	89aa                	mv	s3,a0
ffffffffc02012d0:	72050863          	beqz	a0,ffffffffc0201a00 <default_check+0x792>
ffffffffc02012d4:	4505                	li	a0,1
ffffffffc02012d6:	6af000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc02012da:	8aaa                	mv	s5,a0
ffffffffc02012dc:	4c050263          	beqz	a0,ffffffffc02017a0 <default_check+0x532>
ffffffffc02012e0:	40a987b3          	sub	a5,s3,a0
ffffffffc02012e4:	40aa0733          	sub	a4,s4,a0
ffffffffc02012e8:	0017b793          	seqz	a5,a5
ffffffffc02012ec:	00173713          	seqz	a4,a4
ffffffffc02012f0:	8fd9                	or	a5,a5,a4
ffffffffc02012f2:	30079763          	bnez	a5,ffffffffc0201600 <default_check+0x392>
ffffffffc02012f6:	313a0563          	beq	s4,s3,ffffffffc0201600 <default_check+0x392>
ffffffffc02012fa:	000a2783          	lw	a5,0(s4)
ffffffffc02012fe:	2a079163          	bnez	a5,ffffffffc02015a0 <default_check+0x332>
ffffffffc0201302:	0009a783          	lw	a5,0(s3)
ffffffffc0201306:	28079d63          	bnez	a5,ffffffffc02015a0 <default_check+0x332>
ffffffffc020130a:	411c                	lw	a5,0(a0)
ffffffffc020130c:	28079a63          	bnez	a5,ffffffffc02015a0 <default_check+0x332>
ffffffffc0201310:	00095797          	auipc	a5,0x95
ffffffffc0201314:	5a87b783          	ld	a5,1448(a5) # ffffffffc02968b8 <pages>
ffffffffc0201318:	0000e617          	auipc	a2,0xe
ffffffffc020131c:	5b863603          	ld	a2,1464(a2) # ffffffffc020f8d0 <nbase>
ffffffffc0201320:	00095697          	auipc	a3,0x95
ffffffffc0201324:	5906b683          	ld	a3,1424(a3) # ffffffffc02968b0 <npage>
ffffffffc0201328:	40fa0733          	sub	a4,s4,a5
ffffffffc020132c:	8719                	srai	a4,a4,0x6
ffffffffc020132e:	9732                	add	a4,a4,a2
ffffffffc0201330:	0732                	slli	a4,a4,0xc
ffffffffc0201332:	06b2                	slli	a3,a3,0xc
ffffffffc0201334:	2ad77663          	bgeu	a4,a3,ffffffffc02015e0 <default_check+0x372>
ffffffffc0201338:	40f98733          	sub	a4,s3,a5
ffffffffc020133c:	8719                	srai	a4,a4,0x6
ffffffffc020133e:	9732                	add	a4,a4,a2
ffffffffc0201340:	0732                	slli	a4,a4,0xc
ffffffffc0201342:	4cd77f63          	bgeu	a4,a3,ffffffffc0201820 <default_check+0x5b2>
ffffffffc0201346:	40f507b3          	sub	a5,a0,a5
ffffffffc020134a:	8799                	srai	a5,a5,0x6
ffffffffc020134c:	97b2                	add	a5,a5,a2
ffffffffc020134e:	07b2                	slli	a5,a5,0xc
ffffffffc0201350:	32d7f863          	bgeu	a5,a3,ffffffffc0201680 <default_check+0x412>
ffffffffc0201354:	4505                	li	a0,1
ffffffffc0201356:	00093c03          	ld	s8,0(s2)
ffffffffc020135a:	00893b83          	ld	s7,8(s2)
ffffffffc020135e:	00090b17          	auipc	s6,0x90
ffffffffc0201362:	45ab2b03          	lw	s6,1114(s6) # ffffffffc02917b8 <free_area+0x10>
ffffffffc0201366:	01293023          	sd	s2,0(s2)
ffffffffc020136a:	01293423          	sd	s2,8(s2)
ffffffffc020136e:	00090797          	auipc	a5,0x90
ffffffffc0201372:	4407a523          	sw	zero,1098(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc0201376:	60f000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc020137a:	2e051363          	bnez	a0,ffffffffc0201660 <default_check+0x3f2>
ffffffffc020137e:	8552                	mv	a0,s4
ffffffffc0201380:	4585                	li	a1,1
ffffffffc0201382:	63d000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc0201386:	854e                	mv	a0,s3
ffffffffc0201388:	4585                	li	a1,1
ffffffffc020138a:	635000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc020138e:	8556                	mv	a0,s5
ffffffffc0201390:	4585                	li	a1,1
ffffffffc0201392:	62d000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc0201396:	00090717          	auipc	a4,0x90
ffffffffc020139a:	42272703          	lw	a4,1058(a4) # ffffffffc02917b8 <free_area+0x10>
ffffffffc020139e:	478d                	li	a5,3
ffffffffc02013a0:	2af71063          	bne	a4,a5,ffffffffc0201640 <default_check+0x3d2>
ffffffffc02013a4:	4505                	li	a0,1
ffffffffc02013a6:	5df000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc02013aa:	89aa                	mv	s3,a0
ffffffffc02013ac:	26050a63          	beqz	a0,ffffffffc0201620 <default_check+0x3b2>
ffffffffc02013b0:	4505                	li	a0,1
ffffffffc02013b2:	5d3000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc02013b6:	8aaa                	mv	s5,a0
ffffffffc02013b8:	3c050463          	beqz	a0,ffffffffc0201780 <default_check+0x512>
ffffffffc02013bc:	4505                	li	a0,1
ffffffffc02013be:	5c7000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc02013c2:	8a2a                	mv	s4,a0
ffffffffc02013c4:	38050e63          	beqz	a0,ffffffffc0201760 <default_check+0x4f2>
ffffffffc02013c8:	4505                	li	a0,1
ffffffffc02013ca:	5bb000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc02013ce:	36051963          	bnez	a0,ffffffffc0201740 <default_check+0x4d2>
ffffffffc02013d2:	4585                	li	a1,1
ffffffffc02013d4:	854e                	mv	a0,s3
ffffffffc02013d6:	5e9000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc02013da:	00893783          	ld	a5,8(s2)
ffffffffc02013de:	1f278163          	beq	a5,s2,ffffffffc02015c0 <default_check+0x352>
ffffffffc02013e2:	4505                	li	a0,1
ffffffffc02013e4:	5a1000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc02013e8:	8caa                	mv	s9,a0
ffffffffc02013ea:	30a99b63          	bne	s3,a0,ffffffffc0201700 <default_check+0x492>
ffffffffc02013ee:	4505                	li	a0,1
ffffffffc02013f0:	595000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc02013f4:	2e051663          	bnez	a0,ffffffffc02016e0 <default_check+0x472>
ffffffffc02013f8:	00090797          	auipc	a5,0x90
ffffffffc02013fc:	3c07a783          	lw	a5,960(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc0201400:	2c079063          	bnez	a5,ffffffffc02016c0 <default_check+0x452>
ffffffffc0201404:	8566                	mv	a0,s9
ffffffffc0201406:	4585                	li	a1,1
ffffffffc0201408:	01893023          	sd	s8,0(s2)
ffffffffc020140c:	01793423          	sd	s7,8(s2)
ffffffffc0201410:	01692823          	sw	s6,16(s2)
ffffffffc0201414:	5ab000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc0201418:	8556                	mv	a0,s5
ffffffffc020141a:	4585                	li	a1,1
ffffffffc020141c:	5a3000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc0201420:	8552                	mv	a0,s4
ffffffffc0201422:	4585                	li	a1,1
ffffffffc0201424:	59b000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc0201428:	4515                	li	a0,5
ffffffffc020142a:	55b000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc020142e:	89aa                	mv	s3,a0
ffffffffc0201430:	26050863          	beqz	a0,ffffffffc02016a0 <default_check+0x432>
ffffffffc0201434:	651c                	ld	a5,8(a0)
ffffffffc0201436:	8b89                	andi	a5,a5,2
ffffffffc0201438:	54079463          	bnez	a5,ffffffffc0201980 <default_check+0x712>
ffffffffc020143c:	4505                	li	a0,1
ffffffffc020143e:	00093b83          	ld	s7,0(s2)
ffffffffc0201442:	00893b03          	ld	s6,8(s2)
ffffffffc0201446:	01293023          	sd	s2,0(s2)
ffffffffc020144a:	01293423          	sd	s2,8(s2)
ffffffffc020144e:	537000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc0201452:	50051763          	bnez	a0,ffffffffc0201960 <default_check+0x6f2>
ffffffffc0201456:	08098a13          	addi	s4,s3,128
ffffffffc020145a:	8552                	mv	a0,s4
ffffffffc020145c:	458d                	li	a1,3
ffffffffc020145e:	00090c17          	auipc	s8,0x90
ffffffffc0201462:	35ac2c03          	lw	s8,858(s8) # ffffffffc02917b8 <free_area+0x10>
ffffffffc0201466:	00090797          	auipc	a5,0x90
ffffffffc020146a:	3407a923          	sw	zero,850(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc020146e:	551000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc0201472:	4511                	li	a0,4
ffffffffc0201474:	511000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc0201478:	4c051463          	bnez	a0,ffffffffc0201940 <default_check+0x6d2>
ffffffffc020147c:	0889b783          	ld	a5,136(s3)
ffffffffc0201480:	8b89                	andi	a5,a5,2
ffffffffc0201482:	48078f63          	beqz	a5,ffffffffc0201920 <default_check+0x6b2>
ffffffffc0201486:	0909a503          	lw	a0,144(s3)
ffffffffc020148a:	478d                	li	a5,3
ffffffffc020148c:	48f51a63          	bne	a0,a5,ffffffffc0201920 <default_check+0x6b2>
ffffffffc0201490:	4f5000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc0201494:	8aaa                	mv	s5,a0
ffffffffc0201496:	46050563          	beqz	a0,ffffffffc0201900 <default_check+0x692>
ffffffffc020149a:	4505                	li	a0,1
ffffffffc020149c:	4e9000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc02014a0:	44051063          	bnez	a0,ffffffffc02018e0 <default_check+0x672>
ffffffffc02014a4:	415a1e63          	bne	s4,s5,ffffffffc02018c0 <default_check+0x652>
ffffffffc02014a8:	4585                	li	a1,1
ffffffffc02014aa:	854e                	mv	a0,s3
ffffffffc02014ac:	513000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc02014b0:	8552                	mv	a0,s4
ffffffffc02014b2:	458d                	li	a1,3
ffffffffc02014b4:	50b000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc02014b8:	0089b783          	ld	a5,8(s3)
ffffffffc02014bc:	8b89                	andi	a5,a5,2
ffffffffc02014be:	3e078163          	beqz	a5,ffffffffc02018a0 <default_check+0x632>
ffffffffc02014c2:	0109aa83          	lw	s5,16(s3)
ffffffffc02014c6:	4785                	li	a5,1
ffffffffc02014c8:	3cfa9c63          	bne	s5,a5,ffffffffc02018a0 <default_check+0x632>
ffffffffc02014cc:	008a3783          	ld	a5,8(s4)
ffffffffc02014d0:	8b89                	andi	a5,a5,2
ffffffffc02014d2:	3a078763          	beqz	a5,ffffffffc0201880 <default_check+0x612>
ffffffffc02014d6:	010a2703          	lw	a4,16(s4)
ffffffffc02014da:	478d                	li	a5,3
ffffffffc02014dc:	3af71263          	bne	a4,a5,ffffffffc0201880 <default_check+0x612>
ffffffffc02014e0:	8556                	mv	a0,s5
ffffffffc02014e2:	4a3000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc02014e6:	36a99d63          	bne	s3,a0,ffffffffc0201860 <default_check+0x5f2>
ffffffffc02014ea:	85d6                	mv	a1,s5
ffffffffc02014ec:	4d3000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc02014f0:	4509                	li	a0,2
ffffffffc02014f2:	493000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc02014f6:	34aa1563          	bne	s4,a0,ffffffffc0201840 <default_check+0x5d2>
ffffffffc02014fa:	4589                	li	a1,2
ffffffffc02014fc:	4c3000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc0201500:	04098513          	addi	a0,s3,64
ffffffffc0201504:	85d6                	mv	a1,s5
ffffffffc0201506:	4b9000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc020150a:	4515                	li	a0,5
ffffffffc020150c:	479000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc0201510:	89aa                	mv	s3,a0
ffffffffc0201512:	48050763          	beqz	a0,ffffffffc02019a0 <default_check+0x732>
ffffffffc0201516:	8556                	mv	a0,s5
ffffffffc0201518:	46d000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc020151c:	2e051263          	bnez	a0,ffffffffc0201800 <default_check+0x592>
ffffffffc0201520:	00090797          	auipc	a5,0x90
ffffffffc0201524:	2987a783          	lw	a5,664(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc0201528:	2a079c63          	bnez	a5,ffffffffc02017e0 <default_check+0x572>
ffffffffc020152c:	854e                	mv	a0,s3
ffffffffc020152e:	4595                	li	a1,5
ffffffffc0201530:	01892823          	sw	s8,16(s2)
ffffffffc0201534:	01793023          	sd	s7,0(s2)
ffffffffc0201538:	01693423          	sd	s6,8(s2)
ffffffffc020153c:	483000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc0201540:	00893783          	ld	a5,8(s2)
ffffffffc0201544:	01278963          	beq	a5,s2,ffffffffc0201556 <default_check+0x2e8>
ffffffffc0201548:	ff87a703          	lw	a4,-8(a5)
ffffffffc020154c:	679c                	ld	a5,8(a5)
ffffffffc020154e:	34fd                	addiw	s1,s1,-1
ffffffffc0201550:	9c19                	subw	s0,s0,a4
ffffffffc0201552:	ff279be3          	bne	a5,s2,ffffffffc0201548 <default_check+0x2da>
ffffffffc0201556:	26049563          	bnez	s1,ffffffffc02017c0 <default_check+0x552>
ffffffffc020155a:	46041363          	bnez	s0,ffffffffc02019c0 <default_check+0x752>
ffffffffc020155e:	60e6                	ld	ra,88(sp)
ffffffffc0201560:	6446                	ld	s0,80(sp)
ffffffffc0201562:	64a6                	ld	s1,72(sp)
ffffffffc0201564:	6906                	ld	s2,64(sp)
ffffffffc0201566:	79e2                	ld	s3,56(sp)
ffffffffc0201568:	7a42                	ld	s4,48(sp)
ffffffffc020156a:	7aa2                	ld	s5,40(sp)
ffffffffc020156c:	7b02                	ld	s6,32(sp)
ffffffffc020156e:	6be2                	ld	s7,24(sp)
ffffffffc0201570:	6c42                	ld	s8,16(sp)
ffffffffc0201572:	6ca2                	ld	s9,8(sp)
ffffffffc0201574:	6125                	addi	sp,sp,96
ffffffffc0201576:	8082                	ret
ffffffffc0201578:	4981                	li	s3,0
ffffffffc020157a:	4401                	li	s0,0
ffffffffc020157c:	4481                	li	s1,0
ffffffffc020157e:	bb1d                	j	ffffffffc02012b4 <default_check+0x46>
ffffffffc0201580:	0000b697          	auipc	a3,0xb
ffffffffc0201584:	ca068693          	addi	a3,a3,-864 # ffffffffc020c220 <etext+0xb0c>
ffffffffc0201588:	0000a617          	auipc	a2,0xa
ffffffffc020158c:	5c860613          	addi	a2,a2,1480 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201590:	0ef00593          	li	a1,239
ffffffffc0201594:	0000b517          	auipc	a0,0xb
ffffffffc0201598:	c9c50513          	addi	a0,a0,-868 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020159c:	eaffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02015a0:	0000b697          	auipc	a3,0xb
ffffffffc02015a4:	d5068693          	addi	a3,a3,-688 # ffffffffc020c2f0 <etext+0xbdc>
ffffffffc02015a8:	0000a617          	auipc	a2,0xa
ffffffffc02015ac:	5a860613          	addi	a2,a2,1448 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02015b0:	0bd00593          	li	a1,189
ffffffffc02015b4:	0000b517          	auipc	a0,0xb
ffffffffc02015b8:	c7c50513          	addi	a0,a0,-900 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02015bc:	e8ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02015c0:	0000b697          	auipc	a3,0xb
ffffffffc02015c4:	df868693          	addi	a3,a3,-520 # ffffffffc020c3b8 <etext+0xca4>
ffffffffc02015c8:	0000a617          	auipc	a2,0xa
ffffffffc02015cc:	58860613          	addi	a2,a2,1416 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02015d0:	0d800593          	li	a1,216
ffffffffc02015d4:	0000b517          	auipc	a0,0xb
ffffffffc02015d8:	c5c50513          	addi	a0,a0,-932 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02015dc:	e6ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02015e0:	0000b697          	auipc	a3,0xb
ffffffffc02015e4:	d5068693          	addi	a3,a3,-688 # ffffffffc020c330 <etext+0xc1c>
ffffffffc02015e8:	0000a617          	auipc	a2,0xa
ffffffffc02015ec:	56860613          	addi	a2,a2,1384 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02015f0:	0bf00593          	li	a1,191
ffffffffc02015f4:	0000b517          	auipc	a0,0xb
ffffffffc02015f8:	c3c50513          	addi	a0,a0,-964 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02015fc:	e4ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201600:	0000b697          	auipc	a3,0xb
ffffffffc0201604:	cc868693          	addi	a3,a3,-824 # ffffffffc020c2c8 <etext+0xbb4>
ffffffffc0201608:	0000a617          	auipc	a2,0xa
ffffffffc020160c:	54860613          	addi	a2,a2,1352 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201610:	0bc00593          	li	a1,188
ffffffffc0201614:	0000b517          	auipc	a0,0xb
ffffffffc0201618:	c1c50513          	addi	a0,a0,-996 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020161c:	e2ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201620:	0000b697          	auipc	a3,0xb
ffffffffc0201624:	c4868693          	addi	a3,a3,-952 # ffffffffc020c268 <etext+0xb54>
ffffffffc0201628:	0000a617          	auipc	a2,0xa
ffffffffc020162c:	52860613          	addi	a2,a2,1320 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201630:	0d100593          	li	a1,209
ffffffffc0201634:	0000b517          	auipc	a0,0xb
ffffffffc0201638:	bfc50513          	addi	a0,a0,-1028 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020163c:	e0ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201640:	0000b697          	auipc	a3,0xb
ffffffffc0201644:	d6868693          	addi	a3,a3,-664 # ffffffffc020c3a8 <etext+0xc94>
ffffffffc0201648:	0000a617          	auipc	a2,0xa
ffffffffc020164c:	50860613          	addi	a2,a2,1288 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201650:	0cf00593          	li	a1,207
ffffffffc0201654:	0000b517          	auipc	a0,0xb
ffffffffc0201658:	bdc50513          	addi	a0,a0,-1060 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020165c:	deffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201660:	0000b697          	auipc	a3,0xb
ffffffffc0201664:	d3068693          	addi	a3,a3,-720 # ffffffffc020c390 <etext+0xc7c>
ffffffffc0201668:	0000a617          	auipc	a2,0xa
ffffffffc020166c:	4e860613          	addi	a2,a2,1256 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201670:	0ca00593          	li	a1,202
ffffffffc0201674:	0000b517          	auipc	a0,0xb
ffffffffc0201678:	bbc50513          	addi	a0,a0,-1092 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020167c:	dcffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201680:	0000b697          	auipc	a3,0xb
ffffffffc0201684:	cf068693          	addi	a3,a3,-784 # ffffffffc020c370 <etext+0xc5c>
ffffffffc0201688:	0000a617          	auipc	a2,0xa
ffffffffc020168c:	4c860613          	addi	a2,a2,1224 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201690:	0c100593          	li	a1,193
ffffffffc0201694:	0000b517          	auipc	a0,0xb
ffffffffc0201698:	b9c50513          	addi	a0,a0,-1124 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020169c:	daffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02016a0:	0000b697          	auipc	a3,0xb
ffffffffc02016a4:	d6068693          	addi	a3,a3,-672 # ffffffffc020c400 <etext+0xcec>
ffffffffc02016a8:	0000a617          	auipc	a2,0xa
ffffffffc02016ac:	4a860613          	addi	a2,a2,1192 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02016b0:	0f700593          	li	a1,247
ffffffffc02016b4:	0000b517          	auipc	a0,0xb
ffffffffc02016b8:	b7c50513          	addi	a0,a0,-1156 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02016bc:	d8ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02016c0:	0000b697          	auipc	a3,0xb
ffffffffc02016c4:	d3068693          	addi	a3,a3,-720 # ffffffffc020c3f0 <etext+0xcdc>
ffffffffc02016c8:	0000a617          	auipc	a2,0xa
ffffffffc02016cc:	48860613          	addi	a2,a2,1160 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02016d0:	0de00593          	li	a1,222
ffffffffc02016d4:	0000b517          	auipc	a0,0xb
ffffffffc02016d8:	b5c50513          	addi	a0,a0,-1188 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02016dc:	d6ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02016e0:	0000b697          	auipc	a3,0xb
ffffffffc02016e4:	cb068693          	addi	a3,a3,-848 # ffffffffc020c390 <etext+0xc7c>
ffffffffc02016e8:	0000a617          	auipc	a2,0xa
ffffffffc02016ec:	46860613          	addi	a2,a2,1128 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02016f0:	0dc00593          	li	a1,220
ffffffffc02016f4:	0000b517          	auipc	a0,0xb
ffffffffc02016f8:	b3c50513          	addi	a0,a0,-1220 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02016fc:	d4ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201700:	0000b697          	auipc	a3,0xb
ffffffffc0201704:	cd068693          	addi	a3,a3,-816 # ffffffffc020c3d0 <etext+0xcbc>
ffffffffc0201708:	0000a617          	auipc	a2,0xa
ffffffffc020170c:	44860613          	addi	a2,a2,1096 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201710:	0db00593          	li	a1,219
ffffffffc0201714:	0000b517          	auipc	a0,0xb
ffffffffc0201718:	b1c50513          	addi	a0,a0,-1252 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020171c:	d2ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201720:	0000b697          	auipc	a3,0xb
ffffffffc0201724:	b4868693          	addi	a3,a3,-1208 # ffffffffc020c268 <etext+0xb54>
ffffffffc0201728:	0000a617          	auipc	a2,0xa
ffffffffc020172c:	42860613          	addi	a2,a2,1064 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201730:	0b800593          	li	a1,184
ffffffffc0201734:	0000b517          	auipc	a0,0xb
ffffffffc0201738:	afc50513          	addi	a0,a0,-1284 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020173c:	d0ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201740:	0000b697          	auipc	a3,0xb
ffffffffc0201744:	c5068693          	addi	a3,a3,-944 # ffffffffc020c390 <etext+0xc7c>
ffffffffc0201748:	0000a617          	auipc	a2,0xa
ffffffffc020174c:	40860613          	addi	a2,a2,1032 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201750:	0d500593          	li	a1,213
ffffffffc0201754:	0000b517          	auipc	a0,0xb
ffffffffc0201758:	adc50513          	addi	a0,a0,-1316 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020175c:	ceffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201760:	0000b697          	auipc	a3,0xb
ffffffffc0201764:	b4868693          	addi	a3,a3,-1208 # ffffffffc020c2a8 <etext+0xb94>
ffffffffc0201768:	0000a617          	auipc	a2,0xa
ffffffffc020176c:	3e860613          	addi	a2,a2,1000 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201770:	0d300593          	li	a1,211
ffffffffc0201774:	0000b517          	auipc	a0,0xb
ffffffffc0201778:	abc50513          	addi	a0,a0,-1348 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020177c:	ccffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201780:	0000b697          	auipc	a3,0xb
ffffffffc0201784:	b0868693          	addi	a3,a3,-1272 # ffffffffc020c288 <etext+0xb74>
ffffffffc0201788:	0000a617          	auipc	a2,0xa
ffffffffc020178c:	3c860613          	addi	a2,a2,968 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201790:	0d200593          	li	a1,210
ffffffffc0201794:	0000b517          	auipc	a0,0xb
ffffffffc0201798:	a9c50513          	addi	a0,a0,-1380 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020179c:	caffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02017a0:	0000b697          	auipc	a3,0xb
ffffffffc02017a4:	b0868693          	addi	a3,a3,-1272 # ffffffffc020c2a8 <etext+0xb94>
ffffffffc02017a8:	0000a617          	auipc	a2,0xa
ffffffffc02017ac:	3a860613          	addi	a2,a2,936 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02017b0:	0ba00593          	li	a1,186
ffffffffc02017b4:	0000b517          	auipc	a0,0xb
ffffffffc02017b8:	a7c50513          	addi	a0,a0,-1412 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02017bc:	c8ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02017c0:	0000b697          	auipc	a3,0xb
ffffffffc02017c4:	d9068693          	addi	a3,a3,-624 # ffffffffc020c550 <etext+0xe3c>
ffffffffc02017c8:	0000a617          	auipc	a2,0xa
ffffffffc02017cc:	38860613          	addi	a2,a2,904 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02017d0:	12400593          	li	a1,292
ffffffffc02017d4:	0000b517          	auipc	a0,0xb
ffffffffc02017d8:	a5c50513          	addi	a0,a0,-1444 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02017dc:	c6ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02017e0:	0000b697          	auipc	a3,0xb
ffffffffc02017e4:	c1068693          	addi	a3,a3,-1008 # ffffffffc020c3f0 <etext+0xcdc>
ffffffffc02017e8:	0000a617          	auipc	a2,0xa
ffffffffc02017ec:	36860613          	addi	a2,a2,872 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02017f0:	11900593          	li	a1,281
ffffffffc02017f4:	0000b517          	auipc	a0,0xb
ffffffffc02017f8:	a3c50513          	addi	a0,a0,-1476 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02017fc:	c4ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201800:	0000b697          	auipc	a3,0xb
ffffffffc0201804:	b9068693          	addi	a3,a3,-1136 # ffffffffc020c390 <etext+0xc7c>
ffffffffc0201808:	0000a617          	auipc	a2,0xa
ffffffffc020180c:	34860613          	addi	a2,a2,840 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201810:	11700593          	li	a1,279
ffffffffc0201814:	0000b517          	auipc	a0,0xb
ffffffffc0201818:	a1c50513          	addi	a0,a0,-1508 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020181c:	c2ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201820:	0000b697          	auipc	a3,0xb
ffffffffc0201824:	b3068693          	addi	a3,a3,-1232 # ffffffffc020c350 <etext+0xc3c>
ffffffffc0201828:	0000a617          	auipc	a2,0xa
ffffffffc020182c:	32860613          	addi	a2,a2,808 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201830:	0c000593          	li	a1,192
ffffffffc0201834:	0000b517          	auipc	a0,0xb
ffffffffc0201838:	9fc50513          	addi	a0,a0,-1540 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020183c:	c0ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201840:	0000b697          	auipc	a3,0xb
ffffffffc0201844:	cd068693          	addi	a3,a3,-816 # ffffffffc020c510 <etext+0xdfc>
ffffffffc0201848:	0000a617          	auipc	a2,0xa
ffffffffc020184c:	30860613          	addi	a2,a2,776 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201850:	11100593          	li	a1,273
ffffffffc0201854:	0000b517          	auipc	a0,0xb
ffffffffc0201858:	9dc50513          	addi	a0,a0,-1572 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020185c:	beffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201860:	0000b697          	auipc	a3,0xb
ffffffffc0201864:	c9068693          	addi	a3,a3,-880 # ffffffffc020c4f0 <etext+0xddc>
ffffffffc0201868:	0000a617          	auipc	a2,0xa
ffffffffc020186c:	2e860613          	addi	a2,a2,744 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201870:	10f00593          	li	a1,271
ffffffffc0201874:	0000b517          	auipc	a0,0xb
ffffffffc0201878:	9bc50513          	addi	a0,a0,-1604 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020187c:	bcffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201880:	0000b697          	auipc	a3,0xb
ffffffffc0201884:	c4868693          	addi	a3,a3,-952 # ffffffffc020c4c8 <etext+0xdb4>
ffffffffc0201888:	0000a617          	auipc	a2,0xa
ffffffffc020188c:	2c860613          	addi	a2,a2,712 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201890:	10d00593          	li	a1,269
ffffffffc0201894:	0000b517          	auipc	a0,0xb
ffffffffc0201898:	99c50513          	addi	a0,a0,-1636 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020189c:	baffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02018a0:	0000b697          	auipc	a3,0xb
ffffffffc02018a4:	c0068693          	addi	a3,a3,-1024 # ffffffffc020c4a0 <etext+0xd8c>
ffffffffc02018a8:	0000a617          	auipc	a2,0xa
ffffffffc02018ac:	2a860613          	addi	a2,a2,680 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02018b0:	10c00593          	li	a1,268
ffffffffc02018b4:	0000b517          	auipc	a0,0xb
ffffffffc02018b8:	97c50513          	addi	a0,a0,-1668 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02018bc:	b8ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02018c0:	0000b697          	auipc	a3,0xb
ffffffffc02018c4:	bd068693          	addi	a3,a3,-1072 # ffffffffc020c490 <etext+0xd7c>
ffffffffc02018c8:	0000a617          	auipc	a2,0xa
ffffffffc02018cc:	28860613          	addi	a2,a2,648 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02018d0:	10700593          	li	a1,263
ffffffffc02018d4:	0000b517          	auipc	a0,0xb
ffffffffc02018d8:	95c50513          	addi	a0,a0,-1700 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02018dc:	b6ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02018e0:	0000b697          	auipc	a3,0xb
ffffffffc02018e4:	ab068693          	addi	a3,a3,-1360 # ffffffffc020c390 <etext+0xc7c>
ffffffffc02018e8:	0000a617          	auipc	a2,0xa
ffffffffc02018ec:	26860613          	addi	a2,a2,616 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02018f0:	10600593          	li	a1,262
ffffffffc02018f4:	0000b517          	auipc	a0,0xb
ffffffffc02018f8:	93c50513          	addi	a0,a0,-1732 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02018fc:	b4ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201900:	0000b697          	auipc	a3,0xb
ffffffffc0201904:	b7068693          	addi	a3,a3,-1168 # ffffffffc020c470 <etext+0xd5c>
ffffffffc0201908:	0000a617          	auipc	a2,0xa
ffffffffc020190c:	24860613          	addi	a2,a2,584 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201910:	10500593          	li	a1,261
ffffffffc0201914:	0000b517          	auipc	a0,0xb
ffffffffc0201918:	91c50513          	addi	a0,a0,-1764 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020191c:	b2ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201920:	0000b697          	auipc	a3,0xb
ffffffffc0201924:	b2068693          	addi	a3,a3,-1248 # ffffffffc020c440 <etext+0xd2c>
ffffffffc0201928:	0000a617          	auipc	a2,0xa
ffffffffc020192c:	22860613          	addi	a2,a2,552 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201930:	10400593          	li	a1,260
ffffffffc0201934:	0000b517          	auipc	a0,0xb
ffffffffc0201938:	8fc50513          	addi	a0,a0,-1796 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020193c:	b0ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201940:	0000b697          	auipc	a3,0xb
ffffffffc0201944:	ae868693          	addi	a3,a3,-1304 # ffffffffc020c428 <etext+0xd14>
ffffffffc0201948:	0000a617          	auipc	a2,0xa
ffffffffc020194c:	20860613          	addi	a2,a2,520 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201950:	10300593          	li	a1,259
ffffffffc0201954:	0000b517          	auipc	a0,0xb
ffffffffc0201958:	8dc50513          	addi	a0,a0,-1828 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020195c:	aeffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201960:	0000b697          	auipc	a3,0xb
ffffffffc0201964:	a3068693          	addi	a3,a3,-1488 # ffffffffc020c390 <etext+0xc7c>
ffffffffc0201968:	0000a617          	auipc	a2,0xa
ffffffffc020196c:	1e860613          	addi	a2,a2,488 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201970:	0fd00593          	li	a1,253
ffffffffc0201974:	0000b517          	auipc	a0,0xb
ffffffffc0201978:	8bc50513          	addi	a0,a0,-1860 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020197c:	acffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201980:	0000b697          	auipc	a3,0xb
ffffffffc0201984:	a9068693          	addi	a3,a3,-1392 # ffffffffc020c410 <etext+0xcfc>
ffffffffc0201988:	0000a617          	auipc	a2,0xa
ffffffffc020198c:	1c860613          	addi	a2,a2,456 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201990:	0f800593          	li	a1,248
ffffffffc0201994:	0000b517          	auipc	a0,0xb
ffffffffc0201998:	89c50513          	addi	a0,a0,-1892 # ffffffffc020c230 <etext+0xb1c>
ffffffffc020199c:	aaffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02019a0:	0000b697          	auipc	a3,0xb
ffffffffc02019a4:	b9068693          	addi	a3,a3,-1136 # ffffffffc020c530 <etext+0xe1c>
ffffffffc02019a8:	0000a617          	auipc	a2,0xa
ffffffffc02019ac:	1a860613          	addi	a2,a2,424 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02019b0:	11600593          	li	a1,278
ffffffffc02019b4:	0000b517          	auipc	a0,0xb
ffffffffc02019b8:	87c50513          	addi	a0,a0,-1924 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02019bc:	a8ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02019c0:	0000b697          	auipc	a3,0xb
ffffffffc02019c4:	ba068693          	addi	a3,a3,-1120 # ffffffffc020c560 <etext+0xe4c>
ffffffffc02019c8:	0000a617          	auipc	a2,0xa
ffffffffc02019cc:	18860613          	addi	a2,a2,392 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02019d0:	12500593          	li	a1,293
ffffffffc02019d4:	0000b517          	auipc	a0,0xb
ffffffffc02019d8:	85c50513          	addi	a0,a0,-1956 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02019dc:	a6ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02019e0:	0000b697          	auipc	a3,0xb
ffffffffc02019e4:	86868693          	addi	a3,a3,-1944 # ffffffffc020c248 <etext+0xb34>
ffffffffc02019e8:	0000a617          	auipc	a2,0xa
ffffffffc02019ec:	16860613          	addi	a2,a2,360 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02019f0:	0f200593          	li	a1,242
ffffffffc02019f4:	0000b517          	auipc	a0,0xb
ffffffffc02019f8:	83c50513          	addi	a0,a0,-1988 # ffffffffc020c230 <etext+0xb1c>
ffffffffc02019fc:	a4ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201a00:	0000b697          	auipc	a3,0xb
ffffffffc0201a04:	88868693          	addi	a3,a3,-1912 # ffffffffc020c288 <etext+0xb74>
ffffffffc0201a08:	0000a617          	auipc	a2,0xa
ffffffffc0201a0c:	14860613          	addi	a2,a2,328 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201a10:	0b900593          	li	a1,185
ffffffffc0201a14:	0000b517          	auipc	a0,0xb
ffffffffc0201a18:	81c50513          	addi	a0,a0,-2020 # ffffffffc020c230 <etext+0xb1c>
ffffffffc0201a1c:	a2ffe0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0201a20 <default_free_pages>:
ffffffffc0201a20:	1141                	addi	sp,sp,-16
ffffffffc0201a22:	e406                	sd	ra,8(sp)
ffffffffc0201a24:	14058663          	beqz	a1,ffffffffc0201b70 <default_free_pages+0x150>
ffffffffc0201a28:	00659713          	slli	a4,a1,0x6
ffffffffc0201a2c:	00e506b3          	add	a3,a0,a4
ffffffffc0201a30:	87aa                	mv	a5,a0
ffffffffc0201a32:	c30d                	beqz	a4,ffffffffc0201a54 <default_free_pages+0x34>
ffffffffc0201a34:	6798                	ld	a4,8(a5)
ffffffffc0201a36:	8b05                	andi	a4,a4,1
ffffffffc0201a38:	10071c63          	bnez	a4,ffffffffc0201b50 <default_free_pages+0x130>
ffffffffc0201a3c:	6798                	ld	a4,8(a5)
ffffffffc0201a3e:	8b09                	andi	a4,a4,2
ffffffffc0201a40:	10071863          	bnez	a4,ffffffffc0201b50 <default_free_pages+0x130>
ffffffffc0201a44:	0007b423          	sd	zero,8(a5)
ffffffffc0201a48:	0007a023          	sw	zero,0(a5)
ffffffffc0201a4c:	04078793          	addi	a5,a5,64
ffffffffc0201a50:	fed792e3          	bne	a5,a3,ffffffffc0201a34 <default_free_pages+0x14>
ffffffffc0201a54:	c90c                	sw	a1,16(a0)
ffffffffc0201a56:	00850893          	addi	a7,a0,8
ffffffffc0201a5a:	4789                	li	a5,2
ffffffffc0201a5c:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0201a60:	00090717          	auipc	a4,0x90
ffffffffc0201a64:	d5872703          	lw	a4,-680(a4) # ffffffffc02917b8 <free_area+0x10>
ffffffffc0201a68:	00090697          	auipc	a3,0x90
ffffffffc0201a6c:	d4068693          	addi	a3,a3,-704 # ffffffffc02917a8 <free_area>
ffffffffc0201a70:	669c                	ld	a5,8(a3)
ffffffffc0201a72:	9f2d                	addw	a4,a4,a1
ffffffffc0201a74:	ca98                	sw	a4,16(a3)
ffffffffc0201a76:	0ad78163          	beq	a5,a3,ffffffffc0201b18 <default_free_pages+0xf8>
ffffffffc0201a7a:	fe878713          	addi	a4,a5,-24
ffffffffc0201a7e:	4581                	li	a1,0
ffffffffc0201a80:	01850613          	addi	a2,a0,24
ffffffffc0201a84:	00e56a63          	bltu	a0,a4,ffffffffc0201a98 <default_free_pages+0x78>
ffffffffc0201a88:	6798                	ld	a4,8(a5)
ffffffffc0201a8a:	04d70c63          	beq	a4,a3,ffffffffc0201ae2 <default_free_pages+0xc2>
ffffffffc0201a8e:	87ba                	mv	a5,a4
ffffffffc0201a90:	fe878713          	addi	a4,a5,-24
ffffffffc0201a94:	fee57ae3          	bgeu	a0,a4,ffffffffc0201a88 <default_free_pages+0x68>
ffffffffc0201a98:	c199                	beqz	a1,ffffffffc0201a9e <default_free_pages+0x7e>
ffffffffc0201a9a:	0106b023          	sd	a6,0(a3)
ffffffffc0201a9e:	6398                	ld	a4,0(a5)
ffffffffc0201aa0:	e390                	sd	a2,0(a5)
ffffffffc0201aa2:	e710                	sd	a2,8(a4)
ffffffffc0201aa4:	ed18                	sd	a4,24(a0)
ffffffffc0201aa6:	f11c                	sd	a5,32(a0)
ffffffffc0201aa8:	00d70d63          	beq	a4,a3,ffffffffc0201ac2 <default_free_pages+0xa2>
ffffffffc0201aac:	ff872583          	lw	a1,-8(a4)
ffffffffc0201ab0:	fe870613          	addi	a2,a4,-24
ffffffffc0201ab4:	02059813          	slli	a6,a1,0x20
ffffffffc0201ab8:	01a85793          	srli	a5,a6,0x1a
ffffffffc0201abc:	97b2                	add	a5,a5,a2
ffffffffc0201abe:	02f50c63          	beq	a0,a5,ffffffffc0201af6 <default_free_pages+0xd6>
ffffffffc0201ac2:	711c                	ld	a5,32(a0)
ffffffffc0201ac4:	00d78c63          	beq	a5,a3,ffffffffc0201adc <default_free_pages+0xbc>
ffffffffc0201ac8:	4910                	lw	a2,16(a0)
ffffffffc0201aca:	fe878693          	addi	a3,a5,-24
ffffffffc0201ace:	02061593          	slli	a1,a2,0x20
ffffffffc0201ad2:	01a5d713          	srli	a4,a1,0x1a
ffffffffc0201ad6:	972a                	add	a4,a4,a0
ffffffffc0201ad8:	04e68c63          	beq	a3,a4,ffffffffc0201b30 <default_free_pages+0x110>
ffffffffc0201adc:	60a2                	ld	ra,8(sp)
ffffffffc0201ade:	0141                	addi	sp,sp,16
ffffffffc0201ae0:	8082                	ret
ffffffffc0201ae2:	e790                	sd	a2,8(a5)
ffffffffc0201ae4:	f114                	sd	a3,32(a0)
ffffffffc0201ae6:	6798                	ld	a4,8(a5)
ffffffffc0201ae8:	ed1c                	sd	a5,24(a0)
ffffffffc0201aea:	8832                	mv	a6,a2
ffffffffc0201aec:	02d70f63          	beq	a4,a3,ffffffffc0201b2a <default_free_pages+0x10a>
ffffffffc0201af0:	4585                	li	a1,1
ffffffffc0201af2:	87ba                	mv	a5,a4
ffffffffc0201af4:	bf71                	j	ffffffffc0201a90 <default_free_pages+0x70>
ffffffffc0201af6:	491c                	lw	a5,16(a0)
ffffffffc0201af8:	5875                	li	a6,-3
ffffffffc0201afa:	9fad                	addw	a5,a5,a1
ffffffffc0201afc:	fef72c23          	sw	a5,-8(a4)
ffffffffc0201b00:	6108b02f          	amoand.d	zero,a6,(a7)
ffffffffc0201b04:	01853803          	ld	a6,24(a0)
ffffffffc0201b08:	710c                	ld	a1,32(a0)
ffffffffc0201b0a:	8532                	mv	a0,a2
ffffffffc0201b0c:	00b83423          	sd	a1,8(a6)
ffffffffc0201b10:	671c                	ld	a5,8(a4)
ffffffffc0201b12:	0105b023          	sd	a6,0(a1)
ffffffffc0201b16:	b77d                	j	ffffffffc0201ac4 <default_free_pages+0xa4>
ffffffffc0201b18:	60a2                	ld	ra,8(sp)
ffffffffc0201b1a:	01850713          	addi	a4,a0,24
ffffffffc0201b1e:	f11c                	sd	a5,32(a0)
ffffffffc0201b20:	ed1c                	sd	a5,24(a0)
ffffffffc0201b22:	e398                	sd	a4,0(a5)
ffffffffc0201b24:	e798                	sd	a4,8(a5)
ffffffffc0201b26:	0141                	addi	sp,sp,16
ffffffffc0201b28:	8082                	ret
ffffffffc0201b2a:	e290                	sd	a2,0(a3)
ffffffffc0201b2c:	873e                	mv	a4,a5
ffffffffc0201b2e:	bfad                	j	ffffffffc0201aa8 <default_free_pages+0x88>
ffffffffc0201b30:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201b34:	56f5                	li	a3,-3
ffffffffc0201b36:	9f31                	addw	a4,a4,a2
ffffffffc0201b38:	c918                	sw	a4,16(a0)
ffffffffc0201b3a:	ff078713          	addi	a4,a5,-16
ffffffffc0201b3e:	60d7302f          	amoand.d	zero,a3,(a4)
ffffffffc0201b42:	6398                	ld	a4,0(a5)
ffffffffc0201b44:	679c                	ld	a5,8(a5)
ffffffffc0201b46:	60a2                	ld	ra,8(sp)
ffffffffc0201b48:	e71c                	sd	a5,8(a4)
ffffffffc0201b4a:	e398                	sd	a4,0(a5)
ffffffffc0201b4c:	0141                	addi	sp,sp,16
ffffffffc0201b4e:	8082                	ret
ffffffffc0201b50:	0000b697          	auipc	a3,0xb
ffffffffc0201b54:	a2868693          	addi	a3,a3,-1496 # ffffffffc020c578 <etext+0xe64>
ffffffffc0201b58:	0000a617          	auipc	a2,0xa
ffffffffc0201b5c:	ff860613          	addi	a2,a2,-8 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201b60:	08200593          	li	a1,130
ffffffffc0201b64:	0000a517          	auipc	a0,0xa
ffffffffc0201b68:	6cc50513          	addi	a0,a0,1740 # ffffffffc020c230 <etext+0xb1c>
ffffffffc0201b6c:	8dffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201b70:	0000b697          	auipc	a3,0xb
ffffffffc0201b74:	a0068693          	addi	a3,a3,-1536 # ffffffffc020c570 <etext+0xe5c>
ffffffffc0201b78:	0000a617          	auipc	a2,0xa
ffffffffc0201b7c:	fd860613          	addi	a2,a2,-40 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201b80:	07f00593          	li	a1,127
ffffffffc0201b84:	0000a517          	auipc	a0,0xa
ffffffffc0201b88:	6ac50513          	addi	a0,a0,1708 # ffffffffc020c230 <etext+0xb1c>
ffffffffc0201b8c:	8bffe0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0201b90 <default_alloc_pages>:
ffffffffc0201b90:	c951                	beqz	a0,ffffffffc0201c24 <default_alloc_pages+0x94>
ffffffffc0201b92:	00090597          	auipc	a1,0x90
ffffffffc0201b96:	c265a583          	lw	a1,-986(a1) # ffffffffc02917b8 <free_area+0x10>
ffffffffc0201b9a:	86aa                	mv	a3,a0
ffffffffc0201b9c:	02059793          	slli	a5,a1,0x20
ffffffffc0201ba0:	9381                	srli	a5,a5,0x20
ffffffffc0201ba2:	00a7ef63          	bltu	a5,a0,ffffffffc0201bc0 <default_alloc_pages+0x30>
ffffffffc0201ba6:	00090617          	auipc	a2,0x90
ffffffffc0201baa:	c0260613          	addi	a2,a2,-1022 # ffffffffc02917a8 <free_area>
ffffffffc0201bae:	87b2                	mv	a5,a2
ffffffffc0201bb0:	a029                	j	ffffffffc0201bba <default_alloc_pages+0x2a>
ffffffffc0201bb2:	ff87e703          	lwu	a4,-8(a5)
ffffffffc0201bb6:	00d77763          	bgeu	a4,a3,ffffffffc0201bc4 <default_alloc_pages+0x34>
ffffffffc0201bba:	679c                	ld	a5,8(a5)
ffffffffc0201bbc:	fec79be3          	bne	a5,a2,ffffffffc0201bb2 <default_alloc_pages+0x22>
ffffffffc0201bc0:	4501                	li	a0,0
ffffffffc0201bc2:	8082                	ret
ffffffffc0201bc4:	ff87a883          	lw	a7,-8(a5)
ffffffffc0201bc8:	0007b803          	ld	a6,0(a5)
ffffffffc0201bcc:	6798                	ld	a4,8(a5)
ffffffffc0201bce:	02089313          	slli	t1,a7,0x20
ffffffffc0201bd2:	02035313          	srli	t1,t1,0x20
ffffffffc0201bd6:	00e83423          	sd	a4,8(a6)
ffffffffc0201bda:	01073023          	sd	a6,0(a4)
ffffffffc0201bde:	fe878513          	addi	a0,a5,-24
ffffffffc0201be2:	0266fa63          	bgeu	a3,t1,ffffffffc0201c16 <default_alloc_pages+0x86>
ffffffffc0201be6:	00669713          	slli	a4,a3,0x6
ffffffffc0201bea:	40d888bb          	subw	a7,a7,a3
ffffffffc0201bee:	972a                	add	a4,a4,a0
ffffffffc0201bf0:	01172823          	sw	a7,16(a4)
ffffffffc0201bf4:	00870313          	addi	t1,a4,8
ffffffffc0201bf8:	4889                	li	a7,2
ffffffffc0201bfa:	4113302f          	amoor.d	zero,a7,(t1)
ffffffffc0201bfe:	00883883          	ld	a7,8(a6)
ffffffffc0201c02:	01870313          	addi	t1,a4,24
ffffffffc0201c06:	0068b023          	sd	t1,0(a7) # 10000000 <_binary_bin_sfs_img_size+0xff8ad00>
ffffffffc0201c0a:	00683423          	sd	t1,8(a6)
ffffffffc0201c0e:	03173023          	sd	a7,32(a4)
ffffffffc0201c12:	01073c23          	sd	a6,24(a4)
ffffffffc0201c16:	9d95                	subw	a1,a1,a3
ffffffffc0201c18:	ca0c                	sw	a1,16(a2)
ffffffffc0201c1a:	5775                	li	a4,-3
ffffffffc0201c1c:	17c1                	addi	a5,a5,-16
ffffffffc0201c1e:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0201c22:	8082                	ret
ffffffffc0201c24:	1141                	addi	sp,sp,-16
ffffffffc0201c26:	0000b697          	auipc	a3,0xb
ffffffffc0201c2a:	94a68693          	addi	a3,a3,-1718 # ffffffffc020c570 <etext+0xe5c>
ffffffffc0201c2e:	0000a617          	auipc	a2,0xa
ffffffffc0201c32:	f2260613          	addi	a2,a2,-222 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201c36:	06100593          	li	a1,97
ffffffffc0201c3a:	0000a517          	auipc	a0,0xa
ffffffffc0201c3e:	5f650513          	addi	a0,a0,1526 # ffffffffc020c230 <etext+0xb1c>
ffffffffc0201c42:	e406                	sd	ra,8(sp)
ffffffffc0201c44:	807fe0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0201c48 <default_init_memmap>:
ffffffffc0201c48:	1141                	addi	sp,sp,-16
ffffffffc0201c4a:	e406                	sd	ra,8(sp)
ffffffffc0201c4c:	c9e1                	beqz	a1,ffffffffc0201d1c <default_init_memmap+0xd4>
ffffffffc0201c4e:	00659713          	slli	a4,a1,0x6
ffffffffc0201c52:	00e506b3          	add	a3,a0,a4
ffffffffc0201c56:	87aa                	mv	a5,a0
ffffffffc0201c58:	cf11                	beqz	a4,ffffffffc0201c74 <default_init_memmap+0x2c>
ffffffffc0201c5a:	6798                	ld	a4,8(a5)
ffffffffc0201c5c:	8b05                	andi	a4,a4,1
ffffffffc0201c5e:	cf59                	beqz	a4,ffffffffc0201cfc <default_init_memmap+0xb4>
ffffffffc0201c60:	0007a823          	sw	zero,16(a5)
ffffffffc0201c64:	0007b423          	sd	zero,8(a5)
ffffffffc0201c68:	0007a023          	sw	zero,0(a5)
ffffffffc0201c6c:	04078793          	addi	a5,a5,64
ffffffffc0201c70:	fed795e3          	bne	a5,a3,ffffffffc0201c5a <default_init_memmap+0x12>
ffffffffc0201c74:	c90c                	sw	a1,16(a0)
ffffffffc0201c76:	4789                	li	a5,2
ffffffffc0201c78:	00850713          	addi	a4,a0,8
ffffffffc0201c7c:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0201c80:	00090717          	auipc	a4,0x90
ffffffffc0201c84:	b3872703          	lw	a4,-1224(a4) # ffffffffc02917b8 <free_area+0x10>
ffffffffc0201c88:	00090697          	auipc	a3,0x90
ffffffffc0201c8c:	b2068693          	addi	a3,a3,-1248 # ffffffffc02917a8 <free_area>
ffffffffc0201c90:	669c                	ld	a5,8(a3)
ffffffffc0201c92:	9f2d                	addw	a4,a4,a1
ffffffffc0201c94:	ca98                	sw	a4,16(a3)
ffffffffc0201c96:	04d78663          	beq	a5,a3,ffffffffc0201ce2 <default_init_memmap+0x9a>
ffffffffc0201c9a:	fe878713          	addi	a4,a5,-24
ffffffffc0201c9e:	4581                	li	a1,0
ffffffffc0201ca0:	01850613          	addi	a2,a0,24
ffffffffc0201ca4:	00e56a63          	bltu	a0,a4,ffffffffc0201cb8 <default_init_memmap+0x70>
ffffffffc0201ca8:	6798                	ld	a4,8(a5)
ffffffffc0201caa:	02d70263          	beq	a4,a3,ffffffffc0201cce <default_init_memmap+0x86>
ffffffffc0201cae:	87ba                	mv	a5,a4
ffffffffc0201cb0:	fe878713          	addi	a4,a5,-24
ffffffffc0201cb4:	fee57ae3          	bgeu	a0,a4,ffffffffc0201ca8 <default_init_memmap+0x60>
ffffffffc0201cb8:	c199                	beqz	a1,ffffffffc0201cbe <default_init_memmap+0x76>
ffffffffc0201cba:	0106b023          	sd	a6,0(a3)
ffffffffc0201cbe:	6398                	ld	a4,0(a5)
ffffffffc0201cc0:	60a2                	ld	ra,8(sp)
ffffffffc0201cc2:	e390                	sd	a2,0(a5)
ffffffffc0201cc4:	e710                	sd	a2,8(a4)
ffffffffc0201cc6:	ed18                	sd	a4,24(a0)
ffffffffc0201cc8:	f11c                	sd	a5,32(a0)
ffffffffc0201cca:	0141                	addi	sp,sp,16
ffffffffc0201ccc:	8082                	ret
ffffffffc0201cce:	e790                	sd	a2,8(a5)
ffffffffc0201cd0:	f114                	sd	a3,32(a0)
ffffffffc0201cd2:	6798                	ld	a4,8(a5)
ffffffffc0201cd4:	ed1c                	sd	a5,24(a0)
ffffffffc0201cd6:	8832                	mv	a6,a2
ffffffffc0201cd8:	00d70e63          	beq	a4,a3,ffffffffc0201cf4 <default_init_memmap+0xac>
ffffffffc0201cdc:	4585                	li	a1,1
ffffffffc0201cde:	87ba                	mv	a5,a4
ffffffffc0201ce0:	bfc1                	j	ffffffffc0201cb0 <default_init_memmap+0x68>
ffffffffc0201ce2:	60a2                	ld	ra,8(sp)
ffffffffc0201ce4:	01850713          	addi	a4,a0,24
ffffffffc0201ce8:	f11c                	sd	a5,32(a0)
ffffffffc0201cea:	ed1c                	sd	a5,24(a0)
ffffffffc0201cec:	e398                	sd	a4,0(a5)
ffffffffc0201cee:	e798                	sd	a4,8(a5)
ffffffffc0201cf0:	0141                	addi	sp,sp,16
ffffffffc0201cf2:	8082                	ret
ffffffffc0201cf4:	60a2                	ld	ra,8(sp)
ffffffffc0201cf6:	e290                	sd	a2,0(a3)
ffffffffc0201cf8:	0141                	addi	sp,sp,16
ffffffffc0201cfa:	8082                	ret
ffffffffc0201cfc:	0000b697          	auipc	a3,0xb
ffffffffc0201d00:	8a468693          	addi	a3,a3,-1884 # ffffffffc020c5a0 <etext+0xe8c>
ffffffffc0201d04:	0000a617          	auipc	a2,0xa
ffffffffc0201d08:	e4c60613          	addi	a2,a2,-436 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201d0c:	04800593          	li	a1,72
ffffffffc0201d10:	0000a517          	auipc	a0,0xa
ffffffffc0201d14:	52050513          	addi	a0,a0,1312 # ffffffffc020c230 <etext+0xb1c>
ffffffffc0201d18:	f32fe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201d1c:	0000b697          	auipc	a3,0xb
ffffffffc0201d20:	85468693          	addi	a3,a3,-1964 # ffffffffc020c570 <etext+0xe5c>
ffffffffc0201d24:	0000a617          	auipc	a2,0xa
ffffffffc0201d28:	e2c60613          	addi	a2,a2,-468 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201d2c:	04500593          	li	a1,69
ffffffffc0201d30:	0000a517          	auipc	a0,0xa
ffffffffc0201d34:	50050513          	addi	a0,a0,1280 # ffffffffc020c230 <etext+0xb1c>
ffffffffc0201d38:	f12fe0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0201d3c <slob_free>:
ffffffffc0201d3c:	c531                	beqz	a0,ffffffffc0201d88 <slob_free+0x4c>
ffffffffc0201d3e:	e9b9                	bnez	a1,ffffffffc0201d94 <slob_free+0x58>
ffffffffc0201d40:	100027f3          	csrr	a5,sstatus
ffffffffc0201d44:	8b89                	andi	a5,a5,2
ffffffffc0201d46:	4581                	li	a1,0
ffffffffc0201d48:	efb1                	bnez	a5,ffffffffc0201da4 <slob_free+0x68>
ffffffffc0201d4a:	0008f797          	auipc	a5,0x8f
ffffffffc0201d4e:	3067b783          	ld	a5,774(a5) # ffffffffc0291050 <slobfree>
ffffffffc0201d52:	873e                	mv	a4,a5
ffffffffc0201d54:	679c                	ld	a5,8(a5)
ffffffffc0201d56:	02a77a63          	bgeu	a4,a0,ffffffffc0201d8a <slob_free+0x4e>
ffffffffc0201d5a:	00f56463          	bltu	a0,a5,ffffffffc0201d62 <slob_free+0x26>
ffffffffc0201d5e:	fef76ae3          	bltu	a4,a5,ffffffffc0201d52 <slob_free+0x16>
ffffffffc0201d62:	4110                	lw	a2,0(a0)
ffffffffc0201d64:	00461693          	slli	a3,a2,0x4
ffffffffc0201d68:	96aa                	add	a3,a3,a0
ffffffffc0201d6a:	0ad78463          	beq	a5,a3,ffffffffc0201e12 <slob_free+0xd6>
ffffffffc0201d6e:	4310                	lw	a2,0(a4)
ffffffffc0201d70:	e51c                	sd	a5,8(a0)
ffffffffc0201d72:	00461693          	slli	a3,a2,0x4
ffffffffc0201d76:	96ba                	add	a3,a3,a4
ffffffffc0201d78:	08d50163          	beq	a0,a3,ffffffffc0201dfa <slob_free+0xbe>
ffffffffc0201d7c:	e708                	sd	a0,8(a4)
ffffffffc0201d7e:	0008f797          	auipc	a5,0x8f
ffffffffc0201d82:	2ce7b923          	sd	a4,722(a5) # ffffffffc0291050 <slobfree>
ffffffffc0201d86:	e9a5                	bnez	a1,ffffffffc0201df6 <slob_free+0xba>
ffffffffc0201d88:	8082                	ret
ffffffffc0201d8a:	fcf574e3          	bgeu	a0,a5,ffffffffc0201d52 <slob_free+0x16>
ffffffffc0201d8e:	fcf762e3          	bltu	a4,a5,ffffffffc0201d52 <slob_free+0x16>
ffffffffc0201d92:	bfc1                	j	ffffffffc0201d62 <slob_free+0x26>
ffffffffc0201d94:	25bd                	addiw	a1,a1,15
ffffffffc0201d96:	8191                	srli	a1,a1,0x4
ffffffffc0201d98:	c10c                	sw	a1,0(a0)
ffffffffc0201d9a:	100027f3          	csrr	a5,sstatus
ffffffffc0201d9e:	8b89                	andi	a5,a5,2
ffffffffc0201da0:	4581                	li	a1,0
ffffffffc0201da2:	d7c5                	beqz	a5,ffffffffc0201d4a <slob_free+0xe>
ffffffffc0201da4:	1101                	addi	sp,sp,-32
ffffffffc0201da6:	e42a                	sd	a0,8(sp)
ffffffffc0201da8:	ec06                	sd	ra,24(sp)
ffffffffc0201daa:	e2ffe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0201dae:	6522                	ld	a0,8(sp)
ffffffffc0201db0:	0008f797          	auipc	a5,0x8f
ffffffffc0201db4:	2a07b783          	ld	a5,672(a5) # ffffffffc0291050 <slobfree>
ffffffffc0201db8:	4585                	li	a1,1
ffffffffc0201dba:	873e                	mv	a4,a5
ffffffffc0201dbc:	679c                	ld	a5,8(a5)
ffffffffc0201dbe:	06a77663          	bgeu	a4,a0,ffffffffc0201e2a <slob_free+0xee>
ffffffffc0201dc2:	00f56463          	bltu	a0,a5,ffffffffc0201dca <slob_free+0x8e>
ffffffffc0201dc6:	fef76ae3          	bltu	a4,a5,ffffffffc0201dba <slob_free+0x7e>
ffffffffc0201dca:	4110                	lw	a2,0(a0)
ffffffffc0201dcc:	00461693          	slli	a3,a2,0x4
ffffffffc0201dd0:	96aa                	add	a3,a3,a0
ffffffffc0201dd2:	06d78363          	beq	a5,a3,ffffffffc0201e38 <slob_free+0xfc>
ffffffffc0201dd6:	4310                	lw	a2,0(a4)
ffffffffc0201dd8:	e51c                	sd	a5,8(a0)
ffffffffc0201dda:	00461693          	slli	a3,a2,0x4
ffffffffc0201dde:	96ba                	add	a3,a3,a4
ffffffffc0201de0:	06d50163          	beq	a0,a3,ffffffffc0201e42 <slob_free+0x106>
ffffffffc0201de4:	e708                	sd	a0,8(a4)
ffffffffc0201de6:	0008f797          	auipc	a5,0x8f
ffffffffc0201dea:	26e7b523          	sd	a4,618(a5) # ffffffffc0291050 <slobfree>
ffffffffc0201dee:	e1a9                	bnez	a1,ffffffffc0201e30 <slob_free+0xf4>
ffffffffc0201df0:	60e2                	ld	ra,24(sp)
ffffffffc0201df2:	6105                	addi	sp,sp,32
ffffffffc0201df4:	8082                	ret
ffffffffc0201df6:	dddfe06f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc0201dfa:	4114                	lw	a3,0(a0)
ffffffffc0201dfc:	853e                	mv	a0,a5
ffffffffc0201dfe:	e708                	sd	a0,8(a4)
ffffffffc0201e00:	00c687bb          	addw	a5,a3,a2
ffffffffc0201e04:	c31c                	sw	a5,0(a4)
ffffffffc0201e06:	0008f797          	auipc	a5,0x8f
ffffffffc0201e0a:	24e7b523          	sd	a4,586(a5) # ffffffffc0291050 <slobfree>
ffffffffc0201e0e:	ddad                	beqz	a1,ffffffffc0201d88 <slob_free+0x4c>
ffffffffc0201e10:	b7dd                	j	ffffffffc0201df6 <slob_free+0xba>
ffffffffc0201e12:	4394                	lw	a3,0(a5)
ffffffffc0201e14:	679c                	ld	a5,8(a5)
ffffffffc0201e16:	9eb1                	addw	a3,a3,a2
ffffffffc0201e18:	c114                	sw	a3,0(a0)
ffffffffc0201e1a:	4310                	lw	a2,0(a4)
ffffffffc0201e1c:	e51c                	sd	a5,8(a0)
ffffffffc0201e1e:	00461693          	slli	a3,a2,0x4
ffffffffc0201e22:	96ba                	add	a3,a3,a4
ffffffffc0201e24:	f4d51ce3          	bne	a0,a3,ffffffffc0201d7c <slob_free+0x40>
ffffffffc0201e28:	bfc9                	j	ffffffffc0201dfa <slob_free+0xbe>
ffffffffc0201e2a:	f8f56ee3          	bltu	a0,a5,ffffffffc0201dc6 <slob_free+0x8a>
ffffffffc0201e2e:	b771                	j	ffffffffc0201dba <slob_free+0x7e>
ffffffffc0201e30:	60e2                	ld	ra,24(sp)
ffffffffc0201e32:	6105                	addi	sp,sp,32
ffffffffc0201e34:	d9ffe06f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc0201e38:	4394                	lw	a3,0(a5)
ffffffffc0201e3a:	679c                	ld	a5,8(a5)
ffffffffc0201e3c:	9eb1                	addw	a3,a3,a2
ffffffffc0201e3e:	c114                	sw	a3,0(a0)
ffffffffc0201e40:	bf59                	j	ffffffffc0201dd6 <slob_free+0x9a>
ffffffffc0201e42:	4114                	lw	a3,0(a0)
ffffffffc0201e44:	853e                	mv	a0,a5
ffffffffc0201e46:	00c687bb          	addw	a5,a3,a2
ffffffffc0201e4a:	c31c                	sw	a5,0(a4)
ffffffffc0201e4c:	bf61                	j	ffffffffc0201de4 <slob_free+0xa8>

ffffffffc0201e4e <__slob_get_free_pages.constprop.0>:
ffffffffc0201e4e:	4785                	li	a5,1
ffffffffc0201e50:	1141                	addi	sp,sp,-16
ffffffffc0201e52:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201e56:	e406                	sd	ra,8(sp)
ffffffffc0201e58:	32c000ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc0201e5c:	c91d                	beqz	a0,ffffffffc0201e92 <__slob_get_free_pages.constprop.0+0x44>
ffffffffc0201e5e:	00095697          	auipc	a3,0x95
ffffffffc0201e62:	a5a6b683          	ld	a3,-1446(a3) # ffffffffc02968b8 <pages>
ffffffffc0201e66:	0000e797          	auipc	a5,0xe
ffffffffc0201e6a:	a6a7b783          	ld	a5,-1430(a5) # ffffffffc020f8d0 <nbase>
ffffffffc0201e6e:	00095717          	auipc	a4,0x95
ffffffffc0201e72:	a4273703          	ld	a4,-1470(a4) # ffffffffc02968b0 <npage>
ffffffffc0201e76:	8d15                	sub	a0,a0,a3
ffffffffc0201e78:	8519                	srai	a0,a0,0x6
ffffffffc0201e7a:	953e                	add	a0,a0,a5
ffffffffc0201e7c:	00c51793          	slli	a5,a0,0xc
ffffffffc0201e80:	83b1                	srli	a5,a5,0xc
ffffffffc0201e82:	0532                	slli	a0,a0,0xc
ffffffffc0201e84:	00e7fa63          	bgeu	a5,a4,ffffffffc0201e98 <__slob_get_free_pages.constprop.0+0x4a>
ffffffffc0201e88:	00095797          	auipc	a5,0x95
ffffffffc0201e8c:	a207b783          	ld	a5,-1504(a5) # ffffffffc02968a8 <va_pa_offset>
ffffffffc0201e90:	953e                	add	a0,a0,a5
ffffffffc0201e92:	60a2                	ld	ra,8(sp)
ffffffffc0201e94:	0141                	addi	sp,sp,16
ffffffffc0201e96:	8082                	ret
ffffffffc0201e98:	86aa                	mv	a3,a0
ffffffffc0201e9a:	0000a617          	auipc	a2,0xa
ffffffffc0201e9e:	72e60613          	addi	a2,a2,1838 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc0201ea2:	07100593          	li	a1,113
ffffffffc0201ea6:	0000a517          	auipc	a0,0xa
ffffffffc0201eaa:	74a50513          	addi	a0,a0,1866 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc0201eae:	d9cfe0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0201eb2 <slob_alloc.constprop.0>:
ffffffffc0201eb2:	7179                	addi	sp,sp,-48
ffffffffc0201eb4:	f406                	sd	ra,40(sp)
ffffffffc0201eb6:	f022                	sd	s0,32(sp)
ffffffffc0201eb8:	ec26                	sd	s1,24(sp)
ffffffffc0201eba:	01050713          	addi	a4,a0,16
ffffffffc0201ebe:	6785                	lui	a5,0x1
ffffffffc0201ec0:	0af77e63          	bgeu	a4,a5,ffffffffc0201f7c <slob_alloc.constprop.0+0xca>
ffffffffc0201ec4:	00f50413          	addi	s0,a0,15
ffffffffc0201ec8:	8011                	srli	s0,s0,0x4
ffffffffc0201eca:	2401                	sext.w	s0,s0
ffffffffc0201ecc:	100025f3          	csrr	a1,sstatus
ffffffffc0201ed0:	8989                	andi	a1,a1,2
ffffffffc0201ed2:	edd1                	bnez	a1,ffffffffc0201f6e <slob_alloc.constprop.0+0xbc>
ffffffffc0201ed4:	0008f497          	auipc	s1,0x8f
ffffffffc0201ed8:	17c48493          	addi	s1,s1,380 # ffffffffc0291050 <slobfree>
ffffffffc0201edc:	6090                	ld	a2,0(s1)
ffffffffc0201ede:	6618                	ld	a4,8(a2)
ffffffffc0201ee0:	4314                	lw	a3,0(a4)
ffffffffc0201ee2:	0886da63          	bge	a3,s0,ffffffffc0201f76 <slob_alloc.constprop.0+0xc4>
ffffffffc0201ee6:	00e60a63          	beq	a2,a4,ffffffffc0201efa <slob_alloc.constprop.0+0x48>
ffffffffc0201eea:	671c                	ld	a5,8(a4)
ffffffffc0201eec:	4394                	lw	a3,0(a5)
ffffffffc0201eee:	0286d863          	bge	a3,s0,ffffffffc0201f1e <slob_alloc.constprop.0+0x6c>
ffffffffc0201ef2:	6090                	ld	a2,0(s1)
ffffffffc0201ef4:	873e                	mv	a4,a5
ffffffffc0201ef6:	fee61ae3          	bne	a2,a4,ffffffffc0201eea <slob_alloc.constprop.0+0x38>
ffffffffc0201efa:	e9b1                	bnez	a1,ffffffffc0201f4e <slob_alloc.constprop.0+0x9c>
ffffffffc0201efc:	4501                	li	a0,0
ffffffffc0201efe:	f51ff0ef          	jal	ffffffffc0201e4e <__slob_get_free_pages.constprop.0>
ffffffffc0201f02:	87aa                	mv	a5,a0
ffffffffc0201f04:	c915                	beqz	a0,ffffffffc0201f38 <slob_alloc.constprop.0+0x86>
ffffffffc0201f06:	6585                	lui	a1,0x1
ffffffffc0201f08:	e35ff0ef          	jal	ffffffffc0201d3c <slob_free>
ffffffffc0201f0c:	100025f3          	csrr	a1,sstatus
ffffffffc0201f10:	8989                	andi	a1,a1,2
ffffffffc0201f12:	e98d                	bnez	a1,ffffffffc0201f44 <slob_alloc.constprop.0+0x92>
ffffffffc0201f14:	6098                	ld	a4,0(s1)
ffffffffc0201f16:	671c                	ld	a5,8(a4)
ffffffffc0201f18:	4394                	lw	a3,0(a5)
ffffffffc0201f1a:	fc86cce3          	blt	a3,s0,ffffffffc0201ef2 <slob_alloc.constprop.0+0x40>
ffffffffc0201f1e:	04d40563          	beq	s0,a3,ffffffffc0201f68 <slob_alloc.constprop.0+0xb6>
ffffffffc0201f22:	00441613          	slli	a2,s0,0x4
ffffffffc0201f26:	963e                	add	a2,a2,a5
ffffffffc0201f28:	e710                	sd	a2,8(a4)
ffffffffc0201f2a:	6788                	ld	a0,8(a5)
ffffffffc0201f2c:	9e81                	subw	a3,a3,s0
ffffffffc0201f2e:	c214                	sw	a3,0(a2)
ffffffffc0201f30:	e608                	sd	a0,8(a2)
ffffffffc0201f32:	c380                	sw	s0,0(a5)
ffffffffc0201f34:	e098                	sd	a4,0(s1)
ffffffffc0201f36:	ed99                	bnez	a1,ffffffffc0201f54 <slob_alloc.constprop.0+0xa2>
ffffffffc0201f38:	70a2                	ld	ra,40(sp)
ffffffffc0201f3a:	7402                	ld	s0,32(sp)
ffffffffc0201f3c:	64e2                	ld	s1,24(sp)
ffffffffc0201f3e:	853e                	mv	a0,a5
ffffffffc0201f40:	6145                	addi	sp,sp,48
ffffffffc0201f42:	8082                	ret
ffffffffc0201f44:	c95fe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0201f48:	6098                	ld	a4,0(s1)
ffffffffc0201f4a:	4585                	li	a1,1
ffffffffc0201f4c:	b7e9                	j	ffffffffc0201f16 <slob_alloc.constprop.0+0x64>
ffffffffc0201f4e:	c85fe0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0201f52:	b76d                	j	ffffffffc0201efc <slob_alloc.constprop.0+0x4a>
ffffffffc0201f54:	e43e                	sd	a5,8(sp)
ffffffffc0201f56:	c7dfe0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0201f5a:	67a2                	ld	a5,8(sp)
ffffffffc0201f5c:	70a2                	ld	ra,40(sp)
ffffffffc0201f5e:	7402                	ld	s0,32(sp)
ffffffffc0201f60:	64e2                	ld	s1,24(sp)
ffffffffc0201f62:	853e                	mv	a0,a5
ffffffffc0201f64:	6145                	addi	sp,sp,48
ffffffffc0201f66:	8082                	ret
ffffffffc0201f68:	6794                	ld	a3,8(a5)
ffffffffc0201f6a:	e714                	sd	a3,8(a4)
ffffffffc0201f6c:	b7e1                	j	ffffffffc0201f34 <slob_alloc.constprop.0+0x82>
ffffffffc0201f6e:	c6bfe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0201f72:	4585                	li	a1,1
ffffffffc0201f74:	b785                	j	ffffffffc0201ed4 <slob_alloc.constprop.0+0x22>
ffffffffc0201f76:	87ba                	mv	a5,a4
ffffffffc0201f78:	8732                	mv	a4,a2
ffffffffc0201f7a:	b755                	j	ffffffffc0201f1e <slob_alloc.constprop.0+0x6c>
ffffffffc0201f7c:	0000a697          	auipc	a3,0xa
ffffffffc0201f80:	68468693          	addi	a3,a3,1668 # ffffffffc020c600 <etext+0xeec>
ffffffffc0201f84:	0000a617          	auipc	a2,0xa
ffffffffc0201f88:	bcc60613          	addi	a2,a2,-1076 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0201f8c:	06300593          	li	a1,99
ffffffffc0201f90:	0000a517          	auipc	a0,0xa
ffffffffc0201f94:	69050513          	addi	a0,a0,1680 # ffffffffc020c620 <etext+0xf0c>
ffffffffc0201f98:	cb2fe0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0201f9c <kmalloc_init>:
ffffffffc0201f9c:	1141                	addi	sp,sp,-16
ffffffffc0201f9e:	0000a517          	auipc	a0,0xa
ffffffffc0201fa2:	69a50513          	addi	a0,a0,1690 # ffffffffc020c638 <etext+0xf24>
ffffffffc0201fa6:	e406                	sd	ra,8(sp)
ffffffffc0201fa8:	9fefe0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0201fac:	60a2                	ld	ra,8(sp)
ffffffffc0201fae:	0000a517          	auipc	a0,0xa
ffffffffc0201fb2:	6a250513          	addi	a0,a0,1698 # ffffffffc020c650 <etext+0xf3c>
ffffffffc0201fb6:	0141                	addi	sp,sp,16
ffffffffc0201fb8:	9eefe06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0201fbc <kallocated>:
ffffffffc0201fbc:	4501                	li	a0,0
ffffffffc0201fbe:	8082                	ret

ffffffffc0201fc0 <kmalloc>:
ffffffffc0201fc0:	1101                	addi	sp,sp,-32
ffffffffc0201fc2:	6685                	lui	a3,0x1
ffffffffc0201fc4:	ec06                	sd	ra,24(sp)
ffffffffc0201fc6:	16bd                	addi	a3,a3,-17 # fef <_binary_bin_swap_img_size-0x6d11>
ffffffffc0201fc8:	04a6f963          	bgeu	a3,a0,ffffffffc020201a <kmalloc+0x5a>
ffffffffc0201fcc:	e42a                	sd	a0,8(sp)
ffffffffc0201fce:	4561                	li	a0,24
ffffffffc0201fd0:	e822                	sd	s0,16(sp)
ffffffffc0201fd2:	ee1ff0ef          	jal	ffffffffc0201eb2 <slob_alloc.constprop.0>
ffffffffc0201fd6:	842a                	mv	s0,a0
ffffffffc0201fd8:	c541                	beqz	a0,ffffffffc0202060 <kmalloc+0xa0>
ffffffffc0201fda:	47a2                	lw	a5,8(sp)
ffffffffc0201fdc:	6705                	lui	a4,0x1
ffffffffc0201fde:	4501                	li	a0,0
ffffffffc0201fe0:	00f75763          	bge	a4,a5,ffffffffc0201fee <kmalloc+0x2e>
ffffffffc0201fe4:	4017d79b          	sraiw	a5,a5,0x1
ffffffffc0201fe8:	2505                	addiw	a0,a0,1
ffffffffc0201fea:	fef74de3          	blt	a4,a5,ffffffffc0201fe4 <kmalloc+0x24>
ffffffffc0201fee:	c008                	sw	a0,0(s0)
ffffffffc0201ff0:	e5fff0ef          	jal	ffffffffc0201e4e <__slob_get_free_pages.constprop.0>
ffffffffc0201ff4:	e408                	sd	a0,8(s0)
ffffffffc0201ff6:	cd31                	beqz	a0,ffffffffc0202052 <kmalloc+0x92>
ffffffffc0201ff8:	100027f3          	csrr	a5,sstatus
ffffffffc0201ffc:	8b89                	andi	a5,a5,2
ffffffffc0201ffe:	eb85                	bnez	a5,ffffffffc020202e <kmalloc+0x6e>
ffffffffc0202000:	00095797          	auipc	a5,0x95
ffffffffc0202004:	8887b783          	ld	a5,-1912(a5) # ffffffffc0296888 <bigblocks>
ffffffffc0202008:	00095717          	auipc	a4,0x95
ffffffffc020200c:	88873023          	sd	s0,-1920(a4) # ffffffffc0296888 <bigblocks>
ffffffffc0202010:	e81c                	sd	a5,16(s0)
ffffffffc0202012:	6442                	ld	s0,16(sp)
ffffffffc0202014:	60e2                	ld	ra,24(sp)
ffffffffc0202016:	6105                	addi	sp,sp,32
ffffffffc0202018:	8082                	ret
ffffffffc020201a:	0541                	addi	a0,a0,16
ffffffffc020201c:	e97ff0ef          	jal	ffffffffc0201eb2 <slob_alloc.constprop.0>
ffffffffc0202020:	87aa                	mv	a5,a0
ffffffffc0202022:	0541                	addi	a0,a0,16
ffffffffc0202024:	fbe5                	bnez	a5,ffffffffc0202014 <kmalloc+0x54>
ffffffffc0202026:	4501                	li	a0,0
ffffffffc0202028:	60e2                	ld	ra,24(sp)
ffffffffc020202a:	6105                	addi	sp,sp,32
ffffffffc020202c:	8082                	ret
ffffffffc020202e:	babfe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0202032:	00095797          	auipc	a5,0x95
ffffffffc0202036:	8567b783          	ld	a5,-1962(a5) # ffffffffc0296888 <bigblocks>
ffffffffc020203a:	00095717          	auipc	a4,0x95
ffffffffc020203e:	84873723          	sd	s0,-1970(a4) # ffffffffc0296888 <bigblocks>
ffffffffc0202042:	e81c                	sd	a5,16(s0)
ffffffffc0202044:	b8ffe0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0202048:	6408                	ld	a0,8(s0)
ffffffffc020204a:	60e2                	ld	ra,24(sp)
ffffffffc020204c:	6442                	ld	s0,16(sp)
ffffffffc020204e:	6105                	addi	sp,sp,32
ffffffffc0202050:	8082                	ret
ffffffffc0202052:	8522                	mv	a0,s0
ffffffffc0202054:	45e1                	li	a1,24
ffffffffc0202056:	ce7ff0ef          	jal	ffffffffc0201d3c <slob_free>
ffffffffc020205a:	4501                	li	a0,0
ffffffffc020205c:	6442                	ld	s0,16(sp)
ffffffffc020205e:	b7e9                	j	ffffffffc0202028 <kmalloc+0x68>
ffffffffc0202060:	6442                	ld	s0,16(sp)
ffffffffc0202062:	4501                	li	a0,0
ffffffffc0202064:	b7d1                	j	ffffffffc0202028 <kmalloc+0x68>

ffffffffc0202066 <kfree>:
ffffffffc0202066:	c579                	beqz	a0,ffffffffc0202134 <kfree+0xce>
ffffffffc0202068:	03451793          	slli	a5,a0,0x34
ffffffffc020206c:	e3e1                	bnez	a5,ffffffffc020212c <kfree+0xc6>
ffffffffc020206e:	1101                	addi	sp,sp,-32
ffffffffc0202070:	ec06                	sd	ra,24(sp)
ffffffffc0202072:	100027f3          	csrr	a5,sstatus
ffffffffc0202076:	8b89                	andi	a5,a5,2
ffffffffc0202078:	e7c1                	bnez	a5,ffffffffc0202100 <kfree+0x9a>
ffffffffc020207a:	00095797          	auipc	a5,0x95
ffffffffc020207e:	80e7b783          	ld	a5,-2034(a5) # ffffffffc0296888 <bigblocks>
ffffffffc0202082:	4581                	li	a1,0
ffffffffc0202084:	cbad                	beqz	a5,ffffffffc02020f6 <kfree+0x90>
ffffffffc0202086:	00095617          	auipc	a2,0x95
ffffffffc020208a:	80260613          	addi	a2,a2,-2046 # ffffffffc0296888 <bigblocks>
ffffffffc020208e:	a021                	j	ffffffffc0202096 <kfree+0x30>
ffffffffc0202090:	01070613          	addi	a2,a4,16
ffffffffc0202094:	c3a5                	beqz	a5,ffffffffc02020f4 <kfree+0x8e>
ffffffffc0202096:	6794                	ld	a3,8(a5)
ffffffffc0202098:	873e                	mv	a4,a5
ffffffffc020209a:	6b9c                	ld	a5,16(a5)
ffffffffc020209c:	fea69ae3          	bne	a3,a0,ffffffffc0202090 <kfree+0x2a>
ffffffffc02020a0:	e21c                	sd	a5,0(a2)
ffffffffc02020a2:	edb5                	bnez	a1,ffffffffc020211e <kfree+0xb8>
ffffffffc02020a4:	c02007b7          	lui	a5,0xc0200
ffffffffc02020a8:	0af56363          	bltu	a0,a5,ffffffffc020214e <kfree+0xe8>
ffffffffc02020ac:	00094797          	auipc	a5,0x94
ffffffffc02020b0:	7fc7b783          	ld	a5,2044(a5) # ffffffffc02968a8 <va_pa_offset>
ffffffffc02020b4:	00094697          	auipc	a3,0x94
ffffffffc02020b8:	7fc6b683          	ld	a3,2044(a3) # ffffffffc02968b0 <npage>
ffffffffc02020bc:	8d1d                	sub	a0,a0,a5
ffffffffc02020be:	00c55793          	srli	a5,a0,0xc
ffffffffc02020c2:	06d7fa63          	bgeu	a5,a3,ffffffffc0202136 <kfree+0xd0>
ffffffffc02020c6:	0000e617          	auipc	a2,0xe
ffffffffc02020ca:	80a63603          	ld	a2,-2038(a2) # ffffffffc020f8d0 <nbase>
ffffffffc02020ce:	00094517          	auipc	a0,0x94
ffffffffc02020d2:	7ea53503          	ld	a0,2026(a0) # ffffffffc02968b8 <pages>
ffffffffc02020d6:	4314                	lw	a3,0(a4)
ffffffffc02020d8:	8f91                	sub	a5,a5,a2
ffffffffc02020da:	079a                	slli	a5,a5,0x6
ffffffffc02020dc:	4585                	li	a1,1
ffffffffc02020de:	953e                	add	a0,a0,a5
ffffffffc02020e0:	00d595bb          	sllw	a1,a1,a3
ffffffffc02020e4:	e03a                	sd	a4,0(sp)
ffffffffc02020e6:	0d8000ef          	jal	ffffffffc02021be <free_pages>
ffffffffc02020ea:	6502                	ld	a0,0(sp)
ffffffffc02020ec:	60e2                	ld	ra,24(sp)
ffffffffc02020ee:	45e1                	li	a1,24
ffffffffc02020f0:	6105                	addi	sp,sp,32
ffffffffc02020f2:	b1a9                	j	ffffffffc0201d3c <slob_free>
ffffffffc02020f4:	e185                	bnez	a1,ffffffffc0202114 <kfree+0xae>
ffffffffc02020f6:	60e2                	ld	ra,24(sp)
ffffffffc02020f8:	1541                	addi	a0,a0,-16
ffffffffc02020fa:	4581                	li	a1,0
ffffffffc02020fc:	6105                	addi	sp,sp,32
ffffffffc02020fe:	b93d                	j	ffffffffc0201d3c <slob_free>
ffffffffc0202100:	e02a                	sd	a0,0(sp)
ffffffffc0202102:	ad7fe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0202106:	00094797          	auipc	a5,0x94
ffffffffc020210a:	7827b783          	ld	a5,1922(a5) # ffffffffc0296888 <bigblocks>
ffffffffc020210e:	6502                	ld	a0,0(sp)
ffffffffc0202110:	4585                	li	a1,1
ffffffffc0202112:	fbb5                	bnez	a5,ffffffffc0202086 <kfree+0x20>
ffffffffc0202114:	e02a                	sd	a0,0(sp)
ffffffffc0202116:	abdfe0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc020211a:	6502                	ld	a0,0(sp)
ffffffffc020211c:	bfe9                	j	ffffffffc02020f6 <kfree+0x90>
ffffffffc020211e:	e42a                	sd	a0,8(sp)
ffffffffc0202120:	e03a                	sd	a4,0(sp)
ffffffffc0202122:	ab1fe0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0202126:	6522                	ld	a0,8(sp)
ffffffffc0202128:	6702                	ld	a4,0(sp)
ffffffffc020212a:	bfad                	j	ffffffffc02020a4 <kfree+0x3e>
ffffffffc020212c:	1541                	addi	a0,a0,-16
ffffffffc020212e:	4581                	li	a1,0
ffffffffc0202130:	c0dff06f          	j	ffffffffc0201d3c <slob_free>
ffffffffc0202134:	8082                	ret
ffffffffc0202136:	0000a617          	auipc	a2,0xa
ffffffffc020213a:	56260613          	addi	a2,a2,1378 # ffffffffc020c698 <etext+0xf84>
ffffffffc020213e:	06900593          	li	a1,105
ffffffffc0202142:	0000a517          	auipc	a0,0xa
ffffffffc0202146:	4ae50513          	addi	a0,a0,1198 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc020214a:	b00fe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020214e:	86aa                	mv	a3,a0
ffffffffc0202150:	0000a617          	auipc	a2,0xa
ffffffffc0202154:	52060613          	addi	a2,a2,1312 # ffffffffc020c670 <etext+0xf5c>
ffffffffc0202158:	07700593          	li	a1,119
ffffffffc020215c:	0000a517          	auipc	a0,0xa
ffffffffc0202160:	49450513          	addi	a0,a0,1172 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc0202164:	ae6fe0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0202168 <pa2page.part.0>:
ffffffffc0202168:	1141                	addi	sp,sp,-16
ffffffffc020216a:	0000a617          	auipc	a2,0xa
ffffffffc020216e:	52e60613          	addi	a2,a2,1326 # ffffffffc020c698 <etext+0xf84>
ffffffffc0202172:	06900593          	li	a1,105
ffffffffc0202176:	0000a517          	auipc	a0,0xa
ffffffffc020217a:	47a50513          	addi	a0,a0,1146 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc020217e:	e406                	sd	ra,8(sp)
ffffffffc0202180:	acafe0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0202184 <alloc_pages>:
ffffffffc0202184:	100027f3          	csrr	a5,sstatus
ffffffffc0202188:	8b89                	andi	a5,a5,2
ffffffffc020218a:	e799                	bnez	a5,ffffffffc0202198 <alloc_pages+0x14>
ffffffffc020218c:	00094797          	auipc	a5,0x94
ffffffffc0202190:	7047b783          	ld	a5,1796(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc0202194:	6f9c                	ld	a5,24(a5)
ffffffffc0202196:	8782                	jr	a5
ffffffffc0202198:	1101                	addi	sp,sp,-32
ffffffffc020219a:	ec06                	sd	ra,24(sp)
ffffffffc020219c:	e42a                	sd	a0,8(sp)
ffffffffc020219e:	a3bfe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02021a2:	00094797          	auipc	a5,0x94
ffffffffc02021a6:	6ee7b783          	ld	a5,1774(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc02021aa:	6522                	ld	a0,8(sp)
ffffffffc02021ac:	6f9c                	ld	a5,24(a5)
ffffffffc02021ae:	9782                	jalr	a5
ffffffffc02021b0:	e42a                	sd	a0,8(sp)
ffffffffc02021b2:	a21fe0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc02021b6:	60e2                	ld	ra,24(sp)
ffffffffc02021b8:	6522                	ld	a0,8(sp)
ffffffffc02021ba:	6105                	addi	sp,sp,32
ffffffffc02021bc:	8082                	ret

ffffffffc02021be <free_pages>:
ffffffffc02021be:	100027f3          	csrr	a5,sstatus
ffffffffc02021c2:	8b89                	andi	a5,a5,2
ffffffffc02021c4:	e799                	bnez	a5,ffffffffc02021d2 <free_pages+0x14>
ffffffffc02021c6:	00094797          	auipc	a5,0x94
ffffffffc02021ca:	6ca7b783          	ld	a5,1738(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc02021ce:	739c                	ld	a5,32(a5)
ffffffffc02021d0:	8782                	jr	a5
ffffffffc02021d2:	1101                	addi	sp,sp,-32
ffffffffc02021d4:	ec06                	sd	ra,24(sp)
ffffffffc02021d6:	e42e                	sd	a1,8(sp)
ffffffffc02021d8:	e02a                	sd	a0,0(sp)
ffffffffc02021da:	9fffe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02021de:	00094797          	auipc	a5,0x94
ffffffffc02021e2:	6b27b783          	ld	a5,1714(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc02021e6:	65a2                	ld	a1,8(sp)
ffffffffc02021e8:	6502                	ld	a0,0(sp)
ffffffffc02021ea:	739c                	ld	a5,32(a5)
ffffffffc02021ec:	9782                	jalr	a5
ffffffffc02021ee:	60e2                	ld	ra,24(sp)
ffffffffc02021f0:	6105                	addi	sp,sp,32
ffffffffc02021f2:	9e1fe06f          	j	ffffffffc0200bd2 <intr_enable>

ffffffffc02021f6 <nr_free_pages>:
ffffffffc02021f6:	100027f3          	csrr	a5,sstatus
ffffffffc02021fa:	8b89                	andi	a5,a5,2
ffffffffc02021fc:	e799                	bnez	a5,ffffffffc020220a <nr_free_pages+0x14>
ffffffffc02021fe:	00094797          	auipc	a5,0x94
ffffffffc0202202:	6927b783          	ld	a5,1682(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc0202206:	779c                	ld	a5,40(a5)
ffffffffc0202208:	8782                	jr	a5
ffffffffc020220a:	1101                	addi	sp,sp,-32
ffffffffc020220c:	ec06                	sd	ra,24(sp)
ffffffffc020220e:	9cbfe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0202212:	00094797          	auipc	a5,0x94
ffffffffc0202216:	67e7b783          	ld	a5,1662(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc020221a:	779c                	ld	a5,40(a5)
ffffffffc020221c:	9782                	jalr	a5
ffffffffc020221e:	e42a                	sd	a0,8(sp)
ffffffffc0202220:	9b3fe0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0202224:	60e2                	ld	ra,24(sp)
ffffffffc0202226:	6522                	ld	a0,8(sp)
ffffffffc0202228:	6105                	addi	sp,sp,32
ffffffffc020222a:	8082                	ret

ffffffffc020222c <get_pte>:
ffffffffc020222c:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0202230:	1ff7f793          	andi	a5,a5,511
ffffffffc0202234:	078e                	slli	a5,a5,0x3
ffffffffc0202236:	00f50733          	add	a4,a0,a5
ffffffffc020223a:	6314                	ld	a3,0(a4)
ffffffffc020223c:	7139                	addi	sp,sp,-64
ffffffffc020223e:	f822                	sd	s0,48(sp)
ffffffffc0202240:	f426                	sd	s1,40(sp)
ffffffffc0202242:	fc06                	sd	ra,56(sp)
ffffffffc0202244:	0016f793          	andi	a5,a3,1
ffffffffc0202248:	842e                	mv	s0,a1
ffffffffc020224a:	8832                	mv	a6,a2
ffffffffc020224c:	00094497          	auipc	s1,0x94
ffffffffc0202250:	66448493          	addi	s1,s1,1636 # ffffffffc02968b0 <npage>
ffffffffc0202254:	ebd1                	bnez	a5,ffffffffc02022e8 <get_pte+0xbc>
ffffffffc0202256:	16060d63          	beqz	a2,ffffffffc02023d0 <get_pte+0x1a4>
ffffffffc020225a:	100027f3          	csrr	a5,sstatus
ffffffffc020225e:	8b89                	andi	a5,a5,2
ffffffffc0202260:	16079e63          	bnez	a5,ffffffffc02023dc <get_pte+0x1b0>
ffffffffc0202264:	00094797          	auipc	a5,0x94
ffffffffc0202268:	62c7b783          	ld	a5,1580(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc020226c:	4505                	li	a0,1
ffffffffc020226e:	e43a                	sd	a4,8(sp)
ffffffffc0202270:	6f9c                	ld	a5,24(a5)
ffffffffc0202272:	e832                	sd	a2,16(sp)
ffffffffc0202274:	9782                	jalr	a5
ffffffffc0202276:	6722                	ld	a4,8(sp)
ffffffffc0202278:	6842                	ld	a6,16(sp)
ffffffffc020227a:	87aa                	mv	a5,a0
ffffffffc020227c:	14078a63          	beqz	a5,ffffffffc02023d0 <get_pte+0x1a4>
ffffffffc0202280:	00094517          	auipc	a0,0x94
ffffffffc0202284:	63853503          	ld	a0,1592(a0) # ffffffffc02968b8 <pages>
ffffffffc0202288:	000808b7          	lui	a7,0x80
ffffffffc020228c:	00094497          	auipc	s1,0x94
ffffffffc0202290:	62448493          	addi	s1,s1,1572 # ffffffffc02968b0 <npage>
ffffffffc0202294:	40a78533          	sub	a0,a5,a0
ffffffffc0202298:	8519                	srai	a0,a0,0x6
ffffffffc020229a:	9546                	add	a0,a0,a7
ffffffffc020229c:	6090                	ld	a2,0(s1)
ffffffffc020229e:	00c51693          	slli	a3,a0,0xc
ffffffffc02022a2:	4585                	li	a1,1
ffffffffc02022a4:	82b1                	srli	a3,a3,0xc
ffffffffc02022a6:	c38c                	sw	a1,0(a5)
ffffffffc02022a8:	0532                	slli	a0,a0,0xc
ffffffffc02022aa:	1ac6f763          	bgeu	a3,a2,ffffffffc0202458 <get_pte+0x22c>
ffffffffc02022ae:	00094697          	auipc	a3,0x94
ffffffffc02022b2:	5fa6b683          	ld	a3,1530(a3) # ffffffffc02968a8 <va_pa_offset>
ffffffffc02022b6:	6605                	lui	a2,0x1
ffffffffc02022b8:	4581                	li	a1,0
ffffffffc02022ba:	9536                	add	a0,a0,a3
ffffffffc02022bc:	ec42                	sd	a6,24(sp)
ffffffffc02022be:	e83e                	sd	a5,16(sp)
ffffffffc02022c0:	e43a                	sd	a4,8(sp)
ffffffffc02022c2:	3ea090ef          	jal	ffffffffc020b6ac <memset>
ffffffffc02022c6:	00094697          	auipc	a3,0x94
ffffffffc02022ca:	5f26b683          	ld	a3,1522(a3) # ffffffffc02968b8 <pages>
ffffffffc02022ce:	67c2                	ld	a5,16(sp)
ffffffffc02022d0:	000808b7          	lui	a7,0x80
ffffffffc02022d4:	6722                	ld	a4,8(sp)
ffffffffc02022d6:	40d786b3          	sub	a3,a5,a3
ffffffffc02022da:	8699                	srai	a3,a3,0x6
ffffffffc02022dc:	96c6                	add	a3,a3,a7
ffffffffc02022de:	06aa                	slli	a3,a3,0xa
ffffffffc02022e0:	6862                	ld	a6,24(sp)
ffffffffc02022e2:	0116e693          	ori	a3,a3,17
ffffffffc02022e6:	e314                	sd	a3,0(a4)
ffffffffc02022e8:	c006f693          	andi	a3,a3,-1024
ffffffffc02022ec:	6098                	ld	a4,0(s1)
ffffffffc02022ee:	068a                	slli	a3,a3,0x2
ffffffffc02022f0:	00c6d793          	srli	a5,a3,0xc
ffffffffc02022f4:	14e7f663          	bgeu	a5,a4,ffffffffc0202440 <get_pte+0x214>
ffffffffc02022f8:	00094897          	auipc	a7,0x94
ffffffffc02022fc:	5b088893          	addi	a7,a7,1456 # ffffffffc02968a8 <va_pa_offset>
ffffffffc0202300:	0008b603          	ld	a2,0(a7)
ffffffffc0202304:	01545793          	srli	a5,s0,0x15
ffffffffc0202308:	1ff7f793          	andi	a5,a5,511
ffffffffc020230c:	96b2                	add	a3,a3,a2
ffffffffc020230e:	078e                	slli	a5,a5,0x3
ffffffffc0202310:	97b6                	add	a5,a5,a3
ffffffffc0202312:	6394                	ld	a3,0(a5)
ffffffffc0202314:	0016f613          	andi	a2,a3,1
ffffffffc0202318:	e659                	bnez	a2,ffffffffc02023a6 <get_pte+0x17a>
ffffffffc020231a:	0a080b63          	beqz	a6,ffffffffc02023d0 <get_pte+0x1a4>
ffffffffc020231e:	10002773          	csrr	a4,sstatus
ffffffffc0202322:	8b09                	andi	a4,a4,2
ffffffffc0202324:	ef71                	bnez	a4,ffffffffc0202400 <get_pte+0x1d4>
ffffffffc0202326:	00094717          	auipc	a4,0x94
ffffffffc020232a:	56a73703          	ld	a4,1386(a4) # ffffffffc0296890 <pmm_manager>
ffffffffc020232e:	4505                	li	a0,1
ffffffffc0202330:	e43e                	sd	a5,8(sp)
ffffffffc0202332:	6f18                	ld	a4,24(a4)
ffffffffc0202334:	9702                	jalr	a4
ffffffffc0202336:	67a2                	ld	a5,8(sp)
ffffffffc0202338:	872a                	mv	a4,a0
ffffffffc020233a:	00094897          	auipc	a7,0x94
ffffffffc020233e:	56e88893          	addi	a7,a7,1390 # ffffffffc02968a8 <va_pa_offset>
ffffffffc0202342:	c759                	beqz	a4,ffffffffc02023d0 <get_pte+0x1a4>
ffffffffc0202344:	00094697          	auipc	a3,0x94
ffffffffc0202348:	5746b683          	ld	a3,1396(a3) # ffffffffc02968b8 <pages>
ffffffffc020234c:	00080837          	lui	a6,0x80
ffffffffc0202350:	608c                	ld	a1,0(s1)
ffffffffc0202352:	40d706b3          	sub	a3,a4,a3
ffffffffc0202356:	8699                	srai	a3,a3,0x6
ffffffffc0202358:	96c2                	add	a3,a3,a6
ffffffffc020235a:	00c69613          	slli	a2,a3,0xc
ffffffffc020235e:	4505                	li	a0,1
ffffffffc0202360:	8231                	srli	a2,a2,0xc
ffffffffc0202362:	c308                	sw	a0,0(a4)
ffffffffc0202364:	06b2                	slli	a3,a3,0xc
ffffffffc0202366:	10b67663          	bgeu	a2,a1,ffffffffc0202472 <get_pte+0x246>
ffffffffc020236a:	0008b503          	ld	a0,0(a7)
ffffffffc020236e:	6605                	lui	a2,0x1
ffffffffc0202370:	4581                	li	a1,0
ffffffffc0202372:	9536                	add	a0,a0,a3
ffffffffc0202374:	e83a                	sd	a4,16(sp)
ffffffffc0202376:	e43e                	sd	a5,8(sp)
ffffffffc0202378:	334090ef          	jal	ffffffffc020b6ac <memset>
ffffffffc020237c:	00094697          	auipc	a3,0x94
ffffffffc0202380:	53c6b683          	ld	a3,1340(a3) # ffffffffc02968b8 <pages>
ffffffffc0202384:	6742                	ld	a4,16(sp)
ffffffffc0202386:	00080837          	lui	a6,0x80
ffffffffc020238a:	67a2                	ld	a5,8(sp)
ffffffffc020238c:	40d706b3          	sub	a3,a4,a3
ffffffffc0202390:	8699                	srai	a3,a3,0x6
ffffffffc0202392:	96c2                	add	a3,a3,a6
ffffffffc0202394:	06aa                	slli	a3,a3,0xa
ffffffffc0202396:	0116e693          	ori	a3,a3,17
ffffffffc020239a:	e394                	sd	a3,0(a5)
ffffffffc020239c:	6098                	ld	a4,0(s1)
ffffffffc020239e:	00094897          	auipc	a7,0x94
ffffffffc02023a2:	50a88893          	addi	a7,a7,1290 # ffffffffc02968a8 <va_pa_offset>
ffffffffc02023a6:	c006f693          	andi	a3,a3,-1024
ffffffffc02023aa:	068a                	slli	a3,a3,0x2
ffffffffc02023ac:	00c6d793          	srli	a5,a3,0xc
ffffffffc02023b0:	06e7fc63          	bgeu	a5,a4,ffffffffc0202428 <get_pte+0x1fc>
ffffffffc02023b4:	0008b783          	ld	a5,0(a7)
ffffffffc02023b8:	8031                	srli	s0,s0,0xc
ffffffffc02023ba:	1ff47413          	andi	s0,s0,511
ffffffffc02023be:	040e                	slli	s0,s0,0x3
ffffffffc02023c0:	96be                	add	a3,a3,a5
ffffffffc02023c2:	70e2                	ld	ra,56(sp)
ffffffffc02023c4:	00868533          	add	a0,a3,s0
ffffffffc02023c8:	7442                	ld	s0,48(sp)
ffffffffc02023ca:	74a2                	ld	s1,40(sp)
ffffffffc02023cc:	6121                	addi	sp,sp,64
ffffffffc02023ce:	8082                	ret
ffffffffc02023d0:	70e2                	ld	ra,56(sp)
ffffffffc02023d2:	7442                	ld	s0,48(sp)
ffffffffc02023d4:	74a2                	ld	s1,40(sp)
ffffffffc02023d6:	4501                	li	a0,0
ffffffffc02023d8:	6121                	addi	sp,sp,64
ffffffffc02023da:	8082                	ret
ffffffffc02023dc:	e83a                	sd	a4,16(sp)
ffffffffc02023de:	ec32                	sd	a2,24(sp)
ffffffffc02023e0:	ff8fe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02023e4:	00094797          	auipc	a5,0x94
ffffffffc02023e8:	4ac7b783          	ld	a5,1196(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc02023ec:	4505                	li	a0,1
ffffffffc02023ee:	6f9c                	ld	a5,24(a5)
ffffffffc02023f0:	9782                	jalr	a5
ffffffffc02023f2:	e42a                	sd	a0,8(sp)
ffffffffc02023f4:	fdefe0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc02023f8:	6862                	ld	a6,24(sp)
ffffffffc02023fa:	6742                	ld	a4,16(sp)
ffffffffc02023fc:	67a2                	ld	a5,8(sp)
ffffffffc02023fe:	bdbd                	j	ffffffffc020227c <get_pte+0x50>
ffffffffc0202400:	e83e                	sd	a5,16(sp)
ffffffffc0202402:	fd6fe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0202406:	00094717          	auipc	a4,0x94
ffffffffc020240a:	48a73703          	ld	a4,1162(a4) # ffffffffc0296890 <pmm_manager>
ffffffffc020240e:	4505                	li	a0,1
ffffffffc0202410:	6f18                	ld	a4,24(a4)
ffffffffc0202412:	9702                	jalr	a4
ffffffffc0202414:	e42a                	sd	a0,8(sp)
ffffffffc0202416:	fbcfe0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc020241a:	6722                	ld	a4,8(sp)
ffffffffc020241c:	67c2                	ld	a5,16(sp)
ffffffffc020241e:	00094897          	auipc	a7,0x94
ffffffffc0202422:	48a88893          	addi	a7,a7,1162 # ffffffffc02968a8 <va_pa_offset>
ffffffffc0202426:	bf31                	j	ffffffffc0202342 <get_pte+0x116>
ffffffffc0202428:	0000a617          	auipc	a2,0xa
ffffffffc020242c:	1a060613          	addi	a2,a2,416 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc0202430:	13200593          	li	a1,306
ffffffffc0202434:	0000a517          	auipc	a0,0xa
ffffffffc0202438:	28450513          	addi	a0,a0,644 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc020243c:	80efe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0202440:	0000a617          	auipc	a2,0xa
ffffffffc0202444:	18860613          	addi	a2,a2,392 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc0202448:	12500593          	li	a1,293
ffffffffc020244c:	0000a517          	auipc	a0,0xa
ffffffffc0202450:	26c50513          	addi	a0,a0,620 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0202454:	ff7fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0202458:	86aa                	mv	a3,a0
ffffffffc020245a:	0000a617          	auipc	a2,0xa
ffffffffc020245e:	16e60613          	addi	a2,a2,366 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc0202462:	12100593          	li	a1,289
ffffffffc0202466:	0000a517          	auipc	a0,0xa
ffffffffc020246a:	25250513          	addi	a0,a0,594 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc020246e:	fddfd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0202472:	0000a617          	auipc	a2,0xa
ffffffffc0202476:	15660613          	addi	a2,a2,342 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc020247a:	12f00593          	li	a1,303
ffffffffc020247e:	0000a517          	auipc	a0,0xa
ffffffffc0202482:	23a50513          	addi	a0,a0,570 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0202486:	fc5fd0ef          	jal	ffffffffc020044a <__panic>

ffffffffc020248a <boot_map_segment>:
ffffffffc020248a:	7139                	addi	sp,sp,-64
ffffffffc020248c:	f04a                	sd	s2,32(sp)
ffffffffc020248e:	6905                	lui	s2,0x1
ffffffffc0202490:	00d5c833          	xor	a6,a1,a3
ffffffffc0202494:	fff90793          	addi	a5,s2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0202498:	fc06                	sd	ra,56(sp)
ffffffffc020249a:	00f87833          	and	a6,a6,a5
ffffffffc020249e:	08081563          	bnez	a6,ffffffffc0202528 <boot_map_segment+0x9e>
ffffffffc02024a2:	f426                	sd	s1,40(sp)
ffffffffc02024a4:	963e                	add	a2,a2,a5
ffffffffc02024a6:	00f5f4b3          	and	s1,a1,a5
ffffffffc02024aa:	94b2                	add	s1,s1,a2
ffffffffc02024ac:	80b1                	srli	s1,s1,0xc
ffffffffc02024ae:	c8a1                	beqz	s1,ffffffffc02024fe <boot_map_segment+0x74>
ffffffffc02024b0:	77fd                	lui	a5,0xfffff
ffffffffc02024b2:	00176713          	ori	a4,a4,1
ffffffffc02024b6:	f822                	sd	s0,48(sp)
ffffffffc02024b8:	e852                	sd	s4,16(sp)
ffffffffc02024ba:	8efd                	and	a3,a3,a5
ffffffffc02024bc:	02071a13          	slli	s4,a4,0x20
ffffffffc02024c0:	00f5f433          	and	s0,a1,a5
ffffffffc02024c4:	ec4e                	sd	s3,24(sp)
ffffffffc02024c6:	e456                	sd	s5,8(sp)
ffffffffc02024c8:	89aa                	mv	s3,a0
ffffffffc02024ca:	020a5a13          	srli	s4,s4,0x20
ffffffffc02024ce:	40868ab3          	sub	s5,a3,s0
ffffffffc02024d2:	4605                	li	a2,1
ffffffffc02024d4:	85a2                	mv	a1,s0
ffffffffc02024d6:	854e                	mv	a0,s3
ffffffffc02024d8:	d55ff0ef          	jal	ffffffffc020222c <get_pte>
ffffffffc02024dc:	c515                	beqz	a0,ffffffffc0202508 <boot_map_segment+0x7e>
ffffffffc02024de:	008a87b3          	add	a5,s5,s0
ffffffffc02024e2:	83b1                	srli	a5,a5,0xc
ffffffffc02024e4:	07aa                	slli	a5,a5,0xa
ffffffffc02024e6:	0147e7b3          	or	a5,a5,s4
ffffffffc02024ea:	0017e793          	ori	a5,a5,1
ffffffffc02024ee:	14fd                	addi	s1,s1,-1
ffffffffc02024f0:	e11c                	sd	a5,0(a0)
ffffffffc02024f2:	944a                	add	s0,s0,s2
ffffffffc02024f4:	fcf9                	bnez	s1,ffffffffc02024d2 <boot_map_segment+0x48>
ffffffffc02024f6:	7442                	ld	s0,48(sp)
ffffffffc02024f8:	69e2                	ld	s3,24(sp)
ffffffffc02024fa:	6a42                	ld	s4,16(sp)
ffffffffc02024fc:	6aa2                	ld	s5,8(sp)
ffffffffc02024fe:	70e2                	ld	ra,56(sp)
ffffffffc0202500:	74a2                	ld	s1,40(sp)
ffffffffc0202502:	7902                	ld	s2,32(sp)
ffffffffc0202504:	6121                	addi	sp,sp,64
ffffffffc0202506:	8082                	ret
ffffffffc0202508:	0000a697          	auipc	a3,0xa
ffffffffc020250c:	1d868693          	addi	a3,a3,472 # ffffffffc020c6e0 <etext+0xfcc>
ffffffffc0202510:	00009617          	auipc	a2,0x9
ffffffffc0202514:	64060613          	addi	a2,a2,1600 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0202518:	09c00593          	li	a1,156
ffffffffc020251c:	0000a517          	auipc	a0,0xa
ffffffffc0202520:	19c50513          	addi	a0,a0,412 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0202524:	f27fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0202528:	0000a697          	auipc	a3,0xa
ffffffffc020252c:	1a068693          	addi	a3,a3,416 # ffffffffc020c6c8 <etext+0xfb4>
ffffffffc0202530:	00009617          	auipc	a2,0x9
ffffffffc0202534:	62060613          	addi	a2,a2,1568 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0202538:	09500593          	li	a1,149
ffffffffc020253c:	0000a517          	auipc	a0,0xa
ffffffffc0202540:	17c50513          	addi	a0,a0,380 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0202544:	f822                	sd	s0,48(sp)
ffffffffc0202546:	f426                	sd	s1,40(sp)
ffffffffc0202548:	ec4e                	sd	s3,24(sp)
ffffffffc020254a:	e852                	sd	s4,16(sp)
ffffffffc020254c:	e456                	sd	s5,8(sp)
ffffffffc020254e:	efdfd0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0202552 <get_page>:
ffffffffc0202552:	1141                	addi	sp,sp,-16
ffffffffc0202554:	e022                	sd	s0,0(sp)
ffffffffc0202556:	8432                	mv	s0,a2
ffffffffc0202558:	4601                	li	a2,0
ffffffffc020255a:	e406                	sd	ra,8(sp)
ffffffffc020255c:	cd1ff0ef          	jal	ffffffffc020222c <get_pte>
ffffffffc0202560:	c011                	beqz	s0,ffffffffc0202564 <get_page+0x12>
ffffffffc0202562:	e008                	sd	a0,0(s0)
ffffffffc0202564:	c511                	beqz	a0,ffffffffc0202570 <get_page+0x1e>
ffffffffc0202566:	611c                	ld	a5,0(a0)
ffffffffc0202568:	4501                	li	a0,0
ffffffffc020256a:	0017f713          	andi	a4,a5,1
ffffffffc020256e:	e709                	bnez	a4,ffffffffc0202578 <get_page+0x26>
ffffffffc0202570:	60a2                	ld	ra,8(sp)
ffffffffc0202572:	6402                	ld	s0,0(sp)
ffffffffc0202574:	0141                	addi	sp,sp,16
ffffffffc0202576:	8082                	ret
ffffffffc0202578:	00094717          	auipc	a4,0x94
ffffffffc020257c:	33873703          	ld	a4,824(a4) # ffffffffc02968b0 <npage>
ffffffffc0202580:	078a                	slli	a5,a5,0x2
ffffffffc0202582:	83b1                	srli	a5,a5,0xc
ffffffffc0202584:	00e7ff63          	bgeu	a5,a4,ffffffffc02025a2 <get_page+0x50>
ffffffffc0202588:	00094517          	auipc	a0,0x94
ffffffffc020258c:	33053503          	ld	a0,816(a0) # ffffffffc02968b8 <pages>
ffffffffc0202590:	60a2                	ld	ra,8(sp)
ffffffffc0202592:	6402                	ld	s0,0(sp)
ffffffffc0202594:	079a                	slli	a5,a5,0x6
ffffffffc0202596:	fe000737          	lui	a4,0xfe000
ffffffffc020259a:	97ba                	add	a5,a5,a4
ffffffffc020259c:	953e                	add	a0,a0,a5
ffffffffc020259e:	0141                	addi	sp,sp,16
ffffffffc02025a0:	8082                	ret
ffffffffc02025a2:	bc7ff0ef          	jal	ffffffffc0202168 <pa2page.part.0>

ffffffffc02025a6 <unmap_range>:
ffffffffc02025a6:	715d                	addi	sp,sp,-80
ffffffffc02025a8:	00c5e7b3          	or	a5,a1,a2
ffffffffc02025ac:	e486                	sd	ra,72(sp)
ffffffffc02025ae:	e0a2                	sd	s0,64(sp)
ffffffffc02025b0:	fc26                	sd	s1,56(sp)
ffffffffc02025b2:	f84a                	sd	s2,48(sp)
ffffffffc02025b4:	f44e                	sd	s3,40(sp)
ffffffffc02025b6:	f052                	sd	s4,32(sp)
ffffffffc02025b8:	ec56                	sd	s5,24(sp)
ffffffffc02025ba:	03479713          	slli	a4,a5,0x34
ffffffffc02025be:	ef61                	bnez	a4,ffffffffc0202696 <unmap_range+0xf0>
ffffffffc02025c0:	00200a37          	lui	s4,0x200
ffffffffc02025c4:	00c5b7b3          	sltu	a5,a1,a2
ffffffffc02025c8:	0145b733          	sltu	a4,a1,s4
ffffffffc02025cc:	0017b793          	seqz	a5,a5
ffffffffc02025d0:	8fd9                	or	a5,a5,a4
ffffffffc02025d2:	842e                	mv	s0,a1
ffffffffc02025d4:	84b2                	mv	s1,a2
ffffffffc02025d6:	e3e5                	bnez	a5,ffffffffc02026b6 <unmap_range+0x110>
ffffffffc02025d8:	4785                	li	a5,1
ffffffffc02025da:	07fe                	slli	a5,a5,0x1f
ffffffffc02025dc:	0785                	addi	a5,a5,1 # fffffffffffff001 <end+0x3fd686f1>
ffffffffc02025de:	892a                	mv	s2,a0
ffffffffc02025e0:	6985                	lui	s3,0x1
ffffffffc02025e2:	ffe00ab7          	lui	s5,0xffe00
ffffffffc02025e6:	0cf67863          	bgeu	a2,a5,ffffffffc02026b6 <unmap_range+0x110>
ffffffffc02025ea:	4601                	li	a2,0
ffffffffc02025ec:	85a2                	mv	a1,s0
ffffffffc02025ee:	854a                	mv	a0,s2
ffffffffc02025f0:	c3dff0ef          	jal	ffffffffc020222c <get_pte>
ffffffffc02025f4:	87aa                	mv	a5,a0
ffffffffc02025f6:	cd31                	beqz	a0,ffffffffc0202652 <unmap_range+0xac>
ffffffffc02025f8:	6118                	ld	a4,0(a0)
ffffffffc02025fa:	ef11                	bnez	a4,ffffffffc0202616 <unmap_range+0x70>
ffffffffc02025fc:	944e                	add	s0,s0,s3
ffffffffc02025fe:	c019                	beqz	s0,ffffffffc0202604 <unmap_range+0x5e>
ffffffffc0202600:	fe9465e3          	bltu	s0,s1,ffffffffc02025ea <unmap_range+0x44>
ffffffffc0202604:	60a6                	ld	ra,72(sp)
ffffffffc0202606:	6406                	ld	s0,64(sp)
ffffffffc0202608:	74e2                	ld	s1,56(sp)
ffffffffc020260a:	7942                	ld	s2,48(sp)
ffffffffc020260c:	79a2                	ld	s3,40(sp)
ffffffffc020260e:	7a02                	ld	s4,32(sp)
ffffffffc0202610:	6ae2                	ld	s5,24(sp)
ffffffffc0202612:	6161                	addi	sp,sp,80
ffffffffc0202614:	8082                	ret
ffffffffc0202616:	00177693          	andi	a3,a4,1
ffffffffc020261a:	d2ed                	beqz	a3,ffffffffc02025fc <unmap_range+0x56>
ffffffffc020261c:	00094697          	auipc	a3,0x94
ffffffffc0202620:	2946b683          	ld	a3,660(a3) # ffffffffc02968b0 <npage>
ffffffffc0202624:	070a                	slli	a4,a4,0x2
ffffffffc0202626:	8331                	srli	a4,a4,0xc
ffffffffc0202628:	0ad77763          	bgeu	a4,a3,ffffffffc02026d6 <unmap_range+0x130>
ffffffffc020262c:	00094517          	auipc	a0,0x94
ffffffffc0202630:	28c53503          	ld	a0,652(a0) # ffffffffc02968b8 <pages>
ffffffffc0202634:	071a                	slli	a4,a4,0x6
ffffffffc0202636:	fe0006b7          	lui	a3,0xfe000
ffffffffc020263a:	9736                	add	a4,a4,a3
ffffffffc020263c:	953a                	add	a0,a0,a4
ffffffffc020263e:	4118                	lw	a4,0(a0)
ffffffffc0202640:	377d                	addiw	a4,a4,-1 # fffffffffdffffff <end+0x3dd696ef>
ffffffffc0202642:	c118                	sw	a4,0(a0)
ffffffffc0202644:	cb19                	beqz	a4,ffffffffc020265a <unmap_range+0xb4>
ffffffffc0202646:	0007b023          	sd	zero,0(a5)
ffffffffc020264a:	12040073          	sfence.vma	s0
ffffffffc020264e:	944e                	add	s0,s0,s3
ffffffffc0202650:	b77d                	j	ffffffffc02025fe <unmap_range+0x58>
ffffffffc0202652:	9452                	add	s0,s0,s4
ffffffffc0202654:	01547433          	and	s0,s0,s5
ffffffffc0202658:	b75d                	j	ffffffffc02025fe <unmap_range+0x58>
ffffffffc020265a:	10002773          	csrr	a4,sstatus
ffffffffc020265e:	8b09                	andi	a4,a4,2
ffffffffc0202660:	eb19                	bnez	a4,ffffffffc0202676 <unmap_range+0xd0>
ffffffffc0202662:	00094717          	auipc	a4,0x94
ffffffffc0202666:	22e73703          	ld	a4,558(a4) # ffffffffc0296890 <pmm_manager>
ffffffffc020266a:	4585                	li	a1,1
ffffffffc020266c:	e03e                	sd	a5,0(sp)
ffffffffc020266e:	7318                	ld	a4,32(a4)
ffffffffc0202670:	9702                	jalr	a4
ffffffffc0202672:	6782                	ld	a5,0(sp)
ffffffffc0202674:	bfc9                	j	ffffffffc0202646 <unmap_range+0xa0>
ffffffffc0202676:	e43e                	sd	a5,8(sp)
ffffffffc0202678:	e02a                	sd	a0,0(sp)
ffffffffc020267a:	d5efe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc020267e:	00094717          	auipc	a4,0x94
ffffffffc0202682:	21273703          	ld	a4,530(a4) # ffffffffc0296890 <pmm_manager>
ffffffffc0202686:	6502                	ld	a0,0(sp)
ffffffffc0202688:	4585                	li	a1,1
ffffffffc020268a:	7318                	ld	a4,32(a4)
ffffffffc020268c:	9702                	jalr	a4
ffffffffc020268e:	d44fe0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0202692:	67a2                	ld	a5,8(sp)
ffffffffc0202694:	bf4d                	j	ffffffffc0202646 <unmap_range+0xa0>
ffffffffc0202696:	0000a697          	auipc	a3,0xa
ffffffffc020269a:	05a68693          	addi	a3,a3,90 # ffffffffc020c6f0 <etext+0xfdc>
ffffffffc020269e:	00009617          	auipc	a2,0x9
ffffffffc02026a2:	4b260613          	addi	a2,a2,1202 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02026a6:	15a00593          	li	a1,346
ffffffffc02026aa:	0000a517          	auipc	a0,0xa
ffffffffc02026ae:	00e50513          	addi	a0,a0,14 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02026b2:	d99fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02026b6:	0000a697          	auipc	a3,0xa
ffffffffc02026ba:	06a68693          	addi	a3,a3,106 # ffffffffc020c720 <etext+0x100c>
ffffffffc02026be:	00009617          	auipc	a2,0x9
ffffffffc02026c2:	49260613          	addi	a2,a2,1170 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02026c6:	15b00593          	li	a1,347
ffffffffc02026ca:	0000a517          	auipc	a0,0xa
ffffffffc02026ce:	fee50513          	addi	a0,a0,-18 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02026d2:	d79fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02026d6:	a93ff0ef          	jal	ffffffffc0202168 <pa2page.part.0>

ffffffffc02026da <exit_range>:
ffffffffc02026da:	7135                	addi	sp,sp,-160
ffffffffc02026dc:	00c5e7b3          	or	a5,a1,a2
ffffffffc02026e0:	ed06                	sd	ra,152(sp)
ffffffffc02026e2:	e922                	sd	s0,144(sp)
ffffffffc02026e4:	e526                	sd	s1,136(sp)
ffffffffc02026e6:	e14a                	sd	s2,128(sp)
ffffffffc02026e8:	fcce                	sd	s3,120(sp)
ffffffffc02026ea:	f8d2                	sd	s4,112(sp)
ffffffffc02026ec:	f4d6                	sd	s5,104(sp)
ffffffffc02026ee:	f0da                	sd	s6,96(sp)
ffffffffc02026f0:	ecde                	sd	s7,88(sp)
ffffffffc02026f2:	17d2                	slli	a5,a5,0x34
ffffffffc02026f4:	22079263          	bnez	a5,ffffffffc0202918 <exit_range+0x23e>
ffffffffc02026f8:	00200937          	lui	s2,0x200
ffffffffc02026fc:	00c5b7b3          	sltu	a5,a1,a2
ffffffffc0202700:	0125b733          	sltu	a4,a1,s2
ffffffffc0202704:	0017b793          	seqz	a5,a5
ffffffffc0202708:	8fd9                	or	a5,a5,a4
ffffffffc020270a:	26079263          	bnez	a5,ffffffffc020296e <exit_range+0x294>
ffffffffc020270e:	4785                	li	a5,1
ffffffffc0202710:	07fe                	slli	a5,a5,0x1f
ffffffffc0202712:	0785                	addi	a5,a5,1
ffffffffc0202714:	24f67d63          	bgeu	a2,a5,ffffffffc020296e <exit_range+0x294>
ffffffffc0202718:	c00004b7          	lui	s1,0xc0000
ffffffffc020271c:	ffe007b7          	lui	a5,0xffe00
ffffffffc0202720:	8a2a                	mv	s4,a0
ffffffffc0202722:	8ced                	and	s1,s1,a1
ffffffffc0202724:	00f5f833          	and	a6,a1,a5
ffffffffc0202728:	00094a97          	auipc	s5,0x94
ffffffffc020272c:	188a8a93          	addi	s5,s5,392 # ffffffffc02968b0 <npage>
ffffffffc0202730:	400009b7          	lui	s3,0x40000
ffffffffc0202734:	a809                	j	ffffffffc0202746 <exit_range+0x6c>
ffffffffc0202736:	013487b3          	add	a5,s1,s3
ffffffffc020273a:	400004b7          	lui	s1,0x40000
ffffffffc020273e:	8826                	mv	a6,s1
ffffffffc0202740:	c3f1                	beqz	a5,ffffffffc0202804 <exit_range+0x12a>
ffffffffc0202742:	0cc7f163          	bgeu	a5,a2,ffffffffc0202804 <exit_range+0x12a>
ffffffffc0202746:	01e4d413          	srli	s0,s1,0x1e
ffffffffc020274a:	1ff47413          	andi	s0,s0,511
ffffffffc020274e:	040e                	slli	s0,s0,0x3
ffffffffc0202750:	9452                	add	s0,s0,s4
ffffffffc0202752:	00043883          	ld	a7,0(s0)
ffffffffc0202756:	0018f793          	andi	a5,a7,1
ffffffffc020275a:	dff1                	beqz	a5,ffffffffc0202736 <exit_range+0x5c>
ffffffffc020275c:	000ab783          	ld	a5,0(s5)
ffffffffc0202760:	088a                	slli	a7,a7,0x2
ffffffffc0202762:	00c8d893          	srli	a7,a7,0xc
ffffffffc0202766:	20f8f263          	bgeu	a7,a5,ffffffffc020296a <exit_range+0x290>
ffffffffc020276a:	fff802b7          	lui	t0,0xfff80
ffffffffc020276e:	00588f33          	add	t5,a7,t0
ffffffffc0202772:	000803b7          	lui	t2,0x80
ffffffffc0202776:	007f0733          	add	a4,t5,t2
ffffffffc020277a:	00c71e13          	slli	t3,a4,0xc
ffffffffc020277e:	0f1a                	slli	t5,t5,0x6
ffffffffc0202780:	1cf77863          	bgeu	a4,a5,ffffffffc0202950 <exit_range+0x276>
ffffffffc0202784:	00094f97          	auipc	t6,0x94
ffffffffc0202788:	124f8f93          	addi	t6,t6,292 # ffffffffc02968a8 <va_pa_offset>
ffffffffc020278c:	000fb783          	ld	a5,0(t6)
ffffffffc0202790:	4e85                	li	t4,1
ffffffffc0202792:	6b05                	lui	s6,0x1
ffffffffc0202794:	9e3e                	add	t3,t3,a5
ffffffffc0202796:	01348333          	add	t1,s1,s3
ffffffffc020279a:	01585713          	srli	a4,a6,0x15
ffffffffc020279e:	1ff77713          	andi	a4,a4,511
ffffffffc02027a2:	070e                	slli	a4,a4,0x3
ffffffffc02027a4:	9772                	add	a4,a4,t3
ffffffffc02027a6:	631c                	ld	a5,0(a4)
ffffffffc02027a8:	0017f693          	andi	a3,a5,1
ffffffffc02027ac:	e6bd                	bnez	a3,ffffffffc020281a <exit_range+0x140>
ffffffffc02027ae:	4e81                	li	t4,0
ffffffffc02027b0:	984a                	add	a6,a6,s2
ffffffffc02027b2:	00080863          	beqz	a6,ffffffffc02027c2 <exit_range+0xe8>
ffffffffc02027b6:	879a                	mv	a5,t1
ffffffffc02027b8:	00667363          	bgeu	a2,t1,ffffffffc02027be <exit_range+0xe4>
ffffffffc02027bc:	87b2                	mv	a5,a2
ffffffffc02027be:	fcf86ee3          	bltu	a6,a5,ffffffffc020279a <exit_range+0xc0>
ffffffffc02027c2:	f60e8ae3          	beqz	t4,ffffffffc0202736 <exit_range+0x5c>
ffffffffc02027c6:	000ab783          	ld	a5,0(s5)
ffffffffc02027ca:	1af8f063          	bgeu	a7,a5,ffffffffc020296a <exit_range+0x290>
ffffffffc02027ce:	00094517          	auipc	a0,0x94
ffffffffc02027d2:	0ea53503          	ld	a0,234(a0) # ffffffffc02968b8 <pages>
ffffffffc02027d6:	957a                	add	a0,a0,t5
ffffffffc02027d8:	100027f3          	csrr	a5,sstatus
ffffffffc02027dc:	8b89                	andi	a5,a5,2
ffffffffc02027de:	10079b63          	bnez	a5,ffffffffc02028f4 <exit_range+0x21a>
ffffffffc02027e2:	00094797          	auipc	a5,0x94
ffffffffc02027e6:	0ae7b783          	ld	a5,174(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc02027ea:	4585                	li	a1,1
ffffffffc02027ec:	e432                	sd	a2,8(sp)
ffffffffc02027ee:	739c                	ld	a5,32(a5)
ffffffffc02027f0:	9782                	jalr	a5
ffffffffc02027f2:	6622                	ld	a2,8(sp)
ffffffffc02027f4:	00043023          	sd	zero,0(s0)
ffffffffc02027f8:	013487b3          	add	a5,s1,s3
ffffffffc02027fc:	400004b7          	lui	s1,0x40000
ffffffffc0202800:	8826                	mv	a6,s1
ffffffffc0202802:	f3a1                	bnez	a5,ffffffffc0202742 <exit_range+0x68>
ffffffffc0202804:	60ea                	ld	ra,152(sp)
ffffffffc0202806:	644a                	ld	s0,144(sp)
ffffffffc0202808:	64aa                	ld	s1,136(sp)
ffffffffc020280a:	690a                	ld	s2,128(sp)
ffffffffc020280c:	79e6                	ld	s3,120(sp)
ffffffffc020280e:	7a46                	ld	s4,112(sp)
ffffffffc0202810:	7aa6                	ld	s5,104(sp)
ffffffffc0202812:	7b06                	ld	s6,96(sp)
ffffffffc0202814:	6be6                	ld	s7,88(sp)
ffffffffc0202816:	610d                	addi	sp,sp,160
ffffffffc0202818:	8082                	ret
ffffffffc020281a:	000ab503          	ld	a0,0(s5)
ffffffffc020281e:	078a                	slli	a5,a5,0x2
ffffffffc0202820:	83b1                	srli	a5,a5,0xc
ffffffffc0202822:	14a7f463          	bgeu	a5,a0,ffffffffc020296a <exit_range+0x290>
ffffffffc0202826:	9796                	add	a5,a5,t0
ffffffffc0202828:	00778bb3          	add	s7,a5,t2
ffffffffc020282c:	00679593          	slli	a1,a5,0x6
ffffffffc0202830:	00cb9693          	slli	a3,s7,0xc
ffffffffc0202834:	10abf263          	bgeu	s7,a0,ffffffffc0202938 <exit_range+0x25e>
ffffffffc0202838:	000fb783          	ld	a5,0(t6)
ffffffffc020283c:	96be                	add	a3,a3,a5
ffffffffc020283e:	01668533          	add	a0,a3,s6
ffffffffc0202842:	629c                	ld	a5,0(a3)
ffffffffc0202844:	8b85                	andi	a5,a5,1
ffffffffc0202846:	f7ad                	bnez	a5,ffffffffc02027b0 <exit_range+0xd6>
ffffffffc0202848:	06a1                	addi	a3,a3,8
ffffffffc020284a:	fea69ce3          	bne	a3,a0,ffffffffc0202842 <exit_range+0x168>
ffffffffc020284e:	00094517          	auipc	a0,0x94
ffffffffc0202852:	06a53503          	ld	a0,106(a0) # ffffffffc02968b8 <pages>
ffffffffc0202856:	952e                	add	a0,a0,a1
ffffffffc0202858:	100027f3          	csrr	a5,sstatus
ffffffffc020285c:	8b89                	andi	a5,a5,2
ffffffffc020285e:	e3b9                	bnez	a5,ffffffffc02028a4 <exit_range+0x1ca>
ffffffffc0202860:	00094797          	auipc	a5,0x94
ffffffffc0202864:	0307b783          	ld	a5,48(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc0202868:	4585                	li	a1,1
ffffffffc020286a:	e0b2                	sd	a2,64(sp)
ffffffffc020286c:	739c                	ld	a5,32(a5)
ffffffffc020286e:	fc1a                	sd	t1,56(sp)
ffffffffc0202870:	f846                	sd	a7,48(sp)
ffffffffc0202872:	f47a                	sd	t5,40(sp)
ffffffffc0202874:	f072                	sd	t3,32(sp)
ffffffffc0202876:	ec76                	sd	t4,24(sp)
ffffffffc0202878:	e842                	sd	a6,16(sp)
ffffffffc020287a:	e43a                	sd	a4,8(sp)
ffffffffc020287c:	9782                	jalr	a5
ffffffffc020287e:	6722                	ld	a4,8(sp)
ffffffffc0202880:	6842                	ld	a6,16(sp)
ffffffffc0202882:	6ee2                	ld	t4,24(sp)
ffffffffc0202884:	7e02                	ld	t3,32(sp)
ffffffffc0202886:	7f22                	ld	t5,40(sp)
ffffffffc0202888:	78c2                	ld	a7,48(sp)
ffffffffc020288a:	7362                	ld	t1,56(sp)
ffffffffc020288c:	6606                	ld	a2,64(sp)
ffffffffc020288e:	fff802b7          	lui	t0,0xfff80
ffffffffc0202892:	000803b7          	lui	t2,0x80
ffffffffc0202896:	00094f97          	auipc	t6,0x94
ffffffffc020289a:	012f8f93          	addi	t6,t6,18 # ffffffffc02968a8 <va_pa_offset>
ffffffffc020289e:	00073023          	sd	zero,0(a4)
ffffffffc02028a2:	b739                	j	ffffffffc02027b0 <exit_range+0xd6>
ffffffffc02028a4:	e4b2                	sd	a2,72(sp)
ffffffffc02028a6:	e09a                	sd	t1,64(sp)
ffffffffc02028a8:	fc46                	sd	a7,56(sp)
ffffffffc02028aa:	f47a                	sd	t5,40(sp)
ffffffffc02028ac:	f072                	sd	t3,32(sp)
ffffffffc02028ae:	ec76                	sd	t4,24(sp)
ffffffffc02028b0:	e842                	sd	a6,16(sp)
ffffffffc02028b2:	e43a                	sd	a4,8(sp)
ffffffffc02028b4:	f82a                	sd	a0,48(sp)
ffffffffc02028b6:	b22fe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02028ba:	00094797          	auipc	a5,0x94
ffffffffc02028be:	fd67b783          	ld	a5,-42(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc02028c2:	7542                	ld	a0,48(sp)
ffffffffc02028c4:	4585                	li	a1,1
ffffffffc02028c6:	739c                	ld	a5,32(a5)
ffffffffc02028c8:	9782                	jalr	a5
ffffffffc02028ca:	b08fe0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc02028ce:	6722                	ld	a4,8(sp)
ffffffffc02028d0:	6626                	ld	a2,72(sp)
ffffffffc02028d2:	6306                	ld	t1,64(sp)
ffffffffc02028d4:	78e2                	ld	a7,56(sp)
ffffffffc02028d6:	7f22                	ld	t5,40(sp)
ffffffffc02028d8:	7e02                	ld	t3,32(sp)
ffffffffc02028da:	6ee2                	ld	t4,24(sp)
ffffffffc02028dc:	6842                	ld	a6,16(sp)
ffffffffc02028de:	00094f97          	auipc	t6,0x94
ffffffffc02028e2:	fcaf8f93          	addi	t6,t6,-54 # ffffffffc02968a8 <va_pa_offset>
ffffffffc02028e6:	000803b7          	lui	t2,0x80
ffffffffc02028ea:	fff802b7          	lui	t0,0xfff80
ffffffffc02028ee:	00073023          	sd	zero,0(a4)
ffffffffc02028f2:	bd7d                	j	ffffffffc02027b0 <exit_range+0xd6>
ffffffffc02028f4:	e832                	sd	a2,16(sp)
ffffffffc02028f6:	e42a                	sd	a0,8(sp)
ffffffffc02028f8:	ae0fe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02028fc:	00094797          	auipc	a5,0x94
ffffffffc0202900:	f947b783          	ld	a5,-108(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc0202904:	6522                	ld	a0,8(sp)
ffffffffc0202906:	4585                	li	a1,1
ffffffffc0202908:	739c                	ld	a5,32(a5)
ffffffffc020290a:	9782                	jalr	a5
ffffffffc020290c:	ac6fe0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0202910:	6642                	ld	a2,16(sp)
ffffffffc0202912:	00043023          	sd	zero,0(s0)
ffffffffc0202916:	b5cd                	j	ffffffffc02027f8 <exit_range+0x11e>
ffffffffc0202918:	0000a697          	auipc	a3,0xa
ffffffffc020291c:	dd868693          	addi	a3,a3,-552 # ffffffffc020c6f0 <etext+0xfdc>
ffffffffc0202920:	00009617          	auipc	a2,0x9
ffffffffc0202924:	23060613          	addi	a2,a2,560 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0202928:	16f00593          	li	a1,367
ffffffffc020292c:	0000a517          	auipc	a0,0xa
ffffffffc0202930:	d8c50513          	addi	a0,a0,-628 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0202934:	b17fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0202938:	0000a617          	auipc	a2,0xa
ffffffffc020293c:	c9060613          	addi	a2,a2,-880 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc0202940:	07100593          	li	a1,113
ffffffffc0202944:	0000a517          	auipc	a0,0xa
ffffffffc0202948:	cac50513          	addi	a0,a0,-852 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc020294c:	afffd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0202950:	86f2                	mv	a3,t3
ffffffffc0202952:	0000a617          	auipc	a2,0xa
ffffffffc0202956:	c7660613          	addi	a2,a2,-906 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc020295a:	07100593          	li	a1,113
ffffffffc020295e:	0000a517          	auipc	a0,0xa
ffffffffc0202962:	c9250513          	addi	a0,a0,-878 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc0202966:	ae5fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020296a:	ffeff0ef          	jal	ffffffffc0202168 <pa2page.part.0>
ffffffffc020296e:	0000a697          	auipc	a3,0xa
ffffffffc0202972:	db268693          	addi	a3,a3,-590 # ffffffffc020c720 <etext+0x100c>
ffffffffc0202976:	00009617          	auipc	a2,0x9
ffffffffc020297a:	1da60613          	addi	a2,a2,474 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020297e:	17000593          	li	a1,368
ffffffffc0202982:	0000a517          	auipc	a0,0xa
ffffffffc0202986:	d3650513          	addi	a0,a0,-714 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc020298a:	ac1fd0ef          	jal	ffffffffc020044a <__panic>

ffffffffc020298e <page_remove>:
ffffffffc020298e:	1101                	addi	sp,sp,-32
ffffffffc0202990:	4601                	li	a2,0
ffffffffc0202992:	e822                	sd	s0,16(sp)
ffffffffc0202994:	ec06                	sd	ra,24(sp)
ffffffffc0202996:	842e                	mv	s0,a1
ffffffffc0202998:	895ff0ef          	jal	ffffffffc020222c <get_pte>
ffffffffc020299c:	c511                	beqz	a0,ffffffffc02029a8 <page_remove+0x1a>
ffffffffc020299e:	6118                	ld	a4,0(a0)
ffffffffc02029a0:	87aa                	mv	a5,a0
ffffffffc02029a2:	00177693          	andi	a3,a4,1
ffffffffc02029a6:	e689                	bnez	a3,ffffffffc02029b0 <page_remove+0x22>
ffffffffc02029a8:	60e2                	ld	ra,24(sp)
ffffffffc02029aa:	6442                	ld	s0,16(sp)
ffffffffc02029ac:	6105                	addi	sp,sp,32
ffffffffc02029ae:	8082                	ret
ffffffffc02029b0:	00094697          	auipc	a3,0x94
ffffffffc02029b4:	f006b683          	ld	a3,-256(a3) # ffffffffc02968b0 <npage>
ffffffffc02029b8:	070a                	slli	a4,a4,0x2
ffffffffc02029ba:	8331                	srli	a4,a4,0xc
ffffffffc02029bc:	06d77563          	bgeu	a4,a3,ffffffffc0202a26 <page_remove+0x98>
ffffffffc02029c0:	00094517          	auipc	a0,0x94
ffffffffc02029c4:	ef853503          	ld	a0,-264(a0) # ffffffffc02968b8 <pages>
ffffffffc02029c8:	071a                	slli	a4,a4,0x6
ffffffffc02029ca:	fe0006b7          	lui	a3,0xfe000
ffffffffc02029ce:	9736                	add	a4,a4,a3
ffffffffc02029d0:	953a                	add	a0,a0,a4
ffffffffc02029d2:	4118                	lw	a4,0(a0)
ffffffffc02029d4:	377d                	addiw	a4,a4,-1
ffffffffc02029d6:	c118                	sw	a4,0(a0)
ffffffffc02029d8:	cb09                	beqz	a4,ffffffffc02029ea <page_remove+0x5c>
ffffffffc02029da:	0007b023          	sd	zero,0(a5)
ffffffffc02029de:	12040073          	sfence.vma	s0
ffffffffc02029e2:	60e2                	ld	ra,24(sp)
ffffffffc02029e4:	6442                	ld	s0,16(sp)
ffffffffc02029e6:	6105                	addi	sp,sp,32
ffffffffc02029e8:	8082                	ret
ffffffffc02029ea:	10002773          	csrr	a4,sstatus
ffffffffc02029ee:	8b09                	andi	a4,a4,2
ffffffffc02029f0:	eb19                	bnez	a4,ffffffffc0202a06 <page_remove+0x78>
ffffffffc02029f2:	00094717          	auipc	a4,0x94
ffffffffc02029f6:	e9e73703          	ld	a4,-354(a4) # ffffffffc0296890 <pmm_manager>
ffffffffc02029fa:	4585                	li	a1,1
ffffffffc02029fc:	e03e                	sd	a5,0(sp)
ffffffffc02029fe:	7318                	ld	a4,32(a4)
ffffffffc0202a00:	9702                	jalr	a4
ffffffffc0202a02:	6782                	ld	a5,0(sp)
ffffffffc0202a04:	bfd9                	j	ffffffffc02029da <page_remove+0x4c>
ffffffffc0202a06:	e43e                	sd	a5,8(sp)
ffffffffc0202a08:	e02a                	sd	a0,0(sp)
ffffffffc0202a0a:	9cefe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0202a0e:	00094717          	auipc	a4,0x94
ffffffffc0202a12:	e8273703          	ld	a4,-382(a4) # ffffffffc0296890 <pmm_manager>
ffffffffc0202a16:	6502                	ld	a0,0(sp)
ffffffffc0202a18:	4585                	li	a1,1
ffffffffc0202a1a:	7318                	ld	a4,32(a4)
ffffffffc0202a1c:	9702                	jalr	a4
ffffffffc0202a1e:	9b4fe0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0202a22:	67a2                	ld	a5,8(sp)
ffffffffc0202a24:	bf5d                	j	ffffffffc02029da <page_remove+0x4c>
ffffffffc0202a26:	f42ff0ef          	jal	ffffffffc0202168 <pa2page.part.0>

ffffffffc0202a2a <page_insert>:
ffffffffc0202a2a:	7139                	addi	sp,sp,-64
ffffffffc0202a2c:	f426                	sd	s1,40(sp)
ffffffffc0202a2e:	84b2                	mv	s1,a2
ffffffffc0202a30:	f822                	sd	s0,48(sp)
ffffffffc0202a32:	4605                	li	a2,1
ffffffffc0202a34:	842e                	mv	s0,a1
ffffffffc0202a36:	85a6                	mv	a1,s1
ffffffffc0202a38:	fc06                	sd	ra,56(sp)
ffffffffc0202a3a:	e436                	sd	a3,8(sp)
ffffffffc0202a3c:	ff0ff0ef          	jal	ffffffffc020222c <get_pte>
ffffffffc0202a40:	cd61                	beqz	a0,ffffffffc0202b18 <page_insert+0xee>
ffffffffc0202a42:	400c                	lw	a1,0(s0)
ffffffffc0202a44:	611c                	ld	a5,0(a0)
ffffffffc0202a46:	66a2                	ld	a3,8(sp)
ffffffffc0202a48:	0015861b          	addiw	a2,a1,1 # 1001 <_binary_bin_swap_img_size-0x6cff>
ffffffffc0202a4c:	c010                	sw	a2,0(s0)
ffffffffc0202a4e:	0017f613          	andi	a2,a5,1
ffffffffc0202a52:	872a                	mv	a4,a0
ffffffffc0202a54:	e61d                	bnez	a2,ffffffffc0202a82 <page_insert+0x58>
ffffffffc0202a56:	00094617          	auipc	a2,0x94
ffffffffc0202a5a:	e6263603          	ld	a2,-414(a2) # ffffffffc02968b8 <pages>
ffffffffc0202a5e:	8c11                	sub	s0,s0,a2
ffffffffc0202a60:	8419                	srai	s0,s0,0x6
ffffffffc0202a62:	200007b7          	lui	a5,0x20000
ffffffffc0202a66:	042a                	slli	s0,s0,0xa
ffffffffc0202a68:	943e                	add	s0,s0,a5
ffffffffc0202a6a:	8ec1                	or	a3,a3,s0
ffffffffc0202a6c:	0016e693          	ori	a3,a3,1
ffffffffc0202a70:	e314                	sd	a3,0(a4)
ffffffffc0202a72:	12048073          	sfence.vma	s1
ffffffffc0202a76:	4501                	li	a0,0
ffffffffc0202a78:	70e2                	ld	ra,56(sp)
ffffffffc0202a7a:	7442                	ld	s0,48(sp)
ffffffffc0202a7c:	74a2                	ld	s1,40(sp)
ffffffffc0202a7e:	6121                	addi	sp,sp,64
ffffffffc0202a80:	8082                	ret
ffffffffc0202a82:	00094617          	auipc	a2,0x94
ffffffffc0202a86:	e2e63603          	ld	a2,-466(a2) # ffffffffc02968b0 <npage>
ffffffffc0202a8a:	078a                	slli	a5,a5,0x2
ffffffffc0202a8c:	83b1                	srli	a5,a5,0xc
ffffffffc0202a8e:	08c7f763          	bgeu	a5,a2,ffffffffc0202b1c <page_insert+0xf2>
ffffffffc0202a92:	00094617          	auipc	a2,0x94
ffffffffc0202a96:	e2663603          	ld	a2,-474(a2) # ffffffffc02968b8 <pages>
ffffffffc0202a9a:	fe000537          	lui	a0,0xfe000
ffffffffc0202a9e:	079a                	slli	a5,a5,0x6
ffffffffc0202aa0:	97aa                	add	a5,a5,a0
ffffffffc0202aa2:	00f60533          	add	a0,a2,a5
ffffffffc0202aa6:	00a40963          	beq	s0,a0,ffffffffc0202ab8 <page_insert+0x8e>
ffffffffc0202aaa:	411c                	lw	a5,0(a0)
ffffffffc0202aac:	37fd                	addiw	a5,a5,-1 # 1fffffff <_binary_bin_sfs_img_size+0x1ff8acff>
ffffffffc0202aae:	c11c                	sw	a5,0(a0)
ffffffffc0202ab0:	c791                	beqz	a5,ffffffffc0202abc <page_insert+0x92>
ffffffffc0202ab2:	12048073          	sfence.vma	s1
ffffffffc0202ab6:	b765                	j	ffffffffc0202a5e <page_insert+0x34>
ffffffffc0202ab8:	c00c                	sw	a1,0(s0)
ffffffffc0202aba:	b755                	j	ffffffffc0202a5e <page_insert+0x34>
ffffffffc0202abc:	100027f3          	csrr	a5,sstatus
ffffffffc0202ac0:	8b89                	andi	a5,a5,2
ffffffffc0202ac2:	e39d                	bnez	a5,ffffffffc0202ae8 <page_insert+0xbe>
ffffffffc0202ac4:	00094797          	auipc	a5,0x94
ffffffffc0202ac8:	dcc7b783          	ld	a5,-564(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc0202acc:	4585                	li	a1,1
ffffffffc0202ace:	e83a                	sd	a4,16(sp)
ffffffffc0202ad0:	739c                	ld	a5,32(a5)
ffffffffc0202ad2:	e436                	sd	a3,8(sp)
ffffffffc0202ad4:	9782                	jalr	a5
ffffffffc0202ad6:	00094617          	auipc	a2,0x94
ffffffffc0202ada:	de263603          	ld	a2,-542(a2) # ffffffffc02968b8 <pages>
ffffffffc0202ade:	66a2                	ld	a3,8(sp)
ffffffffc0202ae0:	6742                	ld	a4,16(sp)
ffffffffc0202ae2:	12048073          	sfence.vma	s1
ffffffffc0202ae6:	bfa5                	j	ffffffffc0202a5e <page_insert+0x34>
ffffffffc0202ae8:	ec3a                	sd	a4,24(sp)
ffffffffc0202aea:	e836                	sd	a3,16(sp)
ffffffffc0202aec:	e42a                	sd	a0,8(sp)
ffffffffc0202aee:	8eafe0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0202af2:	00094797          	auipc	a5,0x94
ffffffffc0202af6:	d9e7b783          	ld	a5,-610(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc0202afa:	6522                	ld	a0,8(sp)
ffffffffc0202afc:	4585                	li	a1,1
ffffffffc0202afe:	739c                	ld	a5,32(a5)
ffffffffc0202b00:	9782                	jalr	a5
ffffffffc0202b02:	8d0fe0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0202b06:	00094617          	auipc	a2,0x94
ffffffffc0202b0a:	db263603          	ld	a2,-590(a2) # ffffffffc02968b8 <pages>
ffffffffc0202b0e:	6762                	ld	a4,24(sp)
ffffffffc0202b10:	66c2                	ld	a3,16(sp)
ffffffffc0202b12:	12048073          	sfence.vma	s1
ffffffffc0202b16:	b7a1                	j	ffffffffc0202a5e <page_insert+0x34>
ffffffffc0202b18:	5571                	li	a0,-4
ffffffffc0202b1a:	bfb9                	j	ffffffffc0202a78 <page_insert+0x4e>
ffffffffc0202b1c:	e4cff0ef          	jal	ffffffffc0202168 <pa2page.part.0>

ffffffffc0202b20 <pmm_init>:
ffffffffc0202b20:	0000c797          	auipc	a5,0xc
ffffffffc0202b24:	1a878793          	addi	a5,a5,424 # ffffffffc020ecc8 <default_pmm_manager>
ffffffffc0202b28:	638c                	ld	a1,0(a5)
ffffffffc0202b2a:	7159                	addi	sp,sp,-112
ffffffffc0202b2c:	f486                	sd	ra,104(sp)
ffffffffc0202b2e:	e8ca                	sd	s2,80(sp)
ffffffffc0202b30:	e4ce                	sd	s3,72(sp)
ffffffffc0202b32:	f85a                	sd	s6,48(sp)
ffffffffc0202b34:	f0a2                	sd	s0,96(sp)
ffffffffc0202b36:	eca6                	sd	s1,88(sp)
ffffffffc0202b38:	e0d2                	sd	s4,64(sp)
ffffffffc0202b3a:	fc56                	sd	s5,56(sp)
ffffffffc0202b3c:	f45e                	sd	s7,40(sp)
ffffffffc0202b3e:	f062                	sd	s8,32(sp)
ffffffffc0202b40:	ec66                	sd	s9,24(sp)
ffffffffc0202b42:	00094b17          	auipc	s6,0x94
ffffffffc0202b46:	d4eb0b13          	addi	s6,s6,-690 # ffffffffc0296890 <pmm_manager>
ffffffffc0202b4a:	0000a517          	auipc	a0,0xa
ffffffffc0202b4e:	bee50513          	addi	a0,a0,-1042 # ffffffffc020c738 <etext+0x1024>
ffffffffc0202b52:	00fb3023          	sd	a5,0(s6)
ffffffffc0202b56:	e50fd0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0202b5a:	000b3783          	ld	a5,0(s6)
ffffffffc0202b5e:	00094997          	auipc	s3,0x94
ffffffffc0202b62:	d4a98993          	addi	s3,s3,-694 # ffffffffc02968a8 <va_pa_offset>
ffffffffc0202b66:	679c                	ld	a5,8(a5)
ffffffffc0202b68:	9782                	jalr	a5
ffffffffc0202b6a:	57f5                	li	a5,-3
ffffffffc0202b6c:	07fa                	slli	a5,a5,0x1e
ffffffffc0202b6e:	00f9b023          	sd	a5,0(s3)
ffffffffc0202b72:	e37fd0ef          	jal	ffffffffc02009a8 <get_memory_base>
ffffffffc0202b76:	892a                	mv	s2,a0
ffffffffc0202b78:	e3bfd0ef          	jal	ffffffffc02009b2 <get_memory_size>
ffffffffc0202b7c:	46050de3          	beqz	a0,ffffffffc02037f6 <pmm_init+0xcd6>
ffffffffc0202b80:	84aa                	mv	s1,a0
ffffffffc0202b82:	0000a517          	auipc	a0,0xa
ffffffffc0202b86:	bee50513          	addi	a0,a0,-1042 # ffffffffc020c770 <etext+0x105c>
ffffffffc0202b8a:	e1cfd0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0202b8e:	00990433          	add	s0,s2,s1
ffffffffc0202b92:	864a                	mv	a2,s2
ffffffffc0202b94:	85a6                	mv	a1,s1
ffffffffc0202b96:	fff40693          	addi	a3,s0,-1
ffffffffc0202b9a:	0000a517          	auipc	a0,0xa
ffffffffc0202b9e:	bee50513          	addi	a0,a0,-1042 # ffffffffc020c788 <etext+0x1074>
ffffffffc0202ba2:	e04fd0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0202ba6:	c80007b7          	lui	a5,0xc8000
ffffffffc0202baa:	8522                	mv	a0,s0
ffffffffc0202bac:	5e87ea63          	bltu	a5,s0,ffffffffc02031a0 <pmm_init+0x680>
ffffffffc0202bb0:	77fd                	lui	a5,0xfffff
ffffffffc0202bb2:	00095617          	auipc	a2,0x95
ffffffffc0202bb6:	d5d60613          	addi	a2,a2,-675 # ffffffffc029790f <end+0xfff>
ffffffffc0202bba:	8e7d                	and	a2,a2,a5
ffffffffc0202bbc:	8131                	srli	a0,a0,0xc
ffffffffc0202bbe:	00094b97          	auipc	s7,0x94
ffffffffc0202bc2:	cfab8b93          	addi	s7,s7,-774 # ffffffffc02968b8 <pages>
ffffffffc0202bc6:	00094497          	auipc	s1,0x94
ffffffffc0202bca:	cea48493          	addi	s1,s1,-790 # ffffffffc02968b0 <npage>
ffffffffc0202bce:	00cbb023          	sd	a2,0(s7)
ffffffffc0202bd2:	e088                	sd	a0,0(s1)
ffffffffc0202bd4:	000807b7          	lui	a5,0x80
ffffffffc0202bd8:	86b2                	mv	a3,a2
ffffffffc0202bda:	02f50763          	beq	a0,a5,ffffffffc0202c08 <pmm_init+0xe8>
ffffffffc0202bde:	4701                	li	a4,0
ffffffffc0202be0:	4585                	li	a1,1
ffffffffc0202be2:	fff806b7          	lui	a3,0xfff80
ffffffffc0202be6:	00671793          	slli	a5,a4,0x6
ffffffffc0202bea:	97b2                	add	a5,a5,a2
ffffffffc0202bec:	07a1                	addi	a5,a5,8 # 80008 <_binary_bin_sfs_img_size+0xad08>
ffffffffc0202bee:	40b7b02f          	amoor.d	zero,a1,(a5)
ffffffffc0202bf2:	6088                	ld	a0,0(s1)
ffffffffc0202bf4:	0705                	addi	a4,a4,1
ffffffffc0202bf6:	000bb603          	ld	a2,0(s7)
ffffffffc0202bfa:	00d507b3          	add	a5,a0,a3
ffffffffc0202bfe:	fef764e3          	bltu	a4,a5,ffffffffc0202be6 <pmm_init+0xc6>
ffffffffc0202c02:	079a                	slli	a5,a5,0x6
ffffffffc0202c04:	00f606b3          	add	a3,a2,a5
ffffffffc0202c08:	c02007b7          	lui	a5,0xc0200
ffffffffc0202c0c:	20f6ece3          	bltu	a3,a5,ffffffffc0203624 <pmm_init+0xb04>
ffffffffc0202c10:	0009b583          	ld	a1,0(s3)
ffffffffc0202c14:	77fd                	lui	a5,0xfffff
ffffffffc0202c16:	8c7d                	and	s0,s0,a5
ffffffffc0202c18:	8e8d                	sub	a3,a3,a1
ffffffffc0202c1a:	5c86e563          	bltu	a3,s0,ffffffffc02031e4 <pmm_init+0x6c4>
ffffffffc0202c1e:	0000a517          	auipc	a0,0xa
ffffffffc0202c22:	b9250513          	addi	a0,a0,-1134 # ffffffffc020c7b0 <etext+0x109c>
ffffffffc0202c26:	d80fd0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0202c2a:	000b3783          	ld	a5,0(s6)
ffffffffc0202c2e:	7b9c                	ld	a5,48(a5)
ffffffffc0202c30:	9782                	jalr	a5
ffffffffc0202c32:	0000a517          	auipc	a0,0xa
ffffffffc0202c36:	b9650513          	addi	a0,a0,-1130 # ffffffffc020c7c8 <etext+0x10b4>
ffffffffc0202c3a:	d6cfd0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0202c3e:	100027f3          	csrr	a5,sstatus
ffffffffc0202c42:	8b89                	andi	a5,a5,2
ffffffffc0202c44:	58079563          	bnez	a5,ffffffffc02031ce <pmm_init+0x6ae>
ffffffffc0202c48:	000b3783          	ld	a5,0(s6)
ffffffffc0202c4c:	4505                	li	a0,1
ffffffffc0202c4e:	6f9c                	ld	a5,24(a5)
ffffffffc0202c50:	9782                	jalr	a5
ffffffffc0202c52:	842a                	mv	s0,a0
ffffffffc0202c54:	1a040ce3          	beqz	s0,ffffffffc020360c <pmm_init+0xaec>
ffffffffc0202c58:	000bb703          	ld	a4,0(s7)
ffffffffc0202c5c:	000807b7          	lui	a5,0x80
ffffffffc0202c60:	5a7d                	li	s4,-1
ffffffffc0202c62:	40e406b3          	sub	a3,s0,a4
ffffffffc0202c66:	8699                	srai	a3,a3,0x6
ffffffffc0202c68:	6098                	ld	a4,0(s1)
ffffffffc0202c6a:	96be                	add	a3,a3,a5
ffffffffc0202c6c:	00ca5793          	srli	a5,s4,0xc
ffffffffc0202c70:	8ff5                	and	a5,a5,a3
ffffffffc0202c72:	06b2                	slli	a3,a3,0xc
ffffffffc0202c74:	14e7f3e3          	bgeu	a5,a4,ffffffffc02035ba <pmm_init+0xa9a>
ffffffffc0202c78:	0009b783          	ld	a5,0(s3)
ffffffffc0202c7c:	6605                	lui	a2,0x1
ffffffffc0202c7e:	4581                	li	a1,0
ffffffffc0202c80:	00f68433          	add	s0,a3,a5
ffffffffc0202c84:	8522                	mv	a0,s0
ffffffffc0202c86:	227080ef          	jal	ffffffffc020b6ac <memset>
ffffffffc0202c8a:	0009b683          	ld	a3,0(s3)
ffffffffc0202c8e:	0000a917          	auipc	s2,0xa
ffffffffc0202c92:	a8590913          	addi	s2,s2,-1403 # ffffffffc020c713 <etext+0xfff>
ffffffffc0202c96:	77fd                	lui	a5,0xfffff
ffffffffc0202c98:	c0200ab7          	lui	s5,0xc0200
ffffffffc0202c9c:	00f97933          	and	s2,s2,a5
ffffffffc0202ca0:	3fe00637          	lui	a2,0x3fe00
ffffffffc0202ca4:	40da86b3          	sub	a3,s5,a3
ffffffffc0202ca8:	8522                	mv	a0,s0
ffffffffc0202caa:	964a                	add	a2,a2,s2
ffffffffc0202cac:	85d6                	mv	a1,s5
ffffffffc0202cae:	4729                	li	a4,10
ffffffffc0202cb0:	fdaff0ef          	jal	ffffffffc020248a <boot_map_segment>
ffffffffc0202cb4:	3b5969e3          	bltu	s2,s5,ffffffffc0203866 <pmm_init+0xd46>
ffffffffc0202cb8:	0009b683          	ld	a3,0(s3)
ffffffffc0202cbc:	c8000637          	lui	a2,0xc8000
ffffffffc0202cc0:	41260633          	sub	a2,a2,s2
ffffffffc0202cc4:	40d906b3          	sub	a3,s2,a3
ffffffffc0202cc8:	85ca                	mv	a1,s2
ffffffffc0202cca:	4719                	li	a4,6
ffffffffc0202ccc:	8522                	mv	a0,s0
ffffffffc0202cce:	00094917          	auipc	s2,0x94
ffffffffc0202cd2:	bd290913          	addi	s2,s2,-1070 # ffffffffc02968a0 <boot_pgdir_va>
ffffffffc0202cd6:	fb4ff0ef          	jal	ffffffffc020248a <boot_map_segment>
ffffffffc0202cda:	00893023          	sd	s0,0(s2)
ffffffffc0202cde:	0f546ae3          	bltu	s0,s5,ffffffffc02035d2 <pmm_init+0xab2>
ffffffffc0202ce2:	0009b783          	ld	a5,0(s3)
ffffffffc0202ce6:	1a7e                	slli	s4,s4,0x3f
ffffffffc0202ce8:	8c1d                	sub	s0,s0,a5
ffffffffc0202cea:	00c45793          	srli	a5,s0,0xc
ffffffffc0202cee:	00094717          	auipc	a4,0x94
ffffffffc0202cf2:	ba873523          	sd	s0,-1110(a4) # ffffffffc0296898 <boot_pgdir_pa>
ffffffffc0202cf6:	0147e7b3          	or	a5,a5,s4
ffffffffc0202cfa:	18079073          	csrw	satp,a5
ffffffffc0202cfe:	12000073          	sfence.vma
ffffffffc0202d02:	0000a517          	auipc	a0,0xa
ffffffffc0202d06:	b0650513          	addi	a0,a0,-1274 # ffffffffc020c808 <etext+0x10f4>
ffffffffc0202d0a:	c9cfd0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0202d0e:	0000e717          	auipc	a4,0xe
ffffffffc0202d12:	2f270713          	addi	a4,a4,754 # ffffffffc0211000 <bootstack>
ffffffffc0202d16:	0000e797          	auipc	a5,0xe
ffffffffc0202d1a:	2ea78793          	addi	a5,a5,746 # ffffffffc0211000 <bootstack>
ffffffffc0202d1e:	5cf70a63          	beq	a4,a5,ffffffffc02032f2 <pmm_init+0x7d2>
ffffffffc0202d22:	100027f3          	csrr	a5,sstatus
ffffffffc0202d26:	8b89                	andi	a5,a5,2
ffffffffc0202d28:	48079963          	bnez	a5,ffffffffc02031ba <pmm_init+0x69a>
ffffffffc0202d2c:	000b3783          	ld	a5,0(s6)
ffffffffc0202d30:	779c                	ld	a5,40(a5)
ffffffffc0202d32:	9782                	jalr	a5
ffffffffc0202d34:	842a                	mv	s0,a0
ffffffffc0202d36:	6098                	ld	a4,0(s1)
ffffffffc0202d38:	c80007b7          	lui	a5,0xc8000
ffffffffc0202d3c:	83b1                	srli	a5,a5,0xc
ffffffffc0202d3e:	24e7ece3          	bltu	a5,a4,ffffffffc0203796 <pmm_init+0xc76>
ffffffffc0202d42:	00093503          	ld	a0,0(s2)
ffffffffc0202d46:	280508e3          	beqz	a0,ffffffffc02037d6 <pmm_init+0xcb6>
ffffffffc0202d4a:	03451793          	slli	a5,a0,0x34
ffffffffc0202d4e:	280794e3          	bnez	a5,ffffffffc02037d6 <pmm_init+0xcb6>
ffffffffc0202d52:	4601                	li	a2,0
ffffffffc0202d54:	4581                	li	a1,0
ffffffffc0202d56:	ffcff0ef          	jal	ffffffffc0202552 <get_page>
ffffffffc0202d5a:	24051ee3          	bnez	a0,ffffffffc02037b6 <pmm_init+0xc96>
ffffffffc0202d5e:	100027f3          	csrr	a5,sstatus
ffffffffc0202d62:	8b89                	andi	a5,a5,2
ffffffffc0202d64:	44079063          	bnez	a5,ffffffffc02031a4 <pmm_init+0x684>
ffffffffc0202d68:	000b3783          	ld	a5,0(s6)
ffffffffc0202d6c:	4505                	li	a0,1
ffffffffc0202d6e:	6f9c                	ld	a5,24(a5)
ffffffffc0202d70:	9782                	jalr	a5
ffffffffc0202d72:	8a2a                	mv	s4,a0
ffffffffc0202d74:	00093503          	ld	a0,0(s2)
ffffffffc0202d78:	4681                	li	a3,0
ffffffffc0202d7a:	4601                	li	a2,0
ffffffffc0202d7c:	85d2                	mv	a1,s4
ffffffffc0202d7e:	cadff0ef          	jal	ffffffffc0202a2a <page_insert>
ffffffffc0202d82:	34051be3          	bnez	a0,ffffffffc02038d8 <pmm_init+0xdb8>
ffffffffc0202d86:	00093503          	ld	a0,0(s2)
ffffffffc0202d8a:	4601                	li	a2,0
ffffffffc0202d8c:	4581                	li	a1,0
ffffffffc0202d8e:	c9eff0ef          	jal	ffffffffc020222c <get_pte>
ffffffffc0202d92:	2a050ae3          	beqz	a0,ffffffffc0203846 <pmm_init+0xd26>
ffffffffc0202d96:	611c                	ld	a5,0(a0)
ffffffffc0202d98:	0017f713          	andi	a4,a5,1
ffffffffc0202d9c:	280709e3          	beqz	a4,ffffffffc020382e <pmm_init+0xd0e>
ffffffffc0202da0:	6090                	ld	a2,0(s1)
ffffffffc0202da2:	078a                	slli	a5,a5,0x2
ffffffffc0202da4:	83b1                	srli	a5,a5,0xc
ffffffffc0202da6:	62c7fe63          	bgeu	a5,a2,ffffffffc02033e2 <pmm_init+0x8c2>
ffffffffc0202daa:	000bb703          	ld	a4,0(s7)
ffffffffc0202dae:	079a                	slli	a5,a5,0x6
ffffffffc0202db0:	fe0006b7          	lui	a3,0xfe000
ffffffffc0202db4:	97b6                	add	a5,a5,a3
ffffffffc0202db6:	97ba                	add	a5,a5,a4
ffffffffc0202db8:	2cfa14e3          	bne	s4,a5,ffffffffc0203880 <pmm_init+0xd60>
ffffffffc0202dbc:	000a2703          	lw	a4,0(s4) # 200000 <_binary_bin_sfs_img_size+0x18ad00>
ffffffffc0202dc0:	4785                	li	a5,1
ffffffffc0202dc2:	2ef71be3          	bne	a4,a5,ffffffffc02038b8 <pmm_init+0xd98>
ffffffffc0202dc6:	00093503          	ld	a0,0(s2)
ffffffffc0202dca:	77fd                	lui	a5,0xfffff
ffffffffc0202dcc:	6114                	ld	a3,0(a0)
ffffffffc0202dce:	068a                	slli	a3,a3,0x2
ffffffffc0202dd0:	8efd                	and	a3,a3,a5
ffffffffc0202dd2:	00c6d713          	srli	a4,a3,0xc
ffffffffc0202dd6:	2cc775e3          	bgeu	a4,a2,ffffffffc02038a0 <pmm_init+0xd80>
ffffffffc0202dda:	0009bc03          	ld	s8,0(s3)
ffffffffc0202dde:	96e2                	add	a3,a3,s8
ffffffffc0202de0:	0006ba83          	ld	s5,0(a3) # fffffffffe000000 <end+0x3dd696f0>
ffffffffc0202de4:	0a8a                	slli	s5,s5,0x2
ffffffffc0202de6:	00fafab3          	and	s5,s5,a5
ffffffffc0202dea:	00cad793          	srli	a5,s5,0xc
ffffffffc0202dee:	06c7f7e3          	bgeu	a5,a2,ffffffffc020365c <pmm_init+0xb3c>
ffffffffc0202df2:	4601                	li	a2,0
ffffffffc0202df4:	6585                	lui	a1,0x1
ffffffffc0202df6:	9c56                	add	s8,s8,s5
ffffffffc0202df8:	c34ff0ef          	jal	ffffffffc020222c <get_pte>
ffffffffc0202dfc:	0c21                	addi	s8,s8,8
ffffffffc0202dfe:	03851fe3          	bne	a0,s8,ffffffffc020363c <pmm_init+0xb1c>
ffffffffc0202e02:	100027f3          	csrr	a5,sstatus
ffffffffc0202e06:	8b89                	andi	a5,a5,2
ffffffffc0202e08:	40079663          	bnez	a5,ffffffffc0203214 <pmm_init+0x6f4>
ffffffffc0202e0c:	000b3783          	ld	a5,0(s6)
ffffffffc0202e10:	4505                	li	a0,1
ffffffffc0202e12:	6f9c                	ld	a5,24(a5)
ffffffffc0202e14:	9782                	jalr	a5
ffffffffc0202e16:	8c2a                	mv	s8,a0
ffffffffc0202e18:	00093503          	ld	a0,0(s2)
ffffffffc0202e1c:	46d1                	li	a3,20
ffffffffc0202e1e:	6605                	lui	a2,0x1
ffffffffc0202e20:	85e2                	mv	a1,s8
ffffffffc0202e22:	c09ff0ef          	jal	ffffffffc0202a2a <page_insert>
ffffffffc0202e26:	7c051363          	bnez	a0,ffffffffc02035ec <pmm_init+0xacc>
ffffffffc0202e2a:	00093503          	ld	a0,0(s2)
ffffffffc0202e2e:	4601                	li	a2,0
ffffffffc0202e30:	6585                	lui	a1,0x1
ffffffffc0202e32:	bfaff0ef          	jal	ffffffffc020222c <get_pte>
ffffffffc0202e36:	120500e3          	beqz	a0,ffffffffc0203756 <pmm_init+0xc36>
ffffffffc0202e3a:	611c                	ld	a5,0(a0)
ffffffffc0202e3c:	0107f713          	andi	a4,a5,16
ffffffffc0202e40:	0e070be3          	beqz	a4,ffffffffc0203736 <pmm_init+0xc16>
ffffffffc0202e44:	8b91                	andi	a5,a5,4
ffffffffc0202e46:	0c0788e3          	beqz	a5,ffffffffc0203716 <pmm_init+0xbf6>
ffffffffc0202e4a:	00093503          	ld	a0,0(s2)
ffffffffc0202e4e:	611c                	ld	a5,0(a0)
ffffffffc0202e50:	8bc1                	andi	a5,a5,16
ffffffffc0202e52:	0a0782e3          	beqz	a5,ffffffffc02036f6 <pmm_init+0xbd6>
ffffffffc0202e56:	000c2703          	lw	a4,0(s8)
ffffffffc0202e5a:	4785                	li	a5,1
ffffffffc0202e5c:	06f71de3          	bne	a4,a5,ffffffffc02036d6 <pmm_init+0xbb6>
ffffffffc0202e60:	4681                	li	a3,0
ffffffffc0202e62:	6605                	lui	a2,0x1
ffffffffc0202e64:	85d2                	mv	a1,s4
ffffffffc0202e66:	bc5ff0ef          	jal	ffffffffc0202a2a <page_insert>
ffffffffc0202e6a:	040516e3          	bnez	a0,ffffffffc02036b6 <pmm_init+0xb96>
ffffffffc0202e6e:	000a2703          	lw	a4,0(s4)
ffffffffc0202e72:	4789                	li	a5,2
ffffffffc0202e74:	02f711e3          	bne	a4,a5,ffffffffc0203696 <pmm_init+0xb76>
ffffffffc0202e78:	000c2783          	lw	a5,0(s8)
ffffffffc0202e7c:	7e079d63          	bnez	a5,ffffffffc0203676 <pmm_init+0xb56>
ffffffffc0202e80:	00093503          	ld	a0,0(s2)
ffffffffc0202e84:	4601                	li	a2,0
ffffffffc0202e86:	6585                	lui	a1,0x1
ffffffffc0202e88:	ba4ff0ef          	jal	ffffffffc020222c <get_pte>
ffffffffc0202e8c:	54050d63          	beqz	a0,ffffffffc02033e6 <pmm_init+0x8c6>
ffffffffc0202e90:	6118                	ld	a4,0(a0)
ffffffffc0202e92:	00177793          	andi	a5,a4,1
ffffffffc0202e96:	18078ce3          	beqz	a5,ffffffffc020382e <pmm_init+0xd0e>
ffffffffc0202e9a:	6094                	ld	a3,0(s1)
ffffffffc0202e9c:	00271793          	slli	a5,a4,0x2
ffffffffc0202ea0:	83b1                	srli	a5,a5,0xc
ffffffffc0202ea2:	54d7f063          	bgeu	a5,a3,ffffffffc02033e2 <pmm_init+0x8c2>
ffffffffc0202ea6:	000bb683          	ld	a3,0(s7)
ffffffffc0202eaa:	fff80ab7          	lui	s5,0xfff80
ffffffffc0202eae:	97d6                	add	a5,a5,s5
ffffffffc0202eb0:	079a                	slli	a5,a5,0x6
ffffffffc0202eb2:	97b6                	add	a5,a5,a3
ffffffffc0202eb4:	5afa1963          	bne	s4,a5,ffffffffc0203466 <pmm_init+0x946>
ffffffffc0202eb8:	8b41                	andi	a4,a4,16
ffffffffc0202eba:	58071663          	bnez	a4,ffffffffc0203446 <pmm_init+0x926>
ffffffffc0202ebe:	00093503          	ld	a0,0(s2)
ffffffffc0202ec2:	4581                	li	a1,0
ffffffffc0202ec4:	acbff0ef          	jal	ffffffffc020298e <page_remove>
ffffffffc0202ec8:	000a2c83          	lw	s9,0(s4)
ffffffffc0202ecc:	4785                	li	a5,1
ffffffffc0202ece:	5cfc9c63          	bne	s9,a5,ffffffffc02034a6 <pmm_init+0x986>
ffffffffc0202ed2:	000c2783          	lw	a5,0(s8)
ffffffffc0202ed6:	5a079863          	bnez	a5,ffffffffc0203486 <pmm_init+0x966>
ffffffffc0202eda:	00093503          	ld	a0,0(s2)
ffffffffc0202ede:	6585                	lui	a1,0x1
ffffffffc0202ee0:	aafff0ef          	jal	ffffffffc020298e <page_remove>
ffffffffc0202ee4:	000a2783          	lw	a5,0(s4)
ffffffffc0202ee8:	220798e3          	bnez	a5,ffffffffc0203918 <pmm_init+0xdf8>
ffffffffc0202eec:	000c2783          	lw	a5,0(s8)
ffffffffc0202ef0:	200794e3          	bnez	a5,ffffffffc02038f8 <pmm_init+0xdd8>
ffffffffc0202ef4:	00093a03          	ld	s4,0(s2)
ffffffffc0202ef8:	6098                	ld	a4,0(s1)
ffffffffc0202efa:	000a3783          	ld	a5,0(s4)
ffffffffc0202efe:	078a                	slli	a5,a5,0x2
ffffffffc0202f00:	83b1                	srli	a5,a5,0xc
ffffffffc0202f02:	4ee7f063          	bgeu	a5,a4,ffffffffc02033e2 <pmm_init+0x8c2>
ffffffffc0202f06:	000bb503          	ld	a0,0(s7)
ffffffffc0202f0a:	97d6                	add	a5,a5,s5
ffffffffc0202f0c:	079a                	slli	a5,a5,0x6
ffffffffc0202f0e:	00f506b3          	add	a3,a0,a5
ffffffffc0202f12:	4294                	lw	a3,0(a3)
ffffffffc0202f14:	51969963          	bne	a3,s9,ffffffffc0203426 <pmm_init+0x906>
ffffffffc0202f18:	8799                	srai	a5,a5,0x6
ffffffffc0202f1a:	00080637          	lui	a2,0x80
ffffffffc0202f1e:	97b2                	add	a5,a5,a2
ffffffffc0202f20:	00c79693          	slli	a3,a5,0xc
ffffffffc0202f24:	68e7fb63          	bgeu	a5,a4,ffffffffc02035ba <pmm_init+0xa9a>
ffffffffc0202f28:	0009b783          	ld	a5,0(s3)
ffffffffc0202f2c:	97b6                	add	a5,a5,a3
ffffffffc0202f2e:	639c                	ld	a5,0(a5)
ffffffffc0202f30:	078a                	slli	a5,a5,0x2
ffffffffc0202f32:	83b1                	srli	a5,a5,0xc
ffffffffc0202f34:	4ae7f763          	bgeu	a5,a4,ffffffffc02033e2 <pmm_init+0x8c2>
ffffffffc0202f38:	8f91                	sub	a5,a5,a2
ffffffffc0202f3a:	079a                	slli	a5,a5,0x6
ffffffffc0202f3c:	953e                	add	a0,a0,a5
ffffffffc0202f3e:	100027f3          	csrr	a5,sstatus
ffffffffc0202f42:	8b89                	andi	a5,a5,2
ffffffffc0202f44:	32079363          	bnez	a5,ffffffffc020326a <pmm_init+0x74a>
ffffffffc0202f48:	000b3783          	ld	a5,0(s6)
ffffffffc0202f4c:	4585                	li	a1,1
ffffffffc0202f4e:	739c                	ld	a5,32(a5)
ffffffffc0202f50:	9782                	jalr	a5
ffffffffc0202f52:	000a3783          	ld	a5,0(s4)
ffffffffc0202f56:	6098                	ld	a4,0(s1)
ffffffffc0202f58:	078a                	slli	a5,a5,0x2
ffffffffc0202f5a:	83b1                	srli	a5,a5,0xc
ffffffffc0202f5c:	48e7f363          	bgeu	a5,a4,ffffffffc02033e2 <pmm_init+0x8c2>
ffffffffc0202f60:	000bb503          	ld	a0,0(s7)
ffffffffc0202f64:	fe000737          	lui	a4,0xfe000
ffffffffc0202f68:	079a                	slli	a5,a5,0x6
ffffffffc0202f6a:	97ba                	add	a5,a5,a4
ffffffffc0202f6c:	953e                	add	a0,a0,a5
ffffffffc0202f6e:	100027f3          	csrr	a5,sstatus
ffffffffc0202f72:	8b89                	andi	a5,a5,2
ffffffffc0202f74:	2c079f63          	bnez	a5,ffffffffc0203252 <pmm_init+0x732>
ffffffffc0202f78:	000b3783          	ld	a5,0(s6)
ffffffffc0202f7c:	4585                	li	a1,1
ffffffffc0202f7e:	739c                	ld	a5,32(a5)
ffffffffc0202f80:	9782                	jalr	a5
ffffffffc0202f82:	00093783          	ld	a5,0(s2)
ffffffffc0202f86:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0202f8a:	12000073          	sfence.vma
ffffffffc0202f8e:	100027f3          	csrr	a5,sstatus
ffffffffc0202f92:	8b89                	andi	a5,a5,2
ffffffffc0202f94:	2a079563          	bnez	a5,ffffffffc020323e <pmm_init+0x71e>
ffffffffc0202f98:	000b3783          	ld	a5,0(s6)
ffffffffc0202f9c:	779c                	ld	a5,40(a5)
ffffffffc0202f9e:	9782                	jalr	a5
ffffffffc0202fa0:	8a2a                	mv	s4,a0
ffffffffc0202fa2:	7d441a63          	bne	s0,s4,ffffffffc0203776 <pmm_init+0xc56>
ffffffffc0202fa6:	0000a517          	auipc	a0,0xa
ffffffffc0202faa:	be250513          	addi	a0,a0,-1054 # ffffffffc020cb88 <etext+0x1474>
ffffffffc0202fae:	9f8fd0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0202fb2:	100027f3          	csrr	a5,sstatus
ffffffffc0202fb6:	8b89                	andi	a5,a5,2
ffffffffc0202fb8:	26079963          	bnez	a5,ffffffffc020322a <pmm_init+0x70a>
ffffffffc0202fbc:	000b3783          	ld	a5,0(s6)
ffffffffc0202fc0:	779c                	ld	a5,40(a5)
ffffffffc0202fc2:	9782                	jalr	a5
ffffffffc0202fc4:	8c2a                	mv	s8,a0
ffffffffc0202fc6:	609c                	ld	a5,0(s1)
ffffffffc0202fc8:	c0200437          	lui	s0,0xc0200
ffffffffc0202fcc:	7a7d                	lui	s4,0xfffff
ffffffffc0202fce:	00c79713          	slli	a4,a5,0xc
ffffffffc0202fd2:	6a85                	lui	s5,0x1
ffffffffc0202fd4:	02e47c63          	bgeu	s0,a4,ffffffffc020300c <pmm_init+0x4ec>
ffffffffc0202fd8:	00c45713          	srli	a4,s0,0xc
ffffffffc0202fdc:	3cf77663          	bgeu	a4,a5,ffffffffc02033a8 <pmm_init+0x888>
ffffffffc0202fe0:	0009b583          	ld	a1,0(s3)
ffffffffc0202fe4:	00093503          	ld	a0,0(s2)
ffffffffc0202fe8:	4601                	li	a2,0
ffffffffc0202fea:	95a2                	add	a1,a1,s0
ffffffffc0202fec:	a40ff0ef          	jal	ffffffffc020222c <get_pte>
ffffffffc0202ff0:	38050c63          	beqz	a0,ffffffffc0203388 <pmm_init+0x868>
ffffffffc0202ff4:	611c                	ld	a5,0(a0)
ffffffffc0202ff6:	078a                	slli	a5,a5,0x2
ffffffffc0202ff8:	0147f7b3          	and	a5,a5,s4
ffffffffc0202ffc:	3c879363          	bne	a5,s0,ffffffffc02033c2 <pmm_init+0x8a2>
ffffffffc0203000:	609c                	ld	a5,0(s1)
ffffffffc0203002:	9456                	add	s0,s0,s5
ffffffffc0203004:	00c79713          	slli	a4,a5,0xc
ffffffffc0203008:	fce468e3          	bltu	s0,a4,ffffffffc0202fd8 <pmm_init+0x4b8>
ffffffffc020300c:	00093783          	ld	a5,0(s2)
ffffffffc0203010:	639c                	ld	a5,0(a5)
ffffffffc0203012:	4a079a63          	bnez	a5,ffffffffc02034c6 <pmm_init+0x9a6>
ffffffffc0203016:	100027f3          	csrr	a5,sstatus
ffffffffc020301a:	8b89                	andi	a5,a5,2
ffffffffc020301c:	26079363          	bnez	a5,ffffffffc0203282 <pmm_init+0x762>
ffffffffc0203020:	000b3783          	ld	a5,0(s6)
ffffffffc0203024:	4505                	li	a0,1
ffffffffc0203026:	6f9c                	ld	a5,24(a5)
ffffffffc0203028:	9782                	jalr	a5
ffffffffc020302a:	842a                	mv	s0,a0
ffffffffc020302c:	00093503          	ld	a0,0(s2)
ffffffffc0203030:	4699                	li	a3,6
ffffffffc0203032:	10000613          	li	a2,256
ffffffffc0203036:	85a2                	mv	a1,s0
ffffffffc0203038:	9f3ff0ef          	jal	ffffffffc0202a2a <page_insert>
ffffffffc020303c:	4c051563          	bnez	a0,ffffffffc0203506 <pmm_init+0x9e6>
ffffffffc0203040:	4018                	lw	a4,0(s0)
ffffffffc0203042:	4785                	li	a5,1
ffffffffc0203044:	4af71163          	bne	a4,a5,ffffffffc02034e6 <pmm_init+0x9c6>
ffffffffc0203048:	00093503          	ld	a0,0(s2)
ffffffffc020304c:	6605                	lui	a2,0x1
ffffffffc020304e:	10060613          	addi	a2,a2,256 # 1100 <_binary_bin_swap_img_size-0x6c00>
ffffffffc0203052:	4699                	li	a3,6
ffffffffc0203054:	85a2                	mv	a1,s0
ffffffffc0203056:	9d5ff0ef          	jal	ffffffffc0202a2a <page_insert>
ffffffffc020305a:	3a051663          	bnez	a0,ffffffffc0203406 <pmm_init+0x8e6>
ffffffffc020305e:	4018                	lw	a4,0(s0)
ffffffffc0203060:	4789                	li	a5,2
ffffffffc0203062:	50f71263          	bne	a4,a5,ffffffffc0203566 <pmm_init+0xa46>
ffffffffc0203066:	0000a597          	auipc	a1,0xa
ffffffffc020306a:	c6a58593          	addi	a1,a1,-918 # ffffffffc020ccd0 <etext+0x15bc>
ffffffffc020306e:	10000513          	li	a0,256
ffffffffc0203072:	5ba080ef          	jal	ffffffffc020b62c <strcpy>
ffffffffc0203076:	6585                	lui	a1,0x1
ffffffffc0203078:	10058593          	addi	a1,a1,256 # 1100 <_binary_bin_swap_img_size-0x6c00>
ffffffffc020307c:	10000513          	li	a0,256
ffffffffc0203080:	5be080ef          	jal	ffffffffc020b63e <strcmp>
ffffffffc0203084:	4c051163          	bnez	a0,ffffffffc0203546 <pmm_init+0xa26>
ffffffffc0203088:	000bb683          	ld	a3,0(s7)
ffffffffc020308c:	000807b7          	lui	a5,0x80
ffffffffc0203090:	6098                	ld	a4,0(s1)
ffffffffc0203092:	40d406b3          	sub	a3,s0,a3
ffffffffc0203096:	8699                	srai	a3,a3,0x6
ffffffffc0203098:	96be                	add	a3,a3,a5
ffffffffc020309a:	00c69793          	slli	a5,a3,0xc
ffffffffc020309e:	83b1                	srli	a5,a5,0xc
ffffffffc02030a0:	06b2                	slli	a3,a3,0xc
ffffffffc02030a2:	50e7fc63          	bgeu	a5,a4,ffffffffc02035ba <pmm_init+0xa9a>
ffffffffc02030a6:	0009b783          	ld	a5,0(s3)
ffffffffc02030aa:	10000513          	li	a0,256
ffffffffc02030ae:	97b6                	add	a5,a5,a3
ffffffffc02030b0:	10078023          	sb	zero,256(a5) # 80100 <_binary_bin_sfs_img_size+0xae00>
ffffffffc02030b4:	544080ef          	jal	ffffffffc020b5f8 <strlen>
ffffffffc02030b8:	46051763          	bnez	a0,ffffffffc0203526 <pmm_init+0xa06>
ffffffffc02030bc:	00093a03          	ld	s4,0(s2)
ffffffffc02030c0:	6098                	ld	a4,0(s1)
ffffffffc02030c2:	000a3783          	ld	a5,0(s4) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc02030c6:	078a                	slli	a5,a5,0x2
ffffffffc02030c8:	83b1                	srli	a5,a5,0xc
ffffffffc02030ca:	30e7fc63          	bgeu	a5,a4,ffffffffc02033e2 <pmm_init+0x8c2>
ffffffffc02030ce:	00c79693          	slli	a3,a5,0xc
ffffffffc02030d2:	4ee7f463          	bgeu	a5,a4,ffffffffc02035ba <pmm_init+0xa9a>
ffffffffc02030d6:	0009b783          	ld	a5,0(s3)
ffffffffc02030da:	00f689b3          	add	s3,a3,a5
ffffffffc02030de:	100027f3          	csrr	a5,sstatus
ffffffffc02030e2:	8b89                	andi	a5,a5,2
ffffffffc02030e4:	1e079c63          	bnez	a5,ffffffffc02032dc <pmm_init+0x7bc>
ffffffffc02030e8:	000b3783          	ld	a5,0(s6)
ffffffffc02030ec:	8522                	mv	a0,s0
ffffffffc02030ee:	4585                	li	a1,1
ffffffffc02030f0:	739c                	ld	a5,32(a5)
ffffffffc02030f2:	9782                	jalr	a5
ffffffffc02030f4:	0009b783          	ld	a5,0(s3)
ffffffffc02030f8:	6098                	ld	a4,0(s1)
ffffffffc02030fa:	078a                	slli	a5,a5,0x2
ffffffffc02030fc:	83b1                	srli	a5,a5,0xc
ffffffffc02030fe:	2ee7f263          	bgeu	a5,a4,ffffffffc02033e2 <pmm_init+0x8c2>
ffffffffc0203102:	000bb503          	ld	a0,0(s7)
ffffffffc0203106:	fe000737          	lui	a4,0xfe000
ffffffffc020310a:	079a                	slli	a5,a5,0x6
ffffffffc020310c:	97ba                	add	a5,a5,a4
ffffffffc020310e:	953e                	add	a0,a0,a5
ffffffffc0203110:	100027f3          	csrr	a5,sstatus
ffffffffc0203114:	8b89                	andi	a5,a5,2
ffffffffc0203116:	1a079763          	bnez	a5,ffffffffc02032c4 <pmm_init+0x7a4>
ffffffffc020311a:	000b3783          	ld	a5,0(s6)
ffffffffc020311e:	4585                	li	a1,1
ffffffffc0203120:	739c                	ld	a5,32(a5)
ffffffffc0203122:	9782                	jalr	a5
ffffffffc0203124:	000a3783          	ld	a5,0(s4)
ffffffffc0203128:	6098                	ld	a4,0(s1)
ffffffffc020312a:	078a                	slli	a5,a5,0x2
ffffffffc020312c:	83b1                	srli	a5,a5,0xc
ffffffffc020312e:	2ae7fa63          	bgeu	a5,a4,ffffffffc02033e2 <pmm_init+0x8c2>
ffffffffc0203132:	000bb503          	ld	a0,0(s7)
ffffffffc0203136:	fe000737          	lui	a4,0xfe000
ffffffffc020313a:	079a                	slli	a5,a5,0x6
ffffffffc020313c:	97ba                	add	a5,a5,a4
ffffffffc020313e:	953e                	add	a0,a0,a5
ffffffffc0203140:	100027f3          	csrr	a5,sstatus
ffffffffc0203144:	8b89                	andi	a5,a5,2
ffffffffc0203146:	16079363          	bnez	a5,ffffffffc02032ac <pmm_init+0x78c>
ffffffffc020314a:	000b3783          	ld	a5,0(s6)
ffffffffc020314e:	4585                	li	a1,1
ffffffffc0203150:	739c                	ld	a5,32(a5)
ffffffffc0203152:	9782                	jalr	a5
ffffffffc0203154:	00093783          	ld	a5,0(s2)
ffffffffc0203158:	0007b023          	sd	zero,0(a5)
ffffffffc020315c:	12000073          	sfence.vma
ffffffffc0203160:	100027f3          	csrr	a5,sstatus
ffffffffc0203164:	8b89                	andi	a5,a5,2
ffffffffc0203166:	12079963          	bnez	a5,ffffffffc0203298 <pmm_init+0x778>
ffffffffc020316a:	000b3783          	ld	a5,0(s6)
ffffffffc020316e:	779c                	ld	a5,40(a5)
ffffffffc0203170:	9782                	jalr	a5
ffffffffc0203172:	842a                	mv	s0,a0
ffffffffc0203174:	688c1d63          	bne	s8,s0,ffffffffc020380e <pmm_init+0xcee>
ffffffffc0203178:	0000a517          	auipc	a0,0xa
ffffffffc020317c:	bd050513          	addi	a0,a0,-1072 # ffffffffc020cd48 <etext+0x1634>
ffffffffc0203180:	826fd0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0203184:	7406                	ld	s0,96(sp)
ffffffffc0203186:	70a6                	ld	ra,104(sp)
ffffffffc0203188:	64e6                	ld	s1,88(sp)
ffffffffc020318a:	6946                	ld	s2,80(sp)
ffffffffc020318c:	69a6                	ld	s3,72(sp)
ffffffffc020318e:	6a06                	ld	s4,64(sp)
ffffffffc0203190:	7ae2                	ld	s5,56(sp)
ffffffffc0203192:	7b42                	ld	s6,48(sp)
ffffffffc0203194:	7ba2                	ld	s7,40(sp)
ffffffffc0203196:	7c02                	ld	s8,32(sp)
ffffffffc0203198:	6ce2                	ld	s9,24(sp)
ffffffffc020319a:	6165                	addi	sp,sp,112
ffffffffc020319c:	e01fe06f          	j	ffffffffc0201f9c <kmalloc_init>
ffffffffc02031a0:	853e                	mv	a0,a5
ffffffffc02031a2:	b439                	j	ffffffffc0202bb0 <pmm_init+0x90>
ffffffffc02031a4:	a35fd0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02031a8:	000b3783          	ld	a5,0(s6)
ffffffffc02031ac:	4505                	li	a0,1
ffffffffc02031ae:	6f9c                	ld	a5,24(a5)
ffffffffc02031b0:	9782                	jalr	a5
ffffffffc02031b2:	8a2a                	mv	s4,a0
ffffffffc02031b4:	a1ffd0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc02031b8:	be75                	j	ffffffffc0202d74 <pmm_init+0x254>
ffffffffc02031ba:	a1ffd0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02031be:	000b3783          	ld	a5,0(s6)
ffffffffc02031c2:	779c                	ld	a5,40(a5)
ffffffffc02031c4:	9782                	jalr	a5
ffffffffc02031c6:	842a                	mv	s0,a0
ffffffffc02031c8:	a0bfd0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc02031cc:	b6ad                	j	ffffffffc0202d36 <pmm_init+0x216>
ffffffffc02031ce:	a0bfd0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02031d2:	000b3783          	ld	a5,0(s6)
ffffffffc02031d6:	4505                	li	a0,1
ffffffffc02031d8:	6f9c                	ld	a5,24(a5)
ffffffffc02031da:	9782                	jalr	a5
ffffffffc02031dc:	842a                	mv	s0,a0
ffffffffc02031de:	9f5fd0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc02031e2:	bc8d                	j	ffffffffc0202c54 <pmm_init+0x134>
ffffffffc02031e4:	6705                	lui	a4,0x1
ffffffffc02031e6:	177d                	addi	a4,a4,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc02031e8:	96ba                	add	a3,a3,a4
ffffffffc02031ea:	8ff5                	and	a5,a5,a3
ffffffffc02031ec:	00c7d713          	srli	a4,a5,0xc
ffffffffc02031f0:	1ea77963          	bgeu	a4,a0,ffffffffc02033e2 <pmm_init+0x8c2>
ffffffffc02031f4:	000b3683          	ld	a3,0(s6)
ffffffffc02031f8:	8c1d                	sub	s0,s0,a5
ffffffffc02031fa:	071a                	slli	a4,a4,0x6
ffffffffc02031fc:	fe0007b7          	lui	a5,0xfe000
ffffffffc0203200:	973e                	add	a4,a4,a5
ffffffffc0203202:	6a9c                	ld	a5,16(a3)
ffffffffc0203204:	00c45593          	srli	a1,s0,0xc
ffffffffc0203208:	00e60533          	add	a0,a2,a4
ffffffffc020320c:	9782                	jalr	a5
ffffffffc020320e:	0009b583          	ld	a1,0(s3)
ffffffffc0203212:	b431                	j	ffffffffc0202c1e <pmm_init+0xfe>
ffffffffc0203214:	9c5fd0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0203218:	000b3783          	ld	a5,0(s6)
ffffffffc020321c:	4505                	li	a0,1
ffffffffc020321e:	6f9c                	ld	a5,24(a5)
ffffffffc0203220:	9782                	jalr	a5
ffffffffc0203222:	8c2a                	mv	s8,a0
ffffffffc0203224:	9affd0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0203228:	bec5                	j	ffffffffc0202e18 <pmm_init+0x2f8>
ffffffffc020322a:	9affd0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc020322e:	000b3783          	ld	a5,0(s6)
ffffffffc0203232:	779c                	ld	a5,40(a5)
ffffffffc0203234:	9782                	jalr	a5
ffffffffc0203236:	8c2a                	mv	s8,a0
ffffffffc0203238:	99bfd0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc020323c:	b369                	j	ffffffffc0202fc6 <pmm_init+0x4a6>
ffffffffc020323e:	99bfd0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0203242:	000b3783          	ld	a5,0(s6)
ffffffffc0203246:	779c                	ld	a5,40(a5)
ffffffffc0203248:	9782                	jalr	a5
ffffffffc020324a:	8a2a                	mv	s4,a0
ffffffffc020324c:	987fd0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0203250:	bb89                	j	ffffffffc0202fa2 <pmm_init+0x482>
ffffffffc0203252:	e42a                	sd	a0,8(sp)
ffffffffc0203254:	985fd0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0203258:	000b3783          	ld	a5,0(s6)
ffffffffc020325c:	6522                	ld	a0,8(sp)
ffffffffc020325e:	4585                	li	a1,1
ffffffffc0203260:	739c                	ld	a5,32(a5)
ffffffffc0203262:	9782                	jalr	a5
ffffffffc0203264:	96ffd0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0203268:	bb29                	j	ffffffffc0202f82 <pmm_init+0x462>
ffffffffc020326a:	e42a                	sd	a0,8(sp)
ffffffffc020326c:	96dfd0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0203270:	000b3783          	ld	a5,0(s6)
ffffffffc0203274:	6522                	ld	a0,8(sp)
ffffffffc0203276:	4585                	li	a1,1
ffffffffc0203278:	739c                	ld	a5,32(a5)
ffffffffc020327a:	9782                	jalr	a5
ffffffffc020327c:	957fd0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0203280:	b9c9                	j	ffffffffc0202f52 <pmm_init+0x432>
ffffffffc0203282:	957fd0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0203286:	000b3783          	ld	a5,0(s6)
ffffffffc020328a:	4505                	li	a0,1
ffffffffc020328c:	6f9c                	ld	a5,24(a5)
ffffffffc020328e:	9782                	jalr	a5
ffffffffc0203290:	842a                	mv	s0,a0
ffffffffc0203292:	941fd0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0203296:	bb59                	j	ffffffffc020302c <pmm_init+0x50c>
ffffffffc0203298:	941fd0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc020329c:	000b3783          	ld	a5,0(s6)
ffffffffc02032a0:	779c                	ld	a5,40(a5)
ffffffffc02032a2:	9782                	jalr	a5
ffffffffc02032a4:	842a                	mv	s0,a0
ffffffffc02032a6:	92dfd0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc02032aa:	b5e9                	j	ffffffffc0203174 <pmm_init+0x654>
ffffffffc02032ac:	e42a                	sd	a0,8(sp)
ffffffffc02032ae:	92bfd0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02032b2:	000b3783          	ld	a5,0(s6)
ffffffffc02032b6:	6522                	ld	a0,8(sp)
ffffffffc02032b8:	4585                	li	a1,1
ffffffffc02032ba:	739c                	ld	a5,32(a5)
ffffffffc02032bc:	9782                	jalr	a5
ffffffffc02032be:	915fd0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc02032c2:	bd49                	j	ffffffffc0203154 <pmm_init+0x634>
ffffffffc02032c4:	e42a                	sd	a0,8(sp)
ffffffffc02032c6:	913fd0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02032ca:	000b3783          	ld	a5,0(s6)
ffffffffc02032ce:	6522                	ld	a0,8(sp)
ffffffffc02032d0:	4585                	li	a1,1
ffffffffc02032d2:	739c                	ld	a5,32(a5)
ffffffffc02032d4:	9782                	jalr	a5
ffffffffc02032d6:	8fdfd0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc02032da:	b5a9                	j	ffffffffc0203124 <pmm_init+0x604>
ffffffffc02032dc:	8fdfd0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02032e0:	000b3783          	ld	a5,0(s6)
ffffffffc02032e4:	8522                	mv	a0,s0
ffffffffc02032e6:	4585                	li	a1,1
ffffffffc02032e8:	739c                	ld	a5,32(a5)
ffffffffc02032ea:	9782                	jalr	a5
ffffffffc02032ec:	8e7fd0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc02032f0:	b511                	j	ffffffffc02030f4 <pmm_init+0x5d4>
ffffffffc02032f2:	00010717          	auipc	a4,0x10
ffffffffc02032f6:	d0e74703          	lbu	a4,-754(a4) # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc02032fa:	00010797          	auipc	a5,0x10
ffffffffc02032fe:	d067c783          	lbu	a5,-762(a5) # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc0203302:	a2f710e3          	bne	a4,a5,ffffffffc0202d22 <pmm_init+0x202>
ffffffffc0203306:	6605                	lui	a2,0x1
ffffffffc0203308:	4581                	li	a1,0
ffffffffc020330a:	00010517          	auipc	a0,0x10
ffffffffc020330e:	cf650513          	addi	a0,a0,-778 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc0203312:	39a080ef          	jal	ffffffffc020b6ac <memset>
ffffffffc0203316:	0000e797          	auipc	a5,0xe
ffffffffc020331a:	ce0784a3          	sb	zero,-791(a5) # ffffffffc0210fff <bootstackguard+0xfff>
ffffffffc020331e:	0000d797          	auipc	a5,0xd
ffffffffc0203322:	ce078123          	sb	zero,-798(a5) # ffffffffc0210000 <bootstackguard>
ffffffffc0203326:	0000d797          	auipc	a5,0xd
ffffffffc020332a:	cda78793          	addi	a5,a5,-806 # ffffffffc0210000 <bootstackguard>
ffffffffc020332e:	2757e963          	bltu	a5,s5,ffffffffc02035a0 <pmm_init+0xa80>
ffffffffc0203332:	0009b683          	ld	a3,0(s3)
ffffffffc0203336:	00093503          	ld	a0,0(s2)
ffffffffc020333a:	0000d597          	auipc	a1,0xd
ffffffffc020333e:	cc658593          	addi	a1,a1,-826 # ffffffffc0210000 <bootstackguard>
ffffffffc0203342:	40d586b3          	sub	a3,a1,a3
ffffffffc0203346:	4701                	li	a4,0
ffffffffc0203348:	6605                	lui	a2,0x1
ffffffffc020334a:	940ff0ef          	jal	ffffffffc020248a <boot_map_segment>
ffffffffc020334e:	00010797          	auipc	a5,0x10
ffffffffc0203352:	cb278793          	addi	a5,a5,-846 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc0203356:	2357e863          	bltu	a5,s5,ffffffffc0203586 <pmm_init+0xa66>
ffffffffc020335a:	0009b683          	ld	a3,0(s3)
ffffffffc020335e:	00093503          	ld	a0,0(s2)
ffffffffc0203362:	00010597          	auipc	a1,0x10
ffffffffc0203366:	c9e58593          	addi	a1,a1,-866 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc020336a:	40d586b3          	sub	a3,a1,a3
ffffffffc020336e:	4701                	li	a4,0
ffffffffc0203370:	6605                	lui	a2,0x1
ffffffffc0203372:	918ff0ef          	jal	ffffffffc020248a <boot_map_segment>
ffffffffc0203376:	12000073          	sfence.vma
ffffffffc020337a:	00009517          	auipc	a0,0x9
ffffffffc020337e:	4b650513          	addi	a0,a0,1206 # ffffffffc020c830 <etext+0x111c>
ffffffffc0203382:	e25fc0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0203386:	ba71                	j	ffffffffc0202d22 <pmm_init+0x202>
ffffffffc0203388:	0000a697          	auipc	a3,0xa
ffffffffc020338c:	82068693          	addi	a3,a3,-2016 # ffffffffc020cba8 <etext+0x1494>
ffffffffc0203390:	00008617          	auipc	a2,0x8
ffffffffc0203394:	7c060613          	addi	a2,a2,1984 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203398:	29600593          	li	a1,662
ffffffffc020339c:	00009517          	auipc	a0,0x9
ffffffffc02033a0:	31c50513          	addi	a0,a0,796 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02033a4:	8a6fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02033a8:	86a2                	mv	a3,s0
ffffffffc02033aa:	00009617          	auipc	a2,0x9
ffffffffc02033ae:	21e60613          	addi	a2,a2,542 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc02033b2:	29600593          	li	a1,662
ffffffffc02033b6:	00009517          	auipc	a0,0x9
ffffffffc02033ba:	30250513          	addi	a0,a0,770 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02033be:	88cfd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02033c2:	0000a697          	auipc	a3,0xa
ffffffffc02033c6:	82668693          	addi	a3,a3,-2010 # ffffffffc020cbe8 <etext+0x14d4>
ffffffffc02033ca:	00008617          	auipc	a2,0x8
ffffffffc02033ce:	78660613          	addi	a2,a2,1926 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02033d2:	29700593          	li	a1,663
ffffffffc02033d6:	00009517          	auipc	a0,0x9
ffffffffc02033da:	2e250513          	addi	a0,a0,738 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02033de:	86cfd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02033e2:	d87fe0ef          	jal	ffffffffc0202168 <pa2page.part.0>
ffffffffc02033e6:	00009697          	auipc	a3,0x9
ffffffffc02033ea:	62a68693          	addi	a3,a3,1578 # ffffffffc020ca10 <etext+0x12fc>
ffffffffc02033ee:	00008617          	auipc	a2,0x8
ffffffffc02033f2:	76260613          	addi	a2,a2,1890 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02033f6:	27300593          	li	a1,627
ffffffffc02033fa:	00009517          	auipc	a0,0x9
ffffffffc02033fe:	2be50513          	addi	a0,a0,702 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203402:	848fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203406:	0000a697          	auipc	a3,0xa
ffffffffc020340a:	86a68693          	addi	a3,a3,-1942 # ffffffffc020cc70 <etext+0x155c>
ffffffffc020340e:	00008617          	auipc	a2,0x8
ffffffffc0203412:	74260613          	addi	a2,a2,1858 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203416:	2a000593          	li	a1,672
ffffffffc020341a:	00009517          	auipc	a0,0x9
ffffffffc020341e:	29e50513          	addi	a0,a0,670 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203422:	828fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203426:	00009697          	auipc	a3,0x9
ffffffffc020342a:	70a68693          	addi	a3,a3,1802 # ffffffffc020cb30 <etext+0x141c>
ffffffffc020342e:	00008617          	auipc	a2,0x8
ffffffffc0203432:	72260613          	addi	a2,a2,1826 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203436:	27f00593          	li	a1,639
ffffffffc020343a:	00009517          	auipc	a0,0x9
ffffffffc020343e:	27e50513          	addi	a0,a0,638 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203442:	808fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203446:	00009697          	auipc	a3,0x9
ffffffffc020344a:	6ba68693          	addi	a3,a3,1722 # ffffffffc020cb00 <etext+0x13ec>
ffffffffc020344e:	00008617          	auipc	a2,0x8
ffffffffc0203452:	70260613          	addi	a2,a2,1794 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203456:	27500593          	li	a1,629
ffffffffc020345a:	00009517          	auipc	a0,0x9
ffffffffc020345e:	25e50513          	addi	a0,a0,606 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203462:	fe9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203466:	00009697          	auipc	a3,0x9
ffffffffc020346a:	50a68693          	addi	a3,a3,1290 # ffffffffc020c970 <etext+0x125c>
ffffffffc020346e:	00008617          	auipc	a2,0x8
ffffffffc0203472:	6e260613          	addi	a2,a2,1762 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203476:	27400593          	li	a1,628
ffffffffc020347a:	00009517          	auipc	a0,0x9
ffffffffc020347e:	23e50513          	addi	a0,a0,574 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203482:	fc9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203486:	00009697          	auipc	a3,0x9
ffffffffc020348a:	66268693          	addi	a3,a3,1634 # ffffffffc020cae8 <etext+0x13d4>
ffffffffc020348e:	00008617          	auipc	a2,0x8
ffffffffc0203492:	6c260613          	addi	a2,a2,1730 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203496:	27900593          	li	a1,633
ffffffffc020349a:	00009517          	auipc	a0,0x9
ffffffffc020349e:	21e50513          	addi	a0,a0,542 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02034a2:	fa9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02034a6:	00009697          	auipc	a3,0x9
ffffffffc02034aa:	4e268693          	addi	a3,a3,1250 # ffffffffc020c988 <etext+0x1274>
ffffffffc02034ae:	00008617          	auipc	a2,0x8
ffffffffc02034b2:	6a260613          	addi	a2,a2,1698 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02034b6:	27800593          	li	a1,632
ffffffffc02034ba:	00009517          	auipc	a0,0x9
ffffffffc02034be:	1fe50513          	addi	a0,a0,510 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02034c2:	f89fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02034c6:	00009697          	auipc	a3,0x9
ffffffffc02034ca:	73a68693          	addi	a3,a3,1850 # ffffffffc020cc00 <etext+0x14ec>
ffffffffc02034ce:	00008617          	auipc	a2,0x8
ffffffffc02034d2:	68260613          	addi	a2,a2,1666 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02034d6:	29a00593          	li	a1,666
ffffffffc02034da:	00009517          	auipc	a0,0x9
ffffffffc02034de:	1de50513          	addi	a0,a0,478 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02034e2:	f69fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02034e6:	00009697          	auipc	a3,0x9
ffffffffc02034ea:	77268693          	addi	a3,a3,1906 # ffffffffc020cc58 <etext+0x1544>
ffffffffc02034ee:	00008617          	auipc	a2,0x8
ffffffffc02034f2:	66260613          	addi	a2,a2,1634 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02034f6:	29f00593          	li	a1,671
ffffffffc02034fa:	00009517          	auipc	a0,0x9
ffffffffc02034fe:	1be50513          	addi	a0,a0,446 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203502:	f49fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203506:	00009697          	auipc	a3,0x9
ffffffffc020350a:	71268693          	addi	a3,a3,1810 # ffffffffc020cc18 <etext+0x1504>
ffffffffc020350e:	00008617          	auipc	a2,0x8
ffffffffc0203512:	64260613          	addi	a2,a2,1602 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203516:	29e00593          	li	a1,670
ffffffffc020351a:	00009517          	auipc	a0,0x9
ffffffffc020351e:	19e50513          	addi	a0,a0,414 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203522:	f29fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203526:	00009697          	auipc	a3,0x9
ffffffffc020352a:	7fa68693          	addi	a3,a3,2042 # ffffffffc020cd20 <etext+0x160c>
ffffffffc020352e:	00008617          	auipc	a2,0x8
ffffffffc0203532:	62260613          	addi	a2,a2,1570 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203536:	2a800593          	li	a1,680
ffffffffc020353a:	00009517          	auipc	a0,0x9
ffffffffc020353e:	17e50513          	addi	a0,a0,382 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203542:	f09fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203546:	00009697          	auipc	a3,0x9
ffffffffc020354a:	7a268693          	addi	a3,a3,1954 # ffffffffc020cce8 <etext+0x15d4>
ffffffffc020354e:	00008617          	auipc	a2,0x8
ffffffffc0203552:	60260613          	addi	a2,a2,1538 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203556:	2a500593          	li	a1,677
ffffffffc020355a:	00009517          	auipc	a0,0x9
ffffffffc020355e:	15e50513          	addi	a0,a0,350 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203562:	ee9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203566:	00009697          	auipc	a3,0x9
ffffffffc020356a:	75268693          	addi	a3,a3,1874 # ffffffffc020ccb8 <etext+0x15a4>
ffffffffc020356e:	00008617          	auipc	a2,0x8
ffffffffc0203572:	5e260613          	addi	a2,a2,1506 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203576:	2a100593          	li	a1,673
ffffffffc020357a:	00009517          	auipc	a0,0x9
ffffffffc020357e:	13e50513          	addi	a0,a0,318 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203582:	ec9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203586:	86be                	mv	a3,a5
ffffffffc0203588:	00009617          	auipc	a2,0x9
ffffffffc020358c:	0e860613          	addi	a2,a2,232 # ffffffffc020c670 <etext+0xf5c>
ffffffffc0203590:	0dc00593          	li	a1,220
ffffffffc0203594:	00009517          	auipc	a0,0x9
ffffffffc0203598:	12450513          	addi	a0,a0,292 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc020359c:	eaffc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02035a0:	86be                	mv	a3,a5
ffffffffc02035a2:	00009617          	auipc	a2,0x9
ffffffffc02035a6:	0ce60613          	addi	a2,a2,206 # ffffffffc020c670 <etext+0xf5c>
ffffffffc02035aa:	0db00593          	li	a1,219
ffffffffc02035ae:	00009517          	auipc	a0,0x9
ffffffffc02035b2:	10a50513          	addi	a0,a0,266 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02035b6:	e95fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02035ba:	00009617          	auipc	a2,0x9
ffffffffc02035be:	00e60613          	addi	a2,a2,14 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc02035c2:	07100593          	li	a1,113
ffffffffc02035c6:	00009517          	auipc	a0,0x9
ffffffffc02035ca:	02a50513          	addi	a0,a0,42 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc02035ce:	e7dfc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02035d2:	86a2                	mv	a3,s0
ffffffffc02035d4:	00009617          	auipc	a2,0x9
ffffffffc02035d8:	09c60613          	addi	a2,a2,156 # ffffffffc020c670 <etext+0xf5c>
ffffffffc02035dc:	0ca00593          	li	a1,202
ffffffffc02035e0:	00009517          	auipc	a0,0x9
ffffffffc02035e4:	0d850513          	addi	a0,a0,216 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02035e8:	e63fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02035ec:	00009697          	auipc	a3,0x9
ffffffffc02035f0:	3e468693          	addi	a3,a3,996 # ffffffffc020c9d0 <etext+0x12bc>
ffffffffc02035f4:	00008617          	auipc	a2,0x8
ffffffffc02035f8:	55c60613          	addi	a2,a2,1372 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02035fc:	26900593          	li	a1,617
ffffffffc0203600:	00009517          	auipc	a0,0x9
ffffffffc0203604:	0b850513          	addi	a0,a0,184 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203608:	e43fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020360c:	00009617          	auipc	a2,0x9
ffffffffc0203610:	1dc60613          	addi	a2,a2,476 # ffffffffc020c7e8 <etext+0x10d4>
ffffffffc0203614:	0aa00593          	li	a1,170
ffffffffc0203618:	00009517          	auipc	a0,0x9
ffffffffc020361c:	0a050513          	addi	a0,a0,160 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203620:	e2bfc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203624:	00009617          	auipc	a2,0x9
ffffffffc0203628:	04c60613          	addi	a2,a2,76 # ffffffffc020c670 <etext+0xf5c>
ffffffffc020362c:	08100593          	li	a1,129
ffffffffc0203630:	00009517          	auipc	a0,0x9
ffffffffc0203634:	08850513          	addi	a0,a0,136 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203638:	e13fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020363c:	00009697          	auipc	a3,0x9
ffffffffc0203640:	36468693          	addi	a3,a3,868 # ffffffffc020c9a0 <etext+0x128c>
ffffffffc0203644:	00008617          	auipc	a2,0x8
ffffffffc0203648:	50c60613          	addi	a2,a2,1292 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020364c:	26600593          	li	a1,614
ffffffffc0203650:	00009517          	auipc	a0,0x9
ffffffffc0203654:	06850513          	addi	a0,a0,104 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203658:	df3fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020365c:	86d6                	mv	a3,s5
ffffffffc020365e:	00009617          	auipc	a2,0x9
ffffffffc0203662:	f6a60613          	addi	a2,a2,-150 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc0203666:	26500593          	li	a1,613
ffffffffc020366a:	00009517          	auipc	a0,0x9
ffffffffc020366e:	04e50513          	addi	a0,a0,78 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203672:	dd9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203676:	00009697          	auipc	a3,0x9
ffffffffc020367a:	47268693          	addi	a3,a3,1138 # ffffffffc020cae8 <etext+0x13d4>
ffffffffc020367e:	00008617          	auipc	a2,0x8
ffffffffc0203682:	4d260613          	addi	a2,a2,1234 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203686:	27200593          	li	a1,626
ffffffffc020368a:	00009517          	auipc	a0,0x9
ffffffffc020368e:	02e50513          	addi	a0,a0,46 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203692:	db9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203696:	00009697          	auipc	a3,0x9
ffffffffc020369a:	43a68693          	addi	a3,a3,1082 # ffffffffc020cad0 <etext+0x13bc>
ffffffffc020369e:	00008617          	auipc	a2,0x8
ffffffffc02036a2:	4b260613          	addi	a2,a2,1202 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02036a6:	27100593          	li	a1,625
ffffffffc02036aa:	00009517          	auipc	a0,0x9
ffffffffc02036ae:	00e50513          	addi	a0,a0,14 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02036b2:	d99fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02036b6:	00009697          	auipc	a3,0x9
ffffffffc02036ba:	3ea68693          	addi	a3,a3,1002 # ffffffffc020caa0 <etext+0x138c>
ffffffffc02036be:	00008617          	auipc	a2,0x8
ffffffffc02036c2:	49260613          	addi	a2,a2,1170 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02036c6:	27000593          	li	a1,624
ffffffffc02036ca:	00009517          	auipc	a0,0x9
ffffffffc02036ce:	fee50513          	addi	a0,a0,-18 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02036d2:	d79fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02036d6:	00009697          	auipc	a3,0x9
ffffffffc02036da:	3b268693          	addi	a3,a3,946 # ffffffffc020ca88 <etext+0x1374>
ffffffffc02036de:	00008617          	auipc	a2,0x8
ffffffffc02036e2:	47260613          	addi	a2,a2,1138 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02036e6:	26e00593          	li	a1,622
ffffffffc02036ea:	00009517          	auipc	a0,0x9
ffffffffc02036ee:	fce50513          	addi	a0,a0,-50 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02036f2:	d59fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02036f6:	00009697          	auipc	a3,0x9
ffffffffc02036fa:	37268693          	addi	a3,a3,882 # ffffffffc020ca68 <etext+0x1354>
ffffffffc02036fe:	00008617          	auipc	a2,0x8
ffffffffc0203702:	45260613          	addi	a2,a2,1106 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203706:	26d00593          	li	a1,621
ffffffffc020370a:	00009517          	auipc	a0,0x9
ffffffffc020370e:	fae50513          	addi	a0,a0,-82 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203712:	d39fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203716:	00009697          	auipc	a3,0x9
ffffffffc020371a:	34268693          	addi	a3,a3,834 # ffffffffc020ca58 <etext+0x1344>
ffffffffc020371e:	00008617          	auipc	a2,0x8
ffffffffc0203722:	43260613          	addi	a2,a2,1074 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203726:	26c00593          	li	a1,620
ffffffffc020372a:	00009517          	auipc	a0,0x9
ffffffffc020372e:	f8e50513          	addi	a0,a0,-114 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203732:	d19fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203736:	00009697          	auipc	a3,0x9
ffffffffc020373a:	31268693          	addi	a3,a3,786 # ffffffffc020ca48 <etext+0x1334>
ffffffffc020373e:	00008617          	auipc	a2,0x8
ffffffffc0203742:	41260613          	addi	a2,a2,1042 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203746:	26b00593          	li	a1,619
ffffffffc020374a:	00009517          	auipc	a0,0x9
ffffffffc020374e:	f6e50513          	addi	a0,a0,-146 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203752:	cf9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203756:	00009697          	auipc	a3,0x9
ffffffffc020375a:	2ba68693          	addi	a3,a3,698 # ffffffffc020ca10 <etext+0x12fc>
ffffffffc020375e:	00008617          	auipc	a2,0x8
ffffffffc0203762:	3f260613          	addi	a2,a2,1010 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203766:	26a00593          	li	a1,618
ffffffffc020376a:	00009517          	auipc	a0,0x9
ffffffffc020376e:	f4e50513          	addi	a0,a0,-178 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203772:	cd9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203776:	00009697          	auipc	a3,0x9
ffffffffc020377a:	3ea68693          	addi	a3,a3,1002 # ffffffffc020cb60 <etext+0x144c>
ffffffffc020377e:	00008617          	auipc	a2,0x8
ffffffffc0203782:	3d260613          	addi	a2,a2,978 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203786:	28700593          	li	a1,647
ffffffffc020378a:	00009517          	auipc	a0,0x9
ffffffffc020378e:	f2e50513          	addi	a0,a0,-210 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203792:	cb9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203796:	00009697          	auipc	a3,0x9
ffffffffc020379a:	0c268693          	addi	a3,a3,194 # ffffffffc020c858 <etext+0x1144>
ffffffffc020379e:	00008617          	auipc	a2,0x8
ffffffffc02037a2:	3b260613          	addi	a2,a2,946 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02037a6:	25700593          	li	a1,599
ffffffffc02037aa:	00009517          	auipc	a0,0x9
ffffffffc02037ae:	f0e50513          	addi	a0,a0,-242 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02037b2:	c99fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02037b6:	00009697          	auipc	a3,0x9
ffffffffc02037ba:	10268693          	addi	a3,a3,258 # ffffffffc020c8b8 <etext+0x11a4>
ffffffffc02037be:	00008617          	auipc	a2,0x8
ffffffffc02037c2:	39260613          	addi	a2,a2,914 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02037c6:	25900593          	li	a1,601
ffffffffc02037ca:	00009517          	auipc	a0,0x9
ffffffffc02037ce:	eee50513          	addi	a0,a0,-274 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02037d2:	c79fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02037d6:	00009697          	auipc	a3,0x9
ffffffffc02037da:	0a268693          	addi	a3,a3,162 # ffffffffc020c878 <etext+0x1164>
ffffffffc02037de:	00008617          	auipc	a2,0x8
ffffffffc02037e2:	37260613          	addi	a2,a2,882 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02037e6:	25800593          	li	a1,600
ffffffffc02037ea:	00009517          	auipc	a0,0x9
ffffffffc02037ee:	ece50513          	addi	a0,a0,-306 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02037f2:	c59fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02037f6:	00009617          	auipc	a2,0x9
ffffffffc02037fa:	f5a60613          	addi	a2,a2,-166 # ffffffffc020c750 <etext+0x103c>
ffffffffc02037fe:	06500593          	li	a1,101
ffffffffc0203802:	00009517          	auipc	a0,0x9
ffffffffc0203806:	eb650513          	addi	a0,a0,-330 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc020380a:	c41fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020380e:	00009697          	auipc	a3,0x9
ffffffffc0203812:	35268693          	addi	a3,a3,850 # ffffffffc020cb60 <etext+0x144c>
ffffffffc0203816:	00008617          	auipc	a2,0x8
ffffffffc020381a:	33a60613          	addi	a2,a2,826 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020381e:	2b100593          	li	a1,689
ffffffffc0203822:	00009517          	auipc	a0,0x9
ffffffffc0203826:	e9650513          	addi	a0,a0,-362 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc020382a:	c21fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020382e:	00009617          	auipc	a2,0x9
ffffffffc0203832:	11a60613          	addi	a2,a2,282 # ffffffffc020c948 <etext+0x1234>
ffffffffc0203836:	07f00593          	li	a1,127
ffffffffc020383a:	00009517          	auipc	a0,0x9
ffffffffc020383e:	db650513          	addi	a0,a0,-586 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc0203842:	c09fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203846:	00009697          	auipc	a3,0x9
ffffffffc020384a:	0d268693          	addi	a3,a3,210 # ffffffffc020c918 <etext+0x1204>
ffffffffc020384e:	00008617          	auipc	a2,0x8
ffffffffc0203852:	30260613          	addi	a2,a2,770 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203856:	26000593          	li	a1,608
ffffffffc020385a:	00009517          	auipc	a0,0x9
ffffffffc020385e:	e5e50513          	addi	a0,a0,-418 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203862:	be9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203866:	86ca                	mv	a3,s2
ffffffffc0203868:	00009617          	auipc	a2,0x9
ffffffffc020386c:	e0860613          	addi	a2,a2,-504 # ffffffffc020c670 <etext+0xf5c>
ffffffffc0203870:	0c600593          	li	a1,198
ffffffffc0203874:	00009517          	auipc	a0,0x9
ffffffffc0203878:	e4450513          	addi	a0,a0,-444 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc020387c:	bcffc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203880:	00009697          	auipc	a3,0x9
ffffffffc0203884:	0f068693          	addi	a3,a3,240 # ffffffffc020c970 <etext+0x125c>
ffffffffc0203888:	00008617          	auipc	a2,0x8
ffffffffc020388c:	2c860613          	addi	a2,a2,712 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203890:	26100593          	li	a1,609
ffffffffc0203894:	00009517          	auipc	a0,0x9
ffffffffc0203898:	e2450513          	addi	a0,a0,-476 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc020389c:	baffc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02038a0:	00009617          	auipc	a2,0x9
ffffffffc02038a4:	d2860613          	addi	a2,a2,-728 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc02038a8:	26400593          	li	a1,612
ffffffffc02038ac:	00009517          	auipc	a0,0x9
ffffffffc02038b0:	e0c50513          	addi	a0,a0,-500 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02038b4:	b97fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02038b8:	00009697          	auipc	a3,0x9
ffffffffc02038bc:	0d068693          	addi	a3,a3,208 # ffffffffc020c988 <etext+0x1274>
ffffffffc02038c0:	00008617          	auipc	a2,0x8
ffffffffc02038c4:	29060613          	addi	a2,a2,656 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02038c8:	26200593          	li	a1,610
ffffffffc02038cc:	00009517          	auipc	a0,0x9
ffffffffc02038d0:	dec50513          	addi	a0,a0,-532 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02038d4:	b77fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02038d8:	00009697          	auipc	a3,0x9
ffffffffc02038dc:	01068693          	addi	a3,a3,16 # ffffffffc020c8e8 <etext+0x11d4>
ffffffffc02038e0:	00008617          	auipc	a2,0x8
ffffffffc02038e4:	27060613          	addi	a2,a2,624 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02038e8:	25d00593          	li	a1,605
ffffffffc02038ec:	00009517          	auipc	a0,0x9
ffffffffc02038f0:	dcc50513          	addi	a0,a0,-564 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc02038f4:	b57fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02038f8:	00009697          	auipc	a3,0x9
ffffffffc02038fc:	1f068693          	addi	a3,a3,496 # ffffffffc020cae8 <etext+0x13d4>
ffffffffc0203900:	00008617          	auipc	a2,0x8
ffffffffc0203904:	25060613          	addi	a2,a2,592 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203908:	27d00593          	li	a1,637
ffffffffc020390c:	00009517          	auipc	a0,0x9
ffffffffc0203910:	dac50513          	addi	a0,a0,-596 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203914:	b37fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203918:	00009697          	auipc	a3,0x9
ffffffffc020391c:	20068693          	addi	a3,a3,512 # ffffffffc020cb18 <etext+0x1404>
ffffffffc0203920:	00008617          	auipc	a2,0x8
ffffffffc0203924:	23060613          	addi	a2,a2,560 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203928:	27c00593          	li	a1,636
ffffffffc020392c:	00009517          	auipc	a0,0x9
ffffffffc0203930:	d8c50513          	addi	a0,a0,-628 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203934:	b17fc0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0203938 <copy_range>:
ffffffffc0203938:	7119                	addi	sp,sp,-128
ffffffffc020393a:	00d667b3          	or	a5,a2,a3
ffffffffc020393e:	e43a                	sd	a4,8(sp)
ffffffffc0203940:	fc86                	sd	ra,120(sp)
ffffffffc0203942:	f8a2                	sd	s0,112(sp)
ffffffffc0203944:	f4a6                	sd	s1,104(sp)
ffffffffc0203946:	f0ca                	sd	s2,96(sp)
ffffffffc0203948:	ecce                	sd	s3,88(sp)
ffffffffc020394a:	e8d2                	sd	s4,80(sp)
ffffffffc020394c:	e4d6                	sd	s5,72(sp)
ffffffffc020394e:	e0da                	sd	s6,64(sp)
ffffffffc0203950:	fc5e                	sd	s7,56(sp)
ffffffffc0203952:	f862                	sd	s8,48(sp)
ffffffffc0203954:	f466                	sd	s9,40(sp)
ffffffffc0203956:	f06a                	sd	s10,32(sp)
ffffffffc0203958:	ec6e                	sd	s11,24(sp)
ffffffffc020395a:	03479713          	slli	a4,a5,0x34
ffffffffc020395e:	26071163          	bnez	a4,ffffffffc0203bc0 <copy_range+0x288>
ffffffffc0203962:	002007b7          	lui	a5,0x200
ffffffffc0203966:	00d63733          	sltu	a4,a2,a3
ffffffffc020396a:	00f637b3          	sltu	a5,a2,a5
ffffffffc020396e:	00173713          	seqz	a4,a4
ffffffffc0203972:	8fd9                	or	a5,a5,a4
ffffffffc0203974:	8432                	mv	s0,a2
ffffffffc0203976:	8936                	mv	s2,a3
ffffffffc0203978:	22079463          	bnez	a5,ffffffffc0203ba0 <copy_range+0x268>
ffffffffc020397c:	4785                	li	a5,1
ffffffffc020397e:	07fe                	slli	a5,a5,0x1f
ffffffffc0203980:	0785                	addi	a5,a5,1 # 200001 <_binary_bin_sfs_img_size+0x18ad01>
ffffffffc0203982:	20f6ff63          	bgeu	a3,a5,ffffffffc0203ba0 <copy_range+0x268>
ffffffffc0203986:	5bfd                	li	s7,-1
ffffffffc0203988:	8a2a                	mv	s4,a0
ffffffffc020398a:	84ae                	mv	s1,a1
ffffffffc020398c:	6985                	lui	s3,0x1
ffffffffc020398e:	00cbdb93          	srli	s7,s7,0xc
ffffffffc0203992:	00093b17          	auipc	s6,0x93
ffffffffc0203996:	f1eb0b13          	addi	s6,s6,-226 # ffffffffc02968b0 <npage>
ffffffffc020399a:	00093a97          	auipc	s5,0x93
ffffffffc020399e:	f1ea8a93          	addi	s5,s5,-226 # ffffffffc02968b8 <pages>
ffffffffc02039a2:	fff80c37          	lui	s8,0xfff80
ffffffffc02039a6:	4601                	li	a2,0
ffffffffc02039a8:	85a2                	mv	a1,s0
ffffffffc02039aa:	8526                	mv	a0,s1
ffffffffc02039ac:	881fe0ef          	jal	ffffffffc020222c <get_pte>
ffffffffc02039b0:	8d2a                	mv	s10,a0
ffffffffc02039b2:	c545                	beqz	a0,ffffffffc0203a5a <copy_range+0x122>
ffffffffc02039b4:	611c                	ld	a5,0(a0)
ffffffffc02039b6:	8b85                	andi	a5,a5,1
ffffffffc02039b8:	e78d                	bnez	a5,ffffffffc02039e2 <copy_range+0xaa>
ffffffffc02039ba:	944e                	add	s0,s0,s3
ffffffffc02039bc:	c019                	beqz	s0,ffffffffc02039c2 <copy_range+0x8a>
ffffffffc02039be:	ff2464e3          	bltu	s0,s2,ffffffffc02039a6 <copy_range+0x6e>
ffffffffc02039c2:	4501                	li	a0,0
ffffffffc02039c4:	70e6                	ld	ra,120(sp)
ffffffffc02039c6:	7446                	ld	s0,112(sp)
ffffffffc02039c8:	74a6                	ld	s1,104(sp)
ffffffffc02039ca:	7906                	ld	s2,96(sp)
ffffffffc02039cc:	69e6                	ld	s3,88(sp)
ffffffffc02039ce:	6a46                	ld	s4,80(sp)
ffffffffc02039d0:	6aa6                	ld	s5,72(sp)
ffffffffc02039d2:	6b06                	ld	s6,64(sp)
ffffffffc02039d4:	7be2                	ld	s7,56(sp)
ffffffffc02039d6:	7c42                	ld	s8,48(sp)
ffffffffc02039d8:	7ca2                	ld	s9,40(sp)
ffffffffc02039da:	7d02                	ld	s10,32(sp)
ffffffffc02039dc:	6de2                	ld	s11,24(sp)
ffffffffc02039de:	6109                	addi	sp,sp,128
ffffffffc02039e0:	8082                	ret
ffffffffc02039e2:	4605                	li	a2,1
ffffffffc02039e4:	85a2                	mv	a1,s0
ffffffffc02039e6:	8552                	mv	a0,s4
ffffffffc02039e8:	845fe0ef          	jal	ffffffffc020222c <get_pte>
ffffffffc02039ec:	10050663          	beqz	a0,ffffffffc0203af8 <copy_range+0x1c0>
ffffffffc02039f0:	000d3d83          	ld	s11,0(s10)
ffffffffc02039f4:	001df793          	andi	a5,s11,1
ffffffffc02039f8:	12078e63          	beqz	a5,ffffffffc0203b34 <copy_range+0x1fc>
ffffffffc02039fc:	000b3703          	ld	a4,0(s6)
ffffffffc0203a00:	002d9793          	slli	a5,s11,0x2
ffffffffc0203a04:	83b1                	srli	a5,a5,0xc
ffffffffc0203a06:	10e7fb63          	bgeu	a5,a4,ffffffffc0203b1c <copy_range+0x1e4>
ffffffffc0203a0a:	000abd03          	ld	s10,0(s5)
ffffffffc0203a0e:	97e2                	add	a5,a5,s8
ffffffffc0203a10:	079a                	slli	a5,a5,0x6
ffffffffc0203a12:	9d3e                	add	s10,s10,a5
ffffffffc0203a14:	0e0d0463          	beqz	s10,ffffffffc0203afc <copy_range+0x1c4>
ffffffffc0203a18:	67a2                	ld	a5,8(sp)
ffffffffc0203a1a:	c7b9                	beqz	a5,ffffffffc0203a68 <copy_range+0x130>
ffffffffc0203a1c:	01bdf693          	andi	a3,s11,27
ffffffffc0203a20:	8622                	mv	a2,s0
ffffffffc0203a22:	85ea                	mv	a1,s10
ffffffffc0203a24:	8526                	mv	a0,s1
ffffffffc0203a26:	804ff0ef          	jal	ffffffffc0202a2a <page_insert>
ffffffffc0203a2a:	01bdf693          	andi	a3,s11,27
ffffffffc0203a2e:	8622                	mv	a2,s0
ffffffffc0203a30:	85ea                	mv	a1,s10
ffffffffc0203a32:	8552                	mv	a0,s4
ffffffffc0203a34:	ff7fe0ef          	jal	ffffffffc0202a2a <page_insert>
ffffffffc0203a38:	d149                	beqz	a0,ffffffffc02039ba <copy_range+0x82>
ffffffffc0203a3a:	00009697          	auipc	a3,0x9
ffffffffc0203a3e:	34e68693          	addi	a3,a3,846 # ffffffffc020cd88 <etext+0x1674>
ffffffffc0203a42:	00008617          	auipc	a2,0x8
ffffffffc0203a46:	10e60613          	addi	a2,a2,270 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203a4a:	1f500593          	li	a1,501
ffffffffc0203a4e:	00009517          	auipc	a0,0x9
ffffffffc0203a52:	c6a50513          	addi	a0,a0,-918 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203a56:	9f5fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203a5a:	002007b7          	lui	a5,0x200
ffffffffc0203a5e:	97a2                	add	a5,a5,s0
ffffffffc0203a60:	ffe00437          	lui	s0,0xffe00
ffffffffc0203a64:	8c7d                	and	s0,s0,a5
ffffffffc0203a66:	bf99                	j	ffffffffc02039bc <copy_range+0x84>
ffffffffc0203a68:	100027f3          	csrr	a5,sstatus
ffffffffc0203a6c:	8b89                	andi	a5,a5,2
ffffffffc0203a6e:	eba5                	bnez	a5,ffffffffc0203ade <copy_range+0x1a6>
ffffffffc0203a70:	00093797          	auipc	a5,0x93
ffffffffc0203a74:	e207b783          	ld	a5,-480(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc0203a78:	4505                	li	a0,1
ffffffffc0203a7a:	6f9c                	ld	a5,24(a5)
ffffffffc0203a7c:	9782                	jalr	a5
ffffffffc0203a7e:	8caa                	mv	s9,a0
ffffffffc0203a80:	100c8063          	beqz	s9,ffffffffc0203b80 <copy_range+0x248>
ffffffffc0203a84:	000ab783          	ld	a5,0(s5)
ffffffffc0203a88:	00080637          	lui	a2,0x80
ffffffffc0203a8c:	000b3683          	ld	a3,0(s6)
ffffffffc0203a90:	40fd0d33          	sub	s10,s10,a5
ffffffffc0203a94:	406d5d13          	srai	s10,s10,0x6
ffffffffc0203a98:	9d32                	add	s10,s10,a2
ffffffffc0203a9a:	017d75b3          	and	a1,s10,s7
ffffffffc0203a9e:	0d32                	slli	s10,s10,0xc
ffffffffc0203aa0:	0cd5f363          	bgeu	a1,a3,ffffffffc0203b66 <copy_range+0x22e>
ffffffffc0203aa4:	40fc87b3          	sub	a5,s9,a5
ffffffffc0203aa8:	8799                	srai	a5,a5,0x6
ffffffffc0203aaa:	97b2                	add	a5,a5,a2
ffffffffc0203aac:	0177f633          	and	a2,a5,s7
ffffffffc0203ab0:	07b2                	slli	a5,a5,0xc
ffffffffc0203ab2:	08d67d63          	bgeu	a2,a3,ffffffffc0203b4c <copy_range+0x214>
ffffffffc0203ab6:	00093517          	auipc	a0,0x93
ffffffffc0203aba:	df253503          	ld	a0,-526(a0) # ffffffffc02968a8 <va_pa_offset>
ffffffffc0203abe:	6605                	lui	a2,0x1
ffffffffc0203ac0:	00ad05b3          	add	a1,s10,a0
ffffffffc0203ac4:	953e                	add	a0,a0,a5
ffffffffc0203ac6:	437070ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc0203aca:	01fdf693          	andi	a3,s11,31
ffffffffc0203ace:	85e6                	mv	a1,s9
ffffffffc0203ad0:	8622                	mv	a2,s0
ffffffffc0203ad2:	8552                	mv	a0,s4
ffffffffc0203ad4:	f57fe0ef          	jal	ffffffffc0202a2a <page_insert>
ffffffffc0203ad8:	ee0501e3          	beqz	a0,ffffffffc02039ba <copy_range+0x82>
ffffffffc0203adc:	bfb9                	j	ffffffffc0203a3a <copy_range+0x102>
ffffffffc0203ade:	8fafd0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0203ae2:	00093797          	auipc	a5,0x93
ffffffffc0203ae6:	dae7b783          	ld	a5,-594(a5) # ffffffffc0296890 <pmm_manager>
ffffffffc0203aea:	4505                	li	a0,1
ffffffffc0203aec:	6f9c                	ld	a5,24(a5)
ffffffffc0203aee:	9782                	jalr	a5
ffffffffc0203af0:	8caa                	mv	s9,a0
ffffffffc0203af2:	8e0fd0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0203af6:	b769                	j	ffffffffc0203a80 <copy_range+0x148>
ffffffffc0203af8:	5571                	li	a0,-4
ffffffffc0203afa:	b5e9                	j	ffffffffc02039c4 <copy_range+0x8c>
ffffffffc0203afc:	00009697          	auipc	a3,0x9
ffffffffc0203b00:	26c68693          	addi	a3,a3,620 # ffffffffc020cd68 <etext+0x1654>
ffffffffc0203b04:	00008617          	auipc	a2,0x8
ffffffffc0203b08:	04c60613          	addi	a2,a2,76 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203b0c:	1ce00593          	li	a1,462
ffffffffc0203b10:	00009517          	auipc	a0,0x9
ffffffffc0203b14:	ba850513          	addi	a0,a0,-1112 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203b18:	933fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203b1c:	00009617          	auipc	a2,0x9
ffffffffc0203b20:	b7c60613          	addi	a2,a2,-1156 # ffffffffc020c698 <etext+0xf84>
ffffffffc0203b24:	06900593          	li	a1,105
ffffffffc0203b28:	00009517          	auipc	a0,0x9
ffffffffc0203b2c:	ac850513          	addi	a0,a0,-1336 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc0203b30:	91bfc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203b34:	00009617          	auipc	a2,0x9
ffffffffc0203b38:	e1460613          	addi	a2,a2,-492 # ffffffffc020c948 <etext+0x1234>
ffffffffc0203b3c:	07f00593          	li	a1,127
ffffffffc0203b40:	00009517          	auipc	a0,0x9
ffffffffc0203b44:	ab050513          	addi	a0,a0,-1360 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc0203b48:	903fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203b4c:	86be                	mv	a3,a5
ffffffffc0203b4e:	00009617          	auipc	a2,0x9
ffffffffc0203b52:	a7a60613          	addi	a2,a2,-1414 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc0203b56:	07100593          	li	a1,113
ffffffffc0203b5a:	00009517          	auipc	a0,0x9
ffffffffc0203b5e:	a9650513          	addi	a0,a0,-1386 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc0203b62:	8e9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203b66:	86ea                	mv	a3,s10
ffffffffc0203b68:	00009617          	auipc	a2,0x9
ffffffffc0203b6c:	a6060613          	addi	a2,a2,-1440 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc0203b70:	07100593          	li	a1,113
ffffffffc0203b74:	00009517          	auipc	a0,0x9
ffffffffc0203b78:	a7c50513          	addi	a0,a0,-1412 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc0203b7c:	8cffc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203b80:	00009697          	auipc	a3,0x9
ffffffffc0203b84:	1f868693          	addi	a3,a3,504 # ffffffffc020cd78 <etext+0x1664>
ffffffffc0203b88:	00008617          	auipc	a2,0x8
ffffffffc0203b8c:	fc860613          	addi	a2,a2,-56 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203b90:	1ec00593          	li	a1,492
ffffffffc0203b94:	00009517          	auipc	a0,0x9
ffffffffc0203b98:	b2450513          	addi	a0,a0,-1244 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203b9c:	8affc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203ba0:	00009697          	auipc	a3,0x9
ffffffffc0203ba4:	b8068693          	addi	a3,a3,-1152 # ffffffffc020c720 <etext+0x100c>
ffffffffc0203ba8:	00008617          	auipc	a2,0x8
ffffffffc0203bac:	fa860613          	addi	a2,a2,-88 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203bb0:	1b600593          	li	a1,438
ffffffffc0203bb4:	00009517          	auipc	a0,0x9
ffffffffc0203bb8:	b0450513          	addi	a0,a0,-1276 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203bbc:	88ffc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203bc0:	00009697          	auipc	a3,0x9
ffffffffc0203bc4:	b3068693          	addi	a3,a3,-1232 # ffffffffc020c6f0 <etext+0xfdc>
ffffffffc0203bc8:	00008617          	auipc	a2,0x8
ffffffffc0203bcc:	f8860613          	addi	a2,a2,-120 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203bd0:	1b500593          	li	a1,437
ffffffffc0203bd4:	00009517          	auipc	a0,0x9
ffffffffc0203bd8:	ae450513          	addi	a0,a0,-1308 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203bdc:	86ffc0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0203be0 <pgdir_alloc_page>:
ffffffffc0203be0:	7139                	addi	sp,sp,-64
ffffffffc0203be2:	f426                	sd	s1,40(sp)
ffffffffc0203be4:	f04a                	sd	s2,32(sp)
ffffffffc0203be6:	ec4e                	sd	s3,24(sp)
ffffffffc0203be8:	fc06                	sd	ra,56(sp)
ffffffffc0203bea:	f822                	sd	s0,48(sp)
ffffffffc0203bec:	892a                	mv	s2,a0
ffffffffc0203bee:	84ae                	mv	s1,a1
ffffffffc0203bf0:	89b2                	mv	s3,a2
ffffffffc0203bf2:	100027f3          	csrr	a5,sstatus
ffffffffc0203bf6:	8b89                	andi	a5,a5,2
ffffffffc0203bf8:	ebb5                	bnez	a5,ffffffffc0203c6c <pgdir_alloc_page+0x8c>
ffffffffc0203bfa:	00093417          	auipc	s0,0x93
ffffffffc0203bfe:	c9640413          	addi	s0,s0,-874 # ffffffffc0296890 <pmm_manager>
ffffffffc0203c02:	601c                	ld	a5,0(s0)
ffffffffc0203c04:	4505                	li	a0,1
ffffffffc0203c06:	6f9c                	ld	a5,24(a5)
ffffffffc0203c08:	9782                	jalr	a5
ffffffffc0203c0a:	85aa                	mv	a1,a0
ffffffffc0203c0c:	c5b9                	beqz	a1,ffffffffc0203c5a <pgdir_alloc_page+0x7a>
ffffffffc0203c0e:	86ce                	mv	a3,s3
ffffffffc0203c10:	854a                	mv	a0,s2
ffffffffc0203c12:	8626                	mv	a2,s1
ffffffffc0203c14:	e42e                	sd	a1,8(sp)
ffffffffc0203c16:	e15fe0ef          	jal	ffffffffc0202a2a <page_insert>
ffffffffc0203c1a:	65a2                	ld	a1,8(sp)
ffffffffc0203c1c:	e515                	bnez	a0,ffffffffc0203c48 <pgdir_alloc_page+0x68>
ffffffffc0203c1e:	4198                	lw	a4,0(a1)
ffffffffc0203c20:	fd84                	sd	s1,56(a1)
ffffffffc0203c22:	4785                	li	a5,1
ffffffffc0203c24:	02f70c63          	beq	a4,a5,ffffffffc0203c5c <pgdir_alloc_page+0x7c>
ffffffffc0203c28:	00009697          	auipc	a3,0x9
ffffffffc0203c2c:	17068693          	addi	a3,a3,368 # ffffffffc020cd98 <etext+0x1684>
ffffffffc0203c30:	00008617          	auipc	a2,0x8
ffffffffc0203c34:	f2060613          	addi	a2,a2,-224 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203c38:	23e00593          	li	a1,574
ffffffffc0203c3c:	00009517          	auipc	a0,0x9
ffffffffc0203c40:	a7c50513          	addi	a0,a0,-1412 # ffffffffc020c6b8 <etext+0xfa4>
ffffffffc0203c44:	807fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203c48:	100027f3          	csrr	a5,sstatus
ffffffffc0203c4c:	8b89                	andi	a5,a5,2
ffffffffc0203c4e:	ef95                	bnez	a5,ffffffffc0203c8a <pgdir_alloc_page+0xaa>
ffffffffc0203c50:	601c                	ld	a5,0(s0)
ffffffffc0203c52:	852e                	mv	a0,a1
ffffffffc0203c54:	4585                	li	a1,1
ffffffffc0203c56:	739c                	ld	a5,32(a5)
ffffffffc0203c58:	9782                	jalr	a5
ffffffffc0203c5a:	4581                	li	a1,0
ffffffffc0203c5c:	70e2                	ld	ra,56(sp)
ffffffffc0203c5e:	7442                	ld	s0,48(sp)
ffffffffc0203c60:	74a2                	ld	s1,40(sp)
ffffffffc0203c62:	7902                	ld	s2,32(sp)
ffffffffc0203c64:	69e2                	ld	s3,24(sp)
ffffffffc0203c66:	852e                	mv	a0,a1
ffffffffc0203c68:	6121                	addi	sp,sp,64
ffffffffc0203c6a:	8082                	ret
ffffffffc0203c6c:	f6dfc0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0203c70:	00093417          	auipc	s0,0x93
ffffffffc0203c74:	c2040413          	addi	s0,s0,-992 # ffffffffc0296890 <pmm_manager>
ffffffffc0203c78:	601c                	ld	a5,0(s0)
ffffffffc0203c7a:	4505                	li	a0,1
ffffffffc0203c7c:	6f9c                	ld	a5,24(a5)
ffffffffc0203c7e:	9782                	jalr	a5
ffffffffc0203c80:	e42a                	sd	a0,8(sp)
ffffffffc0203c82:	f51fc0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0203c86:	65a2                	ld	a1,8(sp)
ffffffffc0203c88:	b751                	j	ffffffffc0203c0c <pgdir_alloc_page+0x2c>
ffffffffc0203c8a:	f4ffc0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0203c8e:	601c                	ld	a5,0(s0)
ffffffffc0203c90:	6522                	ld	a0,8(sp)
ffffffffc0203c92:	4585                	li	a1,1
ffffffffc0203c94:	739c                	ld	a5,32(a5)
ffffffffc0203c96:	9782                	jalr	a5
ffffffffc0203c98:	f3bfc0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0203c9c:	bf7d                	j	ffffffffc0203c5a <pgdir_alloc_page+0x7a>

ffffffffc0203c9e <check_vma_overlap.part.0>:
ffffffffc0203c9e:	1141                	addi	sp,sp,-16
ffffffffc0203ca0:	00009697          	auipc	a3,0x9
ffffffffc0203ca4:	11068693          	addi	a3,a3,272 # ffffffffc020cdb0 <etext+0x169c>
ffffffffc0203ca8:	00008617          	auipc	a2,0x8
ffffffffc0203cac:	ea860613          	addi	a2,a2,-344 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203cb0:	07400593          	li	a1,116
ffffffffc0203cb4:	00009517          	auipc	a0,0x9
ffffffffc0203cb8:	11c50513          	addi	a0,a0,284 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc0203cbc:	e406                	sd	ra,8(sp)
ffffffffc0203cbe:	f8cfc0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0203cc2 <mm_create>:
ffffffffc0203cc2:	1101                	addi	sp,sp,-32
ffffffffc0203cc4:	05800513          	li	a0,88
ffffffffc0203cc8:	ec06                	sd	ra,24(sp)
ffffffffc0203cca:	af6fe0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0203cce:	87aa                	mv	a5,a0
ffffffffc0203cd0:	c505                	beqz	a0,ffffffffc0203cf8 <mm_create+0x36>
ffffffffc0203cd2:	e788                	sd	a0,8(a5)
ffffffffc0203cd4:	e388                	sd	a0,0(a5)
ffffffffc0203cd6:	00053823          	sd	zero,16(a0)
ffffffffc0203cda:	00053c23          	sd	zero,24(a0)
ffffffffc0203cde:	02052023          	sw	zero,32(a0)
ffffffffc0203ce2:	02053423          	sd	zero,40(a0)
ffffffffc0203ce6:	02052823          	sw	zero,48(a0)
ffffffffc0203cea:	4585                	li	a1,1
ffffffffc0203cec:	03850513          	addi	a0,a0,56
ffffffffc0203cf0:	e43e                	sd	a5,8(sp)
ffffffffc0203cf2:	147000ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc0203cf6:	67a2                	ld	a5,8(sp)
ffffffffc0203cf8:	60e2                	ld	ra,24(sp)
ffffffffc0203cfa:	853e                	mv	a0,a5
ffffffffc0203cfc:	6105                	addi	sp,sp,32
ffffffffc0203cfe:	8082                	ret

ffffffffc0203d00 <find_vma>:
ffffffffc0203d00:	c505                	beqz	a0,ffffffffc0203d28 <find_vma+0x28>
ffffffffc0203d02:	691c                	ld	a5,16(a0)
ffffffffc0203d04:	c781                	beqz	a5,ffffffffc0203d0c <find_vma+0xc>
ffffffffc0203d06:	6798                	ld	a4,8(a5)
ffffffffc0203d08:	02e5f363          	bgeu	a1,a4,ffffffffc0203d2e <find_vma+0x2e>
ffffffffc0203d0c:	651c                	ld	a5,8(a0)
ffffffffc0203d0e:	00f50d63          	beq	a0,a5,ffffffffc0203d28 <find_vma+0x28>
ffffffffc0203d12:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203d16:	00e5e663          	bltu	a1,a4,ffffffffc0203d22 <find_vma+0x22>
ffffffffc0203d1a:	ff07b703          	ld	a4,-16(a5)
ffffffffc0203d1e:	00e5ee63          	bltu	a1,a4,ffffffffc0203d3a <find_vma+0x3a>
ffffffffc0203d22:	679c                	ld	a5,8(a5)
ffffffffc0203d24:	fef517e3          	bne	a0,a5,ffffffffc0203d12 <find_vma+0x12>
ffffffffc0203d28:	4781                	li	a5,0
ffffffffc0203d2a:	853e                	mv	a0,a5
ffffffffc0203d2c:	8082                	ret
ffffffffc0203d2e:	6b98                	ld	a4,16(a5)
ffffffffc0203d30:	fce5fee3          	bgeu	a1,a4,ffffffffc0203d0c <find_vma+0xc>
ffffffffc0203d34:	e91c                	sd	a5,16(a0)
ffffffffc0203d36:	853e                	mv	a0,a5
ffffffffc0203d38:	8082                	ret
ffffffffc0203d3a:	1781                	addi	a5,a5,-32
ffffffffc0203d3c:	e91c                	sd	a5,16(a0)
ffffffffc0203d3e:	bfe5                	j	ffffffffc0203d36 <find_vma+0x36>

ffffffffc0203d40 <insert_vma_struct>:
ffffffffc0203d40:	6590                	ld	a2,8(a1)
ffffffffc0203d42:	0105b803          	ld	a6,16(a1)
ffffffffc0203d46:	1141                	addi	sp,sp,-16
ffffffffc0203d48:	e406                	sd	ra,8(sp)
ffffffffc0203d4a:	87aa                	mv	a5,a0
ffffffffc0203d4c:	01066763          	bltu	a2,a6,ffffffffc0203d5a <insert_vma_struct+0x1a>
ffffffffc0203d50:	a8b9                	j	ffffffffc0203dae <insert_vma_struct+0x6e>
ffffffffc0203d52:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203d56:	04e66763          	bltu	a2,a4,ffffffffc0203da4 <insert_vma_struct+0x64>
ffffffffc0203d5a:	86be                	mv	a3,a5
ffffffffc0203d5c:	679c                	ld	a5,8(a5)
ffffffffc0203d5e:	fef51ae3          	bne	a0,a5,ffffffffc0203d52 <insert_vma_struct+0x12>
ffffffffc0203d62:	02a68463          	beq	a3,a0,ffffffffc0203d8a <insert_vma_struct+0x4a>
ffffffffc0203d66:	ff06b703          	ld	a4,-16(a3)
ffffffffc0203d6a:	fe86b883          	ld	a7,-24(a3)
ffffffffc0203d6e:	08e8f063          	bgeu	a7,a4,ffffffffc0203dee <insert_vma_struct+0xae>
ffffffffc0203d72:	04e66e63          	bltu	a2,a4,ffffffffc0203dce <insert_vma_struct+0x8e>
ffffffffc0203d76:	00f50a63          	beq	a0,a5,ffffffffc0203d8a <insert_vma_struct+0x4a>
ffffffffc0203d7a:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203d7e:	05076863          	bltu	a4,a6,ffffffffc0203dce <insert_vma_struct+0x8e>
ffffffffc0203d82:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203d86:	02c77263          	bgeu	a4,a2,ffffffffc0203daa <insert_vma_struct+0x6a>
ffffffffc0203d8a:	5118                	lw	a4,32(a0)
ffffffffc0203d8c:	e188                	sd	a0,0(a1)
ffffffffc0203d8e:	02058613          	addi	a2,a1,32
ffffffffc0203d92:	e390                	sd	a2,0(a5)
ffffffffc0203d94:	e690                	sd	a2,8(a3)
ffffffffc0203d96:	60a2                	ld	ra,8(sp)
ffffffffc0203d98:	f59c                	sd	a5,40(a1)
ffffffffc0203d9a:	f194                	sd	a3,32(a1)
ffffffffc0203d9c:	2705                	addiw	a4,a4,1
ffffffffc0203d9e:	d118                	sw	a4,32(a0)
ffffffffc0203da0:	0141                	addi	sp,sp,16
ffffffffc0203da2:	8082                	ret
ffffffffc0203da4:	fca691e3          	bne	a3,a0,ffffffffc0203d66 <insert_vma_struct+0x26>
ffffffffc0203da8:	bfd9                	j	ffffffffc0203d7e <insert_vma_struct+0x3e>
ffffffffc0203daa:	ef5ff0ef          	jal	ffffffffc0203c9e <check_vma_overlap.part.0>
ffffffffc0203dae:	00009697          	auipc	a3,0x9
ffffffffc0203db2:	03268693          	addi	a3,a3,50 # ffffffffc020cde0 <etext+0x16cc>
ffffffffc0203db6:	00008617          	auipc	a2,0x8
ffffffffc0203dba:	d9a60613          	addi	a2,a2,-614 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203dbe:	07a00593          	li	a1,122
ffffffffc0203dc2:	00009517          	auipc	a0,0x9
ffffffffc0203dc6:	00e50513          	addi	a0,a0,14 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc0203dca:	e80fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203dce:	00009697          	auipc	a3,0x9
ffffffffc0203dd2:	05268693          	addi	a3,a3,82 # ffffffffc020ce20 <etext+0x170c>
ffffffffc0203dd6:	00008617          	auipc	a2,0x8
ffffffffc0203dda:	d7a60613          	addi	a2,a2,-646 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203dde:	07300593          	li	a1,115
ffffffffc0203de2:	00009517          	auipc	a0,0x9
ffffffffc0203de6:	fee50513          	addi	a0,a0,-18 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc0203dea:	e60fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203dee:	00009697          	auipc	a3,0x9
ffffffffc0203df2:	01268693          	addi	a3,a3,18 # ffffffffc020ce00 <etext+0x16ec>
ffffffffc0203df6:	00008617          	auipc	a2,0x8
ffffffffc0203dfa:	d5a60613          	addi	a2,a2,-678 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203dfe:	07200593          	li	a1,114
ffffffffc0203e02:	00009517          	auipc	a0,0x9
ffffffffc0203e06:	fce50513          	addi	a0,a0,-50 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc0203e0a:	e40fc0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0203e0e <mm_destroy>:
ffffffffc0203e0e:	591c                	lw	a5,48(a0)
ffffffffc0203e10:	1141                	addi	sp,sp,-16
ffffffffc0203e12:	e406                	sd	ra,8(sp)
ffffffffc0203e14:	e022                	sd	s0,0(sp)
ffffffffc0203e16:	e78d                	bnez	a5,ffffffffc0203e40 <mm_destroy+0x32>
ffffffffc0203e18:	842a                	mv	s0,a0
ffffffffc0203e1a:	6508                	ld	a0,8(a0)
ffffffffc0203e1c:	00a40c63          	beq	s0,a0,ffffffffc0203e34 <mm_destroy+0x26>
ffffffffc0203e20:	6118                	ld	a4,0(a0)
ffffffffc0203e22:	651c                	ld	a5,8(a0)
ffffffffc0203e24:	1501                	addi	a0,a0,-32
ffffffffc0203e26:	e71c                	sd	a5,8(a4)
ffffffffc0203e28:	e398                	sd	a4,0(a5)
ffffffffc0203e2a:	a3cfe0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0203e2e:	6408                	ld	a0,8(s0)
ffffffffc0203e30:	fea418e3          	bne	s0,a0,ffffffffc0203e20 <mm_destroy+0x12>
ffffffffc0203e34:	8522                	mv	a0,s0
ffffffffc0203e36:	6402                	ld	s0,0(sp)
ffffffffc0203e38:	60a2                	ld	ra,8(sp)
ffffffffc0203e3a:	0141                	addi	sp,sp,16
ffffffffc0203e3c:	a2afe06f          	j	ffffffffc0202066 <kfree>
ffffffffc0203e40:	00009697          	auipc	a3,0x9
ffffffffc0203e44:	00068693          	mv	a3,a3
ffffffffc0203e48:	00008617          	auipc	a2,0x8
ffffffffc0203e4c:	d0860613          	addi	a2,a2,-760 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203e50:	09e00593          	li	a1,158
ffffffffc0203e54:	00009517          	auipc	a0,0x9
ffffffffc0203e58:	f7c50513          	addi	a0,a0,-132 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc0203e5c:	deefc0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0203e60 <mm_map>:
ffffffffc0203e60:	6785                	lui	a5,0x1
ffffffffc0203e62:	17fd                	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0203e64:	963e                	add	a2,a2,a5
ffffffffc0203e66:	4785                	li	a5,1
ffffffffc0203e68:	7139                	addi	sp,sp,-64
ffffffffc0203e6a:	962e                	add	a2,a2,a1
ffffffffc0203e6c:	787d                	lui	a6,0xfffff
ffffffffc0203e6e:	07fe                	slli	a5,a5,0x1f
ffffffffc0203e70:	f822                	sd	s0,48(sp)
ffffffffc0203e72:	f426                	sd	s1,40(sp)
ffffffffc0203e74:	01067433          	and	s0,a2,a6
ffffffffc0203e78:	0105f4b3          	and	s1,a1,a6
ffffffffc0203e7c:	0785                	addi	a5,a5,1
ffffffffc0203e7e:	0084b633          	sltu	a2,s1,s0
ffffffffc0203e82:	00f437b3          	sltu	a5,s0,a5
ffffffffc0203e86:	00163613          	seqz	a2,a2
ffffffffc0203e8a:	0017b793          	seqz	a5,a5
ffffffffc0203e8e:	fc06                	sd	ra,56(sp)
ffffffffc0203e90:	8fd1                	or	a5,a5,a2
ffffffffc0203e92:	ebbd                	bnez	a5,ffffffffc0203f08 <mm_map+0xa8>
ffffffffc0203e94:	002007b7          	lui	a5,0x200
ffffffffc0203e98:	06f4e863          	bltu	s1,a5,ffffffffc0203f08 <mm_map+0xa8>
ffffffffc0203e9c:	f04a                	sd	s2,32(sp)
ffffffffc0203e9e:	ec4e                	sd	s3,24(sp)
ffffffffc0203ea0:	e852                	sd	s4,16(sp)
ffffffffc0203ea2:	892a                	mv	s2,a0
ffffffffc0203ea4:	89ba                	mv	s3,a4
ffffffffc0203ea6:	8a36                	mv	s4,a3
ffffffffc0203ea8:	c135                	beqz	a0,ffffffffc0203f0c <mm_map+0xac>
ffffffffc0203eaa:	85a6                	mv	a1,s1
ffffffffc0203eac:	e55ff0ef          	jal	ffffffffc0203d00 <find_vma>
ffffffffc0203eb0:	c501                	beqz	a0,ffffffffc0203eb8 <mm_map+0x58>
ffffffffc0203eb2:	651c                	ld	a5,8(a0)
ffffffffc0203eb4:	0487e763          	bltu	a5,s0,ffffffffc0203f02 <mm_map+0xa2>
ffffffffc0203eb8:	03000513          	li	a0,48
ffffffffc0203ebc:	904fe0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0203ec0:	85aa                	mv	a1,a0
ffffffffc0203ec2:	5571                	li	a0,-4
ffffffffc0203ec4:	c59d                	beqz	a1,ffffffffc0203ef2 <mm_map+0x92>
ffffffffc0203ec6:	e584                	sd	s1,8(a1)
ffffffffc0203ec8:	e980                	sd	s0,16(a1)
ffffffffc0203eca:	0145ac23          	sw	s4,24(a1)
ffffffffc0203ece:	854a                	mv	a0,s2
ffffffffc0203ed0:	e42e                	sd	a1,8(sp)
ffffffffc0203ed2:	e6fff0ef          	jal	ffffffffc0203d40 <insert_vma_struct>
ffffffffc0203ed6:	65a2                	ld	a1,8(sp)
ffffffffc0203ed8:	00098463          	beqz	s3,ffffffffc0203ee0 <mm_map+0x80>
ffffffffc0203edc:	00b9b023          	sd	a1,0(s3) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0203ee0:	7902                	ld	s2,32(sp)
ffffffffc0203ee2:	69e2                	ld	s3,24(sp)
ffffffffc0203ee4:	6a42                	ld	s4,16(sp)
ffffffffc0203ee6:	4501                	li	a0,0
ffffffffc0203ee8:	70e2                	ld	ra,56(sp)
ffffffffc0203eea:	7442                	ld	s0,48(sp)
ffffffffc0203eec:	74a2                	ld	s1,40(sp)
ffffffffc0203eee:	6121                	addi	sp,sp,64
ffffffffc0203ef0:	8082                	ret
ffffffffc0203ef2:	70e2                	ld	ra,56(sp)
ffffffffc0203ef4:	7442                	ld	s0,48(sp)
ffffffffc0203ef6:	7902                	ld	s2,32(sp)
ffffffffc0203ef8:	69e2                	ld	s3,24(sp)
ffffffffc0203efa:	6a42                	ld	s4,16(sp)
ffffffffc0203efc:	74a2                	ld	s1,40(sp)
ffffffffc0203efe:	6121                	addi	sp,sp,64
ffffffffc0203f00:	8082                	ret
ffffffffc0203f02:	7902                	ld	s2,32(sp)
ffffffffc0203f04:	69e2                	ld	s3,24(sp)
ffffffffc0203f06:	6a42                	ld	s4,16(sp)
ffffffffc0203f08:	5575                	li	a0,-3
ffffffffc0203f0a:	bff9                	j	ffffffffc0203ee8 <mm_map+0x88>
ffffffffc0203f0c:	00009697          	auipc	a3,0x9
ffffffffc0203f10:	f4c68693          	addi	a3,a3,-180 # ffffffffc020ce58 <etext+0x1744>
ffffffffc0203f14:	00008617          	auipc	a2,0x8
ffffffffc0203f18:	c3c60613          	addi	a2,a2,-964 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203f1c:	0b300593          	li	a1,179
ffffffffc0203f20:	00009517          	auipc	a0,0x9
ffffffffc0203f24:	eb050513          	addi	a0,a0,-336 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc0203f28:	d22fc0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0203f2c <dup_mmap>:
ffffffffc0203f2c:	7139                	addi	sp,sp,-64
ffffffffc0203f2e:	fc06                	sd	ra,56(sp)
ffffffffc0203f30:	f822                	sd	s0,48(sp)
ffffffffc0203f32:	f426                	sd	s1,40(sp)
ffffffffc0203f34:	f04a                	sd	s2,32(sp)
ffffffffc0203f36:	ec4e                	sd	s3,24(sp)
ffffffffc0203f38:	e852                	sd	s4,16(sp)
ffffffffc0203f3a:	e456                	sd	s5,8(sp)
ffffffffc0203f3c:	c525                	beqz	a0,ffffffffc0203fa4 <dup_mmap+0x78>
ffffffffc0203f3e:	892a                	mv	s2,a0
ffffffffc0203f40:	84ae                	mv	s1,a1
ffffffffc0203f42:	842e                	mv	s0,a1
ffffffffc0203f44:	c1a5                	beqz	a1,ffffffffc0203fa4 <dup_mmap+0x78>
ffffffffc0203f46:	6000                	ld	s0,0(s0)
ffffffffc0203f48:	04848c63          	beq	s1,s0,ffffffffc0203fa0 <dup_mmap+0x74>
ffffffffc0203f4c:	03000513          	li	a0,48
ffffffffc0203f50:	fe843a83          	ld	s5,-24(s0)
ffffffffc0203f54:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203f58:	ff842983          	lw	s3,-8(s0)
ffffffffc0203f5c:	864fe0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0203f60:	c515                	beqz	a0,ffffffffc0203f8c <dup_mmap+0x60>
ffffffffc0203f62:	85aa                	mv	a1,a0
ffffffffc0203f64:	01553423          	sd	s5,8(a0)
ffffffffc0203f68:	01453823          	sd	s4,16(a0)
ffffffffc0203f6c:	01352c23          	sw	s3,24(a0)
ffffffffc0203f70:	854a                	mv	a0,s2
ffffffffc0203f72:	dcfff0ef          	jal	ffffffffc0203d40 <insert_vma_struct>
ffffffffc0203f76:	ff043683          	ld	a3,-16(s0)
ffffffffc0203f7a:	fe843603          	ld	a2,-24(s0)
ffffffffc0203f7e:	6c8c                	ld	a1,24(s1)
ffffffffc0203f80:	01893503          	ld	a0,24(s2)
ffffffffc0203f84:	4701                	li	a4,0
ffffffffc0203f86:	9b3ff0ef          	jal	ffffffffc0203938 <copy_range>
ffffffffc0203f8a:	dd55                	beqz	a0,ffffffffc0203f46 <dup_mmap+0x1a>
ffffffffc0203f8c:	5571                	li	a0,-4
ffffffffc0203f8e:	70e2                	ld	ra,56(sp)
ffffffffc0203f90:	7442                	ld	s0,48(sp)
ffffffffc0203f92:	74a2                	ld	s1,40(sp)
ffffffffc0203f94:	7902                	ld	s2,32(sp)
ffffffffc0203f96:	69e2                	ld	s3,24(sp)
ffffffffc0203f98:	6a42                	ld	s4,16(sp)
ffffffffc0203f9a:	6aa2                	ld	s5,8(sp)
ffffffffc0203f9c:	6121                	addi	sp,sp,64
ffffffffc0203f9e:	8082                	ret
ffffffffc0203fa0:	4501                	li	a0,0
ffffffffc0203fa2:	b7f5                	j	ffffffffc0203f8e <dup_mmap+0x62>
ffffffffc0203fa4:	00009697          	auipc	a3,0x9
ffffffffc0203fa8:	ec468693          	addi	a3,a3,-316 # ffffffffc020ce68 <etext+0x1754>
ffffffffc0203fac:	00008617          	auipc	a2,0x8
ffffffffc0203fb0:	ba460613          	addi	a2,a2,-1116 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0203fb4:	0cf00593          	li	a1,207
ffffffffc0203fb8:	00009517          	auipc	a0,0x9
ffffffffc0203fbc:	e1850513          	addi	a0,a0,-488 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc0203fc0:	c8afc0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0203fc4 <exit_mmap>:
ffffffffc0203fc4:	1101                	addi	sp,sp,-32
ffffffffc0203fc6:	ec06                	sd	ra,24(sp)
ffffffffc0203fc8:	e822                	sd	s0,16(sp)
ffffffffc0203fca:	e426                	sd	s1,8(sp)
ffffffffc0203fcc:	e04a                	sd	s2,0(sp)
ffffffffc0203fce:	c531                	beqz	a0,ffffffffc020401a <exit_mmap+0x56>
ffffffffc0203fd0:	591c                	lw	a5,48(a0)
ffffffffc0203fd2:	84aa                	mv	s1,a0
ffffffffc0203fd4:	e3b9                	bnez	a5,ffffffffc020401a <exit_mmap+0x56>
ffffffffc0203fd6:	6500                	ld	s0,8(a0)
ffffffffc0203fd8:	01853903          	ld	s2,24(a0)
ffffffffc0203fdc:	02850663          	beq	a0,s0,ffffffffc0204008 <exit_mmap+0x44>
ffffffffc0203fe0:	ff043603          	ld	a2,-16(s0)
ffffffffc0203fe4:	fe843583          	ld	a1,-24(s0)
ffffffffc0203fe8:	854a                	mv	a0,s2
ffffffffc0203fea:	dbcfe0ef          	jal	ffffffffc02025a6 <unmap_range>
ffffffffc0203fee:	6400                	ld	s0,8(s0)
ffffffffc0203ff0:	fe8498e3          	bne	s1,s0,ffffffffc0203fe0 <exit_mmap+0x1c>
ffffffffc0203ff4:	6400                	ld	s0,8(s0)
ffffffffc0203ff6:	00848c63          	beq	s1,s0,ffffffffc020400e <exit_mmap+0x4a>
ffffffffc0203ffa:	ff043603          	ld	a2,-16(s0)
ffffffffc0203ffe:	fe843583          	ld	a1,-24(s0)
ffffffffc0204002:	854a                	mv	a0,s2
ffffffffc0204004:	ed6fe0ef          	jal	ffffffffc02026da <exit_range>
ffffffffc0204008:	6400                	ld	s0,8(s0)
ffffffffc020400a:	fe8498e3          	bne	s1,s0,ffffffffc0203ffa <exit_mmap+0x36>
ffffffffc020400e:	60e2                	ld	ra,24(sp)
ffffffffc0204010:	6442                	ld	s0,16(sp)
ffffffffc0204012:	64a2                	ld	s1,8(sp)
ffffffffc0204014:	6902                	ld	s2,0(sp)
ffffffffc0204016:	6105                	addi	sp,sp,32
ffffffffc0204018:	8082                	ret
ffffffffc020401a:	00009697          	auipc	a3,0x9
ffffffffc020401e:	e6e68693          	addi	a3,a3,-402 # ffffffffc020ce88 <etext+0x1774>
ffffffffc0204022:	00008617          	auipc	a2,0x8
ffffffffc0204026:	b2e60613          	addi	a2,a2,-1234 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020402a:	0e800593          	li	a1,232
ffffffffc020402e:	00009517          	auipc	a0,0x9
ffffffffc0204032:	da250513          	addi	a0,a0,-606 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc0204036:	c14fc0ef          	jal	ffffffffc020044a <__panic>

ffffffffc020403a <vmm_init>:
ffffffffc020403a:	7179                	addi	sp,sp,-48
ffffffffc020403c:	05800513          	li	a0,88
ffffffffc0204040:	f406                	sd	ra,40(sp)
ffffffffc0204042:	f022                	sd	s0,32(sp)
ffffffffc0204044:	ec26                	sd	s1,24(sp)
ffffffffc0204046:	e84a                	sd	s2,16(sp)
ffffffffc0204048:	e44e                	sd	s3,8(sp)
ffffffffc020404a:	e052                	sd	s4,0(sp)
ffffffffc020404c:	f75fd0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0204050:	16050f63          	beqz	a0,ffffffffc02041ce <vmm_init+0x194>
ffffffffc0204054:	e508                	sd	a0,8(a0)
ffffffffc0204056:	e108                	sd	a0,0(a0)
ffffffffc0204058:	00053823          	sd	zero,16(a0)
ffffffffc020405c:	00053c23          	sd	zero,24(a0)
ffffffffc0204060:	02052023          	sw	zero,32(a0)
ffffffffc0204064:	02053423          	sd	zero,40(a0)
ffffffffc0204068:	02052823          	sw	zero,48(a0)
ffffffffc020406c:	842a                	mv	s0,a0
ffffffffc020406e:	4585                	li	a1,1
ffffffffc0204070:	03850513          	addi	a0,a0,56
ffffffffc0204074:	5c4000ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc0204078:	03200493          	li	s1,50
ffffffffc020407c:	03000513          	li	a0,48
ffffffffc0204080:	f41fd0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0204084:	12050563          	beqz	a0,ffffffffc02041ae <vmm_init+0x174>
ffffffffc0204088:	00248793          	addi	a5,s1,2
ffffffffc020408c:	e504                	sd	s1,8(a0)
ffffffffc020408e:	00052c23          	sw	zero,24(a0)
ffffffffc0204092:	e91c                	sd	a5,16(a0)
ffffffffc0204094:	85aa                	mv	a1,a0
ffffffffc0204096:	14ed                	addi	s1,s1,-5
ffffffffc0204098:	8522                	mv	a0,s0
ffffffffc020409a:	ca7ff0ef          	jal	ffffffffc0203d40 <insert_vma_struct>
ffffffffc020409e:	fcf9                	bnez	s1,ffffffffc020407c <vmm_init+0x42>
ffffffffc02040a0:	03700493          	li	s1,55
ffffffffc02040a4:	1f900913          	li	s2,505
ffffffffc02040a8:	03000513          	li	a0,48
ffffffffc02040ac:	f15fd0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc02040b0:	12050f63          	beqz	a0,ffffffffc02041ee <vmm_init+0x1b4>
ffffffffc02040b4:	00248793          	addi	a5,s1,2
ffffffffc02040b8:	e504                	sd	s1,8(a0)
ffffffffc02040ba:	00052c23          	sw	zero,24(a0)
ffffffffc02040be:	e91c                	sd	a5,16(a0)
ffffffffc02040c0:	85aa                	mv	a1,a0
ffffffffc02040c2:	0495                	addi	s1,s1,5
ffffffffc02040c4:	8522                	mv	a0,s0
ffffffffc02040c6:	c7bff0ef          	jal	ffffffffc0203d40 <insert_vma_struct>
ffffffffc02040ca:	fd249fe3          	bne	s1,s2,ffffffffc02040a8 <vmm_init+0x6e>
ffffffffc02040ce:	641c                	ld	a5,8(s0)
ffffffffc02040d0:	471d                	li	a4,7
ffffffffc02040d2:	1fb00593          	li	a1,507
ffffffffc02040d6:	1ef40c63          	beq	s0,a5,ffffffffc02042ce <vmm_init+0x294>
ffffffffc02040da:	fe87b603          	ld	a2,-24(a5) # 1fffe8 <_binary_bin_sfs_img_size+0x18ace8>
ffffffffc02040de:	ffe70693          	addi	a3,a4,-2
ffffffffc02040e2:	12d61663          	bne	a2,a3,ffffffffc020420e <vmm_init+0x1d4>
ffffffffc02040e6:	ff07b683          	ld	a3,-16(a5)
ffffffffc02040ea:	12e69263          	bne	a3,a4,ffffffffc020420e <vmm_init+0x1d4>
ffffffffc02040ee:	0715                	addi	a4,a4,5
ffffffffc02040f0:	679c                	ld	a5,8(a5)
ffffffffc02040f2:	feb712e3          	bne	a4,a1,ffffffffc02040d6 <vmm_init+0x9c>
ffffffffc02040f6:	491d                	li	s2,7
ffffffffc02040f8:	4495                	li	s1,5
ffffffffc02040fa:	85a6                	mv	a1,s1
ffffffffc02040fc:	8522                	mv	a0,s0
ffffffffc02040fe:	c03ff0ef          	jal	ffffffffc0203d00 <find_vma>
ffffffffc0204102:	8a2a                	mv	s4,a0
ffffffffc0204104:	20050563          	beqz	a0,ffffffffc020430e <vmm_init+0x2d4>
ffffffffc0204108:	00148593          	addi	a1,s1,1
ffffffffc020410c:	8522                	mv	a0,s0
ffffffffc020410e:	bf3ff0ef          	jal	ffffffffc0203d00 <find_vma>
ffffffffc0204112:	89aa                	mv	s3,a0
ffffffffc0204114:	1c050d63          	beqz	a0,ffffffffc02042ee <vmm_init+0x2b4>
ffffffffc0204118:	85ca                	mv	a1,s2
ffffffffc020411a:	8522                	mv	a0,s0
ffffffffc020411c:	be5ff0ef          	jal	ffffffffc0203d00 <find_vma>
ffffffffc0204120:	18051763          	bnez	a0,ffffffffc02042ae <vmm_init+0x274>
ffffffffc0204124:	00348593          	addi	a1,s1,3
ffffffffc0204128:	8522                	mv	a0,s0
ffffffffc020412a:	bd7ff0ef          	jal	ffffffffc0203d00 <find_vma>
ffffffffc020412e:	16051063          	bnez	a0,ffffffffc020428e <vmm_init+0x254>
ffffffffc0204132:	00448593          	addi	a1,s1,4
ffffffffc0204136:	8522                	mv	a0,s0
ffffffffc0204138:	bc9ff0ef          	jal	ffffffffc0203d00 <find_vma>
ffffffffc020413c:	12051963          	bnez	a0,ffffffffc020426e <vmm_init+0x234>
ffffffffc0204140:	008a3783          	ld	a5,8(s4)
ffffffffc0204144:	10979563          	bne	a5,s1,ffffffffc020424e <vmm_init+0x214>
ffffffffc0204148:	010a3783          	ld	a5,16(s4)
ffffffffc020414c:	11279163          	bne	a5,s2,ffffffffc020424e <vmm_init+0x214>
ffffffffc0204150:	0089b783          	ld	a5,8(s3)
ffffffffc0204154:	0c979d63          	bne	a5,s1,ffffffffc020422e <vmm_init+0x1f4>
ffffffffc0204158:	0109b783          	ld	a5,16(s3)
ffffffffc020415c:	0d279963          	bne	a5,s2,ffffffffc020422e <vmm_init+0x1f4>
ffffffffc0204160:	0495                	addi	s1,s1,5
ffffffffc0204162:	1f900793          	li	a5,505
ffffffffc0204166:	0915                	addi	s2,s2,5
ffffffffc0204168:	f8f499e3          	bne	s1,a5,ffffffffc02040fa <vmm_init+0xc0>
ffffffffc020416c:	4491                	li	s1,4
ffffffffc020416e:	597d                	li	s2,-1
ffffffffc0204170:	85a6                	mv	a1,s1
ffffffffc0204172:	8522                	mv	a0,s0
ffffffffc0204174:	b8dff0ef          	jal	ffffffffc0203d00 <find_vma>
ffffffffc0204178:	1a051b63          	bnez	a0,ffffffffc020432e <vmm_init+0x2f4>
ffffffffc020417c:	14fd                	addi	s1,s1,-1
ffffffffc020417e:	ff2499e3          	bne	s1,s2,ffffffffc0204170 <vmm_init+0x136>
ffffffffc0204182:	8522                	mv	a0,s0
ffffffffc0204184:	c8bff0ef          	jal	ffffffffc0203e0e <mm_destroy>
ffffffffc0204188:	00009517          	auipc	a0,0x9
ffffffffc020418c:	e7050513          	addi	a0,a0,-400 # ffffffffc020cff8 <etext+0x18e4>
ffffffffc0204190:	816fc0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0204194:	7402                	ld	s0,32(sp)
ffffffffc0204196:	70a2                	ld	ra,40(sp)
ffffffffc0204198:	64e2                	ld	s1,24(sp)
ffffffffc020419a:	6942                	ld	s2,16(sp)
ffffffffc020419c:	69a2                	ld	s3,8(sp)
ffffffffc020419e:	6a02                	ld	s4,0(sp)
ffffffffc02041a0:	00009517          	auipc	a0,0x9
ffffffffc02041a4:	e7850513          	addi	a0,a0,-392 # ffffffffc020d018 <etext+0x1904>
ffffffffc02041a8:	6145                	addi	sp,sp,48
ffffffffc02041aa:	ffdfb06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02041ae:	00009697          	auipc	a3,0x9
ffffffffc02041b2:	cfa68693          	addi	a3,a3,-774 # ffffffffc020cea8 <etext+0x1794>
ffffffffc02041b6:	00008617          	auipc	a2,0x8
ffffffffc02041ba:	99a60613          	addi	a2,a2,-1638 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02041be:	12c00593          	li	a1,300
ffffffffc02041c2:	00009517          	auipc	a0,0x9
ffffffffc02041c6:	c0e50513          	addi	a0,a0,-1010 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc02041ca:	a80fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02041ce:	00009697          	auipc	a3,0x9
ffffffffc02041d2:	c8a68693          	addi	a3,a3,-886 # ffffffffc020ce58 <etext+0x1744>
ffffffffc02041d6:	00008617          	auipc	a2,0x8
ffffffffc02041da:	97a60613          	addi	a2,a2,-1670 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02041de:	12400593          	li	a1,292
ffffffffc02041e2:	00009517          	auipc	a0,0x9
ffffffffc02041e6:	bee50513          	addi	a0,a0,-1042 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc02041ea:	a60fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02041ee:	00009697          	auipc	a3,0x9
ffffffffc02041f2:	cba68693          	addi	a3,a3,-838 # ffffffffc020cea8 <etext+0x1794>
ffffffffc02041f6:	00008617          	auipc	a2,0x8
ffffffffc02041fa:	95a60613          	addi	a2,a2,-1702 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02041fe:	13300593          	li	a1,307
ffffffffc0204202:	00009517          	auipc	a0,0x9
ffffffffc0204206:	bce50513          	addi	a0,a0,-1074 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc020420a:	a40fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020420e:	00009697          	auipc	a3,0x9
ffffffffc0204212:	cc268693          	addi	a3,a3,-830 # ffffffffc020ced0 <etext+0x17bc>
ffffffffc0204216:	00008617          	auipc	a2,0x8
ffffffffc020421a:	93a60613          	addi	a2,a2,-1734 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020421e:	13d00593          	li	a1,317
ffffffffc0204222:	00009517          	auipc	a0,0x9
ffffffffc0204226:	bae50513          	addi	a0,a0,-1106 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc020422a:	a20fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020422e:	00009697          	auipc	a3,0x9
ffffffffc0204232:	d5a68693          	addi	a3,a3,-678 # ffffffffc020cf88 <etext+0x1874>
ffffffffc0204236:	00008617          	auipc	a2,0x8
ffffffffc020423a:	91a60613          	addi	a2,a2,-1766 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020423e:	14f00593          	li	a1,335
ffffffffc0204242:	00009517          	auipc	a0,0x9
ffffffffc0204246:	b8e50513          	addi	a0,a0,-1138 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc020424a:	a00fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020424e:	00009697          	auipc	a3,0x9
ffffffffc0204252:	d0a68693          	addi	a3,a3,-758 # ffffffffc020cf58 <etext+0x1844>
ffffffffc0204256:	00008617          	auipc	a2,0x8
ffffffffc020425a:	8fa60613          	addi	a2,a2,-1798 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020425e:	14e00593          	li	a1,334
ffffffffc0204262:	00009517          	auipc	a0,0x9
ffffffffc0204266:	b6e50513          	addi	a0,a0,-1170 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc020426a:	9e0fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020426e:	00009697          	auipc	a3,0x9
ffffffffc0204272:	cda68693          	addi	a3,a3,-806 # ffffffffc020cf48 <etext+0x1834>
ffffffffc0204276:	00008617          	auipc	a2,0x8
ffffffffc020427a:	8da60613          	addi	a2,a2,-1830 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020427e:	14c00593          	li	a1,332
ffffffffc0204282:	00009517          	auipc	a0,0x9
ffffffffc0204286:	b4e50513          	addi	a0,a0,-1202 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc020428a:	9c0fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020428e:	00009697          	auipc	a3,0x9
ffffffffc0204292:	caa68693          	addi	a3,a3,-854 # ffffffffc020cf38 <etext+0x1824>
ffffffffc0204296:	00008617          	auipc	a2,0x8
ffffffffc020429a:	8ba60613          	addi	a2,a2,-1862 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020429e:	14a00593          	li	a1,330
ffffffffc02042a2:	00009517          	auipc	a0,0x9
ffffffffc02042a6:	b2e50513          	addi	a0,a0,-1234 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc02042aa:	9a0fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02042ae:	00009697          	auipc	a3,0x9
ffffffffc02042b2:	c7a68693          	addi	a3,a3,-902 # ffffffffc020cf28 <etext+0x1814>
ffffffffc02042b6:	00008617          	auipc	a2,0x8
ffffffffc02042ba:	89a60613          	addi	a2,a2,-1894 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02042be:	14800593          	li	a1,328
ffffffffc02042c2:	00009517          	auipc	a0,0x9
ffffffffc02042c6:	b0e50513          	addi	a0,a0,-1266 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc02042ca:	980fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02042ce:	00009697          	auipc	a3,0x9
ffffffffc02042d2:	bea68693          	addi	a3,a3,-1046 # ffffffffc020ceb8 <etext+0x17a4>
ffffffffc02042d6:	00008617          	auipc	a2,0x8
ffffffffc02042da:	87a60613          	addi	a2,a2,-1926 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02042de:	13b00593          	li	a1,315
ffffffffc02042e2:	00009517          	auipc	a0,0x9
ffffffffc02042e6:	aee50513          	addi	a0,a0,-1298 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc02042ea:	960fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02042ee:	00009697          	auipc	a3,0x9
ffffffffc02042f2:	c2a68693          	addi	a3,a3,-982 # ffffffffc020cf18 <etext+0x1804>
ffffffffc02042f6:	00008617          	auipc	a2,0x8
ffffffffc02042fa:	85a60613          	addi	a2,a2,-1958 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02042fe:	14600593          	li	a1,326
ffffffffc0204302:	00009517          	auipc	a0,0x9
ffffffffc0204306:	ace50513          	addi	a0,a0,-1330 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc020430a:	940fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020430e:	00009697          	auipc	a3,0x9
ffffffffc0204312:	bfa68693          	addi	a3,a3,-1030 # ffffffffc020cf08 <etext+0x17f4>
ffffffffc0204316:	00008617          	auipc	a2,0x8
ffffffffc020431a:	83a60613          	addi	a2,a2,-1990 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020431e:	14400593          	li	a1,324
ffffffffc0204322:	00009517          	auipc	a0,0x9
ffffffffc0204326:	aae50513          	addi	a0,a0,-1362 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc020432a:	920fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020432e:	6914                	ld	a3,16(a0)
ffffffffc0204330:	6510                	ld	a2,8(a0)
ffffffffc0204332:	0004859b          	sext.w	a1,s1
ffffffffc0204336:	00009517          	auipc	a0,0x9
ffffffffc020433a:	c8250513          	addi	a0,a0,-894 # ffffffffc020cfb8 <etext+0x18a4>
ffffffffc020433e:	e69fb0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0204342:	00009697          	auipc	a3,0x9
ffffffffc0204346:	c9e68693          	addi	a3,a3,-866 # ffffffffc020cfe0 <etext+0x18cc>
ffffffffc020434a:	00008617          	auipc	a2,0x8
ffffffffc020434e:	80660613          	addi	a2,a2,-2042 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0204352:	15900593          	li	a1,345
ffffffffc0204356:	00009517          	auipc	a0,0x9
ffffffffc020435a:	a7a50513          	addi	a0,a0,-1414 # ffffffffc020cdd0 <etext+0x16bc>
ffffffffc020435e:	8ecfc0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0204362 <user_mem_check>:
ffffffffc0204362:	7179                	addi	sp,sp,-48
ffffffffc0204364:	f022                	sd	s0,32(sp)
ffffffffc0204366:	f406                	sd	ra,40(sp)
ffffffffc0204368:	842e                	mv	s0,a1
ffffffffc020436a:	c52d                	beqz	a0,ffffffffc02043d4 <user_mem_check+0x72>
ffffffffc020436c:	002007b7          	lui	a5,0x200
ffffffffc0204370:	04f5ed63          	bltu	a1,a5,ffffffffc02043ca <user_mem_check+0x68>
ffffffffc0204374:	ec26                	sd	s1,24(sp)
ffffffffc0204376:	00c584b3          	add	s1,a1,a2
ffffffffc020437a:	0695ff63          	bgeu	a1,s1,ffffffffc02043f8 <user_mem_check+0x96>
ffffffffc020437e:	4785                	li	a5,1
ffffffffc0204380:	07fe                	slli	a5,a5,0x1f
ffffffffc0204382:	0785                	addi	a5,a5,1 # 200001 <_binary_bin_sfs_img_size+0x18ad01>
ffffffffc0204384:	06f4fa63          	bgeu	s1,a5,ffffffffc02043f8 <user_mem_check+0x96>
ffffffffc0204388:	e84a                	sd	s2,16(sp)
ffffffffc020438a:	e44e                	sd	s3,8(sp)
ffffffffc020438c:	8936                	mv	s2,a3
ffffffffc020438e:	89aa                	mv	s3,a0
ffffffffc0204390:	a829                	j	ffffffffc02043aa <user_mem_check+0x48>
ffffffffc0204392:	6685                	lui	a3,0x1
ffffffffc0204394:	9736                	add	a4,a4,a3
ffffffffc0204396:	0027f693          	andi	a3,a5,2
ffffffffc020439a:	8ba1                	andi	a5,a5,8
ffffffffc020439c:	c685                	beqz	a3,ffffffffc02043c4 <user_mem_check+0x62>
ffffffffc020439e:	c399                	beqz	a5,ffffffffc02043a4 <user_mem_check+0x42>
ffffffffc02043a0:	02e46263          	bltu	s0,a4,ffffffffc02043c4 <user_mem_check+0x62>
ffffffffc02043a4:	6900                	ld	s0,16(a0)
ffffffffc02043a6:	04947b63          	bgeu	s0,s1,ffffffffc02043fc <user_mem_check+0x9a>
ffffffffc02043aa:	85a2                	mv	a1,s0
ffffffffc02043ac:	854e                	mv	a0,s3
ffffffffc02043ae:	953ff0ef          	jal	ffffffffc0203d00 <find_vma>
ffffffffc02043b2:	c909                	beqz	a0,ffffffffc02043c4 <user_mem_check+0x62>
ffffffffc02043b4:	6518                	ld	a4,8(a0)
ffffffffc02043b6:	00e46763          	bltu	s0,a4,ffffffffc02043c4 <user_mem_check+0x62>
ffffffffc02043ba:	4d1c                	lw	a5,24(a0)
ffffffffc02043bc:	fc091be3          	bnez	s2,ffffffffc0204392 <user_mem_check+0x30>
ffffffffc02043c0:	8b85                	andi	a5,a5,1
ffffffffc02043c2:	f3ed                	bnez	a5,ffffffffc02043a4 <user_mem_check+0x42>
ffffffffc02043c4:	64e2                	ld	s1,24(sp)
ffffffffc02043c6:	6942                	ld	s2,16(sp)
ffffffffc02043c8:	69a2                	ld	s3,8(sp)
ffffffffc02043ca:	4501                	li	a0,0
ffffffffc02043cc:	70a2                	ld	ra,40(sp)
ffffffffc02043ce:	7402                	ld	s0,32(sp)
ffffffffc02043d0:	6145                	addi	sp,sp,48
ffffffffc02043d2:	8082                	ret
ffffffffc02043d4:	c02007b7          	lui	a5,0xc0200
ffffffffc02043d8:	fef5eae3          	bltu	a1,a5,ffffffffc02043cc <user_mem_check+0x6a>
ffffffffc02043dc:	c80007b7          	lui	a5,0xc8000
ffffffffc02043e0:	962e                	add	a2,a2,a1
ffffffffc02043e2:	0785                	addi	a5,a5,1 # ffffffffc8000001 <end+0x7d696f1>
ffffffffc02043e4:	00c5b433          	sltu	s0,a1,a2
ffffffffc02043e8:	00f63633          	sltu	a2,a2,a5
ffffffffc02043ec:	70a2                	ld	ra,40(sp)
ffffffffc02043ee:	00867533          	and	a0,a2,s0
ffffffffc02043f2:	7402                	ld	s0,32(sp)
ffffffffc02043f4:	6145                	addi	sp,sp,48
ffffffffc02043f6:	8082                	ret
ffffffffc02043f8:	64e2                	ld	s1,24(sp)
ffffffffc02043fa:	bfc1                	j	ffffffffc02043ca <user_mem_check+0x68>
ffffffffc02043fc:	64e2                	ld	s1,24(sp)
ffffffffc02043fe:	6942                	ld	s2,16(sp)
ffffffffc0204400:	69a2                	ld	s3,8(sp)
ffffffffc0204402:	4505                	li	a0,1
ffffffffc0204404:	b7e1                	j	ffffffffc02043cc <user_mem_check+0x6a>

ffffffffc0204406 <copy_from_user>:
ffffffffc0204406:	7179                	addi	sp,sp,-48
ffffffffc0204408:	f022                	sd	s0,32(sp)
ffffffffc020440a:	8432                	mv	s0,a2
ffffffffc020440c:	ec26                	sd	s1,24(sp)
ffffffffc020440e:	8636                	mv	a2,a3
ffffffffc0204410:	84ae                	mv	s1,a1
ffffffffc0204412:	86ba                	mv	a3,a4
ffffffffc0204414:	85a2                	mv	a1,s0
ffffffffc0204416:	f406                	sd	ra,40(sp)
ffffffffc0204418:	e032                	sd	a2,0(sp)
ffffffffc020441a:	f49ff0ef          	jal	ffffffffc0204362 <user_mem_check>
ffffffffc020441e:	87aa                	mv	a5,a0
ffffffffc0204420:	c901                	beqz	a0,ffffffffc0204430 <copy_from_user+0x2a>
ffffffffc0204422:	6602                	ld	a2,0(sp)
ffffffffc0204424:	e42a                	sd	a0,8(sp)
ffffffffc0204426:	85a2                	mv	a1,s0
ffffffffc0204428:	8526                	mv	a0,s1
ffffffffc020442a:	2d2070ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc020442e:	67a2                	ld	a5,8(sp)
ffffffffc0204430:	70a2                	ld	ra,40(sp)
ffffffffc0204432:	7402                	ld	s0,32(sp)
ffffffffc0204434:	64e2                	ld	s1,24(sp)
ffffffffc0204436:	853e                	mv	a0,a5
ffffffffc0204438:	6145                	addi	sp,sp,48
ffffffffc020443a:	8082                	ret

ffffffffc020443c <copy_to_user>:
ffffffffc020443c:	7179                	addi	sp,sp,-48
ffffffffc020443e:	f022                	sd	s0,32(sp)
ffffffffc0204440:	8436                	mv	s0,a3
ffffffffc0204442:	e84a                	sd	s2,16(sp)
ffffffffc0204444:	4685                	li	a3,1
ffffffffc0204446:	8932                	mv	s2,a2
ffffffffc0204448:	8622                	mv	a2,s0
ffffffffc020444a:	ec26                	sd	s1,24(sp)
ffffffffc020444c:	f406                	sd	ra,40(sp)
ffffffffc020444e:	84ae                	mv	s1,a1
ffffffffc0204450:	f13ff0ef          	jal	ffffffffc0204362 <user_mem_check>
ffffffffc0204454:	87aa                	mv	a5,a0
ffffffffc0204456:	c901                	beqz	a0,ffffffffc0204466 <copy_to_user+0x2a>
ffffffffc0204458:	e42a                	sd	a0,8(sp)
ffffffffc020445a:	8622                	mv	a2,s0
ffffffffc020445c:	85ca                	mv	a1,s2
ffffffffc020445e:	8526                	mv	a0,s1
ffffffffc0204460:	29c070ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc0204464:	67a2                	ld	a5,8(sp)
ffffffffc0204466:	70a2                	ld	ra,40(sp)
ffffffffc0204468:	7402                	ld	s0,32(sp)
ffffffffc020446a:	64e2                	ld	s1,24(sp)
ffffffffc020446c:	6942                	ld	s2,16(sp)
ffffffffc020446e:	853e                	mv	a0,a5
ffffffffc0204470:	6145                	addi	sp,sp,48
ffffffffc0204472:	8082                	ret

ffffffffc0204474 <copy_string>:
ffffffffc0204474:	7139                	addi	sp,sp,-64
ffffffffc0204476:	e852                	sd	s4,16(sp)
ffffffffc0204478:	6a05                	lui	s4,0x1
ffffffffc020447a:	9a32                	add	s4,s4,a2
ffffffffc020447c:	77fd                	lui	a5,0xfffff
ffffffffc020447e:	00fa7a33          	and	s4,s4,a5
ffffffffc0204482:	f426                	sd	s1,40(sp)
ffffffffc0204484:	f04a                	sd	s2,32(sp)
ffffffffc0204486:	e456                	sd	s5,8(sp)
ffffffffc0204488:	e05a                	sd	s6,0(sp)
ffffffffc020448a:	fc06                	sd	ra,56(sp)
ffffffffc020448c:	f822                	sd	s0,48(sp)
ffffffffc020448e:	ec4e                	sd	s3,24(sp)
ffffffffc0204490:	84b2                	mv	s1,a2
ffffffffc0204492:	8aae                	mv	s5,a1
ffffffffc0204494:	8936                	mv	s2,a3
ffffffffc0204496:	8b2a                	mv	s6,a0
ffffffffc0204498:	40ca0a33          	sub	s4,s4,a2
ffffffffc020449c:	a015                	j	ffffffffc02044c0 <copy_string+0x4c>
ffffffffc020449e:	172070ef          	jal	ffffffffc020b610 <strnlen>
ffffffffc02044a2:	87aa                	mv	a5,a0
ffffffffc02044a4:	8622                	mv	a2,s0
ffffffffc02044a6:	85a6                	mv	a1,s1
ffffffffc02044a8:	8556                	mv	a0,s5
ffffffffc02044aa:	0487e663          	bltu	a5,s0,ffffffffc02044f6 <copy_string+0x82>
ffffffffc02044ae:	032a7863          	bgeu	s4,s2,ffffffffc02044de <copy_string+0x6a>
ffffffffc02044b2:	24a070ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc02044b6:	9aa2                	add	s5,s5,s0
ffffffffc02044b8:	94a2                	add	s1,s1,s0
ffffffffc02044ba:	40890933          	sub	s2,s2,s0
ffffffffc02044be:	6a05                	lui	s4,0x1
ffffffffc02044c0:	4681                	li	a3,0
ffffffffc02044c2:	85a6                	mv	a1,s1
ffffffffc02044c4:	855a                	mv	a0,s6
ffffffffc02044c6:	844a                	mv	s0,s2
ffffffffc02044c8:	012a7363          	bgeu	s4,s2,ffffffffc02044ce <copy_string+0x5a>
ffffffffc02044cc:	8452                	mv	s0,s4
ffffffffc02044ce:	8622                	mv	a2,s0
ffffffffc02044d0:	e93ff0ef          	jal	ffffffffc0204362 <user_mem_check>
ffffffffc02044d4:	89aa                	mv	s3,a0
ffffffffc02044d6:	85a2                	mv	a1,s0
ffffffffc02044d8:	8526                	mv	a0,s1
ffffffffc02044da:	fc0992e3          	bnez	s3,ffffffffc020449e <copy_string+0x2a>
ffffffffc02044de:	4981                	li	s3,0
ffffffffc02044e0:	70e2                	ld	ra,56(sp)
ffffffffc02044e2:	7442                	ld	s0,48(sp)
ffffffffc02044e4:	74a2                	ld	s1,40(sp)
ffffffffc02044e6:	7902                	ld	s2,32(sp)
ffffffffc02044e8:	6a42                	ld	s4,16(sp)
ffffffffc02044ea:	6aa2                	ld	s5,8(sp)
ffffffffc02044ec:	6b02                	ld	s6,0(sp)
ffffffffc02044ee:	854e                	mv	a0,s3
ffffffffc02044f0:	69e2                	ld	s3,24(sp)
ffffffffc02044f2:	6121                	addi	sp,sp,64
ffffffffc02044f4:	8082                	ret
ffffffffc02044f6:	00178613          	addi	a2,a5,1 # fffffffffffff001 <end+0x3fd686f1>
ffffffffc02044fa:	202070ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc02044fe:	b7cd                	j	ffffffffc02044e0 <copy_string+0x6c>

ffffffffc0204500 <__down.constprop.0>:
ffffffffc0204500:	711d                	addi	sp,sp,-96
ffffffffc0204502:	ec86                	sd	ra,88(sp)
ffffffffc0204504:	100027f3          	csrr	a5,sstatus
ffffffffc0204508:	8b89                	andi	a5,a5,2
ffffffffc020450a:	eba1                	bnez	a5,ffffffffc020455a <__down.constprop.0+0x5a>
ffffffffc020450c:	411c                	lw	a5,0(a0)
ffffffffc020450e:	00f05863          	blez	a5,ffffffffc020451e <__down.constprop.0+0x1e>
ffffffffc0204512:	37fd                	addiw	a5,a5,-1
ffffffffc0204514:	c11c                	sw	a5,0(a0)
ffffffffc0204516:	60e6                	ld	ra,88(sp)
ffffffffc0204518:	4501                	li	a0,0
ffffffffc020451a:	6125                	addi	sp,sp,96
ffffffffc020451c:	8082                	ret
ffffffffc020451e:	0521                	addi	a0,a0,8
ffffffffc0204520:	082c                	addi	a1,sp,24
ffffffffc0204522:	10000613          	li	a2,256
ffffffffc0204526:	e8a2                	sd	s0,80(sp)
ffffffffc0204528:	e4a6                	sd	s1,72(sp)
ffffffffc020452a:	0820                	addi	s0,sp,24
ffffffffc020452c:	84aa                	mv	s1,a0
ffffffffc020452e:	2d0000ef          	jal	ffffffffc02047fe <wait_current_set>
ffffffffc0204532:	6c1020ef          	jal	ffffffffc02073f2 <schedule>
ffffffffc0204536:	100027f3          	csrr	a5,sstatus
ffffffffc020453a:	8b89                	andi	a5,a5,2
ffffffffc020453c:	efa9                	bnez	a5,ffffffffc0204596 <__down.constprop.0+0x96>
ffffffffc020453e:	8522                	mv	a0,s0
ffffffffc0204540:	192000ef          	jal	ffffffffc02046d2 <wait_in_queue>
ffffffffc0204544:	e521                	bnez	a0,ffffffffc020458c <__down.constprop.0+0x8c>
ffffffffc0204546:	5502                	lw	a0,32(sp)
ffffffffc0204548:	10000793          	li	a5,256
ffffffffc020454c:	6446                	ld	s0,80(sp)
ffffffffc020454e:	64a6                	ld	s1,72(sp)
ffffffffc0204550:	fcf503e3          	beq	a0,a5,ffffffffc0204516 <__down.constprop.0+0x16>
ffffffffc0204554:	60e6                	ld	ra,88(sp)
ffffffffc0204556:	6125                	addi	sp,sp,96
ffffffffc0204558:	8082                	ret
ffffffffc020455a:	e42a                	sd	a0,8(sp)
ffffffffc020455c:	e7cfc0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0204560:	6522                	ld	a0,8(sp)
ffffffffc0204562:	411c                	lw	a5,0(a0)
ffffffffc0204564:	00f05763          	blez	a5,ffffffffc0204572 <__down.constprop.0+0x72>
ffffffffc0204568:	37fd                	addiw	a5,a5,-1
ffffffffc020456a:	c11c                	sw	a5,0(a0)
ffffffffc020456c:	e66fc0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0204570:	b75d                	j	ffffffffc0204516 <__down.constprop.0+0x16>
ffffffffc0204572:	0521                	addi	a0,a0,8
ffffffffc0204574:	082c                	addi	a1,sp,24
ffffffffc0204576:	10000613          	li	a2,256
ffffffffc020457a:	e8a2                	sd	s0,80(sp)
ffffffffc020457c:	e4a6                	sd	s1,72(sp)
ffffffffc020457e:	0820                	addi	s0,sp,24
ffffffffc0204580:	84aa                	mv	s1,a0
ffffffffc0204582:	27c000ef          	jal	ffffffffc02047fe <wait_current_set>
ffffffffc0204586:	e4cfc0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc020458a:	b765                	j	ffffffffc0204532 <__down.constprop.0+0x32>
ffffffffc020458c:	85a2                	mv	a1,s0
ffffffffc020458e:	8526                	mv	a0,s1
ffffffffc0204590:	0e8000ef          	jal	ffffffffc0204678 <wait_queue_del>
ffffffffc0204594:	bf4d                	j	ffffffffc0204546 <__down.constprop.0+0x46>
ffffffffc0204596:	e42fc0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc020459a:	8522                	mv	a0,s0
ffffffffc020459c:	136000ef          	jal	ffffffffc02046d2 <wait_in_queue>
ffffffffc02045a0:	e501                	bnez	a0,ffffffffc02045a8 <__down.constprop.0+0xa8>
ffffffffc02045a2:	e30fc0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc02045a6:	b745                	j	ffffffffc0204546 <__down.constprop.0+0x46>
ffffffffc02045a8:	85a2                	mv	a1,s0
ffffffffc02045aa:	8526                	mv	a0,s1
ffffffffc02045ac:	0cc000ef          	jal	ffffffffc0204678 <wait_queue_del>
ffffffffc02045b0:	bfcd                	j	ffffffffc02045a2 <__down.constprop.0+0xa2>

ffffffffc02045b2 <__up.constprop.0>:
ffffffffc02045b2:	1101                	addi	sp,sp,-32
ffffffffc02045b4:	e426                	sd	s1,8(sp)
ffffffffc02045b6:	ec06                	sd	ra,24(sp)
ffffffffc02045b8:	e822                	sd	s0,16(sp)
ffffffffc02045ba:	e04a                	sd	s2,0(sp)
ffffffffc02045bc:	84aa                	mv	s1,a0
ffffffffc02045be:	100027f3          	csrr	a5,sstatus
ffffffffc02045c2:	8b89                	andi	a5,a5,2
ffffffffc02045c4:	4901                	li	s2,0
ffffffffc02045c6:	e7b1                	bnez	a5,ffffffffc0204612 <__up.constprop.0+0x60>
ffffffffc02045c8:	00848413          	addi	s0,s1,8
ffffffffc02045cc:	8522                	mv	a0,s0
ffffffffc02045ce:	0e8000ef          	jal	ffffffffc02046b6 <wait_queue_first>
ffffffffc02045d2:	cd05                	beqz	a0,ffffffffc020460a <__up.constprop.0+0x58>
ffffffffc02045d4:	6118                	ld	a4,0(a0)
ffffffffc02045d6:	10000793          	li	a5,256
ffffffffc02045da:	0ec72603          	lw	a2,236(a4)
ffffffffc02045de:	02f61e63          	bne	a2,a5,ffffffffc020461a <__up.constprop.0+0x68>
ffffffffc02045e2:	85aa                	mv	a1,a0
ffffffffc02045e4:	4685                	li	a3,1
ffffffffc02045e6:	8522                	mv	a0,s0
ffffffffc02045e8:	0f8000ef          	jal	ffffffffc02046e0 <wakeup_wait>
ffffffffc02045ec:	00091863          	bnez	s2,ffffffffc02045fc <__up.constprop.0+0x4a>
ffffffffc02045f0:	60e2                	ld	ra,24(sp)
ffffffffc02045f2:	6442                	ld	s0,16(sp)
ffffffffc02045f4:	64a2                	ld	s1,8(sp)
ffffffffc02045f6:	6902                	ld	s2,0(sp)
ffffffffc02045f8:	6105                	addi	sp,sp,32
ffffffffc02045fa:	8082                	ret
ffffffffc02045fc:	6442                	ld	s0,16(sp)
ffffffffc02045fe:	60e2                	ld	ra,24(sp)
ffffffffc0204600:	64a2                	ld	s1,8(sp)
ffffffffc0204602:	6902                	ld	s2,0(sp)
ffffffffc0204604:	6105                	addi	sp,sp,32
ffffffffc0204606:	dccfc06f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc020460a:	409c                	lw	a5,0(s1)
ffffffffc020460c:	2785                	addiw	a5,a5,1
ffffffffc020460e:	c09c                	sw	a5,0(s1)
ffffffffc0204610:	bff1                	j	ffffffffc02045ec <__up.constprop.0+0x3a>
ffffffffc0204612:	dc6fc0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0204616:	4905                	li	s2,1
ffffffffc0204618:	bf45                	j	ffffffffc02045c8 <__up.constprop.0+0x16>
ffffffffc020461a:	00009697          	auipc	a3,0x9
ffffffffc020461e:	a1668693          	addi	a3,a3,-1514 # ffffffffc020d030 <etext+0x191c>
ffffffffc0204622:	00007617          	auipc	a2,0x7
ffffffffc0204626:	52e60613          	addi	a2,a2,1326 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020462a:	45e5                	li	a1,25
ffffffffc020462c:	00009517          	auipc	a0,0x9
ffffffffc0204630:	a2c50513          	addi	a0,a0,-1492 # ffffffffc020d058 <etext+0x1944>
ffffffffc0204634:	e17fb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0204638 <sem_init>:
ffffffffc0204638:	c10c                	sw	a1,0(a0)
ffffffffc020463a:	0521                	addi	a0,a0,8
ffffffffc020463c:	a81d                	j	ffffffffc0204672 <wait_queue_init>

ffffffffc020463e <up>:
ffffffffc020463e:	f75ff06f          	j	ffffffffc02045b2 <__up.constprop.0>

ffffffffc0204642 <down>:
ffffffffc0204642:	1141                	addi	sp,sp,-16
ffffffffc0204644:	e406                	sd	ra,8(sp)
ffffffffc0204646:	ebbff0ef          	jal	ffffffffc0204500 <__down.constprop.0>
ffffffffc020464a:	e501                	bnez	a0,ffffffffc0204652 <down+0x10>
ffffffffc020464c:	60a2                	ld	ra,8(sp)
ffffffffc020464e:	0141                	addi	sp,sp,16
ffffffffc0204650:	8082                	ret
ffffffffc0204652:	00009697          	auipc	a3,0x9
ffffffffc0204656:	a1668693          	addi	a3,a3,-1514 # ffffffffc020d068 <etext+0x1954>
ffffffffc020465a:	00007617          	auipc	a2,0x7
ffffffffc020465e:	4f660613          	addi	a2,a2,1270 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0204662:	04000593          	li	a1,64
ffffffffc0204666:	00009517          	auipc	a0,0x9
ffffffffc020466a:	9f250513          	addi	a0,a0,-1550 # ffffffffc020d058 <etext+0x1944>
ffffffffc020466e:	dddfb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0204672 <wait_queue_init>:
ffffffffc0204672:	e508                	sd	a0,8(a0)
ffffffffc0204674:	e108                	sd	a0,0(a0)
ffffffffc0204676:	8082                	ret

ffffffffc0204678 <wait_queue_del>:
ffffffffc0204678:	7198                	ld	a4,32(a1)
ffffffffc020467a:	01858793          	addi	a5,a1,24
ffffffffc020467e:	00e78b63          	beq	a5,a4,ffffffffc0204694 <wait_queue_del+0x1c>
ffffffffc0204682:	6994                	ld	a3,16(a1)
ffffffffc0204684:	00a69863          	bne	a3,a0,ffffffffc0204694 <wait_queue_del+0x1c>
ffffffffc0204688:	6d94                	ld	a3,24(a1)
ffffffffc020468a:	e698                	sd	a4,8(a3)
ffffffffc020468c:	e314                	sd	a3,0(a4)
ffffffffc020468e:	f19c                	sd	a5,32(a1)
ffffffffc0204690:	ed9c                	sd	a5,24(a1)
ffffffffc0204692:	8082                	ret
ffffffffc0204694:	1141                	addi	sp,sp,-16
ffffffffc0204696:	00009697          	auipc	a3,0x9
ffffffffc020469a:	a3268693          	addi	a3,a3,-1486 # ffffffffc020d0c8 <etext+0x19b4>
ffffffffc020469e:	00007617          	auipc	a2,0x7
ffffffffc02046a2:	4b260613          	addi	a2,a2,1202 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02046a6:	45f1                	li	a1,28
ffffffffc02046a8:	00009517          	auipc	a0,0x9
ffffffffc02046ac:	a0850513          	addi	a0,a0,-1528 # ffffffffc020d0b0 <etext+0x199c>
ffffffffc02046b0:	e406                	sd	ra,8(sp)
ffffffffc02046b2:	d99fb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc02046b6 <wait_queue_first>:
ffffffffc02046b6:	651c                	ld	a5,8(a0)
ffffffffc02046b8:	00f50563          	beq	a0,a5,ffffffffc02046c2 <wait_queue_first+0xc>
ffffffffc02046bc:	fe878513          	addi	a0,a5,-24
ffffffffc02046c0:	8082                	ret
ffffffffc02046c2:	4501                	li	a0,0
ffffffffc02046c4:	8082                	ret

ffffffffc02046c6 <wait_queue_empty>:
ffffffffc02046c6:	651c                	ld	a5,8(a0)
ffffffffc02046c8:	40a78533          	sub	a0,a5,a0
ffffffffc02046cc:	00153513          	seqz	a0,a0
ffffffffc02046d0:	8082                	ret

ffffffffc02046d2 <wait_in_queue>:
ffffffffc02046d2:	711c                	ld	a5,32(a0)
ffffffffc02046d4:	0561                	addi	a0,a0,24
ffffffffc02046d6:	40a78533          	sub	a0,a5,a0
ffffffffc02046da:	00a03533          	snez	a0,a0
ffffffffc02046de:	8082                	ret

ffffffffc02046e0 <wakeup_wait>:
ffffffffc02046e0:	e689                	bnez	a3,ffffffffc02046ea <wakeup_wait+0xa>
ffffffffc02046e2:	6188                	ld	a0,0(a1)
ffffffffc02046e4:	c590                	sw	a2,8(a1)
ffffffffc02046e6:	4150206f          	j	ffffffffc02072fa <wakeup_proc>
ffffffffc02046ea:	7198                	ld	a4,32(a1)
ffffffffc02046ec:	01858793          	addi	a5,a1,24
ffffffffc02046f0:	00e78e63          	beq	a5,a4,ffffffffc020470c <wakeup_wait+0x2c>
ffffffffc02046f4:	6994                	ld	a3,16(a1)
ffffffffc02046f6:	00d51b63          	bne	a0,a3,ffffffffc020470c <wakeup_wait+0x2c>
ffffffffc02046fa:	6d94                	ld	a3,24(a1)
ffffffffc02046fc:	6188                	ld	a0,0(a1)
ffffffffc02046fe:	e698                	sd	a4,8(a3)
ffffffffc0204700:	e314                	sd	a3,0(a4)
ffffffffc0204702:	f19c                	sd	a5,32(a1)
ffffffffc0204704:	ed9c                	sd	a5,24(a1)
ffffffffc0204706:	c590                	sw	a2,8(a1)
ffffffffc0204708:	3f30206f          	j	ffffffffc02072fa <wakeup_proc>
ffffffffc020470c:	1141                	addi	sp,sp,-16
ffffffffc020470e:	00009697          	auipc	a3,0x9
ffffffffc0204712:	9ba68693          	addi	a3,a3,-1606 # ffffffffc020d0c8 <etext+0x19b4>
ffffffffc0204716:	00007617          	auipc	a2,0x7
ffffffffc020471a:	43a60613          	addi	a2,a2,1082 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020471e:	45f1                	li	a1,28
ffffffffc0204720:	00009517          	auipc	a0,0x9
ffffffffc0204724:	99050513          	addi	a0,a0,-1648 # ffffffffc020d0b0 <etext+0x199c>
ffffffffc0204728:	e406                	sd	ra,8(sp)
ffffffffc020472a:	d21fb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc020472e <wakeup_queue>:
ffffffffc020472e:	651c                	ld	a5,8(a0)
ffffffffc0204730:	0aa78763          	beq	a5,a0,ffffffffc02047de <wakeup_queue+0xb0>
ffffffffc0204734:	1101                	addi	sp,sp,-32
ffffffffc0204736:	e822                	sd	s0,16(sp)
ffffffffc0204738:	e426                	sd	s1,8(sp)
ffffffffc020473a:	e04a                	sd	s2,0(sp)
ffffffffc020473c:	ec06                	sd	ra,24(sp)
ffffffffc020473e:	892e                	mv	s2,a1
ffffffffc0204740:	84aa                	mv	s1,a0
ffffffffc0204742:	fe878413          	addi	s0,a5,-24
ffffffffc0204746:	ee29                	bnez	a2,ffffffffc02047a0 <wakeup_queue+0x72>
ffffffffc0204748:	6008                	ld	a0,0(s0)
ffffffffc020474a:	01242423          	sw	s2,8(s0)
ffffffffc020474e:	3ad020ef          	jal	ffffffffc02072fa <wakeup_proc>
ffffffffc0204752:	701c                	ld	a5,32(s0)
ffffffffc0204754:	01840713          	addi	a4,s0,24
ffffffffc0204758:	02e78463          	beq	a5,a4,ffffffffc0204780 <wakeup_queue+0x52>
ffffffffc020475c:	6818                	ld	a4,16(s0)
ffffffffc020475e:	02e49163          	bne	s1,a4,ffffffffc0204780 <wakeup_queue+0x52>
ffffffffc0204762:	06f48863          	beq	s1,a5,ffffffffc02047d2 <wakeup_queue+0xa4>
ffffffffc0204766:	fe87b503          	ld	a0,-24(a5)
ffffffffc020476a:	ff27a823          	sw	s2,-16(a5)
ffffffffc020476e:	fe878413          	addi	s0,a5,-24
ffffffffc0204772:	389020ef          	jal	ffffffffc02072fa <wakeup_proc>
ffffffffc0204776:	701c                	ld	a5,32(s0)
ffffffffc0204778:	01840713          	addi	a4,s0,24
ffffffffc020477c:	fee790e3          	bne	a5,a4,ffffffffc020475c <wakeup_queue+0x2e>
ffffffffc0204780:	00009697          	auipc	a3,0x9
ffffffffc0204784:	94868693          	addi	a3,a3,-1720 # ffffffffc020d0c8 <etext+0x19b4>
ffffffffc0204788:	00007617          	auipc	a2,0x7
ffffffffc020478c:	3c860613          	addi	a2,a2,968 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0204790:	02200593          	li	a1,34
ffffffffc0204794:	00009517          	auipc	a0,0x9
ffffffffc0204798:	91c50513          	addi	a0,a0,-1764 # ffffffffc020d0b0 <etext+0x199c>
ffffffffc020479c:	caffb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02047a0:	6798                	ld	a4,8(a5)
ffffffffc02047a2:	00e79863          	bne	a5,a4,ffffffffc02047b2 <wakeup_queue+0x84>
ffffffffc02047a6:	a82d                	j	ffffffffc02047e0 <wakeup_queue+0xb2>
ffffffffc02047a8:	6418                	ld	a4,8(s0)
ffffffffc02047aa:	87a2                	mv	a5,s0
ffffffffc02047ac:	1421                	addi	s0,s0,-24
ffffffffc02047ae:	02e78963          	beq	a5,a4,ffffffffc02047e0 <wakeup_queue+0xb2>
ffffffffc02047b2:	6814                	ld	a3,16(s0)
ffffffffc02047b4:	02d49663          	bne	s1,a3,ffffffffc02047e0 <wakeup_queue+0xb2>
ffffffffc02047b8:	6c14                	ld	a3,24(s0)
ffffffffc02047ba:	6008                	ld	a0,0(s0)
ffffffffc02047bc:	e698                	sd	a4,8(a3)
ffffffffc02047be:	e314                	sd	a3,0(a4)
ffffffffc02047c0:	f01c                	sd	a5,32(s0)
ffffffffc02047c2:	ec1c                	sd	a5,24(s0)
ffffffffc02047c4:	01242423          	sw	s2,8(s0)
ffffffffc02047c8:	333020ef          	jal	ffffffffc02072fa <wakeup_proc>
ffffffffc02047cc:	6480                	ld	s0,8(s1)
ffffffffc02047ce:	fc849de3          	bne	s1,s0,ffffffffc02047a8 <wakeup_queue+0x7a>
ffffffffc02047d2:	60e2                	ld	ra,24(sp)
ffffffffc02047d4:	6442                	ld	s0,16(sp)
ffffffffc02047d6:	64a2                	ld	s1,8(sp)
ffffffffc02047d8:	6902                	ld	s2,0(sp)
ffffffffc02047da:	6105                	addi	sp,sp,32
ffffffffc02047dc:	8082                	ret
ffffffffc02047de:	8082                	ret
ffffffffc02047e0:	00009697          	auipc	a3,0x9
ffffffffc02047e4:	8e868693          	addi	a3,a3,-1816 # ffffffffc020d0c8 <etext+0x19b4>
ffffffffc02047e8:	00007617          	auipc	a2,0x7
ffffffffc02047ec:	36860613          	addi	a2,a2,872 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02047f0:	45f1                	li	a1,28
ffffffffc02047f2:	00009517          	auipc	a0,0x9
ffffffffc02047f6:	8be50513          	addi	a0,a0,-1858 # ffffffffc020d0b0 <etext+0x199c>
ffffffffc02047fa:	c51fb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc02047fe <wait_current_set>:
ffffffffc02047fe:	00092797          	auipc	a5,0x92
ffffffffc0204802:	0ca7b783          	ld	a5,202(a5) # ffffffffc02968c8 <current>
ffffffffc0204806:	c39d                	beqz	a5,ffffffffc020482c <wait_current_set+0x2e>
ffffffffc0204808:	80000737          	lui	a4,0x80000
ffffffffc020480c:	c598                	sw	a4,8(a1)
ffffffffc020480e:	01858713          	addi	a4,a1,24
ffffffffc0204812:	ed98                	sd	a4,24(a1)
ffffffffc0204814:	e19c                	sd	a5,0(a1)
ffffffffc0204816:	0ec7a623          	sw	a2,236(a5)
ffffffffc020481a:	4605                	li	a2,1
ffffffffc020481c:	6114                	ld	a3,0(a0)
ffffffffc020481e:	c390                	sw	a2,0(a5)
ffffffffc0204820:	e988                	sd	a0,16(a1)
ffffffffc0204822:	e118                	sd	a4,0(a0)
ffffffffc0204824:	e698                	sd	a4,8(a3)
ffffffffc0204826:	ed94                	sd	a3,24(a1)
ffffffffc0204828:	f188                	sd	a0,32(a1)
ffffffffc020482a:	8082                	ret
ffffffffc020482c:	1141                	addi	sp,sp,-16
ffffffffc020482e:	00009697          	auipc	a3,0x9
ffffffffc0204832:	8da68693          	addi	a3,a3,-1830 # ffffffffc020d108 <etext+0x19f4>
ffffffffc0204836:	00007617          	auipc	a2,0x7
ffffffffc020483a:	31a60613          	addi	a2,a2,794 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020483e:	07400593          	li	a1,116
ffffffffc0204842:	00009517          	auipc	a0,0x9
ffffffffc0204846:	86e50513          	addi	a0,a0,-1938 # ffffffffc020d0b0 <etext+0x199c>
ffffffffc020484a:	e406                	sd	ra,8(sp)
ffffffffc020484c:	bfffb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0204850 <get_fd_array.part.0>:
ffffffffc0204850:	1141                	addi	sp,sp,-16
ffffffffc0204852:	00009697          	auipc	a3,0x9
ffffffffc0204856:	8c668693          	addi	a3,a3,-1850 # ffffffffc020d118 <etext+0x1a04>
ffffffffc020485a:	00007617          	auipc	a2,0x7
ffffffffc020485e:	2f660613          	addi	a2,a2,758 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0204862:	45d1                	li	a1,20
ffffffffc0204864:	00009517          	auipc	a0,0x9
ffffffffc0204868:	8e450513          	addi	a0,a0,-1820 # ffffffffc020d148 <etext+0x1a34>
ffffffffc020486c:	e406                	sd	ra,8(sp)
ffffffffc020486e:	bddfb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0204872 <fd_array_alloc>:
ffffffffc0204872:	00092797          	auipc	a5,0x92
ffffffffc0204876:	0567b783          	ld	a5,86(a5) # ffffffffc02968c8 <current>
ffffffffc020487a:	1141                	addi	sp,sp,-16
ffffffffc020487c:	e406                	sd	ra,8(sp)
ffffffffc020487e:	1487b783          	ld	a5,328(a5)
ffffffffc0204882:	cfb9                	beqz	a5,ffffffffc02048e0 <fd_array_alloc+0x6e>
ffffffffc0204884:	4b98                	lw	a4,16(a5)
ffffffffc0204886:	04e05d63          	blez	a4,ffffffffc02048e0 <fd_array_alloc+0x6e>
ffffffffc020488a:	775d                	lui	a4,0xffff7
ffffffffc020488c:	ad970713          	addi	a4,a4,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0204890:	679c                	ld	a5,8(a5)
ffffffffc0204892:	02e50763          	beq	a0,a4,ffffffffc02048c0 <fd_array_alloc+0x4e>
ffffffffc0204896:	04700713          	li	a4,71
ffffffffc020489a:	04a76163          	bltu	a4,a0,ffffffffc02048dc <fd_array_alloc+0x6a>
ffffffffc020489e:	00351713          	slli	a4,a0,0x3
ffffffffc02048a2:	8f09                	sub	a4,a4,a0
ffffffffc02048a4:	070e                	slli	a4,a4,0x3
ffffffffc02048a6:	97ba                	add	a5,a5,a4
ffffffffc02048a8:	4398                	lw	a4,0(a5)
ffffffffc02048aa:	e71d                	bnez	a4,ffffffffc02048d8 <fd_array_alloc+0x66>
ffffffffc02048ac:	5b88                	lw	a0,48(a5)
ffffffffc02048ae:	e91d                	bnez	a0,ffffffffc02048e4 <fd_array_alloc+0x72>
ffffffffc02048b0:	4705                	li	a4,1
ffffffffc02048b2:	0207b423          	sd	zero,40(a5)
ffffffffc02048b6:	c398                	sw	a4,0(a5)
ffffffffc02048b8:	e19c                	sd	a5,0(a1)
ffffffffc02048ba:	60a2                	ld	ra,8(sp)
ffffffffc02048bc:	0141                	addi	sp,sp,16
ffffffffc02048be:	8082                	ret
ffffffffc02048c0:	7ff78693          	addi	a3,a5,2047
ffffffffc02048c4:	7c168693          	addi	a3,a3,1985
ffffffffc02048c8:	4398                	lw	a4,0(a5)
ffffffffc02048ca:	d36d                	beqz	a4,ffffffffc02048ac <fd_array_alloc+0x3a>
ffffffffc02048cc:	03878793          	addi	a5,a5,56
ffffffffc02048d0:	fed79ce3          	bne	a5,a3,ffffffffc02048c8 <fd_array_alloc+0x56>
ffffffffc02048d4:	5529                	li	a0,-22
ffffffffc02048d6:	b7d5                	j	ffffffffc02048ba <fd_array_alloc+0x48>
ffffffffc02048d8:	5545                	li	a0,-15
ffffffffc02048da:	b7c5                	j	ffffffffc02048ba <fd_array_alloc+0x48>
ffffffffc02048dc:	5575                	li	a0,-3
ffffffffc02048de:	bff1                	j	ffffffffc02048ba <fd_array_alloc+0x48>
ffffffffc02048e0:	f71ff0ef          	jal	ffffffffc0204850 <get_fd_array.part.0>
ffffffffc02048e4:	00009697          	auipc	a3,0x9
ffffffffc02048e8:	87468693          	addi	a3,a3,-1932 # ffffffffc020d158 <etext+0x1a44>
ffffffffc02048ec:	00007617          	auipc	a2,0x7
ffffffffc02048f0:	26460613          	addi	a2,a2,612 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02048f4:	03b00593          	li	a1,59
ffffffffc02048f8:	00009517          	auipc	a0,0x9
ffffffffc02048fc:	85050513          	addi	a0,a0,-1968 # ffffffffc020d148 <etext+0x1a34>
ffffffffc0204900:	b4bfb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0204904 <fd_array_free>:
ffffffffc0204904:	4118                	lw	a4,0(a0)
ffffffffc0204906:	1101                	addi	sp,sp,-32
ffffffffc0204908:	ec06                	sd	ra,24(sp)
ffffffffc020490a:	4685                	li	a3,1
ffffffffc020490c:	ffd77613          	andi	a2,a4,-3
ffffffffc0204910:	04d61763          	bne	a2,a3,ffffffffc020495e <fd_array_free+0x5a>
ffffffffc0204914:	5914                	lw	a3,48(a0)
ffffffffc0204916:	87aa                	mv	a5,a0
ffffffffc0204918:	e29d                	bnez	a3,ffffffffc020493e <fd_array_free+0x3a>
ffffffffc020491a:	468d                	li	a3,3
ffffffffc020491c:	00d70763          	beq	a4,a3,ffffffffc020492a <fd_array_free+0x26>
ffffffffc0204920:	60e2                	ld	ra,24(sp)
ffffffffc0204922:	0007a023          	sw	zero,0(a5)
ffffffffc0204926:	6105                	addi	sp,sp,32
ffffffffc0204928:	8082                	ret
ffffffffc020492a:	7508                	ld	a0,40(a0)
ffffffffc020492c:	e43e                	sd	a5,8(sp)
ffffffffc020492e:	107030ef          	jal	ffffffffc0208234 <vfs_close>
ffffffffc0204932:	67a2                	ld	a5,8(sp)
ffffffffc0204934:	60e2                	ld	ra,24(sp)
ffffffffc0204936:	0007a023          	sw	zero,0(a5)
ffffffffc020493a:	6105                	addi	sp,sp,32
ffffffffc020493c:	8082                	ret
ffffffffc020493e:	00009697          	auipc	a3,0x9
ffffffffc0204942:	81a68693          	addi	a3,a3,-2022 # ffffffffc020d158 <etext+0x1a44>
ffffffffc0204946:	00007617          	auipc	a2,0x7
ffffffffc020494a:	20a60613          	addi	a2,a2,522 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020494e:	04500593          	li	a1,69
ffffffffc0204952:	00008517          	auipc	a0,0x8
ffffffffc0204956:	7f650513          	addi	a0,a0,2038 # ffffffffc020d148 <etext+0x1a34>
ffffffffc020495a:	af1fb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020495e:	00009697          	auipc	a3,0x9
ffffffffc0204962:	83268693          	addi	a3,a3,-1998 # ffffffffc020d190 <etext+0x1a7c>
ffffffffc0204966:	00007617          	auipc	a2,0x7
ffffffffc020496a:	1ea60613          	addi	a2,a2,490 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020496e:	04400593          	li	a1,68
ffffffffc0204972:	00008517          	auipc	a0,0x8
ffffffffc0204976:	7d650513          	addi	a0,a0,2006 # ffffffffc020d148 <etext+0x1a34>
ffffffffc020497a:	ad1fb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc020497e <fd_array_release>:
ffffffffc020497e:	411c                	lw	a5,0(a0)
ffffffffc0204980:	1141                	addi	sp,sp,-16
ffffffffc0204982:	e406                	sd	ra,8(sp)
ffffffffc0204984:	4685                	li	a3,1
ffffffffc0204986:	37f9                	addiw	a5,a5,-2
ffffffffc0204988:	02f6ef63          	bltu	a3,a5,ffffffffc02049c6 <fd_array_release+0x48>
ffffffffc020498c:	591c                	lw	a5,48(a0)
ffffffffc020498e:	00f05c63          	blez	a5,ffffffffc02049a6 <fd_array_release+0x28>
ffffffffc0204992:	37fd                	addiw	a5,a5,-1
ffffffffc0204994:	d91c                	sw	a5,48(a0)
ffffffffc0204996:	c781                	beqz	a5,ffffffffc020499e <fd_array_release+0x20>
ffffffffc0204998:	60a2                	ld	ra,8(sp)
ffffffffc020499a:	0141                	addi	sp,sp,16
ffffffffc020499c:	8082                	ret
ffffffffc020499e:	60a2                	ld	ra,8(sp)
ffffffffc02049a0:	0141                	addi	sp,sp,16
ffffffffc02049a2:	f63ff06f          	j	ffffffffc0204904 <fd_array_free>
ffffffffc02049a6:	00009697          	auipc	a3,0x9
ffffffffc02049aa:	85a68693          	addi	a3,a3,-1958 # ffffffffc020d200 <etext+0x1aec>
ffffffffc02049ae:	00007617          	auipc	a2,0x7
ffffffffc02049b2:	1a260613          	addi	a2,a2,418 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02049b6:	05600593          	li	a1,86
ffffffffc02049ba:	00008517          	auipc	a0,0x8
ffffffffc02049be:	78e50513          	addi	a0,a0,1934 # ffffffffc020d148 <etext+0x1a34>
ffffffffc02049c2:	a89fb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02049c6:	00009697          	auipc	a3,0x9
ffffffffc02049ca:	80268693          	addi	a3,a3,-2046 # ffffffffc020d1c8 <etext+0x1ab4>
ffffffffc02049ce:	00007617          	auipc	a2,0x7
ffffffffc02049d2:	18260613          	addi	a2,a2,386 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02049d6:	05500593          	li	a1,85
ffffffffc02049da:	00008517          	auipc	a0,0x8
ffffffffc02049de:	76e50513          	addi	a0,a0,1902 # ffffffffc020d148 <etext+0x1a34>
ffffffffc02049e2:	a69fb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc02049e6 <fd_array_open.part.0>:
ffffffffc02049e6:	1141                	addi	sp,sp,-16
ffffffffc02049e8:	00009697          	auipc	a3,0x9
ffffffffc02049ec:	83068693          	addi	a3,a3,-2000 # ffffffffc020d218 <etext+0x1b04>
ffffffffc02049f0:	00007617          	auipc	a2,0x7
ffffffffc02049f4:	16060613          	addi	a2,a2,352 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02049f8:	05f00593          	li	a1,95
ffffffffc02049fc:	00008517          	auipc	a0,0x8
ffffffffc0204a00:	74c50513          	addi	a0,a0,1868 # ffffffffc020d148 <etext+0x1a34>
ffffffffc0204a04:	e406                	sd	ra,8(sp)
ffffffffc0204a06:	a45fb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0204a0a <fd_array_init>:
ffffffffc0204a0a:	4781                	li	a5,0
ffffffffc0204a0c:	04800713          	li	a4,72
ffffffffc0204a10:	cd1c                	sw	a5,24(a0)
ffffffffc0204a12:	02052823          	sw	zero,48(a0)
ffffffffc0204a16:	00052023          	sw	zero,0(a0)
ffffffffc0204a1a:	2785                	addiw	a5,a5,1
ffffffffc0204a1c:	03850513          	addi	a0,a0,56
ffffffffc0204a20:	fee798e3          	bne	a5,a4,ffffffffc0204a10 <fd_array_init+0x6>
ffffffffc0204a24:	8082                	ret

ffffffffc0204a26 <fd_array_close>:
ffffffffc0204a26:	4114                	lw	a3,0(a0)
ffffffffc0204a28:	1101                	addi	sp,sp,-32
ffffffffc0204a2a:	ec06                	sd	ra,24(sp)
ffffffffc0204a2c:	4789                	li	a5,2
ffffffffc0204a2e:	04f69863          	bne	a3,a5,ffffffffc0204a7e <fd_array_close+0x58>
ffffffffc0204a32:	591c                	lw	a5,48(a0)
ffffffffc0204a34:	872a                	mv	a4,a0
ffffffffc0204a36:	02f05463          	blez	a5,ffffffffc0204a5e <fd_array_close+0x38>
ffffffffc0204a3a:	37fd                	addiw	a5,a5,-1
ffffffffc0204a3c:	468d                	li	a3,3
ffffffffc0204a3e:	d91c                	sw	a5,48(a0)
ffffffffc0204a40:	c114                	sw	a3,0(a0)
ffffffffc0204a42:	c781                	beqz	a5,ffffffffc0204a4a <fd_array_close+0x24>
ffffffffc0204a44:	60e2                	ld	ra,24(sp)
ffffffffc0204a46:	6105                	addi	sp,sp,32
ffffffffc0204a48:	8082                	ret
ffffffffc0204a4a:	7508                	ld	a0,40(a0)
ffffffffc0204a4c:	e43a                	sd	a4,8(sp)
ffffffffc0204a4e:	7e6030ef          	jal	ffffffffc0208234 <vfs_close>
ffffffffc0204a52:	6722                	ld	a4,8(sp)
ffffffffc0204a54:	60e2                	ld	ra,24(sp)
ffffffffc0204a56:	00072023          	sw	zero,0(a4)
ffffffffc0204a5a:	6105                	addi	sp,sp,32
ffffffffc0204a5c:	8082                	ret
ffffffffc0204a5e:	00008697          	auipc	a3,0x8
ffffffffc0204a62:	7a268693          	addi	a3,a3,1954 # ffffffffc020d200 <etext+0x1aec>
ffffffffc0204a66:	00007617          	auipc	a2,0x7
ffffffffc0204a6a:	0ea60613          	addi	a2,a2,234 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0204a6e:	06800593          	li	a1,104
ffffffffc0204a72:	00008517          	auipc	a0,0x8
ffffffffc0204a76:	6d650513          	addi	a0,a0,1750 # ffffffffc020d148 <etext+0x1a34>
ffffffffc0204a7a:	9d1fb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0204a7e:	00008697          	auipc	a3,0x8
ffffffffc0204a82:	6f268693          	addi	a3,a3,1778 # ffffffffc020d170 <etext+0x1a5c>
ffffffffc0204a86:	00007617          	auipc	a2,0x7
ffffffffc0204a8a:	0ca60613          	addi	a2,a2,202 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0204a8e:	06700593          	li	a1,103
ffffffffc0204a92:	00008517          	auipc	a0,0x8
ffffffffc0204a96:	6b650513          	addi	a0,a0,1718 # ffffffffc020d148 <etext+0x1a34>
ffffffffc0204a9a:	9b1fb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0204a9e <fd_array_dup>:
ffffffffc0204a9e:	4118                	lw	a4,0(a0)
ffffffffc0204aa0:	1101                	addi	sp,sp,-32
ffffffffc0204aa2:	ec06                	sd	ra,24(sp)
ffffffffc0204aa4:	e822                	sd	s0,16(sp)
ffffffffc0204aa6:	e426                	sd	s1,8(sp)
ffffffffc0204aa8:	e04a                	sd	s2,0(sp)
ffffffffc0204aaa:	4785                	li	a5,1
ffffffffc0204aac:	04f71563          	bne	a4,a5,ffffffffc0204af6 <fd_array_dup+0x58>
ffffffffc0204ab0:	0005a903          	lw	s2,0(a1)
ffffffffc0204ab4:	4789                	li	a5,2
ffffffffc0204ab6:	04f91063          	bne	s2,a5,ffffffffc0204af6 <fd_array_dup+0x58>
ffffffffc0204aba:	719c                	ld	a5,32(a1)
ffffffffc0204abc:	7584                	ld	s1,40(a1)
ffffffffc0204abe:	842a                	mv	s0,a0
ffffffffc0204ac0:	f11c                	sd	a5,32(a0)
ffffffffc0204ac2:	699c                	ld	a5,16(a1)
ffffffffc0204ac4:	6598                	ld	a4,8(a1)
ffffffffc0204ac6:	8526                	mv	a0,s1
ffffffffc0204ac8:	e81c                	sd	a5,16(s0)
ffffffffc0204aca:	e418                	sd	a4,8(s0)
ffffffffc0204acc:	67d020ef          	jal	ffffffffc0207948 <inode_ref_inc>
ffffffffc0204ad0:	8526                	mv	a0,s1
ffffffffc0204ad2:	681020ef          	jal	ffffffffc0207952 <inode_open_inc>
ffffffffc0204ad6:	401c                	lw	a5,0(s0)
ffffffffc0204ad8:	f404                	sd	s1,40(s0)
ffffffffc0204ada:	17fd                	addi	a5,a5,-1
ffffffffc0204adc:	ef8d                	bnez	a5,ffffffffc0204b16 <fd_array_dup+0x78>
ffffffffc0204ade:	cc85                	beqz	s1,ffffffffc0204b16 <fd_array_dup+0x78>
ffffffffc0204ae0:	581c                	lw	a5,48(s0)
ffffffffc0204ae2:	01242023          	sw	s2,0(s0)
ffffffffc0204ae6:	60e2                	ld	ra,24(sp)
ffffffffc0204ae8:	2785                	addiw	a5,a5,1
ffffffffc0204aea:	d81c                	sw	a5,48(s0)
ffffffffc0204aec:	6442                	ld	s0,16(sp)
ffffffffc0204aee:	64a2                	ld	s1,8(sp)
ffffffffc0204af0:	6902                	ld	s2,0(sp)
ffffffffc0204af2:	6105                	addi	sp,sp,32
ffffffffc0204af4:	8082                	ret
ffffffffc0204af6:	00008697          	auipc	a3,0x8
ffffffffc0204afa:	75268693          	addi	a3,a3,1874 # ffffffffc020d248 <etext+0x1b34>
ffffffffc0204afe:	00007617          	auipc	a2,0x7
ffffffffc0204b02:	05260613          	addi	a2,a2,82 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0204b06:	07300593          	li	a1,115
ffffffffc0204b0a:	00008517          	auipc	a0,0x8
ffffffffc0204b0e:	63e50513          	addi	a0,a0,1598 # ffffffffc020d148 <etext+0x1a34>
ffffffffc0204b12:	939fb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0204b16:	ed1ff0ef          	jal	ffffffffc02049e6 <fd_array_open.part.0>

ffffffffc0204b1a <file_testfd>:
ffffffffc0204b1a:	04700793          	li	a5,71
ffffffffc0204b1e:	04a7e263          	bltu	a5,a0,ffffffffc0204b62 <file_testfd+0x48>
ffffffffc0204b22:	00092797          	auipc	a5,0x92
ffffffffc0204b26:	da67b783          	ld	a5,-602(a5) # ffffffffc02968c8 <current>
ffffffffc0204b2a:	1487b783          	ld	a5,328(a5)
ffffffffc0204b2e:	cf85                	beqz	a5,ffffffffc0204b66 <file_testfd+0x4c>
ffffffffc0204b30:	4b98                	lw	a4,16(a5)
ffffffffc0204b32:	02e05a63          	blez	a4,ffffffffc0204b66 <file_testfd+0x4c>
ffffffffc0204b36:	6798                	ld	a4,8(a5)
ffffffffc0204b38:	00351793          	slli	a5,a0,0x3
ffffffffc0204b3c:	8f89                	sub	a5,a5,a0
ffffffffc0204b3e:	078e                	slli	a5,a5,0x3
ffffffffc0204b40:	97ba                	add	a5,a5,a4
ffffffffc0204b42:	4394                	lw	a3,0(a5)
ffffffffc0204b44:	4709                	li	a4,2
ffffffffc0204b46:	00e69e63          	bne	a3,a4,ffffffffc0204b62 <file_testfd+0x48>
ffffffffc0204b4a:	4f98                	lw	a4,24(a5)
ffffffffc0204b4c:	00a71b63          	bne	a4,a0,ffffffffc0204b62 <file_testfd+0x48>
ffffffffc0204b50:	c199                	beqz	a1,ffffffffc0204b56 <file_testfd+0x3c>
ffffffffc0204b52:	6788                	ld	a0,8(a5)
ffffffffc0204b54:	c901                	beqz	a0,ffffffffc0204b64 <file_testfd+0x4a>
ffffffffc0204b56:	4505                	li	a0,1
ffffffffc0204b58:	c611                	beqz	a2,ffffffffc0204b64 <file_testfd+0x4a>
ffffffffc0204b5a:	6b88                	ld	a0,16(a5)
ffffffffc0204b5c:	00a03533          	snez	a0,a0
ffffffffc0204b60:	8082                	ret
ffffffffc0204b62:	4501                	li	a0,0
ffffffffc0204b64:	8082                	ret
ffffffffc0204b66:	1141                	addi	sp,sp,-16
ffffffffc0204b68:	e406                	sd	ra,8(sp)
ffffffffc0204b6a:	ce7ff0ef          	jal	ffffffffc0204850 <get_fd_array.part.0>

ffffffffc0204b6e <file_open>:
ffffffffc0204b6e:	0035f793          	andi	a5,a1,3
ffffffffc0204b72:	470d                	li	a4,3
ffffffffc0204b74:	0ee78563          	beq	a5,a4,ffffffffc0204c5e <file_open+0xf0>
ffffffffc0204b78:	078e                	slli	a5,a5,0x3
ffffffffc0204b7a:	0000a717          	auipc	a4,0xa
ffffffffc0204b7e:	18670713          	addi	a4,a4,390 # ffffffffc020ed00 <CSWTCH.79>
ffffffffc0204b82:	0000a697          	auipc	a3,0xa
ffffffffc0204b86:	19668693          	addi	a3,a3,406 # ffffffffc020ed18 <CSWTCH.78>
ffffffffc0204b8a:	96be                	add	a3,a3,a5
ffffffffc0204b8c:	97ba                	add	a5,a5,a4
ffffffffc0204b8e:	7159                	addi	sp,sp,-112
ffffffffc0204b90:	639c                	ld	a5,0(a5)
ffffffffc0204b92:	6298                	ld	a4,0(a3)
ffffffffc0204b94:	eca6                	sd	s1,88(sp)
ffffffffc0204b96:	84aa                	mv	s1,a0
ffffffffc0204b98:	755d                	lui	a0,0xffff7
ffffffffc0204b9a:	f0a2                	sd	s0,96(sp)
ffffffffc0204b9c:	ad950513          	addi	a0,a0,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0204ba0:	842e                	mv	s0,a1
ffffffffc0204ba2:	080c                	addi	a1,sp,16
ffffffffc0204ba4:	e8ca                	sd	s2,80(sp)
ffffffffc0204ba6:	e4ce                	sd	s3,72(sp)
ffffffffc0204ba8:	f486                	sd	ra,104(sp)
ffffffffc0204baa:	89be                	mv	s3,a5
ffffffffc0204bac:	893a                	mv	s2,a4
ffffffffc0204bae:	cc5ff0ef          	jal	ffffffffc0204872 <fd_array_alloc>
ffffffffc0204bb2:	87aa                	mv	a5,a0
ffffffffc0204bb4:	c909                	beqz	a0,ffffffffc0204bc6 <file_open+0x58>
ffffffffc0204bb6:	70a6                	ld	ra,104(sp)
ffffffffc0204bb8:	7406                	ld	s0,96(sp)
ffffffffc0204bba:	64e6                	ld	s1,88(sp)
ffffffffc0204bbc:	6946                	ld	s2,80(sp)
ffffffffc0204bbe:	69a6                	ld	s3,72(sp)
ffffffffc0204bc0:	853e                	mv	a0,a5
ffffffffc0204bc2:	6165                	addi	sp,sp,112
ffffffffc0204bc4:	8082                	ret
ffffffffc0204bc6:	8526                	mv	a0,s1
ffffffffc0204bc8:	0830                	addi	a2,sp,24
ffffffffc0204bca:	85a2                	mv	a1,s0
ffffffffc0204bcc:	492030ef          	jal	ffffffffc020805e <vfs_open>
ffffffffc0204bd0:	6742                	ld	a4,16(sp)
ffffffffc0204bd2:	e141                	bnez	a0,ffffffffc0204c52 <file_open+0xe4>
ffffffffc0204bd4:	02073023          	sd	zero,32(a4)
ffffffffc0204bd8:	02047593          	andi	a1,s0,32
ffffffffc0204bdc:	c98d                	beqz	a1,ffffffffc0204c0e <file_open+0xa0>
ffffffffc0204bde:	6562                	ld	a0,24(sp)
ffffffffc0204be0:	c541                	beqz	a0,ffffffffc0204c68 <file_open+0xfa>
ffffffffc0204be2:	793c                	ld	a5,112(a0)
ffffffffc0204be4:	c3d1                	beqz	a5,ffffffffc0204c68 <file_open+0xfa>
ffffffffc0204be6:	779c                	ld	a5,40(a5)
ffffffffc0204be8:	c3c1                	beqz	a5,ffffffffc0204c68 <file_open+0xfa>
ffffffffc0204bea:	00008597          	auipc	a1,0x8
ffffffffc0204bee:	6e658593          	addi	a1,a1,1766 # ffffffffc020d2d0 <etext+0x1bbc>
ffffffffc0204bf2:	e43a                	sd	a4,8(sp)
ffffffffc0204bf4:	e02a                	sd	a0,0(sp)
ffffffffc0204bf6:	567020ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0204bfa:	6502                	ld	a0,0(sp)
ffffffffc0204bfc:	100c                	addi	a1,sp,32
ffffffffc0204bfe:	793c                	ld	a5,112(a0)
ffffffffc0204c00:	6562                	ld	a0,24(sp)
ffffffffc0204c02:	779c                	ld	a5,40(a5)
ffffffffc0204c04:	9782                	jalr	a5
ffffffffc0204c06:	6722                	ld	a4,8(sp)
ffffffffc0204c08:	e91d                	bnez	a0,ffffffffc0204c3e <file_open+0xd0>
ffffffffc0204c0a:	77e2                	ld	a5,56(sp)
ffffffffc0204c0c:	f31c                	sd	a5,32(a4)
ffffffffc0204c0e:	66e2                	ld	a3,24(sp)
ffffffffc0204c10:	431c                	lw	a5,0(a4)
ffffffffc0204c12:	01273423          	sd	s2,8(a4)
ffffffffc0204c16:	01373823          	sd	s3,16(a4)
ffffffffc0204c1a:	f714                	sd	a3,40(a4)
ffffffffc0204c1c:	17fd                	addi	a5,a5,-1
ffffffffc0204c1e:	e3b9                	bnez	a5,ffffffffc0204c64 <file_open+0xf6>
ffffffffc0204c20:	c2b1                	beqz	a3,ffffffffc0204c64 <file_open+0xf6>
ffffffffc0204c22:	5b1c                	lw	a5,48(a4)
ffffffffc0204c24:	70a6                	ld	ra,104(sp)
ffffffffc0204c26:	7406                	ld	s0,96(sp)
ffffffffc0204c28:	2785                	addiw	a5,a5,1
ffffffffc0204c2a:	db1c                	sw	a5,48(a4)
ffffffffc0204c2c:	4f1c                	lw	a5,24(a4)
ffffffffc0204c2e:	4689                	li	a3,2
ffffffffc0204c30:	c314                	sw	a3,0(a4)
ffffffffc0204c32:	64e6                	ld	s1,88(sp)
ffffffffc0204c34:	6946                	ld	s2,80(sp)
ffffffffc0204c36:	69a6                	ld	s3,72(sp)
ffffffffc0204c38:	853e                	mv	a0,a5
ffffffffc0204c3a:	6165                	addi	sp,sp,112
ffffffffc0204c3c:	8082                	ret
ffffffffc0204c3e:	e42a                	sd	a0,8(sp)
ffffffffc0204c40:	6562                	ld	a0,24(sp)
ffffffffc0204c42:	e03a                	sd	a4,0(sp)
ffffffffc0204c44:	5f0030ef          	jal	ffffffffc0208234 <vfs_close>
ffffffffc0204c48:	6502                	ld	a0,0(sp)
ffffffffc0204c4a:	cbbff0ef          	jal	ffffffffc0204904 <fd_array_free>
ffffffffc0204c4e:	67a2                	ld	a5,8(sp)
ffffffffc0204c50:	b79d                	j	ffffffffc0204bb6 <file_open+0x48>
ffffffffc0204c52:	e02a                	sd	a0,0(sp)
ffffffffc0204c54:	853a                	mv	a0,a4
ffffffffc0204c56:	cafff0ef          	jal	ffffffffc0204904 <fd_array_free>
ffffffffc0204c5a:	6782                	ld	a5,0(sp)
ffffffffc0204c5c:	bfa9                	j	ffffffffc0204bb6 <file_open+0x48>
ffffffffc0204c5e:	57f5                	li	a5,-3
ffffffffc0204c60:	853e                	mv	a0,a5
ffffffffc0204c62:	8082                	ret
ffffffffc0204c64:	d83ff0ef          	jal	ffffffffc02049e6 <fd_array_open.part.0>
ffffffffc0204c68:	00008697          	auipc	a3,0x8
ffffffffc0204c6c:	61868693          	addi	a3,a3,1560 # ffffffffc020d280 <etext+0x1b6c>
ffffffffc0204c70:	00007617          	auipc	a2,0x7
ffffffffc0204c74:	ee060613          	addi	a2,a2,-288 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0204c78:	0b500593          	li	a1,181
ffffffffc0204c7c:	00008517          	auipc	a0,0x8
ffffffffc0204c80:	4cc50513          	addi	a0,a0,1228 # ffffffffc020d148 <etext+0x1a34>
ffffffffc0204c84:	fc6fb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0204c88 <file_close>:
ffffffffc0204c88:	04700793          	li	a5,71
ffffffffc0204c8c:	04a7e663          	bltu	a5,a0,ffffffffc0204cd8 <file_close+0x50>
ffffffffc0204c90:	00092717          	auipc	a4,0x92
ffffffffc0204c94:	c3873703          	ld	a4,-968(a4) # ffffffffc02968c8 <current>
ffffffffc0204c98:	1141                	addi	sp,sp,-16
ffffffffc0204c9a:	e406                	sd	ra,8(sp)
ffffffffc0204c9c:	14873703          	ld	a4,328(a4)
ffffffffc0204ca0:	87aa                	mv	a5,a0
ffffffffc0204ca2:	cf0d                	beqz	a4,ffffffffc0204cdc <file_close+0x54>
ffffffffc0204ca4:	4b14                	lw	a3,16(a4)
ffffffffc0204ca6:	02d05b63          	blez	a3,ffffffffc0204cdc <file_close+0x54>
ffffffffc0204caa:	6708                	ld	a0,8(a4)
ffffffffc0204cac:	00379713          	slli	a4,a5,0x3
ffffffffc0204cb0:	8f1d                	sub	a4,a4,a5
ffffffffc0204cb2:	070e                	slli	a4,a4,0x3
ffffffffc0204cb4:	953a                	add	a0,a0,a4
ffffffffc0204cb6:	4114                	lw	a3,0(a0)
ffffffffc0204cb8:	4709                	li	a4,2
ffffffffc0204cba:	00e69b63          	bne	a3,a4,ffffffffc0204cd0 <file_close+0x48>
ffffffffc0204cbe:	4d18                	lw	a4,24(a0)
ffffffffc0204cc0:	00f71863          	bne	a4,a5,ffffffffc0204cd0 <file_close+0x48>
ffffffffc0204cc4:	d63ff0ef          	jal	ffffffffc0204a26 <fd_array_close>
ffffffffc0204cc8:	60a2                	ld	ra,8(sp)
ffffffffc0204cca:	4501                	li	a0,0
ffffffffc0204ccc:	0141                	addi	sp,sp,16
ffffffffc0204cce:	8082                	ret
ffffffffc0204cd0:	60a2                	ld	ra,8(sp)
ffffffffc0204cd2:	5575                	li	a0,-3
ffffffffc0204cd4:	0141                	addi	sp,sp,16
ffffffffc0204cd6:	8082                	ret
ffffffffc0204cd8:	5575                	li	a0,-3
ffffffffc0204cda:	8082                	ret
ffffffffc0204cdc:	b75ff0ef          	jal	ffffffffc0204850 <get_fd_array.part.0>

ffffffffc0204ce0 <file_read>:
ffffffffc0204ce0:	711d                	addi	sp,sp,-96
ffffffffc0204ce2:	ec86                	sd	ra,88(sp)
ffffffffc0204ce4:	e0ca                	sd	s2,64(sp)
ffffffffc0204ce6:	0006b023          	sd	zero,0(a3)
ffffffffc0204cea:	04700793          	li	a5,71
ffffffffc0204cee:	0aa7ec63          	bltu	a5,a0,ffffffffc0204da6 <file_read+0xc6>
ffffffffc0204cf2:	00092797          	auipc	a5,0x92
ffffffffc0204cf6:	bd67b783          	ld	a5,-1066(a5) # ffffffffc02968c8 <current>
ffffffffc0204cfa:	e4a6                	sd	s1,72(sp)
ffffffffc0204cfc:	e8a2                	sd	s0,80(sp)
ffffffffc0204cfe:	1487b783          	ld	a5,328(a5)
ffffffffc0204d02:	fc4e                	sd	s3,56(sp)
ffffffffc0204d04:	84b6                	mv	s1,a3
ffffffffc0204d06:	c3f1                	beqz	a5,ffffffffc0204dca <file_read+0xea>
ffffffffc0204d08:	4b98                	lw	a4,16(a5)
ffffffffc0204d0a:	0ce05063          	blez	a4,ffffffffc0204dca <file_read+0xea>
ffffffffc0204d0e:	6780                	ld	s0,8(a5)
ffffffffc0204d10:	00351793          	slli	a5,a0,0x3
ffffffffc0204d14:	8f89                	sub	a5,a5,a0
ffffffffc0204d16:	078e                	slli	a5,a5,0x3
ffffffffc0204d18:	943e                	add	s0,s0,a5
ffffffffc0204d1a:	00042983          	lw	s3,0(s0)
ffffffffc0204d1e:	4789                	li	a5,2
ffffffffc0204d20:	06f99a63          	bne	s3,a5,ffffffffc0204d94 <file_read+0xb4>
ffffffffc0204d24:	4c1c                	lw	a5,24(s0)
ffffffffc0204d26:	06a79763          	bne	a5,a0,ffffffffc0204d94 <file_read+0xb4>
ffffffffc0204d2a:	641c                	ld	a5,8(s0)
ffffffffc0204d2c:	c7a5                	beqz	a5,ffffffffc0204d94 <file_read+0xb4>
ffffffffc0204d2e:	581c                	lw	a5,48(s0)
ffffffffc0204d30:	7014                	ld	a3,32(s0)
ffffffffc0204d32:	0808                	addi	a0,sp,16
ffffffffc0204d34:	2785                	addiw	a5,a5,1
ffffffffc0204d36:	d81c                	sw	a5,48(s0)
ffffffffc0204d38:	7a0000ef          	jal	ffffffffc02054d8 <iobuf_init>
ffffffffc0204d3c:	892a                	mv	s2,a0
ffffffffc0204d3e:	7408                	ld	a0,40(s0)
ffffffffc0204d40:	c52d                	beqz	a0,ffffffffc0204daa <file_read+0xca>
ffffffffc0204d42:	793c                	ld	a5,112(a0)
ffffffffc0204d44:	c3bd                	beqz	a5,ffffffffc0204daa <file_read+0xca>
ffffffffc0204d46:	6f9c                	ld	a5,24(a5)
ffffffffc0204d48:	c3ad                	beqz	a5,ffffffffc0204daa <file_read+0xca>
ffffffffc0204d4a:	00008597          	auipc	a1,0x8
ffffffffc0204d4e:	5de58593          	addi	a1,a1,1502 # ffffffffc020d328 <etext+0x1c14>
ffffffffc0204d52:	e42a                	sd	a0,8(sp)
ffffffffc0204d54:	409020ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0204d58:	6522                	ld	a0,8(sp)
ffffffffc0204d5a:	85ca                	mv	a1,s2
ffffffffc0204d5c:	793c                	ld	a5,112(a0)
ffffffffc0204d5e:	7408                	ld	a0,40(s0)
ffffffffc0204d60:	6f9c                	ld	a5,24(a5)
ffffffffc0204d62:	9782                	jalr	a5
ffffffffc0204d64:	01093783          	ld	a5,16(s2)
ffffffffc0204d68:	01893683          	ld	a3,24(s2)
ffffffffc0204d6c:	4018                	lw	a4,0(s0)
ffffffffc0204d6e:	892a                	mv	s2,a0
ffffffffc0204d70:	8f95                	sub	a5,a5,a3
ffffffffc0204d72:	01371563          	bne	a4,s3,ffffffffc0204d7c <file_read+0x9c>
ffffffffc0204d76:	7018                	ld	a4,32(s0)
ffffffffc0204d78:	973e                	add	a4,a4,a5
ffffffffc0204d7a:	f018                	sd	a4,32(s0)
ffffffffc0204d7c:	e09c                	sd	a5,0(s1)
ffffffffc0204d7e:	8522                	mv	a0,s0
ffffffffc0204d80:	bffff0ef          	jal	ffffffffc020497e <fd_array_release>
ffffffffc0204d84:	6446                	ld	s0,80(sp)
ffffffffc0204d86:	64a6                	ld	s1,72(sp)
ffffffffc0204d88:	79e2                	ld	s3,56(sp)
ffffffffc0204d8a:	60e6                	ld	ra,88(sp)
ffffffffc0204d8c:	854a                	mv	a0,s2
ffffffffc0204d8e:	6906                	ld	s2,64(sp)
ffffffffc0204d90:	6125                	addi	sp,sp,96
ffffffffc0204d92:	8082                	ret
ffffffffc0204d94:	6446                	ld	s0,80(sp)
ffffffffc0204d96:	60e6                	ld	ra,88(sp)
ffffffffc0204d98:	5975                	li	s2,-3
ffffffffc0204d9a:	64a6                	ld	s1,72(sp)
ffffffffc0204d9c:	79e2                	ld	s3,56(sp)
ffffffffc0204d9e:	854a                	mv	a0,s2
ffffffffc0204da0:	6906                	ld	s2,64(sp)
ffffffffc0204da2:	6125                	addi	sp,sp,96
ffffffffc0204da4:	8082                	ret
ffffffffc0204da6:	5975                	li	s2,-3
ffffffffc0204da8:	b7cd                	j	ffffffffc0204d8a <file_read+0xaa>
ffffffffc0204daa:	00008697          	auipc	a3,0x8
ffffffffc0204dae:	52e68693          	addi	a3,a3,1326 # ffffffffc020d2d8 <etext+0x1bc4>
ffffffffc0204db2:	00007617          	auipc	a2,0x7
ffffffffc0204db6:	d9e60613          	addi	a2,a2,-610 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0204dba:	0de00593          	li	a1,222
ffffffffc0204dbe:	00008517          	auipc	a0,0x8
ffffffffc0204dc2:	38a50513          	addi	a0,a0,906 # ffffffffc020d148 <etext+0x1a34>
ffffffffc0204dc6:	e84fb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0204dca:	a87ff0ef          	jal	ffffffffc0204850 <get_fd_array.part.0>

ffffffffc0204dce <file_write>:
ffffffffc0204dce:	711d                	addi	sp,sp,-96
ffffffffc0204dd0:	ec86                	sd	ra,88(sp)
ffffffffc0204dd2:	e0ca                	sd	s2,64(sp)
ffffffffc0204dd4:	0006b023          	sd	zero,0(a3)
ffffffffc0204dd8:	04700793          	li	a5,71
ffffffffc0204ddc:	0aa7ec63          	bltu	a5,a0,ffffffffc0204e94 <file_write+0xc6>
ffffffffc0204de0:	00092797          	auipc	a5,0x92
ffffffffc0204de4:	ae87b783          	ld	a5,-1304(a5) # ffffffffc02968c8 <current>
ffffffffc0204de8:	e4a6                	sd	s1,72(sp)
ffffffffc0204dea:	e8a2                	sd	s0,80(sp)
ffffffffc0204dec:	1487b783          	ld	a5,328(a5)
ffffffffc0204df0:	fc4e                	sd	s3,56(sp)
ffffffffc0204df2:	84b6                	mv	s1,a3
ffffffffc0204df4:	c3f1                	beqz	a5,ffffffffc0204eb8 <file_write+0xea>
ffffffffc0204df6:	4b98                	lw	a4,16(a5)
ffffffffc0204df8:	0ce05063          	blez	a4,ffffffffc0204eb8 <file_write+0xea>
ffffffffc0204dfc:	6780                	ld	s0,8(a5)
ffffffffc0204dfe:	00351793          	slli	a5,a0,0x3
ffffffffc0204e02:	8f89                	sub	a5,a5,a0
ffffffffc0204e04:	078e                	slli	a5,a5,0x3
ffffffffc0204e06:	943e                	add	s0,s0,a5
ffffffffc0204e08:	00042983          	lw	s3,0(s0)
ffffffffc0204e0c:	4789                	li	a5,2
ffffffffc0204e0e:	06f99a63          	bne	s3,a5,ffffffffc0204e82 <file_write+0xb4>
ffffffffc0204e12:	4c1c                	lw	a5,24(s0)
ffffffffc0204e14:	06a79763          	bne	a5,a0,ffffffffc0204e82 <file_write+0xb4>
ffffffffc0204e18:	681c                	ld	a5,16(s0)
ffffffffc0204e1a:	c7a5                	beqz	a5,ffffffffc0204e82 <file_write+0xb4>
ffffffffc0204e1c:	581c                	lw	a5,48(s0)
ffffffffc0204e1e:	7014                	ld	a3,32(s0)
ffffffffc0204e20:	0808                	addi	a0,sp,16
ffffffffc0204e22:	2785                	addiw	a5,a5,1
ffffffffc0204e24:	d81c                	sw	a5,48(s0)
ffffffffc0204e26:	6b2000ef          	jal	ffffffffc02054d8 <iobuf_init>
ffffffffc0204e2a:	892a                	mv	s2,a0
ffffffffc0204e2c:	7408                	ld	a0,40(s0)
ffffffffc0204e2e:	c52d                	beqz	a0,ffffffffc0204e98 <file_write+0xca>
ffffffffc0204e30:	793c                	ld	a5,112(a0)
ffffffffc0204e32:	c3bd                	beqz	a5,ffffffffc0204e98 <file_write+0xca>
ffffffffc0204e34:	739c                	ld	a5,32(a5)
ffffffffc0204e36:	c3ad                	beqz	a5,ffffffffc0204e98 <file_write+0xca>
ffffffffc0204e38:	00008597          	auipc	a1,0x8
ffffffffc0204e3c:	54858593          	addi	a1,a1,1352 # ffffffffc020d380 <etext+0x1c6c>
ffffffffc0204e40:	e42a                	sd	a0,8(sp)
ffffffffc0204e42:	31b020ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0204e46:	6522                	ld	a0,8(sp)
ffffffffc0204e48:	85ca                	mv	a1,s2
ffffffffc0204e4a:	793c                	ld	a5,112(a0)
ffffffffc0204e4c:	7408                	ld	a0,40(s0)
ffffffffc0204e4e:	739c                	ld	a5,32(a5)
ffffffffc0204e50:	9782                	jalr	a5
ffffffffc0204e52:	01093783          	ld	a5,16(s2)
ffffffffc0204e56:	01893683          	ld	a3,24(s2)
ffffffffc0204e5a:	4018                	lw	a4,0(s0)
ffffffffc0204e5c:	892a                	mv	s2,a0
ffffffffc0204e5e:	8f95                	sub	a5,a5,a3
ffffffffc0204e60:	01371563          	bne	a4,s3,ffffffffc0204e6a <file_write+0x9c>
ffffffffc0204e64:	7018                	ld	a4,32(s0)
ffffffffc0204e66:	973e                	add	a4,a4,a5
ffffffffc0204e68:	f018                	sd	a4,32(s0)
ffffffffc0204e6a:	e09c                	sd	a5,0(s1)
ffffffffc0204e6c:	8522                	mv	a0,s0
ffffffffc0204e6e:	b11ff0ef          	jal	ffffffffc020497e <fd_array_release>
ffffffffc0204e72:	6446                	ld	s0,80(sp)
ffffffffc0204e74:	64a6                	ld	s1,72(sp)
ffffffffc0204e76:	79e2                	ld	s3,56(sp)
ffffffffc0204e78:	60e6                	ld	ra,88(sp)
ffffffffc0204e7a:	854a                	mv	a0,s2
ffffffffc0204e7c:	6906                	ld	s2,64(sp)
ffffffffc0204e7e:	6125                	addi	sp,sp,96
ffffffffc0204e80:	8082                	ret
ffffffffc0204e82:	6446                	ld	s0,80(sp)
ffffffffc0204e84:	60e6                	ld	ra,88(sp)
ffffffffc0204e86:	5975                	li	s2,-3
ffffffffc0204e88:	64a6                	ld	s1,72(sp)
ffffffffc0204e8a:	79e2                	ld	s3,56(sp)
ffffffffc0204e8c:	854a                	mv	a0,s2
ffffffffc0204e8e:	6906                	ld	s2,64(sp)
ffffffffc0204e90:	6125                	addi	sp,sp,96
ffffffffc0204e92:	8082                	ret
ffffffffc0204e94:	5975                	li	s2,-3
ffffffffc0204e96:	b7cd                	j	ffffffffc0204e78 <file_write+0xaa>
ffffffffc0204e98:	00008697          	auipc	a3,0x8
ffffffffc0204e9c:	49868693          	addi	a3,a3,1176 # ffffffffc020d330 <etext+0x1c1c>
ffffffffc0204ea0:	00007617          	auipc	a2,0x7
ffffffffc0204ea4:	cb060613          	addi	a2,a2,-848 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0204ea8:	0f800593          	li	a1,248
ffffffffc0204eac:	00008517          	auipc	a0,0x8
ffffffffc0204eb0:	29c50513          	addi	a0,a0,668 # ffffffffc020d148 <etext+0x1a34>
ffffffffc0204eb4:	d96fb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0204eb8:	999ff0ef          	jal	ffffffffc0204850 <get_fd_array.part.0>

ffffffffc0204ebc <file_seek>:
ffffffffc0204ebc:	7139                	addi	sp,sp,-64
ffffffffc0204ebe:	fc06                	sd	ra,56(sp)
ffffffffc0204ec0:	f426                	sd	s1,40(sp)
ffffffffc0204ec2:	04700793          	li	a5,71
ffffffffc0204ec6:	0ca7e563          	bltu	a5,a0,ffffffffc0204f90 <file_seek+0xd4>
ffffffffc0204eca:	00092797          	auipc	a5,0x92
ffffffffc0204ece:	9fe7b783          	ld	a5,-1538(a5) # ffffffffc02968c8 <current>
ffffffffc0204ed2:	f822                	sd	s0,48(sp)
ffffffffc0204ed4:	1487b783          	ld	a5,328(a5)
ffffffffc0204ed8:	c3e9                	beqz	a5,ffffffffc0204f9a <file_seek+0xde>
ffffffffc0204eda:	4b98                	lw	a4,16(a5)
ffffffffc0204edc:	0ae05f63          	blez	a4,ffffffffc0204f9a <file_seek+0xde>
ffffffffc0204ee0:	6780                	ld	s0,8(a5)
ffffffffc0204ee2:	00351793          	slli	a5,a0,0x3
ffffffffc0204ee6:	8f89                	sub	a5,a5,a0
ffffffffc0204ee8:	078e                	slli	a5,a5,0x3
ffffffffc0204eea:	943e                	add	s0,s0,a5
ffffffffc0204eec:	4018                	lw	a4,0(s0)
ffffffffc0204eee:	4789                	li	a5,2
ffffffffc0204ef0:	0af71263          	bne	a4,a5,ffffffffc0204f94 <file_seek+0xd8>
ffffffffc0204ef4:	4c1c                	lw	a5,24(s0)
ffffffffc0204ef6:	f04a                	sd	s2,32(sp)
ffffffffc0204ef8:	08a79863          	bne	a5,a0,ffffffffc0204f88 <file_seek+0xcc>
ffffffffc0204efc:	581c                	lw	a5,48(s0)
ffffffffc0204efe:	4685                	li	a3,1
ffffffffc0204f00:	892e                	mv	s2,a1
ffffffffc0204f02:	2785                	addiw	a5,a5,1
ffffffffc0204f04:	d81c                	sw	a5,48(s0)
ffffffffc0204f06:	06d60d63          	beq	a2,a3,ffffffffc0204f80 <file_seek+0xc4>
ffffffffc0204f0a:	04e60463          	beq	a2,a4,ffffffffc0204f52 <file_seek+0x96>
ffffffffc0204f0e:	54f5                	li	s1,-3
ffffffffc0204f10:	e61d                	bnez	a2,ffffffffc0204f3e <file_seek+0x82>
ffffffffc0204f12:	7404                	ld	s1,40(s0)
ffffffffc0204f14:	c4d1                	beqz	s1,ffffffffc0204fa0 <file_seek+0xe4>
ffffffffc0204f16:	78bc                	ld	a5,112(s1)
ffffffffc0204f18:	c7c1                	beqz	a5,ffffffffc0204fa0 <file_seek+0xe4>
ffffffffc0204f1a:	6fbc                	ld	a5,88(a5)
ffffffffc0204f1c:	c3d1                	beqz	a5,ffffffffc0204fa0 <file_seek+0xe4>
ffffffffc0204f1e:	8526                	mv	a0,s1
ffffffffc0204f20:	00008597          	auipc	a1,0x8
ffffffffc0204f24:	4b858593          	addi	a1,a1,1208 # ffffffffc020d3d8 <etext+0x1cc4>
ffffffffc0204f28:	235020ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0204f2c:	78bc                	ld	a5,112(s1)
ffffffffc0204f2e:	7408                	ld	a0,40(s0)
ffffffffc0204f30:	85ca                	mv	a1,s2
ffffffffc0204f32:	6fbc                	ld	a5,88(a5)
ffffffffc0204f34:	9782                	jalr	a5
ffffffffc0204f36:	84aa                	mv	s1,a0
ffffffffc0204f38:	e119                	bnez	a0,ffffffffc0204f3e <file_seek+0x82>
ffffffffc0204f3a:	03243023          	sd	s2,32(s0)
ffffffffc0204f3e:	8522                	mv	a0,s0
ffffffffc0204f40:	a3fff0ef          	jal	ffffffffc020497e <fd_array_release>
ffffffffc0204f44:	7442                	ld	s0,48(sp)
ffffffffc0204f46:	7902                	ld	s2,32(sp)
ffffffffc0204f48:	70e2                	ld	ra,56(sp)
ffffffffc0204f4a:	8526                	mv	a0,s1
ffffffffc0204f4c:	74a2                	ld	s1,40(sp)
ffffffffc0204f4e:	6121                	addi	sp,sp,64
ffffffffc0204f50:	8082                	ret
ffffffffc0204f52:	7404                	ld	s1,40(s0)
ffffffffc0204f54:	c4b5                	beqz	s1,ffffffffc0204fc0 <file_seek+0x104>
ffffffffc0204f56:	78bc                	ld	a5,112(s1)
ffffffffc0204f58:	c7a5                	beqz	a5,ffffffffc0204fc0 <file_seek+0x104>
ffffffffc0204f5a:	779c                	ld	a5,40(a5)
ffffffffc0204f5c:	c3b5                	beqz	a5,ffffffffc0204fc0 <file_seek+0x104>
ffffffffc0204f5e:	8526                	mv	a0,s1
ffffffffc0204f60:	00008597          	auipc	a1,0x8
ffffffffc0204f64:	37058593          	addi	a1,a1,880 # ffffffffc020d2d0 <etext+0x1bbc>
ffffffffc0204f68:	1f5020ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0204f6c:	78bc                	ld	a5,112(s1)
ffffffffc0204f6e:	7408                	ld	a0,40(s0)
ffffffffc0204f70:	858a                	mv	a1,sp
ffffffffc0204f72:	779c                	ld	a5,40(a5)
ffffffffc0204f74:	9782                	jalr	a5
ffffffffc0204f76:	84aa                	mv	s1,a0
ffffffffc0204f78:	f179                	bnez	a0,ffffffffc0204f3e <file_seek+0x82>
ffffffffc0204f7a:	67e2                	ld	a5,24(sp)
ffffffffc0204f7c:	993e                	add	s2,s2,a5
ffffffffc0204f7e:	bf51                	j	ffffffffc0204f12 <file_seek+0x56>
ffffffffc0204f80:	701c                	ld	a5,32(s0)
ffffffffc0204f82:	00f58933          	add	s2,a1,a5
ffffffffc0204f86:	b771                	j	ffffffffc0204f12 <file_seek+0x56>
ffffffffc0204f88:	7442                	ld	s0,48(sp)
ffffffffc0204f8a:	7902                	ld	s2,32(sp)
ffffffffc0204f8c:	54f5                	li	s1,-3
ffffffffc0204f8e:	bf6d                	j	ffffffffc0204f48 <file_seek+0x8c>
ffffffffc0204f90:	54f5                	li	s1,-3
ffffffffc0204f92:	bf5d                	j	ffffffffc0204f48 <file_seek+0x8c>
ffffffffc0204f94:	7442                	ld	s0,48(sp)
ffffffffc0204f96:	54f5                	li	s1,-3
ffffffffc0204f98:	bf45                	j	ffffffffc0204f48 <file_seek+0x8c>
ffffffffc0204f9a:	f04a                	sd	s2,32(sp)
ffffffffc0204f9c:	8b5ff0ef          	jal	ffffffffc0204850 <get_fd_array.part.0>
ffffffffc0204fa0:	00008697          	auipc	a3,0x8
ffffffffc0204fa4:	3e868693          	addi	a3,a3,1000 # ffffffffc020d388 <etext+0x1c74>
ffffffffc0204fa8:	00007617          	auipc	a2,0x7
ffffffffc0204fac:	ba860613          	addi	a2,a2,-1112 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0204fb0:	11a00593          	li	a1,282
ffffffffc0204fb4:	00008517          	auipc	a0,0x8
ffffffffc0204fb8:	19450513          	addi	a0,a0,404 # ffffffffc020d148 <etext+0x1a34>
ffffffffc0204fbc:	c8efb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0204fc0:	00008697          	auipc	a3,0x8
ffffffffc0204fc4:	2c068693          	addi	a3,a3,704 # ffffffffc020d280 <etext+0x1b6c>
ffffffffc0204fc8:	00007617          	auipc	a2,0x7
ffffffffc0204fcc:	b8860613          	addi	a2,a2,-1144 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0204fd0:	11200593          	li	a1,274
ffffffffc0204fd4:	00008517          	auipc	a0,0x8
ffffffffc0204fd8:	17450513          	addi	a0,a0,372 # ffffffffc020d148 <etext+0x1a34>
ffffffffc0204fdc:	c6efb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0204fe0 <file_fstat>:
ffffffffc0204fe0:	7179                	addi	sp,sp,-48
ffffffffc0204fe2:	f406                	sd	ra,40(sp)
ffffffffc0204fe4:	f022                	sd	s0,32(sp)
ffffffffc0204fe6:	04700793          	li	a5,71
ffffffffc0204fea:	08a7e363          	bltu	a5,a0,ffffffffc0205070 <file_fstat+0x90>
ffffffffc0204fee:	00092797          	auipc	a5,0x92
ffffffffc0204ff2:	8da7b783          	ld	a5,-1830(a5) # ffffffffc02968c8 <current>
ffffffffc0204ff6:	ec26                	sd	s1,24(sp)
ffffffffc0204ff8:	84ae                	mv	s1,a1
ffffffffc0204ffa:	1487b783          	ld	a5,328(a5)
ffffffffc0204ffe:	cbd9                	beqz	a5,ffffffffc0205094 <file_fstat+0xb4>
ffffffffc0205000:	4b98                	lw	a4,16(a5)
ffffffffc0205002:	08e05963          	blez	a4,ffffffffc0205094 <file_fstat+0xb4>
ffffffffc0205006:	6780                	ld	s0,8(a5)
ffffffffc0205008:	00351793          	slli	a5,a0,0x3
ffffffffc020500c:	8f89                	sub	a5,a5,a0
ffffffffc020500e:	078e                	slli	a5,a5,0x3
ffffffffc0205010:	943e                	add	s0,s0,a5
ffffffffc0205012:	4018                	lw	a4,0(s0)
ffffffffc0205014:	4789                	li	a5,2
ffffffffc0205016:	04f71663          	bne	a4,a5,ffffffffc0205062 <file_fstat+0x82>
ffffffffc020501a:	4c1c                	lw	a5,24(s0)
ffffffffc020501c:	04a79363          	bne	a5,a0,ffffffffc0205062 <file_fstat+0x82>
ffffffffc0205020:	581c                	lw	a5,48(s0)
ffffffffc0205022:	7408                	ld	a0,40(s0)
ffffffffc0205024:	2785                	addiw	a5,a5,1
ffffffffc0205026:	d81c                	sw	a5,48(s0)
ffffffffc0205028:	c531                	beqz	a0,ffffffffc0205074 <file_fstat+0x94>
ffffffffc020502a:	793c                	ld	a5,112(a0)
ffffffffc020502c:	c7a1                	beqz	a5,ffffffffc0205074 <file_fstat+0x94>
ffffffffc020502e:	779c                	ld	a5,40(a5)
ffffffffc0205030:	c3b1                	beqz	a5,ffffffffc0205074 <file_fstat+0x94>
ffffffffc0205032:	00008597          	auipc	a1,0x8
ffffffffc0205036:	29e58593          	addi	a1,a1,670 # ffffffffc020d2d0 <etext+0x1bbc>
ffffffffc020503a:	e42a                	sd	a0,8(sp)
ffffffffc020503c:	121020ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0205040:	6522                	ld	a0,8(sp)
ffffffffc0205042:	85a6                	mv	a1,s1
ffffffffc0205044:	793c                	ld	a5,112(a0)
ffffffffc0205046:	7408                	ld	a0,40(s0)
ffffffffc0205048:	779c                	ld	a5,40(a5)
ffffffffc020504a:	9782                	jalr	a5
ffffffffc020504c:	87aa                	mv	a5,a0
ffffffffc020504e:	8522                	mv	a0,s0
ffffffffc0205050:	843e                	mv	s0,a5
ffffffffc0205052:	92dff0ef          	jal	ffffffffc020497e <fd_array_release>
ffffffffc0205056:	64e2                	ld	s1,24(sp)
ffffffffc0205058:	70a2                	ld	ra,40(sp)
ffffffffc020505a:	8522                	mv	a0,s0
ffffffffc020505c:	7402                	ld	s0,32(sp)
ffffffffc020505e:	6145                	addi	sp,sp,48
ffffffffc0205060:	8082                	ret
ffffffffc0205062:	5475                	li	s0,-3
ffffffffc0205064:	70a2                	ld	ra,40(sp)
ffffffffc0205066:	8522                	mv	a0,s0
ffffffffc0205068:	7402                	ld	s0,32(sp)
ffffffffc020506a:	64e2                	ld	s1,24(sp)
ffffffffc020506c:	6145                	addi	sp,sp,48
ffffffffc020506e:	8082                	ret
ffffffffc0205070:	5475                	li	s0,-3
ffffffffc0205072:	b7dd                	j	ffffffffc0205058 <file_fstat+0x78>
ffffffffc0205074:	00008697          	auipc	a3,0x8
ffffffffc0205078:	20c68693          	addi	a3,a3,524 # ffffffffc020d280 <etext+0x1b6c>
ffffffffc020507c:	00007617          	auipc	a2,0x7
ffffffffc0205080:	ad460613          	addi	a2,a2,-1324 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0205084:	12c00593          	li	a1,300
ffffffffc0205088:	00008517          	auipc	a0,0x8
ffffffffc020508c:	0c050513          	addi	a0,a0,192 # ffffffffc020d148 <etext+0x1a34>
ffffffffc0205090:	bbafb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0205094:	fbcff0ef          	jal	ffffffffc0204850 <get_fd_array.part.0>

ffffffffc0205098 <file_fsync>:
ffffffffc0205098:	1101                	addi	sp,sp,-32
ffffffffc020509a:	ec06                	sd	ra,24(sp)
ffffffffc020509c:	e822                	sd	s0,16(sp)
ffffffffc020509e:	04700793          	li	a5,71
ffffffffc02050a2:	06a7e863          	bltu	a5,a0,ffffffffc0205112 <file_fsync+0x7a>
ffffffffc02050a6:	00092797          	auipc	a5,0x92
ffffffffc02050aa:	8227b783          	ld	a5,-2014(a5) # ffffffffc02968c8 <current>
ffffffffc02050ae:	1487b783          	ld	a5,328(a5)
ffffffffc02050b2:	c7d1                	beqz	a5,ffffffffc020513e <file_fsync+0xa6>
ffffffffc02050b4:	4b98                	lw	a4,16(a5)
ffffffffc02050b6:	08e05463          	blez	a4,ffffffffc020513e <file_fsync+0xa6>
ffffffffc02050ba:	6780                	ld	s0,8(a5)
ffffffffc02050bc:	00351793          	slli	a5,a0,0x3
ffffffffc02050c0:	8f89                	sub	a5,a5,a0
ffffffffc02050c2:	078e                	slli	a5,a5,0x3
ffffffffc02050c4:	943e                	add	s0,s0,a5
ffffffffc02050c6:	4018                	lw	a4,0(s0)
ffffffffc02050c8:	4789                	li	a5,2
ffffffffc02050ca:	04f71463          	bne	a4,a5,ffffffffc0205112 <file_fsync+0x7a>
ffffffffc02050ce:	4c1c                	lw	a5,24(s0)
ffffffffc02050d0:	04a79163          	bne	a5,a0,ffffffffc0205112 <file_fsync+0x7a>
ffffffffc02050d4:	581c                	lw	a5,48(s0)
ffffffffc02050d6:	7408                	ld	a0,40(s0)
ffffffffc02050d8:	2785                	addiw	a5,a5,1
ffffffffc02050da:	d81c                	sw	a5,48(s0)
ffffffffc02050dc:	c129                	beqz	a0,ffffffffc020511e <file_fsync+0x86>
ffffffffc02050de:	793c                	ld	a5,112(a0)
ffffffffc02050e0:	cf9d                	beqz	a5,ffffffffc020511e <file_fsync+0x86>
ffffffffc02050e2:	7b9c                	ld	a5,48(a5)
ffffffffc02050e4:	cf8d                	beqz	a5,ffffffffc020511e <file_fsync+0x86>
ffffffffc02050e6:	00008597          	auipc	a1,0x8
ffffffffc02050ea:	34a58593          	addi	a1,a1,842 # ffffffffc020d430 <etext+0x1d1c>
ffffffffc02050ee:	e42a                	sd	a0,8(sp)
ffffffffc02050f0:	06d020ef          	jal	ffffffffc020795c <inode_check>
ffffffffc02050f4:	6522                	ld	a0,8(sp)
ffffffffc02050f6:	793c                	ld	a5,112(a0)
ffffffffc02050f8:	7408                	ld	a0,40(s0)
ffffffffc02050fa:	7b9c                	ld	a5,48(a5)
ffffffffc02050fc:	9782                	jalr	a5
ffffffffc02050fe:	87aa                	mv	a5,a0
ffffffffc0205100:	8522                	mv	a0,s0
ffffffffc0205102:	843e                	mv	s0,a5
ffffffffc0205104:	87bff0ef          	jal	ffffffffc020497e <fd_array_release>
ffffffffc0205108:	60e2                	ld	ra,24(sp)
ffffffffc020510a:	8522                	mv	a0,s0
ffffffffc020510c:	6442                	ld	s0,16(sp)
ffffffffc020510e:	6105                	addi	sp,sp,32
ffffffffc0205110:	8082                	ret
ffffffffc0205112:	5475                	li	s0,-3
ffffffffc0205114:	60e2                	ld	ra,24(sp)
ffffffffc0205116:	8522                	mv	a0,s0
ffffffffc0205118:	6442                	ld	s0,16(sp)
ffffffffc020511a:	6105                	addi	sp,sp,32
ffffffffc020511c:	8082                	ret
ffffffffc020511e:	00008697          	auipc	a3,0x8
ffffffffc0205122:	2c268693          	addi	a3,a3,706 # ffffffffc020d3e0 <etext+0x1ccc>
ffffffffc0205126:	00007617          	auipc	a2,0x7
ffffffffc020512a:	a2a60613          	addi	a2,a2,-1494 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020512e:	13a00593          	li	a1,314
ffffffffc0205132:	00008517          	auipc	a0,0x8
ffffffffc0205136:	01650513          	addi	a0,a0,22 # ffffffffc020d148 <etext+0x1a34>
ffffffffc020513a:	b10fb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020513e:	f12ff0ef          	jal	ffffffffc0204850 <get_fd_array.part.0>

ffffffffc0205142 <file_getdirentry>:
ffffffffc0205142:	715d                	addi	sp,sp,-80
ffffffffc0205144:	e486                	sd	ra,72(sp)
ffffffffc0205146:	f84a                	sd	s2,48(sp)
ffffffffc0205148:	04700793          	li	a5,71
ffffffffc020514c:	0aa7e963          	bltu	a5,a0,ffffffffc02051fe <file_getdirentry+0xbc>
ffffffffc0205150:	00091797          	auipc	a5,0x91
ffffffffc0205154:	7787b783          	ld	a5,1912(a5) # ffffffffc02968c8 <current>
ffffffffc0205158:	fc26                	sd	s1,56(sp)
ffffffffc020515a:	e0a2                	sd	s0,64(sp)
ffffffffc020515c:	1487b783          	ld	a5,328(a5)
ffffffffc0205160:	84ae                	mv	s1,a1
ffffffffc0205162:	c7e1                	beqz	a5,ffffffffc020522a <file_getdirentry+0xe8>
ffffffffc0205164:	4b98                	lw	a4,16(a5)
ffffffffc0205166:	0ce05263          	blez	a4,ffffffffc020522a <file_getdirentry+0xe8>
ffffffffc020516a:	6780                	ld	s0,8(a5)
ffffffffc020516c:	00351793          	slli	a5,a0,0x3
ffffffffc0205170:	8f89                	sub	a5,a5,a0
ffffffffc0205172:	078e                	slli	a5,a5,0x3
ffffffffc0205174:	943e                	add	s0,s0,a5
ffffffffc0205176:	4018                	lw	a4,0(s0)
ffffffffc0205178:	4789                	li	a5,2
ffffffffc020517a:	08f71463          	bne	a4,a5,ffffffffc0205202 <file_getdirentry+0xc0>
ffffffffc020517e:	4c1c                	lw	a5,24(s0)
ffffffffc0205180:	f44e                	sd	s3,40(sp)
ffffffffc0205182:	06a79963          	bne	a5,a0,ffffffffc02051f4 <file_getdirentry+0xb2>
ffffffffc0205186:	581c                	lw	a5,48(s0)
ffffffffc0205188:	6194                	ld	a3,0(a1)
ffffffffc020518a:	10000613          	li	a2,256
ffffffffc020518e:	2785                	addiw	a5,a5,1
ffffffffc0205190:	d81c                	sw	a5,48(s0)
ffffffffc0205192:	05a1                	addi	a1,a1,8
ffffffffc0205194:	850a                	mv	a0,sp
ffffffffc0205196:	342000ef          	jal	ffffffffc02054d8 <iobuf_init>
ffffffffc020519a:	02843903          	ld	s2,40(s0)
ffffffffc020519e:	89aa                	mv	s3,a0
ffffffffc02051a0:	06090563          	beqz	s2,ffffffffc020520a <file_getdirentry+0xc8>
ffffffffc02051a4:	07093783          	ld	a5,112(s2)
ffffffffc02051a8:	c3ad                	beqz	a5,ffffffffc020520a <file_getdirentry+0xc8>
ffffffffc02051aa:	63bc                	ld	a5,64(a5)
ffffffffc02051ac:	cfb9                	beqz	a5,ffffffffc020520a <file_getdirentry+0xc8>
ffffffffc02051ae:	854a                	mv	a0,s2
ffffffffc02051b0:	00008597          	auipc	a1,0x8
ffffffffc02051b4:	2e058593          	addi	a1,a1,736 # ffffffffc020d490 <etext+0x1d7c>
ffffffffc02051b8:	7a4020ef          	jal	ffffffffc020795c <inode_check>
ffffffffc02051bc:	07093783          	ld	a5,112(s2)
ffffffffc02051c0:	7408                	ld	a0,40(s0)
ffffffffc02051c2:	85ce                	mv	a1,s3
ffffffffc02051c4:	63bc                	ld	a5,64(a5)
ffffffffc02051c6:	9782                	jalr	a5
ffffffffc02051c8:	892a                	mv	s2,a0
ffffffffc02051ca:	cd01                	beqz	a0,ffffffffc02051e2 <file_getdirentry+0xa0>
ffffffffc02051cc:	8522                	mv	a0,s0
ffffffffc02051ce:	fb0ff0ef          	jal	ffffffffc020497e <fd_array_release>
ffffffffc02051d2:	6406                	ld	s0,64(sp)
ffffffffc02051d4:	74e2                	ld	s1,56(sp)
ffffffffc02051d6:	79a2                	ld	s3,40(sp)
ffffffffc02051d8:	60a6                	ld	ra,72(sp)
ffffffffc02051da:	854a                	mv	a0,s2
ffffffffc02051dc:	7942                	ld	s2,48(sp)
ffffffffc02051de:	6161                	addi	sp,sp,80
ffffffffc02051e0:	8082                	ret
ffffffffc02051e2:	609c                	ld	a5,0(s1)
ffffffffc02051e4:	0109b683          	ld	a3,16(s3)
ffffffffc02051e8:	0189b703          	ld	a4,24(s3)
ffffffffc02051ec:	97b6                	add	a5,a5,a3
ffffffffc02051ee:	8f99                	sub	a5,a5,a4
ffffffffc02051f0:	e09c                	sd	a5,0(s1)
ffffffffc02051f2:	bfe9                	j	ffffffffc02051cc <file_getdirentry+0x8a>
ffffffffc02051f4:	6406                	ld	s0,64(sp)
ffffffffc02051f6:	74e2                	ld	s1,56(sp)
ffffffffc02051f8:	79a2                	ld	s3,40(sp)
ffffffffc02051fa:	5975                	li	s2,-3
ffffffffc02051fc:	bff1                	j	ffffffffc02051d8 <file_getdirentry+0x96>
ffffffffc02051fe:	5975                	li	s2,-3
ffffffffc0205200:	bfe1                	j	ffffffffc02051d8 <file_getdirentry+0x96>
ffffffffc0205202:	6406                	ld	s0,64(sp)
ffffffffc0205204:	74e2                	ld	s1,56(sp)
ffffffffc0205206:	5975                	li	s2,-3
ffffffffc0205208:	bfc1                	j	ffffffffc02051d8 <file_getdirentry+0x96>
ffffffffc020520a:	00008697          	auipc	a3,0x8
ffffffffc020520e:	22e68693          	addi	a3,a3,558 # ffffffffc020d438 <etext+0x1d24>
ffffffffc0205212:	00007617          	auipc	a2,0x7
ffffffffc0205216:	93e60613          	addi	a2,a2,-1730 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020521a:	14a00593          	li	a1,330
ffffffffc020521e:	00008517          	auipc	a0,0x8
ffffffffc0205222:	f2a50513          	addi	a0,a0,-214 # ffffffffc020d148 <etext+0x1a34>
ffffffffc0205226:	a24fb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020522a:	f44e                	sd	s3,40(sp)
ffffffffc020522c:	e24ff0ef          	jal	ffffffffc0204850 <get_fd_array.part.0>

ffffffffc0205230 <file_dup>:
ffffffffc0205230:	04700713          	li	a4,71
ffffffffc0205234:	06a76263          	bltu	a4,a0,ffffffffc0205298 <file_dup+0x68>
ffffffffc0205238:	00091717          	auipc	a4,0x91
ffffffffc020523c:	69073703          	ld	a4,1680(a4) # ffffffffc02968c8 <current>
ffffffffc0205240:	7179                	addi	sp,sp,-48
ffffffffc0205242:	f406                	sd	ra,40(sp)
ffffffffc0205244:	14873703          	ld	a4,328(a4)
ffffffffc0205248:	f022                	sd	s0,32(sp)
ffffffffc020524a:	87aa                	mv	a5,a0
ffffffffc020524c:	852e                	mv	a0,a1
ffffffffc020524e:	c739                	beqz	a4,ffffffffc020529c <file_dup+0x6c>
ffffffffc0205250:	4b14                	lw	a3,16(a4)
ffffffffc0205252:	04d05563          	blez	a3,ffffffffc020529c <file_dup+0x6c>
ffffffffc0205256:	6700                	ld	s0,8(a4)
ffffffffc0205258:	00379713          	slli	a4,a5,0x3
ffffffffc020525c:	8f1d                	sub	a4,a4,a5
ffffffffc020525e:	070e                	slli	a4,a4,0x3
ffffffffc0205260:	943a                	add	s0,s0,a4
ffffffffc0205262:	4014                	lw	a3,0(s0)
ffffffffc0205264:	4709                	li	a4,2
ffffffffc0205266:	02e69463          	bne	a3,a4,ffffffffc020528e <file_dup+0x5e>
ffffffffc020526a:	4c18                	lw	a4,24(s0)
ffffffffc020526c:	02f71163          	bne	a4,a5,ffffffffc020528e <file_dup+0x5e>
ffffffffc0205270:	082c                	addi	a1,sp,24
ffffffffc0205272:	e00ff0ef          	jal	ffffffffc0204872 <fd_array_alloc>
ffffffffc0205276:	e901                	bnez	a0,ffffffffc0205286 <file_dup+0x56>
ffffffffc0205278:	6562                	ld	a0,24(sp)
ffffffffc020527a:	85a2                	mv	a1,s0
ffffffffc020527c:	e42a                	sd	a0,8(sp)
ffffffffc020527e:	821ff0ef          	jal	ffffffffc0204a9e <fd_array_dup>
ffffffffc0205282:	6522                	ld	a0,8(sp)
ffffffffc0205284:	4d08                	lw	a0,24(a0)
ffffffffc0205286:	70a2                	ld	ra,40(sp)
ffffffffc0205288:	7402                	ld	s0,32(sp)
ffffffffc020528a:	6145                	addi	sp,sp,48
ffffffffc020528c:	8082                	ret
ffffffffc020528e:	70a2                	ld	ra,40(sp)
ffffffffc0205290:	7402                	ld	s0,32(sp)
ffffffffc0205292:	5575                	li	a0,-3
ffffffffc0205294:	6145                	addi	sp,sp,48
ffffffffc0205296:	8082                	ret
ffffffffc0205298:	5575                	li	a0,-3
ffffffffc020529a:	8082                	ret
ffffffffc020529c:	db4ff0ef          	jal	ffffffffc0204850 <get_fd_array.part.0>

ffffffffc02052a0 <fs_init>:
ffffffffc02052a0:	1141                	addi	sp,sp,-16
ffffffffc02052a2:	e406                	sd	ra,8(sp)
ffffffffc02052a4:	0c3020ef          	jal	ffffffffc0207b66 <vfs_init>
ffffffffc02052a8:	5d0030ef          	jal	ffffffffc0208878 <dev_init>
ffffffffc02052ac:	60a2                	ld	ra,8(sp)
ffffffffc02052ae:	0141                	addi	sp,sp,16
ffffffffc02052b0:	7450306f          	j	ffffffffc02091f4 <sfs_init>

ffffffffc02052b4 <fs_cleanup>:
ffffffffc02052b4:	32f0206f          	j	ffffffffc0207de2 <vfs_cleanup>

ffffffffc02052b8 <lock_files>:
ffffffffc02052b8:	0561                	addi	a0,a0,24
ffffffffc02052ba:	b88ff06f          	j	ffffffffc0204642 <down>

ffffffffc02052be <unlock_files>:
ffffffffc02052be:	0561                	addi	a0,a0,24
ffffffffc02052c0:	b7eff06f          	j	ffffffffc020463e <up>

ffffffffc02052c4 <files_create>:
ffffffffc02052c4:	1141                	addi	sp,sp,-16
ffffffffc02052c6:	6505                	lui	a0,0x1
ffffffffc02052c8:	e022                	sd	s0,0(sp)
ffffffffc02052ca:	e406                	sd	ra,8(sp)
ffffffffc02052cc:	cf5fc0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc02052d0:	842a                	mv	s0,a0
ffffffffc02052d2:	cd19                	beqz	a0,ffffffffc02052f0 <files_create+0x2c>
ffffffffc02052d4:	03050793          	addi	a5,a0,48 # 1030 <_binary_bin_swap_img_size-0x6cd0>
ffffffffc02052d8:	e51c                	sd	a5,8(a0)
ffffffffc02052da:	00053023          	sd	zero,0(a0)
ffffffffc02052de:	00052823          	sw	zero,16(a0)
ffffffffc02052e2:	4585                	li	a1,1
ffffffffc02052e4:	0561                	addi	a0,a0,24
ffffffffc02052e6:	b52ff0ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc02052ea:	6408                	ld	a0,8(s0)
ffffffffc02052ec:	f1eff0ef          	jal	ffffffffc0204a0a <fd_array_init>
ffffffffc02052f0:	60a2                	ld	ra,8(sp)
ffffffffc02052f2:	8522                	mv	a0,s0
ffffffffc02052f4:	6402                	ld	s0,0(sp)
ffffffffc02052f6:	0141                	addi	sp,sp,16
ffffffffc02052f8:	8082                	ret

ffffffffc02052fa <files_destroy>:
ffffffffc02052fa:	7179                	addi	sp,sp,-48
ffffffffc02052fc:	f406                	sd	ra,40(sp)
ffffffffc02052fe:	f022                	sd	s0,32(sp)
ffffffffc0205300:	ec26                	sd	s1,24(sp)
ffffffffc0205302:	e84a                	sd	s2,16(sp)
ffffffffc0205304:	e44e                	sd	s3,8(sp)
ffffffffc0205306:	c52d                	beqz	a0,ffffffffc0205370 <files_destroy+0x76>
ffffffffc0205308:	491c                	lw	a5,16(a0)
ffffffffc020530a:	89aa                	mv	s3,a0
ffffffffc020530c:	e3b5                	bnez	a5,ffffffffc0205370 <files_destroy+0x76>
ffffffffc020530e:	6108                	ld	a0,0(a0)
ffffffffc0205310:	c119                	beqz	a0,ffffffffc0205316 <files_destroy+0x1c>
ffffffffc0205312:	704020ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc0205316:	0089b403          	ld	s0,8(s3)
ffffffffc020531a:	4909                	li	s2,2
ffffffffc020531c:	7ff40493          	addi	s1,s0,2047
ffffffffc0205320:	7c148493          	addi	s1,s1,1985
ffffffffc0205324:	401c                	lw	a5,0(s0)
ffffffffc0205326:	03278063          	beq	a5,s2,ffffffffc0205346 <files_destroy+0x4c>
ffffffffc020532a:	e39d                	bnez	a5,ffffffffc0205350 <files_destroy+0x56>
ffffffffc020532c:	03840413          	addi	s0,s0,56
ffffffffc0205330:	fe941ae3          	bne	s0,s1,ffffffffc0205324 <files_destroy+0x2a>
ffffffffc0205334:	7402                	ld	s0,32(sp)
ffffffffc0205336:	70a2                	ld	ra,40(sp)
ffffffffc0205338:	64e2                	ld	s1,24(sp)
ffffffffc020533a:	6942                	ld	s2,16(sp)
ffffffffc020533c:	854e                	mv	a0,s3
ffffffffc020533e:	69a2                	ld	s3,8(sp)
ffffffffc0205340:	6145                	addi	sp,sp,48
ffffffffc0205342:	d25fc06f          	j	ffffffffc0202066 <kfree>
ffffffffc0205346:	8522                	mv	a0,s0
ffffffffc0205348:	edeff0ef          	jal	ffffffffc0204a26 <fd_array_close>
ffffffffc020534c:	401c                	lw	a5,0(s0)
ffffffffc020534e:	bff1                	j	ffffffffc020532a <files_destroy+0x30>
ffffffffc0205350:	00008697          	auipc	a3,0x8
ffffffffc0205354:	19068693          	addi	a3,a3,400 # ffffffffc020d4e0 <etext+0x1dcc>
ffffffffc0205358:	00006617          	auipc	a2,0x6
ffffffffc020535c:	7f860613          	addi	a2,a2,2040 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0205360:	03d00593          	li	a1,61
ffffffffc0205364:	00008517          	auipc	a0,0x8
ffffffffc0205368:	16c50513          	addi	a0,a0,364 # ffffffffc020d4d0 <etext+0x1dbc>
ffffffffc020536c:	8defb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0205370:	00008697          	auipc	a3,0x8
ffffffffc0205374:	13068693          	addi	a3,a3,304 # ffffffffc020d4a0 <etext+0x1d8c>
ffffffffc0205378:	00006617          	auipc	a2,0x6
ffffffffc020537c:	7d860613          	addi	a2,a2,2008 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0205380:	03300593          	li	a1,51
ffffffffc0205384:	00008517          	auipc	a0,0x8
ffffffffc0205388:	14c50513          	addi	a0,a0,332 # ffffffffc020d4d0 <etext+0x1dbc>
ffffffffc020538c:	8befb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0205390 <files_closeall>:
ffffffffc0205390:	1101                	addi	sp,sp,-32
ffffffffc0205392:	ec06                	sd	ra,24(sp)
ffffffffc0205394:	e822                	sd	s0,16(sp)
ffffffffc0205396:	e426                	sd	s1,8(sp)
ffffffffc0205398:	e04a                	sd	s2,0(sp)
ffffffffc020539a:	c129                	beqz	a0,ffffffffc02053dc <files_closeall+0x4c>
ffffffffc020539c:	491c                	lw	a5,16(a0)
ffffffffc020539e:	02f05f63          	blez	a5,ffffffffc02053dc <files_closeall+0x4c>
ffffffffc02053a2:	6500                	ld	s0,8(a0)
ffffffffc02053a4:	4909                	li	s2,2
ffffffffc02053a6:	7ff40493          	addi	s1,s0,2047
ffffffffc02053aa:	7c148493          	addi	s1,s1,1985
ffffffffc02053ae:	07040413          	addi	s0,s0,112
ffffffffc02053b2:	a029                	j	ffffffffc02053bc <files_closeall+0x2c>
ffffffffc02053b4:	03840413          	addi	s0,s0,56
ffffffffc02053b8:	00940c63          	beq	s0,s1,ffffffffc02053d0 <files_closeall+0x40>
ffffffffc02053bc:	401c                	lw	a5,0(s0)
ffffffffc02053be:	ff279be3          	bne	a5,s2,ffffffffc02053b4 <files_closeall+0x24>
ffffffffc02053c2:	8522                	mv	a0,s0
ffffffffc02053c4:	03840413          	addi	s0,s0,56
ffffffffc02053c8:	e5eff0ef          	jal	ffffffffc0204a26 <fd_array_close>
ffffffffc02053cc:	fe9418e3          	bne	s0,s1,ffffffffc02053bc <files_closeall+0x2c>
ffffffffc02053d0:	60e2                	ld	ra,24(sp)
ffffffffc02053d2:	6442                	ld	s0,16(sp)
ffffffffc02053d4:	64a2                	ld	s1,8(sp)
ffffffffc02053d6:	6902                	ld	s2,0(sp)
ffffffffc02053d8:	6105                	addi	sp,sp,32
ffffffffc02053da:	8082                	ret
ffffffffc02053dc:	00008697          	auipc	a3,0x8
ffffffffc02053e0:	d3c68693          	addi	a3,a3,-708 # ffffffffc020d118 <etext+0x1a04>
ffffffffc02053e4:	00006617          	auipc	a2,0x6
ffffffffc02053e8:	76c60613          	addi	a2,a2,1900 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02053ec:	04500593          	li	a1,69
ffffffffc02053f0:	00008517          	auipc	a0,0x8
ffffffffc02053f4:	0e050513          	addi	a0,a0,224 # ffffffffc020d4d0 <etext+0x1dbc>
ffffffffc02053f8:	852fb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc02053fc <dup_files>:
ffffffffc02053fc:	7179                	addi	sp,sp,-48
ffffffffc02053fe:	f406                	sd	ra,40(sp)
ffffffffc0205400:	f022                	sd	s0,32(sp)
ffffffffc0205402:	ec26                	sd	s1,24(sp)
ffffffffc0205404:	e84a                	sd	s2,16(sp)
ffffffffc0205406:	e44e                	sd	s3,8(sp)
ffffffffc0205408:	e052                	sd	s4,0(sp)
ffffffffc020540a:	c52d                	beqz	a0,ffffffffc0205474 <dup_files+0x78>
ffffffffc020540c:	842e                	mv	s0,a1
ffffffffc020540e:	c1bd                	beqz	a1,ffffffffc0205474 <dup_files+0x78>
ffffffffc0205410:	491c                	lw	a5,16(a0)
ffffffffc0205412:	84aa                	mv	s1,a0
ffffffffc0205414:	e3c1                	bnez	a5,ffffffffc0205494 <dup_files+0x98>
ffffffffc0205416:	499c                	lw	a5,16(a1)
ffffffffc0205418:	06f05e63          	blez	a5,ffffffffc0205494 <dup_files+0x98>
ffffffffc020541c:	6188                	ld	a0,0(a1)
ffffffffc020541e:	e088                	sd	a0,0(s1)
ffffffffc0205420:	c119                	beqz	a0,ffffffffc0205426 <dup_files+0x2a>
ffffffffc0205422:	526020ef          	jal	ffffffffc0207948 <inode_ref_inc>
ffffffffc0205426:	6400                	ld	s0,8(s0)
ffffffffc0205428:	6484                	ld	s1,8(s1)
ffffffffc020542a:	4989                	li	s3,2
ffffffffc020542c:	7ff40913          	addi	s2,s0,2047
ffffffffc0205430:	7c190913          	addi	s2,s2,1985
ffffffffc0205434:	4a05                	li	s4,1
ffffffffc0205436:	a039                	j	ffffffffc0205444 <dup_files+0x48>
ffffffffc0205438:	03840413          	addi	s0,s0,56
ffffffffc020543c:	03848493          	addi	s1,s1,56
ffffffffc0205440:	03240163          	beq	s0,s2,ffffffffc0205462 <dup_files+0x66>
ffffffffc0205444:	401c                	lw	a5,0(s0)
ffffffffc0205446:	ff3799e3          	bne	a5,s3,ffffffffc0205438 <dup_files+0x3c>
ffffffffc020544a:	0144a023          	sw	s4,0(s1)
ffffffffc020544e:	85a2                	mv	a1,s0
ffffffffc0205450:	8526                	mv	a0,s1
ffffffffc0205452:	03840413          	addi	s0,s0,56
ffffffffc0205456:	e48ff0ef          	jal	ffffffffc0204a9e <fd_array_dup>
ffffffffc020545a:	03848493          	addi	s1,s1,56
ffffffffc020545e:	ff2413e3          	bne	s0,s2,ffffffffc0205444 <dup_files+0x48>
ffffffffc0205462:	70a2                	ld	ra,40(sp)
ffffffffc0205464:	7402                	ld	s0,32(sp)
ffffffffc0205466:	64e2                	ld	s1,24(sp)
ffffffffc0205468:	6942                	ld	s2,16(sp)
ffffffffc020546a:	69a2                	ld	s3,8(sp)
ffffffffc020546c:	6a02                	ld	s4,0(sp)
ffffffffc020546e:	4501                	li	a0,0
ffffffffc0205470:	6145                	addi	sp,sp,48
ffffffffc0205472:	8082                	ret
ffffffffc0205474:	00008697          	auipc	a3,0x8
ffffffffc0205478:	9f468693          	addi	a3,a3,-1548 # ffffffffc020ce68 <etext+0x1754>
ffffffffc020547c:	00006617          	auipc	a2,0x6
ffffffffc0205480:	6d460613          	addi	a2,a2,1748 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0205484:	05300593          	li	a1,83
ffffffffc0205488:	00008517          	auipc	a0,0x8
ffffffffc020548c:	04850513          	addi	a0,a0,72 # ffffffffc020d4d0 <etext+0x1dbc>
ffffffffc0205490:	fbbfa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0205494:	00008697          	auipc	a3,0x8
ffffffffc0205498:	06468693          	addi	a3,a3,100 # ffffffffc020d4f8 <etext+0x1de4>
ffffffffc020549c:	00006617          	auipc	a2,0x6
ffffffffc02054a0:	6b460613          	addi	a2,a2,1716 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02054a4:	05400593          	li	a1,84
ffffffffc02054a8:	00008517          	auipc	a0,0x8
ffffffffc02054ac:	02850513          	addi	a0,a0,40 # ffffffffc020d4d0 <etext+0x1dbc>
ffffffffc02054b0:	f9bfa0ef          	jal	ffffffffc020044a <__panic>

ffffffffc02054b4 <iobuf_skip.part.0>:
ffffffffc02054b4:	1141                	addi	sp,sp,-16
ffffffffc02054b6:	00008697          	auipc	a3,0x8
ffffffffc02054ba:	07268693          	addi	a3,a3,114 # ffffffffc020d528 <etext+0x1e14>
ffffffffc02054be:	00006617          	auipc	a2,0x6
ffffffffc02054c2:	69260613          	addi	a2,a2,1682 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02054c6:	04a00593          	li	a1,74
ffffffffc02054ca:	00008517          	auipc	a0,0x8
ffffffffc02054ce:	07650513          	addi	a0,a0,118 # ffffffffc020d540 <etext+0x1e2c>
ffffffffc02054d2:	e406                	sd	ra,8(sp)
ffffffffc02054d4:	f77fa0ef          	jal	ffffffffc020044a <__panic>

ffffffffc02054d8 <iobuf_init>:
ffffffffc02054d8:	e10c                	sd	a1,0(a0)
ffffffffc02054da:	e514                	sd	a3,8(a0)
ffffffffc02054dc:	ed10                	sd	a2,24(a0)
ffffffffc02054de:	e910                	sd	a2,16(a0)
ffffffffc02054e0:	8082                	ret

ffffffffc02054e2 <iobuf_move>:
ffffffffc02054e2:	6d1c                	ld	a5,24(a0)
ffffffffc02054e4:	88aa                	mv	a7,a0
ffffffffc02054e6:	8832                	mv	a6,a2
ffffffffc02054e8:	00f67363          	bgeu	a2,a5,ffffffffc02054ee <iobuf_move+0xc>
ffffffffc02054ec:	87b2                	mv	a5,a2
ffffffffc02054ee:	cfa1                	beqz	a5,ffffffffc0205546 <iobuf_move+0x64>
ffffffffc02054f0:	7179                	addi	sp,sp,-48
ffffffffc02054f2:	f406                	sd	ra,40(sp)
ffffffffc02054f4:	0008b503          	ld	a0,0(a7)
ffffffffc02054f8:	cea9                	beqz	a3,ffffffffc0205552 <iobuf_move+0x70>
ffffffffc02054fa:	863e                	mv	a2,a5
ffffffffc02054fc:	ec3a                	sd	a4,24(sp)
ffffffffc02054fe:	e846                	sd	a7,16(sp)
ffffffffc0205500:	e442                	sd	a6,8(sp)
ffffffffc0205502:	e03e                	sd	a5,0(sp)
ffffffffc0205504:	1ba060ef          	jal	ffffffffc020b6be <memmove>
ffffffffc0205508:	68c2                	ld	a7,16(sp)
ffffffffc020550a:	6782                	ld	a5,0(sp)
ffffffffc020550c:	6822                	ld	a6,8(sp)
ffffffffc020550e:	0188b683          	ld	a3,24(a7)
ffffffffc0205512:	6762                	ld	a4,24(sp)
ffffffffc0205514:	04f6e763          	bltu	a3,a5,ffffffffc0205562 <iobuf_move+0x80>
ffffffffc0205518:	0008b583          	ld	a1,0(a7)
ffffffffc020551c:	0088b603          	ld	a2,8(a7)
ffffffffc0205520:	8e9d                	sub	a3,a3,a5
ffffffffc0205522:	95be                	add	a1,a1,a5
ffffffffc0205524:	963e                	add	a2,a2,a5
ffffffffc0205526:	00d8bc23          	sd	a3,24(a7)
ffffffffc020552a:	00b8b023          	sd	a1,0(a7)
ffffffffc020552e:	00c8b423          	sd	a2,8(a7)
ffffffffc0205532:	40f80833          	sub	a6,a6,a5
ffffffffc0205536:	c311                	beqz	a4,ffffffffc020553a <iobuf_move+0x58>
ffffffffc0205538:	e31c                	sd	a5,0(a4)
ffffffffc020553a:	02081263          	bnez	a6,ffffffffc020555e <iobuf_move+0x7c>
ffffffffc020553e:	4501                	li	a0,0
ffffffffc0205540:	70a2                	ld	ra,40(sp)
ffffffffc0205542:	6145                	addi	sp,sp,48
ffffffffc0205544:	8082                	ret
ffffffffc0205546:	c311                	beqz	a4,ffffffffc020554a <iobuf_move+0x68>
ffffffffc0205548:	e31c                	sd	a5,0(a4)
ffffffffc020554a:	00081863          	bnez	a6,ffffffffc020555a <iobuf_move+0x78>
ffffffffc020554e:	4501                	li	a0,0
ffffffffc0205550:	8082                	ret
ffffffffc0205552:	86ae                	mv	a3,a1
ffffffffc0205554:	85aa                	mv	a1,a0
ffffffffc0205556:	8536                	mv	a0,a3
ffffffffc0205558:	b74d                	j	ffffffffc02054fa <iobuf_move+0x18>
ffffffffc020555a:	5571                	li	a0,-4
ffffffffc020555c:	8082                	ret
ffffffffc020555e:	5571                	li	a0,-4
ffffffffc0205560:	b7c5                	j	ffffffffc0205540 <iobuf_move+0x5e>
ffffffffc0205562:	f53ff0ef          	jal	ffffffffc02054b4 <iobuf_skip.part.0>

ffffffffc0205566 <iobuf_skip>:
ffffffffc0205566:	6d1c                	ld	a5,24(a0)
ffffffffc0205568:	00b7eb63          	bltu	a5,a1,ffffffffc020557e <iobuf_skip+0x18>
ffffffffc020556c:	6114                	ld	a3,0(a0)
ffffffffc020556e:	6518                	ld	a4,8(a0)
ffffffffc0205570:	8f8d                	sub	a5,a5,a1
ffffffffc0205572:	96ae                	add	a3,a3,a1
ffffffffc0205574:	972e                	add	a4,a4,a1
ffffffffc0205576:	ed1c                	sd	a5,24(a0)
ffffffffc0205578:	e114                	sd	a3,0(a0)
ffffffffc020557a:	e518                	sd	a4,8(a0)
ffffffffc020557c:	8082                	ret
ffffffffc020557e:	1141                	addi	sp,sp,-16
ffffffffc0205580:	e406                	sd	ra,8(sp)
ffffffffc0205582:	f33ff0ef          	jal	ffffffffc02054b4 <iobuf_skip.part.0>

ffffffffc0205586 <copy_path>:
ffffffffc0205586:	7139                	addi	sp,sp,-64
ffffffffc0205588:	f04a                	sd	s2,32(sp)
ffffffffc020558a:	00091917          	auipc	s2,0x91
ffffffffc020558e:	33e90913          	addi	s2,s2,830 # ffffffffc02968c8 <current>
ffffffffc0205592:	00093783          	ld	a5,0(s2)
ffffffffc0205596:	e852                	sd	s4,16(sp)
ffffffffc0205598:	8a2a                	mv	s4,a0
ffffffffc020559a:	6505                	lui	a0,0x1
ffffffffc020559c:	f426                	sd	s1,40(sp)
ffffffffc020559e:	ec4e                	sd	s3,24(sp)
ffffffffc02055a0:	fc06                	sd	ra,56(sp)
ffffffffc02055a2:	7784                	ld	s1,40(a5)
ffffffffc02055a4:	89ae                	mv	s3,a1
ffffffffc02055a6:	a1bfc0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc02055aa:	c92d                	beqz	a0,ffffffffc020561c <copy_path+0x96>
ffffffffc02055ac:	f822                	sd	s0,48(sp)
ffffffffc02055ae:	842a                	mv	s0,a0
ffffffffc02055b0:	c0b1                	beqz	s1,ffffffffc02055f4 <copy_path+0x6e>
ffffffffc02055b2:	03848513          	addi	a0,s1,56
ffffffffc02055b6:	88cff0ef          	jal	ffffffffc0204642 <down>
ffffffffc02055ba:	00093783          	ld	a5,0(s2)
ffffffffc02055be:	c399                	beqz	a5,ffffffffc02055c4 <copy_path+0x3e>
ffffffffc02055c0:	43dc                	lw	a5,4(a5)
ffffffffc02055c2:	c8bc                	sw	a5,80(s1)
ffffffffc02055c4:	864e                	mv	a2,s3
ffffffffc02055c6:	6685                	lui	a3,0x1
ffffffffc02055c8:	85a2                	mv	a1,s0
ffffffffc02055ca:	8526                	mv	a0,s1
ffffffffc02055cc:	ea9fe0ef          	jal	ffffffffc0204474 <copy_string>
ffffffffc02055d0:	cd1d                	beqz	a0,ffffffffc020560e <copy_path+0x88>
ffffffffc02055d2:	03848513          	addi	a0,s1,56
ffffffffc02055d6:	868ff0ef          	jal	ffffffffc020463e <up>
ffffffffc02055da:	0404a823          	sw	zero,80(s1)
ffffffffc02055de:	008a3023          	sd	s0,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc02055e2:	7442                	ld	s0,48(sp)
ffffffffc02055e4:	4501                	li	a0,0
ffffffffc02055e6:	70e2                	ld	ra,56(sp)
ffffffffc02055e8:	74a2                	ld	s1,40(sp)
ffffffffc02055ea:	7902                	ld	s2,32(sp)
ffffffffc02055ec:	69e2                	ld	s3,24(sp)
ffffffffc02055ee:	6a42                	ld	s4,16(sp)
ffffffffc02055f0:	6121                	addi	sp,sp,64
ffffffffc02055f2:	8082                	ret
ffffffffc02055f4:	85aa                	mv	a1,a0
ffffffffc02055f6:	864e                	mv	a2,s3
ffffffffc02055f8:	6685                	lui	a3,0x1
ffffffffc02055fa:	4501                	li	a0,0
ffffffffc02055fc:	e79fe0ef          	jal	ffffffffc0204474 <copy_string>
ffffffffc0205600:	fd79                	bnez	a0,ffffffffc02055de <copy_path+0x58>
ffffffffc0205602:	8522                	mv	a0,s0
ffffffffc0205604:	a63fc0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0205608:	5575                	li	a0,-3
ffffffffc020560a:	7442                	ld	s0,48(sp)
ffffffffc020560c:	bfe9                	j	ffffffffc02055e6 <copy_path+0x60>
ffffffffc020560e:	03848513          	addi	a0,s1,56
ffffffffc0205612:	82cff0ef          	jal	ffffffffc020463e <up>
ffffffffc0205616:	0404a823          	sw	zero,80(s1)
ffffffffc020561a:	b7e5                	j	ffffffffc0205602 <copy_path+0x7c>
ffffffffc020561c:	5571                	li	a0,-4
ffffffffc020561e:	b7e1                	j	ffffffffc02055e6 <copy_path+0x60>

ffffffffc0205620 <sysfile_open>:
ffffffffc0205620:	7179                	addi	sp,sp,-48
ffffffffc0205622:	f022                	sd	s0,32(sp)
ffffffffc0205624:	842e                	mv	s0,a1
ffffffffc0205626:	85aa                	mv	a1,a0
ffffffffc0205628:	0828                	addi	a0,sp,24
ffffffffc020562a:	f406                	sd	ra,40(sp)
ffffffffc020562c:	f5bff0ef          	jal	ffffffffc0205586 <copy_path>
ffffffffc0205630:	87aa                	mv	a5,a0
ffffffffc0205632:	ed09                	bnez	a0,ffffffffc020564c <sysfile_open+0x2c>
ffffffffc0205634:	6762                	ld	a4,24(sp)
ffffffffc0205636:	85a2                	mv	a1,s0
ffffffffc0205638:	853a                	mv	a0,a4
ffffffffc020563a:	e43a                	sd	a4,8(sp)
ffffffffc020563c:	d32ff0ef          	jal	ffffffffc0204b6e <file_open>
ffffffffc0205640:	6722                	ld	a4,8(sp)
ffffffffc0205642:	e42a                	sd	a0,8(sp)
ffffffffc0205644:	853a                	mv	a0,a4
ffffffffc0205646:	a21fc0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020564a:	67a2                	ld	a5,8(sp)
ffffffffc020564c:	70a2                	ld	ra,40(sp)
ffffffffc020564e:	7402                	ld	s0,32(sp)
ffffffffc0205650:	853e                	mv	a0,a5
ffffffffc0205652:	6145                	addi	sp,sp,48
ffffffffc0205654:	8082                	ret

ffffffffc0205656 <sysfile_close>:
ffffffffc0205656:	e32ff06f          	j	ffffffffc0204c88 <file_close>

ffffffffc020565a <sysfile_read>:
ffffffffc020565a:	7119                	addi	sp,sp,-128
ffffffffc020565c:	f466                	sd	s9,40(sp)
ffffffffc020565e:	fc86                	sd	ra,120(sp)
ffffffffc0205660:	4c81                	li	s9,0
ffffffffc0205662:	e611                	bnez	a2,ffffffffc020566e <sysfile_read+0x14>
ffffffffc0205664:	70e6                	ld	ra,120(sp)
ffffffffc0205666:	8566                	mv	a0,s9
ffffffffc0205668:	7ca2                	ld	s9,40(sp)
ffffffffc020566a:	6109                	addi	sp,sp,128
ffffffffc020566c:	8082                	ret
ffffffffc020566e:	f862                	sd	s8,48(sp)
ffffffffc0205670:	00091c17          	auipc	s8,0x91
ffffffffc0205674:	258c0c13          	addi	s8,s8,600 # ffffffffc02968c8 <current>
ffffffffc0205678:	000c3783          	ld	a5,0(s8)
ffffffffc020567c:	f8a2                	sd	s0,112(sp)
ffffffffc020567e:	f0ca                	sd	s2,96(sp)
ffffffffc0205680:	8432                	mv	s0,a2
ffffffffc0205682:	892e                	mv	s2,a1
ffffffffc0205684:	4601                	li	a2,0
ffffffffc0205686:	4585                	li	a1,1
ffffffffc0205688:	f4a6                	sd	s1,104(sp)
ffffffffc020568a:	e8d2                	sd	s4,80(sp)
ffffffffc020568c:	7784                	ld	s1,40(a5)
ffffffffc020568e:	8a2a                	mv	s4,a0
ffffffffc0205690:	c8aff0ef          	jal	ffffffffc0204b1a <file_testfd>
ffffffffc0205694:	c969                	beqz	a0,ffffffffc0205766 <sysfile_read+0x10c>
ffffffffc0205696:	6505                	lui	a0,0x1
ffffffffc0205698:	ecce                	sd	s3,88(sp)
ffffffffc020569a:	927fc0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc020569e:	89aa                	mv	s3,a0
ffffffffc02056a0:	c971                	beqz	a0,ffffffffc0205774 <sysfile_read+0x11a>
ffffffffc02056a2:	e4d6                	sd	s5,72(sp)
ffffffffc02056a4:	e0da                	sd	s6,64(sp)
ffffffffc02056a6:	6a85                	lui	s5,0x1
ffffffffc02056a8:	4b01                	li	s6,0
ffffffffc02056aa:	09546863          	bltu	s0,s5,ffffffffc020573a <sysfile_read+0xe0>
ffffffffc02056ae:	6785                	lui	a5,0x1
ffffffffc02056b0:	863e                	mv	a2,a5
ffffffffc02056b2:	0834                	addi	a3,sp,24
ffffffffc02056b4:	85ce                	mv	a1,s3
ffffffffc02056b6:	8552                	mv	a0,s4
ffffffffc02056b8:	ec3e                	sd	a5,24(sp)
ffffffffc02056ba:	e26ff0ef          	jal	ffffffffc0204ce0 <file_read>
ffffffffc02056be:	66e2                	ld	a3,24(sp)
ffffffffc02056c0:	8caa                	mv	s9,a0
ffffffffc02056c2:	e68d                	bnez	a3,ffffffffc02056ec <sysfile_read+0x92>
ffffffffc02056c4:	854e                	mv	a0,s3
ffffffffc02056c6:	9a1fc0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc02056ca:	000b0463          	beqz	s6,ffffffffc02056d2 <sysfile_read+0x78>
ffffffffc02056ce:	000b0c9b          	sext.w	s9,s6
ffffffffc02056d2:	7446                	ld	s0,112(sp)
ffffffffc02056d4:	70e6                	ld	ra,120(sp)
ffffffffc02056d6:	74a6                	ld	s1,104(sp)
ffffffffc02056d8:	7906                	ld	s2,96(sp)
ffffffffc02056da:	69e6                	ld	s3,88(sp)
ffffffffc02056dc:	6a46                	ld	s4,80(sp)
ffffffffc02056de:	6aa6                	ld	s5,72(sp)
ffffffffc02056e0:	6b06                	ld	s6,64(sp)
ffffffffc02056e2:	7c42                	ld	s8,48(sp)
ffffffffc02056e4:	8566                	mv	a0,s9
ffffffffc02056e6:	7ca2                	ld	s9,40(sp)
ffffffffc02056e8:	6109                	addi	sp,sp,128
ffffffffc02056ea:	8082                	ret
ffffffffc02056ec:	c899                	beqz	s1,ffffffffc0205702 <sysfile_read+0xa8>
ffffffffc02056ee:	03848513          	addi	a0,s1,56
ffffffffc02056f2:	f51fe0ef          	jal	ffffffffc0204642 <down>
ffffffffc02056f6:	000c3783          	ld	a5,0(s8)
ffffffffc02056fa:	66e2                	ld	a3,24(sp)
ffffffffc02056fc:	c399                	beqz	a5,ffffffffc0205702 <sysfile_read+0xa8>
ffffffffc02056fe:	43dc                	lw	a5,4(a5)
ffffffffc0205700:	c8bc                	sw	a5,80(s1)
ffffffffc0205702:	864e                	mv	a2,s3
ffffffffc0205704:	85ca                	mv	a1,s2
ffffffffc0205706:	8526                	mv	a0,s1
ffffffffc0205708:	d35fe0ef          	jal	ffffffffc020443c <copy_to_user>
ffffffffc020570c:	c915                	beqz	a0,ffffffffc0205740 <sysfile_read+0xe6>
ffffffffc020570e:	67e2                	ld	a5,24(sp)
ffffffffc0205710:	06f46a63          	bltu	s0,a5,ffffffffc0205784 <sysfile_read+0x12a>
ffffffffc0205714:	9b3e                	add	s6,s6,a5
ffffffffc0205716:	c889                	beqz	s1,ffffffffc0205728 <sysfile_read+0xce>
ffffffffc0205718:	03848513          	addi	a0,s1,56
ffffffffc020571c:	e43e                	sd	a5,8(sp)
ffffffffc020571e:	f21fe0ef          	jal	ffffffffc020463e <up>
ffffffffc0205722:	67a2                	ld	a5,8(sp)
ffffffffc0205724:	0404a823          	sw	zero,80(s1)
ffffffffc0205728:	f80c9ee3          	bnez	s9,ffffffffc02056c4 <sysfile_read+0x6a>
ffffffffc020572c:	6762                	ld	a4,24(sp)
ffffffffc020572e:	db59                	beqz	a4,ffffffffc02056c4 <sysfile_read+0x6a>
ffffffffc0205730:	8c1d                	sub	s0,s0,a5
ffffffffc0205732:	d849                	beqz	s0,ffffffffc02056c4 <sysfile_read+0x6a>
ffffffffc0205734:	993e                	add	s2,s2,a5
ffffffffc0205736:	f7547ce3          	bgeu	s0,s5,ffffffffc02056ae <sysfile_read+0x54>
ffffffffc020573a:	87a2                	mv	a5,s0
ffffffffc020573c:	8622                	mv	a2,s0
ffffffffc020573e:	bf95                	j	ffffffffc02056b2 <sysfile_read+0x58>
ffffffffc0205740:	000c8a63          	beqz	s9,ffffffffc0205754 <sysfile_read+0xfa>
ffffffffc0205744:	d0c1                	beqz	s1,ffffffffc02056c4 <sysfile_read+0x6a>
ffffffffc0205746:	03848513          	addi	a0,s1,56
ffffffffc020574a:	ef5fe0ef          	jal	ffffffffc020463e <up>
ffffffffc020574e:	0404a823          	sw	zero,80(s1)
ffffffffc0205752:	bf8d                	j	ffffffffc02056c4 <sysfile_read+0x6a>
ffffffffc0205754:	c499                	beqz	s1,ffffffffc0205762 <sysfile_read+0x108>
ffffffffc0205756:	03848513          	addi	a0,s1,56
ffffffffc020575a:	ee5fe0ef          	jal	ffffffffc020463e <up>
ffffffffc020575e:	0404a823          	sw	zero,80(s1)
ffffffffc0205762:	5cf5                	li	s9,-3
ffffffffc0205764:	b785                	j	ffffffffc02056c4 <sysfile_read+0x6a>
ffffffffc0205766:	7446                	ld	s0,112(sp)
ffffffffc0205768:	74a6                	ld	s1,104(sp)
ffffffffc020576a:	7906                	ld	s2,96(sp)
ffffffffc020576c:	6a46                	ld	s4,80(sp)
ffffffffc020576e:	7c42                	ld	s8,48(sp)
ffffffffc0205770:	5cf5                	li	s9,-3
ffffffffc0205772:	bdcd                	j	ffffffffc0205664 <sysfile_read+0xa>
ffffffffc0205774:	7446                	ld	s0,112(sp)
ffffffffc0205776:	74a6                	ld	s1,104(sp)
ffffffffc0205778:	7906                	ld	s2,96(sp)
ffffffffc020577a:	69e6                	ld	s3,88(sp)
ffffffffc020577c:	6a46                	ld	s4,80(sp)
ffffffffc020577e:	7c42                	ld	s8,48(sp)
ffffffffc0205780:	5cf1                	li	s9,-4
ffffffffc0205782:	b5cd                	j	ffffffffc0205664 <sysfile_read+0xa>
ffffffffc0205784:	00008697          	auipc	a3,0x8
ffffffffc0205788:	dcc68693          	addi	a3,a3,-564 # ffffffffc020d550 <etext+0x1e3c>
ffffffffc020578c:	00006617          	auipc	a2,0x6
ffffffffc0205790:	3c460613          	addi	a2,a2,964 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0205794:	05500593          	li	a1,85
ffffffffc0205798:	00008517          	auipc	a0,0x8
ffffffffc020579c:	dc850513          	addi	a0,a0,-568 # ffffffffc020d560 <etext+0x1e4c>
ffffffffc02057a0:	fc5e                	sd	s7,56(sp)
ffffffffc02057a2:	ca9fa0ef          	jal	ffffffffc020044a <__panic>

ffffffffc02057a6 <sysfile_write>:
ffffffffc02057a6:	e601                	bnez	a2,ffffffffc02057ae <sysfile_write+0x8>
ffffffffc02057a8:	4701                	li	a4,0
ffffffffc02057aa:	853a                	mv	a0,a4
ffffffffc02057ac:	8082                	ret
ffffffffc02057ae:	7159                	addi	sp,sp,-112
ffffffffc02057b0:	f062                	sd	s8,32(sp)
ffffffffc02057b2:	00091c17          	auipc	s8,0x91
ffffffffc02057b6:	116c0c13          	addi	s8,s8,278 # ffffffffc02968c8 <current>
ffffffffc02057ba:	000c3783          	ld	a5,0(s8)
ffffffffc02057be:	f0a2                	sd	s0,96(sp)
ffffffffc02057c0:	eca6                	sd	s1,88(sp)
ffffffffc02057c2:	8432                	mv	s0,a2
ffffffffc02057c4:	84ae                	mv	s1,a1
ffffffffc02057c6:	4605                	li	a2,1
ffffffffc02057c8:	4581                	li	a1,0
ffffffffc02057ca:	e8ca                	sd	s2,80(sp)
ffffffffc02057cc:	e0d2                	sd	s4,64(sp)
ffffffffc02057ce:	f486                	sd	ra,104(sp)
ffffffffc02057d0:	0287b903          	ld	s2,40(a5) # 1028 <_binary_bin_swap_img_size-0x6cd8>
ffffffffc02057d4:	8a2a                	mv	s4,a0
ffffffffc02057d6:	b44ff0ef          	jal	ffffffffc0204b1a <file_testfd>
ffffffffc02057da:	c969                	beqz	a0,ffffffffc02058ac <sysfile_write+0x106>
ffffffffc02057dc:	6505                	lui	a0,0x1
ffffffffc02057de:	e4ce                	sd	s3,72(sp)
ffffffffc02057e0:	fe0fc0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc02057e4:	89aa                	mv	s3,a0
ffffffffc02057e6:	c569                	beqz	a0,ffffffffc02058b0 <sysfile_write+0x10a>
ffffffffc02057e8:	fc56                	sd	s5,56(sp)
ffffffffc02057ea:	f45e                	sd	s7,40(sp)
ffffffffc02057ec:	4a81                	li	s5,0
ffffffffc02057ee:	6b85                	lui	s7,0x1
ffffffffc02057f0:	86a2                	mv	a3,s0
ffffffffc02057f2:	008bf363          	bgeu	s7,s0,ffffffffc02057f8 <sysfile_write+0x52>
ffffffffc02057f6:	6685                	lui	a3,0x1
ffffffffc02057f8:	ec36                	sd	a3,24(sp)
ffffffffc02057fa:	04090e63          	beqz	s2,ffffffffc0205856 <sysfile_write+0xb0>
ffffffffc02057fe:	03890513          	addi	a0,s2,56
ffffffffc0205802:	e41fe0ef          	jal	ffffffffc0204642 <down>
ffffffffc0205806:	000c3783          	ld	a5,0(s8)
ffffffffc020580a:	c781                	beqz	a5,ffffffffc0205812 <sysfile_write+0x6c>
ffffffffc020580c:	43dc                	lw	a5,4(a5)
ffffffffc020580e:	04f92823          	sw	a5,80(s2)
ffffffffc0205812:	66e2                	ld	a3,24(sp)
ffffffffc0205814:	4701                	li	a4,0
ffffffffc0205816:	8626                	mv	a2,s1
ffffffffc0205818:	85ce                	mv	a1,s3
ffffffffc020581a:	854a                	mv	a0,s2
ffffffffc020581c:	bebfe0ef          	jal	ffffffffc0204406 <copy_from_user>
ffffffffc0205820:	ed3d                	bnez	a0,ffffffffc020589e <sysfile_write+0xf8>
ffffffffc0205822:	03890513          	addi	a0,s2,56
ffffffffc0205826:	e19fe0ef          	jal	ffffffffc020463e <up>
ffffffffc020582a:	04092823          	sw	zero,80(s2)
ffffffffc020582e:	5775                	li	a4,-3
ffffffffc0205830:	854e                	mv	a0,s3
ffffffffc0205832:	e43a                	sd	a4,8(sp)
ffffffffc0205834:	833fc0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0205838:	6722                	ld	a4,8(sp)
ffffffffc020583a:	040a9c63          	bnez	s5,ffffffffc0205892 <sysfile_write+0xec>
ffffffffc020583e:	69a6                	ld	s3,72(sp)
ffffffffc0205840:	7ae2                	ld	s5,56(sp)
ffffffffc0205842:	7ba2                	ld	s7,40(sp)
ffffffffc0205844:	70a6                	ld	ra,104(sp)
ffffffffc0205846:	7406                	ld	s0,96(sp)
ffffffffc0205848:	64e6                	ld	s1,88(sp)
ffffffffc020584a:	6946                	ld	s2,80(sp)
ffffffffc020584c:	6a06                	ld	s4,64(sp)
ffffffffc020584e:	7c02                	ld	s8,32(sp)
ffffffffc0205850:	853a                	mv	a0,a4
ffffffffc0205852:	6165                	addi	sp,sp,112
ffffffffc0205854:	8082                	ret
ffffffffc0205856:	4701                	li	a4,0
ffffffffc0205858:	8626                	mv	a2,s1
ffffffffc020585a:	85ce                	mv	a1,s3
ffffffffc020585c:	4501                	li	a0,0
ffffffffc020585e:	ba9fe0ef          	jal	ffffffffc0204406 <copy_from_user>
ffffffffc0205862:	d571                	beqz	a0,ffffffffc020582e <sysfile_write+0x88>
ffffffffc0205864:	6662                	ld	a2,24(sp)
ffffffffc0205866:	0834                	addi	a3,sp,24
ffffffffc0205868:	85ce                	mv	a1,s3
ffffffffc020586a:	8552                	mv	a0,s4
ffffffffc020586c:	d62ff0ef          	jal	ffffffffc0204dce <file_write>
ffffffffc0205870:	67e2                	ld	a5,24(sp)
ffffffffc0205872:	872a                	mv	a4,a0
ffffffffc0205874:	dfd5                	beqz	a5,ffffffffc0205830 <sysfile_write+0x8a>
ffffffffc0205876:	04f46063          	bltu	s0,a5,ffffffffc02058b6 <sysfile_write+0x110>
ffffffffc020587a:	9abe                	add	s5,s5,a5
ffffffffc020587c:	f955                	bnez	a0,ffffffffc0205830 <sysfile_write+0x8a>
ffffffffc020587e:	8c1d                	sub	s0,s0,a5
ffffffffc0205880:	94be                	add	s1,s1,a5
ffffffffc0205882:	f43d                	bnez	s0,ffffffffc02057f0 <sysfile_write+0x4a>
ffffffffc0205884:	854e                	mv	a0,s3
ffffffffc0205886:	e43a                	sd	a4,8(sp)
ffffffffc0205888:	fdefc0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020588c:	6722                	ld	a4,8(sp)
ffffffffc020588e:	fa0a88e3          	beqz	s5,ffffffffc020583e <sysfile_write+0x98>
ffffffffc0205892:	000a871b          	sext.w	a4,s5
ffffffffc0205896:	69a6                	ld	s3,72(sp)
ffffffffc0205898:	7ae2                	ld	s5,56(sp)
ffffffffc020589a:	7ba2                	ld	s7,40(sp)
ffffffffc020589c:	b765                	j	ffffffffc0205844 <sysfile_write+0x9e>
ffffffffc020589e:	03890513          	addi	a0,s2,56
ffffffffc02058a2:	d9dfe0ef          	jal	ffffffffc020463e <up>
ffffffffc02058a6:	04092823          	sw	zero,80(s2)
ffffffffc02058aa:	bf6d                	j	ffffffffc0205864 <sysfile_write+0xbe>
ffffffffc02058ac:	5775                	li	a4,-3
ffffffffc02058ae:	bf59                	j	ffffffffc0205844 <sysfile_write+0x9e>
ffffffffc02058b0:	69a6                	ld	s3,72(sp)
ffffffffc02058b2:	5771                	li	a4,-4
ffffffffc02058b4:	bf41                	j	ffffffffc0205844 <sysfile_write+0x9e>
ffffffffc02058b6:	00008697          	auipc	a3,0x8
ffffffffc02058ba:	c9a68693          	addi	a3,a3,-870 # ffffffffc020d550 <etext+0x1e3c>
ffffffffc02058be:	00006617          	auipc	a2,0x6
ffffffffc02058c2:	29260613          	addi	a2,a2,658 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02058c6:	08a00593          	li	a1,138
ffffffffc02058ca:	00008517          	auipc	a0,0x8
ffffffffc02058ce:	c9650513          	addi	a0,a0,-874 # ffffffffc020d560 <etext+0x1e4c>
ffffffffc02058d2:	f85a                	sd	s6,48(sp)
ffffffffc02058d4:	b77fa0ef          	jal	ffffffffc020044a <__panic>

ffffffffc02058d8 <sysfile_seek>:
ffffffffc02058d8:	de4ff06f          	j	ffffffffc0204ebc <file_seek>

ffffffffc02058dc <sysfile_fstat>:
ffffffffc02058dc:	715d                	addi	sp,sp,-80
ffffffffc02058de:	f84a                	sd	s2,48(sp)
ffffffffc02058e0:	00091917          	auipc	s2,0x91
ffffffffc02058e4:	fe890913          	addi	s2,s2,-24 # ffffffffc02968c8 <current>
ffffffffc02058e8:	00093783          	ld	a5,0(s2)
ffffffffc02058ec:	f44e                	sd	s3,40(sp)
ffffffffc02058ee:	89ae                	mv	s3,a1
ffffffffc02058f0:	858a                	mv	a1,sp
ffffffffc02058f2:	e0a2                	sd	s0,64(sp)
ffffffffc02058f4:	fc26                	sd	s1,56(sp)
ffffffffc02058f6:	e486                	sd	ra,72(sp)
ffffffffc02058f8:	7784                	ld	s1,40(a5)
ffffffffc02058fa:	ee6ff0ef          	jal	ffffffffc0204fe0 <file_fstat>
ffffffffc02058fe:	842a                	mv	s0,a0
ffffffffc0205900:	e915                	bnez	a0,ffffffffc0205934 <sysfile_fstat+0x58>
ffffffffc0205902:	c0a9                	beqz	s1,ffffffffc0205944 <sysfile_fstat+0x68>
ffffffffc0205904:	03848513          	addi	a0,s1,56
ffffffffc0205908:	d3bfe0ef          	jal	ffffffffc0204642 <down>
ffffffffc020590c:	00093783          	ld	a5,0(s2)
ffffffffc0205910:	c399                	beqz	a5,ffffffffc0205916 <sysfile_fstat+0x3a>
ffffffffc0205912:	43dc                	lw	a5,4(a5)
ffffffffc0205914:	c8bc                	sw	a5,80(s1)
ffffffffc0205916:	860a                	mv	a2,sp
ffffffffc0205918:	85ce                	mv	a1,s3
ffffffffc020591a:	02000693          	li	a3,32
ffffffffc020591e:	8526                	mv	a0,s1
ffffffffc0205920:	b1dfe0ef          	jal	ffffffffc020443c <copy_to_user>
ffffffffc0205924:	e111                	bnez	a0,ffffffffc0205928 <sysfile_fstat+0x4c>
ffffffffc0205926:	5475                	li	s0,-3
ffffffffc0205928:	03848513          	addi	a0,s1,56
ffffffffc020592c:	d13fe0ef          	jal	ffffffffc020463e <up>
ffffffffc0205930:	0404a823          	sw	zero,80(s1)
ffffffffc0205934:	60a6                	ld	ra,72(sp)
ffffffffc0205936:	8522                	mv	a0,s0
ffffffffc0205938:	6406                	ld	s0,64(sp)
ffffffffc020593a:	74e2                	ld	s1,56(sp)
ffffffffc020593c:	7942                	ld	s2,48(sp)
ffffffffc020593e:	79a2                	ld	s3,40(sp)
ffffffffc0205940:	6161                	addi	sp,sp,80
ffffffffc0205942:	8082                	ret
ffffffffc0205944:	860a                	mv	a2,sp
ffffffffc0205946:	85ce                	mv	a1,s3
ffffffffc0205948:	02000693          	li	a3,32
ffffffffc020594c:	af1fe0ef          	jal	ffffffffc020443c <copy_to_user>
ffffffffc0205950:	f175                	bnez	a0,ffffffffc0205934 <sysfile_fstat+0x58>
ffffffffc0205952:	5475                	li	s0,-3
ffffffffc0205954:	60a6                	ld	ra,72(sp)
ffffffffc0205956:	8522                	mv	a0,s0
ffffffffc0205958:	6406                	ld	s0,64(sp)
ffffffffc020595a:	74e2                	ld	s1,56(sp)
ffffffffc020595c:	7942                	ld	s2,48(sp)
ffffffffc020595e:	79a2                	ld	s3,40(sp)
ffffffffc0205960:	6161                	addi	sp,sp,80
ffffffffc0205962:	8082                	ret

ffffffffc0205964 <sysfile_fsync>:
ffffffffc0205964:	f34ff06f          	j	ffffffffc0205098 <file_fsync>

ffffffffc0205968 <sysfile_getcwd>:
ffffffffc0205968:	c1d5                	beqz	a1,ffffffffc0205a0c <sysfile_getcwd+0xa4>
ffffffffc020596a:	00091717          	auipc	a4,0x91
ffffffffc020596e:	f5e73703          	ld	a4,-162(a4) # ffffffffc02968c8 <current>
ffffffffc0205972:	711d                	addi	sp,sp,-96
ffffffffc0205974:	e8a2                	sd	s0,80(sp)
ffffffffc0205976:	7700                	ld	s0,40(a4)
ffffffffc0205978:	e4a6                	sd	s1,72(sp)
ffffffffc020597a:	e0ca                	sd	s2,64(sp)
ffffffffc020597c:	ec86                	sd	ra,88(sp)
ffffffffc020597e:	892a                	mv	s2,a0
ffffffffc0205980:	84ae                	mv	s1,a1
ffffffffc0205982:	c039                	beqz	s0,ffffffffc02059c8 <sysfile_getcwd+0x60>
ffffffffc0205984:	03840513          	addi	a0,s0,56
ffffffffc0205988:	cbbfe0ef          	jal	ffffffffc0204642 <down>
ffffffffc020598c:	00091797          	auipc	a5,0x91
ffffffffc0205990:	f3c7b783          	ld	a5,-196(a5) # ffffffffc02968c8 <current>
ffffffffc0205994:	c399                	beqz	a5,ffffffffc020599a <sysfile_getcwd+0x32>
ffffffffc0205996:	43dc                	lw	a5,4(a5)
ffffffffc0205998:	c83c                	sw	a5,80(s0)
ffffffffc020599a:	4685                	li	a3,1
ffffffffc020599c:	8626                	mv	a2,s1
ffffffffc020599e:	85ca                	mv	a1,s2
ffffffffc02059a0:	8522                	mv	a0,s0
ffffffffc02059a2:	9c1fe0ef          	jal	ffffffffc0204362 <user_mem_check>
ffffffffc02059a6:	57f5                	li	a5,-3
ffffffffc02059a8:	e921                	bnez	a0,ffffffffc02059f8 <sysfile_getcwd+0x90>
ffffffffc02059aa:	03840513          	addi	a0,s0,56
ffffffffc02059ae:	e43e                	sd	a5,8(sp)
ffffffffc02059b0:	c8ffe0ef          	jal	ffffffffc020463e <up>
ffffffffc02059b4:	67a2                	ld	a5,8(sp)
ffffffffc02059b6:	04042823          	sw	zero,80(s0)
ffffffffc02059ba:	60e6                	ld	ra,88(sp)
ffffffffc02059bc:	6446                	ld	s0,80(sp)
ffffffffc02059be:	64a6                	ld	s1,72(sp)
ffffffffc02059c0:	6906                	ld	s2,64(sp)
ffffffffc02059c2:	853e                	mv	a0,a5
ffffffffc02059c4:	6125                	addi	sp,sp,96
ffffffffc02059c6:	8082                	ret
ffffffffc02059c8:	862e                	mv	a2,a1
ffffffffc02059ca:	4685                	li	a3,1
ffffffffc02059cc:	85aa                	mv	a1,a0
ffffffffc02059ce:	4501                	li	a0,0
ffffffffc02059d0:	993fe0ef          	jal	ffffffffc0204362 <user_mem_check>
ffffffffc02059d4:	57f5                	li	a5,-3
ffffffffc02059d6:	d175                	beqz	a0,ffffffffc02059ba <sysfile_getcwd+0x52>
ffffffffc02059d8:	8626                	mv	a2,s1
ffffffffc02059da:	85ca                	mv	a1,s2
ffffffffc02059dc:	4681                	li	a3,0
ffffffffc02059de:	0808                	addi	a0,sp,16
ffffffffc02059e0:	af9ff0ef          	jal	ffffffffc02054d8 <iobuf_init>
ffffffffc02059e4:	34b020ef          	jal	ffffffffc020852e <vfs_getcwd>
ffffffffc02059e8:	60e6                	ld	ra,88(sp)
ffffffffc02059ea:	6446                	ld	s0,80(sp)
ffffffffc02059ec:	87aa                	mv	a5,a0
ffffffffc02059ee:	64a6                	ld	s1,72(sp)
ffffffffc02059f0:	6906                	ld	s2,64(sp)
ffffffffc02059f2:	853e                	mv	a0,a5
ffffffffc02059f4:	6125                	addi	sp,sp,96
ffffffffc02059f6:	8082                	ret
ffffffffc02059f8:	8626                	mv	a2,s1
ffffffffc02059fa:	85ca                	mv	a1,s2
ffffffffc02059fc:	4681                	li	a3,0
ffffffffc02059fe:	0808                	addi	a0,sp,16
ffffffffc0205a00:	ad9ff0ef          	jal	ffffffffc02054d8 <iobuf_init>
ffffffffc0205a04:	32b020ef          	jal	ffffffffc020852e <vfs_getcwd>
ffffffffc0205a08:	87aa                	mv	a5,a0
ffffffffc0205a0a:	b745                	j	ffffffffc02059aa <sysfile_getcwd+0x42>
ffffffffc0205a0c:	57f5                	li	a5,-3
ffffffffc0205a0e:	853e                	mv	a0,a5
ffffffffc0205a10:	8082                	ret

ffffffffc0205a12 <sysfile_getdirentry>:
ffffffffc0205a12:	7139                	addi	sp,sp,-64
ffffffffc0205a14:	ec4e                	sd	s3,24(sp)
ffffffffc0205a16:	00091997          	auipc	s3,0x91
ffffffffc0205a1a:	eb298993          	addi	s3,s3,-334 # ffffffffc02968c8 <current>
ffffffffc0205a1e:	0009b783          	ld	a5,0(s3)
ffffffffc0205a22:	f04a                	sd	s2,32(sp)
ffffffffc0205a24:	892a                	mv	s2,a0
ffffffffc0205a26:	10800513          	li	a0,264
ffffffffc0205a2a:	f426                	sd	s1,40(sp)
ffffffffc0205a2c:	e852                	sd	s4,16(sp)
ffffffffc0205a2e:	fc06                	sd	ra,56(sp)
ffffffffc0205a30:	7784                	ld	s1,40(a5)
ffffffffc0205a32:	8a2e                	mv	s4,a1
ffffffffc0205a34:	d8cfc0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0205a38:	c179                	beqz	a0,ffffffffc0205afe <sysfile_getdirentry+0xec>
ffffffffc0205a3a:	f822                	sd	s0,48(sp)
ffffffffc0205a3c:	842a                	mv	s0,a0
ffffffffc0205a3e:	c8d1                	beqz	s1,ffffffffc0205ad2 <sysfile_getdirentry+0xc0>
ffffffffc0205a40:	03848513          	addi	a0,s1,56
ffffffffc0205a44:	bfffe0ef          	jal	ffffffffc0204642 <down>
ffffffffc0205a48:	0009b783          	ld	a5,0(s3)
ffffffffc0205a4c:	c399                	beqz	a5,ffffffffc0205a52 <sysfile_getdirentry+0x40>
ffffffffc0205a4e:	43dc                	lw	a5,4(a5)
ffffffffc0205a50:	c8bc                	sw	a5,80(s1)
ffffffffc0205a52:	4705                	li	a4,1
ffffffffc0205a54:	46a1                	li	a3,8
ffffffffc0205a56:	8652                	mv	a2,s4
ffffffffc0205a58:	85a2                	mv	a1,s0
ffffffffc0205a5a:	8526                	mv	a0,s1
ffffffffc0205a5c:	9abfe0ef          	jal	ffffffffc0204406 <copy_from_user>
ffffffffc0205a60:	e505                	bnez	a0,ffffffffc0205a88 <sysfile_getdirentry+0x76>
ffffffffc0205a62:	03848513          	addi	a0,s1,56
ffffffffc0205a66:	bd9fe0ef          	jal	ffffffffc020463e <up>
ffffffffc0205a6a:	0404a823          	sw	zero,80(s1)
ffffffffc0205a6e:	5975                	li	s2,-3
ffffffffc0205a70:	8522                	mv	a0,s0
ffffffffc0205a72:	df4fc0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0205a76:	7442                	ld	s0,48(sp)
ffffffffc0205a78:	70e2                	ld	ra,56(sp)
ffffffffc0205a7a:	74a2                	ld	s1,40(sp)
ffffffffc0205a7c:	69e2                	ld	s3,24(sp)
ffffffffc0205a7e:	6a42                	ld	s4,16(sp)
ffffffffc0205a80:	854a                	mv	a0,s2
ffffffffc0205a82:	7902                	ld	s2,32(sp)
ffffffffc0205a84:	6121                	addi	sp,sp,64
ffffffffc0205a86:	8082                	ret
ffffffffc0205a88:	03848513          	addi	a0,s1,56
ffffffffc0205a8c:	bb3fe0ef          	jal	ffffffffc020463e <up>
ffffffffc0205a90:	854a                	mv	a0,s2
ffffffffc0205a92:	0404a823          	sw	zero,80(s1)
ffffffffc0205a96:	85a2                	mv	a1,s0
ffffffffc0205a98:	eaaff0ef          	jal	ffffffffc0205142 <file_getdirentry>
ffffffffc0205a9c:	892a                	mv	s2,a0
ffffffffc0205a9e:	f969                	bnez	a0,ffffffffc0205a70 <sysfile_getdirentry+0x5e>
ffffffffc0205aa0:	03848513          	addi	a0,s1,56
ffffffffc0205aa4:	b9ffe0ef          	jal	ffffffffc0204642 <down>
ffffffffc0205aa8:	0009b783          	ld	a5,0(s3)
ffffffffc0205aac:	c399                	beqz	a5,ffffffffc0205ab2 <sysfile_getdirentry+0xa0>
ffffffffc0205aae:	43dc                	lw	a5,4(a5)
ffffffffc0205ab0:	c8bc                	sw	a5,80(s1)
ffffffffc0205ab2:	85d2                	mv	a1,s4
ffffffffc0205ab4:	10800693          	li	a3,264
ffffffffc0205ab8:	8622                	mv	a2,s0
ffffffffc0205aba:	8526                	mv	a0,s1
ffffffffc0205abc:	981fe0ef          	jal	ffffffffc020443c <copy_to_user>
ffffffffc0205ac0:	e111                	bnez	a0,ffffffffc0205ac4 <sysfile_getdirentry+0xb2>
ffffffffc0205ac2:	5975                	li	s2,-3
ffffffffc0205ac4:	03848513          	addi	a0,s1,56
ffffffffc0205ac8:	b77fe0ef          	jal	ffffffffc020463e <up>
ffffffffc0205acc:	0404a823          	sw	zero,80(s1)
ffffffffc0205ad0:	b745                	j	ffffffffc0205a70 <sysfile_getdirentry+0x5e>
ffffffffc0205ad2:	85aa                	mv	a1,a0
ffffffffc0205ad4:	4705                	li	a4,1
ffffffffc0205ad6:	46a1                	li	a3,8
ffffffffc0205ad8:	8652                	mv	a2,s4
ffffffffc0205ada:	4501                	li	a0,0
ffffffffc0205adc:	92bfe0ef          	jal	ffffffffc0204406 <copy_from_user>
ffffffffc0205ae0:	d559                	beqz	a0,ffffffffc0205a6e <sysfile_getdirentry+0x5c>
ffffffffc0205ae2:	854a                	mv	a0,s2
ffffffffc0205ae4:	85a2                	mv	a1,s0
ffffffffc0205ae6:	e5cff0ef          	jal	ffffffffc0205142 <file_getdirentry>
ffffffffc0205aea:	892a                	mv	s2,a0
ffffffffc0205aec:	f151                	bnez	a0,ffffffffc0205a70 <sysfile_getdirentry+0x5e>
ffffffffc0205aee:	85d2                	mv	a1,s4
ffffffffc0205af0:	10800693          	li	a3,264
ffffffffc0205af4:	8622                	mv	a2,s0
ffffffffc0205af6:	947fe0ef          	jal	ffffffffc020443c <copy_to_user>
ffffffffc0205afa:	f93d                	bnez	a0,ffffffffc0205a70 <sysfile_getdirentry+0x5e>
ffffffffc0205afc:	bf8d                	j	ffffffffc0205a6e <sysfile_getdirentry+0x5c>
ffffffffc0205afe:	5971                	li	s2,-4
ffffffffc0205b00:	bfa5                	j	ffffffffc0205a78 <sysfile_getdirentry+0x66>

ffffffffc0205b02 <sysfile_dup>:
ffffffffc0205b02:	f2eff06f          	j	ffffffffc0205230 <file_dup>

ffffffffc0205b06 <kernel_thread_entry>:
ffffffffc0205b06:	8526                	mv	a0,s1
ffffffffc0205b08:	9402                	jalr	s0
ffffffffc0205b0a:	676000ef          	jal	ffffffffc0206180 <do_exit>

ffffffffc0205b0e <alloc_proc>:
ffffffffc0205b0e:	1141                	addi	sp,sp,-16
ffffffffc0205b10:	15000513          	li	a0,336
ffffffffc0205b14:	e022                	sd	s0,0(sp)
ffffffffc0205b16:	e406                	sd	ra,8(sp)
ffffffffc0205b18:	ca8fc0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0205b1c:	842a                	mv	s0,a0
ffffffffc0205b1e:	c141                	beqz	a0,ffffffffc0205b9e <alloc_proc+0x90>
ffffffffc0205b20:	57fd                	li	a5,-1
ffffffffc0205b22:	1782                	slli	a5,a5,0x20
ffffffffc0205b24:	e11c                	sd	a5,0(a0)
ffffffffc0205b26:	00052423          	sw	zero,8(a0)
ffffffffc0205b2a:	00053823          	sd	zero,16(a0)
ffffffffc0205b2e:	00053c23          	sd	zero,24(a0)
ffffffffc0205b32:	02053023          	sd	zero,32(a0)
ffffffffc0205b36:	02053423          	sd	zero,40(a0)
ffffffffc0205b3a:	07000613          	li	a2,112
ffffffffc0205b3e:	4581                	li	a1,0
ffffffffc0205b40:	03050513          	addi	a0,a0,48
ffffffffc0205b44:	369050ef          	jal	ffffffffc020b6ac <memset>
ffffffffc0205b48:	00091797          	auipc	a5,0x91
ffffffffc0205b4c:	d507b783          	ld	a5,-688(a5) # ffffffffc0296898 <boot_pgdir_pa>
ffffffffc0205b50:	0a043023          	sd	zero,160(s0)
ffffffffc0205b54:	0a042823          	sw	zero,176(s0)
ffffffffc0205b58:	f45c                	sd	a5,168(s0)
ffffffffc0205b5a:	0b440513          	addi	a0,s0,180
ffffffffc0205b5e:	463d                	li	a2,15
ffffffffc0205b60:	4581                	li	a1,0
ffffffffc0205b62:	34b050ef          	jal	ffffffffc020b6ac <memset>
ffffffffc0205b66:	11040793          	addi	a5,s0,272
ffffffffc0205b6a:	0e042623          	sw	zero,236(s0)
ffffffffc0205b6e:	0e043c23          	sd	zero,248(s0)
ffffffffc0205b72:	10043023          	sd	zero,256(s0)
ffffffffc0205b76:	0e043823          	sd	zero,240(s0)
ffffffffc0205b7a:	10043423          	sd	zero,264(s0)
ffffffffc0205b7e:	12042023          	sw	zero,288(s0)
ffffffffc0205b82:	12043423          	sd	zero,296(s0)
ffffffffc0205b86:	12043c23          	sd	zero,312(s0)
ffffffffc0205b8a:	12043823          	sd	zero,304(s0)
ffffffffc0205b8e:	14043023          	sd	zero,320(s0)
ffffffffc0205b92:	14043423          	sd	zero,328(s0)
ffffffffc0205b96:	10f43c23          	sd	a5,280(s0)
ffffffffc0205b9a:	10f43823          	sd	a5,272(s0)
ffffffffc0205b9e:	60a2                	ld	ra,8(sp)
ffffffffc0205ba0:	8522                	mv	a0,s0
ffffffffc0205ba2:	6402                	ld	s0,0(sp)
ffffffffc0205ba4:	0141                	addi	sp,sp,16
ffffffffc0205ba6:	8082                	ret

ffffffffc0205ba8 <forkret>:
ffffffffc0205ba8:	00091797          	auipc	a5,0x91
ffffffffc0205bac:	d207b783          	ld	a5,-736(a5) # ffffffffc02968c8 <current>
ffffffffc0205bb0:	73c8                	ld	a0,160(a5)
ffffffffc0205bb2:	e9cfb06f          	j	ffffffffc020124e <forkrets>

ffffffffc0205bb6 <put_pgdir.isra.0>:
ffffffffc0205bb6:	1141                	addi	sp,sp,-16
ffffffffc0205bb8:	e406                	sd	ra,8(sp)
ffffffffc0205bba:	c02007b7          	lui	a5,0xc0200
ffffffffc0205bbe:	02f56f63          	bltu	a0,a5,ffffffffc0205bfc <put_pgdir.isra.0+0x46>
ffffffffc0205bc2:	00091797          	auipc	a5,0x91
ffffffffc0205bc6:	ce67b783          	ld	a5,-794(a5) # ffffffffc02968a8 <va_pa_offset>
ffffffffc0205bca:	00091717          	auipc	a4,0x91
ffffffffc0205bce:	ce673703          	ld	a4,-794(a4) # ffffffffc02968b0 <npage>
ffffffffc0205bd2:	8d1d                	sub	a0,a0,a5
ffffffffc0205bd4:	00c55793          	srli	a5,a0,0xc
ffffffffc0205bd8:	02e7ff63          	bgeu	a5,a4,ffffffffc0205c16 <put_pgdir.isra.0+0x60>
ffffffffc0205bdc:	0000a717          	auipc	a4,0xa
ffffffffc0205be0:	cf473703          	ld	a4,-780(a4) # ffffffffc020f8d0 <nbase>
ffffffffc0205be4:	00091517          	auipc	a0,0x91
ffffffffc0205be8:	cd453503          	ld	a0,-812(a0) # ffffffffc02968b8 <pages>
ffffffffc0205bec:	60a2                	ld	ra,8(sp)
ffffffffc0205bee:	8f99                	sub	a5,a5,a4
ffffffffc0205bf0:	079a                	slli	a5,a5,0x6
ffffffffc0205bf2:	4585                	li	a1,1
ffffffffc0205bf4:	953e                	add	a0,a0,a5
ffffffffc0205bf6:	0141                	addi	sp,sp,16
ffffffffc0205bf8:	dc6fc06f          	j	ffffffffc02021be <free_pages>
ffffffffc0205bfc:	86aa                	mv	a3,a0
ffffffffc0205bfe:	00007617          	auipc	a2,0x7
ffffffffc0205c02:	a7260613          	addi	a2,a2,-1422 # ffffffffc020c670 <etext+0xf5c>
ffffffffc0205c06:	07700593          	li	a1,119
ffffffffc0205c0a:	00007517          	auipc	a0,0x7
ffffffffc0205c0e:	9e650513          	addi	a0,a0,-1562 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc0205c12:	839fa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0205c16:	00007617          	auipc	a2,0x7
ffffffffc0205c1a:	a8260613          	addi	a2,a2,-1406 # ffffffffc020c698 <etext+0xf84>
ffffffffc0205c1e:	06900593          	li	a1,105
ffffffffc0205c22:	00007517          	auipc	a0,0x7
ffffffffc0205c26:	9ce50513          	addi	a0,a0,-1586 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc0205c2a:	821fa0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0205c2e <setup_pgdir>:
ffffffffc0205c2e:	1101                	addi	sp,sp,-32
ffffffffc0205c30:	e426                	sd	s1,8(sp)
ffffffffc0205c32:	84aa                	mv	s1,a0
ffffffffc0205c34:	4505                	li	a0,1
ffffffffc0205c36:	ec06                	sd	ra,24(sp)
ffffffffc0205c38:	d4cfc0ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc0205c3c:	cd29                	beqz	a0,ffffffffc0205c96 <setup_pgdir+0x68>
ffffffffc0205c3e:	00091697          	auipc	a3,0x91
ffffffffc0205c42:	c7a6b683          	ld	a3,-902(a3) # ffffffffc02968b8 <pages>
ffffffffc0205c46:	0000a797          	auipc	a5,0xa
ffffffffc0205c4a:	c8a7b783          	ld	a5,-886(a5) # ffffffffc020f8d0 <nbase>
ffffffffc0205c4e:	00091717          	auipc	a4,0x91
ffffffffc0205c52:	c6273703          	ld	a4,-926(a4) # ffffffffc02968b0 <npage>
ffffffffc0205c56:	40d506b3          	sub	a3,a0,a3
ffffffffc0205c5a:	8699                	srai	a3,a3,0x6
ffffffffc0205c5c:	96be                	add	a3,a3,a5
ffffffffc0205c5e:	00c69793          	slli	a5,a3,0xc
ffffffffc0205c62:	e822                	sd	s0,16(sp)
ffffffffc0205c64:	83b1                	srli	a5,a5,0xc
ffffffffc0205c66:	06b2                	slli	a3,a3,0xc
ffffffffc0205c68:	02e7f963          	bgeu	a5,a4,ffffffffc0205c9a <setup_pgdir+0x6c>
ffffffffc0205c6c:	00091797          	auipc	a5,0x91
ffffffffc0205c70:	c3c7b783          	ld	a5,-964(a5) # ffffffffc02968a8 <va_pa_offset>
ffffffffc0205c74:	00091597          	auipc	a1,0x91
ffffffffc0205c78:	c2c5b583          	ld	a1,-980(a1) # ffffffffc02968a0 <boot_pgdir_va>
ffffffffc0205c7c:	6605                	lui	a2,0x1
ffffffffc0205c7e:	00f68433          	add	s0,a3,a5
ffffffffc0205c82:	8522                	mv	a0,s0
ffffffffc0205c84:	279050ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc0205c88:	ec80                	sd	s0,24(s1)
ffffffffc0205c8a:	6442                	ld	s0,16(sp)
ffffffffc0205c8c:	4501                	li	a0,0
ffffffffc0205c8e:	60e2                	ld	ra,24(sp)
ffffffffc0205c90:	64a2                	ld	s1,8(sp)
ffffffffc0205c92:	6105                	addi	sp,sp,32
ffffffffc0205c94:	8082                	ret
ffffffffc0205c96:	5571                	li	a0,-4
ffffffffc0205c98:	bfdd                	j	ffffffffc0205c8e <setup_pgdir+0x60>
ffffffffc0205c9a:	00007617          	auipc	a2,0x7
ffffffffc0205c9e:	92e60613          	addi	a2,a2,-1746 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc0205ca2:	07100593          	li	a1,113
ffffffffc0205ca6:	00007517          	auipc	a0,0x7
ffffffffc0205caa:	94a50513          	addi	a0,a0,-1718 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc0205cae:	f9cfa0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0205cb2 <proc_run>:
ffffffffc0205cb2:	1101                	addi	sp,sp,-32
ffffffffc0205cb4:	ec06                	sd	ra,24(sp)
ffffffffc0205cb6:	100027f3          	csrr	a5,sstatus
ffffffffc0205cba:	8b89                	andi	a5,a5,2
ffffffffc0205cbc:	e3b9                	bnez	a5,ffffffffc0205d02 <proc_run+0x50>
ffffffffc0205cbe:	00091797          	auipc	a5,0x91
ffffffffc0205cc2:	c0a78793          	addi	a5,a5,-1014 # ffffffffc02968c8 <current>
ffffffffc0205cc6:	6390                	ld	a2,0(a5)
ffffffffc0205cc8:	4801                	li	a6,0
ffffffffc0205cca:	02c50963          	beq	a0,a2,ffffffffc0205cfc <proc_run+0x4a>
ffffffffc0205cce:	4514                	lw	a3,8(a0)
ffffffffc0205cd0:	e388                	sd	a0,0(a5)
ffffffffc0205cd2:	755c                	ld	a5,168(a0)
ffffffffc0205cd4:	577d                	li	a4,-1
ffffffffc0205cd6:	2685                	addiw	a3,a3,1
ffffffffc0205cd8:	177e                	slli	a4,a4,0x3f
ffffffffc0205cda:	83b1                	srli	a5,a5,0xc
ffffffffc0205cdc:	e442                	sd	a6,8(sp)
ffffffffc0205cde:	00053c23          	sd	zero,24(a0)
ffffffffc0205ce2:	c514                	sw	a3,8(a0)
ffffffffc0205ce4:	8fd9                	or	a5,a5,a4
ffffffffc0205ce6:	18079073          	csrw	satp,a5
ffffffffc0205cea:	03050593          	addi	a1,a0,48
ffffffffc0205cee:	03060513          	addi	a0,a2,48
ffffffffc0205cf2:	464010ef          	jal	ffffffffc0207156 <switch_to>
ffffffffc0205cf6:	6822                	ld	a6,8(sp)
ffffffffc0205cf8:	02081163          	bnez	a6,ffffffffc0205d1a <proc_run+0x68>
ffffffffc0205cfc:	60e2                	ld	ra,24(sp)
ffffffffc0205cfe:	6105                	addi	sp,sp,32
ffffffffc0205d00:	8082                	ret
ffffffffc0205d02:	e42a                	sd	a0,8(sp)
ffffffffc0205d04:	ed5fa0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0205d08:	00091797          	auipc	a5,0x91
ffffffffc0205d0c:	bc078793          	addi	a5,a5,-1088 # ffffffffc02968c8 <current>
ffffffffc0205d10:	6390                	ld	a2,0(a5)
ffffffffc0205d12:	6522                	ld	a0,8(sp)
ffffffffc0205d14:	4805                	li	a6,1
ffffffffc0205d16:	fac51ce3          	bne	a0,a2,ffffffffc0205cce <proc_run+0x1c>
ffffffffc0205d1a:	60e2                	ld	ra,24(sp)
ffffffffc0205d1c:	6105                	addi	sp,sp,32
ffffffffc0205d1e:	eb5fa06f          	j	ffffffffc0200bd2 <intr_enable>

ffffffffc0205d22 <do_fork>:
ffffffffc0205d22:	00091717          	auipc	a4,0x91
ffffffffc0205d26:	b9e72703          	lw	a4,-1122(a4) # ffffffffc02968c0 <nr_process>
ffffffffc0205d2a:	7119                	addi	sp,sp,-128
ffffffffc0205d2c:	fc86                	sd	ra,120(sp)
ffffffffc0205d2e:	f0ca                	sd	s2,96(sp)
ffffffffc0205d30:	6785                	lui	a5,0x1
ffffffffc0205d32:	34f75763          	bge	a4,a5,ffffffffc0206080 <do_fork+0x35e>
ffffffffc0205d36:	f8a2                	sd	s0,112(sp)
ffffffffc0205d38:	f862                	sd	s8,48(sp)
ffffffffc0205d3a:	f466                	sd	s9,40(sp)
ffffffffc0205d3c:	f06a                	sd	s10,32(sp)
ffffffffc0205d3e:	8cae                	mv	s9,a1
ffffffffc0205d40:	8d32                	mv	s10,a2
ffffffffc0205d42:	8c2a                	mv	s8,a0
ffffffffc0205d44:	dcbff0ef          	jal	ffffffffc0205b0e <alloc_proc>
ffffffffc0205d48:	842a                	mv	s0,a0
ffffffffc0205d4a:	32050d63          	beqz	a0,ffffffffc0206084 <do_fork+0x362>
ffffffffc0205d4e:	00091917          	auipc	s2,0x91
ffffffffc0205d52:	b7a90913          	addi	s2,s2,-1158 # ffffffffc02968c8 <current>
ffffffffc0205d56:	00093783          	ld	a5,0(s2)
ffffffffc0205d5a:	4509                	li	a0,2
ffffffffc0205d5c:	f01c                	sd	a5,32(s0)
ffffffffc0205d5e:	0e07a623          	sw	zero,236(a5) # 10ec <_binary_bin_swap_img_size-0x6c14>
ffffffffc0205d62:	c22fc0ef          	jal	ffffffffc0202184 <alloc_pages>
ffffffffc0205d66:	30050763          	beqz	a0,ffffffffc0206074 <do_fork+0x352>
ffffffffc0205d6a:	ecce                	sd	s3,88(sp)
ffffffffc0205d6c:	00091997          	auipc	s3,0x91
ffffffffc0205d70:	b4c98993          	addi	s3,s3,-1204 # ffffffffc02968b8 <pages>
ffffffffc0205d74:	0009b783          	ld	a5,0(s3)
ffffffffc0205d78:	f4a6                	sd	s1,104(sp)
ffffffffc0205d7a:	0000a497          	auipc	s1,0xa
ffffffffc0205d7e:	b564b483          	ld	s1,-1194(s1) # ffffffffc020f8d0 <nbase>
ffffffffc0205d82:	40f506b3          	sub	a3,a0,a5
ffffffffc0205d86:	e8d2                	sd	s4,80(sp)
ffffffffc0205d88:	8699                	srai	a3,a3,0x6
ffffffffc0205d8a:	00091a17          	auipc	s4,0x91
ffffffffc0205d8e:	b26a0a13          	addi	s4,s4,-1242 # ffffffffc02968b0 <npage>
ffffffffc0205d92:	96a6                	add	a3,a3,s1
ffffffffc0205d94:	000a3703          	ld	a4,0(s4)
ffffffffc0205d98:	00c69793          	slli	a5,a3,0xc
ffffffffc0205d9c:	e4d6                	sd	s5,72(sp)
ffffffffc0205d9e:	83b1                	srli	a5,a5,0xc
ffffffffc0205da0:	06b2                	slli	a3,a3,0xc
ffffffffc0205da2:	2ee7f763          	bgeu	a5,a4,ffffffffc0206090 <do_fork+0x36e>
ffffffffc0205da6:	00093703          	ld	a4,0(s2)
ffffffffc0205daa:	00091a97          	auipc	s5,0x91
ffffffffc0205dae:	afea8a93          	addi	s5,s5,-1282 # ffffffffc02968a8 <va_pa_offset>
ffffffffc0205db2:	000ab783          	ld	a5,0(s5)
ffffffffc0205db6:	770c                	ld	a1,40(a4)
ffffffffc0205db8:	96be                	add	a3,a3,a5
ffffffffc0205dba:	e814                	sd	a3,16(s0)
ffffffffc0205dbc:	c19d                	beqz	a1,ffffffffc0205de2 <do_fork+0xc0>
ffffffffc0205dbe:	100c7793          	andi	a5,s8,256
ffffffffc0205dc2:	1c078763          	beqz	a5,ffffffffc0205f90 <do_fork+0x26e>
ffffffffc0205dc6:	5998                	lw	a4,48(a1)
ffffffffc0205dc8:	6d9c                	ld	a5,24(a1)
ffffffffc0205dca:	c02006b7          	lui	a3,0xc0200
ffffffffc0205dce:	2705                	addiw	a4,a4,1
ffffffffc0205dd0:	d998                	sw	a4,48(a1)
ffffffffc0205dd2:	f40c                	sd	a1,40(s0)
ffffffffc0205dd4:	32d7ee63          	bltu	a5,a3,ffffffffc0206110 <do_fork+0x3ee>
ffffffffc0205dd8:	000ab703          	ld	a4,0(s5)
ffffffffc0205ddc:	6814                	ld	a3,16(s0)
ffffffffc0205dde:	8f99                	sub	a5,a5,a4
ffffffffc0205de0:	f45c                	sd	a5,168(s0)
ffffffffc0205de2:	6789                	lui	a5,0x2
ffffffffc0205de4:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0205de8:	96be                	add	a3,a3,a5
ffffffffc0205dea:	f054                	sd	a3,160(s0)
ffffffffc0205dec:	87ea                	mv	a5,s10
ffffffffc0205dee:	8736                	mv	a4,a3
ffffffffc0205df0:	120d0613          	addi	a2,s10,288
ffffffffc0205df4:	6b8c                	ld	a1,16(a5)
ffffffffc0205df6:	0007b803          	ld	a6,0(a5)
ffffffffc0205dfa:	6788                	ld	a0,8(a5)
ffffffffc0205dfc:	eb0c                	sd	a1,16(a4)
ffffffffc0205dfe:	01073023          	sd	a6,0(a4)
ffffffffc0205e02:	e708                	sd	a0,8(a4)
ffffffffc0205e04:	6f8c                	ld	a1,24(a5)
ffffffffc0205e06:	02078793          	addi	a5,a5,32
ffffffffc0205e0a:	02070713          	addi	a4,a4,32
ffffffffc0205e0e:	feb73c23          	sd	a1,-8(a4)
ffffffffc0205e12:	fec791e3          	bne	a5,a2,ffffffffc0205df4 <do_fork+0xd2>
ffffffffc0205e16:	0406b823          	sd	zero,80(a3) # ffffffffc0200050 <kern_init+0x6>
ffffffffc0205e1a:	1c0c8563          	beqz	s9,ffffffffc0205fe4 <do_fork+0x2c2>
ffffffffc0205e1e:	0196b823          	sd	s9,16(a3)
ffffffffc0205e22:	00000797          	auipc	a5,0x0
ffffffffc0205e26:	d8678793          	addi	a5,a5,-634 # ffffffffc0205ba8 <forkret>
ffffffffc0205e2a:	fc14                	sd	a3,56(s0)
ffffffffc0205e2c:	f81c                	sd	a5,48(s0)
ffffffffc0205e2e:	100027f3          	csrr	a5,sstatus
ffffffffc0205e32:	8b89                	andi	a5,a5,2
ffffffffc0205e34:	4881                	li	a7,0
ffffffffc0205e36:	22079b63          	bnez	a5,ffffffffc020606c <do_fork+0x34a>
ffffffffc0205e3a:	0008b517          	auipc	a0,0x8b
ffffffffc0205e3e:	22252503          	lw	a0,546(a0) # ffffffffc029105c <last_pid.1>
ffffffffc0205e42:	6789                	lui	a5,0x2
ffffffffc0205e44:	2505                	addiw	a0,a0,1
ffffffffc0205e46:	0008b717          	auipc	a4,0x8b
ffffffffc0205e4a:	20a72b23          	sw	a0,534(a4) # ffffffffc029105c <last_pid.1>
ffffffffc0205e4e:	20f55063          	bge	a0,a5,ffffffffc020604e <do_fork+0x32c>
ffffffffc0205e52:	0008b797          	auipc	a5,0x8b
ffffffffc0205e56:	2067a783          	lw	a5,518(a5) # ffffffffc0291058 <next_safe.0>
ffffffffc0205e5a:	00090617          	auipc	a2,0x90
ffffffffc0205e5e:	96660613          	addi	a2,a2,-1690 # ffffffffc02957c0 <proc_list>
ffffffffc0205e62:	06f54663          	blt	a0,a5,ffffffffc0205ece <do_fork+0x1ac>
ffffffffc0205e66:	00090617          	auipc	a2,0x90
ffffffffc0205e6a:	95a60613          	addi	a2,a2,-1702 # ffffffffc02957c0 <proc_list>
ffffffffc0205e6e:	00863e03          	ld	t3,8(a2)
ffffffffc0205e72:	6789                	lui	a5,0x2
ffffffffc0205e74:	0008b717          	auipc	a4,0x8b
ffffffffc0205e78:	1ef72223          	sw	a5,484(a4) # ffffffffc0291058 <next_safe.0>
ffffffffc0205e7c:	86aa                	mv	a3,a0
ffffffffc0205e7e:	4801                	li	a6,0
ffffffffc0205e80:	04ce0063          	beq	t3,a2,ffffffffc0205ec0 <do_fork+0x19e>
ffffffffc0205e84:	8342                	mv	t1,a6
ffffffffc0205e86:	87f2                	mv	a5,t3
ffffffffc0205e88:	6589                	lui	a1,0x2
ffffffffc0205e8a:	a811                	j	ffffffffc0205e9e <do_fork+0x17c>
ffffffffc0205e8c:	00e6d663          	bge	a3,a4,ffffffffc0205e98 <do_fork+0x176>
ffffffffc0205e90:	00b75463          	bge	a4,a1,ffffffffc0205e98 <do_fork+0x176>
ffffffffc0205e94:	85ba                	mv	a1,a4
ffffffffc0205e96:	4305                	li	t1,1
ffffffffc0205e98:	679c                	ld	a5,8(a5)
ffffffffc0205e9a:	00c78d63          	beq	a5,a2,ffffffffc0205eb4 <do_fork+0x192>
ffffffffc0205e9e:	f3c7a703          	lw	a4,-196(a5) # 1f3c <_binary_bin_swap_img_size-0x5dc4>
ffffffffc0205ea2:	fed715e3          	bne	a4,a3,ffffffffc0205e8c <do_fork+0x16a>
ffffffffc0205ea6:	2685                	addiw	a3,a3,1
ffffffffc0205ea8:	1ab6dc63          	bge	a3,a1,ffffffffc0206060 <do_fork+0x33e>
ffffffffc0205eac:	679c                	ld	a5,8(a5)
ffffffffc0205eae:	4805                	li	a6,1
ffffffffc0205eb0:	fec797e3          	bne	a5,a2,ffffffffc0205e9e <do_fork+0x17c>
ffffffffc0205eb4:	00030663          	beqz	t1,ffffffffc0205ec0 <do_fork+0x19e>
ffffffffc0205eb8:	0008b797          	auipc	a5,0x8b
ffffffffc0205ebc:	1ab7a023          	sw	a1,416(a5) # ffffffffc0291058 <next_safe.0>
ffffffffc0205ec0:	00080763          	beqz	a6,ffffffffc0205ece <do_fork+0x1ac>
ffffffffc0205ec4:	0008b797          	auipc	a5,0x8b
ffffffffc0205ec8:	18d7ac23          	sw	a3,408(a5) # ffffffffc029105c <last_pid.1>
ffffffffc0205ecc:	8536                	mv	a0,a3
ffffffffc0205ece:	45a9                	li	a1,10
ffffffffc0205ed0:	c048                	sw	a0,4(s0)
ffffffffc0205ed2:	e432                	sd	a2,8(sp)
ffffffffc0205ed4:	e046                	sd	a7,0(sp)
ffffffffc0205ed6:	29a050ef          	jal	ffffffffc020b170 <hash32>
ffffffffc0205eda:	02051793          	slli	a5,a0,0x20
ffffffffc0205ede:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0205ee2:	0008c797          	auipc	a5,0x8c
ffffffffc0205ee6:	8de78793          	addi	a5,a5,-1826 # ffffffffc02917c0 <hash_list>
ffffffffc0205eea:	953e                	add	a0,a0,a5
ffffffffc0205eec:	6518                	ld	a4,8(a0)
ffffffffc0205eee:	6622                	ld	a2,8(sp)
ffffffffc0205ef0:	0d840793          	addi	a5,s0,216
ffffffffc0205ef4:	6882                	ld	a7,0(sp)
ffffffffc0205ef6:	660c                	ld	a1,8(a2)
ffffffffc0205ef8:	e31c                	sd	a5,0(a4)
ffffffffc0205efa:	e51c                	sd	a5,8(a0)
ffffffffc0205efc:	f078                	sd	a4,224(s0)
ffffffffc0205efe:	0c840793          	addi	a5,s0,200
ffffffffc0205f02:	7018                	ld	a4,32(s0)
ffffffffc0205f04:	ec68                	sd	a0,216(s0)
ffffffffc0205f06:	e19c                	sd	a5,0(a1)
ffffffffc0205f08:	0e043c23          	sd	zero,248(s0)
ffffffffc0205f0c:	7b74                	ld	a3,240(a4)
ffffffffc0205f0e:	e61c                	sd	a5,8(a2)
ffffffffc0205f10:	e86c                	sd	a1,208(s0)
ffffffffc0205f12:	e470                	sd	a2,200(s0)
ffffffffc0205f14:	10d43023          	sd	a3,256(s0)
ffffffffc0205f18:	c299                	beqz	a3,ffffffffc0205f1e <do_fork+0x1fc>
ffffffffc0205f1a:	fee0                	sd	s0,248(a3)
ffffffffc0205f1c:	7018                	ld	a4,32(s0)
ffffffffc0205f1e:	00091797          	auipc	a5,0x91
ffffffffc0205f22:	9a27a783          	lw	a5,-1630(a5) # ffffffffc02968c0 <nr_process>
ffffffffc0205f26:	fb60                	sd	s0,240(a4)
ffffffffc0205f28:	2785                	addiw	a5,a5,1
ffffffffc0205f2a:	00091717          	auipc	a4,0x91
ffffffffc0205f2e:	98f72b23          	sw	a5,-1642(a4) # ffffffffc02968c0 <nr_process>
ffffffffc0205f32:	12089463          	bnez	a7,ffffffffc020605a <do_fork+0x338>
ffffffffc0205f36:	8522                	mv	a0,s0
ffffffffc0205f38:	3c2010ef          	jal	ffffffffc02072fa <wakeup_proc>
ffffffffc0205f3c:	00093783          	ld	a5,0(s2)
ffffffffc0205f40:	1487b583          	ld	a1,328(a5)
ffffffffc0205f44:	1a058363          	beqz	a1,ffffffffc02060ea <do_fork+0x3c8>
ffffffffc0205f48:	034c1793          	slli	a5,s8,0x34
ffffffffc0205f4c:	00442903          	lw	s2,4(s0)
ffffffffc0205f50:	0007ce63          	bltz	a5,ffffffffc0205f6c <do_fork+0x24a>
ffffffffc0205f54:	e02e                	sd	a1,0(sp)
ffffffffc0205f56:	b6eff0ef          	jal	ffffffffc02052c4 <files_create>
ffffffffc0205f5a:	c54d                	beqz	a0,ffffffffc0206004 <do_fork+0x2e2>
ffffffffc0205f5c:	6582                	ld	a1,0(sp)
ffffffffc0205f5e:	e02a                	sd	a0,0(sp)
ffffffffc0205f60:	c9cff0ef          	jal	ffffffffc02053fc <dup_files>
ffffffffc0205f64:	6782                	ld	a5,0(sp)
ffffffffc0205f66:	85be                	mv	a1,a5
ffffffffc0205f68:	10051863          	bnez	a0,ffffffffc0206078 <do_fork+0x356>
ffffffffc0205f6c:	499c                	lw	a5,16(a1)
ffffffffc0205f6e:	74a6                	ld	s1,104(sp)
ffffffffc0205f70:	69e6                	ld	s3,88(sp)
ffffffffc0205f72:	2785                	addiw	a5,a5,1
ffffffffc0205f74:	c99c                	sw	a5,16(a1)
ffffffffc0205f76:	14b43423          	sd	a1,328(s0)
ffffffffc0205f7a:	6a46                	ld	s4,80(sp)
ffffffffc0205f7c:	7446                	ld	s0,112(sp)
ffffffffc0205f7e:	6aa6                	ld	s5,72(sp)
ffffffffc0205f80:	7c42                	ld	s8,48(sp)
ffffffffc0205f82:	7ca2                	ld	s9,40(sp)
ffffffffc0205f84:	7d02                	ld	s10,32(sp)
ffffffffc0205f86:	70e6                	ld	ra,120(sp)
ffffffffc0205f88:	854a                	mv	a0,s2
ffffffffc0205f8a:	7906                	ld	s2,96(sp)
ffffffffc0205f8c:	6109                	addi	sp,sp,128
ffffffffc0205f8e:	8082                	ret
ffffffffc0205f90:	e0da                	sd	s6,64(sp)
ffffffffc0205f92:	e02e                	sd	a1,0(sp)
ffffffffc0205f94:	d2ffd0ef          	jal	ffffffffc0203cc2 <mm_create>
ffffffffc0205f98:	8b2a                	mv	s6,a0
ffffffffc0205f9a:	c13d                	beqz	a0,ffffffffc0206000 <do_fork+0x2de>
ffffffffc0205f9c:	c93ff0ef          	jal	ffffffffc0205c2e <setup_pgdir>
ffffffffc0205fa0:	ed29                	bnez	a0,ffffffffc0205ffa <do_fork+0x2d8>
ffffffffc0205fa2:	6582                	ld	a1,0(sp)
ffffffffc0205fa4:	ec6e                	sd	s11,24(sp)
ffffffffc0205fa6:	fc5e                	sd	s7,56(sp)
ffffffffc0205fa8:	03858513          	addi	a0,a1,56 # 2038 <_binary_bin_swap_img_size-0x5cc8>
ffffffffc0205fac:	03858d93          	addi	s11,a1,56
ffffffffc0205fb0:	e92fe0ef          	jal	ffffffffc0204642 <down>
ffffffffc0205fb4:	00093783          	ld	a5,0(s2)
ffffffffc0205fb8:	6582                	ld	a1,0(sp)
ffffffffc0205fba:	c399                	beqz	a5,ffffffffc0205fc0 <do_fork+0x29e>
ffffffffc0205fbc:	43dc                	lw	a5,4(a5)
ffffffffc0205fbe:	c9bc                	sw	a5,80(a1)
ffffffffc0205fc0:	855a                	mv	a0,s6
ffffffffc0205fc2:	e02e                	sd	a1,0(sp)
ffffffffc0205fc4:	f69fd0ef          	jal	ffffffffc0203f2c <dup_mmap>
ffffffffc0205fc8:	8baa                	mv	s7,a0
ffffffffc0205fca:	856e                	mv	a0,s11
ffffffffc0205fcc:	e72fe0ef          	jal	ffffffffc020463e <up>
ffffffffc0205fd0:	6582                	ld	a1,0(sp)
ffffffffc0205fd2:	0405a823          	sw	zero,80(a1)
ffffffffc0205fd6:	85da                	mv	a1,s6
ffffffffc0205fd8:	000b9863          	bnez	s7,ffffffffc0205fe8 <do_fork+0x2c6>
ffffffffc0205fdc:	6b06                	ld	s6,64(sp)
ffffffffc0205fde:	7be2                	ld	s7,56(sp)
ffffffffc0205fe0:	6de2                	ld	s11,24(sp)
ffffffffc0205fe2:	b3d5                	j	ffffffffc0205dc6 <do_fork+0xa4>
ffffffffc0205fe4:	8cb6                	mv	s9,a3
ffffffffc0205fe6:	bd25                	j	ffffffffc0205e1e <do_fork+0xfc>
ffffffffc0205fe8:	855a                	mv	a0,s6
ffffffffc0205fea:	fdbfd0ef          	jal	ffffffffc0203fc4 <exit_mmap>
ffffffffc0205fee:	018b3503          	ld	a0,24(s6)
ffffffffc0205ff2:	bc5ff0ef          	jal	ffffffffc0205bb6 <put_pgdir.isra.0>
ffffffffc0205ff6:	7be2                	ld	s7,56(sp)
ffffffffc0205ff8:	6de2                	ld	s11,24(sp)
ffffffffc0205ffa:	855a                	mv	a0,s6
ffffffffc0205ffc:	e13fd0ef          	jal	ffffffffc0203e0e <mm_destroy>
ffffffffc0206000:	6b06                	ld	s6,64(sp)
ffffffffc0206002:	5971                	li	s2,-4
ffffffffc0206004:	6814                	ld	a3,16(s0)
ffffffffc0206006:	c02007b7          	lui	a5,0xc0200
ffffffffc020600a:	0cf6e163          	bltu	a3,a5,ffffffffc02060cc <do_fork+0x3aa>
ffffffffc020600e:	000ab703          	ld	a4,0(s5)
ffffffffc0206012:	000a3783          	ld	a5,0(s4)
ffffffffc0206016:	8e99                	sub	a3,a3,a4
ffffffffc0206018:	82b1                	srli	a3,a3,0xc
ffffffffc020601a:	08f6fa63          	bgeu	a3,a5,ffffffffc02060ae <do_fork+0x38c>
ffffffffc020601e:	0009b503          	ld	a0,0(s3)
ffffffffc0206022:	8e85                	sub	a3,a3,s1
ffffffffc0206024:	069a                	slli	a3,a3,0x6
ffffffffc0206026:	9536                	add	a0,a0,a3
ffffffffc0206028:	4589                	li	a1,2
ffffffffc020602a:	994fc0ef          	jal	ffffffffc02021be <free_pages>
ffffffffc020602e:	74a6                	ld	s1,104(sp)
ffffffffc0206030:	69e6                	ld	s3,88(sp)
ffffffffc0206032:	6a46                	ld	s4,80(sp)
ffffffffc0206034:	6aa6                	ld	s5,72(sp)
ffffffffc0206036:	8522                	mv	a0,s0
ffffffffc0206038:	82efc0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020603c:	70e6                	ld	ra,120(sp)
ffffffffc020603e:	7446                	ld	s0,112(sp)
ffffffffc0206040:	7c42                	ld	s8,48(sp)
ffffffffc0206042:	7ca2                	ld	s9,40(sp)
ffffffffc0206044:	7d02                	ld	s10,32(sp)
ffffffffc0206046:	854a                	mv	a0,s2
ffffffffc0206048:	7906                	ld	s2,96(sp)
ffffffffc020604a:	6109                	addi	sp,sp,128
ffffffffc020604c:	8082                	ret
ffffffffc020604e:	4505                	li	a0,1
ffffffffc0206050:	0008b797          	auipc	a5,0x8b
ffffffffc0206054:	00a7a623          	sw	a0,12(a5) # ffffffffc029105c <last_pid.1>
ffffffffc0206058:	b539                	j	ffffffffc0205e66 <do_fork+0x144>
ffffffffc020605a:	b79fa0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc020605e:	bde1                	j	ffffffffc0205f36 <do_fork+0x214>
ffffffffc0206060:	6789                	lui	a5,0x2
ffffffffc0206062:	00f6c363          	blt	a3,a5,ffffffffc0206068 <do_fork+0x346>
ffffffffc0206066:	4685                	li	a3,1
ffffffffc0206068:	4805                	li	a6,1
ffffffffc020606a:	bd19                	j	ffffffffc0205e80 <do_fork+0x15e>
ffffffffc020606c:	b6dfa0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0206070:	4885                	li	a7,1
ffffffffc0206072:	b3e1                	j	ffffffffc0205e3a <do_fork+0x118>
ffffffffc0206074:	5971                	li	s2,-4
ffffffffc0206076:	b7c1                	j	ffffffffc0206036 <do_fork+0x314>
ffffffffc0206078:	853e                	mv	a0,a5
ffffffffc020607a:	a80ff0ef          	jal	ffffffffc02052fa <files_destroy>
ffffffffc020607e:	b759                	j	ffffffffc0206004 <do_fork+0x2e2>
ffffffffc0206080:	596d                	li	s2,-5
ffffffffc0206082:	b711                	j	ffffffffc0205f86 <do_fork+0x264>
ffffffffc0206084:	7446                	ld	s0,112(sp)
ffffffffc0206086:	7c42                	ld	s8,48(sp)
ffffffffc0206088:	7ca2                	ld	s9,40(sp)
ffffffffc020608a:	7d02                	ld	s10,32(sp)
ffffffffc020608c:	5971                	li	s2,-4
ffffffffc020608e:	bde5                	j	ffffffffc0205f86 <do_fork+0x264>
ffffffffc0206090:	00006617          	auipc	a2,0x6
ffffffffc0206094:	53860613          	addi	a2,a2,1336 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc0206098:	07100593          	li	a1,113
ffffffffc020609c:	00006517          	auipc	a0,0x6
ffffffffc02060a0:	55450513          	addi	a0,a0,1364 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc02060a4:	e0da                	sd	s6,64(sp)
ffffffffc02060a6:	fc5e                	sd	s7,56(sp)
ffffffffc02060a8:	ec6e                	sd	s11,24(sp)
ffffffffc02060aa:	ba0fa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02060ae:	00006617          	auipc	a2,0x6
ffffffffc02060b2:	5ea60613          	addi	a2,a2,1514 # ffffffffc020c698 <etext+0xf84>
ffffffffc02060b6:	06900593          	li	a1,105
ffffffffc02060ba:	00006517          	auipc	a0,0x6
ffffffffc02060be:	53650513          	addi	a0,a0,1334 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc02060c2:	e0da                	sd	s6,64(sp)
ffffffffc02060c4:	fc5e                	sd	s7,56(sp)
ffffffffc02060c6:	ec6e                	sd	s11,24(sp)
ffffffffc02060c8:	b82fa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02060cc:	00006617          	auipc	a2,0x6
ffffffffc02060d0:	5a460613          	addi	a2,a2,1444 # ffffffffc020c670 <etext+0xf5c>
ffffffffc02060d4:	07700593          	li	a1,119
ffffffffc02060d8:	00006517          	auipc	a0,0x6
ffffffffc02060dc:	51850513          	addi	a0,a0,1304 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc02060e0:	e0da                	sd	s6,64(sp)
ffffffffc02060e2:	fc5e                	sd	s7,56(sp)
ffffffffc02060e4:	ec6e                	sd	s11,24(sp)
ffffffffc02060e6:	b64fa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02060ea:	00007697          	auipc	a3,0x7
ffffffffc02060ee:	4a668693          	addi	a3,a3,1190 # ffffffffc020d590 <etext+0x1e7c>
ffffffffc02060f2:	00006617          	auipc	a2,0x6
ffffffffc02060f6:	a5e60613          	addi	a2,a2,-1442 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02060fa:	1d600593          	li	a1,470
ffffffffc02060fe:	00007517          	auipc	a0,0x7
ffffffffc0206102:	47a50513          	addi	a0,a0,1146 # ffffffffc020d578 <etext+0x1e64>
ffffffffc0206106:	e0da                	sd	s6,64(sp)
ffffffffc0206108:	fc5e                	sd	s7,56(sp)
ffffffffc020610a:	ec6e                	sd	s11,24(sp)
ffffffffc020610c:	b3efa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206110:	86be                	mv	a3,a5
ffffffffc0206112:	00006617          	auipc	a2,0x6
ffffffffc0206116:	55e60613          	addi	a2,a2,1374 # ffffffffc020c670 <etext+0xf5c>
ffffffffc020611a:	1b600593          	li	a1,438
ffffffffc020611e:	00007517          	auipc	a0,0x7
ffffffffc0206122:	45a50513          	addi	a0,a0,1114 # ffffffffc020d578 <etext+0x1e64>
ffffffffc0206126:	e0da                	sd	s6,64(sp)
ffffffffc0206128:	fc5e                	sd	s7,56(sp)
ffffffffc020612a:	ec6e                	sd	s11,24(sp)
ffffffffc020612c:	b1efa0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0206130 <kernel_thread>:
ffffffffc0206130:	7129                	addi	sp,sp,-320
ffffffffc0206132:	fa22                	sd	s0,304(sp)
ffffffffc0206134:	f626                	sd	s1,296(sp)
ffffffffc0206136:	f24a                	sd	s2,288(sp)
ffffffffc0206138:	842a                	mv	s0,a0
ffffffffc020613a:	84ae                	mv	s1,a1
ffffffffc020613c:	8932                	mv	s2,a2
ffffffffc020613e:	850a                	mv	a0,sp
ffffffffc0206140:	12000613          	li	a2,288
ffffffffc0206144:	4581                	li	a1,0
ffffffffc0206146:	fe06                	sd	ra,312(sp)
ffffffffc0206148:	564050ef          	jal	ffffffffc020b6ac <memset>
ffffffffc020614c:	e0a2                	sd	s0,64(sp)
ffffffffc020614e:	e4a6                	sd	s1,72(sp)
ffffffffc0206150:	100027f3          	csrr	a5,sstatus
ffffffffc0206154:	edd7f793          	andi	a5,a5,-291
ffffffffc0206158:	1207e793          	ori	a5,a5,288
ffffffffc020615c:	860a                	mv	a2,sp
ffffffffc020615e:	10096513          	ori	a0,s2,256
ffffffffc0206162:	00000717          	auipc	a4,0x0
ffffffffc0206166:	9a470713          	addi	a4,a4,-1628 # ffffffffc0205b06 <kernel_thread_entry>
ffffffffc020616a:	4581                	li	a1,0
ffffffffc020616c:	e23e                	sd	a5,256(sp)
ffffffffc020616e:	e63a                	sd	a4,264(sp)
ffffffffc0206170:	bb3ff0ef          	jal	ffffffffc0205d22 <do_fork>
ffffffffc0206174:	70f2                	ld	ra,312(sp)
ffffffffc0206176:	7452                	ld	s0,304(sp)
ffffffffc0206178:	74b2                	ld	s1,296(sp)
ffffffffc020617a:	7912                	ld	s2,288(sp)
ffffffffc020617c:	6131                	addi	sp,sp,320
ffffffffc020617e:	8082                	ret

ffffffffc0206180 <do_exit>:
ffffffffc0206180:	7179                	addi	sp,sp,-48
ffffffffc0206182:	f022                	sd	s0,32(sp)
ffffffffc0206184:	00090417          	auipc	s0,0x90
ffffffffc0206188:	74440413          	addi	s0,s0,1860 # ffffffffc02968c8 <current>
ffffffffc020618c:	601c                	ld	a5,0(s0)
ffffffffc020618e:	00090717          	auipc	a4,0x90
ffffffffc0206192:	74a73703          	ld	a4,1866(a4) # ffffffffc02968d8 <idleproc>
ffffffffc0206196:	f406                	sd	ra,40(sp)
ffffffffc0206198:	ec26                	sd	s1,24(sp)
ffffffffc020619a:	0ee78763          	beq	a5,a4,ffffffffc0206288 <do_exit+0x108>
ffffffffc020619e:	00090497          	auipc	s1,0x90
ffffffffc02061a2:	73248493          	addi	s1,s1,1842 # ffffffffc02968d0 <initproc>
ffffffffc02061a6:	6098                	ld	a4,0(s1)
ffffffffc02061a8:	e84a                	sd	s2,16(sp)
ffffffffc02061aa:	10e78863          	beq	a5,a4,ffffffffc02062ba <do_exit+0x13a>
ffffffffc02061ae:	7798                	ld	a4,40(a5)
ffffffffc02061b0:	892a                	mv	s2,a0
ffffffffc02061b2:	cb0d                	beqz	a4,ffffffffc02061e4 <do_exit+0x64>
ffffffffc02061b4:	00090797          	auipc	a5,0x90
ffffffffc02061b8:	6e47b783          	ld	a5,1764(a5) # ffffffffc0296898 <boot_pgdir_pa>
ffffffffc02061bc:	56fd                	li	a3,-1
ffffffffc02061be:	16fe                	slli	a3,a3,0x3f
ffffffffc02061c0:	83b1                	srli	a5,a5,0xc
ffffffffc02061c2:	8fd5                	or	a5,a5,a3
ffffffffc02061c4:	18079073          	csrw	satp,a5
ffffffffc02061c8:	5b1c                	lw	a5,48(a4)
ffffffffc02061ca:	37fd                	addiw	a5,a5,-1
ffffffffc02061cc:	db1c                	sw	a5,48(a4)
ffffffffc02061ce:	cbf1                	beqz	a5,ffffffffc02062a2 <do_exit+0x122>
ffffffffc02061d0:	601c                	ld	a5,0(s0)
ffffffffc02061d2:	1487b503          	ld	a0,328(a5)
ffffffffc02061d6:	0207b423          	sd	zero,40(a5)
ffffffffc02061da:	c509                	beqz	a0,ffffffffc02061e4 <do_exit+0x64>
ffffffffc02061dc:	491c                	lw	a5,16(a0)
ffffffffc02061de:	37fd                	addiw	a5,a5,-1
ffffffffc02061e0:	c91c                	sw	a5,16(a0)
ffffffffc02061e2:	c3c5                	beqz	a5,ffffffffc0206282 <do_exit+0x102>
ffffffffc02061e4:	601c                	ld	a5,0(s0)
ffffffffc02061e6:	470d                	li	a4,3
ffffffffc02061e8:	0f27a423          	sw	s2,232(a5)
ffffffffc02061ec:	c398                	sw	a4,0(a5)
ffffffffc02061ee:	100027f3          	csrr	a5,sstatus
ffffffffc02061f2:	8b89                	andi	a5,a5,2
ffffffffc02061f4:	4901                	li	s2,0
ffffffffc02061f6:	0c079e63          	bnez	a5,ffffffffc02062d2 <do_exit+0x152>
ffffffffc02061fa:	6018                	ld	a4,0(s0)
ffffffffc02061fc:	800007b7          	lui	a5,0x80000
ffffffffc0206200:	0785                	addi	a5,a5,1 # ffffffff80000001 <_binary_bin_sfs_img_size+0xffffffff7ff8ad01>
ffffffffc0206202:	7308                	ld	a0,32(a4)
ffffffffc0206204:	0ec52703          	lw	a4,236(a0)
ffffffffc0206208:	0cf70963          	beq	a4,a5,ffffffffc02062da <do_exit+0x15a>
ffffffffc020620c:	6018                	ld	a4,0(s0)
ffffffffc020620e:	7b7c                	ld	a5,240(a4)
ffffffffc0206210:	c7a1                	beqz	a5,ffffffffc0206258 <do_exit+0xd8>
ffffffffc0206212:	800005b7          	lui	a1,0x80000
ffffffffc0206216:	0585                	addi	a1,a1,1 # ffffffff80000001 <_binary_bin_sfs_img_size+0xffffffff7ff8ad01>
ffffffffc0206218:	460d                	li	a2,3
ffffffffc020621a:	a021                	j	ffffffffc0206222 <do_exit+0xa2>
ffffffffc020621c:	6018                	ld	a4,0(s0)
ffffffffc020621e:	7b7c                	ld	a5,240(a4)
ffffffffc0206220:	cf85                	beqz	a5,ffffffffc0206258 <do_exit+0xd8>
ffffffffc0206222:	1007b683          	ld	a3,256(a5)
ffffffffc0206226:	6088                	ld	a0,0(s1)
ffffffffc0206228:	fb74                	sd	a3,240(a4)
ffffffffc020622a:	0e07bc23          	sd	zero,248(a5)
ffffffffc020622e:	7978                	ld	a4,240(a0)
ffffffffc0206230:	10e7b023          	sd	a4,256(a5)
ffffffffc0206234:	c311                	beqz	a4,ffffffffc0206238 <do_exit+0xb8>
ffffffffc0206236:	ff7c                	sd	a5,248(a4)
ffffffffc0206238:	4398                	lw	a4,0(a5)
ffffffffc020623a:	f388                	sd	a0,32(a5)
ffffffffc020623c:	f97c                	sd	a5,240(a0)
ffffffffc020623e:	fcc71fe3          	bne	a4,a2,ffffffffc020621c <do_exit+0x9c>
ffffffffc0206242:	0ec52783          	lw	a5,236(a0)
ffffffffc0206246:	fcb79be3          	bne	a5,a1,ffffffffc020621c <do_exit+0x9c>
ffffffffc020624a:	0b0010ef          	jal	ffffffffc02072fa <wakeup_proc>
ffffffffc020624e:	800005b7          	lui	a1,0x80000
ffffffffc0206252:	0585                	addi	a1,a1,1 # ffffffff80000001 <_binary_bin_sfs_img_size+0xffffffff7ff8ad01>
ffffffffc0206254:	460d                	li	a2,3
ffffffffc0206256:	b7d9                	j	ffffffffc020621c <do_exit+0x9c>
ffffffffc0206258:	02091263          	bnez	s2,ffffffffc020627c <do_exit+0xfc>
ffffffffc020625c:	196010ef          	jal	ffffffffc02073f2 <schedule>
ffffffffc0206260:	601c                	ld	a5,0(s0)
ffffffffc0206262:	00007617          	auipc	a2,0x7
ffffffffc0206266:	36660613          	addi	a2,a2,870 # ffffffffc020d5c8 <etext+0x1eb4>
ffffffffc020626a:	2ad00593          	li	a1,685
ffffffffc020626e:	43d4                	lw	a3,4(a5)
ffffffffc0206270:	00007517          	auipc	a0,0x7
ffffffffc0206274:	30850513          	addi	a0,a0,776 # ffffffffc020d578 <etext+0x1e64>
ffffffffc0206278:	9d2fa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020627c:	957fa0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0206280:	bff1                	j	ffffffffc020625c <do_exit+0xdc>
ffffffffc0206282:	878ff0ef          	jal	ffffffffc02052fa <files_destroy>
ffffffffc0206286:	bfb9                	j	ffffffffc02061e4 <do_exit+0x64>
ffffffffc0206288:	00007617          	auipc	a2,0x7
ffffffffc020628c:	32060613          	addi	a2,a2,800 # ffffffffc020d5a8 <etext+0x1e94>
ffffffffc0206290:	27800593          	li	a1,632
ffffffffc0206294:	00007517          	auipc	a0,0x7
ffffffffc0206298:	2e450513          	addi	a0,a0,740 # ffffffffc020d578 <etext+0x1e64>
ffffffffc020629c:	e84a                	sd	s2,16(sp)
ffffffffc020629e:	9acfa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02062a2:	853a                	mv	a0,a4
ffffffffc02062a4:	e43a                	sd	a4,8(sp)
ffffffffc02062a6:	d1ffd0ef          	jal	ffffffffc0203fc4 <exit_mmap>
ffffffffc02062aa:	6722                	ld	a4,8(sp)
ffffffffc02062ac:	6f08                	ld	a0,24(a4)
ffffffffc02062ae:	909ff0ef          	jal	ffffffffc0205bb6 <put_pgdir.isra.0>
ffffffffc02062b2:	6522                	ld	a0,8(sp)
ffffffffc02062b4:	b5bfd0ef          	jal	ffffffffc0203e0e <mm_destroy>
ffffffffc02062b8:	bf21                	j	ffffffffc02061d0 <do_exit+0x50>
ffffffffc02062ba:	00007617          	auipc	a2,0x7
ffffffffc02062be:	2fe60613          	addi	a2,a2,766 # ffffffffc020d5b8 <etext+0x1ea4>
ffffffffc02062c2:	27c00593          	li	a1,636
ffffffffc02062c6:	00007517          	auipc	a0,0x7
ffffffffc02062ca:	2b250513          	addi	a0,a0,690 # ffffffffc020d578 <etext+0x1e64>
ffffffffc02062ce:	97cfa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02062d2:	907fa0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02062d6:	4905                	li	s2,1
ffffffffc02062d8:	b70d                	j	ffffffffc02061fa <do_exit+0x7a>
ffffffffc02062da:	020010ef          	jal	ffffffffc02072fa <wakeup_proc>
ffffffffc02062de:	b73d                	j	ffffffffc020620c <do_exit+0x8c>

ffffffffc02062e0 <do_wait.part.0>:
ffffffffc02062e0:	7179                	addi	sp,sp,-48
ffffffffc02062e2:	ec26                	sd	s1,24(sp)
ffffffffc02062e4:	e84a                	sd	s2,16(sp)
ffffffffc02062e6:	e44e                	sd	s3,8(sp)
ffffffffc02062e8:	f406                	sd	ra,40(sp)
ffffffffc02062ea:	f022                	sd	s0,32(sp)
ffffffffc02062ec:	84aa                	mv	s1,a0
ffffffffc02062ee:	892e                	mv	s2,a1
ffffffffc02062f0:	00090997          	auipc	s3,0x90
ffffffffc02062f4:	5d898993          	addi	s3,s3,1496 # ffffffffc02968c8 <current>
ffffffffc02062f8:	cd19                	beqz	a0,ffffffffc0206316 <do_wait.part.0+0x36>
ffffffffc02062fa:	6789                	lui	a5,0x2
ffffffffc02062fc:	17f9                	addi	a5,a5,-2 # 1ffe <_binary_bin_swap_img_size-0x5d02>
ffffffffc02062fe:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206302:	12e7f563          	bgeu	a5,a4,ffffffffc020642c <do_wait.part.0+0x14c>
ffffffffc0206306:	70a2                	ld	ra,40(sp)
ffffffffc0206308:	7402                	ld	s0,32(sp)
ffffffffc020630a:	64e2                	ld	s1,24(sp)
ffffffffc020630c:	6942                	ld	s2,16(sp)
ffffffffc020630e:	69a2                	ld	s3,8(sp)
ffffffffc0206310:	5579                	li	a0,-2
ffffffffc0206312:	6145                	addi	sp,sp,48
ffffffffc0206314:	8082                	ret
ffffffffc0206316:	0009b703          	ld	a4,0(s3)
ffffffffc020631a:	7b60                	ld	s0,240(a4)
ffffffffc020631c:	d46d                	beqz	s0,ffffffffc0206306 <do_wait.part.0+0x26>
ffffffffc020631e:	468d                	li	a3,3
ffffffffc0206320:	a021                	j	ffffffffc0206328 <do_wait.part.0+0x48>
ffffffffc0206322:	10043403          	ld	s0,256(s0)
ffffffffc0206326:	c075                	beqz	s0,ffffffffc020640a <do_wait.part.0+0x12a>
ffffffffc0206328:	401c                	lw	a5,0(s0)
ffffffffc020632a:	fed79ce3          	bne	a5,a3,ffffffffc0206322 <do_wait.part.0+0x42>
ffffffffc020632e:	00090797          	auipc	a5,0x90
ffffffffc0206332:	5aa7b783          	ld	a5,1450(a5) # ffffffffc02968d8 <idleproc>
ffffffffc0206336:	14878263          	beq	a5,s0,ffffffffc020647a <do_wait.part.0+0x19a>
ffffffffc020633a:	00090797          	auipc	a5,0x90
ffffffffc020633e:	5967b783          	ld	a5,1430(a5) # ffffffffc02968d0 <initproc>
ffffffffc0206342:	12f40c63          	beq	s0,a5,ffffffffc020647a <do_wait.part.0+0x19a>
ffffffffc0206346:	00090663          	beqz	s2,ffffffffc0206352 <do_wait.part.0+0x72>
ffffffffc020634a:	0e842783          	lw	a5,232(s0)
ffffffffc020634e:	00f92023          	sw	a5,0(s2)
ffffffffc0206352:	100027f3          	csrr	a5,sstatus
ffffffffc0206356:	8b89                	andi	a5,a5,2
ffffffffc0206358:	4601                	li	a2,0
ffffffffc020635a:	10079963          	bnez	a5,ffffffffc020646c <do_wait.part.0+0x18c>
ffffffffc020635e:	6c74                	ld	a3,216(s0)
ffffffffc0206360:	7078                	ld	a4,224(s0)
ffffffffc0206362:	10043783          	ld	a5,256(s0)
ffffffffc0206366:	e698                	sd	a4,8(a3)
ffffffffc0206368:	e314                	sd	a3,0(a4)
ffffffffc020636a:	6474                	ld	a3,200(s0)
ffffffffc020636c:	6878                	ld	a4,208(s0)
ffffffffc020636e:	e698                	sd	a4,8(a3)
ffffffffc0206370:	e314                	sd	a3,0(a4)
ffffffffc0206372:	c789                	beqz	a5,ffffffffc020637c <do_wait.part.0+0x9c>
ffffffffc0206374:	7c78                	ld	a4,248(s0)
ffffffffc0206376:	fff8                	sd	a4,248(a5)
ffffffffc0206378:	10043783          	ld	a5,256(s0)
ffffffffc020637c:	7c78                	ld	a4,248(s0)
ffffffffc020637e:	c36d                	beqz	a4,ffffffffc0206460 <do_wait.part.0+0x180>
ffffffffc0206380:	10f73023          	sd	a5,256(a4)
ffffffffc0206384:	00090797          	auipc	a5,0x90
ffffffffc0206388:	53c7a783          	lw	a5,1340(a5) # ffffffffc02968c0 <nr_process>
ffffffffc020638c:	37fd                	addiw	a5,a5,-1
ffffffffc020638e:	00090717          	auipc	a4,0x90
ffffffffc0206392:	52f72923          	sw	a5,1330(a4) # ffffffffc02968c0 <nr_process>
ffffffffc0206396:	e271                	bnez	a2,ffffffffc020645a <do_wait.part.0+0x17a>
ffffffffc0206398:	6814                	ld	a3,16(s0)
ffffffffc020639a:	c02007b7          	lui	a5,0xc0200
ffffffffc020639e:	10f6e663          	bltu	a3,a5,ffffffffc02064aa <do_wait.part.0+0x1ca>
ffffffffc02063a2:	00090717          	auipc	a4,0x90
ffffffffc02063a6:	50673703          	ld	a4,1286(a4) # ffffffffc02968a8 <va_pa_offset>
ffffffffc02063aa:	00090797          	auipc	a5,0x90
ffffffffc02063ae:	5067b783          	ld	a5,1286(a5) # ffffffffc02968b0 <npage>
ffffffffc02063b2:	8e99                	sub	a3,a3,a4
ffffffffc02063b4:	82b1                	srli	a3,a3,0xc
ffffffffc02063b6:	0cf6fe63          	bgeu	a3,a5,ffffffffc0206492 <do_wait.part.0+0x1b2>
ffffffffc02063ba:	00009797          	auipc	a5,0x9
ffffffffc02063be:	5167b783          	ld	a5,1302(a5) # ffffffffc020f8d0 <nbase>
ffffffffc02063c2:	00090517          	auipc	a0,0x90
ffffffffc02063c6:	4f653503          	ld	a0,1270(a0) # ffffffffc02968b8 <pages>
ffffffffc02063ca:	4589                	li	a1,2
ffffffffc02063cc:	8e9d                	sub	a3,a3,a5
ffffffffc02063ce:	069a                	slli	a3,a3,0x6
ffffffffc02063d0:	9536                	add	a0,a0,a3
ffffffffc02063d2:	dedfb0ef          	jal	ffffffffc02021be <free_pages>
ffffffffc02063d6:	8522                	mv	a0,s0
ffffffffc02063d8:	c8ffb0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc02063dc:	70a2                	ld	ra,40(sp)
ffffffffc02063de:	7402                	ld	s0,32(sp)
ffffffffc02063e0:	64e2                	ld	s1,24(sp)
ffffffffc02063e2:	6942                	ld	s2,16(sp)
ffffffffc02063e4:	69a2                	ld	s3,8(sp)
ffffffffc02063e6:	4501                	li	a0,0
ffffffffc02063e8:	6145                	addi	sp,sp,48
ffffffffc02063ea:	8082                	ret
ffffffffc02063ec:	00090997          	auipc	s3,0x90
ffffffffc02063f0:	4dc98993          	addi	s3,s3,1244 # ffffffffc02968c8 <current>
ffffffffc02063f4:	0009b703          	ld	a4,0(s3)
ffffffffc02063f8:	f487b683          	ld	a3,-184(a5)
ffffffffc02063fc:	f0e695e3          	bne	a3,a4,ffffffffc0206306 <do_wait.part.0+0x26>
ffffffffc0206400:	f287a603          	lw	a2,-216(a5)
ffffffffc0206404:	468d                	li	a3,3
ffffffffc0206406:	06d60063          	beq	a2,a3,ffffffffc0206466 <do_wait.part.0+0x186>
ffffffffc020640a:	800007b7          	lui	a5,0x80000
ffffffffc020640e:	0785                	addi	a5,a5,1 # ffffffff80000001 <_binary_bin_sfs_img_size+0xffffffff7ff8ad01>
ffffffffc0206410:	4685                	li	a3,1
ffffffffc0206412:	0ef72623          	sw	a5,236(a4)
ffffffffc0206416:	c314                	sw	a3,0(a4)
ffffffffc0206418:	7db000ef          	jal	ffffffffc02073f2 <schedule>
ffffffffc020641c:	0009b783          	ld	a5,0(s3)
ffffffffc0206420:	0b07a783          	lw	a5,176(a5)
ffffffffc0206424:	8b85                	andi	a5,a5,1
ffffffffc0206426:	e7b9                	bnez	a5,ffffffffc0206474 <do_wait.part.0+0x194>
ffffffffc0206428:	ee0487e3          	beqz	s1,ffffffffc0206316 <do_wait.part.0+0x36>
ffffffffc020642c:	45a9                	li	a1,10
ffffffffc020642e:	8526                	mv	a0,s1
ffffffffc0206430:	541040ef          	jal	ffffffffc020b170 <hash32>
ffffffffc0206434:	02051793          	slli	a5,a0,0x20
ffffffffc0206438:	01c7d513          	srli	a0,a5,0x1c
ffffffffc020643c:	0008b797          	auipc	a5,0x8b
ffffffffc0206440:	38478793          	addi	a5,a5,900 # ffffffffc02917c0 <hash_list>
ffffffffc0206444:	953e                	add	a0,a0,a5
ffffffffc0206446:	87aa                	mv	a5,a0
ffffffffc0206448:	a029                	j	ffffffffc0206452 <do_wait.part.0+0x172>
ffffffffc020644a:	f2c7a703          	lw	a4,-212(a5)
ffffffffc020644e:	f8970fe3          	beq	a4,s1,ffffffffc02063ec <do_wait.part.0+0x10c>
ffffffffc0206452:	679c                	ld	a5,8(a5)
ffffffffc0206454:	fef51be3          	bne	a0,a5,ffffffffc020644a <do_wait.part.0+0x16a>
ffffffffc0206458:	b57d                	j	ffffffffc0206306 <do_wait.part.0+0x26>
ffffffffc020645a:	f78fa0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc020645e:	bf2d                	j	ffffffffc0206398 <do_wait.part.0+0xb8>
ffffffffc0206460:	7018                	ld	a4,32(s0)
ffffffffc0206462:	fb7c                	sd	a5,240(a4)
ffffffffc0206464:	b705                	j	ffffffffc0206384 <do_wait.part.0+0xa4>
ffffffffc0206466:	f2878413          	addi	s0,a5,-216
ffffffffc020646a:	b5d1                	j	ffffffffc020632e <do_wait.part.0+0x4e>
ffffffffc020646c:	f6cfa0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0206470:	4605                	li	a2,1
ffffffffc0206472:	b5f5                	j	ffffffffc020635e <do_wait.part.0+0x7e>
ffffffffc0206474:	555d                	li	a0,-9
ffffffffc0206476:	d0bff0ef          	jal	ffffffffc0206180 <do_exit>
ffffffffc020647a:	00007617          	auipc	a2,0x7
ffffffffc020647e:	16e60613          	addi	a2,a2,366 # ffffffffc020d5e8 <etext+0x1ed4>
ffffffffc0206482:	46100593          	li	a1,1121
ffffffffc0206486:	00007517          	auipc	a0,0x7
ffffffffc020648a:	0f250513          	addi	a0,a0,242 # ffffffffc020d578 <etext+0x1e64>
ffffffffc020648e:	fbdf90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206492:	00006617          	auipc	a2,0x6
ffffffffc0206496:	20660613          	addi	a2,a2,518 # ffffffffc020c698 <etext+0xf84>
ffffffffc020649a:	06900593          	li	a1,105
ffffffffc020649e:	00006517          	auipc	a0,0x6
ffffffffc02064a2:	15250513          	addi	a0,a0,338 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc02064a6:	fa5f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc02064aa:	00006617          	auipc	a2,0x6
ffffffffc02064ae:	1c660613          	addi	a2,a2,454 # ffffffffc020c670 <etext+0xf5c>
ffffffffc02064b2:	07700593          	li	a1,119
ffffffffc02064b6:	00006517          	auipc	a0,0x6
ffffffffc02064ba:	13a50513          	addi	a0,a0,314 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc02064be:	f8df90ef          	jal	ffffffffc020044a <__panic>

ffffffffc02064c2 <init_main>:
ffffffffc02064c2:	1141                	addi	sp,sp,-16
ffffffffc02064c4:	00007517          	auipc	a0,0x7
ffffffffc02064c8:	14450513          	addi	a0,a0,324 # ffffffffc020d608 <etext+0x1ef4>
ffffffffc02064cc:	e406                	sd	ra,8(sp)
ffffffffc02064ce:	6b0010ef          	jal	ffffffffc0207b7e <vfs_set_bootfs>
ffffffffc02064d2:	e179                	bnez	a0,ffffffffc0206598 <init_main+0xd6>
ffffffffc02064d4:	d23fb0ef          	jal	ffffffffc02021f6 <nr_free_pages>
ffffffffc02064d8:	ae5fb0ef          	jal	ffffffffc0201fbc <kallocated>
ffffffffc02064dc:	4601                	li	a2,0
ffffffffc02064de:	4581                	li	a1,0
ffffffffc02064e0:	00001517          	auipc	a0,0x1
ffffffffc02064e4:	87e50513          	addi	a0,a0,-1922 # ffffffffc0206d5e <user_main>
ffffffffc02064e8:	c49ff0ef          	jal	ffffffffc0206130 <kernel_thread>
ffffffffc02064ec:	00a04563          	bgtz	a0,ffffffffc02064f6 <init_main+0x34>
ffffffffc02064f0:	a841                	j	ffffffffc0206580 <init_main+0xbe>
ffffffffc02064f2:	701000ef          	jal	ffffffffc02073f2 <schedule>
ffffffffc02064f6:	4581                	li	a1,0
ffffffffc02064f8:	4501                	li	a0,0
ffffffffc02064fa:	de7ff0ef          	jal	ffffffffc02062e0 <do_wait.part.0>
ffffffffc02064fe:	d975                	beqz	a0,ffffffffc02064f2 <init_main+0x30>
ffffffffc0206500:	db5fe0ef          	jal	ffffffffc02052b4 <fs_cleanup>
ffffffffc0206504:	00007517          	auipc	a0,0x7
ffffffffc0206508:	14c50513          	addi	a0,a0,332 # ffffffffc020d650 <etext+0x1f3c>
ffffffffc020650c:	c9bf90ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0206510:	00090797          	auipc	a5,0x90
ffffffffc0206514:	3c07b783          	ld	a5,960(a5) # ffffffffc02968d0 <initproc>
ffffffffc0206518:	7bf8                	ld	a4,240(a5)
ffffffffc020651a:	e339                	bnez	a4,ffffffffc0206560 <init_main+0x9e>
ffffffffc020651c:	7ff8                	ld	a4,248(a5)
ffffffffc020651e:	e329                	bnez	a4,ffffffffc0206560 <init_main+0x9e>
ffffffffc0206520:	1007b703          	ld	a4,256(a5)
ffffffffc0206524:	ef15                	bnez	a4,ffffffffc0206560 <init_main+0x9e>
ffffffffc0206526:	00090697          	auipc	a3,0x90
ffffffffc020652a:	39a6a683          	lw	a3,922(a3) # ffffffffc02968c0 <nr_process>
ffffffffc020652e:	4709                	li	a4,2
ffffffffc0206530:	0ce69163          	bne	a3,a4,ffffffffc02065f2 <init_main+0x130>
ffffffffc0206534:	0008f717          	auipc	a4,0x8f
ffffffffc0206538:	28c70713          	addi	a4,a4,652 # ffffffffc02957c0 <proc_list>
ffffffffc020653c:	6714                	ld	a3,8(a4)
ffffffffc020653e:	0c878793          	addi	a5,a5,200
ffffffffc0206542:	08d79863          	bne	a5,a3,ffffffffc02065d2 <init_main+0x110>
ffffffffc0206546:	6318                	ld	a4,0(a4)
ffffffffc0206548:	06e79563          	bne	a5,a4,ffffffffc02065b2 <init_main+0xf0>
ffffffffc020654c:	00007517          	auipc	a0,0x7
ffffffffc0206550:	1ec50513          	addi	a0,a0,492 # ffffffffc020d738 <etext+0x2024>
ffffffffc0206554:	c53f90ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0206558:	60a2                	ld	ra,8(sp)
ffffffffc020655a:	4501                	li	a0,0
ffffffffc020655c:	0141                	addi	sp,sp,16
ffffffffc020655e:	8082                	ret
ffffffffc0206560:	00007697          	auipc	a3,0x7
ffffffffc0206564:	11868693          	addi	a3,a3,280 # ffffffffc020d678 <etext+0x1f64>
ffffffffc0206568:	00005617          	auipc	a2,0x5
ffffffffc020656c:	5e860613          	addi	a2,a2,1512 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0206570:	4d700593          	li	a1,1239
ffffffffc0206574:	00007517          	auipc	a0,0x7
ffffffffc0206578:	00450513          	addi	a0,a0,4 # ffffffffc020d578 <etext+0x1e64>
ffffffffc020657c:	ecff90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206580:	00007617          	auipc	a2,0x7
ffffffffc0206584:	0b060613          	addi	a2,a2,176 # ffffffffc020d630 <etext+0x1f1c>
ffffffffc0206588:	4ca00593          	li	a1,1226
ffffffffc020658c:	00007517          	auipc	a0,0x7
ffffffffc0206590:	fec50513          	addi	a0,a0,-20 # ffffffffc020d578 <etext+0x1e64>
ffffffffc0206594:	eb7f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206598:	86aa                	mv	a3,a0
ffffffffc020659a:	00007617          	auipc	a2,0x7
ffffffffc020659e:	07660613          	addi	a2,a2,118 # ffffffffc020d610 <etext+0x1efc>
ffffffffc02065a2:	4c200593          	li	a1,1218
ffffffffc02065a6:	00007517          	auipc	a0,0x7
ffffffffc02065aa:	fd250513          	addi	a0,a0,-46 # ffffffffc020d578 <etext+0x1e64>
ffffffffc02065ae:	e9df90ef          	jal	ffffffffc020044a <__panic>
ffffffffc02065b2:	00007697          	auipc	a3,0x7
ffffffffc02065b6:	15668693          	addi	a3,a3,342 # ffffffffc020d708 <etext+0x1ff4>
ffffffffc02065ba:	00005617          	auipc	a2,0x5
ffffffffc02065be:	59660613          	addi	a2,a2,1430 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02065c2:	4da00593          	li	a1,1242
ffffffffc02065c6:	00007517          	auipc	a0,0x7
ffffffffc02065ca:	fb250513          	addi	a0,a0,-78 # ffffffffc020d578 <etext+0x1e64>
ffffffffc02065ce:	e7df90ef          	jal	ffffffffc020044a <__panic>
ffffffffc02065d2:	00007697          	auipc	a3,0x7
ffffffffc02065d6:	10668693          	addi	a3,a3,262 # ffffffffc020d6d8 <etext+0x1fc4>
ffffffffc02065da:	00005617          	auipc	a2,0x5
ffffffffc02065de:	57660613          	addi	a2,a2,1398 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02065e2:	4d900593          	li	a1,1241
ffffffffc02065e6:	00007517          	auipc	a0,0x7
ffffffffc02065ea:	f9250513          	addi	a0,a0,-110 # ffffffffc020d578 <etext+0x1e64>
ffffffffc02065ee:	e5df90ef          	jal	ffffffffc020044a <__panic>
ffffffffc02065f2:	00007697          	auipc	a3,0x7
ffffffffc02065f6:	0d668693          	addi	a3,a3,214 # ffffffffc020d6c8 <etext+0x1fb4>
ffffffffc02065fa:	00005617          	auipc	a2,0x5
ffffffffc02065fe:	55660613          	addi	a2,a2,1366 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0206602:	4d800593          	li	a1,1240
ffffffffc0206606:	00007517          	auipc	a0,0x7
ffffffffc020660a:	f7250513          	addi	a0,a0,-142 # ffffffffc020d578 <etext+0x1e64>
ffffffffc020660e:	e3df90ef          	jal	ffffffffc020044a <__panic>

ffffffffc0206612 <do_execve>:
ffffffffc0206612:	7101                	addi	sp,sp,-512
ffffffffc0206614:	ebd2                	sd	s4,464(sp)
ffffffffc0206616:	ff86                	sd	ra,504(sp)
ffffffffc0206618:	f7a6                	sd	s1,488(sp)
ffffffffc020661a:	fff58a1b          	addiw	s4,a1,-1
ffffffffc020661e:	47fd                	li	a5,31
ffffffffc0206620:	6947e163          	bltu	a5,s4,ffffffffc0206ca2 <do_execve+0x690>
ffffffffc0206624:	f3ca                	sd	s2,480(sp)
ffffffffc0206626:	00090917          	auipc	s2,0x90
ffffffffc020662a:	2a290913          	addi	s2,s2,674 # ffffffffc02968c8 <current>
ffffffffc020662e:	00093783          	ld	a5,0(s2)
ffffffffc0206632:	ff5e                	sd	s7,440(sp)
ffffffffc0206634:	fba2                	sd	s0,496(sp)
ffffffffc0206636:	0287bb83          	ld	s7,40(a5)
ffffffffc020663a:	f766                	sd	s9,424(sp)
ffffffffc020663c:	84aa                	mv	s1,a0
ffffffffc020663e:	8cb2                	mv	s9,a2
ffffffffc0206640:	842e                	mv	s0,a1
ffffffffc0206642:	0088                	addi	a0,sp,64
ffffffffc0206644:	4641                	li	a2,16
ffffffffc0206646:	4581                	li	a1,0
ffffffffc0206648:	064050ef          	jal	ffffffffc020b6ac <memset>
ffffffffc020664c:	000b8c63          	beqz	s7,ffffffffc0206664 <do_execve+0x52>
ffffffffc0206650:	038b8513          	addi	a0,s7,56 # 1038 <_binary_bin_swap_img_size-0x6cc8>
ffffffffc0206654:	feffd0ef          	jal	ffffffffc0204642 <down>
ffffffffc0206658:	00093783          	ld	a5,0(s2)
ffffffffc020665c:	c781                	beqz	a5,ffffffffc0206664 <do_execve+0x52>
ffffffffc020665e:	43dc                	lw	a5,4(a5)
ffffffffc0206660:	04fba823          	sw	a5,80(s7)
ffffffffc0206664:	1a048f63          	beqz	s1,ffffffffc0206822 <do_execve+0x210>
ffffffffc0206668:	8626                	mv	a2,s1
ffffffffc020666a:	46c1                	li	a3,16
ffffffffc020666c:	008c                	addi	a1,sp,64
ffffffffc020666e:	855e                	mv	a0,s7
ffffffffc0206670:	e05fd0ef          	jal	ffffffffc0204474 <copy_string>
ffffffffc0206674:	60050b63          	beqz	a0,ffffffffc0206c8a <do_execve+0x678>
ffffffffc0206678:	e7d6                	sd	s5,456(sp)
ffffffffc020667a:	e3da                	sd	s6,448(sp)
ffffffffc020667c:	00341a93          	slli	s5,s0,0x3
ffffffffc0206680:	8656                	mv	a2,s5
ffffffffc0206682:	4681                	li	a3,0
ffffffffc0206684:	85e6                	mv	a1,s9
ffffffffc0206686:	855e                	mv	a0,s7
ffffffffc0206688:	8b66                	mv	s6,s9
ffffffffc020668a:	cd9fd0ef          	jal	ffffffffc0204362 <user_mem_check>
ffffffffc020668e:	62050d63          	beqz	a0,ffffffffc0206cc8 <do_execve+0x6b6>
ffffffffc0206692:	efce                	sd	s3,472(sp)
ffffffffc0206694:	fb62                	sd	s8,432(sp)
ffffffffc0206696:	4981                	li	s3,0
ffffffffc0206698:	09010c13          	addi	s8,sp,144
ffffffffc020669c:	6505                	lui	a0,0x1
ffffffffc020669e:	923fb0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc02066a2:	84aa                	mv	s1,a0
ffffffffc02066a4:	10050c63          	beqz	a0,ffffffffc02067bc <do_execve+0x1aa>
ffffffffc02066a8:	000b3603          	ld	a2,0(s6)
ffffffffc02066ac:	85aa                	mv	a1,a0
ffffffffc02066ae:	6685                	lui	a3,0x1
ffffffffc02066b0:	855e                	mv	a0,s7
ffffffffc02066b2:	dc3fd0ef          	jal	ffffffffc0204474 <copy_string>
ffffffffc02066b6:	16050163          	beqz	a0,ffffffffc0206818 <do_execve+0x206>
ffffffffc02066ba:	009c3023          	sd	s1,0(s8)
ffffffffc02066be:	2985                	addiw	s3,s3,1
ffffffffc02066c0:	0c21                	addi	s8,s8,8
ffffffffc02066c2:	0b21                	addi	s6,s6,8
ffffffffc02066c4:	fd341ce3          	bne	s0,s3,ffffffffc020669c <do_execve+0x8a>
ffffffffc02066c8:	f36a                	sd	s10,416(sp)
ffffffffc02066ca:	ef6e                	sd	s11,408(sp)
ffffffffc02066cc:	000cb483          	ld	s1,0(s9)
ffffffffc02066d0:	0a0b8963          	beqz	s7,ffffffffc0206782 <do_execve+0x170>
ffffffffc02066d4:	038b8513          	addi	a0,s7,56
ffffffffc02066d8:	f67fd0ef          	jal	ffffffffc020463e <up>
ffffffffc02066dc:	00093783          	ld	a5,0(s2)
ffffffffc02066e0:	040ba823          	sw	zero,80(s7)
ffffffffc02066e4:	1487b503          	ld	a0,328(a5)
ffffffffc02066e8:	ca9fe0ef          	jal	ffffffffc0205390 <files_closeall>
ffffffffc02066ec:	8526                	mv	a0,s1
ffffffffc02066ee:	4581                	li	a1,0
ffffffffc02066f0:	f31fe0ef          	jal	ffffffffc0205620 <sysfile_open>
ffffffffc02066f4:	89aa                	mv	s3,a0
ffffffffc02066f6:	16054463          	bltz	a0,ffffffffc020685e <do_execve+0x24c>
ffffffffc02066fa:	00090797          	auipc	a5,0x90
ffffffffc02066fe:	19e7b783          	ld	a5,414(a5) # ffffffffc0296898 <boot_pgdir_pa>
ffffffffc0206702:	577d                	li	a4,-1
ffffffffc0206704:	177e                	slli	a4,a4,0x3f
ffffffffc0206706:	83b1                	srli	a5,a5,0xc
ffffffffc0206708:	8fd9                	or	a5,a5,a4
ffffffffc020670a:	18079073          	csrw	satp,a5
ffffffffc020670e:	030ba783          	lw	a5,48(s7)
ffffffffc0206712:	37fd                	addiw	a5,a5,-1
ffffffffc0206714:	02fba823          	sw	a5,48(s7)
ffffffffc0206718:	38078d63          	beqz	a5,ffffffffc0206ab2 <do_execve+0x4a0>
ffffffffc020671c:	00093783          	ld	a5,0(s2)
ffffffffc0206720:	0207b423          	sd	zero,40(a5)
ffffffffc0206724:	d9efd0ef          	jal	ffffffffc0203cc2 <mm_create>
ffffffffc0206728:	8b2a                	mv	s6,a0
ffffffffc020672a:	5a050663          	beqz	a0,ffffffffc0206cd6 <do_execve+0x6c4>
ffffffffc020672e:	d00ff0ef          	jal	ffffffffc0205c2e <setup_pgdir>
ffffffffc0206732:	54f1                	li	s1,-4
ffffffffc0206734:	ed09                	bnez	a0,ffffffffc020674e <do_execve+0x13c>
ffffffffc0206736:	4601                	li	a2,0
ffffffffc0206738:	4581                	li	a1,0
ffffffffc020673a:	854e                	mv	a0,s3
ffffffffc020673c:	99cff0ef          	jal	ffffffffc02058d8 <sysfile_seek>
ffffffffc0206740:	84aa                	mv	s1,a0
ffffffffc0206742:	0e050e63          	beqz	a0,ffffffffc020683e <do_execve+0x22c>
ffffffffc0206746:	018b3503          	ld	a0,24(s6)
ffffffffc020674a:	c6cff0ef          	jal	ffffffffc0205bb6 <put_pgdir.isra.0>
ffffffffc020674e:	855a                	mv	a0,s6
ffffffffc0206750:	ebefd0ef          	jal	ffffffffc0203e0e <mm_destroy>
ffffffffc0206754:	854e                	mv	a0,s3
ffffffffc0206756:	f01fe0ef          	jal	ffffffffc0205656 <sysfile_close>
ffffffffc020675a:	08010913          	addi	s2,sp,128
ffffffffc020675e:	020a1793          	slli	a5,s4,0x20
ffffffffc0206762:	01d7da13          	srli	s4,a5,0x1d
ffffffffc0206766:	9956                	add	s2,s2,s5
ffffffffc0206768:	0120                	addi	s0,sp,136
ffffffffc020676a:	41490933          	sub	s2,s2,s4
ffffffffc020676e:	9456                	add	s0,s0,s5
ffffffffc0206770:	6008                	ld	a0,0(s0)
ffffffffc0206772:	1461                	addi	s0,s0,-8
ffffffffc0206774:	8f3fb0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0206778:	fe891ce3          	bne	s2,s0,ffffffffc0206770 <do_execve+0x15e>
ffffffffc020677c:	8526                	mv	a0,s1
ffffffffc020677e:	a03ff0ef          	jal	ffffffffc0206180 <do_exit>
ffffffffc0206782:	00093783          	ld	a5,0(s2)
ffffffffc0206786:	1487b503          	ld	a0,328(a5)
ffffffffc020678a:	c07fe0ef          	jal	ffffffffc0205390 <files_closeall>
ffffffffc020678e:	8526                	mv	a0,s1
ffffffffc0206790:	4581                	li	a1,0
ffffffffc0206792:	e8ffe0ef          	jal	ffffffffc0205620 <sysfile_open>
ffffffffc0206796:	89aa                	mv	s3,a0
ffffffffc0206798:	0c054363          	bltz	a0,ffffffffc020685e <do_execve+0x24c>
ffffffffc020679c:	00093783          	ld	a5,0(s2)
ffffffffc02067a0:	779c                	ld	a5,40(a5)
ffffffffc02067a2:	d3c9                	beqz	a5,ffffffffc0206724 <do_execve+0x112>
ffffffffc02067a4:	00007617          	auipc	a2,0x7
ffffffffc02067a8:	fc460613          	addi	a2,a2,-60 # ffffffffc020d768 <etext+0x2054>
ffffffffc02067ac:	2df00593          	li	a1,735
ffffffffc02067b0:	00007517          	auipc	a0,0x7
ffffffffc02067b4:	dc850513          	addi	a0,a0,-568 # ffffffffc020d578 <etext+0x1e64>
ffffffffc02067b8:	c93f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc02067bc:	54f1                	li	s1,-4
ffffffffc02067be:	02098663          	beqz	s3,ffffffffc02067ea <do_execve+0x1d8>
ffffffffc02067c2:	00399793          	slli	a5,s3,0x3
ffffffffc02067c6:	39fd                	addiw	s3,s3,-1
ffffffffc02067c8:	08010913          	addi	s2,sp,128
ffffffffc02067cc:	02099713          	slli	a4,s3,0x20
ffffffffc02067d0:	01d75993          	srli	s3,a4,0x1d
ffffffffc02067d4:	993e                	add	s2,s2,a5
ffffffffc02067d6:	0120                	addi	s0,sp,136
ffffffffc02067d8:	41390933          	sub	s2,s2,s3
ffffffffc02067dc:	943e                	add	s0,s0,a5
ffffffffc02067de:	6008                	ld	a0,0(s0)
ffffffffc02067e0:	1461                	addi	s0,s0,-8
ffffffffc02067e2:	885fb0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc02067e6:	ff241ce3          	bne	s0,s2,ffffffffc02067de <do_execve+0x1cc>
ffffffffc02067ea:	69fe                	ld	s3,472(sp)
ffffffffc02067ec:	7c5a                	ld	s8,432(sp)
ffffffffc02067ee:	000b8863          	beqz	s7,ffffffffc02067fe <do_execve+0x1ec>
ffffffffc02067f2:	038b8513          	addi	a0,s7,56
ffffffffc02067f6:	e49fd0ef          	jal	ffffffffc020463e <up>
ffffffffc02067fa:	040ba823          	sw	zero,80(s7)
ffffffffc02067fe:	745e                	ld	s0,496(sp)
ffffffffc0206800:	791e                	ld	s2,480(sp)
ffffffffc0206802:	6abe                	ld	s5,456(sp)
ffffffffc0206804:	6b1e                	ld	s6,448(sp)
ffffffffc0206806:	7bfa                	ld	s7,440(sp)
ffffffffc0206808:	7cba                	ld	s9,424(sp)
ffffffffc020680a:	70fe                	ld	ra,504(sp)
ffffffffc020680c:	6a5e                	ld	s4,464(sp)
ffffffffc020680e:	8526                	mv	a0,s1
ffffffffc0206810:	74be                	ld	s1,488(sp)
ffffffffc0206812:	20010113          	addi	sp,sp,512
ffffffffc0206816:	8082                	ret
ffffffffc0206818:	8526                	mv	a0,s1
ffffffffc020681a:	84dfb0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020681e:	54f5                	li	s1,-3
ffffffffc0206820:	bf79                	j	ffffffffc02067be <do_execve+0x1ac>
ffffffffc0206822:	00093783          	ld	a5,0(s2)
ffffffffc0206826:	00007617          	auipc	a2,0x7
ffffffffc020682a:	f3260613          	addi	a2,a2,-206 # ffffffffc020d758 <etext+0x2044>
ffffffffc020682e:	45c1                	li	a1,16
ffffffffc0206830:	43d4                	lw	a3,4(a5)
ffffffffc0206832:	0088                	addi	a0,sp,64
ffffffffc0206834:	e7d6                	sd	s5,456(sp)
ffffffffc0206836:	e3da                	sd	s6,448(sp)
ffffffffc0206838:	573040ef          	jal	ffffffffc020b5aa <snprintf>
ffffffffc020683c:	b581                	j	ffffffffc020667c <do_execve+0x6a>
ffffffffc020683e:	04000613          	li	a2,64
ffffffffc0206842:	088c                	addi	a1,sp,80
ffffffffc0206844:	854e                	mv	a0,s3
ffffffffc0206846:	e15fe0ef          	jal	ffffffffc020565a <sysfile_read>
ffffffffc020684a:	04000793          	li	a5,64
ffffffffc020684e:	00f50a63          	beq	a0,a5,ffffffffc0206862 <do_execve+0x250>
ffffffffc0206852:	0005049b          	sext.w	s1,a0
ffffffffc0206856:	ee0548e3          	bltz	a0,ffffffffc0206746 <do_execve+0x134>
ffffffffc020685a:	54fd                	li	s1,-1
ffffffffc020685c:	b5ed                	j	ffffffffc0206746 <do_execve+0x134>
ffffffffc020685e:	84ce                	mv	s1,s3
ffffffffc0206860:	bdd5                	j	ffffffffc0206754 <do_execve+0x142>
ffffffffc0206862:	4746                	lw	a4,80(sp)
ffffffffc0206864:	464c47b7          	lui	a5,0x464c4
ffffffffc0206868:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644f27f>
ffffffffc020686c:	54e1                	li	s1,-8
ffffffffc020686e:	ecf71ce3          	bne	a4,a5,ffffffffc0206746 <do_execve+0x134>
ffffffffc0206872:	03800513          	li	a0,56
ffffffffc0206876:	f4afb0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc020687a:	f42a                	sd	a0,40(sp)
ffffffffc020687c:	44050463          	beqz	a0,ffffffffc0206cc4 <do_execve+0x6b2>
ffffffffc0206880:	08815783          	lhu	a5,136(sp)
ffffffffc0206884:	4c81                	li	s9,0
ffffffffc0206886:	cfb5                	beqz	a5,ffffffffc0206902 <do_execve+0x2f0>
ffffffffc0206888:	e456                	sd	s5,8(sp)
ffffffffc020688a:	e852                	sd	s4,16(sp)
ffffffffc020688c:	f822                	sd	s0,48(sp)
ffffffffc020688e:	08615783          	lhu	a5,134(sp)
ffffffffc0206892:	75c6                	ld	a1,112(sp)
ffffffffc0206894:	4601                	li	a2,0
ffffffffc0206896:	039787bb          	mulw	a5,a5,s9
ffffffffc020689a:	854e                	mv	a0,s3
ffffffffc020689c:	1782                	slli	a5,a5,0x20
ffffffffc020689e:	9381                	srli	a5,a5,0x20
ffffffffc02068a0:	95be                	add	a1,a1,a5
ffffffffc02068a2:	836ff0ef          	jal	ffffffffc02058d8 <sysfile_seek>
ffffffffc02068a6:	22051163          	bnez	a0,ffffffffc0206ac8 <do_execve+0x4b6>
ffffffffc02068aa:	7422                	ld	s0,40(sp)
ffffffffc02068ac:	03800613          	li	a2,56
ffffffffc02068b0:	854e                	mv	a0,s3
ffffffffc02068b2:	85a2                	mv	a1,s0
ffffffffc02068b4:	da7fe0ef          	jal	ffffffffc020565a <sysfile_read>
ffffffffc02068b8:	03800793          	li	a5,56
ffffffffc02068bc:	02f50063          	beq	a0,a5,ffffffffc02068dc <do_execve+0x2ca>
ffffffffc02068c0:	6aa2                	ld	s5,8(sp)
ffffffffc02068c2:	6a42                	ld	s4,16(sp)
ffffffffc02068c4:	0005049b          	sext.w	s1,a0
ffffffffc02068c8:	00054363          	bltz	a0,ffffffffc02068ce <do_execve+0x2bc>
ffffffffc02068cc:	54fd                	li	s1,-1
ffffffffc02068ce:	7522                	ld	a0,40(sp)
ffffffffc02068d0:	f96fb0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc02068d4:	855a                	mv	a0,s6
ffffffffc02068d6:	eeefd0ef          	jal	ffffffffc0203fc4 <exit_mmap>
ffffffffc02068da:	b5b5                	j	ffffffffc0206746 <do_execve+0x134>
ffffffffc02068dc:	401c                	lw	a5,0(s0)
ffffffffc02068de:	4705                	li	a4,1
ffffffffc02068e0:	00e79963          	bne	a5,a4,ffffffffc02068f2 <do_execve+0x2e0>
ffffffffc02068e4:	7722                	ld	a4,40(sp)
ffffffffc02068e6:	731c                	ld	a5,32(a4)
ffffffffc02068e8:	7710                	ld	a2,40(a4)
ffffffffc02068ea:	3ef66e63          	bltu	a2,a5,ffffffffc0206ce6 <do_execve+0x6d4>
ffffffffc02068ee:	1e079163          	bnez	a5,ffffffffc0206ad0 <do_execve+0x4be>
ffffffffc02068f2:	08815783          	lhu	a5,136(sp)
ffffffffc02068f6:	2c85                	addiw	s9,s9,1
ffffffffc02068f8:	f8fcebe3          	bltu	s9,a5,ffffffffc020688e <do_execve+0x27c>
ffffffffc02068fc:	6aa2                	ld	s5,8(sp)
ffffffffc02068fe:	6a42                	ld	s4,16(sp)
ffffffffc0206900:	7442                	ld	s0,48(sp)
ffffffffc0206902:	7522                	ld	a0,40(sp)
ffffffffc0206904:	f62fb0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0206908:	855a                	mv	a0,s6
ffffffffc020690a:	4701                	li	a4,0
ffffffffc020690c:	46ad                	li	a3,11
ffffffffc020690e:	00100637          	lui	a2,0x100
ffffffffc0206912:	7ff005b7          	lui	a1,0x7ff00
ffffffffc0206916:	d4afd0ef          	jal	ffffffffc0203e60 <mm_map>
ffffffffc020691a:	84aa                	mv	s1,a0
ffffffffc020691c:	fd45                	bnez	a0,ffffffffc02068d4 <do_execve+0x2c2>
ffffffffc020691e:	7ffffbb7          	lui	s7,0x7ffff
ffffffffc0206922:	7fffbc37          	lui	s8,0x7fffb
ffffffffc0206926:	018b3503          	ld	a0,24(s6)
ffffffffc020692a:	467d                	li	a2,31
ffffffffc020692c:	85de                	mv	a1,s7
ffffffffc020692e:	ab2fd0ef          	jal	ffffffffc0203be0 <pgdir_alloc_page>
ffffffffc0206932:	40050663          	beqz	a0,ffffffffc0206d3e <do_execve+0x72c>
ffffffffc0206936:	800b8b93          	addi	s7,s7,-2048 # 7fffe800 <_binary_bin_sfs_img_size+0x7ff89500>
ffffffffc020693a:	800b8b93          	addi	s7,s7,-2048
ffffffffc020693e:	ff8b94e3          	bne	s7,s8,ffffffffc0206926 <do_execve+0x314>
ffffffffc0206942:	030b2783          	lw	a5,48(s6)
ffffffffc0206946:	00093603          	ld	a2,0(s2)
ffffffffc020694a:	018b3683          	ld	a3,24(s6)
ffffffffc020694e:	2785                	addiw	a5,a5,1
ffffffffc0206950:	02fb2823          	sw	a5,48(s6)
ffffffffc0206954:	03663423          	sd	s6,40(a2) # 100028 <_binary_bin_sfs_img_size+0x8ad28>
ffffffffc0206958:	c02007b7          	lui	a5,0xc0200
ffffffffc020695c:	38f6eb63          	bltu	a3,a5,ffffffffc0206cf2 <do_execve+0x6e0>
ffffffffc0206960:	00090797          	auipc	a5,0x90
ffffffffc0206964:	f487b783          	ld	a5,-184(a5) # ffffffffc02968a8 <va_pa_offset>
ffffffffc0206968:	577d                	li	a4,-1
ffffffffc020696a:	177e                	slli	a4,a4,0x3f
ffffffffc020696c:	8e9d                	sub	a3,a3,a5
ffffffffc020696e:	00c6d793          	srli	a5,a3,0xc
ffffffffc0206972:	f654                	sd	a3,168(a2)
ffffffffc0206974:	8fd9                	or	a5,a5,a4
ffffffffc0206976:	18079073          	csrw	satp,a5
ffffffffc020697a:	12000073          	sfence.vma
ffffffffc020697e:	4c01                	li	s8,0
ffffffffc0206980:	09010b93          	addi	s7,sp,144
ffffffffc0206984:	4b01                	li	s6,0
ffffffffc0206986:	000bb503          	ld	a0,0(s7)
ffffffffc020698a:	2b05                	addiw	s6,s6,1
ffffffffc020698c:	0ba1                	addi	s7,s7,8
ffffffffc020698e:	46b040ef          	jal	ffffffffc020b5f8 <strlen>
ffffffffc0206992:	00150793          	addi	a5,a0,1
ffffffffc0206996:	01878c3b          	addw	s8,a5,s8
ffffffffc020699a:	fe8b46e3          	blt	s6,s0,ffffffffc0206986 <do_execve+0x374>
ffffffffc020699e:	00341793          	slli	a5,s0,0x3
ffffffffc02069a2:	27dd                	addiw	a5,a5,23
ffffffffc02069a4:	01878c3b          	addw	s8,a5,s8
ffffffffc02069a8:	4b85                	li	s7,1
ffffffffc02069aa:	ff0c7c13          	andi	s8,s8,-16
ffffffffc02069ae:	0bfe                	slli	s7,s7,0x1f
ffffffffc02069b0:	418b8bb3          	sub	s7,s7,s8
ffffffffc02069b4:	091c                	addi	a5,sp,144
ffffffffc02069b6:	008a8b13          	addi	s6,s5,8
ffffffffc02069ba:	40fb87b3          	sub	a5,s7,a5
ffffffffc02069be:	8dd2                	mv	s11,s4
ffffffffc02069c0:	9b5e                	add	s6,s6,s7
ffffffffc02069c2:	8a26                	mv	s4,s1
ffffffffc02069c4:	e03e                	sd	a5,0(sp)
ffffffffc02069c6:	84a2                	mv	s1,s0
ffffffffc02069c8:	09010c93          	addi	s9,sp,144
ffffffffc02069cc:	8d4e                	mv	s10,s3
ffffffffc02069ce:	4401                	li	s0,0
ffffffffc02069d0:	000cb983          	ld	s3,0(s9)
ffffffffc02069d4:	2405                	addiw	s0,s0,1
ffffffffc02069d6:	854e                	mv	a0,s3
ffffffffc02069d8:	421040ef          	jal	ffffffffc020b5f8 <strlen>
ffffffffc02069dc:	0015079b          	addiw	a5,a0,1
ffffffffc02069e0:	40fb0b33          	sub	s6,s6,a5
ffffffffc02069e4:	85ce                	mv	a1,s3
ffffffffc02069e6:	855a                	mv	a0,s6
ffffffffc02069e8:	445040ef          	jal	ffffffffc020b62c <strcpy>
ffffffffc02069ec:	6782                	ld	a5,0(sp)
ffffffffc02069ee:	97e6                	add	a5,a5,s9
ffffffffc02069f0:	0167b023          	sd	s6,0(a5)
ffffffffc02069f4:	0ca1                	addi	s9,s9,8
ffffffffc02069f6:	fc944de3          	blt	s0,s1,ffffffffc02069d0 <do_execve+0x3be>
ffffffffc02069fa:	00093783          	ld	a5,0(s2)
ffffffffc02069fe:	015b8733          	add	a4,s7,s5
ffffffffc0206a02:	00073023          	sd	zero,0(a4)
ffffffffc0206a06:	0a07bb03          	ld	s6,160(a5)
ffffffffc0206a0a:	12000613          	li	a2,288
ffffffffc0206a0e:	4581                	li	a1,0
ffffffffc0206a10:	855a                	mv	a0,s6
ffffffffc0206a12:	49b040ef          	jal	ffffffffc020b6ac <memset>
ffffffffc0206a16:	100b3783          	ld	a5,256(s6)
ffffffffc0206a1a:	80000737          	lui	a4,0x80000
ffffffffc0206a1e:	76a6                	ld	a3,104(sp)
ffffffffc0206a20:	4187073b          	subw	a4,a4,s8
ffffffffc0206a24:	1702                	slli	a4,a4,0x20
ffffffffc0206a26:	efd7f793          	andi	a5,a5,-259
ffffffffc0206a2a:	8426                	mv	s0,s1
ffffffffc0206a2c:	0207e793          	ori	a5,a5,32
ffffffffc0206a30:	9301                	srli	a4,a4,0x20
ffffffffc0206a32:	048b3823          	sd	s0,80(s6)
ffffffffc0206a36:	10fb3023          	sd	a5,256(s6)
ffffffffc0206a3a:	057b3c23          	sd	s7,88(s6)
ffffffffc0206a3e:	060b3023          	sd	zero,96(s6)
ffffffffc0206a42:	856a                	mv	a0,s10
ffffffffc0206a44:	00eb3823          	sd	a4,16(s6)
ffffffffc0206a48:	10db3423          	sd	a3,264(s6)
ffffffffc0206a4c:	c0bfe0ef          	jal	ffffffffc0205656 <sysfile_close>
ffffffffc0206a50:	08010993          	addi	s3,sp,128
ffffffffc0206a54:	020d9793          	slli	a5,s11,0x20
ffffffffc0206a58:	84d2                	mv	s1,s4
ffffffffc0206a5a:	99d6                	add	s3,s3,s5
ffffffffc0206a5c:	01d7da13          	srli	s4,a5,0x1d
ffffffffc0206a60:	0120                	addi	s0,sp,136
ffffffffc0206a62:	414989b3          	sub	s3,s3,s4
ffffffffc0206a66:	9456                	add	s0,s0,s5
ffffffffc0206a68:	6008                	ld	a0,0(s0)
ffffffffc0206a6a:	1461                	addi	s0,s0,-8
ffffffffc0206a6c:	dfafb0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0206a70:	ff341ce3          	bne	s0,s3,ffffffffc0206a68 <do_execve+0x456>
ffffffffc0206a74:	00093403          	ld	s0,0(s2)
ffffffffc0206a78:	4641                	li	a2,16
ffffffffc0206a7a:	4581                	li	a1,0
ffffffffc0206a7c:	0b440413          	addi	s0,s0,180
ffffffffc0206a80:	8522                	mv	a0,s0
ffffffffc0206a82:	42b040ef          	jal	ffffffffc020b6ac <memset>
ffffffffc0206a86:	008c                	addi	a1,sp,64
ffffffffc0206a88:	8522                	mv	a0,s0
ffffffffc0206a8a:	463d                	li	a2,15
ffffffffc0206a8c:	471040ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc0206a90:	70fe                	ld	ra,504(sp)
ffffffffc0206a92:	745e                	ld	s0,496(sp)
ffffffffc0206a94:	791e                	ld	s2,480(sp)
ffffffffc0206a96:	69fe                	ld	s3,472(sp)
ffffffffc0206a98:	6abe                	ld	s5,456(sp)
ffffffffc0206a9a:	6b1e                	ld	s6,448(sp)
ffffffffc0206a9c:	7bfa                	ld	s7,440(sp)
ffffffffc0206a9e:	7c5a                	ld	s8,432(sp)
ffffffffc0206aa0:	7cba                	ld	s9,424(sp)
ffffffffc0206aa2:	7d1a                	ld	s10,416(sp)
ffffffffc0206aa4:	6dfa                	ld	s11,408(sp)
ffffffffc0206aa6:	6a5e                	ld	s4,464(sp)
ffffffffc0206aa8:	8526                	mv	a0,s1
ffffffffc0206aaa:	74be                	ld	s1,488(sp)
ffffffffc0206aac:	20010113          	addi	sp,sp,512
ffffffffc0206ab0:	8082                	ret
ffffffffc0206ab2:	855e                	mv	a0,s7
ffffffffc0206ab4:	d10fd0ef          	jal	ffffffffc0203fc4 <exit_mmap>
ffffffffc0206ab8:	018bb503          	ld	a0,24(s7)
ffffffffc0206abc:	8faff0ef          	jal	ffffffffc0205bb6 <put_pgdir.isra.0>
ffffffffc0206ac0:	855e                	mv	a0,s7
ffffffffc0206ac2:	b4cfd0ef          	jal	ffffffffc0203e0e <mm_destroy>
ffffffffc0206ac6:	b999                	j	ffffffffc020671c <do_execve+0x10a>
ffffffffc0206ac8:	6aa2                	ld	s5,8(sp)
ffffffffc0206aca:	6a42                	ld	s4,16(sp)
ffffffffc0206acc:	84aa                	mv	s1,a0
ffffffffc0206ace:	b501                	j	ffffffffc02068ce <do_execve+0x2bc>
ffffffffc0206ad0:	435c                	lw	a5,4(a4)
ffffffffc0206ad2:	0027971b          	slliw	a4,a5,0x2
ffffffffc0206ad6:	0027f693          	andi	a3,a5,2
ffffffffc0206ada:	8b11                	andi	a4,a4,4
ffffffffc0206adc:	8b91                	andi	a5,a5,4
ffffffffc0206ade:	cef9                	beqz	a3,ffffffffc0206bbc <do_execve+0x5aa>
ffffffffc0206ae0:	1c079d63          	bnez	a5,ffffffffc0206cba <do_execve+0x6a8>
ffffffffc0206ae4:	47dd                	li	a5,23
ffffffffc0206ae6:	00276693          	ori	a3,a4,2
ffffffffc0206aea:	ec3e                	sd	a5,24(sp)
ffffffffc0206aec:	c709                	beqz	a4,ffffffffc0206af6 <do_execve+0x4e4>
ffffffffc0206aee:	67e2                	ld	a5,24(sp)
ffffffffc0206af0:	0087e793          	ori	a5,a5,8
ffffffffc0206af4:	ec3e                	sd	a5,24(sp)
ffffffffc0206af6:	7422                	ld	s0,40(sp)
ffffffffc0206af8:	4701                	li	a4,0
ffffffffc0206afa:	855a                	mv	a0,s6
ffffffffc0206afc:	680c                	ld	a1,16(s0)
ffffffffc0206afe:	b62fd0ef          	jal	ffffffffc0203e60 <mm_map>
ffffffffc0206b02:	f179                	bnez	a0,ffffffffc0206ac8 <do_execve+0x4b6>
ffffffffc0206b04:	01043d03          	ld	s10,16(s0)
ffffffffc0206b08:	7018                	ld	a4,32(s0)
ffffffffc0206b0a:	00ed04b3          	add	s1,s10,a4
ffffffffc0206b0e:	1e9d7063          	bgeu	s10,s1,ffffffffc0206cee <do_execve+0x6dc>
ffffffffc0206b12:	57fd                	li	a5,-1
ffffffffc0206b14:	6400                	ld	s0,8(s0)
ffffffffc0206b16:	83b1                	srli	a5,a5,0xc
ffffffffc0206b18:	8dea                	mv	s11,s10
ffffffffc0206b1a:	f03e                	sd	a5,32(sp)
ffffffffc0206b1c:	6c05                	lui	s8,0x1
ffffffffc0206b1e:	00090a97          	auipc	s5,0x90
ffffffffc0206b22:	d9aa8a93          	addi	s5,s5,-614 # ffffffffc02968b8 <pages>
ffffffffc0206b26:	00009a17          	auipc	s4,0x9
ffffffffc0206b2a:	daaa0a13          	addi	s4,s4,-598 # ffffffffc020f8d0 <nbase>
ffffffffc0206b2e:	8d26                	mv	s10,s1
ffffffffc0206b30:	e04e                	sd	s3,0(sp)
ffffffffc0206b32:	fc66                	sd	s9,56(sp)
ffffffffc0206b34:	8bda                	mv	s7,s6
ffffffffc0206b36:	77fd                	lui	a5,0xfffff
ffffffffc0206b38:	018bb503          	ld	a0,24(s7)
ffffffffc0206b3c:	6662                	ld	a2,24(sp)
ffffffffc0206b3e:	00fdf4b3          	and	s1,s11,a5
ffffffffc0206b42:	85a6                	mv	a1,s1
ffffffffc0206b44:	89cfd0ef          	jal	ffffffffc0203be0 <pgdir_alloc_page>
ffffffffc0206b48:	14050f63          	beqz	a0,ffffffffc0206ca6 <do_execve+0x694>
ffffffffc0206b4c:	409d89b3          	sub	s3,s11,s1
ffffffffc0206b50:	94e2                	add	s1,s1,s8
ffffffffc0206b52:	413c0b33          	sub	s6,s8,s3
ffffffffc0206b56:	009d7463          	bgeu	s10,s1,ffffffffc0206b5e <do_execve+0x54c>
ffffffffc0206b5a:	41bd0b33          	sub	s6,s10,s11
ffffffffc0206b5e:	000ab583          	ld	a1,0(s5)
ffffffffc0206b62:	000a3603          	ld	a2,0(s4)
ffffffffc0206b66:	7782                	ld	a5,32(sp)
ffffffffc0206b68:	40b50cb3          	sub	s9,a0,a1
ffffffffc0206b6c:	406cdc93          	srai	s9,s9,0x6
ffffffffc0206b70:	00090697          	auipc	a3,0x90
ffffffffc0206b74:	d406b683          	ld	a3,-704(a3) # ffffffffc02968b0 <npage>
ffffffffc0206b78:	9cb2                	add	s9,s9,a2
ffffffffc0206b7a:	00fcf633          	and	a2,s9,a5
ffffffffc0206b7e:	0cb2                	slli	s9,s9,0xc
ffffffffc0206b80:	1ad67263          	bgeu	a2,a3,ffffffffc0206d24 <do_execve+0x712>
ffffffffc0206b84:	6502                	ld	a0,0(sp)
ffffffffc0206b86:	4601                	li	a2,0
ffffffffc0206b88:	85a2                	mv	a1,s0
ffffffffc0206b8a:	00090497          	auipc	s1,0x90
ffffffffc0206b8e:	d1e4b483          	ld	s1,-738(s1) # ffffffffc02968a8 <va_pa_offset>
ffffffffc0206b92:	d47fe0ef          	jal	ffffffffc02058d8 <sysfile_seek>
ffffffffc0206b96:	e565                	bnez	a0,ffffffffc0206c7e <do_execve+0x66c>
ffffffffc0206b98:	6502                	ld	a0,0(sp)
ffffffffc0206b9a:	009c85b3          	add	a1,s9,s1
ffffffffc0206b9e:	95ce                	add	a1,a1,s3
ffffffffc0206ba0:	865a                	mv	a2,s6
ffffffffc0206ba2:	ab9fe0ef          	jal	ffffffffc020565a <sysfile_read>
ffffffffc0206ba6:	02ab0263          	beq	s6,a0,ffffffffc0206bca <do_execve+0x5b8>
ffffffffc0206baa:	6aa2                	ld	s5,8(sp)
ffffffffc0206bac:	6982                	ld	s3,0(sp)
ffffffffc0206bae:	6a42                	ld	s4,16(sp)
ffffffffc0206bb0:	8b5e                	mv	s6,s7
ffffffffc0206bb2:	0005049b          	sext.w	s1,a0
ffffffffc0206bb6:	d0055be3          	bgez	a0,ffffffffc02068cc <do_execve+0x2ba>
ffffffffc0206bba:	bb11                	j	ffffffffc02068ce <do_execve+0x2bc>
ffffffffc0206bbc:	0e078b63          	beqz	a5,ffffffffc0206cb2 <do_execve+0x6a0>
ffffffffc0206bc0:	47cd                	li	a5,19
ffffffffc0206bc2:	00176693          	ori	a3,a4,1
ffffffffc0206bc6:	ec3e                	sd	a5,24(sp)
ffffffffc0206bc8:	b715                	j	ffffffffc0206aec <do_execve+0x4da>
ffffffffc0206bca:	9dda                	add	s11,s11,s6
ffffffffc0206bcc:	945a                	add	s0,s0,s6
ffffffffc0206bce:	f7ade4e3          	bltu	s11,s10,ffffffffc0206b36 <do_execve+0x524>
ffffffffc0206bd2:	77a2                	ld	a5,40(sp)
ffffffffc0206bd4:	6982                	ld	s3,0(sp)
ffffffffc0206bd6:	7ce2                	ld	s9,56(sp)
ffffffffc0206bd8:	6b90                	ld	a2,16(a5)
ffffffffc0206bda:	8d6e                	mv	s10,s11
ffffffffc0206bdc:	8b5e                	mv	s6,s7
ffffffffc0206bde:	77a2                	ld	a5,40(sp)
ffffffffc0206be0:	779c                	ld	a5,40(a5)
ffffffffc0206be2:	00f60a33          	add	s4,a2,a5
ffffffffc0206be6:	d14d76e3          	bgeu	s10,s4,ffffffffc02068f2 <do_execve+0x2e0>
ffffffffc0206bea:	54fd                	li	s1,-1
ffffffffc0206bec:	00c4dd93          	srli	s11,s1,0xc
ffffffffc0206bf0:	8bea                	mv	s7,s10
ffffffffc0206bf2:	e04e                	sd	s3,0(sp)
ffffffffc0206bf4:	6405                	lui	s0,0x1
ffffffffc0206bf6:	69e2                	ld	s3,24(sp)
ffffffffc0206bf8:	00090497          	auipc	s1,0x90
ffffffffc0206bfc:	cc048493          	addi	s1,s1,-832 # ffffffffc02968b8 <pages>
ffffffffc0206c00:	00009c17          	auipc	s8,0x9
ffffffffc0206c04:	cd0c0c13          	addi	s8,s8,-816 # ffffffffc020f8d0 <nbase>
ffffffffc0206c08:	00090a97          	auipc	s5,0x90
ffffffffc0206c0c:	ca8a8a93          	addi	s5,s5,-856 # ffffffffc02968b0 <npage>
ffffffffc0206c10:	8d66                	mv	s10,s9
ffffffffc0206c12:	a0b9                	j	ffffffffc0206c60 <do_execve+0x64e>
ffffffffc0206c14:	419b86b3          	sub	a3,s7,s9
ffffffffc0206c18:	008c85b3          	add	a1,s9,s0
ffffffffc0206c1c:	40d40cb3          	sub	s9,s0,a3
ffffffffc0206c20:	00ba7463          	bgeu	s4,a1,ffffffffc0206c28 <do_execve+0x616>
ffffffffc0206c24:	417a0cb3          	sub	s9,s4,s7
ffffffffc0206c28:	609c                	ld	a5,0(s1)
ffffffffc0206c2a:	000c3803          	ld	a6,0(s8)
ffffffffc0206c2e:	000ab583          	ld	a1,0(s5)
ffffffffc0206c32:	40f507b3          	sub	a5,a0,a5
ffffffffc0206c36:	8799                	srai	a5,a5,0x6
ffffffffc0206c38:	97c2                	add	a5,a5,a6
ffffffffc0206c3a:	01b7f533          	and	a0,a5,s11
ffffffffc0206c3e:	07b2                	slli	a5,a5,0xc
ffffffffc0206c40:	0cb57563          	bgeu	a0,a1,ffffffffc0206d0a <do_execve+0x6f8>
ffffffffc0206c44:	00090597          	auipc	a1,0x90
ffffffffc0206c48:	c645b583          	ld	a1,-924(a1) # ffffffffc02968a8 <va_pa_offset>
ffffffffc0206c4c:	8666                	mv	a2,s9
ffffffffc0206c4e:	9be6                	add	s7,s7,s9
ffffffffc0206c50:	97ae                	add	a5,a5,a1
ffffffffc0206c52:	00d78533          	add	a0,a5,a3
ffffffffc0206c56:	4581                	li	a1,0
ffffffffc0206c58:	255040ef          	jal	ffffffffc020b6ac <memset>
ffffffffc0206c5c:	074bfa63          	bgeu	s7,s4,ffffffffc0206cd0 <do_execve+0x6be>
ffffffffc0206c60:	77fd                	lui	a5,0xfffff
ffffffffc0206c62:	018b3503          	ld	a0,24(s6)
ffffffffc0206c66:	00fbfcb3          	and	s9,s7,a5
ffffffffc0206c6a:	85e6                	mv	a1,s9
ffffffffc0206c6c:	864e                	mv	a2,s3
ffffffffc0206c6e:	f73fc0ef          	jal	ffffffffc0203be0 <pgdir_alloc_page>
ffffffffc0206c72:	f14d                	bnez	a0,ffffffffc0206c14 <do_execve+0x602>
ffffffffc0206c74:	6aa2                	ld	s5,8(sp)
ffffffffc0206c76:	6982                	ld	s3,0(sp)
ffffffffc0206c78:	6a42                	ld	s4,16(sp)
ffffffffc0206c7a:	54f1                	li	s1,-4
ffffffffc0206c7c:	b989                	j	ffffffffc02068ce <do_execve+0x2bc>
ffffffffc0206c7e:	6aa2                	ld	s5,8(sp)
ffffffffc0206c80:	6982                	ld	s3,0(sp)
ffffffffc0206c82:	6a42                	ld	s4,16(sp)
ffffffffc0206c84:	84aa                	mv	s1,a0
ffffffffc0206c86:	8b5e                	mv	s6,s7
ffffffffc0206c88:	b199                	j	ffffffffc02068ce <do_execve+0x2bc>
ffffffffc0206c8a:	040b8863          	beqz	s7,ffffffffc0206cda <do_execve+0x6c8>
ffffffffc0206c8e:	038b8513          	addi	a0,s7,56
ffffffffc0206c92:	9adfd0ef          	jal	ffffffffc020463e <up>
ffffffffc0206c96:	040ba823          	sw	zero,80(s7)
ffffffffc0206c9a:	745e                	ld	s0,496(sp)
ffffffffc0206c9c:	791e                	ld	s2,480(sp)
ffffffffc0206c9e:	7bfa                	ld	s7,440(sp)
ffffffffc0206ca0:	7cba                	ld	s9,424(sp)
ffffffffc0206ca2:	54f5                	li	s1,-3
ffffffffc0206ca4:	b69d                	j	ffffffffc020680a <do_execve+0x1f8>
ffffffffc0206ca6:	6aa2                	ld	s5,8(sp)
ffffffffc0206ca8:	6982                	ld	s3,0(sp)
ffffffffc0206caa:	6a42                	ld	s4,16(sp)
ffffffffc0206cac:	8b5e                	mv	s6,s7
ffffffffc0206cae:	54f1                	li	s1,-4
ffffffffc0206cb0:	b939                	j	ffffffffc02068ce <do_execve+0x2bc>
ffffffffc0206cb2:	47c5                	li	a5,17
ffffffffc0206cb4:	86ba                	mv	a3,a4
ffffffffc0206cb6:	ec3e                	sd	a5,24(sp)
ffffffffc0206cb8:	bd15                	j	ffffffffc0206aec <do_execve+0x4da>
ffffffffc0206cba:	47dd                	li	a5,23
ffffffffc0206cbc:	00376693          	ori	a3,a4,3
ffffffffc0206cc0:	ec3e                	sd	a5,24(sp)
ffffffffc0206cc2:	b52d                	j	ffffffffc0206aec <do_execve+0x4da>
ffffffffc0206cc4:	54f1                	li	s1,-4
ffffffffc0206cc6:	b441                	j	ffffffffc0206746 <do_execve+0x134>
ffffffffc0206cc8:	54f5                	li	s1,-3
ffffffffc0206cca:	b20b94e3          	bnez	s7,ffffffffc02067f2 <do_execve+0x1e0>
ffffffffc0206cce:	be05                	j	ffffffffc02067fe <do_execve+0x1ec>
ffffffffc0206cd0:	6982                	ld	s3,0(sp)
ffffffffc0206cd2:	8cea                	mv	s9,s10
ffffffffc0206cd4:	b939                	j	ffffffffc02068f2 <do_execve+0x2e0>
ffffffffc0206cd6:	54f1                	li	s1,-4
ffffffffc0206cd8:	bcb5                	j	ffffffffc0206754 <do_execve+0x142>
ffffffffc0206cda:	745e                	ld	s0,496(sp)
ffffffffc0206cdc:	791e                	ld	s2,480(sp)
ffffffffc0206cde:	7bfa                	ld	s7,440(sp)
ffffffffc0206ce0:	7cba                	ld	s9,424(sp)
ffffffffc0206ce2:	54f5                	li	s1,-3
ffffffffc0206ce4:	b61d                	j	ffffffffc020680a <do_execve+0x1f8>
ffffffffc0206ce6:	6aa2                	ld	s5,8(sp)
ffffffffc0206ce8:	6a42                	ld	s4,16(sp)
ffffffffc0206cea:	54e1                	li	s1,-8
ffffffffc0206cec:	b6cd                	j	ffffffffc02068ce <do_execve+0x2bc>
ffffffffc0206cee:	866a                	mv	a2,s10
ffffffffc0206cf0:	b5fd                	j	ffffffffc0206bde <do_execve+0x5cc>
ffffffffc0206cf2:	00006617          	auipc	a2,0x6
ffffffffc0206cf6:	97e60613          	addi	a2,a2,-1666 # ffffffffc020c670 <etext+0xf5c>
ffffffffc0206cfa:	36800593          	li	a1,872
ffffffffc0206cfe:	00007517          	auipc	a0,0x7
ffffffffc0206d02:	87a50513          	addi	a0,a0,-1926 # ffffffffc020d578 <etext+0x1e64>
ffffffffc0206d06:	f44f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206d0a:	86be                	mv	a3,a5
ffffffffc0206d0c:	00006617          	auipc	a2,0x6
ffffffffc0206d10:	8bc60613          	addi	a2,a2,-1860 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc0206d14:	07100593          	li	a1,113
ffffffffc0206d18:	00006517          	auipc	a0,0x6
ffffffffc0206d1c:	8d850513          	addi	a0,a0,-1832 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc0206d20:	f2af90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206d24:	86e6                	mv	a3,s9
ffffffffc0206d26:	00006617          	auipc	a2,0x6
ffffffffc0206d2a:	8a260613          	addi	a2,a2,-1886 # ffffffffc020c5c8 <etext+0xeb4>
ffffffffc0206d2e:	07100593          	li	a1,113
ffffffffc0206d32:	00006517          	auipc	a0,0x6
ffffffffc0206d36:	8be50513          	addi	a0,a0,-1858 # ffffffffc020c5f0 <etext+0xedc>
ffffffffc0206d3a:	f10f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206d3e:	00007697          	auipc	a3,0x7
ffffffffc0206d42:	a5268693          	addi	a3,a3,-1454 # ffffffffc020d790 <etext+0x207c>
ffffffffc0206d46:	00005617          	auipc	a2,0x5
ffffffffc0206d4a:	e0a60613          	addi	a2,a2,-502 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0206d4e:	36200593          	li	a1,866
ffffffffc0206d52:	00007517          	auipc	a0,0x7
ffffffffc0206d56:	82650513          	addi	a0,a0,-2010 # ffffffffc020d578 <etext+0x1e64>
ffffffffc0206d5a:	ef0f90ef          	jal	ffffffffc020044a <__panic>

ffffffffc0206d5e <user_main>:
ffffffffc0206d5e:	7179                	addi	sp,sp,-48
ffffffffc0206d60:	e84a                	sd	s2,16(sp)
ffffffffc0206d62:	00090917          	auipc	s2,0x90
ffffffffc0206d66:	b6690913          	addi	s2,s2,-1178 # ffffffffc02968c8 <current>
ffffffffc0206d6a:	00093783          	ld	a5,0(s2)
ffffffffc0206d6e:	00007617          	auipc	a2,0x7
ffffffffc0206d72:	a6260613          	addi	a2,a2,-1438 # ffffffffc020d7d0 <etext+0x20bc>
ffffffffc0206d76:	00007517          	auipc	a0,0x7
ffffffffc0206d7a:	a6250513          	addi	a0,a0,-1438 # ffffffffc020d7d8 <etext+0x20c4>
ffffffffc0206d7e:	43cc                	lw	a1,4(a5)
ffffffffc0206d80:	f406                	sd	ra,40(sp)
ffffffffc0206d82:	f022                	sd	s0,32(sp)
ffffffffc0206d84:	ec26                	sd	s1,24(sp)
ffffffffc0206d86:	e402                	sd	zero,8(sp)
ffffffffc0206d88:	e032                	sd	a2,0(sp)
ffffffffc0206d8a:	c1cf90ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0206d8e:	6782                	ld	a5,0(sp)
ffffffffc0206d90:	cfb9                	beqz	a5,ffffffffc0206dee <user_main+0x90>
ffffffffc0206d92:	003c                	addi	a5,sp,8
ffffffffc0206d94:	4401                	li	s0,0
ffffffffc0206d96:	6398                	ld	a4,0(a5)
ffffffffc0206d98:	07a1                	addi	a5,a5,8 # fffffffffffff008 <end+0x3fd686f8>
ffffffffc0206d9a:	0405                	addi	s0,s0,1 # 1001 <_binary_bin_swap_img_size-0x6cff>
ffffffffc0206d9c:	ff6d                	bnez	a4,ffffffffc0206d96 <user_main+0x38>
ffffffffc0206d9e:	00093703          	ld	a4,0(s2)
ffffffffc0206da2:	6789                	lui	a5,0x2
ffffffffc0206da4:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0206da8:	6b04                	ld	s1,16(a4)
ffffffffc0206daa:	734c                	ld	a1,160(a4)
ffffffffc0206dac:	12000613          	li	a2,288
ffffffffc0206db0:	94be                	add	s1,s1,a5
ffffffffc0206db2:	8526                	mv	a0,s1
ffffffffc0206db4:	149040ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc0206db8:	00093783          	ld	a5,0(s2)
ffffffffc0206dbc:	0004059b          	sext.w	a1,s0
ffffffffc0206dc0:	860a                	mv	a2,sp
ffffffffc0206dc2:	f3c4                	sd	s1,160(a5)
ffffffffc0206dc4:	00007517          	auipc	a0,0x7
ffffffffc0206dc8:	a0c50513          	addi	a0,a0,-1524 # ffffffffc020d7d0 <etext+0x20bc>
ffffffffc0206dcc:	847ff0ef          	jal	ffffffffc0206612 <do_execve>
ffffffffc0206dd0:	8126                	mv	sp,s1
ffffffffc0206dd2:	c22fa06f          	j	ffffffffc02011f4 <__trapret>
ffffffffc0206dd6:	00007617          	auipc	a2,0x7
ffffffffc0206dda:	a2a60613          	addi	a2,a2,-1494 # ffffffffc020d800 <etext+0x20ec>
ffffffffc0206dde:	4b800593          	li	a1,1208
ffffffffc0206de2:	00006517          	auipc	a0,0x6
ffffffffc0206de6:	79650513          	addi	a0,a0,1942 # ffffffffc020d578 <etext+0x1e64>
ffffffffc0206dea:	e60f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206dee:	4401                	li	s0,0
ffffffffc0206df0:	b77d                	j	ffffffffc0206d9e <user_main+0x40>

ffffffffc0206df2 <do_yield>:
ffffffffc0206df2:	00090797          	auipc	a5,0x90
ffffffffc0206df6:	ad67b783          	ld	a5,-1322(a5) # ffffffffc02968c8 <current>
ffffffffc0206dfa:	4705                	li	a4,1
ffffffffc0206dfc:	4501                	li	a0,0
ffffffffc0206dfe:	ef98                	sd	a4,24(a5)
ffffffffc0206e00:	8082                	ret

ffffffffc0206e02 <do_wait>:
ffffffffc0206e02:	c59d                	beqz	a1,ffffffffc0206e30 <do_wait+0x2e>
ffffffffc0206e04:	1101                	addi	sp,sp,-32
ffffffffc0206e06:	e02a                	sd	a0,0(sp)
ffffffffc0206e08:	00090517          	auipc	a0,0x90
ffffffffc0206e0c:	ac053503          	ld	a0,-1344(a0) # ffffffffc02968c8 <current>
ffffffffc0206e10:	4685                	li	a3,1
ffffffffc0206e12:	4611                	li	a2,4
ffffffffc0206e14:	7508                	ld	a0,40(a0)
ffffffffc0206e16:	ec06                	sd	ra,24(sp)
ffffffffc0206e18:	e42e                	sd	a1,8(sp)
ffffffffc0206e1a:	d48fd0ef          	jal	ffffffffc0204362 <user_mem_check>
ffffffffc0206e1e:	6702                	ld	a4,0(sp)
ffffffffc0206e20:	67a2                	ld	a5,8(sp)
ffffffffc0206e22:	c909                	beqz	a0,ffffffffc0206e34 <do_wait+0x32>
ffffffffc0206e24:	60e2                	ld	ra,24(sp)
ffffffffc0206e26:	85be                	mv	a1,a5
ffffffffc0206e28:	853a                	mv	a0,a4
ffffffffc0206e2a:	6105                	addi	sp,sp,32
ffffffffc0206e2c:	cb4ff06f          	j	ffffffffc02062e0 <do_wait.part.0>
ffffffffc0206e30:	cb0ff06f          	j	ffffffffc02062e0 <do_wait.part.0>
ffffffffc0206e34:	60e2                	ld	ra,24(sp)
ffffffffc0206e36:	5575                	li	a0,-3
ffffffffc0206e38:	6105                	addi	sp,sp,32
ffffffffc0206e3a:	8082                	ret

ffffffffc0206e3c <do_kill>:
ffffffffc0206e3c:	6789                	lui	a5,0x2
ffffffffc0206e3e:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206e42:	17f9                	addi	a5,a5,-2 # 1ffe <_binary_bin_swap_img_size-0x5d02>
ffffffffc0206e44:	06e7e463          	bltu	a5,a4,ffffffffc0206eac <do_kill+0x70>
ffffffffc0206e48:	1101                	addi	sp,sp,-32
ffffffffc0206e4a:	45a9                	li	a1,10
ffffffffc0206e4c:	ec06                	sd	ra,24(sp)
ffffffffc0206e4e:	e42a                	sd	a0,8(sp)
ffffffffc0206e50:	320040ef          	jal	ffffffffc020b170 <hash32>
ffffffffc0206e54:	02051793          	slli	a5,a0,0x20
ffffffffc0206e58:	01c7d693          	srli	a3,a5,0x1c
ffffffffc0206e5c:	0008b797          	auipc	a5,0x8b
ffffffffc0206e60:	96478793          	addi	a5,a5,-1692 # ffffffffc02917c0 <hash_list>
ffffffffc0206e64:	96be                	add	a3,a3,a5
ffffffffc0206e66:	6622                	ld	a2,8(sp)
ffffffffc0206e68:	8536                	mv	a0,a3
ffffffffc0206e6a:	a029                	j	ffffffffc0206e74 <do_kill+0x38>
ffffffffc0206e6c:	f2c52703          	lw	a4,-212(a0)
ffffffffc0206e70:	00c70963          	beq	a4,a2,ffffffffc0206e82 <do_kill+0x46>
ffffffffc0206e74:	6508                	ld	a0,8(a0)
ffffffffc0206e76:	fea69be3          	bne	a3,a0,ffffffffc0206e6c <do_kill+0x30>
ffffffffc0206e7a:	60e2                	ld	ra,24(sp)
ffffffffc0206e7c:	5575                	li	a0,-3
ffffffffc0206e7e:	6105                	addi	sp,sp,32
ffffffffc0206e80:	8082                	ret
ffffffffc0206e82:	fd852703          	lw	a4,-40(a0)
ffffffffc0206e86:	00177693          	andi	a3,a4,1
ffffffffc0206e8a:	e29d                	bnez	a3,ffffffffc0206eb0 <do_kill+0x74>
ffffffffc0206e8c:	4954                	lw	a3,20(a0)
ffffffffc0206e8e:	00176713          	ori	a4,a4,1
ffffffffc0206e92:	fce52c23          	sw	a4,-40(a0)
ffffffffc0206e96:	0006c663          	bltz	a3,ffffffffc0206ea2 <do_kill+0x66>
ffffffffc0206e9a:	4501                	li	a0,0
ffffffffc0206e9c:	60e2                	ld	ra,24(sp)
ffffffffc0206e9e:	6105                	addi	sp,sp,32
ffffffffc0206ea0:	8082                	ret
ffffffffc0206ea2:	f2850513          	addi	a0,a0,-216
ffffffffc0206ea6:	454000ef          	jal	ffffffffc02072fa <wakeup_proc>
ffffffffc0206eaa:	bfc5                	j	ffffffffc0206e9a <do_kill+0x5e>
ffffffffc0206eac:	5575                	li	a0,-3
ffffffffc0206eae:	8082                	ret
ffffffffc0206eb0:	555d                	li	a0,-9
ffffffffc0206eb2:	b7ed                	j	ffffffffc0206e9c <do_kill+0x60>

ffffffffc0206eb4 <proc_init>:
ffffffffc0206eb4:	1101                	addi	sp,sp,-32
ffffffffc0206eb6:	e426                	sd	s1,8(sp)
ffffffffc0206eb8:	0008f797          	auipc	a5,0x8f
ffffffffc0206ebc:	90878793          	addi	a5,a5,-1784 # ffffffffc02957c0 <proc_list>
ffffffffc0206ec0:	ec06                	sd	ra,24(sp)
ffffffffc0206ec2:	e822                	sd	s0,16(sp)
ffffffffc0206ec4:	e04a                	sd	s2,0(sp)
ffffffffc0206ec6:	0008b497          	auipc	s1,0x8b
ffffffffc0206eca:	8fa48493          	addi	s1,s1,-1798 # ffffffffc02917c0 <hash_list>
ffffffffc0206ece:	e79c                	sd	a5,8(a5)
ffffffffc0206ed0:	e39c                	sd	a5,0(a5)
ffffffffc0206ed2:	0008f717          	auipc	a4,0x8f
ffffffffc0206ed6:	8ee70713          	addi	a4,a4,-1810 # ffffffffc02957c0 <proc_list>
ffffffffc0206eda:	87a6                	mv	a5,s1
ffffffffc0206edc:	e79c                	sd	a5,8(a5)
ffffffffc0206ede:	e39c                	sd	a5,0(a5)
ffffffffc0206ee0:	07c1                	addi	a5,a5,16
ffffffffc0206ee2:	fee79de3          	bne	a5,a4,ffffffffc0206edc <proc_init+0x28>
ffffffffc0206ee6:	c29fe0ef          	jal	ffffffffc0205b0e <alloc_proc>
ffffffffc0206eea:	00090917          	auipc	s2,0x90
ffffffffc0206eee:	9ee90913          	addi	s2,s2,-1554 # ffffffffc02968d8 <idleproc>
ffffffffc0206ef2:	00a93023          	sd	a0,0(s2)
ffffffffc0206ef6:	842a                	mv	s0,a0
ffffffffc0206ef8:	12050c63          	beqz	a0,ffffffffc0207030 <proc_init+0x17c>
ffffffffc0206efc:	4689                	li	a3,2
ffffffffc0206efe:	0000a717          	auipc	a4,0xa
ffffffffc0206f02:	10270713          	addi	a4,a4,258 # ffffffffc0211000 <bootstack>
ffffffffc0206f06:	4785                	li	a5,1
ffffffffc0206f08:	e114                	sd	a3,0(a0)
ffffffffc0206f0a:	e918                	sd	a4,16(a0)
ffffffffc0206f0c:	ed1c                	sd	a5,24(a0)
ffffffffc0206f0e:	bb6fe0ef          	jal	ffffffffc02052c4 <files_create>
ffffffffc0206f12:	14a43423          	sd	a0,328(s0)
ffffffffc0206f16:	10050163          	beqz	a0,ffffffffc0207018 <proc_init+0x164>
ffffffffc0206f1a:	00093403          	ld	s0,0(s2)
ffffffffc0206f1e:	4641                	li	a2,16
ffffffffc0206f20:	4581                	li	a1,0
ffffffffc0206f22:	14843703          	ld	a4,328(s0)
ffffffffc0206f26:	0b440413          	addi	s0,s0,180
ffffffffc0206f2a:	8522                	mv	a0,s0
ffffffffc0206f2c:	4b1c                	lw	a5,16(a4)
ffffffffc0206f2e:	2785                	addiw	a5,a5,1
ffffffffc0206f30:	cb1c                	sw	a5,16(a4)
ffffffffc0206f32:	77a040ef          	jal	ffffffffc020b6ac <memset>
ffffffffc0206f36:	8522                	mv	a0,s0
ffffffffc0206f38:	463d                	li	a2,15
ffffffffc0206f3a:	00007597          	auipc	a1,0x7
ffffffffc0206f3e:	92658593          	addi	a1,a1,-1754 # ffffffffc020d860 <etext+0x214c>
ffffffffc0206f42:	7ba040ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc0206f46:	00090797          	auipc	a5,0x90
ffffffffc0206f4a:	97a7a783          	lw	a5,-1670(a5) # ffffffffc02968c0 <nr_process>
ffffffffc0206f4e:	00093703          	ld	a4,0(s2)
ffffffffc0206f52:	4601                	li	a2,0
ffffffffc0206f54:	2785                	addiw	a5,a5,1
ffffffffc0206f56:	4581                	li	a1,0
ffffffffc0206f58:	fffff517          	auipc	a0,0xfffff
ffffffffc0206f5c:	56a50513          	addi	a0,a0,1386 # ffffffffc02064c2 <init_main>
ffffffffc0206f60:	00090697          	auipc	a3,0x90
ffffffffc0206f64:	96e6b423          	sd	a4,-1688(a3) # ffffffffc02968c8 <current>
ffffffffc0206f68:	00090717          	auipc	a4,0x90
ffffffffc0206f6c:	94f72c23          	sw	a5,-1704(a4) # ffffffffc02968c0 <nr_process>
ffffffffc0206f70:	9c0ff0ef          	jal	ffffffffc0206130 <kernel_thread>
ffffffffc0206f74:	842a                	mv	s0,a0
ffffffffc0206f76:	08a05563          	blez	a0,ffffffffc0207000 <proc_init+0x14c>
ffffffffc0206f7a:	6789                	lui	a5,0x2
ffffffffc0206f7c:	17f9                	addi	a5,a5,-2 # 1ffe <_binary_bin_swap_img_size-0x5d02>
ffffffffc0206f7e:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206f82:	02e7e463          	bltu	a5,a4,ffffffffc0206faa <proc_init+0xf6>
ffffffffc0206f86:	45a9                	li	a1,10
ffffffffc0206f88:	1e8040ef          	jal	ffffffffc020b170 <hash32>
ffffffffc0206f8c:	02051713          	slli	a4,a0,0x20
ffffffffc0206f90:	01c75793          	srli	a5,a4,0x1c
ffffffffc0206f94:	00f486b3          	add	a3,s1,a5
ffffffffc0206f98:	87b6                	mv	a5,a3
ffffffffc0206f9a:	a029                	j	ffffffffc0206fa4 <proc_init+0xf0>
ffffffffc0206f9c:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0206fa0:	04870d63          	beq	a4,s0,ffffffffc0206ffa <proc_init+0x146>
ffffffffc0206fa4:	679c                	ld	a5,8(a5)
ffffffffc0206fa6:	fef69be3          	bne	a3,a5,ffffffffc0206f9c <proc_init+0xe8>
ffffffffc0206faa:	4781                	li	a5,0
ffffffffc0206fac:	0b478413          	addi	s0,a5,180
ffffffffc0206fb0:	4641                	li	a2,16
ffffffffc0206fb2:	4581                	li	a1,0
ffffffffc0206fb4:	8522                	mv	a0,s0
ffffffffc0206fb6:	00090717          	auipc	a4,0x90
ffffffffc0206fba:	90f73d23          	sd	a5,-1766(a4) # ffffffffc02968d0 <initproc>
ffffffffc0206fbe:	6ee040ef          	jal	ffffffffc020b6ac <memset>
ffffffffc0206fc2:	8522                	mv	a0,s0
ffffffffc0206fc4:	463d                	li	a2,15
ffffffffc0206fc6:	00007597          	auipc	a1,0x7
ffffffffc0206fca:	8c258593          	addi	a1,a1,-1854 # ffffffffc020d888 <etext+0x2174>
ffffffffc0206fce:	72e040ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc0206fd2:	00093783          	ld	a5,0(s2)
ffffffffc0206fd6:	cbc9                	beqz	a5,ffffffffc0207068 <proc_init+0x1b4>
ffffffffc0206fd8:	43dc                	lw	a5,4(a5)
ffffffffc0206fda:	e7d9                	bnez	a5,ffffffffc0207068 <proc_init+0x1b4>
ffffffffc0206fdc:	00090797          	auipc	a5,0x90
ffffffffc0206fe0:	8f47b783          	ld	a5,-1804(a5) # ffffffffc02968d0 <initproc>
ffffffffc0206fe4:	c3b5                	beqz	a5,ffffffffc0207048 <proc_init+0x194>
ffffffffc0206fe6:	43d8                	lw	a4,4(a5)
ffffffffc0206fe8:	4785                	li	a5,1
ffffffffc0206fea:	04f71f63          	bne	a4,a5,ffffffffc0207048 <proc_init+0x194>
ffffffffc0206fee:	60e2                	ld	ra,24(sp)
ffffffffc0206ff0:	6442                	ld	s0,16(sp)
ffffffffc0206ff2:	64a2                	ld	s1,8(sp)
ffffffffc0206ff4:	6902                	ld	s2,0(sp)
ffffffffc0206ff6:	6105                	addi	sp,sp,32
ffffffffc0206ff8:	8082                	ret
ffffffffc0206ffa:	f2878793          	addi	a5,a5,-216
ffffffffc0206ffe:	b77d                	j	ffffffffc0206fac <proc_init+0xf8>
ffffffffc0207000:	00007617          	auipc	a2,0x7
ffffffffc0207004:	86860613          	addi	a2,a2,-1944 # ffffffffc020d868 <etext+0x2154>
ffffffffc0207008:	50400593          	li	a1,1284
ffffffffc020700c:	00006517          	auipc	a0,0x6
ffffffffc0207010:	56c50513          	addi	a0,a0,1388 # ffffffffc020d578 <etext+0x1e64>
ffffffffc0207014:	c36f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207018:	00007617          	auipc	a2,0x7
ffffffffc020701c:	82060613          	addi	a2,a2,-2016 # ffffffffc020d838 <etext+0x2124>
ffffffffc0207020:	4f800593          	li	a1,1272
ffffffffc0207024:	00006517          	auipc	a0,0x6
ffffffffc0207028:	55450513          	addi	a0,a0,1364 # ffffffffc020d578 <etext+0x1e64>
ffffffffc020702c:	c1ef90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207030:	00006617          	auipc	a2,0x6
ffffffffc0207034:	7f060613          	addi	a2,a2,2032 # ffffffffc020d820 <etext+0x210c>
ffffffffc0207038:	4ee00593          	li	a1,1262
ffffffffc020703c:	00006517          	auipc	a0,0x6
ffffffffc0207040:	53c50513          	addi	a0,a0,1340 # ffffffffc020d578 <etext+0x1e64>
ffffffffc0207044:	c06f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207048:	00007697          	auipc	a3,0x7
ffffffffc020704c:	87068693          	addi	a3,a3,-1936 # ffffffffc020d8b8 <etext+0x21a4>
ffffffffc0207050:	00005617          	auipc	a2,0x5
ffffffffc0207054:	b0060613          	addi	a2,a2,-1280 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207058:	50b00593          	li	a1,1291
ffffffffc020705c:	00006517          	auipc	a0,0x6
ffffffffc0207060:	51c50513          	addi	a0,a0,1308 # ffffffffc020d578 <etext+0x1e64>
ffffffffc0207064:	be6f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207068:	00007697          	auipc	a3,0x7
ffffffffc020706c:	82868693          	addi	a3,a3,-2008 # ffffffffc020d890 <etext+0x217c>
ffffffffc0207070:	00005617          	auipc	a2,0x5
ffffffffc0207074:	ae060613          	addi	a2,a2,-1312 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207078:	50a00593          	li	a1,1290
ffffffffc020707c:	00006517          	auipc	a0,0x6
ffffffffc0207080:	4fc50513          	addi	a0,a0,1276 # ffffffffc020d578 <etext+0x1e64>
ffffffffc0207084:	bc6f90ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207088 <cpu_idle>:
ffffffffc0207088:	1141                	addi	sp,sp,-16
ffffffffc020708a:	e022                	sd	s0,0(sp)
ffffffffc020708c:	e406                	sd	ra,8(sp)
ffffffffc020708e:	00090417          	auipc	s0,0x90
ffffffffc0207092:	83a40413          	addi	s0,s0,-1990 # ffffffffc02968c8 <current>
ffffffffc0207096:	6018                	ld	a4,0(s0)
ffffffffc0207098:	6f1c                	ld	a5,24(a4)
ffffffffc020709a:	dffd                	beqz	a5,ffffffffc0207098 <cpu_idle+0x10>
ffffffffc020709c:	356000ef          	jal	ffffffffc02073f2 <schedule>
ffffffffc02070a0:	bfdd                	j	ffffffffc0207096 <cpu_idle+0xe>

ffffffffc02070a2 <lab6_set_priority>:
ffffffffc02070a2:	1101                	addi	sp,sp,-32
ffffffffc02070a4:	85aa                	mv	a1,a0
ffffffffc02070a6:	e42a                	sd	a0,8(sp)
ffffffffc02070a8:	00007517          	auipc	a0,0x7
ffffffffc02070ac:	83850513          	addi	a0,a0,-1992 # ffffffffc020d8e0 <etext+0x21cc>
ffffffffc02070b0:	ec06                	sd	ra,24(sp)
ffffffffc02070b2:	8f4f90ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02070b6:	65a2                	ld	a1,8(sp)
ffffffffc02070b8:	00090717          	auipc	a4,0x90
ffffffffc02070bc:	81073703          	ld	a4,-2032(a4) # ffffffffc02968c8 <current>
ffffffffc02070c0:	4785                	li	a5,1
ffffffffc02070c2:	c191                	beqz	a1,ffffffffc02070c6 <lab6_set_priority+0x24>
ffffffffc02070c4:	87ae                	mv	a5,a1
ffffffffc02070c6:	60e2                	ld	ra,24(sp)
ffffffffc02070c8:	14f72223          	sw	a5,324(a4)
ffffffffc02070cc:	6105                	addi	sp,sp,32
ffffffffc02070ce:	8082                	ret

ffffffffc02070d0 <do_sleep>:
ffffffffc02070d0:	c531                	beqz	a0,ffffffffc020711c <do_sleep+0x4c>
ffffffffc02070d2:	7139                	addi	sp,sp,-64
ffffffffc02070d4:	fc06                	sd	ra,56(sp)
ffffffffc02070d6:	f822                	sd	s0,48(sp)
ffffffffc02070d8:	100027f3          	csrr	a5,sstatus
ffffffffc02070dc:	8b89                	andi	a5,a5,2
ffffffffc02070de:	e3a9                	bnez	a5,ffffffffc0207120 <do_sleep+0x50>
ffffffffc02070e0:	0008f797          	auipc	a5,0x8f
ffffffffc02070e4:	7e87b783          	ld	a5,2024(a5) # ffffffffc02968c8 <current>
ffffffffc02070e8:	1014                	addi	a3,sp,32
ffffffffc02070ea:	80000737          	lui	a4,0x80000
ffffffffc02070ee:	c82a                	sw	a0,16(sp)
ffffffffc02070f0:	f436                	sd	a3,40(sp)
ffffffffc02070f2:	f036                	sd	a3,32(sp)
ffffffffc02070f4:	ec3e                	sd	a5,24(sp)
ffffffffc02070f6:	4685                	li	a3,1
ffffffffc02070f8:	0709                	addi	a4,a4,2 # ffffffff80000002 <_binary_bin_sfs_img_size+0xffffffff7ff8ad02>
ffffffffc02070fa:	0808                	addi	a0,sp,16
ffffffffc02070fc:	c394                	sw	a3,0(a5)
ffffffffc02070fe:	0ee7a623          	sw	a4,236(a5)
ffffffffc0207102:	842a                	mv	s0,a0
ffffffffc0207104:	3a4000ef          	jal	ffffffffc02074a8 <add_timer>
ffffffffc0207108:	2ea000ef          	jal	ffffffffc02073f2 <schedule>
ffffffffc020710c:	8522                	mv	a0,s0
ffffffffc020710e:	460000ef          	jal	ffffffffc020756e <del_timer>
ffffffffc0207112:	70e2                	ld	ra,56(sp)
ffffffffc0207114:	7442                	ld	s0,48(sp)
ffffffffc0207116:	4501                	li	a0,0
ffffffffc0207118:	6121                	addi	sp,sp,64
ffffffffc020711a:	8082                	ret
ffffffffc020711c:	4501                	li	a0,0
ffffffffc020711e:	8082                	ret
ffffffffc0207120:	e42a                	sd	a0,8(sp)
ffffffffc0207122:	ab7f90ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0207126:	0008f797          	auipc	a5,0x8f
ffffffffc020712a:	7a27b783          	ld	a5,1954(a5) # ffffffffc02968c8 <current>
ffffffffc020712e:	6522                	ld	a0,8(sp)
ffffffffc0207130:	1014                	addi	a3,sp,32
ffffffffc0207132:	80000737          	lui	a4,0x80000
ffffffffc0207136:	c82a                	sw	a0,16(sp)
ffffffffc0207138:	f436                	sd	a3,40(sp)
ffffffffc020713a:	f036                	sd	a3,32(sp)
ffffffffc020713c:	ec3e                	sd	a5,24(sp)
ffffffffc020713e:	4685                	li	a3,1
ffffffffc0207140:	0709                	addi	a4,a4,2 # ffffffff80000002 <_binary_bin_sfs_img_size+0xffffffff7ff8ad02>
ffffffffc0207142:	0808                	addi	a0,sp,16
ffffffffc0207144:	c394                	sw	a3,0(a5)
ffffffffc0207146:	0ee7a623          	sw	a4,236(a5)
ffffffffc020714a:	842a                	mv	s0,a0
ffffffffc020714c:	35c000ef          	jal	ffffffffc02074a8 <add_timer>
ffffffffc0207150:	a83f90ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0207154:	bf55                	j	ffffffffc0207108 <do_sleep+0x38>

ffffffffc0207156 <switch_to>:
ffffffffc0207156:	00153023          	sd	ra,0(a0)
ffffffffc020715a:	00253423          	sd	sp,8(a0)
ffffffffc020715e:	e900                	sd	s0,16(a0)
ffffffffc0207160:	ed04                	sd	s1,24(a0)
ffffffffc0207162:	03253023          	sd	s2,32(a0)
ffffffffc0207166:	03353423          	sd	s3,40(a0)
ffffffffc020716a:	03453823          	sd	s4,48(a0)
ffffffffc020716e:	03553c23          	sd	s5,56(a0)
ffffffffc0207172:	05653023          	sd	s6,64(a0)
ffffffffc0207176:	05753423          	sd	s7,72(a0)
ffffffffc020717a:	05853823          	sd	s8,80(a0)
ffffffffc020717e:	05953c23          	sd	s9,88(a0)
ffffffffc0207182:	07a53023          	sd	s10,96(a0)
ffffffffc0207186:	07b53423          	sd	s11,104(a0)
ffffffffc020718a:	0005b083          	ld	ra,0(a1)
ffffffffc020718e:	0085b103          	ld	sp,8(a1)
ffffffffc0207192:	6980                	ld	s0,16(a1)
ffffffffc0207194:	6d84                	ld	s1,24(a1)
ffffffffc0207196:	0205b903          	ld	s2,32(a1)
ffffffffc020719a:	0285b983          	ld	s3,40(a1)
ffffffffc020719e:	0305ba03          	ld	s4,48(a1)
ffffffffc02071a2:	0385ba83          	ld	s5,56(a1)
ffffffffc02071a6:	0405bb03          	ld	s6,64(a1)
ffffffffc02071aa:	0485bb83          	ld	s7,72(a1)
ffffffffc02071ae:	0505bc03          	ld	s8,80(a1)
ffffffffc02071b2:	0585bc83          	ld	s9,88(a1)
ffffffffc02071b6:	0605bd03          	ld	s10,96(a1)
ffffffffc02071ba:	0685bd83          	ld	s11,104(a1)
ffffffffc02071be:	8082                	ret

ffffffffc02071c0 <RR_init>:
ffffffffc02071c0:	e508                	sd	a0,8(a0)
ffffffffc02071c2:	e108                	sd	a0,0(a0)
ffffffffc02071c4:	00052823          	sw	zero,16(a0)
ffffffffc02071c8:	8082                	ret

ffffffffc02071ca <RR_pick_next>:
ffffffffc02071ca:	651c                	ld	a5,8(a0)
ffffffffc02071cc:	00f50563          	beq	a0,a5,ffffffffc02071d6 <RR_pick_next+0xc>
ffffffffc02071d0:	ef078513          	addi	a0,a5,-272
ffffffffc02071d4:	8082                	ret
ffffffffc02071d6:	4501                	li	a0,0
ffffffffc02071d8:	8082                	ret

ffffffffc02071da <RR_proc_tick>:
ffffffffc02071da:	1205a783          	lw	a5,288(a1)
ffffffffc02071de:	00f05563          	blez	a5,ffffffffc02071e8 <RR_proc_tick+0xe>
ffffffffc02071e2:	37fd                	addiw	a5,a5,-1
ffffffffc02071e4:	12f5a023          	sw	a5,288(a1)
ffffffffc02071e8:	e399                	bnez	a5,ffffffffc02071ee <RR_proc_tick+0x14>
ffffffffc02071ea:	4785                	li	a5,1
ffffffffc02071ec:	ed9c                	sd	a5,24(a1)
ffffffffc02071ee:	8082                	ret

ffffffffc02071f0 <RR_dequeue>:
ffffffffc02071f0:	1185b703          	ld	a4,280(a1)
ffffffffc02071f4:	11058793          	addi	a5,a1,272
ffffffffc02071f8:	02e78263          	beq	a5,a4,ffffffffc020721c <RR_dequeue+0x2c>
ffffffffc02071fc:	1085b683          	ld	a3,264(a1)
ffffffffc0207200:	00a69e63          	bne	a3,a0,ffffffffc020721c <RR_dequeue+0x2c>
ffffffffc0207204:	1105b503          	ld	a0,272(a1)
ffffffffc0207208:	4a90                	lw	a2,16(a3)
ffffffffc020720a:	e518                	sd	a4,8(a0)
ffffffffc020720c:	e308                	sd	a0,0(a4)
ffffffffc020720e:	10f5bc23          	sd	a5,280(a1)
ffffffffc0207212:	10f5b823          	sd	a5,272(a1)
ffffffffc0207216:	367d                	addiw	a2,a2,-1
ffffffffc0207218:	ca90                	sw	a2,16(a3)
ffffffffc020721a:	8082                	ret
ffffffffc020721c:	1141                	addi	sp,sp,-16
ffffffffc020721e:	00006697          	auipc	a3,0x6
ffffffffc0207222:	6da68693          	addi	a3,a3,1754 # ffffffffc020d8f8 <etext+0x21e4>
ffffffffc0207226:	00005617          	auipc	a2,0x5
ffffffffc020722a:	92a60613          	addi	a2,a2,-1750 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020722e:	03c00593          	li	a1,60
ffffffffc0207232:	00006517          	auipc	a0,0x6
ffffffffc0207236:	6fe50513          	addi	a0,a0,1790 # ffffffffc020d930 <etext+0x221c>
ffffffffc020723a:	e406                	sd	ra,8(sp)
ffffffffc020723c:	a0ef90ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207240 <RR_enqueue>:
ffffffffc0207240:	1185b703          	ld	a4,280(a1)
ffffffffc0207244:	11058793          	addi	a5,a1,272
ffffffffc0207248:	02e79d63          	bne	a5,a4,ffffffffc0207282 <RR_enqueue+0x42>
ffffffffc020724c:	6118                	ld	a4,0(a0)
ffffffffc020724e:	1205a683          	lw	a3,288(a1)
ffffffffc0207252:	e11c                	sd	a5,0(a0)
ffffffffc0207254:	e71c                	sd	a5,8(a4)
ffffffffc0207256:	10e5b823          	sd	a4,272(a1)
ffffffffc020725a:	10a5bc23          	sd	a0,280(a1)
ffffffffc020725e:	495c                	lw	a5,20(a0)
ffffffffc0207260:	ea89                	bnez	a3,ffffffffc0207272 <RR_enqueue+0x32>
ffffffffc0207262:	12f5a023          	sw	a5,288(a1)
ffffffffc0207266:	491c                	lw	a5,16(a0)
ffffffffc0207268:	10a5b423          	sd	a0,264(a1)
ffffffffc020726c:	2785                	addiw	a5,a5,1
ffffffffc020726e:	c91c                	sw	a5,16(a0)
ffffffffc0207270:	8082                	ret
ffffffffc0207272:	fed7c8e3          	blt	a5,a3,ffffffffc0207262 <RR_enqueue+0x22>
ffffffffc0207276:	491c                	lw	a5,16(a0)
ffffffffc0207278:	10a5b423          	sd	a0,264(a1)
ffffffffc020727c:	2785                	addiw	a5,a5,1
ffffffffc020727e:	c91c                	sw	a5,16(a0)
ffffffffc0207280:	8082                	ret
ffffffffc0207282:	1141                	addi	sp,sp,-16
ffffffffc0207284:	00006697          	auipc	a3,0x6
ffffffffc0207288:	6cc68693          	addi	a3,a3,1740 # ffffffffc020d950 <etext+0x223c>
ffffffffc020728c:	00005617          	auipc	a2,0x5
ffffffffc0207290:	8c460613          	addi	a2,a2,-1852 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207294:	02800593          	li	a1,40
ffffffffc0207298:	00006517          	auipc	a0,0x6
ffffffffc020729c:	69850513          	addi	a0,a0,1688 # ffffffffc020d930 <etext+0x221c>
ffffffffc02072a0:	e406                	sd	ra,8(sp)
ffffffffc02072a2:	9a8f90ef          	jal	ffffffffc020044a <__panic>

ffffffffc02072a6 <sched_init>:
ffffffffc02072a6:	0008a797          	auipc	a5,0x8a
ffffffffc02072aa:	d7a78793          	addi	a5,a5,-646 # ffffffffc0291020 <default_sched_class>
ffffffffc02072ae:	1141                	addi	sp,sp,-16
ffffffffc02072b0:	6794                	ld	a3,8(a5)
ffffffffc02072b2:	0008f717          	auipc	a4,0x8f
ffffffffc02072b6:	62f73b23          	sd	a5,1590(a4) # ffffffffc02968e8 <sched_class>
ffffffffc02072ba:	e406                	sd	ra,8(sp)
ffffffffc02072bc:	0008e797          	auipc	a5,0x8e
ffffffffc02072c0:	53478793          	addi	a5,a5,1332 # ffffffffc02957f0 <timer_list>
ffffffffc02072c4:	0008e717          	auipc	a4,0x8e
ffffffffc02072c8:	50c70713          	addi	a4,a4,1292 # ffffffffc02957d0 <__rq>
ffffffffc02072cc:	4615                	li	a2,5
ffffffffc02072ce:	e79c                	sd	a5,8(a5)
ffffffffc02072d0:	e39c                	sd	a5,0(a5)
ffffffffc02072d2:	853a                	mv	a0,a4
ffffffffc02072d4:	cb50                	sw	a2,20(a4)
ffffffffc02072d6:	0008f797          	auipc	a5,0x8f
ffffffffc02072da:	60e7b523          	sd	a4,1546(a5) # ffffffffc02968e0 <rq>
ffffffffc02072de:	9682                	jalr	a3
ffffffffc02072e0:	0008f797          	auipc	a5,0x8f
ffffffffc02072e4:	6087b783          	ld	a5,1544(a5) # ffffffffc02968e8 <sched_class>
ffffffffc02072e8:	60a2                	ld	ra,8(sp)
ffffffffc02072ea:	00006517          	auipc	a0,0x6
ffffffffc02072ee:	69650513          	addi	a0,a0,1686 # ffffffffc020d980 <etext+0x226c>
ffffffffc02072f2:	638c                	ld	a1,0(a5)
ffffffffc02072f4:	0141                	addi	sp,sp,16
ffffffffc02072f6:	eb1f806f          	j	ffffffffc02001a6 <cprintf>

ffffffffc02072fa <wakeup_proc>:
ffffffffc02072fa:	4118                	lw	a4,0(a0)
ffffffffc02072fc:	1101                	addi	sp,sp,-32
ffffffffc02072fe:	ec06                	sd	ra,24(sp)
ffffffffc0207300:	478d                	li	a5,3
ffffffffc0207302:	0cf70863          	beq	a4,a5,ffffffffc02073d2 <wakeup_proc+0xd8>
ffffffffc0207306:	85aa                	mv	a1,a0
ffffffffc0207308:	100027f3          	csrr	a5,sstatus
ffffffffc020730c:	8b89                	andi	a5,a5,2
ffffffffc020730e:	e3b1                	bnez	a5,ffffffffc0207352 <wakeup_proc+0x58>
ffffffffc0207310:	4789                	li	a5,2
ffffffffc0207312:	08f70563          	beq	a4,a5,ffffffffc020739c <wakeup_proc+0xa2>
ffffffffc0207316:	0008f717          	auipc	a4,0x8f
ffffffffc020731a:	5b273703          	ld	a4,1458(a4) # ffffffffc02968c8 <current>
ffffffffc020731e:	0e052623          	sw	zero,236(a0)
ffffffffc0207322:	c11c                	sw	a5,0(a0)
ffffffffc0207324:	02e50463          	beq	a0,a4,ffffffffc020734c <wakeup_proc+0x52>
ffffffffc0207328:	0008f797          	auipc	a5,0x8f
ffffffffc020732c:	5b07b783          	ld	a5,1456(a5) # ffffffffc02968d8 <idleproc>
ffffffffc0207330:	00f50e63          	beq	a0,a5,ffffffffc020734c <wakeup_proc+0x52>
ffffffffc0207334:	0008f797          	auipc	a5,0x8f
ffffffffc0207338:	5b47b783          	ld	a5,1460(a5) # ffffffffc02968e8 <sched_class>
ffffffffc020733c:	60e2                	ld	ra,24(sp)
ffffffffc020733e:	0008f517          	auipc	a0,0x8f
ffffffffc0207342:	5a253503          	ld	a0,1442(a0) # ffffffffc02968e0 <rq>
ffffffffc0207346:	6b9c                	ld	a5,16(a5)
ffffffffc0207348:	6105                	addi	sp,sp,32
ffffffffc020734a:	8782                	jr	a5
ffffffffc020734c:	60e2                	ld	ra,24(sp)
ffffffffc020734e:	6105                	addi	sp,sp,32
ffffffffc0207350:	8082                	ret
ffffffffc0207352:	e42a                	sd	a0,8(sp)
ffffffffc0207354:	885f90ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0207358:	65a2                	ld	a1,8(sp)
ffffffffc020735a:	4789                	li	a5,2
ffffffffc020735c:	4198                	lw	a4,0(a1)
ffffffffc020735e:	04f70d63          	beq	a4,a5,ffffffffc02073b8 <wakeup_proc+0xbe>
ffffffffc0207362:	0008f717          	auipc	a4,0x8f
ffffffffc0207366:	56673703          	ld	a4,1382(a4) # ffffffffc02968c8 <current>
ffffffffc020736a:	0e05a623          	sw	zero,236(a1)
ffffffffc020736e:	c19c                	sw	a5,0(a1)
ffffffffc0207370:	02e58263          	beq	a1,a4,ffffffffc0207394 <wakeup_proc+0x9a>
ffffffffc0207374:	0008f797          	auipc	a5,0x8f
ffffffffc0207378:	5647b783          	ld	a5,1380(a5) # ffffffffc02968d8 <idleproc>
ffffffffc020737c:	00f58c63          	beq	a1,a5,ffffffffc0207394 <wakeup_proc+0x9a>
ffffffffc0207380:	0008f797          	auipc	a5,0x8f
ffffffffc0207384:	5687b783          	ld	a5,1384(a5) # ffffffffc02968e8 <sched_class>
ffffffffc0207388:	0008f517          	auipc	a0,0x8f
ffffffffc020738c:	55853503          	ld	a0,1368(a0) # ffffffffc02968e0 <rq>
ffffffffc0207390:	6b9c                	ld	a5,16(a5)
ffffffffc0207392:	9782                	jalr	a5
ffffffffc0207394:	60e2                	ld	ra,24(sp)
ffffffffc0207396:	6105                	addi	sp,sp,32
ffffffffc0207398:	83bf906f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc020739c:	60e2                	ld	ra,24(sp)
ffffffffc020739e:	00006617          	auipc	a2,0x6
ffffffffc02073a2:	63260613          	addi	a2,a2,1586 # ffffffffc020d9d0 <etext+0x22bc>
ffffffffc02073a6:	05200593          	li	a1,82
ffffffffc02073aa:	00006517          	auipc	a0,0x6
ffffffffc02073ae:	60e50513          	addi	a0,a0,1550 # ffffffffc020d9b8 <etext+0x22a4>
ffffffffc02073b2:	6105                	addi	sp,sp,32
ffffffffc02073b4:	900f906f          	j	ffffffffc02004b4 <__warn>
ffffffffc02073b8:	00006617          	auipc	a2,0x6
ffffffffc02073bc:	61860613          	addi	a2,a2,1560 # ffffffffc020d9d0 <etext+0x22bc>
ffffffffc02073c0:	05200593          	li	a1,82
ffffffffc02073c4:	00006517          	auipc	a0,0x6
ffffffffc02073c8:	5f450513          	addi	a0,a0,1524 # ffffffffc020d9b8 <etext+0x22a4>
ffffffffc02073cc:	8e8f90ef          	jal	ffffffffc02004b4 <__warn>
ffffffffc02073d0:	b7d1                	j	ffffffffc0207394 <wakeup_proc+0x9a>
ffffffffc02073d2:	00006697          	auipc	a3,0x6
ffffffffc02073d6:	5c668693          	addi	a3,a3,1478 # ffffffffc020d998 <etext+0x2284>
ffffffffc02073da:	00004617          	auipc	a2,0x4
ffffffffc02073de:	77660613          	addi	a2,a2,1910 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02073e2:	04300593          	li	a1,67
ffffffffc02073e6:	00006517          	auipc	a0,0x6
ffffffffc02073ea:	5d250513          	addi	a0,a0,1490 # ffffffffc020d9b8 <etext+0x22a4>
ffffffffc02073ee:	85cf90ef          	jal	ffffffffc020044a <__panic>

ffffffffc02073f2 <schedule>:
ffffffffc02073f2:	7139                	addi	sp,sp,-64
ffffffffc02073f4:	fc06                	sd	ra,56(sp)
ffffffffc02073f6:	f822                	sd	s0,48(sp)
ffffffffc02073f8:	f426                	sd	s1,40(sp)
ffffffffc02073fa:	f04a                	sd	s2,32(sp)
ffffffffc02073fc:	ec4e                	sd	s3,24(sp)
ffffffffc02073fe:	100027f3          	csrr	a5,sstatus
ffffffffc0207402:	8b89                	andi	a5,a5,2
ffffffffc0207404:	4981                	li	s3,0
ffffffffc0207406:	efc9                	bnez	a5,ffffffffc02074a0 <schedule+0xae>
ffffffffc0207408:	0008f417          	auipc	s0,0x8f
ffffffffc020740c:	4c040413          	addi	s0,s0,1216 # ffffffffc02968c8 <current>
ffffffffc0207410:	600c                	ld	a1,0(s0)
ffffffffc0207412:	4789                	li	a5,2
ffffffffc0207414:	0008f497          	auipc	s1,0x8f
ffffffffc0207418:	4cc48493          	addi	s1,s1,1228 # ffffffffc02968e0 <rq>
ffffffffc020741c:	4198                	lw	a4,0(a1)
ffffffffc020741e:	0005bc23          	sd	zero,24(a1)
ffffffffc0207422:	0008f917          	auipc	s2,0x8f
ffffffffc0207426:	4c690913          	addi	s2,s2,1222 # ffffffffc02968e8 <sched_class>
ffffffffc020742a:	04f70f63          	beq	a4,a5,ffffffffc0207488 <schedule+0x96>
ffffffffc020742e:	00093783          	ld	a5,0(s2)
ffffffffc0207432:	6088                	ld	a0,0(s1)
ffffffffc0207434:	739c                	ld	a5,32(a5)
ffffffffc0207436:	9782                	jalr	a5
ffffffffc0207438:	85aa                	mv	a1,a0
ffffffffc020743a:	c131                	beqz	a0,ffffffffc020747e <schedule+0x8c>
ffffffffc020743c:	00093783          	ld	a5,0(s2)
ffffffffc0207440:	6088                	ld	a0,0(s1)
ffffffffc0207442:	e42e                	sd	a1,8(sp)
ffffffffc0207444:	6f9c                	ld	a5,24(a5)
ffffffffc0207446:	9782                	jalr	a5
ffffffffc0207448:	65a2                	ld	a1,8(sp)
ffffffffc020744a:	459c                	lw	a5,8(a1)
ffffffffc020744c:	6018                	ld	a4,0(s0)
ffffffffc020744e:	2785                	addiw	a5,a5,1
ffffffffc0207450:	c59c                	sw	a5,8(a1)
ffffffffc0207452:	00b70563          	beq	a4,a1,ffffffffc020745c <schedule+0x6a>
ffffffffc0207456:	852e                	mv	a0,a1
ffffffffc0207458:	85bfe0ef          	jal	ffffffffc0205cb2 <proc_run>
ffffffffc020745c:	00099963          	bnez	s3,ffffffffc020746e <schedule+0x7c>
ffffffffc0207460:	70e2                	ld	ra,56(sp)
ffffffffc0207462:	7442                	ld	s0,48(sp)
ffffffffc0207464:	74a2                	ld	s1,40(sp)
ffffffffc0207466:	7902                	ld	s2,32(sp)
ffffffffc0207468:	69e2                	ld	s3,24(sp)
ffffffffc020746a:	6121                	addi	sp,sp,64
ffffffffc020746c:	8082                	ret
ffffffffc020746e:	7442                	ld	s0,48(sp)
ffffffffc0207470:	70e2                	ld	ra,56(sp)
ffffffffc0207472:	74a2                	ld	s1,40(sp)
ffffffffc0207474:	7902                	ld	s2,32(sp)
ffffffffc0207476:	69e2                	ld	s3,24(sp)
ffffffffc0207478:	6121                	addi	sp,sp,64
ffffffffc020747a:	f58f906f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc020747e:	0008f597          	auipc	a1,0x8f
ffffffffc0207482:	45a5b583          	ld	a1,1114(a1) # ffffffffc02968d8 <idleproc>
ffffffffc0207486:	b7d1                	j	ffffffffc020744a <schedule+0x58>
ffffffffc0207488:	0008f797          	auipc	a5,0x8f
ffffffffc020748c:	4507b783          	ld	a5,1104(a5) # ffffffffc02968d8 <idleproc>
ffffffffc0207490:	f8f58fe3          	beq	a1,a5,ffffffffc020742e <schedule+0x3c>
ffffffffc0207494:	00093783          	ld	a5,0(s2)
ffffffffc0207498:	6088                	ld	a0,0(s1)
ffffffffc020749a:	6b9c                	ld	a5,16(a5)
ffffffffc020749c:	9782                	jalr	a5
ffffffffc020749e:	bf41                	j	ffffffffc020742e <schedule+0x3c>
ffffffffc02074a0:	f38f90ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02074a4:	4985                	li	s3,1
ffffffffc02074a6:	b78d                	j	ffffffffc0207408 <schedule+0x16>

ffffffffc02074a8 <add_timer>:
ffffffffc02074a8:	1101                	addi	sp,sp,-32
ffffffffc02074aa:	ec06                	sd	ra,24(sp)
ffffffffc02074ac:	100027f3          	csrr	a5,sstatus
ffffffffc02074b0:	8b89                	andi	a5,a5,2
ffffffffc02074b2:	4801                	li	a6,0
ffffffffc02074b4:	e7bd                	bnez	a5,ffffffffc0207522 <add_timer+0x7a>
ffffffffc02074b6:	4118                	lw	a4,0(a0)
ffffffffc02074b8:	cb3d                	beqz	a4,ffffffffc020752e <add_timer+0x86>
ffffffffc02074ba:	651c                	ld	a5,8(a0)
ffffffffc02074bc:	cbad                	beqz	a5,ffffffffc020752e <add_timer+0x86>
ffffffffc02074be:	6d1c                	ld	a5,24(a0)
ffffffffc02074c0:	01050593          	addi	a1,a0,16
ffffffffc02074c4:	08f59563          	bne	a1,a5,ffffffffc020754e <add_timer+0xa6>
ffffffffc02074c8:	0008e617          	auipc	a2,0x8e
ffffffffc02074cc:	32860613          	addi	a2,a2,808 # ffffffffc02957f0 <timer_list>
ffffffffc02074d0:	661c                	ld	a5,8(a2)
ffffffffc02074d2:	00c79863          	bne	a5,a2,ffffffffc02074e2 <add_timer+0x3a>
ffffffffc02074d6:	a805                	j	ffffffffc0207506 <add_timer+0x5e>
ffffffffc02074d8:	679c                	ld	a5,8(a5)
ffffffffc02074da:	9f15                	subw	a4,a4,a3
ffffffffc02074dc:	c118                	sw	a4,0(a0)
ffffffffc02074de:	02c78463          	beq	a5,a2,ffffffffc0207506 <add_timer+0x5e>
ffffffffc02074e2:	ff07a683          	lw	a3,-16(a5)
ffffffffc02074e6:	fed779e3          	bgeu	a4,a3,ffffffffc02074d8 <add_timer+0x30>
ffffffffc02074ea:	9e99                	subw	a3,a3,a4
ffffffffc02074ec:	6398                	ld	a4,0(a5)
ffffffffc02074ee:	fed7a823          	sw	a3,-16(a5)
ffffffffc02074f2:	e38c                	sd	a1,0(a5)
ffffffffc02074f4:	e70c                	sd	a1,8(a4)
ffffffffc02074f6:	e918                	sd	a4,16(a0)
ffffffffc02074f8:	ed1c                	sd	a5,24(a0)
ffffffffc02074fa:	02080163          	beqz	a6,ffffffffc020751c <add_timer+0x74>
ffffffffc02074fe:	60e2                	ld	ra,24(sp)
ffffffffc0207500:	6105                	addi	sp,sp,32
ffffffffc0207502:	ed0f906f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc0207506:	0008e797          	auipc	a5,0x8e
ffffffffc020750a:	2ea78793          	addi	a5,a5,746 # ffffffffc02957f0 <timer_list>
ffffffffc020750e:	6398                	ld	a4,0(a5)
ffffffffc0207510:	e38c                	sd	a1,0(a5)
ffffffffc0207512:	e70c                	sd	a1,8(a4)
ffffffffc0207514:	e918                	sd	a4,16(a0)
ffffffffc0207516:	ed1c                	sd	a5,24(a0)
ffffffffc0207518:	fe0813e3          	bnez	a6,ffffffffc02074fe <add_timer+0x56>
ffffffffc020751c:	60e2                	ld	ra,24(sp)
ffffffffc020751e:	6105                	addi	sp,sp,32
ffffffffc0207520:	8082                	ret
ffffffffc0207522:	e42a                	sd	a0,8(sp)
ffffffffc0207524:	eb4f90ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0207528:	6522                	ld	a0,8(sp)
ffffffffc020752a:	4805                	li	a6,1
ffffffffc020752c:	b769                	j	ffffffffc02074b6 <add_timer+0xe>
ffffffffc020752e:	00006697          	auipc	a3,0x6
ffffffffc0207532:	4c268693          	addi	a3,a3,1218 # ffffffffc020d9f0 <etext+0x22dc>
ffffffffc0207536:	00004617          	auipc	a2,0x4
ffffffffc020753a:	61a60613          	addi	a2,a2,1562 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020753e:	07a00593          	li	a1,122
ffffffffc0207542:	00006517          	auipc	a0,0x6
ffffffffc0207546:	47650513          	addi	a0,a0,1142 # ffffffffc020d9b8 <etext+0x22a4>
ffffffffc020754a:	f01f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc020754e:	00006697          	auipc	a3,0x6
ffffffffc0207552:	4d268693          	addi	a3,a3,1234 # ffffffffc020da20 <etext+0x230c>
ffffffffc0207556:	00004617          	auipc	a2,0x4
ffffffffc020755a:	5fa60613          	addi	a2,a2,1530 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020755e:	07b00593          	li	a1,123
ffffffffc0207562:	00006517          	auipc	a0,0x6
ffffffffc0207566:	45650513          	addi	a0,a0,1110 # ffffffffc020d9b8 <etext+0x22a4>
ffffffffc020756a:	ee1f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc020756e <del_timer>:
ffffffffc020756e:	100027f3          	csrr	a5,sstatus
ffffffffc0207572:	8b89                	andi	a5,a5,2
ffffffffc0207574:	ef95                	bnez	a5,ffffffffc02075b0 <del_timer+0x42>
ffffffffc0207576:	6d1c                	ld	a5,24(a0)
ffffffffc0207578:	01050713          	addi	a4,a0,16
ffffffffc020757c:	4601                	li	a2,0
ffffffffc020757e:	02f70863          	beq	a4,a5,ffffffffc02075ae <del_timer+0x40>
ffffffffc0207582:	0008e597          	auipc	a1,0x8e
ffffffffc0207586:	26e58593          	addi	a1,a1,622 # ffffffffc02957f0 <timer_list>
ffffffffc020758a:	4114                	lw	a3,0(a0)
ffffffffc020758c:	00b78863          	beq	a5,a1,ffffffffc020759c <del_timer+0x2e>
ffffffffc0207590:	c691                	beqz	a3,ffffffffc020759c <del_timer+0x2e>
ffffffffc0207592:	ff07a583          	lw	a1,-16(a5)
ffffffffc0207596:	9ead                	addw	a3,a3,a1
ffffffffc0207598:	fed7a823          	sw	a3,-16(a5)
ffffffffc020759c:	6914                	ld	a3,16(a0)
ffffffffc020759e:	e69c                	sd	a5,8(a3)
ffffffffc02075a0:	e394                	sd	a3,0(a5)
ffffffffc02075a2:	ed18                	sd	a4,24(a0)
ffffffffc02075a4:	e918                	sd	a4,16(a0)
ffffffffc02075a6:	e211                	bnez	a2,ffffffffc02075aa <del_timer+0x3c>
ffffffffc02075a8:	8082                	ret
ffffffffc02075aa:	e28f906f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc02075ae:	8082                	ret
ffffffffc02075b0:	1101                	addi	sp,sp,-32
ffffffffc02075b2:	e42a                	sd	a0,8(sp)
ffffffffc02075b4:	ec06                	sd	ra,24(sp)
ffffffffc02075b6:	e22f90ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02075ba:	6522                	ld	a0,8(sp)
ffffffffc02075bc:	4605                	li	a2,1
ffffffffc02075be:	6d1c                	ld	a5,24(a0)
ffffffffc02075c0:	01050713          	addi	a4,a0,16
ffffffffc02075c4:	02f70863          	beq	a4,a5,ffffffffc02075f4 <del_timer+0x86>
ffffffffc02075c8:	0008e597          	auipc	a1,0x8e
ffffffffc02075cc:	22858593          	addi	a1,a1,552 # ffffffffc02957f0 <timer_list>
ffffffffc02075d0:	4114                	lw	a3,0(a0)
ffffffffc02075d2:	00b78863          	beq	a5,a1,ffffffffc02075e2 <del_timer+0x74>
ffffffffc02075d6:	c691                	beqz	a3,ffffffffc02075e2 <del_timer+0x74>
ffffffffc02075d8:	ff07a583          	lw	a1,-16(a5)
ffffffffc02075dc:	9ead                	addw	a3,a3,a1
ffffffffc02075de:	fed7a823          	sw	a3,-16(a5)
ffffffffc02075e2:	6914                	ld	a3,16(a0)
ffffffffc02075e4:	e69c                	sd	a5,8(a3)
ffffffffc02075e6:	e394                	sd	a3,0(a5)
ffffffffc02075e8:	ed18                	sd	a4,24(a0)
ffffffffc02075ea:	e918                	sd	a4,16(a0)
ffffffffc02075ec:	e601                	bnez	a2,ffffffffc02075f4 <del_timer+0x86>
ffffffffc02075ee:	60e2                	ld	ra,24(sp)
ffffffffc02075f0:	6105                	addi	sp,sp,32
ffffffffc02075f2:	8082                	ret
ffffffffc02075f4:	60e2                	ld	ra,24(sp)
ffffffffc02075f6:	6105                	addi	sp,sp,32
ffffffffc02075f8:	ddaf906f          	j	ffffffffc0200bd2 <intr_enable>

ffffffffc02075fc <run_timer_list>:
ffffffffc02075fc:	7179                	addi	sp,sp,-48
ffffffffc02075fe:	f406                	sd	ra,40(sp)
ffffffffc0207600:	f022                	sd	s0,32(sp)
ffffffffc0207602:	e44e                	sd	s3,8(sp)
ffffffffc0207604:	e052                	sd	s4,0(sp)
ffffffffc0207606:	100027f3          	csrr	a5,sstatus
ffffffffc020760a:	8b89                	andi	a5,a5,2
ffffffffc020760c:	0e079b63          	bnez	a5,ffffffffc0207702 <run_timer_list+0x106>
ffffffffc0207610:	0008e997          	auipc	s3,0x8e
ffffffffc0207614:	1e098993          	addi	s3,s3,480 # ffffffffc02957f0 <timer_list>
ffffffffc0207618:	0089b403          	ld	s0,8(s3)
ffffffffc020761c:	4a01                	li	s4,0
ffffffffc020761e:	0d340463          	beq	s0,s3,ffffffffc02076e6 <run_timer_list+0xea>
ffffffffc0207622:	ff042783          	lw	a5,-16(s0)
ffffffffc0207626:	12078763          	beqz	a5,ffffffffc0207754 <run_timer_list+0x158>
ffffffffc020762a:	e84a                	sd	s2,16(sp)
ffffffffc020762c:	37fd                	addiw	a5,a5,-1
ffffffffc020762e:	fef42823          	sw	a5,-16(s0)
ffffffffc0207632:	ff040913          	addi	s2,s0,-16
ffffffffc0207636:	efb1                	bnez	a5,ffffffffc0207692 <run_timer_list+0x96>
ffffffffc0207638:	ec26                	sd	s1,24(sp)
ffffffffc020763a:	a005                	j	ffffffffc020765a <run_timer_list+0x5e>
ffffffffc020763c:	0e07dc63          	bgez	a5,ffffffffc0207734 <run_timer_list+0x138>
ffffffffc0207640:	8526                	mv	a0,s1
ffffffffc0207642:	cb9ff0ef          	jal	ffffffffc02072fa <wakeup_proc>
ffffffffc0207646:	854a                	mv	a0,s2
ffffffffc0207648:	f27ff0ef          	jal	ffffffffc020756e <del_timer>
ffffffffc020764c:	05340263          	beq	s0,s3,ffffffffc0207690 <run_timer_list+0x94>
ffffffffc0207650:	ff042783          	lw	a5,-16(s0)
ffffffffc0207654:	ff040913          	addi	s2,s0,-16
ffffffffc0207658:	ef85                	bnez	a5,ffffffffc0207690 <run_timer_list+0x94>
ffffffffc020765a:	00893483          	ld	s1,8(s2)
ffffffffc020765e:	6400                	ld	s0,8(s0)
ffffffffc0207660:	0ec4a783          	lw	a5,236(s1)
ffffffffc0207664:	ffe1                	bnez	a5,ffffffffc020763c <run_timer_list+0x40>
ffffffffc0207666:	40d4                	lw	a3,4(s1)
ffffffffc0207668:	00006617          	auipc	a2,0x6
ffffffffc020766c:	42060613          	addi	a2,a2,1056 # ffffffffc020da88 <etext+0x2374>
ffffffffc0207670:	0ba00593          	li	a1,186
ffffffffc0207674:	00006517          	auipc	a0,0x6
ffffffffc0207678:	34450513          	addi	a0,a0,836 # ffffffffc020d9b8 <etext+0x22a4>
ffffffffc020767c:	e39f80ef          	jal	ffffffffc02004b4 <__warn>
ffffffffc0207680:	8526                	mv	a0,s1
ffffffffc0207682:	c79ff0ef          	jal	ffffffffc02072fa <wakeup_proc>
ffffffffc0207686:	854a                	mv	a0,s2
ffffffffc0207688:	ee7ff0ef          	jal	ffffffffc020756e <del_timer>
ffffffffc020768c:	fd3412e3          	bne	s0,s3,ffffffffc0207650 <run_timer_list+0x54>
ffffffffc0207690:	64e2                	ld	s1,24(sp)
ffffffffc0207692:	0008f597          	auipc	a1,0x8f
ffffffffc0207696:	2365b583          	ld	a1,566(a1) # ffffffffc02968c8 <current>
ffffffffc020769a:	cd85                	beqz	a1,ffffffffc02076d2 <run_timer_list+0xd6>
ffffffffc020769c:	0008f797          	auipc	a5,0x8f
ffffffffc02076a0:	23c7b783          	ld	a5,572(a5) # ffffffffc02968d8 <idleproc>
ffffffffc02076a4:	02f58563          	beq	a1,a5,ffffffffc02076ce <run_timer_list+0xd2>
ffffffffc02076a8:	6942                	ld	s2,16(sp)
ffffffffc02076aa:	0008f797          	auipc	a5,0x8f
ffffffffc02076ae:	23e7b783          	ld	a5,574(a5) # ffffffffc02968e8 <sched_class>
ffffffffc02076b2:	0008f517          	auipc	a0,0x8f
ffffffffc02076b6:	22e53503          	ld	a0,558(a0) # ffffffffc02968e0 <rq>
ffffffffc02076ba:	779c                	ld	a5,40(a5)
ffffffffc02076bc:	9782                	jalr	a5
ffffffffc02076be:	000a1d63          	bnez	s4,ffffffffc02076d8 <run_timer_list+0xdc>
ffffffffc02076c2:	70a2                	ld	ra,40(sp)
ffffffffc02076c4:	7402                	ld	s0,32(sp)
ffffffffc02076c6:	69a2                	ld	s3,8(sp)
ffffffffc02076c8:	6a02                	ld	s4,0(sp)
ffffffffc02076ca:	6145                	addi	sp,sp,48
ffffffffc02076cc:	8082                	ret
ffffffffc02076ce:	4785                	li	a5,1
ffffffffc02076d0:	ed9c                	sd	a5,24(a1)
ffffffffc02076d2:	6942                	ld	s2,16(sp)
ffffffffc02076d4:	fe0a07e3          	beqz	s4,ffffffffc02076c2 <run_timer_list+0xc6>
ffffffffc02076d8:	7402                	ld	s0,32(sp)
ffffffffc02076da:	70a2                	ld	ra,40(sp)
ffffffffc02076dc:	69a2                	ld	s3,8(sp)
ffffffffc02076de:	6a02                	ld	s4,0(sp)
ffffffffc02076e0:	6145                	addi	sp,sp,48
ffffffffc02076e2:	cf0f906f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc02076e6:	0008f597          	auipc	a1,0x8f
ffffffffc02076ea:	1e25b583          	ld	a1,482(a1) # ffffffffc02968c8 <current>
ffffffffc02076ee:	d9f1                	beqz	a1,ffffffffc02076c2 <run_timer_list+0xc6>
ffffffffc02076f0:	0008f797          	auipc	a5,0x8f
ffffffffc02076f4:	1e87b783          	ld	a5,488(a5) # ffffffffc02968d8 <idleproc>
ffffffffc02076f8:	fab799e3          	bne	a5,a1,ffffffffc02076aa <run_timer_list+0xae>
ffffffffc02076fc:	4705                	li	a4,1
ffffffffc02076fe:	ef98                	sd	a4,24(a5)
ffffffffc0207700:	b7c9                	j	ffffffffc02076c2 <run_timer_list+0xc6>
ffffffffc0207702:	0008e997          	auipc	s3,0x8e
ffffffffc0207706:	0ee98993          	addi	s3,s3,238 # ffffffffc02957f0 <timer_list>
ffffffffc020770a:	ccef90ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc020770e:	0089b403          	ld	s0,8(s3)
ffffffffc0207712:	4a05                	li	s4,1
ffffffffc0207714:	f13417e3          	bne	s0,s3,ffffffffc0207622 <run_timer_list+0x26>
ffffffffc0207718:	0008f597          	auipc	a1,0x8f
ffffffffc020771c:	1b05b583          	ld	a1,432(a1) # ffffffffc02968c8 <current>
ffffffffc0207720:	ddc5                	beqz	a1,ffffffffc02076d8 <run_timer_list+0xdc>
ffffffffc0207722:	0008f797          	auipc	a5,0x8f
ffffffffc0207726:	1b67b783          	ld	a5,438(a5) # ffffffffc02968d8 <idleproc>
ffffffffc020772a:	f8f590e3          	bne	a1,a5,ffffffffc02076aa <run_timer_list+0xae>
ffffffffc020772e:	0145bc23          	sd	s4,24(a1)
ffffffffc0207732:	b75d                	j	ffffffffc02076d8 <run_timer_list+0xdc>
ffffffffc0207734:	00006697          	auipc	a3,0x6
ffffffffc0207738:	32c68693          	addi	a3,a3,812 # ffffffffc020da60 <etext+0x234c>
ffffffffc020773c:	00004617          	auipc	a2,0x4
ffffffffc0207740:	41460613          	addi	a2,a2,1044 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207744:	0b600593          	li	a1,182
ffffffffc0207748:	00006517          	auipc	a0,0x6
ffffffffc020774c:	27050513          	addi	a0,a0,624 # ffffffffc020d9b8 <etext+0x22a4>
ffffffffc0207750:	cfbf80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207754:	00006697          	auipc	a3,0x6
ffffffffc0207758:	2f468693          	addi	a3,a3,756 # ffffffffc020da48 <etext+0x2334>
ffffffffc020775c:	00004617          	auipc	a2,0x4
ffffffffc0207760:	3f460613          	addi	a2,a2,1012 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207764:	0ae00593          	li	a1,174
ffffffffc0207768:	00006517          	auipc	a0,0x6
ffffffffc020776c:	25050513          	addi	a0,a0,592 # ffffffffc020d9b8 <etext+0x22a4>
ffffffffc0207770:	ec26                	sd	s1,24(sp)
ffffffffc0207772:	e84a                	sd	s2,16(sp)
ffffffffc0207774:	cd7f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207778 <sys_getpid>:
ffffffffc0207778:	0008f797          	auipc	a5,0x8f
ffffffffc020777c:	1507b783          	ld	a5,336(a5) # ffffffffc02968c8 <current>
ffffffffc0207780:	43c8                	lw	a0,4(a5)
ffffffffc0207782:	8082                	ret

ffffffffc0207784 <sys_pgdir>:
ffffffffc0207784:	4501                	li	a0,0
ffffffffc0207786:	8082                	ret

ffffffffc0207788 <sys_gettime>:
ffffffffc0207788:	0008f797          	auipc	a5,0x8f
ffffffffc020778c:	0e87b783          	ld	a5,232(a5) # ffffffffc0296870 <ticks>
ffffffffc0207790:	0027951b          	slliw	a0,a5,0x2
ffffffffc0207794:	9d3d                	addw	a0,a0,a5
ffffffffc0207796:	0015151b          	slliw	a0,a0,0x1
ffffffffc020779a:	8082                	ret

ffffffffc020779c <sys_lab6_set_priority>:
ffffffffc020779c:	4108                	lw	a0,0(a0)
ffffffffc020779e:	1141                	addi	sp,sp,-16
ffffffffc02077a0:	e406                	sd	ra,8(sp)
ffffffffc02077a2:	901ff0ef          	jal	ffffffffc02070a2 <lab6_set_priority>
ffffffffc02077a6:	60a2                	ld	ra,8(sp)
ffffffffc02077a8:	4501                	li	a0,0
ffffffffc02077aa:	0141                	addi	sp,sp,16
ffffffffc02077ac:	8082                	ret

ffffffffc02077ae <sys_dup>:
ffffffffc02077ae:	450c                	lw	a1,8(a0)
ffffffffc02077b0:	4108                	lw	a0,0(a0)
ffffffffc02077b2:	b50fe06f          	j	ffffffffc0205b02 <sysfile_dup>

ffffffffc02077b6 <sys_getdirentry>:
ffffffffc02077b6:	650c                	ld	a1,8(a0)
ffffffffc02077b8:	4108                	lw	a0,0(a0)
ffffffffc02077ba:	a58fe06f          	j	ffffffffc0205a12 <sysfile_getdirentry>

ffffffffc02077be <sys_getcwd>:
ffffffffc02077be:	650c                	ld	a1,8(a0)
ffffffffc02077c0:	6108                	ld	a0,0(a0)
ffffffffc02077c2:	9a6fe06f          	j	ffffffffc0205968 <sysfile_getcwd>

ffffffffc02077c6 <sys_fsync>:
ffffffffc02077c6:	4108                	lw	a0,0(a0)
ffffffffc02077c8:	99cfe06f          	j	ffffffffc0205964 <sysfile_fsync>

ffffffffc02077cc <sys_fstat>:
ffffffffc02077cc:	650c                	ld	a1,8(a0)
ffffffffc02077ce:	4108                	lw	a0,0(a0)
ffffffffc02077d0:	90cfe06f          	j	ffffffffc02058dc <sysfile_fstat>

ffffffffc02077d4 <sys_seek>:
ffffffffc02077d4:	4910                	lw	a2,16(a0)
ffffffffc02077d6:	650c                	ld	a1,8(a0)
ffffffffc02077d8:	4108                	lw	a0,0(a0)
ffffffffc02077da:	8fefe06f          	j	ffffffffc02058d8 <sysfile_seek>

ffffffffc02077de <sys_write>:
ffffffffc02077de:	6910                	ld	a2,16(a0)
ffffffffc02077e0:	650c                	ld	a1,8(a0)
ffffffffc02077e2:	4108                	lw	a0,0(a0)
ffffffffc02077e4:	fc3fd06f          	j	ffffffffc02057a6 <sysfile_write>

ffffffffc02077e8 <sys_read>:
ffffffffc02077e8:	6910                	ld	a2,16(a0)
ffffffffc02077ea:	650c                	ld	a1,8(a0)
ffffffffc02077ec:	4108                	lw	a0,0(a0)
ffffffffc02077ee:	e6dfd06f          	j	ffffffffc020565a <sysfile_read>

ffffffffc02077f2 <sys_close>:
ffffffffc02077f2:	4108                	lw	a0,0(a0)
ffffffffc02077f4:	e63fd06f          	j	ffffffffc0205656 <sysfile_close>

ffffffffc02077f8 <sys_open>:
ffffffffc02077f8:	450c                	lw	a1,8(a0)
ffffffffc02077fa:	6108                	ld	a0,0(a0)
ffffffffc02077fc:	e25fd06f          	j	ffffffffc0205620 <sysfile_open>

ffffffffc0207800 <sys_putc>:
ffffffffc0207800:	4108                	lw	a0,0(a0)
ffffffffc0207802:	1141                	addi	sp,sp,-16
ffffffffc0207804:	e406                	sd	ra,8(sp)
ffffffffc0207806:	9dbf80ef          	jal	ffffffffc02001e0 <cputchar>
ffffffffc020780a:	60a2                	ld	ra,8(sp)
ffffffffc020780c:	4501                	li	a0,0
ffffffffc020780e:	0141                	addi	sp,sp,16
ffffffffc0207810:	8082                	ret

ffffffffc0207812 <sys_kill>:
ffffffffc0207812:	4108                	lw	a0,0(a0)
ffffffffc0207814:	e28ff06f          	j	ffffffffc0206e3c <do_kill>

ffffffffc0207818 <sys_sleep>:
ffffffffc0207818:	4108                	lw	a0,0(a0)
ffffffffc020781a:	8b7ff06f          	j	ffffffffc02070d0 <do_sleep>

ffffffffc020781e <sys_yield>:
ffffffffc020781e:	dd4ff06f          	j	ffffffffc0206df2 <do_yield>

ffffffffc0207822 <sys_exec>:
ffffffffc0207822:	6910                	ld	a2,16(a0)
ffffffffc0207824:	450c                	lw	a1,8(a0)
ffffffffc0207826:	6108                	ld	a0,0(a0)
ffffffffc0207828:	debfe06f          	j	ffffffffc0206612 <do_execve>

ffffffffc020782c <sys_wait>:
ffffffffc020782c:	650c                	ld	a1,8(a0)
ffffffffc020782e:	4108                	lw	a0,0(a0)
ffffffffc0207830:	dd2ff06f          	j	ffffffffc0206e02 <do_wait>

ffffffffc0207834 <sys_fork>:
ffffffffc0207834:	0008f797          	auipc	a5,0x8f
ffffffffc0207838:	0947b783          	ld	a5,148(a5) # ffffffffc02968c8 <current>
ffffffffc020783c:	4501                	li	a0,0
ffffffffc020783e:	73d0                	ld	a2,160(a5)
ffffffffc0207840:	6a0c                	ld	a1,16(a2)
ffffffffc0207842:	ce0fe06f          	j	ffffffffc0205d22 <do_fork>

ffffffffc0207846 <sys_exit>:
ffffffffc0207846:	4108                	lw	a0,0(a0)
ffffffffc0207848:	939fe06f          	j	ffffffffc0206180 <do_exit>

ffffffffc020784c <syscall>:
ffffffffc020784c:	0008f697          	auipc	a3,0x8f
ffffffffc0207850:	07c6b683          	ld	a3,124(a3) # ffffffffc02968c8 <current>
ffffffffc0207854:	715d                	addi	sp,sp,-80
ffffffffc0207856:	e0a2                	sd	s0,64(sp)
ffffffffc0207858:	72c0                	ld	s0,160(a3)
ffffffffc020785a:	e486                	sd	ra,72(sp)
ffffffffc020785c:	0ff00793          	li	a5,255
ffffffffc0207860:	4834                	lw	a3,80(s0)
ffffffffc0207862:	02d7ec63          	bltu	a5,a3,ffffffffc020789a <syscall+0x4e>
ffffffffc0207866:	00007797          	auipc	a5,0x7
ffffffffc020786a:	4ca78793          	addi	a5,a5,1226 # ffffffffc020ed30 <syscalls>
ffffffffc020786e:	00369613          	slli	a2,a3,0x3
ffffffffc0207872:	97b2                	add	a5,a5,a2
ffffffffc0207874:	639c                	ld	a5,0(a5)
ffffffffc0207876:	c395                	beqz	a5,ffffffffc020789a <syscall+0x4e>
ffffffffc0207878:	7028                	ld	a0,96(s0)
ffffffffc020787a:	742c                	ld	a1,104(s0)
ffffffffc020787c:	7830                	ld	a2,112(s0)
ffffffffc020787e:	7c34                	ld	a3,120(s0)
ffffffffc0207880:	6c38                	ld	a4,88(s0)
ffffffffc0207882:	f02a                	sd	a0,32(sp)
ffffffffc0207884:	f42e                	sd	a1,40(sp)
ffffffffc0207886:	f832                	sd	a2,48(sp)
ffffffffc0207888:	fc36                	sd	a3,56(sp)
ffffffffc020788a:	ec3a                	sd	a4,24(sp)
ffffffffc020788c:	0828                	addi	a0,sp,24
ffffffffc020788e:	9782                	jalr	a5
ffffffffc0207890:	60a6                	ld	ra,72(sp)
ffffffffc0207892:	e828                	sd	a0,80(s0)
ffffffffc0207894:	6406                	ld	s0,64(sp)
ffffffffc0207896:	6161                	addi	sp,sp,80
ffffffffc0207898:	8082                	ret
ffffffffc020789a:	8522                	mv	a0,s0
ffffffffc020789c:	e436                	sd	a3,8(sp)
ffffffffc020789e:	e4ef90ef          	jal	ffffffffc0200eec <print_trapframe>
ffffffffc02078a2:	0008f797          	auipc	a5,0x8f
ffffffffc02078a6:	0267b783          	ld	a5,38(a5) # ffffffffc02968c8 <current>
ffffffffc02078aa:	66a2                	ld	a3,8(sp)
ffffffffc02078ac:	00006617          	auipc	a2,0x6
ffffffffc02078b0:	1fc60613          	addi	a2,a2,508 # ffffffffc020daa8 <etext+0x2394>
ffffffffc02078b4:	43d8                	lw	a4,4(a5)
ffffffffc02078b6:	0d800593          	li	a1,216
ffffffffc02078ba:	0b478793          	addi	a5,a5,180
ffffffffc02078be:	00006517          	auipc	a0,0x6
ffffffffc02078c2:	21a50513          	addi	a0,a0,538 # ffffffffc020dad8 <etext+0x23c4>
ffffffffc02078c6:	b85f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc02078ca <__alloc_inode>:
ffffffffc02078ca:	1141                	addi	sp,sp,-16
ffffffffc02078cc:	e022                	sd	s0,0(sp)
ffffffffc02078ce:	842a                	mv	s0,a0
ffffffffc02078d0:	07800513          	li	a0,120
ffffffffc02078d4:	e406                	sd	ra,8(sp)
ffffffffc02078d6:	eeafa0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc02078da:	c111                	beqz	a0,ffffffffc02078de <__alloc_inode+0x14>
ffffffffc02078dc:	cd20                	sw	s0,88(a0)
ffffffffc02078de:	60a2                	ld	ra,8(sp)
ffffffffc02078e0:	6402                	ld	s0,0(sp)
ffffffffc02078e2:	0141                	addi	sp,sp,16
ffffffffc02078e4:	8082                	ret

ffffffffc02078e6 <inode_init>:
ffffffffc02078e6:	4785                	li	a5,1
ffffffffc02078e8:	06052023          	sw	zero,96(a0)
ffffffffc02078ec:	f92c                	sd	a1,112(a0)
ffffffffc02078ee:	f530                	sd	a2,104(a0)
ffffffffc02078f0:	cd7c                	sw	a5,92(a0)
ffffffffc02078f2:	8082                	ret

ffffffffc02078f4 <inode_kill>:
ffffffffc02078f4:	4d78                	lw	a4,92(a0)
ffffffffc02078f6:	1141                	addi	sp,sp,-16
ffffffffc02078f8:	e406                	sd	ra,8(sp)
ffffffffc02078fa:	e719                	bnez	a4,ffffffffc0207908 <inode_kill+0x14>
ffffffffc02078fc:	513c                	lw	a5,96(a0)
ffffffffc02078fe:	e78d                	bnez	a5,ffffffffc0207928 <inode_kill+0x34>
ffffffffc0207900:	60a2                	ld	ra,8(sp)
ffffffffc0207902:	0141                	addi	sp,sp,16
ffffffffc0207904:	f62fa06f          	j	ffffffffc0202066 <kfree>
ffffffffc0207908:	00006697          	auipc	a3,0x6
ffffffffc020790c:	1e868693          	addi	a3,a3,488 # ffffffffc020daf0 <etext+0x23dc>
ffffffffc0207910:	00004617          	auipc	a2,0x4
ffffffffc0207914:	24060613          	addi	a2,a2,576 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207918:	02900593          	li	a1,41
ffffffffc020791c:	00006517          	auipc	a0,0x6
ffffffffc0207920:	1f450513          	addi	a0,a0,500 # ffffffffc020db10 <etext+0x23fc>
ffffffffc0207924:	b27f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207928:	00006697          	auipc	a3,0x6
ffffffffc020792c:	20068693          	addi	a3,a3,512 # ffffffffc020db28 <etext+0x2414>
ffffffffc0207930:	00004617          	auipc	a2,0x4
ffffffffc0207934:	22060613          	addi	a2,a2,544 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207938:	02a00593          	li	a1,42
ffffffffc020793c:	00006517          	auipc	a0,0x6
ffffffffc0207940:	1d450513          	addi	a0,a0,468 # ffffffffc020db10 <etext+0x23fc>
ffffffffc0207944:	b07f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207948 <inode_ref_inc>:
ffffffffc0207948:	4d7c                	lw	a5,92(a0)
ffffffffc020794a:	2785                	addiw	a5,a5,1
ffffffffc020794c:	cd7c                	sw	a5,92(a0)
ffffffffc020794e:	853e                	mv	a0,a5
ffffffffc0207950:	8082                	ret

ffffffffc0207952 <inode_open_inc>:
ffffffffc0207952:	513c                	lw	a5,96(a0)
ffffffffc0207954:	2785                	addiw	a5,a5,1
ffffffffc0207956:	d13c                	sw	a5,96(a0)
ffffffffc0207958:	853e                	mv	a0,a5
ffffffffc020795a:	8082                	ret

ffffffffc020795c <inode_check>:
ffffffffc020795c:	1141                	addi	sp,sp,-16
ffffffffc020795e:	e406                	sd	ra,8(sp)
ffffffffc0207960:	c91d                	beqz	a0,ffffffffc0207996 <inode_check+0x3a>
ffffffffc0207962:	793c                	ld	a5,112(a0)
ffffffffc0207964:	cb8d                	beqz	a5,ffffffffc0207996 <inode_check+0x3a>
ffffffffc0207966:	6398                	ld	a4,0(a5)
ffffffffc0207968:	4625d7b7          	lui	a5,0x4625d
ffffffffc020796c:	0786                	slli	a5,a5,0x1
ffffffffc020796e:	47678793          	addi	a5,a5,1142 # 4625d476 <_binary_bin_sfs_img_size+0x461e8176>
ffffffffc0207972:	08f71263          	bne	a4,a5,ffffffffc02079f6 <inode_check+0x9a>
ffffffffc0207976:	4d74                	lw	a3,92(a0)
ffffffffc0207978:	5138                	lw	a4,96(a0)
ffffffffc020797a:	04e6ce63          	blt	a3,a4,ffffffffc02079d6 <inode_check+0x7a>
ffffffffc020797e:	01f7579b          	srliw	a5,a4,0x1f
ffffffffc0207982:	ebb1                	bnez	a5,ffffffffc02079d6 <inode_check+0x7a>
ffffffffc0207984:	67c1                	lui	a5,0x10
ffffffffc0207986:	17fd                	addi	a5,a5,-1 # ffff <_binary_bin_swap_img_size+0x82ff>
ffffffffc0207988:	02d7c763          	blt	a5,a3,ffffffffc02079b6 <inode_check+0x5a>
ffffffffc020798c:	02e7c563          	blt	a5,a4,ffffffffc02079b6 <inode_check+0x5a>
ffffffffc0207990:	60a2                	ld	ra,8(sp)
ffffffffc0207992:	0141                	addi	sp,sp,16
ffffffffc0207994:	8082                	ret
ffffffffc0207996:	00006697          	auipc	a3,0x6
ffffffffc020799a:	1b268693          	addi	a3,a3,434 # ffffffffc020db48 <etext+0x2434>
ffffffffc020799e:	00004617          	auipc	a2,0x4
ffffffffc02079a2:	1b260613          	addi	a2,a2,434 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02079a6:	06e00593          	li	a1,110
ffffffffc02079aa:	00006517          	auipc	a0,0x6
ffffffffc02079ae:	16650513          	addi	a0,a0,358 # ffffffffc020db10 <etext+0x23fc>
ffffffffc02079b2:	a99f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc02079b6:	00006697          	auipc	a3,0x6
ffffffffc02079ba:	21268693          	addi	a3,a3,530 # ffffffffc020dbc8 <etext+0x24b4>
ffffffffc02079be:	00004617          	auipc	a2,0x4
ffffffffc02079c2:	19260613          	addi	a2,a2,402 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02079c6:	07200593          	li	a1,114
ffffffffc02079ca:	00006517          	auipc	a0,0x6
ffffffffc02079ce:	14650513          	addi	a0,a0,326 # ffffffffc020db10 <etext+0x23fc>
ffffffffc02079d2:	a79f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc02079d6:	00006697          	auipc	a3,0x6
ffffffffc02079da:	1c268693          	addi	a3,a3,450 # ffffffffc020db98 <etext+0x2484>
ffffffffc02079de:	00004617          	auipc	a2,0x4
ffffffffc02079e2:	17260613          	addi	a2,a2,370 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02079e6:	07100593          	li	a1,113
ffffffffc02079ea:	00006517          	auipc	a0,0x6
ffffffffc02079ee:	12650513          	addi	a0,a0,294 # ffffffffc020db10 <etext+0x23fc>
ffffffffc02079f2:	a59f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc02079f6:	00006697          	auipc	a3,0x6
ffffffffc02079fa:	17a68693          	addi	a3,a3,378 # ffffffffc020db70 <etext+0x245c>
ffffffffc02079fe:	00004617          	auipc	a2,0x4
ffffffffc0207a02:	15260613          	addi	a2,a2,338 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207a06:	06f00593          	li	a1,111
ffffffffc0207a0a:	00006517          	auipc	a0,0x6
ffffffffc0207a0e:	10650513          	addi	a0,a0,262 # ffffffffc020db10 <etext+0x23fc>
ffffffffc0207a12:	a39f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207a16 <inode_ref_dec>:
ffffffffc0207a16:	4d7c                	lw	a5,92(a0)
ffffffffc0207a18:	7179                	addi	sp,sp,-48
ffffffffc0207a1a:	f406                	sd	ra,40(sp)
ffffffffc0207a1c:	06f05b63          	blez	a5,ffffffffc0207a92 <inode_ref_dec+0x7c>
ffffffffc0207a20:	37fd                	addiw	a5,a5,-1
ffffffffc0207a22:	cd7c                	sw	a5,92(a0)
ffffffffc0207a24:	e795                	bnez	a5,ffffffffc0207a50 <inode_ref_dec+0x3a>
ffffffffc0207a26:	7934                	ld	a3,112(a0)
ffffffffc0207a28:	c6a9                	beqz	a3,ffffffffc0207a72 <inode_ref_dec+0x5c>
ffffffffc0207a2a:	66b4                	ld	a3,72(a3)
ffffffffc0207a2c:	c2b9                	beqz	a3,ffffffffc0207a72 <inode_ref_dec+0x5c>
ffffffffc0207a2e:	00006597          	auipc	a1,0x6
ffffffffc0207a32:	24a58593          	addi	a1,a1,586 # ffffffffc020dc78 <etext+0x2564>
ffffffffc0207a36:	e83e                	sd	a5,16(sp)
ffffffffc0207a38:	ec2a                	sd	a0,24(sp)
ffffffffc0207a3a:	e436                	sd	a3,8(sp)
ffffffffc0207a3c:	f21ff0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0207a40:	6562                	ld	a0,24(sp)
ffffffffc0207a42:	66a2                	ld	a3,8(sp)
ffffffffc0207a44:	9682                	jalr	a3
ffffffffc0207a46:	00f50713          	addi	a4,a0,15
ffffffffc0207a4a:	67c2                	ld	a5,16(sp)
ffffffffc0207a4c:	c311                	beqz	a4,ffffffffc0207a50 <inode_ref_dec+0x3a>
ffffffffc0207a4e:	e509                	bnez	a0,ffffffffc0207a58 <inode_ref_dec+0x42>
ffffffffc0207a50:	70a2                	ld	ra,40(sp)
ffffffffc0207a52:	853e                	mv	a0,a5
ffffffffc0207a54:	6145                	addi	sp,sp,48
ffffffffc0207a56:	8082                	ret
ffffffffc0207a58:	85aa                	mv	a1,a0
ffffffffc0207a5a:	00006517          	auipc	a0,0x6
ffffffffc0207a5e:	22650513          	addi	a0,a0,550 # ffffffffc020dc80 <etext+0x256c>
ffffffffc0207a62:	e43e                	sd	a5,8(sp)
ffffffffc0207a64:	f42f80ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0207a68:	67a2                	ld	a5,8(sp)
ffffffffc0207a6a:	70a2                	ld	ra,40(sp)
ffffffffc0207a6c:	853e                	mv	a0,a5
ffffffffc0207a6e:	6145                	addi	sp,sp,48
ffffffffc0207a70:	8082                	ret
ffffffffc0207a72:	00006697          	auipc	a3,0x6
ffffffffc0207a76:	1b668693          	addi	a3,a3,438 # ffffffffc020dc28 <etext+0x2514>
ffffffffc0207a7a:	00004617          	auipc	a2,0x4
ffffffffc0207a7e:	0d660613          	addi	a2,a2,214 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207a82:	04400593          	li	a1,68
ffffffffc0207a86:	00006517          	auipc	a0,0x6
ffffffffc0207a8a:	08a50513          	addi	a0,a0,138 # ffffffffc020db10 <etext+0x23fc>
ffffffffc0207a8e:	9bdf80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207a92:	00006697          	auipc	a3,0x6
ffffffffc0207a96:	17668693          	addi	a3,a3,374 # ffffffffc020dc08 <etext+0x24f4>
ffffffffc0207a9a:	00004617          	auipc	a2,0x4
ffffffffc0207a9e:	0b660613          	addi	a2,a2,182 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207aa2:	03f00593          	li	a1,63
ffffffffc0207aa6:	00006517          	auipc	a0,0x6
ffffffffc0207aaa:	06a50513          	addi	a0,a0,106 # ffffffffc020db10 <etext+0x23fc>
ffffffffc0207aae:	99df80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207ab2 <inode_open_dec>:
ffffffffc0207ab2:	513c                	lw	a5,96(a0)
ffffffffc0207ab4:	7179                	addi	sp,sp,-48
ffffffffc0207ab6:	f406                	sd	ra,40(sp)
ffffffffc0207ab8:	06f05863          	blez	a5,ffffffffc0207b28 <inode_open_dec+0x76>
ffffffffc0207abc:	37fd                	addiw	a5,a5,-1
ffffffffc0207abe:	d13c                	sw	a5,96(a0)
ffffffffc0207ac0:	e39d                	bnez	a5,ffffffffc0207ae6 <inode_open_dec+0x34>
ffffffffc0207ac2:	7934                	ld	a3,112(a0)
ffffffffc0207ac4:	c2b1                	beqz	a3,ffffffffc0207b08 <inode_open_dec+0x56>
ffffffffc0207ac6:	6a94                	ld	a3,16(a3)
ffffffffc0207ac8:	c2a1                	beqz	a3,ffffffffc0207b08 <inode_open_dec+0x56>
ffffffffc0207aca:	00006597          	auipc	a1,0x6
ffffffffc0207ace:	24658593          	addi	a1,a1,582 # ffffffffc020dd10 <etext+0x25fc>
ffffffffc0207ad2:	e83e                	sd	a5,16(sp)
ffffffffc0207ad4:	ec2a                	sd	a0,24(sp)
ffffffffc0207ad6:	e436                	sd	a3,8(sp)
ffffffffc0207ad8:	e85ff0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0207adc:	6562                	ld	a0,24(sp)
ffffffffc0207ade:	66a2                	ld	a3,8(sp)
ffffffffc0207ae0:	9682                	jalr	a3
ffffffffc0207ae2:	67c2                	ld	a5,16(sp)
ffffffffc0207ae4:	e509                	bnez	a0,ffffffffc0207aee <inode_open_dec+0x3c>
ffffffffc0207ae6:	70a2                	ld	ra,40(sp)
ffffffffc0207ae8:	853e                	mv	a0,a5
ffffffffc0207aea:	6145                	addi	sp,sp,48
ffffffffc0207aec:	8082                	ret
ffffffffc0207aee:	85aa                	mv	a1,a0
ffffffffc0207af0:	00006517          	auipc	a0,0x6
ffffffffc0207af4:	22850513          	addi	a0,a0,552 # ffffffffc020dd18 <etext+0x2604>
ffffffffc0207af8:	e43e                	sd	a5,8(sp)
ffffffffc0207afa:	eacf80ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0207afe:	67a2                	ld	a5,8(sp)
ffffffffc0207b00:	70a2                	ld	ra,40(sp)
ffffffffc0207b02:	853e                	mv	a0,a5
ffffffffc0207b04:	6145                	addi	sp,sp,48
ffffffffc0207b06:	8082                	ret
ffffffffc0207b08:	00006697          	auipc	a3,0x6
ffffffffc0207b0c:	1b868693          	addi	a3,a3,440 # ffffffffc020dcc0 <etext+0x25ac>
ffffffffc0207b10:	00004617          	auipc	a2,0x4
ffffffffc0207b14:	04060613          	addi	a2,a2,64 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207b18:	06100593          	li	a1,97
ffffffffc0207b1c:	00006517          	auipc	a0,0x6
ffffffffc0207b20:	ff450513          	addi	a0,a0,-12 # ffffffffc020db10 <etext+0x23fc>
ffffffffc0207b24:	927f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207b28:	00006697          	auipc	a3,0x6
ffffffffc0207b2c:	17868693          	addi	a3,a3,376 # ffffffffc020dca0 <etext+0x258c>
ffffffffc0207b30:	00004617          	auipc	a2,0x4
ffffffffc0207b34:	02060613          	addi	a2,a2,32 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207b38:	05c00593          	li	a1,92
ffffffffc0207b3c:	00006517          	auipc	a0,0x6
ffffffffc0207b40:	fd450513          	addi	a0,a0,-44 # ffffffffc020db10 <etext+0x23fc>
ffffffffc0207b44:	907f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207b48 <__alloc_fs>:
ffffffffc0207b48:	1141                	addi	sp,sp,-16
ffffffffc0207b4a:	e022                	sd	s0,0(sp)
ffffffffc0207b4c:	842a                	mv	s0,a0
ffffffffc0207b4e:	0d800513          	li	a0,216
ffffffffc0207b52:	e406                	sd	ra,8(sp)
ffffffffc0207b54:	c6cfa0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0207b58:	c119                	beqz	a0,ffffffffc0207b5e <__alloc_fs+0x16>
ffffffffc0207b5a:	0a852823          	sw	s0,176(a0)
ffffffffc0207b5e:	60a2                	ld	ra,8(sp)
ffffffffc0207b60:	6402                	ld	s0,0(sp)
ffffffffc0207b62:	0141                	addi	sp,sp,16
ffffffffc0207b64:	8082                	ret

ffffffffc0207b66 <vfs_init>:
ffffffffc0207b66:	1141                	addi	sp,sp,-16
ffffffffc0207b68:	4585                	li	a1,1
ffffffffc0207b6a:	0008e517          	auipc	a0,0x8e
ffffffffc0207b6e:	c9650513          	addi	a0,a0,-874 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207b72:	e406                	sd	ra,8(sp)
ffffffffc0207b74:	ac5fc0ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc0207b78:	60a2                	ld	ra,8(sp)
ffffffffc0207b7a:	0141                	addi	sp,sp,16
ffffffffc0207b7c:	a4b1                	j	ffffffffc0207dc8 <vfs_devlist_init>

ffffffffc0207b7e <vfs_set_bootfs>:
ffffffffc0207b7e:	7179                	addi	sp,sp,-48
ffffffffc0207b80:	f022                	sd	s0,32(sp)
ffffffffc0207b82:	f406                	sd	ra,40(sp)
ffffffffc0207b84:	ec02                	sd	zero,24(sp)
ffffffffc0207b86:	842a                	mv	s0,a0
ffffffffc0207b88:	c515                	beqz	a0,ffffffffc0207bb4 <vfs_set_bootfs+0x36>
ffffffffc0207b8a:	03a00593          	li	a1,58
ffffffffc0207b8e:	30d030ef          	jal	ffffffffc020b69a <strchr>
ffffffffc0207b92:	c125                	beqz	a0,ffffffffc0207bf2 <vfs_set_bootfs+0x74>
ffffffffc0207b94:	00154783          	lbu	a5,1(a0)
ffffffffc0207b98:	efa9                	bnez	a5,ffffffffc0207bf2 <vfs_set_bootfs+0x74>
ffffffffc0207b9a:	8522                	mv	a0,s0
ffffffffc0207b9c:	163000ef          	jal	ffffffffc02084fe <vfs_chdir>
ffffffffc0207ba0:	c509                	beqz	a0,ffffffffc0207baa <vfs_set_bootfs+0x2c>
ffffffffc0207ba2:	70a2                	ld	ra,40(sp)
ffffffffc0207ba4:	7402                	ld	s0,32(sp)
ffffffffc0207ba6:	6145                	addi	sp,sp,48
ffffffffc0207ba8:	8082                	ret
ffffffffc0207baa:	0828                	addi	a0,sp,24
ffffffffc0207bac:	05f000ef          	jal	ffffffffc020840a <vfs_get_curdir>
ffffffffc0207bb0:	f96d                	bnez	a0,ffffffffc0207ba2 <vfs_set_bootfs+0x24>
ffffffffc0207bb2:	6462                	ld	s0,24(sp)
ffffffffc0207bb4:	0008e517          	auipc	a0,0x8e
ffffffffc0207bb8:	c4c50513          	addi	a0,a0,-948 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207bbc:	a87fc0ef          	jal	ffffffffc0204642 <down>
ffffffffc0207bc0:	0008f797          	auipc	a5,0x8f
ffffffffc0207bc4:	d307b783          	ld	a5,-720(a5) # ffffffffc02968f0 <bootfs_node>
ffffffffc0207bc8:	0008e517          	auipc	a0,0x8e
ffffffffc0207bcc:	c3850513          	addi	a0,a0,-968 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207bd0:	0008f717          	auipc	a4,0x8f
ffffffffc0207bd4:	d2873023          	sd	s0,-736(a4) # ffffffffc02968f0 <bootfs_node>
ffffffffc0207bd8:	e43e                	sd	a5,8(sp)
ffffffffc0207bda:	a65fc0ef          	jal	ffffffffc020463e <up>
ffffffffc0207bde:	67a2                	ld	a5,8(sp)
ffffffffc0207be0:	c781                	beqz	a5,ffffffffc0207be8 <vfs_set_bootfs+0x6a>
ffffffffc0207be2:	853e                	mv	a0,a5
ffffffffc0207be4:	e33ff0ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc0207be8:	70a2                	ld	ra,40(sp)
ffffffffc0207bea:	7402                	ld	s0,32(sp)
ffffffffc0207bec:	4501                	li	a0,0
ffffffffc0207bee:	6145                	addi	sp,sp,48
ffffffffc0207bf0:	8082                	ret
ffffffffc0207bf2:	5575                	li	a0,-3
ffffffffc0207bf4:	b77d                	j	ffffffffc0207ba2 <vfs_set_bootfs+0x24>

ffffffffc0207bf6 <vfs_get_bootfs>:
ffffffffc0207bf6:	1101                	addi	sp,sp,-32
ffffffffc0207bf8:	e426                	sd	s1,8(sp)
ffffffffc0207bfa:	0008f497          	auipc	s1,0x8f
ffffffffc0207bfe:	cf648493          	addi	s1,s1,-778 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207c02:	609c                	ld	a5,0(s1)
ffffffffc0207c04:	ec06                	sd	ra,24(sp)
ffffffffc0207c06:	c3b1                	beqz	a5,ffffffffc0207c4a <vfs_get_bootfs+0x54>
ffffffffc0207c08:	e822                	sd	s0,16(sp)
ffffffffc0207c0a:	842a                	mv	s0,a0
ffffffffc0207c0c:	0008e517          	auipc	a0,0x8e
ffffffffc0207c10:	bf450513          	addi	a0,a0,-1036 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207c14:	a2ffc0ef          	jal	ffffffffc0204642 <down>
ffffffffc0207c18:	6084                	ld	s1,0(s1)
ffffffffc0207c1a:	c08d                	beqz	s1,ffffffffc0207c3c <vfs_get_bootfs+0x46>
ffffffffc0207c1c:	8526                	mv	a0,s1
ffffffffc0207c1e:	d2bff0ef          	jal	ffffffffc0207948 <inode_ref_inc>
ffffffffc0207c22:	0008e517          	auipc	a0,0x8e
ffffffffc0207c26:	bde50513          	addi	a0,a0,-1058 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207c2a:	a15fc0ef          	jal	ffffffffc020463e <up>
ffffffffc0207c2e:	60e2                	ld	ra,24(sp)
ffffffffc0207c30:	e004                	sd	s1,0(s0)
ffffffffc0207c32:	6442                	ld	s0,16(sp)
ffffffffc0207c34:	64a2                	ld	s1,8(sp)
ffffffffc0207c36:	4501                	li	a0,0
ffffffffc0207c38:	6105                	addi	sp,sp,32
ffffffffc0207c3a:	8082                	ret
ffffffffc0207c3c:	0008e517          	auipc	a0,0x8e
ffffffffc0207c40:	bc450513          	addi	a0,a0,-1084 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207c44:	9fbfc0ef          	jal	ffffffffc020463e <up>
ffffffffc0207c48:	6442                	ld	s0,16(sp)
ffffffffc0207c4a:	60e2                	ld	ra,24(sp)
ffffffffc0207c4c:	64a2                	ld	s1,8(sp)
ffffffffc0207c4e:	5541                	li	a0,-16
ffffffffc0207c50:	6105                	addi	sp,sp,32
ffffffffc0207c52:	8082                	ret

ffffffffc0207c54 <vfs_do_add>:
ffffffffc0207c54:	7139                	addi	sp,sp,-64
ffffffffc0207c56:	fc06                	sd	ra,56(sp)
ffffffffc0207c58:	f822                	sd	s0,48(sp)
ffffffffc0207c5a:	e852                	sd	s4,16(sp)
ffffffffc0207c5c:	e456                	sd	s5,8(sp)
ffffffffc0207c5e:	e05a                	sd	s6,0(sp)
ffffffffc0207c60:	10050f63          	beqz	a0,ffffffffc0207d7e <vfs_do_add+0x12a>
ffffffffc0207c64:	00d5e7b3          	or	a5,a1,a3
ffffffffc0207c68:	842a                	mv	s0,a0
ffffffffc0207c6a:	8a2e                	mv	s4,a1
ffffffffc0207c6c:	8b32                	mv	s6,a2
ffffffffc0207c6e:	8ab6                	mv	s5,a3
ffffffffc0207c70:	cb89                	beqz	a5,ffffffffc0207c82 <vfs_do_add+0x2e>
ffffffffc0207c72:	0e058363          	beqz	a1,ffffffffc0207d58 <vfs_do_add+0x104>
ffffffffc0207c76:	4db8                	lw	a4,88(a1)
ffffffffc0207c78:	6785                	lui	a5,0x1
ffffffffc0207c7a:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207c7e:	0cf71d63          	bne	a4,a5,ffffffffc0207d58 <vfs_do_add+0x104>
ffffffffc0207c82:	8522                	mv	a0,s0
ffffffffc0207c84:	175030ef          	jal	ffffffffc020b5f8 <strlen>
ffffffffc0207c88:	47fd                	li	a5,31
ffffffffc0207c8a:	0ca7e263          	bltu	a5,a0,ffffffffc0207d4e <vfs_do_add+0xfa>
ffffffffc0207c8e:	8522                	mv	a0,s0
ffffffffc0207c90:	f426                	sd	s1,40(sp)
ffffffffc0207c92:	d60f80ef          	jal	ffffffffc02001f2 <strdup>
ffffffffc0207c96:	84aa                	mv	s1,a0
ffffffffc0207c98:	cd4d                	beqz	a0,ffffffffc0207d52 <vfs_do_add+0xfe>
ffffffffc0207c9a:	03000513          	li	a0,48
ffffffffc0207c9e:	ec4e                	sd	s3,24(sp)
ffffffffc0207ca0:	b20fa0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0207ca4:	89aa                	mv	s3,a0
ffffffffc0207ca6:	c935                	beqz	a0,ffffffffc0207d1a <vfs_do_add+0xc6>
ffffffffc0207ca8:	f04a                	sd	s2,32(sp)
ffffffffc0207caa:	0008e517          	auipc	a0,0x8e
ffffffffc0207cae:	b6e50513          	addi	a0,a0,-1170 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207cb2:	0008e917          	auipc	s2,0x8e
ffffffffc0207cb6:	b7e90913          	addi	s2,s2,-1154 # ffffffffc0295830 <vdev_list>
ffffffffc0207cba:	989fc0ef          	jal	ffffffffc0204642 <down>
ffffffffc0207cbe:	844a                	mv	s0,s2
ffffffffc0207cc0:	a039                	j	ffffffffc0207cce <vfs_do_add+0x7a>
ffffffffc0207cc2:	fe043503          	ld	a0,-32(s0)
ffffffffc0207cc6:	85a6                	mv	a1,s1
ffffffffc0207cc8:	177030ef          	jal	ffffffffc020b63e <strcmp>
ffffffffc0207ccc:	c52d                	beqz	a0,ffffffffc0207d36 <vfs_do_add+0xe2>
ffffffffc0207cce:	6400                	ld	s0,8(s0)
ffffffffc0207cd0:	ff2419e3          	bne	s0,s2,ffffffffc0207cc2 <vfs_do_add+0x6e>
ffffffffc0207cd4:	6418                	ld	a4,8(s0)
ffffffffc0207cd6:	02098793          	addi	a5,s3,32
ffffffffc0207cda:	0099b023          	sd	s1,0(s3)
ffffffffc0207cde:	0149b423          	sd	s4,8(s3)
ffffffffc0207ce2:	0159bc23          	sd	s5,24(s3)
ffffffffc0207ce6:	0169b823          	sd	s6,16(s3)
ffffffffc0207cea:	e31c                	sd	a5,0(a4)
ffffffffc0207cec:	0289b023          	sd	s0,32(s3)
ffffffffc0207cf0:	02e9b423          	sd	a4,40(s3)
ffffffffc0207cf4:	0008e517          	auipc	a0,0x8e
ffffffffc0207cf8:	b2450513          	addi	a0,a0,-1244 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207cfc:	e41c                	sd	a5,8(s0)
ffffffffc0207cfe:	941fc0ef          	jal	ffffffffc020463e <up>
ffffffffc0207d02:	74a2                	ld	s1,40(sp)
ffffffffc0207d04:	7902                	ld	s2,32(sp)
ffffffffc0207d06:	69e2                	ld	s3,24(sp)
ffffffffc0207d08:	4401                	li	s0,0
ffffffffc0207d0a:	70e2                	ld	ra,56(sp)
ffffffffc0207d0c:	8522                	mv	a0,s0
ffffffffc0207d0e:	7442                	ld	s0,48(sp)
ffffffffc0207d10:	6a42                	ld	s4,16(sp)
ffffffffc0207d12:	6aa2                	ld	s5,8(sp)
ffffffffc0207d14:	6b02                	ld	s6,0(sp)
ffffffffc0207d16:	6121                	addi	sp,sp,64
ffffffffc0207d18:	8082                	ret
ffffffffc0207d1a:	5471                	li	s0,-4
ffffffffc0207d1c:	8526                	mv	a0,s1
ffffffffc0207d1e:	b48fa0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0207d22:	70e2                	ld	ra,56(sp)
ffffffffc0207d24:	8522                	mv	a0,s0
ffffffffc0207d26:	7442                	ld	s0,48(sp)
ffffffffc0207d28:	74a2                	ld	s1,40(sp)
ffffffffc0207d2a:	69e2                	ld	s3,24(sp)
ffffffffc0207d2c:	6a42                	ld	s4,16(sp)
ffffffffc0207d2e:	6aa2                	ld	s5,8(sp)
ffffffffc0207d30:	6b02                	ld	s6,0(sp)
ffffffffc0207d32:	6121                	addi	sp,sp,64
ffffffffc0207d34:	8082                	ret
ffffffffc0207d36:	0008e517          	auipc	a0,0x8e
ffffffffc0207d3a:	ae250513          	addi	a0,a0,-1310 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207d3e:	901fc0ef          	jal	ffffffffc020463e <up>
ffffffffc0207d42:	854e                	mv	a0,s3
ffffffffc0207d44:	b22fa0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0207d48:	5425                	li	s0,-23
ffffffffc0207d4a:	7902                	ld	s2,32(sp)
ffffffffc0207d4c:	bfc1                	j	ffffffffc0207d1c <vfs_do_add+0xc8>
ffffffffc0207d4e:	5451                	li	s0,-12
ffffffffc0207d50:	bf6d                	j	ffffffffc0207d0a <vfs_do_add+0xb6>
ffffffffc0207d52:	74a2                	ld	s1,40(sp)
ffffffffc0207d54:	5471                	li	s0,-4
ffffffffc0207d56:	bf55                	j	ffffffffc0207d0a <vfs_do_add+0xb6>
ffffffffc0207d58:	00006697          	auipc	a3,0x6
ffffffffc0207d5c:	00868693          	addi	a3,a3,8 # ffffffffc020dd60 <etext+0x264c>
ffffffffc0207d60:	00004617          	auipc	a2,0x4
ffffffffc0207d64:	df060613          	addi	a2,a2,-528 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207d68:	08f00593          	li	a1,143
ffffffffc0207d6c:	00006517          	auipc	a0,0x6
ffffffffc0207d70:	fdc50513          	addi	a0,a0,-36 # ffffffffc020dd48 <etext+0x2634>
ffffffffc0207d74:	f426                	sd	s1,40(sp)
ffffffffc0207d76:	f04a                	sd	s2,32(sp)
ffffffffc0207d78:	ec4e                	sd	s3,24(sp)
ffffffffc0207d7a:	ed0f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207d7e:	00006697          	auipc	a3,0x6
ffffffffc0207d82:	fba68693          	addi	a3,a3,-70 # ffffffffc020dd38 <etext+0x2624>
ffffffffc0207d86:	00004617          	auipc	a2,0x4
ffffffffc0207d8a:	dca60613          	addi	a2,a2,-566 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207d8e:	08e00593          	li	a1,142
ffffffffc0207d92:	00006517          	auipc	a0,0x6
ffffffffc0207d96:	fb650513          	addi	a0,a0,-74 # ffffffffc020dd48 <etext+0x2634>
ffffffffc0207d9a:	f426                	sd	s1,40(sp)
ffffffffc0207d9c:	f04a                	sd	s2,32(sp)
ffffffffc0207d9e:	ec4e                	sd	s3,24(sp)
ffffffffc0207da0:	eaaf80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207da4 <find_mount.part.0>:
ffffffffc0207da4:	1141                	addi	sp,sp,-16
ffffffffc0207da6:	00006697          	auipc	a3,0x6
ffffffffc0207daa:	f9268693          	addi	a3,a3,-110 # ffffffffc020dd38 <etext+0x2624>
ffffffffc0207dae:	00004617          	auipc	a2,0x4
ffffffffc0207db2:	da260613          	addi	a2,a2,-606 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207db6:	0cd00593          	li	a1,205
ffffffffc0207dba:	00006517          	auipc	a0,0x6
ffffffffc0207dbe:	f8e50513          	addi	a0,a0,-114 # ffffffffc020dd48 <etext+0x2634>
ffffffffc0207dc2:	e406                	sd	ra,8(sp)
ffffffffc0207dc4:	e86f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207dc8 <vfs_devlist_init>:
ffffffffc0207dc8:	0008e797          	auipc	a5,0x8e
ffffffffc0207dcc:	a6878793          	addi	a5,a5,-1432 # ffffffffc0295830 <vdev_list>
ffffffffc0207dd0:	4585                	li	a1,1
ffffffffc0207dd2:	0008e517          	auipc	a0,0x8e
ffffffffc0207dd6:	a4650513          	addi	a0,a0,-1466 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207dda:	e79c                	sd	a5,8(a5)
ffffffffc0207ddc:	e39c                	sd	a5,0(a5)
ffffffffc0207dde:	85bfc06f          	j	ffffffffc0204638 <sem_init>

ffffffffc0207de2 <vfs_cleanup>:
ffffffffc0207de2:	1101                	addi	sp,sp,-32
ffffffffc0207de4:	e426                	sd	s1,8(sp)
ffffffffc0207de6:	0008e497          	auipc	s1,0x8e
ffffffffc0207dea:	a4a48493          	addi	s1,s1,-1462 # ffffffffc0295830 <vdev_list>
ffffffffc0207dee:	649c                	ld	a5,8(s1)
ffffffffc0207df0:	ec06                	sd	ra,24(sp)
ffffffffc0207df2:	02978f63          	beq	a5,s1,ffffffffc0207e30 <vfs_cleanup+0x4e>
ffffffffc0207df6:	0008e517          	auipc	a0,0x8e
ffffffffc0207dfa:	a2250513          	addi	a0,a0,-1502 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207dfe:	e822                	sd	s0,16(sp)
ffffffffc0207e00:	843fc0ef          	jal	ffffffffc0204642 <down>
ffffffffc0207e04:	6480                	ld	s0,8(s1)
ffffffffc0207e06:	00940b63          	beq	s0,s1,ffffffffc0207e1c <vfs_cleanup+0x3a>
ffffffffc0207e0a:	ff043783          	ld	a5,-16(s0)
ffffffffc0207e0e:	853e                	mv	a0,a5
ffffffffc0207e10:	c399                	beqz	a5,ffffffffc0207e16 <vfs_cleanup+0x34>
ffffffffc0207e12:	6bfc                	ld	a5,208(a5)
ffffffffc0207e14:	9782                	jalr	a5
ffffffffc0207e16:	6400                	ld	s0,8(s0)
ffffffffc0207e18:	fe9419e3          	bne	s0,s1,ffffffffc0207e0a <vfs_cleanup+0x28>
ffffffffc0207e1c:	6442                	ld	s0,16(sp)
ffffffffc0207e1e:	60e2                	ld	ra,24(sp)
ffffffffc0207e20:	64a2                	ld	s1,8(sp)
ffffffffc0207e22:	0008e517          	auipc	a0,0x8e
ffffffffc0207e26:	9f650513          	addi	a0,a0,-1546 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207e2a:	6105                	addi	sp,sp,32
ffffffffc0207e2c:	813fc06f          	j	ffffffffc020463e <up>
ffffffffc0207e30:	60e2                	ld	ra,24(sp)
ffffffffc0207e32:	64a2                	ld	s1,8(sp)
ffffffffc0207e34:	6105                	addi	sp,sp,32
ffffffffc0207e36:	8082                	ret

ffffffffc0207e38 <vfs_get_root>:
ffffffffc0207e38:	7179                	addi	sp,sp,-48
ffffffffc0207e3a:	f406                	sd	ra,40(sp)
ffffffffc0207e3c:	c949                	beqz	a0,ffffffffc0207ece <vfs_get_root+0x96>
ffffffffc0207e3e:	e84a                	sd	s2,16(sp)
ffffffffc0207e40:	0008e917          	auipc	s2,0x8e
ffffffffc0207e44:	9f090913          	addi	s2,s2,-1552 # ffffffffc0295830 <vdev_list>
ffffffffc0207e48:	00893783          	ld	a5,8(s2)
ffffffffc0207e4c:	ec26                	sd	s1,24(sp)
ffffffffc0207e4e:	07278e63          	beq	a5,s2,ffffffffc0207eca <vfs_get_root+0x92>
ffffffffc0207e52:	e44e                	sd	s3,8(sp)
ffffffffc0207e54:	89aa                	mv	s3,a0
ffffffffc0207e56:	0008e517          	auipc	a0,0x8e
ffffffffc0207e5a:	9c250513          	addi	a0,a0,-1598 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207e5e:	f022                	sd	s0,32(sp)
ffffffffc0207e60:	e052                	sd	s4,0(sp)
ffffffffc0207e62:	844a                	mv	s0,s2
ffffffffc0207e64:	8a2e                	mv	s4,a1
ffffffffc0207e66:	fdcfc0ef          	jal	ffffffffc0204642 <down>
ffffffffc0207e6a:	a801                	j	ffffffffc0207e7a <vfs_get_root+0x42>
ffffffffc0207e6c:	fe043583          	ld	a1,-32(s0)
ffffffffc0207e70:	854e                	mv	a0,s3
ffffffffc0207e72:	7cc030ef          	jal	ffffffffc020b63e <strcmp>
ffffffffc0207e76:	84aa                	mv	s1,a0
ffffffffc0207e78:	c505                	beqz	a0,ffffffffc0207ea0 <vfs_get_root+0x68>
ffffffffc0207e7a:	6400                	ld	s0,8(s0)
ffffffffc0207e7c:	ff2418e3          	bne	s0,s2,ffffffffc0207e6c <vfs_get_root+0x34>
ffffffffc0207e80:	54cd                	li	s1,-13
ffffffffc0207e82:	0008e517          	auipc	a0,0x8e
ffffffffc0207e86:	99650513          	addi	a0,a0,-1642 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207e8a:	fb4fc0ef          	jal	ffffffffc020463e <up>
ffffffffc0207e8e:	7402                	ld	s0,32(sp)
ffffffffc0207e90:	69a2                	ld	s3,8(sp)
ffffffffc0207e92:	6a02                	ld	s4,0(sp)
ffffffffc0207e94:	70a2                	ld	ra,40(sp)
ffffffffc0207e96:	6942                	ld	s2,16(sp)
ffffffffc0207e98:	8526                	mv	a0,s1
ffffffffc0207e9a:	64e2                	ld	s1,24(sp)
ffffffffc0207e9c:	6145                	addi	sp,sp,48
ffffffffc0207e9e:	8082                	ret
ffffffffc0207ea0:	ff043503          	ld	a0,-16(s0)
ffffffffc0207ea4:	c519                	beqz	a0,ffffffffc0207eb2 <vfs_get_root+0x7a>
ffffffffc0207ea6:	617c                	ld	a5,192(a0)
ffffffffc0207ea8:	9782                	jalr	a5
ffffffffc0207eaa:	c519                	beqz	a0,ffffffffc0207eb8 <vfs_get_root+0x80>
ffffffffc0207eac:	00aa3023          	sd	a0,0(s4)
ffffffffc0207eb0:	bfc9                	j	ffffffffc0207e82 <vfs_get_root+0x4a>
ffffffffc0207eb2:	ff843783          	ld	a5,-8(s0)
ffffffffc0207eb6:	c399                	beqz	a5,ffffffffc0207ebc <vfs_get_root+0x84>
ffffffffc0207eb8:	54c9                	li	s1,-14
ffffffffc0207eba:	b7e1                	j	ffffffffc0207e82 <vfs_get_root+0x4a>
ffffffffc0207ebc:	fe843503          	ld	a0,-24(s0)
ffffffffc0207ec0:	a89ff0ef          	jal	ffffffffc0207948 <inode_ref_inc>
ffffffffc0207ec4:	fe843503          	ld	a0,-24(s0)
ffffffffc0207ec8:	b7cd                	j	ffffffffc0207eaa <vfs_get_root+0x72>
ffffffffc0207eca:	54cd                	li	s1,-13
ffffffffc0207ecc:	b7e1                	j	ffffffffc0207e94 <vfs_get_root+0x5c>
ffffffffc0207ece:	00006697          	auipc	a3,0x6
ffffffffc0207ed2:	e6a68693          	addi	a3,a3,-406 # ffffffffc020dd38 <etext+0x2624>
ffffffffc0207ed6:	00004617          	auipc	a2,0x4
ffffffffc0207eda:	c7a60613          	addi	a2,a2,-902 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207ede:	04500593          	li	a1,69
ffffffffc0207ee2:	00006517          	auipc	a0,0x6
ffffffffc0207ee6:	e6650513          	addi	a0,a0,-410 # ffffffffc020dd48 <etext+0x2634>
ffffffffc0207eea:	f022                	sd	s0,32(sp)
ffffffffc0207eec:	ec26                	sd	s1,24(sp)
ffffffffc0207eee:	e84a                	sd	s2,16(sp)
ffffffffc0207ef0:	e44e                	sd	s3,8(sp)
ffffffffc0207ef2:	e052                	sd	s4,0(sp)
ffffffffc0207ef4:	d56f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207ef8 <vfs_get_devname>:
ffffffffc0207ef8:	0008e697          	auipc	a3,0x8e
ffffffffc0207efc:	93868693          	addi	a3,a3,-1736 # ffffffffc0295830 <vdev_list>
ffffffffc0207f00:	87b6                	mv	a5,a3
ffffffffc0207f02:	e511                	bnez	a0,ffffffffc0207f0e <vfs_get_devname+0x16>
ffffffffc0207f04:	a829                	j	ffffffffc0207f1e <vfs_get_devname+0x26>
ffffffffc0207f06:	ff07b703          	ld	a4,-16(a5)
ffffffffc0207f0a:	00a70763          	beq	a4,a0,ffffffffc0207f18 <vfs_get_devname+0x20>
ffffffffc0207f0e:	679c                	ld	a5,8(a5)
ffffffffc0207f10:	fed79be3          	bne	a5,a3,ffffffffc0207f06 <vfs_get_devname+0xe>
ffffffffc0207f14:	4501                	li	a0,0
ffffffffc0207f16:	8082                	ret
ffffffffc0207f18:	fe07b503          	ld	a0,-32(a5)
ffffffffc0207f1c:	8082                	ret
ffffffffc0207f1e:	1141                	addi	sp,sp,-16
ffffffffc0207f20:	00006697          	auipc	a3,0x6
ffffffffc0207f24:	ea068693          	addi	a3,a3,-352 # ffffffffc020ddc0 <etext+0x26ac>
ffffffffc0207f28:	00004617          	auipc	a2,0x4
ffffffffc0207f2c:	c2860613          	addi	a2,a2,-984 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0207f30:	06a00593          	li	a1,106
ffffffffc0207f34:	00006517          	auipc	a0,0x6
ffffffffc0207f38:	e1450513          	addi	a0,a0,-492 # ffffffffc020dd48 <etext+0x2634>
ffffffffc0207f3c:	e406                	sd	ra,8(sp)
ffffffffc0207f3e:	d0cf80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207f42 <vfs_add_dev>:
ffffffffc0207f42:	86b2                	mv	a3,a2
ffffffffc0207f44:	4601                	li	a2,0
ffffffffc0207f46:	d0fff06f          	j	ffffffffc0207c54 <vfs_do_add>

ffffffffc0207f4a <vfs_mount>:
ffffffffc0207f4a:	7179                	addi	sp,sp,-48
ffffffffc0207f4c:	e84a                	sd	s2,16(sp)
ffffffffc0207f4e:	892a                	mv	s2,a0
ffffffffc0207f50:	0008e517          	auipc	a0,0x8e
ffffffffc0207f54:	8c850513          	addi	a0,a0,-1848 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207f58:	e44e                	sd	s3,8(sp)
ffffffffc0207f5a:	f406                	sd	ra,40(sp)
ffffffffc0207f5c:	f022                	sd	s0,32(sp)
ffffffffc0207f5e:	ec26                	sd	s1,24(sp)
ffffffffc0207f60:	89ae                	mv	s3,a1
ffffffffc0207f62:	ee0fc0ef          	jal	ffffffffc0204642 <down>
ffffffffc0207f66:	0c090a63          	beqz	s2,ffffffffc020803a <vfs_mount+0xf0>
ffffffffc0207f6a:	0008e497          	auipc	s1,0x8e
ffffffffc0207f6e:	8c648493          	addi	s1,s1,-1850 # ffffffffc0295830 <vdev_list>
ffffffffc0207f72:	6480                	ld	s0,8(s1)
ffffffffc0207f74:	00941663          	bne	s0,s1,ffffffffc0207f80 <vfs_mount+0x36>
ffffffffc0207f78:	a8ad                	j	ffffffffc0207ff2 <vfs_mount+0xa8>
ffffffffc0207f7a:	6400                	ld	s0,8(s0)
ffffffffc0207f7c:	06940b63          	beq	s0,s1,ffffffffc0207ff2 <vfs_mount+0xa8>
ffffffffc0207f80:	ff843783          	ld	a5,-8(s0)
ffffffffc0207f84:	dbfd                	beqz	a5,ffffffffc0207f7a <vfs_mount+0x30>
ffffffffc0207f86:	fe043503          	ld	a0,-32(s0)
ffffffffc0207f8a:	85ca                	mv	a1,s2
ffffffffc0207f8c:	6b2030ef          	jal	ffffffffc020b63e <strcmp>
ffffffffc0207f90:	f56d                	bnez	a0,ffffffffc0207f7a <vfs_mount+0x30>
ffffffffc0207f92:	ff043783          	ld	a5,-16(s0)
ffffffffc0207f96:	e3a5                	bnez	a5,ffffffffc0207ff6 <vfs_mount+0xac>
ffffffffc0207f98:	fe043783          	ld	a5,-32(s0)
ffffffffc0207f9c:	cfbd                	beqz	a5,ffffffffc020801a <vfs_mount+0xd0>
ffffffffc0207f9e:	ff843783          	ld	a5,-8(s0)
ffffffffc0207fa2:	cfa5                	beqz	a5,ffffffffc020801a <vfs_mount+0xd0>
ffffffffc0207fa4:	fe843503          	ld	a0,-24(s0)
ffffffffc0207fa8:	c929                	beqz	a0,ffffffffc0207ffa <vfs_mount+0xb0>
ffffffffc0207faa:	4d38                	lw	a4,88(a0)
ffffffffc0207fac:	6785                	lui	a5,0x1
ffffffffc0207fae:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207fb2:	04f71463          	bne	a4,a5,ffffffffc0207ffa <vfs_mount+0xb0>
ffffffffc0207fb6:	ff040593          	addi	a1,s0,-16
ffffffffc0207fba:	9982                	jalr	s3
ffffffffc0207fbc:	84aa                	mv	s1,a0
ffffffffc0207fbe:	ed01                	bnez	a0,ffffffffc0207fd6 <vfs_mount+0x8c>
ffffffffc0207fc0:	ff043783          	ld	a5,-16(s0)
ffffffffc0207fc4:	cfad                	beqz	a5,ffffffffc020803e <vfs_mount+0xf4>
ffffffffc0207fc6:	fe043583          	ld	a1,-32(s0)
ffffffffc0207fca:	00006517          	auipc	a0,0x6
ffffffffc0207fce:	e8650513          	addi	a0,a0,-378 # ffffffffc020de50 <etext+0x273c>
ffffffffc0207fd2:	9d4f80ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0207fd6:	0008e517          	auipc	a0,0x8e
ffffffffc0207fda:	84250513          	addi	a0,a0,-1982 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207fde:	e60fc0ef          	jal	ffffffffc020463e <up>
ffffffffc0207fe2:	70a2                	ld	ra,40(sp)
ffffffffc0207fe4:	7402                	ld	s0,32(sp)
ffffffffc0207fe6:	6942                	ld	s2,16(sp)
ffffffffc0207fe8:	69a2                	ld	s3,8(sp)
ffffffffc0207fea:	8526                	mv	a0,s1
ffffffffc0207fec:	64e2                	ld	s1,24(sp)
ffffffffc0207fee:	6145                	addi	sp,sp,48
ffffffffc0207ff0:	8082                	ret
ffffffffc0207ff2:	54cd                	li	s1,-13
ffffffffc0207ff4:	b7cd                	j	ffffffffc0207fd6 <vfs_mount+0x8c>
ffffffffc0207ff6:	54c5                	li	s1,-15
ffffffffc0207ff8:	bff9                	j	ffffffffc0207fd6 <vfs_mount+0x8c>
ffffffffc0207ffa:	00006697          	auipc	a3,0x6
ffffffffc0207ffe:	e0668693          	addi	a3,a3,-506 # ffffffffc020de00 <etext+0x26ec>
ffffffffc0208002:	00004617          	auipc	a2,0x4
ffffffffc0208006:	b4e60613          	addi	a2,a2,-1202 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020800a:	0ed00593          	li	a1,237
ffffffffc020800e:	00006517          	auipc	a0,0x6
ffffffffc0208012:	d3a50513          	addi	a0,a0,-710 # ffffffffc020dd48 <etext+0x2634>
ffffffffc0208016:	c34f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc020801a:	00006697          	auipc	a3,0x6
ffffffffc020801e:	db668693          	addi	a3,a3,-586 # ffffffffc020ddd0 <etext+0x26bc>
ffffffffc0208022:	00004617          	auipc	a2,0x4
ffffffffc0208026:	b2e60613          	addi	a2,a2,-1234 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020802a:	0eb00593          	li	a1,235
ffffffffc020802e:	00006517          	auipc	a0,0x6
ffffffffc0208032:	d1a50513          	addi	a0,a0,-742 # ffffffffc020dd48 <etext+0x2634>
ffffffffc0208036:	c14f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc020803a:	d6bff0ef          	jal	ffffffffc0207da4 <find_mount.part.0>
ffffffffc020803e:	00006697          	auipc	a3,0x6
ffffffffc0208042:	dfa68693          	addi	a3,a3,-518 # ffffffffc020de38 <etext+0x2724>
ffffffffc0208046:	00004617          	auipc	a2,0x4
ffffffffc020804a:	b0a60613          	addi	a2,a2,-1270 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020804e:	0ef00593          	li	a1,239
ffffffffc0208052:	00006517          	auipc	a0,0x6
ffffffffc0208056:	cf650513          	addi	a0,a0,-778 # ffffffffc020dd48 <etext+0x2634>
ffffffffc020805a:	bf0f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc020805e <vfs_open>:
ffffffffc020805e:	7159                	addi	sp,sp,-112
ffffffffc0208060:	f486                	sd	ra,104(sp)
ffffffffc0208062:	e0d2                	sd	s4,64(sp)
ffffffffc0208064:	0035f793          	andi	a5,a1,3
ffffffffc0208068:	10078363          	beqz	a5,ffffffffc020816e <vfs_open+0x110>
ffffffffc020806c:	470d                	li	a4,3
ffffffffc020806e:	12e78163          	beq	a5,a4,ffffffffc0208190 <vfs_open+0x132>
ffffffffc0208072:	f0a2                	sd	s0,96(sp)
ffffffffc0208074:	eca6                	sd	s1,88(sp)
ffffffffc0208076:	e8ca                	sd	s2,80(sp)
ffffffffc0208078:	e4ce                	sd	s3,72(sp)
ffffffffc020807a:	fc56                	sd	s5,56(sp)
ffffffffc020807c:	f85a                	sd	s6,48(sp)
ffffffffc020807e:	0105fa13          	andi	s4,a1,16
ffffffffc0208082:	842e                	mv	s0,a1
ffffffffc0208084:	00447793          	andi	a5,s0,4
ffffffffc0208088:	8b32                	mv	s6,a2
ffffffffc020808a:	082c                	addi	a1,sp,24
ffffffffc020808c:	00345613          	srli	a2,s0,0x3
ffffffffc0208090:	8abe                	mv	s5,a5
ffffffffc0208092:	0027d493          	srli	s1,a5,0x2
ffffffffc0208096:	892a                	mv	s2,a0
ffffffffc0208098:	00167993          	andi	s3,a2,1
ffffffffc020809c:	2ba000ef          	jal	ffffffffc0208356 <vfs_lookup>
ffffffffc02080a0:	87aa                	mv	a5,a0
ffffffffc02080a2:	c175                	beqz	a0,ffffffffc0208186 <vfs_open+0x128>
ffffffffc02080a4:	01050713          	addi	a4,a0,16
ffffffffc02080a8:	eb45                	bnez	a4,ffffffffc0208158 <vfs_open+0xfa>
ffffffffc02080aa:	c4dd                	beqz	s1,ffffffffc0208158 <vfs_open+0xfa>
ffffffffc02080ac:	854a                	mv	a0,s2
ffffffffc02080ae:	1010                	addi	a2,sp,32
ffffffffc02080b0:	102c                	addi	a1,sp,40
ffffffffc02080b2:	32e000ef          	jal	ffffffffc02083e0 <vfs_lookup_parent>
ffffffffc02080b6:	87aa                	mv	a5,a0
ffffffffc02080b8:	e145                	bnez	a0,ffffffffc0208158 <vfs_open+0xfa>
ffffffffc02080ba:	7522                	ld	a0,40(sp)
ffffffffc02080bc:	14050c63          	beqz	a0,ffffffffc0208214 <vfs_open+0x1b6>
ffffffffc02080c0:	793c                	ld	a5,112(a0)
ffffffffc02080c2:	14078963          	beqz	a5,ffffffffc0208214 <vfs_open+0x1b6>
ffffffffc02080c6:	77bc                	ld	a5,104(a5)
ffffffffc02080c8:	14078663          	beqz	a5,ffffffffc0208214 <vfs_open+0x1b6>
ffffffffc02080cc:	00006597          	auipc	a1,0x6
ffffffffc02080d0:	dfc58593          	addi	a1,a1,-516 # ffffffffc020dec8 <etext+0x27b4>
ffffffffc02080d4:	e42a                	sd	a0,8(sp)
ffffffffc02080d6:	887ff0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc02080da:	6522                	ld	a0,8(sp)
ffffffffc02080dc:	7582                	ld	a1,32(sp)
ffffffffc02080de:	0834                	addi	a3,sp,24
ffffffffc02080e0:	793c                	ld	a5,112(a0)
ffffffffc02080e2:	7522                	ld	a0,40(sp)
ffffffffc02080e4:	864e                	mv	a2,s3
ffffffffc02080e6:	77bc                	ld	a5,104(a5)
ffffffffc02080e8:	9782                	jalr	a5
ffffffffc02080ea:	6562                	ld	a0,24(sp)
ffffffffc02080ec:	10050463          	beqz	a0,ffffffffc02081f4 <vfs_open+0x196>
ffffffffc02080f0:	793c                	ld	a5,112(a0)
ffffffffc02080f2:	c3e9                	beqz	a5,ffffffffc02081b4 <vfs_open+0x156>
ffffffffc02080f4:	679c                	ld	a5,8(a5)
ffffffffc02080f6:	cfdd                	beqz	a5,ffffffffc02081b4 <vfs_open+0x156>
ffffffffc02080f8:	00006597          	auipc	a1,0x6
ffffffffc02080fc:	e3858593          	addi	a1,a1,-456 # ffffffffc020df30 <etext+0x281c>
ffffffffc0208100:	e42a                	sd	a0,8(sp)
ffffffffc0208102:	85bff0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0208106:	6522                	ld	a0,8(sp)
ffffffffc0208108:	85a2                	mv	a1,s0
ffffffffc020810a:	793c                	ld	a5,112(a0)
ffffffffc020810c:	6562                	ld	a0,24(sp)
ffffffffc020810e:	679c                	ld	a5,8(a5)
ffffffffc0208110:	9782                	jalr	a5
ffffffffc0208112:	87aa                	mv	a5,a0
ffffffffc0208114:	e43e                	sd	a5,8(sp)
ffffffffc0208116:	6562                	ld	a0,24(sp)
ffffffffc0208118:	e3d1                	bnez	a5,ffffffffc020819c <vfs_open+0x13e>
ffffffffc020811a:	839ff0ef          	jal	ffffffffc0207952 <inode_open_inc>
ffffffffc020811e:	014ae733          	or	a4,s5,s4
ffffffffc0208122:	67a2                	ld	a5,8(sp)
ffffffffc0208124:	c71d                	beqz	a4,ffffffffc0208152 <vfs_open+0xf4>
ffffffffc0208126:	6462                	ld	s0,24(sp)
ffffffffc0208128:	c455                	beqz	s0,ffffffffc02081d4 <vfs_open+0x176>
ffffffffc020812a:	7838                	ld	a4,112(s0)
ffffffffc020812c:	c745                	beqz	a4,ffffffffc02081d4 <vfs_open+0x176>
ffffffffc020812e:	7338                	ld	a4,96(a4)
ffffffffc0208130:	c355                	beqz	a4,ffffffffc02081d4 <vfs_open+0x176>
ffffffffc0208132:	8522                	mv	a0,s0
ffffffffc0208134:	00006597          	auipc	a1,0x6
ffffffffc0208138:	e5c58593          	addi	a1,a1,-420 # ffffffffc020df90 <etext+0x287c>
ffffffffc020813c:	e43e                	sd	a5,8(sp)
ffffffffc020813e:	81fff0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0208142:	7838                	ld	a4,112(s0)
ffffffffc0208144:	6562                	ld	a0,24(sp)
ffffffffc0208146:	4581                	li	a1,0
ffffffffc0208148:	7338                	ld	a4,96(a4)
ffffffffc020814a:	9702                	jalr	a4
ffffffffc020814c:	67a2                	ld	a5,8(sp)
ffffffffc020814e:	842a                	mv	s0,a0
ffffffffc0208150:	e931                	bnez	a0,ffffffffc02081a4 <vfs_open+0x146>
ffffffffc0208152:	6762                	ld	a4,24(sp)
ffffffffc0208154:	00eb3023          	sd	a4,0(s6)
ffffffffc0208158:	7406                	ld	s0,96(sp)
ffffffffc020815a:	64e6                	ld	s1,88(sp)
ffffffffc020815c:	6946                	ld	s2,80(sp)
ffffffffc020815e:	69a6                	ld	s3,72(sp)
ffffffffc0208160:	7ae2                	ld	s5,56(sp)
ffffffffc0208162:	7b42                	ld	s6,48(sp)
ffffffffc0208164:	70a6                	ld	ra,104(sp)
ffffffffc0208166:	6a06                	ld	s4,64(sp)
ffffffffc0208168:	853e                	mv	a0,a5
ffffffffc020816a:	6165                	addi	sp,sp,112
ffffffffc020816c:	8082                	ret
ffffffffc020816e:	0105f713          	andi	a4,a1,16
ffffffffc0208172:	8a3a                	mv	s4,a4
ffffffffc0208174:	57f5                	li	a5,-3
ffffffffc0208176:	f77d                	bnez	a4,ffffffffc0208164 <vfs_open+0x106>
ffffffffc0208178:	f0a2                	sd	s0,96(sp)
ffffffffc020817a:	eca6                	sd	s1,88(sp)
ffffffffc020817c:	e8ca                	sd	s2,80(sp)
ffffffffc020817e:	e4ce                	sd	s3,72(sp)
ffffffffc0208180:	fc56                	sd	s5,56(sp)
ffffffffc0208182:	f85a                	sd	s6,48(sp)
ffffffffc0208184:	bdfd                	j	ffffffffc0208082 <vfs_open+0x24>
ffffffffc0208186:	f60982e3          	beqz	s3,ffffffffc02080ea <vfs_open+0x8c>
ffffffffc020818a:	d0a5                	beqz	s1,ffffffffc02080ea <vfs_open+0x8c>
ffffffffc020818c:	57a5                	li	a5,-23
ffffffffc020818e:	b7e9                	j	ffffffffc0208158 <vfs_open+0xfa>
ffffffffc0208190:	70a6                	ld	ra,104(sp)
ffffffffc0208192:	57f5                	li	a5,-3
ffffffffc0208194:	6a06                	ld	s4,64(sp)
ffffffffc0208196:	853e                	mv	a0,a5
ffffffffc0208198:	6165                	addi	sp,sp,112
ffffffffc020819a:	8082                	ret
ffffffffc020819c:	87bff0ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc02081a0:	67a2                	ld	a5,8(sp)
ffffffffc02081a2:	bf5d                	j	ffffffffc0208158 <vfs_open+0xfa>
ffffffffc02081a4:	6562                	ld	a0,24(sp)
ffffffffc02081a6:	90dff0ef          	jal	ffffffffc0207ab2 <inode_open_dec>
ffffffffc02081aa:	6562                	ld	a0,24(sp)
ffffffffc02081ac:	86bff0ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc02081b0:	87a2                	mv	a5,s0
ffffffffc02081b2:	b75d                	j	ffffffffc0208158 <vfs_open+0xfa>
ffffffffc02081b4:	00006697          	auipc	a3,0x6
ffffffffc02081b8:	d2c68693          	addi	a3,a3,-724 # ffffffffc020dee0 <etext+0x27cc>
ffffffffc02081bc:	00004617          	auipc	a2,0x4
ffffffffc02081c0:	99460613          	addi	a2,a2,-1644 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02081c4:	03300593          	li	a1,51
ffffffffc02081c8:	00006517          	auipc	a0,0x6
ffffffffc02081cc:	ce850513          	addi	a0,a0,-792 # ffffffffc020deb0 <etext+0x279c>
ffffffffc02081d0:	a7af80ef          	jal	ffffffffc020044a <__panic>
ffffffffc02081d4:	00006697          	auipc	a3,0x6
ffffffffc02081d8:	d6468693          	addi	a3,a3,-668 # ffffffffc020df38 <etext+0x2824>
ffffffffc02081dc:	00004617          	auipc	a2,0x4
ffffffffc02081e0:	97460613          	addi	a2,a2,-1676 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02081e4:	03a00593          	li	a1,58
ffffffffc02081e8:	00006517          	auipc	a0,0x6
ffffffffc02081ec:	cc850513          	addi	a0,a0,-824 # ffffffffc020deb0 <etext+0x279c>
ffffffffc02081f0:	a5af80ef          	jal	ffffffffc020044a <__panic>
ffffffffc02081f4:	00006697          	auipc	a3,0x6
ffffffffc02081f8:	cdc68693          	addi	a3,a3,-804 # ffffffffc020ded0 <etext+0x27bc>
ffffffffc02081fc:	00004617          	auipc	a2,0x4
ffffffffc0208200:	95460613          	addi	a2,a2,-1708 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0208204:	03100593          	li	a1,49
ffffffffc0208208:	00006517          	auipc	a0,0x6
ffffffffc020820c:	ca850513          	addi	a0,a0,-856 # ffffffffc020deb0 <etext+0x279c>
ffffffffc0208210:	a3af80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208214:	00006697          	auipc	a3,0x6
ffffffffc0208218:	c4c68693          	addi	a3,a3,-948 # ffffffffc020de60 <etext+0x274c>
ffffffffc020821c:	00004617          	auipc	a2,0x4
ffffffffc0208220:	93460613          	addi	a2,a2,-1740 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0208224:	02c00593          	li	a1,44
ffffffffc0208228:	00006517          	auipc	a0,0x6
ffffffffc020822c:	c8850513          	addi	a0,a0,-888 # ffffffffc020deb0 <etext+0x279c>
ffffffffc0208230:	a1af80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208234 <vfs_close>:
ffffffffc0208234:	1141                	addi	sp,sp,-16
ffffffffc0208236:	e406                	sd	ra,8(sp)
ffffffffc0208238:	e022                	sd	s0,0(sp)
ffffffffc020823a:	842a                	mv	s0,a0
ffffffffc020823c:	877ff0ef          	jal	ffffffffc0207ab2 <inode_open_dec>
ffffffffc0208240:	8522                	mv	a0,s0
ffffffffc0208242:	fd4ff0ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc0208246:	60a2                	ld	ra,8(sp)
ffffffffc0208248:	6402                	ld	s0,0(sp)
ffffffffc020824a:	4501                	li	a0,0
ffffffffc020824c:	0141                	addi	sp,sp,16
ffffffffc020824e:	8082                	ret

ffffffffc0208250 <get_device>:
ffffffffc0208250:	00054e03          	lbu	t3,0(a0)
ffffffffc0208254:	020e0463          	beqz	t3,ffffffffc020827c <get_device+0x2c>
ffffffffc0208258:	00150693          	addi	a3,a0,1
ffffffffc020825c:	8736                	mv	a4,a3
ffffffffc020825e:	87f2                	mv	a5,t3
ffffffffc0208260:	4801                	li	a6,0
ffffffffc0208262:	03a00893          	li	a7,58
ffffffffc0208266:	02f00313          	li	t1,47
ffffffffc020826a:	01178c63          	beq	a5,a7,ffffffffc0208282 <get_device+0x32>
ffffffffc020826e:	02678e63          	beq	a5,t1,ffffffffc02082aa <get_device+0x5a>
ffffffffc0208272:	00074783          	lbu	a5,0(a4)
ffffffffc0208276:	0705                	addi	a4,a4,1
ffffffffc0208278:	2805                	addiw	a6,a6,1 # fffffffffffff001 <end+0x3fd686f1>
ffffffffc020827a:	fbe5                	bnez	a5,ffffffffc020826a <get_device+0x1a>
ffffffffc020827c:	e188                	sd	a0,0(a1)
ffffffffc020827e:	8532                	mv	a0,a2
ffffffffc0208280:	a269                	j	ffffffffc020840a <vfs_get_curdir>
ffffffffc0208282:	02080663          	beqz	a6,ffffffffc02082ae <get_device+0x5e>
ffffffffc0208286:	01050733          	add	a4,a0,a6
ffffffffc020828a:	010687b3          	add	a5,a3,a6
ffffffffc020828e:	00070023          	sb	zero,0(a4)
ffffffffc0208292:	02f00813          	li	a6,47
ffffffffc0208296:	86be                	mv	a3,a5
ffffffffc0208298:	0007c703          	lbu	a4,0(a5)
ffffffffc020829c:	0785                	addi	a5,a5,1
ffffffffc020829e:	ff070ce3          	beq	a4,a6,ffffffffc0208296 <get_device+0x46>
ffffffffc02082a2:	e194                	sd	a3,0(a1)
ffffffffc02082a4:	85b2                	mv	a1,a2
ffffffffc02082a6:	b93ff06f          	j	ffffffffc0207e38 <vfs_get_root>
ffffffffc02082aa:	fc0819e3          	bnez	a6,ffffffffc020827c <get_device+0x2c>
ffffffffc02082ae:	7139                	addi	sp,sp,-64
ffffffffc02082b0:	f822                	sd	s0,48(sp)
ffffffffc02082b2:	f426                	sd	s1,40(sp)
ffffffffc02082b4:	fc06                	sd	ra,56(sp)
ffffffffc02082b6:	02f00793          	li	a5,47
ffffffffc02082ba:	8432                	mv	s0,a2
ffffffffc02082bc:	84ae                	mv	s1,a1
ffffffffc02082be:	04fe0563          	beq	t3,a5,ffffffffc0208308 <get_device+0xb8>
ffffffffc02082c2:	03a00793          	li	a5,58
ffffffffc02082c6:	06fe1863          	bne	t3,a5,ffffffffc0208336 <get_device+0xe6>
ffffffffc02082ca:	0828                	addi	a0,sp,24
ffffffffc02082cc:	e436                	sd	a3,8(sp)
ffffffffc02082ce:	13c000ef          	jal	ffffffffc020840a <vfs_get_curdir>
ffffffffc02082d2:	e515                	bnez	a0,ffffffffc02082fe <get_device+0xae>
ffffffffc02082d4:	67e2                	ld	a5,24(sp)
ffffffffc02082d6:	77a8                	ld	a0,104(a5)
ffffffffc02082d8:	cd1d                	beqz	a0,ffffffffc0208316 <get_device+0xc6>
ffffffffc02082da:	617c                	ld	a5,192(a0)
ffffffffc02082dc:	9782                	jalr	a5
ffffffffc02082de:	87aa                	mv	a5,a0
ffffffffc02082e0:	6562                	ld	a0,24(sp)
ffffffffc02082e2:	e01c                	sd	a5,0(s0)
ffffffffc02082e4:	f32ff0ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc02082e8:	66a2                	ld	a3,8(sp)
ffffffffc02082ea:	02f00713          	li	a4,47
ffffffffc02082ee:	a011                	j	ffffffffc02082f2 <get_device+0xa2>
ffffffffc02082f0:	0685                	addi	a3,a3,1
ffffffffc02082f2:	0006c783          	lbu	a5,0(a3)
ffffffffc02082f6:	fee78de3          	beq	a5,a4,ffffffffc02082f0 <get_device+0xa0>
ffffffffc02082fa:	e094                	sd	a3,0(s1)
ffffffffc02082fc:	4501                	li	a0,0
ffffffffc02082fe:	70e2                	ld	ra,56(sp)
ffffffffc0208300:	7442                	ld	s0,48(sp)
ffffffffc0208302:	74a2                	ld	s1,40(sp)
ffffffffc0208304:	6121                	addi	sp,sp,64
ffffffffc0208306:	8082                	ret
ffffffffc0208308:	8532                	mv	a0,a2
ffffffffc020830a:	e436                	sd	a3,8(sp)
ffffffffc020830c:	8ebff0ef          	jal	ffffffffc0207bf6 <vfs_get_bootfs>
ffffffffc0208310:	66a2                	ld	a3,8(sp)
ffffffffc0208312:	dd61                	beqz	a0,ffffffffc02082ea <get_device+0x9a>
ffffffffc0208314:	b7ed                	j	ffffffffc02082fe <get_device+0xae>
ffffffffc0208316:	00006697          	auipc	a3,0x6
ffffffffc020831a:	cb268693          	addi	a3,a3,-846 # ffffffffc020dfc8 <etext+0x28b4>
ffffffffc020831e:	00004617          	auipc	a2,0x4
ffffffffc0208322:	83260613          	addi	a2,a2,-1998 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0208326:	03900593          	li	a1,57
ffffffffc020832a:	00006517          	auipc	a0,0x6
ffffffffc020832e:	c8650513          	addi	a0,a0,-890 # ffffffffc020dfb0 <etext+0x289c>
ffffffffc0208332:	918f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208336:	00006697          	auipc	a3,0x6
ffffffffc020833a:	c6a68693          	addi	a3,a3,-918 # ffffffffc020dfa0 <etext+0x288c>
ffffffffc020833e:	00004617          	auipc	a2,0x4
ffffffffc0208342:	81260613          	addi	a2,a2,-2030 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0208346:	03300593          	li	a1,51
ffffffffc020834a:	00006517          	auipc	a0,0x6
ffffffffc020834e:	c6650513          	addi	a0,a0,-922 # ffffffffc020dfb0 <etext+0x289c>
ffffffffc0208352:	8f8f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208356 <vfs_lookup>:
ffffffffc0208356:	7139                	addi	sp,sp,-64
ffffffffc0208358:	f822                	sd	s0,48(sp)
ffffffffc020835a:	1030                	addi	a2,sp,40
ffffffffc020835c:	842e                	mv	s0,a1
ffffffffc020835e:	082c                	addi	a1,sp,24
ffffffffc0208360:	fc06                	sd	ra,56(sp)
ffffffffc0208362:	ec2a                	sd	a0,24(sp)
ffffffffc0208364:	eedff0ef          	jal	ffffffffc0208250 <get_device>
ffffffffc0208368:	87aa                	mv	a5,a0
ffffffffc020836a:	e121                	bnez	a0,ffffffffc02083aa <vfs_lookup+0x54>
ffffffffc020836c:	6762                	ld	a4,24(sp)
ffffffffc020836e:	7522                	ld	a0,40(sp)
ffffffffc0208370:	00074683          	lbu	a3,0(a4)
ffffffffc0208374:	c2a1                	beqz	a3,ffffffffc02083b4 <vfs_lookup+0x5e>
ffffffffc0208376:	c529                	beqz	a0,ffffffffc02083c0 <vfs_lookup+0x6a>
ffffffffc0208378:	793c                	ld	a5,112(a0)
ffffffffc020837a:	c3b9                	beqz	a5,ffffffffc02083c0 <vfs_lookup+0x6a>
ffffffffc020837c:	7bbc                	ld	a5,112(a5)
ffffffffc020837e:	c3a9                	beqz	a5,ffffffffc02083c0 <vfs_lookup+0x6a>
ffffffffc0208380:	00006597          	auipc	a1,0x6
ffffffffc0208384:	cb058593          	addi	a1,a1,-848 # ffffffffc020e030 <etext+0x291c>
ffffffffc0208388:	e83a                	sd	a4,16(sp)
ffffffffc020838a:	e42a                	sd	a0,8(sp)
ffffffffc020838c:	dd0ff0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0208390:	6522                	ld	a0,8(sp)
ffffffffc0208392:	65c2                	ld	a1,16(sp)
ffffffffc0208394:	8622                	mv	a2,s0
ffffffffc0208396:	793c                	ld	a5,112(a0)
ffffffffc0208398:	7522                	ld	a0,40(sp)
ffffffffc020839a:	7bbc                	ld	a5,112(a5)
ffffffffc020839c:	9782                	jalr	a5
ffffffffc020839e:	87aa                	mv	a5,a0
ffffffffc02083a0:	7522                	ld	a0,40(sp)
ffffffffc02083a2:	e43e                	sd	a5,8(sp)
ffffffffc02083a4:	e72ff0ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc02083a8:	67a2                	ld	a5,8(sp)
ffffffffc02083aa:	70e2                	ld	ra,56(sp)
ffffffffc02083ac:	7442                	ld	s0,48(sp)
ffffffffc02083ae:	853e                	mv	a0,a5
ffffffffc02083b0:	6121                	addi	sp,sp,64
ffffffffc02083b2:	8082                	ret
ffffffffc02083b4:	e008                	sd	a0,0(s0)
ffffffffc02083b6:	70e2                	ld	ra,56(sp)
ffffffffc02083b8:	7442                	ld	s0,48(sp)
ffffffffc02083ba:	853e                	mv	a0,a5
ffffffffc02083bc:	6121                	addi	sp,sp,64
ffffffffc02083be:	8082                	ret
ffffffffc02083c0:	00006697          	auipc	a3,0x6
ffffffffc02083c4:	c2068693          	addi	a3,a3,-992 # ffffffffc020dfe0 <etext+0x28cc>
ffffffffc02083c8:	00003617          	auipc	a2,0x3
ffffffffc02083cc:	78860613          	addi	a2,a2,1928 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02083d0:	04f00593          	li	a1,79
ffffffffc02083d4:	00006517          	auipc	a0,0x6
ffffffffc02083d8:	bdc50513          	addi	a0,a0,-1060 # ffffffffc020dfb0 <etext+0x289c>
ffffffffc02083dc:	86ef80ef          	jal	ffffffffc020044a <__panic>

ffffffffc02083e0 <vfs_lookup_parent>:
ffffffffc02083e0:	7139                	addi	sp,sp,-64
ffffffffc02083e2:	f822                	sd	s0,48(sp)
ffffffffc02083e4:	f426                	sd	s1,40(sp)
ffffffffc02083e6:	8432                	mv	s0,a2
ffffffffc02083e8:	84ae                	mv	s1,a1
ffffffffc02083ea:	0830                	addi	a2,sp,24
ffffffffc02083ec:	002c                	addi	a1,sp,8
ffffffffc02083ee:	fc06                	sd	ra,56(sp)
ffffffffc02083f0:	e42a                	sd	a0,8(sp)
ffffffffc02083f2:	e5fff0ef          	jal	ffffffffc0208250 <get_device>
ffffffffc02083f6:	e509                	bnez	a0,ffffffffc0208400 <vfs_lookup_parent+0x20>
ffffffffc02083f8:	6722                	ld	a4,8(sp)
ffffffffc02083fa:	67e2                	ld	a5,24(sp)
ffffffffc02083fc:	e018                	sd	a4,0(s0)
ffffffffc02083fe:	e09c                	sd	a5,0(s1)
ffffffffc0208400:	70e2                	ld	ra,56(sp)
ffffffffc0208402:	7442                	ld	s0,48(sp)
ffffffffc0208404:	74a2                	ld	s1,40(sp)
ffffffffc0208406:	6121                	addi	sp,sp,64
ffffffffc0208408:	8082                	ret

ffffffffc020840a <vfs_get_curdir>:
ffffffffc020840a:	0008e797          	auipc	a5,0x8e
ffffffffc020840e:	4be7b783          	ld	a5,1214(a5) # ffffffffc02968c8 <current>
ffffffffc0208412:	1101                	addi	sp,sp,-32
ffffffffc0208414:	e822                	sd	s0,16(sp)
ffffffffc0208416:	1487b783          	ld	a5,328(a5)
ffffffffc020841a:	ec06                	sd	ra,24(sp)
ffffffffc020841c:	6380                	ld	s0,0(a5)
ffffffffc020841e:	cc09                	beqz	s0,ffffffffc0208438 <vfs_get_curdir+0x2e>
ffffffffc0208420:	e426                	sd	s1,8(sp)
ffffffffc0208422:	84aa                	mv	s1,a0
ffffffffc0208424:	8522                	mv	a0,s0
ffffffffc0208426:	d22ff0ef          	jal	ffffffffc0207948 <inode_ref_inc>
ffffffffc020842a:	e080                	sd	s0,0(s1)
ffffffffc020842c:	64a2                	ld	s1,8(sp)
ffffffffc020842e:	4501                	li	a0,0
ffffffffc0208430:	60e2                	ld	ra,24(sp)
ffffffffc0208432:	6442                	ld	s0,16(sp)
ffffffffc0208434:	6105                	addi	sp,sp,32
ffffffffc0208436:	8082                	ret
ffffffffc0208438:	5541                	li	a0,-16
ffffffffc020843a:	bfdd                	j	ffffffffc0208430 <vfs_get_curdir+0x26>

ffffffffc020843c <vfs_set_curdir>:
ffffffffc020843c:	7139                	addi	sp,sp,-64
ffffffffc020843e:	f04a                	sd	s2,32(sp)
ffffffffc0208440:	0008e917          	auipc	s2,0x8e
ffffffffc0208444:	48890913          	addi	s2,s2,1160 # ffffffffc02968c8 <current>
ffffffffc0208448:	00093783          	ld	a5,0(s2)
ffffffffc020844c:	f822                	sd	s0,48(sp)
ffffffffc020844e:	842a                	mv	s0,a0
ffffffffc0208450:	1487b503          	ld	a0,328(a5)
ffffffffc0208454:	fc06                	sd	ra,56(sp)
ffffffffc0208456:	f426                	sd	s1,40(sp)
ffffffffc0208458:	e61fc0ef          	jal	ffffffffc02052b8 <lock_files>
ffffffffc020845c:	00093783          	ld	a5,0(s2)
ffffffffc0208460:	1487b503          	ld	a0,328(a5)
ffffffffc0208464:	611c                	ld	a5,0(a0)
ffffffffc0208466:	06f40a63          	beq	s0,a5,ffffffffc02084da <vfs_set_curdir+0x9e>
ffffffffc020846a:	c02d                	beqz	s0,ffffffffc02084cc <vfs_set_curdir+0x90>
ffffffffc020846c:	7838                	ld	a4,112(s0)
ffffffffc020846e:	cb25                	beqz	a4,ffffffffc02084de <vfs_set_curdir+0xa2>
ffffffffc0208470:	6b38                	ld	a4,80(a4)
ffffffffc0208472:	c735                	beqz	a4,ffffffffc02084de <vfs_set_curdir+0xa2>
ffffffffc0208474:	00006597          	auipc	a1,0x6
ffffffffc0208478:	c2c58593          	addi	a1,a1,-980 # ffffffffc020e0a0 <etext+0x298c>
ffffffffc020847c:	8522                	mv	a0,s0
ffffffffc020847e:	e43e                	sd	a5,8(sp)
ffffffffc0208480:	cdcff0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0208484:	7838                	ld	a4,112(s0)
ffffffffc0208486:	086c                	addi	a1,sp,28
ffffffffc0208488:	8522                	mv	a0,s0
ffffffffc020848a:	6b38                	ld	a4,80(a4)
ffffffffc020848c:	9702                	jalr	a4
ffffffffc020848e:	84aa                	mv	s1,a0
ffffffffc0208490:	e909                	bnez	a0,ffffffffc02084a2 <vfs_set_curdir+0x66>
ffffffffc0208492:	4772                	lw	a4,28(sp)
ffffffffc0208494:	4609                	li	a2,2
ffffffffc0208496:	54b9                	li	s1,-18
ffffffffc0208498:	40c75693          	srai	a3,a4,0xc
ffffffffc020849c:	8a9d                	andi	a3,a3,7
ffffffffc020849e:	00c68f63          	beq	a3,a2,ffffffffc02084bc <vfs_set_curdir+0x80>
ffffffffc02084a2:	00093783          	ld	a5,0(s2)
ffffffffc02084a6:	1487b503          	ld	a0,328(a5)
ffffffffc02084aa:	e15fc0ef          	jal	ffffffffc02052be <unlock_files>
ffffffffc02084ae:	70e2                	ld	ra,56(sp)
ffffffffc02084b0:	7442                	ld	s0,48(sp)
ffffffffc02084b2:	7902                	ld	s2,32(sp)
ffffffffc02084b4:	8526                	mv	a0,s1
ffffffffc02084b6:	74a2                	ld	s1,40(sp)
ffffffffc02084b8:	6121                	addi	sp,sp,64
ffffffffc02084ba:	8082                	ret
ffffffffc02084bc:	8522                	mv	a0,s0
ffffffffc02084be:	c8aff0ef          	jal	ffffffffc0207948 <inode_ref_inc>
ffffffffc02084c2:	00093703          	ld	a4,0(s2)
ffffffffc02084c6:	67a2                	ld	a5,8(sp)
ffffffffc02084c8:	14873503          	ld	a0,328(a4)
ffffffffc02084cc:	e100                	sd	s0,0(a0)
ffffffffc02084ce:	4481                	li	s1,0
ffffffffc02084d0:	dfe9                	beqz	a5,ffffffffc02084aa <vfs_set_curdir+0x6e>
ffffffffc02084d2:	853e                	mv	a0,a5
ffffffffc02084d4:	d42ff0ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc02084d8:	b7e9                	j	ffffffffc02084a2 <vfs_set_curdir+0x66>
ffffffffc02084da:	4481                	li	s1,0
ffffffffc02084dc:	b7f9                	j	ffffffffc02084aa <vfs_set_curdir+0x6e>
ffffffffc02084de:	00006697          	auipc	a3,0x6
ffffffffc02084e2:	b5a68693          	addi	a3,a3,-1190 # ffffffffc020e038 <etext+0x2924>
ffffffffc02084e6:	00003617          	auipc	a2,0x3
ffffffffc02084ea:	66a60613          	addi	a2,a2,1642 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02084ee:	04300593          	li	a1,67
ffffffffc02084f2:	00006517          	auipc	a0,0x6
ffffffffc02084f6:	b9650513          	addi	a0,a0,-1130 # ffffffffc020e088 <etext+0x2974>
ffffffffc02084fa:	f51f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02084fe <vfs_chdir>:
ffffffffc02084fe:	7179                	addi	sp,sp,-48
ffffffffc0208500:	082c                	addi	a1,sp,24
ffffffffc0208502:	f406                	sd	ra,40(sp)
ffffffffc0208504:	e53ff0ef          	jal	ffffffffc0208356 <vfs_lookup>
ffffffffc0208508:	87aa                	mv	a5,a0
ffffffffc020850a:	c509                	beqz	a0,ffffffffc0208514 <vfs_chdir+0x16>
ffffffffc020850c:	70a2                	ld	ra,40(sp)
ffffffffc020850e:	853e                	mv	a0,a5
ffffffffc0208510:	6145                	addi	sp,sp,48
ffffffffc0208512:	8082                	ret
ffffffffc0208514:	6562                	ld	a0,24(sp)
ffffffffc0208516:	f27ff0ef          	jal	ffffffffc020843c <vfs_set_curdir>
ffffffffc020851a:	87aa                	mv	a5,a0
ffffffffc020851c:	6562                	ld	a0,24(sp)
ffffffffc020851e:	e43e                	sd	a5,8(sp)
ffffffffc0208520:	cf6ff0ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc0208524:	67a2                	ld	a5,8(sp)
ffffffffc0208526:	70a2                	ld	ra,40(sp)
ffffffffc0208528:	853e                	mv	a0,a5
ffffffffc020852a:	6145                	addi	sp,sp,48
ffffffffc020852c:	8082                	ret

ffffffffc020852e <vfs_getcwd>:
ffffffffc020852e:	0008e797          	auipc	a5,0x8e
ffffffffc0208532:	39a7b783          	ld	a5,922(a5) # ffffffffc02968c8 <current>
ffffffffc0208536:	7179                	addi	sp,sp,-48
ffffffffc0208538:	ec26                	sd	s1,24(sp)
ffffffffc020853a:	1487b783          	ld	a5,328(a5)
ffffffffc020853e:	f406                	sd	ra,40(sp)
ffffffffc0208540:	f022                	sd	s0,32(sp)
ffffffffc0208542:	6384                	ld	s1,0(a5)
ffffffffc0208544:	c0c1                	beqz	s1,ffffffffc02085c4 <vfs_getcwd+0x96>
ffffffffc0208546:	e84a                	sd	s2,16(sp)
ffffffffc0208548:	892a                	mv	s2,a0
ffffffffc020854a:	8526                	mv	a0,s1
ffffffffc020854c:	bfcff0ef          	jal	ffffffffc0207948 <inode_ref_inc>
ffffffffc0208550:	74a8                	ld	a0,104(s1)
ffffffffc0208552:	c93d                	beqz	a0,ffffffffc02085c8 <vfs_getcwd+0x9a>
ffffffffc0208554:	9a5ff0ef          	jal	ffffffffc0207ef8 <vfs_get_devname>
ffffffffc0208558:	842a                	mv	s0,a0
ffffffffc020855a:	09e030ef          	jal	ffffffffc020b5f8 <strlen>
ffffffffc020855e:	862a                	mv	a2,a0
ffffffffc0208560:	85a2                	mv	a1,s0
ffffffffc0208562:	854a                	mv	a0,s2
ffffffffc0208564:	4701                	li	a4,0
ffffffffc0208566:	4685                	li	a3,1
ffffffffc0208568:	f7bfc0ef          	jal	ffffffffc02054e2 <iobuf_move>
ffffffffc020856c:	842a                	mv	s0,a0
ffffffffc020856e:	c919                	beqz	a0,ffffffffc0208584 <vfs_getcwd+0x56>
ffffffffc0208570:	8526                	mv	a0,s1
ffffffffc0208572:	ca4ff0ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc0208576:	6942                	ld	s2,16(sp)
ffffffffc0208578:	70a2                	ld	ra,40(sp)
ffffffffc020857a:	8522                	mv	a0,s0
ffffffffc020857c:	7402                	ld	s0,32(sp)
ffffffffc020857e:	64e2                	ld	s1,24(sp)
ffffffffc0208580:	6145                	addi	sp,sp,48
ffffffffc0208582:	8082                	ret
ffffffffc0208584:	4685                	li	a3,1
ffffffffc0208586:	03a00793          	li	a5,58
ffffffffc020858a:	8636                	mv	a2,a3
ffffffffc020858c:	4701                	li	a4,0
ffffffffc020858e:	00f10593          	addi	a1,sp,15
ffffffffc0208592:	854a                	mv	a0,s2
ffffffffc0208594:	00f107a3          	sb	a5,15(sp)
ffffffffc0208598:	f4bfc0ef          	jal	ffffffffc02054e2 <iobuf_move>
ffffffffc020859c:	842a                	mv	s0,a0
ffffffffc020859e:	f969                	bnez	a0,ffffffffc0208570 <vfs_getcwd+0x42>
ffffffffc02085a0:	78bc                	ld	a5,112(s1)
ffffffffc02085a2:	c3b9                	beqz	a5,ffffffffc02085e8 <vfs_getcwd+0xba>
ffffffffc02085a4:	7f9c                	ld	a5,56(a5)
ffffffffc02085a6:	c3a9                	beqz	a5,ffffffffc02085e8 <vfs_getcwd+0xba>
ffffffffc02085a8:	00006597          	auipc	a1,0x6
ffffffffc02085ac:	b5858593          	addi	a1,a1,-1192 # ffffffffc020e100 <etext+0x29ec>
ffffffffc02085b0:	8526                	mv	a0,s1
ffffffffc02085b2:	baaff0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc02085b6:	78bc                	ld	a5,112(s1)
ffffffffc02085b8:	85ca                	mv	a1,s2
ffffffffc02085ba:	8526                	mv	a0,s1
ffffffffc02085bc:	7f9c                	ld	a5,56(a5)
ffffffffc02085be:	9782                	jalr	a5
ffffffffc02085c0:	842a                	mv	s0,a0
ffffffffc02085c2:	b77d                	j	ffffffffc0208570 <vfs_getcwd+0x42>
ffffffffc02085c4:	5441                	li	s0,-16
ffffffffc02085c6:	bf4d                	j	ffffffffc0208578 <vfs_getcwd+0x4a>
ffffffffc02085c8:	00006697          	auipc	a3,0x6
ffffffffc02085cc:	a0068693          	addi	a3,a3,-1536 # ffffffffc020dfc8 <etext+0x28b4>
ffffffffc02085d0:	00003617          	auipc	a2,0x3
ffffffffc02085d4:	58060613          	addi	a2,a2,1408 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02085d8:	06e00593          	li	a1,110
ffffffffc02085dc:	00006517          	auipc	a0,0x6
ffffffffc02085e0:	aac50513          	addi	a0,a0,-1364 # ffffffffc020e088 <etext+0x2974>
ffffffffc02085e4:	e67f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc02085e8:	00006697          	auipc	a3,0x6
ffffffffc02085ec:	ac068693          	addi	a3,a3,-1344 # ffffffffc020e0a8 <etext+0x2994>
ffffffffc02085f0:	00003617          	auipc	a2,0x3
ffffffffc02085f4:	56060613          	addi	a2,a2,1376 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02085f8:	07800593          	li	a1,120
ffffffffc02085fc:	00006517          	auipc	a0,0x6
ffffffffc0208600:	a8c50513          	addi	a0,a0,-1396 # ffffffffc020e088 <etext+0x2974>
ffffffffc0208604:	e47f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208608 <dev_lookup>:
ffffffffc0208608:	0005c703          	lbu	a4,0(a1)
ffffffffc020860c:	ef11                	bnez	a4,ffffffffc0208628 <dev_lookup+0x20>
ffffffffc020860e:	1101                	addi	sp,sp,-32
ffffffffc0208610:	ec06                	sd	ra,24(sp)
ffffffffc0208612:	e032                	sd	a2,0(sp)
ffffffffc0208614:	e42a                	sd	a0,8(sp)
ffffffffc0208616:	b32ff0ef          	jal	ffffffffc0207948 <inode_ref_inc>
ffffffffc020861a:	6602                	ld	a2,0(sp)
ffffffffc020861c:	67a2                	ld	a5,8(sp)
ffffffffc020861e:	60e2                	ld	ra,24(sp)
ffffffffc0208620:	4501                	li	a0,0
ffffffffc0208622:	e21c                	sd	a5,0(a2)
ffffffffc0208624:	6105                	addi	sp,sp,32
ffffffffc0208626:	8082                	ret
ffffffffc0208628:	5541                	li	a0,-16
ffffffffc020862a:	8082                	ret

ffffffffc020862c <dev_fstat>:
ffffffffc020862c:	1101                	addi	sp,sp,-32
ffffffffc020862e:	e822                	sd	s0,16(sp)
ffffffffc0208630:	e426                	sd	s1,8(sp)
ffffffffc0208632:	842a                	mv	s0,a0
ffffffffc0208634:	84ae                	mv	s1,a1
ffffffffc0208636:	852e                	mv	a0,a1
ffffffffc0208638:	02000613          	li	a2,32
ffffffffc020863c:	4581                	li	a1,0
ffffffffc020863e:	ec06                	sd	ra,24(sp)
ffffffffc0208640:	06c030ef          	jal	ffffffffc020b6ac <memset>
ffffffffc0208644:	c429                	beqz	s0,ffffffffc020868e <dev_fstat+0x62>
ffffffffc0208646:	783c                	ld	a5,112(s0)
ffffffffc0208648:	c3b9                	beqz	a5,ffffffffc020868e <dev_fstat+0x62>
ffffffffc020864a:	6bbc                	ld	a5,80(a5)
ffffffffc020864c:	c3a9                	beqz	a5,ffffffffc020868e <dev_fstat+0x62>
ffffffffc020864e:	00006597          	auipc	a1,0x6
ffffffffc0208652:	a5258593          	addi	a1,a1,-1454 # ffffffffc020e0a0 <etext+0x298c>
ffffffffc0208656:	8522                	mv	a0,s0
ffffffffc0208658:	b04ff0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc020865c:	783c                	ld	a5,112(s0)
ffffffffc020865e:	85a6                	mv	a1,s1
ffffffffc0208660:	8522                	mv	a0,s0
ffffffffc0208662:	6bbc                	ld	a5,80(a5)
ffffffffc0208664:	9782                	jalr	a5
ffffffffc0208666:	ed19                	bnez	a0,ffffffffc0208684 <dev_fstat+0x58>
ffffffffc0208668:	4c38                	lw	a4,88(s0)
ffffffffc020866a:	6785                	lui	a5,0x1
ffffffffc020866c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208670:	02f71f63          	bne	a4,a5,ffffffffc02086ae <dev_fstat+0x82>
ffffffffc0208674:	6018                	ld	a4,0(s0)
ffffffffc0208676:	641c                	ld	a5,8(s0)
ffffffffc0208678:	4685                	li	a3,1
ffffffffc020867a:	e898                	sd	a4,16(s1)
ffffffffc020867c:	02e787b3          	mul	a5,a5,a4
ffffffffc0208680:	e494                	sd	a3,8(s1)
ffffffffc0208682:	ec9c                	sd	a5,24(s1)
ffffffffc0208684:	60e2                	ld	ra,24(sp)
ffffffffc0208686:	6442                	ld	s0,16(sp)
ffffffffc0208688:	64a2                	ld	s1,8(sp)
ffffffffc020868a:	6105                	addi	sp,sp,32
ffffffffc020868c:	8082                	ret
ffffffffc020868e:	00006697          	auipc	a3,0x6
ffffffffc0208692:	9aa68693          	addi	a3,a3,-1622 # ffffffffc020e038 <etext+0x2924>
ffffffffc0208696:	00003617          	auipc	a2,0x3
ffffffffc020869a:	4ba60613          	addi	a2,a2,1210 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020869e:	04200593          	li	a1,66
ffffffffc02086a2:	00006517          	auipc	a0,0x6
ffffffffc02086a6:	a6e50513          	addi	a0,a0,-1426 # ffffffffc020e110 <etext+0x29fc>
ffffffffc02086aa:	da1f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc02086ae:	00005697          	auipc	a3,0x5
ffffffffc02086b2:	75268693          	addi	a3,a3,1874 # ffffffffc020de00 <etext+0x26ec>
ffffffffc02086b6:	00003617          	auipc	a2,0x3
ffffffffc02086ba:	49a60613          	addi	a2,a2,1178 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02086be:	04500593          	li	a1,69
ffffffffc02086c2:	00006517          	auipc	a0,0x6
ffffffffc02086c6:	a4e50513          	addi	a0,a0,-1458 # ffffffffc020e110 <etext+0x29fc>
ffffffffc02086ca:	d81f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02086ce <dev_ioctl>:
ffffffffc02086ce:	c909                	beqz	a0,ffffffffc02086e0 <dev_ioctl+0x12>
ffffffffc02086d0:	4d34                	lw	a3,88(a0)
ffffffffc02086d2:	6705                	lui	a4,0x1
ffffffffc02086d4:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02086d8:	00e69463          	bne	a3,a4,ffffffffc02086e0 <dev_ioctl+0x12>
ffffffffc02086dc:	751c                	ld	a5,40(a0)
ffffffffc02086de:	8782                	jr	a5
ffffffffc02086e0:	1141                	addi	sp,sp,-16
ffffffffc02086e2:	00005697          	auipc	a3,0x5
ffffffffc02086e6:	71e68693          	addi	a3,a3,1822 # ffffffffc020de00 <etext+0x26ec>
ffffffffc02086ea:	00003617          	auipc	a2,0x3
ffffffffc02086ee:	46660613          	addi	a2,a2,1126 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02086f2:	03500593          	li	a1,53
ffffffffc02086f6:	00006517          	auipc	a0,0x6
ffffffffc02086fa:	a1a50513          	addi	a0,a0,-1510 # ffffffffc020e110 <etext+0x29fc>
ffffffffc02086fe:	e406                	sd	ra,8(sp)
ffffffffc0208700:	d4bf70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208704 <dev_tryseek>:
ffffffffc0208704:	c51d                	beqz	a0,ffffffffc0208732 <dev_tryseek+0x2e>
ffffffffc0208706:	4d38                	lw	a4,88(a0)
ffffffffc0208708:	6785                	lui	a5,0x1
ffffffffc020870a:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020870e:	02f71263          	bne	a4,a5,ffffffffc0208732 <dev_tryseek+0x2e>
ffffffffc0208712:	611c                	ld	a5,0(a0)
ffffffffc0208714:	cf89                	beqz	a5,ffffffffc020872e <dev_tryseek+0x2a>
ffffffffc0208716:	6518                	ld	a4,8(a0)
ffffffffc0208718:	02e5f6b3          	remu	a3,a1,a4
ffffffffc020871c:	ea89                	bnez	a3,ffffffffc020872e <dev_tryseek+0x2a>
ffffffffc020871e:	0005c863          	bltz	a1,ffffffffc020872e <dev_tryseek+0x2a>
ffffffffc0208722:	02e787b3          	mul	a5,a5,a4
ffffffffc0208726:	4501                	li	a0,0
ffffffffc0208728:	00f5f363          	bgeu	a1,a5,ffffffffc020872e <dev_tryseek+0x2a>
ffffffffc020872c:	8082                	ret
ffffffffc020872e:	5575                	li	a0,-3
ffffffffc0208730:	8082                	ret
ffffffffc0208732:	1141                	addi	sp,sp,-16
ffffffffc0208734:	00005697          	auipc	a3,0x5
ffffffffc0208738:	6cc68693          	addi	a3,a3,1740 # ffffffffc020de00 <etext+0x26ec>
ffffffffc020873c:	00003617          	auipc	a2,0x3
ffffffffc0208740:	41460613          	addi	a2,a2,1044 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0208744:	05f00593          	li	a1,95
ffffffffc0208748:	00006517          	auipc	a0,0x6
ffffffffc020874c:	9c850513          	addi	a0,a0,-1592 # ffffffffc020e110 <etext+0x29fc>
ffffffffc0208750:	e406                	sd	ra,8(sp)
ffffffffc0208752:	cf9f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208756 <dev_gettype>:
ffffffffc0208756:	cd11                	beqz	a0,ffffffffc0208772 <dev_gettype+0x1c>
ffffffffc0208758:	4d38                	lw	a4,88(a0)
ffffffffc020875a:	6785                	lui	a5,0x1
ffffffffc020875c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208760:	00f71963          	bne	a4,a5,ffffffffc0208772 <dev_gettype+0x1c>
ffffffffc0208764:	6118                	ld	a4,0(a0)
ffffffffc0208766:	6791                	lui	a5,0x4
ffffffffc0208768:	c311                	beqz	a4,ffffffffc020876c <dev_gettype+0x16>
ffffffffc020876a:	6795                	lui	a5,0x5
ffffffffc020876c:	c19c                	sw	a5,0(a1)
ffffffffc020876e:	4501                	li	a0,0
ffffffffc0208770:	8082                	ret
ffffffffc0208772:	1141                	addi	sp,sp,-16
ffffffffc0208774:	00005697          	auipc	a3,0x5
ffffffffc0208778:	68c68693          	addi	a3,a3,1676 # ffffffffc020de00 <etext+0x26ec>
ffffffffc020877c:	00003617          	auipc	a2,0x3
ffffffffc0208780:	3d460613          	addi	a2,a2,980 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0208784:	05300593          	li	a1,83
ffffffffc0208788:	00006517          	auipc	a0,0x6
ffffffffc020878c:	98850513          	addi	a0,a0,-1656 # ffffffffc020e110 <etext+0x29fc>
ffffffffc0208790:	e406                	sd	ra,8(sp)
ffffffffc0208792:	cb9f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208796 <dev_write>:
ffffffffc0208796:	c911                	beqz	a0,ffffffffc02087aa <dev_write+0x14>
ffffffffc0208798:	4d34                	lw	a3,88(a0)
ffffffffc020879a:	6705                	lui	a4,0x1
ffffffffc020879c:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02087a0:	00e69563          	bne	a3,a4,ffffffffc02087aa <dev_write+0x14>
ffffffffc02087a4:	711c                	ld	a5,32(a0)
ffffffffc02087a6:	4605                	li	a2,1
ffffffffc02087a8:	8782                	jr	a5
ffffffffc02087aa:	1141                	addi	sp,sp,-16
ffffffffc02087ac:	00005697          	auipc	a3,0x5
ffffffffc02087b0:	65468693          	addi	a3,a3,1620 # ffffffffc020de00 <etext+0x26ec>
ffffffffc02087b4:	00003617          	auipc	a2,0x3
ffffffffc02087b8:	39c60613          	addi	a2,a2,924 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02087bc:	02c00593          	li	a1,44
ffffffffc02087c0:	00006517          	auipc	a0,0x6
ffffffffc02087c4:	95050513          	addi	a0,a0,-1712 # ffffffffc020e110 <etext+0x29fc>
ffffffffc02087c8:	e406                	sd	ra,8(sp)
ffffffffc02087ca:	c81f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02087ce <dev_read>:
ffffffffc02087ce:	c911                	beqz	a0,ffffffffc02087e2 <dev_read+0x14>
ffffffffc02087d0:	4d34                	lw	a3,88(a0)
ffffffffc02087d2:	6705                	lui	a4,0x1
ffffffffc02087d4:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02087d8:	00e69563          	bne	a3,a4,ffffffffc02087e2 <dev_read+0x14>
ffffffffc02087dc:	711c                	ld	a5,32(a0)
ffffffffc02087de:	4601                	li	a2,0
ffffffffc02087e0:	8782                	jr	a5
ffffffffc02087e2:	1141                	addi	sp,sp,-16
ffffffffc02087e4:	00005697          	auipc	a3,0x5
ffffffffc02087e8:	61c68693          	addi	a3,a3,1564 # ffffffffc020de00 <etext+0x26ec>
ffffffffc02087ec:	00003617          	auipc	a2,0x3
ffffffffc02087f0:	36460613          	addi	a2,a2,868 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02087f4:	02300593          	li	a1,35
ffffffffc02087f8:	00006517          	auipc	a0,0x6
ffffffffc02087fc:	91850513          	addi	a0,a0,-1768 # ffffffffc020e110 <etext+0x29fc>
ffffffffc0208800:	e406                	sd	ra,8(sp)
ffffffffc0208802:	c49f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208806 <dev_close>:
ffffffffc0208806:	c909                	beqz	a0,ffffffffc0208818 <dev_close+0x12>
ffffffffc0208808:	4d34                	lw	a3,88(a0)
ffffffffc020880a:	6705                	lui	a4,0x1
ffffffffc020880c:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208810:	00e69463          	bne	a3,a4,ffffffffc0208818 <dev_close+0x12>
ffffffffc0208814:	6d1c                	ld	a5,24(a0)
ffffffffc0208816:	8782                	jr	a5
ffffffffc0208818:	1141                	addi	sp,sp,-16
ffffffffc020881a:	00005697          	auipc	a3,0x5
ffffffffc020881e:	5e668693          	addi	a3,a3,1510 # ffffffffc020de00 <etext+0x26ec>
ffffffffc0208822:	00003617          	auipc	a2,0x3
ffffffffc0208826:	32e60613          	addi	a2,a2,814 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020882a:	45e9                	li	a1,26
ffffffffc020882c:	00006517          	auipc	a0,0x6
ffffffffc0208830:	8e450513          	addi	a0,a0,-1820 # ffffffffc020e110 <etext+0x29fc>
ffffffffc0208834:	e406                	sd	ra,8(sp)
ffffffffc0208836:	c15f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc020883a <dev_open>:
ffffffffc020883a:	03c5f793          	andi	a5,a1,60
ffffffffc020883e:	eb91                	bnez	a5,ffffffffc0208852 <dev_open+0x18>
ffffffffc0208840:	c919                	beqz	a0,ffffffffc0208856 <dev_open+0x1c>
ffffffffc0208842:	4d34                	lw	a3,88(a0)
ffffffffc0208844:	6785                	lui	a5,0x1
ffffffffc0208846:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020884a:	00f69663          	bne	a3,a5,ffffffffc0208856 <dev_open+0x1c>
ffffffffc020884e:	691c                	ld	a5,16(a0)
ffffffffc0208850:	8782                	jr	a5
ffffffffc0208852:	5575                	li	a0,-3
ffffffffc0208854:	8082                	ret
ffffffffc0208856:	1141                	addi	sp,sp,-16
ffffffffc0208858:	00005697          	auipc	a3,0x5
ffffffffc020885c:	5a868693          	addi	a3,a3,1448 # ffffffffc020de00 <etext+0x26ec>
ffffffffc0208860:	00003617          	auipc	a2,0x3
ffffffffc0208864:	2f060613          	addi	a2,a2,752 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0208868:	45c5                	li	a1,17
ffffffffc020886a:	00006517          	auipc	a0,0x6
ffffffffc020886e:	8a650513          	addi	a0,a0,-1882 # ffffffffc020e110 <etext+0x29fc>
ffffffffc0208872:	e406                	sd	ra,8(sp)
ffffffffc0208874:	bd7f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208878 <dev_init>:
ffffffffc0208878:	1141                	addi	sp,sp,-16
ffffffffc020887a:	e406                	sd	ra,8(sp)
ffffffffc020887c:	544000ef          	jal	ffffffffc0208dc0 <dev_init_stdin>
ffffffffc0208880:	65c000ef          	jal	ffffffffc0208edc <dev_init_stdout>
ffffffffc0208884:	60a2                	ld	ra,8(sp)
ffffffffc0208886:	0141                	addi	sp,sp,16
ffffffffc0208888:	ac01                	j	ffffffffc0208a98 <dev_init_disk0>

ffffffffc020888a <dev_create_inode>:
ffffffffc020888a:	6505                	lui	a0,0x1
ffffffffc020888c:	1101                	addi	sp,sp,-32
ffffffffc020888e:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208892:	ec06                	sd	ra,24(sp)
ffffffffc0208894:	836ff0ef          	jal	ffffffffc02078ca <__alloc_inode>
ffffffffc0208898:	87aa                	mv	a5,a0
ffffffffc020889a:	c911                	beqz	a0,ffffffffc02088ae <dev_create_inode+0x24>
ffffffffc020889c:	4601                	li	a2,0
ffffffffc020889e:	00007597          	auipc	a1,0x7
ffffffffc02088a2:	c9258593          	addi	a1,a1,-878 # ffffffffc020f530 <dev_node_ops>
ffffffffc02088a6:	e42a                	sd	a0,8(sp)
ffffffffc02088a8:	83eff0ef          	jal	ffffffffc02078e6 <inode_init>
ffffffffc02088ac:	67a2                	ld	a5,8(sp)
ffffffffc02088ae:	60e2                	ld	ra,24(sp)
ffffffffc02088b0:	853e                	mv	a0,a5
ffffffffc02088b2:	6105                	addi	sp,sp,32
ffffffffc02088b4:	8082                	ret

ffffffffc02088b6 <disk0_open>:
ffffffffc02088b6:	4501                	li	a0,0
ffffffffc02088b8:	8082                	ret

ffffffffc02088ba <disk0_close>:
ffffffffc02088ba:	4501                	li	a0,0
ffffffffc02088bc:	8082                	ret

ffffffffc02088be <disk0_ioctl>:
ffffffffc02088be:	5531                	li	a0,-20
ffffffffc02088c0:	8082                	ret

ffffffffc02088c2 <disk0_io>:
ffffffffc02088c2:	711d                	addi	sp,sp,-96
ffffffffc02088c4:	6594                	ld	a3,8(a1)
ffffffffc02088c6:	e8a2                	sd	s0,80(sp)
ffffffffc02088c8:	6d80                	ld	s0,24(a1)
ffffffffc02088ca:	6785                	lui	a5,0x1
ffffffffc02088cc:	17fd                	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc02088ce:	0086e733          	or	a4,a3,s0
ffffffffc02088d2:	ec86                	sd	ra,88(sp)
ffffffffc02088d4:	8f7d                	and	a4,a4,a5
ffffffffc02088d6:	14071663          	bnez	a4,ffffffffc0208a22 <disk0_io+0x160>
ffffffffc02088da:	e0ca                	sd	s2,64(sp)
ffffffffc02088dc:	43f6d913          	srai	s2,a3,0x3f
ffffffffc02088e0:	00f97933          	and	s2,s2,a5
ffffffffc02088e4:	9936                	add	s2,s2,a3
ffffffffc02088e6:	40c95913          	srai	s2,s2,0xc
ffffffffc02088ea:	00c45793          	srli	a5,s0,0xc
ffffffffc02088ee:	0127873b          	addw	a4,a5,s2
ffffffffc02088f2:	6114                	ld	a3,0(a0)
ffffffffc02088f4:	1702                	slli	a4,a4,0x20
ffffffffc02088f6:	9301                	srli	a4,a4,0x20
ffffffffc02088f8:	2901                	sext.w	s2,s2
ffffffffc02088fa:	2781                	sext.w	a5,a5
ffffffffc02088fc:	12e6e063          	bltu	a3,a4,ffffffffc0208a1c <disk0_io+0x15a>
ffffffffc0208900:	e799                	bnez	a5,ffffffffc020890e <disk0_io+0x4c>
ffffffffc0208902:	6906                	ld	s2,64(sp)
ffffffffc0208904:	4501                	li	a0,0
ffffffffc0208906:	60e6                	ld	ra,88(sp)
ffffffffc0208908:	6446                	ld	s0,80(sp)
ffffffffc020890a:	6125                	addi	sp,sp,96
ffffffffc020890c:	8082                	ret
ffffffffc020890e:	0008d517          	auipc	a0,0x8d
ffffffffc0208912:	f3250513          	addi	a0,a0,-206 # ffffffffc0295840 <disk0_sem>
ffffffffc0208916:	e4a6                	sd	s1,72(sp)
ffffffffc0208918:	f852                	sd	s4,48(sp)
ffffffffc020891a:	f456                	sd	s5,40(sp)
ffffffffc020891c:	84b2                	mv	s1,a2
ffffffffc020891e:	8aae                	mv	s5,a1
ffffffffc0208920:	0008ea17          	auipc	s4,0x8e
ffffffffc0208924:	fd8a0a13          	addi	s4,s4,-40 # ffffffffc02968f8 <disk0_buffer>
ffffffffc0208928:	d1bfb0ef          	jal	ffffffffc0204642 <down>
ffffffffc020892c:	000a3603          	ld	a2,0(s4)
ffffffffc0208930:	e8ad                	bnez	s1,ffffffffc02089a2 <disk0_io+0xe0>
ffffffffc0208932:	e862                	sd	s8,16(sp)
ffffffffc0208934:	fc4e                	sd	s3,56(sp)
ffffffffc0208936:	ec5e                	sd	s7,24(sp)
ffffffffc0208938:	6c11                	lui	s8,0x4
ffffffffc020893a:	a029                	j	ffffffffc0208944 <disk0_io+0x82>
ffffffffc020893c:	000a3603          	ld	a2,0(s4)
ffffffffc0208940:	0129893b          	addw	s2,s3,s2
ffffffffc0208944:	84a2                	mv	s1,s0
ffffffffc0208946:	008c7363          	bgeu	s8,s0,ffffffffc020894c <disk0_io+0x8a>
ffffffffc020894a:	6491                	lui	s1,0x4
ffffffffc020894c:	00c4d993          	srli	s3,s1,0xc
ffffffffc0208950:	2981                	sext.w	s3,s3
ffffffffc0208952:	00399b9b          	slliw	s7,s3,0x3
ffffffffc0208956:	020b9693          	slli	a3,s7,0x20
ffffffffc020895a:	9281                	srli	a3,a3,0x20
ffffffffc020895c:	0039159b          	slliw	a1,s2,0x3
ffffffffc0208960:	4509                	li	a0,2
ffffffffc0208962:	93cf80ef          	jal	ffffffffc0200a9e <ide_read_secs>
ffffffffc0208966:	e16d                	bnez	a0,ffffffffc0208a48 <disk0_io+0x186>
ffffffffc0208968:	000a3583          	ld	a1,0(s4)
ffffffffc020896c:	0038                	addi	a4,sp,8
ffffffffc020896e:	4685                	li	a3,1
ffffffffc0208970:	8626                	mv	a2,s1
ffffffffc0208972:	8556                	mv	a0,s5
ffffffffc0208974:	b6ffc0ef          	jal	ffffffffc02054e2 <iobuf_move>
ffffffffc0208978:	67a2                	ld	a5,8(sp)
ffffffffc020897a:	0a979663          	bne	a5,s1,ffffffffc0208a26 <disk0_io+0x164>
ffffffffc020897e:	03449793          	slli	a5,s1,0x34
ffffffffc0208982:	e3d5                	bnez	a5,ffffffffc0208a26 <disk0_io+0x164>
ffffffffc0208984:	8c05                	sub	s0,s0,s1
ffffffffc0208986:	f85d                	bnez	s0,ffffffffc020893c <disk0_io+0x7a>
ffffffffc0208988:	79e2                	ld	s3,56(sp)
ffffffffc020898a:	6be2                	ld	s7,24(sp)
ffffffffc020898c:	6c42                	ld	s8,16(sp)
ffffffffc020898e:	0008d517          	auipc	a0,0x8d
ffffffffc0208992:	eb250513          	addi	a0,a0,-334 # ffffffffc0295840 <disk0_sem>
ffffffffc0208996:	ca9fb0ef          	jal	ffffffffc020463e <up>
ffffffffc020899a:	64a6                	ld	s1,72(sp)
ffffffffc020899c:	7a42                	ld	s4,48(sp)
ffffffffc020899e:	7aa2                	ld	s5,40(sp)
ffffffffc02089a0:	b78d                	j	ffffffffc0208902 <disk0_io+0x40>
ffffffffc02089a2:	f05a                	sd	s6,32(sp)
ffffffffc02089a4:	a029                	j	ffffffffc02089ae <disk0_io+0xec>
ffffffffc02089a6:	000a3603          	ld	a2,0(s4)
ffffffffc02089aa:	0124893b          	addw	s2,s1,s2
ffffffffc02089ae:	85b2                	mv	a1,a2
ffffffffc02089b0:	0038                	addi	a4,sp,8
ffffffffc02089b2:	4681                	li	a3,0
ffffffffc02089b4:	6611                	lui	a2,0x4
ffffffffc02089b6:	8556                	mv	a0,s5
ffffffffc02089b8:	b2bfc0ef          	jal	ffffffffc02054e2 <iobuf_move>
ffffffffc02089bc:	67a2                	ld	a5,8(sp)
ffffffffc02089be:	fff78713          	addi	a4,a5,-1
ffffffffc02089c2:	02877a63          	bgeu	a4,s0,ffffffffc02089f6 <disk0_io+0x134>
ffffffffc02089c6:	03479713          	slli	a4,a5,0x34
ffffffffc02089ca:	e715                	bnez	a4,ffffffffc02089f6 <disk0_io+0x134>
ffffffffc02089cc:	83b1                	srli	a5,a5,0xc
ffffffffc02089ce:	0007849b          	sext.w	s1,a5
ffffffffc02089d2:	00349b1b          	slliw	s6,s1,0x3
ffffffffc02089d6:	000a3603          	ld	a2,0(s4)
ffffffffc02089da:	020b1693          	slli	a3,s6,0x20
ffffffffc02089de:	9281                	srli	a3,a3,0x20
ffffffffc02089e0:	0039159b          	slliw	a1,s2,0x3
ffffffffc02089e4:	4509                	li	a0,2
ffffffffc02089e6:	952f80ef          	jal	ffffffffc0200b38 <ide_write_secs>
ffffffffc02089ea:	e151                	bnez	a0,ffffffffc0208a6e <disk0_io+0x1ac>
ffffffffc02089ec:	67a2                	ld	a5,8(sp)
ffffffffc02089ee:	8c1d                	sub	s0,s0,a5
ffffffffc02089f0:	f85d                	bnez	s0,ffffffffc02089a6 <disk0_io+0xe4>
ffffffffc02089f2:	7b02                	ld	s6,32(sp)
ffffffffc02089f4:	bf69                	j	ffffffffc020898e <disk0_io+0xcc>
ffffffffc02089f6:	00005697          	auipc	a3,0x5
ffffffffc02089fa:	73268693          	addi	a3,a3,1842 # ffffffffc020e128 <etext+0x2a14>
ffffffffc02089fe:	00003617          	auipc	a2,0x3
ffffffffc0208a02:	15260613          	addi	a2,a2,338 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0208a06:	05700593          	li	a1,87
ffffffffc0208a0a:	00005517          	auipc	a0,0x5
ffffffffc0208a0e:	75e50513          	addi	a0,a0,1886 # ffffffffc020e168 <etext+0x2a54>
ffffffffc0208a12:	fc4e                	sd	s3,56(sp)
ffffffffc0208a14:	ec5e                	sd	s7,24(sp)
ffffffffc0208a16:	e862                	sd	s8,16(sp)
ffffffffc0208a18:	a33f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208a1c:	6906                	ld	s2,64(sp)
ffffffffc0208a1e:	5575                	li	a0,-3
ffffffffc0208a20:	b5dd                	j	ffffffffc0208906 <disk0_io+0x44>
ffffffffc0208a22:	5575                	li	a0,-3
ffffffffc0208a24:	b5cd                	j	ffffffffc0208906 <disk0_io+0x44>
ffffffffc0208a26:	00005697          	auipc	a3,0x5
ffffffffc0208a2a:	7fa68693          	addi	a3,a3,2042 # ffffffffc020e220 <etext+0x2b0c>
ffffffffc0208a2e:	00003617          	auipc	a2,0x3
ffffffffc0208a32:	12260613          	addi	a2,a2,290 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0208a36:	06200593          	li	a1,98
ffffffffc0208a3a:	00005517          	auipc	a0,0x5
ffffffffc0208a3e:	72e50513          	addi	a0,a0,1838 # ffffffffc020e168 <etext+0x2a54>
ffffffffc0208a42:	f05a                	sd	s6,32(sp)
ffffffffc0208a44:	a07f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208a48:	88aa                	mv	a7,a0
ffffffffc0208a4a:	885e                	mv	a6,s7
ffffffffc0208a4c:	87ce                	mv	a5,s3
ffffffffc0208a4e:	0039171b          	slliw	a4,s2,0x3
ffffffffc0208a52:	86ca                	mv	a3,s2
ffffffffc0208a54:	00005617          	auipc	a2,0x5
ffffffffc0208a58:	78460613          	addi	a2,a2,1924 # ffffffffc020e1d8 <etext+0x2ac4>
ffffffffc0208a5c:	02d00593          	li	a1,45
ffffffffc0208a60:	00005517          	auipc	a0,0x5
ffffffffc0208a64:	70850513          	addi	a0,a0,1800 # ffffffffc020e168 <etext+0x2a54>
ffffffffc0208a68:	f05a                	sd	s6,32(sp)
ffffffffc0208a6a:	9e1f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208a6e:	88aa                	mv	a7,a0
ffffffffc0208a70:	885a                	mv	a6,s6
ffffffffc0208a72:	87a6                	mv	a5,s1
ffffffffc0208a74:	0039171b          	slliw	a4,s2,0x3
ffffffffc0208a78:	86ca                	mv	a3,s2
ffffffffc0208a7a:	00005617          	auipc	a2,0x5
ffffffffc0208a7e:	70e60613          	addi	a2,a2,1806 # ffffffffc020e188 <etext+0x2a74>
ffffffffc0208a82:	03700593          	li	a1,55
ffffffffc0208a86:	00005517          	auipc	a0,0x5
ffffffffc0208a8a:	6e250513          	addi	a0,a0,1762 # ffffffffc020e168 <etext+0x2a54>
ffffffffc0208a8e:	fc4e                	sd	s3,56(sp)
ffffffffc0208a90:	ec5e                	sd	s7,24(sp)
ffffffffc0208a92:	e862                	sd	s8,16(sp)
ffffffffc0208a94:	9b7f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208a98 <dev_init_disk0>:
ffffffffc0208a98:	1101                	addi	sp,sp,-32
ffffffffc0208a9a:	ec06                	sd	ra,24(sp)
ffffffffc0208a9c:	e822                	sd	s0,16(sp)
ffffffffc0208a9e:	e426                	sd	s1,8(sp)
ffffffffc0208aa0:	debff0ef          	jal	ffffffffc020888a <dev_create_inode>
ffffffffc0208aa4:	c541                	beqz	a0,ffffffffc0208b2c <dev_init_disk0+0x94>
ffffffffc0208aa6:	4d38                	lw	a4,88(a0)
ffffffffc0208aa8:	6785                	lui	a5,0x1
ffffffffc0208aaa:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208aae:	842a                	mv	s0,a0
ffffffffc0208ab0:	6485                	lui	s1,0x1
ffffffffc0208ab2:	0cf71e63          	bne	a4,a5,ffffffffc0208b8e <dev_init_disk0+0xf6>
ffffffffc0208ab6:	4509                	li	a0,2
ffffffffc0208ab8:	f9bf70ef          	jal	ffffffffc0200a52 <ide_device_valid>
ffffffffc0208abc:	cd4d                	beqz	a0,ffffffffc0208b76 <dev_init_disk0+0xde>
ffffffffc0208abe:	4509                	li	a0,2
ffffffffc0208ac0:	fb7f70ef          	jal	ffffffffc0200a76 <ide_device_size>
ffffffffc0208ac4:	00000797          	auipc	a5,0x0
ffffffffc0208ac8:	dfa78793          	addi	a5,a5,-518 # ffffffffc02088be <disk0_ioctl>
ffffffffc0208acc:	00000617          	auipc	a2,0x0
ffffffffc0208ad0:	dea60613          	addi	a2,a2,-534 # ffffffffc02088b6 <disk0_open>
ffffffffc0208ad4:	00000697          	auipc	a3,0x0
ffffffffc0208ad8:	de668693          	addi	a3,a3,-538 # ffffffffc02088ba <disk0_close>
ffffffffc0208adc:	00000717          	auipc	a4,0x0
ffffffffc0208ae0:	de670713          	addi	a4,a4,-538 # ffffffffc02088c2 <disk0_io>
ffffffffc0208ae4:	810d                	srli	a0,a0,0x3
ffffffffc0208ae6:	f41c                	sd	a5,40(s0)
ffffffffc0208ae8:	e008                	sd	a0,0(s0)
ffffffffc0208aea:	e810                	sd	a2,16(s0)
ffffffffc0208aec:	ec14                	sd	a3,24(s0)
ffffffffc0208aee:	f018                	sd	a4,32(s0)
ffffffffc0208af0:	4585                	li	a1,1
ffffffffc0208af2:	0008d517          	auipc	a0,0x8d
ffffffffc0208af6:	d4e50513          	addi	a0,a0,-690 # ffffffffc0295840 <disk0_sem>
ffffffffc0208afa:	e404                	sd	s1,8(s0)
ffffffffc0208afc:	b3dfb0ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc0208b00:	6511                	lui	a0,0x4
ffffffffc0208b02:	cbef90ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0208b06:	0008e797          	auipc	a5,0x8e
ffffffffc0208b0a:	dea7b923          	sd	a0,-526(a5) # ffffffffc02968f8 <disk0_buffer>
ffffffffc0208b0e:	c921                	beqz	a0,ffffffffc0208b5e <dev_init_disk0+0xc6>
ffffffffc0208b10:	85a2                	mv	a1,s0
ffffffffc0208b12:	4605                	li	a2,1
ffffffffc0208b14:	00005517          	auipc	a0,0x5
ffffffffc0208b18:	79c50513          	addi	a0,a0,1948 # ffffffffc020e2b0 <etext+0x2b9c>
ffffffffc0208b1c:	c26ff0ef          	jal	ffffffffc0207f42 <vfs_add_dev>
ffffffffc0208b20:	e115                	bnez	a0,ffffffffc0208b44 <dev_init_disk0+0xac>
ffffffffc0208b22:	60e2                	ld	ra,24(sp)
ffffffffc0208b24:	6442                	ld	s0,16(sp)
ffffffffc0208b26:	64a2                	ld	s1,8(sp)
ffffffffc0208b28:	6105                	addi	sp,sp,32
ffffffffc0208b2a:	8082                	ret
ffffffffc0208b2c:	00005617          	auipc	a2,0x5
ffffffffc0208b30:	72460613          	addi	a2,a2,1828 # ffffffffc020e250 <etext+0x2b3c>
ffffffffc0208b34:	08700593          	li	a1,135
ffffffffc0208b38:	00005517          	auipc	a0,0x5
ffffffffc0208b3c:	63050513          	addi	a0,a0,1584 # ffffffffc020e168 <etext+0x2a54>
ffffffffc0208b40:	90bf70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208b44:	86aa                	mv	a3,a0
ffffffffc0208b46:	00005617          	auipc	a2,0x5
ffffffffc0208b4a:	77260613          	addi	a2,a2,1906 # ffffffffc020e2b8 <etext+0x2ba4>
ffffffffc0208b4e:	08d00593          	li	a1,141
ffffffffc0208b52:	00005517          	auipc	a0,0x5
ffffffffc0208b56:	61650513          	addi	a0,a0,1558 # ffffffffc020e168 <etext+0x2a54>
ffffffffc0208b5a:	8f1f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208b5e:	00005617          	auipc	a2,0x5
ffffffffc0208b62:	73260613          	addi	a2,a2,1842 # ffffffffc020e290 <etext+0x2b7c>
ffffffffc0208b66:	07f00593          	li	a1,127
ffffffffc0208b6a:	00005517          	auipc	a0,0x5
ffffffffc0208b6e:	5fe50513          	addi	a0,a0,1534 # ffffffffc020e168 <etext+0x2a54>
ffffffffc0208b72:	8d9f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208b76:	00005617          	auipc	a2,0x5
ffffffffc0208b7a:	6fa60613          	addi	a2,a2,1786 # ffffffffc020e270 <etext+0x2b5c>
ffffffffc0208b7e:	07300593          	li	a1,115
ffffffffc0208b82:	00005517          	auipc	a0,0x5
ffffffffc0208b86:	5e650513          	addi	a0,a0,1510 # ffffffffc020e168 <etext+0x2a54>
ffffffffc0208b8a:	8c1f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208b8e:	00005697          	auipc	a3,0x5
ffffffffc0208b92:	27268693          	addi	a3,a3,626 # ffffffffc020de00 <etext+0x26ec>
ffffffffc0208b96:	00003617          	auipc	a2,0x3
ffffffffc0208b9a:	fba60613          	addi	a2,a2,-70 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0208b9e:	08900593          	li	a1,137
ffffffffc0208ba2:	00005517          	auipc	a0,0x5
ffffffffc0208ba6:	5c650513          	addi	a0,a0,1478 # ffffffffc020e168 <etext+0x2a54>
ffffffffc0208baa:	8a1f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208bae <stdin_open>:
ffffffffc0208bae:	e199                	bnez	a1,ffffffffc0208bb4 <stdin_open+0x6>
ffffffffc0208bb0:	4501                	li	a0,0
ffffffffc0208bb2:	8082                	ret
ffffffffc0208bb4:	5575                	li	a0,-3
ffffffffc0208bb6:	8082                	ret

ffffffffc0208bb8 <stdin_close>:
ffffffffc0208bb8:	4501                	li	a0,0
ffffffffc0208bba:	8082                	ret

ffffffffc0208bbc <stdin_ioctl>:
ffffffffc0208bbc:	5575                	li	a0,-3
ffffffffc0208bbe:	8082                	ret

ffffffffc0208bc0 <stdin_io>:
ffffffffc0208bc0:	14061f63          	bnez	a2,ffffffffc0208d1e <stdin_io+0x15e>
ffffffffc0208bc4:	7175                	addi	sp,sp,-144
ffffffffc0208bc6:	ecd6                	sd	s5,88(sp)
ffffffffc0208bc8:	e8da                	sd	s6,80(sp)
ffffffffc0208bca:	e4de                	sd	s7,72(sp)
ffffffffc0208bcc:	0185bb03          	ld	s6,24(a1)
ffffffffc0208bd0:	0005bb83          	ld	s7,0(a1)
ffffffffc0208bd4:	e506                	sd	ra,136(sp)
ffffffffc0208bd6:	e122                	sd	s0,128(sp)
ffffffffc0208bd8:	8aae                	mv	s5,a1
ffffffffc0208bda:	100027f3          	csrr	a5,sstatus
ffffffffc0208bde:	8b89                	andi	a5,a5,2
ffffffffc0208be0:	12079663          	bnez	a5,ffffffffc0208d0c <stdin_io+0x14c>
ffffffffc0208be4:	4401                	li	s0,0
ffffffffc0208be6:	120b0a63          	beqz	s6,ffffffffc0208d1a <stdin_io+0x15a>
ffffffffc0208bea:	f8ca                	sd	s2,112(sp)
ffffffffc0208bec:	0008e917          	auipc	s2,0x8e
ffffffffc0208bf0:	d1c90913          	addi	s2,s2,-740 # ffffffffc0296908 <p_rpos>
ffffffffc0208bf4:	00093783          	ld	a5,0(s2)
ffffffffc0208bf8:	fca6                	sd	s1,120(sp)
ffffffffc0208bfa:	6705                	lui	a4,0x1
ffffffffc0208bfc:	800004b7          	lui	s1,0x80000
ffffffffc0208c00:	f4ce                	sd	s3,104(sp)
ffffffffc0208c02:	f0d2                	sd	s4,96(sp)
ffffffffc0208c04:	e0e2                	sd	s8,64(sp)
ffffffffc0208c06:	0491                	addi	s1,s1,4 # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc0208c08:	fff70c13          	addi	s8,a4,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0208c0c:	4a01                	li	s4,0
ffffffffc0208c0e:	0008e997          	auipc	s3,0x8e
ffffffffc0208c12:	cf298993          	addi	s3,s3,-782 # ffffffffc0296900 <p_wpos>
ffffffffc0208c16:	0009b703          	ld	a4,0(s3)
ffffffffc0208c1a:	02e7d763          	bge	a5,a4,ffffffffc0208c48 <stdin_io+0x88>
ffffffffc0208c1e:	a045                	j	ffffffffc0208cbe <stdin_io+0xfe>
ffffffffc0208c20:	fd2fe0ef          	jal	ffffffffc02073f2 <schedule>
ffffffffc0208c24:	100027f3          	csrr	a5,sstatus
ffffffffc0208c28:	8b89                	andi	a5,a5,2
ffffffffc0208c2a:	4401                	li	s0,0
ffffffffc0208c2c:	e3b1                	bnez	a5,ffffffffc0208c70 <stdin_io+0xb0>
ffffffffc0208c2e:	0828                	addi	a0,sp,24
ffffffffc0208c30:	aa3fb0ef          	jal	ffffffffc02046d2 <wait_in_queue>
ffffffffc0208c34:	e529                	bnez	a0,ffffffffc0208c7e <stdin_io+0xbe>
ffffffffc0208c36:	5782                	lw	a5,32(sp)
ffffffffc0208c38:	04979d63          	bne	a5,s1,ffffffffc0208c92 <stdin_io+0xd2>
ffffffffc0208c3c:	00093783          	ld	a5,0(s2)
ffffffffc0208c40:	0009b703          	ld	a4,0(s3)
ffffffffc0208c44:	06e7cd63          	blt	a5,a4,ffffffffc0208cbe <stdin_io+0xfe>
ffffffffc0208c48:	80000637          	lui	a2,0x80000
ffffffffc0208c4c:	0611                	addi	a2,a2,4 # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc0208c4e:	082c                	addi	a1,sp,24
ffffffffc0208c50:	0008d517          	auipc	a0,0x8d
ffffffffc0208c54:	c0850513          	addi	a0,a0,-1016 # ffffffffc0295858 <__wait_queue>
ffffffffc0208c58:	ba7fb0ef          	jal	ffffffffc02047fe <wait_current_set>
ffffffffc0208c5c:	d071                	beqz	s0,ffffffffc0208c20 <stdin_io+0x60>
ffffffffc0208c5e:	f75f70ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0208c62:	f90fe0ef          	jal	ffffffffc02073f2 <schedule>
ffffffffc0208c66:	100027f3          	csrr	a5,sstatus
ffffffffc0208c6a:	8b89                	andi	a5,a5,2
ffffffffc0208c6c:	4401                	li	s0,0
ffffffffc0208c6e:	d3e1                	beqz	a5,ffffffffc0208c2e <stdin_io+0x6e>
ffffffffc0208c70:	f69f70ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0208c74:	0828                	addi	a0,sp,24
ffffffffc0208c76:	4405                	li	s0,1
ffffffffc0208c78:	a5bfb0ef          	jal	ffffffffc02046d2 <wait_in_queue>
ffffffffc0208c7c:	dd4d                	beqz	a0,ffffffffc0208c36 <stdin_io+0x76>
ffffffffc0208c7e:	082c                	addi	a1,sp,24
ffffffffc0208c80:	0008d517          	auipc	a0,0x8d
ffffffffc0208c84:	bd850513          	addi	a0,a0,-1064 # ffffffffc0295858 <__wait_queue>
ffffffffc0208c88:	9f1fb0ef          	jal	ffffffffc0204678 <wait_queue_del>
ffffffffc0208c8c:	5782                	lw	a5,32(sp)
ffffffffc0208c8e:	fa9787e3          	beq	a5,s1,ffffffffc0208c3c <stdin_io+0x7c>
ffffffffc0208c92:	000a051b          	sext.w	a0,s4
ffffffffc0208c96:	e42d                	bnez	s0,ffffffffc0208d00 <stdin_io+0x140>
ffffffffc0208c98:	c519                	beqz	a0,ffffffffc0208ca6 <stdin_io+0xe6>
ffffffffc0208c9a:	018ab783          	ld	a5,24(s5)
ffffffffc0208c9e:	414787b3          	sub	a5,a5,s4
ffffffffc0208ca2:	00fabc23          	sd	a5,24(s5)
ffffffffc0208ca6:	74e6                	ld	s1,120(sp)
ffffffffc0208ca8:	7946                	ld	s2,112(sp)
ffffffffc0208caa:	79a6                	ld	s3,104(sp)
ffffffffc0208cac:	7a06                	ld	s4,96(sp)
ffffffffc0208cae:	6c06                	ld	s8,64(sp)
ffffffffc0208cb0:	60aa                	ld	ra,136(sp)
ffffffffc0208cb2:	640a                	ld	s0,128(sp)
ffffffffc0208cb4:	6ae6                	ld	s5,88(sp)
ffffffffc0208cb6:	6b46                	ld	s6,80(sp)
ffffffffc0208cb8:	6ba6                	ld	s7,72(sp)
ffffffffc0208cba:	6149                	addi	sp,sp,144
ffffffffc0208cbc:	8082                	ret
ffffffffc0208cbe:	43f7d693          	srai	a3,a5,0x3f
ffffffffc0208cc2:	92d1                	srli	a3,a3,0x34
ffffffffc0208cc4:	00d78733          	add	a4,a5,a3
ffffffffc0208cc8:	01877733          	and	a4,a4,s8
ffffffffc0208ccc:	8f15                	sub	a4,a4,a3
ffffffffc0208cce:	0008d697          	auipc	a3,0x8d
ffffffffc0208cd2:	b9a68693          	addi	a3,a3,-1126 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208cd6:	9736                	add	a4,a4,a3
ffffffffc0208cd8:	00074683          	lbu	a3,0(a4)
ffffffffc0208cdc:	0785                	addi	a5,a5,1
ffffffffc0208cde:	014b8733          	add	a4,s7,s4
ffffffffc0208ce2:	001a051b          	addiw	a0,s4,1
ffffffffc0208ce6:	00f93023          	sd	a5,0(s2)
ffffffffc0208cea:	00d70023          	sb	a3,0(a4)
ffffffffc0208cee:	0a05                	addi	s4,s4,1
ffffffffc0208cf0:	f36a63e3          	bltu	s4,s6,ffffffffc0208c16 <stdin_io+0x56>
ffffffffc0208cf4:	d05d                	beqz	s0,ffffffffc0208c9a <stdin_io+0xda>
ffffffffc0208cf6:	e42a                	sd	a0,8(sp)
ffffffffc0208cf8:	edbf70ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0208cfc:	6522                	ld	a0,8(sp)
ffffffffc0208cfe:	bf71                	j	ffffffffc0208c9a <stdin_io+0xda>
ffffffffc0208d00:	e42a                	sd	a0,8(sp)
ffffffffc0208d02:	ed1f70ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0208d06:	6522                	ld	a0,8(sp)
ffffffffc0208d08:	f949                	bnez	a0,ffffffffc0208c9a <stdin_io+0xda>
ffffffffc0208d0a:	bf71                	j	ffffffffc0208ca6 <stdin_io+0xe6>
ffffffffc0208d0c:	ecdf70ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0208d10:	4405                	li	s0,1
ffffffffc0208d12:	ec0b1ce3          	bnez	s6,ffffffffc0208bea <stdin_io+0x2a>
ffffffffc0208d16:	ebdf70ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0208d1a:	4501                	li	a0,0
ffffffffc0208d1c:	bf51                	j	ffffffffc0208cb0 <stdin_io+0xf0>
ffffffffc0208d1e:	5575                	li	a0,-3
ffffffffc0208d20:	8082                	ret

ffffffffc0208d22 <dev_stdin_write>:
ffffffffc0208d22:	e111                	bnez	a0,ffffffffc0208d26 <dev_stdin_write+0x4>
ffffffffc0208d24:	8082                	ret
ffffffffc0208d26:	1101                	addi	sp,sp,-32
ffffffffc0208d28:	ec06                	sd	ra,24(sp)
ffffffffc0208d2a:	e822                	sd	s0,16(sp)
ffffffffc0208d2c:	100027f3          	csrr	a5,sstatus
ffffffffc0208d30:	8b89                	andi	a5,a5,2
ffffffffc0208d32:	4401                	li	s0,0
ffffffffc0208d34:	e3c1                	bnez	a5,ffffffffc0208db4 <dev_stdin_write+0x92>
ffffffffc0208d36:	0008e717          	auipc	a4,0x8e
ffffffffc0208d3a:	bca73703          	ld	a4,-1078(a4) # ffffffffc0296900 <p_wpos>
ffffffffc0208d3e:	6585                	lui	a1,0x1
ffffffffc0208d40:	fff58613          	addi	a2,a1,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0208d44:	43f75693          	srai	a3,a4,0x3f
ffffffffc0208d48:	92d1                	srli	a3,a3,0x34
ffffffffc0208d4a:	00d707b3          	add	a5,a4,a3
ffffffffc0208d4e:	8ff1                	and	a5,a5,a2
ffffffffc0208d50:	0008e617          	auipc	a2,0x8e
ffffffffc0208d54:	bb863603          	ld	a2,-1096(a2) # ffffffffc0296908 <p_rpos>
ffffffffc0208d58:	8f95                	sub	a5,a5,a3
ffffffffc0208d5a:	0008d697          	auipc	a3,0x8d
ffffffffc0208d5e:	b0e68693          	addi	a3,a3,-1266 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208d62:	97b6                	add	a5,a5,a3
ffffffffc0208d64:	00a78023          	sb	a0,0(a5)
ffffffffc0208d68:	40c707b3          	sub	a5,a4,a2
ffffffffc0208d6c:	00b7d763          	bge	a5,a1,ffffffffc0208d7a <dev_stdin_write+0x58>
ffffffffc0208d70:	0705                	addi	a4,a4,1
ffffffffc0208d72:	0008e797          	auipc	a5,0x8e
ffffffffc0208d76:	b8e7b723          	sd	a4,-1138(a5) # ffffffffc0296900 <p_wpos>
ffffffffc0208d7a:	0008d517          	auipc	a0,0x8d
ffffffffc0208d7e:	ade50513          	addi	a0,a0,-1314 # ffffffffc0295858 <__wait_queue>
ffffffffc0208d82:	945fb0ef          	jal	ffffffffc02046c6 <wait_queue_empty>
ffffffffc0208d86:	c919                	beqz	a0,ffffffffc0208d9c <dev_stdin_write+0x7a>
ffffffffc0208d88:	e409                	bnez	s0,ffffffffc0208d92 <dev_stdin_write+0x70>
ffffffffc0208d8a:	60e2                	ld	ra,24(sp)
ffffffffc0208d8c:	6442                	ld	s0,16(sp)
ffffffffc0208d8e:	6105                	addi	sp,sp,32
ffffffffc0208d90:	8082                	ret
ffffffffc0208d92:	6442                	ld	s0,16(sp)
ffffffffc0208d94:	60e2                	ld	ra,24(sp)
ffffffffc0208d96:	6105                	addi	sp,sp,32
ffffffffc0208d98:	e3bf706f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc0208d9c:	800005b7          	lui	a1,0x80000
ffffffffc0208da0:	0591                	addi	a1,a1,4 # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc0208da2:	4605                	li	a2,1
ffffffffc0208da4:	0008d517          	auipc	a0,0x8d
ffffffffc0208da8:	ab450513          	addi	a0,a0,-1356 # ffffffffc0295858 <__wait_queue>
ffffffffc0208dac:	983fb0ef          	jal	ffffffffc020472e <wakeup_queue>
ffffffffc0208db0:	dc69                	beqz	s0,ffffffffc0208d8a <dev_stdin_write+0x68>
ffffffffc0208db2:	b7c5                	j	ffffffffc0208d92 <dev_stdin_write+0x70>
ffffffffc0208db4:	e42a                	sd	a0,8(sp)
ffffffffc0208db6:	e23f70ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0208dba:	6522                	ld	a0,8(sp)
ffffffffc0208dbc:	4405                	li	s0,1
ffffffffc0208dbe:	bfa5                	j	ffffffffc0208d36 <dev_stdin_write+0x14>

ffffffffc0208dc0 <dev_init_stdin>:
ffffffffc0208dc0:	1101                	addi	sp,sp,-32
ffffffffc0208dc2:	ec06                	sd	ra,24(sp)
ffffffffc0208dc4:	ac7ff0ef          	jal	ffffffffc020888a <dev_create_inode>
ffffffffc0208dc8:	c935                	beqz	a0,ffffffffc0208e3c <dev_init_stdin+0x7c>
ffffffffc0208dca:	4d38                	lw	a4,88(a0)
ffffffffc0208dcc:	6785                	lui	a5,0x1
ffffffffc0208dce:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208dd2:	08f71e63          	bne	a4,a5,ffffffffc0208e6e <dev_init_stdin+0xae>
ffffffffc0208dd6:	4785                	li	a5,1
ffffffffc0208dd8:	e51c                	sd	a5,8(a0)
ffffffffc0208dda:	00000797          	auipc	a5,0x0
ffffffffc0208dde:	dd478793          	addi	a5,a5,-556 # ffffffffc0208bae <stdin_open>
ffffffffc0208de2:	e91c                	sd	a5,16(a0)
ffffffffc0208de4:	00000797          	auipc	a5,0x0
ffffffffc0208de8:	dd478793          	addi	a5,a5,-556 # ffffffffc0208bb8 <stdin_close>
ffffffffc0208dec:	ed1c                	sd	a5,24(a0)
ffffffffc0208dee:	00000797          	auipc	a5,0x0
ffffffffc0208df2:	dd278793          	addi	a5,a5,-558 # ffffffffc0208bc0 <stdin_io>
ffffffffc0208df6:	f11c                	sd	a5,32(a0)
ffffffffc0208df8:	00000797          	auipc	a5,0x0
ffffffffc0208dfc:	dc478793          	addi	a5,a5,-572 # ffffffffc0208bbc <stdin_ioctl>
ffffffffc0208e00:	f51c                	sd	a5,40(a0)
ffffffffc0208e02:	00053023          	sd	zero,0(a0)
ffffffffc0208e06:	e42a                	sd	a0,8(sp)
ffffffffc0208e08:	0008d517          	auipc	a0,0x8d
ffffffffc0208e0c:	a5050513          	addi	a0,a0,-1456 # ffffffffc0295858 <__wait_queue>
ffffffffc0208e10:	0008e797          	auipc	a5,0x8e
ffffffffc0208e14:	ae07b823          	sd	zero,-1296(a5) # ffffffffc0296900 <p_wpos>
ffffffffc0208e18:	0008e797          	auipc	a5,0x8e
ffffffffc0208e1c:	ae07b823          	sd	zero,-1296(a5) # ffffffffc0296908 <p_rpos>
ffffffffc0208e20:	853fb0ef          	jal	ffffffffc0204672 <wait_queue_init>
ffffffffc0208e24:	65a2                	ld	a1,8(sp)
ffffffffc0208e26:	4601                	li	a2,0
ffffffffc0208e28:	00005517          	auipc	a0,0x5
ffffffffc0208e2c:	4f050513          	addi	a0,a0,1264 # ffffffffc020e318 <etext+0x2c04>
ffffffffc0208e30:	912ff0ef          	jal	ffffffffc0207f42 <vfs_add_dev>
ffffffffc0208e34:	e105                	bnez	a0,ffffffffc0208e54 <dev_init_stdin+0x94>
ffffffffc0208e36:	60e2                	ld	ra,24(sp)
ffffffffc0208e38:	6105                	addi	sp,sp,32
ffffffffc0208e3a:	8082                	ret
ffffffffc0208e3c:	00005617          	auipc	a2,0x5
ffffffffc0208e40:	49c60613          	addi	a2,a2,1180 # ffffffffc020e2d8 <etext+0x2bc4>
ffffffffc0208e44:	07500593          	li	a1,117
ffffffffc0208e48:	00005517          	auipc	a0,0x5
ffffffffc0208e4c:	4b050513          	addi	a0,a0,1200 # ffffffffc020e2f8 <etext+0x2be4>
ffffffffc0208e50:	dfaf70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208e54:	86aa                	mv	a3,a0
ffffffffc0208e56:	00005617          	auipc	a2,0x5
ffffffffc0208e5a:	4ca60613          	addi	a2,a2,1226 # ffffffffc020e320 <etext+0x2c0c>
ffffffffc0208e5e:	07b00593          	li	a1,123
ffffffffc0208e62:	00005517          	auipc	a0,0x5
ffffffffc0208e66:	49650513          	addi	a0,a0,1174 # ffffffffc020e2f8 <etext+0x2be4>
ffffffffc0208e6a:	de0f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208e6e:	00005697          	auipc	a3,0x5
ffffffffc0208e72:	f9268693          	addi	a3,a3,-110 # ffffffffc020de00 <etext+0x26ec>
ffffffffc0208e76:	00003617          	auipc	a2,0x3
ffffffffc0208e7a:	cda60613          	addi	a2,a2,-806 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0208e7e:	07700593          	li	a1,119
ffffffffc0208e82:	00005517          	auipc	a0,0x5
ffffffffc0208e86:	47650513          	addi	a0,a0,1142 # ffffffffc020e2f8 <etext+0x2be4>
ffffffffc0208e8a:	dc0f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208e8e <stdout_open>:
ffffffffc0208e8e:	4785                	li	a5,1
ffffffffc0208e90:	00f59463          	bne	a1,a5,ffffffffc0208e98 <stdout_open+0xa>
ffffffffc0208e94:	4501                	li	a0,0
ffffffffc0208e96:	8082                	ret
ffffffffc0208e98:	5575                	li	a0,-3
ffffffffc0208e9a:	8082                	ret

ffffffffc0208e9c <stdout_close>:
ffffffffc0208e9c:	4501                	li	a0,0
ffffffffc0208e9e:	8082                	ret

ffffffffc0208ea0 <stdout_ioctl>:
ffffffffc0208ea0:	5575                	li	a0,-3
ffffffffc0208ea2:	8082                	ret

ffffffffc0208ea4 <stdout_io>:
ffffffffc0208ea4:	ca15                	beqz	a2,ffffffffc0208ed8 <stdout_io+0x34>
ffffffffc0208ea6:	6d9c                	ld	a5,24(a1)
ffffffffc0208ea8:	c795                	beqz	a5,ffffffffc0208ed4 <stdout_io+0x30>
ffffffffc0208eaa:	1101                	addi	sp,sp,-32
ffffffffc0208eac:	e822                	sd	s0,16(sp)
ffffffffc0208eae:	6180                	ld	s0,0(a1)
ffffffffc0208eb0:	e426                	sd	s1,8(sp)
ffffffffc0208eb2:	ec06                	sd	ra,24(sp)
ffffffffc0208eb4:	84ae                	mv	s1,a1
ffffffffc0208eb6:	00044503          	lbu	a0,0(s0)
ffffffffc0208eba:	0405                	addi	s0,s0,1
ffffffffc0208ebc:	b24f70ef          	jal	ffffffffc02001e0 <cputchar>
ffffffffc0208ec0:	6c9c                	ld	a5,24(s1)
ffffffffc0208ec2:	17fd                	addi	a5,a5,-1
ffffffffc0208ec4:	ec9c                	sd	a5,24(s1)
ffffffffc0208ec6:	fbe5                	bnez	a5,ffffffffc0208eb6 <stdout_io+0x12>
ffffffffc0208ec8:	60e2                	ld	ra,24(sp)
ffffffffc0208eca:	6442                	ld	s0,16(sp)
ffffffffc0208ecc:	64a2                	ld	s1,8(sp)
ffffffffc0208ece:	4501                	li	a0,0
ffffffffc0208ed0:	6105                	addi	sp,sp,32
ffffffffc0208ed2:	8082                	ret
ffffffffc0208ed4:	4501                	li	a0,0
ffffffffc0208ed6:	8082                	ret
ffffffffc0208ed8:	5575                	li	a0,-3
ffffffffc0208eda:	8082                	ret

ffffffffc0208edc <dev_init_stdout>:
ffffffffc0208edc:	1141                	addi	sp,sp,-16
ffffffffc0208ede:	e406                	sd	ra,8(sp)
ffffffffc0208ee0:	9abff0ef          	jal	ffffffffc020888a <dev_create_inode>
ffffffffc0208ee4:	c939                	beqz	a0,ffffffffc0208f3a <dev_init_stdout+0x5e>
ffffffffc0208ee6:	4d38                	lw	a4,88(a0)
ffffffffc0208ee8:	6785                	lui	a5,0x1
ffffffffc0208eea:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208eee:	06f71f63          	bne	a4,a5,ffffffffc0208f6c <dev_init_stdout+0x90>
ffffffffc0208ef2:	4785                	li	a5,1
ffffffffc0208ef4:	e51c                	sd	a5,8(a0)
ffffffffc0208ef6:	00000797          	auipc	a5,0x0
ffffffffc0208efa:	f9878793          	addi	a5,a5,-104 # ffffffffc0208e8e <stdout_open>
ffffffffc0208efe:	e91c                	sd	a5,16(a0)
ffffffffc0208f00:	00000797          	auipc	a5,0x0
ffffffffc0208f04:	f9c78793          	addi	a5,a5,-100 # ffffffffc0208e9c <stdout_close>
ffffffffc0208f08:	ed1c                	sd	a5,24(a0)
ffffffffc0208f0a:	00000797          	auipc	a5,0x0
ffffffffc0208f0e:	f9a78793          	addi	a5,a5,-102 # ffffffffc0208ea4 <stdout_io>
ffffffffc0208f12:	f11c                	sd	a5,32(a0)
ffffffffc0208f14:	00000797          	auipc	a5,0x0
ffffffffc0208f18:	f8c78793          	addi	a5,a5,-116 # ffffffffc0208ea0 <stdout_ioctl>
ffffffffc0208f1c:	f51c                	sd	a5,40(a0)
ffffffffc0208f1e:	00053023          	sd	zero,0(a0)
ffffffffc0208f22:	85aa                	mv	a1,a0
ffffffffc0208f24:	4601                	li	a2,0
ffffffffc0208f26:	00005517          	auipc	a0,0x5
ffffffffc0208f2a:	45a50513          	addi	a0,a0,1114 # ffffffffc020e380 <etext+0x2c6c>
ffffffffc0208f2e:	814ff0ef          	jal	ffffffffc0207f42 <vfs_add_dev>
ffffffffc0208f32:	e105                	bnez	a0,ffffffffc0208f52 <dev_init_stdout+0x76>
ffffffffc0208f34:	60a2                	ld	ra,8(sp)
ffffffffc0208f36:	0141                	addi	sp,sp,16
ffffffffc0208f38:	8082                	ret
ffffffffc0208f3a:	00005617          	auipc	a2,0x5
ffffffffc0208f3e:	40660613          	addi	a2,a2,1030 # ffffffffc020e340 <etext+0x2c2c>
ffffffffc0208f42:	03700593          	li	a1,55
ffffffffc0208f46:	00005517          	auipc	a0,0x5
ffffffffc0208f4a:	41a50513          	addi	a0,a0,1050 # ffffffffc020e360 <etext+0x2c4c>
ffffffffc0208f4e:	cfcf70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208f52:	86aa                	mv	a3,a0
ffffffffc0208f54:	00005617          	auipc	a2,0x5
ffffffffc0208f58:	43460613          	addi	a2,a2,1076 # ffffffffc020e388 <etext+0x2c74>
ffffffffc0208f5c:	03d00593          	li	a1,61
ffffffffc0208f60:	00005517          	auipc	a0,0x5
ffffffffc0208f64:	40050513          	addi	a0,a0,1024 # ffffffffc020e360 <etext+0x2c4c>
ffffffffc0208f68:	ce2f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208f6c:	00005697          	auipc	a3,0x5
ffffffffc0208f70:	e9468693          	addi	a3,a3,-364 # ffffffffc020de00 <etext+0x26ec>
ffffffffc0208f74:	00003617          	auipc	a2,0x3
ffffffffc0208f78:	bdc60613          	addi	a2,a2,-1060 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0208f7c:	03900593          	li	a1,57
ffffffffc0208f80:	00005517          	auipc	a0,0x5
ffffffffc0208f84:	3e050513          	addi	a0,a0,992 # ffffffffc020e360 <etext+0x2c4c>
ffffffffc0208f88:	cc2f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208f8c <bitmap_translate.part.0>:
ffffffffc0208f8c:	1141                	addi	sp,sp,-16
ffffffffc0208f8e:	00005697          	auipc	a3,0x5
ffffffffc0208f92:	41a68693          	addi	a3,a3,1050 # ffffffffc020e3a8 <etext+0x2c94>
ffffffffc0208f96:	00003617          	auipc	a2,0x3
ffffffffc0208f9a:	bba60613          	addi	a2,a2,-1094 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0208f9e:	04c00593          	li	a1,76
ffffffffc0208fa2:	00005517          	auipc	a0,0x5
ffffffffc0208fa6:	41e50513          	addi	a0,a0,1054 # ffffffffc020e3c0 <etext+0x2cac>
ffffffffc0208faa:	e406                	sd	ra,8(sp)
ffffffffc0208fac:	c9ef70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208fb0 <bitmap_create>:
ffffffffc0208fb0:	7139                	addi	sp,sp,-64
ffffffffc0208fb2:	fc06                	sd	ra,56(sp)
ffffffffc0208fb4:	f822                	sd	s0,48(sp)
ffffffffc0208fb6:	f426                	sd	s1,40(sp)
ffffffffc0208fb8:	c179                	beqz	a0,ffffffffc020907e <bitmap_create+0xce>
ffffffffc0208fba:	842a                	mv	s0,a0
ffffffffc0208fbc:	4541                	li	a0,16
ffffffffc0208fbe:	802f90ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0208fc2:	84aa                	mv	s1,a0
ffffffffc0208fc4:	c555                	beqz	a0,ffffffffc0209070 <bitmap_create+0xc0>
ffffffffc0208fc6:	e852                	sd	s4,16(sp)
ffffffffc0208fc8:	02041a13          	slli	s4,s0,0x20
ffffffffc0208fcc:	020a5a13          	srli	s4,s4,0x20
ffffffffc0208fd0:	f04a                	sd	s2,32(sp)
ffffffffc0208fd2:	01fa0913          	addi	s2,s4,31
ffffffffc0208fd6:	ec4e                	sd	s3,24(sp)
ffffffffc0208fd8:	00595993          	srli	s3,s2,0x5
ffffffffc0208fdc:	00299613          	slli	a2,s3,0x2
ffffffffc0208fe0:	8532                	mv	a0,a2
ffffffffc0208fe2:	e432                	sd	a2,8(sp)
ffffffffc0208fe4:	fddf80ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0208fe8:	6622                	ld	a2,8(sp)
ffffffffc0208fea:	cd2d                	beqz	a0,ffffffffc0209064 <bitmap_create+0xb4>
ffffffffc0208fec:	c080                	sw	s0,0(s1)
ffffffffc0208fee:	0134a223          	sw	s3,4(s1)
ffffffffc0208ff2:	0ff00593          	li	a1,255
ffffffffc0208ff6:	6b6020ef          	jal	ffffffffc020b6ac <memset>
ffffffffc0208ffa:	4785                	li	a5,1
ffffffffc0208ffc:	1796                	slli	a5,a5,0x25
ffffffffc0208ffe:	1781                	addi	a5,a5,-32
ffffffffc0209000:	e488                	sd	a0,8(s1)
ffffffffc0209002:	00f97933          	and	s2,s2,a5
ffffffffc0209006:	052a0663          	beq	s4,s2,ffffffffc0209052 <bitmap_create+0xa2>
ffffffffc020900a:	39fd                	addiw	s3,s3,-1
ffffffffc020900c:	0054571b          	srliw	a4,s0,0x5
ffffffffc0209010:	0b371963          	bne	a4,s3,ffffffffc02090c2 <bitmap_create+0x112>
ffffffffc0209014:	0057179b          	slliw	a5,a4,0x5
ffffffffc0209018:	40f407bb          	subw	a5,s0,a5
ffffffffc020901c:	fff7861b          	addiw	a2,a5,-1
ffffffffc0209020:	46f9                	li	a3,30
ffffffffc0209022:	08c6e063          	bltu	a3,a2,ffffffffc02090a2 <bitmap_create+0xf2>
ffffffffc0209026:	070a                	slli	a4,a4,0x2
ffffffffc0209028:	953a                	add	a0,a0,a4
ffffffffc020902a:	4118                	lw	a4,0(a0)
ffffffffc020902c:	4585                	li	a1,1
ffffffffc020902e:	02000613          	li	a2,32
ffffffffc0209032:	00f596bb          	sllw	a3,a1,a5
ffffffffc0209036:	2785                	addiw	a5,a5,1
ffffffffc0209038:	8f35                	xor	a4,a4,a3
ffffffffc020903a:	fec79ce3          	bne	a5,a2,ffffffffc0209032 <bitmap_create+0x82>
ffffffffc020903e:	7442                	ld	s0,48(sp)
ffffffffc0209040:	70e2                	ld	ra,56(sp)
ffffffffc0209042:	c118                	sw	a4,0(a0)
ffffffffc0209044:	7902                	ld	s2,32(sp)
ffffffffc0209046:	69e2                	ld	s3,24(sp)
ffffffffc0209048:	6a42                	ld	s4,16(sp)
ffffffffc020904a:	8526                	mv	a0,s1
ffffffffc020904c:	74a2                	ld	s1,40(sp)
ffffffffc020904e:	6121                	addi	sp,sp,64
ffffffffc0209050:	8082                	ret
ffffffffc0209052:	7442                	ld	s0,48(sp)
ffffffffc0209054:	70e2                	ld	ra,56(sp)
ffffffffc0209056:	7902                	ld	s2,32(sp)
ffffffffc0209058:	69e2                	ld	s3,24(sp)
ffffffffc020905a:	6a42                	ld	s4,16(sp)
ffffffffc020905c:	8526                	mv	a0,s1
ffffffffc020905e:	74a2                	ld	s1,40(sp)
ffffffffc0209060:	6121                	addi	sp,sp,64
ffffffffc0209062:	8082                	ret
ffffffffc0209064:	8526                	mv	a0,s1
ffffffffc0209066:	800f90ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020906a:	7902                	ld	s2,32(sp)
ffffffffc020906c:	69e2                	ld	s3,24(sp)
ffffffffc020906e:	6a42                	ld	s4,16(sp)
ffffffffc0209070:	7442                	ld	s0,48(sp)
ffffffffc0209072:	70e2                	ld	ra,56(sp)
ffffffffc0209074:	4481                	li	s1,0
ffffffffc0209076:	8526                	mv	a0,s1
ffffffffc0209078:	74a2                	ld	s1,40(sp)
ffffffffc020907a:	6121                	addi	sp,sp,64
ffffffffc020907c:	8082                	ret
ffffffffc020907e:	00005697          	auipc	a3,0x5
ffffffffc0209082:	35a68693          	addi	a3,a3,858 # ffffffffc020e3d8 <etext+0x2cc4>
ffffffffc0209086:	00003617          	auipc	a2,0x3
ffffffffc020908a:	aca60613          	addi	a2,a2,-1334 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020908e:	45d5                	li	a1,21
ffffffffc0209090:	00005517          	auipc	a0,0x5
ffffffffc0209094:	33050513          	addi	a0,a0,816 # ffffffffc020e3c0 <etext+0x2cac>
ffffffffc0209098:	f04a                	sd	s2,32(sp)
ffffffffc020909a:	ec4e                	sd	s3,24(sp)
ffffffffc020909c:	e852                	sd	s4,16(sp)
ffffffffc020909e:	bacf70ef          	jal	ffffffffc020044a <__panic>
ffffffffc02090a2:	00005697          	auipc	a3,0x5
ffffffffc02090a6:	37668693          	addi	a3,a3,886 # ffffffffc020e418 <etext+0x2d04>
ffffffffc02090aa:	00003617          	auipc	a2,0x3
ffffffffc02090ae:	aa660613          	addi	a2,a2,-1370 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02090b2:	02b00593          	li	a1,43
ffffffffc02090b6:	00005517          	auipc	a0,0x5
ffffffffc02090ba:	30a50513          	addi	a0,a0,778 # ffffffffc020e3c0 <etext+0x2cac>
ffffffffc02090be:	b8cf70ef          	jal	ffffffffc020044a <__panic>
ffffffffc02090c2:	00005697          	auipc	a3,0x5
ffffffffc02090c6:	33e68693          	addi	a3,a3,830 # ffffffffc020e400 <etext+0x2cec>
ffffffffc02090ca:	00003617          	auipc	a2,0x3
ffffffffc02090ce:	a8660613          	addi	a2,a2,-1402 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02090d2:	02a00593          	li	a1,42
ffffffffc02090d6:	00005517          	auipc	a0,0x5
ffffffffc02090da:	2ea50513          	addi	a0,a0,746 # ffffffffc020e3c0 <etext+0x2cac>
ffffffffc02090de:	b6cf70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02090e2 <bitmap_alloc>:
ffffffffc02090e2:	4150                	lw	a2,4(a0)
ffffffffc02090e4:	c229                	beqz	a2,ffffffffc0209126 <bitmap_alloc+0x44>
ffffffffc02090e6:	6518                	ld	a4,8(a0)
ffffffffc02090e8:	4781                	li	a5,0
ffffffffc02090ea:	a029                	j	ffffffffc02090f4 <bitmap_alloc+0x12>
ffffffffc02090ec:	2785                	addiw	a5,a5,1
ffffffffc02090ee:	0711                	addi	a4,a4,4
ffffffffc02090f0:	02f60b63          	beq	a2,a5,ffffffffc0209126 <bitmap_alloc+0x44>
ffffffffc02090f4:	4314                	lw	a3,0(a4)
ffffffffc02090f6:	dafd                	beqz	a3,ffffffffc02090ec <bitmap_alloc+0xa>
ffffffffc02090f8:	0016f613          	andi	a2,a3,1
ffffffffc02090fc:	ea29                	bnez	a2,ffffffffc020914e <bitmap_alloc+0x6c>
ffffffffc02090fe:	02000893          	li	a7,32
ffffffffc0209102:	4305                	li	t1,1
ffffffffc0209104:	2605                	addiw	a2,a2,1
ffffffffc0209106:	03160263          	beq	a2,a7,ffffffffc020912a <bitmap_alloc+0x48>
ffffffffc020910a:	00c3153b          	sllw	a0,t1,a2
ffffffffc020910e:	00a6f833          	and	a6,a3,a0
ffffffffc0209112:	fe0809e3          	beqz	a6,ffffffffc0209104 <bitmap_alloc+0x22>
ffffffffc0209116:	8ea9                	xor	a3,a3,a0
ffffffffc0209118:	0057979b          	slliw	a5,a5,0x5
ffffffffc020911c:	c314                	sw	a3,0(a4)
ffffffffc020911e:	9fb1                	addw	a5,a5,a2
ffffffffc0209120:	c19c                	sw	a5,0(a1)
ffffffffc0209122:	4501                	li	a0,0
ffffffffc0209124:	8082                	ret
ffffffffc0209126:	5571                	li	a0,-4
ffffffffc0209128:	8082                	ret
ffffffffc020912a:	1141                	addi	sp,sp,-16
ffffffffc020912c:	00005697          	auipc	a3,0x5
ffffffffc0209130:	31468693          	addi	a3,a3,788 # ffffffffc020e440 <etext+0x2d2c>
ffffffffc0209134:	00003617          	auipc	a2,0x3
ffffffffc0209138:	a1c60613          	addi	a2,a2,-1508 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020913c:	04300593          	li	a1,67
ffffffffc0209140:	00005517          	auipc	a0,0x5
ffffffffc0209144:	28050513          	addi	a0,a0,640 # ffffffffc020e3c0 <etext+0x2cac>
ffffffffc0209148:	e406                	sd	ra,8(sp)
ffffffffc020914a:	b00f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc020914e:	8532                	mv	a0,a2
ffffffffc0209150:	4601                	li	a2,0
ffffffffc0209152:	b7d1                	j	ffffffffc0209116 <bitmap_alloc+0x34>

ffffffffc0209154 <bitmap_test>:
ffffffffc0209154:	411c                	lw	a5,0(a0)
ffffffffc0209156:	00f5ff63          	bgeu	a1,a5,ffffffffc0209174 <bitmap_test+0x20>
ffffffffc020915a:	651c                	ld	a5,8(a0)
ffffffffc020915c:	0055d71b          	srliw	a4,a1,0x5
ffffffffc0209160:	070a                	slli	a4,a4,0x2
ffffffffc0209162:	97ba                	add	a5,a5,a4
ffffffffc0209164:	439c                	lw	a5,0(a5)
ffffffffc0209166:	4505                	li	a0,1
ffffffffc0209168:	00b5153b          	sllw	a0,a0,a1
ffffffffc020916c:	8d7d                	and	a0,a0,a5
ffffffffc020916e:	1502                	slli	a0,a0,0x20
ffffffffc0209170:	9101                	srli	a0,a0,0x20
ffffffffc0209172:	8082                	ret
ffffffffc0209174:	1141                	addi	sp,sp,-16
ffffffffc0209176:	e406                	sd	ra,8(sp)
ffffffffc0209178:	e15ff0ef          	jal	ffffffffc0208f8c <bitmap_translate.part.0>

ffffffffc020917c <bitmap_free>:
ffffffffc020917c:	411c                	lw	a5,0(a0)
ffffffffc020917e:	1141                	addi	sp,sp,-16
ffffffffc0209180:	e406                	sd	ra,8(sp)
ffffffffc0209182:	02f5f363          	bgeu	a1,a5,ffffffffc02091a8 <bitmap_free+0x2c>
ffffffffc0209186:	651c                	ld	a5,8(a0)
ffffffffc0209188:	0055d71b          	srliw	a4,a1,0x5
ffffffffc020918c:	070a                	slli	a4,a4,0x2
ffffffffc020918e:	97ba                	add	a5,a5,a4
ffffffffc0209190:	4394                	lw	a3,0(a5)
ffffffffc0209192:	4705                	li	a4,1
ffffffffc0209194:	00b715bb          	sllw	a1,a4,a1
ffffffffc0209198:	00b6f733          	and	a4,a3,a1
ffffffffc020919c:	eb01                	bnez	a4,ffffffffc02091ac <bitmap_free+0x30>
ffffffffc020919e:	60a2                	ld	ra,8(sp)
ffffffffc02091a0:	8ecd                	or	a3,a3,a1
ffffffffc02091a2:	c394                	sw	a3,0(a5)
ffffffffc02091a4:	0141                	addi	sp,sp,16
ffffffffc02091a6:	8082                	ret
ffffffffc02091a8:	de5ff0ef          	jal	ffffffffc0208f8c <bitmap_translate.part.0>
ffffffffc02091ac:	00005697          	auipc	a3,0x5
ffffffffc02091b0:	29c68693          	addi	a3,a3,668 # ffffffffc020e448 <etext+0x2d34>
ffffffffc02091b4:	00003617          	auipc	a2,0x3
ffffffffc02091b8:	99c60613          	addi	a2,a2,-1636 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02091bc:	05f00593          	li	a1,95
ffffffffc02091c0:	00005517          	auipc	a0,0x5
ffffffffc02091c4:	20050513          	addi	a0,a0,512 # ffffffffc020e3c0 <etext+0x2cac>
ffffffffc02091c8:	a82f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02091cc <bitmap_destroy>:
ffffffffc02091cc:	1141                	addi	sp,sp,-16
ffffffffc02091ce:	e022                	sd	s0,0(sp)
ffffffffc02091d0:	842a                	mv	s0,a0
ffffffffc02091d2:	6508                	ld	a0,8(a0)
ffffffffc02091d4:	e406                	sd	ra,8(sp)
ffffffffc02091d6:	e91f80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc02091da:	8522                	mv	a0,s0
ffffffffc02091dc:	6402                	ld	s0,0(sp)
ffffffffc02091de:	60a2                	ld	ra,8(sp)
ffffffffc02091e0:	0141                	addi	sp,sp,16
ffffffffc02091e2:	e85f806f          	j	ffffffffc0202066 <kfree>

ffffffffc02091e6 <bitmap_getdata>:
ffffffffc02091e6:	c589                	beqz	a1,ffffffffc02091f0 <bitmap_getdata+0xa>
ffffffffc02091e8:	00456783          	lwu	a5,4(a0)
ffffffffc02091ec:	078a                	slli	a5,a5,0x2
ffffffffc02091ee:	e19c                	sd	a5,0(a1)
ffffffffc02091f0:	6508                	ld	a0,8(a0)
ffffffffc02091f2:	8082                	ret

ffffffffc02091f4 <sfs_init>:
ffffffffc02091f4:	1141                	addi	sp,sp,-16
ffffffffc02091f6:	00005517          	auipc	a0,0x5
ffffffffc02091fa:	0ba50513          	addi	a0,a0,186 # ffffffffc020e2b0 <etext+0x2b9c>
ffffffffc02091fe:	e406                	sd	ra,8(sp)
ffffffffc0209200:	576000ef          	jal	ffffffffc0209776 <sfs_mount>
ffffffffc0209204:	e501                	bnez	a0,ffffffffc020920c <sfs_init+0x18>
ffffffffc0209206:	60a2                	ld	ra,8(sp)
ffffffffc0209208:	0141                	addi	sp,sp,16
ffffffffc020920a:	8082                	ret
ffffffffc020920c:	86aa                	mv	a3,a0
ffffffffc020920e:	00005617          	auipc	a2,0x5
ffffffffc0209212:	24a60613          	addi	a2,a2,586 # ffffffffc020e458 <etext+0x2d44>
ffffffffc0209216:	45c1                	li	a1,16
ffffffffc0209218:	00005517          	auipc	a0,0x5
ffffffffc020921c:	26050513          	addi	a0,a0,608 # ffffffffc020e478 <etext+0x2d64>
ffffffffc0209220:	a2af70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209224 <sfs_unmount>:
ffffffffc0209224:	1141                	addi	sp,sp,-16
ffffffffc0209226:	e406                	sd	ra,8(sp)
ffffffffc0209228:	e022                	sd	s0,0(sp)
ffffffffc020922a:	cd1d                	beqz	a0,ffffffffc0209268 <sfs_unmount+0x44>
ffffffffc020922c:	0b052783          	lw	a5,176(a0)
ffffffffc0209230:	842a                	mv	s0,a0
ffffffffc0209232:	eb9d                	bnez	a5,ffffffffc0209268 <sfs_unmount+0x44>
ffffffffc0209234:	7158                	ld	a4,160(a0)
ffffffffc0209236:	09850793          	addi	a5,a0,152
ffffffffc020923a:	02f71563          	bne	a4,a5,ffffffffc0209264 <sfs_unmount+0x40>
ffffffffc020923e:	613c                	ld	a5,64(a0)
ffffffffc0209240:	e7a1                	bnez	a5,ffffffffc0209288 <sfs_unmount+0x64>
ffffffffc0209242:	7d08                	ld	a0,56(a0)
ffffffffc0209244:	f89ff0ef          	jal	ffffffffc02091cc <bitmap_destroy>
ffffffffc0209248:	6428                	ld	a0,72(s0)
ffffffffc020924a:	e1df80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020924e:	7448                	ld	a0,168(s0)
ffffffffc0209250:	e17f80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0209254:	8522                	mv	a0,s0
ffffffffc0209256:	e11f80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020925a:	4501                	li	a0,0
ffffffffc020925c:	60a2                	ld	ra,8(sp)
ffffffffc020925e:	6402                	ld	s0,0(sp)
ffffffffc0209260:	0141                	addi	sp,sp,16
ffffffffc0209262:	8082                	ret
ffffffffc0209264:	5545                	li	a0,-15
ffffffffc0209266:	bfdd                	j	ffffffffc020925c <sfs_unmount+0x38>
ffffffffc0209268:	00005697          	auipc	a3,0x5
ffffffffc020926c:	22868693          	addi	a3,a3,552 # ffffffffc020e490 <etext+0x2d7c>
ffffffffc0209270:	00003617          	auipc	a2,0x3
ffffffffc0209274:	8e060613          	addi	a2,a2,-1824 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209278:	04100593          	li	a1,65
ffffffffc020927c:	00005517          	auipc	a0,0x5
ffffffffc0209280:	24450513          	addi	a0,a0,580 # ffffffffc020e4c0 <etext+0x2dac>
ffffffffc0209284:	9c6f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209288:	00005697          	auipc	a3,0x5
ffffffffc020928c:	25068693          	addi	a3,a3,592 # ffffffffc020e4d8 <etext+0x2dc4>
ffffffffc0209290:	00003617          	auipc	a2,0x3
ffffffffc0209294:	8c060613          	addi	a2,a2,-1856 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209298:	04500593          	li	a1,69
ffffffffc020929c:	00005517          	auipc	a0,0x5
ffffffffc02092a0:	22450513          	addi	a0,a0,548 # ffffffffc020e4c0 <etext+0x2dac>
ffffffffc02092a4:	9a6f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02092a8 <sfs_cleanup>:
ffffffffc02092a8:	1101                	addi	sp,sp,-32
ffffffffc02092aa:	ec06                	sd	ra,24(sp)
ffffffffc02092ac:	e426                	sd	s1,8(sp)
ffffffffc02092ae:	c13d                	beqz	a0,ffffffffc0209314 <sfs_cleanup+0x6c>
ffffffffc02092b0:	0b052783          	lw	a5,176(a0)
ffffffffc02092b4:	84aa                	mv	s1,a0
ffffffffc02092b6:	efb9                	bnez	a5,ffffffffc0209314 <sfs_cleanup+0x6c>
ffffffffc02092b8:	4158                	lw	a4,4(a0)
ffffffffc02092ba:	4514                	lw	a3,8(a0)
ffffffffc02092bc:	00c50593          	addi	a1,a0,12
ffffffffc02092c0:	00005517          	auipc	a0,0x5
ffffffffc02092c4:	23050513          	addi	a0,a0,560 # ffffffffc020e4f0 <etext+0x2ddc>
ffffffffc02092c8:	40d7063b          	subw	a2,a4,a3
ffffffffc02092cc:	e822                	sd	s0,16(sp)
ffffffffc02092ce:	ed9f60ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02092d2:	02000413          	li	s0,32
ffffffffc02092d6:	a019                	j	ffffffffc02092dc <sfs_cleanup+0x34>
ffffffffc02092d8:	347d                	addiw	s0,s0,-1
ffffffffc02092da:	c811                	beqz	s0,ffffffffc02092ee <sfs_cleanup+0x46>
ffffffffc02092dc:	7cdc                	ld	a5,184(s1)
ffffffffc02092de:	8526                	mv	a0,s1
ffffffffc02092e0:	9782                	jalr	a5
ffffffffc02092e2:	f97d                	bnez	a0,ffffffffc02092d8 <sfs_cleanup+0x30>
ffffffffc02092e4:	6442                	ld	s0,16(sp)
ffffffffc02092e6:	60e2                	ld	ra,24(sp)
ffffffffc02092e8:	64a2                	ld	s1,8(sp)
ffffffffc02092ea:	6105                	addi	sp,sp,32
ffffffffc02092ec:	8082                	ret
ffffffffc02092ee:	6442                	ld	s0,16(sp)
ffffffffc02092f0:	60e2                	ld	ra,24(sp)
ffffffffc02092f2:	00c48693          	addi	a3,s1,12
ffffffffc02092f6:	64a2                	ld	s1,8(sp)
ffffffffc02092f8:	872a                	mv	a4,a0
ffffffffc02092fa:	00005617          	auipc	a2,0x5
ffffffffc02092fe:	21660613          	addi	a2,a2,534 # ffffffffc020e510 <etext+0x2dfc>
ffffffffc0209302:	05f00593          	li	a1,95
ffffffffc0209306:	00005517          	auipc	a0,0x5
ffffffffc020930a:	1ba50513          	addi	a0,a0,442 # ffffffffc020e4c0 <etext+0x2dac>
ffffffffc020930e:	6105                	addi	sp,sp,32
ffffffffc0209310:	9a4f706f          	j	ffffffffc02004b4 <__warn>
ffffffffc0209314:	00005697          	auipc	a3,0x5
ffffffffc0209318:	17c68693          	addi	a3,a3,380 # ffffffffc020e490 <etext+0x2d7c>
ffffffffc020931c:	00003617          	auipc	a2,0x3
ffffffffc0209320:	83460613          	addi	a2,a2,-1996 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209324:	05400593          	li	a1,84
ffffffffc0209328:	00005517          	auipc	a0,0x5
ffffffffc020932c:	19850513          	addi	a0,a0,408 # ffffffffc020e4c0 <etext+0x2dac>
ffffffffc0209330:	e822                	sd	s0,16(sp)
ffffffffc0209332:	e04a                	sd	s2,0(sp)
ffffffffc0209334:	916f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209338 <sfs_sync>:
ffffffffc0209338:	7179                	addi	sp,sp,-48
ffffffffc020933a:	f406                	sd	ra,40(sp)
ffffffffc020933c:	e44e                	sd	s3,8(sp)
ffffffffc020933e:	c94d                	beqz	a0,ffffffffc02093f0 <sfs_sync+0xb8>
ffffffffc0209340:	0b052783          	lw	a5,176(a0)
ffffffffc0209344:	89aa                	mv	s3,a0
ffffffffc0209346:	e7cd                	bnez	a5,ffffffffc02093f0 <sfs_sync+0xb8>
ffffffffc0209348:	f022                	sd	s0,32(sp)
ffffffffc020934a:	e84a                	sd	s2,16(sp)
ffffffffc020934c:	605010ef          	jal	ffffffffc020b150 <lock_sfs_fs>
ffffffffc0209350:	0a09b403          	ld	s0,160(s3)
ffffffffc0209354:	09898913          	addi	s2,s3,152
ffffffffc0209358:	02890663          	beq	s2,s0,ffffffffc0209384 <sfs_sync+0x4c>
ffffffffc020935c:	7c1c                	ld	a5,56(s0)
ffffffffc020935e:	cbad                	beqz	a5,ffffffffc02093d0 <sfs_sync+0x98>
ffffffffc0209360:	7b9c                	ld	a5,48(a5)
ffffffffc0209362:	c7bd                	beqz	a5,ffffffffc02093d0 <sfs_sync+0x98>
ffffffffc0209364:	fc840513          	addi	a0,s0,-56
ffffffffc0209368:	00004597          	auipc	a1,0x4
ffffffffc020936c:	0c858593          	addi	a1,a1,200 # ffffffffc020d430 <etext+0x1d1c>
ffffffffc0209370:	decfe0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0209374:	7c1c                	ld	a5,56(s0)
ffffffffc0209376:	fc840513          	addi	a0,s0,-56
ffffffffc020937a:	7b9c                	ld	a5,48(a5)
ffffffffc020937c:	9782                	jalr	a5
ffffffffc020937e:	6400                	ld	s0,8(s0)
ffffffffc0209380:	fc891ee3          	bne	s2,s0,ffffffffc020935c <sfs_sync+0x24>
ffffffffc0209384:	854e                	mv	a0,s3
ffffffffc0209386:	5db010ef          	jal	ffffffffc020b160 <unlock_sfs_fs>
ffffffffc020938a:	0409b783          	ld	a5,64(s3)
ffffffffc020938e:	4501                	li	a0,0
ffffffffc0209390:	e799                	bnez	a5,ffffffffc020939e <sfs_sync+0x66>
ffffffffc0209392:	7402                	ld	s0,32(sp)
ffffffffc0209394:	70a2                	ld	ra,40(sp)
ffffffffc0209396:	6942                	ld	s2,16(sp)
ffffffffc0209398:	69a2                	ld	s3,8(sp)
ffffffffc020939a:	6145                	addi	sp,sp,48
ffffffffc020939c:	8082                	ret
ffffffffc020939e:	0409b023          	sd	zero,64(s3)
ffffffffc02093a2:	854e                	mv	a0,s3
ffffffffc02093a4:	48d010ef          	jal	ffffffffc020b030 <sfs_sync_super>
ffffffffc02093a8:	c911                	beqz	a0,ffffffffc02093bc <sfs_sync+0x84>
ffffffffc02093aa:	7402                	ld	s0,32(sp)
ffffffffc02093ac:	70a2                	ld	ra,40(sp)
ffffffffc02093ae:	4785                	li	a5,1
ffffffffc02093b0:	04f9b023          	sd	a5,64(s3)
ffffffffc02093b4:	6942                	ld	s2,16(sp)
ffffffffc02093b6:	69a2                	ld	s3,8(sp)
ffffffffc02093b8:	6145                	addi	sp,sp,48
ffffffffc02093ba:	8082                	ret
ffffffffc02093bc:	854e                	mv	a0,s3
ffffffffc02093be:	4b9010ef          	jal	ffffffffc020b076 <sfs_sync_freemap>
ffffffffc02093c2:	f565                	bnez	a0,ffffffffc02093aa <sfs_sync+0x72>
ffffffffc02093c4:	7402                	ld	s0,32(sp)
ffffffffc02093c6:	70a2                	ld	ra,40(sp)
ffffffffc02093c8:	6942                	ld	s2,16(sp)
ffffffffc02093ca:	69a2                	ld	s3,8(sp)
ffffffffc02093cc:	6145                	addi	sp,sp,48
ffffffffc02093ce:	8082                	ret
ffffffffc02093d0:	00004697          	auipc	a3,0x4
ffffffffc02093d4:	01068693          	addi	a3,a3,16 # ffffffffc020d3e0 <etext+0x1ccc>
ffffffffc02093d8:	00002617          	auipc	a2,0x2
ffffffffc02093dc:	77860613          	addi	a2,a2,1912 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02093e0:	45ed                	li	a1,27
ffffffffc02093e2:	00005517          	auipc	a0,0x5
ffffffffc02093e6:	0de50513          	addi	a0,a0,222 # ffffffffc020e4c0 <etext+0x2dac>
ffffffffc02093ea:	ec26                	sd	s1,24(sp)
ffffffffc02093ec:	85ef70ef          	jal	ffffffffc020044a <__panic>
ffffffffc02093f0:	00005697          	auipc	a3,0x5
ffffffffc02093f4:	0a068693          	addi	a3,a3,160 # ffffffffc020e490 <etext+0x2d7c>
ffffffffc02093f8:	00002617          	auipc	a2,0x2
ffffffffc02093fc:	75860613          	addi	a2,a2,1880 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209400:	45d5                	li	a1,21
ffffffffc0209402:	00005517          	auipc	a0,0x5
ffffffffc0209406:	0be50513          	addi	a0,a0,190 # ffffffffc020e4c0 <etext+0x2dac>
ffffffffc020940a:	f022                	sd	s0,32(sp)
ffffffffc020940c:	ec26                	sd	s1,24(sp)
ffffffffc020940e:	e84a                	sd	s2,16(sp)
ffffffffc0209410:	83af70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209414 <sfs_get_root>:
ffffffffc0209414:	1101                	addi	sp,sp,-32
ffffffffc0209416:	ec06                	sd	ra,24(sp)
ffffffffc0209418:	cd09                	beqz	a0,ffffffffc0209432 <sfs_get_root+0x1e>
ffffffffc020941a:	0b052783          	lw	a5,176(a0)
ffffffffc020941e:	eb91                	bnez	a5,ffffffffc0209432 <sfs_get_root+0x1e>
ffffffffc0209420:	4605                	li	a2,1
ffffffffc0209422:	002c                	addi	a1,sp,8
ffffffffc0209424:	36a010ef          	jal	ffffffffc020a78e <sfs_load_inode>
ffffffffc0209428:	e50d                	bnez	a0,ffffffffc0209452 <sfs_get_root+0x3e>
ffffffffc020942a:	60e2                	ld	ra,24(sp)
ffffffffc020942c:	6522                	ld	a0,8(sp)
ffffffffc020942e:	6105                	addi	sp,sp,32
ffffffffc0209430:	8082                	ret
ffffffffc0209432:	00005697          	auipc	a3,0x5
ffffffffc0209436:	05e68693          	addi	a3,a3,94 # ffffffffc020e490 <etext+0x2d7c>
ffffffffc020943a:	00002617          	auipc	a2,0x2
ffffffffc020943e:	71660613          	addi	a2,a2,1814 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209442:	03600593          	li	a1,54
ffffffffc0209446:	00005517          	auipc	a0,0x5
ffffffffc020944a:	07a50513          	addi	a0,a0,122 # ffffffffc020e4c0 <etext+0x2dac>
ffffffffc020944e:	ffdf60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209452:	86aa                	mv	a3,a0
ffffffffc0209454:	00005617          	auipc	a2,0x5
ffffffffc0209458:	0dc60613          	addi	a2,a2,220 # ffffffffc020e530 <etext+0x2e1c>
ffffffffc020945c:	03700593          	li	a1,55
ffffffffc0209460:	00005517          	auipc	a0,0x5
ffffffffc0209464:	06050513          	addi	a0,a0,96 # ffffffffc020e4c0 <etext+0x2dac>
ffffffffc0209468:	fe3f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc020946c <sfs_do_mount>:
ffffffffc020946c:	7171                	addi	sp,sp,-176
ffffffffc020946e:	e54e                	sd	s3,136(sp)
ffffffffc0209470:	00853983          	ld	s3,8(a0)
ffffffffc0209474:	f506                	sd	ra,168(sp)
ffffffffc0209476:	6785                	lui	a5,0x1
ffffffffc0209478:	26f99a63          	bne	s3,a5,ffffffffc02096ec <sfs_do_mount+0x280>
ffffffffc020947c:	ed26                	sd	s1,152(sp)
ffffffffc020947e:	84aa                	mv	s1,a0
ffffffffc0209480:	4501                	li	a0,0
ffffffffc0209482:	f122                	sd	s0,160(sp)
ffffffffc0209484:	f4de                	sd	s7,104(sp)
ffffffffc0209486:	8bae                	mv	s7,a1
ffffffffc0209488:	ec0fe0ef          	jal	ffffffffc0207b48 <__alloc_fs>
ffffffffc020948c:	842a                	mv	s0,a0
ffffffffc020948e:	26050663          	beqz	a0,ffffffffc02096fa <sfs_do_mount+0x28e>
ffffffffc0209492:	e152                	sd	s4,128(sp)
ffffffffc0209494:	0b052a03          	lw	s4,176(a0)
ffffffffc0209498:	e94a                	sd	s2,144(sp)
ffffffffc020949a:	280a1763          	bnez	s4,ffffffffc0209728 <sfs_do_mount+0x2bc>
ffffffffc020949e:	f904                	sd	s1,48(a0)
ffffffffc02094a0:	854e                	mv	a0,s3
ffffffffc02094a2:	b1ff80ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc02094a6:	e428                	sd	a0,72(s0)
ffffffffc02094a8:	892a                	mv	s2,a0
ffffffffc02094aa:	16050863          	beqz	a0,ffffffffc020961a <sfs_do_mount+0x1ae>
ffffffffc02094ae:	864e                	mv	a2,s3
ffffffffc02094b0:	4681                	li	a3,0
ffffffffc02094b2:	85ca                	mv	a1,s2
ffffffffc02094b4:	1008                	addi	a0,sp,32
ffffffffc02094b6:	822fc0ef          	jal	ffffffffc02054d8 <iobuf_init>
ffffffffc02094ba:	709c                	ld	a5,32(s1)
ffffffffc02094bc:	85aa                	mv	a1,a0
ffffffffc02094be:	4601                	li	a2,0
ffffffffc02094c0:	8526                	mv	a0,s1
ffffffffc02094c2:	9782                	jalr	a5
ffffffffc02094c4:	89aa                	mv	s3,a0
ffffffffc02094c6:	12051a63          	bnez	a0,ffffffffc02095fa <sfs_do_mount+0x18e>
ffffffffc02094ca:	00092583          	lw	a1,0(s2)
ffffffffc02094ce:	2f8dc637          	lui	a2,0x2f8dc
ffffffffc02094d2:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f866b2a>
ffffffffc02094d6:	14c59d63          	bne	a1,a2,ffffffffc0209630 <sfs_do_mount+0x1c4>
ffffffffc02094da:	00492783          	lw	a5,4(s2)
ffffffffc02094de:	6090                	ld	a2,0(s1)
ffffffffc02094e0:	02079713          	slli	a4,a5,0x20
ffffffffc02094e4:	9301                	srli	a4,a4,0x20
ffffffffc02094e6:	12e66c63          	bltu	a2,a4,ffffffffc020961e <sfs_do_mount+0x1b2>
ffffffffc02094ea:	e4ee                	sd	s11,72(sp)
ffffffffc02094ec:	01892503          	lw	a0,24(s2)
ffffffffc02094f0:	00892e03          	lw	t3,8(s2)
ffffffffc02094f4:	00c92303          	lw	t1,12(s2)
ffffffffc02094f8:	01092883          	lw	a7,16(s2)
ffffffffc02094fc:	01492803          	lw	a6,20(s2)
ffffffffc0209500:	01c92603          	lw	a2,28(s2)
ffffffffc0209504:	02092683          	lw	a3,32(s2)
ffffffffc0209508:	02492703          	lw	a4,36(s2)
ffffffffc020950c:	020905a3          	sb	zero,43(s2)
ffffffffc0209510:	cc08                	sw	a0,24(s0)
ffffffffc0209512:	01c42423          	sw	t3,8(s0)
ffffffffc0209516:	00642623          	sw	t1,12(s0)
ffffffffc020951a:	01142823          	sw	a7,16(s0)
ffffffffc020951e:	01042a23          	sw	a6,20(s0)
ffffffffc0209522:	cc50                	sw	a2,28(s0)
ffffffffc0209524:	d014                	sw	a3,32(s0)
ffffffffc0209526:	d058                	sw	a4,36(s0)
ffffffffc0209528:	c00c                	sw	a1,0(s0)
ffffffffc020952a:	c05c                	sw	a5,4(s0)
ffffffffc020952c:	02892783          	lw	a5,40(s2)
ffffffffc0209530:	6511                	lui	a0,0x4
ffffffffc0209532:	d41c                	sw	a5,40(s0)
ffffffffc0209534:	a8df80ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0209538:	f448                	sd	a0,168(s0)
ffffffffc020953a:	87aa                	mv	a5,a0
ffffffffc020953c:	8daa                	mv	s11,a0
ffffffffc020953e:	1a050963          	beqz	a0,ffffffffc02096f0 <sfs_do_mount+0x284>
ffffffffc0209542:	6711                	lui	a4,0x4
ffffffffc0209544:	fcd6                	sd	s5,120(sp)
ffffffffc0209546:	ece6                	sd	s9,88(sp)
ffffffffc0209548:	e8ea                	sd	s10,80(sp)
ffffffffc020954a:	972a                	add	a4,a4,a0
ffffffffc020954c:	e79c                	sd	a5,8(a5)
ffffffffc020954e:	e39c                	sd	a5,0(a5)
ffffffffc0209550:	07c1                	addi	a5,a5,16 # 1010 <_binary_bin_swap_img_size-0x6cf0>
ffffffffc0209552:	fee79de3          	bne	a5,a4,ffffffffc020954c <sfs_do_mount+0xe0>
ffffffffc0209556:	00496783          	lwu	a5,4(s2)
ffffffffc020955a:	6721                	lui	a4,0x8
ffffffffc020955c:	fff70a93          	addi	s5,a4,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
ffffffffc0209560:	97d6                	add	a5,a5,s5
ffffffffc0209562:	7761                	lui	a4,0xffff8
ffffffffc0209564:	8ff9                	and	a5,a5,a4
ffffffffc0209566:	0007851b          	sext.w	a0,a5
ffffffffc020956a:	00078c9b          	sext.w	s9,a5
ffffffffc020956e:	a43ff0ef          	jal	ffffffffc0208fb0 <bitmap_create>
ffffffffc0209572:	fc08                	sd	a0,56(s0)
ffffffffc0209574:	8d2a                	mv	s10,a0
ffffffffc0209576:	16050963          	beqz	a0,ffffffffc02096e8 <sfs_do_mount+0x27c>
ffffffffc020957a:	00492783          	lw	a5,4(s2)
ffffffffc020957e:	082c                	addi	a1,sp,24
ffffffffc0209580:	e43e                	sd	a5,8(sp)
ffffffffc0209582:	c65ff0ef          	jal	ffffffffc02091e6 <bitmap_getdata>
ffffffffc0209586:	16050f63          	beqz	a0,ffffffffc0209704 <sfs_do_mount+0x298>
ffffffffc020958a:	00816783          	lwu	a5,8(sp)
ffffffffc020958e:	66e2                	ld	a3,24(sp)
ffffffffc0209590:	97d6                	add	a5,a5,s5
ffffffffc0209592:	83bd                	srli	a5,a5,0xf
ffffffffc0209594:	00c7971b          	slliw	a4,a5,0xc
ffffffffc0209598:	1702                	slli	a4,a4,0x20
ffffffffc020959a:	9301                	srli	a4,a4,0x20
ffffffffc020959c:	16d71463          	bne	a4,a3,ffffffffc0209704 <sfs_do_mount+0x298>
ffffffffc02095a0:	f0e2                	sd	s8,96(sp)
ffffffffc02095a2:	00c79713          	slli	a4,a5,0xc
ffffffffc02095a6:	00e50c33          	add	s8,a0,a4
ffffffffc02095aa:	8aaa                	mv	s5,a0
ffffffffc02095ac:	cbd9                	beqz	a5,ffffffffc0209642 <sfs_do_mount+0x1d6>
ffffffffc02095ae:	6789                	lui	a5,0x2
ffffffffc02095b0:	f8da                	sd	s6,112(sp)
ffffffffc02095b2:	40a78b3b          	subw	s6,a5,a0
ffffffffc02095b6:	a029                	j	ffffffffc02095c0 <sfs_do_mount+0x154>
ffffffffc02095b8:	6785                	lui	a5,0x1
ffffffffc02095ba:	9abe                	add	s5,s5,a5
ffffffffc02095bc:	098a8263          	beq	s5,s8,ffffffffc0209640 <sfs_do_mount+0x1d4>
ffffffffc02095c0:	015b06bb          	addw	a3,s6,s5
ffffffffc02095c4:	1682                	slli	a3,a3,0x20
ffffffffc02095c6:	6605                	lui	a2,0x1
ffffffffc02095c8:	85d6                	mv	a1,s5
ffffffffc02095ca:	9281                	srli	a3,a3,0x20
ffffffffc02095cc:	1008                	addi	a0,sp,32
ffffffffc02095ce:	f0bfb0ef          	jal	ffffffffc02054d8 <iobuf_init>
ffffffffc02095d2:	709c                	ld	a5,32(s1)
ffffffffc02095d4:	85aa                	mv	a1,a0
ffffffffc02095d6:	4601                	li	a2,0
ffffffffc02095d8:	8526                	mv	a0,s1
ffffffffc02095da:	9782                	jalr	a5
ffffffffc02095dc:	dd71                	beqz	a0,ffffffffc02095b8 <sfs_do_mount+0x14c>
ffffffffc02095de:	e42a                	sd	a0,8(sp)
ffffffffc02095e0:	856a                	mv	a0,s10
ffffffffc02095e2:	bebff0ef          	jal	ffffffffc02091cc <bitmap_destroy>
ffffffffc02095e6:	69a2                	ld	s3,8(sp)
ffffffffc02095e8:	7b46                	ld	s6,112(sp)
ffffffffc02095ea:	7c06                	ld	s8,96(sp)
ffffffffc02095ec:	856e                	mv	a0,s11
ffffffffc02095ee:	a79f80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc02095f2:	7ae6                	ld	s5,120(sp)
ffffffffc02095f4:	6ce6                	ld	s9,88(sp)
ffffffffc02095f6:	6d46                	ld	s10,80(sp)
ffffffffc02095f8:	6da6                	ld	s11,72(sp)
ffffffffc02095fa:	854a                	mv	a0,s2
ffffffffc02095fc:	a6bf80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0209600:	8522                	mv	a0,s0
ffffffffc0209602:	a65f80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0209606:	740a                	ld	s0,160(sp)
ffffffffc0209608:	64ea                	ld	s1,152(sp)
ffffffffc020960a:	694a                	ld	s2,144(sp)
ffffffffc020960c:	6a0a                	ld	s4,128(sp)
ffffffffc020960e:	7ba6                	ld	s7,104(sp)
ffffffffc0209610:	70aa                	ld	ra,168(sp)
ffffffffc0209612:	854e                	mv	a0,s3
ffffffffc0209614:	69aa                	ld	s3,136(sp)
ffffffffc0209616:	614d                	addi	sp,sp,176
ffffffffc0209618:	8082                	ret
ffffffffc020961a:	59f1                	li	s3,-4
ffffffffc020961c:	b7d5                	j	ffffffffc0209600 <sfs_do_mount+0x194>
ffffffffc020961e:	85be                	mv	a1,a5
ffffffffc0209620:	00005517          	auipc	a0,0x5
ffffffffc0209624:	f6850513          	addi	a0,a0,-152 # ffffffffc020e588 <etext+0x2e74>
ffffffffc0209628:	b7ff60ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020962c:	59f5                	li	s3,-3
ffffffffc020962e:	b7f1                	j	ffffffffc02095fa <sfs_do_mount+0x18e>
ffffffffc0209630:	00005517          	auipc	a0,0x5
ffffffffc0209634:	f2050513          	addi	a0,a0,-224 # ffffffffc020e550 <etext+0x2e3c>
ffffffffc0209638:	b6ff60ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020963c:	59f5                	li	s3,-3
ffffffffc020963e:	bf75                	j	ffffffffc02095fa <sfs_do_mount+0x18e>
ffffffffc0209640:	7b46                	ld	s6,112(sp)
ffffffffc0209642:	00442903          	lw	s2,4(s0)
ffffffffc0209646:	0a0c8863          	beqz	s9,ffffffffc02096f6 <sfs_do_mount+0x28a>
ffffffffc020964a:	4481                	li	s1,0
ffffffffc020964c:	85a6                	mv	a1,s1
ffffffffc020964e:	856a                	mv	a0,s10
ffffffffc0209650:	b05ff0ef          	jal	ffffffffc0209154 <bitmap_test>
ffffffffc0209654:	c111                	beqz	a0,ffffffffc0209658 <sfs_do_mount+0x1ec>
ffffffffc0209656:	2a05                	addiw	s4,s4,1
ffffffffc0209658:	2485                	addiw	s1,s1,1
ffffffffc020965a:	fe9c99e3          	bne	s9,s1,ffffffffc020964c <sfs_do_mount+0x1e0>
ffffffffc020965e:	441c                	lw	a5,8(s0)
ffffffffc0209660:	0f479a63          	bne	a5,s4,ffffffffc0209754 <sfs_do_mount+0x2e8>
ffffffffc0209664:	05040513          	addi	a0,s0,80
ffffffffc0209668:	04043023          	sd	zero,64(s0)
ffffffffc020966c:	4585                	li	a1,1
ffffffffc020966e:	fcbfa0ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc0209672:	06840513          	addi	a0,s0,104
ffffffffc0209676:	4585                	li	a1,1
ffffffffc0209678:	fc1fa0ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc020967c:	08040513          	addi	a0,s0,128
ffffffffc0209680:	4585                	li	a1,1
ffffffffc0209682:	fb7fa0ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc0209686:	09840793          	addi	a5,s0,152
ffffffffc020968a:	4149063b          	subw	a2,s2,s4
ffffffffc020968e:	f05c                	sd	a5,160(s0)
ffffffffc0209690:	ec5c                	sd	a5,152(s0)
ffffffffc0209692:	874a                	mv	a4,s2
ffffffffc0209694:	86d2                	mv	a3,s4
ffffffffc0209696:	00c40593          	addi	a1,s0,12
ffffffffc020969a:	00005517          	auipc	a0,0x5
ffffffffc020969e:	f7e50513          	addi	a0,a0,-130 # ffffffffc020e618 <etext+0x2f04>
ffffffffc02096a2:	b05f60ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02096a6:	00000617          	auipc	a2,0x0
ffffffffc02096aa:	c9260613          	addi	a2,a2,-878 # ffffffffc0209338 <sfs_sync>
ffffffffc02096ae:	00000697          	auipc	a3,0x0
ffffffffc02096b2:	d6668693          	addi	a3,a3,-666 # ffffffffc0209414 <sfs_get_root>
ffffffffc02096b6:	00000717          	auipc	a4,0x0
ffffffffc02096ba:	b6e70713          	addi	a4,a4,-1170 # ffffffffc0209224 <sfs_unmount>
ffffffffc02096be:	00000797          	auipc	a5,0x0
ffffffffc02096c2:	bea78793          	addi	a5,a5,-1046 # ffffffffc02092a8 <sfs_cleanup>
ffffffffc02096c6:	fc50                	sd	a2,184(s0)
ffffffffc02096c8:	e074                	sd	a3,192(s0)
ffffffffc02096ca:	e478                	sd	a4,200(s0)
ffffffffc02096cc:	e87c                	sd	a5,208(s0)
ffffffffc02096ce:	008bb023          	sd	s0,0(s7)
ffffffffc02096d2:	64ea                	ld	s1,152(sp)
ffffffffc02096d4:	740a                	ld	s0,160(sp)
ffffffffc02096d6:	694a                	ld	s2,144(sp)
ffffffffc02096d8:	6a0a                	ld	s4,128(sp)
ffffffffc02096da:	7ae6                	ld	s5,120(sp)
ffffffffc02096dc:	7ba6                	ld	s7,104(sp)
ffffffffc02096de:	7c06                	ld	s8,96(sp)
ffffffffc02096e0:	6ce6                	ld	s9,88(sp)
ffffffffc02096e2:	6d46                	ld	s10,80(sp)
ffffffffc02096e4:	6da6                	ld	s11,72(sp)
ffffffffc02096e6:	b72d                	j	ffffffffc0209610 <sfs_do_mount+0x1a4>
ffffffffc02096e8:	59f1                	li	s3,-4
ffffffffc02096ea:	b709                	j	ffffffffc02095ec <sfs_do_mount+0x180>
ffffffffc02096ec:	59c9                	li	s3,-14
ffffffffc02096ee:	b70d                	j	ffffffffc0209610 <sfs_do_mount+0x1a4>
ffffffffc02096f0:	6da6                	ld	s11,72(sp)
ffffffffc02096f2:	59f1                	li	s3,-4
ffffffffc02096f4:	b719                	j	ffffffffc02095fa <sfs_do_mount+0x18e>
ffffffffc02096f6:	4a01                	li	s4,0
ffffffffc02096f8:	b79d                	j	ffffffffc020965e <sfs_do_mount+0x1f2>
ffffffffc02096fa:	740a                	ld	s0,160(sp)
ffffffffc02096fc:	64ea                	ld	s1,152(sp)
ffffffffc02096fe:	7ba6                	ld	s7,104(sp)
ffffffffc0209700:	59f1                	li	s3,-4
ffffffffc0209702:	b739                	j	ffffffffc0209610 <sfs_do_mount+0x1a4>
ffffffffc0209704:	00005697          	auipc	a3,0x5
ffffffffc0209708:	eb468693          	addi	a3,a3,-332 # ffffffffc020e5b8 <etext+0x2ea4>
ffffffffc020970c:	00002617          	auipc	a2,0x2
ffffffffc0209710:	44460613          	addi	a2,a2,1092 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209714:	08300593          	li	a1,131
ffffffffc0209718:	00005517          	auipc	a0,0x5
ffffffffc020971c:	da850513          	addi	a0,a0,-600 # ffffffffc020e4c0 <etext+0x2dac>
ffffffffc0209720:	f8da                	sd	s6,112(sp)
ffffffffc0209722:	f0e2                	sd	s8,96(sp)
ffffffffc0209724:	d27f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209728:	00005697          	auipc	a3,0x5
ffffffffc020972c:	d6868693          	addi	a3,a3,-664 # ffffffffc020e490 <etext+0x2d7c>
ffffffffc0209730:	00002617          	auipc	a2,0x2
ffffffffc0209734:	42060613          	addi	a2,a2,1056 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209738:	0a300593          	li	a1,163
ffffffffc020973c:	00005517          	auipc	a0,0x5
ffffffffc0209740:	d8450513          	addi	a0,a0,-636 # ffffffffc020e4c0 <etext+0x2dac>
ffffffffc0209744:	fcd6                	sd	s5,120(sp)
ffffffffc0209746:	f8da                	sd	s6,112(sp)
ffffffffc0209748:	f0e2                	sd	s8,96(sp)
ffffffffc020974a:	ece6                	sd	s9,88(sp)
ffffffffc020974c:	e8ea                	sd	s10,80(sp)
ffffffffc020974e:	e4ee                	sd	s11,72(sp)
ffffffffc0209750:	cfbf60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209754:	00005697          	auipc	a3,0x5
ffffffffc0209758:	e9468693          	addi	a3,a3,-364 # ffffffffc020e5e8 <etext+0x2ed4>
ffffffffc020975c:	00002617          	auipc	a2,0x2
ffffffffc0209760:	3f460613          	addi	a2,a2,1012 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209764:	0e000593          	li	a1,224
ffffffffc0209768:	00005517          	auipc	a0,0x5
ffffffffc020976c:	d5850513          	addi	a0,a0,-680 # ffffffffc020e4c0 <etext+0x2dac>
ffffffffc0209770:	f8da                	sd	s6,112(sp)
ffffffffc0209772:	cd9f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209776 <sfs_mount>:
ffffffffc0209776:	00000597          	auipc	a1,0x0
ffffffffc020977a:	cf658593          	addi	a1,a1,-778 # ffffffffc020946c <sfs_do_mount>
ffffffffc020977e:	fccfe06f          	j	ffffffffc0207f4a <vfs_mount>

ffffffffc0209782 <sfs_opendir>:
ffffffffc0209782:	0235f593          	andi	a1,a1,35
ffffffffc0209786:	e199                	bnez	a1,ffffffffc020978c <sfs_opendir+0xa>
ffffffffc0209788:	4501                	li	a0,0
ffffffffc020978a:	8082                	ret
ffffffffc020978c:	553d                	li	a0,-17
ffffffffc020978e:	8082                	ret

ffffffffc0209790 <sfs_openfile>:
ffffffffc0209790:	4501                	li	a0,0
ffffffffc0209792:	8082                	ret

ffffffffc0209794 <sfs_gettype>:
ffffffffc0209794:	1141                	addi	sp,sp,-16
ffffffffc0209796:	e406                	sd	ra,8(sp)
ffffffffc0209798:	c529                	beqz	a0,ffffffffc02097e2 <sfs_gettype+0x4e>
ffffffffc020979a:	4d38                	lw	a4,88(a0)
ffffffffc020979c:	6785                	lui	a5,0x1
ffffffffc020979e:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02097a2:	04f71063          	bne	a4,a5,ffffffffc02097e2 <sfs_gettype+0x4e>
ffffffffc02097a6:	6118                	ld	a4,0(a0)
ffffffffc02097a8:	4789                	li	a5,2
ffffffffc02097aa:	00475683          	lhu	a3,4(a4)
ffffffffc02097ae:	02f68463          	beq	a3,a5,ffffffffc02097d6 <sfs_gettype+0x42>
ffffffffc02097b2:	478d                	li	a5,3
ffffffffc02097b4:	00f68b63          	beq	a3,a5,ffffffffc02097ca <sfs_gettype+0x36>
ffffffffc02097b8:	4705                	li	a4,1
ffffffffc02097ba:	6785                	lui	a5,0x1
ffffffffc02097bc:	04e69363          	bne	a3,a4,ffffffffc0209802 <sfs_gettype+0x6e>
ffffffffc02097c0:	60a2                	ld	ra,8(sp)
ffffffffc02097c2:	c19c                	sw	a5,0(a1)
ffffffffc02097c4:	4501                	li	a0,0
ffffffffc02097c6:	0141                	addi	sp,sp,16
ffffffffc02097c8:	8082                	ret
ffffffffc02097ca:	60a2                	ld	ra,8(sp)
ffffffffc02097cc:	678d                	lui	a5,0x3
ffffffffc02097ce:	c19c                	sw	a5,0(a1)
ffffffffc02097d0:	4501                	li	a0,0
ffffffffc02097d2:	0141                	addi	sp,sp,16
ffffffffc02097d4:	8082                	ret
ffffffffc02097d6:	60a2                	ld	ra,8(sp)
ffffffffc02097d8:	6789                	lui	a5,0x2
ffffffffc02097da:	c19c                	sw	a5,0(a1)
ffffffffc02097dc:	4501                	li	a0,0
ffffffffc02097de:	0141                	addi	sp,sp,16
ffffffffc02097e0:	8082                	ret
ffffffffc02097e2:	00005697          	auipc	a3,0x5
ffffffffc02097e6:	e5668693          	addi	a3,a3,-426 # ffffffffc020e638 <etext+0x2f24>
ffffffffc02097ea:	00002617          	auipc	a2,0x2
ffffffffc02097ee:	36660613          	addi	a2,a2,870 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02097f2:	38200593          	li	a1,898
ffffffffc02097f6:	00005517          	auipc	a0,0x5
ffffffffc02097fa:	e7a50513          	addi	a0,a0,-390 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc02097fe:	c4df60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209802:	00005617          	auipc	a2,0x5
ffffffffc0209806:	e8660613          	addi	a2,a2,-378 # ffffffffc020e688 <etext+0x2f74>
ffffffffc020980a:	38e00593          	li	a1,910
ffffffffc020980e:	00005517          	auipc	a0,0x5
ffffffffc0209812:	e6250513          	addi	a0,a0,-414 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209816:	c35f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc020981a <sfs_fsync>:
ffffffffc020981a:	7530                	ld	a2,104(a0)
ffffffffc020981c:	7179                	addi	sp,sp,-48
ffffffffc020981e:	f406                	sd	ra,40(sp)
ffffffffc0209820:	ca2d                	beqz	a2,ffffffffc0209892 <sfs_fsync+0x78>
ffffffffc0209822:	0b062703          	lw	a4,176(a2)
ffffffffc0209826:	e735                	bnez	a4,ffffffffc0209892 <sfs_fsync+0x78>
ffffffffc0209828:	4d34                	lw	a3,88(a0)
ffffffffc020982a:	6705                	lui	a4,0x1
ffffffffc020982c:	23570713          	addi	a4,a4,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209830:	08e69263          	bne	a3,a4,ffffffffc02098b4 <sfs_fsync+0x9a>
ffffffffc0209834:	6914                	ld	a3,16(a0)
ffffffffc0209836:	4701                	li	a4,0
ffffffffc0209838:	e689                	bnez	a3,ffffffffc0209842 <sfs_fsync+0x28>
ffffffffc020983a:	70a2                	ld	ra,40(sp)
ffffffffc020983c:	853a                	mv	a0,a4
ffffffffc020983e:	6145                	addi	sp,sp,48
ffffffffc0209840:	8082                	ret
ffffffffc0209842:	f022                	sd	s0,32(sp)
ffffffffc0209844:	e42a                	sd	a0,8(sp)
ffffffffc0209846:	02050413          	addi	s0,a0,32
ffffffffc020984a:	02050513          	addi	a0,a0,32
ffffffffc020984e:	ec3a                	sd	a4,24(sp)
ffffffffc0209850:	e832                	sd	a2,16(sp)
ffffffffc0209852:	df1fa0ef          	jal	ffffffffc0204642 <down>
ffffffffc0209856:	67a2                	ld	a5,8(sp)
ffffffffc0209858:	6762                	ld	a4,24(sp)
ffffffffc020985a:	6b94                	ld	a3,16(a5)
ffffffffc020985c:	ea99                	bnez	a3,ffffffffc0209872 <sfs_fsync+0x58>
ffffffffc020985e:	8522                	mv	a0,s0
ffffffffc0209860:	e43a                	sd	a4,8(sp)
ffffffffc0209862:	dddfa0ef          	jal	ffffffffc020463e <up>
ffffffffc0209866:	6722                	ld	a4,8(sp)
ffffffffc0209868:	7402                	ld	s0,32(sp)
ffffffffc020986a:	70a2                	ld	ra,40(sp)
ffffffffc020986c:	853a                	mv	a0,a4
ffffffffc020986e:	6145                	addi	sp,sp,48
ffffffffc0209870:	8082                	ret
ffffffffc0209872:	4794                	lw	a3,8(a5)
ffffffffc0209874:	638c                	ld	a1,0(a5)
ffffffffc0209876:	6542                	ld	a0,16(sp)
ffffffffc0209878:	4701                	li	a4,0
ffffffffc020987a:	0007b823          	sd	zero,16(a5) # 2010 <_binary_bin_swap_img_size-0x5cf0>
ffffffffc020987e:	04000613          	li	a2,64
ffffffffc0209882:	71a010ef          	jal	ffffffffc020af9c <sfs_wbuf>
ffffffffc0209886:	872a                	mv	a4,a0
ffffffffc0209888:	d979                	beqz	a0,ffffffffc020985e <sfs_fsync+0x44>
ffffffffc020988a:	67a2                	ld	a5,8(sp)
ffffffffc020988c:	4685                	li	a3,1
ffffffffc020988e:	eb94                	sd	a3,16(a5)
ffffffffc0209890:	b7f9                	j	ffffffffc020985e <sfs_fsync+0x44>
ffffffffc0209892:	00005697          	auipc	a3,0x5
ffffffffc0209896:	bfe68693          	addi	a3,a3,-1026 # ffffffffc020e490 <etext+0x2d7c>
ffffffffc020989a:	00002617          	auipc	a2,0x2
ffffffffc020989e:	2b660613          	addi	a2,a2,694 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02098a2:	2c600593          	li	a1,710
ffffffffc02098a6:	00005517          	auipc	a0,0x5
ffffffffc02098aa:	dca50513          	addi	a0,a0,-566 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc02098ae:	f022                	sd	s0,32(sp)
ffffffffc02098b0:	b9bf60ef          	jal	ffffffffc020044a <__panic>
ffffffffc02098b4:	00005697          	auipc	a3,0x5
ffffffffc02098b8:	d8468693          	addi	a3,a3,-636 # ffffffffc020e638 <etext+0x2f24>
ffffffffc02098bc:	00002617          	auipc	a2,0x2
ffffffffc02098c0:	29460613          	addi	a2,a2,660 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02098c4:	2c700593          	li	a1,711
ffffffffc02098c8:	00005517          	auipc	a0,0x5
ffffffffc02098cc:	da850513          	addi	a0,a0,-600 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc02098d0:	f022                	sd	s0,32(sp)
ffffffffc02098d2:	b79f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc02098d6 <sfs_fstat>:
ffffffffc02098d6:	1101                	addi	sp,sp,-32
ffffffffc02098d8:	e822                	sd	s0,16(sp)
ffffffffc02098da:	e426                	sd	s1,8(sp)
ffffffffc02098dc:	842a                	mv	s0,a0
ffffffffc02098de:	84ae                	mv	s1,a1
ffffffffc02098e0:	852e                	mv	a0,a1
ffffffffc02098e2:	02000613          	li	a2,32
ffffffffc02098e6:	4581                	li	a1,0
ffffffffc02098e8:	ec06                	sd	ra,24(sp)
ffffffffc02098ea:	5c3010ef          	jal	ffffffffc020b6ac <memset>
ffffffffc02098ee:	c439                	beqz	s0,ffffffffc020993c <sfs_fstat+0x66>
ffffffffc02098f0:	783c                	ld	a5,112(s0)
ffffffffc02098f2:	c7a9                	beqz	a5,ffffffffc020993c <sfs_fstat+0x66>
ffffffffc02098f4:	6bbc                	ld	a5,80(a5)
ffffffffc02098f6:	c3b9                	beqz	a5,ffffffffc020993c <sfs_fstat+0x66>
ffffffffc02098f8:	00004597          	auipc	a1,0x4
ffffffffc02098fc:	7a858593          	addi	a1,a1,1960 # ffffffffc020e0a0 <etext+0x298c>
ffffffffc0209900:	8522                	mv	a0,s0
ffffffffc0209902:	85afe0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0209906:	783c                	ld	a5,112(s0)
ffffffffc0209908:	85a6                	mv	a1,s1
ffffffffc020990a:	8522                	mv	a0,s0
ffffffffc020990c:	6bbc                	ld	a5,80(a5)
ffffffffc020990e:	9782                	jalr	a5
ffffffffc0209910:	e10d                	bnez	a0,ffffffffc0209932 <sfs_fstat+0x5c>
ffffffffc0209912:	4c38                	lw	a4,88(s0)
ffffffffc0209914:	6785                	lui	a5,0x1
ffffffffc0209916:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020991a:	04f71163          	bne	a4,a5,ffffffffc020995c <sfs_fstat+0x86>
ffffffffc020991e:	601c                	ld	a5,0(s0)
ffffffffc0209920:	0067d683          	lhu	a3,6(a5)
ffffffffc0209924:	0087e703          	lwu	a4,8(a5)
ffffffffc0209928:	0007e783          	lwu	a5,0(a5)
ffffffffc020992c:	e494                	sd	a3,8(s1)
ffffffffc020992e:	e898                	sd	a4,16(s1)
ffffffffc0209930:	ec9c                	sd	a5,24(s1)
ffffffffc0209932:	60e2                	ld	ra,24(sp)
ffffffffc0209934:	6442                	ld	s0,16(sp)
ffffffffc0209936:	64a2                	ld	s1,8(sp)
ffffffffc0209938:	6105                	addi	sp,sp,32
ffffffffc020993a:	8082                	ret
ffffffffc020993c:	00004697          	auipc	a3,0x4
ffffffffc0209940:	6fc68693          	addi	a3,a3,1788 # ffffffffc020e038 <etext+0x2924>
ffffffffc0209944:	00002617          	auipc	a2,0x2
ffffffffc0209948:	20c60613          	addi	a2,a2,524 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020994c:	2b700593          	li	a1,695
ffffffffc0209950:	00005517          	auipc	a0,0x5
ffffffffc0209954:	d2050513          	addi	a0,a0,-736 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209958:	af3f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc020995c:	00005697          	auipc	a3,0x5
ffffffffc0209960:	cdc68693          	addi	a3,a3,-804 # ffffffffc020e638 <etext+0x2f24>
ffffffffc0209964:	00002617          	auipc	a2,0x2
ffffffffc0209968:	1ec60613          	addi	a2,a2,492 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020996c:	2ba00593          	li	a1,698
ffffffffc0209970:	00005517          	auipc	a0,0x5
ffffffffc0209974:	d0050513          	addi	a0,a0,-768 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209978:	ad3f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc020997c <sfs_tryseek>:
ffffffffc020997c:	08000737          	lui	a4,0x8000
ffffffffc0209980:	04e5f863          	bgeu	a1,a4,ffffffffc02099d0 <sfs_tryseek+0x54>
ffffffffc0209984:	1101                	addi	sp,sp,-32
ffffffffc0209986:	ec06                	sd	ra,24(sp)
ffffffffc0209988:	c531                	beqz	a0,ffffffffc02099d4 <sfs_tryseek+0x58>
ffffffffc020998a:	4d30                	lw	a2,88(a0)
ffffffffc020998c:	6685                	lui	a3,0x1
ffffffffc020998e:	23568693          	addi	a3,a3,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209992:	04d61163          	bne	a2,a3,ffffffffc02099d4 <sfs_tryseek+0x58>
ffffffffc0209996:	6114                	ld	a3,0(a0)
ffffffffc0209998:	0006e683          	lwu	a3,0(a3)
ffffffffc020999c:	02b6d663          	bge	a3,a1,ffffffffc02099c8 <sfs_tryseek+0x4c>
ffffffffc02099a0:	7934                	ld	a3,112(a0)
ffffffffc02099a2:	caa9                	beqz	a3,ffffffffc02099f4 <sfs_tryseek+0x78>
ffffffffc02099a4:	72b4                	ld	a3,96(a3)
ffffffffc02099a6:	c6b9                	beqz	a3,ffffffffc02099f4 <sfs_tryseek+0x78>
ffffffffc02099a8:	e02e                	sd	a1,0(sp)
ffffffffc02099aa:	00004597          	auipc	a1,0x4
ffffffffc02099ae:	5e658593          	addi	a1,a1,1510 # ffffffffc020df90 <etext+0x287c>
ffffffffc02099b2:	e42a                	sd	a0,8(sp)
ffffffffc02099b4:	fa9fd0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc02099b8:	67a2                	ld	a5,8(sp)
ffffffffc02099ba:	6582                	ld	a1,0(sp)
ffffffffc02099bc:	60e2                	ld	ra,24(sp)
ffffffffc02099be:	7bb4                	ld	a3,112(a5)
ffffffffc02099c0:	853e                	mv	a0,a5
ffffffffc02099c2:	72bc                	ld	a5,96(a3)
ffffffffc02099c4:	6105                	addi	sp,sp,32
ffffffffc02099c6:	8782                	jr	a5
ffffffffc02099c8:	60e2                	ld	ra,24(sp)
ffffffffc02099ca:	4501                	li	a0,0
ffffffffc02099cc:	6105                	addi	sp,sp,32
ffffffffc02099ce:	8082                	ret
ffffffffc02099d0:	5575                	li	a0,-3
ffffffffc02099d2:	8082                	ret
ffffffffc02099d4:	00005697          	auipc	a3,0x5
ffffffffc02099d8:	c6468693          	addi	a3,a3,-924 # ffffffffc020e638 <etext+0x2f24>
ffffffffc02099dc:	00002617          	auipc	a2,0x2
ffffffffc02099e0:	17460613          	addi	a2,a2,372 # ffffffffc020bb50 <etext+0x43c>
ffffffffc02099e4:	39900593          	li	a1,921
ffffffffc02099e8:	00005517          	auipc	a0,0x5
ffffffffc02099ec:	c8850513          	addi	a0,a0,-888 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc02099f0:	a5bf60ef          	jal	ffffffffc020044a <__panic>
ffffffffc02099f4:	00004697          	auipc	a3,0x4
ffffffffc02099f8:	54468693          	addi	a3,a3,1348 # ffffffffc020df38 <etext+0x2824>
ffffffffc02099fc:	00002617          	auipc	a2,0x2
ffffffffc0209a00:	15460613          	addi	a2,a2,340 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209a04:	39b00593          	li	a1,923
ffffffffc0209a08:	00005517          	auipc	a0,0x5
ffffffffc0209a0c:	c6850513          	addi	a0,a0,-920 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209a10:	a3bf60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209a14 <sfs_close>:
ffffffffc0209a14:	1141                	addi	sp,sp,-16
ffffffffc0209a16:	e406                	sd	ra,8(sp)
ffffffffc0209a18:	e022                	sd	s0,0(sp)
ffffffffc0209a1a:	c11d                	beqz	a0,ffffffffc0209a40 <sfs_close+0x2c>
ffffffffc0209a1c:	793c                	ld	a5,112(a0)
ffffffffc0209a1e:	842a                	mv	s0,a0
ffffffffc0209a20:	c385                	beqz	a5,ffffffffc0209a40 <sfs_close+0x2c>
ffffffffc0209a22:	7b9c                	ld	a5,48(a5)
ffffffffc0209a24:	cf91                	beqz	a5,ffffffffc0209a40 <sfs_close+0x2c>
ffffffffc0209a26:	00004597          	auipc	a1,0x4
ffffffffc0209a2a:	a0a58593          	addi	a1,a1,-1526 # ffffffffc020d430 <etext+0x1d1c>
ffffffffc0209a2e:	f2ffd0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0209a32:	783c                	ld	a5,112(s0)
ffffffffc0209a34:	8522                	mv	a0,s0
ffffffffc0209a36:	6402                	ld	s0,0(sp)
ffffffffc0209a38:	60a2                	ld	ra,8(sp)
ffffffffc0209a3a:	7b9c                	ld	a5,48(a5)
ffffffffc0209a3c:	0141                	addi	sp,sp,16
ffffffffc0209a3e:	8782                	jr	a5
ffffffffc0209a40:	00004697          	auipc	a3,0x4
ffffffffc0209a44:	9a068693          	addi	a3,a3,-1632 # ffffffffc020d3e0 <etext+0x1ccc>
ffffffffc0209a48:	00002617          	auipc	a2,0x2
ffffffffc0209a4c:	10860613          	addi	a2,a2,264 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209a50:	21d00593          	li	a1,541
ffffffffc0209a54:	00005517          	auipc	a0,0x5
ffffffffc0209a58:	c1c50513          	addi	a0,a0,-996 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209a5c:	9eff60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209a60 <sfs_io.part.0>:
ffffffffc0209a60:	1141                	addi	sp,sp,-16
ffffffffc0209a62:	00005697          	auipc	a3,0x5
ffffffffc0209a66:	bd668693          	addi	a3,a3,-1066 # ffffffffc020e638 <etext+0x2f24>
ffffffffc0209a6a:	00002617          	auipc	a2,0x2
ffffffffc0209a6e:	0e660613          	addi	a2,a2,230 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209a72:	29600593          	li	a1,662
ffffffffc0209a76:	00005517          	auipc	a0,0x5
ffffffffc0209a7a:	bfa50513          	addi	a0,a0,-1030 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209a7e:	e406                	sd	ra,8(sp)
ffffffffc0209a80:	9cbf60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209a84 <sfs_block_free>:
ffffffffc0209a84:	1101                	addi	sp,sp,-32
ffffffffc0209a86:	e822                	sd	s0,16(sp)
ffffffffc0209a88:	e426                	sd	s1,8(sp)
ffffffffc0209a8a:	ec06                	sd	ra,24(sp)
ffffffffc0209a8c:	84ae                	mv	s1,a1
ffffffffc0209a8e:	842a                	mv	s0,a0
ffffffffc0209a90:	c595                	beqz	a1,ffffffffc0209abc <sfs_block_free+0x38>
ffffffffc0209a92:	415c                	lw	a5,4(a0)
ffffffffc0209a94:	02f5f463          	bgeu	a1,a5,ffffffffc0209abc <sfs_block_free+0x38>
ffffffffc0209a98:	7d08                	ld	a0,56(a0)
ffffffffc0209a9a:	ebaff0ef          	jal	ffffffffc0209154 <bitmap_test>
ffffffffc0209a9e:	ed0d                	bnez	a0,ffffffffc0209ad8 <sfs_block_free+0x54>
ffffffffc0209aa0:	7c08                	ld	a0,56(s0)
ffffffffc0209aa2:	85a6                	mv	a1,s1
ffffffffc0209aa4:	ed8ff0ef          	jal	ffffffffc020917c <bitmap_free>
ffffffffc0209aa8:	441c                	lw	a5,8(s0)
ffffffffc0209aaa:	4705                	li	a4,1
ffffffffc0209aac:	60e2                	ld	ra,24(sp)
ffffffffc0209aae:	2785                	addiw	a5,a5,1
ffffffffc0209ab0:	e038                	sd	a4,64(s0)
ffffffffc0209ab2:	c41c                	sw	a5,8(s0)
ffffffffc0209ab4:	6442                	ld	s0,16(sp)
ffffffffc0209ab6:	64a2                	ld	s1,8(sp)
ffffffffc0209ab8:	6105                	addi	sp,sp,32
ffffffffc0209aba:	8082                	ret
ffffffffc0209abc:	4054                	lw	a3,4(s0)
ffffffffc0209abe:	8726                	mv	a4,s1
ffffffffc0209ac0:	00005617          	auipc	a2,0x5
ffffffffc0209ac4:	be060613          	addi	a2,a2,-1056 # ffffffffc020e6a0 <etext+0x2f8c>
ffffffffc0209ac8:	05300593          	li	a1,83
ffffffffc0209acc:	00005517          	auipc	a0,0x5
ffffffffc0209ad0:	ba450513          	addi	a0,a0,-1116 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209ad4:	977f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209ad8:	00005697          	auipc	a3,0x5
ffffffffc0209adc:	c0068693          	addi	a3,a3,-1024 # ffffffffc020e6d8 <etext+0x2fc4>
ffffffffc0209ae0:	00002617          	auipc	a2,0x2
ffffffffc0209ae4:	07060613          	addi	a2,a2,112 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209ae8:	06a00593          	li	a1,106
ffffffffc0209aec:	00005517          	auipc	a0,0x5
ffffffffc0209af0:	b8450513          	addi	a0,a0,-1148 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209af4:	957f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209af8 <sfs_reclaim>:
ffffffffc0209af8:	1101                	addi	sp,sp,-32
ffffffffc0209afa:	e426                	sd	s1,8(sp)
ffffffffc0209afc:	7524                	ld	s1,104(a0)
ffffffffc0209afe:	ec06                	sd	ra,24(sp)
ffffffffc0209b00:	e822                	sd	s0,16(sp)
ffffffffc0209b02:	e04a                	sd	s2,0(sp)
ffffffffc0209b04:	0e048963          	beqz	s1,ffffffffc0209bf6 <sfs_reclaim+0xfe>
ffffffffc0209b08:	0b04a783          	lw	a5,176(s1)
ffffffffc0209b0c:	0e079563          	bnez	a5,ffffffffc0209bf6 <sfs_reclaim+0xfe>
ffffffffc0209b10:	4d38                	lw	a4,88(a0)
ffffffffc0209b12:	6785                	lui	a5,0x1
ffffffffc0209b14:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209b18:	842a                	mv	s0,a0
ffffffffc0209b1a:	10f71e63          	bne	a4,a5,ffffffffc0209c36 <sfs_reclaim+0x13e>
ffffffffc0209b1e:	8526                	mv	a0,s1
ffffffffc0209b20:	630010ef          	jal	ffffffffc020b150 <lock_sfs_fs>
ffffffffc0209b24:	4c1c                	lw	a5,24(s0)
ffffffffc0209b26:	0ef05863          	blez	a5,ffffffffc0209c16 <sfs_reclaim+0x11e>
ffffffffc0209b2a:	37fd                	addiw	a5,a5,-1
ffffffffc0209b2c:	cc1c                	sw	a5,24(s0)
ffffffffc0209b2e:	ebd9                	bnez	a5,ffffffffc0209bc4 <sfs_reclaim+0xcc>
ffffffffc0209b30:	05c42903          	lw	s2,92(s0)
ffffffffc0209b34:	08091863          	bnez	s2,ffffffffc0209bc4 <sfs_reclaim+0xcc>
ffffffffc0209b38:	601c                	ld	a5,0(s0)
ffffffffc0209b3a:	0067d783          	lhu	a5,6(a5)
ffffffffc0209b3e:	e785                	bnez	a5,ffffffffc0209b66 <sfs_reclaim+0x6e>
ffffffffc0209b40:	783c                	ld	a5,112(s0)
ffffffffc0209b42:	10078a63          	beqz	a5,ffffffffc0209c56 <sfs_reclaim+0x15e>
ffffffffc0209b46:	73bc                	ld	a5,96(a5)
ffffffffc0209b48:	10078763          	beqz	a5,ffffffffc0209c56 <sfs_reclaim+0x15e>
ffffffffc0209b4c:	00004597          	auipc	a1,0x4
ffffffffc0209b50:	44458593          	addi	a1,a1,1092 # ffffffffc020df90 <etext+0x287c>
ffffffffc0209b54:	8522                	mv	a0,s0
ffffffffc0209b56:	e07fd0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0209b5a:	783c                	ld	a5,112(s0)
ffffffffc0209b5c:	8522                	mv	a0,s0
ffffffffc0209b5e:	4581                	li	a1,0
ffffffffc0209b60:	73bc                	ld	a5,96(a5)
ffffffffc0209b62:	9782                	jalr	a5
ffffffffc0209b64:	e559                	bnez	a0,ffffffffc0209bf2 <sfs_reclaim+0xfa>
ffffffffc0209b66:	681c                	ld	a5,16(s0)
ffffffffc0209b68:	c39d                	beqz	a5,ffffffffc0209b8e <sfs_reclaim+0x96>
ffffffffc0209b6a:	783c                	ld	a5,112(s0)
ffffffffc0209b6c:	10078563          	beqz	a5,ffffffffc0209c76 <sfs_reclaim+0x17e>
ffffffffc0209b70:	7b9c                	ld	a5,48(a5)
ffffffffc0209b72:	10078263          	beqz	a5,ffffffffc0209c76 <sfs_reclaim+0x17e>
ffffffffc0209b76:	8522                	mv	a0,s0
ffffffffc0209b78:	00004597          	auipc	a1,0x4
ffffffffc0209b7c:	8b858593          	addi	a1,a1,-1864 # ffffffffc020d430 <etext+0x1d1c>
ffffffffc0209b80:	dddfd0ef          	jal	ffffffffc020795c <inode_check>
ffffffffc0209b84:	783c                	ld	a5,112(s0)
ffffffffc0209b86:	8522                	mv	a0,s0
ffffffffc0209b88:	7b9c                	ld	a5,48(a5)
ffffffffc0209b8a:	9782                	jalr	a5
ffffffffc0209b8c:	e13d                	bnez	a0,ffffffffc0209bf2 <sfs_reclaim+0xfa>
ffffffffc0209b8e:	7c18                	ld	a4,56(s0)
ffffffffc0209b90:	603c                	ld	a5,64(s0)
ffffffffc0209b92:	8526                	mv	a0,s1
ffffffffc0209b94:	e71c                	sd	a5,8(a4)
ffffffffc0209b96:	e398                	sd	a4,0(a5)
ffffffffc0209b98:	6438                	ld	a4,72(s0)
ffffffffc0209b9a:	683c                	ld	a5,80(s0)
ffffffffc0209b9c:	e71c                	sd	a5,8(a4)
ffffffffc0209b9e:	e398                	sd	a4,0(a5)
ffffffffc0209ba0:	5c0010ef          	jal	ffffffffc020b160 <unlock_sfs_fs>
ffffffffc0209ba4:	6008                	ld	a0,0(s0)
ffffffffc0209ba6:	00655783          	lhu	a5,6(a0)
ffffffffc0209baa:	cb85                	beqz	a5,ffffffffc0209bda <sfs_reclaim+0xe2>
ffffffffc0209bac:	cbaf80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0209bb0:	8522                	mv	a0,s0
ffffffffc0209bb2:	d43fd0ef          	jal	ffffffffc02078f4 <inode_kill>
ffffffffc0209bb6:	60e2                	ld	ra,24(sp)
ffffffffc0209bb8:	6442                	ld	s0,16(sp)
ffffffffc0209bba:	64a2                	ld	s1,8(sp)
ffffffffc0209bbc:	854a                	mv	a0,s2
ffffffffc0209bbe:	6902                	ld	s2,0(sp)
ffffffffc0209bc0:	6105                	addi	sp,sp,32
ffffffffc0209bc2:	8082                	ret
ffffffffc0209bc4:	5945                	li	s2,-15
ffffffffc0209bc6:	8526                	mv	a0,s1
ffffffffc0209bc8:	598010ef          	jal	ffffffffc020b160 <unlock_sfs_fs>
ffffffffc0209bcc:	60e2                	ld	ra,24(sp)
ffffffffc0209bce:	6442                	ld	s0,16(sp)
ffffffffc0209bd0:	64a2                	ld	s1,8(sp)
ffffffffc0209bd2:	854a                	mv	a0,s2
ffffffffc0209bd4:	6902                	ld	s2,0(sp)
ffffffffc0209bd6:	6105                	addi	sp,sp,32
ffffffffc0209bd8:	8082                	ret
ffffffffc0209bda:	440c                	lw	a1,8(s0)
ffffffffc0209bdc:	8526                	mv	a0,s1
ffffffffc0209bde:	ea7ff0ef          	jal	ffffffffc0209a84 <sfs_block_free>
ffffffffc0209be2:	6008                	ld	a0,0(s0)
ffffffffc0209be4:	5d4c                	lw	a1,60(a0)
ffffffffc0209be6:	d1f9                	beqz	a1,ffffffffc0209bac <sfs_reclaim+0xb4>
ffffffffc0209be8:	8526                	mv	a0,s1
ffffffffc0209bea:	e9bff0ef          	jal	ffffffffc0209a84 <sfs_block_free>
ffffffffc0209bee:	6008                	ld	a0,0(s0)
ffffffffc0209bf0:	bf75                	j	ffffffffc0209bac <sfs_reclaim+0xb4>
ffffffffc0209bf2:	892a                	mv	s2,a0
ffffffffc0209bf4:	bfc9                	j	ffffffffc0209bc6 <sfs_reclaim+0xce>
ffffffffc0209bf6:	00005697          	auipc	a3,0x5
ffffffffc0209bfa:	89a68693          	addi	a3,a3,-1894 # ffffffffc020e490 <etext+0x2d7c>
ffffffffc0209bfe:	00002617          	auipc	a2,0x2
ffffffffc0209c02:	f5260613          	addi	a2,a2,-174 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209c06:	35700593          	li	a1,855
ffffffffc0209c0a:	00005517          	auipc	a0,0x5
ffffffffc0209c0e:	a6650513          	addi	a0,a0,-1434 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209c12:	839f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209c16:	00005697          	auipc	a3,0x5
ffffffffc0209c1a:	ae268693          	addi	a3,a3,-1310 # ffffffffc020e6f8 <etext+0x2fe4>
ffffffffc0209c1e:	00002617          	auipc	a2,0x2
ffffffffc0209c22:	f3260613          	addi	a2,a2,-206 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209c26:	35d00593          	li	a1,861
ffffffffc0209c2a:	00005517          	auipc	a0,0x5
ffffffffc0209c2e:	a4650513          	addi	a0,a0,-1466 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209c32:	819f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209c36:	00005697          	auipc	a3,0x5
ffffffffc0209c3a:	a0268693          	addi	a3,a3,-1534 # ffffffffc020e638 <etext+0x2f24>
ffffffffc0209c3e:	00002617          	auipc	a2,0x2
ffffffffc0209c42:	f1260613          	addi	a2,a2,-238 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209c46:	35800593          	li	a1,856
ffffffffc0209c4a:	00005517          	auipc	a0,0x5
ffffffffc0209c4e:	a2650513          	addi	a0,a0,-1498 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209c52:	ff8f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209c56:	00004697          	auipc	a3,0x4
ffffffffc0209c5a:	2e268693          	addi	a3,a3,738 # ffffffffc020df38 <etext+0x2824>
ffffffffc0209c5e:	00002617          	auipc	a2,0x2
ffffffffc0209c62:	ef260613          	addi	a2,a2,-270 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209c66:	36200593          	li	a1,866
ffffffffc0209c6a:	00005517          	auipc	a0,0x5
ffffffffc0209c6e:	a0650513          	addi	a0,a0,-1530 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209c72:	fd8f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209c76:	00003697          	auipc	a3,0x3
ffffffffc0209c7a:	76a68693          	addi	a3,a3,1898 # ffffffffc020d3e0 <etext+0x1ccc>
ffffffffc0209c7e:	00002617          	auipc	a2,0x2
ffffffffc0209c82:	ed260613          	addi	a2,a2,-302 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209c86:	36700593          	li	a1,871
ffffffffc0209c8a:	00005517          	auipc	a0,0x5
ffffffffc0209c8e:	9e650513          	addi	a0,a0,-1562 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209c92:	fb8f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209c96 <sfs_block_alloc>:
ffffffffc0209c96:	1101                	addi	sp,sp,-32
ffffffffc0209c98:	e822                	sd	s0,16(sp)
ffffffffc0209c9a:	842a                	mv	s0,a0
ffffffffc0209c9c:	7d08                	ld	a0,56(a0)
ffffffffc0209c9e:	e426                	sd	s1,8(sp)
ffffffffc0209ca0:	ec06                	sd	ra,24(sp)
ffffffffc0209ca2:	84ae                	mv	s1,a1
ffffffffc0209ca4:	c3eff0ef          	jal	ffffffffc02090e2 <bitmap_alloc>
ffffffffc0209ca8:	e90d                	bnez	a0,ffffffffc0209cda <sfs_block_alloc+0x44>
ffffffffc0209caa:	441c                	lw	a5,8(s0)
ffffffffc0209cac:	cbb5                	beqz	a5,ffffffffc0209d20 <sfs_block_alloc+0x8a>
ffffffffc0209cae:	37fd                	addiw	a5,a5,-1
ffffffffc0209cb0:	c41c                	sw	a5,8(s0)
ffffffffc0209cb2:	408c                	lw	a1,0(s1)
ffffffffc0209cb4:	4605                	li	a2,1
ffffffffc0209cb6:	e030                	sd	a2,64(s0)
ffffffffc0209cb8:	c595                	beqz	a1,ffffffffc0209ce4 <sfs_block_alloc+0x4e>
ffffffffc0209cba:	405c                	lw	a5,4(s0)
ffffffffc0209cbc:	02f5f463          	bgeu	a1,a5,ffffffffc0209ce4 <sfs_block_alloc+0x4e>
ffffffffc0209cc0:	7c08                	ld	a0,56(s0)
ffffffffc0209cc2:	c92ff0ef          	jal	ffffffffc0209154 <bitmap_test>
ffffffffc0209cc6:	4605                	li	a2,1
ffffffffc0209cc8:	ed05                	bnez	a0,ffffffffc0209d00 <sfs_block_alloc+0x6a>
ffffffffc0209cca:	8522                	mv	a0,s0
ffffffffc0209ccc:	6442                	ld	s0,16(sp)
ffffffffc0209cce:	408c                	lw	a1,0(s1)
ffffffffc0209cd0:	60e2                	ld	ra,24(sp)
ffffffffc0209cd2:	64a2                	ld	s1,8(sp)
ffffffffc0209cd4:	6105                	addi	sp,sp,32
ffffffffc0209cd6:	41a0106f          	j	ffffffffc020b0f0 <sfs_clear_block>
ffffffffc0209cda:	60e2                	ld	ra,24(sp)
ffffffffc0209cdc:	6442                	ld	s0,16(sp)
ffffffffc0209cde:	64a2                	ld	s1,8(sp)
ffffffffc0209ce0:	6105                	addi	sp,sp,32
ffffffffc0209ce2:	8082                	ret
ffffffffc0209ce4:	4054                	lw	a3,4(s0)
ffffffffc0209ce6:	872e                	mv	a4,a1
ffffffffc0209ce8:	00005617          	auipc	a2,0x5
ffffffffc0209cec:	9b860613          	addi	a2,a2,-1608 # ffffffffc020e6a0 <etext+0x2f8c>
ffffffffc0209cf0:	05300593          	li	a1,83
ffffffffc0209cf4:	00005517          	auipc	a0,0x5
ffffffffc0209cf8:	97c50513          	addi	a0,a0,-1668 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209cfc:	f4ef60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209d00:	00005697          	auipc	a3,0x5
ffffffffc0209d04:	a3068693          	addi	a3,a3,-1488 # ffffffffc020e730 <etext+0x301c>
ffffffffc0209d08:	00002617          	auipc	a2,0x2
ffffffffc0209d0c:	e4860613          	addi	a2,a2,-440 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209d10:	06100593          	li	a1,97
ffffffffc0209d14:	00005517          	auipc	a0,0x5
ffffffffc0209d18:	95c50513          	addi	a0,a0,-1700 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209d1c:	f2ef60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209d20:	00005697          	auipc	a3,0x5
ffffffffc0209d24:	9f068693          	addi	a3,a3,-1552 # ffffffffc020e710 <etext+0x2ffc>
ffffffffc0209d28:	00002617          	auipc	a2,0x2
ffffffffc0209d2c:	e2860613          	addi	a2,a2,-472 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209d30:	05f00593          	li	a1,95
ffffffffc0209d34:	00005517          	auipc	a0,0x5
ffffffffc0209d38:	93c50513          	addi	a0,a0,-1732 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209d3c:	f0ef60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209d40 <sfs_bmap_load_nolock>:
ffffffffc0209d40:	711d                	addi	sp,sp,-96
ffffffffc0209d42:	e4a6                	sd	s1,72(sp)
ffffffffc0209d44:	6184                	ld	s1,0(a1)
ffffffffc0209d46:	e0ca                	sd	s2,64(sp)
ffffffffc0209d48:	ec86                	sd	ra,88(sp)
ffffffffc0209d4a:	0084a903          	lw	s2,8(s1)
ffffffffc0209d4e:	e8a2                	sd	s0,80(sp)
ffffffffc0209d50:	fc4e                	sd	s3,56(sp)
ffffffffc0209d52:	f852                	sd	s4,48(sp)
ffffffffc0209d54:	1ac96663          	bltu	s2,a2,ffffffffc0209f00 <sfs_bmap_load_nolock+0x1c0>
ffffffffc0209d58:	47ad                	li	a5,11
ffffffffc0209d5a:	882e                	mv	a6,a1
ffffffffc0209d5c:	8432                	mv	s0,a2
ffffffffc0209d5e:	8a36                	mv	s4,a3
ffffffffc0209d60:	89aa                	mv	s3,a0
ffffffffc0209d62:	04c7f963          	bgeu	a5,a2,ffffffffc0209db4 <sfs_bmap_load_nolock+0x74>
ffffffffc0209d66:	ff46079b          	addiw	a5,a2,-12
ffffffffc0209d6a:	3ff00713          	li	a4,1023
ffffffffc0209d6e:	f456                	sd	s5,40(sp)
ffffffffc0209d70:	1af76a63          	bltu	a4,a5,ffffffffc0209f24 <sfs_bmap_load_nolock+0x1e4>
ffffffffc0209d74:	03c4a883          	lw	a7,60(s1)
ffffffffc0209d78:	02079713          	slli	a4,a5,0x20
ffffffffc0209d7c:	01e75793          	srli	a5,a4,0x1e
ffffffffc0209d80:	ce02                	sw	zero,28(sp)
ffffffffc0209d82:	cc46                	sw	a7,24(sp)
ffffffffc0209d84:	8abe                	mv	s5,a5
ffffffffc0209d86:	12089063          	bnez	a7,ffffffffc0209ea6 <sfs_bmap_load_nolock+0x166>
ffffffffc0209d8a:	08c90c63          	beq	s2,a2,ffffffffc0209e22 <sfs_bmap_load_nolock+0xe2>
ffffffffc0209d8e:	7aa2                	ld	s5,40(sp)
ffffffffc0209d90:	4581                	li	a1,0
ffffffffc0209d92:	0049a683          	lw	a3,4(s3)
ffffffffc0209d96:	f456                	sd	s5,40(sp)
ffffffffc0209d98:	f05a                	sd	s6,32(sp)
ffffffffc0209d9a:	872e                	mv	a4,a1
ffffffffc0209d9c:	00005617          	auipc	a2,0x5
ffffffffc0209da0:	90460613          	addi	a2,a2,-1788 # ffffffffc020e6a0 <etext+0x2f8c>
ffffffffc0209da4:	05300593          	li	a1,83
ffffffffc0209da8:	00005517          	auipc	a0,0x5
ffffffffc0209dac:	8c850513          	addi	a0,a0,-1848 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209db0:	e9af60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209db4:	02061793          	slli	a5,a2,0x20
ffffffffc0209db8:	01e7d713          	srli	a4,a5,0x1e
ffffffffc0209dbc:	9726                	add	a4,a4,s1
ffffffffc0209dbe:	474c                	lw	a1,12(a4)
ffffffffc0209dc0:	ca2e                	sw	a1,20(sp)
ffffffffc0209dc2:	e581                	bnez	a1,ffffffffc0209dca <sfs_bmap_load_nolock+0x8a>
ffffffffc0209dc4:	0cc90063          	beq	s2,a2,ffffffffc0209e84 <sfs_bmap_load_nolock+0x144>
ffffffffc0209dc8:	d5e1                	beqz	a1,ffffffffc0209d90 <sfs_bmap_load_nolock+0x50>
ffffffffc0209dca:	0049a683          	lw	a3,4(s3)
ffffffffc0209dce:	16d5f863          	bgeu	a1,a3,ffffffffc0209f3e <sfs_bmap_load_nolock+0x1fe>
ffffffffc0209dd2:	0389b503          	ld	a0,56(s3)
ffffffffc0209dd6:	b7eff0ef          	jal	ffffffffc0209154 <bitmap_test>
ffffffffc0209dda:	18051763          	bnez	a0,ffffffffc0209f68 <sfs_bmap_load_nolock+0x228>
ffffffffc0209dde:	45d2                	lw	a1,20(sp)
ffffffffc0209de0:	0049a783          	lw	a5,4(s3)
ffffffffc0209de4:	d5d5                	beqz	a1,ffffffffc0209d90 <sfs_bmap_load_nolock+0x50>
ffffffffc0209de6:	faf5f6e3          	bgeu	a1,a5,ffffffffc0209d92 <sfs_bmap_load_nolock+0x52>
ffffffffc0209dea:	0389b503          	ld	a0,56(s3)
ffffffffc0209dee:	e02e                	sd	a1,0(sp)
ffffffffc0209df0:	b64ff0ef          	jal	ffffffffc0209154 <bitmap_test>
ffffffffc0209df4:	6582                	ld	a1,0(sp)
ffffffffc0209df6:	14051763          	bnez	a0,ffffffffc0209f44 <sfs_bmap_load_nolock+0x204>
ffffffffc0209dfa:	02890063          	beq	s2,s0,ffffffffc0209e1a <sfs_bmap_load_nolock+0xda>
ffffffffc0209dfe:	000a0463          	beqz	s4,ffffffffc0209e06 <sfs_bmap_load_nolock+0xc6>
ffffffffc0209e02:	00ba2023          	sw	a1,0(s4)
ffffffffc0209e06:	4781                	li	a5,0
ffffffffc0209e08:	6446                	ld	s0,80(sp)
ffffffffc0209e0a:	60e6                	ld	ra,88(sp)
ffffffffc0209e0c:	79e2                	ld	s3,56(sp)
ffffffffc0209e0e:	7a42                	ld	s4,48(sp)
ffffffffc0209e10:	64a6                	ld	s1,72(sp)
ffffffffc0209e12:	6906                	ld	s2,64(sp)
ffffffffc0209e14:	853e                	mv	a0,a5
ffffffffc0209e16:	6125                	addi	sp,sp,96
ffffffffc0209e18:	8082                	ret
ffffffffc0209e1a:	449c                	lw	a5,8(s1)
ffffffffc0209e1c:	2785                	addiw	a5,a5,1
ffffffffc0209e1e:	c49c                	sw	a5,8(s1)
ffffffffc0209e20:	bff9                	j	ffffffffc0209dfe <sfs_bmap_load_nolock+0xbe>
ffffffffc0209e22:	082c                	addi	a1,sp,24
ffffffffc0209e24:	e046                	sd	a7,0(sp)
ffffffffc0209e26:	e442                	sd	a6,8(sp)
ffffffffc0209e28:	e6fff0ef          	jal	ffffffffc0209c96 <sfs_block_alloc>
ffffffffc0209e2c:	87aa                	mv	a5,a0
ffffffffc0209e2e:	ed5d                	bnez	a0,ffffffffc0209eec <sfs_bmap_load_nolock+0x1ac>
ffffffffc0209e30:	6882                	ld	a7,0(sp)
ffffffffc0209e32:	6822                	ld	a6,8(sp)
ffffffffc0209e34:	f05a                	sd	s6,32(sp)
ffffffffc0209e36:	01c10b13          	addi	s6,sp,28
ffffffffc0209e3a:	85da                	mv	a1,s6
ffffffffc0209e3c:	854e                	mv	a0,s3
ffffffffc0209e3e:	e046                	sd	a7,0(sp)
ffffffffc0209e40:	e442                	sd	a6,8(sp)
ffffffffc0209e42:	e55ff0ef          	jal	ffffffffc0209c96 <sfs_block_alloc>
ffffffffc0209e46:	6882                	ld	a7,0(sp)
ffffffffc0209e48:	87aa                	mv	a5,a0
ffffffffc0209e4a:	e959                	bnez	a0,ffffffffc0209ee0 <sfs_bmap_load_nolock+0x1a0>
ffffffffc0209e4c:	46e2                	lw	a3,24(sp)
ffffffffc0209e4e:	85da                	mv	a1,s6
ffffffffc0209e50:	8756                	mv	a4,s5
ffffffffc0209e52:	4611                	li	a2,4
ffffffffc0209e54:	854e                	mv	a0,s3
ffffffffc0209e56:	e046                	sd	a7,0(sp)
ffffffffc0209e58:	144010ef          	jal	ffffffffc020af9c <sfs_wbuf>
ffffffffc0209e5c:	45f2                	lw	a1,28(sp)
ffffffffc0209e5e:	6882                	ld	a7,0(sp)
ffffffffc0209e60:	e92d                	bnez	a0,ffffffffc0209ed2 <sfs_bmap_load_nolock+0x192>
ffffffffc0209e62:	5cd8                	lw	a4,60(s1)
ffffffffc0209e64:	47e2                	lw	a5,24(sp)
ffffffffc0209e66:	6822                	ld	a6,8(sp)
ffffffffc0209e68:	ca2e                	sw	a1,20(sp)
ffffffffc0209e6a:	00f70863          	beq	a4,a5,ffffffffc0209e7a <sfs_bmap_load_nolock+0x13a>
ffffffffc0209e6e:	10071f63          	bnez	a4,ffffffffc0209f8c <sfs_bmap_load_nolock+0x24c>
ffffffffc0209e72:	dcdc                	sw	a5,60(s1)
ffffffffc0209e74:	4785                	li	a5,1
ffffffffc0209e76:	00f83823          	sd	a5,16(a6)
ffffffffc0209e7a:	7aa2                	ld	s5,40(sp)
ffffffffc0209e7c:	7b02                	ld	s6,32(sp)
ffffffffc0209e7e:	f00589e3          	beqz	a1,ffffffffc0209d90 <sfs_bmap_load_nolock+0x50>
ffffffffc0209e82:	b7a1                	j	ffffffffc0209dca <sfs_bmap_load_nolock+0x8a>
ffffffffc0209e84:	084c                	addi	a1,sp,20
ffffffffc0209e86:	e03a                	sd	a4,0(sp)
ffffffffc0209e88:	e442                	sd	a6,8(sp)
ffffffffc0209e8a:	e0dff0ef          	jal	ffffffffc0209c96 <sfs_block_alloc>
ffffffffc0209e8e:	87aa                	mv	a5,a0
ffffffffc0209e90:	fd25                	bnez	a0,ffffffffc0209e08 <sfs_bmap_load_nolock+0xc8>
ffffffffc0209e92:	45d2                	lw	a1,20(sp)
ffffffffc0209e94:	6702                	ld	a4,0(sp)
ffffffffc0209e96:	6822                	ld	a6,8(sp)
ffffffffc0209e98:	4785                	li	a5,1
ffffffffc0209e9a:	c74c                	sw	a1,12(a4)
ffffffffc0209e9c:	00f83823          	sd	a5,16(a6)
ffffffffc0209ea0:	ee0588e3          	beqz	a1,ffffffffc0209d90 <sfs_bmap_load_nolock+0x50>
ffffffffc0209ea4:	b71d                	j	ffffffffc0209dca <sfs_bmap_load_nolock+0x8a>
ffffffffc0209ea6:	e02e                	sd	a1,0(sp)
ffffffffc0209ea8:	873e                	mv	a4,a5
ffffffffc0209eaa:	086c                	addi	a1,sp,28
ffffffffc0209eac:	86c6                	mv	a3,a7
ffffffffc0209eae:	4611                	li	a2,4
ffffffffc0209eb0:	f05a                	sd	s6,32(sp)
ffffffffc0209eb2:	e446                	sd	a7,8(sp)
ffffffffc0209eb4:	068010ef          	jal	ffffffffc020af1c <sfs_rbuf>
ffffffffc0209eb8:	01c10b13          	addi	s6,sp,28
ffffffffc0209ebc:	87aa                	mv	a5,a0
ffffffffc0209ebe:	e505                	bnez	a0,ffffffffc0209ee6 <sfs_bmap_load_nolock+0x1a6>
ffffffffc0209ec0:	45f2                	lw	a1,28(sp)
ffffffffc0209ec2:	6802                	ld	a6,0(sp)
ffffffffc0209ec4:	00891463          	bne	s2,s0,ffffffffc0209ecc <sfs_bmap_load_nolock+0x18c>
ffffffffc0209ec8:	68a2                	ld	a7,8(sp)
ffffffffc0209eca:	d9a5                	beqz	a1,ffffffffc0209e3a <sfs_bmap_load_nolock+0xfa>
ffffffffc0209ecc:	5cd8                	lw	a4,60(s1)
ffffffffc0209ece:	47e2                	lw	a5,24(sp)
ffffffffc0209ed0:	bf61                	j	ffffffffc0209e68 <sfs_bmap_load_nolock+0x128>
ffffffffc0209ed2:	e42a                	sd	a0,8(sp)
ffffffffc0209ed4:	854e                	mv	a0,s3
ffffffffc0209ed6:	e046                	sd	a7,0(sp)
ffffffffc0209ed8:	badff0ef          	jal	ffffffffc0209a84 <sfs_block_free>
ffffffffc0209edc:	6882                	ld	a7,0(sp)
ffffffffc0209ede:	67a2                	ld	a5,8(sp)
ffffffffc0209ee0:	45e2                	lw	a1,24(sp)
ffffffffc0209ee2:	00b89763          	bne	a7,a1,ffffffffc0209ef0 <sfs_bmap_load_nolock+0x1b0>
ffffffffc0209ee6:	7aa2                	ld	s5,40(sp)
ffffffffc0209ee8:	7b02                	ld	s6,32(sp)
ffffffffc0209eea:	bf39                	j	ffffffffc0209e08 <sfs_bmap_load_nolock+0xc8>
ffffffffc0209eec:	7aa2                	ld	s5,40(sp)
ffffffffc0209eee:	bf29                	j	ffffffffc0209e08 <sfs_bmap_load_nolock+0xc8>
ffffffffc0209ef0:	854e                	mv	a0,s3
ffffffffc0209ef2:	e03e                	sd	a5,0(sp)
ffffffffc0209ef4:	b91ff0ef          	jal	ffffffffc0209a84 <sfs_block_free>
ffffffffc0209ef8:	6782                	ld	a5,0(sp)
ffffffffc0209efa:	7aa2                	ld	s5,40(sp)
ffffffffc0209efc:	7b02                	ld	s6,32(sp)
ffffffffc0209efe:	b729                	j	ffffffffc0209e08 <sfs_bmap_load_nolock+0xc8>
ffffffffc0209f00:	00005697          	auipc	a3,0x5
ffffffffc0209f04:	85868693          	addi	a3,a3,-1960 # ffffffffc020e758 <etext+0x3044>
ffffffffc0209f08:	00002617          	auipc	a2,0x2
ffffffffc0209f0c:	c4860613          	addi	a2,a2,-952 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209f10:	16500593          	li	a1,357
ffffffffc0209f14:	00004517          	auipc	a0,0x4
ffffffffc0209f18:	75c50513          	addi	a0,a0,1884 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209f1c:	f456                	sd	s5,40(sp)
ffffffffc0209f1e:	f05a                	sd	s6,32(sp)
ffffffffc0209f20:	d2af60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209f24:	00005617          	auipc	a2,0x5
ffffffffc0209f28:	86460613          	addi	a2,a2,-1948 # ffffffffc020e788 <etext+0x3074>
ffffffffc0209f2c:	11e00593          	li	a1,286
ffffffffc0209f30:	00004517          	auipc	a0,0x4
ffffffffc0209f34:	74050513          	addi	a0,a0,1856 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209f38:	f05a                	sd	s6,32(sp)
ffffffffc0209f3a:	d10f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209f3e:	f456                	sd	s5,40(sp)
ffffffffc0209f40:	f05a                	sd	s6,32(sp)
ffffffffc0209f42:	bda1                	j	ffffffffc0209d9a <sfs_bmap_load_nolock+0x5a>
ffffffffc0209f44:	00004697          	auipc	a3,0x4
ffffffffc0209f48:	79468693          	addi	a3,a3,1940 # ffffffffc020e6d8 <etext+0x2fc4>
ffffffffc0209f4c:	00002617          	auipc	a2,0x2
ffffffffc0209f50:	c0460613          	addi	a2,a2,-1020 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209f54:	16c00593          	li	a1,364
ffffffffc0209f58:	00004517          	auipc	a0,0x4
ffffffffc0209f5c:	71850513          	addi	a0,a0,1816 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209f60:	f456                	sd	s5,40(sp)
ffffffffc0209f62:	f05a                	sd	s6,32(sp)
ffffffffc0209f64:	ce6f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209f68:	00005697          	auipc	a3,0x5
ffffffffc0209f6c:	85068693          	addi	a3,a3,-1968 # ffffffffc020e7b8 <etext+0x30a4>
ffffffffc0209f70:	00002617          	auipc	a2,0x2
ffffffffc0209f74:	be060613          	addi	a2,a2,-1056 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209f78:	12100593          	li	a1,289
ffffffffc0209f7c:	00004517          	auipc	a0,0x4
ffffffffc0209f80:	6f450513          	addi	a0,a0,1780 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209f84:	f456                	sd	s5,40(sp)
ffffffffc0209f86:	f05a                	sd	s6,32(sp)
ffffffffc0209f88:	cc2f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209f8c:	00004697          	auipc	a3,0x4
ffffffffc0209f90:	7e468693          	addi	a3,a3,2020 # ffffffffc020e770 <etext+0x305c>
ffffffffc0209f94:	00002617          	auipc	a2,0x2
ffffffffc0209f98:	bbc60613          	addi	a2,a2,-1092 # ffffffffc020bb50 <etext+0x43c>
ffffffffc0209f9c:	11800593          	li	a1,280
ffffffffc0209fa0:	00004517          	auipc	a0,0x4
ffffffffc0209fa4:	6d050513          	addi	a0,a0,1744 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc0209fa8:	ca2f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209fac <sfs_io_nolock>:
ffffffffc0209fac:	7175                	addi	sp,sp,-144
ffffffffc0209fae:	e4de                	sd	s7,72(sp)
ffffffffc0209fb0:	8bae                	mv	s7,a1
ffffffffc0209fb2:	618c                	ld	a1,0(a1)
ffffffffc0209fb4:	e506                	sd	ra,136(sp)
ffffffffc0209fb6:	4809                	li	a6,2
ffffffffc0209fb8:	0045d883          	lhu	a7,4(a1)
ffffffffc0209fbc:	1d088763          	beq	a7,a6,ffffffffc020a18a <sfs_io_nolock+0x1de>
ffffffffc0209fc0:	ecd6                	sd	s5,88(sp)
ffffffffc0209fc2:	00073a83          	ld	s5,0(a4) # 8000000 <_binary_bin_sfs_img_size+0x7f8ad00>
ffffffffc0209fc6:	f4ce                	sd	s3,104(sp)
ffffffffc0209fc8:	f86a                	sd	s10,48(sp)
ffffffffc0209fca:	8d3a                	mv	s10,a4
ffffffffc0209fcc:	000d3023          	sd	zero,0(s10)
ffffffffc0209fd0:	08000737          	lui	a4,0x8000
ffffffffc0209fd4:	89b6                	mv	s3,a3
ffffffffc0209fd6:	9ab6                	add	s5,s5,a3
ffffffffc0209fd8:	8836                	mv	a6,a3
ffffffffc0209fda:	1ae6f663          	bgeu	a3,a4,ffffffffc020a186 <sfs_io_nolock+0x1da>
ffffffffc0209fde:	1adac463          	blt	s5,a3,ffffffffc020a186 <sfs_io_nolock+0x1da>
ffffffffc0209fe2:	f0d2                	sd	s4,96(sp)
ffffffffc0209fe4:	8a2a                	mv	s4,a0
ffffffffc0209fe6:	4501                	li	a0,0
ffffffffc0209fe8:	13568163          	beq	a3,s5,ffffffffc020a10a <sfs_io_nolock+0x15e>
ffffffffc0209fec:	fca6                	sd	s1,120(sp)
ffffffffc0209fee:	fc66                	sd	s9,56(sp)
ffffffffc0209ff0:	f46e                	sd	s11,40(sp)
ffffffffc0209ff2:	84b2                	mv	s1,a2
ffffffffc0209ff4:	01577363          	bgeu	a4,s5,ffffffffc0209ffa <sfs_io_nolock+0x4e>
ffffffffc0209ff8:	8aba                	mv	s5,a4
ffffffffc0209ffa:	c3f5                	beqz	a5,ffffffffc020a0de <sfs_io_nolock+0x132>
ffffffffc0209ffc:	e122                	sd	s0,128(sp)
ffffffffc0209ffe:	f8ca                	sd	s2,112(sp)
ffffffffc020a000:	e8da                	sd	s6,80(sp)
ffffffffc020a002:	e0e2                	sd	s8,64(sp)
ffffffffc020a004:	00001c97          	auipc	s9,0x1
ffffffffc020a008:	eb6c8c93          	addi	s9,s9,-330 # ffffffffc020aeba <sfs_wblock>
ffffffffc020a00c:	00001d97          	auipc	s11,0x1
ffffffffc020a010:	f90d8d93          	addi	s11,s11,-112 # ffffffffc020af9c <sfs_wbuf>
ffffffffc020a014:	6705                	lui	a4,0x1
ffffffffc020a016:	40c9d413          	srai	s0,s3,0xc
ffffffffc020a01a:	fff70c13          	addi	s8,a4,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc020a01e:	40cadb13          	srai	s6,s5,0xc
ffffffffc020a022:	408b0b3b          	subw	s6,s6,s0
ffffffffc020a026:	0189fc33          	and	s8,s3,s8
ffffffffc020a02a:	2401                	sext.w	s0,s0
ffffffffc020a02c:	87da                	mv	a5,s6
ffffffffc020a02e:	0c0c0c63          	beqz	s8,ffffffffc020a106 <sfs_io_nolock+0x15a>
ffffffffc020a032:	413a87b3          	sub	a5,s5,s3
ffffffffc020a036:	0e0b1263          	bnez	s6,ffffffffc020a11a <sfs_io_nolock+0x16e>
ffffffffc020a03a:	0874                	addi	a3,sp,28
ffffffffc020a03c:	8622                	mv	a2,s0
ffffffffc020a03e:	85de                	mv	a1,s7
ffffffffc020a040:	8552                	mv	a0,s4
ffffffffc020a042:	e042                	sd	a6,0(sp)
ffffffffc020a044:	e43e                	sd	a5,8(sp)
ffffffffc020a046:	cfbff0ef          	jal	ffffffffc0209d40 <sfs_bmap_load_nolock>
ffffffffc020a04a:	6802                	ld	a6,0(sp)
ffffffffc020a04c:	4901                	li	s2,0
ffffffffc020a04e:	e931                	bnez	a0,ffffffffc020a0a2 <sfs_io_nolock+0xf6>
ffffffffc020a050:	6922                	ld	s2,8(sp)
ffffffffc020a052:	46f2                	lw	a3,28(sp)
ffffffffc020a054:	8762                	mv	a4,s8
ffffffffc020a056:	864a                	mv	a2,s2
ffffffffc020a058:	85a6                	mv	a1,s1
ffffffffc020a05a:	8552                	mv	a0,s4
ffffffffc020a05c:	9d82                	jalr	s11
ffffffffc020a05e:	6802                	ld	a6,0(sp)
ffffffffc020a060:	e971                	bnez	a0,ffffffffc020a134 <sfs_io_nolock+0x188>
ffffffffc020a062:	020b0e63          	beqz	s6,ffffffffc020a09e <sfs_io_nolock+0xf2>
ffffffffc020a066:	94ca                	add	s1,s1,s2
ffffffffc020a068:	2405                	addiw	s0,s0,1
ffffffffc020a06a:	fffb079b          	addiw	a5,s6,-1
ffffffffc020a06e:	c7e9                	beqz	a5,ffffffffc020a138 <sfs_io_nolock+0x18c>
ffffffffc020a070:	00878c3b          	addw	s8,a5,s0
ffffffffc020a074:	e062                	sd	s8,0(sp)
ffffffffc020a076:	6b05                	lui	s6,0x1
ffffffffc020a078:	a821                	j	ffffffffc020a090 <sfs_io_nolock+0xe4>
ffffffffc020a07a:	4672                	lw	a2,28(sp)
ffffffffc020a07c:	4685                	li	a3,1
ffffffffc020a07e:	85a6                	mv	a1,s1
ffffffffc020a080:	8552                	mv	a0,s4
ffffffffc020a082:	9c82                	jalr	s9
ffffffffc020a084:	ed09                	bnez	a0,ffffffffc020a09e <sfs_io_nolock+0xf2>
ffffffffc020a086:	2405                	addiw	s0,s0,1
ffffffffc020a088:	995a                	add	s2,s2,s6
ffffffffc020a08a:	94da                	add	s1,s1,s6
ffffffffc020a08c:	0a8c0763          	beq	s8,s0,ffffffffc020a13a <sfs_io_nolock+0x18e>
ffffffffc020a090:	0874                	addi	a3,sp,28
ffffffffc020a092:	8622                	mv	a2,s0
ffffffffc020a094:	85de                	mv	a1,s7
ffffffffc020a096:	8552                	mv	a0,s4
ffffffffc020a098:	ca9ff0ef          	jal	ffffffffc0209d40 <sfs_bmap_load_nolock>
ffffffffc020a09c:	dd79                	beqz	a0,ffffffffc020a07a <sfs_io_nolock+0xce>
ffffffffc020a09e:	01298833          	add	a6,s3,s2
ffffffffc020a0a2:	000bb783          	ld	a5,0(s7)
ffffffffc020a0a6:	012d3023          	sd	s2,0(s10)
ffffffffc020a0aa:	0007e703          	lwu	a4,0(a5)
ffffffffc020a0ae:	01077963          	bgeu	a4,a6,ffffffffc020a0c0 <sfs_io_nolock+0x114>
ffffffffc020a0b2:	012989bb          	addw	s3,s3,s2
ffffffffc020a0b6:	0137a023          	sw	s3,0(a5)
ffffffffc020a0ba:	4785                	li	a5,1
ffffffffc020a0bc:	00fbb823          	sd	a5,16(s7)
ffffffffc020a0c0:	640a                	ld	s0,128(sp)
ffffffffc020a0c2:	74e6                	ld	s1,120(sp)
ffffffffc020a0c4:	7946                	ld	s2,112(sp)
ffffffffc020a0c6:	7a06                	ld	s4,96(sp)
ffffffffc020a0c8:	6b46                	ld	s6,80(sp)
ffffffffc020a0ca:	6c06                	ld	s8,64(sp)
ffffffffc020a0cc:	7ce2                	ld	s9,56(sp)
ffffffffc020a0ce:	7da2                	ld	s11,40(sp)
ffffffffc020a0d0:	60aa                	ld	ra,136(sp)
ffffffffc020a0d2:	79a6                	ld	s3,104(sp)
ffffffffc020a0d4:	6ae6                	ld	s5,88(sp)
ffffffffc020a0d6:	7d42                	ld	s10,48(sp)
ffffffffc020a0d8:	6ba6                	ld	s7,72(sp)
ffffffffc020a0da:	6149                	addi	sp,sp,144
ffffffffc020a0dc:	8082                	ret
ffffffffc020a0de:	0005e783          	lwu	a5,0(a1)
ffffffffc020a0e2:	4501                	li	a0,0
ffffffffc020a0e4:	06f9d463          	bge	s3,a5,ffffffffc020a14c <sfs_io_nolock+0x1a0>
ffffffffc020a0e8:	e122                	sd	s0,128(sp)
ffffffffc020a0ea:	f8ca                	sd	s2,112(sp)
ffffffffc020a0ec:	e8da                	sd	s6,80(sp)
ffffffffc020a0ee:	e0e2                	sd	s8,64(sp)
ffffffffc020a0f0:	0357c863          	blt	a5,s5,ffffffffc020a120 <sfs_io_nolock+0x174>
ffffffffc020a0f4:	00001c97          	auipc	s9,0x1
ffffffffc020a0f8:	d64c8c93          	addi	s9,s9,-668 # ffffffffc020ae58 <sfs_rblock>
ffffffffc020a0fc:	00001d97          	auipc	s11,0x1
ffffffffc020a100:	e20d8d93          	addi	s11,s11,-480 # ffffffffc020af1c <sfs_rbuf>
ffffffffc020a104:	bf01                	j	ffffffffc020a014 <sfs_io_nolock+0x68>
ffffffffc020a106:	4901                	li	s2,0
ffffffffc020a108:	b79d                	j	ffffffffc020a06e <sfs_io_nolock+0xc2>
ffffffffc020a10a:	60aa                	ld	ra,136(sp)
ffffffffc020a10c:	7a06                	ld	s4,96(sp)
ffffffffc020a10e:	79a6                	ld	s3,104(sp)
ffffffffc020a110:	6ae6                	ld	s5,88(sp)
ffffffffc020a112:	7d42                	ld	s10,48(sp)
ffffffffc020a114:	6ba6                	ld	s7,72(sp)
ffffffffc020a116:	6149                	addi	sp,sp,144
ffffffffc020a118:	8082                	ret
ffffffffc020a11a:	418707b3          	sub	a5,a4,s8
ffffffffc020a11e:	bf31                	j	ffffffffc020a03a <sfs_io_nolock+0x8e>
ffffffffc020a120:	8abe                	mv	s5,a5
ffffffffc020a122:	00001c97          	auipc	s9,0x1
ffffffffc020a126:	d36c8c93          	addi	s9,s9,-714 # ffffffffc020ae58 <sfs_rblock>
ffffffffc020a12a:	00001d97          	auipc	s11,0x1
ffffffffc020a12e:	df2d8d93          	addi	s11,s11,-526 # ffffffffc020af1c <sfs_rbuf>
ffffffffc020a132:	b5cd                	j	ffffffffc020a014 <sfs_io_nolock+0x68>
ffffffffc020a134:	4901                	li	s2,0
ffffffffc020a136:	b7b5                	j	ffffffffc020a0a2 <sfs_io_nolock+0xf6>
ffffffffc020a138:	e022                	sd	s0,0(sp)
ffffffffc020a13a:	1ad2                	slli	s5,s5,0x34
ffffffffc020a13c:	034ad413          	srli	s0,s5,0x34
ffffffffc020a140:	020a9163          	bnez	s5,ffffffffc020a162 <sfs_io_nolock+0x1b6>
ffffffffc020a144:	01298833          	add	a6,s3,s2
ffffffffc020a148:	4501                	li	a0,0
ffffffffc020a14a:	bfa1                	j	ffffffffc020a0a2 <sfs_io_nolock+0xf6>
ffffffffc020a14c:	60aa                	ld	ra,136(sp)
ffffffffc020a14e:	74e6                	ld	s1,120(sp)
ffffffffc020a150:	7a06                	ld	s4,96(sp)
ffffffffc020a152:	7ce2                	ld	s9,56(sp)
ffffffffc020a154:	7da2                	ld	s11,40(sp)
ffffffffc020a156:	79a6                	ld	s3,104(sp)
ffffffffc020a158:	6ae6                	ld	s5,88(sp)
ffffffffc020a15a:	7d42                	ld	s10,48(sp)
ffffffffc020a15c:	6ba6                	ld	s7,72(sp)
ffffffffc020a15e:	6149                	addi	sp,sp,144
ffffffffc020a160:	8082                	ret
ffffffffc020a162:	6602                	ld	a2,0(sp)
ffffffffc020a164:	0874                	addi	a3,sp,28
ffffffffc020a166:	85de                	mv	a1,s7
ffffffffc020a168:	8552                	mv	a0,s4
ffffffffc020a16a:	bd7ff0ef          	jal	ffffffffc0209d40 <sfs_bmap_load_nolock>
ffffffffc020a16e:	f905                	bnez	a0,ffffffffc020a09e <sfs_io_nolock+0xf2>
ffffffffc020a170:	46f2                	lw	a3,28(sp)
ffffffffc020a172:	85a6                	mv	a1,s1
ffffffffc020a174:	8552                	mv	a0,s4
ffffffffc020a176:	4701                	li	a4,0
ffffffffc020a178:	8622                	mv	a2,s0
ffffffffc020a17a:	9d82                	jalr	s11
ffffffffc020a17c:	f10d                	bnez	a0,ffffffffc020a09e <sfs_io_nolock+0xf2>
ffffffffc020a17e:	9922                	add	s2,s2,s0
ffffffffc020a180:	01298833          	add	a6,s3,s2
ffffffffc020a184:	bf39                	j	ffffffffc020a0a2 <sfs_io_nolock+0xf6>
ffffffffc020a186:	5575                	li	a0,-3
ffffffffc020a188:	b7a1                	j	ffffffffc020a0d0 <sfs_io_nolock+0x124>
ffffffffc020a18a:	00004697          	auipc	a3,0x4
ffffffffc020a18e:	65668693          	addi	a3,a3,1622 # ffffffffc020e7e0 <etext+0x30cc>
ffffffffc020a192:	00002617          	auipc	a2,0x2
ffffffffc020a196:	9be60613          	addi	a2,a2,-1602 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a19a:	22e00593          	li	a1,558
ffffffffc020a19e:	00004517          	auipc	a0,0x4
ffffffffc020a1a2:	4d250513          	addi	a0,a0,1234 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a1a6:	e122                	sd	s0,128(sp)
ffffffffc020a1a8:	fca6                	sd	s1,120(sp)
ffffffffc020a1aa:	f8ca                	sd	s2,112(sp)
ffffffffc020a1ac:	f4ce                	sd	s3,104(sp)
ffffffffc020a1ae:	f0d2                	sd	s4,96(sp)
ffffffffc020a1b0:	ecd6                	sd	s5,88(sp)
ffffffffc020a1b2:	e8da                	sd	s6,80(sp)
ffffffffc020a1b4:	e0e2                	sd	s8,64(sp)
ffffffffc020a1b6:	fc66                	sd	s9,56(sp)
ffffffffc020a1b8:	f86a                	sd	s10,48(sp)
ffffffffc020a1ba:	f46e                	sd	s11,40(sp)
ffffffffc020a1bc:	a8ef60ef          	jal	ffffffffc020044a <__panic>

ffffffffc020a1c0 <sfs_read>:
ffffffffc020a1c0:	7139                	addi	sp,sp,-64
ffffffffc020a1c2:	f04a                	sd	s2,32(sp)
ffffffffc020a1c4:	06853903          	ld	s2,104(a0)
ffffffffc020a1c8:	fc06                	sd	ra,56(sp)
ffffffffc020a1ca:	f822                	sd	s0,48(sp)
ffffffffc020a1cc:	f426                	sd	s1,40(sp)
ffffffffc020a1ce:	ec4e                	sd	s3,24(sp)
ffffffffc020a1d0:	04090e63          	beqz	s2,ffffffffc020a22c <sfs_read+0x6c>
ffffffffc020a1d4:	0b092783          	lw	a5,176(s2)
ffffffffc020a1d8:	ebb1                	bnez	a5,ffffffffc020a22c <sfs_read+0x6c>
ffffffffc020a1da:	4d38                	lw	a4,88(a0)
ffffffffc020a1dc:	6785                	lui	a5,0x1
ffffffffc020a1de:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a1e2:	842a                	mv	s0,a0
ffffffffc020a1e4:	06f71463          	bne	a4,a5,ffffffffc020a24c <sfs_read+0x8c>
ffffffffc020a1e8:	02050993          	addi	s3,a0,32
ffffffffc020a1ec:	854e                	mv	a0,s3
ffffffffc020a1ee:	84ae                	mv	s1,a1
ffffffffc020a1f0:	c52fa0ef          	jal	ffffffffc0204642 <down>
ffffffffc020a1f4:	6c9c                	ld	a5,24(s1)
ffffffffc020a1f6:	6494                	ld	a3,8(s1)
ffffffffc020a1f8:	6090                	ld	a2,0(s1)
ffffffffc020a1fa:	85a2                	mv	a1,s0
ffffffffc020a1fc:	e43e                	sd	a5,8(sp)
ffffffffc020a1fe:	854a                	mv	a0,s2
ffffffffc020a200:	0038                	addi	a4,sp,8
ffffffffc020a202:	4781                	li	a5,0
ffffffffc020a204:	da9ff0ef          	jal	ffffffffc0209fac <sfs_io_nolock>
ffffffffc020a208:	65a2                	ld	a1,8(sp)
ffffffffc020a20a:	842a                	mv	s0,a0
ffffffffc020a20c:	ed81                	bnez	a1,ffffffffc020a224 <sfs_read+0x64>
ffffffffc020a20e:	854e                	mv	a0,s3
ffffffffc020a210:	c2efa0ef          	jal	ffffffffc020463e <up>
ffffffffc020a214:	70e2                	ld	ra,56(sp)
ffffffffc020a216:	8522                	mv	a0,s0
ffffffffc020a218:	7442                	ld	s0,48(sp)
ffffffffc020a21a:	74a2                	ld	s1,40(sp)
ffffffffc020a21c:	7902                	ld	s2,32(sp)
ffffffffc020a21e:	69e2                	ld	s3,24(sp)
ffffffffc020a220:	6121                	addi	sp,sp,64
ffffffffc020a222:	8082                	ret
ffffffffc020a224:	8526                	mv	a0,s1
ffffffffc020a226:	b40fb0ef          	jal	ffffffffc0205566 <iobuf_skip>
ffffffffc020a22a:	b7d5                	j	ffffffffc020a20e <sfs_read+0x4e>
ffffffffc020a22c:	00004697          	auipc	a3,0x4
ffffffffc020a230:	26468693          	addi	a3,a3,612 # ffffffffc020e490 <etext+0x2d7c>
ffffffffc020a234:	00002617          	auipc	a2,0x2
ffffffffc020a238:	91c60613          	addi	a2,a2,-1764 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a23c:	29500593          	li	a1,661
ffffffffc020a240:	00004517          	auipc	a0,0x4
ffffffffc020a244:	43050513          	addi	a0,a0,1072 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a248:	a02f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a24c:	815ff0ef          	jal	ffffffffc0209a60 <sfs_io.part.0>

ffffffffc020a250 <sfs_write>:
ffffffffc020a250:	7139                	addi	sp,sp,-64
ffffffffc020a252:	f04a                	sd	s2,32(sp)
ffffffffc020a254:	06853903          	ld	s2,104(a0)
ffffffffc020a258:	fc06                	sd	ra,56(sp)
ffffffffc020a25a:	f822                	sd	s0,48(sp)
ffffffffc020a25c:	f426                	sd	s1,40(sp)
ffffffffc020a25e:	ec4e                	sd	s3,24(sp)
ffffffffc020a260:	04090e63          	beqz	s2,ffffffffc020a2bc <sfs_write+0x6c>
ffffffffc020a264:	0b092783          	lw	a5,176(s2)
ffffffffc020a268:	ebb1                	bnez	a5,ffffffffc020a2bc <sfs_write+0x6c>
ffffffffc020a26a:	4d38                	lw	a4,88(a0)
ffffffffc020a26c:	6785                	lui	a5,0x1
ffffffffc020a26e:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a272:	842a                	mv	s0,a0
ffffffffc020a274:	06f71463          	bne	a4,a5,ffffffffc020a2dc <sfs_write+0x8c>
ffffffffc020a278:	02050993          	addi	s3,a0,32
ffffffffc020a27c:	854e                	mv	a0,s3
ffffffffc020a27e:	84ae                	mv	s1,a1
ffffffffc020a280:	bc2fa0ef          	jal	ffffffffc0204642 <down>
ffffffffc020a284:	6c9c                	ld	a5,24(s1)
ffffffffc020a286:	6494                	ld	a3,8(s1)
ffffffffc020a288:	6090                	ld	a2,0(s1)
ffffffffc020a28a:	85a2                	mv	a1,s0
ffffffffc020a28c:	e43e                	sd	a5,8(sp)
ffffffffc020a28e:	854a                	mv	a0,s2
ffffffffc020a290:	0038                	addi	a4,sp,8
ffffffffc020a292:	4785                	li	a5,1
ffffffffc020a294:	d19ff0ef          	jal	ffffffffc0209fac <sfs_io_nolock>
ffffffffc020a298:	65a2                	ld	a1,8(sp)
ffffffffc020a29a:	842a                	mv	s0,a0
ffffffffc020a29c:	ed81                	bnez	a1,ffffffffc020a2b4 <sfs_write+0x64>
ffffffffc020a29e:	854e                	mv	a0,s3
ffffffffc020a2a0:	b9efa0ef          	jal	ffffffffc020463e <up>
ffffffffc020a2a4:	70e2                	ld	ra,56(sp)
ffffffffc020a2a6:	8522                	mv	a0,s0
ffffffffc020a2a8:	7442                	ld	s0,48(sp)
ffffffffc020a2aa:	74a2                	ld	s1,40(sp)
ffffffffc020a2ac:	7902                	ld	s2,32(sp)
ffffffffc020a2ae:	69e2                	ld	s3,24(sp)
ffffffffc020a2b0:	6121                	addi	sp,sp,64
ffffffffc020a2b2:	8082                	ret
ffffffffc020a2b4:	8526                	mv	a0,s1
ffffffffc020a2b6:	ab0fb0ef          	jal	ffffffffc0205566 <iobuf_skip>
ffffffffc020a2ba:	b7d5                	j	ffffffffc020a29e <sfs_write+0x4e>
ffffffffc020a2bc:	00004697          	auipc	a3,0x4
ffffffffc020a2c0:	1d468693          	addi	a3,a3,468 # ffffffffc020e490 <etext+0x2d7c>
ffffffffc020a2c4:	00002617          	auipc	a2,0x2
ffffffffc020a2c8:	88c60613          	addi	a2,a2,-1908 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a2cc:	29500593          	li	a1,661
ffffffffc020a2d0:	00004517          	auipc	a0,0x4
ffffffffc020a2d4:	3a050513          	addi	a0,a0,928 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a2d8:	972f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a2dc:	f84ff0ef          	jal	ffffffffc0209a60 <sfs_io.part.0>

ffffffffc020a2e0 <sfs_dirent_read_nolock>:
ffffffffc020a2e0:	619c                	ld	a5,0(a1)
ffffffffc020a2e2:	7139                	addi	sp,sp,-64
ffffffffc020a2e4:	f426                	sd	s1,40(sp)
ffffffffc020a2e6:	84b6                	mv	s1,a3
ffffffffc020a2e8:	0047d683          	lhu	a3,4(a5)
ffffffffc020a2ec:	fc06                	sd	ra,56(sp)
ffffffffc020a2ee:	f822                	sd	s0,48(sp)
ffffffffc020a2f0:	4709                	li	a4,2
ffffffffc020a2f2:	04e69963          	bne	a3,a4,ffffffffc020a344 <sfs_dirent_read_nolock+0x64>
ffffffffc020a2f6:	479c                	lw	a5,8(a5)
ffffffffc020a2f8:	04f67663          	bgeu	a2,a5,ffffffffc020a344 <sfs_dirent_read_nolock+0x64>
ffffffffc020a2fc:	0874                	addi	a3,sp,28
ffffffffc020a2fe:	842a                	mv	s0,a0
ffffffffc020a300:	a41ff0ef          	jal	ffffffffc0209d40 <sfs_bmap_load_nolock>
ffffffffc020a304:	c511                	beqz	a0,ffffffffc020a310 <sfs_dirent_read_nolock+0x30>
ffffffffc020a306:	70e2                	ld	ra,56(sp)
ffffffffc020a308:	7442                	ld	s0,48(sp)
ffffffffc020a30a:	74a2                	ld	s1,40(sp)
ffffffffc020a30c:	6121                	addi	sp,sp,64
ffffffffc020a30e:	8082                	ret
ffffffffc020a310:	45f2                	lw	a1,28(sp)
ffffffffc020a312:	c9a9                	beqz	a1,ffffffffc020a364 <sfs_dirent_read_nolock+0x84>
ffffffffc020a314:	405c                	lw	a5,4(s0)
ffffffffc020a316:	04f5f763          	bgeu	a1,a5,ffffffffc020a364 <sfs_dirent_read_nolock+0x84>
ffffffffc020a31a:	7c08                	ld	a0,56(s0)
ffffffffc020a31c:	e42e                	sd	a1,8(sp)
ffffffffc020a31e:	e37fe0ef          	jal	ffffffffc0209154 <bitmap_test>
ffffffffc020a322:	ed39                	bnez	a0,ffffffffc020a380 <sfs_dirent_read_nolock+0xa0>
ffffffffc020a324:	66a2                	ld	a3,8(sp)
ffffffffc020a326:	8522                	mv	a0,s0
ffffffffc020a328:	4701                	li	a4,0
ffffffffc020a32a:	10400613          	li	a2,260
ffffffffc020a32e:	85a6                	mv	a1,s1
ffffffffc020a330:	3ed000ef          	jal	ffffffffc020af1c <sfs_rbuf>
ffffffffc020a334:	f969                	bnez	a0,ffffffffc020a306 <sfs_dirent_read_nolock+0x26>
ffffffffc020a336:	100481a3          	sb	zero,259(s1)
ffffffffc020a33a:	70e2                	ld	ra,56(sp)
ffffffffc020a33c:	7442                	ld	s0,48(sp)
ffffffffc020a33e:	74a2                	ld	s1,40(sp)
ffffffffc020a340:	6121                	addi	sp,sp,64
ffffffffc020a342:	8082                	ret
ffffffffc020a344:	00004697          	auipc	a3,0x4
ffffffffc020a348:	4bc68693          	addi	a3,a3,1212 # ffffffffc020e800 <etext+0x30ec>
ffffffffc020a34c:	00002617          	auipc	a2,0x2
ffffffffc020a350:	80460613          	addi	a2,a2,-2044 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a354:	18f00593          	li	a1,399
ffffffffc020a358:	00004517          	auipc	a0,0x4
ffffffffc020a35c:	31850513          	addi	a0,a0,792 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a360:	8eaf60ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a364:	4054                	lw	a3,4(s0)
ffffffffc020a366:	872e                	mv	a4,a1
ffffffffc020a368:	00004617          	auipc	a2,0x4
ffffffffc020a36c:	33860613          	addi	a2,a2,824 # ffffffffc020e6a0 <etext+0x2f8c>
ffffffffc020a370:	05300593          	li	a1,83
ffffffffc020a374:	00004517          	auipc	a0,0x4
ffffffffc020a378:	2fc50513          	addi	a0,a0,764 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a37c:	8cef60ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a380:	00004697          	auipc	a3,0x4
ffffffffc020a384:	35868693          	addi	a3,a3,856 # ffffffffc020e6d8 <etext+0x2fc4>
ffffffffc020a388:	00001617          	auipc	a2,0x1
ffffffffc020a38c:	7c860613          	addi	a2,a2,1992 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a390:	19600593          	li	a1,406
ffffffffc020a394:	00004517          	auipc	a0,0x4
ffffffffc020a398:	2dc50513          	addi	a0,a0,732 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a39c:	8aef60ef          	jal	ffffffffc020044a <__panic>

ffffffffc020a3a0 <sfs_getdirentry>:
ffffffffc020a3a0:	715d                	addi	sp,sp,-80
ffffffffc020a3a2:	f052                	sd	s4,32(sp)
ffffffffc020a3a4:	8a2a                	mv	s4,a0
ffffffffc020a3a6:	10400513          	li	a0,260
ffffffffc020a3aa:	e85a                	sd	s6,16(sp)
ffffffffc020a3ac:	e486                	sd	ra,72(sp)
ffffffffc020a3ae:	e0a2                	sd	s0,64(sp)
ffffffffc020a3b0:	8b2e                	mv	s6,a1
ffffffffc020a3b2:	c0ff70ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc020a3b6:	0e050963          	beqz	a0,ffffffffc020a4a8 <sfs_getdirentry+0x108>
ffffffffc020a3ba:	ec56                	sd	s5,24(sp)
ffffffffc020a3bc:	068a3a83          	ld	s5,104(s4)
ffffffffc020a3c0:	0e0a8663          	beqz	s5,ffffffffc020a4ac <sfs_getdirentry+0x10c>
ffffffffc020a3c4:	0b0aa783          	lw	a5,176(s5)
ffffffffc020a3c8:	0e079263          	bnez	a5,ffffffffc020a4ac <sfs_getdirentry+0x10c>
ffffffffc020a3cc:	058a2703          	lw	a4,88(s4)
ffffffffc020a3d0:	6785                	lui	a5,0x1
ffffffffc020a3d2:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a3d6:	10f71063          	bne	a4,a5,ffffffffc020a4d6 <sfs_getdirentry+0x136>
ffffffffc020a3da:	f44e                	sd	s3,40(sp)
ffffffffc020a3dc:	57fd                	li	a5,-1
ffffffffc020a3de:	008b3983          	ld	s3,8(s6) # 1008 <_binary_bin_swap_img_size-0x6cf8>
ffffffffc020a3e2:	17fe                	slli	a5,a5,0x3f
ffffffffc020a3e4:	0ff78793          	addi	a5,a5,255
ffffffffc020a3e8:	00f9f7b3          	and	a5,s3,a5
ffffffffc020a3ec:	e3d5                	bnez	a5,ffffffffc020a490 <sfs_getdirentry+0xf0>
ffffffffc020a3ee:	000a3783          	ld	a5,0(s4)
ffffffffc020a3f2:	0089d993          	srli	s3,s3,0x8
ffffffffc020a3f6:	2981                	sext.w	s3,s3
ffffffffc020a3f8:	479c                	lw	a5,8(a5)
ffffffffc020a3fa:	0b37e163          	bltu	a5,s3,ffffffffc020a49c <sfs_getdirentry+0xfc>
ffffffffc020a3fe:	f84a                	sd	s2,48(sp)
ffffffffc020a400:	892a                	mv	s2,a0
ffffffffc020a402:	020a0513          	addi	a0,s4,32
ffffffffc020a406:	e45e                	sd	s7,8(sp)
ffffffffc020a408:	a3afa0ef          	jal	ffffffffc0204642 <down>
ffffffffc020a40c:	000a3783          	ld	a5,0(s4)
ffffffffc020a410:	0087ab83          	lw	s7,8(a5)
ffffffffc020a414:	07705c63          	blez	s7,ffffffffc020a48c <sfs_getdirentry+0xec>
ffffffffc020a418:	fc26                	sd	s1,56(sp)
ffffffffc020a41a:	4481                	li	s1,0
ffffffffc020a41c:	a811                	j	ffffffffc020a430 <sfs_getdirentry+0x90>
ffffffffc020a41e:	00092783          	lw	a5,0(s2)
ffffffffc020a422:	c781                	beqz	a5,ffffffffc020a42a <sfs_getdirentry+0x8a>
ffffffffc020a424:	02098463          	beqz	s3,ffffffffc020a44c <sfs_getdirentry+0xac>
ffffffffc020a428:	39fd                	addiw	s3,s3,-1
ffffffffc020a42a:	2485                	addiw	s1,s1,1
ffffffffc020a42c:	049b8d63          	beq	s7,s1,ffffffffc020a486 <sfs_getdirentry+0xe6>
ffffffffc020a430:	86ca                	mv	a3,s2
ffffffffc020a432:	8626                	mv	a2,s1
ffffffffc020a434:	85d2                	mv	a1,s4
ffffffffc020a436:	8556                	mv	a0,s5
ffffffffc020a438:	ea9ff0ef          	jal	ffffffffc020a2e0 <sfs_dirent_read_nolock>
ffffffffc020a43c:	842a                	mv	s0,a0
ffffffffc020a43e:	d165                	beqz	a0,ffffffffc020a41e <sfs_getdirentry+0x7e>
ffffffffc020a440:	74e2                	ld	s1,56(sp)
ffffffffc020a442:	020a0513          	addi	a0,s4,32
ffffffffc020a446:	9f8fa0ef          	jal	ffffffffc020463e <up>
ffffffffc020a44a:	a005                	j	ffffffffc020a46a <sfs_getdirentry+0xca>
ffffffffc020a44c:	020a0513          	addi	a0,s4,32
ffffffffc020a450:	9eefa0ef          	jal	ffffffffc020463e <up>
ffffffffc020a454:	855a                	mv	a0,s6
ffffffffc020a456:	00490593          	addi	a1,s2,4
ffffffffc020a45a:	4701                	li	a4,0
ffffffffc020a45c:	4685                	li	a3,1
ffffffffc020a45e:	10000613          	li	a2,256
ffffffffc020a462:	880fb0ef          	jal	ffffffffc02054e2 <iobuf_move>
ffffffffc020a466:	74e2                	ld	s1,56(sp)
ffffffffc020a468:	842a                	mv	s0,a0
ffffffffc020a46a:	854a                	mv	a0,s2
ffffffffc020a46c:	bfbf70ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020a470:	7942                	ld	s2,48(sp)
ffffffffc020a472:	79a2                	ld	s3,40(sp)
ffffffffc020a474:	6ae2                	ld	s5,24(sp)
ffffffffc020a476:	6ba2                	ld	s7,8(sp)
ffffffffc020a478:	60a6                	ld	ra,72(sp)
ffffffffc020a47a:	8522                	mv	a0,s0
ffffffffc020a47c:	6406                	ld	s0,64(sp)
ffffffffc020a47e:	7a02                	ld	s4,32(sp)
ffffffffc020a480:	6b42                	ld	s6,16(sp)
ffffffffc020a482:	6161                	addi	sp,sp,80
ffffffffc020a484:	8082                	ret
ffffffffc020a486:	74e2                	ld	s1,56(sp)
ffffffffc020a488:	5441                	li	s0,-16
ffffffffc020a48a:	bf65                	j	ffffffffc020a442 <sfs_getdirentry+0xa2>
ffffffffc020a48c:	5441                	li	s0,-16
ffffffffc020a48e:	bf55                	j	ffffffffc020a442 <sfs_getdirentry+0xa2>
ffffffffc020a490:	bd7f70ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020a494:	5475                	li	s0,-3
ffffffffc020a496:	79a2                	ld	s3,40(sp)
ffffffffc020a498:	6ae2                	ld	s5,24(sp)
ffffffffc020a49a:	bff9                	j	ffffffffc020a478 <sfs_getdirentry+0xd8>
ffffffffc020a49c:	bcbf70ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020a4a0:	5441                	li	s0,-16
ffffffffc020a4a2:	79a2                	ld	s3,40(sp)
ffffffffc020a4a4:	6ae2                	ld	s5,24(sp)
ffffffffc020a4a6:	bfc9                	j	ffffffffc020a478 <sfs_getdirentry+0xd8>
ffffffffc020a4a8:	5471                	li	s0,-4
ffffffffc020a4aa:	b7f9                	j	ffffffffc020a478 <sfs_getdirentry+0xd8>
ffffffffc020a4ac:	00004697          	auipc	a3,0x4
ffffffffc020a4b0:	fe468693          	addi	a3,a3,-28 # ffffffffc020e490 <etext+0x2d7c>
ffffffffc020a4b4:	00001617          	auipc	a2,0x1
ffffffffc020a4b8:	69c60613          	addi	a2,a2,1692 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a4bc:	33900593          	li	a1,825
ffffffffc020a4c0:	00004517          	auipc	a0,0x4
ffffffffc020a4c4:	1b050513          	addi	a0,a0,432 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a4c8:	fc26                	sd	s1,56(sp)
ffffffffc020a4ca:	f84a                	sd	s2,48(sp)
ffffffffc020a4cc:	f44e                	sd	s3,40(sp)
ffffffffc020a4ce:	e45e                	sd	s7,8(sp)
ffffffffc020a4d0:	e062                	sd	s8,0(sp)
ffffffffc020a4d2:	f79f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a4d6:	00004697          	auipc	a3,0x4
ffffffffc020a4da:	16268693          	addi	a3,a3,354 # ffffffffc020e638 <etext+0x2f24>
ffffffffc020a4de:	00001617          	auipc	a2,0x1
ffffffffc020a4e2:	67260613          	addi	a2,a2,1650 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a4e6:	33a00593          	li	a1,826
ffffffffc020a4ea:	00004517          	auipc	a0,0x4
ffffffffc020a4ee:	18650513          	addi	a0,a0,390 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a4f2:	fc26                	sd	s1,56(sp)
ffffffffc020a4f4:	f84a                	sd	s2,48(sp)
ffffffffc020a4f6:	f44e                	sd	s3,40(sp)
ffffffffc020a4f8:	e45e                	sd	s7,8(sp)
ffffffffc020a4fa:	e062                	sd	s8,0(sp)
ffffffffc020a4fc:	f4ff50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020a500 <sfs_truncfile>:
ffffffffc020a500:	080007b7          	lui	a5,0x8000
ffffffffc020a504:	1ab7eb63          	bltu	a5,a1,ffffffffc020a6ba <sfs_truncfile+0x1ba>
ffffffffc020a508:	7159                	addi	sp,sp,-112
ffffffffc020a50a:	e0d2                	sd	s4,64(sp)
ffffffffc020a50c:	06853a03          	ld	s4,104(a0)
ffffffffc020a510:	e8ca                	sd	s2,80(sp)
ffffffffc020a512:	e4ce                	sd	s3,72(sp)
ffffffffc020a514:	f486                	sd	ra,104(sp)
ffffffffc020a516:	f0a2                	sd	s0,96(sp)
ffffffffc020a518:	fc56                	sd	s5,56(sp)
ffffffffc020a51a:	892a                	mv	s2,a0
ffffffffc020a51c:	89ae                	mv	s3,a1
ffffffffc020a51e:	1a0a0163          	beqz	s4,ffffffffc020a6c0 <sfs_truncfile+0x1c0>
ffffffffc020a522:	0b0a2783          	lw	a5,176(s4)
ffffffffc020a526:	18079d63          	bnez	a5,ffffffffc020a6c0 <sfs_truncfile+0x1c0>
ffffffffc020a52a:	4d38                	lw	a4,88(a0)
ffffffffc020a52c:	6785                	lui	a5,0x1
ffffffffc020a52e:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a532:	6405                	lui	s0,0x1
ffffffffc020a534:	1cf71963          	bne	a4,a5,ffffffffc020a706 <sfs_truncfile+0x206>
ffffffffc020a538:	00053a83          	ld	s5,0(a0)
ffffffffc020a53c:	147d                	addi	s0,s0,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc020a53e:	942e                	add	s0,s0,a1
ffffffffc020a540:	000ae783          	lwu	a5,0(s5)
ffffffffc020a544:	8031                	srli	s0,s0,0xc
ffffffffc020a546:	2401                	sext.w	s0,s0
ffffffffc020a548:	02b79063          	bne	a5,a1,ffffffffc020a568 <sfs_truncfile+0x68>
ffffffffc020a54c:	008aa703          	lw	a4,8(s5)
ffffffffc020a550:	4781                	li	a5,0
ffffffffc020a552:	1c871c63          	bne	a4,s0,ffffffffc020a72a <sfs_truncfile+0x22a>
ffffffffc020a556:	70a6                	ld	ra,104(sp)
ffffffffc020a558:	7406                	ld	s0,96(sp)
ffffffffc020a55a:	6946                	ld	s2,80(sp)
ffffffffc020a55c:	69a6                	ld	s3,72(sp)
ffffffffc020a55e:	6a06                	ld	s4,64(sp)
ffffffffc020a560:	7ae2                	ld	s5,56(sp)
ffffffffc020a562:	853e                	mv	a0,a5
ffffffffc020a564:	6165                	addi	sp,sp,112
ffffffffc020a566:	8082                	ret
ffffffffc020a568:	02050513          	addi	a0,a0,32
ffffffffc020a56c:	eca6                	sd	s1,88(sp)
ffffffffc020a56e:	8d4fa0ef          	jal	ffffffffc0204642 <down>
ffffffffc020a572:	008aa483          	lw	s1,8(s5)
ffffffffc020a576:	0c84e363          	bltu	s1,s0,ffffffffc020a63c <sfs_truncfile+0x13c>
ffffffffc020a57a:	0c947e63          	bgeu	s0,s1,ffffffffc020a656 <sfs_truncfile+0x156>
ffffffffc020a57e:	48ad                	li	a7,11
ffffffffc020a580:	4305                	li	t1,1
ffffffffc020a582:	a895                	j	ffffffffc020a5f6 <sfs_truncfile+0xf6>
ffffffffc020a584:	37cd                	addiw	a5,a5,-13
ffffffffc020a586:	3ff00693          	li	a3,1023
ffffffffc020a58a:	04f6ef63          	bltu	a3,a5,ffffffffc020a5e8 <sfs_truncfile+0xe8>
ffffffffc020a58e:	03c82683          	lw	a3,60(a6)
ffffffffc020a592:	cab9                	beqz	a3,ffffffffc020a5e8 <sfs_truncfile+0xe8>
ffffffffc020a594:	004a2603          	lw	a2,4(s4)
ffffffffc020a598:	1ac6fb63          	bgeu	a3,a2,ffffffffc020a74e <sfs_truncfile+0x24e>
ffffffffc020a59c:	038a3503          	ld	a0,56(s4)
ffffffffc020a5a0:	85b6                	mv	a1,a3
ffffffffc020a5a2:	e436                	sd	a3,8(sp)
ffffffffc020a5a4:	e842                	sd	a6,16(sp)
ffffffffc020a5a6:	ec3e                	sd	a5,24(sp)
ffffffffc020a5a8:	badfe0ef          	jal	ffffffffc0209154 <bitmap_test>
ffffffffc020a5ac:	66a2                	ld	a3,8(sp)
ffffffffc020a5ae:	6842                	ld	a6,16(sp)
ffffffffc020a5b0:	67e2                	ld	a5,24(sp)
ffffffffc020a5b2:	1a051d63          	bnez	a0,ffffffffc020a76c <sfs_truncfile+0x26c>
ffffffffc020a5b6:	02079613          	slli	a2,a5,0x20
ffffffffc020a5ba:	01e65713          	srli	a4,a2,0x1e
ffffffffc020a5be:	102c                	addi	a1,sp,40
ffffffffc020a5c0:	4611                	li	a2,4
ffffffffc020a5c2:	8552                	mv	a0,s4
ffffffffc020a5c4:	ec42                	sd	a6,24(sp)
ffffffffc020a5c6:	e83a                	sd	a4,16(sp)
ffffffffc020a5c8:	e436                	sd	a3,8(sp)
ffffffffc020a5ca:	d602                	sw	zero,44(sp)
ffffffffc020a5cc:	151000ef          	jal	ffffffffc020af1c <sfs_rbuf>
ffffffffc020a5d0:	87aa                	mv	a5,a0
ffffffffc020a5d2:	e941                	bnez	a0,ffffffffc020a662 <sfs_truncfile+0x162>
ffffffffc020a5d4:	57a2                	lw	a5,40(sp)
ffffffffc020a5d6:	66a2                	ld	a3,8(sp)
ffffffffc020a5d8:	6742                	ld	a4,16(sp)
ffffffffc020a5da:	6862                	ld	a6,24(sp)
ffffffffc020a5dc:	48ad                	li	a7,11
ffffffffc020a5de:	4305                	li	t1,1
ffffffffc020a5e0:	ebd5                	bnez	a5,ffffffffc020a694 <sfs_truncfile+0x194>
ffffffffc020a5e2:	00882703          	lw	a4,8(a6)
ffffffffc020a5e6:	377d                	addiw	a4,a4,-1
ffffffffc020a5e8:	00e82423          	sw	a4,8(a6)
ffffffffc020a5ec:	00693823          	sd	t1,16(s2)
ffffffffc020a5f0:	34fd                	addiw	s1,s1,-1
ffffffffc020a5f2:	04940e63          	beq	s0,s1,ffffffffc020a64e <sfs_truncfile+0x14e>
ffffffffc020a5f6:	00093803          	ld	a6,0(s2)
ffffffffc020a5fa:	00882783          	lw	a5,8(a6)
ffffffffc020a5fe:	0e078363          	beqz	a5,ffffffffc020a6e4 <sfs_truncfile+0x1e4>
ffffffffc020a602:	fff7871b          	addiw	a4,a5,-1
ffffffffc020a606:	f6e8efe3          	bltu	a7,a4,ffffffffc020a584 <sfs_truncfile+0x84>
ffffffffc020a60a:	02071693          	slli	a3,a4,0x20
ffffffffc020a60e:	01e6d793          	srli	a5,a3,0x1e
ffffffffc020a612:	97c2                	add	a5,a5,a6
ffffffffc020a614:	47cc                	lw	a1,12(a5)
ffffffffc020a616:	d9e9                	beqz	a1,ffffffffc020a5e8 <sfs_truncfile+0xe8>
ffffffffc020a618:	8552                	mv	a0,s4
ffffffffc020a61a:	e83e                	sd	a5,16(sp)
ffffffffc020a61c:	e442                	sd	a6,8(sp)
ffffffffc020a61e:	c66ff0ef          	jal	ffffffffc0209a84 <sfs_block_free>
ffffffffc020a622:	67c2                	ld	a5,16(sp)
ffffffffc020a624:	6822                	ld	a6,8(sp)
ffffffffc020a626:	48ad                	li	a7,11
ffffffffc020a628:	0007a623          	sw	zero,12(a5)
ffffffffc020a62c:	00882703          	lw	a4,8(a6)
ffffffffc020a630:	4305                	li	t1,1
ffffffffc020a632:	377d                	addiw	a4,a4,-1
ffffffffc020a634:	bf55                	j	ffffffffc020a5e8 <sfs_truncfile+0xe8>
ffffffffc020a636:	2485                	addiw	s1,s1,1
ffffffffc020a638:	00940b63          	beq	s0,s1,ffffffffc020a64e <sfs_truncfile+0x14e>
ffffffffc020a63c:	4681                	li	a3,0
ffffffffc020a63e:	8626                	mv	a2,s1
ffffffffc020a640:	85ca                	mv	a1,s2
ffffffffc020a642:	8552                	mv	a0,s4
ffffffffc020a644:	efcff0ef          	jal	ffffffffc0209d40 <sfs_bmap_load_nolock>
ffffffffc020a648:	87aa                	mv	a5,a0
ffffffffc020a64a:	d575                	beqz	a0,ffffffffc020a636 <sfs_truncfile+0x136>
ffffffffc020a64c:	a819                	j	ffffffffc020a662 <sfs_truncfile+0x162>
ffffffffc020a64e:	008aa783          	lw	a5,8(s5)
ffffffffc020a652:	02879063          	bne	a5,s0,ffffffffc020a672 <sfs_truncfile+0x172>
ffffffffc020a656:	4785                	li	a5,1
ffffffffc020a658:	013aa023          	sw	s3,0(s5)
ffffffffc020a65c:	00f93823          	sd	a5,16(s2)
ffffffffc020a660:	4781                	li	a5,0
ffffffffc020a662:	02090513          	addi	a0,s2,32
ffffffffc020a666:	e43e                	sd	a5,8(sp)
ffffffffc020a668:	fd7f90ef          	jal	ffffffffc020463e <up>
ffffffffc020a66c:	67a2                	ld	a5,8(sp)
ffffffffc020a66e:	64e6                	ld	s1,88(sp)
ffffffffc020a670:	b5dd                	j	ffffffffc020a556 <sfs_truncfile+0x56>
ffffffffc020a672:	00004697          	auipc	a3,0x4
ffffffffc020a676:	24668693          	addi	a3,a3,582 # ffffffffc020e8b8 <etext+0x31a4>
ffffffffc020a67a:	00001617          	auipc	a2,0x1
ffffffffc020a67e:	4d660613          	addi	a2,a2,1238 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a682:	3c900593          	li	a1,969
ffffffffc020a686:	00004517          	auipc	a0,0x4
ffffffffc020a68a:	fea50513          	addi	a0,a0,-22 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a68e:	f85a                	sd	s6,48(sp)
ffffffffc020a690:	dbbf50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a694:	4611                	li	a2,4
ffffffffc020a696:	106c                	addi	a1,sp,44
ffffffffc020a698:	8552                	mv	a0,s4
ffffffffc020a69a:	e442                	sd	a6,8(sp)
ffffffffc020a69c:	101000ef          	jal	ffffffffc020af9c <sfs_wbuf>
ffffffffc020a6a0:	87aa                	mv	a5,a0
ffffffffc020a6a2:	f161                	bnez	a0,ffffffffc020a662 <sfs_truncfile+0x162>
ffffffffc020a6a4:	55a2                	lw	a1,40(sp)
ffffffffc020a6a6:	8552                	mv	a0,s4
ffffffffc020a6a8:	bdcff0ef          	jal	ffffffffc0209a84 <sfs_block_free>
ffffffffc020a6ac:	6822                	ld	a6,8(sp)
ffffffffc020a6ae:	4305                	li	t1,1
ffffffffc020a6b0:	48ad                	li	a7,11
ffffffffc020a6b2:	00882703          	lw	a4,8(a6)
ffffffffc020a6b6:	377d                	addiw	a4,a4,-1
ffffffffc020a6b8:	bf05                	j	ffffffffc020a5e8 <sfs_truncfile+0xe8>
ffffffffc020a6ba:	57f5                	li	a5,-3
ffffffffc020a6bc:	853e                	mv	a0,a5
ffffffffc020a6be:	8082                	ret
ffffffffc020a6c0:	00004697          	auipc	a3,0x4
ffffffffc020a6c4:	dd068693          	addi	a3,a3,-560 # ffffffffc020e490 <etext+0x2d7c>
ffffffffc020a6c8:	00001617          	auipc	a2,0x1
ffffffffc020a6cc:	48860613          	addi	a2,a2,1160 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a6d0:	3a800593          	li	a1,936
ffffffffc020a6d4:	00004517          	auipc	a0,0x4
ffffffffc020a6d8:	f9c50513          	addi	a0,a0,-100 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a6dc:	eca6                	sd	s1,88(sp)
ffffffffc020a6de:	f85a                	sd	s6,48(sp)
ffffffffc020a6e0:	d6bf50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a6e4:	00004697          	auipc	a3,0x4
ffffffffc020a6e8:	18468693          	addi	a3,a3,388 # ffffffffc020e868 <etext+0x3154>
ffffffffc020a6ec:	00001617          	auipc	a2,0x1
ffffffffc020a6f0:	46460613          	addi	a2,a2,1124 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a6f4:	17c00593          	li	a1,380
ffffffffc020a6f8:	00004517          	auipc	a0,0x4
ffffffffc020a6fc:	f7850513          	addi	a0,a0,-136 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a700:	f85a                	sd	s6,48(sp)
ffffffffc020a702:	d49f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a706:	00004697          	auipc	a3,0x4
ffffffffc020a70a:	f3268693          	addi	a3,a3,-206 # ffffffffc020e638 <etext+0x2f24>
ffffffffc020a70e:	00001617          	auipc	a2,0x1
ffffffffc020a712:	44260613          	addi	a2,a2,1090 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a716:	3a900593          	li	a1,937
ffffffffc020a71a:	00004517          	auipc	a0,0x4
ffffffffc020a71e:	f5650513          	addi	a0,a0,-170 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a722:	eca6                	sd	s1,88(sp)
ffffffffc020a724:	f85a                	sd	s6,48(sp)
ffffffffc020a726:	d25f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a72a:	00004697          	auipc	a3,0x4
ffffffffc020a72e:	12668693          	addi	a3,a3,294 # ffffffffc020e850 <etext+0x313c>
ffffffffc020a732:	00001617          	auipc	a2,0x1
ffffffffc020a736:	41e60613          	addi	a2,a2,1054 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a73a:	3b000593          	li	a1,944
ffffffffc020a73e:	00004517          	auipc	a0,0x4
ffffffffc020a742:	f3250513          	addi	a0,a0,-206 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a746:	eca6                	sd	s1,88(sp)
ffffffffc020a748:	f85a                	sd	s6,48(sp)
ffffffffc020a74a:	d01f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a74e:	8736                	mv	a4,a3
ffffffffc020a750:	05300593          	li	a1,83
ffffffffc020a754:	86b2                	mv	a3,a2
ffffffffc020a756:	00004517          	auipc	a0,0x4
ffffffffc020a75a:	f1a50513          	addi	a0,a0,-230 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a75e:	00004617          	auipc	a2,0x4
ffffffffc020a762:	f4260613          	addi	a2,a2,-190 # ffffffffc020e6a0 <etext+0x2f8c>
ffffffffc020a766:	f85a                	sd	s6,48(sp)
ffffffffc020a768:	ce3f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a76c:	00004697          	auipc	a3,0x4
ffffffffc020a770:	11468693          	addi	a3,a3,276 # ffffffffc020e880 <etext+0x316c>
ffffffffc020a774:	00001617          	auipc	a2,0x1
ffffffffc020a778:	3dc60613          	addi	a2,a2,988 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a77c:	12b00593          	li	a1,299
ffffffffc020a780:	00004517          	auipc	a0,0x4
ffffffffc020a784:	ef050513          	addi	a0,a0,-272 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a788:	f85a                	sd	s6,48(sp)
ffffffffc020a78a:	cc1f50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020a78e <sfs_load_inode>:
ffffffffc020a78e:	7139                	addi	sp,sp,-64
ffffffffc020a790:	fc06                	sd	ra,56(sp)
ffffffffc020a792:	f822                	sd	s0,48(sp)
ffffffffc020a794:	f426                	sd	s1,40(sp)
ffffffffc020a796:	f04a                	sd	s2,32(sp)
ffffffffc020a798:	84b2                	mv	s1,a2
ffffffffc020a79a:	892a                	mv	s2,a0
ffffffffc020a79c:	ec4e                	sd	s3,24(sp)
ffffffffc020a79e:	89ae                	mv	s3,a1
ffffffffc020a7a0:	1b1000ef          	jal	ffffffffc020b150 <lock_sfs_fs>
ffffffffc020a7a4:	8526                	mv	a0,s1
ffffffffc020a7a6:	45a9                	li	a1,10
ffffffffc020a7a8:	0a893403          	ld	s0,168(s2)
ffffffffc020a7ac:	1c5000ef          	jal	ffffffffc020b170 <hash32>
ffffffffc020a7b0:	02051793          	slli	a5,a0,0x20
ffffffffc020a7b4:	01c7d513          	srli	a0,a5,0x1c
ffffffffc020a7b8:	00a406b3          	add	a3,s0,a0
ffffffffc020a7bc:	87b6                	mv	a5,a3
ffffffffc020a7be:	a029                	j	ffffffffc020a7c8 <sfs_load_inode+0x3a>
ffffffffc020a7c0:	fc07a703          	lw	a4,-64(a5)
ffffffffc020a7c4:	10970563          	beq	a4,s1,ffffffffc020a8ce <sfs_load_inode+0x140>
ffffffffc020a7c8:	679c                	ld	a5,8(a5)
ffffffffc020a7ca:	fef69be3          	bne	a3,a5,ffffffffc020a7c0 <sfs_load_inode+0x32>
ffffffffc020a7ce:	04000513          	li	a0,64
ffffffffc020a7d2:	feef70ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc020a7d6:	87aa                	mv	a5,a0
ffffffffc020a7d8:	10050b63          	beqz	a0,ffffffffc020a8ee <sfs_load_inode+0x160>
ffffffffc020a7dc:	14048f63          	beqz	s1,ffffffffc020a93a <sfs_load_inode+0x1ac>
ffffffffc020a7e0:	00492703          	lw	a4,4(s2)
ffffffffc020a7e4:	14e4fb63          	bgeu	s1,a4,ffffffffc020a93a <sfs_load_inode+0x1ac>
ffffffffc020a7e8:	03893503          	ld	a0,56(s2)
ffffffffc020a7ec:	85a6                	mv	a1,s1
ffffffffc020a7ee:	e43e                	sd	a5,8(sp)
ffffffffc020a7f0:	965fe0ef          	jal	ffffffffc0209154 <bitmap_test>
ffffffffc020a7f4:	16051263          	bnez	a0,ffffffffc020a958 <sfs_load_inode+0x1ca>
ffffffffc020a7f8:	65a2                	ld	a1,8(sp)
ffffffffc020a7fa:	4701                	li	a4,0
ffffffffc020a7fc:	86a6                	mv	a3,s1
ffffffffc020a7fe:	04000613          	li	a2,64
ffffffffc020a802:	854a                	mv	a0,s2
ffffffffc020a804:	718000ef          	jal	ffffffffc020af1c <sfs_rbuf>
ffffffffc020a808:	67a2                	ld	a5,8(sp)
ffffffffc020a80a:	842a                	mv	s0,a0
ffffffffc020a80c:	0e051e63          	bnez	a0,ffffffffc020a908 <sfs_load_inode+0x17a>
ffffffffc020a810:	0067d703          	lhu	a4,6(a5)
ffffffffc020a814:	10070363          	beqz	a4,ffffffffc020a91a <sfs_load_inode+0x18c>
ffffffffc020a818:	6505                	lui	a0,0x1
ffffffffc020a81a:	23550513          	addi	a0,a0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a81e:	e43e                	sd	a5,8(sp)
ffffffffc020a820:	8aafd0ef          	jal	ffffffffc02078ca <__alloc_inode>
ffffffffc020a824:	67a2                	ld	a5,8(sp)
ffffffffc020a826:	842a                	mv	s0,a0
ffffffffc020a828:	cd79                	beqz	a0,ffffffffc020a906 <sfs_load_inode+0x178>
ffffffffc020a82a:	0047d683          	lhu	a3,4(a5)
ffffffffc020a82e:	4705                	li	a4,1
ffffffffc020a830:	0ee68063          	beq	a3,a4,ffffffffc020a910 <sfs_load_inode+0x182>
ffffffffc020a834:	4709                	li	a4,2
ffffffffc020a836:	00005597          	auipc	a1,0x5
ffffffffc020a83a:	dfa58593          	addi	a1,a1,-518 # ffffffffc020f630 <sfs_node_dirops>
ffffffffc020a83e:	16e69d63          	bne	a3,a4,ffffffffc020a9b8 <sfs_load_inode+0x22a>
ffffffffc020a842:	864a                	mv	a2,s2
ffffffffc020a844:	8522                	mv	a0,s0
ffffffffc020a846:	e43e                	sd	a5,8(sp)
ffffffffc020a848:	89efd0ef          	jal	ffffffffc02078e6 <inode_init>
ffffffffc020a84c:	4c34                	lw	a3,88(s0)
ffffffffc020a84e:	6705                	lui	a4,0x1
ffffffffc020a850:	23570713          	addi	a4,a4,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a854:	67a2                	ld	a5,8(sp)
ffffffffc020a856:	14e69163          	bne	a3,a4,ffffffffc020a998 <sfs_load_inode+0x20a>
ffffffffc020a85a:	4585                	li	a1,1
ffffffffc020a85c:	e01c                	sd	a5,0(s0)
ffffffffc020a85e:	c404                	sw	s1,8(s0)
ffffffffc020a860:	00043823          	sd	zero,16(s0)
ffffffffc020a864:	cc0c                	sw	a1,24(s0)
ffffffffc020a866:	02040513          	addi	a0,s0,32
ffffffffc020a86a:	e436                	sd	a3,8(sp)
ffffffffc020a86c:	dcdf90ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc020a870:	4c3c                	lw	a5,88(s0)
ffffffffc020a872:	66a2                	ld	a3,8(sp)
ffffffffc020a874:	10d79263          	bne	a5,a3,ffffffffc020a978 <sfs_load_inode+0x1ea>
ffffffffc020a878:	0a093703          	ld	a4,160(s2)
ffffffffc020a87c:	03840793          	addi	a5,s0,56
ffffffffc020a880:	4408                	lw	a0,8(s0)
ffffffffc020a882:	e31c                	sd	a5,0(a4)
ffffffffc020a884:	0af93023          	sd	a5,160(s2)
ffffffffc020a888:	09890793          	addi	a5,s2,152
ffffffffc020a88c:	e038                	sd	a4,64(s0)
ffffffffc020a88e:	fc1c                	sd	a5,56(s0)
ffffffffc020a890:	45a9                	li	a1,10
ffffffffc020a892:	0a893483          	ld	s1,168(s2)
ffffffffc020a896:	0db000ef          	jal	ffffffffc020b170 <hash32>
ffffffffc020a89a:	02051713          	slli	a4,a0,0x20
ffffffffc020a89e:	01c75793          	srli	a5,a4,0x1c
ffffffffc020a8a2:	97a6                	add	a5,a5,s1
ffffffffc020a8a4:	6798                	ld	a4,8(a5)
ffffffffc020a8a6:	04840693          	addi	a3,s0,72
ffffffffc020a8aa:	e314                	sd	a3,0(a4)
ffffffffc020a8ac:	e794                	sd	a3,8(a5)
ffffffffc020a8ae:	e838                	sd	a4,80(s0)
ffffffffc020a8b0:	e43c                	sd	a5,72(s0)
ffffffffc020a8b2:	854a                	mv	a0,s2
ffffffffc020a8b4:	0ad000ef          	jal	ffffffffc020b160 <unlock_sfs_fs>
ffffffffc020a8b8:	0089b023          	sd	s0,0(s3)
ffffffffc020a8bc:	4401                	li	s0,0
ffffffffc020a8be:	70e2                	ld	ra,56(sp)
ffffffffc020a8c0:	8522                	mv	a0,s0
ffffffffc020a8c2:	7442                	ld	s0,48(sp)
ffffffffc020a8c4:	74a2                	ld	s1,40(sp)
ffffffffc020a8c6:	7902                	ld	s2,32(sp)
ffffffffc020a8c8:	69e2                	ld	s3,24(sp)
ffffffffc020a8ca:	6121                	addi	sp,sp,64
ffffffffc020a8cc:	8082                	ret
ffffffffc020a8ce:	fb878413          	addi	s0,a5,-72
ffffffffc020a8d2:	8522                	mv	a0,s0
ffffffffc020a8d4:	e43e                	sd	a5,8(sp)
ffffffffc020a8d6:	872fd0ef          	jal	ffffffffc0207948 <inode_ref_inc>
ffffffffc020a8da:	4705                	li	a4,1
ffffffffc020a8dc:	67a2                	ld	a5,8(sp)
ffffffffc020a8de:	fce51ae3          	bne	a0,a4,ffffffffc020a8b2 <sfs_load_inode+0x124>
ffffffffc020a8e2:	fd07a703          	lw	a4,-48(a5)
ffffffffc020a8e6:	2705                	addiw	a4,a4,1
ffffffffc020a8e8:	fce7a823          	sw	a4,-48(a5)
ffffffffc020a8ec:	b7d9                	j	ffffffffc020a8b2 <sfs_load_inode+0x124>
ffffffffc020a8ee:	5471                	li	s0,-4
ffffffffc020a8f0:	854a                	mv	a0,s2
ffffffffc020a8f2:	06f000ef          	jal	ffffffffc020b160 <unlock_sfs_fs>
ffffffffc020a8f6:	70e2                	ld	ra,56(sp)
ffffffffc020a8f8:	8522                	mv	a0,s0
ffffffffc020a8fa:	7442                	ld	s0,48(sp)
ffffffffc020a8fc:	74a2                	ld	s1,40(sp)
ffffffffc020a8fe:	7902                	ld	s2,32(sp)
ffffffffc020a900:	69e2                	ld	s3,24(sp)
ffffffffc020a902:	6121                	addi	sp,sp,64
ffffffffc020a904:	8082                	ret
ffffffffc020a906:	5471                	li	s0,-4
ffffffffc020a908:	853e                	mv	a0,a5
ffffffffc020a90a:	f5cf70ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020a90e:	b7cd                	j	ffffffffc020a8f0 <sfs_load_inode+0x162>
ffffffffc020a910:	00005597          	auipc	a1,0x5
ffffffffc020a914:	ca058593          	addi	a1,a1,-864 # ffffffffc020f5b0 <sfs_node_fileops>
ffffffffc020a918:	b72d                	j	ffffffffc020a842 <sfs_load_inode+0xb4>
ffffffffc020a91a:	00004697          	auipc	a3,0x4
ffffffffc020a91e:	fb668693          	addi	a3,a3,-74 # ffffffffc020e8d0 <etext+0x31bc>
ffffffffc020a922:	00001617          	auipc	a2,0x1
ffffffffc020a926:	22e60613          	addi	a2,a2,558 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a92a:	0ad00593          	li	a1,173
ffffffffc020a92e:	00004517          	auipc	a0,0x4
ffffffffc020a932:	d4250513          	addi	a0,a0,-702 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a936:	b15f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a93a:	00492683          	lw	a3,4(s2)
ffffffffc020a93e:	8726                	mv	a4,s1
ffffffffc020a940:	00004617          	auipc	a2,0x4
ffffffffc020a944:	d6060613          	addi	a2,a2,-672 # ffffffffc020e6a0 <etext+0x2f8c>
ffffffffc020a948:	05300593          	li	a1,83
ffffffffc020a94c:	00004517          	auipc	a0,0x4
ffffffffc020a950:	d2450513          	addi	a0,a0,-732 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a954:	af7f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a958:	00004697          	auipc	a3,0x4
ffffffffc020a95c:	d8068693          	addi	a3,a3,-640 # ffffffffc020e6d8 <etext+0x2fc4>
ffffffffc020a960:	00001617          	auipc	a2,0x1
ffffffffc020a964:	1f060613          	addi	a2,a2,496 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a968:	0a800593          	li	a1,168
ffffffffc020a96c:	00004517          	auipc	a0,0x4
ffffffffc020a970:	d0450513          	addi	a0,a0,-764 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a974:	ad7f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a978:	00004697          	auipc	a3,0x4
ffffffffc020a97c:	cc068693          	addi	a3,a3,-832 # ffffffffc020e638 <etext+0x2f24>
ffffffffc020a980:	00001617          	auipc	a2,0x1
ffffffffc020a984:	1d060613          	addi	a2,a2,464 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a988:	0b100593          	li	a1,177
ffffffffc020a98c:	00004517          	auipc	a0,0x4
ffffffffc020a990:	ce450513          	addi	a0,a0,-796 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a994:	ab7f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a998:	00004697          	auipc	a3,0x4
ffffffffc020a99c:	ca068693          	addi	a3,a3,-864 # ffffffffc020e638 <etext+0x2f24>
ffffffffc020a9a0:	00001617          	auipc	a2,0x1
ffffffffc020a9a4:	1b060613          	addi	a2,a2,432 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020a9a8:	07700593          	li	a1,119
ffffffffc020a9ac:	00004517          	auipc	a0,0x4
ffffffffc020a9b0:	cc450513          	addi	a0,a0,-828 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a9b4:	a97f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a9b8:	00004617          	auipc	a2,0x4
ffffffffc020a9bc:	cd060613          	addi	a2,a2,-816 # ffffffffc020e688 <etext+0x2f74>
ffffffffc020a9c0:	02e00593          	li	a1,46
ffffffffc020a9c4:	00004517          	auipc	a0,0x4
ffffffffc020a9c8:	cac50513          	addi	a0,a0,-852 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020a9cc:	a7ff50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020a9d0 <sfs_lookup_once.constprop.0>:
ffffffffc020a9d0:	711d                	addi	sp,sp,-96
ffffffffc020a9d2:	f852                	sd	s4,48(sp)
ffffffffc020a9d4:	8a2a                	mv	s4,a0
ffffffffc020a9d6:	02058513          	addi	a0,a1,32
ffffffffc020a9da:	ec86                	sd	ra,88(sp)
ffffffffc020a9dc:	e0ca                	sd	s2,64(sp)
ffffffffc020a9de:	f456                	sd	s5,40(sp)
ffffffffc020a9e0:	e862                	sd	s8,16(sp)
ffffffffc020a9e2:	8ab2                	mv	s5,a2
ffffffffc020a9e4:	892e                	mv	s2,a1
ffffffffc020a9e6:	8c36                	mv	s8,a3
ffffffffc020a9e8:	c5bf90ef          	jal	ffffffffc0204642 <down>
ffffffffc020a9ec:	8556                	mv	a0,s5
ffffffffc020a9ee:	40b000ef          	jal	ffffffffc020b5f8 <strlen>
ffffffffc020a9f2:	0ff00793          	li	a5,255
ffffffffc020a9f6:	0aa7e963          	bltu	a5,a0,ffffffffc020aaa8 <sfs_lookup_once.constprop.0+0xd8>
ffffffffc020a9fa:	10400513          	li	a0,260
ffffffffc020a9fe:	e4a6                	sd	s1,72(sp)
ffffffffc020aa00:	dc0f70ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc020aa04:	84aa                	mv	s1,a0
ffffffffc020aa06:	c959                	beqz	a0,ffffffffc020aa9c <sfs_lookup_once.constprop.0+0xcc>
ffffffffc020aa08:	00093783          	ld	a5,0(s2)
ffffffffc020aa0c:	fc4e                	sd	s3,56(sp)
ffffffffc020aa0e:	0087a983          	lw	s3,8(a5)
ffffffffc020aa12:	05305d63          	blez	s3,ffffffffc020aa6c <sfs_lookup_once.constprop.0+0x9c>
ffffffffc020aa16:	e8a2                	sd	s0,80(sp)
ffffffffc020aa18:	4401                	li	s0,0
ffffffffc020aa1a:	a821                	j	ffffffffc020aa32 <sfs_lookup_once.constprop.0+0x62>
ffffffffc020aa1c:	409c                	lw	a5,0(s1)
ffffffffc020aa1e:	c799                	beqz	a5,ffffffffc020aa2c <sfs_lookup_once.constprop.0+0x5c>
ffffffffc020aa20:	00448593          	addi	a1,s1,4
ffffffffc020aa24:	8556                	mv	a0,s5
ffffffffc020aa26:	419000ef          	jal	ffffffffc020b63e <strcmp>
ffffffffc020aa2a:	c139                	beqz	a0,ffffffffc020aa70 <sfs_lookup_once.constprop.0+0xa0>
ffffffffc020aa2c:	2405                	addiw	s0,s0,1
ffffffffc020aa2e:	02898e63          	beq	s3,s0,ffffffffc020aa6a <sfs_lookup_once.constprop.0+0x9a>
ffffffffc020aa32:	86a6                	mv	a3,s1
ffffffffc020aa34:	8622                	mv	a2,s0
ffffffffc020aa36:	85ca                	mv	a1,s2
ffffffffc020aa38:	8552                	mv	a0,s4
ffffffffc020aa3a:	8a7ff0ef          	jal	ffffffffc020a2e0 <sfs_dirent_read_nolock>
ffffffffc020aa3e:	87aa                	mv	a5,a0
ffffffffc020aa40:	dd71                	beqz	a0,ffffffffc020aa1c <sfs_lookup_once.constprop.0+0x4c>
ffffffffc020aa42:	6446                	ld	s0,80(sp)
ffffffffc020aa44:	8526                	mv	a0,s1
ffffffffc020aa46:	e43e                	sd	a5,8(sp)
ffffffffc020aa48:	e1ef70ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020aa4c:	02090513          	addi	a0,s2,32
ffffffffc020aa50:	beff90ef          	jal	ffffffffc020463e <up>
ffffffffc020aa54:	67a2                	ld	a5,8(sp)
ffffffffc020aa56:	79e2                	ld	s3,56(sp)
ffffffffc020aa58:	60e6                	ld	ra,88(sp)
ffffffffc020aa5a:	64a6                	ld	s1,72(sp)
ffffffffc020aa5c:	6906                	ld	s2,64(sp)
ffffffffc020aa5e:	7a42                	ld	s4,48(sp)
ffffffffc020aa60:	7aa2                	ld	s5,40(sp)
ffffffffc020aa62:	6c42                	ld	s8,16(sp)
ffffffffc020aa64:	853e                	mv	a0,a5
ffffffffc020aa66:	6125                	addi	sp,sp,96
ffffffffc020aa68:	8082                	ret
ffffffffc020aa6a:	6446                	ld	s0,80(sp)
ffffffffc020aa6c:	57c1                	li	a5,-16
ffffffffc020aa6e:	bfd9                	j	ffffffffc020aa44 <sfs_lookup_once.constprop.0+0x74>
ffffffffc020aa70:	8526                	mv	a0,s1
ffffffffc020aa72:	4080                	lw	s0,0(s1)
ffffffffc020aa74:	df2f70ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020aa78:	02090513          	addi	a0,s2,32
ffffffffc020aa7c:	bc3f90ef          	jal	ffffffffc020463e <up>
ffffffffc020aa80:	8622                	mv	a2,s0
ffffffffc020aa82:	6446                	ld	s0,80(sp)
ffffffffc020aa84:	64a6                	ld	s1,72(sp)
ffffffffc020aa86:	79e2                	ld	s3,56(sp)
ffffffffc020aa88:	60e6                	ld	ra,88(sp)
ffffffffc020aa8a:	6906                	ld	s2,64(sp)
ffffffffc020aa8c:	7aa2                	ld	s5,40(sp)
ffffffffc020aa8e:	85e2                	mv	a1,s8
ffffffffc020aa90:	8552                	mv	a0,s4
ffffffffc020aa92:	6c42                	ld	s8,16(sp)
ffffffffc020aa94:	7a42                	ld	s4,48(sp)
ffffffffc020aa96:	6125                	addi	sp,sp,96
ffffffffc020aa98:	cf7ff06f          	j	ffffffffc020a78e <sfs_load_inode>
ffffffffc020aa9c:	02090513          	addi	a0,s2,32
ffffffffc020aaa0:	b9ff90ef          	jal	ffffffffc020463e <up>
ffffffffc020aaa4:	57f1                	li	a5,-4
ffffffffc020aaa6:	bf4d                	j	ffffffffc020aa58 <sfs_lookup_once.constprop.0+0x88>
ffffffffc020aaa8:	00004697          	auipc	a3,0x4
ffffffffc020aaac:	e4068693          	addi	a3,a3,-448 # ffffffffc020e8e8 <etext+0x31d4>
ffffffffc020aab0:	00001617          	auipc	a2,0x1
ffffffffc020aab4:	0a060613          	addi	a2,a2,160 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020aab8:	1bb00593          	li	a1,443
ffffffffc020aabc:	00004517          	auipc	a0,0x4
ffffffffc020aac0:	bb450513          	addi	a0,a0,-1100 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020aac4:	e8a2                	sd	s0,80(sp)
ffffffffc020aac6:	e4a6                	sd	s1,72(sp)
ffffffffc020aac8:	fc4e                	sd	s3,56(sp)
ffffffffc020aaca:	f05a                	sd	s6,32(sp)
ffffffffc020aacc:	ec5e                	sd	s7,24(sp)
ffffffffc020aace:	97df50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020aad2 <sfs_namefile>:
ffffffffc020aad2:	6d9c                	ld	a5,24(a1)
ffffffffc020aad4:	7175                	addi	sp,sp,-144
ffffffffc020aad6:	f86a                	sd	s10,48(sp)
ffffffffc020aad8:	e506                	sd	ra,136(sp)
ffffffffc020aada:	f46e                	sd	s11,40(sp)
ffffffffc020aadc:	4d09                	li	s10,2
ffffffffc020aade:	1afd7763          	bgeu	s10,a5,ffffffffc020ac8c <sfs_namefile+0x1ba>
ffffffffc020aae2:	f4ce                	sd	s3,104(sp)
ffffffffc020aae4:	89aa                	mv	s3,a0
ffffffffc020aae6:	10400513          	li	a0,260
ffffffffc020aaea:	fca6                	sd	s1,120(sp)
ffffffffc020aaec:	e42e                	sd	a1,8(sp)
ffffffffc020aaee:	cd2f70ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc020aaf2:	84aa                	mv	s1,a0
ffffffffc020aaf4:	18050a63          	beqz	a0,ffffffffc020ac88 <sfs_namefile+0x1b6>
ffffffffc020aaf8:	f0d2                	sd	s4,96(sp)
ffffffffc020aafa:	0689ba03          	ld	s4,104(s3)
ffffffffc020aafe:	1e0a0c63          	beqz	s4,ffffffffc020acf6 <sfs_namefile+0x224>
ffffffffc020ab02:	0b0a2783          	lw	a5,176(s4)
ffffffffc020ab06:	1e079863          	bnez	a5,ffffffffc020acf6 <sfs_namefile+0x224>
ffffffffc020ab0a:	0589a703          	lw	a4,88(s3)
ffffffffc020ab0e:	6785                	lui	a5,0x1
ffffffffc020ab10:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020ab14:	e03a                	sd	a4,0(sp)
ffffffffc020ab16:	e122                	sd	s0,128(sp)
ffffffffc020ab18:	f8ca                	sd	s2,112(sp)
ffffffffc020ab1a:	ecd6                	sd	s5,88(sp)
ffffffffc020ab1c:	e8da                	sd	s6,80(sp)
ffffffffc020ab1e:	e4de                	sd	s7,72(sp)
ffffffffc020ab20:	e0e2                	sd	s8,64(sp)
ffffffffc020ab22:	1af71963          	bne	a4,a5,ffffffffc020acd4 <sfs_namefile+0x202>
ffffffffc020ab26:	6722                	ld	a4,8(sp)
ffffffffc020ab28:	854e                	mv	a0,s3
ffffffffc020ab2a:	8b4e                	mv	s6,s3
ffffffffc020ab2c:	6f1c                	ld	a5,24(a4)
ffffffffc020ab2e:	00073a83          	ld	s5,0(a4)
ffffffffc020ab32:	ffe78c13          	addi	s8,a5,-2
ffffffffc020ab36:	9abe                	add	s5,s5,a5
ffffffffc020ab38:	e11fc0ef          	jal	ffffffffc0207948 <inode_ref_inc>
ffffffffc020ab3c:	0834                	addi	a3,sp,24
ffffffffc020ab3e:	00004617          	auipc	a2,0x4
ffffffffc020ab42:	dd260613          	addi	a2,a2,-558 # ffffffffc020e910 <etext+0x31fc>
ffffffffc020ab46:	85da                	mv	a1,s6
ffffffffc020ab48:	8552                	mv	a0,s4
ffffffffc020ab4a:	e87ff0ef          	jal	ffffffffc020a9d0 <sfs_lookup_once.constprop.0>
ffffffffc020ab4e:	8daa                	mv	s11,a0
ffffffffc020ab50:	e94d                	bnez	a0,ffffffffc020ac02 <sfs_namefile+0x130>
ffffffffc020ab52:	854e                	mv	a0,s3
ffffffffc020ab54:	008b2903          	lw	s2,8(s6)
ffffffffc020ab58:	ebffc0ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc020ab5c:	6462                	ld	s0,24(sp)
ffffffffc020ab5e:	0f340563          	beq	s0,s3,ffffffffc020ac48 <sfs_namefile+0x176>
ffffffffc020ab62:	14040863          	beqz	s0,ffffffffc020acb2 <sfs_namefile+0x1e0>
ffffffffc020ab66:	4c38                	lw	a4,88(s0)
ffffffffc020ab68:	6782                	ld	a5,0(sp)
ffffffffc020ab6a:	14f71463          	bne	a4,a5,ffffffffc020acb2 <sfs_namefile+0x1e0>
ffffffffc020ab6e:	4418                	lw	a4,8(s0)
ffffffffc020ab70:	13270063          	beq	a4,s2,ffffffffc020ac90 <sfs_namefile+0x1be>
ffffffffc020ab74:	6018                	ld	a4,0(s0)
ffffffffc020ab76:	00475703          	lhu	a4,4(a4)
ffffffffc020ab7a:	11a71b63          	bne	a4,s10,ffffffffc020ac90 <sfs_namefile+0x1be>
ffffffffc020ab7e:	02040b93          	addi	s7,s0,32
ffffffffc020ab82:	855e                	mv	a0,s7
ffffffffc020ab84:	abff90ef          	jal	ffffffffc0204642 <down>
ffffffffc020ab88:	6018                	ld	a4,0(s0)
ffffffffc020ab8a:	00872983          	lw	s3,8(a4)
ffffffffc020ab8e:	0b305763          	blez	s3,ffffffffc020ac3c <sfs_namefile+0x16a>
ffffffffc020ab92:	8b22                	mv	s6,s0
ffffffffc020ab94:	a039                	j	ffffffffc020aba2 <sfs_namefile+0xd0>
ffffffffc020ab96:	4098                	lw	a4,0(s1)
ffffffffc020ab98:	01270e63          	beq	a4,s2,ffffffffc020abb4 <sfs_namefile+0xe2>
ffffffffc020ab9c:	2d85                	addiw	s11,s11,1
ffffffffc020ab9e:	09b98763          	beq	s3,s11,ffffffffc020ac2c <sfs_namefile+0x15a>
ffffffffc020aba2:	86a6                	mv	a3,s1
ffffffffc020aba4:	866e                	mv	a2,s11
ffffffffc020aba6:	85a2                	mv	a1,s0
ffffffffc020aba8:	8552                	mv	a0,s4
ffffffffc020abaa:	f36ff0ef          	jal	ffffffffc020a2e0 <sfs_dirent_read_nolock>
ffffffffc020abae:	872a                	mv	a4,a0
ffffffffc020abb0:	d17d                	beqz	a0,ffffffffc020ab96 <sfs_namefile+0xc4>
ffffffffc020abb2:	a8b5                	j	ffffffffc020ac2e <sfs_namefile+0x15c>
ffffffffc020abb4:	855e                	mv	a0,s7
ffffffffc020abb6:	a89f90ef          	jal	ffffffffc020463e <up>
ffffffffc020abba:	00448513          	addi	a0,s1,4
ffffffffc020abbe:	23b000ef          	jal	ffffffffc020b5f8 <strlen>
ffffffffc020abc2:	00150793          	addi	a5,a0,1
ffffffffc020abc6:	0afc6e63          	bltu	s8,a5,ffffffffc020ac82 <sfs_namefile+0x1b0>
ffffffffc020abca:	fff54913          	not	s2,a0
ffffffffc020abce:	862a                	mv	a2,a0
ffffffffc020abd0:	00448593          	addi	a1,s1,4
ffffffffc020abd4:	012a8533          	add	a0,s5,s2
ffffffffc020abd8:	40fc0c33          	sub	s8,s8,a5
ffffffffc020abdc:	321000ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc020abe0:	02f00793          	li	a5,47
ffffffffc020abe4:	fefa8fa3          	sb	a5,-1(s5)
ffffffffc020abe8:	0834                	addi	a3,sp,24
ffffffffc020abea:	00004617          	auipc	a2,0x4
ffffffffc020abee:	d2660613          	addi	a2,a2,-730 # ffffffffc020e910 <etext+0x31fc>
ffffffffc020abf2:	85da                	mv	a1,s6
ffffffffc020abf4:	8552                	mv	a0,s4
ffffffffc020abf6:	ddbff0ef          	jal	ffffffffc020a9d0 <sfs_lookup_once.constprop.0>
ffffffffc020abfa:	89a2                	mv	s3,s0
ffffffffc020abfc:	9aca                	add	s5,s5,s2
ffffffffc020abfe:	8daa                	mv	s11,a0
ffffffffc020ac00:	d929                	beqz	a0,ffffffffc020ab52 <sfs_namefile+0x80>
ffffffffc020ac02:	854e                	mv	a0,s3
ffffffffc020ac04:	e13fc0ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc020ac08:	8526                	mv	a0,s1
ffffffffc020ac0a:	c5cf70ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020ac0e:	640a                	ld	s0,128(sp)
ffffffffc020ac10:	74e6                	ld	s1,120(sp)
ffffffffc020ac12:	7946                	ld	s2,112(sp)
ffffffffc020ac14:	79a6                	ld	s3,104(sp)
ffffffffc020ac16:	7a06                	ld	s4,96(sp)
ffffffffc020ac18:	6ae6                	ld	s5,88(sp)
ffffffffc020ac1a:	6b46                	ld	s6,80(sp)
ffffffffc020ac1c:	6ba6                	ld	s7,72(sp)
ffffffffc020ac1e:	6c06                	ld	s8,64(sp)
ffffffffc020ac20:	60aa                	ld	ra,136(sp)
ffffffffc020ac22:	7d42                	ld	s10,48(sp)
ffffffffc020ac24:	856e                	mv	a0,s11
ffffffffc020ac26:	7da2                	ld	s11,40(sp)
ffffffffc020ac28:	6149                	addi	sp,sp,144
ffffffffc020ac2a:	8082                	ret
ffffffffc020ac2c:	5741                	li	a4,-16
ffffffffc020ac2e:	855e                	mv	a0,s7
ffffffffc020ac30:	e03a                	sd	a4,0(sp)
ffffffffc020ac32:	89a2                	mv	s3,s0
ffffffffc020ac34:	a0bf90ef          	jal	ffffffffc020463e <up>
ffffffffc020ac38:	6d82                	ld	s11,0(sp)
ffffffffc020ac3a:	b7e1                	j	ffffffffc020ac02 <sfs_namefile+0x130>
ffffffffc020ac3c:	855e                	mv	a0,s7
ffffffffc020ac3e:	a01f90ef          	jal	ffffffffc020463e <up>
ffffffffc020ac42:	89a2                	mv	s3,s0
ffffffffc020ac44:	5dc1                	li	s11,-16
ffffffffc020ac46:	bf75                	j	ffffffffc020ac02 <sfs_namefile+0x130>
ffffffffc020ac48:	854e                	mv	a0,s3
ffffffffc020ac4a:	dcdfc0ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc020ac4e:	6922                	ld	s2,8(sp)
ffffffffc020ac50:	85d6                	mv	a1,s5
ffffffffc020ac52:	01893403          	ld	s0,24(s2)
ffffffffc020ac56:	00093503          	ld	a0,0(s2)
ffffffffc020ac5a:	1479                	addi	s0,s0,-2
ffffffffc020ac5c:	41840433          	sub	s0,s0,s8
ffffffffc020ac60:	8622                	mv	a2,s0
ffffffffc020ac62:	0505                	addi	a0,a0,1
ffffffffc020ac64:	25b000ef          	jal	ffffffffc020b6be <memmove>
ffffffffc020ac68:	02f00713          	li	a4,47
ffffffffc020ac6c:	fee50fa3          	sb	a4,-1(a0)
ffffffffc020ac70:	00850733          	add	a4,a0,s0
ffffffffc020ac74:	00070023          	sb	zero,0(a4)
ffffffffc020ac78:	854a                	mv	a0,s2
ffffffffc020ac7a:	85a2                	mv	a1,s0
ffffffffc020ac7c:	8ebfa0ef          	jal	ffffffffc0205566 <iobuf_skip>
ffffffffc020ac80:	b761                	j	ffffffffc020ac08 <sfs_namefile+0x136>
ffffffffc020ac82:	89a2                	mv	s3,s0
ffffffffc020ac84:	5df1                	li	s11,-4
ffffffffc020ac86:	bfb5                	j	ffffffffc020ac02 <sfs_namefile+0x130>
ffffffffc020ac88:	74e6                	ld	s1,120(sp)
ffffffffc020ac8a:	79a6                	ld	s3,104(sp)
ffffffffc020ac8c:	5df1                	li	s11,-4
ffffffffc020ac8e:	bf49                	j	ffffffffc020ac20 <sfs_namefile+0x14e>
ffffffffc020ac90:	00004697          	auipc	a3,0x4
ffffffffc020ac94:	c8868693          	addi	a3,a3,-888 # ffffffffc020e918 <etext+0x3204>
ffffffffc020ac98:	00001617          	auipc	a2,0x1
ffffffffc020ac9c:	eb860613          	addi	a2,a2,-328 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020aca0:	2f800593          	li	a1,760
ffffffffc020aca4:	00004517          	auipc	a0,0x4
ffffffffc020aca8:	9cc50513          	addi	a0,a0,-1588 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020acac:	fc66                	sd	s9,56(sp)
ffffffffc020acae:	f9cf50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020acb2:	00004697          	auipc	a3,0x4
ffffffffc020acb6:	98668693          	addi	a3,a3,-1658 # ffffffffc020e638 <etext+0x2f24>
ffffffffc020acba:	00001617          	auipc	a2,0x1
ffffffffc020acbe:	e9660613          	addi	a2,a2,-362 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020acc2:	2f700593          	li	a1,759
ffffffffc020acc6:	00004517          	auipc	a0,0x4
ffffffffc020acca:	9aa50513          	addi	a0,a0,-1622 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020acce:	fc66                	sd	s9,56(sp)
ffffffffc020acd0:	f7af50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020acd4:	00004697          	auipc	a3,0x4
ffffffffc020acd8:	96468693          	addi	a3,a3,-1692 # ffffffffc020e638 <etext+0x2f24>
ffffffffc020acdc:	00001617          	auipc	a2,0x1
ffffffffc020ace0:	e7460613          	addi	a2,a2,-396 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020ace4:	2e400593          	li	a1,740
ffffffffc020ace8:	00004517          	auipc	a0,0x4
ffffffffc020acec:	98850513          	addi	a0,a0,-1656 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020acf0:	fc66                	sd	s9,56(sp)
ffffffffc020acf2:	f58f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020acf6:	00003697          	auipc	a3,0x3
ffffffffc020acfa:	79a68693          	addi	a3,a3,1946 # ffffffffc020e490 <etext+0x2d7c>
ffffffffc020acfe:	00001617          	auipc	a2,0x1
ffffffffc020ad02:	e5260613          	addi	a2,a2,-430 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020ad06:	2e300593          	li	a1,739
ffffffffc020ad0a:	00004517          	auipc	a0,0x4
ffffffffc020ad0e:	96650513          	addi	a0,a0,-1690 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020ad12:	e122                	sd	s0,128(sp)
ffffffffc020ad14:	f8ca                	sd	s2,112(sp)
ffffffffc020ad16:	ecd6                	sd	s5,88(sp)
ffffffffc020ad18:	e8da                	sd	s6,80(sp)
ffffffffc020ad1a:	e4de                	sd	s7,72(sp)
ffffffffc020ad1c:	e0e2                	sd	s8,64(sp)
ffffffffc020ad1e:	fc66                	sd	s9,56(sp)
ffffffffc020ad20:	f2af50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020ad24 <sfs_lookup>:
ffffffffc020ad24:	7139                	addi	sp,sp,-64
ffffffffc020ad26:	f426                	sd	s1,40(sp)
ffffffffc020ad28:	7524                	ld	s1,104(a0)
ffffffffc020ad2a:	fc06                	sd	ra,56(sp)
ffffffffc020ad2c:	f822                	sd	s0,48(sp)
ffffffffc020ad2e:	f04a                	sd	s2,32(sp)
ffffffffc020ad30:	c4b5                	beqz	s1,ffffffffc020ad9c <sfs_lookup+0x78>
ffffffffc020ad32:	0b04a783          	lw	a5,176(s1)
ffffffffc020ad36:	e3bd                	bnez	a5,ffffffffc020ad9c <sfs_lookup+0x78>
ffffffffc020ad38:	0005c783          	lbu	a5,0(a1)
ffffffffc020ad3c:	c3c5                	beqz	a5,ffffffffc020addc <sfs_lookup+0xb8>
ffffffffc020ad3e:	fd178793          	addi	a5,a5,-47
ffffffffc020ad42:	cfc9                	beqz	a5,ffffffffc020addc <sfs_lookup+0xb8>
ffffffffc020ad44:	842a                	mv	s0,a0
ffffffffc020ad46:	8932                	mv	s2,a2
ffffffffc020ad48:	e42e                	sd	a1,8(sp)
ffffffffc020ad4a:	bfffc0ef          	jal	ffffffffc0207948 <inode_ref_inc>
ffffffffc020ad4e:	4c38                	lw	a4,88(s0)
ffffffffc020ad50:	6785                	lui	a5,0x1
ffffffffc020ad52:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020ad56:	06f71363          	bne	a4,a5,ffffffffc020adbc <sfs_lookup+0x98>
ffffffffc020ad5a:	6018                	ld	a4,0(s0)
ffffffffc020ad5c:	4789                	li	a5,2
ffffffffc020ad5e:	00475703          	lhu	a4,4(a4)
ffffffffc020ad62:	02f71863          	bne	a4,a5,ffffffffc020ad92 <sfs_lookup+0x6e>
ffffffffc020ad66:	6622                	ld	a2,8(sp)
ffffffffc020ad68:	85a2                	mv	a1,s0
ffffffffc020ad6a:	8526                	mv	a0,s1
ffffffffc020ad6c:	0834                	addi	a3,sp,24
ffffffffc020ad6e:	c63ff0ef          	jal	ffffffffc020a9d0 <sfs_lookup_once.constprop.0>
ffffffffc020ad72:	87aa                	mv	a5,a0
ffffffffc020ad74:	8522                	mv	a0,s0
ffffffffc020ad76:	843e                	mv	s0,a5
ffffffffc020ad78:	c9ffc0ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc020ad7c:	e401                	bnez	s0,ffffffffc020ad84 <sfs_lookup+0x60>
ffffffffc020ad7e:	67e2                	ld	a5,24(sp)
ffffffffc020ad80:	00f93023          	sd	a5,0(s2)
ffffffffc020ad84:	70e2                	ld	ra,56(sp)
ffffffffc020ad86:	8522                	mv	a0,s0
ffffffffc020ad88:	7442                	ld	s0,48(sp)
ffffffffc020ad8a:	74a2                	ld	s1,40(sp)
ffffffffc020ad8c:	7902                	ld	s2,32(sp)
ffffffffc020ad8e:	6121                	addi	sp,sp,64
ffffffffc020ad90:	8082                	ret
ffffffffc020ad92:	8522                	mv	a0,s0
ffffffffc020ad94:	c83fc0ef          	jal	ffffffffc0207a16 <inode_ref_dec>
ffffffffc020ad98:	5439                	li	s0,-18
ffffffffc020ad9a:	b7ed                	j	ffffffffc020ad84 <sfs_lookup+0x60>
ffffffffc020ad9c:	00003697          	auipc	a3,0x3
ffffffffc020ada0:	6f468693          	addi	a3,a3,1780 # ffffffffc020e490 <etext+0x2d7c>
ffffffffc020ada4:	00001617          	auipc	a2,0x1
ffffffffc020ada8:	dac60613          	addi	a2,a2,-596 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020adac:	3d900593          	li	a1,985
ffffffffc020adb0:	00004517          	auipc	a0,0x4
ffffffffc020adb4:	8c050513          	addi	a0,a0,-1856 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020adb8:	e92f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020adbc:	00004697          	auipc	a3,0x4
ffffffffc020adc0:	87c68693          	addi	a3,a3,-1924 # ffffffffc020e638 <etext+0x2f24>
ffffffffc020adc4:	00001617          	auipc	a2,0x1
ffffffffc020adc8:	d8c60613          	addi	a2,a2,-628 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020adcc:	3dc00593          	li	a1,988
ffffffffc020add0:	00004517          	auipc	a0,0x4
ffffffffc020add4:	8a050513          	addi	a0,a0,-1888 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020add8:	e72f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020addc:	00004697          	auipc	a3,0x4
ffffffffc020ade0:	b7468693          	addi	a3,a3,-1164 # ffffffffc020e950 <etext+0x323c>
ffffffffc020ade4:	00001617          	auipc	a2,0x1
ffffffffc020ade8:	d6c60613          	addi	a2,a2,-660 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020adec:	3da00593          	li	a1,986
ffffffffc020adf0:	00004517          	auipc	a0,0x4
ffffffffc020adf4:	88050513          	addi	a0,a0,-1920 # ffffffffc020e670 <etext+0x2f5c>
ffffffffc020adf8:	e52f50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020adfc <sfs_rwblock_nolock>:
ffffffffc020adfc:	7139                	addi	sp,sp,-64
ffffffffc020adfe:	f822                	sd	s0,48(sp)
ffffffffc020ae00:	f426                	sd	s1,40(sp)
ffffffffc020ae02:	fc06                	sd	ra,56(sp)
ffffffffc020ae04:	842a                	mv	s0,a0
ffffffffc020ae06:	84b6                	mv	s1,a3
ffffffffc020ae08:	e219                	bnez	a2,ffffffffc020ae0e <sfs_rwblock_nolock+0x12>
ffffffffc020ae0a:	8b05                	andi	a4,a4,1
ffffffffc020ae0c:	e71d                	bnez	a4,ffffffffc020ae3a <sfs_rwblock_nolock+0x3e>
ffffffffc020ae0e:	405c                	lw	a5,4(s0)
ffffffffc020ae10:	02f67563          	bgeu	a2,a5,ffffffffc020ae3a <sfs_rwblock_nolock+0x3e>
ffffffffc020ae14:	00c6161b          	slliw	a2,a2,0xc
ffffffffc020ae18:	02061693          	slli	a3,a2,0x20
ffffffffc020ae1c:	9281                	srli	a3,a3,0x20
ffffffffc020ae1e:	6605                	lui	a2,0x1
ffffffffc020ae20:	850a                	mv	a0,sp
ffffffffc020ae22:	eb6fa0ef          	jal	ffffffffc02054d8 <iobuf_init>
ffffffffc020ae26:	85aa                	mv	a1,a0
ffffffffc020ae28:	7808                	ld	a0,48(s0)
ffffffffc020ae2a:	8626                	mv	a2,s1
ffffffffc020ae2c:	7118                	ld	a4,32(a0)
ffffffffc020ae2e:	9702                	jalr	a4
ffffffffc020ae30:	70e2                	ld	ra,56(sp)
ffffffffc020ae32:	7442                	ld	s0,48(sp)
ffffffffc020ae34:	74a2                	ld	s1,40(sp)
ffffffffc020ae36:	6121                	addi	sp,sp,64
ffffffffc020ae38:	8082                	ret
ffffffffc020ae3a:	00004697          	auipc	a3,0x4
ffffffffc020ae3e:	b3668693          	addi	a3,a3,-1226 # ffffffffc020e970 <etext+0x325c>
ffffffffc020ae42:	00001617          	auipc	a2,0x1
ffffffffc020ae46:	d0e60613          	addi	a2,a2,-754 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020ae4a:	45d5                	li	a1,21
ffffffffc020ae4c:	00004517          	auipc	a0,0x4
ffffffffc020ae50:	b5c50513          	addi	a0,a0,-1188 # ffffffffc020e9a8 <etext+0x3294>
ffffffffc020ae54:	df6f50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020ae58 <sfs_rblock>:
ffffffffc020ae58:	7139                	addi	sp,sp,-64
ffffffffc020ae5a:	ec4e                	sd	s3,24(sp)
ffffffffc020ae5c:	89b6                	mv	s3,a3
ffffffffc020ae5e:	f822                	sd	s0,48(sp)
ffffffffc020ae60:	f04a                	sd	s2,32(sp)
ffffffffc020ae62:	e852                	sd	s4,16(sp)
ffffffffc020ae64:	fc06                	sd	ra,56(sp)
ffffffffc020ae66:	f426                	sd	s1,40(sp)
ffffffffc020ae68:	892e                	mv	s2,a1
ffffffffc020ae6a:	8432                	mv	s0,a2
ffffffffc020ae6c:	8a2a                	mv	s4,a0
ffffffffc020ae6e:	2ea000ef          	jal	ffffffffc020b158 <lock_sfs_io>
ffffffffc020ae72:	02098763          	beqz	s3,ffffffffc020aea0 <sfs_rblock+0x48>
ffffffffc020ae76:	e456                	sd	s5,8(sp)
ffffffffc020ae78:	013409bb          	addw	s3,s0,s3
ffffffffc020ae7c:	6a85                	lui	s5,0x1
ffffffffc020ae7e:	a021                	j	ffffffffc020ae86 <sfs_rblock+0x2e>
ffffffffc020ae80:	9956                	add	s2,s2,s5
ffffffffc020ae82:	01340e63          	beq	s0,s3,ffffffffc020ae9e <sfs_rblock+0x46>
ffffffffc020ae86:	8622                	mv	a2,s0
ffffffffc020ae88:	4705                	li	a4,1
ffffffffc020ae8a:	4681                	li	a3,0
ffffffffc020ae8c:	85ca                	mv	a1,s2
ffffffffc020ae8e:	8552                	mv	a0,s4
ffffffffc020ae90:	f6dff0ef          	jal	ffffffffc020adfc <sfs_rwblock_nolock>
ffffffffc020ae94:	84aa                	mv	s1,a0
ffffffffc020ae96:	2405                	addiw	s0,s0,1
ffffffffc020ae98:	d565                	beqz	a0,ffffffffc020ae80 <sfs_rblock+0x28>
ffffffffc020ae9a:	6aa2                	ld	s5,8(sp)
ffffffffc020ae9c:	a019                	j	ffffffffc020aea2 <sfs_rblock+0x4a>
ffffffffc020ae9e:	6aa2                	ld	s5,8(sp)
ffffffffc020aea0:	4481                	li	s1,0
ffffffffc020aea2:	8552                	mv	a0,s4
ffffffffc020aea4:	2c4000ef          	jal	ffffffffc020b168 <unlock_sfs_io>
ffffffffc020aea8:	70e2                	ld	ra,56(sp)
ffffffffc020aeaa:	7442                	ld	s0,48(sp)
ffffffffc020aeac:	7902                	ld	s2,32(sp)
ffffffffc020aeae:	69e2                	ld	s3,24(sp)
ffffffffc020aeb0:	6a42                	ld	s4,16(sp)
ffffffffc020aeb2:	8526                	mv	a0,s1
ffffffffc020aeb4:	74a2                	ld	s1,40(sp)
ffffffffc020aeb6:	6121                	addi	sp,sp,64
ffffffffc020aeb8:	8082                	ret

ffffffffc020aeba <sfs_wblock>:
ffffffffc020aeba:	7139                	addi	sp,sp,-64
ffffffffc020aebc:	ec4e                	sd	s3,24(sp)
ffffffffc020aebe:	89b6                	mv	s3,a3
ffffffffc020aec0:	f822                	sd	s0,48(sp)
ffffffffc020aec2:	f04a                	sd	s2,32(sp)
ffffffffc020aec4:	e852                	sd	s4,16(sp)
ffffffffc020aec6:	fc06                	sd	ra,56(sp)
ffffffffc020aec8:	f426                	sd	s1,40(sp)
ffffffffc020aeca:	892e                	mv	s2,a1
ffffffffc020aecc:	8432                	mv	s0,a2
ffffffffc020aece:	8a2a                	mv	s4,a0
ffffffffc020aed0:	288000ef          	jal	ffffffffc020b158 <lock_sfs_io>
ffffffffc020aed4:	02098763          	beqz	s3,ffffffffc020af02 <sfs_wblock+0x48>
ffffffffc020aed8:	e456                	sd	s5,8(sp)
ffffffffc020aeda:	013409bb          	addw	s3,s0,s3
ffffffffc020aede:	6a85                	lui	s5,0x1
ffffffffc020aee0:	a021                	j	ffffffffc020aee8 <sfs_wblock+0x2e>
ffffffffc020aee2:	9956                	add	s2,s2,s5
ffffffffc020aee4:	01340e63          	beq	s0,s3,ffffffffc020af00 <sfs_wblock+0x46>
ffffffffc020aee8:	4705                	li	a4,1
ffffffffc020aeea:	8622                	mv	a2,s0
ffffffffc020aeec:	86ba                	mv	a3,a4
ffffffffc020aeee:	85ca                	mv	a1,s2
ffffffffc020aef0:	8552                	mv	a0,s4
ffffffffc020aef2:	f0bff0ef          	jal	ffffffffc020adfc <sfs_rwblock_nolock>
ffffffffc020aef6:	84aa                	mv	s1,a0
ffffffffc020aef8:	2405                	addiw	s0,s0,1
ffffffffc020aefa:	d565                	beqz	a0,ffffffffc020aee2 <sfs_wblock+0x28>
ffffffffc020aefc:	6aa2                	ld	s5,8(sp)
ffffffffc020aefe:	a019                	j	ffffffffc020af04 <sfs_wblock+0x4a>
ffffffffc020af00:	6aa2                	ld	s5,8(sp)
ffffffffc020af02:	4481                	li	s1,0
ffffffffc020af04:	8552                	mv	a0,s4
ffffffffc020af06:	262000ef          	jal	ffffffffc020b168 <unlock_sfs_io>
ffffffffc020af0a:	70e2                	ld	ra,56(sp)
ffffffffc020af0c:	7442                	ld	s0,48(sp)
ffffffffc020af0e:	7902                	ld	s2,32(sp)
ffffffffc020af10:	69e2                	ld	s3,24(sp)
ffffffffc020af12:	6a42                	ld	s4,16(sp)
ffffffffc020af14:	8526                	mv	a0,s1
ffffffffc020af16:	74a2                	ld	s1,40(sp)
ffffffffc020af18:	6121                	addi	sp,sp,64
ffffffffc020af1a:	8082                	ret

ffffffffc020af1c <sfs_rbuf>:
ffffffffc020af1c:	7179                	addi	sp,sp,-48
ffffffffc020af1e:	f406                	sd	ra,40(sp)
ffffffffc020af20:	f022                	sd	s0,32(sp)
ffffffffc020af22:	ec26                	sd	s1,24(sp)
ffffffffc020af24:	e84a                	sd	s2,16(sp)
ffffffffc020af26:	e44e                	sd	s3,8(sp)
ffffffffc020af28:	e052                	sd	s4,0(sp)
ffffffffc020af2a:	6785                	lui	a5,0x1
ffffffffc020af2c:	04f77863          	bgeu	a4,a5,ffffffffc020af7c <sfs_rbuf+0x60>
ffffffffc020af30:	84ba                	mv	s1,a4
ffffffffc020af32:	9732                	add	a4,a4,a2
ffffffffc020af34:	04e7e463          	bltu	a5,a4,ffffffffc020af7c <sfs_rbuf+0x60>
ffffffffc020af38:	8936                	mv	s2,a3
ffffffffc020af3a:	842a                	mv	s0,a0
ffffffffc020af3c:	89ae                	mv	s3,a1
ffffffffc020af3e:	8a32                	mv	s4,a2
ffffffffc020af40:	218000ef          	jal	ffffffffc020b158 <lock_sfs_io>
ffffffffc020af44:	642c                	ld	a1,72(s0)
ffffffffc020af46:	864a                	mv	a2,s2
ffffffffc020af48:	8522                	mv	a0,s0
ffffffffc020af4a:	4705                	li	a4,1
ffffffffc020af4c:	4681                	li	a3,0
ffffffffc020af4e:	eafff0ef          	jal	ffffffffc020adfc <sfs_rwblock_nolock>
ffffffffc020af52:	892a                	mv	s2,a0
ffffffffc020af54:	cd09                	beqz	a0,ffffffffc020af6e <sfs_rbuf+0x52>
ffffffffc020af56:	8522                	mv	a0,s0
ffffffffc020af58:	210000ef          	jal	ffffffffc020b168 <unlock_sfs_io>
ffffffffc020af5c:	70a2                	ld	ra,40(sp)
ffffffffc020af5e:	7402                	ld	s0,32(sp)
ffffffffc020af60:	64e2                	ld	s1,24(sp)
ffffffffc020af62:	69a2                	ld	s3,8(sp)
ffffffffc020af64:	6a02                	ld	s4,0(sp)
ffffffffc020af66:	854a                	mv	a0,s2
ffffffffc020af68:	6942                	ld	s2,16(sp)
ffffffffc020af6a:	6145                	addi	sp,sp,48
ffffffffc020af6c:	8082                	ret
ffffffffc020af6e:	642c                	ld	a1,72(s0)
ffffffffc020af70:	8652                	mv	a2,s4
ffffffffc020af72:	854e                	mv	a0,s3
ffffffffc020af74:	95a6                	add	a1,a1,s1
ffffffffc020af76:	786000ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc020af7a:	bff1                	j	ffffffffc020af56 <sfs_rbuf+0x3a>
ffffffffc020af7c:	00004697          	auipc	a3,0x4
ffffffffc020af80:	a4468693          	addi	a3,a3,-1468 # ffffffffc020e9c0 <etext+0x32ac>
ffffffffc020af84:	00001617          	auipc	a2,0x1
ffffffffc020af88:	bcc60613          	addi	a2,a2,-1076 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020af8c:	05500593          	li	a1,85
ffffffffc020af90:	00004517          	auipc	a0,0x4
ffffffffc020af94:	a1850513          	addi	a0,a0,-1512 # ffffffffc020e9a8 <etext+0x3294>
ffffffffc020af98:	cb2f50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020af9c <sfs_wbuf>:
ffffffffc020af9c:	7139                	addi	sp,sp,-64
ffffffffc020af9e:	fc06                	sd	ra,56(sp)
ffffffffc020afa0:	f822                	sd	s0,48(sp)
ffffffffc020afa2:	f426                	sd	s1,40(sp)
ffffffffc020afa4:	f04a                	sd	s2,32(sp)
ffffffffc020afa6:	ec4e                	sd	s3,24(sp)
ffffffffc020afa8:	e852                	sd	s4,16(sp)
ffffffffc020afaa:	e456                	sd	s5,8(sp)
ffffffffc020afac:	6785                	lui	a5,0x1
ffffffffc020afae:	06f77163          	bgeu	a4,a5,ffffffffc020b010 <sfs_wbuf+0x74>
ffffffffc020afb2:	893a                	mv	s2,a4
ffffffffc020afb4:	9732                	add	a4,a4,a2
ffffffffc020afb6:	04e7ed63          	bltu	a5,a4,ffffffffc020b010 <sfs_wbuf+0x74>
ffffffffc020afba:	89b6                	mv	s3,a3
ffffffffc020afbc:	84aa                	mv	s1,a0
ffffffffc020afbe:	8a2e                	mv	s4,a1
ffffffffc020afc0:	8ab2                	mv	s5,a2
ffffffffc020afc2:	196000ef          	jal	ffffffffc020b158 <lock_sfs_io>
ffffffffc020afc6:	64ac                	ld	a1,72(s1)
ffffffffc020afc8:	864e                	mv	a2,s3
ffffffffc020afca:	8526                	mv	a0,s1
ffffffffc020afcc:	4705                	li	a4,1
ffffffffc020afce:	4681                	li	a3,0
ffffffffc020afd0:	e2dff0ef          	jal	ffffffffc020adfc <sfs_rwblock_nolock>
ffffffffc020afd4:	842a                	mv	s0,a0
ffffffffc020afd6:	cd11                	beqz	a0,ffffffffc020aff2 <sfs_wbuf+0x56>
ffffffffc020afd8:	8526                	mv	a0,s1
ffffffffc020afda:	18e000ef          	jal	ffffffffc020b168 <unlock_sfs_io>
ffffffffc020afde:	70e2                	ld	ra,56(sp)
ffffffffc020afe0:	8522                	mv	a0,s0
ffffffffc020afe2:	7442                	ld	s0,48(sp)
ffffffffc020afe4:	74a2                	ld	s1,40(sp)
ffffffffc020afe6:	7902                	ld	s2,32(sp)
ffffffffc020afe8:	69e2                	ld	s3,24(sp)
ffffffffc020afea:	6a42                	ld	s4,16(sp)
ffffffffc020afec:	6aa2                	ld	s5,8(sp)
ffffffffc020afee:	6121                	addi	sp,sp,64
ffffffffc020aff0:	8082                	ret
ffffffffc020aff2:	64a8                	ld	a0,72(s1)
ffffffffc020aff4:	8656                	mv	a2,s5
ffffffffc020aff6:	85d2                	mv	a1,s4
ffffffffc020aff8:	954a                	add	a0,a0,s2
ffffffffc020affa:	702000ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc020affe:	64ac                	ld	a1,72(s1)
ffffffffc020b000:	4705                	li	a4,1
ffffffffc020b002:	864e                	mv	a2,s3
ffffffffc020b004:	8526                	mv	a0,s1
ffffffffc020b006:	86ba                	mv	a3,a4
ffffffffc020b008:	df5ff0ef          	jal	ffffffffc020adfc <sfs_rwblock_nolock>
ffffffffc020b00c:	842a                	mv	s0,a0
ffffffffc020b00e:	b7e9                	j	ffffffffc020afd8 <sfs_wbuf+0x3c>
ffffffffc020b010:	00004697          	auipc	a3,0x4
ffffffffc020b014:	9b068693          	addi	a3,a3,-1616 # ffffffffc020e9c0 <etext+0x32ac>
ffffffffc020b018:	00001617          	auipc	a2,0x1
ffffffffc020b01c:	b3860613          	addi	a2,a2,-1224 # ffffffffc020bb50 <etext+0x43c>
ffffffffc020b020:	06b00593          	li	a1,107
ffffffffc020b024:	00004517          	auipc	a0,0x4
ffffffffc020b028:	98450513          	addi	a0,a0,-1660 # ffffffffc020e9a8 <etext+0x3294>
ffffffffc020b02c:	c1ef50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020b030 <sfs_sync_super>:
ffffffffc020b030:	1101                	addi	sp,sp,-32
ffffffffc020b032:	ec06                	sd	ra,24(sp)
ffffffffc020b034:	e822                	sd	s0,16(sp)
ffffffffc020b036:	e426                	sd	s1,8(sp)
ffffffffc020b038:	842a                	mv	s0,a0
ffffffffc020b03a:	11e000ef          	jal	ffffffffc020b158 <lock_sfs_io>
ffffffffc020b03e:	6428                	ld	a0,72(s0)
ffffffffc020b040:	6605                	lui	a2,0x1
ffffffffc020b042:	4581                	li	a1,0
ffffffffc020b044:	668000ef          	jal	ffffffffc020b6ac <memset>
ffffffffc020b048:	6428                	ld	a0,72(s0)
ffffffffc020b04a:	85a2                	mv	a1,s0
ffffffffc020b04c:	02c00613          	li	a2,44
ffffffffc020b050:	6ac000ef          	jal	ffffffffc020b6fc <memcpy>
ffffffffc020b054:	642c                	ld	a1,72(s0)
ffffffffc020b056:	8522                	mv	a0,s0
ffffffffc020b058:	4701                	li	a4,0
ffffffffc020b05a:	4685                	li	a3,1
ffffffffc020b05c:	4601                	li	a2,0
ffffffffc020b05e:	d9fff0ef          	jal	ffffffffc020adfc <sfs_rwblock_nolock>
ffffffffc020b062:	84aa                	mv	s1,a0
ffffffffc020b064:	8522                	mv	a0,s0
ffffffffc020b066:	102000ef          	jal	ffffffffc020b168 <unlock_sfs_io>
ffffffffc020b06a:	60e2                	ld	ra,24(sp)
ffffffffc020b06c:	6442                	ld	s0,16(sp)
ffffffffc020b06e:	8526                	mv	a0,s1
ffffffffc020b070:	64a2                	ld	s1,8(sp)
ffffffffc020b072:	6105                	addi	sp,sp,32
ffffffffc020b074:	8082                	ret

ffffffffc020b076 <sfs_sync_freemap>:
ffffffffc020b076:	7139                	addi	sp,sp,-64
ffffffffc020b078:	ec4e                	sd	s3,24(sp)
ffffffffc020b07a:	e852                	sd	s4,16(sp)
ffffffffc020b07c:	00456983          	lwu	s3,4(a0)
ffffffffc020b080:	8a2a                	mv	s4,a0
ffffffffc020b082:	7d08                	ld	a0,56(a0)
ffffffffc020b084:	67a1                	lui	a5,0x8
ffffffffc020b086:	17fd                	addi	a5,a5,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
ffffffffc020b088:	4581                	li	a1,0
ffffffffc020b08a:	f822                	sd	s0,48(sp)
ffffffffc020b08c:	fc06                	sd	ra,56(sp)
ffffffffc020b08e:	f426                	sd	s1,40(sp)
ffffffffc020b090:	99be                	add	s3,s3,a5
ffffffffc020b092:	954fe0ef          	jal	ffffffffc02091e6 <bitmap_getdata>
ffffffffc020b096:	00f9d993          	srli	s3,s3,0xf
ffffffffc020b09a:	842a                	mv	s0,a0
ffffffffc020b09c:	8552                	mv	a0,s4
ffffffffc020b09e:	0ba000ef          	jal	ffffffffc020b158 <lock_sfs_io>
ffffffffc020b0a2:	02098b63          	beqz	s3,ffffffffc020b0d8 <sfs_sync_freemap+0x62>
ffffffffc020b0a6:	09b2                	slli	s3,s3,0xc
ffffffffc020b0a8:	f04a                	sd	s2,32(sp)
ffffffffc020b0aa:	e456                	sd	s5,8(sp)
ffffffffc020b0ac:	99a2                	add	s3,s3,s0
ffffffffc020b0ae:	4909                	li	s2,2
ffffffffc020b0b0:	6a85                	lui	s5,0x1
ffffffffc020b0b2:	a021                	j	ffffffffc020b0ba <sfs_sync_freemap+0x44>
ffffffffc020b0b4:	2905                	addiw	s2,s2,1
ffffffffc020b0b6:	01340f63          	beq	s0,s3,ffffffffc020b0d4 <sfs_sync_freemap+0x5e>
ffffffffc020b0ba:	4705                	li	a4,1
ffffffffc020b0bc:	85a2                	mv	a1,s0
ffffffffc020b0be:	86ba                	mv	a3,a4
ffffffffc020b0c0:	864a                	mv	a2,s2
ffffffffc020b0c2:	8552                	mv	a0,s4
ffffffffc020b0c4:	d39ff0ef          	jal	ffffffffc020adfc <sfs_rwblock_nolock>
ffffffffc020b0c8:	84aa                	mv	s1,a0
ffffffffc020b0ca:	9456                	add	s0,s0,s5
ffffffffc020b0cc:	d565                	beqz	a0,ffffffffc020b0b4 <sfs_sync_freemap+0x3e>
ffffffffc020b0ce:	7902                	ld	s2,32(sp)
ffffffffc020b0d0:	6aa2                	ld	s5,8(sp)
ffffffffc020b0d2:	a021                	j	ffffffffc020b0da <sfs_sync_freemap+0x64>
ffffffffc020b0d4:	7902                	ld	s2,32(sp)
ffffffffc020b0d6:	6aa2                	ld	s5,8(sp)
ffffffffc020b0d8:	4481                	li	s1,0
ffffffffc020b0da:	8552                	mv	a0,s4
ffffffffc020b0dc:	08c000ef          	jal	ffffffffc020b168 <unlock_sfs_io>
ffffffffc020b0e0:	70e2                	ld	ra,56(sp)
ffffffffc020b0e2:	7442                	ld	s0,48(sp)
ffffffffc020b0e4:	69e2                	ld	s3,24(sp)
ffffffffc020b0e6:	6a42                	ld	s4,16(sp)
ffffffffc020b0e8:	8526                	mv	a0,s1
ffffffffc020b0ea:	74a2                	ld	s1,40(sp)
ffffffffc020b0ec:	6121                	addi	sp,sp,64
ffffffffc020b0ee:	8082                	ret

ffffffffc020b0f0 <sfs_clear_block>:
ffffffffc020b0f0:	7179                	addi	sp,sp,-48
ffffffffc020b0f2:	f022                	sd	s0,32(sp)
ffffffffc020b0f4:	e84a                	sd	s2,16(sp)
ffffffffc020b0f6:	e44e                	sd	s3,8(sp)
ffffffffc020b0f8:	f406                	sd	ra,40(sp)
ffffffffc020b0fa:	89b2                	mv	s3,a2
ffffffffc020b0fc:	ec26                	sd	s1,24(sp)
ffffffffc020b0fe:	842e                	mv	s0,a1
ffffffffc020b100:	892a                	mv	s2,a0
ffffffffc020b102:	056000ef          	jal	ffffffffc020b158 <lock_sfs_io>
ffffffffc020b106:	04893503          	ld	a0,72(s2)
ffffffffc020b10a:	6605                	lui	a2,0x1
ffffffffc020b10c:	4581                	li	a1,0
ffffffffc020b10e:	59e000ef          	jal	ffffffffc020b6ac <memset>
ffffffffc020b112:	02098d63          	beqz	s3,ffffffffc020b14c <sfs_clear_block+0x5c>
ffffffffc020b116:	013409bb          	addw	s3,s0,s3
ffffffffc020b11a:	a019                	j	ffffffffc020b120 <sfs_clear_block+0x30>
ffffffffc020b11c:	03340863          	beq	s0,s3,ffffffffc020b14c <sfs_clear_block+0x5c>
ffffffffc020b120:	04893583          	ld	a1,72(s2)
ffffffffc020b124:	4705                	li	a4,1
ffffffffc020b126:	8622                	mv	a2,s0
ffffffffc020b128:	86ba                	mv	a3,a4
ffffffffc020b12a:	854a                	mv	a0,s2
ffffffffc020b12c:	cd1ff0ef          	jal	ffffffffc020adfc <sfs_rwblock_nolock>
ffffffffc020b130:	84aa                	mv	s1,a0
ffffffffc020b132:	2405                	addiw	s0,s0,1
ffffffffc020b134:	d565                	beqz	a0,ffffffffc020b11c <sfs_clear_block+0x2c>
ffffffffc020b136:	854a                	mv	a0,s2
ffffffffc020b138:	030000ef          	jal	ffffffffc020b168 <unlock_sfs_io>
ffffffffc020b13c:	70a2                	ld	ra,40(sp)
ffffffffc020b13e:	7402                	ld	s0,32(sp)
ffffffffc020b140:	6942                	ld	s2,16(sp)
ffffffffc020b142:	69a2                	ld	s3,8(sp)
ffffffffc020b144:	8526                	mv	a0,s1
ffffffffc020b146:	64e2                	ld	s1,24(sp)
ffffffffc020b148:	6145                	addi	sp,sp,48
ffffffffc020b14a:	8082                	ret
ffffffffc020b14c:	4481                	li	s1,0
ffffffffc020b14e:	b7e5                	j	ffffffffc020b136 <sfs_clear_block+0x46>

ffffffffc020b150 <lock_sfs_fs>:
ffffffffc020b150:	05050513          	addi	a0,a0,80
ffffffffc020b154:	ceef906f          	j	ffffffffc0204642 <down>

ffffffffc020b158 <lock_sfs_io>:
ffffffffc020b158:	06850513          	addi	a0,a0,104
ffffffffc020b15c:	ce6f906f          	j	ffffffffc0204642 <down>

ffffffffc020b160 <unlock_sfs_fs>:
ffffffffc020b160:	05050513          	addi	a0,a0,80
ffffffffc020b164:	cdaf906f          	j	ffffffffc020463e <up>

ffffffffc020b168 <unlock_sfs_io>:
ffffffffc020b168:	06850513          	addi	a0,a0,104
ffffffffc020b16c:	cd2f906f          	j	ffffffffc020463e <up>

ffffffffc020b170 <hash32>:
ffffffffc020b170:	9e3707b7          	lui	a5,0x9e370
ffffffffc020b174:	2785                	addiw	a5,a5,1 # ffffffff9e370001 <_binary_bin_sfs_img_size+0xffffffff9e2fad01>
ffffffffc020b176:	02a787bb          	mulw	a5,a5,a0
ffffffffc020b17a:	02000513          	li	a0,32
ffffffffc020b17e:	9d0d                	subw	a0,a0,a1
ffffffffc020b180:	00a7d53b          	srlw	a0,a5,a0
ffffffffc020b184:	8082                	ret

ffffffffc020b186 <printnum>:
ffffffffc020b186:	7139                	addi	sp,sp,-64
ffffffffc020b188:	02071893          	slli	a7,a4,0x20
ffffffffc020b18c:	f822                	sd	s0,48(sp)
ffffffffc020b18e:	f426                	sd	s1,40(sp)
ffffffffc020b190:	f04a                	sd	s2,32(sp)
ffffffffc020b192:	ec4e                	sd	s3,24(sp)
ffffffffc020b194:	e456                	sd	s5,8(sp)
ffffffffc020b196:	0208d893          	srli	a7,a7,0x20
ffffffffc020b19a:	fc06                	sd	ra,56(sp)
ffffffffc020b19c:	0316fab3          	remu	s5,a3,a7
ffffffffc020b1a0:	fff7841b          	addiw	s0,a5,-1
ffffffffc020b1a4:	84aa                	mv	s1,a0
ffffffffc020b1a6:	89ae                	mv	s3,a1
ffffffffc020b1a8:	8932                	mv	s2,a2
ffffffffc020b1aa:	0516f063          	bgeu	a3,a7,ffffffffc020b1ea <printnum+0x64>
ffffffffc020b1ae:	e852                	sd	s4,16(sp)
ffffffffc020b1b0:	4705                	li	a4,1
ffffffffc020b1b2:	8a42                	mv	s4,a6
ffffffffc020b1b4:	00f75863          	bge	a4,a5,ffffffffc020b1c4 <printnum+0x3e>
ffffffffc020b1b8:	864e                	mv	a2,s3
ffffffffc020b1ba:	85ca                	mv	a1,s2
ffffffffc020b1bc:	8552                	mv	a0,s4
ffffffffc020b1be:	347d                	addiw	s0,s0,-1
ffffffffc020b1c0:	9482                	jalr	s1
ffffffffc020b1c2:	f87d                	bnez	s0,ffffffffc020b1b8 <printnum+0x32>
ffffffffc020b1c4:	6a42                	ld	s4,16(sp)
ffffffffc020b1c6:	00004797          	auipc	a5,0x4
ffffffffc020b1ca:	84278793          	addi	a5,a5,-1982 # ffffffffc020ea08 <etext+0x32f4>
ffffffffc020b1ce:	97d6                	add	a5,a5,s5
ffffffffc020b1d0:	7442                	ld	s0,48(sp)
ffffffffc020b1d2:	0007c503          	lbu	a0,0(a5)
ffffffffc020b1d6:	70e2                	ld	ra,56(sp)
ffffffffc020b1d8:	6aa2                	ld	s5,8(sp)
ffffffffc020b1da:	864e                	mv	a2,s3
ffffffffc020b1dc:	85ca                	mv	a1,s2
ffffffffc020b1de:	69e2                	ld	s3,24(sp)
ffffffffc020b1e0:	7902                	ld	s2,32(sp)
ffffffffc020b1e2:	87a6                	mv	a5,s1
ffffffffc020b1e4:	74a2                	ld	s1,40(sp)
ffffffffc020b1e6:	6121                	addi	sp,sp,64
ffffffffc020b1e8:	8782                	jr	a5
ffffffffc020b1ea:	0316d6b3          	divu	a3,a3,a7
ffffffffc020b1ee:	87a2                	mv	a5,s0
ffffffffc020b1f0:	f97ff0ef          	jal	ffffffffc020b186 <printnum>
ffffffffc020b1f4:	bfc9                	j	ffffffffc020b1c6 <printnum+0x40>

ffffffffc020b1f6 <sprintputch>:
ffffffffc020b1f6:	499c                	lw	a5,16(a1)
ffffffffc020b1f8:	6198                	ld	a4,0(a1)
ffffffffc020b1fa:	6594                	ld	a3,8(a1)
ffffffffc020b1fc:	2785                	addiw	a5,a5,1
ffffffffc020b1fe:	c99c                	sw	a5,16(a1)
ffffffffc020b200:	00d77763          	bgeu	a4,a3,ffffffffc020b20e <sprintputch+0x18>
ffffffffc020b204:	00170793          	addi	a5,a4,1
ffffffffc020b208:	e19c                	sd	a5,0(a1)
ffffffffc020b20a:	00a70023          	sb	a0,0(a4)
ffffffffc020b20e:	8082                	ret

ffffffffc020b210 <vprintfmt>:
ffffffffc020b210:	7119                	addi	sp,sp,-128
ffffffffc020b212:	f4a6                	sd	s1,104(sp)
ffffffffc020b214:	f0ca                	sd	s2,96(sp)
ffffffffc020b216:	ecce                	sd	s3,88(sp)
ffffffffc020b218:	e8d2                	sd	s4,80(sp)
ffffffffc020b21a:	e4d6                	sd	s5,72(sp)
ffffffffc020b21c:	e0da                	sd	s6,64(sp)
ffffffffc020b21e:	fc5e                	sd	s7,56(sp)
ffffffffc020b220:	f466                	sd	s9,40(sp)
ffffffffc020b222:	fc86                	sd	ra,120(sp)
ffffffffc020b224:	f8a2                	sd	s0,112(sp)
ffffffffc020b226:	f862                	sd	s8,48(sp)
ffffffffc020b228:	f06a                	sd	s10,32(sp)
ffffffffc020b22a:	ec6e                	sd	s11,24(sp)
ffffffffc020b22c:	84aa                	mv	s1,a0
ffffffffc020b22e:	8cb6                	mv	s9,a3
ffffffffc020b230:	8aba                	mv	s5,a4
ffffffffc020b232:	89ae                	mv	s3,a1
ffffffffc020b234:	8932                	mv	s2,a2
ffffffffc020b236:	02500a13          	li	s4,37
ffffffffc020b23a:	05500b93          	li	s7,85
ffffffffc020b23e:	00004b17          	auipc	s6,0x4
ffffffffc020b242:	472b0b13          	addi	s6,s6,1138 # ffffffffc020f6b0 <sfs_node_dirops+0x80>
ffffffffc020b246:	000cc503          	lbu	a0,0(s9)
ffffffffc020b24a:	001c8413          	addi	s0,s9,1
ffffffffc020b24e:	01450b63          	beq	a0,s4,ffffffffc020b264 <vprintfmt+0x54>
ffffffffc020b252:	cd15                	beqz	a0,ffffffffc020b28e <vprintfmt+0x7e>
ffffffffc020b254:	864e                	mv	a2,s3
ffffffffc020b256:	85ca                	mv	a1,s2
ffffffffc020b258:	9482                	jalr	s1
ffffffffc020b25a:	00044503          	lbu	a0,0(s0)
ffffffffc020b25e:	0405                	addi	s0,s0,1
ffffffffc020b260:	ff4519e3          	bne	a0,s4,ffffffffc020b252 <vprintfmt+0x42>
ffffffffc020b264:	5d7d                	li	s10,-1
ffffffffc020b266:	8dea                	mv	s11,s10
ffffffffc020b268:	02000813          	li	a6,32
ffffffffc020b26c:	4c01                	li	s8,0
ffffffffc020b26e:	4581                	li	a1,0
ffffffffc020b270:	00044703          	lbu	a4,0(s0)
ffffffffc020b274:	00140c93          	addi	s9,s0,1
ffffffffc020b278:	fdd7061b          	addiw	a2,a4,-35
ffffffffc020b27c:	0ff67613          	zext.b	a2,a2
ffffffffc020b280:	02cbe663          	bltu	s7,a2,ffffffffc020b2ac <vprintfmt+0x9c>
ffffffffc020b284:	060a                	slli	a2,a2,0x2
ffffffffc020b286:	965a                	add	a2,a2,s6
ffffffffc020b288:	421c                	lw	a5,0(a2)
ffffffffc020b28a:	97da                	add	a5,a5,s6
ffffffffc020b28c:	8782                	jr	a5
ffffffffc020b28e:	70e6                	ld	ra,120(sp)
ffffffffc020b290:	7446                	ld	s0,112(sp)
ffffffffc020b292:	74a6                	ld	s1,104(sp)
ffffffffc020b294:	7906                	ld	s2,96(sp)
ffffffffc020b296:	69e6                	ld	s3,88(sp)
ffffffffc020b298:	6a46                	ld	s4,80(sp)
ffffffffc020b29a:	6aa6                	ld	s5,72(sp)
ffffffffc020b29c:	6b06                	ld	s6,64(sp)
ffffffffc020b29e:	7be2                	ld	s7,56(sp)
ffffffffc020b2a0:	7c42                	ld	s8,48(sp)
ffffffffc020b2a2:	7ca2                	ld	s9,40(sp)
ffffffffc020b2a4:	7d02                	ld	s10,32(sp)
ffffffffc020b2a6:	6de2                	ld	s11,24(sp)
ffffffffc020b2a8:	6109                	addi	sp,sp,128
ffffffffc020b2aa:	8082                	ret
ffffffffc020b2ac:	864e                	mv	a2,s3
ffffffffc020b2ae:	85ca                	mv	a1,s2
ffffffffc020b2b0:	02500513          	li	a0,37
ffffffffc020b2b4:	9482                	jalr	s1
ffffffffc020b2b6:	fff44783          	lbu	a5,-1(s0)
ffffffffc020b2ba:	02500713          	li	a4,37
ffffffffc020b2be:	8ca2                	mv	s9,s0
ffffffffc020b2c0:	f8e783e3          	beq	a5,a4,ffffffffc020b246 <vprintfmt+0x36>
ffffffffc020b2c4:	ffecc783          	lbu	a5,-2(s9)
ffffffffc020b2c8:	1cfd                	addi	s9,s9,-1
ffffffffc020b2ca:	fee79de3          	bne	a5,a4,ffffffffc020b2c4 <vprintfmt+0xb4>
ffffffffc020b2ce:	bfa5                	j	ffffffffc020b246 <vprintfmt+0x36>
ffffffffc020b2d0:	00144683          	lbu	a3,1(s0)
ffffffffc020b2d4:	4525                	li	a0,9
ffffffffc020b2d6:	fd070d1b          	addiw	s10,a4,-48
ffffffffc020b2da:	fd06879b          	addiw	a5,a3,-48
ffffffffc020b2de:	28f56063          	bltu	a0,a5,ffffffffc020b55e <vprintfmt+0x34e>
ffffffffc020b2e2:	2681                	sext.w	a3,a3
ffffffffc020b2e4:	8466                	mv	s0,s9
ffffffffc020b2e6:	002d179b          	slliw	a5,s10,0x2
ffffffffc020b2ea:	00144703          	lbu	a4,1(s0)
ffffffffc020b2ee:	01a787bb          	addw	a5,a5,s10
ffffffffc020b2f2:	0017979b          	slliw	a5,a5,0x1
ffffffffc020b2f6:	9fb5                	addw	a5,a5,a3
ffffffffc020b2f8:	fd07061b          	addiw	a2,a4,-48
ffffffffc020b2fc:	0405                	addi	s0,s0,1
ffffffffc020b2fe:	fd078d1b          	addiw	s10,a5,-48
ffffffffc020b302:	0007069b          	sext.w	a3,a4
ffffffffc020b306:	fec570e3          	bgeu	a0,a2,ffffffffc020b2e6 <vprintfmt+0xd6>
ffffffffc020b30a:	f60dd3e3          	bgez	s11,ffffffffc020b270 <vprintfmt+0x60>
ffffffffc020b30e:	8dea                	mv	s11,s10
ffffffffc020b310:	5d7d                	li	s10,-1
ffffffffc020b312:	bfb9                	j	ffffffffc020b270 <vprintfmt+0x60>
ffffffffc020b314:	883a                	mv	a6,a4
ffffffffc020b316:	8466                	mv	s0,s9
ffffffffc020b318:	bfa1                	j	ffffffffc020b270 <vprintfmt+0x60>
ffffffffc020b31a:	8466                	mv	s0,s9
ffffffffc020b31c:	4c05                	li	s8,1
ffffffffc020b31e:	bf89                	j	ffffffffc020b270 <vprintfmt+0x60>
ffffffffc020b320:	4785                	li	a5,1
ffffffffc020b322:	008a8613          	addi	a2,s5,8 # 1008 <_binary_bin_swap_img_size-0x6cf8>
ffffffffc020b326:	00b7c463          	blt	a5,a1,ffffffffc020b32e <vprintfmt+0x11e>
ffffffffc020b32a:	1c058363          	beqz	a1,ffffffffc020b4f0 <vprintfmt+0x2e0>
ffffffffc020b32e:	000ab683          	ld	a3,0(s5)
ffffffffc020b332:	4741                	li	a4,16
ffffffffc020b334:	8ab2                	mv	s5,a2
ffffffffc020b336:	2801                	sext.w	a6,a6
ffffffffc020b338:	87ee                	mv	a5,s11
ffffffffc020b33a:	864a                	mv	a2,s2
ffffffffc020b33c:	85ce                	mv	a1,s3
ffffffffc020b33e:	8526                	mv	a0,s1
ffffffffc020b340:	e47ff0ef          	jal	ffffffffc020b186 <printnum>
ffffffffc020b344:	b709                	j	ffffffffc020b246 <vprintfmt+0x36>
ffffffffc020b346:	000aa503          	lw	a0,0(s5)
ffffffffc020b34a:	864e                	mv	a2,s3
ffffffffc020b34c:	85ca                	mv	a1,s2
ffffffffc020b34e:	9482                	jalr	s1
ffffffffc020b350:	0aa1                	addi	s5,s5,8
ffffffffc020b352:	bdd5                	j	ffffffffc020b246 <vprintfmt+0x36>
ffffffffc020b354:	4785                	li	a5,1
ffffffffc020b356:	008a8613          	addi	a2,s5,8
ffffffffc020b35a:	00b7c463          	blt	a5,a1,ffffffffc020b362 <vprintfmt+0x152>
ffffffffc020b35e:	18058463          	beqz	a1,ffffffffc020b4e6 <vprintfmt+0x2d6>
ffffffffc020b362:	000ab683          	ld	a3,0(s5)
ffffffffc020b366:	4729                	li	a4,10
ffffffffc020b368:	8ab2                	mv	s5,a2
ffffffffc020b36a:	b7f1                	j	ffffffffc020b336 <vprintfmt+0x126>
ffffffffc020b36c:	864e                	mv	a2,s3
ffffffffc020b36e:	85ca                	mv	a1,s2
ffffffffc020b370:	03000513          	li	a0,48
ffffffffc020b374:	e042                	sd	a6,0(sp)
ffffffffc020b376:	9482                	jalr	s1
ffffffffc020b378:	864e                	mv	a2,s3
ffffffffc020b37a:	85ca                	mv	a1,s2
ffffffffc020b37c:	07800513          	li	a0,120
ffffffffc020b380:	9482                	jalr	s1
ffffffffc020b382:	000ab683          	ld	a3,0(s5)
ffffffffc020b386:	6802                	ld	a6,0(sp)
ffffffffc020b388:	4741                	li	a4,16
ffffffffc020b38a:	0aa1                	addi	s5,s5,8
ffffffffc020b38c:	b76d                	j	ffffffffc020b336 <vprintfmt+0x126>
ffffffffc020b38e:	864e                	mv	a2,s3
ffffffffc020b390:	85ca                	mv	a1,s2
ffffffffc020b392:	02500513          	li	a0,37
ffffffffc020b396:	9482                	jalr	s1
ffffffffc020b398:	b57d                	j	ffffffffc020b246 <vprintfmt+0x36>
ffffffffc020b39a:	000aad03          	lw	s10,0(s5)
ffffffffc020b39e:	8466                	mv	s0,s9
ffffffffc020b3a0:	0aa1                	addi	s5,s5,8
ffffffffc020b3a2:	b7a5                	j	ffffffffc020b30a <vprintfmt+0xfa>
ffffffffc020b3a4:	4785                	li	a5,1
ffffffffc020b3a6:	008a8613          	addi	a2,s5,8
ffffffffc020b3aa:	00b7c463          	blt	a5,a1,ffffffffc020b3b2 <vprintfmt+0x1a2>
ffffffffc020b3ae:	12058763          	beqz	a1,ffffffffc020b4dc <vprintfmt+0x2cc>
ffffffffc020b3b2:	000ab683          	ld	a3,0(s5)
ffffffffc020b3b6:	4721                	li	a4,8
ffffffffc020b3b8:	8ab2                	mv	s5,a2
ffffffffc020b3ba:	bfb5                	j	ffffffffc020b336 <vprintfmt+0x126>
ffffffffc020b3bc:	87ee                	mv	a5,s11
ffffffffc020b3be:	000dd363          	bgez	s11,ffffffffc020b3c4 <vprintfmt+0x1b4>
ffffffffc020b3c2:	4781                	li	a5,0
ffffffffc020b3c4:	00078d9b          	sext.w	s11,a5
ffffffffc020b3c8:	8466                	mv	s0,s9
ffffffffc020b3ca:	b55d                	j	ffffffffc020b270 <vprintfmt+0x60>
ffffffffc020b3cc:	0008041b          	sext.w	s0,a6
ffffffffc020b3d0:	fd340793          	addi	a5,s0,-45
ffffffffc020b3d4:	01b02733          	sgtz	a4,s11
ffffffffc020b3d8:	00f037b3          	snez	a5,a5
ffffffffc020b3dc:	8ff9                	and	a5,a5,a4
ffffffffc020b3de:	000ab703          	ld	a4,0(s5)
ffffffffc020b3e2:	008a8693          	addi	a3,s5,8
ffffffffc020b3e6:	e436                	sd	a3,8(sp)
ffffffffc020b3e8:	12070563          	beqz	a4,ffffffffc020b512 <vprintfmt+0x302>
ffffffffc020b3ec:	12079d63          	bnez	a5,ffffffffc020b526 <vprintfmt+0x316>
ffffffffc020b3f0:	00074783          	lbu	a5,0(a4)
ffffffffc020b3f4:	0007851b          	sext.w	a0,a5
ffffffffc020b3f8:	c78d                	beqz	a5,ffffffffc020b422 <vprintfmt+0x212>
ffffffffc020b3fa:	00170a93          	addi	s5,a4,1
ffffffffc020b3fe:	547d                	li	s0,-1
ffffffffc020b400:	000d4563          	bltz	s10,ffffffffc020b40a <vprintfmt+0x1fa>
ffffffffc020b404:	3d7d                	addiw	s10,s10,-1
ffffffffc020b406:	008d0e63          	beq	s10,s0,ffffffffc020b422 <vprintfmt+0x212>
ffffffffc020b40a:	020c1863          	bnez	s8,ffffffffc020b43a <vprintfmt+0x22a>
ffffffffc020b40e:	864e                	mv	a2,s3
ffffffffc020b410:	85ca                	mv	a1,s2
ffffffffc020b412:	9482                	jalr	s1
ffffffffc020b414:	000ac783          	lbu	a5,0(s5)
ffffffffc020b418:	0a85                	addi	s5,s5,1
ffffffffc020b41a:	3dfd                	addiw	s11,s11,-1
ffffffffc020b41c:	0007851b          	sext.w	a0,a5
ffffffffc020b420:	f3e5                	bnez	a5,ffffffffc020b400 <vprintfmt+0x1f0>
ffffffffc020b422:	01b05a63          	blez	s11,ffffffffc020b436 <vprintfmt+0x226>
ffffffffc020b426:	864e                	mv	a2,s3
ffffffffc020b428:	85ca                	mv	a1,s2
ffffffffc020b42a:	02000513          	li	a0,32
ffffffffc020b42e:	3dfd                	addiw	s11,s11,-1
ffffffffc020b430:	9482                	jalr	s1
ffffffffc020b432:	fe0d9ae3          	bnez	s11,ffffffffc020b426 <vprintfmt+0x216>
ffffffffc020b436:	6aa2                	ld	s5,8(sp)
ffffffffc020b438:	b539                	j	ffffffffc020b246 <vprintfmt+0x36>
ffffffffc020b43a:	3781                	addiw	a5,a5,-32
ffffffffc020b43c:	05e00713          	li	a4,94
ffffffffc020b440:	fcf777e3          	bgeu	a4,a5,ffffffffc020b40e <vprintfmt+0x1fe>
ffffffffc020b444:	03f00513          	li	a0,63
ffffffffc020b448:	864e                	mv	a2,s3
ffffffffc020b44a:	85ca                	mv	a1,s2
ffffffffc020b44c:	9482                	jalr	s1
ffffffffc020b44e:	000ac783          	lbu	a5,0(s5)
ffffffffc020b452:	0a85                	addi	s5,s5,1
ffffffffc020b454:	3dfd                	addiw	s11,s11,-1
ffffffffc020b456:	0007851b          	sext.w	a0,a5
ffffffffc020b45a:	d7e1                	beqz	a5,ffffffffc020b422 <vprintfmt+0x212>
ffffffffc020b45c:	fa0d54e3          	bgez	s10,ffffffffc020b404 <vprintfmt+0x1f4>
ffffffffc020b460:	bfe9                	j	ffffffffc020b43a <vprintfmt+0x22a>
ffffffffc020b462:	000aa783          	lw	a5,0(s5)
ffffffffc020b466:	46e1                	li	a3,24
ffffffffc020b468:	0aa1                	addi	s5,s5,8
ffffffffc020b46a:	41f7d71b          	sraiw	a4,a5,0x1f
ffffffffc020b46e:	8fb9                	xor	a5,a5,a4
ffffffffc020b470:	40e7873b          	subw	a4,a5,a4
ffffffffc020b474:	02e6c663          	blt	a3,a4,ffffffffc020b4a0 <vprintfmt+0x290>
ffffffffc020b478:	00004797          	auipc	a5,0x4
ffffffffc020b47c:	39078793          	addi	a5,a5,912 # ffffffffc020f808 <error_string>
ffffffffc020b480:	00371693          	slli	a3,a4,0x3
ffffffffc020b484:	97b6                	add	a5,a5,a3
ffffffffc020b486:	639c                	ld	a5,0(a5)
ffffffffc020b488:	cf81                	beqz	a5,ffffffffc020b4a0 <vprintfmt+0x290>
ffffffffc020b48a:	873e                	mv	a4,a5
ffffffffc020b48c:	00000697          	auipc	a3,0x0
ffffffffc020b490:	2b468693          	addi	a3,a3,692 # ffffffffc020b740 <etext+0x2c>
ffffffffc020b494:	864a                	mv	a2,s2
ffffffffc020b496:	85ce                	mv	a1,s3
ffffffffc020b498:	8526                	mv	a0,s1
ffffffffc020b49a:	0f2000ef          	jal	ffffffffc020b58c <printfmt>
ffffffffc020b49e:	b365                	j	ffffffffc020b246 <vprintfmt+0x36>
ffffffffc020b4a0:	00003697          	auipc	a3,0x3
ffffffffc020b4a4:	58868693          	addi	a3,a3,1416 # ffffffffc020ea28 <etext+0x3314>
ffffffffc020b4a8:	864a                	mv	a2,s2
ffffffffc020b4aa:	85ce                	mv	a1,s3
ffffffffc020b4ac:	8526                	mv	a0,s1
ffffffffc020b4ae:	0de000ef          	jal	ffffffffc020b58c <printfmt>
ffffffffc020b4b2:	bb51                	j	ffffffffc020b246 <vprintfmt+0x36>
ffffffffc020b4b4:	4785                	li	a5,1
ffffffffc020b4b6:	008a8c13          	addi	s8,s5,8
ffffffffc020b4ba:	00b7c363          	blt	a5,a1,ffffffffc020b4c0 <vprintfmt+0x2b0>
ffffffffc020b4be:	cd81                	beqz	a1,ffffffffc020b4d6 <vprintfmt+0x2c6>
ffffffffc020b4c0:	000ab403          	ld	s0,0(s5)
ffffffffc020b4c4:	02044b63          	bltz	s0,ffffffffc020b4fa <vprintfmt+0x2ea>
ffffffffc020b4c8:	86a2                	mv	a3,s0
ffffffffc020b4ca:	8ae2                	mv	s5,s8
ffffffffc020b4cc:	4729                	li	a4,10
ffffffffc020b4ce:	b5a5                	j	ffffffffc020b336 <vprintfmt+0x126>
ffffffffc020b4d0:	2585                	addiw	a1,a1,1
ffffffffc020b4d2:	8466                	mv	s0,s9
ffffffffc020b4d4:	bb71                	j	ffffffffc020b270 <vprintfmt+0x60>
ffffffffc020b4d6:	000aa403          	lw	s0,0(s5)
ffffffffc020b4da:	b7ed                	j	ffffffffc020b4c4 <vprintfmt+0x2b4>
ffffffffc020b4dc:	000ae683          	lwu	a3,0(s5)
ffffffffc020b4e0:	4721                	li	a4,8
ffffffffc020b4e2:	8ab2                	mv	s5,a2
ffffffffc020b4e4:	bd89                	j	ffffffffc020b336 <vprintfmt+0x126>
ffffffffc020b4e6:	000ae683          	lwu	a3,0(s5)
ffffffffc020b4ea:	4729                	li	a4,10
ffffffffc020b4ec:	8ab2                	mv	s5,a2
ffffffffc020b4ee:	b5a1                	j	ffffffffc020b336 <vprintfmt+0x126>
ffffffffc020b4f0:	000ae683          	lwu	a3,0(s5)
ffffffffc020b4f4:	4741                	li	a4,16
ffffffffc020b4f6:	8ab2                	mv	s5,a2
ffffffffc020b4f8:	bd3d                	j	ffffffffc020b336 <vprintfmt+0x126>
ffffffffc020b4fa:	864e                	mv	a2,s3
ffffffffc020b4fc:	85ca                	mv	a1,s2
ffffffffc020b4fe:	02d00513          	li	a0,45
ffffffffc020b502:	e042                	sd	a6,0(sp)
ffffffffc020b504:	9482                	jalr	s1
ffffffffc020b506:	6802                	ld	a6,0(sp)
ffffffffc020b508:	408006b3          	neg	a3,s0
ffffffffc020b50c:	8ae2                	mv	s5,s8
ffffffffc020b50e:	4729                	li	a4,10
ffffffffc020b510:	b51d                	j	ffffffffc020b336 <vprintfmt+0x126>
ffffffffc020b512:	eba1                	bnez	a5,ffffffffc020b562 <vprintfmt+0x352>
ffffffffc020b514:	02800793          	li	a5,40
ffffffffc020b518:	853e                	mv	a0,a5
ffffffffc020b51a:	00003a97          	auipc	s5,0x3
ffffffffc020b51e:	507a8a93          	addi	s5,s5,1287 # ffffffffc020ea21 <etext+0x330d>
ffffffffc020b522:	547d                	li	s0,-1
ffffffffc020b524:	bdf1                	j	ffffffffc020b400 <vprintfmt+0x1f0>
ffffffffc020b526:	853a                	mv	a0,a4
ffffffffc020b528:	85ea                	mv	a1,s10
ffffffffc020b52a:	e03a                	sd	a4,0(sp)
ffffffffc020b52c:	0e4000ef          	jal	ffffffffc020b610 <strnlen>
ffffffffc020b530:	40ad8dbb          	subw	s11,s11,a0
ffffffffc020b534:	6702                	ld	a4,0(sp)
ffffffffc020b536:	01b05b63          	blez	s11,ffffffffc020b54c <vprintfmt+0x33c>
ffffffffc020b53a:	864e                	mv	a2,s3
ffffffffc020b53c:	85ca                	mv	a1,s2
ffffffffc020b53e:	8522                	mv	a0,s0
ffffffffc020b540:	e03a                	sd	a4,0(sp)
ffffffffc020b542:	3dfd                	addiw	s11,s11,-1
ffffffffc020b544:	9482                	jalr	s1
ffffffffc020b546:	6702                	ld	a4,0(sp)
ffffffffc020b548:	fe0d99e3          	bnez	s11,ffffffffc020b53a <vprintfmt+0x32a>
ffffffffc020b54c:	00074783          	lbu	a5,0(a4)
ffffffffc020b550:	0007851b          	sext.w	a0,a5
ffffffffc020b554:	ee0781e3          	beqz	a5,ffffffffc020b436 <vprintfmt+0x226>
ffffffffc020b558:	00170a93          	addi	s5,a4,1
ffffffffc020b55c:	b54d                	j	ffffffffc020b3fe <vprintfmt+0x1ee>
ffffffffc020b55e:	8466                	mv	s0,s9
ffffffffc020b560:	b36d                	j	ffffffffc020b30a <vprintfmt+0xfa>
ffffffffc020b562:	85ea                	mv	a1,s10
ffffffffc020b564:	00003517          	auipc	a0,0x3
ffffffffc020b568:	4bc50513          	addi	a0,a0,1212 # ffffffffc020ea20 <etext+0x330c>
ffffffffc020b56c:	0a4000ef          	jal	ffffffffc020b610 <strnlen>
ffffffffc020b570:	40ad8dbb          	subw	s11,s11,a0
ffffffffc020b574:	02800793          	li	a5,40
ffffffffc020b578:	00003717          	auipc	a4,0x3
ffffffffc020b57c:	4a870713          	addi	a4,a4,1192 # ffffffffc020ea20 <etext+0x330c>
ffffffffc020b580:	853e                	mv	a0,a5
ffffffffc020b582:	fbb04ce3          	bgtz	s11,ffffffffc020b53a <vprintfmt+0x32a>
ffffffffc020b586:	00170a93          	addi	s5,a4,1
ffffffffc020b58a:	bd95                	j	ffffffffc020b3fe <vprintfmt+0x1ee>

ffffffffc020b58c <printfmt>:
ffffffffc020b58c:	7139                	addi	sp,sp,-64
ffffffffc020b58e:	02010313          	addi	t1,sp,32
ffffffffc020b592:	f03a                	sd	a4,32(sp)
ffffffffc020b594:	871a                	mv	a4,t1
ffffffffc020b596:	ec06                	sd	ra,24(sp)
ffffffffc020b598:	f43e                	sd	a5,40(sp)
ffffffffc020b59a:	f842                	sd	a6,48(sp)
ffffffffc020b59c:	fc46                	sd	a7,56(sp)
ffffffffc020b59e:	e41a                	sd	t1,8(sp)
ffffffffc020b5a0:	c71ff0ef          	jal	ffffffffc020b210 <vprintfmt>
ffffffffc020b5a4:	60e2                	ld	ra,24(sp)
ffffffffc020b5a6:	6121                	addi	sp,sp,64
ffffffffc020b5a8:	8082                	ret

ffffffffc020b5aa <snprintf>:
ffffffffc020b5aa:	711d                	addi	sp,sp,-96
ffffffffc020b5ac:	15fd                	addi	a1,a1,-1
ffffffffc020b5ae:	95aa                	add	a1,a1,a0
ffffffffc020b5b0:	03810313          	addi	t1,sp,56
ffffffffc020b5b4:	f406                	sd	ra,40(sp)
ffffffffc020b5b6:	e82e                	sd	a1,16(sp)
ffffffffc020b5b8:	e42a                	sd	a0,8(sp)
ffffffffc020b5ba:	fc36                	sd	a3,56(sp)
ffffffffc020b5bc:	e0ba                	sd	a4,64(sp)
ffffffffc020b5be:	e4be                	sd	a5,72(sp)
ffffffffc020b5c0:	e8c2                	sd	a6,80(sp)
ffffffffc020b5c2:	ecc6                	sd	a7,88(sp)
ffffffffc020b5c4:	cc02                	sw	zero,24(sp)
ffffffffc020b5c6:	e01a                	sd	t1,0(sp)
ffffffffc020b5c8:	c515                	beqz	a0,ffffffffc020b5f4 <snprintf+0x4a>
ffffffffc020b5ca:	02a5e563          	bltu	a1,a0,ffffffffc020b5f4 <snprintf+0x4a>
ffffffffc020b5ce:	75dd                	lui	a1,0xffff7
ffffffffc020b5d0:	86b2                	mv	a3,a2
ffffffffc020b5d2:	00000517          	auipc	a0,0x0
ffffffffc020b5d6:	c2450513          	addi	a0,a0,-988 # ffffffffc020b1f6 <sprintputch>
ffffffffc020b5da:	871a                	mv	a4,t1
ffffffffc020b5dc:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc020b5e0:	0030                	addi	a2,sp,8
ffffffffc020b5e2:	c2fff0ef          	jal	ffffffffc020b210 <vprintfmt>
ffffffffc020b5e6:	67a2                	ld	a5,8(sp)
ffffffffc020b5e8:	00078023          	sb	zero,0(a5)
ffffffffc020b5ec:	4562                	lw	a0,24(sp)
ffffffffc020b5ee:	70a2                	ld	ra,40(sp)
ffffffffc020b5f0:	6125                	addi	sp,sp,96
ffffffffc020b5f2:	8082                	ret
ffffffffc020b5f4:	5575                	li	a0,-3
ffffffffc020b5f6:	bfe5                	j	ffffffffc020b5ee <snprintf+0x44>

ffffffffc020b5f8 <strlen>:
ffffffffc020b5f8:	00054783          	lbu	a5,0(a0)
ffffffffc020b5fc:	cb81                	beqz	a5,ffffffffc020b60c <strlen+0x14>
ffffffffc020b5fe:	4781                	li	a5,0
ffffffffc020b600:	0785                	addi	a5,a5,1
ffffffffc020b602:	00f50733          	add	a4,a0,a5
ffffffffc020b606:	00074703          	lbu	a4,0(a4)
ffffffffc020b60a:	fb7d                	bnez	a4,ffffffffc020b600 <strlen+0x8>
ffffffffc020b60c:	853e                	mv	a0,a5
ffffffffc020b60e:	8082                	ret

ffffffffc020b610 <strnlen>:
ffffffffc020b610:	4781                	li	a5,0
ffffffffc020b612:	e589                	bnez	a1,ffffffffc020b61c <strnlen+0xc>
ffffffffc020b614:	a811                	j	ffffffffc020b628 <strnlen+0x18>
ffffffffc020b616:	0785                	addi	a5,a5,1
ffffffffc020b618:	00f58863          	beq	a1,a5,ffffffffc020b628 <strnlen+0x18>
ffffffffc020b61c:	00f50733          	add	a4,a0,a5
ffffffffc020b620:	00074703          	lbu	a4,0(a4)
ffffffffc020b624:	fb6d                	bnez	a4,ffffffffc020b616 <strnlen+0x6>
ffffffffc020b626:	85be                	mv	a1,a5
ffffffffc020b628:	852e                	mv	a0,a1
ffffffffc020b62a:	8082                	ret

ffffffffc020b62c <strcpy>:
ffffffffc020b62c:	87aa                	mv	a5,a0
ffffffffc020b62e:	0005c703          	lbu	a4,0(a1)
ffffffffc020b632:	0585                	addi	a1,a1,1
ffffffffc020b634:	0785                	addi	a5,a5,1
ffffffffc020b636:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b63a:	fb75                	bnez	a4,ffffffffc020b62e <strcpy+0x2>
ffffffffc020b63c:	8082                	ret

ffffffffc020b63e <strcmp>:
ffffffffc020b63e:	00054783          	lbu	a5,0(a0)
ffffffffc020b642:	e791                	bnez	a5,ffffffffc020b64e <strcmp+0x10>
ffffffffc020b644:	a01d                	j	ffffffffc020b66a <strcmp+0x2c>
ffffffffc020b646:	00054783          	lbu	a5,0(a0)
ffffffffc020b64a:	cb99                	beqz	a5,ffffffffc020b660 <strcmp+0x22>
ffffffffc020b64c:	0585                	addi	a1,a1,1
ffffffffc020b64e:	0005c703          	lbu	a4,0(a1)
ffffffffc020b652:	0505                	addi	a0,a0,1
ffffffffc020b654:	fef709e3          	beq	a4,a5,ffffffffc020b646 <strcmp+0x8>
ffffffffc020b658:	0007851b          	sext.w	a0,a5
ffffffffc020b65c:	9d19                	subw	a0,a0,a4
ffffffffc020b65e:	8082                	ret
ffffffffc020b660:	0015c703          	lbu	a4,1(a1)
ffffffffc020b664:	4501                	li	a0,0
ffffffffc020b666:	9d19                	subw	a0,a0,a4
ffffffffc020b668:	8082                	ret
ffffffffc020b66a:	0005c703          	lbu	a4,0(a1)
ffffffffc020b66e:	4501                	li	a0,0
ffffffffc020b670:	b7f5                	j	ffffffffc020b65c <strcmp+0x1e>

ffffffffc020b672 <strncmp>:
ffffffffc020b672:	ce01                	beqz	a2,ffffffffc020b68a <strncmp+0x18>
ffffffffc020b674:	00054783          	lbu	a5,0(a0)
ffffffffc020b678:	167d                	addi	a2,a2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc020b67a:	cb91                	beqz	a5,ffffffffc020b68e <strncmp+0x1c>
ffffffffc020b67c:	0005c703          	lbu	a4,0(a1)
ffffffffc020b680:	00f71763          	bne	a4,a5,ffffffffc020b68e <strncmp+0x1c>
ffffffffc020b684:	0505                	addi	a0,a0,1
ffffffffc020b686:	0585                	addi	a1,a1,1
ffffffffc020b688:	f675                	bnez	a2,ffffffffc020b674 <strncmp+0x2>
ffffffffc020b68a:	4501                	li	a0,0
ffffffffc020b68c:	8082                	ret
ffffffffc020b68e:	00054503          	lbu	a0,0(a0)
ffffffffc020b692:	0005c783          	lbu	a5,0(a1)
ffffffffc020b696:	9d1d                	subw	a0,a0,a5
ffffffffc020b698:	8082                	ret

ffffffffc020b69a <strchr>:
ffffffffc020b69a:	a021                	j	ffffffffc020b6a2 <strchr+0x8>
ffffffffc020b69c:	00f58763          	beq	a1,a5,ffffffffc020b6aa <strchr+0x10>
ffffffffc020b6a0:	0505                	addi	a0,a0,1
ffffffffc020b6a2:	00054783          	lbu	a5,0(a0)
ffffffffc020b6a6:	fbfd                	bnez	a5,ffffffffc020b69c <strchr+0x2>
ffffffffc020b6a8:	4501                	li	a0,0
ffffffffc020b6aa:	8082                	ret

ffffffffc020b6ac <memset>:
ffffffffc020b6ac:	ca01                	beqz	a2,ffffffffc020b6bc <memset+0x10>
ffffffffc020b6ae:	962a                	add	a2,a2,a0
ffffffffc020b6b0:	87aa                	mv	a5,a0
ffffffffc020b6b2:	0785                	addi	a5,a5,1
ffffffffc020b6b4:	feb78fa3          	sb	a1,-1(a5)
ffffffffc020b6b8:	fef61de3          	bne	a2,a5,ffffffffc020b6b2 <memset+0x6>
ffffffffc020b6bc:	8082                	ret

ffffffffc020b6be <memmove>:
ffffffffc020b6be:	02a5f163          	bgeu	a1,a0,ffffffffc020b6e0 <memmove+0x22>
ffffffffc020b6c2:	00c587b3          	add	a5,a1,a2
ffffffffc020b6c6:	00f57d63          	bgeu	a0,a5,ffffffffc020b6e0 <memmove+0x22>
ffffffffc020b6ca:	c61d                	beqz	a2,ffffffffc020b6f8 <memmove+0x3a>
ffffffffc020b6cc:	962a                	add	a2,a2,a0
ffffffffc020b6ce:	fff7c703          	lbu	a4,-1(a5)
ffffffffc020b6d2:	17fd                	addi	a5,a5,-1
ffffffffc020b6d4:	167d                	addi	a2,a2,-1
ffffffffc020b6d6:	00e60023          	sb	a4,0(a2)
ffffffffc020b6da:	fef59ae3          	bne	a1,a5,ffffffffc020b6ce <memmove+0x10>
ffffffffc020b6de:	8082                	ret
ffffffffc020b6e0:	00c586b3          	add	a3,a1,a2
ffffffffc020b6e4:	87aa                	mv	a5,a0
ffffffffc020b6e6:	ca11                	beqz	a2,ffffffffc020b6fa <memmove+0x3c>
ffffffffc020b6e8:	0005c703          	lbu	a4,0(a1)
ffffffffc020b6ec:	0585                	addi	a1,a1,1
ffffffffc020b6ee:	0785                	addi	a5,a5,1
ffffffffc020b6f0:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b6f4:	feb69ae3          	bne	a3,a1,ffffffffc020b6e8 <memmove+0x2a>
ffffffffc020b6f8:	8082                	ret
ffffffffc020b6fa:	8082                	ret

ffffffffc020b6fc <memcpy>:
ffffffffc020b6fc:	ca19                	beqz	a2,ffffffffc020b712 <memcpy+0x16>
ffffffffc020b6fe:	962e                	add	a2,a2,a1
ffffffffc020b700:	87aa                	mv	a5,a0
ffffffffc020b702:	0005c703          	lbu	a4,0(a1)
ffffffffc020b706:	0585                	addi	a1,a1,1
ffffffffc020b708:	0785                	addi	a5,a5,1
ffffffffc020b70a:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b70e:	feb61ae3          	bne	a2,a1,ffffffffc020b702 <memcpy+0x6>
ffffffffc020b712:	8082                	ret
