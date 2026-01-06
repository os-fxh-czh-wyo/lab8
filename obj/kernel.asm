
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
ffffffffc0200062:	7280b0ef          	jal	ffffffffc020b78a <memset>
ffffffffc0200066:	4da000ef          	jal	ffffffffc0200540 <cons_init>
ffffffffc020006a:	0000b597          	auipc	a1,0xb
ffffffffc020006e:	78e58593          	addi	a1,a1,1934 # ffffffffc020b7f8 <etext+0x6>
ffffffffc0200072:	0000b517          	auipc	a0,0xb
ffffffffc0200076:	7a650513          	addi	a0,a0,1958 # ffffffffc020b818 <etext+0x26>
ffffffffc020007a:	12c000ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020007e:	1ac000ef          	jal	ffffffffc020022a <print_kerninfo>
ffffffffc0200082:	5f4000ef          	jal	ffffffffc0200676 <dtb_init>
ffffffffc0200086:	29b020ef          	jal	ffffffffc0202b20 <pmm_init>
ffffffffc020008a:	355000ef          	jal	ffffffffc0200bde <pic_init>
ffffffffc020008e:	477000ef          	jal	ffffffffc0200d04 <idt_init>
ffffffffc0200092:	7a9030ef          	jal	ffffffffc020403a <vmm_init>
ffffffffc0200096:	2ee070ef          	jal	ffffffffc0207384 <sched_init>
ffffffffc020009a:	6f9060ef          	jal	ffffffffc0206f92 <proc_init>
ffffffffc020009e:	11f000ef          	jal	ffffffffc02009bc <ide_init>
ffffffffc02000a2:	1fe050ef          	jal	ffffffffc02052a0 <fs_init>
ffffffffc02000a6:	452000ef          	jal	ffffffffc02004f8 <clock_init>
ffffffffc02000aa:	329000ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc02000ae:	0b8070ef          	jal	ffffffffc0207166 <cpu_idle>

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
ffffffffc02000c6:	75e50513          	addi	a0,a0,1886 # ffffffffc020b820 <etext+0x2e>
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
ffffffffc020019a:	1540b0ef          	jal	ffffffffc020b2ee <vprintfmt>
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
ffffffffc02001d4:	11a0b0ef          	jal	ffffffffc020b2ee <vprintfmt>
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
ffffffffc02001fc:	4da0b0ef          	jal	ffffffffc020b6d6 <strlen>
ffffffffc0200200:	842a                	mv	s0,a0
ffffffffc0200202:	0505                	addi	a0,a0,1
ffffffffc0200204:	5bd010ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0200208:	87aa                	mv	a5,a0
ffffffffc020020a:	c911                	beqz	a0,ffffffffc020021e <strdup+0x2c>
ffffffffc020020c:	8622                	mv	a2,s0
ffffffffc020020e:	85a6                	mv	a1,s1
ffffffffc0200210:	e42a                	sd	a0,8(sp)
ffffffffc0200212:	5c80b0ef          	jal	ffffffffc020b7da <memcpy>
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
ffffffffc0200230:	5fc50513          	addi	a0,a0,1532 # ffffffffc020b828 <etext+0x36>
ffffffffc0200234:	e406                	sd	ra,8(sp)
ffffffffc0200236:	f71ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020023a:	00000597          	auipc	a1,0x0
ffffffffc020023e:	e1058593          	addi	a1,a1,-496 # ffffffffc020004a <kern_init>
ffffffffc0200242:	0000b517          	auipc	a0,0xb
ffffffffc0200246:	60650513          	addi	a0,a0,1542 # ffffffffc020b848 <etext+0x56>
ffffffffc020024a:	f5dff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020024e:	0000b597          	auipc	a1,0xb
ffffffffc0200252:	5a458593          	addi	a1,a1,1444 # ffffffffc020b7f2 <etext>
ffffffffc0200256:	0000b517          	auipc	a0,0xb
ffffffffc020025a:	61250513          	addi	a0,a0,1554 # ffffffffc020b868 <etext+0x76>
ffffffffc020025e:	f49ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200262:	00091597          	auipc	a1,0x91
ffffffffc0200266:	dfe58593          	addi	a1,a1,-514 # ffffffffc0291060 <buf>
ffffffffc020026a:	0000b517          	auipc	a0,0xb
ffffffffc020026e:	61e50513          	addi	a0,a0,1566 # ffffffffc020b888 <etext+0x96>
ffffffffc0200272:	f35ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200276:	00096597          	auipc	a1,0x96
ffffffffc020027a:	69a58593          	addi	a1,a1,1690 # ffffffffc0296910 <end>
ffffffffc020027e:	0000b517          	auipc	a0,0xb
ffffffffc0200282:	62a50513          	addi	a0,a0,1578 # ffffffffc020b8a8 <etext+0xb6>
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
ffffffffc02002ae:	61e50513          	addi	a0,a0,1566 # ffffffffc020b8c8 <etext+0xd6>
ffffffffc02002b2:	0141                	addi	sp,sp,16
ffffffffc02002b4:	bdcd                	j	ffffffffc02001a6 <cprintf>

ffffffffc02002b6 <print_stackframe>:
ffffffffc02002b6:	1141                	addi	sp,sp,-16
ffffffffc02002b8:	0000b617          	auipc	a2,0xb
ffffffffc02002bc:	64060613          	addi	a2,a2,1600 # ffffffffc020b8f8 <etext+0x106>
ffffffffc02002c0:	04e00593          	li	a1,78
ffffffffc02002c4:	0000b517          	auipc	a0,0xb
ffffffffc02002c8:	64c50513          	addi	a0,a0,1612 # ffffffffc020b910 <etext+0x11e>
ffffffffc02002cc:	e406                	sd	ra,8(sp)
ffffffffc02002ce:	17c000ef          	jal	ffffffffc020044a <__panic>

ffffffffc02002d2 <mon_help>:
ffffffffc02002d2:	1101                	addi	sp,sp,-32
ffffffffc02002d4:	e822                	sd	s0,16(sp)
ffffffffc02002d6:	e426                	sd	s1,8(sp)
ffffffffc02002d8:	ec06                	sd	ra,24(sp)
ffffffffc02002da:	0000f417          	auipc	s0,0xf
ffffffffc02002de:	b3640413          	addi	s0,s0,-1226 # ffffffffc020ee10 <commands>
ffffffffc02002e2:	0000f497          	auipc	s1,0xf
ffffffffc02002e6:	b7648493          	addi	s1,s1,-1162 # ffffffffc020ee58 <commands+0x48>
ffffffffc02002ea:	6410                	ld	a2,8(s0)
ffffffffc02002ec:	600c                	ld	a1,0(s0)
ffffffffc02002ee:	0000b517          	auipc	a0,0xb
ffffffffc02002f2:	63a50513          	addi	a0,a0,1594 # ffffffffc020b928 <etext+0x136>
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
ffffffffc0200336:	60650513          	addi	a0,a0,1542 # ffffffffc020b938 <etext+0x146>
ffffffffc020033a:	fd06                	sd	ra,184(sp)
ffffffffc020033c:	f922                	sd	s0,176(sp)
ffffffffc020033e:	f526                	sd	s1,168(sp)
ffffffffc0200340:	ed4e                	sd	s3,152(sp)
ffffffffc0200342:	e556                	sd	s5,136(sp)
ffffffffc0200344:	e15a                	sd	s6,128(sp)
ffffffffc0200346:	e61ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020034a:	0000b517          	auipc	a0,0xb
ffffffffc020034e:	61650513          	addi	a0,a0,1558 # ffffffffc020b960 <etext+0x16e>
ffffffffc0200352:	e55ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200356:	000a0563          	beqz	s4,ffffffffc0200360 <kmonitor+0x34>
ffffffffc020035a:	8552                	mv	a0,s4
ffffffffc020035c:	391000ef          	jal	ffffffffc0200eec <print_trapframe>
ffffffffc0200360:	0000fa97          	auipc	s5,0xf
ffffffffc0200364:	ab0a8a93          	addi	s5,s5,-1360 # ffffffffc020ee10 <commands>
ffffffffc0200368:	49bd                	li	s3,15
ffffffffc020036a:	0000b517          	auipc	a0,0xb
ffffffffc020036e:	61e50513          	addi	a0,a0,1566 # ffffffffc020b988 <etext+0x196>
ffffffffc0200372:	d41ff0ef          	jal	ffffffffc02000b2 <readline>
ffffffffc0200376:	842a                	mv	s0,a0
ffffffffc0200378:	d96d                	beqz	a0,ffffffffc020036a <kmonitor+0x3e>
ffffffffc020037a:	00054583          	lbu	a1,0(a0)
ffffffffc020037e:	4481                	li	s1,0
ffffffffc0200380:	e99d                	bnez	a1,ffffffffc02003b6 <kmonitor+0x8a>
ffffffffc0200382:	8b26                	mv	s6,s1
ffffffffc0200384:	fe0b03e3          	beqz	s6,ffffffffc020036a <kmonitor+0x3e>
ffffffffc0200388:	0000f497          	auipc	s1,0xf
ffffffffc020038c:	a8848493          	addi	s1,s1,-1400 # ffffffffc020ee10 <commands>
ffffffffc0200390:	4401                	li	s0,0
ffffffffc0200392:	6582                	ld	a1,0(sp)
ffffffffc0200394:	6088                	ld	a0,0(s1)
ffffffffc0200396:	3860b0ef          	jal	ffffffffc020b71c <strcmp>
ffffffffc020039a:	478d                	li	a5,3
ffffffffc020039c:	c149                	beqz	a0,ffffffffc020041e <kmonitor+0xf2>
ffffffffc020039e:	2405                	addiw	s0,s0,1
ffffffffc02003a0:	04e1                	addi	s1,s1,24
ffffffffc02003a2:	fef418e3          	bne	s0,a5,ffffffffc0200392 <kmonitor+0x66>
ffffffffc02003a6:	6582                	ld	a1,0(sp)
ffffffffc02003a8:	0000b517          	auipc	a0,0xb
ffffffffc02003ac:	61050513          	addi	a0,a0,1552 # ffffffffc020b9b8 <etext+0x1c6>
ffffffffc02003b0:	df7ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02003b4:	bf5d                	j	ffffffffc020036a <kmonitor+0x3e>
ffffffffc02003b6:	0000b517          	auipc	a0,0xb
ffffffffc02003ba:	5da50513          	addi	a0,a0,1498 # ffffffffc020b990 <etext+0x19e>
ffffffffc02003be:	3ba0b0ef          	jal	ffffffffc020b778 <strchr>
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
ffffffffc02003fc:	59850513          	addi	a0,a0,1432 # ffffffffc020b990 <etext+0x19e>
ffffffffc0200400:	3780b0ef          	jal	ffffffffc020b778 <strchr>
ffffffffc0200404:	d575                	beqz	a0,ffffffffc02003f0 <kmonitor+0xc4>
ffffffffc0200406:	00044583          	lbu	a1,0(s0)
ffffffffc020040a:	dda5                	beqz	a1,ffffffffc0200382 <kmonitor+0x56>
ffffffffc020040c:	b76d                	j	ffffffffc02003b6 <kmonitor+0x8a>
ffffffffc020040e:	45c1                	li	a1,16
ffffffffc0200410:	0000b517          	auipc	a0,0xb
ffffffffc0200414:	58850513          	addi	a0,a0,1416 # ffffffffc020b998 <etext+0x1a6>
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
ffffffffc0200474:	5f050513          	addi	a0,a0,1520 # ffffffffc020ba60 <etext+0x26e>
ffffffffc0200478:	00096697          	auipc	a3,0x96
ffffffffc020047c:	3ee6b823          	sd	a4,1008(a3) # ffffffffc0296868 <is_panic>
ffffffffc0200480:	e43e                	sd	a5,8(sp)
ffffffffc0200482:	d25ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200486:	65a2                	ld	a1,8(sp)
ffffffffc0200488:	8522                	mv	a0,s0
ffffffffc020048a:	cf7ff0ef          	jal	ffffffffc0200180 <vcprintf>
ffffffffc020048e:	0000b517          	auipc	a0,0xb
ffffffffc0200492:	5f250513          	addi	a0,a0,1522 # ffffffffc020ba80 <etext+0x28e>
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
ffffffffc02004c6:	5c650513          	addi	a0,a0,1478 # ffffffffc020ba88 <etext+0x296>
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
ffffffffc02004e8:	59c50513          	addi	a0,a0,1436 # ffffffffc020ba80 <etext+0x28e>
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
ffffffffc020051a:	59250513          	addi	a0,a0,1426 # ffffffffc020baa8 <etext+0x2b6>
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
ffffffffc020067c:	45050513          	addi	a0,a0,1104 # ffffffffc020bac8 <etext+0x2d6>
ffffffffc0200680:	f406                	sd	ra,40(sp)
ffffffffc0200682:	f022                	sd	s0,32(sp)
ffffffffc0200684:	b23ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200688:	00014597          	auipc	a1,0x14
ffffffffc020068c:	9785b583          	ld	a1,-1672(a1) # ffffffffc0214000 <boot_hartid>
ffffffffc0200690:	0000b517          	auipc	a0,0xb
ffffffffc0200694:	44850513          	addi	a0,a0,1096 # ffffffffc020bad8 <etext+0x2e6>
ffffffffc0200698:	00014417          	auipc	s0,0x14
ffffffffc020069c:	97040413          	addi	s0,s0,-1680 # ffffffffc0214008 <boot_dtb>
ffffffffc02006a0:	b07ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02006a4:	600c                	ld	a1,0(s0)
ffffffffc02006a6:	0000b517          	auipc	a0,0xb
ffffffffc02006aa:	44250513          	addi	a0,a0,1090 # ffffffffc020bae8 <etext+0x2f6>
ffffffffc02006ae:	af9ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02006b2:	6018                	ld	a4,0(s0)
ffffffffc02006b4:	0000b517          	auipc	a0,0xb
ffffffffc02006b8:	44c50513          	addi	a0,a0,1100 # ffffffffc020bb00 <etext+0x30e>
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
ffffffffc02007aa:	42250513          	addi	a0,a0,1058 # ffffffffc020bbc8 <etext+0x3d6>
ffffffffc02007ae:	9f9ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02007b2:	64e2                	ld	s1,24(sp)
ffffffffc02007b4:	6942                	ld	s2,16(sp)
ffffffffc02007b6:	0000b517          	auipc	a0,0xb
ffffffffc02007ba:	44a50513          	addi	a0,a0,1098 # ffffffffc020bc00 <etext+0x40e>
ffffffffc02007be:	7402                	ld	s0,32(sp)
ffffffffc02007c0:	70a2                	ld	ra,40(sp)
ffffffffc02007c2:	6145                	addi	sp,sp,48
ffffffffc02007c4:	b2cd                	j	ffffffffc02001a6 <cprintf>
ffffffffc02007c6:	7402                	ld	s0,32(sp)
ffffffffc02007c8:	70a2                	ld	ra,40(sp)
ffffffffc02007ca:	0000b517          	auipc	a0,0xb
ffffffffc02007ce:	35650513          	addi	a0,a0,854 # ffffffffc020bb20 <etext+0x32e>
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
ffffffffc0200810:	6c70a0ef          	jal	ffffffffc020b6d6 <strlen>
ffffffffc0200814:	84aa                	mv	s1,a0
ffffffffc0200816:	4619                	li	a2,6
ffffffffc0200818:	8522                	mv	a0,s0
ffffffffc020081a:	0000b597          	auipc	a1,0xb
ffffffffc020081e:	32e58593          	addi	a1,a1,814 # ffffffffc020bb48 <etext+0x356>
ffffffffc0200822:	72f0a0ef          	jal	ffffffffc020b750 <strncmp>
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
ffffffffc020084a:	30a58593          	addi	a1,a1,778 # ffffffffc020bb50 <etext+0x35e>
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
ffffffffc020087c:	6a10a0ef          	jal	ffffffffc020b71c <strcmp>
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
ffffffffc02008a0:	2bc50513          	addi	a0,a0,700 # ffffffffc020bb58 <etext+0x366>
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
ffffffffc020096a:	21250513          	addi	a0,a0,530 # ffffffffc020bb78 <etext+0x386>
ffffffffc020096e:	839ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200972:	01445613          	srli	a2,s0,0x14
ffffffffc0200976:	85a2                	mv	a1,s0
ffffffffc0200978:	0000b517          	auipc	a0,0xb
ffffffffc020097c:	21850513          	addi	a0,a0,536 # ffffffffc020bb90 <etext+0x39e>
ffffffffc0200980:	827ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200984:	009405b3          	add	a1,s0,s1
ffffffffc0200988:	15fd                	addi	a1,a1,-1
ffffffffc020098a:	0000b517          	auipc	a0,0xb
ffffffffc020098e:	22650513          	addi	a0,a0,550 # ffffffffc020bbb0 <etext+0x3be>
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
ffffffffc0200a1a:	20268693          	addi	a3,a3,514 # ffffffffc020bc18 <etext+0x426>
ffffffffc0200a1e:	0000b617          	auipc	a2,0xb
ffffffffc0200a22:	21260613          	addi	a2,a2,530 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0200a26:	45c5                	li	a1,17
ffffffffc0200a28:	0000b517          	auipc	a0,0xb
ffffffffc0200a2c:	22050513          	addi	a0,a0,544 # ffffffffc020bc48 <etext+0x456>
ffffffffc0200a30:	a1bff0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0200a34:	0000b697          	auipc	a3,0xb
ffffffffc0200a38:	22c68693          	addi	a3,a3,556 # ffffffffc020bc60 <etext+0x46e>
ffffffffc0200a3c:	0000b617          	auipc	a2,0xb
ffffffffc0200a40:	1f460613          	addi	a2,a2,500 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0200a44:	45d1                	li	a1,20
ffffffffc0200a46:	0000b517          	auipc	a0,0xb
ffffffffc0200a4a:	20250513          	addi	a0,a0,514 # ffffffffc020bc48 <etext+0x456>
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
ffffffffc0200afc:	18068693          	addi	a3,a3,384 # ffffffffc020bc78 <etext+0x486>
ffffffffc0200b00:	0000b617          	auipc	a2,0xb
ffffffffc0200b04:	13060613          	addi	a2,a2,304 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0200b08:	02200593          	li	a1,34
ffffffffc0200b0c:	0000b517          	auipc	a0,0xb
ffffffffc0200b10:	13c50513          	addi	a0,a0,316 # ffffffffc020bc48 <etext+0x456>
ffffffffc0200b14:	937ff0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0200b18:	0000b697          	auipc	a3,0xb
ffffffffc0200b1c:	18868693          	addi	a3,a3,392 # ffffffffc020bca0 <etext+0x4ae>
ffffffffc0200b20:	0000b617          	auipc	a2,0xb
ffffffffc0200b24:	11060613          	addi	a2,a2,272 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0200b28:	02300593          	li	a1,35
ffffffffc0200b2c:	0000b517          	auipc	a0,0xb
ffffffffc0200b30:	11c50513          	addi	a0,a0,284 # ffffffffc020bc48 <etext+0x456>
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
ffffffffc0200b96:	0e668693          	addi	a3,a3,230 # ffffffffc020bc78 <etext+0x486>
ffffffffc0200b9a:	0000b617          	auipc	a2,0xb
ffffffffc0200b9e:	09660613          	addi	a2,a2,150 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0200ba2:	02900593          	li	a1,41
ffffffffc0200ba6:	0000b517          	auipc	a0,0xb
ffffffffc0200baa:	0a250513          	addi	a0,a0,162 # ffffffffc020bc48 <etext+0x456>
ffffffffc0200bae:	89dff0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0200bb2:	0000b697          	auipc	a3,0xb
ffffffffc0200bb6:	0ee68693          	addi	a3,a3,238 # ffffffffc020bca0 <etext+0x4ae>
ffffffffc0200bba:	0000b617          	auipc	a2,0xb
ffffffffc0200bbe:	07660613          	addi	a2,a2,118 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0200bc2:	02a00593          	li	a1,42
ffffffffc0200bc6:	0000b517          	auipc	a0,0xb
ffffffffc0200bca:	08250513          	addi	a0,a0,130 # ffffffffc020bc48 <etext+0x456>
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
ffffffffc0200c00:	3db0a0ef          	jal	ffffffffc020b7da <memcpy>
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
ffffffffc0200c2a:	3b10a0ef          	jal	ffffffffc020b7da <memcpy>
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
ffffffffc0200c4a:	3410a0ef          	jal	ffffffffc020b78a <memset>
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
ffffffffc0200c7a:	08250513          	addi	a0,a0,130 # ffffffffc020bcf8 <etext+0x506>
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
ffffffffc0200c9e:	0b658593          	addi	a1,a1,182 # ffffffffc020bd50 <etext+0x55e>
ffffffffc0200ca2:	2690a0ef          	jal	ffffffffc020b70a <strcpy>
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
ffffffffc0200ce2:	00250513          	addi	a0,a0,2 # ffffffffc020bce0 <etext+0x4ee>
ffffffffc0200ce6:	6145                	addi	sp,sp,48
ffffffffc0200ce8:	cbeff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200cec:	0000b617          	auipc	a2,0xb
ffffffffc0200cf0:	03460613          	addi	a2,a2,52 # ffffffffc020bd20 <etext+0x52e>
ffffffffc0200cf4:	03200593          	li	a1,50
ffffffffc0200cf8:	0000b517          	auipc	a0,0xb
ffffffffc0200cfc:	04050513          	addi	a0,a0,64 # ffffffffc020bd38 <etext+0x546>
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
ffffffffc0200d2a:	03a50513          	addi	a0,a0,58 # ffffffffc020bd60 <etext+0x56e>
ffffffffc0200d2e:	e406                	sd	ra,8(sp)
ffffffffc0200d30:	c76ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d34:	640c                	ld	a1,8(s0)
ffffffffc0200d36:	0000b517          	auipc	a0,0xb
ffffffffc0200d3a:	04250513          	addi	a0,a0,66 # ffffffffc020bd78 <etext+0x586>
ffffffffc0200d3e:	c68ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d42:	680c                	ld	a1,16(s0)
ffffffffc0200d44:	0000b517          	auipc	a0,0xb
ffffffffc0200d48:	04c50513          	addi	a0,a0,76 # ffffffffc020bd90 <etext+0x59e>
ffffffffc0200d4c:	c5aff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d50:	6c0c                	ld	a1,24(s0)
ffffffffc0200d52:	0000b517          	auipc	a0,0xb
ffffffffc0200d56:	05650513          	addi	a0,a0,86 # ffffffffc020bda8 <etext+0x5b6>
ffffffffc0200d5a:	c4cff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d5e:	700c                	ld	a1,32(s0)
ffffffffc0200d60:	0000b517          	auipc	a0,0xb
ffffffffc0200d64:	06050513          	addi	a0,a0,96 # ffffffffc020bdc0 <etext+0x5ce>
ffffffffc0200d68:	c3eff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d6c:	740c                	ld	a1,40(s0)
ffffffffc0200d6e:	0000b517          	auipc	a0,0xb
ffffffffc0200d72:	06a50513          	addi	a0,a0,106 # ffffffffc020bdd8 <etext+0x5e6>
ffffffffc0200d76:	c30ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d7a:	780c                	ld	a1,48(s0)
ffffffffc0200d7c:	0000b517          	auipc	a0,0xb
ffffffffc0200d80:	07450513          	addi	a0,a0,116 # ffffffffc020bdf0 <etext+0x5fe>
ffffffffc0200d84:	c22ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d88:	7c0c                	ld	a1,56(s0)
ffffffffc0200d8a:	0000b517          	auipc	a0,0xb
ffffffffc0200d8e:	07e50513          	addi	a0,a0,126 # ffffffffc020be08 <etext+0x616>
ffffffffc0200d92:	c14ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200d96:	602c                	ld	a1,64(s0)
ffffffffc0200d98:	0000b517          	auipc	a0,0xb
ffffffffc0200d9c:	08850513          	addi	a0,a0,136 # ffffffffc020be20 <etext+0x62e>
ffffffffc0200da0:	c06ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200da4:	642c                	ld	a1,72(s0)
ffffffffc0200da6:	0000b517          	auipc	a0,0xb
ffffffffc0200daa:	09250513          	addi	a0,a0,146 # ffffffffc020be38 <etext+0x646>
ffffffffc0200dae:	bf8ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200db2:	682c                	ld	a1,80(s0)
ffffffffc0200db4:	0000b517          	auipc	a0,0xb
ffffffffc0200db8:	09c50513          	addi	a0,a0,156 # ffffffffc020be50 <etext+0x65e>
ffffffffc0200dbc:	beaff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200dc0:	6c2c                	ld	a1,88(s0)
ffffffffc0200dc2:	0000b517          	auipc	a0,0xb
ffffffffc0200dc6:	0a650513          	addi	a0,a0,166 # ffffffffc020be68 <etext+0x676>
ffffffffc0200dca:	bdcff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200dce:	702c                	ld	a1,96(s0)
ffffffffc0200dd0:	0000b517          	auipc	a0,0xb
ffffffffc0200dd4:	0b050513          	addi	a0,a0,176 # ffffffffc020be80 <etext+0x68e>
ffffffffc0200dd8:	bceff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200ddc:	742c                	ld	a1,104(s0)
ffffffffc0200dde:	0000b517          	auipc	a0,0xb
ffffffffc0200de2:	0ba50513          	addi	a0,a0,186 # ffffffffc020be98 <etext+0x6a6>
ffffffffc0200de6:	bc0ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200dea:	782c                	ld	a1,112(s0)
ffffffffc0200dec:	0000b517          	auipc	a0,0xb
ffffffffc0200df0:	0c450513          	addi	a0,a0,196 # ffffffffc020beb0 <etext+0x6be>
ffffffffc0200df4:	bb2ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200df8:	7c2c                	ld	a1,120(s0)
ffffffffc0200dfa:	0000b517          	auipc	a0,0xb
ffffffffc0200dfe:	0ce50513          	addi	a0,a0,206 # ffffffffc020bec8 <etext+0x6d6>
ffffffffc0200e02:	ba4ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e06:	604c                	ld	a1,128(s0)
ffffffffc0200e08:	0000b517          	auipc	a0,0xb
ffffffffc0200e0c:	0d850513          	addi	a0,a0,216 # ffffffffc020bee0 <etext+0x6ee>
ffffffffc0200e10:	b96ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e14:	644c                	ld	a1,136(s0)
ffffffffc0200e16:	0000b517          	auipc	a0,0xb
ffffffffc0200e1a:	0e250513          	addi	a0,a0,226 # ffffffffc020bef8 <etext+0x706>
ffffffffc0200e1e:	b88ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e22:	684c                	ld	a1,144(s0)
ffffffffc0200e24:	0000b517          	auipc	a0,0xb
ffffffffc0200e28:	0ec50513          	addi	a0,a0,236 # ffffffffc020bf10 <etext+0x71e>
ffffffffc0200e2c:	b7aff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e30:	6c4c                	ld	a1,152(s0)
ffffffffc0200e32:	0000b517          	auipc	a0,0xb
ffffffffc0200e36:	0f650513          	addi	a0,a0,246 # ffffffffc020bf28 <etext+0x736>
ffffffffc0200e3a:	b6cff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e3e:	704c                	ld	a1,160(s0)
ffffffffc0200e40:	0000b517          	auipc	a0,0xb
ffffffffc0200e44:	10050513          	addi	a0,a0,256 # ffffffffc020bf40 <etext+0x74e>
ffffffffc0200e48:	b5eff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e4c:	744c                	ld	a1,168(s0)
ffffffffc0200e4e:	0000b517          	auipc	a0,0xb
ffffffffc0200e52:	10a50513          	addi	a0,a0,266 # ffffffffc020bf58 <etext+0x766>
ffffffffc0200e56:	b50ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e5a:	784c                	ld	a1,176(s0)
ffffffffc0200e5c:	0000b517          	auipc	a0,0xb
ffffffffc0200e60:	11450513          	addi	a0,a0,276 # ffffffffc020bf70 <etext+0x77e>
ffffffffc0200e64:	b42ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e68:	7c4c                	ld	a1,184(s0)
ffffffffc0200e6a:	0000b517          	auipc	a0,0xb
ffffffffc0200e6e:	11e50513          	addi	a0,a0,286 # ffffffffc020bf88 <etext+0x796>
ffffffffc0200e72:	b34ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e76:	606c                	ld	a1,192(s0)
ffffffffc0200e78:	0000b517          	auipc	a0,0xb
ffffffffc0200e7c:	12850513          	addi	a0,a0,296 # ffffffffc020bfa0 <etext+0x7ae>
ffffffffc0200e80:	b26ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e84:	646c                	ld	a1,200(s0)
ffffffffc0200e86:	0000b517          	auipc	a0,0xb
ffffffffc0200e8a:	13250513          	addi	a0,a0,306 # ffffffffc020bfb8 <etext+0x7c6>
ffffffffc0200e8e:	b18ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200e92:	686c                	ld	a1,208(s0)
ffffffffc0200e94:	0000b517          	auipc	a0,0xb
ffffffffc0200e98:	13c50513          	addi	a0,a0,316 # ffffffffc020bfd0 <etext+0x7de>
ffffffffc0200e9c:	b0aff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200ea0:	6c6c                	ld	a1,216(s0)
ffffffffc0200ea2:	0000b517          	auipc	a0,0xb
ffffffffc0200ea6:	14650513          	addi	a0,a0,326 # ffffffffc020bfe8 <etext+0x7f6>
ffffffffc0200eaa:	afcff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200eae:	706c                	ld	a1,224(s0)
ffffffffc0200eb0:	0000b517          	auipc	a0,0xb
ffffffffc0200eb4:	15050513          	addi	a0,a0,336 # ffffffffc020c000 <etext+0x80e>
ffffffffc0200eb8:	aeeff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200ebc:	746c                	ld	a1,232(s0)
ffffffffc0200ebe:	0000b517          	auipc	a0,0xb
ffffffffc0200ec2:	15a50513          	addi	a0,a0,346 # ffffffffc020c018 <etext+0x826>
ffffffffc0200ec6:	ae0ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200eca:	786c                	ld	a1,240(s0)
ffffffffc0200ecc:	0000b517          	auipc	a0,0xb
ffffffffc0200ed0:	16450513          	addi	a0,a0,356 # ffffffffc020c030 <etext+0x83e>
ffffffffc0200ed4:	ad2ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200ed8:	7c6c                	ld	a1,248(s0)
ffffffffc0200eda:	6402                	ld	s0,0(sp)
ffffffffc0200edc:	60a2                	ld	ra,8(sp)
ffffffffc0200ede:	0000b517          	auipc	a0,0xb
ffffffffc0200ee2:	16a50513          	addi	a0,a0,362 # ffffffffc020c048 <etext+0x856>
ffffffffc0200ee6:	0141                	addi	sp,sp,16
ffffffffc0200ee8:	abeff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200eec <print_trapframe>:
ffffffffc0200eec:	1141                	addi	sp,sp,-16
ffffffffc0200eee:	e022                	sd	s0,0(sp)
ffffffffc0200ef0:	85aa                	mv	a1,a0
ffffffffc0200ef2:	842a                	mv	s0,a0
ffffffffc0200ef4:	0000b517          	auipc	a0,0xb
ffffffffc0200ef8:	16c50513          	addi	a0,a0,364 # ffffffffc020c060 <etext+0x86e>
ffffffffc0200efc:	e406                	sd	ra,8(sp)
ffffffffc0200efe:	aa8ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200f02:	8522                	mv	a0,s0
ffffffffc0200f04:	e1bff0ef          	jal	ffffffffc0200d1e <print_regs>
ffffffffc0200f08:	10043583          	ld	a1,256(s0)
ffffffffc0200f0c:	0000b517          	auipc	a0,0xb
ffffffffc0200f10:	16c50513          	addi	a0,a0,364 # ffffffffc020c078 <etext+0x886>
ffffffffc0200f14:	a92ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200f18:	10843583          	ld	a1,264(s0)
ffffffffc0200f1c:	0000b517          	auipc	a0,0xb
ffffffffc0200f20:	17450513          	addi	a0,a0,372 # ffffffffc020c090 <etext+0x89e>
ffffffffc0200f24:	a82ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200f28:	11043583          	ld	a1,272(s0)
ffffffffc0200f2c:	0000b517          	auipc	a0,0xb
ffffffffc0200f30:	17c50513          	addi	a0,a0,380 # ffffffffc020c0a8 <etext+0x8b6>
ffffffffc0200f34:	a72ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0200f38:	11843583          	ld	a1,280(s0)
ffffffffc0200f3c:	6402                	ld	s0,0(sp)
ffffffffc0200f3e:	60a2                	ld	ra,8(sp)
ffffffffc0200f40:	0000b517          	auipc	a0,0xb
ffffffffc0200f44:	17850513          	addi	a0,a0,376 # ffffffffc020c0b8 <etext+0x8c6>
ffffffffc0200f48:	0141                	addi	sp,sp,16
ffffffffc0200f4a:	a5cff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200f4e <interrupt_handler>:
ffffffffc0200f4e:	11853783          	ld	a5,280(a0)
ffffffffc0200f52:	472d                	li	a4,11
ffffffffc0200f54:	0786                	slli	a5,a5,0x1
ffffffffc0200f56:	8385                	srli	a5,a5,0x1
ffffffffc0200f58:	08f76063          	bltu	a4,a5,ffffffffc0200fd8 <interrupt_handler+0x8a>
ffffffffc0200f5c:	0000e717          	auipc	a4,0xe
ffffffffc0200f60:	efc70713          	addi	a4,a4,-260 # ffffffffc020ee58 <commands+0x48>
ffffffffc0200f64:	078a                	slli	a5,a5,0x2
ffffffffc0200f66:	97ba                	add	a5,a5,a4
ffffffffc0200f68:	439c                	lw	a5,0(a5)
ffffffffc0200f6a:	97ba                	add	a5,a5,a4
ffffffffc0200f6c:	8782                	jr	a5
ffffffffc0200f6e:	0000b517          	auipc	a0,0xb
ffffffffc0200f72:	1c250513          	addi	a0,a0,450 # ffffffffc020c130 <etext+0x93e>
ffffffffc0200f76:	a30ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200f7a:	0000b517          	auipc	a0,0xb
ffffffffc0200f7e:	19650513          	addi	a0,a0,406 # ffffffffc020c110 <etext+0x91e>
ffffffffc0200f82:	a24ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200f86:	0000b517          	auipc	a0,0xb
ffffffffc0200f8a:	14a50513          	addi	a0,a0,330 # ffffffffc020c0d0 <etext+0x8de>
ffffffffc0200f8e:	a18ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200f92:	0000b517          	auipc	a0,0xb
ffffffffc0200f96:	15e50513          	addi	a0,a0,350 # ffffffffc020c0f0 <etext+0x8fe>
ffffffffc0200f9a:	a0cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200f9e:	1141                	addi	sp,sp,-16
ffffffffc0200fa0:	e406                	sd	ra,8(sp)
ffffffffc0200fa2:	d86ff0ef          	jal	ffffffffc0200528 <clock_set_next_event>
ffffffffc0200fa6:	00096797          	auipc	a5,0x96
ffffffffc0200faa:	8ca7b783          	ld	a5,-1846(a5) # ffffffffc0296870 <ticks>
ffffffffc0200fae:	0785                	addi	a5,a5,1
ffffffffc0200fb0:	00096717          	auipc	a4,0x96
ffffffffc0200fb4:	8cf73023          	sd	a5,-1856(a4) # ffffffffc0296870 <ticks>
ffffffffc0200fb8:	722060ef          	jal	ffffffffc02076da <run_timer_list>
ffffffffc0200fbc:	dfaff0ef          	jal	ffffffffc02005b6 <cons_getc>
ffffffffc0200fc0:	60a2                	ld	ra,8(sp)
ffffffffc0200fc2:	0ff57513          	zext.b	a0,a0
ffffffffc0200fc6:	0141                	addi	sp,sp,16
ffffffffc0200fc8:	6390706f          	j	ffffffffc0208e00 <dev_stdin_write>
ffffffffc0200fcc:	0000b517          	auipc	a0,0xb
ffffffffc0200fd0:	18450513          	addi	a0,a0,388 # ffffffffc020c150 <etext+0x95e>
ffffffffc0200fd4:	9d2ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200fd8:	bf11                	j	ffffffffc0200eec <print_trapframe>

ffffffffc0200fda <exception_handler>:
ffffffffc0200fda:	11853783          	ld	a5,280(a0)
ffffffffc0200fde:	473d                	li	a4,15
ffffffffc0200fe0:	10f76e63          	bltu	a4,a5,ffffffffc02010fc <exception_handler+0x122>
ffffffffc0200fe4:	0000e717          	auipc	a4,0xe
ffffffffc0200fe8:	ea470713          	addi	a4,a4,-348 # ffffffffc020ee88 <commands+0x78>
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
ffffffffc0201002:	25a50513          	addi	a0,a0,602 # ffffffffc020c258 <etext+0xa66>
ffffffffc0201006:	9a0ff0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020100a:	66a2                	ld	a3,8(sp)
ffffffffc020100c:	1086b783          	ld	a5,264(a3)
ffffffffc0201010:	60e2                	ld	ra,24(sp)
ffffffffc0201012:	0791                	addi	a5,a5,4
ffffffffc0201014:	10f6b423          	sd	a5,264(a3)
ffffffffc0201018:	6105                	addi	sp,sp,32
ffffffffc020101a:	1110606f          	j	ffffffffc020792a <syscall>
ffffffffc020101e:	60e2                	ld	ra,24(sp)
ffffffffc0201020:	0000b517          	auipc	a0,0xb
ffffffffc0201024:	25850513          	addi	a0,a0,600 # ffffffffc020c278 <etext+0xa86>
ffffffffc0201028:	6105                	addi	sp,sp,32
ffffffffc020102a:	97cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020102e:	60e2                	ld	ra,24(sp)
ffffffffc0201030:	0000b517          	auipc	a0,0xb
ffffffffc0201034:	26850513          	addi	a0,a0,616 # ffffffffc020c298 <etext+0xaa6>
ffffffffc0201038:	6105                	addi	sp,sp,32
ffffffffc020103a:	96cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020103e:	60e2                	ld	ra,24(sp)
ffffffffc0201040:	0000b517          	auipc	a0,0xb
ffffffffc0201044:	27850513          	addi	a0,a0,632 # ffffffffc020c2b8 <etext+0xac6>
ffffffffc0201048:	6105                	addi	sp,sp,32
ffffffffc020104a:	95cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020104e:	60e2                	ld	ra,24(sp)
ffffffffc0201050:	0000b517          	auipc	a0,0xb
ffffffffc0201054:	28050513          	addi	a0,a0,640 # ffffffffc020c2d0 <etext+0xade>
ffffffffc0201058:	6105                	addi	sp,sp,32
ffffffffc020105a:	94cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020105e:	60e2                	ld	ra,24(sp)
ffffffffc0201060:	0000b517          	auipc	a0,0xb
ffffffffc0201064:	28850513          	addi	a0,a0,648 # ffffffffc020c2e8 <etext+0xaf6>
ffffffffc0201068:	6105                	addi	sp,sp,32
ffffffffc020106a:	93cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020106e:	60e2                	ld	ra,24(sp)
ffffffffc0201070:	0000b517          	auipc	a0,0xb
ffffffffc0201074:	10050513          	addi	a0,a0,256 # ffffffffc020c170 <etext+0x97e>
ffffffffc0201078:	6105                	addi	sp,sp,32
ffffffffc020107a:	92cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020107e:	60e2                	ld	ra,24(sp)
ffffffffc0201080:	0000b517          	auipc	a0,0xb
ffffffffc0201084:	11050513          	addi	a0,a0,272 # ffffffffc020c190 <etext+0x99e>
ffffffffc0201088:	6105                	addi	sp,sp,32
ffffffffc020108a:	91cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020108e:	60e2                	ld	ra,24(sp)
ffffffffc0201090:	0000b517          	auipc	a0,0xb
ffffffffc0201094:	12050513          	addi	a0,a0,288 # ffffffffc020c1b0 <etext+0x9be>
ffffffffc0201098:	6105                	addi	sp,sp,32
ffffffffc020109a:	90cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020109e:	60e2                	ld	ra,24(sp)
ffffffffc02010a0:	0000b517          	auipc	a0,0xb
ffffffffc02010a4:	12850513          	addi	a0,a0,296 # ffffffffc020c1c8 <etext+0x9d6>
ffffffffc02010a8:	6105                	addi	sp,sp,32
ffffffffc02010aa:	8fcff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010ae:	60e2                	ld	ra,24(sp)
ffffffffc02010b0:	0000b517          	auipc	a0,0xb
ffffffffc02010b4:	12850513          	addi	a0,a0,296 # ffffffffc020c1d8 <etext+0x9e6>
ffffffffc02010b8:	6105                	addi	sp,sp,32
ffffffffc02010ba:	8ecff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010be:	60e2                	ld	ra,24(sp)
ffffffffc02010c0:	0000b517          	auipc	a0,0xb
ffffffffc02010c4:	13850513          	addi	a0,a0,312 # ffffffffc020c1f8 <etext+0xa06>
ffffffffc02010c8:	6105                	addi	sp,sp,32
ffffffffc02010ca:	8dcff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010ce:	60e2                	ld	ra,24(sp)
ffffffffc02010d0:	0000b517          	auipc	a0,0xb
ffffffffc02010d4:	17050513          	addi	a0,a0,368 # ffffffffc020c240 <etext+0xa4e>
ffffffffc02010d8:	6105                	addi	sp,sp,32
ffffffffc02010da:	8ccff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010de:	60e2                	ld	ra,24(sp)
ffffffffc02010e0:	6105                	addi	sp,sp,32
ffffffffc02010e2:	b529                	j	ffffffffc0200eec <print_trapframe>
ffffffffc02010e4:	0000b617          	auipc	a2,0xb
ffffffffc02010e8:	12c60613          	addi	a2,a2,300 # ffffffffc020c210 <etext+0xa1e>
ffffffffc02010ec:	0b200593          	li	a1,178
ffffffffc02010f0:	0000b517          	auipc	a0,0xb
ffffffffc02010f4:	13850513          	addi	a0,a0,312 # ffffffffc020c228 <etext+0xa36>
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
ffffffffc020116e:	3620606f          	j	ffffffffc02074d0 <schedule>
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
ffffffffc020131c:	7b863603          	ld	a2,1976(a2) # ffffffffc020fad0 <nbase>
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
ffffffffc0201584:	d8068693          	addi	a3,a3,-640 # ffffffffc020c300 <etext+0xb0e>
ffffffffc0201588:	0000a617          	auipc	a2,0xa
ffffffffc020158c:	6a860613          	addi	a2,a2,1704 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201590:	0ef00593          	li	a1,239
ffffffffc0201594:	0000b517          	auipc	a0,0xb
ffffffffc0201598:	d7c50513          	addi	a0,a0,-644 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020159c:	eaffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02015a0:	0000b697          	auipc	a3,0xb
ffffffffc02015a4:	e3068693          	addi	a3,a3,-464 # ffffffffc020c3d0 <etext+0xbde>
ffffffffc02015a8:	0000a617          	auipc	a2,0xa
ffffffffc02015ac:	68860613          	addi	a2,a2,1672 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02015b0:	0bd00593          	li	a1,189
ffffffffc02015b4:	0000b517          	auipc	a0,0xb
ffffffffc02015b8:	d5c50513          	addi	a0,a0,-676 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02015bc:	e8ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02015c0:	0000b697          	auipc	a3,0xb
ffffffffc02015c4:	ed868693          	addi	a3,a3,-296 # ffffffffc020c498 <etext+0xca6>
ffffffffc02015c8:	0000a617          	auipc	a2,0xa
ffffffffc02015cc:	66860613          	addi	a2,a2,1640 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02015d0:	0d800593          	li	a1,216
ffffffffc02015d4:	0000b517          	auipc	a0,0xb
ffffffffc02015d8:	d3c50513          	addi	a0,a0,-708 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02015dc:	e6ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02015e0:	0000b697          	auipc	a3,0xb
ffffffffc02015e4:	e3068693          	addi	a3,a3,-464 # ffffffffc020c410 <etext+0xc1e>
ffffffffc02015e8:	0000a617          	auipc	a2,0xa
ffffffffc02015ec:	64860613          	addi	a2,a2,1608 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02015f0:	0bf00593          	li	a1,191
ffffffffc02015f4:	0000b517          	auipc	a0,0xb
ffffffffc02015f8:	d1c50513          	addi	a0,a0,-740 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02015fc:	e4ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201600:	0000b697          	auipc	a3,0xb
ffffffffc0201604:	da868693          	addi	a3,a3,-600 # ffffffffc020c3a8 <etext+0xbb6>
ffffffffc0201608:	0000a617          	auipc	a2,0xa
ffffffffc020160c:	62860613          	addi	a2,a2,1576 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201610:	0bc00593          	li	a1,188
ffffffffc0201614:	0000b517          	auipc	a0,0xb
ffffffffc0201618:	cfc50513          	addi	a0,a0,-772 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020161c:	e2ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201620:	0000b697          	auipc	a3,0xb
ffffffffc0201624:	d2868693          	addi	a3,a3,-728 # ffffffffc020c348 <etext+0xb56>
ffffffffc0201628:	0000a617          	auipc	a2,0xa
ffffffffc020162c:	60860613          	addi	a2,a2,1544 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201630:	0d100593          	li	a1,209
ffffffffc0201634:	0000b517          	auipc	a0,0xb
ffffffffc0201638:	cdc50513          	addi	a0,a0,-804 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020163c:	e0ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201640:	0000b697          	auipc	a3,0xb
ffffffffc0201644:	e4868693          	addi	a3,a3,-440 # ffffffffc020c488 <etext+0xc96>
ffffffffc0201648:	0000a617          	auipc	a2,0xa
ffffffffc020164c:	5e860613          	addi	a2,a2,1512 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201650:	0cf00593          	li	a1,207
ffffffffc0201654:	0000b517          	auipc	a0,0xb
ffffffffc0201658:	cbc50513          	addi	a0,a0,-836 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020165c:	deffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201660:	0000b697          	auipc	a3,0xb
ffffffffc0201664:	e1068693          	addi	a3,a3,-496 # ffffffffc020c470 <etext+0xc7e>
ffffffffc0201668:	0000a617          	auipc	a2,0xa
ffffffffc020166c:	5c860613          	addi	a2,a2,1480 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201670:	0ca00593          	li	a1,202
ffffffffc0201674:	0000b517          	auipc	a0,0xb
ffffffffc0201678:	c9c50513          	addi	a0,a0,-868 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020167c:	dcffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201680:	0000b697          	auipc	a3,0xb
ffffffffc0201684:	dd068693          	addi	a3,a3,-560 # ffffffffc020c450 <etext+0xc5e>
ffffffffc0201688:	0000a617          	auipc	a2,0xa
ffffffffc020168c:	5a860613          	addi	a2,a2,1448 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201690:	0c100593          	li	a1,193
ffffffffc0201694:	0000b517          	auipc	a0,0xb
ffffffffc0201698:	c7c50513          	addi	a0,a0,-900 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020169c:	daffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02016a0:	0000b697          	auipc	a3,0xb
ffffffffc02016a4:	e4068693          	addi	a3,a3,-448 # ffffffffc020c4e0 <etext+0xcee>
ffffffffc02016a8:	0000a617          	auipc	a2,0xa
ffffffffc02016ac:	58860613          	addi	a2,a2,1416 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02016b0:	0f700593          	li	a1,247
ffffffffc02016b4:	0000b517          	auipc	a0,0xb
ffffffffc02016b8:	c5c50513          	addi	a0,a0,-932 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02016bc:	d8ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02016c0:	0000b697          	auipc	a3,0xb
ffffffffc02016c4:	e1068693          	addi	a3,a3,-496 # ffffffffc020c4d0 <etext+0xcde>
ffffffffc02016c8:	0000a617          	auipc	a2,0xa
ffffffffc02016cc:	56860613          	addi	a2,a2,1384 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02016d0:	0de00593          	li	a1,222
ffffffffc02016d4:	0000b517          	auipc	a0,0xb
ffffffffc02016d8:	c3c50513          	addi	a0,a0,-964 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02016dc:	d6ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02016e0:	0000b697          	auipc	a3,0xb
ffffffffc02016e4:	d9068693          	addi	a3,a3,-624 # ffffffffc020c470 <etext+0xc7e>
ffffffffc02016e8:	0000a617          	auipc	a2,0xa
ffffffffc02016ec:	54860613          	addi	a2,a2,1352 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02016f0:	0dc00593          	li	a1,220
ffffffffc02016f4:	0000b517          	auipc	a0,0xb
ffffffffc02016f8:	c1c50513          	addi	a0,a0,-996 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02016fc:	d4ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201700:	0000b697          	auipc	a3,0xb
ffffffffc0201704:	db068693          	addi	a3,a3,-592 # ffffffffc020c4b0 <etext+0xcbe>
ffffffffc0201708:	0000a617          	auipc	a2,0xa
ffffffffc020170c:	52860613          	addi	a2,a2,1320 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201710:	0db00593          	li	a1,219
ffffffffc0201714:	0000b517          	auipc	a0,0xb
ffffffffc0201718:	bfc50513          	addi	a0,a0,-1028 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020171c:	d2ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201720:	0000b697          	auipc	a3,0xb
ffffffffc0201724:	c2868693          	addi	a3,a3,-984 # ffffffffc020c348 <etext+0xb56>
ffffffffc0201728:	0000a617          	auipc	a2,0xa
ffffffffc020172c:	50860613          	addi	a2,a2,1288 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201730:	0b800593          	li	a1,184
ffffffffc0201734:	0000b517          	auipc	a0,0xb
ffffffffc0201738:	bdc50513          	addi	a0,a0,-1060 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020173c:	d0ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201740:	0000b697          	auipc	a3,0xb
ffffffffc0201744:	d3068693          	addi	a3,a3,-720 # ffffffffc020c470 <etext+0xc7e>
ffffffffc0201748:	0000a617          	auipc	a2,0xa
ffffffffc020174c:	4e860613          	addi	a2,a2,1256 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201750:	0d500593          	li	a1,213
ffffffffc0201754:	0000b517          	auipc	a0,0xb
ffffffffc0201758:	bbc50513          	addi	a0,a0,-1092 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020175c:	ceffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201760:	0000b697          	auipc	a3,0xb
ffffffffc0201764:	c2868693          	addi	a3,a3,-984 # ffffffffc020c388 <etext+0xb96>
ffffffffc0201768:	0000a617          	auipc	a2,0xa
ffffffffc020176c:	4c860613          	addi	a2,a2,1224 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201770:	0d300593          	li	a1,211
ffffffffc0201774:	0000b517          	auipc	a0,0xb
ffffffffc0201778:	b9c50513          	addi	a0,a0,-1124 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020177c:	ccffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201780:	0000b697          	auipc	a3,0xb
ffffffffc0201784:	be868693          	addi	a3,a3,-1048 # ffffffffc020c368 <etext+0xb76>
ffffffffc0201788:	0000a617          	auipc	a2,0xa
ffffffffc020178c:	4a860613          	addi	a2,a2,1192 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201790:	0d200593          	li	a1,210
ffffffffc0201794:	0000b517          	auipc	a0,0xb
ffffffffc0201798:	b7c50513          	addi	a0,a0,-1156 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020179c:	caffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02017a0:	0000b697          	auipc	a3,0xb
ffffffffc02017a4:	be868693          	addi	a3,a3,-1048 # ffffffffc020c388 <etext+0xb96>
ffffffffc02017a8:	0000a617          	auipc	a2,0xa
ffffffffc02017ac:	48860613          	addi	a2,a2,1160 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02017b0:	0ba00593          	li	a1,186
ffffffffc02017b4:	0000b517          	auipc	a0,0xb
ffffffffc02017b8:	b5c50513          	addi	a0,a0,-1188 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02017bc:	c8ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02017c0:	0000b697          	auipc	a3,0xb
ffffffffc02017c4:	e7068693          	addi	a3,a3,-400 # ffffffffc020c630 <etext+0xe3e>
ffffffffc02017c8:	0000a617          	auipc	a2,0xa
ffffffffc02017cc:	46860613          	addi	a2,a2,1128 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02017d0:	12400593          	li	a1,292
ffffffffc02017d4:	0000b517          	auipc	a0,0xb
ffffffffc02017d8:	b3c50513          	addi	a0,a0,-1220 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02017dc:	c6ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02017e0:	0000b697          	auipc	a3,0xb
ffffffffc02017e4:	cf068693          	addi	a3,a3,-784 # ffffffffc020c4d0 <etext+0xcde>
ffffffffc02017e8:	0000a617          	auipc	a2,0xa
ffffffffc02017ec:	44860613          	addi	a2,a2,1096 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02017f0:	11900593          	li	a1,281
ffffffffc02017f4:	0000b517          	auipc	a0,0xb
ffffffffc02017f8:	b1c50513          	addi	a0,a0,-1252 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02017fc:	c4ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201800:	0000b697          	auipc	a3,0xb
ffffffffc0201804:	c7068693          	addi	a3,a3,-912 # ffffffffc020c470 <etext+0xc7e>
ffffffffc0201808:	0000a617          	auipc	a2,0xa
ffffffffc020180c:	42860613          	addi	a2,a2,1064 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201810:	11700593          	li	a1,279
ffffffffc0201814:	0000b517          	auipc	a0,0xb
ffffffffc0201818:	afc50513          	addi	a0,a0,-1284 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020181c:	c2ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201820:	0000b697          	auipc	a3,0xb
ffffffffc0201824:	c1068693          	addi	a3,a3,-1008 # ffffffffc020c430 <etext+0xc3e>
ffffffffc0201828:	0000a617          	auipc	a2,0xa
ffffffffc020182c:	40860613          	addi	a2,a2,1032 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201830:	0c000593          	li	a1,192
ffffffffc0201834:	0000b517          	auipc	a0,0xb
ffffffffc0201838:	adc50513          	addi	a0,a0,-1316 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020183c:	c0ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201840:	0000b697          	auipc	a3,0xb
ffffffffc0201844:	db068693          	addi	a3,a3,-592 # ffffffffc020c5f0 <etext+0xdfe>
ffffffffc0201848:	0000a617          	auipc	a2,0xa
ffffffffc020184c:	3e860613          	addi	a2,a2,1000 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201850:	11100593          	li	a1,273
ffffffffc0201854:	0000b517          	auipc	a0,0xb
ffffffffc0201858:	abc50513          	addi	a0,a0,-1348 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020185c:	beffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201860:	0000b697          	auipc	a3,0xb
ffffffffc0201864:	d7068693          	addi	a3,a3,-656 # ffffffffc020c5d0 <etext+0xdde>
ffffffffc0201868:	0000a617          	auipc	a2,0xa
ffffffffc020186c:	3c860613          	addi	a2,a2,968 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201870:	10f00593          	li	a1,271
ffffffffc0201874:	0000b517          	auipc	a0,0xb
ffffffffc0201878:	a9c50513          	addi	a0,a0,-1380 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020187c:	bcffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201880:	0000b697          	auipc	a3,0xb
ffffffffc0201884:	d2868693          	addi	a3,a3,-728 # ffffffffc020c5a8 <etext+0xdb6>
ffffffffc0201888:	0000a617          	auipc	a2,0xa
ffffffffc020188c:	3a860613          	addi	a2,a2,936 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201890:	10d00593          	li	a1,269
ffffffffc0201894:	0000b517          	auipc	a0,0xb
ffffffffc0201898:	a7c50513          	addi	a0,a0,-1412 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020189c:	baffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02018a0:	0000b697          	auipc	a3,0xb
ffffffffc02018a4:	ce068693          	addi	a3,a3,-800 # ffffffffc020c580 <etext+0xd8e>
ffffffffc02018a8:	0000a617          	auipc	a2,0xa
ffffffffc02018ac:	38860613          	addi	a2,a2,904 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02018b0:	10c00593          	li	a1,268
ffffffffc02018b4:	0000b517          	auipc	a0,0xb
ffffffffc02018b8:	a5c50513          	addi	a0,a0,-1444 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02018bc:	b8ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02018c0:	0000b697          	auipc	a3,0xb
ffffffffc02018c4:	cb068693          	addi	a3,a3,-848 # ffffffffc020c570 <etext+0xd7e>
ffffffffc02018c8:	0000a617          	auipc	a2,0xa
ffffffffc02018cc:	36860613          	addi	a2,a2,872 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02018d0:	10700593          	li	a1,263
ffffffffc02018d4:	0000b517          	auipc	a0,0xb
ffffffffc02018d8:	a3c50513          	addi	a0,a0,-1476 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02018dc:	b6ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02018e0:	0000b697          	auipc	a3,0xb
ffffffffc02018e4:	b9068693          	addi	a3,a3,-1136 # ffffffffc020c470 <etext+0xc7e>
ffffffffc02018e8:	0000a617          	auipc	a2,0xa
ffffffffc02018ec:	34860613          	addi	a2,a2,840 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02018f0:	10600593          	li	a1,262
ffffffffc02018f4:	0000b517          	auipc	a0,0xb
ffffffffc02018f8:	a1c50513          	addi	a0,a0,-1508 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02018fc:	b4ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201900:	0000b697          	auipc	a3,0xb
ffffffffc0201904:	c5068693          	addi	a3,a3,-944 # ffffffffc020c550 <etext+0xd5e>
ffffffffc0201908:	0000a617          	auipc	a2,0xa
ffffffffc020190c:	32860613          	addi	a2,a2,808 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201910:	10500593          	li	a1,261
ffffffffc0201914:	0000b517          	auipc	a0,0xb
ffffffffc0201918:	9fc50513          	addi	a0,a0,-1540 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020191c:	b2ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201920:	0000b697          	auipc	a3,0xb
ffffffffc0201924:	c0068693          	addi	a3,a3,-1024 # ffffffffc020c520 <etext+0xd2e>
ffffffffc0201928:	0000a617          	auipc	a2,0xa
ffffffffc020192c:	30860613          	addi	a2,a2,776 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201930:	10400593          	li	a1,260
ffffffffc0201934:	0000b517          	auipc	a0,0xb
ffffffffc0201938:	9dc50513          	addi	a0,a0,-1572 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020193c:	b0ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201940:	0000b697          	auipc	a3,0xb
ffffffffc0201944:	bc868693          	addi	a3,a3,-1080 # ffffffffc020c508 <etext+0xd16>
ffffffffc0201948:	0000a617          	auipc	a2,0xa
ffffffffc020194c:	2e860613          	addi	a2,a2,744 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201950:	10300593          	li	a1,259
ffffffffc0201954:	0000b517          	auipc	a0,0xb
ffffffffc0201958:	9bc50513          	addi	a0,a0,-1604 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020195c:	aeffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201960:	0000b697          	auipc	a3,0xb
ffffffffc0201964:	b1068693          	addi	a3,a3,-1264 # ffffffffc020c470 <etext+0xc7e>
ffffffffc0201968:	0000a617          	auipc	a2,0xa
ffffffffc020196c:	2c860613          	addi	a2,a2,712 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201970:	0fd00593          	li	a1,253
ffffffffc0201974:	0000b517          	auipc	a0,0xb
ffffffffc0201978:	99c50513          	addi	a0,a0,-1636 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020197c:	acffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201980:	0000b697          	auipc	a3,0xb
ffffffffc0201984:	b7068693          	addi	a3,a3,-1168 # ffffffffc020c4f0 <etext+0xcfe>
ffffffffc0201988:	0000a617          	auipc	a2,0xa
ffffffffc020198c:	2a860613          	addi	a2,a2,680 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201990:	0f800593          	li	a1,248
ffffffffc0201994:	0000b517          	auipc	a0,0xb
ffffffffc0201998:	97c50513          	addi	a0,a0,-1668 # ffffffffc020c310 <etext+0xb1e>
ffffffffc020199c:	aaffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02019a0:	0000b697          	auipc	a3,0xb
ffffffffc02019a4:	c7068693          	addi	a3,a3,-912 # ffffffffc020c610 <etext+0xe1e>
ffffffffc02019a8:	0000a617          	auipc	a2,0xa
ffffffffc02019ac:	28860613          	addi	a2,a2,648 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02019b0:	11600593          	li	a1,278
ffffffffc02019b4:	0000b517          	auipc	a0,0xb
ffffffffc02019b8:	95c50513          	addi	a0,a0,-1700 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02019bc:	a8ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02019c0:	0000b697          	auipc	a3,0xb
ffffffffc02019c4:	c8068693          	addi	a3,a3,-896 # ffffffffc020c640 <etext+0xe4e>
ffffffffc02019c8:	0000a617          	auipc	a2,0xa
ffffffffc02019cc:	26860613          	addi	a2,a2,616 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02019d0:	12500593          	li	a1,293
ffffffffc02019d4:	0000b517          	auipc	a0,0xb
ffffffffc02019d8:	93c50513          	addi	a0,a0,-1732 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02019dc:	a6ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02019e0:	0000b697          	auipc	a3,0xb
ffffffffc02019e4:	94868693          	addi	a3,a3,-1720 # ffffffffc020c328 <etext+0xb36>
ffffffffc02019e8:	0000a617          	auipc	a2,0xa
ffffffffc02019ec:	24860613          	addi	a2,a2,584 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02019f0:	0f200593          	li	a1,242
ffffffffc02019f4:	0000b517          	auipc	a0,0xb
ffffffffc02019f8:	91c50513          	addi	a0,a0,-1764 # ffffffffc020c310 <etext+0xb1e>
ffffffffc02019fc:	a4ffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201a00:	0000b697          	auipc	a3,0xb
ffffffffc0201a04:	96868693          	addi	a3,a3,-1688 # ffffffffc020c368 <etext+0xb76>
ffffffffc0201a08:	0000a617          	auipc	a2,0xa
ffffffffc0201a0c:	22860613          	addi	a2,a2,552 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201a10:	0b900593          	li	a1,185
ffffffffc0201a14:	0000b517          	auipc	a0,0xb
ffffffffc0201a18:	8fc50513          	addi	a0,a0,-1796 # ffffffffc020c310 <etext+0xb1e>
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
ffffffffc0201b54:	b0868693          	addi	a3,a3,-1272 # ffffffffc020c658 <etext+0xe66>
ffffffffc0201b58:	0000a617          	auipc	a2,0xa
ffffffffc0201b5c:	0d860613          	addi	a2,a2,216 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201b60:	08200593          	li	a1,130
ffffffffc0201b64:	0000a517          	auipc	a0,0xa
ffffffffc0201b68:	7ac50513          	addi	a0,a0,1964 # ffffffffc020c310 <etext+0xb1e>
ffffffffc0201b6c:	8dffe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201b70:	0000b697          	auipc	a3,0xb
ffffffffc0201b74:	ae068693          	addi	a3,a3,-1312 # ffffffffc020c650 <etext+0xe5e>
ffffffffc0201b78:	0000a617          	auipc	a2,0xa
ffffffffc0201b7c:	0b860613          	addi	a2,a2,184 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201b80:	07f00593          	li	a1,127
ffffffffc0201b84:	0000a517          	auipc	a0,0xa
ffffffffc0201b88:	78c50513          	addi	a0,a0,1932 # ffffffffc020c310 <etext+0xb1e>
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
ffffffffc0201c2a:	a2a68693          	addi	a3,a3,-1494 # ffffffffc020c650 <etext+0xe5e>
ffffffffc0201c2e:	0000a617          	auipc	a2,0xa
ffffffffc0201c32:	00260613          	addi	a2,a2,2 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201c36:	06100593          	li	a1,97
ffffffffc0201c3a:	0000a517          	auipc	a0,0xa
ffffffffc0201c3e:	6d650513          	addi	a0,a0,1750 # ffffffffc020c310 <etext+0xb1e>
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
ffffffffc0201d00:	98468693          	addi	a3,a3,-1660 # ffffffffc020c680 <etext+0xe8e>
ffffffffc0201d04:	0000a617          	auipc	a2,0xa
ffffffffc0201d08:	f2c60613          	addi	a2,a2,-212 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201d0c:	04800593          	li	a1,72
ffffffffc0201d10:	0000a517          	auipc	a0,0xa
ffffffffc0201d14:	60050513          	addi	a0,a0,1536 # ffffffffc020c310 <etext+0xb1e>
ffffffffc0201d18:	f32fe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0201d1c:	0000b697          	auipc	a3,0xb
ffffffffc0201d20:	93468693          	addi	a3,a3,-1740 # ffffffffc020c650 <etext+0xe5e>
ffffffffc0201d24:	0000a617          	auipc	a2,0xa
ffffffffc0201d28:	f0c60613          	addi	a2,a2,-244 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201d2c:	04500593          	li	a1,69
ffffffffc0201d30:	0000a517          	auipc	a0,0xa
ffffffffc0201d34:	5e050513          	addi	a0,a0,1504 # ffffffffc020c310 <etext+0xb1e>
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
ffffffffc0201e6a:	c6a7b783          	ld	a5,-918(a5) # ffffffffc020fad0 <nbase>
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
ffffffffc0201e9a:	0000b617          	auipc	a2,0xb
ffffffffc0201e9e:	80e60613          	addi	a2,a2,-2034 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc0201ea2:	07100593          	li	a1,113
ffffffffc0201ea6:	0000b517          	auipc	a0,0xb
ffffffffc0201eaa:	82a50513          	addi	a0,a0,-2006 # ffffffffc020c6d0 <etext+0xede>
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
ffffffffc0201f80:	76468693          	addi	a3,a3,1892 # ffffffffc020c6e0 <etext+0xeee>
ffffffffc0201f84:	0000a617          	auipc	a2,0xa
ffffffffc0201f88:	cac60613          	addi	a2,a2,-852 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0201f8c:	06300593          	li	a1,99
ffffffffc0201f90:	0000a517          	auipc	a0,0xa
ffffffffc0201f94:	77050513          	addi	a0,a0,1904 # ffffffffc020c700 <etext+0xf0e>
ffffffffc0201f98:	cb2fe0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0201f9c <kmalloc_init>:
ffffffffc0201f9c:	1141                	addi	sp,sp,-16
ffffffffc0201f9e:	0000a517          	auipc	a0,0xa
ffffffffc0201fa2:	77a50513          	addi	a0,a0,1914 # ffffffffc020c718 <etext+0xf26>
ffffffffc0201fa6:	e406                	sd	ra,8(sp)
ffffffffc0201fa8:	9fefe0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0201fac:	60a2                	ld	ra,8(sp)
ffffffffc0201fae:	0000a517          	auipc	a0,0xa
ffffffffc0201fb2:	78250513          	addi	a0,a0,1922 # ffffffffc020c730 <etext+0xf3e>
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
ffffffffc02020ca:	a0a63603          	ld	a2,-1526(a2) # ffffffffc020fad0 <nbase>
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
ffffffffc020213a:	64260613          	addi	a2,a2,1602 # ffffffffc020c778 <etext+0xf86>
ffffffffc020213e:	06900593          	li	a1,105
ffffffffc0202142:	0000a517          	auipc	a0,0xa
ffffffffc0202146:	58e50513          	addi	a0,a0,1422 # ffffffffc020c6d0 <etext+0xede>
ffffffffc020214a:	b00fe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020214e:	86aa                	mv	a3,a0
ffffffffc0202150:	0000a617          	auipc	a2,0xa
ffffffffc0202154:	60060613          	addi	a2,a2,1536 # ffffffffc020c750 <etext+0xf5e>
ffffffffc0202158:	07700593          	li	a1,119
ffffffffc020215c:	0000a517          	auipc	a0,0xa
ffffffffc0202160:	57450513          	addi	a0,a0,1396 # ffffffffc020c6d0 <etext+0xede>
ffffffffc0202164:	ae6fe0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0202168 <pa2page.part.0>:
ffffffffc0202168:	1141                	addi	sp,sp,-16
ffffffffc020216a:	0000a617          	auipc	a2,0xa
ffffffffc020216e:	60e60613          	addi	a2,a2,1550 # ffffffffc020c778 <etext+0xf86>
ffffffffc0202172:	06900593          	li	a1,105
ffffffffc0202176:	0000a517          	auipc	a0,0xa
ffffffffc020217a:	55a50513          	addi	a0,a0,1370 # ffffffffc020c6d0 <etext+0xede>
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
ffffffffc02022c2:	4c8090ef          	jal	ffffffffc020b78a <memset>
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
ffffffffc0202378:	412090ef          	jal	ffffffffc020b78a <memset>
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
ffffffffc020242c:	28060613          	addi	a2,a2,640 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc0202430:	13200593          	li	a1,306
ffffffffc0202434:	0000a517          	auipc	a0,0xa
ffffffffc0202438:	36450513          	addi	a0,a0,868 # ffffffffc020c798 <etext+0xfa6>
ffffffffc020243c:	80efe0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0202440:	0000a617          	auipc	a2,0xa
ffffffffc0202444:	26860613          	addi	a2,a2,616 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc0202448:	12500593          	li	a1,293
ffffffffc020244c:	0000a517          	auipc	a0,0xa
ffffffffc0202450:	34c50513          	addi	a0,a0,844 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0202454:	ff7fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0202458:	86aa                	mv	a3,a0
ffffffffc020245a:	0000a617          	auipc	a2,0xa
ffffffffc020245e:	24e60613          	addi	a2,a2,590 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc0202462:	12100593          	li	a1,289
ffffffffc0202466:	0000a517          	auipc	a0,0xa
ffffffffc020246a:	33250513          	addi	a0,a0,818 # ffffffffc020c798 <etext+0xfa6>
ffffffffc020246e:	fddfd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0202472:	0000a617          	auipc	a2,0xa
ffffffffc0202476:	23660613          	addi	a2,a2,566 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc020247a:	12f00593          	li	a1,303
ffffffffc020247e:	0000a517          	auipc	a0,0xa
ffffffffc0202482:	31a50513          	addi	a0,a0,794 # ffffffffc020c798 <etext+0xfa6>
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
ffffffffc020250c:	2b868693          	addi	a3,a3,696 # ffffffffc020c7c0 <etext+0xfce>
ffffffffc0202510:	00009617          	auipc	a2,0x9
ffffffffc0202514:	72060613          	addi	a2,a2,1824 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0202518:	09c00593          	li	a1,156
ffffffffc020251c:	0000a517          	auipc	a0,0xa
ffffffffc0202520:	27c50513          	addi	a0,a0,636 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0202524:	f27fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0202528:	0000a697          	auipc	a3,0xa
ffffffffc020252c:	28068693          	addi	a3,a3,640 # ffffffffc020c7a8 <etext+0xfb6>
ffffffffc0202530:	00009617          	auipc	a2,0x9
ffffffffc0202534:	70060613          	addi	a2,a2,1792 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0202538:	09500593          	li	a1,149
ffffffffc020253c:	0000a517          	auipc	a0,0xa
ffffffffc0202540:	25c50513          	addi	a0,a0,604 # ffffffffc020c798 <etext+0xfa6>
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
ffffffffc020269a:	13a68693          	addi	a3,a3,314 # ffffffffc020c7d0 <etext+0xfde>
ffffffffc020269e:	00009617          	auipc	a2,0x9
ffffffffc02026a2:	59260613          	addi	a2,a2,1426 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02026a6:	15a00593          	li	a1,346
ffffffffc02026aa:	0000a517          	auipc	a0,0xa
ffffffffc02026ae:	0ee50513          	addi	a0,a0,238 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02026b2:	d99fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02026b6:	0000a697          	auipc	a3,0xa
ffffffffc02026ba:	14a68693          	addi	a3,a3,330 # ffffffffc020c800 <etext+0x100e>
ffffffffc02026be:	00009617          	auipc	a2,0x9
ffffffffc02026c2:	57260613          	addi	a2,a2,1394 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02026c6:	15b00593          	li	a1,347
ffffffffc02026ca:	0000a517          	auipc	a0,0xa
ffffffffc02026ce:	0ce50513          	addi	a0,a0,206 # ffffffffc020c798 <etext+0xfa6>
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
ffffffffc020291c:	eb868693          	addi	a3,a3,-328 # ffffffffc020c7d0 <etext+0xfde>
ffffffffc0202920:	00009617          	auipc	a2,0x9
ffffffffc0202924:	31060613          	addi	a2,a2,784 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0202928:	16f00593          	li	a1,367
ffffffffc020292c:	0000a517          	auipc	a0,0xa
ffffffffc0202930:	e6c50513          	addi	a0,a0,-404 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0202934:	b17fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0202938:	0000a617          	auipc	a2,0xa
ffffffffc020293c:	d7060613          	addi	a2,a2,-656 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc0202940:	07100593          	li	a1,113
ffffffffc0202944:	0000a517          	auipc	a0,0xa
ffffffffc0202948:	d8c50513          	addi	a0,a0,-628 # ffffffffc020c6d0 <etext+0xede>
ffffffffc020294c:	afffd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0202950:	86f2                	mv	a3,t3
ffffffffc0202952:	0000a617          	auipc	a2,0xa
ffffffffc0202956:	d5660613          	addi	a2,a2,-682 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc020295a:	07100593          	li	a1,113
ffffffffc020295e:	0000a517          	auipc	a0,0xa
ffffffffc0202962:	d7250513          	addi	a0,a0,-654 # ffffffffc020c6d0 <etext+0xede>
ffffffffc0202966:	ae5fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020296a:	ffeff0ef          	jal	ffffffffc0202168 <pa2page.part.0>
ffffffffc020296e:	0000a697          	auipc	a3,0xa
ffffffffc0202972:	e9268693          	addi	a3,a3,-366 # ffffffffc020c800 <etext+0x100e>
ffffffffc0202976:	00009617          	auipc	a2,0x9
ffffffffc020297a:	2ba60613          	addi	a2,a2,698 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020297e:	17000593          	li	a1,368
ffffffffc0202982:	0000a517          	auipc	a0,0xa
ffffffffc0202986:	e1650513          	addi	a0,a0,-490 # ffffffffc020c798 <etext+0xfa6>
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
ffffffffc0202b24:	3a878793          	addi	a5,a5,936 # ffffffffc020eec8 <default_pmm_manager>
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
ffffffffc0202b4e:	cce50513          	addi	a0,a0,-818 # ffffffffc020c818 <etext+0x1026>
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
ffffffffc0202b86:	cce50513          	addi	a0,a0,-818 # ffffffffc020c850 <etext+0x105e>
ffffffffc0202b8a:	e1cfd0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0202b8e:	00990433          	add	s0,s2,s1
ffffffffc0202b92:	864a                	mv	a2,s2
ffffffffc0202b94:	85a6                	mv	a1,s1
ffffffffc0202b96:	fff40693          	addi	a3,s0,-1
ffffffffc0202b9a:	0000a517          	auipc	a0,0xa
ffffffffc0202b9e:	cce50513          	addi	a0,a0,-818 # ffffffffc020c868 <etext+0x1076>
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
ffffffffc0202c22:	c7250513          	addi	a0,a0,-910 # ffffffffc020c890 <etext+0x109e>
ffffffffc0202c26:	d80fd0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0202c2a:	000b3783          	ld	a5,0(s6)
ffffffffc0202c2e:	7b9c                	ld	a5,48(a5)
ffffffffc0202c30:	9782                	jalr	a5
ffffffffc0202c32:	0000a517          	auipc	a0,0xa
ffffffffc0202c36:	c7650513          	addi	a0,a0,-906 # ffffffffc020c8a8 <etext+0x10b6>
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
ffffffffc0202c86:	305080ef          	jal	ffffffffc020b78a <memset>
ffffffffc0202c8a:	0009b683          	ld	a3,0(s3)
ffffffffc0202c8e:	0000a917          	auipc	s2,0xa
ffffffffc0202c92:	b6390913          	addi	s2,s2,-1181 # ffffffffc020c7f1 <etext+0xfff>
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
ffffffffc0202d06:	be650513          	addi	a0,a0,-1050 # ffffffffc020c8e8 <etext+0x10f6>
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
ffffffffc0202faa:	cc250513          	addi	a0,a0,-830 # ffffffffc020cc68 <etext+0x1476>
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
ffffffffc020306a:	d4a58593          	addi	a1,a1,-694 # ffffffffc020cdb0 <etext+0x15be>
ffffffffc020306e:	10000513          	li	a0,256
ffffffffc0203072:	698080ef          	jal	ffffffffc020b70a <strcpy>
ffffffffc0203076:	6585                	lui	a1,0x1
ffffffffc0203078:	10058593          	addi	a1,a1,256 # 1100 <_binary_bin_swap_img_size-0x6c00>
ffffffffc020307c:	10000513          	li	a0,256
ffffffffc0203080:	69c080ef          	jal	ffffffffc020b71c <strcmp>
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
ffffffffc02030b4:	622080ef          	jal	ffffffffc020b6d6 <strlen>
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
ffffffffc020317c:	cb050513          	addi	a0,a0,-848 # ffffffffc020ce28 <etext+0x1636>
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
ffffffffc0203312:	478080ef          	jal	ffffffffc020b78a <memset>
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
ffffffffc020337e:	59650513          	addi	a0,a0,1430 # ffffffffc020c910 <etext+0x111e>
ffffffffc0203382:	e25fc0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0203386:	ba71                	j	ffffffffc0202d22 <pmm_init+0x202>
ffffffffc0203388:	0000a697          	auipc	a3,0xa
ffffffffc020338c:	90068693          	addi	a3,a3,-1792 # ffffffffc020cc88 <etext+0x1496>
ffffffffc0203390:	00009617          	auipc	a2,0x9
ffffffffc0203394:	8a060613          	addi	a2,a2,-1888 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203398:	29600593          	li	a1,662
ffffffffc020339c:	00009517          	auipc	a0,0x9
ffffffffc02033a0:	3fc50513          	addi	a0,a0,1020 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02033a4:	8a6fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02033a8:	86a2                	mv	a3,s0
ffffffffc02033aa:	00009617          	auipc	a2,0x9
ffffffffc02033ae:	2fe60613          	addi	a2,a2,766 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc02033b2:	29600593          	li	a1,662
ffffffffc02033b6:	00009517          	auipc	a0,0x9
ffffffffc02033ba:	3e250513          	addi	a0,a0,994 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02033be:	88cfd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02033c2:	0000a697          	auipc	a3,0xa
ffffffffc02033c6:	90668693          	addi	a3,a3,-1786 # ffffffffc020ccc8 <etext+0x14d6>
ffffffffc02033ca:	00009617          	auipc	a2,0x9
ffffffffc02033ce:	86660613          	addi	a2,a2,-1946 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02033d2:	29700593          	li	a1,663
ffffffffc02033d6:	00009517          	auipc	a0,0x9
ffffffffc02033da:	3c250513          	addi	a0,a0,962 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02033de:	86cfd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02033e2:	d87fe0ef          	jal	ffffffffc0202168 <pa2page.part.0>
ffffffffc02033e6:	00009697          	auipc	a3,0x9
ffffffffc02033ea:	70a68693          	addi	a3,a3,1802 # ffffffffc020caf0 <etext+0x12fe>
ffffffffc02033ee:	00009617          	auipc	a2,0x9
ffffffffc02033f2:	84260613          	addi	a2,a2,-1982 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02033f6:	27300593          	li	a1,627
ffffffffc02033fa:	00009517          	auipc	a0,0x9
ffffffffc02033fe:	39e50513          	addi	a0,a0,926 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203402:	848fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203406:	0000a697          	auipc	a3,0xa
ffffffffc020340a:	94a68693          	addi	a3,a3,-1718 # ffffffffc020cd50 <etext+0x155e>
ffffffffc020340e:	00009617          	auipc	a2,0x9
ffffffffc0203412:	82260613          	addi	a2,a2,-2014 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203416:	2a000593          	li	a1,672
ffffffffc020341a:	00009517          	auipc	a0,0x9
ffffffffc020341e:	37e50513          	addi	a0,a0,894 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203422:	828fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203426:	00009697          	auipc	a3,0x9
ffffffffc020342a:	7ea68693          	addi	a3,a3,2026 # ffffffffc020cc10 <etext+0x141e>
ffffffffc020342e:	00009617          	auipc	a2,0x9
ffffffffc0203432:	80260613          	addi	a2,a2,-2046 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203436:	27f00593          	li	a1,639
ffffffffc020343a:	00009517          	auipc	a0,0x9
ffffffffc020343e:	35e50513          	addi	a0,a0,862 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203442:	808fd0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203446:	00009697          	auipc	a3,0x9
ffffffffc020344a:	79a68693          	addi	a3,a3,1946 # ffffffffc020cbe0 <etext+0x13ee>
ffffffffc020344e:	00008617          	auipc	a2,0x8
ffffffffc0203452:	7e260613          	addi	a2,a2,2018 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203456:	27500593          	li	a1,629
ffffffffc020345a:	00009517          	auipc	a0,0x9
ffffffffc020345e:	33e50513          	addi	a0,a0,830 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203462:	fe9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203466:	00009697          	auipc	a3,0x9
ffffffffc020346a:	5ea68693          	addi	a3,a3,1514 # ffffffffc020ca50 <etext+0x125e>
ffffffffc020346e:	00008617          	auipc	a2,0x8
ffffffffc0203472:	7c260613          	addi	a2,a2,1986 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203476:	27400593          	li	a1,628
ffffffffc020347a:	00009517          	auipc	a0,0x9
ffffffffc020347e:	31e50513          	addi	a0,a0,798 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203482:	fc9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203486:	00009697          	auipc	a3,0x9
ffffffffc020348a:	74268693          	addi	a3,a3,1858 # ffffffffc020cbc8 <etext+0x13d6>
ffffffffc020348e:	00008617          	auipc	a2,0x8
ffffffffc0203492:	7a260613          	addi	a2,a2,1954 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203496:	27900593          	li	a1,633
ffffffffc020349a:	00009517          	auipc	a0,0x9
ffffffffc020349e:	2fe50513          	addi	a0,a0,766 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02034a2:	fa9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02034a6:	00009697          	auipc	a3,0x9
ffffffffc02034aa:	5c268693          	addi	a3,a3,1474 # ffffffffc020ca68 <etext+0x1276>
ffffffffc02034ae:	00008617          	auipc	a2,0x8
ffffffffc02034b2:	78260613          	addi	a2,a2,1922 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02034b6:	27800593          	li	a1,632
ffffffffc02034ba:	00009517          	auipc	a0,0x9
ffffffffc02034be:	2de50513          	addi	a0,a0,734 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02034c2:	f89fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02034c6:	0000a697          	auipc	a3,0xa
ffffffffc02034ca:	81a68693          	addi	a3,a3,-2022 # ffffffffc020cce0 <etext+0x14ee>
ffffffffc02034ce:	00008617          	auipc	a2,0x8
ffffffffc02034d2:	76260613          	addi	a2,a2,1890 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02034d6:	29a00593          	li	a1,666
ffffffffc02034da:	00009517          	auipc	a0,0x9
ffffffffc02034de:	2be50513          	addi	a0,a0,702 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02034e2:	f69fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02034e6:	0000a697          	auipc	a3,0xa
ffffffffc02034ea:	85268693          	addi	a3,a3,-1966 # ffffffffc020cd38 <etext+0x1546>
ffffffffc02034ee:	00008617          	auipc	a2,0x8
ffffffffc02034f2:	74260613          	addi	a2,a2,1858 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02034f6:	29f00593          	li	a1,671
ffffffffc02034fa:	00009517          	auipc	a0,0x9
ffffffffc02034fe:	29e50513          	addi	a0,a0,670 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203502:	f49fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203506:	00009697          	auipc	a3,0x9
ffffffffc020350a:	7f268693          	addi	a3,a3,2034 # ffffffffc020ccf8 <etext+0x1506>
ffffffffc020350e:	00008617          	auipc	a2,0x8
ffffffffc0203512:	72260613          	addi	a2,a2,1826 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203516:	29e00593          	li	a1,670
ffffffffc020351a:	00009517          	auipc	a0,0x9
ffffffffc020351e:	27e50513          	addi	a0,a0,638 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203522:	f29fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203526:	0000a697          	auipc	a3,0xa
ffffffffc020352a:	8da68693          	addi	a3,a3,-1830 # ffffffffc020ce00 <etext+0x160e>
ffffffffc020352e:	00008617          	auipc	a2,0x8
ffffffffc0203532:	70260613          	addi	a2,a2,1794 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203536:	2a800593          	li	a1,680
ffffffffc020353a:	00009517          	auipc	a0,0x9
ffffffffc020353e:	25e50513          	addi	a0,a0,606 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203542:	f09fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203546:	0000a697          	auipc	a3,0xa
ffffffffc020354a:	88268693          	addi	a3,a3,-1918 # ffffffffc020cdc8 <etext+0x15d6>
ffffffffc020354e:	00008617          	auipc	a2,0x8
ffffffffc0203552:	6e260613          	addi	a2,a2,1762 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203556:	2a500593          	li	a1,677
ffffffffc020355a:	00009517          	auipc	a0,0x9
ffffffffc020355e:	23e50513          	addi	a0,a0,574 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203562:	ee9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203566:	0000a697          	auipc	a3,0xa
ffffffffc020356a:	83268693          	addi	a3,a3,-1998 # ffffffffc020cd98 <etext+0x15a6>
ffffffffc020356e:	00008617          	auipc	a2,0x8
ffffffffc0203572:	6c260613          	addi	a2,a2,1730 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203576:	2a100593          	li	a1,673
ffffffffc020357a:	00009517          	auipc	a0,0x9
ffffffffc020357e:	21e50513          	addi	a0,a0,542 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203582:	ec9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203586:	86be                	mv	a3,a5
ffffffffc0203588:	00009617          	auipc	a2,0x9
ffffffffc020358c:	1c860613          	addi	a2,a2,456 # ffffffffc020c750 <etext+0xf5e>
ffffffffc0203590:	0dc00593          	li	a1,220
ffffffffc0203594:	00009517          	auipc	a0,0x9
ffffffffc0203598:	20450513          	addi	a0,a0,516 # ffffffffc020c798 <etext+0xfa6>
ffffffffc020359c:	eaffc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02035a0:	86be                	mv	a3,a5
ffffffffc02035a2:	00009617          	auipc	a2,0x9
ffffffffc02035a6:	1ae60613          	addi	a2,a2,430 # ffffffffc020c750 <etext+0xf5e>
ffffffffc02035aa:	0db00593          	li	a1,219
ffffffffc02035ae:	00009517          	auipc	a0,0x9
ffffffffc02035b2:	1ea50513          	addi	a0,a0,490 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02035b6:	e95fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02035ba:	00009617          	auipc	a2,0x9
ffffffffc02035be:	0ee60613          	addi	a2,a2,238 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc02035c2:	07100593          	li	a1,113
ffffffffc02035c6:	00009517          	auipc	a0,0x9
ffffffffc02035ca:	10a50513          	addi	a0,a0,266 # ffffffffc020c6d0 <etext+0xede>
ffffffffc02035ce:	e7dfc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02035d2:	86a2                	mv	a3,s0
ffffffffc02035d4:	00009617          	auipc	a2,0x9
ffffffffc02035d8:	17c60613          	addi	a2,a2,380 # ffffffffc020c750 <etext+0xf5e>
ffffffffc02035dc:	0ca00593          	li	a1,202
ffffffffc02035e0:	00009517          	auipc	a0,0x9
ffffffffc02035e4:	1b850513          	addi	a0,a0,440 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02035e8:	e63fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02035ec:	00009697          	auipc	a3,0x9
ffffffffc02035f0:	4c468693          	addi	a3,a3,1220 # ffffffffc020cab0 <etext+0x12be>
ffffffffc02035f4:	00008617          	auipc	a2,0x8
ffffffffc02035f8:	63c60613          	addi	a2,a2,1596 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02035fc:	26900593          	li	a1,617
ffffffffc0203600:	00009517          	auipc	a0,0x9
ffffffffc0203604:	19850513          	addi	a0,a0,408 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203608:	e43fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020360c:	00009617          	auipc	a2,0x9
ffffffffc0203610:	2bc60613          	addi	a2,a2,700 # ffffffffc020c8c8 <etext+0x10d6>
ffffffffc0203614:	0aa00593          	li	a1,170
ffffffffc0203618:	00009517          	auipc	a0,0x9
ffffffffc020361c:	18050513          	addi	a0,a0,384 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203620:	e2bfc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203624:	00009617          	auipc	a2,0x9
ffffffffc0203628:	12c60613          	addi	a2,a2,300 # ffffffffc020c750 <etext+0xf5e>
ffffffffc020362c:	08100593          	li	a1,129
ffffffffc0203630:	00009517          	auipc	a0,0x9
ffffffffc0203634:	16850513          	addi	a0,a0,360 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203638:	e13fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020363c:	00009697          	auipc	a3,0x9
ffffffffc0203640:	44468693          	addi	a3,a3,1092 # ffffffffc020ca80 <etext+0x128e>
ffffffffc0203644:	00008617          	auipc	a2,0x8
ffffffffc0203648:	5ec60613          	addi	a2,a2,1516 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020364c:	26600593          	li	a1,614
ffffffffc0203650:	00009517          	auipc	a0,0x9
ffffffffc0203654:	14850513          	addi	a0,a0,328 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203658:	df3fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020365c:	86d6                	mv	a3,s5
ffffffffc020365e:	00009617          	auipc	a2,0x9
ffffffffc0203662:	04a60613          	addi	a2,a2,74 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc0203666:	26500593          	li	a1,613
ffffffffc020366a:	00009517          	auipc	a0,0x9
ffffffffc020366e:	12e50513          	addi	a0,a0,302 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203672:	dd9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203676:	00009697          	auipc	a3,0x9
ffffffffc020367a:	55268693          	addi	a3,a3,1362 # ffffffffc020cbc8 <etext+0x13d6>
ffffffffc020367e:	00008617          	auipc	a2,0x8
ffffffffc0203682:	5b260613          	addi	a2,a2,1458 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203686:	27200593          	li	a1,626
ffffffffc020368a:	00009517          	auipc	a0,0x9
ffffffffc020368e:	10e50513          	addi	a0,a0,270 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203692:	db9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203696:	00009697          	auipc	a3,0x9
ffffffffc020369a:	51a68693          	addi	a3,a3,1306 # ffffffffc020cbb0 <etext+0x13be>
ffffffffc020369e:	00008617          	auipc	a2,0x8
ffffffffc02036a2:	59260613          	addi	a2,a2,1426 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02036a6:	27100593          	li	a1,625
ffffffffc02036aa:	00009517          	auipc	a0,0x9
ffffffffc02036ae:	0ee50513          	addi	a0,a0,238 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02036b2:	d99fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02036b6:	00009697          	auipc	a3,0x9
ffffffffc02036ba:	4ca68693          	addi	a3,a3,1226 # ffffffffc020cb80 <etext+0x138e>
ffffffffc02036be:	00008617          	auipc	a2,0x8
ffffffffc02036c2:	57260613          	addi	a2,a2,1394 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02036c6:	27000593          	li	a1,624
ffffffffc02036ca:	00009517          	auipc	a0,0x9
ffffffffc02036ce:	0ce50513          	addi	a0,a0,206 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02036d2:	d79fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02036d6:	00009697          	auipc	a3,0x9
ffffffffc02036da:	49268693          	addi	a3,a3,1170 # ffffffffc020cb68 <etext+0x1376>
ffffffffc02036de:	00008617          	auipc	a2,0x8
ffffffffc02036e2:	55260613          	addi	a2,a2,1362 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02036e6:	26e00593          	li	a1,622
ffffffffc02036ea:	00009517          	auipc	a0,0x9
ffffffffc02036ee:	0ae50513          	addi	a0,a0,174 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02036f2:	d59fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02036f6:	00009697          	auipc	a3,0x9
ffffffffc02036fa:	45268693          	addi	a3,a3,1106 # ffffffffc020cb48 <etext+0x1356>
ffffffffc02036fe:	00008617          	auipc	a2,0x8
ffffffffc0203702:	53260613          	addi	a2,a2,1330 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203706:	26d00593          	li	a1,621
ffffffffc020370a:	00009517          	auipc	a0,0x9
ffffffffc020370e:	08e50513          	addi	a0,a0,142 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203712:	d39fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203716:	00009697          	auipc	a3,0x9
ffffffffc020371a:	42268693          	addi	a3,a3,1058 # ffffffffc020cb38 <etext+0x1346>
ffffffffc020371e:	00008617          	auipc	a2,0x8
ffffffffc0203722:	51260613          	addi	a2,a2,1298 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203726:	26c00593          	li	a1,620
ffffffffc020372a:	00009517          	auipc	a0,0x9
ffffffffc020372e:	06e50513          	addi	a0,a0,110 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203732:	d19fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203736:	00009697          	auipc	a3,0x9
ffffffffc020373a:	3f268693          	addi	a3,a3,1010 # ffffffffc020cb28 <etext+0x1336>
ffffffffc020373e:	00008617          	auipc	a2,0x8
ffffffffc0203742:	4f260613          	addi	a2,a2,1266 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203746:	26b00593          	li	a1,619
ffffffffc020374a:	00009517          	auipc	a0,0x9
ffffffffc020374e:	04e50513          	addi	a0,a0,78 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203752:	cf9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203756:	00009697          	auipc	a3,0x9
ffffffffc020375a:	39a68693          	addi	a3,a3,922 # ffffffffc020caf0 <etext+0x12fe>
ffffffffc020375e:	00008617          	auipc	a2,0x8
ffffffffc0203762:	4d260613          	addi	a2,a2,1234 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203766:	26a00593          	li	a1,618
ffffffffc020376a:	00009517          	auipc	a0,0x9
ffffffffc020376e:	02e50513          	addi	a0,a0,46 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203772:	cd9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203776:	00009697          	auipc	a3,0x9
ffffffffc020377a:	4ca68693          	addi	a3,a3,1226 # ffffffffc020cc40 <etext+0x144e>
ffffffffc020377e:	00008617          	auipc	a2,0x8
ffffffffc0203782:	4b260613          	addi	a2,a2,1202 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203786:	28700593          	li	a1,647
ffffffffc020378a:	00009517          	auipc	a0,0x9
ffffffffc020378e:	00e50513          	addi	a0,a0,14 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203792:	cb9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203796:	00009697          	auipc	a3,0x9
ffffffffc020379a:	1a268693          	addi	a3,a3,418 # ffffffffc020c938 <etext+0x1146>
ffffffffc020379e:	00008617          	auipc	a2,0x8
ffffffffc02037a2:	49260613          	addi	a2,a2,1170 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02037a6:	25700593          	li	a1,599
ffffffffc02037aa:	00009517          	auipc	a0,0x9
ffffffffc02037ae:	fee50513          	addi	a0,a0,-18 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02037b2:	c99fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02037b6:	00009697          	auipc	a3,0x9
ffffffffc02037ba:	1e268693          	addi	a3,a3,482 # ffffffffc020c998 <etext+0x11a6>
ffffffffc02037be:	00008617          	auipc	a2,0x8
ffffffffc02037c2:	47260613          	addi	a2,a2,1138 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02037c6:	25900593          	li	a1,601
ffffffffc02037ca:	00009517          	auipc	a0,0x9
ffffffffc02037ce:	fce50513          	addi	a0,a0,-50 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02037d2:	c79fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02037d6:	00009697          	auipc	a3,0x9
ffffffffc02037da:	18268693          	addi	a3,a3,386 # ffffffffc020c958 <etext+0x1166>
ffffffffc02037de:	00008617          	auipc	a2,0x8
ffffffffc02037e2:	45260613          	addi	a2,a2,1106 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02037e6:	25800593          	li	a1,600
ffffffffc02037ea:	00009517          	auipc	a0,0x9
ffffffffc02037ee:	fae50513          	addi	a0,a0,-82 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02037f2:	c59fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02037f6:	00009617          	auipc	a2,0x9
ffffffffc02037fa:	03a60613          	addi	a2,a2,58 # ffffffffc020c830 <etext+0x103e>
ffffffffc02037fe:	06500593          	li	a1,101
ffffffffc0203802:	00009517          	auipc	a0,0x9
ffffffffc0203806:	f9650513          	addi	a0,a0,-106 # ffffffffc020c798 <etext+0xfa6>
ffffffffc020380a:	c41fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020380e:	00009697          	auipc	a3,0x9
ffffffffc0203812:	43268693          	addi	a3,a3,1074 # ffffffffc020cc40 <etext+0x144e>
ffffffffc0203816:	00008617          	auipc	a2,0x8
ffffffffc020381a:	41a60613          	addi	a2,a2,1050 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020381e:	2b100593          	li	a1,689
ffffffffc0203822:	00009517          	auipc	a0,0x9
ffffffffc0203826:	f7650513          	addi	a0,a0,-138 # ffffffffc020c798 <etext+0xfa6>
ffffffffc020382a:	c21fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020382e:	00009617          	auipc	a2,0x9
ffffffffc0203832:	1fa60613          	addi	a2,a2,506 # ffffffffc020ca28 <etext+0x1236>
ffffffffc0203836:	07f00593          	li	a1,127
ffffffffc020383a:	00009517          	auipc	a0,0x9
ffffffffc020383e:	e9650513          	addi	a0,a0,-362 # ffffffffc020c6d0 <etext+0xede>
ffffffffc0203842:	c09fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203846:	00009697          	auipc	a3,0x9
ffffffffc020384a:	1b268693          	addi	a3,a3,434 # ffffffffc020c9f8 <etext+0x1206>
ffffffffc020384e:	00008617          	auipc	a2,0x8
ffffffffc0203852:	3e260613          	addi	a2,a2,994 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203856:	26000593          	li	a1,608
ffffffffc020385a:	00009517          	auipc	a0,0x9
ffffffffc020385e:	f3e50513          	addi	a0,a0,-194 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203862:	be9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203866:	86ca                	mv	a3,s2
ffffffffc0203868:	00009617          	auipc	a2,0x9
ffffffffc020386c:	ee860613          	addi	a2,a2,-280 # ffffffffc020c750 <etext+0xf5e>
ffffffffc0203870:	0c600593          	li	a1,198
ffffffffc0203874:	00009517          	auipc	a0,0x9
ffffffffc0203878:	f2450513          	addi	a0,a0,-220 # ffffffffc020c798 <etext+0xfa6>
ffffffffc020387c:	bcffc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203880:	00009697          	auipc	a3,0x9
ffffffffc0203884:	1d068693          	addi	a3,a3,464 # ffffffffc020ca50 <etext+0x125e>
ffffffffc0203888:	00008617          	auipc	a2,0x8
ffffffffc020388c:	3a860613          	addi	a2,a2,936 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203890:	26100593          	li	a1,609
ffffffffc0203894:	00009517          	auipc	a0,0x9
ffffffffc0203898:	f0450513          	addi	a0,a0,-252 # ffffffffc020c798 <etext+0xfa6>
ffffffffc020389c:	baffc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02038a0:	00009617          	auipc	a2,0x9
ffffffffc02038a4:	e0860613          	addi	a2,a2,-504 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc02038a8:	26400593          	li	a1,612
ffffffffc02038ac:	00009517          	auipc	a0,0x9
ffffffffc02038b0:	eec50513          	addi	a0,a0,-276 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02038b4:	b97fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02038b8:	00009697          	auipc	a3,0x9
ffffffffc02038bc:	1b068693          	addi	a3,a3,432 # ffffffffc020ca68 <etext+0x1276>
ffffffffc02038c0:	00008617          	auipc	a2,0x8
ffffffffc02038c4:	37060613          	addi	a2,a2,880 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02038c8:	26200593          	li	a1,610
ffffffffc02038cc:	00009517          	auipc	a0,0x9
ffffffffc02038d0:	ecc50513          	addi	a0,a0,-308 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02038d4:	b77fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02038d8:	00009697          	auipc	a3,0x9
ffffffffc02038dc:	0f068693          	addi	a3,a3,240 # ffffffffc020c9c8 <etext+0x11d6>
ffffffffc02038e0:	00008617          	auipc	a2,0x8
ffffffffc02038e4:	35060613          	addi	a2,a2,848 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02038e8:	25d00593          	li	a1,605
ffffffffc02038ec:	00009517          	auipc	a0,0x9
ffffffffc02038f0:	eac50513          	addi	a0,a0,-340 # ffffffffc020c798 <etext+0xfa6>
ffffffffc02038f4:	b57fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02038f8:	00009697          	auipc	a3,0x9
ffffffffc02038fc:	2d068693          	addi	a3,a3,720 # ffffffffc020cbc8 <etext+0x13d6>
ffffffffc0203900:	00008617          	auipc	a2,0x8
ffffffffc0203904:	33060613          	addi	a2,a2,816 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203908:	27d00593          	li	a1,637
ffffffffc020390c:	00009517          	auipc	a0,0x9
ffffffffc0203910:	e8c50513          	addi	a0,a0,-372 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203914:	b37fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203918:	00009697          	auipc	a3,0x9
ffffffffc020391c:	2e068693          	addi	a3,a3,736 # ffffffffc020cbf8 <etext+0x1406>
ffffffffc0203920:	00008617          	auipc	a2,0x8
ffffffffc0203924:	31060613          	addi	a2,a2,784 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203928:	27c00593          	li	a1,636
ffffffffc020392c:	00009517          	auipc	a0,0x9
ffffffffc0203930:	e6c50513          	addi	a0,a0,-404 # ffffffffc020c798 <etext+0xfa6>
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
ffffffffc0203a3e:	42e68693          	addi	a3,a3,1070 # ffffffffc020ce68 <etext+0x1676>
ffffffffc0203a42:	00008617          	auipc	a2,0x8
ffffffffc0203a46:	1ee60613          	addi	a2,a2,494 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203a4a:	1f500593          	li	a1,501
ffffffffc0203a4e:	00009517          	auipc	a0,0x9
ffffffffc0203a52:	d4a50513          	addi	a0,a0,-694 # ffffffffc020c798 <etext+0xfa6>
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
ffffffffc0203ac6:	515070ef          	jal	ffffffffc020b7da <memcpy>
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
ffffffffc0203b00:	34c68693          	addi	a3,a3,844 # ffffffffc020ce48 <etext+0x1656>
ffffffffc0203b04:	00008617          	auipc	a2,0x8
ffffffffc0203b08:	12c60613          	addi	a2,a2,300 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203b0c:	1ce00593          	li	a1,462
ffffffffc0203b10:	00009517          	auipc	a0,0x9
ffffffffc0203b14:	c8850513          	addi	a0,a0,-888 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203b18:	933fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203b1c:	00009617          	auipc	a2,0x9
ffffffffc0203b20:	c5c60613          	addi	a2,a2,-932 # ffffffffc020c778 <etext+0xf86>
ffffffffc0203b24:	06900593          	li	a1,105
ffffffffc0203b28:	00009517          	auipc	a0,0x9
ffffffffc0203b2c:	ba850513          	addi	a0,a0,-1112 # ffffffffc020c6d0 <etext+0xede>
ffffffffc0203b30:	91bfc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203b34:	00009617          	auipc	a2,0x9
ffffffffc0203b38:	ef460613          	addi	a2,a2,-268 # ffffffffc020ca28 <etext+0x1236>
ffffffffc0203b3c:	07f00593          	li	a1,127
ffffffffc0203b40:	00009517          	auipc	a0,0x9
ffffffffc0203b44:	b9050513          	addi	a0,a0,-1136 # ffffffffc020c6d0 <etext+0xede>
ffffffffc0203b48:	903fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203b4c:	86be                	mv	a3,a5
ffffffffc0203b4e:	00009617          	auipc	a2,0x9
ffffffffc0203b52:	b5a60613          	addi	a2,a2,-1190 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc0203b56:	07100593          	li	a1,113
ffffffffc0203b5a:	00009517          	auipc	a0,0x9
ffffffffc0203b5e:	b7650513          	addi	a0,a0,-1162 # ffffffffc020c6d0 <etext+0xede>
ffffffffc0203b62:	8e9fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203b66:	86ea                	mv	a3,s10
ffffffffc0203b68:	00009617          	auipc	a2,0x9
ffffffffc0203b6c:	b4060613          	addi	a2,a2,-1216 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc0203b70:	07100593          	li	a1,113
ffffffffc0203b74:	00009517          	auipc	a0,0x9
ffffffffc0203b78:	b5c50513          	addi	a0,a0,-1188 # ffffffffc020c6d0 <etext+0xede>
ffffffffc0203b7c:	8cffc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203b80:	00009697          	auipc	a3,0x9
ffffffffc0203b84:	2d868693          	addi	a3,a3,728 # ffffffffc020ce58 <etext+0x1666>
ffffffffc0203b88:	00008617          	auipc	a2,0x8
ffffffffc0203b8c:	0a860613          	addi	a2,a2,168 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203b90:	1ec00593          	li	a1,492
ffffffffc0203b94:	00009517          	auipc	a0,0x9
ffffffffc0203b98:	c0450513          	addi	a0,a0,-1020 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203b9c:	8affc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203ba0:	00009697          	auipc	a3,0x9
ffffffffc0203ba4:	c6068693          	addi	a3,a3,-928 # ffffffffc020c800 <etext+0x100e>
ffffffffc0203ba8:	00008617          	auipc	a2,0x8
ffffffffc0203bac:	08860613          	addi	a2,a2,136 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203bb0:	1b600593          	li	a1,438
ffffffffc0203bb4:	00009517          	auipc	a0,0x9
ffffffffc0203bb8:	be450513          	addi	a0,a0,-1052 # ffffffffc020c798 <etext+0xfa6>
ffffffffc0203bbc:	88ffc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203bc0:	00009697          	auipc	a3,0x9
ffffffffc0203bc4:	c1068693          	addi	a3,a3,-1008 # ffffffffc020c7d0 <etext+0xfde>
ffffffffc0203bc8:	00008617          	auipc	a2,0x8
ffffffffc0203bcc:	06860613          	addi	a2,a2,104 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203bd0:	1b500593          	li	a1,437
ffffffffc0203bd4:	00009517          	auipc	a0,0x9
ffffffffc0203bd8:	bc450513          	addi	a0,a0,-1084 # ffffffffc020c798 <etext+0xfa6>
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
ffffffffc0203c2c:	25068693          	addi	a3,a3,592 # ffffffffc020ce78 <etext+0x1686>
ffffffffc0203c30:	00008617          	auipc	a2,0x8
ffffffffc0203c34:	00060613          	mv	a2,a2
ffffffffc0203c38:	23e00593          	li	a1,574
ffffffffc0203c3c:	00009517          	auipc	a0,0x9
ffffffffc0203c40:	b5c50513          	addi	a0,a0,-1188 # ffffffffc020c798 <etext+0xfa6>
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
ffffffffc0203ca4:	1f068693          	addi	a3,a3,496 # ffffffffc020ce90 <etext+0x169e>
ffffffffc0203ca8:	00008617          	auipc	a2,0x8
ffffffffc0203cac:	f8860613          	addi	a2,a2,-120 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203cb0:	07400593          	li	a1,116
ffffffffc0203cb4:	00009517          	auipc	a0,0x9
ffffffffc0203cb8:	1fc50513          	addi	a0,a0,508 # ffffffffc020ceb0 <etext+0x16be>
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
ffffffffc0203db2:	11268693          	addi	a3,a3,274 # ffffffffc020cec0 <etext+0x16ce>
ffffffffc0203db6:	00008617          	auipc	a2,0x8
ffffffffc0203dba:	e7a60613          	addi	a2,a2,-390 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203dbe:	07a00593          	li	a1,122
ffffffffc0203dc2:	00009517          	auipc	a0,0x9
ffffffffc0203dc6:	0ee50513          	addi	a0,a0,238 # ffffffffc020ceb0 <etext+0x16be>
ffffffffc0203dca:	e80fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203dce:	00009697          	auipc	a3,0x9
ffffffffc0203dd2:	13268693          	addi	a3,a3,306 # ffffffffc020cf00 <etext+0x170e>
ffffffffc0203dd6:	00008617          	auipc	a2,0x8
ffffffffc0203dda:	e5a60613          	addi	a2,a2,-422 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203dde:	07300593          	li	a1,115
ffffffffc0203de2:	00009517          	auipc	a0,0x9
ffffffffc0203de6:	0ce50513          	addi	a0,a0,206 # ffffffffc020ceb0 <etext+0x16be>
ffffffffc0203dea:	e60fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0203dee:	00009697          	auipc	a3,0x9
ffffffffc0203df2:	0f268693          	addi	a3,a3,242 # ffffffffc020cee0 <etext+0x16ee>
ffffffffc0203df6:	00008617          	auipc	a2,0x8
ffffffffc0203dfa:	e3a60613          	addi	a2,a2,-454 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203dfe:	07200593          	li	a1,114
ffffffffc0203e02:	00009517          	auipc	a0,0x9
ffffffffc0203e06:	0ae50513          	addi	a0,a0,174 # ffffffffc020ceb0 <etext+0x16be>
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
ffffffffc0203e44:	0e068693          	addi	a3,a3,224 # ffffffffc020cf20 <etext+0x172e>
ffffffffc0203e48:	00008617          	auipc	a2,0x8
ffffffffc0203e4c:	de860613          	addi	a2,a2,-536 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203e50:	09e00593          	li	a1,158
ffffffffc0203e54:	00009517          	auipc	a0,0x9
ffffffffc0203e58:	05c50513          	addi	a0,a0,92 # ffffffffc020ceb0 <etext+0x16be>
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
ffffffffc0203f10:	02c68693          	addi	a3,a3,44 # ffffffffc020cf38 <etext+0x1746>
ffffffffc0203f14:	00008617          	auipc	a2,0x8
ffffffffc0203f18:	d1c60613          	addi	a2,a2,-740 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203f1c:	0b300593          	li	a1,179
ffffffffc0203f20:	00009517          	auipc	a0,0x9
ffffffffc0203f24:	f9050513          	addi	a0,a0,-112 # ffffffffc020ceb0 <etext+0x16be>
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
ffffffffc0203fa8:	fa468693          	addi	a3,a3,-92 # ffffffffc020cf48 <etext+0x1756>
ffffffffc0203fac:	00008617          	auipc	a2,0x8
ffffffffc0203fb0:	c8460613          	addi	a2,a2,-892 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0203fb4:	0cf00593          	li	a1,207
ffffffffc0203fb8:	00009517          	auipc	a0,0x9
ffffffffc0203fbc:	ef850513          	addi	a0,a0,-264 # ffffffffc020ceb0 <etext+0x16be>
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
ffffffffc020401e:	f4e68693          	addi	a3,a3,-178 # ffffffffc020cf68 <etext+0x1776>
ffffffffc0204022:	00008617          	auipc	a2,0x8
ffffffffc0204026:	c0e60613          	addi	a2,a2,-1010 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020402a:	0e800593          	li	a1,232
ffffffffc020402e:	00009517          	auipc	a0,0x9
ffffffffc0204032:	e8250513          	addi	a0,a0,-382 # ffffffffc020ceb0 <etext+0x16be>
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
ffffffffc020418c:	f5050513          	addi	a0,a0,-176 # ffffffffc020d0d8 <etext+0x18e6>
ffffffffc0204190:	816fc0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0204194:	7402                	ld	s0,32(sp)
ffffffffc0204196:	70a2                	ld	ra,40(sp)
ffffffffc0204198:	64e2                	ld	s1,24(sp)
ffffffffc020419a:	6942                	ld	s2,16(sp)
ffffffffc020419c:	69a2                	ld	s3,8(sp)
ffffffffc020419e:	6a02                	ld	s4,0(sp)
ffffffffc02041a0:	00009517          	auipc	a0,0x9
ffffffffc02041a4:	f5850513          	addi	a0,a0,-168 # ffffffffc020d0f8 <etext+0x1906>
ffffffffc02041a8:	6145                	addi	sp,sp,48
ffffffffc02041aa:	ffdfb06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02041ae:	00009697          	auipc	a3,0x9
ffffffffc02041b2:	dda68693          	addi	a3,a3,-550 # ffffffffc020cf88 <etext+0x1796>
ffffffffc02041b6:	00008617          	auipc	a2,0x8
ffffffffc02041ba:	a7a60613          	addi	a2,a2,-1414 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02041be:	12c00593          	li	a1,300
ffffffffc02041c2:	00009517          	auipc	a0,0x9
ffffffffc02041c6:	cee50513          	addi	a0,a0,-786 # ffffffffc020ceb0 <etext+0x16be>
ffffffffc02041ca:	a80fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02041ce:	00009697          	auipc	a3,0x9
ffffffffc02041d2:	d6a68693          	addi	a3,a3,-662 # ffffffffc020cf38 <etext+0x1746>
ffffffffc02041d6:	00008617          	auipc	a2,0x8
ffffffffc02041da:	a5a60613          	addi	a2,a2,-1446 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02041de:	12400593          	li	a1,292
ffffffffc02041e2:	00009517          	auipc	a0,0x9
ffffffffc02041e6:	cce50513          	addi	a0,a0,-818 # ffffffffc020ceb0 <etext+0x16be>
ffffffffc02041ea:	a60fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02041ee:	00009697          	auipc	a3,0x9
ffffffffc02041f2:	d9a68693          	addi	a3,a3,-614 # ffffffffc020cf88 <etext+0x1796>
ffffffffc02041f6:	00008617          	auipc	a2,0x8
ffffffffc02041fa:	a3a60613          	addi	a2,a2,-1478 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02041fe:	13300593          	li	a1,307
ffffffffc0204202:	00009517          	auipc	a0,0x9
ffffffffc0204206:	cae50513          	addi	a0,a0,-850 # ffffffffc020ceb0 <etext+0x16be>
ffffffffc020420a:	a40fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020420e:	00009697          	auipc	a3,0x9
ffffffffc0204212:	da268693          	addi	a3,a3,-606 # ffffffffc020cfb0 <etext+0x17be>
ffffffffc0204216:	00008617          	auipc	a2,0x8
ffffffffc020421a:	a1a60613          	addi	a2,a2,-1510 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020421e:	13d00593          	li	a1,317
ffffffffc0204222:	00009517          	auipc	a0,0x9
ffffffffc0204226:	c8e50513          	addi	a0,a0,-882 # ffffffffc020ceb0 <etext+0x16be>
ffffffffc020422a:	a20fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020422e:	00009697          	auipc	a3,0x9
ffffffffc0204232:	e3a68693          	addi	a3,a3,-454 # ffffffffc020d068 <etext+0x1876>
ffffffffc0204236:	00008617          	auipc	a2,0x8
ffffffffc020423a:	9fa60613          	addi	a2,a2,-1542 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020423e:	14f00593          	li	a1,335
ffffffffc0204242:	00009517          	auipc	a0,0x9
ffffffffc0204246:	c6e50513          	addi	a0,a0,-914 # ffffffffc020ceb0 <etext+0x16be>
ffffffffc020424a:	a00fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020424e:	00009697          	auipc	a3,0x9
ffffffffc0204252:	dea68693          	addi	a3,a3,-534 # ffffffffc020d038 <etext+0x1846>
ffffffffc0204256:	00008617          	auipc	a2,0x8
ffffffffc020425a:	9da60613          	addi	a2,a2,-1574 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020425e:	14e00593          	li	a1,334
ffffffffc0204262:	00009517          	auipc	a0,0x9
ffffffffc0204266:	c4e50513          	addi	a0,a0,-946 # ffffffffc020ceb0 <etext+0x16be>
ffffffffc020426a:	9e0fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020426e:	00009697          	auipc	a3,0x9
ffffffffc0204272:	dba68693          	addi	a3,a3,-582 # ffffffffc020d028 <etext+0x1836>
ffffffffc0204276:	00008617          	auipc	a2,0x8
ffffffffc020427a:	9ba60613          	addi	a2,a2,-1606 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020427e:	14c00593          	li	a1,332
ffffffffc0204282:	00009517          	auipc	a0,0x9
ffffffffc0204286:	c2e50513          	addi	a0,a0,-978 # ffffffffc020ceb0 <etext+0x16be>
ffffffffc020428a:	9c0fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020428e:	00009697          	auipc	a3,0x9
ffffffffc0204292:	d8a68693          	addi	a3,a3,-630 # ffffffffc020d018 <etext+0x1826>
ffffffffc0204296:	00008617          	auipc	a2,0x8
ffffffffc020429a:	99a60613          	addi	a2,a2,-1638 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020429e:	14a00593          	li	a1,330
ffffffffc02042a2:	00009517          	auipc	a0,0x9
ffffffffc02042a6:	c0e50513          	addi	a0,a0,-1010 # ffffffffc020ceb0 <etext+0x16be>
ffffffffc02042aa:	9a0fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02042ae:	00009697          	auipc	a3,0x9
ffffffffc02042b2:	d5a68693          	addi	a3,a3,-678 # ffffffffc020d008 <etext+0x1816>
ffffffffc02042b6:	00008617          	auipc	a2,0x8
ffffffffc02042ba:	97a60613          	addi	a2,a2,-1670 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02042be:	14800593          	li	a1,328
ffffffffc02042c2:	00009517          	auipc	a0,0x9
ffffffffc02042c6:	bee50513          	addi	a0,a0,-1042 # ffffffffc020ceb0 <etext+0x16be>
ffffffffc02042ca:	980fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02042ce:	00009697          	auipc	a3,0x9
ffffffffc02042d2:	cca68693          	addi	a3,a3,-822 # ffffffffc020cf98 <etext+0x17a6>
ffffffffc02042d6:	00008617          	auipc	a2,0x8
ffffffffc02042da:	95a60613          	addi	a2,a2,-1702 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02042de:	13b00593          	li	a1,315
ffffffffc02042e2:	00009517          	auipc	a0,0x9
ffffffffc02042e6:	bce50513          	addi	a0,a0,-1074 # ffffffffc020ceb0 <etext+0x16be>
ffffffffc02042ea:	960fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02042ee:	00009697          	auipc	a3,0x9
ffffffffc02042f2:	d0a68693          	addi	a3,a3,-758 # ffffffffc020cff8 <etext+0x1806>
ffffffffc02042f6:	00008617          	auipc	a2,0x8
ffffffffc02042fa:	93a60613          	addi	a2,a2,-1734 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02042fe:	14600593          	li	a1,326
ffffffffc0204302:	00009517          	auipc	a0,0x9
ffffffffc0204306:	bae50513          	addi	a0,a0,-1106 # ffffffffc020ceb0 <etext+0x16be>
ffffffffc020430a:	940fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020430e:	00009697          	auipc	a3,0x9
ffffffffc0204312:	cda68693          	addi	a3,a3,-806 # ffffffffc020cfe8 <etext+0x17f6>
ffffffffc0204316:	00008617          	auipc	a2,0x8
ffffffffc020431a:	91a60613          	addi	a2,a2,-1766 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020431e:	14400593          	li	a1,324
ffffffffc0204322:	00009517          	auipc	a0,0x9
ffffffffc0204326:	b8e50513          	addi	a0,a0,-1138 # ffffffffc020ceb0 <etext+0x16be>
ffffffffc020432a:	920fc0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020432e:	6914                	ld	a3,16(a0)
ffffffffc0204330:	6510                	ld	a2,8(a0)
ffffffffc0204332:	0004859b          	sext.w	a1,s1
ffffffffc0204336:	00009517          	auipc	a0,0x9
ffffffffc020433a:	d6250513          	addi	a0,a0,-670 # ffffffffc020d098 <etext+0x18a6>
ffffffffc020433e:	e69fb0ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0204342:	00009697          	auipc	a3,0x9
ffffffffc0204346:	d7e68693          	addi	a3,a3,-642 # ffffffffc020d0c0 <etext+0x18ce>
ffffffffc020434a:	00008617          	auipc	a2,0x8
ffffffffc020434e:	8e660613          	addi	a2,a2,-1818 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0204352:	15900593          	li	a1,345
ffffffffc0204356:	00009517          	auipc	a0,0x9
ffffffffc020435a:	b5a50513          	addi	a0,a0,-1190 # ffffffffc020ceb0 <etext+0x16be>
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
ffffffffc020442a:	3b0070ef          	jal	ffffffffc020b7da <memcpy>
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
ffffffffc0204460:	37a070ef          	jal	ffffffffc020b7da <memcpy>
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
ffffffffc020449e:	250070ef          	jal	ffffffffc020b6ee <strnlen>
ffffffffc02044a2:	87aa                	mv	a5,a0
ffffffffc02044a4:	8622                	mv	a2,s0
ffffffffc02044a6:	85a6                	mv	a1,s1
ffffffffc02044a8:	8556                	mv	a0,s5
ffffffffc02044aa:	0487e663          	bltu	a5,s0,ffffffffc02044f6 <copy_string+0x82>
ffffffffc02044ae:	032a7863          	bgeu	s4,s2,ffffffffc02044de <copy_string+0x6a>
ffffffffc02044b2:	328070ef          	jal	ffffffffc020b7da <memcpy>
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
ffffffffc02044fa:	2e0070ef          	jal	ffffffffc020b7da <memcpy>
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
ffffffffc0204532:	79f020ef          	jal	ffffffffc02074d0 <schedule>
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
ffffffffc020461e:	af668693          	addi	a3,a3,-1290 # ffffffffc020d110 <etext+0x191e>
ffffffffc0204622:	00007617          	auipc	a2,0x7
ffffffffc0204626:	60e60613          	addi	a2,a2,1550 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020462a:	45e5                	li	a1,25
ffffffffc020462c:	00009517          	auipc	a0,0x9
ffffffffc0204630:	b0c50513          	addi	a0,a0,-1268 # ffffffffc020d138 <etext+0x1946>
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
ffffffffc0204656:	af668693          	addi	a3,a3,-1290 # ffffffffc020d148 <etext+0x1956>
ffffffffc020465a:	00007617          	auipc	a2,0x7
ffffffffc020465e:	5d660613          	addi	a2,a2,1494 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0204662:	04000593          	li	a1,64
ffffffffc0204666:	00009517          	auipc	a0,0x9
ffffffffc020466a:	ad250513          	addi	a0,a0,-1326 # ffffffffc020d138 <etext+0x1946>
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
ffffffffc020469a:	b1268693          	addi	a3,a3,-1262 # ffffffffc020d1a8 <etext+0x19b6>
ffffffffc020469e:	00007617          	auipc	a2,0x7
ffffffffc02046a2:	59260613          	addi	a2,a2,1426 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02046a6:	45f1                	li	a1,28
ffffffffc02046a8:	00009517          	auipc	a0,0x9
ffffffffc02046ac:	ae850513          	addi	a0,a0,-1304 # ffffffffc020d190 <etext+0x199e>
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
ffffffffc02046e6:	4f30206f          	j	ffffffffc02073d8 <wakeup_proc>
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
ffffffffc0204708:	4d10206f          	j	ffffffffc02073d8 <wakeup_proc>
ffffffffc020470c:	1141                	addi	sp,sp,-16
ffffffffc020470e:	00009697          	auipc	a3,0x9
ffffffffc0204712:	a9a68693          	addi	a3,a3,-1382 # ffffffffc020d1a8 <etext+0x19b6>
ffffffffc0204716:	00007617          	auipc	a2,0x7
ffffffffc020471a:	51a60613          	addi	a2,a2,1306 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020471e:	45f1                	li	a1,28
ffffffffc0204720:	00009517          	auipc	a0,0x9
ffffffffc0204724:	a7050513          	addi	a0,a0,-1424 # ffffffffc020d190 <etext+0x199e>
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
ffffffffc020474e:	48b020ef          	jal	ffffffffc02073d8 <wakeup_proc>
ffffffffc0204752:	701c                	ld	a5,32(s0)
ffffffffc0204754:	01840713          	addi	a4,s0,24
ffffffffc0204758:	02e78463          	beq	a5,a4,ffffffffc0204780 <wakeup_queue+0x52>
ffffffffc020475c:	6818                	ld	a4,16(s0)
ffffffffc020475e:	02e49163          	bne	s1,a4,ffffffffc0204780 <wakeup_queue+0x52>
ffffffffc0204762:	06f48863          	beq	s1,a5,ffffffffc02047d2 <wakeup_queue+0xa4>
ffffffffc0204766:	fe87b503          	ld	a0,-24(a5)
ffffffffc020476a:	ff27a823          	sw	s2,-16(a5)
ffffffffc020476e:	fe878413          	addi	s0,a5,-24
ffffffffc0204772:	467020ef          	jal	ffffffffc02073d8 <wakeup_proc>
ffffffffc0204776:	701c                	ld	a5,32(s0)
ffffffffc0204778:	01840713          	addi	a4,s0,24
ffffffffc020477c:	fee790e3          	bne	a5,a4,ffffffffc020475c <wakeup_queue+0x2e>
ffffffffc0204780:	00009697          	auipc	a3,0x9
ffffffffc0204784:	a2868693          	addi	a3,a3,-1496 # ffffffffc020d1a8 <etext+0x19b6>
ffffffffc0204788:	00007617          	auipc	a2,0x7
ffffffffc020478c:	4a860613          	addi	a2,a2,1192 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0204790:	02200593          	li	a1,34
ffffffffc0204794:	00009517          	auipc	a0,0x9
ffffffffc0204798:	9fc50513          	addi	a0,a0,-1540 # ffffffffc020d190 <etext+0x199e>
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
ffffffffc02047c8:	411020ef          	jal	ffffffffc02073d8 <wakeup_proc>
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
ffffffffc02047e4:	9c868693          	addi	a3,a3,-1592 # ffffffffc020d1a8 <etext+0x19b6>
ffffffffc02047e8:	00007617          	auipc	a2,0x7
ffffffffc02047ec:	44860613          	addi	a2,a2,1096 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02047f0:	45f1                	li	a1,28
ffffffffc02047f2:	00009517          	auipc	a0,0x9
ffffffffc02047f6:	99e50513          	addi	a0,a0,-1634 # ffffffffc020d190 <etext+0x199e>
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
ffffffffc0204832:	9ba68693          	addi	a3,a3,-1606 # ffffffffc020d1e8 <etext+0x19f6>
ffffffffc0204836:	00007617          	auipc	a2,0x7
ffffffffc020483a:	3fa60613          	addi	a2,a2,1018 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020483e:	07400593          	li	a1,116
ffffffffc0204842:	00009517          	auipc	a0,0x9
ffffffffc0204846:	94e50513          	addi	a0,a0,-1714 # ffffffffc020d190 <etext+0x199e>
ffffffffc020484a:	e406                	sd	ra,8(sp)
ffffffffc020484c:	bfffb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc0204850 <get_fd_array.part.0>:
ffffffffc0204850:	1141                	addi	sp,sp,-16
ffffffffc0204852:	00009697          	auipc	a3,0x9
ffffffffc0204856:	9a668693          	addi	a3,a3,-1626 # ffffffffc020d1f8 <etext+0x1a06>
ffffffffc020485a:	00007617          	auipc	a2,0x7
ffffffffc020485e:	3d660613          	addi	a2,a2,982 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0204862:	45d1                	li	a1,20
ffffffffc0204864:	00009517          	auipc	a0,0x9
ffffffffc0204868:	9c450513          	addi	a0,a0,-1596 # ffffffffc020d228 <etext+0x1a36>
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
ffffffffc02048e8:	95468693          	addi	a3,a3,-1708 # ffffffffc020d238 <etext+0x1a46>
ffffffffc02048ec:	00007617          	auipc	a2,0x7
ffffffffc02048f0:	34460613          	addi	a2,a2,836 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02048f4:	03b00593          	li	a1,59
ffffffffc02048f8:	00009517          	auipc	a0,0x9
ffffffffc02048fc:	93050513          	addi	a0,a0,-1744 # ffffffffc020d228 <etext+0x1a36>
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
ffffffffc020492e:	1e5030ef          	jal	ffffffffc0208312 <vfs_close>
ffffffffc0204932:	67a2                	ld	a5,8(sp)
ffffffffc0204934:	60e2                	ld	ra,24(sp)
ffffffffc0204936:	0007a023          	sw	zero,0(a5)
ffffffffc020493a:	6105                	addi	sp,sp,32
ffffffffc020493c:	8082                	ret
ffffffffc020493e:	00009697          	auipc	a3,0x9
ffffffffc0204942:	8fa68693          	addi	a3,a3,-1798 # ffffffffc020d238 <etext+0x1a46>
ffffffffc0204946:	00007617          	auipc	a2,0x7
ffffffffc020494a:	2ea60613          	addi	a2,a2,746 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020494e:	04500593          	li	a1,69
ffffffffc0204952:	00009517          	auipc	a0,0x9
ffffffffc0204956:	8d650513          	addi	a0,a0,-1834 # ffffffffc020d228 <etext+0x1a36>
ffffffffc020495a:	af1fb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020495e:	00009697          	auipc	a3,0x9
ffffffffc0204962:	91268693          	addi	a3,a3,-1774 # ffffffffc020d270 <etext+0x1a7e>
ffffffffc0204966:	00007617          	auipc	a2,0x7
ffffffffc020496a:	2ca60613          	addi	a2,a2,714 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020496e:	04400593          	li	a1,68
ffffffffc0204972:	00009517          	auipc	a0,0x9
ffffffffc0204976:	8b650513          	addi	a0,a0,-1866 # ffffffffc020d228 <etext+0x1a36>
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
ffffffffc02049aa:	93a68693          	addi	a3,a3,-1734 # ffffffffc020d2e0 <etext+0x1aee>
ffffffffc02049ae:	00007617          	auipc	a2,0x7
ffffffffc02049b2:	28260613          	addi	a2,a2,642 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02049b6:	05600593          	li	a1,86
ffffffffc02049ba:	00009517          	auipc	a0,0x9
ffffffffc02049be:	86e50513          	addi	a0,a0,-1938 # ffffffffc020d228 <etext+0x1a36>
ffffffffc02049c2:	a89fb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02049c6:	00009697          	auipc	a3,0x9
ffffffffc02049ca:	8e268693          	addi	a3,a3,-1822 # ffffffffc020d2a8 <etext+0x1ab6>
ffffffffc02049ce:	00007617          	auipc	a2,0x7
ffffffffc02049d2:	26260613          	addi	a2,a2,610 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02049d6:	05500593          	li	a1,85
ffffffffc02049da:	00009517          	auipc	a0,0x9
ffffffffc02049de:	84e50513          	addi	a0,a0,-1970 # ffffffffc020d228 <etext+0x1a36>
ffffffffc02049e2:	a69fb0ef          	jal	ffffffffc020044a <__panic>

ffffffffc02049e6 <fd_array_open.part.0>:
ffffffffc02049e6:	1141                	addi	sp,sp,-16
ffffffffc02049e8:	00009697          	auipc	a3,0x9
ffffffffc02049ec:	91068693          	addi	a3,a3,-1776 # ffffffffc020d2f8 <etext+0x1b06>
ffffffffc02049f0:	00007617          	auipc	a2,0x7
ffffffffc02049f4:	24060613          	addi	a2,a2,576 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02049f8:	05f00593          	li	a1,95
ffffffffc02049fc:	00009517          	auipc	a0,0x9
ffffffffc0204a00:	82c50513          	addi	a0,a0,-2004 # ffffffffc020d228 <etext+0x1a36>
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
ffffffffc0204a4e:	0c5030ef          	jal	ffffffffc0208312 <vfs_close>
ffffffffc0204a52:	6722                	ld	a4,8(sp)
ffffffffc0204a54:	60e2                	ld	ra,24(sp)
ffffffffc0204a56:	00072023          	sw	zero,0(a4)
ffffffffc0204a5a:	6105                	addi	sp,sp,32
ffffffffc0204a5c:	8082                	ret
ffffffffc0204a5e:	00009697          	auipc	a3,0x9
ffffffffc0204a62:	88268693          	addi	a3,a3,-1918 # ffffffffc020d2e0 <etext+0x1aee>
ffffffffc0204a66:	00007617          	auipc	a2,0x7
ffffffffc0204a6a:	1ca60613          	addi	a2,a2,458 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0204a6e:	06800593          	li	a1,104
ffffffffc0204a72:	00008517          	auipc	a0,0x8
ffffffffc0204a76:	7b650513          	addi	a0,a0,1974 # ffffffffc020d228 <etext+0x1a36>
ffffffffc0204a7a:	9d1fb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0204a7e:	00008697          	auipc	a3,0x8
ffffffffc0204a82:	7d268693          	addi	a3,a3,2002 # ffffffffc020d250 <etext+0x1a5e>
ffffffffc0204a86:	00007617          	auipc	a2,0x7
ffffffffc0204a8a:	1aa60613          	addi	a2,a2,426 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0204a8e:	06700593          	li	a1,103
ffffffffc0204a92:	00008517          	auipc	a0,0x8
ffffffffc0204a96:	79650513          	addi	a0,a0,1942 # ffffffffc020d228 <etext+0x1a36>
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
ffffffffc0204acc:	75b020ef          	jal	ffffffffc0207a26 <inode_ref_inc>
ffffffffc0204ad0:	8526                	mv	a0,s1
ffffffffc0204ad2:	75f020ef          	jal	ffffffffc0207a30 <inode_open_inc>
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
ffffffffc0204af6:	00009697          	auipc	a3,0x9
ffffffffc0204afa:	83268693          	addi	a3,a3,-1998 # ffffffffc020d328 <etext+0x1b36>
ffffffffc0204afe:	00007617          	auipc	a2,0x7
ffffffffc0204b02:	13260613          	addi	a2,a2,306 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0204b06:	07300593          	li	a1,115
ffffffffc0204b0a:	00008517          	auipc	a0,0x8
ffffffffc0204b0e:	71e50513          	addi	a0,a0,1822 # ffffffffc020d228 <etext+0x1a36>
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
ffffffffc0204b7e:	38670713          	addi	a4,a4,902 # ffffffffc020ef00 <CSWTCH.79>
ffffffffc0204b82:	0000a697          	auipc	a3,0xa
ffffffffc0204b86:	39668693          	addi	a3,a3,918 # ffffffffc020ef18 <CSWTCH.78>
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
ffffffffc0204bcc:	570030ef          	jal	ffffffffc020813c <vfs_open>
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
ffffffffc0204bee:	7c658593          	addi	a1,a1,1990 # ffffffffc020d3b0 <etext+0x1bbe>
ffffffffc0204bf2:	e43a                	sd	a4,8(sp)
ffffffffc0204bf4:	e02a                	sd	a0,0(sp)
ffffffffc0204bf6:	645020ef          	jal	ffffffffc0207a3a <inode_check>
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
ffffffffc0204c44:	6ce030ef          	jal	ffffffffc0208312 <vfs_close>
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
ffffffffc0204c6c:	6f868693          	addi	a3,a3,1784 # ffffffffc020d360 <etext+0x1b6e>
ffffffffc0204c70:	00007617          	auipc	a2,0x7
ffffffffc0204c74:	fc060613          	addi	a2,a2,-64 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0204c78:	0b500593          	li	a1,181
ffffffffc0204c7c:	00008517          	auipc	a0,0x8
ffffffffc0204c80:	5ac50513          	addi	a0,a0,1452 # ffffffffc020d228 <etext+0x1a36>
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
ffffffffc0204d4e:	6be58593          	addi	a1,a1,1726 # ffffffffc020d408 <etext+0x1c16>
ffffffffc0204d52:	e42a                	sd	a0,8(sp)
ffffffffc0204d54:	4e7020ef          	jal	ffffffffc0207a3a <inode_check>
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
ffffffffc0204dae:	60e68693          	addi	a3,a3,1550 # ffffffffc020d3b8 <etext+0x1bc6>
ffffffffc0204db2:	00007617          	auipc	a2,0x7
ffffffffc0204db6:	e7e60613          	addi	a2,a2,-386 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0204dba:	0de00593          	li	a1,222
ffffffffc0204dbe:	00008517          	auipc	a0,0x8
ffffffffc0204dc2:	46a50513          	addi	a0,a0,1130 # ffffffffc020d228 <etext+0x1a36>
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
ffffffffc0204e3c:	62858593          	addi	a1,a1,1576 # ffffffffc020d460 <etext+0x1c6e>
ffffffffc0204e40:	e42a                	sd	a0,8(sp)
ffffffffc0204e42:	3f9020ef          	jal	ffffffffc0207a3a <inode_check>
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
ffffffffc0204e9c:	57868693          	addi	a3,a3,1400 # ffffffffc020d410 <etext+0x1c1e>
ffffffffc0204ea0:	00007617          	auipc	a2,0x7
ffffffffc0204ea4:	d9060613          	addi	a2,a2,-624 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0204ea8:	0f800593          	li	a1,248
ffffffffc0204eac:	00008517          	auipc	a0,0x8
ffffffffc0204eb0:	37c50513          	addi	a0,a0,892 # ffffffffc020d228 <etext+0x1a36>
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
ffffffffc0204f24:	59858593          	addi	a1,a1,1432 # ffffffffc020d4b8 <etext+0x1cc6>
ffffffffc0204f28:	313020ef          	jal	ffffffffc0207a3a <inode_check>
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
ffffffffc0204f64:	45058593          	addi	a1,a1,1104 # ffffffffc020d3b0 <etext+0x1bbe>
ffffffffc0204f68:	2d3020ef          	jal	ffffffffc0207a3a <inode_check>
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
ffffffffc0204fa4:	4c868693          	addi	a3,a3,1224 # ffffffffc020d468 <etext+0x1c76>
ffffffffc0204fa8:	00007617          	auipc	a2,0x7
ffffffffc0204fac:	c8860613          	addi	a2,a2,-888 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0204fb0:	11a00593          	li	a1,282
ffffffffc0204fb4:	00008517          	auipc	a0,0x8
ffffffffc0204fb8:	27450513          	addi	a0,a0,628 # ffffffffc020d228 <etext+0x1a36>
ffffffffc0204fbc:	c8efb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0204fc0:	00008697          	auipc	a3,0x8
ffffffffc0204fc4:	3a068693          	addi	a3,a3,928 # ffffffffc020d360 <etext+0x1b6e>
ffffffffc0204fc8:	00007617          	auipc	a2,0x7
ffffffffc0204fcc:	c6860613          	addi	a2,a2,-920 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0204fd0:	11200593          	li	a1,274
ffffffffc0204fd4:	00008517          	auipc	a0,0x8
ffffffffc0204fd8:	25450513          	addi	a0,a0,596 # ffffffffc020d228 <etext+0x1a36>
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
ffffffffc0205036:	37e58593          	addi	a1,a1,894 # ffffffffc020d3b0 <etext+0x1bbe>
ffffffffc020503a:	e42a                	sd	a0,8(sp)
ffffffffc020503c:	1ff020ef          	jal	ffffffffc0207a3a <inode_check>
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
ffffffffc0205078:	2ec68693          	addi	a3,a3,748 # ffffffffc020d360 <etext+0x1b6e>
ffffffffc020507c:	00007617          	auipc	a2,0x7
ffffffffc0205080:	bb460613          	addi	a2,a2,-1100 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0205084:	12c00593          	li	a1,300
ffffffffc0205088:	00008517          	auipc	a0,0x8
ffffffffc020508c:	1a050513          	addi	a0,a0,416 # ffffffffc020d228 <etext+0x1a36>
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
ffffffffc02050ea:	42a58593          	addi	a1,a1,1066 # ffffffffc020d510 <etext+0x1d1e>
ffffffffc02050ee:	e42a                	sd	a0,8(sp)
ffffffffc02050f0:	14b020ef          	jal	ffffffffc0207a3a <inode_check>
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
ffffffffc0205122:	3a268693          	addi	a3,a3,930 # ffffffffc020d4c0 <etext+0x1cce>
ffffffffc0205126:	00007617          	auipc	a2,0x7
ffffffffc020512a:	b0a60613          	addi	a2,a2,-1270 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020512e:	13a00593          	li	a1,314
ffffffffc0205132:	00008517          	auipc	a0,0x8
ffffffffc0205136:	0f650513          	addi	a0,a0,246 # ffffffffc020d228 <etext+0x1a36>
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
ffffffffc02051b4:	3c058593          	addi	a1,a1,960 # ffffffffc020d570 <etext+0x1d7e>
ffffffffc02051b8:	083020ef          	jal	ffffffffc0207a3a <inode_check>
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
ffffffffc020520e:	30e68693          	addi	a3,a3,782 # ffffffffc020d518 <etext+0x1d26>
ffffffffc0205212:	00007617          	auipc	a2,0x7
ffffffffc0205216:	a1e60613          	addi	a2,a2,-1506 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020521a:	14a00593          	li	a1,330
ffffffffc020521e:	00008517          	auipc	a0,0x8
ffffffffc0205222:	00a50513          	addi	a0,a0,10 # ffffffffc020d228 <etext+0x1a36>
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
ffffffffc02052a4:	1a1020ef          	jal	ffffffffc0207c44 <vfs_init>
ffffffffc02052a8:	6ae030ef          	jal	ffffffffc0208956 <dev_init>
ffffffffc02052ac:	60a2                	ld	ra,8(sp)
ffffffffc02052ae:	0141                	addi	sp,sp,16
ffffffffc02052b0:	0220406f          	j	ffffffffc02092d2 <sfs_init>

ffffffffc02052b4 <fs_cleanup>:
ffffffffc02052b4:	40d0206f          	j	ffffffffc0207ec0 <vfs_cleanup>

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
ffffffffc0205312:	7e2020ef          	jal	ffffffffc0207af4 <inode_ref_dec>
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
ffffffffc0205354:	27068693          	addi	a3,a3,624 # ffffffffc020d5c0 <etext+0x1dce>
ffffffffc0205358:	00007617          	auipc	a2,0x7
ffffffffc020535c:	8d860613          	addi	a2,a2,-1832 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0205360:	03d00593          	li	a1,61
ffffffffc0205364:	00008517          	auipc	a0,0x8
ffffffffc0205368:	24c50513          	addi	a0,a0,588 # ffffffffc020d5b0 <etext+0x1dbe>
ffffffffc020536c:	8defb0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0205370:	00008697          	auipc	a3,0x8
ffffffffc0205374:	21068693          	addi	a3,a3,528 # ffffffffc020d580 <etext+0x1d8e>
ffffffffc0205378:	00007617          	auipc	a2,0x7
ffffffffc020537c:	8b860613          	addi	a2,a2,-1864 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0205380:	03300593          	li	a1,51
ffffffffc0205384:	00008517          	auipc	a0,0x8
ffffffffc0205388:	22c50513          	addi	a0,a0,556 # ffffffffc020d5b0 <etext+0x1dbe>
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
ffffffffc02053e0:	e1c68693          	addi	a3,a3,-484 # ffffffffc020d1f8 <etext+0x1a06>
ffffffffc02053e4:	00007617          	auipc	a2,0x7
ffffffffc02053e8:	84c60613          	addi	a2,a2,-1972 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02053ec:	04500593          	li	a1,69
ffffffffc02053f0:	00008517          	auipc	a0,0x8
ffffffffc02053f4:	1c050513          	addi	a0,a0,448 # ffffffffc020d5b0 <etext+0x1dbe>
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
ffffffffc0205422:	604020ef          	jal	ffffffffc0207a26 <inode_ref_inc>
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
ffffffffc0205478:	ad468693          	addi	a3,a3,-1324 # ffffffffc020cf48 <etext+0x1756>
ffffffffc020547c:	00006617          	auipc	a2,0x6
ffffffffc0205480:	7b460613          	addi	a2,a2,1972 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0205484:	05300593          	li	a1,83
ffffffffc0205488:	00008517          	auipc	a0,0x8
ffffffffc020548c:	12850513          	addi	a0,a0,296 # ffffffffc020d5b0 <etext+0x1dbe>
ffffffffc0205490:	fbbfa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0205494:	00008697          	auipc	a3,0x8
ffffffffc0205498:	14468693          	addi	a3,a3,324 # ffffffffc020d5d8 <etext+0x1de6>
ffffffffc020549c:	00006617          	auipc	a2,0x6
ffffffffc02054a0:	79460613          	addi	a2,a2,1940 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02054a4:	05400593          	li	a1,84
ffffffffc02054a8:	00008517          	auipc	a0,0x8
ffffffffc02054ac:	10850513          	addi	a0,a0,264 # ffffffffc020d5b0 <etext+0x1dbe>
ffffffffc02054b0:	f9bfa0ef          	jal	ffffffffc020044a <__panic>

ffffffffc02054b4 <iobuf_skip.part.0>:
ffffffffc02054b4:	1141                	addi	sp,sp,-16
ffffffffc02054b6:	00008697          	auipc	a3,0x8
ffffffffc02054ba:	15268693          	addi	a3,a3,338 # ffffffffc020d608 <etext+0x1e16>
ffffffffc02054be:	00006617          	auipc	a2,0x6
ffffffffc02054c2:	77260613          	addi	a2,a2,1906 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02054c6:	04a00593          	li	a1,74
ffffffffc02054ca:	00008517          	auipc	a0,0x8
ffffffffc02054ce:	15650513          	addi	a0,a0,342 # ffffffffc020d620 <etext+0x1e2e>
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
ffffffffc0205504:	298060ef          	jal	ffffffffc020b79c <memmove>
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
ffffffffc0205788:	eac68693          	addi	a3,a3,-340 # ffffffffc020d630 <etext+0x1e3e>
ffffffffc020578c:	00006617          	auipc	a2,0x6
ffffffffc0205790:	4a460613          	addi	a2,a2,1188 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0205794:	05500593          	li	a1,85
ffffffffc0205798:	00008517          	auipc	a0,0x8
ffffffffc020579c:	ea850513          	addi	a0,a0,-344 # ffffffffc020d640 <etext+0x1e4e>
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
ffffffffc02058ba:	d7a68693          	addi	a3,a3,-646 # ffffffffc020d630 <etext+0x1e3e>
ffffffffc02058be:	00006617          	auipc	a2,0x6
ffffffffc02058c2:	37260613          	addi	a2,a2,882 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02058c6:	08a00593          	li	a1,138
ffffffffc02058ca:	00008517          	auipc	a0,0x8
ffffffffc02058ce:	d7650513          	addi	a0,a0,-650 # ffffffffc020d640 <etext+0x1e4e>
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
ffffffffc02059e4:	429020ef          	jal	ffffffffc020860c <vfs_getcwd>
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
ffffffffc0205a04:	409020ef          	jal	ffffffffc020860c <vfs_getcwd>
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
ffffffffc0205b44:	447050ef          	jal	ffffffffc020b78a <memset>
ffffffffc0205b48:	00091797          	auipc	a5,0x91
ffffffffc0205b4c:	d507b783          	ld	a5,-688(a5) # ffffffffc0296898 <boot_pgdir_pa>
ffffffffc0205b50:	0a043023          	sd	zero,160(s0)
ffffffffc0205b54:	0a042823          	sw	zero,176(s0)
ffffffffc0205b58:	f45c                	sd	a5,168(s0)
ffffffffc0205b5a:	0b440513          	addi	a0,s0,180
ffffffffc0205b5e:	463d                	li	a2,15
ffffffffc0205b60:	4581                	li	a1,0
ffffffffc0205b62:	429050ef          	jal	ffffffffc020b78a <memset>
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
ffffffffc0205be0:	ef473703          	ld	a4,-268(a4) # ffffffffc020fad0 <nbase>
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
ffffffffc0205c02:	b5260613          	addi	a2,a2,-1198 # ffffffffc020c750 <etext+0xf5e>
ffffffffc0205c06:	07700593          	li	a1,119
ffffffffc0205c0a:	00007517          	auipc	a0,0x7
ffffffffc0205c0e:	ac650513          	addi	a0,a0,-1338 # ffffffffc020c6d0 <etext+0xede>
ffffffffc0205c12:	839fa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0205c16:	00007617          	auipc	a2,0x7
ffffffffc0205c1a:	b6260613          	addi	a2,a2,-1182 # ffffffffc020c778 <etext+0xf86>
ffffffffc0205c1e:	06900593          	li	a1,105
ffffffffc0205c22:	00007517          	auipc	a0,0x7
ffffffffc0205c26:	aae50513          	addi	a0,a0,-1362 # ffffffffc020c6d0 <etext+0xede>
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
ffffffffc0205c4a:	e8a7b783          	ld	a5,-374(a5) # ffffffffc020fad0 <nbase>
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
ffffffffc0205c84:	357050ef          	jal	ffffffffc020b7da <memcpy>
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
ffffffffc0205c9e:	a0e60613          	addi	a2,a2,-1522 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc0205ca2:	07100593          	li	a1,113
ffffffffc0205ca6:	00007517          	auipc	a0,0x7
ffffffffc0205caa:	a2a50513          	addi	a0,a0,-1494 # ffffffffc020c6d0 <etext+0xede>
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
ffffffffc0205cf2:	542010ef          	jal	ffffffffc0207234 <switch_to>
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
ffffffffc0205d7e:	d564b483          	ld	s1,-682(s1) # ffffffffc020fad0 <nbase>
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
ffffffffc0205ed6:	378050ef          	jal	ffffffffc020b24e <hash32>
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
ffffffffc0205f38:	4a0010ef          	jal	ffffffffc02073d8 <wakeup_proc>
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
ffffffffc0206094:	61860613          	addi	a2,a2,1560 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc0206098:	07100593          	li	a1,113
ffffffffc020609c:	00006517          	auipc	a0,0x6
ffffffffc02060a0:	63450513          	addi	a0,a0,1588 # ffffffffc020c6d0 <etext+0xede>
ffffffffc02060a4:	e0da                	sd	s6,64(sp)
ffffffffc02060a6:	fc5e                	sd	s7,56(sp)
ffffffffc02060a8:	ec6e                	sd	s11,24(sp)
ffffffffc02060aa:	ba0fa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02060ae:	00006617          	auipc	a2,0x6
ffffffffc02060b2:	6ca60613          	addi	a2,a2,1738 # ffffffffc020c778 <etext+0xf86>
ffffffffc02060b6:	06900593          	li	a1,105
ffffffffc02060ba:	00006517          	auipc	a0,0x6
ffffffffc02060be:	61650513          	addi	a0,a0,1558 # ffffffffc020c6d0 <etext+0xede>
ffffffffc02060c2:	e0da                	sd	s6,64(sp)
ffffffffc02060c4:	fc5e                	sd	s7,56(sp)
ffffffffc02060c6:	ec6e                	sd	s11,24(sp)
ffffffffc02060c8:	b82fa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02060cc:	00006617          	auipc	a2,0x6
ffffffffc02060d0:	68460613          	addi	a2,a2,1668 # ffffffffc020c750 <etext+0xf5e>
ffffffffc02060d4:	07700593          	li	a1,119
ffffffffc02060d8:	00006517          	auipc	a0,0x6
ffffffffc02060dc:	5f850513          	addi	a0,a0,1528 # ffffffffc020c6d0 <etext+0xede>
ffffffffc02060e0:	e0da                	sd	s6,64(sp)
ffffffffc02060e2:	fc5e                	sd	s7,56(sp)
ffffffffc02060e4:	ec6e                	sd	s11,24(sp)
ffffffffc02060e6:	b64fa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02060ea:	00007697          	auipc	a3,0x7
ffffffffc02060ee:	58668693          	addi	a3,a3,1414 # ffffffffc020d670 <etext+0x1e7e>
ffffffffc02060f2:	00006617          	auipc	a2,0x6
ffffffffc02060f6:	b3e60613          	addi	a2,a2,-1218 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02060fa:	1d600593          	li	a1,470
ffffffffc02060fe:	00007517          	auipc	a0,0x7
ffffffffc0206102:	55a50513          	addi	a0,a0,1370 # ffffffffc020d658 <etext+0x1e66>
ffffffffc0206106:	e0da                	sd	s6,64(sp)
ffffffffc0206108:	fc5e                	sd	s7,56(sp)
ffffffffc020610a:	ec6e                	sd	s11,24(sp)
ffffffffc020610c:	b3efa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206110:	86be                	mv	a3,a5
ffffffffc0206112:	00006617          	auipc	a2,0x6
ffffffffc0206116:	63e60613          	addi	a2,a2,1598 # ffffffffc020c750 <etext+0xf5e>
ffffffffc020611a:	1b600593          	li	a1,438
ffffffffc020611e:	00007517          	auipc	a0,0x7
ffffffffc0206122:	53a50513          	addi	a0,a0,1338 # ffffffffc020d658 <etext+0x1e66>
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
ffffffffc0206148:	642050ef          	jal	ffffffffc020b78a <memset>
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
ffffffffc020624a:	18e010ef          	jal	ffffffffc02073d8 <wakeup_proc>
ffffffffc020624e:	800005b7          	lui	a1,0x80000
ffffffffc0206252:	0585                	addi	a1,a1,1 # ffffffff80000001 <_binary_bin_sfs_img_size+0xffffffff7ff8ad01>
ffffffffc0206254:	460d                	li	a2,3
ffffffffc0206256:	b7d9                	j	ffffffffc020621c <do_exit+0x9c>
ffffffffc0206258:	02091263          	bnez	s2,ffffffffc020627c <do_exit+0xfc>
ffffffffc020625c:	274010ef          	jal	ffffffffc02074d0 <schedule>
ffffffffc0206260:	601c                	ld	a5,0(s0)
ffffffffc0206262:	00007617          	auipc	a2,0x7
ffffffffc0206266:	44660613          	addi	a2,a2,1094 # ffffffffc020d6a8 <etext+0x1eb6>
ffffffffc020626a:	2ad00593          	li	a1,685
ffffffffc020626e:	43d4                	lw	a3,4(a5)
ffffffffc0206270:	00007517          	auipc	a0,0x7
ffffffffc0206274:	3e850513          	addi	a0,a0,1000 # ffffffffc020d658 <etext+0x1e66>
ffffffffc0206278:	9d2fa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc020627c:	957fa0ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0206280:	bff1                	j	ffffffffc020625c <do_exit+0xdc>
ffffffffc0206282:	878ff0ef          	jal	ffffffffc02052fa <files_destroy>
ffffffffc0206286:	bfb9                	j	ffffffffc02061e4 <do_exit+0x64>
ffffffffc0206288:	00007617          	auipc	a2,0x7
ffffffffc020628c:	40060613          	addi	a2,a2,1024 # ffffffffc020d688 <etext+0x1e96>
ffffffffc0206290:	27800593          	li	a1,632
ffffffffc0206294:	00007517          	auipc	a0,0x7
ffffffffc0206298:	3c450513          	addi	a0,a0,964 # ffffffffc020d658 <etext+0x1e66>
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
ffffffffc02062be:	3de60613          	addi	a2,a2,990 # ffffffffc020d698 <etext+0x1ea6>
ffffffffc02062c2:	27c00593          	li	a1,636
ffffffffc02062c6:	00007517          	auipc	a0,0x7
ffffffffc02062ca:	39250513          	addi	a0,a0,914 # ffffffffc020d658 <etext+0x1e66>
ffffffffc02062ce:	97cfa0ef          	jal	ffffffffc020044a <__panic>
ffffffffc02062d2:	907fa0ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02062d6:	4905                	li	s2,1
ffffffffc02062d8:	b70d                	j	ffffffffc02061fa <do_exit+0x7a>
ffffffffc02062da:	0fe010ef          	jal	ffffffffc02073d8 <wakeup_proc>
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
ffffffffc02063be:	7167b783          	ld	a5,1814(a5) # ffffffffc020fad0 <nbase>
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
ffffffffc0206418:	0b8010ef          	jal	ffffffffc02074d0 <schedule>
ffffffffc020641c:	0009b783          	ld	a5,0(s3)
ffffffffc0206420:	0b07a783          	lw	a5,176(a5)
ffffffffc0206424:	8b85                	andi	a5,a5,1
ffffffffc0206426:	e7b9                	bnez	a5,ffffffffc0206474 <do_wait.part.0+0x194>
ffffffffc0206428:	ee0487e3          	beqz	s1,ffffffffc0206316 <do_wait.part.0+0x36>
ffffffffc020642c:	45a9                	li	a1,10
ffffffffc020642e:	8526                	mv	a0,s1
ffffffffc0206430:	61f040ef          	jal	ffffffffc020b24e <hash32>
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
ffffffffc020647e:	24e60613          	addi	a2,a2,590 # ffffffffc020d6c8 <etext+0x1ed6>
ffffffffc0206482:	41d00593          	li	a1,1053
ffffffffc0206486:	00007517          	auipc	a0,0x7
ffffffffc020648a:	1d250513          	addi	a0,a0,466 # ffffffffc020d658 <etext+0x1e66>
ffffffffc020648e:	fbdf90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206492:	00006617          	auipc	a2,0x6
ffffffffc0206496:	2e660613          	addi	a2,a2,742 # ffffffffc020c778 <etext+0xf86>
ffffffffc020649a:	06900593          	li	a1,105
ffffffffc020649e:	00006517          	auipc	a0,0x6
ffffffffc02064a2:	23250513          	addi	a0,a0,562 # ffffffffc020c6d0 <etext+0xede>
ffffffffc02064a6:	fa5f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc02064aa:	00006617          	auipc	a2,0x6
ffffffffc02064ae:	2a660613          	addi	a2,a2,678 # ffffffffc020c750 <etext+0xf5e>
ffffffffc02064b2:	07700593          	li	a1,119
ffffffffc02064b6:	00006517          	auipc	a0,0x6
ffffffffc02064ba:	21a50513          	addi	a0,a0,538 # ffffffffc020c6d0 <etext+0xede>
ffffffffc02064be:	f8df90ef          	jal	ffffffffc020044a <__panic>

ffffffffc02064c2 <init_main>:
ffffffffc02064c2:	1141                	addi	sp,sp,-16
ffffffffc02064c4:	00007517          	auipc	a0,0x7
ffffffffc02064c8:	22450513          	addi	a0,a0,548 # ffffffffc020d6e8 <etext+0x1ef6>
ffffffffc02064cc:	e406                	sd	ra,8(sp)
ffffffffc02064ce:	78e010ef          	jal	ffffffffc0207c5c <vfs_set_bootfs>
ffffffffc02064d2:	e179                	bnez	a0,ffffffffc0206598 <init_main+0xd6>
ffffffffc02064d4:	d23fb0ef          	jal	ffffffffc02021f6 <nr_free_pages>
ffffffffc02064d8:	ae5fb0ef          	jal	ffffffffc0201fbc <kallocated>
ffffffffc02064dc:	4601                	li	a2,0
ffffffffc02064de:	4581                	li	a1,0
ffffffffc02064e0:	00001517          	auipc	a0,0x1
ffffffffc02064e4:	95c50513          	addi	a0,a0,-1700 # ffffffffc0206e3c <user_main>
ffffffffc02064e8:	c49ff0ef          	jal	ffffffffc0206130 <kernel_thread>
ffffffffc02064ec:	00a04563          	bgtz	a0,ffffffffc02064f6 <init_main+0x34>
ffffffffc02064f0:	a841                	j	ffffffffc0206580 <init_main+0xbe>
ffffffffc02064f2:	7df000ef          	jal	ffffffffc02074d0 <schedule>
ffffffffc02064f6:	4581                	li	a1,0
ffffffffc02064f8:	4501                	li	a0,0
ffffffffc02064fa:	de7ff0ef          	jal	ffffffffc02062e0 <do_wait.part.0>
ffffffffc02064fe:	d975                	beqz	a0,ffffffffc02064f2 <init_main+0x30>
ffffffffc0206500:	db5fe0ef          	jal	ffffffffc02052b4 <fs_cleanup>
ffffffffc0206504:	00007517          	auipc	a0,0x7
ffffffffc0206508:	22c50513          	addi	a0,a0,556 # ffffffffc020d730 <etext+0x1f3e>
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
ffffffffc0206550:	2cc50513          	addi	a0,a0,716 # ffffffffc020d818 <etext+0x2026>
ffffffffc0206554:	c53f90ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0206558:	60a2                	ld	ra,8(sp)
ffffffffc020655a:	4501                	li	a0,0
ffffffffc020655c:	0141                	addi	sp,sp,16
ffffffffc020655e:	8082                	ret
ffffffffc0206560:	00007697          	auipc	a3,0x7
ffffffffc0206564:	1f868693          	addi	a3,a3,504 # ffffffffc020d758 <etext+0x1f66>
ffffffffc0206568:	00005617          	auipc	a2,0x5
ffffffffc020656c:	6c860613          	addi	a2,a2,1736 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0206570:	49300593          	li	a1,1171
ffffffffc0206574:	00007517          	auipc	a0,0x7
ffffffffc0206578:	0e450513          	addi	a0,a0,228 # ffffffffc020d658 <etext+0x1e66>
ffffffffc020657c:	ecff90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206580:	00007617          	auipc	a2,0x7
ffffffffc0206584:	19060613          	addi	a2,a2,400 # ffffffffc020d710 <etext+0x1f1e>
ffffffffc0206588:	48600593          	li	a1,1158
ffffffffc020658c:	00007517          	auipc	a0,0x7
ffffffffc0206590:	0cc50513          	addi	a0,a0,204 # ffffffffc020d658 <etext+0x1e66>
ffffffffc0206594:	eb7f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206598:	86aa                	mv	a3,a0
ffffffffc020659a:	00007617          	auipc	a2,0x7
ffffffffc020659e:	15660613          	addi	a2,a2,342 # ffffffffc020d6f0 <etext+0x1efe>
ffffffffc02065a2:	47e00593          	li	a1,1150
ffffffffc02065a6:	00007517          	auipc	a0,0x7
ffffffffc02065aa:	0b250513          	addi	a0,a0,178 # ffffffffc020d658 <etext+0x1e66>
ffffffffc02065ae:	e9df90ef          	jal	ffffffffc020044a <__panic>
ffffffffc02065b2:	00007697          	auipc	a3,0x7
ffffffffc02065b6:	23668693          	addi	a3,a3,566 # ffffffffc020d7e8 <etext+0x1ff6>
ffffffffc02065ba:	00005617          	auipc	a2,0x5
ffffffffc02065be:	67660613          	addi	a2,a2,1654 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02065c2:	49600593          	li	a1,1174
ffffffffc02065c6:	00007517          	auipc	a0,0x7
ffffffffc02065ca:	09250513          	addi	a0,a0,146 # ffffffffc020d658 <etext+0x1e66>
ffffffffc02065ce:	e7df90ef          	jal	ffffffffc020044a <__panic>
ffffffffc02065d2:	00007697          	auipc	a3,0x7
ffffffffc02065d6:	1e668693          	addi	a3,a3,486 # ffffffffc020d7b8 <etext+0x1fc6>
ffffffffc02065da:	00005617          	auipc	a2,0x5
ffffffffc02065de:	65660613          	addi	a2,a2,1622 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02065e2:	49500593          	li	a1,1173
ffffffffc02065e6:	00007517          	auipc	a0,0x7
ffffffffc02065ea:	07250513          	addi	a0,a0,114 # ffffffffc020d658 <etext+0x1e66>
ffffffffc02065ee:	e5df90ef          	jal	ffffffffc020044a <__panic>
ffffffffc02065f2:	00007697          	auipc	a3,0x7
ffffffffc02065f6:	1b668693          	addi	a3,a3,438 # ffffffffc020d7a8 <etext+0x1fb6>
ffffffffc02065fa:	00005617          	auipc	a2,0x5
ffffffffc02065fe:	63660613          	addi	a2,a2,1590 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0206602:	49400593          	li	a1,1172
ffffffffc0206606:	00007517          	auipc	a0,0x7
ffffffffc020660a:	05250513          	addi	a0,a0,82 # ffffffffc020d658 <etext+0x1e66>
ffffffffc020660e:	e3df90ef          	jal	ffffffffc020044a <__panic>

ffffffffc0206612 <do_execve>:
ffffffffc0206612:	dc010113          	addi	sp,sp,-576
ffffffffc0206616:	21613023          	sd	s6,512(sp)
ffffffffc020661a:	22113c23          	sd	ra,568(sp)
ffffffffc020661e:	22913423          	sd	s1,552(sp)
ffffffffc0206622:	fff58b1b          	addiw	s6,a1,-1
ffffffffc0206626:	47fd                	li	a5,31
ffffffffc0206628:	6f67e263          	bltu	a5,s6,ffffffffc0206d0c <do_execve+0x6fa>
ffffffffc020662c:	23213023          	sd	s2,544(sp)
ffffffffc0206630:	00090917          	auipc	s2,0x90
ffffffffc0206634:	29890913          	addi	s2,s2,664 # ffffffffc02968c8 <current>
ffffffffc0206638:	00093783          	ld	a5,0(s2)
ffffffffc020663c:	21413823          	sd	s4,528(sp)
ffffffffc0206640:	22813823          	sd	s0,560(sp)
ffffffffc0206644:	0287ba03          	ld	s4,40(a5)
ffffffffc0206648:	f3ea                	sd	s10,480(sp)
ffffffffc020664a:	84aa                	mv	s1,a0
ffffffffc020664c:	8d32                	mv	s10,a2
ffffffffc020664e:	842e                	mv	s0,a1
ffffffffc0206650:	00a8                	addi	a0,sp,72
ffffffffc0206652:	4641                	li	a2,16
ffffffffc0206654:	4581                	li	a1,0
ffffffffc0206656:	134050ef          	jal	ffffffffc020b78a <memset>
ffffffffc020665a:	000a0c63          	beqz	s4,ffffffffc0206672 <do_execve+0x60>
ffffffffc020665e:	038a0513          	addi	a0,s4,56
ffffffffc0206662:	fe1fd0ef          	jal	ffffffffc0204642 <down>
ffffffffc0206666:	00093783          	ld	a5,0(s2)
ffffffffc020666a:	c781                	beqz	a5,ffffffffc0206672 <do_execve+0x60>
ffffffffc020666c:	43dc                	lw	a5,4(a5)
ffffffffc020666e:	04fa2823          	sw	a5,80(s4)
ffffffffc0206672:	1c048963          	beqz	s1,ffffffffc0206844 <do_execve+0x232>
ffffffffc0206676:	8626                	mv	a2,s1
ffffffffc0206678:	46c1                	li	a3,16
ffffffffc020667a:	00ac                	addi	a1,sp,72
ffffffffc020667c:	8552                	mv	a0,s4
ffffffffc020667e:	df7fd0ef          	jal	ffffffffc0204474 <copy_string>
ffffffffc0206682:	66050663          	beqz	a0,ffffffffc0206cee <do_execve+0x6dc>
ffffffffc0206686:	21513423          	sd	s5,520(sp)
ffffffffc020668a:	fbe2                	sd	s8,496(sp)
ffffffffc020668c:	00341a93          	slli	s5,s0,0x3
ffffffffc0206690:	8656                	mv	a2,s5
ffffffffc0206692:	4681                	li	a3,0
ffffffffc0206694:	85ea                	mv	a1,s10
ffffffffc0206696:	8552                	mv	a0,s4
ffffffffc0206698:	8c6a                	mv	s8,s10
ffffffffc020669a:	cc9fd0ef          	jal	ffffffffc0204362 <user_mem_check>
ffffffffc020669e:	68050263          	beqz	a0,ffffffffc0206d22 <do_execve+0x710>
ffffffffc02066a2:	21313c23          	sd	s3,536(sp)
ffffffffc02066a6:	f7e6                	sd	s9,488(sp)
ffffffffc02066a8:	4981                	li	s3,0
ffffffffc02066aa:	0d010c93          	addi	s9,sp,208
ffffffffc02066ae:	6505                	lui	a0,0x1
ffffffffc02066b0:	911fb0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc02066b4:	84aa                	mv	s1,a0
ffffffffc02066b6:	10050c63          	beqz	a0,ffffffffc02067ce <do_execve+0x1bc>
ffffffffc02066ba:	000c3603          	ld	a2,0(s8)
ffffffffc02066be:	85aa                	mv	a1,a0
ffffffffc02066c0:	6685                	lui	a3,0x1
ffffffffc02066c2:	8552                	mv	a0,s4
ffffffffc02066c4:	db1fd0ef          	jal	ffffffffc0204474 <copy_string>
ffffffffc02066c8:	16050963          	beqz	a0,ffffffffc020683a <do_execve+0x228>
ffffffffc02066cc:	009cb023          	sd	s1,0(s9)
ffffffffc02066d0:	2985                	addiw	s3,s3,1
ffffffffc02066d2:	0ca1                	addi	s9,s9,8
ffffffffc02066d4:	0c21                	addi	s8,s8,8
ffffffffc02066d6:	fd341ce3          	bne	s0,s3,ffffffffc02066ae <do_execve+0x9c>
ffffffffc02066da:	ffde                	sd	s7,504(sp)
ffffffffc02066dc:	efee                	sd	s11,472(sp)
ffffffffc02066de:	000d3483          	ld	s1,0(s10)
ffffffffc02066e2:	0a0a0963          	beqz	s4,ffffffffc0206794 <do_execve+0x182>
ffffffffc02066e6:	038a0513          	addi	a0,s4,56
ffffffffc02066ea:	f55fd0ef          	jal	ffffffffc020463e <up>
ffffffffc02066ee:	00093783          	ld	a5,0(s2)
ffffffffc02066f2:	040a2823          	sw	zero,80(s4)
ffffffffc02066f6:	1487b503          	ld	a0,328(a5)
ffffffffc02066fa:	c97fe0ef          	jal	ffffffffc0205390 <files_closeall>
ffffffffc02066fe:	8526                	mv	a0,s1
ffffffffc0206700:	4581                	li	a1,0
ffffffffc0206702:	f1ffe0ef          	jal	ffffffffc0205620 <sysfile_open>
ffffffffc0206706:	89aa                	mv	s3,a0
ffffffffc0206708:	14054d63          	bltz	a0,ffffffffc0206862 <do_execve+0x250>
ffffffffc020670c:	00090797          	auipc	a5,0x90
ffffffffc0206710:	18c7b783          	ld	a5,396(a5) # ffffffffc0296898 <boot_pgdir_pa>
ffffffffc0206714:	577d                	li	a4,-1
ffffffffc0206716:	177e                	slli	a4,a4,0x3f
ffffffffc0206718:	83b1                	srli	a5,a5,0xc
ffffffffc020671a:	8fd9                	or	a5,a5,a4
ffffffffc020671c:	18079073          	csrw	satp,a5
ffffffffc0206720:	030a2783          	lw	a5,48(s4)
ffffffffc0206724:	37fd                	addiw	a5,a5,-1
ffffffffc0206726:	02fa2823          	sw	a5,48(s4)
ffffffffc020672a:	14078e63          	beqz	a5,ffffffffc0206886 <do_execve+0x274>
ffffffffc020672e:	00093783          	ld	a5,0(s2)
ffffffffc0206732:	0207b423          	sd	zero,40(a5)
ffffffffc0206736:	d8cfd0ef          	jal	ffffffffc0203cc2 <mm_create>
ffffffffc020673a:	8a2a                	mv	s4,a0
ffffffffc020673c:	54f1                	li	s1,-4
ffffffffc020673e:	c505                	beqz	a0,ffffffffc0206766 <do_execve+0x154>
ffffffffc0206740:	ceeff0ef          	jal	ffffffffc0205c2e <setup_pgdir>
ffffffffc0206744:	54f1                	li	s1,-4
ffffffffc0206746:	ed09                	bnez	a0,ffffffffc0206760 <do_execve+0x14e>
ffffffffc0206748:	4601                	li	a2,0
ffffffffc020674a:	4581                	li	a1,0
ffffffffc020674c:	854e                	mv	a0,s3
ffffffffc020674e:	98aff0ef          	jal	ffffffffc02058d8 <sysfile_seek>
ffffffffc0206752:	84aa                	mv	s1,a0
ffffffffc0206754:	10050963          	beqz	a0,ffffffffc0206866 <do_execve+0x254>
ffffffffc0206758:	018a3503          	ld	a0,24(s4)
ffffffffc020675c:	c5aff0ef          	jal	ffffffffc0205bb6 <put_pgdir.isra.0>
ffffffffc0206760:	8552                	mv	a0,s4
ffffffffc0206762:	eacfd0ef          	jal	ffffffffc0203e0e <mm_destroy>
ffffffffc0206766:	854e                	mv	a0,s3
ffffffffc0206768:	eeffe0ef          	jal	ffffffffc0205656 <sysfile_close>
ffffffffc020676c:	0c010913          	addi	s2,sp,192
ffffffffc0206770:	020b1713          	slli	a4,s6,0x20
ffffffffc0206774:	01d75793          	srli	a5,a4,0x1d
ffffffffc0206778:	9956                	add	s2,s2,s5
ffffffffc020677a:	01a0                	addi	s0,sp,200
ffffffffc020677c:	40f90933          	sub	s2,s2,a5
ffffffffc0206780:	9456                	add	s0,s0,s5
ffffffffc0206782:	6008                	ld	a0,0(s0)
ffffffffc0206784:	1461                	addi	s0,s0,-8
ffffffffc0206786:	8e1fb0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020678a:	ff241ce3          	bne	s0,s2,ffffffffc0206782 <do_execve+0x170>
ffffffffc020678e:	8526                	mv	a0,s1
ffffffffc0206790:	9f1ff0ef          	jal	ffffffffc0206180 <do_exit>
ffffffffc0206794:	00093783          	ld	a5,0(s2)
ffffffffc0206798:	1487b503          	ld	a0,328(a5)
ffffffffc020679c:	bf5fe0ef          	jal	ffffffffc0205390 <files_closeall>
ffffffffc02067a0:	8526                	mv	a0,s1
ffffffffc02067a2:	4581                	li	a1,0
ffffffffc02067a4:	e7dfe0ef          	jal	ffffffffc0205620 <sysfile_open>
ffffffffc02067a8:	89aa                	mv	s3,a0
ffffffffc02067aa:	0a054c63          	bltz	a0,ffffffffc0206862 <do_execve+0x250>
ffffffffc02067ae:	00093783          	ld	a5,0(s2)
ffffffffc02067b2:	779c                	ld	a5,40(a5)
ffffffffc02067b4:	d3c9                	beqz	a5,ffffffffc0206736 <do_execve+0x124>
ffffffffc02067b6:	00007617          	auipc	a2,0x7
ffffffffc02067ba:	09260613          	addi	a2,a2,146 # ffffffffc020d848 <etext+0x2056>
ffffffffc02067be:	2d000593          	li	a1,720
ffffffffc02067c2:	00007517          	auipc	a0,0x7
ffffffffc02067c6:	e9650513          	addi	a0,a0,-362 # ffffffffc020d658 <etext+0x1e66>
ffffffffc02067ca:	c81f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc02067ce:	54f1                	li	s1,-4
ffffffffc02067d0:	02098663          	beqz	s3,ffffffffc02067fc <do_execve+0x1ea>
ffffffffc02067d4:	00399793          	slli	a5,s3,0x3
ffffffffc02067d8:	39fd                	addiw	s3,s3,-1
ffffffffc02067da:	0c010913          	addi	s2,sp,192
ffffffffc02067de:	02099713          	slli	a4,s3,0x20
ffffffffc02067e2:	01d75993          	srli	s3,a4,0x1d
ffffffffc02067e6:	993e                	add	s2,s2,a5
ffffffffc02067e8:	01a0                	addi	s0,sp,200
ffffffffc02067ea:	41390933          	sub	s2,s2,s3
ffffffffc02067ee:	943e                	add	s0,s0,a5
ffffffffc02067f0:	6008                	ld	a0,0(s0)
ffffffffc02067f2:	1461                	addi	s0,s0,-8
ffffffffc02067f4:	873fb0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc02067f8:	ff241ce3          	bne	s0,s2,ffffffffc02067f0 <do_execve+0x1de>
ffffffffc02067fc:	21813983          	ld	s3,536(sp)
ffffffffc0206800:	7cbe                	ld	s9,488(sp)
ffffffffc0206802:	000a0863          	beqz	s4,ffffffffc0206812 <do_execve+0x200>
ffffffffc0206806:	038a0513          	addi	a0,s4,56
ffffffffc020680a:	e35fd0ef          	jal	ffffffffc020463e <up>
ffffffffc020680e:	040a2823          	sw	zero,80(s4)
ffffffffc0206812:	23013403          	ld	s0,560(sp)
ffffffffc0206816:	22013903          	ld	s2,544(sp)
ffffffffc020681a:	21013a03          	ld	s4,528(sp)
ffffffffc020681e:	20813a83          	ld	s5,520(sp)
ffffffffc0206822:	7c5e                	ld	s8,496(sp)
ffffffffc0206824:	7d1e                	ld	s10,480(sp)
ffffffffc0206826:	23813083          	ld	ra,568(sp)
ffffffffc020682a:	20013b03          	ld	s6,512(sp)
ffffffffc020682e:	8526                	mv	a0,s1
ffffffffc0206830:	22813483          	ld	s1,552(sp)
ffffffffc0206834:	24010113          	addi	sp,sp,576
ffffffffc0206838:	8082                	ret
ffffffffc020683a:	8526                	mv	a0,s1
ffffffffc020683c:	82bfb0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0206840:	54f5                	li	s1,-3
ffffffffc0206842:	b779                	j	ffffffffc02067d0 <do_execve+0x1be>
ffffffffc0206844:	00093783          	ld	a5,0(s2)
ffffffffc0206848:	00007617          	auipc	a2,0x7
ffffffffc020684c:	ff060613          	addi	a2,a2,-16 # ffffffffc020d838 <etext+0x2046>
ffffffffc0206850:	45c1                	li	a1,16
ffffffffc0206852:	43d4                	lw	a3,4(a5)
ffffffffc0206854:	00a8                	addi	a0,sp,72
ffffffffc0206856:	21513423          	sd	s5,520(sp)
ffffffffc020685a:	fbe2                	sd	s8,496(sp)
ffffffffc020685c:	62d040ef          	jal	ffffffffc020b688 <snprintf>
ffffffffc0206860:	b535                	j	ffffffffc020668c <do_execve+0x7a>
ffffffffc0206862:	84ce                	mv	s1,s3
ffffffffc0206864:	b709                	j	ffffffffc0206766 <do_execve+0x154>
ffffffffc0206866:	04000613          	li	a2,64
ffffffffc020686a:	090c                	addi	a1,sp,144
ffffffffc020686c:	854e                	mv	a0,s3
ffffffffc020686e:	dedfe0ef          	jal	ffffffffc020565a <sysfile_read>
ffffffffc0206872:	04000793          	li	a5,64
ffffffffc0206876:	02f50363          	beq	a0,a5,ffffffffc020689c <do_execve+0x28a>
ffffffffc020687a:	0005049b          	sext.w	s1,a0
ffffffffc020687e:	ec054de3          	bltz	a0,ffffffffc0206758 <do_execve+0x146>
ffffffffc0206882:	54fd                	li	s1,-1
ffffffffc0206884:	bdd1                	j	ffffffffc0206758 <do_execve+0x146>
ffffffffc0206886:	8552                	mv	a0,s4
ffffffffc0206888:	f3cfd0ef          	jal	ffffffffc0203fc4 <exit_mmap>
ffffffffc020688c:	018a3503          	ld	a0,24(s4)
ffffffffc0206890:	b26ff0ef          	jal	ffffffffc0205bb6 <put_pgdir.isra.0>
ffffffffc0206894:	8552                	mv	a0,s4
ffffffffc0206896:	d78fd0ef          	jal	ffffffffc0203e0e <mm_destroy>
ffffffffc020689a:	bd51                	j	ffffffffc020672e <do_execve+0x11c>
ffffffffc020689c:	474a                	lw	a4,144(sp)
ffffffffc020689e:	464c47b7          	lui	a5,0x464c4
ffffffffc02068a2:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644f27f>
ffffffffc02068a6:	32f71163          	bne	a4,a5,ffffffffc0206bc8 <do_execve+0x5b6>
ffffffffc02068aa:	0c815783          	lhu	a5,200(sp)
ffffffffc02068ae:	e002                	sd	zero,0(sp)
ffffffffc02068b0:	f402                	sd	zero,40(sp)
ffffffffc02068b2:	14078863          	beqz	a5,ffffffffc0206a02 <do_execve+0x3f0>
ffffffffc02068b6:	e456                	sd	s5,8(sp)
ffffffffc02068b8:	e85a                	sd	s6,16(sp)
ffffffffc02068ba:	f822                	sd	s0,48(sp)
ffffffffc02068bc:	75ca                	ld	a1,176(sp)
ffffffffc02068be:	6782                	ld	a5,0(sp)
ffffffffc02068c0:	4601                	li	a2,0
ffffffffc02068c2:	854e                	mv	a0,s3
ffffffffc02068c4:	95be                	add	a1,a1,a5
ffffffffc02068c6:	812ff0ef          	jal	ffffffffc02058d8 <sysfile_seek>
ffffffffc02068ca:	10051163          	bnez	a0,ffffffffc02069cc <do_execve+0x3ba>
ffffffffc02068ce:	03800613          	li	a2,56
ffffffffc02068d2:	08ac                	addi	a1,sp,88
ffffffffc02068d4:	854e                	mv	a0,s3
ffffffffc02068d6:	d85fe0ef          	jal	ffffffffc020565a <sysfile_read>
ffffffffc02068da:	03800793          	li	a5,56
ffffffffc02068de:	0ef50b63          	beq	a0,a5,ffffffffc02069d4 <do_execve+0x3c2>
ffffffffc02068e2:	6aa2                	ld	s5,8(sp)
ffffffffc02068e4:	6b42                	ld	s6,16(sp)
ffffffffc02068e6:	0005049b          	sext.w	s1,a0
ffffffffc02068ea:	00054363          	bltz	a0,ffffffffc02068f0 <do_execve+0x2de>
ffffffffc02068ee:	54fd                	li	s1,-1
ffffffffc02068f0:	8552                	mv	a0,s4
ffffffffc02068f2:	ed2fd0ef          	jal	ffffffffc0203fc4 <exit_mmap>
ffffffffc02068f6:	b58d                	j	ffffffffc0206758 <do_execve+0x146>
ffffffffc02068f8:	47f6                	lw	a5,92(sp)
ffffffffc02068fa:	0027971b          	slliw	a4,a5,0x2
ffffffffc02068fe:	0027f693          	andi	a3,a5,2
ffffffffc0206902:	8b11                	andi	a4,a4,4
ffffffffc0206904:	8b91                	andi	a5,a5,4
ffffffffc0206906:	2c068363          	beqz	a3,ffffffffc0206bcc <do_execve+0x5ba>
ffffffffc020690a:	40079363          	bnez	a5,ffffffffc0206d10 <do_execve+0x6fe>
ffffffffc020690e:	47dd                	li	a5,23
ffffffffc0206910:	00276693          	ori	a3,a4,2
ffffffffc0206914:	ec3e                	sd	a5,24(sp)
ffffffffc0206916:	c709                	beqz	a4,ffffffffc0206920 <do_execve+0x30e>
ffffffffc0206918:	67e2                	ld	a5,24(sp)
ffffffffc020691a:	0087e793          	ori	a5,a5,8
ffffffffc020691e:	ec3e                	sd	a5,24(sp)
ffffffffc0206920:	75a6                	ld	a1,104(sp)
ffffffffc0206922:	4701                	li	a4,0
ffffffffc0206924:	8552                	mv	a0,s4
ffffffffc0206926:	d3afd0ef          	jal	ffffffffc0203e60 <mm_map>
ffffffffc020692a:	e14d                	bnez	a0,ffffffffc02069cc <do_execve+0x3ba>
ffffffffc020692c:	7da6                	ld	s11,104(sp)
ffffffffc020692e:	76e6                	ld	a3,120(sp)
ffffffffc0206930:	777d                	lui	a4,0xfffff
ffffffffc0206932:	00edfab3          	and	s5,s11,a4
ffffffffc0206936:	00dd8d33          	add	s10,s11,a3
ffffffffc020693a:	41adf863          	bgeu	s11,s10,ffffffffc0206d4a <do_execve+0x738>
ffffffffc020693e:	57fd                	li	a5,-1
ffffffffc0206940:	83b1                	srli	a5,a5,0xc
ffffffffc0206942:	7c86                	ld	s9,96(sp)
ffffffffc0206944:	f03e                	sd	a5,32(sp)
ffffffffc0206946:	a005                	j	ffffffffc0206966 <do_execve+0x354>
ffffffffc0206948:	9ba6                	add	s7,s7,s1
ffffffffc020694a:	415d85b3          	sub	a1,s11,s5
ffffffffc020694e:	95de                	add	a1,a1,s7
ffffffffc0206950:	8662                	mv	a2,s8
ffffffffc0206952:	854e                	mv	a0,s3
ffffffffc0206954:	d07fe0ef          	jal	ffffffffc020565a <sysfile_read>
ffffffffc0206958:	f8ac15e3          	bne	s8,a0,ffffffffc02068e2 <do_execve+0x2d0>
ffffffffc020695c:	9de2                	add	s11,s11,s8
ffffffffc020695e:	9ce2                	add	s9,s9,s8
ffffffffc0206960:	27adfd63          	bgeu	s11,s10,ffffffffc0206bda <do_execve+0x5c8>
ffffffffc0206964:	8aa2                	mv	s5,s0
ffffffffc0206966:	018a3503          	ld	a0,24(s4)
ffffffffc020696a:	6662                	ld	a2,24(sp)
ffffffffc020696c:	85d6                	mv	a1,s5
ffffffffc020696e:	a72fd0ef          	jal	ffffffffc0203be0 <pgdir_alloc_page>
ffffffffc0206972:	8b2a                	mv	s6,a0
ffffffffc0206974:	36050963          	beqz	a0,ffffffffc0206ce6 <do_execve+0x6d4>
ffffffffc0206978:	6785                	lui	a5,0x1
ffffffffc020697a:	00fa8433          	add	s0,s5,a5
ffffffffc020697e:	41bd0c33          	sub	s8,s10,s11
ffffffffc0206982:	008d6463          	bltu	s10,s0,ffffffffc020698a <do_execve+0x378>
ffffffffc0206986:	41b40c33          	sub	s8,s0,s11
ffffffffc020698a:	00090797          	auipc	a5,0x90
ffffffffc020698e:	f2e7b783          	ld	a5,-210(a5) # ffffffffc02968b8 <pages>
ffffffffc0206992:	00009597          	auipc	a1,0x9
ffffffffc0206996:	13e5b583          	ld	a1,318(a1) # ffffffffc020fad0 <nbase>
ffffffffc020699a:	7702                	ld	a4,32(sp)
ffffffffc020699c:	40fb07b3          	sub	a5,s6,a5
ffffffffc02069a0:	8799                	srai	a5,a5,0x6
ffffffffc02069a2:	00090617          	auipc	a2,0x90
ffffffffc02069a6:	f0e63603          	ld	a2,-242(a2) # ffffffffc02968b0 <npage>
ffffffffc02069aa:	97ae                	add	a5,a5,a1
ffffffffc02069ac:	00e7f5b3          	and	a1,a5,a4
ffffffffc02069b0:	00c79493          	slli	s1,a5,0xc
ffffffffc02069b4:	3cc5f763          	bgeu	a1,a2,ffffffffc0206d82 <do_execve+0x770>
ffffffffc02069b8:	4601                	li	a2,0
ffffffffc02069ba:	85e6                	mv	a1,s9
ffffffffc02069bc:	854e                	mv	a0,s3
ffffffffc02069be:	00090b97          	auipc	s7,0x90
ffffffffc02069c2:	eeabbb83          	ld	s7,-278(s7) # ffffffffc02968a8 <va_pa_offset>
ffffffffc02069c6:	f13fe0ef          	jal	ffffffffc02058d8 <sysfile_seek>
ffffffffc02069ca:	dd3d                	beqz	a0,ffffffffc0206948 <do_execve+0x336>
ffffffffc02069cc:	6aa2                	ld	s5,8(sp)
ffffffffc02069ce:	6b42                	ld	s6,16(sp)
ffffffffc02069d0:	84aa                	mv	s1,a0
ffffffffc02069d2:	bf39                	j	ffffffffc02068f0 <do_execve+0x2de>
ffffffffc02069d4:	47e6                	lw	a5,88(sp)
ffffffffc02069d6:	4705                	li	a4,1
ffffffffc02069d8:	00e79763          	bne	a5,a4,ffffffffc02069e6 <do_execve+0x3d4>
ffffffffc02069dc:	77e6                	ld	a5,120(sp)
ffffffffc02069de:	660a                	ld	a2,128(sp)
ffffffffc02069e0:	34f66863          	bltu	a2,a5,ffffffffc0206d30 <do_execve+0x71e>
ffffffffc02069e4:	fb91                	bnez	a5,ffffffffc02068f8 <do_execve+0x2e6>
ffffffffc02069e6:	7722                	ld	a4,40(sp)
ffffffffc02069e8:	6682                	ld	a3,0(sp)
ffffffffc02069ea:	0c815783          	lhu	a5,200(sp)
ffffffffc02069ee:	2705                	addiw	a4,a4,1 # fffffffffffff001 <end+0x3fd686f1>
ffffffffc02069f0:	03868693          	addi	a3,a3,56 # 1038 <_binary_bin_swap_img_size-0x6cc8>
ffffffffc02069f4:	f43a                	sd	a4,40(sp)
ffffffffc02069f6:	e036                	sd	a3,0(sp)
ffffffffc02069f8:	ecf762e3          	bltu	a4,a5,ffffffffc02068bc <do_execve+0x2aa>
ffffffffc02069fc:	6aa2                	ld	s5,8(sp)
ffffffffc02069fe:	6b42                	ld	s6,16(sp)
ffffffffc0206a00:	7442                	ld	s0,48(sp)
ffffffffc0206a02:	854e                	mv	a0,s3
ffffffffc0206a04:	c53fe0ef          	jal	ffffffffc0205656 <sysfile_close>
ffffffffc0206a08:	8552                	mv	a0,s4
ffffffffc0206a0a:	4701                	li	a4,0
ffffffffc0206a0c:	46ad                	li	a3,11
ffffffffc0206a0e:	00100637          	lui	a2,0x100
ffffffffc0206a12:	7ff005b7          	lui	a1,0x7ff00
ffffffffc0206a16:	c4afd0ef          	jal	ffffffffc0203e60 <mm_map>
ffffffffc0206a1a:	84aa                	mv	s1,a0
ffffffffc0206a1c:	ec051ae3          	bnez	a0,ffffffffc02068f0 <do_execve+0x2de>
ffffffffc0206a20:	018a3503          	ld	a0,24(s4)
ffffffffc0206a24:	467d                	li	a2,31
ffffffffc0206a26:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc0206a2a:	9b6fd0ef          	jal	ffffffffc0203be0 <pgdir_alloc_page>
ffffffffc0206a2e:	3e050763          	beqz	a0,ffffffffc0206e1c <do_execve+0x80a>
ffffffffc0206a32:	018a3503          	ld	a0,24(s4)
ffffffffc0206a36:	467d                	li	a2,31
ffffffffc0206a38:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc0206a3c:	9a4fd0ef          	jal	ffffffffc0203be0 <pgdir_alloc_page>
ffffffffc0206a40:	3a050e63          	beqz	a0,ffffffffc0206dfc <do_execve+0x7ea>
ffffffffc0206a44:	018a3503          	ld	a0,24(s4)
ffffffffc0206a48:	467d                	li	a2,31
ffffffffc0206a4a:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc0206a4e:	992fd0ef          	jal	ffffffffc0203be0 <pgdir_alloc_page>
ffffffffc0206a52:	38050563          	beqz	a0,ffffffffc0206ddc <do_execve+0x7ca>
ffffffffc0206a56:	018a3503          	ld	a0,24(s4)
ffffffffc0206a5a:	467d                	li	a2,31
ffffffffc0206a5c:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc0206a60:	980fd0ef          	jal	ffffffffc0203be0 <pgdir_alloc_page>
ffffffffc0206a64:	34050c63          	beqz	a0,ffffffffc0206dbc <do_execve+0x7aa>
ffffffffc0206a68:	030a2783          	lw	a5,48(s4)
ffffffffc0206a6c:	00093603          	ld	a2,0(s2)
ffffffffc0206a70:	018a3683          	ld	a3,24(s4)
ffffffffc0206a74:	2785                	addiw	a5,a5,1
ffffffffc0206a76:	02fa2823          	sw	a5,48(s4)
ffffffffc0206a7a:	03463423          	sd	s4,40(a2) # 100028 <_binary_bin_sfs_img_size+0x8ad28>
ffffffffc0206a7e:	c02007b7          	lui	a5,0xc0200
ffffffffc0206a82:	2cf6e763          	bltu	a3,a5,ffffffffc0206d50 <do_execve+0x73e>
ffffffffc0206a86:	00090797          	auipc	a5,0x90
ffffffffc0206a8a:	e227b783          	ld	a5,-478(a5) # ffffffffc02968a8 <va_pa_offset>
ffffffffc0206a8e:	577d                	li	a4,-1
ffffffffc0206a90:	177e                	slli	a4,a4,0x3f
ffffffffc0206a92:	8e9d                	sub	a3,a3,a5
ffffffffc0206a94:	00c6d793          	srli	a5,a3,0xc
ffffffffc0206a98:	f654                	sd	a3,168(a2)
ffffffffc0206a9a:	8fd9                	or	a5,a5,a4
ffffffffc0206a9c:	18079073          	csrw	satp,a5
ffffffffc0206aa0:	4a01                	li	s4,0
ffffffffc0206aa2:	0d010c13          	addi	s8,sp,208
ffffffffc0206aa6:	4b81                	li	s7,0
ffffffffc0206aa8:	000c3503          	ld	a0,0(s8)
ffffffffc0206aac:	6585                	lui	a1,0x1
ffffffffc0206aae:	2b85                	addiw	s7,s7,1
ffffffffc0206ab0:	43f040ef          	jal	ffffffffc020b6ee <strnlen>
ffffffffc0206ab4:	00150793          	addi	a5,a0,1
ffffffffc0206ab8:	0c21                	addi	s8,s8,8
ffffffffc0206aba:	01478a3b          	addw	s4,a5,s4
ffffffffc0206abe:	fe8be5e3          	bltu	s7,s0,ffffffffc0206aa8 <do_execve+0x496>
ffffffffc0206ac2:	10000bb7          	lui	s7,0x10000
ffffffffc0206ac6:	003a5a1b          	srliw	s4,s4,0x3
ffffffffc0206aca:	1bfd                	addi	s7,s7,-1 # fffffff <_binary_bin_sfs_img_size+0xff8acff>
ffffffffc0206acc:	414b8bb3          	sub	s7,s7,s4
ffffffffc0206ad0:	0b8e                	slli	s7,s7,0x3
ffffffffc0206ad2:	415b8a33          	sub	s4,s7,s5
ffffffffc0206ad6:	099c                	addi	a5,sp,208
ffffffffc0206ad8:	40fa07b3          	sub	a5,s4,a5
ffffffffc0206adc:	8da6                	mv	s11,s1
ffffffffc0206ade:	e03e                	sd	a5,0(sp)
ffffffffc0206ae0:	0d010c13          	addi	s8,sp,208
ffffffffc0206ae4:	4c81                	li	s9,0
ffffffffc0206ae6:	4d01                	li	s10,0
ffffffffc0206ae8:	84a2                	mv	s1,s0
ffffffffc0206aea:	000c3403          	ld	s0,0(s8)
ffffffffc0206aee:	020d1513          	slli	a0,s10,0x20
ffffffffc0206af2:	9101                	srli	a0,a0,0x20
ffffffffc0206af4:	85a2                	mv	a1,s0
ffffffffc0206af6:	955e                	add	a0,a0,s7
ffffffffc0206af8:	413040ef          	jal	ffffffffc020b70a <strcpy>
ffffffffc0206afc:	6782                	ld	a5,0(sp)
ffffffffc0206afe:	872a                	mv	a4,a0
ffffffffc0206b00:	6585                	lui	a1,0x1
ffffffffc0206b02:	97e2                	add	a5,a5,s8
ffffffffc0206b04:	e398                	sd	a4,0(a5)
ffffffffc0206b06:	8522                	mv	a0,s0
ffffffffc0206b08:	3e7040ef          	jal	ffffffffc020b6ee <strnlen>
ffffffffc0206b0c:	00150793          	addi	a5,a0,1
ffffffffc0206b10:	2c85                	addiw	s9,s9,1
ffffffffc0206b12:	0c21                	addi	s8,s8,8
ffffffffc0206b14:	01a78d3b          	addw	s10,a5,s10
ffffffffc0206b18:	fc9ce9e3          	bltu	s9,s1,ffffffffc0206aea <do_execve+0x4d8>
ffffffffc0206b1c:	00093783          	ld	a5,0(s2)
ffffffffc0206b20:	8426                	mv	s0,s1
ffffffffc0206b22:	fe8a2e23          	sw	s0,-4(s4)
ffffffffc0206b26:	73c0                	ld	s0,160(a5)
ffffffffc0206b28:	12000613          	li	a2,288
ffffffffc0206b2c:	4581                	li	a1,0
ffffffffc0206b2e:	8522                	mv	a0,s0
ffffffffc0206b30:	45b040ef          	jal	ffffffffc020b78a <memset>
ffffffffc0206b34:	77aa                	ld	a5,168(sp)
ffffffffc0206b36:	1a71                	addi	s4,s4,-4
ffffffffc0206b38:	84ee                	mv	s1,s11
ffffffffc0206b3a:	01443823          	sd	s4,16(s0)
ffffffffc0206b3e:	10f43423          	sd	a5,264(s0)
ffffffffc0206b42:	100027f3          	csrr	a5,sstatus
ffffffffc0206b46:	edf7f793          	andi	a5,a5,-289
ffffffffc0206b4a:	0207e793          	ori	a5,a5,32
ffffffffc0206b4e:	10f43023          	sd	a5,256(s0)
ffffffffc0206b52:	854e                	mv	a0,s3
ffffffffc0206b54:	b03fe0ef          	jal	ffffffffc0205656 <sysfile_close>
ffffffffc0206b58:	0c010993          	addi	s3,sp,192
ffffffffc0206b5c:	020b1713          	slli	a4,s6,0x20
ffffffffc0206b60:	01d75793          	srli	a5,a4,0x1d
ffffffffc0206b64:	99d6                	add	s3,s3,s5
ffffffffc0206b66:	01a0                	addi	s0,sp,200
ffffffffc0206b68:	40f989b3          	sub	s3,s3,a5
ffffffffc0206b6c:	9456                	add	s0,s0,s5
ffffffffc0206b6e:	6008                	ld	a0,0(s0)
ffffffffc0206b70:	1461                	addi	s0,s0,-8
ffffffffc0206b72:	cf4fb0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0206b76:	ff341ce3          	bne	s0,s3,ffffffffc0206b6e <do_execve+0x55c>
ffffffffc0206b7a:	00093403          	ld	s0,0(s2)
ffffffffc0206b7e:	4641                	li	a2,16
ffffffffc0206b80:	4581                	li	a1,0
ffffffffc0206b82:	0b440413          	addi	s0,s0,180
ffffffffc0206b86:	8522                	mv	a0,s0
ffffffffc0206b88:	403040ef          	jal	ffffffffc020b78a <memset>
ffffffffc0206b8c:	00ac                	addi	a1,sp,72
ffffffffc0206b8e:	8522                	mv	a0,s0
ffffffffc0206b90:	463d                	li	a2,15
ffffffffc0206b92:	449040ef          	jal	ffffffffc020b7da <memcpy>
ffffffffc0206b96:	23813083          	ld	ra,568(sp)
ffffffffc0206b9a:	23013403          	ld	s0,560(sp)
ffffffffc0206b9e:	22013903          	ld	s2,544(sp)
ffffffffc0206ba2:	21813983          	ld	s3,536(sp)
ffffffffc0206ba6:	21013a03          	ld	s4,528(sp)
ffffffffc0206baa:	20813a83          	ld	s5,520(sp)
ffffffffc0206bae:	7bfe                	ld	s7,504(sp)
ffffffffc0206bb0:	7c5e                	ld	s8,496(sp)
ffffffffc0206bb2:	7cbe                	ld	s9,488(sp)
ffffffffc0206bb4:	7d1e                	ld	s10,480(sp)
ffffffffc0206bb6:	6dfe                	ld	s11,472(sp)
ffffffffc0206bb8:	20013b03          	ld	s6,512(sp)
ffffffffc0206bbc:	8526                	mv	a0,s1
ffffffffc0206bbe:	22813483          	ld	s1,552(sp)
ffffffffc0206bc2:	24010113          	addi	sp,sp,576
ffffffffc0206bc6:	8082                	ret
ffffffffc0206bc8:	54e1                	li	s1,-8
ffffffffc0206bca:	b679                	j	ffffffffc0206758 <do_execve+0x146>
ffffffffc0206bcc:	14078763          	beqz	a5,ffffffffc0206d1a <do_execve+0x708>
ffffffffc0206bd0:	47cd                	li	a5,19
ffffffffc0206bd2:	00176693          	ori	a3,a4,1
ffffffffc0206bd6:	ec3e                	sd	a5,24(sp)
ffffffffc0206bd8:	bb3d                	j	ffffffffc0206916 <do_execve+0x304>
ffffffffc0206bda:	7826                	ld	a6,104(sp)
ffffffffc0206bdc:	84a2                	mv	s1,s0
ffffffffc0206bde:	8bda                	mv	s7,s6
ffffffffc0206be0:	670a                	ld	a4,128(sp)
ffffffffc0206be2:	00e80433          	add	s0,a6,a4
ffffffffc0206be6:	069df963          	bgeu	s11,s1,ffffffffc0206c58 <do_execve+0x646>
ffffffffc0206bea:	dfb40ee3          	beq	s0,s11,ffffffffc02069e6 <do_execve+0x3d4>
ffffffffc0206bee:	41b40ab3          	sub	s5,s0,s11
ffffffffc0206bf2:	00946463          	bltu	s0,s1,ffffffffc0206bfa <do_execve+0x5e8>
ffffffffc0206bf6:	41b48ab3          	sub	s5,s1,s11
ffffffffc0206bfa:	00090717          	auipc	a4,0x90
ffffffffc0206bfe:	cbe73703          	ld	a4,-834(a4) # ffffffffc02968b8 <pages>
ffffffffc0206c02:	00009697          	auipc	a3,0x9
ffffffffc0206c06:	ece6b683          	ld	a3,-306(a3) # ffffffffc020fad0 <nbase>
ffffffffc0206c0a:	00090597          	auipc	a1,0x90
ffffffffc0206c0e:	ca65b583          	ld	a1,-858(a1) # ffffffffc02968b0 <npage>
ffffffffc0206c12:	40eb8733          	sub	a4,s7,a4
ffffffffc0206c16:	8719                	srai	a4,a4,0x6
ffffffffc0206c18:	9736                	add	a4,a4,a3
ffffffffc0206c1a:	00c71613          	slli	a2,a4,0xc
ffffffffc0206c1e:	8231                	srli	a2,a2,0xc
ffffffffc0206c20:	00c71693          	slli	a3,a4,0xc
ffffffffc0206c24:	14b67363          	bgeu	a2,a1,ffffffffc0206d6a <do_execve+0x758>
ffffffffc0206c28:	00090717          	auipc	a4,0x90
ffffffffc0206c2c:	c8073703          	ld	a4,-896(a4) # ffffffffc02968a8 <va_pa_offset>
ffffffffc0206c30:	6505                	lui	a0,0x1
ffffffffc0206c32:	956e                	add	a0,a0,s11
ffffffffc0206c34:	9736                	add	a4,a4,a3
ffffffffc0206c36:	8d05                	sub	a0,a0,s1
ffffffffc0206c38:	953a                	add	a0,a0,a4
ffffffffc0206c3a:	8656                	mv	a2,s5
ffffffffc0206c3c:	4581                	li	a1,0
ffffffffc0206c3e:	34d040ef          	jal	ffffffffc020b78a <memset>
ffffffffc0206c42:	9dd6                	add	s11,s11,s5
ffffffffc0206c44:	00943733          	sltu	a4,s0,s1
ffffffffc0206c48:	00947463          	bgeu	s0,s1,ffffffffc0206c50 <do_execve+0x63e>
ffffffffc0206c4c:	d9b40de3          	beq	s0,s11,ffffffffc02069e6 <do_execve+0x3d4>
ffffffffc0206c50:	14071663          	bnez	a4,ffffffffc0206d9c <do_execve+0x78a>
ffffffffc0206c54:	149d9463          	bne	s11,s1,ffffffffc0206d9c <do_execve+0x78a>
ffffffffc0206c58:	d88df7e3          	bgeu	s11,s0,ffffffffc02069e6 <do_execve+0x3d4>
ffffffffc0206c5c:	57fd                	li	a5,-1
ffffffffc0206c5e:	83b1                	srli	a5,a5,0xc
ffffffffc0206c60:	6be2                	ld	s7,24(sp)
ffffffffc0206c62:	f03e                	sd	a5,32(sp)
ffffffffc0206c64:	00090d17          	auipc	s10,0x90
ffffffffc0206c68:	c54d0d13          	addi	s10,s10,-940 # ffffffffc02968b8 <pages>
ffffffffc0206c6c:	00009c97          	auipc	s9,0x9
ffffffffc0206c70:	e64c8c93          	addi	s9,s9,-412 # ffffffffc020fad0 <nbase>
ffffffffc0206c74:	00090a97          	auipc	s5,0x90
ffffffffc0206c78:	c3ca8a93          	addi	s5,s5,-964 # ffffffffc02968b0 <npage>
ffffffffc0206c7c:	fc4e                	sd	s3,56(sp)
ffffffffc0206c7e:	a899                	j	ffffffffc0206cd4 <do_execve+0x6c2>
ffffffffc0206c80:	6785                	lui	a5,0x1
ffffffffc0206c82:	00f48c33          	add	s8,s1,a5
ffffffffc0206c86:	41b40b33          	sub	s6,s0,s11
ffffffffc0206c8a:	01846463          	bltu	s0,s8,ffffffffc0206c92 <do_execve+0x680>
ffffffffc0206c8e:	41bc0b33          	sub	s6,s8,s11
ffffffffc0206c92:	000d3783          	ld	a5,0(s10)
ffffffffc0206c96:	000cb503          	ld	a0,0(s9)
ffffffffc0206c9a:	7702                	ld	a4,32(sp)
ffffffffc0206c9c:	40f987b3          	sub	a5,s3,a5
ffffffffc0206ca0:	8799                	srai	a5,a5,0x6
ffffffffc0206ca2:	000ab583          	ld	a1,0(s5)
ffffffffc0206ca6:	97aa                	add	a5,a5,a0
ffffffffc0206ca8:	00e7f533          	and	a0,a5,a4
ffffffffc0206cac:	07b2                	slli	a5,a5,0xc
ffffffffc0206cae:	0ab57d63          	bgeu	a0,a1,ffffffffc0206d68 <do_execve+0x756>
ffffffffc0206cb2:	00090597          	auipc	a1,0x90
ffffffffc0206cb6:	bf65b583          	ld	a1,-1034(a1) # ffffffffc02968a8 <va_pa_offset>
ffffffffc0206cba:	409d84b3          	sub	s1,s11,s1
ffffffffc0206cbe:	865a                	mv	a2,s6
ffffffffc0206cc0:	97ae                	add	a5,a5,a1
ffffffffc0206cc2:	00978533          	add	a0,a5,s1
ffffffffc0206cc6:	4581                	li	a1,0
ffffffffc0206cc8:	9dda                	add	s11,s11,s6
ffffffffc0206cca:	2c1040ef          	jal	ffffffffc020b78a <memset>
ffffffffc0206cce:	048dfe63          	bgeu	s11,s0,ffffffffc0206d2a <do_execve+0x718>
ffffffffc0206cd2:	84e2                	mv	s1,s8
ffffffffc0206cd4:	018a3503          	ld	a0,24(s4)
ffffffffc0206cd8:	865e                	mv	a2,s7
ffffffffc0206cda:	85a6                	mv	a1,s1
ffffffffc0206cdc:	f05fc0ef          	jal	ffffffffc0203be0 <pgdir_alloc_page>
ffffffffc0206ce0:	89aa                	mv	s3,a0
ffffffffc0206ce2:	fd59                	bnez	a0,ffffffffc0206c80 <do_execve+0x66e>
ffffffffc0206ce4:	79e2                	ld	s3,56(sp)
ffffffffc0206ce6:	6aa2                	ld	s5,8(sp)
ffffffffc0206ce8:	6b42                	ld	s6,16(sp)
ffffffffc0206cea:	54f1                	li	s1,-4
ffffffffc0206cec:	b111                	j	ffffffffc02068f0 <do_execve+0x2de>
ffffffffc0206cee:	040a0563          	beqz	s4,ffffffffc0206d38 <do_execve+0x726>
ffffffffc0206cf2:	038a0513          	addi	a0,s4,56
ffffffffc0206cf6:	949fd0ef          	jal	ffffffffc020463e <up>
ffffffffc0206cfa:	040a2823          	sw	zero,80(s4)
ffffffffc0206cfe:	23013403          	ld	s0,560(sp)
ffffffffc0206d02:	22013903          	ld	s2,544(sp)
ffffffffc0206d06:	21013a03          	ld	s4,528(sp)
ffffffffc0206d0a:	7d1e                	ld	s10,480(sp)
ffffffffc0206d0c:	54f5                	li	s1,-3
ffffffffc0206d0e:	be21                	j	ffffffffc0206826 <do_execve+0x214>
ffffffffc0206d10:	47dd                	li	a5,23
ffffffffc0206d12:	00376693          	ori	a3,a4,3
ffffffffc0206d16:	ec3e                	sd	a5,24(sp)
ffffffffc0206d18:	befd                	j	ffffffffc0206916 <do_execve+0x304>
ffffffffc0206d1a:	47c5                	li	a5,17
ffffffffc0206d1c:	86ba                	mv	a3,a4
ffffffffc0206d1e:	ec3e                	sd	a5,24(sp)
ffffffffc0206d20:	bedd                	j	ffffffffc0206916 <do_execve+0x304>
ffffffffc0206d22:	54f5                	li	s1,-3
ffffffffc0206d24:	ae0a11e3          	bnez	s4,ffffffffc0206806 <do_execve+0x1f4>
ffffffffc0206d28:	b4ed                	j	ffffffffc0206812 <do_execve+0x200>
ffffffffc0206d2a:	8bce                	mv	s7,s3
ffffffffc0206d2c:	79e2                	ld	s3,56(sp)
ffffffffc0206d2e:	b965                	j	ffffffffc02069e6 <do_execve+0x3d4>
ffffffffc0206d30:	6aa2                	ld	s5,8(sp)
ffffffffc0206d32:	6b42                	ld	s6,16(sp)
ffffffffc0206d34:	54e1                	li	s1,-8
ffffffffc0206d36:	be6d                	j	ffffffffc02068f0 <do_execve+0x2de>
ffffffffc0206d38:	23013403          	ld	s0,560(sp)
ffffffffc0206d3c:	22013903          	ld	s2,544(sp)
ffffffffc0206d40:	21013a03          	ld	s4,528(sp)
ffffffffc0206d44:	7d1e                	ld	s10,480(sp)
ffffffffc0206d46:	54f5                	li	s1,-3
ffffffffc0206d48:	bcf9                	j	ffffffffc0206826 <do_execve+0x214>
ffffffffc0206d4a:	84d6                	mv	s1,s5
ffffffffc0206d4c:	886e                	mv	a6,s11
ffffffffc0206d4e:	bd49                	j	ffffffffc0206be0 <do_execve+0x5ce>
ffffffffc0206d50:	00006617          	auipc	a2,0x6
ffffffffc0206d54:	a0060613          	addi	a2,a2,-1536 # ffffffffc020c750 <etext+0xf5e>
ffffffffc0206d58:	34100593          	li	a1,833
ffffffffc0206d5c:	00007517          	auipc	a0,0x7
ffffffffc0206d60:	8fc50513          	addi	a0,a0,-1796 # ffffffffc020d658 <etext+0x1e66>
ffffffffc0206d64:	ee6f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206d68:	86be                	mv	a3,a5
ffffffffc0206d6a:	00006617          	auipc	a2,0x6
ffffffffc0206d6e:	93e60613          	addi	a2,a2,-1730 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc0206d72:	07100593          	li	a1,113
ffffffffc0206d76:	00006517          	auipc	a0,0x6
ffffffffc0206d7a:	95a50513          	addi	a0,a0,-1702 # ffffffffc020c6d0 <etext+0xede>
ffffffffc0206d7e:	eccf90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206d82:	86a6                	mv	a3,s1
ffffffffc0206d84:	00006617          	auipc	a2,0x6
ffffffffc0206d88:	92460613          	addi	a2,a2,-1756 # ffffffffc020c6a8 <etext+0xeb6>
ffffffffc0206d8c:	07100593          	li	a1,113
ffffffffc0206d90:	00006517          	auipc	a0,0x6
ffffffffc0206d94:	94050513          	addi	a0,a0,-1728 # ffffffffc020c6d0 <etext+0xede>
ffffffffc0206d98:	eb2f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206d9c:	00007697          	auipc	a3,0x7
ffffffffc0206da0:	ad468693          	addi	a3,a3,-1324 # ffffffffc020d870 <etext+0x207e>
ffffffffc0206da4:	00005617          	auipc	a2,0x5
ffffffffc0206da8:	e8c60613          	addi	a2,a2,-372 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0206dac:	32500593          	li	a1,805
ffffffffc0206db0:	00007517          	auipc	a0,0x7
ffffffffc0206db4:	8a850513          	addi	a0,a0,-1880 # ffffffffc020d658 <etext+0x1e66>
ffffffffc0206db8:	e92f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206dbc:	00007697          	auipc	a3,0x7
ffffffffc0206dc0:	bcc68693          	addi	a3,a3,-1076 # ffffffffc020d988 <etext+0x2196>
ffffffffc0206dc4:	00005617          	auipc	a2,0x5
ffffffffc0206dc8:	e6c60613          	addi	a2,a2,-404 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0206dcc:	33d00593          	li	a1,829
ffffffffc0206dd0:	00007517          	auipc	a0,0x7
ffffffffc0206dd4:	88850513          	addi	a0,a0,-1912 # ffffffffc020d658 <etext+0x1e66>
ffffffffc0206dd8:	e72f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206ddc:	00007697          	auipc	a3,0x7
ffffffffc0206de0:	b6468693          	addi	a3,a3,-1180 # ffffffffc020d940 <etext+0x214e>
ffffffffc0206de4:	00005617          	auipc	a2,0x5
ffffffffc0206de8:	e4c60613          	addi	a2,a2,-436 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0206dec:	33c00593          	li	a1,828
ffffffffc0206df0:	00007517          	auipc	a0,0x7
ffffffffc0206df4:	86850513          	addi	a0,a0,-1944 # ffffffffc020d658 <etext+0x1e66>
ffffffffc0206df8:	e52f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206dfc:	00007697          	auipc	a3,0x7
ffffffffc0206e00:	afc68693          	addi	a3,a3,-1284 # ffffffffc020d8f8 <etext+0x2106>
ffffffffc0206e04:	00005617          	auipc	a2,0x5
ffffffffc0206e08:	e2c60613          	addi	a2,a2,-468 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0206e0c:	33b00593          	li	a1,827
ffffffffc0206e10:	00007517          	auipc	a0,0x7
ffffffffc0206e14:	84850513          	addi	a0,a0,-1976 # ffffffffc020d658 <etext+0x1e66>
ffffffffc0206e18:	e32f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206e1c:	00007697          	auipc	a3,0x7
ffffffffc0206e20:	a9468693          	addi	a3,a3,-1388 # ffffffffc020d8b0 <etext+0x20be>
ffffffffc0206e24:	00005617          	auipc	a2,0x5
ffffffffc0206e28:	e0c60613          	addi	a2,a2,-500 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0206e2c:	33a00593          	li	a1,826
ffffffffc0206e30:	00007517          	auipc	a0,0x7
ffffffffc0206e34:	82850513          	addi	a0,a0,-2008 # ffffffffc020d658 <etext+0x1e66>
ffffffffc0206e38:	e12f90ef          	jal	ffffffffc020044a <__panic>

ffffffffc0206e3c <user_main>:
ffffffffc0206e3c:	7179                	addi	sp,sp,-48
ffffffffc0206e3e:	e84a                	sd	s2,16(sp)
ffffffffc0206e40:	00090917          	auipc	s2,0x90
ffffffffc0206e44:	a8890913          	addi	s2,s2,-1400 # ffffffffc02968c8 <current>
ffffffffc0206e48:	00093783          	ld	a5,0(s2)
ffffffffc0206e4c:	00007617          	auipc	a2,0x7
ffffffffc0206e50:	b8460613          	addi	a2,a2,-1148 # ffffffffc020d9d0 <etext+0x21de>
ffffffffc0206e54:	00007517          	auipc	a0,0x7
ffffffffc0206e58:	b8450513          	addi	a0,a0,-1148 # ffffffffc020d9d8 <etext+0x21e6>
ffffffffc0206e5c:	43cc                	lw	a1,4(a5)
ffffffffc0206e5e:	f406                	sd	ra,40(sp)
ffffffffc0206e60:	f022                	sd	s0,32(sp)
ffffffffc0206e62:	ec26                	sd	s1,24(sp)
ffffffffc0206e64:	e402                	sd	zero,8(sp)
ffffffffc0206e66:	e032                	sd	a2,0(sp)
ffffffffc0206e68:	b3ef90ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0206e6c:	6782                	ld	a5,0(sp)
ffffffffc0206e6e:	cfb9                	beqz	a5,ffffffffc0206ecc <user_main+0x90>
ffffffffc0206e70:	003c                	addi	a5,sp,8
ffffffffc0206e72:	4401                	li	s0,0
ffffffffc0206e74:	6398                	ld	a4,0(a5)
ffffffffc0206e76:	07a1                	addi	a5,a5,8 # 1008 <_binary_bin_swap_img_size-0x6cf8>
ffffffffc0206e78:	0405                	addi	s0,s0,1
ffffffffc0206e7a:	ff6d                	bnez	a4,ffffffffc0206e74 <user_main+0x38>
ffffffffc0206e7c:	00093703          	ld	a4,0(s2)
ffffffffc0206e80:	6789                	lui	a5,0x2
ffffffffc0206e82:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0206e86:	6b04                	ld	s1,16(a4)
ffffffffc0206e88:	734c                	ld	a1,160(a4)
ffffffffc0206e8a:	12000613          	li	a2,288
ffffffffc0206e8e:	94be                	add	s1,s1,a5
ffffffffc0206e90:	8526                	mv	a0,s1
ffffffffc0206e92:	149040ef          	jal	ffffffffc020b7da <memcpy>
ffffffffc0206e96:	00093783          	ld	a5,0(s2)
ffffffffc0206e9a:	0004059b          	sext.w	a1,s0
ffffffffc0206e9e:	860a                	mv	a2,sp
ffffffffc0206ea0:	f3c4                	sd	s1,160(a5)
ffffffffc0206ea2:	00007517          	auipc	a0,0x7
ffffffffc0206ea6:	b2e50513          	addi	a0,a0,-1234 # ffffffffc020d9d0 <etext+0x21de>
ffffffffc0206eaa:	f68ff0ef          	jal	ffffffffc0206612 <do_execve>
ffffffffc0206eae:	8126                	mv	sp,s1
ffffffffc0206eb0:	b44fa06f          	j	ffffffffc02011f4 <__trapret>
ffffffffc0206eb4:	00007617          	auipc	a2,0x7
ffffffffc0206eb8:	b4c60613          	addi	a2,a2,-1204 # ffffffffc020da00 <etext+0x220e>
ffffffffc0206ebc:	47400593          	li	a1,1140
ffffffffc0206ec0:	00006517          	auipc	a0,0x6
ffffffffc0206ec4:	79850513          	addi	a0,a0,1944 # ffffffffc020d658 <etext+0x1e66>
ffffffffc0206ec8:	d82f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0206ecc:	4401                	li	s0,0
ffffffffc0206ece:	b77d                	j	ffffffffc0206e7c <user_main+0x40>

ffffffffc0206ed0 <do_yield>:
ffffffffc0206ed0:	00090797          	auipc	a5,0x90
ffffffffc0206ed4:	9f87b783          	ld	a5,-1544(a5) # ffffffffc02968c8 <current>
ffffffffc0206ed8:	4705                	li	a4,1
ffffffffc0206eda:	4501                	li	a0,0
ffffffffc0206edc:	ef98                	sd	a4,24(a5)
ffffffffc0206ede:	8082                	ret

ffffffffc0206ee0 <do_wait>:
ffffffffc0206ee0:	c59d                	beqz	a1,ffffffffc0206f0e <do_wait+0x2e>
ffffffffc0206ee2:	1101                	addi	sp,sp,-32
ffffffffc0206ee4:	e02a                	sd	a0,0(sp)
ffffffffc0206ee6:	00090517          	auipc	a0,0x90
ffffffffc0206eea:	9e253503          	ld	a0,-1566(a0) # ffffffffc02968c8 <current>
ffffffffc0206eee:	4685                	li	a3,1
ffffffffc0206ef0:	4611                	li	a2,4
ffffffffc0206ef2:	7508                	ld	a0,40(a0)
ffffffffc0206ef4:	ec06                	sd	ra,24(sp)
ffffffffc0206ef6:	e42e                	sd	a1,8(sp)
ffffffffc0206ef8:	c6afd0ef          	jal	ffffffffc0204362 <user_mem_check>
ffffffffc0206efc:	6702                	ld	a4,0(sp)
ffffffffc0206efe:	67a2                	ld	a5,8(sp)
ffffffffc0206f00:	c909                	beqz	a0,ffffffffc0206f12 <do_wait+0x32>
ffffffffc0206f02:	60e2                	ld	ra,24(sp)
ffffffffc0206f04:	85be                	mv	a1,a5
ffffffffc0206f06:	853a                	mv	a0,a4
ffffffffc0206f08:	6105                	addi	sp,sp,32
ffffffffc0206f0a:	bd6ff06f          	j	ffffffffc02062e0 <do_wait.part.0>
ffffffffc0206f0e:	bd2ff06f          	j	ffffffffc02062e0 <do_wait.part.0>
ffffffffc0206f12:	60e2                	ld	ra,24(sp)
ffffffffc0206f14:	5575                	li	a0,-3
ffffffffc0206f16:	6105                	addi	sp,sp,32
ffffffffc0206f18:	8082                	ret

ffffffffc0206f1a <do_kill>:
ffffffffc0206f1a:	6789                	lui	a5,0x2
ffffffffc0206f1c:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206f20:	17f9                	addi	a5,a5,-2 # 1ffe <_binary_bin_swap_img_size-0x5d02>
ffffffffc0206f22:	06e7e463          	bltu	a5,a4,ffffffffc0206f8a <do_kill+0x70>
ffffffffc0206f26:	1101                	addi	sp,sp,-32
ffffffffc0206f28:	45a9                	li	a1,10
ffffffffc0206f2a:	ec06                	sd	ra,24(sp)
ffffffffc0206f2c:	e42a                	sd	a0,8(sp)
ffffffffc0206f2e:	320040ef          	jal	ffffffffc020b24e <hash32>
ffffffffc0206f32:	02051793          	slli	a5,a0,0x20
ffffffffc0206f36:	01c7d693          	srli	a3,a5,0x1c
ffffffffc0206f3a:	0008b797          	auipc	a5,0x8b
ffffffffc0206f3e:	88678793          	addi	a5,a5,-1914 # ffffffffc02917c0 <hash_list>
ffffffffc0206f42:	96be                	add	a3,a3,a5
ffffffffc0206f44:	6622                	ld	a2,8(sp)
ffffffffc0206f46:	8536                	mv	a0,a3
ffffffffc0206f48:	a029                	j	ffffffffc0206f52 <do_kill+0x38>
ffffffffc0206f4a:	f2c52703          	lw	a4,-212(a0)
ffffffffc0206f4e:	00c70963          	beq	a4,a2,ffffffffc0206f60 <do_kill+0x46>
ffffffffc0206f52:	6508                	ld	a0,8(a0)
ffffffffc0206f54:	fea69be3          	bne	a3,a0,ffffffffc0206f4a <do_kill+0x30>
ffffffffc0206f58:	60e2                	ld	ra,24(sp)
ffffffffc0206f5a:	5575                	li	a0,-3
ffffffffc0206f5c:	6105                	addi	sp,sp,32
ffffffffc0206f5e:	8082                	ret
ffffffffc0206f60:	fd852703          	lw	a4,-40(a0)
ffffffffc0206f64:	00177693          	andi	a3,a4,1
ffffffffc0206f68:	e29d                	bnez	a3,ffffffffc0206f8e <do_kill+0x74>
ffffffffc0206f6a:	4954                	lw	a3,20(a0)
ffffffffc0206f6c:	00176713          	ori	a4,a4,1
ffffffffc0206f70:	fce52c23          	sw	a4,-40(a0)
ffffffffc0206f74:	0006c663          	bltz	a3,ffffffffc0206f80 <do_kill+0x66>
ffffffffc0206f78:	4501                	li	a0,0
ffffffffc0206f7a:	60e2                	ld	ra,24(sp)
ffffffffc0206f7c:	6105                	addi	sp,sp,32
ffffffffc0206f7e:	8082                	ret
ffffffffc0206f80:	f2850513          	addi	a0,a0,-216
ffffffffc0206f84:	454000ef          	jal	ffffffffc02073d8 <wakeup_proc>
ffffffffc0206f88:	bfc5                	j	ffffffffc0206f78 <do_kill+0x5e>
ffffffffc0206f8a:	5575                	li	a0,-3
ffffffffc0206f8c:	8082                	ret
ffffffffc0206f8e:	555d                	li	a0,-9
ffffffffc0206f90:	b7ed                	j	ffffffffc0206f7a <do_kill+0x60>

ffffffffc0206f92 <proc_init>:
ffffffffc0206f92:	1101                	addi	sp,sp,-32
ffffffffc0206f94:	e426                	sd	s1,8(sp)
ffffffffc0206f96:	0008f797          	auipc	a5,0x8f
ffffffffc0206f9a:	82a78793          	addi	a5,a5,-2006 # ffffffffc02957c0 <proc_list>
ffffffffc0206f9e:	ec06                	sd	ra,24(sp)
ffffffffc0206fa0:	e822                	sd	s0,16(sp)
ffffffffc0206fa2:	e04a                	sd	s2,0(sp)
ffffffffc0206fa4:	0008b497          	auipc	s1,0x8b
ffffffffc0206fa8:	81c48493          	addi	s1,s1,-2020 # ffffffffc02917c0 <hash_list>
ffffffffc0206fac:	e79c                	sd	a5,8(a5)
ffffffffc0206fae:	e39c                	sd	a5,0(a5)
ffffffffc0206fb0:	0008f717          	auipc	a4,0x8f
ffffffffc0206fb4:	81070713          	addi	a4,a4,-2032 # ffffffffc02957c0 <proc_list>
ffffffffc0206fb8:	87a6                	mv	a5,s1
ffffffffc0206fba:	e79c                	sd	a5,8(a5)
ffffffffc0206fbc:	e39c                	sd	a5,0(a5)
ffffffffc0206fbe:	07c1                	addi	a5,a5,16
ffffffffc0206fc0:	fee79de3          	bne	a5,a4,ffffffffc0206fba <proc_init+0x28>
ffffffffc0206fc4:	b4bfe0ef          	jal	ffffffffc0205b0e <alloc_proc>
ffffffffc0206fc8:	00090917          	auipc	s2,0x90
ffffffffc0206fcc:	91090913          	addi	s2,s2,-1776 # ffffffffc02968d8 <idleproc>
ffffffffc0206fd0:	00a93023          	sd	a0,0(s2)
ffffffffc0206fd4:	842a                	mv	s0,a0
ffffffffc0206fd6:	12050c63          	beqz	a0,ffffffffc020710e <proc_init+0x17c>
ffffffffc0206fda:	4689                	li	a3,2
ffffffffc0206fdc:	0000a717          	auipc	a4,0xa
ffffffffc0206fe0:	02470713          	addi	a4,a4,36 # ffffffffc0211000 <bootstack>
ffffffffc0206fe4:	4785                	li	a5,1
ffffffffc0206fe6:	e114                	sd	a3,0(a0)
ffffffffc0206fe8:	e918                	sd	a4,16(a0)
ffffffffc0206fea:	ed1c                	sd	a5,24(a0)
ffffffffc0206fec:	ad8fe0ef          	jal	ffffffffc02052c4 <files_create>
ffffffffc0206ff0:	14a43423          	sd	a0,328(s0)
ffffffffc0206ff4:	10050163          	beqz	a0,ffffffffc02070f6 <proc_init+0x164>
ffffffffc0206ff8:	00093403          	ld	s0,0(s2)
ffffffffc0206ffc:	4641                	li	a2,16
ffffffffc0206ffe:	4581                	li	a1,0
ffffffffc0207000:	14843703          	ld	a4,328(s0)
ffffffffc0207004:	0b440413          	addi	s0,s0,180
ffffffffc0207008:	8522                	mv	a0,s0
ffffffffc020700a:	4b1c                	lw	a5,16(a4)
ffffffffc020700c:	2785                	addiw	a5,a5,1
ffffffffc020700e:	cb1c                	sw	a5,16(a4)
ffffffffc0207010:	77a040ef          	jal	ffffffffc020b78a <memset>
ffffffffc0207014:	8522                	mv	a0,s0
ffffffffc0207016:	463d                	li	a2,15
ffffffffc0207018:	00007597          	auipc	a1,0x7
ffffffffc020701c:	a4858593          	addi	a1,a1,-1464 # ffffffffc020da60 <etext+0x226e>
ffffffffc0207020:	7ba040ef          	jal	ffffffffc020b7da <memcpy>
ffffffffc0207024:	00090797          	auipc	a5,0x90
ffffffffc0207028:	89c7a783          	lw	a5,-1892(a5) # ffffffffc02968c0 <nr_process>
ffffffffc020702c:	00093703          	ld	a4,0(s2)
ffffffffc0207030:	4601                	li	a2,0
ffffffffc0207032:	2785                	addiw	a5,a5,1
ffffffffc0207034:	4581                	li	a1,0
ffffffffc0207036:	fffff517          	auipc	a0,0xfffff
ffffffffc020703a:	48c50513          	addi	a0,a0,1164 # ffffffffc02064c2 <init_main>
ffffffffc020703e:	00090697          	auipc	a3,0x90
ffffffffc0207042:	88e6b523          	sd	a4,-1910(a3) # ffffffffc02968c8 <current>
ffffffffc0207046:	00090717          	auipc	a4,0x90
ffffffffc020704a:	86f72d23          	sw	a5,-1926(a4) # ffffffffc02968c0 <nr_process>
ffffffffc020704e:	8e2ff0ef          	jal	ffffffffc0206130 <kernel_thread>
ffffffffc0207052:	842a                	mv	s0,a0
ffffffffc0207054:	08a05563          	blez	a0,ffffffffc02070de <proc_init+0x14c>
ffffffffc0207058:	6789                	lui	a5,0x2
ffffffffc020705a:	17f9                	addi	a5,a5,-2 # 1ffe <_binary_bin_swap_img_size-0x5d02>
ffffffffc020705c:	fff5071b          	addiw	a4,a0,-1
ffffffffc0207060:	02e7e463          	bltu	a5,a4,ffffffffc0207088 <proc_init+0xf6>
ffffffffc0207064:	45a9                	li	a1,10
ffffffffc0207066:	1e8040ef          	jal	ffffffffc020b24e <hash32>
ffffffffc020706a:	02051713          	slli	a4,a0,0x20
ffffffffc020706e:	01c75793          	srli	a5,a4,0x1c
ffffffffc0207072:	00f486b3          	add	a3,s1,a5
ffffffffc0207076:	87b6                	mv	a5,a3
ffffffffc0207078:	a029                	j	ffffffffc0207082 <proc_init+0xf0>
ffffffffc020707a:	f2c7a703          	lw	a4,-212(a5)
ffffffffc020707e:	04870d63          	beq	a4,s0,ffffffffc02070d8 <proc_init+0x146>
ffffffffc0207082:	679c                	ld	a5,8(a5)
ffffffffc0207084:	fef69be3          	bne	a3,a5,ffffffffc020707a <proc_init+0xe8>
ffffffffc0207088:	4781                	li	a5,0
ffffffffc020708a:	0b478413          	addi	s0,a5,180
ffffffffc020708e:	4641                	li	a2,16
ffffffffc0207090:	4581                	li	a1,0
ffffffffc0207092:	8522                	mv	a0,s0
ffffffffc0207094:	00090717          	auipc	a4,0x90
ffffffffc0207098:	82f73e23          	sd	a5,-1988(a4) # ffffffffc02968d0 <initproc>
ffffffffc020709c:	6ee040ef          	jal	ffffffffc020b78a <memset>
ffffffffc02070a0:	8522                	mv	a0,s0
ffffffffc02070a2:	463d                	li	a2,15
ffffffffc02070a4:	00007597          	auipc	a1,0x7
ffffffffc02070a8:	9e458593          	addi	a1,a1,-1564 # ffffffffc020da88 <etext+0x2296>
ffffffffc02070ac:	72e040ef          	jal	ffffffffc020b7da <memcpy>
ffffffffc02070b0:	00093783          	ld	a5,0(s2)
ffffffffc02070b4:	cbc9                	beqz	a5,ffffffffc0207146 <proc_init+0x1b4>
ffffffffc02070b6:	43dc                	lw	a5,4(a5)
ffffffffc02070b8:	e7d9                	bnez	a5,ffffffffc0207146 <proc_init+0x1b4>
ffffffffc02070ba:	00090797          	auipc	a5,0x90
ffffffffc02070be:	8167b783          	ld	a5,-2026(a5) # ffffffffc02968d0 <initproc>
ffffffffc02070c2:	c3b5                	beqz	a5,ffffffffc0207126 <proc_init+0x194>
ffffffffc02070c4:	43d8                	lw	a4,4(a5)
ffffffffc02070c6:	4785                	li	a5,1
ffffffffc02070c8:	04f71f63          	bne	a4,a5,ffffffffc0207126 <proc_init+0x194>
ffffffffc02070cc:	60e2                	ld	ra,24(sp)
ffffffffc02070ce:	6442                	ld	s0,16(sp)
ffffffffc02070d0:	64a2                	ld	s1,8(sp)
ffffffffc02070d2:	6902                	ld	s2,0(sp)
ffffffffc02070d4:	6105                	addi	sp,sp,32
ffffffffc02070d6:	8082                	ret
ffffffffc02070d8:	f2878793          	addi	a5,a5,-216
ffffffffc02070dc:	b77d                	j	ffffffffc020708a <proc_init+0xf8>
ffffffffc02070de:	00007617          	auipc	a2,0x7
ffffffffc02070e2:	98a60613          	addi	a2,a2,-1654 # ffffffffc020da68 <etext+0x2276>
ffffffffc02070e6:	4c000593          	li	a1,1216
ffffffffc02070ea:	00006517          	auipc	a0,0x6
ffffffffc02070ee:	56e50513          	addi	a0,a0,1390 # ffffffffc020d658 <etext+0x1e66>
ffffffffc02070f2:	b58f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc02070f6:	00007617          	auipc	a2,0x7
ffffffffc02070fa:	94260613          	addi	a2,a2,-1726 # ffffffffc020da38 <etext+0x2246>
ffffffffc02070fe:	4b400593          	li	a1,1204
ffffffffc0207102:	00006517          	auipc	a0,0x6
ffffffffc0207106:	55650513          	addi	a0,a0,1366 # ffffffffc020d658 <etext+0x1e66>
ffffffffc020710a:	b40f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc020710e:	00007617          	auipc	a2,0x7
ffffffffc0207112:	91260613          	addi	a2,a2,-1774 # ffffffffc020da20 <etext+0x222e>
ffffffffc0207116:	4aa00593          	li	a1,1194
ffffffffc020711a:	00006517          	auipc	a0,0x6
ffffffffc020711e:	53e50513          	addi	a0,a0,1342 # ffffffffc020d658 <etext+0x1e66>
ffffffffc0207122:	b28f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207126:	00007697          	auipc	a3,0x7
ffffffffc020712a:	99268693          	addi	a3,a3,-1646 # ffffffffc020dab8 <etext+0x22c6>
ffffffffc020712e:	00005617          	auipc	a2,0x5
ffffffffc0207132:	b0260613          	addi	a2,a2,-1278 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207136:	4c700593          	li	a1,1223
ffffffffc020713a:	00006517          	auipc	a0,0x6
ffffffffc020713e:	51e50513          	addi	a0,a0,1310 # ffffffffc020d658 <etext+0x1e66>
ffffffffc0207142:	b08f90ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207146:	00007697          	auipc	a3,0x7
ffffffffc020714a:	94a68693          	addi	a3,a3,-1718 # ffffffffc020da90 <etext+0x229e>
ffffffffc020714e:	00005617          	auipc	a2,0x5
ffffffffc0207152:	ae260613          	addi	a2,a2,-1310 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207156:	4c600593          	li	a1,1222
ffffffffc020715a:	00006517          	auipc	a0,0x6
ffffffffc020715e:	4fe50513          	addi	a0,a0,1278 # ffffffffc020d658 <etext+0x1e66>
ffffffffc0207162:	ae8f90ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207166 <cpu_idle>:
ffffffffc0207166:	1141                	addi	sp,sp,-16
ffffffffc0207168:	e022                	sd	s0,0(sp)
ffffffffc020716a:	e406                	sd	ra,8(sp)
ffffffffc020716c:	0008f417          	auipc	s0,0x8f
ffffffffc0207170:	75c40413          	addi	s0,s0,1884 # ffffffffc02968c8 <current>
ffffffffc0207174:	6018                	ld	a4,0(s0)
ffffffffc0207176:	6f1c                	ld	a5,24(a4)
ffffffffc0207178:	dffd                	beqz	a5,ffffffffc0207176 <cpu_idle+0x10>
ffffffffc020717a:	356000ef          	jal	ffffffffc02074d0 <schedule>
ffffffffc020717e:	bfdd                	j	ffffffffc0207174 <cpu_idle+0xe>

ffffffffc0207180 <lab6_set_priority>:
ffffffffc0207180:	1101                	addi	sp,sp,-32
ffffffffc0207182:	85aa                	mv	a1,a0
ffffffffc0207184:	e42a                	sd	a0,8(sp)
ffffffffc0207186:	00007517          	auipc	a0,0x7
ffffffffc020718a:	95a50513          	addi	a0,a0,-1702 # ffffffffc020dae0 <etext+0x22ee>
ffffffffc020718e:	ec06                	sd	ra,24(sp)
ffffffffc0207190:	816f90ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0207194:	65a2                	ld	a1,8(sp)
ffffffffc0207196:	0008f717          	auipc	a4,0x8f
ffffffffc020719a:	73273703          	ld	a4,1842(a4) # ffffffffc02968c8 <current>
ffffffffc020719e:	4785                	li	a5,1
ffffffffc02071a0:	c191                	beqz	a1,ffffffffc02071a4 <lab6_set_priority+0x24>
ffffffffc02071a2:	87ae                	mv	a5,a1
ffffffffc02071a4:	60e2                	ld	ra,24(sp)
ffffffffc02071a6:	14f72223          	sw	a5,324(a4)
ffffffffc02071aa:	6105                	addi	sp,sp,32
ffffffffc02071ac:	8082                	ret

ffffffffc02071ae <do_sleep>:
ffffffffc02071ae:	c531                	beqz	a0,ffffffffc02071fa <do_sleep+0x4c>
ffffffffc02071b0:	7139                	addi	sp,sp,-64
ffffffffc02071b2:	fc06                	sd	ra,56(sp)
ffffffffc02071b4:	f822                	sd	s0,48(sp)
ffffffffc02071b6:	100027f3          	csrr	a5,sstatus
ffffffffc02071ba:	8b89                	andi	a5,a5,2
ffffffffc02071bc:	e3a9                	bnez	a5,ffffffffc02071fe <do_sleep+0x50>
ffffffffc02071be:	0008f797          	auipc	a5,0x8f
ffffffffc02071c2:	70a7b783          	ld	a5,1802(a5) # ffffffffc02968c8 <current>
ffffffffc02071c6:	1014                	addi	a3,sp,32
ffffffffc02071c8:	80000737          	lui	a4,0x80000
ffffffffc02071cc:	c82a                	sw	a0,16(sp)
ffffffffc02071ce:	f436                	sd	a3,40(sp)
ffffffffc02071d0:	f036                	sd	a3,32(sp)
ffffffffc02071d2:	ec3e                	sd	a5,24(sp)
ffffffffc02071d4:	4685                	li	a3,1
ffffffffc02071d6:	0709                	addi	a4,a4,2 # ffffffff80000002 <_binary_bin_sfs_img_size+0xffffffff7ff8ad02>
ffffffffc02071d8:	0808                	addi	a0,sp,16
ffffffffc02071da:	c394                	sw	a3,0(a5)
ffffffffc02071dc:	0ee7a623          	sw	a4,236(a5)
ffffffffc02071e0:	842a                	mv	s0,a0
ffffffffc02071e2:	3a4000ef          	jal	ffffffffc0207586 <add_timer>
ffffffffc02071e6:	2ea000ef          	jal	ffffffffc02074d0 <schedule>
ffffffffc02071ea:	8522                	mv	a0,s0
ffffffffc02071ec:	460000ef          	jal	ffffffffc020764c <del_timer>
ffffffffc02071f0:	70e2                	ld	ra,56(sp)
ffffffffc02071f2:	7442                	ld	s0,48(sp)
ffffffffc02071f4:	4501                	li	a0,0
ffffffffc02071f6:	6121                	addi	sp,sp,64
ffffffffc02071f8:	8082                	ret
ffffffffc02071fa:	4501                	li	a0,0
ffffffffc02071fc:	8082                	ret
ffffffffc02071fe:	e42a                	sd	a0,8(sp)
ffffffffc0207200:	9d9f90ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0207204:	0008f797          	auipc	a5,0x8f
ffffffffc0207208:	6c47b783          	ld	a5,1732(a5) # ffffffffc02968c8 <current>
ffffffffc020720c:	6522                	ld	a0,8(sp)
ffffffffc020720e:	1014                	addi	a3,sp,32
ffffffffc0207210:	80000737          	lui	a4,0x80000
ffffffffc0207214:	c82a                	sw	a0,16(sp)
ffffffffc0207216:	f436                	sd	a3,40(sp)
ffffffffc0207218:	f036                	sd	a3,32(sp)
ffffffffc020721a:	ec3e                	sd	a5,24(sp)
ffffffffc020721c:	4685                	li	a3,1
ffffffffc020721e:	0709                	addi	a4,a4,2 # ffffffff80000002 <_binary_bin_sfs_img_size+0xffffffff7ff8ad02>
ffffffffc0207220:	0808                	addi	a0,sp,16
ffffffffc0207222:	c394                	sw	a3,0(a5)
ffffffffc0207224:	0ee7a623          	sw	a4,236(a5)
ffffffffc0207228:	842a                	mv	s0,a0
ffffffffc020722a:	35c000ef          	jal	ffffffffc0207586 <add_timer>
ffffffffc020722e:	9a5f90ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0207232:	bf55                	j	ffffffffc02071e6 <do_sleep+0x38>

ffffffffc0207234 <switch_to>:
ffffffffc0207234:	00153023          	sd	ra,0(a0)
ffffffffc0207238:	00253423          	sd	sp,8(a0)
ffffffffc020723c:	e900                	sd	s0,16(a0)
ffffffffc020723e:	ed04                	sd	s1,24(a0)
ffffffffc0207240:	03253023          	sd	s2,32(a0)
ffffffffc0207244:	03353423          	sd	s3,40(a0)
ffffffffc0207248:	03453823          	sd	s4,48(a0)
ffffffffc020724c:	03553c23          	sd	s5,56(a0)
ffffffffc0207250:	05653023          	sd	s6,64(a0)
ffffffffc0207254:	05753423          	sd	s7,72(a0)
ffffffffc0207258:	05853823          	sd	s8,80(a0)
ffffffffc020725c:	05953c23          	sd	s9,88(a0)
ffffffffc0207260:	07a53023          	sd	s10,96(a0)
ffffffffc0207264:	07b53423          	sd	s11,104(a0)
ffffffffc0207268:	0005b083          	ld	ra,0(a1)
ffffffffc020726c:	0085b103          	ld	sp,8(a1)
ffffffffc0207270:	6980                	ld	s0,16(a1)
ffffffffc0207272:	6d84                	ld	s1,24(a1)
ffffffffc0207274:	0205b903          	ld	s2,32(a1)
ffffffffc0207278:	0285b983          	ld	s3,40(a1)
ffffffffc020727c:	0305ba03          	ld	s4,48(a1)
ffffffffc0207280:	0385ba83          	ld	s5,56(a1)
ffffffffc0207284:	0405bb03          	ld	s6,64(a1)
ffffffffc0207288:	0485bb83          	ld	s7,72(a1)
ffffffffc020728c:	0505bc03          	ld	s8,80(a1)
ffffffffc0207290:	0585bc83          	ld	s9,88(a1)
ffffffffc0207294:	0605bd03          	ld	s10,96(a1)
ffffffffc0207298:	0685bd83          	ld	s11,104(a1)
ffffffffc020729c:	8082                	ret

ffffffffc020729e <RR_init>:
ffffffffc020729e:	e508                	sd	a0,8(a0)
ffffffffc02072a0:	e108                	sd	a0,0(a0)
ffffffffc02072a2:	00052823          	sw	zero,16(a0)
ffffffffc02072a6:	8082                	ret

ffffffffc02072a8 <RR_pick_next>:
ffffffffc02072a8:	651c                	ld	a5,8(a0)
ffffffffc02072aa:	00f50563          	beq	a0,a5,ffffffffc02072b4 <RR_pick_next+0xc>
ffffffffc02072ae:	ef078513          	addi	a0,a5,-272
ffffffffc02072b2:	8082                	ret
ffffffffc02072b4:	4501                	li	a0,0
ffffffffc02072b6:	8082                	ret

ffffffffc02072b8 <RR_proc_tick>:
ffffffffc02072b8:	1205a783          	lw	a5,288(a1)
ffffffffc02072bc:	00f05563          	blez	a5,ffffffffc02072c6 <RR_proc_tick+0xe>
ffffffffc02072c0:	37fd                	addiw	a5,a5,-1
ffffffffc02072c2:	12f5a023          	sw	a5,288(a1)
ffffffffc02072c6:	e399                	bnez	a5,ffffffffc02072cc <RR_proc_tick+0x14>
ffffffffc02072c8:	4785                	li	a5,1
ffffffffc02072ca:	ed9c                	sd	a5,24(a1)
ffffffffc02072cc:	8082                	ret

ffffffffc02072ce <RR_dequeue>:
ffffffffc02072ce:	1185b703          	ld	a4,280(a1)
ffffffffc02072d2:	11058793          	addi	a5,a1,272
ffffffffc02072d6:	02e78263          	beq	a5,a4,ffffffffc02072fa <RR_dequeue+0x2c>
ffffffffc02072da:	1085b683          	ld	a3,264(a1)
ffffffffc02072de:	00a69e63          	bne	a3,a0,ffffffffc02072fa <RR_dequeue+0x2c>
ffffffffc02072e2:	1105b503          	ld	a0,272(a1)
ffffffffc02072e6:	4a90                	lw	a2,16(a3)
ffffffffc02072e8:	e518                	sd	a4,8(a0)
ffffffffc02072ea:	e308                	sd	a0,0(a4)
ffffffffc02072ec:	10f5bc23          	sd	a5,280(a1)
ffffffffc02072f0:	10f5b823          	sd	a5,272(a1)
ffffffffc02072f4:	367d                	addiw	a2,a2,-1
ffffffffc02072f6:	ca90                	sw	a2,16(a3)
ffffffffc02072f8:	8082                	ret
ffffffffc02072fa:	1141                	addi	sp,sp,-16
ffffffffc02072fc:	00006697          	auipc	a3,0x6
ffffffffc0207300:	7fc68693          	addi	a3,a3,2044 # ffffffffc020daf8 <etext+0x2306>
ffffffffc0207304:	00005617          	auipc	a2,0x5
ffffffffc0207308:	92c60613          	addi	a2,a2,-1748 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020730c:	03c00593          	li	a1,60
ffffffffc0207310:	00007517          	auipc	a0,0x7
ffffffffc0207314:	82050513          	addi	a0,a0,-2016 # ffffffffc020db30 <etext+0x233e>
ffffffffc0207318:	e406                	sd	ra,8(sp)
ffffffffc020731a:	930f90ef          	jal	ffffffffc020044a <__panic>

ffffffffc020731e <RR_enqueue>:
ffffffffc020731e:	1185b703          	ld	a4,280(a1)
ffffffffc0207322:	11058793          	addi	a5,a1,272
ffffffffc0207326:	02e79d63          	bne	a5,a4,ffffffffc0207360 <RR_enqueue+0x42>
ffffffffc020732a:	6118                	ld	a4,0(a0)
ffffffffc020732c:	1205a683          	lw	a3,288(a1)
ffffffffc0207330:	e11c                	sd	a5,0(a0)
ffffffffc0207332:	e71c                	sd	a5,8(a4)
ffffffffc0207334:	10e5b823          	sd	a4,272(a1)
ffffffffc0207338:	10a5bc23          	sd	a0,280(a1)
ffffffffc020733c:	495c                	lw	a5,20(a0)
ffffffffc020733e:	ea89                	bnez	a3,ffffffffc0207350 <RR_enqueue+0x32>
ffffffffc0207340:	12f5a023          	sw	a5,288(a1)
ffffffffc0207344:	491c                	lw	a5,16(a0)
ffffffffc0207346:	10a5b423          	sd	a0,264(a1)
ffffffffc020734a:	2785                	addiw	a5,a5,1
ffffffffc020734c:	c91c                	sw	a5,16(a0)
ffffffffc020734e:	8082                	ret
ffffffffc0207350:	fed7c8e3          	blt	a5,a3,ffffffffc0207340 <RR_enqueue+0x22>
ffffffffc0207354:	491c                	lw	a5,16(a0)
ffffffffc0207356:	10a5b423          	sd	a0,264(a1)
ffffffffc020735a:	2785                	addiw	a5,a5,1
ffffffffc020735c:	c91c                	sw	a5,16(a0)
ffffffffc020735e:	8082                	ret
ffffffffc0207360:	1141                	addi	sp,sp,-16
ffffffffc0207362:	00006697          	auipc	a3,0x6
ffffffffc0207366:	7ee68693          	addi	a3,a3,2030 # ffffffffc020db50 <etext+0x235e>
ffffffffc020736a:	00005617          	auipc	a2,0x5
ffffffffc020736e:	8c660613          	addi	a2,a2,-1850 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207372:	02800593          	li	a1,40
ffffffffc0207376:	00006517          	auipc	a0,0x6
ffffffffc020737a:	7ba50513          	addi	a0,a0,1978 # ffffffffc020db30 <etext+0x233e>
ffffffffc020737e:	e406                	sd	ra,8(sp)
ffffffffc0207380:	8caf90ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207384 <sched_init>:
ffffffffc0207384:	0008a797          	auipc	a5,0x8a
ffffffffc0207388:	c9c78793          	addi	a5,a5,-868 # ffffffffc0291020 <default_sched_class>
ffffffffc020738c:	1141                	addi	sp,sp,-16
ffffffffc020738e:	6794                	ld	a3,8(a5)
ffffffffc0207390:	0008f717          	auipc	a4,0x8f
ffffffffc0207394:	54f73c23          	sd	a5,1368(a4) # ffffffffc02968e8 <sched_class>
ffffffffc0207398:	e406                	sd	ra,8(sp)
ffffffffc020739a:	0008e797          	auipc	a5,0x8e
ffffffffc020739e:	45678793          	addi	a5,a5,1110 # ffffffffc02957f0 <timer_list>
ffffffffc02073a2:	0008e717          	auipc	a4,0x8e
ffffffffc02073a6:	42e70713          	addi	a4,a4,1070 # ffffffffc02957d0 <__rq>
ffffffffc02073aa:	4615                	li	a2,5
ffffffffc02073ac:	e79c                	sd	a5,8(a5)
ffffffffc02073ae:	e39c                	sd	a5,0(a5)
ffffffffc02073b0:	853a                	mv	a0,a4
ffffffffc02073b2:	cb50                	sw	a2,20(a4)
ffffffffc02073b4:	0008f797          	auipc	a5,0x8f
ffffffffc02073b8:	52e7b623          	sd	a4,1324(a5) # ffffffffc02968e0 <rq>
ffffffffc02073bc:	9682                	jalr	a3
ffffffffc02073be:	0008f797          	auipc	a5,0x8f
ffffffffc02073c2:	52a7b783          	ld	a5,1322(a5) # ffffffffc02968e8 <sched_class>
ffffffffc02073c6:	60a2                	ld	ra,8(sp)
ffffffffc02073c8:	00006517          	auipc	a0,0x6
ffffffffc02073cc:	7b850513          	addi	a0,a0,1976 # ffffffffc020db80 <etext+0x238e>
ffffffffc02073d0:	638c                	ld	a1,0(a5)
ffffffffc02073d2:	0141                	addi	sp,sp,16
ffffffffc02073d4:	dd3f806f          	j	ffffffffc02001a6 <cprintf>

ffffffffc02073d8 <wakeup_proc>:
ffffffffc02073d8:	4118                	lw	a4,0(a0)
ffffffffc02073da:	1101                	addi	sp,sp,-32
ffffffffc02073dc:	ec06                	sd	ra,24(sp)
ffffffffc02073de:	478d                	li	a5,3
ffffffffc02073e0:	0cf70863          	beq	a4,a5,ffffffffc02074b0 <wakeup_proc+0xd8>
ffffffffc02073e4:	85aa                	mv	a1,a0
ffffffffc02073e6:	100027f3          	csrr	a5,sstatus
ffffffffc02073ea:	8b89                	andi	a5,a5,2
ffffffffc02073ec:	e3b1                	bnez	a5,ffffffffc0207430 <wakeup_proc+0x58>
ffffffffc02073ee:	4789                	li	a5,2
ffffffffc02073f0:	08f70563          	beq	a4,a5,ffffffffc020747a <wakeup_proc+0xa2>
ffffffffc02073f4:	0008f717          	auipc	a4,0x8f
ffffffffc02073f8:	4d473703          	ld	a4,1236(a4) # ffffffffc02968c8 <current>
ffffffffc02073fc:	0e052623          	sw	zero,236(a0)
ffffffffc0207400:	c11c                	sw	a5,0(a0)
ffffffffc0207402:	02e50463          	beq	a0,a4,ffffffffc020742a <wakeup_proc+0x52>
ffffffffc0207406:	0008f797          	auipc	a5,0x8f
ffffffffc020740a:	4d27b783          	ld	a5,1234(a5) # ffffffffc02968d8 <idleproc>
ffffffffc020740e:	00f50e63          	beq	a0,a5,ffffffffc020742a <wakeup_proc+0x52>
ffffffffc0207412:	0008f797          	auipc	a5,0x8f
ffffffffc0207416:	4d67b783          	ld	a5,1238(a5) # ffffffffc02968e8 <sched_class>
ffffffffc020741a:	60e2                	ld	ra,24(sp)
ffffffffc020741c:	0008f517          	auipc	a0,0x8f
ffffffffc0207420:	4c453503          	ld	a0,1220(a0) # ffffffffc02968e0 <rq>
ffffffffc0207424:	6b9c                	ld	a5,16(a5)
ffffffffc0207426:	6105                	addi	sp,sp,32
ffffffffc0207428:	8782                	jr	a5
ffffffffc020742a:	60e2                	ld	ra,24(sp)
ffffffffc020742c:	6105                	addi	sp,sp,32
ffffffffc020742e:	8082                	ret
ffffffffc0207430:	e42a                	sd	a0,8(sp)
ffffffffc0207432:	fa6f90ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0207436:	65a2                	ld	a1,8(sp)
ffffffffc0207438:	4789                	li	a5,2
ffffffffc020743a:	4198                	lw	a4,0(a1)
ffffffffc020743c:	04f70d63          	beq	a4,a5,ffffffffc0207496 <wakeup_proc+0xbe>
ffffffffc0207440:	0008f717          	auipc	a4,0x8f
ffffffffc0207444:	48873703          	ld	a4,1160(a4) # ffffffffc02968c8 <current>
ffffffffc0207448:	0e05a623          	sw	zero,236(a1)
ffffffffc020744c:	c19c                	sw	a5,0(a1)
ffffffffc020744e:	02e58263          	beq	a1,a4,ffffffffc0207472 <wakeup_proc+0x9a>
ffffffffc0207452:	0008f797          	auipc	a5,0x8f
ffffffffc0207456:	4867b783          	ld	a5,1158(a5) # ffffffffc02968d8 <idleproc>
ffffffffc020745a:	00f58c63          	beq	a1,a5,ffffffffc0207472 <wakeup_proc+0x9a>
ffffffffc020745e:	0008f797          	auipc	a5,0x8f
ffffffffc0207462:	48a7b783          	ld	a5,1162(a5) # ffffffffc02968e8 <sched_class>
ffffffffc0207466:	0008f517          	auipc	a0,0x8f
ffffffffc020746a:	47a53503          	ld	a0,1146(a0) # ffffffffc02968e0 <rq>
ffffffffc020746e:	6b9c                	ld	a5,16(a5)
ffffffffc0207470:	9782                	jalr	a5
ffffffffc0207472:	60e2                	ld	ra,24(sp)
ffffffffc0207474:	6105                	addi	sp,sp,32
ffffffffc0207476:	f5cf906f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc020747a:	60e2                	ld	ra,24(sp)
ffffffffc020747c:	00006617          	auipc	a2,0x6
ffffffffc0207480:	75460613          	addi	a2,a2,1876 # ffffffffc020dbd0 <etext+0x23de>
ffffffffc0207484:	05200593          	li	a1,82
ffffffffc0207488:	00006517          	auipc	a0,0x6
ffffffffc020748c:	73050513          	addi	a0,a0,1840 # ffffffffc020dbb8 <etext+0x23c6>
ffffffffc0207490:	6105                	addi	sp,sp,32
ffffffffc0207492:	822f906f          	j	ffffffffc02004b4 <__warn>
ffffffffc0207496:	00006617          	auipc	a2,0x6
ffffffffc020749a:	73a60613          	addi	a2,a2,1850 # ffffffffc020dbd0 <etext+0x23de>
ffffffffc020749e:	05200593          	li	a1,82
ffffffffc02074a2:	00006517          	auipc	a0,0x6
ffffffffc02074a6:	71650513          	addi	a0,a0,1814 # ffffffffc020dbb8 <etext+0x23c6>
ffffffffc02074aa:	80af90ef          	jal	ffffffffc02004b4 <__warn>
ffffffffc02074ae:	b7d1                	j	ffffffffc0207472 <wakeup_proc+0x9a>
ffffffffc02074b0:	00006697          	auipc	a3,0x6
ffffffffc02074b4:	6e868693          	addi	a3,a3,1768 # ffffffffc020db98 <etext+0x23a6>
ffffffffc02074b8:	00004617          	auipc	a2,0x4
ffffffffc02074bc:	77860613          	addi	a2,a2,1912 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02074c0:	04300593          	li	a1,67
ffffffffc02074c4:	00006517          	auipc	a0,0x6
ffffffffc02074c8:	6f450513          	addi	a0,a0,1780 # ffffffffc020dbb8 <etext+0x23c6>
ffffffffc02074cc:	f7ff80ef          	jal	ffffffffc020044a <__panic>

ffffffffc02074d0 <schedule>:
ffffffffc02074d0:	7139                	addi	sp,sp,-64
ffffffffc02074d2:	fc06                	sd	ra,56(sp)
ffffffffc02074d4:	f822                	sd	s0,48(sp)
ffffffffc02074d6:	f426                	sd	s1,40(sp)
ffffffffc02074d8:	f04a                	sd	s2,32(sp)
ffffffffc02074da:	ec4e                	sd	s3,24(sp)
ffffffffc02074dc:	100027f3          	csrr	a5,sstatus
ffffffffc02074e0:	8b89                	andi	a5,a5,2
ffffffffc02074e2:	4981                	li	s3,0
ffffffffc02074e4:	efc9                	bnez	a5,ffffffffc020757e <schedule+0xae>
ffffffffc02074e6:	0008f417          	auipc	s0,0x8f
ffffffffc02074ea:	3e240413          	addi	s0,s0,994 # ffffffffc02968c8 <current>
ffffffffc02074ee:	600c                	ld	a1,0(s0)
ffffffffc02074f0:	4789                	li	a5,2
ffffffffc02074f2:	0008f497          	auipc	s1,0x8f
ffffffffc02074f6:	3ee48493          	addi	s1,s1,1006 # ffffffffc02968e0 <rq>
ffffffffc02074fa:	4198                	lw	a4,0(a1)
ffffffffc02074fc:	0005bc23          	sd	zero,24(a1)
ffffffffc0207500:	0008f917          	auipc	s2,0x8f
ffffffffc0207504:	3e890913          	addi	s2,s2,1000 # ffffffffc02968e8 <sched_class>
ffffffffc0207508:	04f70f63          	beq	a4,a5,ffffffffc0207566 <schedule+0x96>
ffffffffc020750c:	00093783          	ld	a5,0(s2)
ffffffffc0207510:	6088                	ld	a0,0(s1)
ffffffffc0207512:	739c                	ld	a5,32(a5)
ffffffffc0207514:	9782                	jalr	a5
ffffffffc0207516:	85aa                	mv	a1,a0
ffffffffc0207518:	c131                	beqz	a0,ffffffffc020755c <schedule+0x8c>
ffffffffc020751a:	00093783          	ld	a5,0(s2)
ffffffffc020751e:	6088                	ld	a0,0(s1)
ffffffffc0207520:	e42e                	sd	a1,8(sp)
ffffffffc0207522:	6f9c                	ld	a5,24(a5)
ffffffffc0207524:	9782                	jalr	a5
ffffffffc0207526:	65a2                	ld	a1,8(sp)
ffffffffc0207528:	459c                	lw	a5,8(a1)
ffffffffc020752a:	6018                	ld	a4,0(s0)
ffffffffc020752c:	2785                	addiw	a5,a5,1
ffffffffc020752e:	c59c                	sw	a5,8(a1)
ffffffffc0207530:	00b70563          	beq	a4,a1,ffffffffc020753a <schedule+0x6a>
ffffffffc0207534:	852e                	mv	a0,a1
ffffffffc0207536:	f7cfe0ef          	jal	ffffffffc0205cb2 <proc_run>
ffffffffc020753a:	00099963          	bnez	s3,ffffffffc020754c <schedule+0x7c>
ffffffffc020753e:	70e2                	ld	ra,56(sp)
ffffffffc0207540:	7442                	ld	s0,48(sp)
ffffffffc0207542:	74a2                	ld	s1,40(sp)
ffffffffc0207544:	7902                	ld	s2,32(sp)
ffffffffc0207546:	69e2                	ld	s3,24(sp)
ffffffffc0207548:	6121                	addi	sp,sp,64
ffffffffc020754a:	8082                	ret
ffffffffc020754c:	7442                	ld	s0,48(sp)
ffffffffc020754e:	70e2                	ld	ra,56(sp)
ffffffffc0207550:	74a2                	ld	s1,40(sp)
ffffffffc0207552:	7902                	ld	s2,32(sp)
ffffffffc0207554:	69e2                	ld	s3,24(sp)
ffffffffc0207556:	6121                	addi	sp,sp,64
ffffffffc0207558:	e7af906f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc020755c:	0008f597          	auipc	a1,0x8f
ffffffffc0207560:	37c5b583          	ld	a1,892(a1) # ffffffffc02968d8 <idleproc>
ffffffffc0207564:	b7d1                	j	ffffffffc0207528 <schedule+0x58>
ffffffffc0207566:	0008f797          	auipc	a5,0x8f
ffffffffc020756a:	3727b783          	ld	a5,882(a5) # ffffffffc02968d8 <idleproc>
ffffffffc020756e:	f8f58fe3          	beq	a1,a5,ffffffffc020750c <schedule+0x3c>
ffffffffc0207572:	00093783          	ld	a5,0(s2)
ffffffffc0207576:	6088                	ld	a0,0(s1)
ffffffffc0207578:	6b9c                	ld	a5,16(a5)
ffffffffc020757a:	9782                	jalr	a5
ffffffffc020757c:	bf41                	j	ffffffffc020750c <schedule+0x3c>
ffffffffc020757e:	e5af90ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0207582:	4985                	li	s3,1
ffffffffc0207584:	b78d                	j	ffffffffc02074e6 <schedule+0x16>

ffffffffc0207586 <add_timer>:
ffffffffc0207586:	1101                	addi	sp,sp,-32
ffffffffc0207588:	ec06                	sd	ra,24(sp)
ffffffffc020758a:	100027f3          	csrr	a5,sstatus
ffffffffc020758e:	8b89                	andi	a5,a5,2
ffffffffc0207590:	4801                	li	a6,0
ffffffffc0207592:	e7bd                	bnez	a5,ffffffffc0207600 <add_timer+0x7a>
ffffffffc0207594:	4118                	lw	a4,0(a0)
ffffffffc0207596:	cb3d                	beqz	a4,ffffffffc020760c <add_timer+0x86>
ffffffffc0207598:	651c                	ld	a5,8(a0)
ffffffffc020759a:	cbad                	beqz	a5,ffffffffc020760c <add_timer+0x86>
ffffffffc020759c:	6d1c                	ld	a5,24(a0)
ffffffffc020759e:	01050593          	addi	a1,a0,16
ffffffffc02075a2:	08f59563          	bne	a1,a5,ffffffffc020762c <add_timer+0xa6>
ffffffffc02075a6:	0008e617          	auipc	a2,0x8e
ffffffffc02075aa:	24a60613          	addi	a2,a2,586 # ffffffffc02957f0 <timer_list>
ffffffffc02075ae:	661c                	ld	a5,8(a2)
ffffffffc02075b0:	00c79863          	bne	a5,a2,ffffffffc02075c0 <add_timer+0x3a>
ffffffffc02075b4:	a805                	j	ffffffffc02075e4 <add_timer+0x5e>
ffffffffc02075b6:	679c                	ld	a5,8(a5)
ffffffffc02075b8:	9f15                	subw	a4,a4,a3
ffffffffc02075ba:	c118                	sw	a4,0(a0)
ffffffffc02075bc:	02c78463          	beq	a5,a2,ffffffffc02075e4 <add_timer+0x5e>
ffffffffc02075c0:	ff07a683          	lw	a3,-16(a5)
ffffffffc02075c4:	fed779e3          	bgeu	a4,a3,ffffffffc02075b6 <add_timer+0x30>
ffffffffc02075c8:	9e99                	subw	a3,a3,a4
ffffffffc02075ca:	6398                	ld	a4,0(a5)
ffffffffc02075cc:	fed7a823          	sw	a3,-16(a5)
ffffffffc02075d0:	e38c                	sd	a1,0(a5)
ffffffffc02075d2:	e70c                	sd	a1,8(a4)
ffffffffc02075d4:	e918                	sd	a4,16(a0)
ffffffffc02075d6:	ed1c                	sd	a5,24(a0)
ffffffffc02075d8:	02080163          	beqz	a6,ffffffffc02075fa <add_timer+0x74>
ffffffffc02075dc:	60e2                	ld	ra,24(sp)
ffffffffc02075de:	6105                	addi	sp,sp,32
ffffffffc02075e0:	df2f906f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc02075e4:	0008e797          	auipc	a5,0x8e
ffffffffc02075e8:	20c78793          	addi	a5,a5,524 # ffffffffc02957f0 <timer_list>
ffffffffc02075ec:	6398                	ld	a4,0(a5)
ffffffffc02075ee:	e38c                	sd	a1,0(a5)
ffffffffc02075f0:	e70c                	sd	a1,8(a4)
ffffffffc02075f2:	e918                	sd	a4,16(a0)
ffffffffc02075f4:	ed1c                	sd	a5,24(a0)
ffffffffc02075f6:	fe0813e3          	bnez	a6,ffffffffc02075dc <add_timer+0x56>
ffffffffc02075fa:	60e2                	ld	ra,24(sp)
ffffffffc02075fc:	6105                	addi	sp,sp,32
ffffffffc02075fe:	8082                	ret
ffffffffc0207600:	e42a                	sd	a0,8(sp)
ffffffffc0207602:	dd6f90ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0207606:	6522                	ld	a0,8(sp)
ffffffffc0207608:	4805                	li	a6,1
ffffffffc020760a:	b769                	j	ffffffffc0207594 <add_timer+0xe>
ffffffffc020760c:	00006697          	auipc	a3,0x6
ffffffffc0207610:	5e468693          	addi	a3,a3,1508 # ffffffffc020dbf0 <etext+0x23fe>
ffffffffc0207614:	00004617          	auipc	a2,0x4
ffffffffc0207618:	61c60613          	addi	a2,a2,1564 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020761c:	07a00593          	li	a1,122
ffffffffc0207620:	00006517          	auipc	a0,0x6
ffffffffc0207624:	59850513          	addi	a0,a0,1432 # ffffffffc020dbb8 <etext+0x23c6>
ffffffffc0207628:	e23f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc020762c:	00006697          	auipc	a3,0x6
ffffffffc0207630:	5f468693          	addi	a3,a3,1524 # ffffffffc020dc20 <etext+0x242e>
ffffffffc0207634:	00004617          	auipc	a2,0x4
ffffffffc0207638:	5fc60613          	addi	a2,a2,1532 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020763c:	07b00593          	li	a1,123
ffffffffc0207640:	00006517          	auipc	a0,0x6
ffffffffc0207644:	57850513          	addi	a0,a0,1400 # ffffffffc020dbb8 <etext+0x23c6>
ffffffffc0207648:	e03f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc020764c <del_timer>:
ffffffffc020764c:	100027f3          	csrr	a5,sstatus
ffffffffc0207650:	8b89                	andi	a5,a5,2
ffffffffc0207652:	ef95                	bnez	a5,ffffffffc020768e <del_timer+0x42>
ffffffffc0207654:	6d1c                	ld	a5,24(a0)
ffffffffc0207656:	01050713          	addi	a4,a0,16
ffffffffc020765a:	4601                	li	a2,0
ffffffffc020765c:	02f70863          	beq	a4,a5,ffffffffc020768c <del_timer+0x40>
ffffffffc0207660:	0008e597          	auipc	a1,0x8e
ffffffffc0207664:	19058593          	addi	a1,a1,400 # ffffffffc02957f0 <timer_list>
ffffffffc0207668:	4114                	lw	a3,0(a0)
ffffffffc020766a:	00b78863          	beq	a5,a1,ffffffffc020767a <del_timer+0x2e>
ffffffffc020766e:	c691                	beqz	a3,ffffffffc020767a <del_timer+0x2e>
ffffffffc0207670:	ff07a583          	lw	a1,-16(a5)
ffffffffc0207674:	9ead                	addw	a3,a3,a1
ffffffffc0207676:	fed7a823          	sw	a3,-16(a5)
ffffffffc020767a:	6914                	ld	a3,16(a0)
ffffffffc020767c:	e69c                	sd	a5,8(a3)
ffffffffc020767e:	e394                	sd	a3,0(a5)
ffffffffc0207680:	ed18                	sd	a4,24(a0)
ffffffffc0207682:	e918                	sd	a4,16(a0)
ffffffffc0207684:	e211                	bnez	a2,ffffffffc0207688 <del_timer+0x3c>
ffffffffc0207686:	8082                	ret
ffffffffc0207688:	d4af906f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc020768c:	8082                	ret
ffffffffc020768e:	1101                	addi	sp,sp,-32
ffffffffc0207690:	e42a                	sd	a0,8(sp)
ffffffffc0207692:	ec06                	sd	ra,24(sp)
ffffffffc0207694:	d44f90ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0207698:	6522                	ld	a0,8(sp)
ffffffffc020769a:	4605                	li	a2,1
ffffffffc020769c:	6d1c                	ld	a5,24(a0)
ffffffffc020769e:	01050713          	addi	a4,a0,16
ffffffffc02076a2:	02f70863          	beq	a4,a5,ffffffffc02076d2 <del_timer+0x86>
ffffffffc02076a6:	0008e597          	auipc	a1,0x8e
ffffffffc02076aa:	14a58593          	addi	a1,a1,330 # ffffffffc02957f0 <timer_list>
ffffffffc02076ae:	4114                	lw	a3,0(a0)
ffffffffc02076b0:	00b78863          	beq	a5,a1,ffffffffc02076c0 <del_timer+0x74>
ffffffffc02076b4:	c691                	beqz	a3,ffffffffc02076c0 <del_timer+0x74>
ffffffffc02076b6:	ff07a583          	lw	a1,-16(a5)
ffffffffc02076ba:	9ead                	addw	a3,a3,a1
ffffffffc02076bc:	fed7a823          	sw	a3,-16(a5)
ffffffffc02076c0:	6914                	ld	a3,16(a0)
ffffffffc02076c2:	e69c                	sd	a5,8(a3)
ffffffffc02076c4:	e394                	sd	a3,0(a5)
ffffffffc02076c6:	ed18                	sd	a4,24(a0)
ffffffffc02076c8:	e918                	sd	a4,16(a0)
ffffffffc02076ca:	e601                	bnez	a2,ffffffffc02076d2 <del_timer+0x86>
ffffffffc02076cc:	60e2                	ld	ra,24(sp)
ffffffffc02076ce:	6105                	addi	sp,sp,32
ffffffffc02076d0:	8082                	ret
ffffffffc02076d2:	60e2                	ld	ra,24(sp)
ffffffffc02076d4:	6105                	addi	sp,sp,32
ffffffffc02076d6:	cfcf906f          	j	ffffffffc0200bd2 <intr_enable>

ffffffffc02076da <run_timer_list>:
ffffffffc02076da:	7179                	addi	sp,sp,-48
ffffffffc02076dc:	f406                	sd	ra,40(sp)
ffffffffc02076de:	f022                	sd	s0,32(sp)
ffffffffc02076e0:	e44e                	sd	s3,8(sp)
ffffffffc02076e2:	e052                	sd	s4,0(sp)
ffffffffc02076e4:	100027f3          	csrr	a5,sstatus
ffffffffc02076e8:	8b89                	andi	a5,a5,2
ffffffffc02076ea:	0e079b63          	bnez	a5,ffffffffc02077e0 <run_timer_list+0x106>
ffffffffc02076ee:	0008e997          	auipc	s3,0x8e
ffffffffc02076f2:	10298993          	addi	s3,s3,258 # ffffffffc02957f0 <timer_list>
ffffffffc02076f6:	0089b403          	ld	s0,8(s3)
ffffffffc02076fa:	4a01                	li	s4,0
ffffffffc02076fc:	0d340463          	beq	s0,s3,ffffffffc02077c4 <run_timer_list+0xea>
ffffffffc0207700:	ff042783          	lw	a5,-16(s0)
ffffffffc0207704:	12078763          	beqz	a5,ffffffffc0207832 <run_timer_list+0x158>
ffffffffc0207708:	e84a                	sd	s2,16(sp)
ffffffffc020770a:	37fd                	addiw	a5,a5,-1
ffffffffc020770c:	fef42823          	sw	a5,-16(s0)
ffffffffc0207710:	ff040913          	addi	s2,s0,-16
ffffffffc0207714:	efb1                	bnez	a5,ffffffffc0207770 <run_timer_list+0x96>
ffffffffc0207716:	ec26                	sd	s1,24(sp)
ffffffffc0207718:	a005                	j	ffffffffc0207738 <run_timer_list+0x5e>
ffffffffc020771a:	0e07dc63          	bgez	a5,ffffffffc0207812 <run_timer_list+0x138>
ffffffffc020771e:	8526                	mv	a0,s1
ffffffffc0207720:	cb9ff0ef          	jal	ffffffffc02073d8 <wakeup_proc>
ffffffffc0207724:	854a                	mv	a0,s2
ffffffffc0207726:	f27ff0ef          	jal	ffffffffc020764c <del_timer>
ffffffffc020772a:	05340263          	beq	s0,s3,ffffffffc020776e <run_timer_list+0x94>
ffffffffc020772e:	ff042783          	lw	a5,-16(s0)
ffffffffc0207732:	ff040913          	addi	s2,s0,-16
ffffffffc0207736:	ef85                	bnez	a5,ffffffffc020776e <run_timer_list+0x94>
ffffffffc0207738:	00893483          	ld	s1,8(s2)
ffffffffc020773c:	6400                	ld	s0,8(s0)
ffffffffc020773e:	0ec4a783          	lw	a5,236(s1)
ffffffffc0207742:	ffe1                	bnez	a5,ffffffffc020771a <run_timer_list+0x40>
ffffffffc0207744:	40d4                	lw	a3,4(s1)
ffffffffc0207746:	00006617          	auipc	a2,0x6
ffffffffc020774a:	54260613          	addi	a2,a2,1346 # ffffffffc020dc88 <etext+0x2496>
ffffffffc020774e:	0ba00593          	li	a1,186
ffffffffc0207752:	00006517          	auipc	a0,0x6
ffffffffc0207756:	46650513          	addi	a0,a0,1126 # ffffffffc020dbb8 <etext+0x23c6>
ffffffffc020775a:	d5bf80ef          	jal	ffffffffc02004b4 <__warn>
ffffffffc020775e:	8526                	mv	a0,s1
ffffffffc0207760:	c79ff0ef          	jal	ffffffffc02073d8 <wakeup_proc>
ffffffffc0207764:	854a                	mv	a0,s2
ffffffffc0207766:	ee7ff0ef          	jal	ffffffffc020764c <del_timer>
ffffffffc020776a:	fd3412e3          	bne	s0,s3,ffffffffc020772e <run_timer_list+0x54>
ffffffffc020776e:	64e2                	ld	s1,24(sp)
ffffffffc0207770:	0008f597          	auipc	a1,0x8f
ffffffffc0207774:	1585b583          	ld	a1,344(a1) # ffffffffc02968c8 <current>
ffffffffc0207778:	cd85                	beqz	a1,ffffffffc02077b0 <run_timer_list+0xd6>
ffffffffc020777a:	0008f797          	auipc	a5,0x8f
ffffffffc020777e:	15e7b783          	ld	a5,350(a5) # ffffffffc02968d8 <idleproc>
ffffffffc0207782:	02f58563          	beq	a1,a5,ffffffffc02077ac <run_timer_list+0xd2>
ffffffffc0207786:	6942                	ld	s2,16(sp)
ffffffffc0207788:	0008f797          	auipc	a5,0x8f
ffffffffc020778c:	1607b783          	ld	a5,352(a5) # ffffffffc02968e8 <sched_class>
ffffffffc0207790:	0008f517          	auipc	a0,0x8f
ffffffffc0207794:	15053503          	ld	a0,336(a0) # ffffffffc02968e0 <rq>
ffffffffc0207798:	779c                	ld	a5,40(a5)
ffffffffc020779a:	9782                	jalr	a5
ffffffffc020779c:	000a1d63          	bnez	s4,ffffffffc02077b6 <run_timer_list+0xdc>
ffffffffc02077a0:	70a2                	ld	ra,40(sp)
ffffffffc02077a2:	7402                	ld	s0,32(sp)
ffffffffc02077a4:	69a2                	ld	s3,8(sp)
ffffffffc02077a6:	6a02                	ld	s4,0(sp)
ffffffffc02077a8:	6145                	addi	sp,sp,48
ffffffffc02077aa:	8082                	ret
ffffffffc02077ac:	4785                	li	a5,1
ffffffffc02077ae:	ed9c                	sd	a5,24(a1)
ffffffffc02077b0:	6942                	ld	s2,16(sp)
ffffffffc02077b2:	fe0a07e3          	beqz	s4,ffffffffc02077a0 <run_timer_list+0xc6>
ffffffffc02077b6:	7402                	ld	s0,32(sp)
ffffffffc02077b8:	70a2                	ld	ra,40(sp)
ffffffffc02077ba:	69a2                	ld	s3,8(sp)
ffffffffc02077bc:	6a02                	ld	s4,0(sp)
ffffffffc02077be:	6145                	addi	sp,sp,48
ffffffffc02077c0:	c12f906f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc02077c4:	0008f597          	auipc	a1,0x8f
ffffffffc02077c8:	1045b583          	ld	a1,260(a1) # ffffffffc02968c8 <current>
ffffffffc02077cc:	d9f1                	beqz	a1,ffffffffc02077a0 <run_timer_list+0xc6>
ffffffffc02077ce:	0008f797          	auipc	a5,0x8f
ffffffffc02077d2:	10a7b783          	ld	a5,266(a5) # ffffffffc02968d8 <idleproc>
ffffffffc02077d6:	fab799e3          	bne	a5,a1,ffffffffc0207788 <run_timer_list+0xae>
ffffffffc02077da:	4705                	li	a4,1
ffffffffc02077dc:	ef98                	sd	a4,24(a5)
ffffffffc02077de:	b7c9                	j	ffffffffc02077a0 <run_timer_list+0xc6>
ffffffffc02077e0:	0008e997          	auipc	s3,0x8e
ffffffffc02077e4:	01098993          	addi	s3,s3,16 # ffffffffc02957f0 <timer_list>
ffffffffc02077e8:	bf0f90ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc02077ec:	0089b403          	ld	s0,8(s3)
ffffffffc02077f0:	4a05                	li	s4,1
ffffffffc02077f2:	f13417e3          	bne	s0,s3,ffffffffc0207700 <run_timer_list+0x26>
ffffffffc02077f6:	0008f597          	auipc	a1,0x8f
ffffffffc02077fa:	0d25b583          	ld	a1,210(a1) # ffffffffc02968c8 <current>
ffffffffc02077fe:	ddc5                	beqz	a1,ffffffffc02077b6 <run_timer_list+0xdc>
ffffffffc0207800:	0008f797          	auipc	a5,0x8f
ffffffffc0207804:	0d87b783          	ld	a5,216(a5) # ffffffffc02968d8 <idleproc>
ffffffffc0207808:	f8f590e3          	bne	a1,a5,ffffffffc0207788 <run_timer_list+0xae>
ffffffffc020780c:	0145bc23          	sd	s4,24(a1)
ffffffffc0207810:	b75d                	j	ffffffffc02077b6 <run_timer_list+0xdc>
ffffffffc0207812:	00006697          	auipc	a3,0x6
ffffffffc0207816:	44e68693          	addi	a3,a3,1102 # ffffffffc020dc60 <etext+0x246e>
ffffffffc020781a:	00004617          	auipc	a2,0x4
ffffffffc020781e:	41660613          	addi	a2,a2,1046 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207822:	0b600593          	li	a1,182
ffffffffc0207826:	00006517          	auipc	a0,0x6
ffffffffc020782a:	39250513          	addi	a0,a0,914 # ffffffffc020dbb8 <etext+0x23c6>
ffffffffc020782e:	c1df80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207832:	00006697          	auipc	a3,0x6
ffffffffc0207836:	41668693          	addi	a3,a3,1046 # ffffffffc020dc48 <etext+0x2456>
ffffffffc020783a:	00004617          	auipc	a2,0x4
ffffffffc020783e:	3f660613          	addi	a2,a2,1014 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207842:	0ae00593          	li	a1,174
ffffffffc0207846:	00006517          	auipc	a0,0x6
ffffffffc020784a:	37250513          	addi	a0,a0,882 # ffffffffc020dbb8 <etext+0x23c6>
ffffffffc020784e:	ec26                	sd	s1,24(sp)
ffffffffc0207850:	e84a                	sd	s2,16(sp)
ffffffffc0207852:	bf9f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207856 <sys_getpid>:
ffffffffc0207856:	0008f797          	auipc	a5,0x8f
ffffffffc020785a:	0727b783          	ld	a5,114(a5) # ffffffffc02968c8 <current>
ffffffffc020785e:	43c8                	lw	a0,4(a5)
ffffffffc0207860:	8082                	ret

ffffffffc0207862 <sys_pgdir>:
ffffffffc0207862:	4501                	li	a0,0
ffffffffc0207864:	8082                	ret

ffffffffc0207866 <sys_gettime>:
ffffffffc0207866:	0008f797          	auipc	a5,0x8f
ffffffffc020786a:	00a7b783          	ld	a5,10(a5) # ffffffffc0296870 <ticks>
ffffffffc020786e:	0027951b          	slliw	a0,a5,0x2
ffffffffc0207872:	9d3d                	addw	a0,a0,a5
ffffffffc0207874:	0015151b          	slliw	a0,a0,0x1
ffffffffc0207878:	8082                	ret

ffffffffc020787a <sys_lab6_set_priority>:
ffffffffc020787a:	4108                	lw	a0,0(a0)
ffffffffc020787c:	1141                	addi	sp,sp,-16
ffffffffc020787e:	e406                	sd	ra,8(sp)
ffffffffc0207880:	901ff0ef          	jal	ffffffffc0207180 <lab6_set_priority>
ffffffffc0207884:	60a2                	ld	ra,8(sp)
ffffffffc0207886:	4501                	li	a0,0
ffffffffc0207888:	0141                	addi	sp,sp,16
ffffffffc020788a:	8082                	ret

ffffffffc020788c <sys_dup>:
ffffffffc020788c:	450c                	lw	a1,8(a0)
ffffffffc020788e:	4108                	lw	a0,0(a0)
ffffffffc0207890:	a72fe06f          	j	ffffffffc0205b02 <sysfile_dup>

ffffffffc0207894 <sys_getdirentry>:
ffffffffc0207894:	650c                	ld	a1,8(a0)
ffffffffc0207896:	4108                	lw	a0,0(a0)
ffffffffc0207898:	97afe06f          	j	ffffffffc0205a12 <sysfile_getdirentry>

ffffffffc020789c <sys_getcwd>:
ffffffffc020789c:	650c                	ld	a1,8(a0)
ffffffffc020789e:	6108                	ld	a0,0(a0)
ffffffffc02078a0:	8c8fe06f          	j	ffffffffc0205968 <sysfile_getcwd>

ffffffffc02078a4 <sys_fsync>:
ffffffffc02078a4:	4108                	lw	a0,0(a0)
ffffffffc02078a6:	8befe06f          	j	ffffffffc0205964 <sysfile_fsync>

ffffffffc02078aa <sys_fstat>:
ffffffffc02078aa:	650c                	ld	a1,8(a0)
ffffffffc02078ac:	4108                	lw	a0,0(a0)
ffffffffc02078ae:	82efe06f          	j	ffffffffc02058dc <sysfile_fstat>

ffffffffc02078b2 <sys_seek>:
ffffffffc02078b2:	4910                	lw	a2,16(a0)
ffffffffc02078b4:	650c                	ld	a1,8(a0)
ffffffffc02078b6:	4108                	lw	a0,0(a0)
ffffffffc02078b8:	820fe06f          	j	ffffffffc02058d8 <sysfile_seek>

ffffffffc02078bc <sys_write>:
ffffffffc02078bc:	6910                	ld	a2,16(a0)
ffffffffc02078be:	650c                	ld	a1,8(a0)
ffffffffc02078c0:	4108                	lw	a0,0(a0)
ffffffffc02078c2:	ee5fd06f          	j	ffffffffc02057a6 <sysfile_write>

ffffffffc02078c6 <sys_read>:
ffffffffc02078c6:	6910                	ld	a2,16(a0)
ffffffffc02078c8:	650c                	ld	a1,8(a0)
ffffffffc02078ca:	4108                	lw	a0,0(a0)
ffffffffc02078cc:	d8ffd06f          	j	ffffffffc020565a <sysfile_read>

ffffffffc02078d0 <sys_close>:
ffffffffc02078d0:	4108                	lw	a0,0(a0)
ffffffffc02078d2:	d85fd06f          	j	ffffffffc0205656 <sysfile_close>

ffffffffc02078d6 <sys_open>:
ffffffffc02078d6:	450c                	lw	a1,8(a0)
ffffffffc02078d8:	6108                	ld	a0,0(a0)
ffffffffc02078da:	d47fd06f          	j	ffffffffc0205620 <sysfile_open>

ffffffffc02078de <sys_putc>:
ffffffffc02078de:	4108                	lw	a0,0(a0)
ffffffffc02078e0:	1141                	addi	sp,sp,-16
ffffffffc02078e2:	e406                	sd	ra,8(sp)
ffffffffc02078e4:	8fdf80ef          	jal	ffffffffc02001e0 <cputchar>
ffffffffc02078e8:	60a2                	ld	ra,8(sp)
ffffffffc02078ea:	4501                	li	a0,0
ffffffffc02078ec:	0141                	addi	sp,sp,16
ffffffffc02078ee:	8082                	ret

ffffffffc02078f0 <sys_kill>:
ffffffffc02078f0:	4108                	lw	a0,0(a0)
ffffffffc02078f2:	e28ff06f          	j	ffffffffc0206f1a <do_kill>

ffffffffc02078f6 <sys_sleep>:
ffffffffc02078f6:	4108                	lw	a0,0(a0)
ffffffffc02078f8:	8b7ff06f          	j	ffffffffc02071ae <do_sleep>

ffffffffc02078fc <sys_yield>:
ffffffffc02078fc:	dd4ff06f          	j	ffffffffc0206ed0 <do_yield>

ffffffffc0207900 <sys_exec>:
ffffffffc0207900:	6910                	ld	a2,16(a0)
ffffffffc0207902:	450c                	lw	a1,8(a0)
ffffffffc0207904:	6108                	ld	a0,0(a0)
ffffffffc0207906:	d0dfe06f          	j	ffffffffc0206612 <do_execve>

ffffffffc020790a <sys_wait>:
ffffffffc020790a:	650c                	ld	a1,8(a0)
ffffffffc020790c:	4108                	lw	a0,0(a0)
ffffffffc020790e:	dd2ff06f          	j	ffffffffc0206ee0 <do_wait>

ffffffffc0207912 <sys_fork>:
ffffffffc0207912:	0008f797          	auipc	a5,0x8f
ffffffffc0207916:	fb67b783          	ld	a5,-74(a5) # ffffffffc02968c8 <current>
ffffffffc020791a:	4501                	li	a0,0
ffffffffc020791c:	73d0                	ld	a2,160(a5)
ffffffffc020791e:	6a0c                	ld	a1,16(a2)
ffffffffc0207920:	c02fe06f          	j	ffffffffc0205d22 <do_fork>

ffffffffc0207924 <sys_exit>:
ffffffffc0207924:	4108                	lw	a0,0(a0)
ffffffffc0207926:	85bfe06f          	j	ffffffffc0206180 <do_exit>

ffffffffc020792a <syscall>:
ffffffffc020792a:	0008f697          	auipc	a3,0x8f
ffffffffc020792e:	f9e6b683          	ld	a3,-98(a3) # ffffffffc02968c8 <current>
ffffffffc0207932:	715d                	addi	sp,sp,-80
ffffffffc0207934:	e0a2                	sd	s0,64(sp)
ffffffffc0207936:	72c0                	ld	s0,160(a3)
ffffffffc0207938:	e486                	sd	ra,72(sp)
ffffffffc020793a:	0ff00793          	li	a5,255
ffffffffc020793e:	4834                	lw	a3,80(s0)
ffffffffc0207940:	02d7ec63          	bltu	a5,a3,ffffffffc0207978 <syscall+0x4e>
ffffffffc0207944:	00007797          	auipc	a5,0x7
ffffffffc0207948:	5ec78793          	addi	a5,a5,1516 # ffffffffc020ef30 <syscalls>
ffffffffc020794c:	00369613          	slli	a2,a3,0x3
ffffffffc0207950:	97b2                	add	a5,a5,a2
ffffffffc0207952:	639c                	ld	a5,0(a5)
ffffffffc0207954:	c395                	beqz	a5,ffffffffc0207978 <syscall+0x4e>
ffffffffc0207956:	7028                	ld	a0,96(s0)
ffffffffc0207958:	742c                	ld	a1,104(s0)
ffffffffc020795a:	7830                	ld	a2,112(s0)
ffffffffc020795c:	7c34                	ld	a3,120(s0)
ffffffffc020795e:	6c38                	ld	a4,88(s0)
ffffffffc0207960:	f02a                	sd	a0,32(sp)
ffffffffc0207962:	f42e                	sd	a1,40(sp)
ffffffffc0207964:	f832                	sd	a2,48(sp)
ffffffffc0207966:	fc36                	sd	a3,56(sp)
ffffffffc0207968:	ec3a                	sd	a4,24(sp)
ffffffffc020796a:	0828                	addi	a0,sp,24
ffffffffc020796c:	9782                	jalr	a5
ffffffffc020796e:	60a6                	ld	ra,72(sp)
ffffffffc0207970:	e828                	sd	a0,80(s0)
ffffffffc0207972:	6406                	ld	s0,64(sp)
ffffffffc0207974:	6161                	addi	sp,sp,80
ffffffffc0207976:	8082                	ret
ffffffffc0207978:	8522                	mv	a0,s0
ffffffffc020797a:	e436                	sd	a3,8(sp)
ffffffffc020797c:	d70f90ef          	jal	ffffffffc0200eec <print_trapframe>
ffffffffc0207980:	0008f797          	auipc	a5,0x8f
ffffffffc0207984:	f487b783          	ld	a5,-184(a5) # ffffffffc02968c8 <current>
ffffffffc0207988:	66a2                	ld	a3,8(sp)
ffffffffc020798a:	00006617          	auipc	a2,0x6
ffffffffc020798e:	31e60613          	addi	a2,a2,798 # ffffffffc020dca8 <etext+0x24b6>
ffffffffc0207992:	43d8                	lw	a4,4(a5)
ffffffffc0207994:	0d800593          	li	a1,216
ffffffffc0207998:	0b478793          	addi	a5,a5,180
ffffffffc020799c:	00006517          	auipc	a0,0x6
ffffffffc02079a0:	33c50513          	addi	a0,a0,828 # ffffffffc020dcd8 <etext+0x24e6>
ffffffffc02079a4:	aa7f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc02079a8 <__alloc_inode>:
ffffffffc02079a8:	1141                	addi	sp,sp,-16
ffffffffc02079aa:	e022                	sd	s0,0(sp)
ffffffffc02079ac:	842a                	mv	s0,a0
ffffffffc02079ae:	07800513          	li	a0,120
ffffffffc02079b2:	e406                	sd	ra,8(sp)
ffffffffc02079b4:	e0cfa0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc02079b8:	c111                	beqz	a0,ffffffffc02079bc <__alloc_inode+0x14>
ffffffffc02079ba:	cd20                	sw	s0,88(a0)
ffffffffc02079bc:	60a2                	ld	ra,8(sp)
ffffffffc02079be:	6402                	ld	s0,0(sp)
ffffffffc02079c0:	0141                	addi	sp,sp,16
ffffffffc02079c2:	8082                	ret

ffffffffc02079c4 <inode_init>:
ffffffffc02079c4:	4785                	li	a5,1
ffffffffc02079c6:	06052023          	sw	zero,96(a0)
ffffffffc02079ca:	f92c                	sd	a1,112(a0)
ffffffffc02079cc:	f530                	sd	a2,104(a0)
ffffffffc02079ce:	cd7c                	sw	a5,92(a0)
ffffffffc02079d0:	8082                	ret

ffffffffc02079d2 <inode_kill>:
ffffffffc02079d2:	4d78                	lw	a4,92(a0)
ffffffffc02079d4:	1141                	addi	sp,sp,-16
ffffffffc02079d6:	e406                	sd	ra,8(sp)
ffffffffc02079d8:	e719                	bnez	a4,ffffffffc02079e6 <inode_kill+0x14>
ffffffffc02079da:	513c                	lw	a5,96(a0)
ffffffffc02079dc:	e78d                	bnez	a5,ffffffffc0207a06 <inode_kill+0x34>
ffffffffc02079de:	60a2                	ld	ra,8(sp)
ffffffffc02079e0:	0141                	addi	sp,sp,16
ffffffffc02079e2:	e84fa06f          	j	ffffffffc0202066 <kfree>
ffffffffc02079e6:	00006697          	auipc	a3,0x6
ffffffffc02079ea:	30a68693          	addi	a3,a3,778 # ffffffffc020dcf0 <etext+0x24fe>
ffffffffc02079ee:	00004617          	auipc	a2,0x4
ffffffffc02079f2:	24260613          	addi	a2,a2,578 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02079f6:	02900593          	li	a1,41
ffffffffc02079fa:	00006517          	auipc	a0,0x6
ffffffffc02079fe:	31650513          	addi	a0,a0,790 # ffffffffc020dd10 <etext+0x251e>
ffffffffc0207a02:	a49f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207a06:	00006697          	auipc	a3,0x6
ffffffffc0207a0a:	32268693          	addi	a3,a3,802 # ffffffffc020dd28 <etext+0x2536>
ffffffffc0207a0e:	00004617          	auipc	a2,0x4
ffffffffc0207a12:	22260613          	addi	a2,a2,546 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207a16:	02a00593          	li	a1,42
ffffffffc0207a1a:	00006517          	auipc	a0,0x6
ffffffffc0207a1e:	2f650513          	addi	a0,a0,758 # ffffffffc020dd10 <etext+0x251e>
ffffffffc0207a22:	a29f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207a26 <inode_ref_inc>:
ffffffffc0207a26:	4d7c                	lw	a5,92(a0)
ffffffffc0207a28:	2785                	addiw	a5,a5,1
ffffffffc0207a2a:	cd7c                	sw	a5,92(a0)
ffffffffc0207a2c:	853e                	mv	a0,a5
ffffffffc0207a2e:	8082                	ret

ffffffffc0207a30 <inode_open_inc>:
ffffffffc0207a30:	513c                	lw	a5,96(a0)
ffffffffc0207a32:	2785                	addiw	a5,a5,1
ffffffffc0207a34:	d13c                	sw	a5,96(a0)
ffffffffc0207a36:	853e                	mv	a0,a5
ffffffffc0207a38:	8082                	ret

ffffffffc0207a3a <inode_check>:
ffffffffc0207a3a:	1141                	addi	sp,sp,-16
ffffffffc0207a3c:	e406                	sd	ra,8(sp)
ffffffffc0207a3e:	c91d                	beqz	a0,ffffffffc0207a74 <inode_check+0x3a>
ffffffffc0207a40:	793c                	ld	a5,112(a0)
ffffffffc0207a42:	cb8d                	beqz	a5,ffffffffc0207a74 <inode_check+0x3a>
ffffffffc0207a44:	6398                	ld	a4,0(a5)
ffffffffc0207a46:	4625d7b7          	lui	a5,0x4625d
ffffffffc0207a4a:	0786                	slli	a5,a5,0x1
ffffffffc0207a4c:	47678793          	addi	a5,a5,1142 # 4625d476 <_binary_bin_sfs_img_size+0x461e8176>
ffffffffc0207a50:	08f71263          	bne	a4,a5,ffffffffc0207ad4 <inode_check+0x9a>
ffffffffc0207a54:	4d74                	lw	a3,92(a0)
ffffffffc0207a56:	5138                	lw	a4,96(a0)
ffffffffc0207a58:	04e6ce63          	blt	a3,a4,ffffffffc0207ab4 <inode_check+0x7a>
ffffffffc0207a5c:	01f7579b          	srliw	a5,a4,0x1f
ffffffffc0207a60:	ebb1                	bnez	a5,ffffffffc0207ab4 <inode_check+0x7a>
ffffffffc0207a62:	67c1                	lui	a5,0x10
ffffffffc0207a64:	17fd                	addi	a5,a5,-1 # ffff <_binary_bin_swap_img_size+0x82ff>
ffffffffc0207a66:	02d7c763          	blt	a5,a3,ffffffffc0207a94 <inode_check+0x5a>
ffffffffc0207a6a:	02e7c563          	blt	a5,a4,ffffffffc0207a94 <inode_check+0x5a>
ffffffffc0207a6e:	60a2                	ld	ra,8(sp)
ffffffffc0207a70:	0141                	addi	sp,sp,16
ffffffffc0207a72:	8082                	ret
ffffffffc0207a74:	00006697          	auipc	a3,0x6
ffffffffc0207a78:	2d468693          	addi	a3,a3,724 # ffffffffc020dd48 <etext+0x2556>
ffffffffc0207a7c:	00004617          	auipc	a2,0x4
ffffffffc0207a80:	1b460613          	addi	a2,a2,436 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207a84:	06e00593          	li	a1,110
ffffffffc0207a88:	00006517          	auipc	a0,0x6
ffffffffc0207a8c:	28850513          	addi	a0,a0,648 # ffffffffc020dd10 <etext+0x251e>
ffffffffc0207a90:	9bbf80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207a94:	00006697          	auipc	a3,0x6
ffffffffc0207a98:	33468693          	addi	a3,a3,820 # ffffffffc020ddc8 <etext+0x25d6>
ffffffffc0207a9c:	00004617          	auipc	a2,0x4
ffffffffc0207aa0:	19460613          	addi	a2,a2,404 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207aa4:	07200593          	li	a1,114
ffffffffc0207aa8:	00006517          	auipc	a0,0x6
ffffffffc0207aac:	26850513          	addi	a0,a0,616 # ffffffffc020dd10 <etext+0x251e>
ffffffffc0207ab0:	99bf80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207ab4:	00006697          	auipc	a3,0x6
ffffffffc0207ab8:	2e468693          	addi	a3,a3,740 # ffffffffc020dd98 <etext+0x25a6>
ffffffffc0207abc:	00004617          	auipc	a2,0x4
ffffffffc0207ac0:	17460613          	addi	a2,a2,372 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207ac4:	07100593          	li	a1,113
ffffffffc0207ac8:	00006517          	auipc	a0,0x6
ffffffffc0207acc:	24850513          	addi	a0,a0,584 # ffffffffc020dd10 <etext+0x251e>
ffffffffc0207ad0:	97bf80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207ad4:	00006697          	auipc	a3,0x6
ffffffffc0207ad8:	29c68693          	addi	a3,a3,668 # ffffffffc020dd70 <etext+0x257e>
ffffffffc0207adc:	00004617          	auipc	a2,0x4
ffffffffc0207ae0:	15460613          	addi	a2,a2,340 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207ae4:	06f00593          	li	a1,111
ffffffffc0207ae8:	00006517          	auipc	a0,0x6
ffffffffc0207aec:	22850513          	addi	a0,a0,552 # ffffffffc020dd10 <etext+0x251e>
ffffffffc0207af0:	95bf80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207af4 <inode_ref_dec>:
ffffffffc0207af4:	4d7c                	lw	a5,92(a0)
ffffffffc0207af6:	7179                	addi	sp,sp,-48
ffffffffc0207af8:	f406                	sd	ra,40(sp)
ffffffffc0207afa:	06f05b63          	blez	a5,ffffffffc0207b70 <inode_ref_dec+0x7c>
ffffffffc0207afe:	37fd                	addiw	a5,a5,-1
ffffffffc0207b00:	cd7c                	sw	a5,92(a0)
ffffffffc0207b02:	e795                	bnez	a5,ffffffffc0207b2e <inode_ref_dec+0x3a>
ffffffffc0207b04:	7934                	ld	a3,112(a0)
ffffffffc0207b06:	c6a9                	beqz	a3,ffffffffc0207b50 <inode_ref_dec+0x5c>
ffffffffc0207b08:	66b4                	ld	a3,72(a3)
ffffffffc0207b0a:	c2b9                	beqz	a3,ffffffffc0207b50 <inode_ref_dec+0x5c>
ffffffffc0207b0c:	00006597          	auipc	a1,0x6
ffffffffc0207b10:	36c58593          	addi	a1,a1,876 # ffffffffc020de78 <etext+0x2686>
ffffffffc0207b14:	e83e                	sd	a5,16(sp)
ffffffffc0207b16:	ec2a                	sd	a0,24(sp)
ffffffffc0207b18:	e436                	sd	a3,8(sp)
ffffffffc0207b1a:	f21ff0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc0207b1e:	6562                	ld	a0,24(sp)
ffffffffc0207b20:	66a2                	ld	a3,8(sp)
ffffffffc0207b22:	9682                	jalr	a3
ffffffffc0207b24:	00f50713          	addi	a4,a0,15
ffffffffc0207b28:	67c2                	ld	a5,16(sp)
ffffffffc0207b2a:	c311                	beqz	a4,ffffffffc0207b2e <inode_ref_dec+0x3a>
ffffffffc0207b2c:	e509                	bnez	a0,ffffffffc0207b36 <inode_ref_dec+0x42>
ffffffffc0207b2e:	70a2                	ld	ra,40(sp)
ffffffffc0207b30:	853e                	mv	a0,a5
ffffffffc0207b32:	6145                	addi	sp,sp,48
ffffffffc0207b34:	8082                	ret
ffffffffc0207b36:	85aa                	mv	a1,a0
ffffffffc0207b38:	00006517          	auipc	a0,0x6
ffffffffc0207b3c:	34850513          	addi	a0,a0,840 # ffffffffc020de80 <etext+0x268e>
ffffffffc0207b40:	e43e                	sd	a5,8(sp)
ffffffffc0207b42:	e64f80ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0207b46:	67a2                	ld	a5,8(sp)
ffffffffc0207b48:	70a2                	ld	ra,40(sp)
ffffffffc0207b4a:	853e                	mv	a0,a5
ffffffffc0207b4c:	6145                	addi	sp,sp,48
ffffffffc0207b4e:	8082                	ret
ffffffffc0207b50:	00006697          	auipc	a3,0x6
ffffffffc0207b54:	2d868693          	addi	a3,a3,728 # ffffffffc020de28 <etext+0x2636>
ffffffffc0207b58:	00004617          	auipc	a2,0x4
ffffffffc0207b5c:	0d860613          	addi	a2,a2,216 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207b60:	04400593          	li	a1,68
ffffffffc0207b64:	00006517          	auipc	a0,0x6
ffffffffc0207b68:	1ac50513          	addi	a0,a0,428 # ffffffffc020dd10 <etext+0x251e>
ffffffffc0207b6c:	8dff80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207b70:	00006697          	auipc	a3,0x6
ffffffffc0207b74:	29868693          	addi	a3,a3,664 # ffffffffc020de08 <etext+0x2616>
ffffffffc0207b78:	00004617          	auipc	a2,0x4
ffffffffc0207b7c:	0b860613          	addi	a2,a2,184 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207b80:	03f00593          	li	a1,63
ffffffffc0207b84:	00006517          	auipc	a0,0x6
ffffffffc0207b88:	18c50513          	addi	a0,a0,396 # ffffffffc020dd10 <etext+0x251e>
ffffffffc0207b8c:	8bff80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207b90 <inode_open_dec>:
ffffffffc0207b90:	513c                	lw	a5,96(a0)
ffffffffc0207b92:	7179                	addi	sp,sp,-48
ffffffffc0207b94:	f406                	sd	ra,40(sp)
ffffffffc0207b96:	06f05863          	blez	a5,ffffffffc0207c06 <inode_open_dec+0x76>
ffffffffc0207b9a:	37fd                	addiw	a5,a5,-1
ffffffffc0207b9c:	d13c                	sw	a5,96(a0)
ffffffffc0207b9e:	e39d                	bnez	a5,ffffffffc0207bc4 <inode_open_dec+0x34>
ffffffffc0207ba0:	7934                	ld	a3,112(a0)
ffffffffc0207ba2:	c2b1                	beqz	a3,ffffffffc0207be6 <inode_open_dec+0x56>
ffffffffc0207ba4:	6a94                	ld	a3,16(a3)
ffffffffc0207ba6:	c2a1                	beqz	a3,ffffffffc0207be6 <inode_open_dec+0x56>
ffffffffc0207ba8:	00006597          	auipc	a1,0x6
ffffffffc0207bac:	36858593          	addi	a1,a1,872 # ffffffffc020df10 <etext+0x271e>
ffffffffc0207bb0:	e83e                	sd	a5,16(sp)
ffffffffc0207bb2:	ec2a                	sd	a0,24(sp)
ffffffffc0207bb4:	e436                	sd	a3,8(sp)
ffffffffc0207bb6:	e85ff0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc0207bba:	6562                	ld	a0,24(sp)
ffffffffc0207bbc:	66a2                	ld	a3,8(sp)
ffffffffc0207bbe:	9682                	jalr	a3
ffffffffc0207bc0:	67c2                	ld	a5,16(sp)
ffffffffc0207bc2:	e509                	bnez	a0,ffffffffc0207bcc <inode_open_dec+0x3c>
ffffffffc0207bc4:	70a2                	ld	ra,40(sp)
ffffffffc0207bc6:	853e                	mv	a0,a5
ffffffffc0207bc8:	6145                	addi	sp,sp,48
ffffffffc0207bca:	8082                	ret
ffffffffc0207bcc:	85aa                	mv	a1,a0
ffffffffc0207bce:	00006517          	auipc	a0,0x6
ffffffffc0207bd2:	34a50513          	addi	a0,a0,842 # ffffffffc020df18 <etext+0x2726>
ffffffffc0207bd6:	e43e                	sd	a5,8(sp)
ffffffffc0207bd8:	dcef80ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0207bdc:	67a2                	ld	a5,8(sp)
ffffffffc0207bde:	70a2                	ld	ra,40(sp)
ffffffffc0207be0:	853e                	mv	a0,a5
ffffffffc0207be2:	6145                	addi	sp,sp,48
ffffffffc0207be4:	8082                	ret
ffffffffc0207be6:	00006697          	auipc	a3,0x6
ffffffffc0207bea:	2da68693          	addi	a3,a3,730 # ffffffffc020dec0 <etext+0x26ce>
ffffffffc0207bee:	00004617          	auipc	a2,0x4
ffffffffc0207bf2:	04260613          	addi	a2,a2,66 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207bf6:	06100593          	li	a1,97
ffffffffc0207bfa:	00006517          	auipc	a0,0x6
ffffffffc0207bfe:	11650513          	addi	a0,a0,278 # ffffffffc020dd10 <etext+0x251e>
ffffffffc0207c02:	849f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207c06:	00006697          	auipc	a3,0x6
ffffffffc0207c0a:	29a68693          	addi	a3,a3,666 # ffffffffc020dea0 <etext+0x26ae>
ffffffffc0207c0e:	00004617          	auipc	a2,0x4
ffffffffc0207c12:	02260613          	addi	a2,a2,34 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207c16:	05c00593          	li	a1,92
ffffffffc0207c1a:	00006517          	auipc	a0,0x6
ffffffffc0207c1e:	0f650513          	addi	a0,a0,246 # ffffffffc020dd10 <etext+0x251e>
ffffffffc0207c22:	829f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207c26 <__alloc_fs>:
ffffffffc0207c26:	1141                	addi	sp,sp,-16
ffffffffc0207c28:	e022                	sd	s0,0(sp)
ffffffffc0207c2a:	842a                	mv	s0,a0
ffffffffc0207c2c:	0d800513          	li	a0,216
ffffffffc0207c30:	e406                	sd	ra,8(sp)
ffffffffc0207c32:	b8efa0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0207c36:	c119                	beqz	a0,ffffffffc0207c3c <__alloc_fs+0x16>
ffffffffc0207c38:	0a852823          	sw	s0,176(a0)
ffffffffc0207c3c:	60a2                	ld	ra,8(sp)
ffffffffc0207c3e:	6402                	ld	s0,0(sp)
ffffffffc0207c40:	0141                	addi	sp,sp,16
ffffffffc0207c42:	8082                	ret

ffffffffc0207c44 <vfs_init>:
ffffffffc0207c44:	1141                	addi	sp,sp,-16
ffffffffc0207c46:	4585                	li	a1,1
ffffffffc0207c48:	0008e517          	auipc	a0,0x8e
ffffffffc0207c4c:	bb850513          	addi	a0,a0,-1096 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207c50:	e406                	sd	ra,8(sp)
ffffffffc0207c52:	9e7fc0ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc0207c56:	60a2                	ld	ra,8(sp)
ffffffffc0207c58:	0141                	addi	sp,sp,16
ffffffffc0207c5a:	a4b1                	j	ffffffffc0207ea6 <vfs_devlist_init>

ffffffffc0207c5c <vfs_set_bootfs>:
ffffffffc0207c5c:	7179                	addi	sp,sp,-48
ffffffffc0207c5e:	f022                	sd	s0,32(sp)
ffffffffc0207c60:	f406                	sd	ra,40(sp)
ffffffffc0207c62:	ec02                	sd	zero,24(sp)
ffffffffc0207c64:	842a                	mv	s0,a0
ffffffffc0207c66:	c515                	beqz	a0,ffffffffc0207c92 <vfs_set_bootfs+0x36>
ffffffffc0207c68:	03a00593          	li	a1,58
ffffffffc0207c6c:	30d030ef          	jal	ffffffffc020b778 <strchr>
ffffffffc0207c70:	c125                	beqz	a0,ffffffffc0207cd0 <vfs_set_bootfs+0x74>
ffffffffc0207c72:	00154783          	lbu	a5,1(a0)
ffffffffc0207c76:	efa9                	bnez	a5,ffffffffc0207cd0 <vfs_set_bootfs+0x74>
ffffffffc0207c78:	8522                	mv	a0,s0
ffffffffc0207c7a:	163000ef          	jal	ffffffffc02085dc <vfs_chdir>
ffffffffc0207c7e:	c509                	beqz	a0,ffffffffc0207c88 <vfs_set_bootfs+0x2c>
ffffffffc0207c80:	70a2                	ld	ra,40(sp)
ffffffffc0207c82:	7402                	ld	s0,32(sp)
ffffffffc0207c84:	6145                	addi	sp,sp,48
ffffffffc0207c86:	8082                	ret
ffffffffc0207c88:	0828                	addi	a0,sp,24
ffffffffc0207c8a:	05f000ef          	jal	ffffffffc02084e8 <vfs_get_curdir>
ffffffffc0207c8e:	f96d                	bnez	a0,ffffffffc0207c80 <vfs_set_bootfs+0x24>
ffffffffc0207c90:	6462                	ld	s0,24(sp)
ffffffffc0207c92:	0008e517          	auipc	a0,0x8e
ffffffffc0207c96:	b6e50513          	addi	a0,a0,-1170 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207c9a:	9a9fc0ef          	jal	ffffffffc0204642 <down>
ffffffffc0207c9e:	0008f797          	auipc	a5,0x8f
ffffffffc0207ca2:	c527b783          	ld	a5,-942(a5) # ffffffffc02968f0 <bootfs_node>
ffffffffc0207ca6:	0008e517          	auipc	a0,0x8e
ffffffffc0207caa:	b5a50513          	addi	a0,a0,-1190 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207cae:	0008f717          	auipc	a4,0x8f
ffffffffc0207cb2:	c4873123          	sd	s0,-958(a4) # ffffffffc02968f0 <bootfs_node>
ffffffffc0207cb6:	e43e                	sd	a5,8(sp)
ffffffffc0207cb8:	987fc0ef          	jal	ffffffffc020463e <up>
ffffffffc0207cbc:	67a2                	ld	a5,8(sp)
ffffffffc0207cbe:	c781                	beqz	a5,ffffffffc0207cc6 <vfs_set_bootfs+0x6a>
ffffffffc0207cc0:	853e                	mv	a0,a5
ffffffffc0207cc2:	e33ff0ef          	jal	ffffffffc0207af4 <inode_ref_dec>
ffffffffc0207cc6:	70a2                	ld	ra,40(sp)
ffffffffc0207cc8:	7402                	ld	s0,32(sp)
ffffffffc0207cca:	4501                	li	a0,0
ffffffffc0207ccc:	6145                	addi	sp,sp,48
ffffffffc0207cce:	8082                	ret
ffffffffc0207cd0:	5575                	li	a0,-3
ffffffffc0207cd2:	b77d                	j	ffffffffc0207c80 <vfs_set_bootfs+0x24>

ffffffffc0207cd4 <vfs_get_bootfs>:
ffffffffc0207cd4:	1101                	addi	sp,sp,-32
ffffffffc0207cd6:	e426                	sd	s1,8(sp)
ffffffffc0207cd8:	0008f497          	auipc	s1,0x8f
ffffffffc0207cdc:	c1848493          	addi	s1,s1,-1000 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207ce0:	609c                	ld	a5,0(s1)
ffffffffc0207ce2:	ec06                	sd	ra,24(sp)
ffffffffc0207ce4:	c3b1                	beqz	a5,ffffffffc0207d28 <vfs_get_bootfs+0x54>
ffffffffc0207ce6:	e822                	sd	s0,16(sp)
ffffffffc0207ce8:	842a                	mv	s0,a0
ffffffffc0207cea:	0008e517          	auipc	a0,0x8e
ffffffffc0207cee:	b1650513          	addi	a0,a0,-1258 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207cf2:	951fc0ef          	jal	ffffffffc0204642 <down>
ffffffffc0207cf6:	6084                	ld	s1,0(s1)
ffffffffc0207cf8:	c08d                	beqz	s1,ffffffffc0207d1a <vfs_get_bootfs+0x46>
ffffffffc0207cfa:	8526                	mv	a0,s1
ffffffffc0207cfc:	d2bff0ef          	jal	ffffffffc0207a26 <inode_ref_inc>
ffffffffc0207d00:	0008e517          	auipc	a0,0x8e
ffffffffc0207d04:	b0050513          	addi	a0,a0,-1280 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207d08:	937fc0ef          	jal	ffffffffc020463e <up>
ffffffffc0207d0c:	60e2                	ld	ra,24(sp)
ffffffffc0207d0e:	e004                	sd	s1,0(s0)
ffffffffc0207d10:	6442                	ld	s0,16(sp)
ffffffffc0207d12:	64a2                	ld	s1,8(sp)
ffffffffc0207d14:	4501                	li	a0,0
ffffffffc0207d16:	6105                	addi	sp,sp,32
ffffffffc0207d18:	8082                	ret
ffffffffc0207d1a:	0008e517          	auipc	a0,0x8e
ffffffffc0207d1e:	ae650513          	addi	a0,a0,-1306 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207d22:	91dfc0ef          	jal	ffffffffc020463e <up>
ffffffffc0207d26:	6442                	ld	s0,16(sp)
ffffffffc0207d28:	60e2                	ld	ra,24(sp)
ffffffffc0207d2a:	64a2                	ld	s1,8(sp)
ffffffffc0207d2c:	5541                	li	a0,-16
ffffffffc0207d2e:	6105                	addi	sp,sp,32
ffffffffc0207d30:	8082                	ret

ffffffffc0207d32 <vfs_do_add>:
ffffffffc0207d32:	7139                	addi	sp,sp,-64
ffffffffc0207d34:	fc06                	sd	ra,56(sp)
ffffffffc0207d36:	f822                	sd	s0,48(sp)
ffffffffc0207d38:	e852                	sd	s4,16(sp)
ffffffffc0207d3a:	e456                	sd	s5,8(sp)
ffffffffc0207d3c:	e05a                	sd	s6,0(sp)
ffffffffc0207d3e:	10050f63          	beqz	a0,ffffffffc0207e5c <vfs_do_add+0x12a>
ffffffffc0207d42:	00d5e7b3          	or	a5,a1,a3
ffffffffc0207d46:	842a                	mv	s0,a0
ffffffffc0207d48:	8a2e                	mv	s4,a1
ffffffffc0207d4a:	8b32                	mv	s6,a2
ffffffffc0207d4c:	8ab6                	mv	s5,a3
ffffffffc0207d4e:	cb89                	beqz	a5,ffffffffc0207d60 <vfs_do_add+0x2e>
ffffffffc0207d50:	0e058363          	beqz	a1,ffffffffc0207e36 <vfs_do_add+0x104>
ffffffffc0207d54:	4db8                	lw	a4,88(a1)
ffffffffc0207d56:	6785                	lui	a5,0x1
ffffffffc0207d58:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207d5c:	0cf71d63          	bne	a4,a5,ffffffffc0207e36 <vfs_do_add+0x104>
ffffffffc0207d60:	8522                	mv	a0,s0
ffffffffc0207d62:	175030ef          	jal	ffffffffc020b6d6 <strlen>
ffffffffc0207d66:	47fd                	li	a5,31
ffffffffc0207d68:	0ca7e263          	bltu	a5,a0,ffffffffc0207e2c <vfs_do_add+0xfa>
ffffffffc0207d6c:	8522                	mv	a0,s0
ffffffffc0207d6e:	f426                	sd	s1,40(sp)
ffffffffc0207d70:	c82f80ef          	jal	ffffffffc02001f2 <strdup>
ffffffffc0207d74:	84aa                	mv	s1,a0
ffffffffc0207d76:	cd4d                	beqz	a0,ffffffffc0207e30 <vfs_do_add+0xfe>
ffffffffc0207d78:	03000513          	li	a0,48
ffffffffc0207d7c:	ec4e                	sd	s3,24(sp)
ffffffffc0207d7e:	a42fa0ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0207d82:	89aa                	mv	s3,a0
ffffffffc0207d84:	c935                	beqz	a0,ffffffffc0207df8 <vfs_do_add+0xc6>
ffffffffc0207d86:	f04a                	sd	s2,32(sp)
ffffffffc0207d88:	0008e517          	auipc	a0,0x8e
ffffffffc0207d8c:	a9050513          	addi	a0,a0,-1392 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207d90:	0008e917          	auipc	s2,0x8e
ffffffffc0207d94:	aa090913          	addi	s2,s2,-1376 # ffffffffc0295830 <vdev_list>
ffffffffc0207d98:	8abfc0ef          	jal	ffffffffc0204642 <down>
ffffffffc0207d9c:	844a                	mv	s0,s2
ffffffffc0207d9e:	a039                	j	ffffffffc0207dac <vfs_do_add+0x7a>
ffffffffc0207da0:	fe043503          	ld	a0,-32(s0)
ffffffffc0207da4:	85a6                	mv	a1,s1
ffffffffc0207da6:	177030ef          	jal	ffffffffc020b71c <strcmp>
ffffffffc0207daa:	c52d                	beqz	a0,ffffffffc0207e14 <vfs_do_add+0xe2>
ffffffffc0207dac:	6400                	ld	s0,8(s0)
ffffffffc0207dae:	ff2419e3          	bne	s0,s2,ffffffffc0207da0 <vfs_do_add+0x6e>
ffffffffc0207db2:	6418                	ld	a4,8(s0)
ffffffffc0207db4:	02098793          	addi	a5,s3,32
ffffffffc0207db8:	0099b023          	sd	s1,0(s3)
ffffffffc0207dbc:	0149b423          	sd	s4,8(s3)
ffffffffc0207dc0:	0159bc23          	sd	s5,24(s3)
ffffffffc0207dc4:	0169b823          	sd	s6,16(s3)
ffffffffc0207dc8:	e31c                	sd	a5,0(a4)
ffffffffc0207dca:	0289b023          	sd	s0,32(s3)
ffffffffc0207dce:	02e9b423          	sd	a4,40(s3)
ffffffffc0207dd2:	0008e517          	auipc	a0,0x8e
ffffffffc0207dd6:	a4650513          	addi	a0,a0,-1466 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207dda:	e41c                	sd	a5,8(s0)
ffffffffc0207ddc:	863fc0ef          	jal	ffffffffc020463e <up>
ffffffffc0207de0:	74a2                	ld	s1,40(sp)
ffffffffc0207de2:	7902                	ld	s2,32(sp)
ffffffffc0207de4:	69e2                	ld	s3,24(sp)
ffffffffc0207de6:	4401                	li	s0,0
ffffffffc0207de8:	70e2                	ld	ra,56(sp)
ffffffffc0207dea:	8522                	mv	a0,s0
ffffffffc0207dec:	7442                	ld	s0,48(sp)
ffffffffc0207dee:	6a42                	ld	s4,16(sp)
ffffffffc0207df0:	6aa2                	ld	s5,8(sp)
ffffffffc0207df2:	6b02                	ld	s6,0(sp)
ffffffffc0207df4:	6121                	addi	sp,sp,64
ffffffffc0207df6:	8082                	ret
ffffffffc0207df8:	5471                	li	s0,-4
ffffffffc0207dfa:	8526                	mv	a0,s1
ffffffffc0207dfc:	a6afa0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0207e00:	70e2                	ld	ra,56(sp)
ffffffffc0207e02:	8522                	mv	a0,s0
ffffffffc0207e04:	7442                	ld	s0,48(sp)
ffffffffc0207e06:	74a2                	ld	s1,40(sp)
ffffffffc0207e08:	69e2                	ld	s3,24(sp)
ffffffffc0207e0a:	6a42                	ld	s4,16(sp)
ffffffffc0207e0c:	6aa2                	ld	s5,8(sp)
ffffffffc0207e0e:	6b02                	ld	s6,0(sp)
ffffffffc0207e10:	6121                	addi	sp,sp,64
ffffffffc0207e12:	8082                	ret
ffffffffc0207e14:	0008e517          	auipc	a0,0x8e
ffffffffc0207e18:	a0450513          	addi	a0,a0,-1532 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207e1c:	823fc0ef          	jal	ffffffffc020463e <up>
ffffffffc0207e20:	854e                	mv	a0,s3
ffffffffc0207e22:	a44fa0ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0207e26:	5425                	li	s0,-23
ffffffffc0207e28:	7902                	ld	s2,32(sp)
ffffffffc0207e2a:	bfc1                	j	ffffffffc0207dfa <vfs_do_add+0xc8>
ffffffffc0207e2c:	5451                	li	s0,-12
ffffffffc0207e2e:	bf6d                	j	ffffffffc0207de8 <vfs_do_add+0xb6>
ffffffffc0207e30:	74a2                	ld	s1,40(sp)
ffffffffc0207e32:	5471                	li	s0,-4
ffffffffc0207e34:	bf55                	j	ffffffffc0207de8 <vfs_do_add+0xb6>
ffffffffc0207e36:	00006697          	auipc	a3,0x6
ffffffffc0207e3a:	12a68693          	addi	a3,a3,298 # ffffffffc020df60 <etext+0x276e>
ffffffffc0207e3e:	00004617          	auipc	a2,0x4
ffffffffc0207e42:	df260613          	addi	a2,a2,-526 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207e46:	08f00593          	li	a1,143
ffffffffc0207e4a:	00006517          	auipc	a0,0x6
ffffffffc0207e4e:	0fe50513          	addi	a0,a0,254 # ffffffffc020df48 <etext+0x2756>
ffffffffc0207e52:	f426                	sd	s1,40(sp)
ffffffffc0207e54:	f04a                	sd	s2,32(sp)
ffffffffc0207e56:	ec4e                	sd	s3,24(sp)
ffffffffc0207e58:	df2f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0207e5c:	00006697          	auipc	a3,0x6
ffffffffc0207e60:	0dc68693          	addi	a3,a3,220 # ffffffffc020df38 <etext+0x2746>
ffffffffc0207e64:	00004617          	auipc	a2,0x4
ffffffffc0207e68:	dcc60613          	addi	a2,a2,-564 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207e6c:	08e00593          	li	a1,142
ffffffffc0207e70:	00006517          	auipc	a0,0x6
ffffffffc0207e74:	0d850513          	addi	a0,a0,216 # ffffffffc020df48 <etext+0x2756>
ffffffffc0207e78:	f426                	sd	s1,40(sp)
ffffffffc0207e7a:	f04a                	sd	s2,32(sp)
ffffffffc0207e7c:	ec4e                	sd	s3,24(sp)
ffffffffc0207e7e:	dccf80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207e82 <find_mount.part.0>:
ffffffffc0207e82:	1141                	addi	sp,sp,-16
ffffffffc0207e84:	00006697          	auipc	a3,0x6
ffffffffc0207e88:	0b468693          	addi	a3,a3,180 # ffffffffc020df38 <etext+0x2746>
ffffffffc0207e8c:	00004617          	auipc	a2,0x4
ffffffffc0207e90:	da460613          	addi	a2,a2,-604 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207e94:	0cd00593          	li	a1,205
ffffffffc0207e98:	00006517          	auipc	a0,0x6
ffffffffc0207e9c:	0b050513          	addi	a0,a0,176 # ffffffffc020df48 <etext+0x2756>
ffffffffc0207ea0:	e406                	sd	ra,8(sp)
ffffffffc0207ea2:	da8f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207ea6 <vfs_devlist_init>:
ffffffffc0207ea6:	0008e797          	auipc	a5,0x8e
ffffffffc0207eaa:	98a78793          	addi	a5,a5,-1654 # ffffffffc0295830 <vdev_list>
ffffffffc0207eae:	4585                	li	a1,1
ffffffffc0207eb0:	0008e517          	auipc	a0,0x8e
ffffffffc0207eb4:	96850513          	addi	a0,a0,-1688 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207eb8:	e79c                	sd	a5,8(a5)
ffffffffc0207eba:	e39c                	sd	a5,0(a5)
ffffffffc0207ebc:	f7cfc06f          	j	ffffffffc0204638 <sem_init>

ffffffffc0207ec0 <vfs_cleanup>:
ffffffffc0207ec0:	1101                	addi	sp,sp,-32
ffffffffc0207ec2:	e426                	sd	s1,8(sp)
ffffffffc0207ec4:	0008e497          	auipc	s1,0x8e
ffffffffc0207ec8:	96c48493          	addi	s1,s1,-1684 # ffffffffc0295830 <vdev_list>
ffffffffc0207ecc:	649c                	ld	a5,8(s1)
ffffffffc0207ece:	ec06                	sd	ra,24(sp)
ffffffffc0207ed0:	02978f63          	beq	a5,s1,ffffffffc0207f0e <vfs_cleanup+0x4e>
ffffffffc0207ed4:	0008e517          	auipc	a0,0x8e
ffffffffc0207ed8:	94450513          	addi	a0,a0,-1724 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207edc:	e822                	sd	s0,16(sp)
ffffffffc0207ede:	f64fc0ef          	jal	ffffffffc0204642 <down>
ffffffffc0207ee2:	6480                	ld	s0,8(s1)
ffffffffc0207ee4:	00940b63          	beq	s0,s1,ffffffffc0207efa <vfs_cleanup+0x3a>
ffffffffc0207ee8:	ff043783          	ld	a5,-16(s0)
ffffffffc0207eec:	853e                	mv	a0,a5
ffffffffc0207eee:	c399                	beqz	a5,ffffffffc0207ef4 <vfs_cleanup+0x34>
ffffffffc0207ef0:	6bfc                	ld	a5,208(a5)
ffffffffc0207ef2:	9782                	jalr	a5
ffffffffc0207ef4:	6400                	ld	s0,8(s0)
ffffffffc0207ef6:	fe9419e3          	bne	s0,s1,ffffffffc0207ee8 <vfs_cleanup+0x28>
ffffffffc0207efa:	6442                	ld	s0,16(sp)
ffffffffc0207efc:	60e2                	ld	ra,24(sp)
ffffffffc0207efe:	64a2                	ld	s1,8(sp)
ffffffffc0207f00:	0008e517          	auipc	a0,0x8e
ffffffffc0207f04:	91850513          	addi	a0,a0,-1768 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207f08:	6105                	addi	sp,sp,32
ffffffffc0207f0a:	f34fc06f          	j	ffffffffc020463e <up>
ffffffffc0207f0e:	60e2                	ld	ra,24(sp)
ffffffffc0207f10:	64a2                	ld	s1,8(sp)
ffffffffc0207f12:	6105                	addi	sp,sp,32
ffffffffc0207f14:	8082                	ret

ffffffffc0207f16 <vfs_get_root>:
ffffffffc0207f16:	7179                	addi	sp,sp,-48
ffffffffc0207f18:	f406                	sd	ra,40(sp)
ffffffffc0207f1a:	c949                	beqz	a0,ffffffffc0207fac <vfs_get_root+0x96>
ffffffffc0207f1c:	e84a                	sd	s2,16(sp)
ffffffffc0207f1e:	0008e917          	auipc	s2,0x8e
ffffffffc0207f22:	91290913          	addi	s2,s2,-1774 # ffffffffc0295830 <vdev_list>
ffffffffc0207f26:	00893783          	ld	a5,8(s2)
ffffffffc0207f2a:	ec26                	sd	s1,24(sp)
ffffffffc0207f2c:	07278e63          	beq	a5,s2,ffffffffc0207fa8 <vfs_get_root+0x92>
ffffffffc0207f30:	e44e                	sd	s3,8(sp)
ffffffffc0207f32:	89aa                	mv	s3,a0
ffffffffc0207f34:	0008e517          	auipc	a0,0x8e
ffffffffc0207f38:	8e450513          	addi	a0,a0,-1820 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207f3c:	f022                	sd	s0,32(sp)
ffffffffc0207f3e:	e052                	sd	s4,0(sp)
ffffffffc0207f40:	844a                	mv	s0,s2
ffffffffc0207f42:	8a2e                	mv	s4,a1
ffffffffc0207f44:	efefc0ef          	jal	ffffffffc0204642 <down>
ffffffffc0207f48:	a801                	j	ffffffffc0207f58 <vfs_get_root+0x42>
ffffffffc0207f4a:	fe043583          	ld	a1,-32(s0)
ffffffffc0207f4e:	854e                	mv	a0,s3
ffffffffc0207f50:	7cc030ef          	jal	ffffffffc020b71c <strcmp>
ffffffffc0207f54:	84aa                	mv	s1,a0
ffffffffc0207f56:	c505                	beqz	a0,ffffffffc0207f7e <vfs_get_root+0x68>
ffffffffc0207f58:	6400                	ld	s0,8(s0)
ffffffffc0207f5a:	ff2418e3          	bne	s0,s2,ffffffffc0207f4a <vfs_get_root+0x34>
ffffffffc0207f5e:	54cd                	li	s1,-13
ffffffffc0207f60:	0008e517          	auipc	a0,0x8e
ffffffffc0207f64:	8b850513          	addi	a0,a0,-1864 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0207f68:	ed6fc0ef          	jal	ffffffffc020463e <up>
ffffffffc0207f6c:	7402                	ld	s0,32(sp)
ffffffffc0207f6e:	69a2                	ld	s3,8(sp)
ffffffffc0207f70:	6a02                	ld	s4,0(sp)
ffffffffc0207f72:	70a2                	ld	ra,40(sp)
ffffffffc0207f74:	6942                	ld	s2,16(sp)
ffffffffc0207f76:	8526                	mv	a0,s1
ffffffffc0207f78:	64e2                	ld	s1,24(sp)
ffffffffc0207f7a:	6145                	addi	sp,sp,48
ffffffffc0207f7c:	8082                	ret
ffffffffc0207f7e:	ff043503          	ld	a0,-16(s0)
ffffffffc0207f82:	c519                	beqz	a0,ffffffffc0207f90 <vfs_get_root+0x7a>
ffffffffc0207f84:	617c                	ld	a5,192(a0)
ffffffffc0207f86:	9782                	jalr	a5
ffffffffc0207f88:	c519                	beqz	a0,ffffffffc0207f96 <vfs_get_root+0x80>
ffffffffc0207f8a:	00aa3023          	sd	a0,0(s4)
ffffffffc0207f8e:	bfc9                	j	ffffffffc0207f60 <vfs_get_root+0x4a>
ffffffffc0207f90:	ff843783          	ld	a5,-8(s0)
ffffffffc0207f94:	c399                	beqz	a5,ffffffffc0207f9a <vfs_get_root+0x84>
ffffffffc0207f96:	54c9                	li	s1,-14
ffffffffc0207f98:	b7e1                	j	ffffffffc0207f60 <vfs_get_root+0x4a>
ffffffffc0207f9a:	fe843503          	ld	a0,-24(s0)
ffffffffc0207f9e:	a89ff0ef          	jal	ffffffffc0207a26 <inode_ref_inc>
ffffffffc0207fa2:	fe843503          	ld	a0,-24(s0)
ffffffffc0207fa6:	b7cd                	j	ffffffffc0207f88 <vfs_get_root+0x72>
ffffffffc0207fa8:	54cd                	li	s1,-13
ffffffffc0207faa:	b7e1                	j	ffffffffc0207f72 <vfs_get_root+0x5c>
ffffffffc0207fac:	00006697          	auipc	a3,0x6
ffffffffc0207fb0:	f8c68693          	addi	a3,a3,-116 # ffffffffc020df38 <etext+0x2746>
ffffffffc0207fb4:	00004617          	auipc	a2,0x4
ffffffffc0207fb8:	c7c60613          	addi	a2,a2,-900 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0207fbc:	04500593          	li	a1,69
ffffffffc0207fc0:	00006517          	auipc	a0,0x6
ffffffffc0207fc4:	f8850513          	addi	a0,a0,-120 # ffffffffc020df48 <etext+0x2756>
ffffffffc0207fc8:	f022                	sd	s0,32(sp)
ffffffffc0207fca:	ec26                	sd	s1,24(sp)
ffffffffc0207fcc:	e84a                	sd	s2,16(sp)
ffffffffc0207fce:	e44e                	sd	s3,8(sp)
ffffffffc0207fd0:	e052                	sd	s4,0(sp)
ffffffffc0207fd2:	c78f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0207fd6 <vfs_get_devname>:
ffffffffc0207fd6:	0008e697          	auipc	a3,0x8e
ffffffffc0207fda:	85a68693          	addi	a3,a3,-1958 # ffffffffc0295830 <vdev_list>
ffffffffc0207fde:	87b6                	mv	a5,a3
ffffffffc0207fe0:	e511                	bnez	a0,ffffffffc0207fec <vfs_get_devname+0x16>
ffffffffc0207fe2:	a829                	j	ffffffffc0207ffc <vfs_get_devname+0x26>
ffffffffc0207fe4:	ff07b703          	ld	a4,-16(a5)
ffffffffc0207fe8:	00a70763          	beq	a4,a0,ffffffffc0207ff6 <vfs_get_devname+0x20>
ffffffffc0207fec:	679c                	ld	a5,8(a5)
ffffffffc0207fee:	fed79be3          	bne	a5,a3,ffffffffc0207fe4 <vfs_get_devname+0xe>
ffffffffc0207ff2:	4501                	li	a0,0
ffffffffc0207ff4:	8082                	ret
ffffffffc0207ff6:	fe07b503          	ld	a0,-32(a5)
ffffffffc0207ffa:	8082                	ret
ffffffffc0207ffc:	1141                	addi	sp,sp,-16
ffffffffc0207ffe:	00006697          	auipc	a3,0x6
ffffffffc0208002:	fc268693          	addi	a3,a3,-62 # ffffffffc020dfc0 <etext+0x27ce>
ffffffffc0208006:	00004617          	auipc	a2,0x4
ffffffffc020800a:	c2a60613          	addi	a2,a2,-982 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020800e:	06a00593          	li	a1,106
ffffffffc0208012:	00006517          	auipc	a0,0x6
ffffffffc0208016:	f3650513          	addi	a0,a0,-202 # ffffffffc020df48 <etext+0x2756>
ffffffffc020801a:	e406                	sd	ra,8(sp)
ffffffffc020801c:	c2ef80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208020 <vfs_add_dev>:
ffffffffc0208020:	86b2                	mv	a3,a2
ffffffffc0208022:	4601                	li	a2,0
ffffffffc0208024:	d0fff06f          	j	ffffffffc0207d32 <vfs_do_add>

ffffffffc0208028 <vfs_mount>:
ffffffffc0208028:	7179                	addi	sp,sp,-48
ffffffffc020802a:	e84a                	sd	s2,16(sp)
ffffffffc020802c:	892a                	mv	s2,a0
ffffffffc020802e:	0008d517          	auipc	a0,0x8d
ffffffffc0208032:	7ea50513          	addi	a0,a0,2026 # ffffffffc0295818 <vdev_list_sem>
ffffffffc0208036:	e44e                	sd	s3,8(sp)
ffffffffc0208038:	f406                	sd	ra,40(sp)
ffffffffc020803a:	f022                	sd	s0,32(sp)
ffffffffc020803c:	ec26                	sd	s1,24(sp)
ffffffffc020803e:	89ae                	mv	s3,a1
ffffffffc0208040:	e02fc0ef          	jal	ffffffffc0204642 <down>
ffffffffc0208044:	0c090a63          	beqz	s2,ffffffffc0208118 <vfs_mount+0xf0>
ffffffffc0208048:	0008d497          	auipc	s1,0x8d
ffffffffc020804c:	7e848493          	addi	s1,s1,2024 # ffffffffc0295830 <vdev_list>
ffffffffc0208050:	6480                	ld	s0,8(s1)
ffffffffc0208052:	00941663          	bne	s0,s1,ffffffffc020805e <vfs_mount+0x36>
ffffffffc0208056:	a8ad                	j	ffffffffc02080d0 <vfs_mount+0xa8>
ffffffffc0208058:	6400                	ld	s0,8(s0)
ffffffffc020805a:	06940b63          	beq	s0,s1,ffffffffc02080d0 <vfs_mount+0xa8>
ffffffffc020805e:	ff843783          	ld	a5,-8(s0)
ffffffffc0208062:	dbfd                	beqz	a5,ffffffffc0208058 <vfs_mount+0x30>
ffffffffc0208064:	fe043503          	ld	a0,-32(s0)
ffffffffc0208068:	85ca                	mv	a1,s2
ffffffffc020806a:	6b2030ef          	jal	ffffffffc020b71c <strcmp>
ffffffffc020806e:	f56d                	bnez	a0,ffffffffc0208058 <vfs_mount+0x30>
ffffffffc0208070:	ff043783          	ld	a5,-16(s0)
ffffffffc0208074:	e3a5                	bnez	a5,ffffffffc02080d4 <vfs_mount+0xac>
ffffffffc0208076:	fe043783          	ld	a5,-32(s0)
ffffffffc020807a:	cfbd                	beqz	a5,ffffffffc02080f8 <vfs_mount+0xd0>
ffffffffc020807c:	ff843783          	ld	a5,-8(s0)
ffffffffc0208080:	cfa5                	beqz	a5,ffffffffc02080f8 <vfs_mount+0xd0>
ffffffffc0208082:	fe843503          	ld	a0,-24(s0)
ffffffffc0208086:	c929                	beqz	a0,ffffffffc02080d8 <vfs_mount+0xb0>
ffffffffc0208088:	4d38                	lw	a4,88(a0)
ffffffffc020808a:	6785                	lui	a5,0x1
ffffffffc020808c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208090:	04f71463          	bne	a4,a5,ffffffffc02080d8 <vfs_mount+0xb0>
ffffffffc0208094:	ff040593          	addi	a1,s0,-16
ffffffffc0208098:	9982                	jalr	s3
ffffffffc020809a:	84aa                	mv	s1,a0
ffffffffc020809c:	ed01                	bnez	a0,ffffffffc02080b4 <vfs_mount+0x8c>
ffffffffc020809e:	ff043783          	ld	a5,-16(s0)
ffffffffc02080a2:	cfad                	beqz	a5,ffffffffc020811c <vfs_mount+0xf4>
ffffffffc02080a4:	fe043583          	ld	a1,-32(s0)
ffffffffc02080a8:	00006517          	auipc	a0,0x6
ffffffffc02080ac:	fa850513          	addi	a0,a0,-88 # ffffffffc020e050 <etext+0x285e>
ffffffffc02080b0:	8f6f80ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02080b4:	0008d517          	auipc	a0,0x8d
ffffffffc02080b8:	76450513          	addi	a0,a0,1892 # ffffffffc0295818 <vdev_list_sem>
ffffffffc02080bc:	d82fc0ef          	jal	ffffffffc020463e <up>
ffffffffc02080c0:	70a2                	ld	ra,40(sp)
ffffffffc02080c2:	7402                	ld	s0,32(sp)
ffffffffc02080c4:	6942                	ld	s2,16(sp)
ffffffffc02080c6:	69a2                	ld	s3,8(sp)
ffffffffc02080c8:	8526                	mv	a0,s1
ffffffffc02080ca:	64e2                	ld	s1,24(sp)
ffffffffc02080cc:	6145                	addi	sp,sp,48
ffffffffc02080ce:	8082                	ret
ffffffffc02080d0:	54cd                	li	s1,-13
ffffffffc02080d2:	b7cd                	j	ffffffffc02080b4 <vfs_mount+0x8c>
ffffffffc02080d4:	54c5                	li	s1,-15
ffffffffc02080d6:	bff9                	j	ffffffffc02080b4 <vfs_mount+0x8c>
ffffffffc02080d8:	00006697          	auipc	a3,0x6
ffffffffc02080dc:	f2868693          	addi	a3,a3,-216 # ffffffffc020e000 <etext+0x280e>
ffffffffc02080e0:	00004617          	auipc	a2,0x4
ffffffffc02080e4:	b5060613          	addi	a2,a2,-1200 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02080e8:	0ed00593          	li	a1,237
ffffffffc02080ec:	00006517          	auipc	a0,0x6
ffffffffc02080f0:	e5c50513          	addi	a0,a0,-420 # ffffffffc020df48 <etext+0x2756>
ffffffffc02080f4:	b56f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc02080f8:	00006697          	auipc	a3,0x6
ffffffffc02080fc:	ed868693          	addi	a3,a3,-296 # ffffffffc020dfd0 <etext+0x27de>
ffffffffc0208100:	00004617          	auipc	a2,0x4
ffffffffc0208104:	b3060613          	addi	a2,a2,-1232 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0208108:	0eb00593          	li	a1,235
ffffffffc020810c:	00006517          	auipc	a0,0x6
ffffffffc0208110:	e3c50513          	addi	a0,a0,-452 # ffffffffc020df48 <etext+0x2756>
ffffffffc0208114:	b36f80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208118:	d6bff0ef          	jal	ffffffffc0207e82 <find_mount.part.0>
ffffffffc020811c:	00006697          	auipc	a3,0x6
ffffffffc0208120:	f1c68693          	addi	a3,a3,-228 # ffffffffc020e038 <etext+0x2846>
ffffffffc0208124:	00004617          	auipc	a2,0x4
ffffffffc0208128:	b0c60613          	addi	a2,a2,-1268 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020812c:	0ef00593          	li	a1,239
ffffffffc0208130:	00006517          	auipc	a0,0x6
ffffffffc0208134:	e1850513          	addi	a0,a0,-488 # ffffffffc020df48 <etext+0x2756>
ffffffffc0208138:	b12f80ef          	jal	ffffffffc020044a <__panic>

ffffffffc020813c <vfs_open>:
ffffffffc020813c:	7159                	addi	sp,sp,-112
ffffffffc020813e:	f486                	sd	ra,104(sp)
ffffffffc0208140:	e0d2                	sd	s4,64(sp)
ffffffffc0208142:	0035f793          	andi	a5,a1,3
ffffffffc0208146:	10078363          	beqz	a5,ffffffffc020824c <vfs_open+0x110>
ffffffffc020814a:	470d                	li	a4,3
ffffffffc020814c:	12e78163          	beq	a5,a4,ffffffffc020826e <vfs_open+0x132>
ffffffffc0208150:	f0a2                	sd	s0,96(sp)
ffffffffc0208152:	eca6                	sd	s1,88(sp)
ffffffffc0208154:	e8ca                	sd	s2,80(sp)
ffffffffc0208156:	e4ce                	sd	s3,72(sp)
ffffffffc0208158:	fc56                	sd	s5,56(sp)
ffffffffc020815a:	f85a                	sd	s6,48(sp)
ffffffffc020815c:	0105fa13          	andi	s4,a1,16
ffffffffc0208160:	842e                	mv	s0,a1
ffffffffc0208162:	00447793          	andi	a5,s0,4
ffffffffc0208166:	8b32                	mv	s6,a2
ffffffffc0208168:	082c                	addi	a1,sp,24
ffffffffc020816a:	00345613          	srli	a2,s0,0x3
ffffffffc020816e:	8abe                	mv	s5,a5
ffffffffc0208170:	0027d493          	srli	s1,a5,0x2
ffffffffc0208174:	892a                	mv	s2,a0
ffffffffc0208176:	00167993          	andi	s3,a2,1
ffffffffc020817a:	2ba000ef          	jal	ffffffffc0208434 <vfs_lookup>
ffffffffc020817e:	87aa                	mv	a5,a0
ffffffffc0208180:	c175                	beqz	a0,ffffffffc0208264 <vfs_open+0x128>
ffffffffc0208182:	01050713          	addi	a4,a0,16
ffffffffc0208186:	eb45                	bnez	a4,ffffffffc0208236 <vfs_open+0xfa>
ffffffffc0208188:	c4dd                	beqz	s1,ffffffffc0208236 <vfs_open+0xfa>
ffffffffc020818a:	854a                	mv	a0,s2
ffffffffc020818c:	1010                	addi	a2,sp,32
ffffffffc020818e:	102c                	addi	a1,sp,40
ffffffffc0208190:	32e000ef          	jal	ffffffffc02084be <vfs_lookup_parent>
ffffffffc0208194:	87aa                	mv	a5,a0
ffffffffc0208196:	e145                	bnez	a0,ffffffffc0208236 <vfs_open+0xfa>
ffffffffc0208198:	7522                	ld	a0,40(sp)
ffffffffc020819a:	14050c63          	beqz	a0,ffffffffc02082f2 <vfs_open+0x1b6>
ffffffffc020819e:	793c                	ld	a5,112(a0)
ffffffffc02081a0:	14078963          	beqz	a5,ffffffffc02082f2 <vfs_open+0x1b6>
ffffffffc02081a4:	77bc                	ld	a5,104(a5)
ffffffffc02081a6:	14078663          	beqz	a5,ffffffffc02082f2 <vfs_open+0x1b6>
ffffffffc02081aa:	00006597          	auipc	a1,0x6
ffffffffc02081ae:	f1e58593          	addi	a1,a1,-226 # ffffffffc020e0c8 <etext+0x28d6>
ffffffffc02081b2:	e42a                	sd	a0,8(sp)
ffffffffc02081b4:	887ff0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc02081b8:	6522                	ld	a0,8(sp)
ffffffffc02081ba:	7582                	ld	a1,32(sp)
ffffffffc02081bc:	0834                	addi	a3,sp,24
ffffffffc02081be:	793c                	ld	a5,112(a0)
ffffffffc02081c0:	7522                	ld	a0,40(sp)
ffffffffc02081c2:	864e                	mv	a2,s3
ffffffffc02081c4:	77bc                	ld	a5,104(a5)
ffffffffc02081c6:	9782                	jalr	a5
ffffffffc02081c8:	6562                	ld	a0,24(sp)
ffffffffc02081ca:	10050463          	beqz	a0,ffffffffc02082d2 <vfs_open+0x196>
ffffffffc02081ce:	793c                	ld	a5,112(a0)
ffffffffc02081d0:	c3e9                	beqz	a5,ffffffffc0208292 <vfs_open+0x156>
ffffffffc02081d2:	679c                	ld	a5,8(a5)
ffffffffc02081d4:	cfdd                	beqz	a5,ffffffffc0208292 <vfs_open+0x156>
ffffffffc02081d6:	00006597          	auipc	a1,0x6
ffffffffc02081da:	f5a58593          	addi	a1,a1,-166 # ffffffffc020e130 <etext+0x293e>
ffffffffc02081de:	e42a                	sd	a0,8(sp)
ffffffffc02081e0:	85bff0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc02081e4:	6522                	ld	a0,8(sp)
ffffffffc02081e6:	85a2                	mv	a1,s0
ffffffffc02081e8:	793c                	ld	a5,112(a0)
ffffffffc02081ea:	6562                	ld	a0,24(sp)
ffffffffc02081ec:	679c                	ld	a5,8(a5)
ffffffffc02081ee:	9782                	jalr	a5
ffffffffc02081f0:	87aa                	mv	a5,a0
ffffffffc02081f2:	e43e                	sd	a5,8(sp)
ffffffffc02081f4:	6562                	ld	a0,24(sp)
ffffffffc02081f6:	e3d1                	bnez	a5,ffffffffc020827a <vfs_open+0x13e>
ffffffffc02081f8:	839ff0ef          	jal	ffffffffc0207a30 <inode_open_inc>
ffffffffc02081fc:	014ae733          	or	a4,s5,s4
ffffffffc0208200:	67a2                	ld	a5,8(sp)
ffffffffc0208202:	c71d                	beqz	a4,ffffffffc0208230 <vfs_open+0xf4>
ffffffffc0208204:	6462                	ld	s0,24(sp)
ffffffffc0208206:	c455                	beqz	s0,ffffffffc02082b2 <vfs_open+0x176>
ffffffffc0208208:	7838                	ld	a4,112(s0)
ffffffffc020820a:	c745                	beqz	a4,ffffffffc02082b2 <vfs_open+0x176>
ffffffffc020820c:	7338                	ld	a4,96(a4)
ffffffffc020820e:	c355                	beqz	a4,ffffffffc02082b2 <vfs_open+0x176>
ffffffffc0208210:	8522                	mv	a0,s0
ffffffffc0208212:	00006597          	auipc	a1,0x6
ffffffffc0208216:	f7e58593          	addi	a1,a1,-130 # ffffffffc020e190 <etext+0x299e>
ffffffffc020821a:	e43e                	sd	a5,8(sp)
ffffffffc020821c:	81fff0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc0208220:	7838                	ld	a4,112(s0)
ffffffffc0208222:	6562                	ld	a0,24(sp)
ffffffffc0208224:	4581                	li	a1,0
ffffffffc0208226:	7338                	ld	a4,96(a4)
ffffffffc0208228:	9702                	jalr	a4
ffffffffc020822a:	67a2                	ld	a5,8(sp)
ffffffffc020822c:	842a                	mv	s0,a0
ffffffffc020822e:	e931                	bnez	a0,ffffffffc0208282 <vfs_open+0x146>
ffffffffc0208230:	6762                	ld	a4,24(sp)
ffffffffc0208232:	00eb3023          	sd	a4,0(s6)
ffffffffc0208236:	7406                	ld	s0,96(sp)
ffffffffc0208238:	64e6                	ld	s1,88(sp)
ffffffffc020823a:	6946                	ld	s2,80(sp)
ffffffffc020823c:	69a6                	ld	s3,72(sp)
ffffffffc020823e:	7ae2                	ld	s5,56(sp)
ffffffffc0208240:	7b42                	ld	s6,48(sp)
ffffffffc0208242:	70a6                	ld	ra,104(sp)
ffffffffc0208244:	6a06                	ld	s4,64(sp)
ffffffffc0208246:	853e                	mv	a0,a5
ffffffffc0208248:	6165                	addi	sp,sp,112
ffffffffc020824a:	8082                	ret
ffffffffc020824c:	0105f713          	andi	a4,a1,16
ffffffffc0208250:	8a3a                	mv	s4,a4
ffffffffc0208252:	57f5                	li	a5,-3
ffffffffc0208254:	f77d                	bnez	a4,ffffffffc0208242 <vfs_open+0x106>
ffffffffc0208256:	f0a2                	sd	s0,96(sp)
ffffffffc0208258:	eca6                	sd	s1,88(sp)
ffffffffc020825a:	e8ca                	sd	s2,80(sp)
ffffffffc020825c:	e4ce                	sd	s3,72(sp)
ffffffffc020825e:	fc56                	sd	s5,56(sp)
ffffffffc0208260:	f85a                	sd	s6,48(sp)
ffffffffc0208262:	bdfd                	j	ffffffffc0208160 <vfs_open+0x24>
ffffffffc0208264:	f60982e3          	beqz	s3,ffffffffc02081c8 <vfs_open+0x8c>
ffffffffc0208268:	d0a5                	beqz	s1,ffffffffc02081c8 <vfs_open+0x8c>
ffffffffc020826a:	57a5                	li	a5,-23
ffffffffc020826c:	b7e9                	j	ffffffffc0208236 <vfs_open+0xfa>
ffffffffc020826e:	70a6                	ld	ra,104(sp)
ffffffffc0208270:	57f5                	li	a5,-3
ffffffffc0208272:	6a06                	ld	s4,64(sp)
ffffffffc0208274:	853e                	mv	a0,a5
ffffffffc0208276:	6165                	addi	sp,sp,112
ffffffffc0208278:	8082                	ret
ffffffffc020827a:	87bff0ef          	jal	ffffffffc0207af4 <inode_ref_dec>
ffffffffc020827e:	67a2                	ld	a5,8(sp)
ffffffffc0208280:	bf5d                	j	ffffffffc0208236 <vfs_open+0xfa>
ffffffffc0208282:	6562                	ld	a0,24(sp)
ffffffffc0208284:	90dff0ef          	jal	ffffffffc0207b90 <inode_open_dec>
ffffffffc0208288:	6562                	ld	a0,24(sp)
ffffffffc020828a:	86bff0ef          	jal	ffffffffc0207af4 <inode_ref_dec>
ffffffffc020828e:	87a2                	mv	a5,s0
ffffffffc0208290:	b75d                	j	ffffffffc0208236 <vfs_open+0xfa>
ffffffffc0208292:	00006697          	auipc	a3,0x6
ffffffffc0208296:	e4e68693          	addi	a3,a3,-434 # ffffffffc020e0e0 <etext+0x28ee>
ffffffffc020829a:	00004617          	auipc	a2,0x4
ffffffffc020829e:	99660613          	addi	a2,a2,-1642 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02082a2:	03300593          	li	a1,51
ffffffffc02082a6:	00006517          	auipc	a0,0x6
ffffffffc02082aa:	e0a50513          	addi	a0,a0,-502 # ffffffffc020e0b0 <etext+0x28be>
ffffffffc02082ae:	99cf80ef          	jal	ffffffffc020044a <__panic>
ffffffffc02082b2:	00006697          	auipc	a3,0x6
ffffffffc02082b6:	e8668693          	addi	a3,a3,-378 # ffffffffc020e138 <etext+0x2946>
ffffffffc02082ba:	00004617          	auipc	a2,0x4
ffffffffc02082be:	97660613          	addi	a2,a2,-1674 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02082c2:	03a00593          	li	a1,58
ffffffffc02082c6:	00006517          	auipc	a0,0x6
ffffffffc02082ca:	dea50513          	addi	a0,a0,-534 # ffffffffc020e0b0 <etext+0x28be>
ffffffffc02082ce:	97cf80ef          	jal	ffffffffc020044a <__panic>
ffffffffc02082d2:	00006697          	auipc	a3,0x6
ffffffffc02082d6:	dfe68693          	addi	a3,a3,-514 # ffffffffc020e0d0 <etext+0x28de>
ffffffffc02082da:	00004617          	auipc	a2,0x4
ffffffffc02082de:	95660613          	addi	a2,a2,-1706 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02082e2:	03100593          	li	a1,49
ffffffffc02082e6:	00006517          	auipc	a0,0x6
ffffffffc02082ea:	dca50513          	addi	a0,a0,-566 # ffffffffc020e0b0 <etext+0x28be>
ffffffffc02082ee:	95cf80ef          	jal	ffffffffc020044a <__panic>
ffffffffc02082f2:	00006697          	auipc	a3,0x6
ffffffffc02082f6:	d6e68693          	addi	a3,a3,-658 # ffffffffc020e060 <etext+0x286e>
ffffffffc02082fa:	00004617          	auipc	a2,0x4
ffffffffc02082fe:	93660613          	addi	a2,a2,-1738 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0208302:	02c00593          	li	a1,44
ffffffffc0208306:	00006517          	auipc	a0,0x6
ffffffffc020830a:	daa50513          	addi	a0,a0,-598 # ffffffffc020e0b0 <etext+0x28be>
ffffffffc020830e:	93cf80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208312 <vfs_close>:
ffffffffc0208312:	1141                	addi	sp,sp,-16
ffffffffc0208314:	e406                	sd	ra,8(sp)
ffffffffc0208316:	e022                	sd	s0,0(sp)
ffffffffc0208318:	842a                	mv	s0,a0
ffffffffc020831a:	877ff0ef          	jal	ffffffffc0207b90 <inode_open_dec>
ffffffffc020831e:	8522                	mv	a0,s0
ffffffffc0208320:	fd4ff0ef          	jal	ffffffffc0207af4 <inode_ref_dec>
ffffffffc0208324:	60a2                	ld	ra,8(sp)
ffffffffc0208326:	6402                	ld	s0,0(sp)
ffffffffc0208328:	4501                	li	a0,0
ffffffffc020832a:	0141                	addi	sp,sp,16
ffffffffc020832c:	8082                	ret

ffffffffc020832e <get_device>:
ffffffffc020832e:	00054e03          	lbu	t3,0(a0)
ffffffffc0208332:	020e0463          	beqz	t3,ffffffffc020835a <get_device+0x2c>
ffffffffc0208336:	00150693          	addi	a3,a0,1
ffffffffc020833a:	8736                	mv	a4,a3
ffffffffc020833c:	87f2                	mv	a5,t3
ffffffffc020833e:	4801                	li	a6,0
ffffffffc0208340:	03a00893          	li	a7,58
ffffffffc0208344:	02f00313          	li	t1,47
ffffffffc0208348:	01178c63          	beq	a5,a7,ffffffffc0208360 <get_device+0x32>
ffffffffc020834c:	02678e63          	beq	a5,t1,ffffffffc0208388 <get_device+0x5a>
ffffffffc0208350:	00074783          	lbu	a5,0(a4)
ffffffffc0208354:	0705                	addi	a4,a4,1
ffffffffc0208356:	2805                	addiw	a6,a6,1 # fffffffffffff001 <end+0x3fd686f1>
ffffffffc0208358:	fbe5                	bnez	a5,ffffffffc0208348 <get_device+0x1a>
ffffffffc020835a:	e188                	sd	a0,0(a1)
ffffffffc020835c:	8532                	mv	a0,a2
ffffffffc020835e:	a269                	j	ffffffffc02084e8 <vfs_get_curdir>
ffffffffc0208360:	02080663          	beqz	a6,ffffffffc020838c <get_device+0x5e>
ffffffffc0208364:	01050733          	add	a4,a0,a6
ffffffffc0208368:	010687b3          	add	a5,a3,a6
ffffffffc020836c:	00070023          	sb	zero,0(a4)
ffffffffc0208370:	02f00813          	li	a6,47
ffffffffc0208374:	86be                	mv	a3,a5
ffffffffc0208376:	0007c703          	lbu	a4,0(a5)
ffffffffc020837a:	0785                	addi	a5,a5,1
ffffffffc020837c:	ff070ce3          	beq	a4,a6,ffffffffc0208374 <get_device+0x46>
ffffffffc0208380:	e194                	sd	a3,0(a1)
ffffffffc0208382:	85b2                	mv	a1,a2
ffffffffc0208384:	b93ff06f          	j	ffffffffc0207f16 <vfs_get_root>
ffffffffc0208388:	fc0819e3          	bnez	a6,ffffffffc020835a <get_device+0x2c>
ffffffffc020838c:	7139                	addi	sp,sp,-64
ffffffffc020838e:	f822                	sd	s0,48(sp)
ffffffffc0208390:	f426                	sd	s1,40(sp)
ffffffffc0208392:	fc06                	sd	ra,56(sp)
ffffffffc0208394:	02f00793          	li	a5,47
ffffffffc0208398:	8432                	mv	s0,a2
ffffffffc020839a:	84ae                	mv	s1,a1
ffffffffc020839c:	04fe0563          	beq	t3,a5,ffffffffc02083e6 <get_device+0xb8>
ffffffffc02083a0:	03a00793          	li	a5,58
ffffffffc02083a4:	06fe1863          	bne	t3,a5,ffffffffc0208414 <get_device+0xe6>
ffffffffc02083a8:	0828                	addi	a0,sp,24
ffffffffc02083aa:	e436                	sd	a3,8(sp)
ffffffffc02083ac:	13c000ef          	jal	ffffffffc02084e8 <vfs_get_curdir>
ffffffffc02083b0:	e515                	bnez	a0,ffffffffc02083dc <get_device+0xae>
ffffffffc02083b2:	67e2                	ld	a5,24(sp)
ffffffffc02083b4:	77a8                	ld	a0,104(a5)
ffffffffc02083b6:	cd1d                	beqz	a0,ffffffffc02083f4 <get_device+0xc6>
ffffffffc02083b8:	617c                	ld	a5,192(a0)
ffffffffc02083ba:	9782                	jalr	a5
ffffffffc02083bc:	87aa                	mv	a5,a0
ffffffffc02083be:	6562                	ld	a0,24(sp)
ffffffffc02083c0:	e01c                	sd	a5,0(s0)
ffffffffc02083c2:	f32ff0ef          	jal	ffffffffc0207af4 <inode_ref_dec>
ffffffffc02083c6:	66a2                	ld	a3,8(sp)
ffffffffc02083c8:	02f00713          	li	a4,47
ffffffffc02083cc:	a011                	j	ffffffffc02083d0 <get_device+0xa2>
ffffffffc02083ce:	0685                	addi	a3,a3,1
ffffffffc02083d0:	0006c783          	lbu	a5,0(a3)
ffffffffc02083d4:	fee78de3          	beq	a5,a4,ffffffffc02083ce <get_device+0xa0>
ffffffffc02083d8:	e094                	sd	a3,0(s1)
ffffffffc02083da:	4501                	li	a0,0
ffffffffc02083dc:	70e2                	ld	ra,56(sp)
ffffffffc02083de:	7442                	ld	s0,48(sp)
ffffffffc02083e0:	74a2                	ld	s1,40(sp)
ffffffffc02083e2:	6121                	addi	sp,sp,64
ffffffffc02083e4:	8082                	ret
ffffffffc02083e6:	8532                	mv	a0,a2
ffffffffc02083e8:	e436                	sd	a3,8(sp)
ffffffffc02083ea:	8ebff0ef          	jal	ffffffffc0207cd4 <vfs_get_bootfs>
ffffffffc02083ee:	66a2                	ld	a3,8(sp)
ffffffffc02083f0:	dd61                	beqz	a0,ffffffffc02083c8 <get_device+0x9a>
ffffffffc02083f2:	b7ed                	j	ffffffffc02083dc <get_device+0xae>
ffffffffc02083f4:	00006697          	auipc	a3,0x6
ffffffffc02083f8:	dd468693          	addi	a3,a3,-556 # ffffffffc020e1c8 <etext+0x29d6>
ffffffffc02083fc:	00004617          	auipc	a2,0x4
ffffffffc0208400:	83460613          	addi	a2,a2,-1996 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0208404:	03900593          	li	a1,57
ffffffffc0208408:	00006517          	auipc	a0,0x6
ffffffffc020840c:	da850513          	addi	a0,a0,-600 # ffffffffc020e1b0 <etext+0x29be>
ffffffffc0208410:	83af80ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208414:	00006697          	auipc	a3,0x6
ffffffffc0208418:	d8c68693          	addi	a3,a3,-628 # ffffffffc020e1a0 <etext+0x29ae>
ffffffffc020841c:	00004617          	auipc	a2,0x4
ffffffffc0208420:	81460613          	addi	a2,a2,-2028 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0208424:	03300593          	li	a1,51
ffffffffc0208428:	00006517          	auipc	a0,0x6
ffffffffc020842c:	d8850513          	addi	a0,a0,-632 # ffffffffc020e1b0 <etext+0x29be>
ffffffffc0208430:	81af80ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208434 <vfs_lookup>:
ffffffffc0208434:	7139                	addi	sp,sp,-64
ffffffffc0208436:	f822                	sd	s0,48(sp)
ffffffffc0208438:	1030                	addi	a2,sp,40
ffffffffc020843a:	842e                	mv	s0,a1
ffffffffc020843c:	082c                	addi	a1,sp,24
ffffffffc020843e:	fc06                	sd	ra,56(sp)
ffffffffc0208440:	ec2a                	sd	a0,24(sp)
ffffffffc0208442:	eedff0ef          	jal	ffffffffc020832e <get_device>
ffffffffc0208446:	87aa                	mv	a5,a0
ffffffffc0208448:	e121                	bnez	a0,ffffffffc0208488 <vfs_lookup+0x54>
ffffffffc020844a:	6762                	ld	a4,24(sp)
ffffffffc020844c:	7522                	ld	a0,40(sp)
ffffffffc020844e:	00074683          	lbu	a3,0(a4)
ffffffffc0208452:	c2a1                	beqz	a3,ffffffffc0208492 <vfs_lookup+0x5e>
ffffffffc0208454:	c529                	beqz	a0,ffffffffc020849e <vfs_lookup+0x6a>
ffffffffc0208456:	793c                	ld	a5,112(a0)
ffffffffc0208458:	c3b9                	beqz	a5,ffffffffc020849e <vfs_lookup+0x6a>
ffffffffc020845a:	7bbc                	ld	a5,112(a5)
ffffffffc020845c:	c3a9                	beqz	a5,ffffffffc020849e <vfs_lookup+0x6a>
ffffffffc020845e:	00006597          	auipc	a1,0x6
ffffffffc0208462:	dd258593          	addi	a1,a1,-558 # ffffffffc020e230 <etext+0x2a3e>
ffffffffc0208466:	e83a                	sd	a4,16(sp)
ffffffffc0208468:	e42a                	sd	a0,8(sp)
ffffffffc020846a:	dd0ff0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc020846e:	6522                	ld	a0,8(sp)
ffffffffc0208470:	65c2                	ld	a1,16(sp)
ffffffffc0208472:	8622                	mv	a2,s0
ffffffffc0208474:	793c                	ld	a5,112(a0)
ffffffffc0208476:	7522                	ld	a0,40(sp)
ffffffffc0208478:	7bbc                	ld	a5,112(a5)
ffffffffc020847a:	9782                	jalr	a5
ffffffffc020847c:	87aa                	mv	a5,a0
ffffffffc020847e:	7522                	ld	a0,40(sp)
ffffffffc0208480:	e43e                	sd	a5,8(sp)
ffffffffc0208482:	e72ff0ef          	jal	ffffffffc0207af4 <inode_ref_dec>
ffffffffc0208486:	67a2                	ld	a5,8(sp)
ffffffffc0208488:	70e2                	ld	ra,56(sp)
ffffffffc020848a:	7442                	ld	s0,48(sp)
ffffffffc020848c:	853e                	mv	a0,a5
ffffffffc020848e:	6121                	addi	sp,sp,64
ffffffffc0208490:	8082                	ret
ffffffffc0208492:	e008                	sd	a0,0(s0)
ffffffffc0208494:	70e2                	ld	ra,56(sp)
ffffffffc0208496:	7442                	ld	s0,48(sp)
ffffffffc0208498:	853e                	mv	a0,a5
ffffffffc020849a:	6121                	addi	sp,sp,64
ffffffffc020849c:	8082                	ret
ffffffffc020849e:	00006697          	auipc	a3,0x6
ffffffffc02084a2:	d4268693          	addi	a3,a3,-702 # ffffffffc020e1e0 <etext+0x29ee>
ffffffffc02084a6:	00003617          	auipc	a2,0x3
ffffffffc02084aa:	78a60613          	addi	a2,a2,1930 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02084ae:	04f00593          	li	a1,79
ffffffffc02084b2:	00006517          	auipc	a0,0x6
ffffffffc02084b6:	cfe50513          	addi	a0,a0,-770 # ffffffffc020e1b0 <etext+0x29be>
ffffffffc02084ba:	f91f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02084be <vfs_lookup_parent>:
ffffffffc02084be:	7139                	addi	sp,sp,-64
ffffffffc02084c0:	f822                	sd	s0,48(sp)
ffffffffc02084c2:	f426                	sd	s1,40(sp)
ffffffffc02084c4:	8432                	mv	s0,a2
ffffffffc02084c6:	84ae                	mv	s1,a1
ffffffffc02084c8:	0830                	addi	a2,sp,24
ffffffffc02084ca:	002c                	addi	a1,sp,8
ffffffffc02084cc:	fc06                	sd	ra,56(sp)
ffffffffc02084ce:	e42a                	sd	a0,8(sp)
ffffffffc02084d0:	e5fff0ef          	jal	ffffffffc020832e <get_device>
ffffffffc02084d4:	e509                	bnez	a0,ffffffffc02084de <vfs_lookup_parent+0x20>
ffffffffc02084d6:	6722                	ld	a4,8(sp)
ffffffffc02084d8:	67e2                	ld	a5,24(sp)
ffffffffc02084da:	e018                	sd	a4,0(s0)
ffffffffc02084dc:	e09c                	sd	a5,0(s1)
ffffffffc02084de:	70e2                	ld	ra,56(sp)
ffffffffc02084e0:	7442                	ld	s0,48(sp)
ffffffffc02084e2:	74a2                	ld	s1,40(sp)
ffffffffc02084e4:	6121                	addi	sp,sp,64
ffffffffc02084e6:	8082                	ret

ffffffffc02084e8 <vfs_get_curdir>:
ffffffffc02084e8:	0008e797          	auipc	a5,0x8e
ffffffffc02084ec:	3e07b783          	ld	a5,992(a5) # ffffffffc02968c8 <current>
ffffffffc02084f0:	1101                	addi	sp,sp,-32
ffffffffc02084f2:	e822                	sd	s0,16(sp)
ffffffffc02084f4:	1487b783          	ld	a5,328(a5)
ffffffffc02084f8:	ec06                	sd	ra,24(sp)
ffffffffc02084fa:	6380                	ld	s0,0(a5)
ffffffffc02084fc:	cc09                	beqz	s0,ffffffffc0208516 <vfs_get_curdir+0x2e>
ffffffffc02084fe:	e426                	sd	s1,8(sp)
ffffffffc0208500:	84aa                	mv	s1,a0
ffffffffc0208502:	8522                	mv	a0,s0
ffffffffc0208504:	d22ff0ef          	jal	ffffffffc0207a26 <inode_ref_inc>
ffffffffc0208508:	e080                	sd	s0,0(s1)
ffffffffc020850a:	64a2                	ld	s1,8(sp)
ffffffffc020850c:	4501                	li	a0,0
ffffffffc020850e:	60e2                	ld	ra,24(sp)
ffffffffc0208510:	6442                	ld	s0,16(sp)
ffffffffc0208512:	6105                	addi	sp,sp,32
ffffffffc0208514:	8082                	ret
ffffffffc0208516:	5541                	li	a0,-16
ffffffffc0208518:	bfdd                	j	ffffffffc020850e <vfs_get_curdir+0x26>

ffffffffc020851a <vfs_set_curdir>:
ffffffffc020851a:	7139                	addi	sp,sp,-64
ffffffffc020851c:	f04a                	sd	s2,32(sp)
ffffffffc020851e:	0008e917          	auipc	s2,0x8e
ffffffffc0208522:	3aa90913          	addi	s2,s2,938 # ffffffffc02968c8 <current>
ffffffffc0208526:	00093783          	ld	a5,0(s2)
ffffffffc020852a:	f822                	sd	s0,48(sp)
ffffffffc020852c:	842a                	mv	s0,a0
ffffffffc020852e:	1487b503          	ld	a0,328(a5)
ffffffffc0208532:	fc06                	sd	ra,56(sp)
ffffffffc0208534:	f426                	sd	s1,40(sp)
ffffffffc0208536:	d83fc0ef          	jal	ffffffffc02052b8 <lock_files>
ffffffffc020853a:	00093783          	ld	a5,0(s2)
ffffffffc020853e:	1487b503          	ld	a0,328(a5)
ffffffffc0208542:	611c                	ld	a5,0(a0)
ffffffffc0208544:	06f40a63          	beq	s0,a5,ffffffffc02085b8 <vfs_set_curdir+0x9e>
ffffffffc0208548:	c02d                	beqz	s0,ffffffffc02085aa <vfs_set_curdir+0x90>
ffffffffc020854a:	7838                	ld	a4,112(s0)
ffffffffc020854c:	cb25                	beqz	a4,ffffffffc02085bc <vfs_set_curdir+0xa2>
ffffffffc020854e:	6b38                	ld	a4,80(a4)
ffffffffc0208550:	c735                	beqz	a4,ffffffffc02085bc <vfs_set_curdir+0xa2>
ffffffffc0208552:	00006597          	auipc	a1,0x6
ffffffffc0208556:	d4e58593          	addi	a1,a1,-690 # ffffffffc020e2a0 <etext+0x2aae>
ffffffffc020855a:	8522                	mv	a0,s0
ffffffffc020855c:	e43e                	sd	a5,8(sp)
ffffffffc020855e:	cdcff0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc0208562:	7838                	ld	a4,112(s0)
ffffffffc0208564:	086c                	addi	a1,sp,28
ffffffffc0208566:	8522                	mv	a0,s0
ffffffffc0208568:	6b38                	ld	a4,80(a4)
ffffffffc020856a:	9702                	jalr	a4
ffffffffc020856c:	84aa                	mv	s1,a0
ffffffffc020856e:	e909                	bnez	a0,ffffffffc0208580 <vfs_set_curdir+0x66>
ffffffffc0208570:	4772                	lw	a4,28(sp)
ffffffffc0208572:	4609                	li	a2,2
ffffffffc0208574:	54b9                	li	s1,-18
ffffffffc0208576:	40c75693          	srai	a3,a4,0xc
ffffffffc020857a:	8a9d                	andi	a3,a3,7
ffffffffc020857c:	00c68f63          	beq	a3,a2,ffffffffc020859a <vfs_set_curdir+0x80>
ffffffffc0208580:	00093783          	ld	a5,0(s2)
ffffffffc0208584:	1487b503          	ld	a0,328(a5)
ffffffffc0208588:	d37fc0ef          	jal	ffffffffc02052be <unlock_files>
ffffffffc020858c:	70e2                	ld	ra,56(sp)
ffffffffc020858e:	7442                	ld	s0,48(sp)
ffffffffc0208590:	7902                	ld	s2,32(sp)
ffffffffc0208592:	8526                	mv	a0,s1
ffffffffc0208594:	74a2                	ld	s1,40(sp)
ffffffffc0208596:	6121                	addi	sp,sp,64
ffffffffc0208598:	8082                	ret
ffffffffc020859a:	8522                	mv	a0,s0
ffffffffc020859c:	c8aff0ef          	jal	ffffffffc0207a26 <inode_ref_inc>
ffffffffc02085a0:	00093703          	ld	a4,0(s2)
ffffffffc02085a4:	67a2                	ld	a5,8(sp)
ffffffffc02085a6:	14873503          	ld	a0,328(a4)
ffffffffc02085aa:	e100                	sd	s0,0(a0)
ffffffffc02085ac:	4481                	li	s1,0
ffffffffc02085ae:	dfe9                	beqz	a5,ffffffffc0208588 <vfs_set_curdir+0x6e>
ffffffffc02085b0:	853e                	mv	a0,a5
ffffffffc02085b2:	d42ff0ef          	jal	ffffffffc0207af4 <inode_ref_dec>
ffffffffc02085b6:	b7e9                	j	ffffffffc0208580 <vfs_set_curdir+0x66>
ffffffffc02085b8:	4481                	li	s1,0
ffffffffc02085ba:	b7f9                	j	ffffffffc0208588 <vfs_set_curdir+0x6e>
ffffffffc02085bc:	00006697          	auipc	a3,0x6
ffffffffc02085c0:	c7c68693          	addi	a3,a3,-900 # ffffffffc020e238 <etext+0x2a46>
ffffffffc02085c4:	00003617          	auipc	a2,0x3
ffffffffc02085c8:	66c60613          	addi	a2,a2,1644 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02085cc:	04300593          	li	a1,67
ffffffffc02085d0:	00006517          	auipc	a0,0x6
ffffffffc02085d4:	cb850513          	addi	a0,a0,-840 # ffffffffc020e288 <etext+0x2a96>
ffffffffc02085d8:	e73f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02085dc <vfs_chdir>:
ffffffffc02085dc:	7179                	addi	sp,sp,-48
ffffffffc02085de:	082c                	addi	a1,sp,24
ffffffffc02085e0:	f406                	sd	ra,40(sp)
ffffffffc02085e2:	e53ff0ef          	jal	ffffffffc0208434 <vfs_lookup>
ffffffffc02085e6:	87aa                	mv	a5,a0
ffffffffc02085e8:	c509                	beqz	a0,ffffffffc02085f2 <vfs_chdir+0x16>
ffffffffc02085ea:	70a2                	ld	ra,40(sp)
ffffffffc02085ec:	853e                	mv	a0,a5
ffffffffc02085ee:	6145                	addi	sp,sp,48
ffffffffc02085f0:	8082                	ret
ffffffffc02085f2:	6562                	ld	a0,24(sp)
ffffffffc02085f4:	f27ff0ef          	jal	ffffffffc020851a <vfs_set_curdir>
ffffffffc02085f8:	87aa                	mv	a5,a0
ffffffffc02085fa:	6562                	ld	a0,24(sp)
ffffffffc02085fc:	e43e                	sd	a5,8(sp)
ffffffffc02085fe:	cf6ff0ef          	jal	ffffffffc0207af4 <inode_ref_dec>
ffffffffc0208602:	67a2                	ld	a5,8(sp)
ffffffffc0208604:	70a2                	ld	ra,40(sp)
ffffffffc0208606:	853e                	mv	a0,a5
ffffffffc0208608:	6145                	addi	sp,sp,48
ffffffffc020860a:	8082                	ret

ffffffffc020860c <vfs_getcwd>:
ffffffffc020860c:	0008e797          	auipc	a5,0x8e
ffffffffc0208610:	2bc7b783          	ld	a5,700(a5) # ffffffffc02968c8 <current>
ffffffffc0208614:	7179                	addi	sp,sp,-48
ffffffffc0208616:	ec26                	sd	s1,24(sp)
ffffffffc0208618:	1487b783          	ld	a5,328(a5)
ffffffffc020861c:	f406                	sd	ra,40(sp)
ffffffffc020861e:	f022                	sd	s0,32(sp)
ffffffffc0208620:	6384                	ld	s1,0(a5)
ffffffffc0208622:	c0c1                	beqz	s1,ffffffffc02086a2 <vfs_getcwd+0x96>
ffffffffc0208624:	e84a                	sd	s2,16(sp)
ffffffffc0208626:	892a                	mv	s2,a0
ffffffffc0208628:	8526                	mv	a0,s1
ffffffffc020862a:	bfcff0ef          	jal	ffffffffc0207a26 <inode_ref_inc>
ffffffffc020862e:	74a8                	ld	a0,104(s1)
ffffffffc0208630:	c93d                	beqz	a0,ffffffffc02086a6 <vfs_getcwd+0x9a>
ffffffffc0208632:	9a5ff0ef          	jal	ffffffffc0207fd6 <vfs_get_devname>
ffffffffc0208636:	842a                	mv	s0,a0
ffffffffc0208638:	09e030ef          	jal	ffffffffc020b6d6 <strlen>
ffffffffc020863c:	862a                	mv	a2,a0
ffffffffc020863e:	85a2                	mv	a1,s0
ffffffffc0208640:	854a                	mv	a0,s2
ffffffffc0208642:	4701                	li	a4,0
ffffffffc0208644:	4685                	li	a3,1
ffffffffc0208646:	e9dfc0ef          	jal	ffffffffc02054e2 <iobuf_move>
ffffffffc020864a:	842a                	mv	s0,a0
ffffffffc020864c:	c919                	beqz	a0,ffffffffc0208662 <vfs_getcwd+0x56>
ffffffffc020864e:	8526                	mv	a0,s1
ffffffffc0208650:	ca4ff0ef          	jal	ffffffffc0207af4 <inode_ref_dec>
ffffffffc0208654:	6942                	ld	s2,16(sp)
ffffffffc0208656:	70a2                	ld	ra,40(sp)
ffffffffc0208658:	8522                	mv	a0,s0
ffffffffc020865a:	7402                	ld	s0,32(sp)
ffffffffc020865c:	64e2                	ld	s1,24(sp)
ffffffffc020865e:	6145                	addi	sp,sp,48
ffffffffc0208660:	8082                	ret
ffffffffc0208662:	4685                	li	a3,1
ffffffffc0208664:	03a00793          	li	a5,58
ffffffffc0208668:	8636                	mv	a2,a3
ffffffffc020866a:	4701                	li	a4,0
ffffffffc020866c:	00f10593          	addi	a1,sp,15
ffffffffc0208670:	854a                	mv	a0,s2
ffffffffc0208672:	00f107a3          	sb	a5,15(sp)
ffffffffc0208676:	e6dfc0ef          	jal	ffffffffc02054e2 <iobuf_move>
ffffffffc020867a:	842a                	mv	s0,a0
ffffffffc020867c:	f969                	bnez	a0,ffffffffc020864e <vfs_getcwd+0x42>
ffffffffc020867e:	78bc                	ld	a5,112(s1)
ffffffffc0208680:	c3b9                	beqz	a5,ffffffffc02086c6 <vfs_getcwd+0xba>
ffffffffc0208682:	7f9c                	ld	a5,56(a5)
ffffffffc0208684:	c3a9                	beqz	a5,ffffffffc02086c6 <vfs_getcwd+0xba>
ffffffffc0208686:	00006597          	auipc	a1,0x6
ffffffffc020868a:	c7a58593          	addi	a1,a1,-902 # ffffffffc020e300 <etext+0x2b0e>
ffffffffc020868e:	8526                	mv	a0,s1
ffffffffc0208690:	baaff0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc0208694:	78bc                	ld	a5,112(s1)
ffffffffc0208696:	85ca                	mv	a1,s2
ffffffffc0208698:	8526                	mv	a0,s1
ffffffffc020869a:	7f9c                	ld	a5,56(a5)
ffffffffc020869c:	9782                	jalr	a5
ffffffffc020869e:	842a                	mv	s0,a0
ffffffffc02086a0:	b77d                	j	ffffffffc020864e <vfs_getcwd+0x42>
ffffffffc02086a2:	5441                	li	s0,-16
ffffffffc02086a4:	bf4d                	j	ffffffffc0208656 <vfs_getcwd+0x4a>
ffffffffc02086a6:	00006697          	auipc	a3,0x6
ffffffffc02086aa:	b2268693          	addi	a3,a3,-1246 # ffffffffc020e1c8 <etext+0x29d6>
ffffffffc02086ae:	00003617          	auipc	a2,0x3
ffffffffc02086b2:	58260613          	addi	a2,a2,1410 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02086b6:	06e00593          	li	a1,110
ffffffffc02086ba:	00006517          	auipc	a0,0x6
ffffffffc02086be:	bce50513          	addi	a0,a0,-1074 # ffffffffc020e288 <etext+0x2a96>
ffffffffc02086c2:	d89f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc02086c6:	00006697          	auipc	a3,0x6
ffffffffc02086ca:	be268693          	addi	a3,a3,-1054 # ffffffffc020e2a8 <etext+0x2ab6>
ffffffffc02086ce:	00003617          	auipc	a2,0x3
ffffffffc02086d2:	56260613          	addi	a2,a2,1378 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02086d6:	07800593          	li	a1,120
ffffffffc02086da:	00006517          	auipc	a0,0x6
ffffffffc02086de:	bae50513          	addi	a0,a0,-1106 # ffffffffc020e288 <etext+0x2a96>
ffffffffc02086e2:	d69f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02086e6 <dev_lookup>:
ffffffffc02086e6:	0005c703          	lbu	a4,0(a1)
ffffffffc02086ea:	ef11                	bnez	a4,ffffffffc0208706 <dev_lookup+0x20>
ffffffffc02086ec:	1101                	addi	sp,sp,-32
ffffffffc02086ee:	ec06                	sd	ra,24(sp)
ffffffffc02086f0:	e032                	sd	a2,0(sp)
ffffffffc02086f2:	e42a                	sd	a0,8(sp)
ffffffffc02086f4:	b32ff0ef          	jal	ffffffffc0207a26 <inode_ref_inc>
ffffffffc02086f8:	6602                	ld	a2,0(sp)
ffffffffc02086fa:	67a2                	ld	a5,8(sp)
ffffffffc02086fc:	60e2                	ld	ra,24(sp)
ffffffffc02086fe:	4501                	li	a0,0
ffffffffc0208700:	e21c                	sd	a5,0(a2)
ffffffffc0208702:	6105                	addi	sp,sp,32
ffffffffc0208704:	8082                	ret
ffffffffc0208706:	5541                	li	a0,-16
ffffffffc0208708:	8082                	ret

ffffffffc020870a <dev_fstat>:
ffffffffc020870a:	1101                	addi	sp,sp,-32
ffffffffc020870c:	e822                	sd	s0,16(sp)
ffffffffc020870e:	e426                	sd	s1,8(sp)
ffffffffc0208710:	842a                	mv	s0,a0
ffffffffc0208712:	84ae                	mv	s1,a1
ffffffffc0208714:	852e                	mv	a0,a1
ffffffffc0208716:	02000613          	li	a2,32
ffffffffc020871a:	4581                	li	a1,0
ffffffffc020871c:	ec06                	sd	ra,24(sp)
ffffffffc020871e:	06c030ef          	jal	ffffffffc020b78a <memset>
ffffffffc0208722:	c429                	beqz	s0,ffffffffc020876c <dev_fstat+0x62>
ffffffffc0208724:	783c                	ld	a5,112(s0)
ffffffffc0208726:	c3b9                	beqz	a5,ffffffffc020876c <dev_fstat+0x62>
ffffffffc0208728:	6bbc                	ld	a5,80(a5)
ffffffffc020872a:	c3a9                	beqz	a5,ffffffffc020876c <dev_fstat+0x62>
ffffffffc020872c:	00006597          	auipc	a1,0x6
ffffffffc0208730:	b7458593          	addi	a1,a1,-1164 # ffffffffc020e2a0 <etext+0x2aae>
ffffffffc0208734:	8522                	mv	a0,s0
ffffffffc0208736:	b04ff0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc020873a:	783c                	ld	a5,112(s0)
ffffffffc020873c:	85a6                	mv	a1,s1
ffffffffc020873e:	8522                	mv	a0,s0
ffffffffc0208740:	6bbc                	ld	a5,80(a5)
ffffffffc0208742:	9782                	jalr	a5
ffffffffc0208744:	ed19                	bnez	a0,ffffffffc0208762 <dev_fstat+0x58>
ffffffffc0208746:	4c38                	lw	a4,88(s0)
ffffffffc0208748:	6785                	lui	a5,0x1
ffffffffc020874a:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020874e:	02f71f63          	bne	a4,a5,ffffffffc020878c <dev_fstat+0x82>
ffffffffc0208752:	6018                	ld	a4,0(s0)
ffffffffc0208754:	641c                	ld	a5,8(s0)
ffffffffc0208756:	4685                	li	a3,1
ffffffffc0208758:	e898                	sd	a4,16(s1)
ffffffffc020875a:	02e787b3          	mul	a5,a5,a4
ffffffffc020875e:	e494                	sd	a3,8(s1)
ffffffffc0208760:	ec9c                	sd	a5,24(s1)
ffffffffc0208762:	60e2                	ld	ra,24(sp)
ffffffffc0208764:	6442                	ld	s0,16(sp)
ffffffffc0208766:	64a2                	ld	s1,8(sp)
ffffffffc0208768:	6105                	addi	sp,sp,32
ffffffffc020876a:	8082                	ret
ffffffffc020876c:	00006697          	auipc	a3,0x6
ffffffffc0208770:	acc68693          	addi	a3,a3,-1332 # ffffffffc020e238 <etext+0x2a46>
ffffffffc0208774:	00003617          	auipc	a2,0x3
ffffffffc0208778:	4bc60613          	addi	a2,a2,1212 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020877c:	04200593          	li	a1,66
ffffffffc0208780:	00006517          	auipc	a0,0x6
ffffffffc0208784:	b9050513          	addi	a0,a0,-1136 # ffffffffc020e310 <etext+0x2b1e>
ffffffffc0208788:	cc3f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc020878c:	00006697          	auipc	a3,0x6
ffffffffc0208790:	87468693          	addi	a3,a3,-1932 # ffffffffc020e000 <etext+0x280e>
ffffffffc0208794:	00003617          	auipc	a2,0x3
ffffffffc0208798:	49c60613          	addi	a2,a2,1180 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020879c:	04500593          	li	a1,69
ffffffffc02087a0:	00006517          	auipc	a0,0x6
ffffffffc02087a4:	b7050513          	addi	a0,a0,-1168 # ffffffffc020e310 <etext+0x2b1e>
ffffffffc02087a8:	ca3f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02087ac <dev_ioctl>:
ffffffffc02087ac:	c909                	beqz	a0,ffffffffc02087be <dev_ioctl+0x12>
ffffffffc02087ae:	4d34                	lw	a3,88(a0)
ffffffffc02087b0:	6705                	lui	a4,0x1
ffffffffc02087b2:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02087b6:	00e69463          	bne	a3,a4,ffffffffc02087be <dev_ioctl+0x12>
ffffffffc02087ba:	751c                	ld	a5,40(a0)
ffffffffc02087bc:	8782                	jr	a5
ffffffffc02087be:	1141                	addi	sp,sp,-16
ffffffffc02087c0:	00006697          	auipc	a3,0x6
ffffffffc02087c4:	84068693          	addi	a3,a3,-1984 # ffffffffc020e000 <etext+0x280e>
ffffffffc02087c8:	00003617          	auipc	a2,0x3
ffffffffc02087cc:	46860613          	addi	a2,a2,1128 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02087d0:	03500593          	li	a1,53
ffffffffc02087d4:	00006517          	auipc	a0,0x6
ffffffffc02087d8:	b3c50513          	addi	a0,a0,-1220 # ffffffffc020e310 <etext+0x2b1e>
ffffffffc02087dc:	e406                	sd	ra,8(sp)
ffffffffc02087de:	c6df70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02087e2 <dev_tryseek>:
ffffffffc02087e2:	c51d                	beqz	a0,ffffffffc0208810 <dev_tryseek+0x2e>
ffffffffc02087e4:	4d38                	lw	a4,88(a0)
ffffffffc02087e6:	6785                	lui	a5,0x1
ffffffffc02087e8:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02087ec:	02f71263          	bne	a4,a5,ffffffffc0208810 <dev_tryseek+0x2e>
ffffffffc02087f0:	611c                	ld	a5,0(a0)
ffffffffc02087f2:	cf89                	beqz	a5,ffffffffc020880c <dev_tryseek+0x2a>
ffffffffc02087f4:	6518                	ld	a4,8(a0)
ffffffffc02087f6:	02e5f6b3          	remu	a3,a1,a4
ffffffffc02087fa:	ea89                	bnez	a3,ffffffffc020880c <dev_tryseek+0x2a>
ffffffffc02087fc:	0005c863          	bltz	a1,ffffffffc020880c <dev_tryseek+0x2a>
ffffffffc0208800:	02e787b3          	mul	a5,a5,a4
ffffffffc0208804:	4501                	li	a0,0
ffffffffc0208806:	00f5f363          	bgeu	a1,a5,ffffffffc020880c <dev_tryseek+0x2a>
ffffffffc020880a:	8082                	ret
ffffffffc020880c:	5575                	li	a0,-3
ffffffffc020880e:	8082                	ret
ffffffffc0208810:	1141                	addi	sp,sp,-16
ffffffffc0208812:	00005697          	auipc	a3,0x5
ffffffffc0208816:	7ee68693          	addi	a3,a3,2030 # ffffffffc020e000 <etext+0x280e>
ffffffffc020881a:	00003617          	auipc	a2,0x3
ffffffffc020881e:	41660613          	addi	a2,a2,1046 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0208822:	05f00593          	li	a1,95
ffffffffc0208826:	00006517          	auipc	a0,0x6
ffffffffc020882a:	aea50513          	addi	a0,a0,-1302 # ffffffffc020e310 <etext+0x2b1e>
ffffffffc020882e:	e406                	sd	ra,8(sp)
ffffffffc0208830:	c1bf70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208834 <dev_gettype>:
ffffffffc0208834:	cd11                	beqz	a0,ffffffffc0208850 <dev_gettype+0x1c>
ffffffffc0208836:	4d38                	lw	a4,88(a0)
ffffffffc0208838:	6785                	lui	a5,0x1
ffffffffc020883a:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020883e:	00f71963          	bne	a4,a5,ffffffffc0208850 <dev_gettype+0x1c>
ffffffffc0208842:	6118                	ld	a4,0(a0)
ffffffffc0208844:	6791                	lui	a5,0x4
ffffffffc0208846:	c311                	beqz	a4,ffffffffc020884a <dev_gettype+0x16>
ffffffffc0208848:	6795                	lui	a5,0x5
ffffffffc020884a:	c19c                	sw	a5,0(a1)
ffffffffc020884c:	4501                	li	a0,0
ffffffffc020884e:	8082                	ret
ffffffffc0208850:	1141                	addi	sp,sp,-16
ffffffffc0208852:	00005697          	auipc	a3,0x5
ffffffffc0208856:	7ae68693          	addi	a3,a3,1966 # ffffffffc020e000 <etext+0x280e>
ffffffffc020885a:	00003617          	auipc	a2,0x3
ffffffffc020885e:	3d660613          	addi	a2,a2,982 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0208862:	05300593          	li	a1,83
ffffffffc0208866:	00006517          	auipc	a0,0x6
ffffffffc020886a:	aaa50513          	addi	a0,a0,-1366 # ffffffffc020e310 <etext+0x2b1e>
ffffffffc020886e:	e406                	sd	ra,8(sp)
ffffffffc0208870:	bdbf70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208874 <dev_write>:
ffffffffc0208874:	c911                	beqz	a0,ffffffffc0208888 <dev_write+0x14>
ffffffffc0208876:	4d34                	lw	a3,88(a0)
ffffffffc0208878:	6705                	lui	a4,0x1
ffffffffc020887a:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020887e:	00e69563          	bne	a3,a4,ffffffffc0208888 <dev_write+0x14>
ffffffffc0208882:	711c                	ld	a5,32(a0)
ffffffffc0208884:	4605                	li	a2,1
ffffffffc0208886:	8782                	jr	a5
ffffffffc0208888:	1141                	addi	sp,sp,-16
ffffffffc020888a:	00005697          	auipc	a3,0x5
ffffffffc020888e:	77668693          	addi	a3,a3,1910 # ffffffffc020e000 <etext+0x280e>
ffffffffc0208892:	00003617          	auipc	a2,0x3
ffffffffc0208896:	39e60613          	addi	a2,a2,926 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020889a:	02c00593          	li	a1,44
ffffffffc020889e:	00006517          	auipc	a0,0x6
ffffffffc02088a2:	a7250513          	addi	a0,a0,-1422 # ffffffffc020e310 <etext+0x2b1e>
ffffffffc02088a6:	e406                	sd	ra,8(sp)
ffffffffc02088a8:	ba3f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02088ac <dev_read>:
ffffffffc02088ac:	c911                	beqz	a0,ffffffffc02088c0 <dev_read+0x14>
ffffffffc02088ae:	4d34                	lw	a3,88(a0)
ffffffffc02088b0:	6705                	lui	a4,0x1
ffffffffc02088b2:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02088b6:	00e69563          	bne	a3,a4,ffffffffc02088c0 <dev_read+0x14>
ffffffffc02088ba:	711c                	ld	a5,32(a0)
ffffffffc02088bc:	4601                	li	a2,0
ffffffffc02088be:	8782                	jr	a5
ffffffffc02088c0:	1141                	addi	sp,sp,-16
ffffffffc02088c2:	00005697          	auipc	a3,0x5
ffffffffc02088c6:	73e68693          	addi	a3,a3,1854 # ffffffffc020e000 <etext+0x280e>
ffffffffc02088ca:	00003617          	auipc	a2,0x3
ffffffffc02088ce:	36660613          	addi	a2,a2,870 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02088d2:	02300593          	li	a1,35
ffffffffc02088d6:	00006517          	auipc	a0,0x6
ffffffffc02088da:	a3a50513          	addi	a0,a0,-1478 # ffffffffc020e310 <etext+0x2b1e>
ffffffffc02088de:	e406                	sd	ra,8(sp)
ffffffffc02088e0:	b6bf70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02088e4 <dev_close>:
ffffffffc02088e4:	c909                	beqz	a0,ffffffffc02088f6 <dev_close+0x12>
ffffffffc02088e6:	4d34                	lw	a3,88(a0)
ffffffffc02088e8:	6705                	lui	a4,0x1
ffffffffc02088ea:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02088ee:	00e69463          	bne	a3,a4,ffffffffc02088f6 <dev_close+0x12>
ffffffffc02088f2:	6d1c                	ld	a5,24(a0)
ffffffffc02088f4:	8782                	jr	a5
ffffffffc02088f6:	1141                	addi	sp,sp,-16
ffffffffc02088f8:	00005697          	auipc	a3,0x5
ffffffffc02088fc:	70868693          	addi	a3,a3,1800 # ffffffffc020e000 <etext+0x280e>
ffffffffc0208900:	00003617          	auipc	a2,0x3
ffffffffc0208904:	33060613          	addi	a2,a2,816 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0208908:	45e9                	li	a1,26
ffffffffc020890a:	00006517          	auipc	a0,0x6
ffffffffc020890e:	a0650513          	addi	a0,a0,-1530 # ffffffffc020e310 <etext+0x2b1e>
ffffffffc0208912:	e406                	sd	ra,8(sp)
ffffffffc0208914:	b37f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208918 <dev_open>:
ffffffffc0208918:	03c5f793          	andi	a5,a1,60
ffffffffc020891c:	eb91                	bnez	a5,ffffffffc0208930 <dev_open+0x18>
ffffffffc020891e:	c919                	beqz	a0,ffffffffc0208934 <dev_open+0x1c>
ffffffffc0208920:	4d34                	lw	a3,88(a0)
ffffffffc0208922:	6785                	lui	a5,0x1
ffffffffc0208924:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208928:	00f69663          	bne	a3,a5,ffffffffc0208934 <dev_open+0x1c>
ffffffffc020892c:	691c                	ld	a5,16(a0)
ffffffffc020892e:	8782                	jr	a5
ffffffffc0208930:	5575                	li	a0,-3
ffffffffc0208932:	8082                	ret
ffffffffc0208934:	1141                	addi	sp,sp,-16
ffffffffc0208936:	00005697          	auipc	a3,0x5
ffffffffc020893a:	6ca68693          	addi	a3,a3,1738 # ffffffffc020e000 <etext+0x280e>
ffffffffc020893e:	00003617          	auipc	a2,0x3
ffffffffc0208942:	2f260613          	addi	a2,a2,754 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0208946:	45c5                	li	a1,17
ffffffffc0208948:	00006517          	auipc	a0,0x6
ffffffffc020894c:	9c850513          	addi	a0,a0,-1592 # ffffffffc020e310 <etext+0x2b1e>
ffffffffc0208950:	e406                	sd	ra,8(sp)
ffffffffc0208952:	af9f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208956 <dev_init>:
ffffffffc0208956:	1141                	addi	sp,sp,-16
ffffffffc0208958:	e406                	sd	ra,8(sp)
ffffffffc020895a:	544000ef          	jal	ffffffffc0208e9e <dev_init_stdin>
ffffffffc020895e:	65c000ef          	jal	ffffffffc0208fba <dev_init_stdout>
ffffffffc0208962:	60a2                	ld	ra,8(sp)
ffffffffc0208964:	0141                	addi	sp,sp,16
ffffffffc0208966:	ac01                	j	ffffffffc0208b76 <dev_init_disk0>

ffffffffc0208968 <dev_create_inode>:
ffffffffc0208968:	6505                	lui	a0,0x1
ffffffffc020896a:	1101                	addi	sp,sp,-32
ffffffffc020896c:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208970:	ec06                	sd	ra,24(sp)
ffffffffc0208972:	836ff0ef          	jal	ffffffffc02079a8 <__alloc_inode>
ffffffffc0208976:	87aa                	mv	a5,a0
ffffffffc0208978:	c911                	beqz	a0,ffffffffc020898c <dev_create_inode+0x24>
ffffffffc020897a:	4601                	li	a2,0
ffffffffc020897c:	00007597          	auipc	a1,0x7
ffffffffc0208980:	db458593          	addi	a1,a1,-588 # ffffffffc020f730 <dev_node_ops>
ffffffffc0208984:	e42a                	sd	a0,8(sp)
ffffffffc0208986:	83eff0ef          	jal	ffffffffc02079c4 <inode_init>
ffffffffc020898a:	67a2                	ld	a5,8(sp)
ffffffffc020898c:	60e2                	ld	ra,24(sp)
ffffffffc020898e:	853e                	mv	a0,a5
ffffffffc0208990:	6105                	addi	sp,sp,32
ffffffffc0208992:	8082                	ret

ffffffffc0208994 <disk0_open>:
ffffffffc0208994:	4501                	li	a0,0
ffffffffc0208996:	8082                	ret

ffffffffc0208998 <disk0_close>:
ffffffffc0208998:	4501                	li	a0,0
ffffffffc020899a:	8082                	ret

ffffffffc020899c <disk0_ioctl>:
ffffffffc020899c:	5531                	li	a0,-20
ffffffffc020899e:	8082                	ret

ffffffffc02089a0 <disk0_io>:
ffffffffc02089a0:	711d                	addi	sp,sp,-96
ffffffffc02089a2:	6594                	ld	a3,8(a1)
ffffffffc02089a4:	e8a2                	sd	s0,80(sp)
ffffffffc02089a6:	6d80                	ld	s0,24(a1)
ffffffffc02089a8:	6785                	lui	a5,0x1
ffffffffc02089aa:	17fd                	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc02089ac:	0086e733          	or	a4,a3,s0
ffffffffc02089b0:	ec86                	sd	ra,88(sp)
ffffffffc02089b2:	8f7d                	and	a4,a4,a5
ffffffffc02089b4:	14071663          	bnez	a4,ffffffffc0208b00 <disk0_io+0x160>
ffffffffc02089b8:	e0ca                	sd	s2,64(sp)
ffffffffc02089ba:	43f6d913          	srai	s2,a3,0x3f
ffffffffc02089be:	00f97933          	and	s2,s2,a5
ffffffffc02089c2:	9936                	add	s2,s2,a3
ffffffffc02089c4:	40c95913          	srai	s2,s2,0xc
ffffffffc02089c8:	00c45793          	srli	a5,s0,0xc
ffffffffc02089cc:	0127873b          	addw	a4,a5,s2
ffffffffc02089d0:	6114                	ld	a3,0(a0)
ffffffffc02089d2:	1702                	slli	a4,a4,0x20
ffffffffc02089d4:	9301                	srli	a4,a4,0x20
ffffffffc02089d6:	2901                	sext.w	s2,s2
ffffffffc02089d8:	2781                	sext.w	a5,a5
ffffffffc02089da:	12e6e063          	bltu	a3,a4,ffffffffc0208afa <disk0_io+0x15a>
ffffffffc02089de:	e799                	bnez	a5,ffffffffc02089ec <disk0_io+0x4c>
ffffffffc02089e0:	6906                	ld	s2,64(sp)
ffffffffc02089e2:	4501                	li	a0,0
ffffffffc02089e4:	60e6                	ld	ra,88(sp)
ffffffffc02089e6:	6446                	ld	s0,80(sp)
ffffffffc02089e8:	6125                	addi	sp,sp,96
ffffffffc02089ea:	8082                	ret
ffffffffc02089ec:	0008d517          	auipc	a0,0x8d
ffffffffc02089f0:	e5450513          	addi	a0,a0,-428 # ffffffffc0295840 <disk0_sem>
ffffffffc02089f4:	e4a6                	sd	s1,72(sp)
ffffffffc02089f6:	f852                	sd	s4,48(sp)
ffffffffc02089f8:	f456                	sd	s5,40(sp)
ffffffffc02089fa:	84b2                	mv	s1,a2
ffffffffc02089fc:	8aae                	mv	s5,a1
ffffffffc02089fe:	0008ea17          	auipc	s4,0x8e
ffffffffc0208a02:	efaa0a13          	addi	s4,s4,-262 # ffffffffc02968f8 <disk0_buffer>
ffffffffc0208a06:	c3dfb0ef          	jal	ffffffffc0204642 <down>
ffffffffc0208a0a:	000a3603          	ld	a2,0(s4)
ffffffffc0208a0e:	e8ad                	bnez	s1,ffffffffc0208a80 <disk0_io+0xe0>
ffffffffc0208a10:	e862                	sd	s8,16(sp)
ffffffffc0208a12:	fc4e                	sd	s3,56(sp)
ffffffffc0208a14:	ec5e                	sd	s7,24(sp)
ffffffffc0208a16:	6c11                	lui	s8,0x4
ffffffffc0208a18:	a029                	j	ffffffffc0208a22 <disk0_io+0x82>
ffffffffc0208a1a:	000a3603          	ld	a2,0(s4)
ffffffffc0208a1e:	0129893b          	addw	s2,s3,s2
ffffffffc0208a22:	84a2                	mv	s1,s0
ffffffffc0208a24:	008c7363          	bgeu	s8,s0,ffffffffc0208a2a <disk0_io+0x8a>
ffffffffc0208a28:	6491                	lui	s1,0x4
ffffffffc0208a2a:	00c4d993          	srli	s3,s1,0xc
ffffffffc0208a2e:	2981                	sext.w	s3,s3
ffffffffc0208a30:	00399b9b          	slliw	s7,s3,0x3
ffffffffc0208a34:	020b9693          	slli	a3,s7,0x20
ffffffffc0208a38:	9281                	srli	a3,a3,0x20
ffffffffc0208a3a:	0039159b          	slliw	a1,s2,0x3
ffffffffc0208a3e:	4509                	li	a0,2
ffffffffc0208a40:	85ef80ef          	jal	ffffffffc0200a9e <ide_read_secs>
ffffffffc0208a44:	e16d                	bnez	a0,ffffffffc0208b26 <disk0_io+0x186>
ffffffffc0208a46:	000a3583          	ld	a1,0(s4)
ffffffffc0208a4a:	0038                	addi	a4,sp,8
ffffffffc0208a4c:	4685                	li	a3,1
ffffffffc0208a4e:	8626                	mv	a2,s1
ffffffffc0208a50:	8556                	mv	a0,s5
ffffffffc0208a52:	a91fc0ef          	jal	ffffffffc02054e2 <iobuf_move>
ffffffffc0208a56:	67a2                	ld	a5,8(sp)
ffffffffc0208a58:	0a979663          	bne	a5,s1,ffffffffc0208b04 <disk0_io+0x164>
ffffffffc0208a5c:	03449793          	slli	a5,s1,0x34
ffffffffc0208a60:	e3d5                	bnez	a5,ffffffffc0208b04 <disk0_io+0x164>
ffffffffc0208a62:	8c05                	sub	s0,s0,s1
ffffffffc0208a64:	f85d                	bnez	s0,ffffffffc0208a1a <disk0_io+0x7a>
ffffffffc0208a66:	79e2                	ld	s3,56(sp)
ffffffffc0208a68:	6be2                	ld	s7,24(sp)
ffffffffc0208a6a:	6c42                	ld	s8,16(sp)
ffffffffc0208a6c:	0008d517          	auipc	a0,0x8d
ffffffffc0208a70:	dd450513          	addi	a0,a0,-556 # ffffffffc0295840 <disk0_sem>
ffffffffc0208a74:	bcbfb0ef          	jal	ffffffffc020463e <up>
ffffffffc0208a78:	64a6                	ld	s1,72(sp)
ffffffffc0208a7a:	7a42                	ld	s4,48(sp)
ffffffffc0208a7c:	7aa2                	ld	s5,40(sp)
ffffffffc0208a7e:	b78d                	j	ffffffffc02089e0 <disk0_io+0x40>
ffffffffc0208a80:	f05a                	sd	s6,32(sp)
ffffffffc0208a82:	a029                	j	ffffffffc0208a8c <disk0_io+0xec>
ffffffffc0208a84:	000a3603          	ld	a2,0(s4)
ffffffffc0208a88:	0124893b          	addw	s2,s1,s2
ffffffffc0208a8c:	85b2                	mv	a1,a2
ffffffffc0208a8e:	0038                	addi	a4,sp,8
ffffffffc0208a90:	4681                	li	a3,0
ffffffffc0208a92:	6611                	lui	a2,0x4
ffffffffc0208a94:	8556                	mv	a0,s5
ffffffffc0208a96:	a4dfc0ef          	jal	ffffffffc02054e2 <iobuf_move>
ffffffffc0208a9a:	67a2                	ld	a5,8(sp)
ffffffffc0208a9c:	fff78713          	addi	a4,a5,-1
ffffffffc0208aa0:	02877a63          	bgeu	a4,s0,ffffffffc0208ad4 <disk0_io+0x134>
ffffffffc0208aa4:	03479713          	slli	a4,a5,0x34
ffffffffc0208aa8:	e715                	bnez	a4,ffffffffc0208ad4 <disk0_io+0x134>
ffffffffc0208aaa:	83b1                	srli	a5,a5,0xc
ffffffffc0208aac:	0007849b          	sext.w	s1,a5
ffffffffc0208ab0:	00349b1b          	slliw	s6,s1,0x3
ffffffffc0208ab4:	000a3603          	ld	a2,0(s4)
ffffffffc0208ab8:	020b1693          	slli	a3,s6,0x20
ffffffffc0208abc:	9281                	srli	a3,a3,0x20
ffffffffc0208abe:	0039159b          	slliw	a1,s2,0x3
ffffffffc0208ac2:	4509                	li	a0,2
ffffffffc0208ac4:	874f80ef          	jal	ffffffffc0200b38 <ide_write_secs>
ffffffffc0208ac8:	e151                	bnez	a0,ffffffffc0208b4c <disk0_io+0x1ac>
ffffffffc0208aca:	67a2                	ld	a5,8(sp)
ffffffffc0208acc:	8c1d                	sub	s0,s0,a5
ffffffffc0208ace:	f85d                	bnez	s0,ffffffffc0208a84 <disk0_io+0xe4>
ffffffffc0208ad0:	7b02                	ld	s6,32(sp)
ffffffffc0208ad2:	bf69                	j	ffffffffc0208a6c <disk0_io+0xcc>
ffffffffc0208ad4:	00006697          	auipc	a3,0x6
ffffffffc0208ad8:	85468693          	addi	a3,a3,-1964 # ffffffffc020e328 <etext+0x2b36>
ffffffffc0208adc:	00003617          	auipc	a2,0x3
ffffffffc0208ae0:	15460613          	addi	a2,a2,340 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0208ae4:	05700593          	li	a1,87
ffffffffc0208ae8:	00006517          	auipc	a0,0x6
ffffffffc0208aec:	88050513          	addi	a0,a0,-1920 # ffffffffc020e368 <etext+0x2b76>
ffffffffc0208af0:	fc4e                	sd	s3,56(sp)
ffffffffc0208af2:	ec5e                	sd	s7,24(sp)
ffffffffc0208af4:	e862                	sd	s8,16(sp)
ffffffffc0208af6:	955f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208afa:	6906                	ld	s2,64(sp)
ffffffffc0208afc:	5575                	li	a0,-3
ffffffffc0208afe:	b5dd                	j	ffffffffc02089e4 <disk0_io+0x44>
ffffffffc0208b00:	5575                	li	a0,-3
ffffffffc0208b02:	b5cd                	j	ffffffffc02089e4 <disk0_io+0x44>
ffffffffc0208b04:	00006697          	auipc	a3,0x6
ffffffffc0208b08:	91c68693          	addi	a3,a3,-1764 # ffffffffc020e420 <etext+0x2c2e>
ffffffffc0208b0c:	00003617          	auipc	a2,0x3
ffffffffc0208b10:	12460613          	addi	a2,a2,292 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0208b14:	06200593          	li	a1,98
ffffffffc0208b18:	00006517          	auipc	a0,0x6
ffffffffc0208b1c:	85050513          	addi	a0,a0,-1968 # ffffffffc020e368 <etext+0x2b76>
ffffffffc0208b20:	f05a                	sd	s6,32(sp)
ffffffffc0208b22:	929f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208b26:	88aa                	mv	a7,a0
ffffffffc0208b28:	885e                	mv	a6,s7
ffffffffc0208b2a:	87ce                	mv	a5,s3
ffffffffc0208b2c:	0039171b          	slliw	a4,s2,0x3
ffffffffc0208b30:	86ca                	mv	a3,s2
ffffffffc0208b32:	00006617          	auipc	a2,0x6
ffffffffc0208b36:	8a660613          	addi	a2,a2,-1882 # ffffffffc020e3d8 <etext+0x2be6>
ffffffffc0208b3a:	02d00593          	li	a1,45
ffffffffc0208b3e:	00006517          	auipc	a0,0x6
ffffffffc0208b42:	82a50513          	addi	a0,a0,-2006 # ffffffffc020e368 <etext+0x2b76>
ffffffffc0208b46:	f05a                	sd	s6,32(sp)
ffffffffc0208b48:	903f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208b4c:	88aa                	mv	a7,a0
ffffffffc0208b4e:	885a                	mv	a6,s6
ffffffffc0208b50:	87a6                	mv	a5,s1
ffffffffc0208b52:	0039171b          	slliw	a4,s2,0x3
ffffffffc0208b56:	86ca                	mv	a3,s2
ffffffffc0208b58:	00006617          	auipc	a2,0x6
ffffffffc0208b5c:	83060613          	addi	a2,a2,-2000 # ffffffffc020e388 <etext+0x2b96>
ffffffffc0208b60:	03700593          	li	a1,55
ffffffffc0208b64:	00006517          	auipc	a0,0x6
ffffffffc0208b68:	80450513          	addi	a0,a0,-2044 # ffffffffc020e368 <etext+0x2b76>
ffffffffc0208b6c:	fc4e                	sd	s3,56(sp)
ffffffffc0208b6e:	ec5e                	sd	s7,24(sp)
ffffffffc0208b70:	e862                	sd	s8,16(sp)
ffffffffc0208b72:	8d9f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208b76 <dev_init_disk0>:
ffffffffc0208b76:	1101                	addi	sp,sp,-32
ffffffffc0208b78:	ec06                	sd	ra,24(sp)
ffffffffc0208b7a:	e822                	sd	s0,16(sp)
ffffffffc0208b7c:	e426                	sd	s1,8(sp)
ffffffffc0208b7e:	debff0ef          	jal	ffffffffc0208968 <dev_create_inode>
ffffffffc0208b82:	c541                	beqz	a0,ffffffffc0208c0a <dev_init_disk0+0x94>
ffffffffc0208b84:	4d38                	lw	a4,88(a0)
ffffffffc0208b86:	6785                	lui	a5,0x1
ffffffffc0208b88:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208b8c:	842a                	mv	s0,a0
ffffffffc0208b8e:	6485                	lui	s1,0x1
ffffffffc0208b90:	0cf71e63          	bne	a4,a5,ffffffffc0208c6c <dev_init_disk0+0xf6>
ffffffffc0208b94:	4509                	li	a0,2
ffffffffc0208b96:	ebdf70ef          	jal	ffffffffc0200a52 <ide_device_valid>
ffffffffc0208b9a:	cd4d                	beqz	a0,ffffffffc0208c54 <dev_init_disk0+0xde>
ffffffffc0208b9c:	4509                	li	a0,2
ffffffffc0208b9e:	ed9f70ef          	jal	ffffffffc0200a76 <ide_device_size>
ffffffffc0208ba2:	00000797          	auipc	a5,0x0
ffffffffc0208ba6:	dfa78793          	addi	a5,a5,-518 # ffffffffc020899c <disk0_ioctl>
ffffffffc0208baa:	00000617          	auipc	a2,0x0
ffffffffc0208bae:	dea60613          	addi	a2,a2,-534 # ffffffffc0208994 <disk0_open>
ffffffffc0208bb2:	00000697          	auipc	a3,0x0
ffffffffc0208bb6:	de668693          	addi	a3,a3,-538 # ffffffffc0208998 <disk0_close>
ffffffffc0208bba:	00000717          	auipc	a4,0x0
ffffffffc0208bbe:	de670713          	addi	a4,a4,-538 # ffffffffc02089a0 <disk0_io>
ffffffffc0208bc2:	810d                	srli	a0,a0,0x3
ffffffffc0208bc4:	f41c                	sd	a5,40(s0)
ffffffffc0208bc6:	e008                	sd	a0,0(s0)
ffffffffc0208bc8:	e810                	sd	a2,16(s0)
ffffffffc0208bca:	ec14                	sd	a3,24(s0)
ffffffffc0208bcc:	f018                	sd	a4,32(s0)
ffffffffc0208bce:	4585                	li	a1,1
ffffffffc0208bd0:	0008d517          	auipc	a0,0x8d
ffffffffc0208bd4:	c7050513          	addi	a0,a0,-912 # ffffffffc0295840 <disk0_sem>
ffffffffc0208bd8:	e404                	sd	s1,8(s0)
ffffffffc0208bda:	a5ffb0ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc0208bde:	6511                	lui	a0,0x4
ffffffffc0208be0:	be0f90ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0208be4:	0008e797          	auipc	a5,0x8e
ffffffffc0208be8:	d0a7ba23          	sd	a0,-748(a5) # ffffffffc02968f8 <disk0_buffer>
ffffffffc0208bec:	c921                	beqz	a0,ffffffffc0208c3c <dev_init_disk0+0xc6>
ffffffffc0208bee:	85a2                	mv	a1,s0
ffffffffc0208bf0:	4605                	li	a2,1
ffffffffc0208bf2:	00006517          	auipc	a0,0x6
ffffffffc0208bf6:	8be50513          	addi	a0,a0,-1858 # ffffffffc020e4b0 <etext+0x2cbe>
ffffffffc0208bfa:	c26ff0ef          	jal	ffffffffc0208020 <vfs_add_dev>
ffffffffc0208bfe:	e115                	bnez	a0,ffffffffc0208c22 <dev_init_disk0+0xac>
ffffffffc0208c00:	60e2                	ld	ra,24(sp)
ffffffffc0208c02:	6442                	ld	s0,16(sp)
ffffffffc0208c04:	64a2                	ld	s1,8(sp)
ffffffffc0208c06:	6105                	addi	sp,sp,32
ffffffffc0208c08:	8082                	ret
ffffffffc0208c0a:	00006617          	auipc	a2,0x6
ffffffffc0208c0e:	84660613          	addi	a2,a2,-1978 # ffffffffc020e450 <etext+0x2c5e>
ffffffffc0208c12:	08700593          	li	a1,135
ffffffffc0208c16:	00005517          	auipc	a0,0x5
ffffffffc0208c1a:	75250513          	addi	a0,a0,1874 # ffffffffc020e368 <etext+0x2b76>
ffffffffc0208c1e:	82df70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208c22:	86aa                	mv	a3,a0
ffffffffc0208c24:	00006617          	auipc	a2,0x6
ffffffffc0208c28:	89460613          	addi	a2,a2,-1900 # ffffffffc020e4b8 <etext+0x2cc6>
ffffffffc0208c2c:	08d00593          	li	a1,141
ffffffffc0208c30:	00005517          	auipc	a0,0x5
ffffffffc0208c34:	73850513          	addi	a0,a0,1848 # ffffffffc020e368 <etext+0x2b76>
ffffffffc0208c38:	813f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208c3c:	00006617          	auipc	a2,0x6
ffffffffc0208c40:	85460613          	addi	a2,a2,-1964 # ffffffffc020e490 <etext+0x2c9e>
ffffffffc0208c44:	07f00593          	li	a1,127
ffffffffc0208c48:	00005517          	auipc	a0,0x5
ffffffffc0208c4c:	72050513          	addi	a0,a0,1824 # ffffffffc020e368 <etext+0x2b76>
ffffffffc0208c50:	ffaf70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208c54:	00006617          	auipc	a2,0x6
ffffffffc0208c58:	81c60613          	addi	a2,a2,-2020 # ffffffffc020e470 <etext+0x2c7e>
ffffffffc0208c5c:	07300593          	li	a1,115
ffffffffc0208c60:	00005517          	auipc	a0,0x5
ffffffffc0208c64:	70850513          	addi	a0,a0,1800 # ffffffffc020e368 <etext+0x2b76>
ffffffffc0208c68:	fe2f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208c6c:	00005697          	auipc	a3,0x5
ffffffffc0208c70:	39468693          	addi	a3,a3,916 # ffffffffc020e000 <etext+0x280e>
ffffffffc0208c74:	00003617          	auipc	a2,0x3
ffffffffc0208c78:	fbc60613          	addi	a2,a2,-68 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0208c7c:	08900593          	li	a1,137
ffffffffc0208c80:	00005517          	auipc	a0,0x5
ffffffffc0208c84:	6e850513          	addi	a0,a0,1768 # ffffffffc020e368 <etext+0x2b76>
ffffffffc0208c88:	fc2f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208c8c <stdin_open>:
ffffffffc0208c8c:	e199                	bnez	a1,ffffffffc0208c92 <stdin_open+0x6>
ffffffffc0208c8e:	4501                	li	a0,0
ffffffffc0208c90:	8082                	ret
ffffffffc0208c92:	5575                	li	a0,-3
ffffffffc0208c94:	8082                	ret

ffffffffc0208c96 <stdin_close>:
ffffffffc0208c96:	4501                	li	a0,0
ffffffffc0208c98:	8082                	ret

ffffffffc0208c9a <stdin_ioctl>:
ffffffffc0208c9a:	5575                	li	a0,-3
ffffffffc0208c9c:	8082                	ret

ffffffffc0208c9e <stdin_io>:
ffffffffc0208c9e:	14061f63          	bnez	a2,ffffffffc0208dfc <stdin_io+0x15e>
ffffffffc0208ca2:	7175                	addi	sp,sp,-144
ffffffffc0208ca4:	ecd6                	sd	s5,88(sp)
ffffffffc0208ca6:	e8da                	sd	s6,80(sp)
ffffffffc0208ca8:	e4de                	sd	s7,72(sp)
ffffffffc0208caa:	0185bb03          	ld	s6,24(a1)
ffffffffc0208cae:	0005bb83          	ld	s7,0(a1)
ffffffffc0208cb2:	e506                	sd	ra,136(sp)
ffffffffc0208cb4:	e122                	sd	s0,128(sp)
ffffffffc0208cb6:	8aae                	mv	s5,a1
ffffffffc0208cb8:	100027f3          	csrr	a5,sstatus
ffffffffc0208cbc:	8b89                	andi	a5,a5,2
ffffffffc0208cbe:	12079663          	bnez	a5,ffffffffc0208dea <stdin_io+0x14c>
ffffffffc0208cc2:	4401                	li	s0,0
ffffffffc0208cc4:	120b0a63          	beqz	s6,ffffffffc0208df8 <stdin_io+0x15a>
ffffffffc0208cc8:	f8ca                	sd	s2,112(sp)
ffffffffc0208cca:	0008e917          	auipc	s2,0x8e
ffffffffc0208cce:	c3e90913          	addi	s2,s2,-962 # ffffffffc0296908 <p_rpos>
ffffffffc0208cd2:	00093783          	ld	a5,0(s2)
ffffffffc0208cd6:	fca6                	sd	s1,120(sp)
ffffffffc0208cd8:	6705                	lui	a4,0x1
ffffffffc0208cda:	800004b7          	lui	s1,0x80000
ffffffffc0208cde:	f4ce                	sd	s3,104(sp)
ffffffffc0208ce0:	f0d2                	sd	s4,96(sp)
ffffffffc0208ce2:	e0e2                	sd	s8,64(sp)
ffffffffc0208ce4:	0491                	addi	s1,s1,4 # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc0208ce6:	fff70c13          	addi	s8,a4,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0208cea:	4a01                	li	s4,0
ffffffffc0208cec:	0008e997          	auipc	s3,0x8e
ffffffffc0208cf0:	c1498993          	addi	s3,s3,-1004 # ffffffffc0296900 <p_wpos>
ffffffffc0208cf4:	0009b703          	ld	a4,0(s3)
ffffffffc0208cf8:	02e7d763          	bge	a5,a4,ffffffffc0208d26 <stdin_io+0x88>
ffffffffc0208cfc:	a045                	j	ffffffffc0208d9c <stdin_io+0xfe>
ffffffffc0208cfe:	fd2fe0ef          	jal	ffffffffc02074d0 <schedule>
ffffffffc0208d02:	100027f3          	csrr	a5,sstatus
ffffffffc0208d06:	8b89                	andi	a5,a5,2
ffffffffc0208d08:	4401                	li	s0,0
ffffffffc0208d0a:	e3b1                	bnez	a5,ffffffffc0208d4e <stdin_io+0xb0>
ffffffffc0208d0c:	0828                	addi	a0,sp,24
ffffffffc0208d0e:	9c5fb0ef          	jal	ffffffffc02046d2 <wait_in_queue>
ffffffffc0208d12:	e529                	bnez	a0,ffffffffc0208d5c <stdin_io+0xbe>
ffffffffc0208d14:	5782                	lw	a5,32(sp)
ffffffffc0208d16:	04979d63          	bne	a5,s1,ffffffffc0208d70 <stdin_io+0xd2>
ffffffffc0208d1a:	00093783          	ld	a5,0(s2)
ffffffffc0208d1e:	0009b703          	ld	a4,0(s3)
ffffffffc0208d22:	06e7cd63          	blt	a5,a4,ffffffffc0208d9c <stdin_io+0xfe>
ffffffffc0208d26:	80000637          	lui	a2,0x80000
ffffffffc0208d2a:	0611                	addi	a2,a2,4 # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc0208d2c:	082c                	addi	a1,sp,24
ffffffffc0208d2e:	0008d517          	auipc	a0,0x8d
ffffffffc0208d32:	b2a50513          	addi	a0,a0,-1238 # ffffffffc0295858 <__wait_queue>
ffffffffc0208d36:	ac9fb0ef          	jal	ffffffffc02047fe <wait_current_set>
ffffffffc0208d3a:	d071                	beqz	s0,ffffffffc0208cfe <stdin_io+0x60>
ffffffffc0208d3c:	e97f70ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0208d40:	f90fe0ef          	jal	ffffffffc02074d0 <schedule>
ffffffffc0208d44:	100027f3          	csrr	a5,sstatus
ffffffffc0208d48:	8b89                	andi	a5,a5,2
ffffffffc0208d4a:	4401                	li	s0,0
ffffffffc0208d4c:	d3e1                	beqz	a5,ffffffffc0208d0c <stdin_io+0x6e>
ffffffffc0208d4e:	e8bf70ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0208d52:	0828                	addi	a0,sp,24
ffffffffc0208d54:	4405                	li	s0,1
ffffffffc0208d56:	97dfb0ef          	jal	ffffffffc02046d2 <wait_in_queue>
ffffffffc0208d5a:	dd4d                	beqz	a0,ffffffffc0208d14 <stdin_io+0x76>
ffffffffc0208d5c:	082c                	addi	a1,sp,24
ffffffffc0208d5e:	0008d517          	auipc	a0,0x8d
ffffffffc0208d62:	afa50513          	addi	a0,a0,-1286 # ffffffffc0295858 <__wait_queue>
ffffffffc0208d66:	913fb0ef          	jal	ffffffffc0204678 <wait_queue_del>
ffffffffc0208d6a:	5782                	lw	a5,32(sp)
ffffffffc0208d6c:	fa9787e3          	beq	a5,s1,ffffffffc0208d1a <stdin_io+0x7c>
ffffffffc0208d70:	000a051b          	sext.w	a0,s4
ffffffffc0208d74:	e42d                	bnez	s0,ffffffffc0208dde <stdin_io+0x140>
ffffffffc0208d76:	c519                	beqz	a0,ffffffffc0208d84 <stdin_io+0xe6>
ffffffffc0208d78:	018ab783          	ld	a5,24(s5)
ffffffffc0208d7c:	414787b3          	sub	a5,a5,s4
ffffffffc0208d80:	00fabc23          	sd	a5,24(s5)
ffffffffc0208d84:	74e6                	ld	s1,120(sp)
ffffffffc0208d86:	7946                	ld	s2,112(sp)
ffffffffc0208d88:	79a6                	ld	s3,104(sp)
ffffffffc0208d8a:	7a06                	ld	s4,96(sp)
ffffffffc0208d8c:	6c06                	ld	s8,64(sp)
ffffffffc0208d8e:	60aa                	ld	ra,136(sp)
ffffffffc0208d90:	640a                	ld	s0,128(sp)
ffffffffc0208d92:	6ae6                	ld	s5,88(sp)
ffffffffc0208d94:	6b46                	ld	s6,80(sp)
ffffffffc0208d96:	6ba6                	ld	s7,72(sp)
ffffffffc0208d98:	6149                	addi	sp,sp,144
ffffffffc0208d9a:	8082                	ret
ffffffffc0208d9c:	43f7d693          	srai	a3,a5,0x3f
ffffffffc0208da0:	92d1                	srli	a3,a3,0x34
ffffffffc0208da2:	00d78733          	add	a4,a5,a3
ffffffffc0208da6:	01877733          	and	a4,a4,s8
ffffffffc0208daa:	8f15                	sub	a4,a4,a3
ffffffffc0208dac:	0008d697          	auipc	a3,0x8d
ffffffffc0208db0:	abc68693          	addi	a3,a3,-1348 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208db4:	9736                	add	a4,a4,a3
ffffffffc0208db6:	00074683          	lbu	a3,0(a4)
ffffffffc0208dba:	0785                	addi	a5,a5,1
ffffffffc0208dbc:	014b8733          	add	a4,s7,s4
ffffffffc0208dc0:	001a051b          	addiw	a0,s4,1
ffffffffc0208dc4:	00f93023          	sd	a5,0(s2)
ffffffffc0208dc8:	00d70023          	sb	a3,0(a4)
ffffffffc0208dcc:	0a05                	addi	s4,s4,1
ffffffffc0208dce:	f36a63e3          	bltu	s4,s6,ffffffffc0208cf4 <stdin_io+0x56>
ffffffffc0208dd2:	d05d                	beqz	s0,ffffffffc0208d78 <stdin_io+0xda>
ffffffffc0208dd4:	e42a                	sd	a0,8(sp)
ffffffffc0208dd6:	dfdf70ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0208dda:	6522                	ld	a0,8(sp)
ffffffffc0208ddc:	bf71                	j	ffffffffc0208d78 <stdin_io+0xda>
ffffffffc0208dde:	e42a                	sd	a0,8(sp)
ffffffffc0208de0:	df3f70ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0208de4:	6522                	ld	a0,8(sp)
ffffffffc0208de6:	f949                	bnez	a0,ffffffffc0208d78 <stdin_io+0xda>
ffffffffc0208de8:	bf71                	j	ffffffffc0208d84 <stdin_io+0xe6>
ffffffffc0208dea:	deff70ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0208dee:	4405                	li	s0,1
ffffffffc0208df0:	ec0b1ce3          	bnez	s6,ffffffffc0208cc8 <stdin_io+0x2a>
ffffffffc0208df4:	ddff70ef          	jal	ffffffffc0200bd2 <intr_enable>
ffffffffc0208df8:	4501                	li	a0,0
ffffffffc0208dfa:	bf51                	j	ffffffffc0208d8e <stdin_io+0xf0>
ffffffffc0208dfc:	5575                	li	a0,-3
ffffffffc0208dfe:	8082                	ret

ffffffffc0208e00 <dev_stdin_write>:
ffffffffc0208e00:	e111                	bnez	a0,ffffffffc0208e04 <dev_stdin_write+0x4>
ffffffffc0208e02:	8082                	ret
ffffffffc0208e04:	1101                	addi	sp,sp,-32
ffffffffc0208e06:	ec06                	sd	ra,24(sp)
ffffffffc0208e08:	e822                	sd	s0,16(sp)
ffffffffc0208e0a:	100027f3          	csrr	a5,sstatus
ffffffffc0208e0e:	8b89                	andi	a5,a5,2
ffffffffc0208e10:	4401                	li	s0,0
ffffffffc0208e12:	e3c1                	bnez	a5,ffffffffc0208e92 <dev_stdin_write+0x92>
ffffffffc0208e14:	0008e717          	auipc	a4,0x8e
ffffffffc0208e18:	aec73703          	ld	a4,-1300(a4) # ffffffffc0296900 <p_wpos>
ffffffffc0208e1c:	6585                	lui	a1,0x1
ffffffffc0208e1e:	fff58613          	addi	a2,a1,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0208e22:	43f75693          	srai	a3,a4,0x3f
ffffffffc0208e26:	92d1                	srli	a3,a3,0x34
ffffffffc0208e28:	00d707b3          	add	a5,a4,a3
ffffffffc0208e2c:	8ff1                	and	a5,a5,a2
ffffffffc0208e2e:	0008e617          	auipc	a2,0x8e
ffffffffc0208e32:	ada63603          	ld	a2,-1318(a2) # ffffffffc0296908 <p_rpos>
ffffffffc0208e36:	8f95                	sub	a5,a5,a3
ffffffffc0208e38:	0008d697          	auipc	a3,0x8d
ffffffffc0208e3c:	a3068693          	addi	a3,a3,-1488 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208e40:	97b6                	add	a5,a5,a3
ffffffffc0208e42:	00a78023          	sb	a0,0(a5)
ffffffffc0208e46:	40c707b3          	sub	a5,a4,a2
ffffffffc0208e4a:	00b7d763          	bge	a5,a1,ffffffffc0208e58 <dev_stdin_write+0x58>
ffffffffc0208e4e:	0705                	addi	a4,a4,1
ffffffffc0208e50:	0008e797          	auipc	a5,0x8e
ffffffffc0208e54:	aae7b823          	sd	a4,-1360(a5) # ffffffffc0296900 <p_wpos>
ffffffffc0208e58:	0008d517          	auipc	a0,0x8d
ffffffffc0208e5c:	a0050513          	addi	a0,a0,-1536 # ffffffffc0295858 <__wait_queue>
ffffffffc0208e60:	867fb0ef          	jal	ffffffffc02046c6 <wait_queue_empty>
ffffffffc0208e64:	c919                	beqz	a0,ffffffffc0208e7a <dev_stdin_write+0x7a>
ffffffffc0208e66:	e409                	bnez	s0,ffffffffc0208e70 <dev_stdin_write+0x70>
ffffffffc0208e68:	60e2                	ld	ra,24(sp)
ffffffffc0208e6a:	6442                	ld	s0,16(sp)
ffffffffc0208e6c:	6105                	addi	sp,sp,32
ffffffffc0208e6e:	8082                	ret
ffffffffc0208e70:	6442                	ld	s0,16(sp)
ffffffffc0208e72:	60e2                	ld	ra,24(sp)
ffffffffc0208e74:	6105                	addi	sp,sp,32
ffffffffc0208e76:	d5df706f          	j	ffffffffc0200bd2 <intr_enable>
ffffffffc0208e7a:	800005b7          	lui	a1,0x80000
ffffffffc0208e7e:	0591                	addi	a1,a1,4 # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc0208e80:	4605                	li	a2,1
ffffffffc0208e82:	0008d517          	auipc	a0,0x8d
ffffffffc0208e86:	9d650513          	addi	a0,a0,-1578 # ffffffffc0295858 <__wait_queue>
ffffffffc0208e8a:	8a5fb0ef          	jal	ffffffffc020472e <wakeup_queue>
ffffffffc0208e8e:	dc69                	beqz	s0,ffffffffc0208e68 <dev_stdin_write+0x68>
ffffffffc0208e90:	b7c5                	j	ffffffffc0208e70 <dev_stdin_write+0x70>
ffffffffc0208e92:	e42a                	sd	a0,8(sp)
ffffffffc0208e94:	d45f70ef          	jal	ffffffffc0200bd8 <intr_disable>
ffffffffc0208e98:	6522                	ld	a0,8(sp)
ffffffffc0208e9a:	4405                	li	s0,1
ffffffffc0208e9c:	bfa5                	j	ffffffffc0208e14 <dev_stdin_write+0x14>

ffffffffc0208e9e <dev_init_stdin>:
ffffffffc0208e9e:	1101                	addi	sp,sp,-32
ffffffffc0208ea0:	ec06                	sd	ra,24(sp)
ffffffffc0208ea2:	ac7ff0ef          	jal	ffffffffc0208968 <dev_create_inode>
ffffffffc0208ea6:	c935                	beqz	a0,ffffffffc0208f1a <dev_init_stdin+0x7c>
ffffffffc0208ea8:	4d38                	lw	a4,88(a0)
ffffffffc0208eaa:	6785                	lui	a5,0x1
ffffffffc0208eac:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208eb0:	08f71e63          	bne	a4,a5,ffffffffc0208f4c <dev_init_stdin+0xae>
ffffffffc0208eb4:	4785                	li	a5,1
ffffffffc0208eb6:	e51c                	sd	a5,8(a0)
ffffffffc0208eb8:	00000797          	auipc	a5,0x0
ffffffffc0208ebc:	dd478793          	addi	a5,a5,-556 # ffffffffc0208c8c <stdin_open>
ffffffffc0208ec0:	e91c                	sd	a5,16(a0)
ffffffffc0208ec2:	00000797          	auipc	a5,0x0
ffffffffc0208ec6:	dd478793          	addi	a5,a5,-556 # ffffffffc0208c96 <stdin_close>
ffffffffc0208eca:	ed1c                	sd	a5,24(a0)
ffffffffc0208ecc:	00000797          	auipc	a5,0x0
ffffffffc0208ed0:	dd278793          	addi	a5,a5,-558 # ffffffffc0208c9e <stdin_io>
ffffffffc0208ed4:	f11c                	sd	a5,32(a0)
ffffffffc0208ed6:	00000797          	auipc	a5,0x0
ffffffffc0208eda:	dc478793          	addi	a5,a5,-572 # ffffffffc0208c9a <stdin_ioctl>
ffffffffc0208ede:	f51c                	sd	a5,40(a0)
ffffffffc0208ee0:	00053023          	sd	zero,0(a0)
ffffffffc0208ee4:	e42a                	sd	a0,8(sp)
ffffffffc0208ee6:	0008d517          	auipc	a0,0x8d
ffffffffc0208eea:	97250513          	addi	a0,a0,-1678 # ffffffffc0295858 <__wait_queue>
ffffffffc0208eee:	0008e797          	auipc	a5,0x8e
ffffffffc0208ef2:	a007b923          	sd	zero,-1518(a5) # ffffffffc0296900 <p_wpos>
ffffffffc0208ef6:	0008e797          	auipc	a5,0x8e
ffffffffc0208efa:	a007b923          	sd	zero,-1518(a5) # ffffffffc0296908 <p_rpos>
ffffffffc0208efe:	f74fb0ef          	jal	ffffffffc0204672 <wait_queue_init>
ffffffffc0208f02:	65a2                	ld	a1,8(sp)
ffffffffc0208f04:	4601                	li	a2,0
ffffffffc0208f06:	00005517          	auipc	a0,0x5
ffffffffc0208f0a:	61250513          	addi	a0,a0,1554 # ffffffffc020e518 <etext+0x2d26>
ffffffffc0208f0e:	912ff0ef          	jal	ffffffffc0208020 <vfs_add_dev>
ffffffffc0208f12:	e105                	bnez	a0,ffffffffc0208f32 <dev_init_stdin+0x94>
ffffffffc0208f14:	60e2                	ld	ra,24(sp)
ffffffffc0208f16:	6105                	addi	sp,sp,32
ffffffffc0208f18:	8082                	ret
ffffffffc0208f1a:	00005617          	auipc	a2,0x5
ffffffffc0208f1e:	5be60613          	addi	a2,a2,1470 # ffffffffc020e4d8 <etext+0x2ce6>
ffffffffc0208f22:	07500593          	li	a1,117
ffffffffc0208f26:	00005517          	auipc	a0,0x5
ffffffffc0208f2a:	5d250513          	addi	a0,a0,1490 # ffffffffc020e4f8 <etext+0x2d06>
ffffffffc0208f2e:	d1cf70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208f32:	86aa                	mv	a3,a0
ffffffffc0208f34:	00005617          	auipc	a2,0x5
ffffffffc0208f38:	5ec60613          	addi	a2,a2,1516 # ffffffffc020e520 <etext+0x2d2e>
ffffffffc0208f3c:	07b00593          	li	a1,123
ffffffffc0208f40:	00005517          	auipc	a0,0x5
ffffffffc0208f44:	5b850513          	addi	a0,a0,1464 # ffffffffc020e4f8 <etext+0x2d06>
ffffffffc0208f48:	d02f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0208f4c:	00005697          	auipc	a3,0x5
ffffffffc0208f50:	0b468693          	addi	a3,a3,180 # ffffffffc020e000 <etext+0x280e>
ffffffffc0208f54:	00003617          	auipc	a2,0x3
ffffffffc0208f58:	cdc60613          	addi	a2,a2,-804 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0208f5c:	07700593          	li	a1,119
ffffffffc0208f60:	00005517          	auipc	a0,0x5
ffffffffc0208f64:	59850513          	addi	a0,a0,1432 # ffffffffc020e4f8 <etext+0x2d06>
ffffffffc0208f68:	ce2f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0208f6c <stdout_open>:
ffffffffc0208f6c:	4785                	li	a5,1
ffffffffc0208f6e:	00f59463          	bne	a1,a5,ffffffffc0208f76 <stdout_open+0xa>
ffffffffc0208f72:	4501                	li	a0,0
ffffffffc0208f74:	8082                	ret
ffffffffc0208f76:	5575                	li	a0,-3
ffffffffc0208f78:	8082                	ret

ffffffffc0208f7a <stdout_close>:
ffffffffc0208f7a:	4501                	li	a0,0
ffffffffc0208f7c:	8082                	ret

ffffffffc0208f7e <stdout_ioctl>:
ffffffffc0208f7e:	5575                	li	a0,-3
ffffffffc0208f80:	8082                	ret

ffffffffc0208f82 <stdout_io>:
ffffffffc0208f82:	ca15                	beqz	a2,ffffffffc0208fb6 <stdout_io+0x34>
ffffffffc0208f84:	6d9c                	ld	a5,24(a1)
ffffffffc0208f86:	c795                	beqz	a5,ffffffffc0208fb2 <stdout_io+0x30>
ffffffffc0208f88:	1101                	addi	sp,sp,-32
ffffffffc0208f8a:	e822                	sd	s0,16(sp)
ffffffffc0208f8c:	6180                	ld	s0,0(a1)
ffffffffc0208f8e:	e426                	sd	s1,8(sp)
ffffffffc0208f90:	ec06                	sd	ra,24(sp)
ffffffffc0208f92:	84ae                	mv	s1,a1
ffffffffc0208f94:	00044503          	lbu	a0,0(s0)
ffffffffc0208f98:	0405                	addi	s0,s0,1
ffffffffc0208f9a:	a46f70ef          	jal	ffffffffc02001e0 <cputchar>
ffffffffc0208f9e:	6c9c                	ld	a5,24(s1)
ffffffffc0208fa0:	17fd                	addi	a5,a5,-1
ffffffffc0208fa2:	ec9c                	sd	a5,24(s1)
ffffffffc0208fa4:	fbe5                	bnez	a5,ffffffffc0208f94 <stdout_io+0x12>
ffffffffc0208fa6:	60e2                	ld	ra,24(sp)
ffffffffc0208fa8:	6442                	ld	s0,16(sp)
ffffffffc0208faa:	64a2                	ld	s1,8(sp)
ffffffffc0208fac:	4501                	li	a0,0
ffffffffc0208fae:	6105                	addi	sp,sp,32
ffffffffc0208fb0:	8082                	ret
ffffffffc0208fb2:	4501                	li	a0,0
ffffffffc0208fb4:	8082                	ret
ffffffffc0208fb6:	5575                	li	a0,-3
ffffffffc0208fb8:	8082                	ret

ffffffffc0208fba <dev_init_stdout>:
ffffffffc0208fba:	1141                	addi	sp,sp,-16
ffffffffc0208fbc:	e406                	sd	ra,8(sp)
ffffffffc0208fbe:	9abff0ef          	jal	ffffffffc0208968 <dev_create_inode>
ffffffffc0208fc2:	c939                	beqz	a0,ffffffffc0209018 <dev_init_stdout+0x5e>
ffffffffc0208fc4:	4d38                	lw	a4,88(a0)
ffffffffc0208fc6:	6785                	lui	a5,0x1
ffffffffc0208fc8:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208fcc:	06f71f63          	bne	a4,a5,ffffffffc020904a <dev_init_stdout+0x90>
ffffffffc0208fd0:	4785                	li	a5,1
ffffffffc0208fd2:	e51c                	sd	a5,8(a0)
ffffffffc0208fd4:	00000797          	auipc	a5,0x0
ffffffffc0208fd8:	f9878793          	addi	a5,a5,-104 # ffffffffc0208f6c <stdout_open>
ffffffffc0208fdc:	e91c                	sd	a5,16(a0)
ffffffffc0208fde:	00000797          	auipc	a5,0x0
ffffffffc0208fe2:	f9c78793          	addi	a5,a5,-100 # ffffffffc0208f7a <stdout_close>
ffffffffc0208fe6:	ed1c                	sd	a5,24(a0)
ffffffffc0208fe8:	00000797          	auipc	a5,0x0
ffffffffc0208fec:	f9a78793          	addi	a5,a5,-102 # ffffffffc0208f82 <stdout_io>
ffffffffc0208ff0:	f11c                	sd	a5,32(a0)
ffffffffc0208ff2:	00000797          	auipc	a5,0x0
ffffffffc0208ff6:	f8c78793          	addi	a5,a5,-116 # ffffffffc0208f7e <stdout_ioctl>
ffffffffc0208ffa:	f51c                	sd	a5,40(a0)
ffffffffc0208ffc:	00053023          	sd	zero,0(a0)
ffffffffc0209000:	85aa                	mv	a1,a0
ffffffffc0209002:	4601                	li	a2,0
ffffffffc0209004:	00005517          	auipc	a0,0x5
ffffffffc0209008:	57c50513          	addi	a0,a0,1404 # ffffffffc020e580 <etext+0x2d8e>
ffffffffc020900c:	814ff0ef          	jal	ffffffffc0208020 <vfs_add_dev>
ffffffffc0209010:	e105                	bnez	a0,ffffffffc0209030 <dev_init_stdout+0x76>
ffffffffc0209012:	60a2                	ld	ra,8(sp)
ffffffffc0209014:	0141                	addi	sp,sp,16
ffffffffc0209016:	8082                	ret
ffffffffc0209018:	00005617          	auipc	a2,0x5
ffffffffc020901c:	52860613          	addi	a2,a2,1320 # ffffffffc020e540 <etext+0x2d4e>
ffffffffc0209020:	03700593          	li	a1,55
ffffffffc0209024:	00005517          	auipc	a0,0x5
ffffffffc0209028:	53c50513          	addi	a0,a0,1340 # ffffffffc020e560 <etext+0x2d6e>
ffffffffc020902c:	c1ef70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209030:	86aa                	mv	a3,a0
ffffffffc0209032:	00005617          	auipc	a2,0x5
ffffffffc0209036:	55660613          	addi	a2,a2,1366 # ffffffffc020e588 <etext+0x2d96>
ffffffffc020903a:	03d00593          	li	a1,61
ffffffffc020903e:	00005517          	auipc	a0,0x5
ffffffffc0209042:	52250513          	addi	a0,a0,1314 # ffffffffc020e560 <etext+0x2d6e>
ffffffffc0209046:	c04f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc020904a:	00005697          	auipc	a3,0x5
ffffffffc020904e:	fb668693          	addi	a3,a3,-74 # ffffffffc020e000 <etext+0x280e>
ffffffffc0209052:	00003617          	auipc	a2,0x3
ffffffffc0209056:	bde60613          	addi	a2,a2,-1058 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020905a:	03900593          	li	a1,57
ffffffffc020905e:	00005517          	auipc	a0,0x5
ffffffffc0209062:	50250513          	addi	a0,a0,1282 # ffffffffc020e560 <etext+0x2d6e>
ffffffffc0209066:	be4f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc020906a <bitmap_translate.part.0>:
ffffffffc020906a:	1141                	addi	sp,sp,-16
ffffffffc020906c:	00005697          	auipc	a3,0x5
ffffffffc0209070:	53c68693          	addi	a3,a3,1340 # ffffffffc020e5a8 <etext+0x2db6>
ffffffffc0209074:	00003617          	auipc	a2,0x3
ffffffffc0209078:	bbc60613          	addi	a2,a2,-1092 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020907c:	04c00593          	li	a1,76
ffffffffc0209080:	00005517          	auipc	a0,0x5
ffffffffc0209084:	54050513          	addi	a0,a0,1344 # ffffffffc020e5c0 <etext+0x2dce>
ffffffffc0209088:	e406                	sd	ra,8(sp)
ffffffffc020908a:	bc0f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc020908e <bitmap_create>:
ffffffffc020908e:	7139                	addi	sp,sp,-64
ffffffffc0209090:	fc06                	sd	ra,56(sp)
ffffffffc0209092:	f822                	sd	s0,48(sp)
ffffffffc0209094:	f426                	sd	s1,40(sp)
ffffffffc0209096:	c179                	beqz	a0,ffffffffc020915c <bitmap_create+0xce>
ffffffffc0209098:	842a                	mv	s0,a0
ffffffffc020909a:	4541                	li	a0,16
ffffffffc020909c:	f25f80ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc02090a0:	84aa                	mv	s1,a0
ffffffffc02090a2:	c555                	beqz	a0,ffffffffc020914e <bitmap_create+0xc0>
ffffffffc02090a4:	e852                	sd	s4,16(sp)
ffffffffc02090a6:	02041a13          	slli	s4,s0,0x20
ffffffffc02090aa:	020a5a13          	srli	s4,s4,0x20
ffffffffc02090ae:	f04a                	sd	s2,32(sp)
ffffffffc02090b0:	01fa0913          	addi	s2,s4,31
ffffffffc02090b4:	ec4e                	sd	s3,24(sp)
ffffffffc02090b6:	00595993          	srli	s3,s2,0x5
ffffffffc02090ba:	00299613          	slli	a2,s3,0x2
ffffffffc02090be:	8532                	mv	a0,a2
ffffffffc02090c0:	e432                	sd	a2,8(sp)
ffffffffc02090c2:	efff80ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc02090c6:	6622                	ld	a2,8(sp)
ffffffffc02090c8:	cd2d                	beqz	a0,ffffffffc0209142 <bitmap_create+0xb4>
ffffffffc02090ca:	c080                	sw	s0,0(s1)
ffffffffc02090cc:	0134a223          	sw	s3,4(s1)
ffffffffc02090d0:	0ff00593          	li	a1,255
ffffffffc02090d4:	6b6020ef          	jal	ffffffffc020b78a <memset>
ffffffffc02090d8:	4785                	li	a5,1
ffffffffc02090da:	1796                	slli	a5,a5,0x25
ffffffffc02090dc:	1781                	addi	a5,a5,-32
ffffffffc02090de:	e488                	sd	a0,8(s1)
ffffffffc02090e0:	00f97933          	and	s2,s2,a5
ffffffffc02090e4:	052a0663          	beq	s4,s2,ffffffffc0209130 <bitmap_create+0xa2>
ffffffffc02090e8:	39fd                	addiw	s3,s3,-1
ffffffffc02090ea:	0054571b          	srliw	a4,s0,0x5
ffffffffc02090ee:	0b371963          	bne	a4,s3,ffffffffc02091a0 <bitmap_create+0x112>
ffffffffc02090f2:	0057179b          	slliw	a5,a4,0x5
ffffffffc02090f6:	40f407bb          	subw	a5,s0,a5
ffffffffc02090fa:	fff7861b          	addiw	a2,a5,-1
ffffffffc02090fe:	46f9                	li	a3,30
ffffffffc0209100:	08c6e063          	bltu	a3,a2,ffffffffc0209180 <bitmap_create+0xf2>
ffffffffc0209104:	070a                	slli	a4,a4,0x2
ffffffffc0209106:	953a                	add	a0,a0,a4
ffffffffc0209108:	4118                	lw	a4,0(a0)
ffffffffc020910a:	4585                	li	a1,1
ffffffffc020910c:	02000613          	li	a2,32
ffffffffc0209110:	00f596bb          	sllw	a3,a1,a5
ffffffffc0209114:	2785                	addiw	a5,a5,1
ffffffffc0209116:	8f35                	xor	a4,a4,a3
ffffffffc0209118:	fec79ce3          	bne	a5,a2,ffffffffc0209110 <bitmap_create+0x82>
ffffffffc020911c:	7442                	ld	s0,48(sp)
ffffffffc020911e:	70e2                	ld	ra,56(sp)
ffffffffc0209120:	c118                	sw	a4,0(a0)
ffffffffc0209122:	7902                	ld	s2,32(sp)
ffffffffc0209124:	69e2                	ld	s3,24(sp)
ffffffffc0209126:	6a42                	ld	s4,16(sp)
ffffffffc0209128:	8526                	mv	a0,s1
ffffffffc020912a:	74a2                	ld	s1,40(sp)
ffffffffc020912c:	6121                	addi	sp,sp,64
ffffffffc020912e:	8082                	ret
ffffffffc0209130:	7442                	ld	s0,48(sp)
ffffffffc0209132:	70e2                	ld	ra,56(sp)
ffffffffc0209134:	7902                	ld	s2,32(sp)
ffffffffc0209136:	69e2                	ld	s3,24(sp)
ffffffffc0209138:	6a42                	ld	s4,16(sp)
ffffffffc020913a:	8526                	mv	a0,s1
ffffffffc020913c:	74a2                	ld	s1,40(sp)
ffffffffc020913e:	6121                	addi	sp,sp,64
ffffffffc0209140:	8082                	ret
ffffffffc0209142:	8526                	mv	a0,s1
ffffffffc0209144:	f23f80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0209148:	7902                	ld	s2,32(sp)
ffffffffc020914a:	69e2                	ld	s3,24(sp)
ffffffffc020914c:	6a42                	ld	s4,16(sp)
ffffffffc020914e:	7442                	ld	s0,48(sp)
ffffffffc0209150:	70e2                	ld	ra,56(sp)
ffffffffc0209152:	4481                	li	s1,0
ffffffffc0209154:	8526                	mv	a0,s1
ffffffffc0209156:	74a2                	ld	s1,40(sp)
ffffffffc0209158:	6121                	addi	sp,sp,64
ffffffffc020915a:	8082                	ret
ffffffffc020915c:	00005697          	auipc	a3,0x5
ffffffffc0209160:	47c68693          	addi	a3,a3,1148 # ffffffffc020e5d8 <etext+0x2de6>
ffffffffc0209164:	00003617          	auipc	a2,0x3
ffffffffc0209168:	acc60613          	addi	a2,a2,-1332 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020916c:	45d5                	li	a1,21
ffffffffc020916e:	00005517          	auipc	a0,0x5
ffffffffc0209172:	45250513          	addi	a0,a0,1106 # ffffffffc020e5c0 <etext+0x2dce>
ffffffffc0209176:	f04a                	sd	s2,32(sp)
ffffffffc0209178:	ec4e                	sd	s3,24(sp)
ffffffffc020917a:	e852                	sd	s4,16(sp)
ffffffffc020917c:	acef70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209180:	00005697          	auipc	a3,0x5
ffffffffc0209184:	49868693          	addi	a3,a3,1176 # ffffffffc020e618 <etext+0x2e26>
ffffffffc0209188:	00003617          	auipc	a2,0x3
ffffffffc020918c:	aa860613          	addi	a2,a2,-1368 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209190:	02b00593          	li	a1,43
ffffffffc0209194:	00005517          	auipc	a0,0x5
ffffffffc0209198:	42c50513          	addi	a0,a0,1068 # ffffffffc020e5c0 <etext+0x2dce>
ffffffffc020919c:	aaef70ef          	jal	ffffffffc020044a <__panic>
ffffffffc02091a0:	00005697          	auipc	a3,0x5
ffffffffc02091a4:	46068693          	addi	a3,a3,1120 # ffffffffc020e600 <etext+0x2e0e>
ffffffffc02091a8:	00003617          	auipc	a2,0x3
ffffffffc02091ac:	a8860613          	addi	a2,a2,-1400 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02091b0:	02a00593          	li	a1,42
ffffffffc02091b4:	00005517          	auipc	a0,0x5
ffffffffc02091b8:	40c50513          	addi	a0,a0,1036 # ffffffffc020e5c0 <etext+0x2dce>
ffffffffc02091bc:	a8ef70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02091c0 <bitmap_alloc>:
ffffffffc02091c0:	4150                	lw	a2,4(a0)
ffffffffc02091c2:	c229                	beqz	a2,ffffffffc0209204 <bitmap_alloc+0x44>
ffffffffc02091c4:	6518                	ld	a4,8(a0)
ffffffffc02091c6:	4781                	li	a5,0
ffffffffc02091c8:	a029                	j	ffffffffc02091d2 <bitmap_alloc+0x12>
ffffffffc02091ca:	2785                	addiw	a5,a5,1
ffffffffc02091cc:	0711                	addi	a4,a4,4
ffffffffc02091ce:	02f60b63          	beq	a2,a5,ffffffffc0209204 <bitmap_alloc+0x44>
ffffffffc02091d2:	4314                	lw	a3,0(a4)
ffffffffc02091d4:	dafd                	beqz	a3,ffffffffc02091ca <bitmap_alloc+0xa>
ffffffffc02091d6:	0016f613          	andi	a2,a3,1
ffffffffc02091da:	ea29                	bnez	a2,ffffffffc020922c <bitmap_alloc+0x6c>
ffffffffc02091dc:	02000893          	li	a7,32
ffffffffc02091e0:	4305                	li	t1,1
ffffffffc02091e2:	2605                	addiw	a2,a2,1
ffffffffc02091e4:	03160263          	beq	a2,a7,ffffffffc0209208 <bitmap_alloc+0x48>
ffffffffc02091e8:	00c3153b          	sllw	a0,t1,a2
ffffffffc02091ec:	00a6f833          	and	a6,a3,a0
ffffffffc02091f0:	fe0809e3          	beqz	a6,ffffffffc02091e2 <bitmap_alloc+0x22>
ffffffffc02091f4:	8ea9                	xor	a3,a3,a0
ffffffffc02091f6:	0057979b          	slliw	a5,a5,0x5
ffffffffc02091fa:	c314                	sw	a3,0(a4)
ffffffffc02091fc:	9fb1                	addw	a5,a5,a2
ffffffffc02091fe:	c19c                	sw	a5,0(a1)
ffffffffc0209200:	4501                	li	a0,0
ffffffffc0209202:	8082                	ret
ffffffffc0209204:	5571                	li	a0,-4
ffffffffc0209206:	8082                	ret
ffffffffc0209208:	1141                	addi	sp,sp,-16
ffffffffc020920a:	00005697          	auipc	a3,0x5
ffffffffc020920e:	43668693          	addi	a3,a3,1078 # ffffffffc020e640 <etext+0x2e4e>
ffffffffc0209212:	00003617          	auipc	a2,0x3
ffffffffc0209216:	a1e60613          	addi	a2,a2,-1506 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020921a:	04300593          	li	a1,67
ffffffffc020921e:	00005517          	auipc	a0,0x5
ffffffffc0209222:	3a250513          	addi	a0,a0,930 # ffffffffc020e5c0 <etext+0x2dce>
ffffffffc0209226:	e406                	sd	ra,8(sp)
ffffffffc0209228:	a22f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc020922c:	8532                	mv	a0,a2
ffffffffc020922e:	4601                	li	a2,0
ffffffffc0209230:	b7d1                	j	ffffffffc02091f4 <bitmap_alloc+0x34>

ffffffffc0209232 <bitmap_test>:
ffffffffc0209232:	411c                	lw	a5,0(a0)
ffffffffc0209234:	00f5ff63          	bgeu	a1,a5,ffffffffc0209252 <bitmap_test+0x20>
ffffffffc0209238:	651c                	ld	a5,8(a0)
ffffffffc020923a:	0055d71b          	srliw	a4,a1,0x5
ffffffffc020923e:	070a                	slli	a4,a4,0x2
ffffffffc0209240:	97ba                	add	a5,a5,a4
ffffffffc0209242:	439c                	lw	a5,0(a5)
ffffffffc0209244:	4505                	li	a0,1
ffffffffc0209246:	00b5153b          	sllw	a0,a0,a1
ffffffffc020924a:	8d7d                	and	a0,a0,a5
ffffffffc020924c:	1502                	slli	a0,a0,0x20
ffffffffc020924e:	9101                	srli	a0,a0,0x20
ffffffffc0209250:	8082                	ret
ffffffffc0209252:	1141                	addi	sp,sp,-16
ffffffffc0209254:	e406                	sd	ra,8(sp)
ffffffffc0209256:	e15ff0ef          	jal	ffffffffc020906a <bitmap_translate.part.0>

ffffffffc020925a <bitmap_free>:
ffffffffc020925a:	411c                	lw	a5,0(a0)
ffffffffc020925c:	1141                	addi	sp,sp,-16
ffffffffc020925e:	e406                	sd	ra,8(sp)
ffffffffc0209260:	02f5f363          	bgeu	a1,a5,ffffffffc0209286 <bitmap_free+0x2c>
ffffffffc0209264:	651c                	ld	a5,8(a0)
ffffffffc0209266:	0055d71b          	srliw	a4,a1,0x5
ffffffffc020926a:	070a                	slli	a4,a4,0x2
ffffffffc020926c:	97ba                	add	a5,a5,a4
ffffffffc020926e:	4394                	lw	a3,0(a5)
ffffffffc0209270:	4705                	li	a4,1
ffffffffc0209272:	00b715bb          	sllw	a1,a4,a1
ffffffffc0209276:	00b6f733          	and	a4,a3,a1
ffffffffc020927a:	eb01                	bnez	a4,ffffffffc020928a <bitmap_free+0x30>
ffffffffc020927c:	60a2                	ld	ra,8(sp)
ffffffffc020927e:	8ecd                	or	a3,a3,a1
ffffffffc0209280:	c394                	sw	a3,0(a5)
ffffffffc0209282:	0141                	addi	sp,sp,16
ffffffffc0209284:	8082                	ret
ffffffffc0209286:	de5ff0ef          	jal	ffffffffc020906a <bitmap_translate.part.0>
ffffffffc020928a:	00005697          	auipc	a3,0x5
ffffffffc020928e:	3be68693          	addi	a3,a3,958 # ffffffffc020e648 <etext+0x2e56>
ffffffffc0209292:	00003617          	auipc	a2,0x3
ffffffffc0209296:	99e60613          	addi	a2,a2,-1634 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020929a:	05f00593          	li	a1,95
ffffffffc020929e:	00005517          	auipc	a0,0x5
ffffffffc02092a2:	32250513          	addi	a0,a0,802 # ffffffffc020e5c0 <etext+0x2dce>
ffffffffc02092a6:	9a4f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc02092aa <bitmap_destroy>:
ffffffffc02092aa:	1141                	addi	sp,sp,-16
ffffffffc02092ac:	e022                	sd	s0,0(sp)
ffffffffc02092ae:	842a                	mv	s0,a0
ffffffffc02092b0:	6508                	ld	a0,8(a0)
ffffffffc02092b2:	e406                	sd	ra,8(sp)
ffffffffc02092b4:	db3f80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc02092b8:	8522                	mv	a0,s0
ffffffffc02092ba:	6402                	ld	s0,0(sp)
ffffffffc02092bc:	60a2                	ld	ra,8(sp)
ffffffffc02092be:	0141                	addi	sp,sp,16
ffffffffc02092c0:	da7f806f          	j	ffffffffc0202066 <kfree>

ffffffffc02092c4 <bitmap_getdata>:
ffffffffc02092c4:	c589                	beqz	a1,ffffffffc02092ce <bitmap_getdata+0xa>
ffffffffc02092c6:	00456783          	lwu	a5,4(a0)
ffffffffc02092ca:	078a                	slli	a5,a5,0x2
ffffffffc02092cc:	e19c                	sd	a5,0(a1)
ffffffffc02092ce:	6508                	ld	a0,8(a0)
ffffffffc02092d0:	8082                	ret

ffffffffc02092d2 <sfs_init>:
ffffffffc02092d2:	1141                	addi	sp,sp,-16
ffffffffc02092d4:	00005517          	auipc	a0,0x5
ffffffffc02092d8:	1dc50513          	addi	a0,a0,476 # ffffffffc020e4b0 <etext+0x2cbe>
ffffffffc02092dc:	e406                	sd	ra,8(sp)
ffffffffc02092de:	576000ef          	jal	ffffffffc0209854 <sfs_mount>
ffffffffc02092e2:	e501                	bnez	a0,ffffffffc02092ea <sfs_init+0x18>
ffffffffc02092e4:	60a2                	ld	ra,8(sp)
ffffffffc02092e6:	0141                	addi	sp,sp,16
ffffffffc02092e8:	8082                	ret
ffffffffc02092ea:	86aa                	mv	a3,a0
ffffffffc02092ec:	00005617          	auipc	a2,0x5
ffffffffc02092f0:	36c60613          	addi	a2,a2,876 # ffffffffc020e658 <etext+0x2e66>
ffffffffc02092f4:	45c1                	li	a1,16
ffffffffc02092f6:	00005517          	auipc	a0,0x5
ffffffffc02092fa:	38250513          	addi	a0,a0,898 # ffffffffc020e678 <etext+0x2e86>
ffffffffc02092fe:	94cf70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209302 <sfs_unmount>:
ffffffffc0209302:	1141                	addi	sp,sp,-16
ffffffffc0209304:	e406                	sd	ra,8(sp)
ffffffffc0209306:	e022                	sd	s0,0(sp)
ffffffffc0209308:	cd1d                	beqz	a0,ffffffffc0209346 <sfs_unmount+0x44>
ffffffffc020930a:	0b052783          	lw	a5,176(a0)
ffffffffc020930e:	842a                	mv	s0,a0
ffffffffc0209310:	eb9d                	bnez	a5,ffffffffc0209346 <sfs_unmount+0x44>
ffffffffc0209312:	7158                	ld	a4,160(a0)
ffffffffc0209314:	09850793          	addi	a5,a0,152
ffffffffc0209318:	02f71563          	bne	a4,a5,ffffffffc0209342 <sfs_unmount+0x40>
ffffffffc020931c:	613c                	ld	a5,64(a0)
ffffffffc020931e:	e7a1                	bnez	a5,ffffffffc0209366 <sfs_unmount+0x64>
ffffffffc0209320:	7d08                	ld	a0,56(a0)
ffffffffc0209322:	f89ff0ef          	jal	ffffffffc02092aa <bitmap_destroy>
ffffffffc0209326:	6428                	ld	a0,72(s0)
ffffffffc0209328:	d3ff80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020932c:	7448                	ld	a0,168(s0)
ffffffffc020932e:	d39f80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0209332:	8522                	mv	a0,s0
ffffffffc0209334:	d33f80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0209338:	4501                	li	a0,0
ffffffffc020933a:	60a2                	ld	ra,8(sp)
ffffffffc020933c:	6402                	ld	s0,0(sp)
ffffffffc020933e:	0141                	addi	sp,sp,16
ffffffffc0209340:	8082                	ret
ffffffffc0209342:	5545                	li	a0,-15
ffffffffc0209344:	bfdd                	j	ffffffffc020933a <sfs_unmount+0x38>
ffffffffc0209346:	00005697          	auipc	a3,0x5
ffffffffc020934a:	34a68693          	addi	a3,a3,842 # ffffffffc020e690 <etext+0x2e9e>
ffffffffc020934e:	00003617          	auipc	a2,0x3
ffffffffc0209352:	8e260613          	addi	a2,a2,-1822 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209356:	04100593          	li	a1,65
ffffffffc020935a:	00005517          	auipc	a0,0x5
ffffffffc020935e:	36650513          	addi	a0,a0,870 # ffffffffc020e6c0 <etext+0x2ece>
ffffffffc0209362:	8e8f70ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209366:	00005697          	auipc	a3,0x5
ffffffffc020936a:	37268693          	addi	a3,a3,882 # ffffffffc020e6d8 <etext+0x2ee6>
ffffffffc020936e:	00003617          	auipc	a2,0x3
ffffffffc0209372:	8c260613          	addi	a2,a2,-1854 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209376:	04500593          	li	a1,69
ffffffffc020937a:	00005517          	auipc	a0,0x5
ffffffffc020937e:	34650513          	addi	a0,a0,838 # ffffffffc020e6c0 <etext+0x2ece>
ffffffffc0209382:	8c8f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209386 <sfs_cleanup>:
ffffffffc0209386:	1101                	addi	sp,sp,-32
ffffffffc0209388:	ec06                	sd	ra,24(sp)
ffffffffc020938a:	e426                	sd	s1,8(sp)
ffffffffc020938c:	c13d                	beqz	a0,ffffffffc02093f2 <sfs_cleanup+0x6c>
ffffffffc020938e:	0b052783          	lw	a5,176(a0)
ffffffffc0209392:	84aa                	mv	s1,a0
ffffffffc0209394:	efb9                	bnez	a5,ffffffffc02093f2 <sfs_cleanup+0x6c>
ffffffffc0209396:	4158                	lw	a4,4(a0)
ffffffffc0209398:	4514                	lw	a3,8(a0)
ffffffffc020939a:	00c50593          	addi	a1,a0,12
ffffffffc020939e:	00005517          	auipc	a0,0x5
ffffffffc02093a2:	35250513          	addi	a0,a0,850 # ffffffffc020e6f0 <etext+0x2efe>
ffffffffc02093a6:	40d7063b          	subw	a2,a4,a3
ffffffffc02093aa:	e822                	sd	s0,16(sp)
ffffffffc02093ac:	dfbf60ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc02093b0:	02000413          	li	s0,32
ffffffffc02093b4:	a019                	j	ffffffffc02093ba <sfs_cleanup+0x34>
ffffffffc02093b6:	347d                	addiw	s0,s0,-1
ffffffffc02093b8:	c811                	beqz	s0,ffffffffc02093cc <sfs_cleanup+0x46>
ffffffffc02093ba:	7cdc                	ld	a5,184(s1)
ffffffffc02093bc:	8526                	mv	a0,s1
ffffffffc02093be:	9782                	jalr	a5
ffffffffc02093c0:	f97d                	bnez	a0,ffffffffc02093b6 <sfs_cleanup+0x30>
ffffffffc02093c2:	6442                	ld	s0,16(sp)
ffffffffc02093c4:	60e2                	ld	ra,24(sp)
ffffffffc02093c6:	64a2                	ld	s1,8(sp)
ffffffffc02093c8:	6105                	addi	sp,sp,32
ffffffffc02093ca:	8082                	ret
ffffffffc02093cc:	6442                	ld	s0,16(sp)
ffffffffc02093ce:	60e2                	ld	ra,24(sp)
ffffffffc02093d0:	00c48693          	addi	a3,s1,12
ffffffffc02093d4:	64a2                	ld	s1,8(sp)
ffffffffc02093d6:	872a                	mv	a4,a0
ffffffffc02093d8:	00005617          	auipc	a2,0x5
ffffffffc02093dc:	33860613          	addi	a2,a2,824 # ffffffffc020e710 <etext+0x2f1e>
ffffffffc02093e0:	05f00593          	li	a1,95
ffffffffc02093e4:	00005517          	auipc	a0,0x5
ffffffffc02093e8:	2dc50513          	addi	a0,a0,732 # ffffffffc020e6c0 <etext+0x2ece>
ffffffffc02093ec:	6105                	addi	sp,sp,32
ffffffffc02093ee:	8c6f706f          	j	ffffffffc02004b4 <__warn>
ffffffffc02093f2:	00005697          	auipc	a3,0x5
ffffffffc02093f6:	29e68693          	addi	a3,a3,670 # ffffffffc020e690 <etext+0x2e9e>
ffffffffc02093fa:	00003617          	auipc	a2,0x3
ffffffffc02093fe:	83660613          	addi	a2,a2,-1994 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209402:	05400593          	li	a1,84
ffffffffc0209406:	00005517          	auipc	a0,0x5
ffffffffc020940a:	2ba50513          	addi	a0,a0,698 # ffffffffc020e6c0 <etext+0x2ece>
ffffffffc020940e:	e822                	sd	s0,16(sp)
ffffffffc0209410:	e04a                	sd	s2,0(sp)
ffffffffc0209412:	838f70ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209416 <sfs_sync>:
ffffffffc0209416:	7179                	addi	sp,sp,-48
ffffffffc0209418:	f406                	sd	ra,40(sp)
ffffffffc020941a:	e44e                	sd	s3,8(sp)
ffffffffc020941c:	c94d                	beqz	a0,ffffffffc02094ce <sfs_sync+0xb8>
ffffffffc020941e:	0b052783          	lw	a5,176(a0)
ffffffffc0209422:	89aa                	mv	s3,a0
ffffffffc0209424:	e7cd                	bnez	a5,ffffffffc02094ce <sfs_sync+0xb8>
ffffffffc0209426:	f022                	sd	s0,32(sp)
ffffffffc0209428:	e84a                	sd	s2,16(sp)
ffffffffc020942a:	605010ef          	jal	ffffffffc020b22e <lock_sfs_fs>
ffffffffc020942e:	0a09b403          	ld	s0,160(s3)
ffffffffc0209432:	09898913          	addi	s2,s3,152
ffffffffc0209436:	02890663          	beq	s2,s0,ffffffffc0209462 <sfs_sync+0x4c>
ffffffffc020943a:	7c1c                	ld	a5,56(s0)
ffffffffc020943c:	cbad                	beqz	a5,ffffffffc02094ae <sfs_sync+0x98>
ffffffffc020943e:	7b9c                	ld	a5,48(a5)
ffffffffc0209440:	c7bd                	beqz	a5,ffffffffc02094ae <sfs_sync+0x98>
ffffffffc0209442:	fc840513          	addi	a0,s0,-56
ffffffffc0209446:	00004597          	auipc	a1,0x4
ffffffffc020944a:	0ca58593          	addi	a1,a1,202 # ffffffffc020d510 <etext+0x1d1e>
ffffffffc020944e:	decfe0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc0209452:	7c1c                	ld	a5,56(s0)
ffffffffc0209454:	fc840513          	addi	a0,s0,-56
ffffffffc0209458:	7b9c                	ld	a5,48(a5)
ffffffffc020945a:	9782                	jalr	a5
ffffffffc020945c:	6400                	ld	s0,8(s0)
ffffffffc020945e:	fc891ee3          	bne	s2,s0,ffffffffc020943a <sfs_sync+0x24>
ffffffffc0209462:	854e                	mv	a0,s3
ffffffffc0209464:	5db010ef          	jal	ffffffffc020b23e <unlock_sfs_fs>
ffffffffc0209468:	0409b783          	ld	a5,64(s3)
ffffffffc020946c:	4501                	li	a0,0
ffffffffc020946e:	e799                	bnez	a5,ffffffffc020947c <sfs_sync+0x66>
ffffffffc0209470:	7402                	ld	s0,32(sp)
ffffffffc0209472:	70a2                	ld	ra,40(sp)
ffffffffc0209474:	6942                	ld	s2,16(sp)
ffffffffc0209476:	69a2                	ld	s3,8(sp)
ffffffffc0209478:	6145                	addi	sp,sp,48
ffffffffc020947a:	8082                	ret
ffffffffc020947c:	0409b023          	sd	zero,64(s3)
ffffffffc0209480:	854e                	mv	a0,s3
ffffffffc0209482:	48d010ef          	jal	ffffffffc020b10e <sfs_sync_super>
ffffffffc0209486:	c911                	beqz	a0,ffffffffc020949a <sfs_sync+0x84>
ffffffffc0209488:	7402                	ld	s0,32(sp)
ffffffffc020948a:	70a2                	ld	ra,40(sp)
ffffffffc020948c:	4785                	li	a5,1
ffffffffc020948e:	04f9b023          	sd	a5,64(s3)
ffffffffc0209492:	6942                	ld	s2,16(sp)
ffffffffc0209494:	69a2                	ld	s3,8(sp)
ffffffffc0209496:	6145                	addi	sp,sp,48
ffffffffc0209498:	8082                	ret
ffffffffc020949a:	854e                	mv	a0,s3
ffffffffc020949c:	4b9010ef          	jal	ffffffffc020b154 <sfs_sync_freemap>
ffffffffc02094a0:	f565                	bnez	a0,ffffffffc0209488 <sfs_sync+0x72>
ffffffffc02094a2:	7402                	ld	s0,32(sp)
ffffffffc02094a4:	70a2                	ld	ra,40(sp)
ffffffffc02094a6:	6942                	ld	s2,16(sp)
ffffffffc02094a8:	69a2                	ld	s3,8(sp)
ffffffffc02094aa:	6145                	addi	sp,sp,48
ffffffffc02094ac:	8082                	ret
ffffffffc02094ae:	00004697          	auipc	a3,0x4
ffffffffc02094b2:	01268693          	addi	a3,a3,18 # ffffffffc020d4c0 <etext+0x1cce>
ffffffffc02094b6:	00002617          	auipc	a2,0x2
ffffffffc02094ba:	77a60613          	addi	a2,a2,1914 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02094be:	45ed                	li	a1,27
ffffffffc02094c0:	00005517          	auipc	a0,0x5
ffffffffc02094c4:	20050513          	addi	a0,a0,512 # ffffffffc020e6c0 <etext+0x2ece>
ffffffffc02094c8:	ec26                	sd	s1,24(sp)
ffffffffc02094ca:	f81f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc02094ce:	00005697          	auipc	a3,0x5
ffffffffc02094d2:	1c268693          	addi	a3,a3,450 # ffffffffc020e690 <etext+0x2e9e>
ffffffffc02094d6:	00002617          	auipc	a2,0x2
ffffffffc02094da:	75a60613          	addi	a2,a2,1882 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02094de:	45d5                	li	a1,21
ffffffffc02094e0:	00005517          	auipc	a0,0x5
ffffffffc02094e4:	1e050513          	addi	a0,a0,480 # ffffffffc020e6c0 <etext+0x2ece>
ffffffffc02094e8:	f022                	sd	s0,32(sp)
ffffffffc02094ea:	ec26                	sd	s1,24(sp)
ffffffffc02094ec:	e84a                	sd	s2,16(sp)
ffffffffc02094ee:	f5df60ef          	jal	ffffffffc020044a <__panic>

ffffffffc02094f2 <sfs_get_root>:
ffffffffc02094f2:	1101                	addi	sp,sp,-32
ffffffffc02094f4:	ec06                	sd	ra,24(sp)
ffffffffc02094f6:	cd09                	beqz	a0,ffffffffc0209510 <sfs_get_root+0x1e>
ffffffffc02094f8:	0b052783          	lw	a5,176(a0)
ffffffffc02094fc:	eb91                	bnez	a5,ffffffffc0209510 <sfs_get_root+0x1e>
ffffffffc02094fe:	4605                	li	a2,1
ffffffffc0209500:	002c                	addi	a1,sp,8
ffffffffc0209502:	36a010ef          	jal	ffffffffc020a86c <sfs_load_inode>
ffffffffc0209506:	e50d                	bnez	a0,ffffffffc0209530 <sfs_get_root+0x3e>
ffffffffc0209508:	60e2                	ld	ra,24(sp)
ffffffffc020950a:	6522                	ld	a0,8(sp)
ffffffffc020950c:	6105                	addi	sp,sp,32
ffffffffc020950e:	8082                	ret
ffffffffc0209510:	00005697          	auipc	a3,0x5
ffffffffc0209514:	18068693          	addi	a3,a3,384 # ffffffffc020e690 <etext+0x2e9e>
ffffffffc0209518:	00002617          	auipc	a2,0x2
ffffffffc020951c:	71860613          	addi	a2,a2,1816 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209520:	03600593          	li	a1,54
ffffffffc0209524:	00005517          	auipc	a0,0x5
ffffffffc0209528:	19c50513          	addi	a0,a0,412 # ffffffffc020e6c0 <etext+0x2ece>
ffffffffc020952c:	f1ff60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209530:	86aa                	mv	a3,a0
ffffffffc0209532:	00005617          	auipc	a2,0x5
ffffffffc0209536:	1fe60613          	addi	a2,a2,510 # ffffffffc020e730 <etext+0x2f3e>
ffffffffc020953a:	03700593          	li	a1,55
ffffffffc020953e:	00005517          	auipc	a0,0x5
ffffffffc0209542:	18250513          	addi	a0,a0,386 # ffffffffc020e6c0 <etext+0x2ece>
ffffffffc0209546:	f05f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc020954a <sfs_do_mount>:
ffffffffc020954a:	7171                	addi	sp,sp,-176
ffffffffc020954c:	e54e                	sd	s3,136(sp)
ffffffffc020954e:	00853983          	ld	s3,8(a0)
ffffffffc0209552:	f506                	sd	ra,168(sp)
ffffffffc0209554:	6785                	lui	a5,0x1
ffffffffc0209556:	26f99a63          	bne	s3,a5,ffffffffc02097ca <sfs_do_mount+0x280>
ffffffffc020955a:	ed26                	sd	s1,152(sp)
ffffffffc020955c:	84aa                	mv	s1,a0
ffffffffc020955e:	4501                	li	a0,0
ffffffffc0209560:	f122                	sd	s0,160(sp)
ffffffffc0209562:	f4de                	sd	s7,104(sp)
ffffffffc0209564:	8bae                	mv	s7,a1
ffffffffc0209566:	ec0fe0ef          	jal	ffffffffc0207c26 <__alloc_fs>
ffffffffc020956a:	842a                	mv	s0,a0
ffffffffc020956c:	26050663          	beqz	a0,ffffffffc02097d8 <sfs_do_mount+0x28e>
ffffffffc0209570:	e152                	sd	s4,128(sp)
ffffffffc0209572:	0b052a03          	lw	s4,176(a0)
ffffffffc0209576:	e94a                	sd	s2,144(sp)
ffffffffc0209578:	280a1763          	bnez	s4,ffffffffc0209806 <sfs_do_mount+0x2bc>
ffffffffc020957c:	f904                	sd	s1,48(a0)
ffffffffc020957e:	854e                	mv	a0,s3
ffffffffc0209580:	a41f80ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0209584:	e428                	sd	a0,72(s0)
ffffffffc0209586:	892a                	mv	s2,a0
ffffffffc0209588:	16050863          	beqz	a0,ffffffffc02096f8 <sfs_do_mount+0x1ae>
ffffffffc020958c:	864e                	mv	a2,s3
ffffffffc020958e:	4681                	li	a3,0
ffffffffc0209590:	85ca                	mv	a1,s2
ffffffffc0209592:	1008                	addi	a0,sp,32
ffffffffc0209594:	f45fb0ef          	jal	ffffffffc02054d8 <iobuf_init>
ffffffffc0209598:	709c                	ld	a5,32(s1)
ffffffffc020959a:	85aa                	mv	a1,a0
ffffffffc020959c:	4601                	li	a2,0
ffffffffc020959e:	8526                	mv	a0,s1
ffffffffc02095a0:	9782                	jalr	a5
ffffffffc02095a2:	89aa                	mv	s3,a0
ffffffffc02095a4:	12051a63          	bnez	a0,ffffffffc02096d8 <sfs_do_mount+0x18e>
ffffffffc02095a8:	00092583          	lw	a1,0(s2)
ffffffffc02095ac:	2f8dc637          	lui	a2,0x2f8dc
ffffffffc02095b0:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f866b2a>
ffffffffc02095b4:	14c59d63          	bne	a1,a2,ffffffffc020970e <sfs_do_mount+0x1c4>
ffffffffc02095b8:	00492783          	lw	a5,4(s2)
ffffffffc02095bc:	6090                	ld	a2,0(s1)
ffffffffc02095be:	02079713          	slli	a4,a5,0x20
ffffffffc02095c2:	9301                	srli	a4,a4,0x20
ffffffffc02095c4:	12e66c63          	bltu	a2,a4,ffffffffc02096fc <sfs_do_mount+0x1b2>
ffffffffc02095c8:	e4ee                	sd	s11,72(sp)
ffffffffc02095ca:	01892503          	lw	a0,24(s2)
ffffffffc02095ce:	00892e03          	lw	t3,8(s2)
ffffffffc02095d2:	00c92303          	lw	t1,12(s2)
ffffffffc02095d6:	01092883          	lw	a7,16(s2)
ffffffffc02095da:	01492803          	lw	a6,20(s2)
ffffffffc02095de:	01c92603          	lw	a2,28(s2)
ffffffffc02095e2:	02092683          	lw	a3,32(s2)
ffffffffc02095e6:	02492703          	lw	a4,36(s2)
ffffffffc02095ea:	020905a3          	sb	zero,43(s2)
ffffffffc02095ee:	cc08                	sw	a0,24(s0)
ffffffffc02095f0:	01c42423          	sw	t3,8(s0)
ffffffffc02095f4:	00642623          	sw	t1,12(s0)
ffffffffc02095f8:	01142823          	sw	a7,16(s0)
ffffffffc02095fc:	01042a23          	sw	a6,20(s0)
ffffffffc0209600:	cc50                	sw	a2,28(s0)
ffffffffc0209602:	d014                	sw	a3,32(s0)
ffffffffc0209604:	d058                	sw	a4,36(s0)
ffffffffc0209606:	c00c                	sw	a1,0(s0)
ffffffffc0209608:	c05c                	sw	a5,4(s0)
ffffffffc020960a:	02892783          	lw	a5,40(s2)
ffffffffc020960e:	6511                	lui	a0,0x4
ffffffffc0209610:	d41c                	sw	a5,40(s0)
ffffffffc0209612:	9aff80ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc0209616:	f448                	sd	a0,168(s0)
ffffffffc0209618:	87aa                	mv	a5,a0
ffffffffc020961a:	8daa                	mv	s11,a0
ffffffffc020961c:	1a050963          	beqz	a0,ffffffffc02097ce <sfs_do_mount+0x284>
ffffffffc0209620:	6711                	lui	a4,0x4
ffffffffc0209622:	fcd6                	sd	s5,120(sp)
ffffffffc0209624:	ece6                	sd	s9,88(sp)
ffffffffc0209626:	e8ea                	sd	s10,80(sp)
ffffffffc0209628:	972a                	add	a4,a4,a0
ffffffffc020962a:	e79c                	sd	a5,8(a5)
ffffffffc020962c:	e39c                	sd	a5,0(a5)
ffffffffc020962e:	07c1                	addi	a5,a5,16 # 1010 <_binary_bin_swap_img_size-0x6cf0>
ffffffffc0209630:	fee79de3          	bne	a5,a4,ffffffffc020962a <sfs_do_mount+0xe0>
ffffffffc0209634:	00496783          	lwu	a5,4(s2)
ffffffffc0209638:	6721                	lui	a4,0x8
ffffffffc020963a:	fff70a93          	addi	s5,a4,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
ffffffffc020963e:	97d6                	add	a5,a5,s5
ffffffffc0209640:	7761                	lui	a4,0xffff8
ffffffffc0209642:	8ff9                	and	a5,a5,a4
ffffffffc0209644:	0007851b          	sext.w	a0,a5
ffffffffc0209648:	00078c9b          	sext.w	s9,a5
ffffffffc020964c:	a43ff0ef          	jal	ffffffffc020908e <bitmap_create>
ffffffffc0209650:	fc08                	sd	a0,56(s0)
ffffffffc0209652:	8d2a                	mv	s10,a0
ffffffffc0209654:	16050963          	beqz	a0,ffffffffc02097c6 <sfs_do_mount+0x27c>
ffffffffc0209658:	00492783          	lw	a5,4(s2)
ffffffffc020965c:	082c                	addi	a1,sp,24
ffffffffc020965e:	e43e                	sd	a5,8(sp)
ffffffffc0209660:	c65ff0ef          	jal	ffffffffc02092c4 <bitmap_getdata>
ffffffffc0209664:	16050f63          	beqz	a0,ffffffffc02097e2 <sfs_do_mount+0x298>
ffffffffc0209668:	00816783          	lwu	a5,8(sp)
ffffffffc020966c:	66e2                	ld	a3,24(sp)
ffffffffc020966e:	97d6                	add	a5,a5,s5
ffffffffc0209670:	83bd                	srli	a5,a5,0xf
ffffffffc0209672:	00c7971b          	slliw	a4,a5,0xc
ffffffffc0209676:	1702                	slli	a4,a4,0x20
ffffffffc0209678:	9301                	srli	a4,a4,0x20
ffffffffc020967a:	16d71463          	bne	a4,a3,ffffffffc02097e2 <sfs_do_mount+0x298>
ffffffffc020967e:	f0e2                	sd	s8,96(sp)
ffffffffc0209680:	00c79713          	slli	a4,a5,0xc
ffffffffc0209684:	00e50c33          	add	s8,a0,a4
ffffffffc0209688:	8aaa                	mv	s5,a0
ffffffffc020968a:	cbd9                	beqz	a5,ffffffffc0209720 <sfs_do_mount+0x1d6>
ffffffffc020968c:	6789                	lui	a5,0x2
ffffffffc020968e:	f8da                	sd	s6,112(sp)
ffffffffc0209690:	40a78b3b          	subw	s6,a5,a0
ffffffffc0209694:	a029                	j	ffffffffc020969e <sfs_do_mount+0x154>
ffffffffc0209696:	6785                	lui	a5,0x1
ffffffffc0209698:	9abe                	add	s5,s5,a5
ffffffffc020969a:	098a8263          	beq	s5,s8,ffffffffc020971e <sfs_do_mount+0x1d4>
ffffffffc020969e:	015b06bb          	addw	a3,s6,s5
ffffffffc02096a2:	1682                	slli	a3,a3,0x20
ffffffffc02096a4:	6605                	lui	a2,0x1
ffffffffc02096a6:	85d6                	mv	a1,s5
ffffffffc02096a8:	9281                	srli	a3,a3,0x20
ffffffffc02096aa:	1008                	addi	a0,sp,32
ffffffffc02096ac:	e2dfb0ef          	jal	ffffffffc02054d8 <iobuf_init>
ffffffffc02096b0:	709c                	ld	a5,32(s1)
ffffffffc02096b2:	85aa                	mv	a1,a0
ffffffffc02096b4:	4601                	li	a2,0
ffffffffc02096b6:	8526                	mv	a0,s1
ffffffffc02096b8:	9782                	jalr	a5
ffffffffc02096ba:	dd71                	beqz	a0,ffffffffc0209696 <sfs_do_mount+0x14c>
ffffffffc02096bc:	e42a                	sd	a0,8(sp)
ffffffffc02096be:	856a                	mv	a0,s10
ffffffffc02096c0:	bebff0ef          	jal	ffffffffc02092aa <bitmap_destroy>
ffffffffc02096c4:	69a2                	ld	s3,8(sp)
ffffffffc02096c6:	7b46                	ld	s6,112(sp)
ffffffffc02096c8:	7c06                	ld	s8,96(sp)
ffffffffc02096ca:	856e                	mv	a0,s11
ffffffffc02096cc:	99bf80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc02096d0:	7ae6                	ld	s5,120(sp)
ffffffffc02096d2:	6ce6                	ld	s9,88(sp)
ffffffffc02096d4:	6d46                	ld	s10,80(sp)
ffffffffc02096d6:	6da6                	ld	s11,72(sp)
ffffffffc02096d8:	854a                	mv	a0,s2
ffffffffc02096da:	98df80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc02096de:	8522                	mv	a0,s0
ffffffffc02096e0:	987f80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc02096e4:	740a                	ld	s0,160(sp)
ffffffffc02096e6:	64ea                	ld	s1,152(sp)
ffffffffc02096e8:	694a                	ld	s2,144(sp)
ffffffffc02096ea:	6a0a                	ld	s4,128(sp)
ffffffffc02096ec:	7ba6                	ld	s7,104(sp)
ffffffffc02096ee:	70aa                	ld	ra,168(sp)
ffffffffc02096f0:	854e                	mv	a0,s3
ffffffffc02096f2:	69aa                	ld	s3,136(sp)
ffffffffc02096f4:	614d                	addi	sp,sp,176
ffffffffc02096f6:	8082                	ret
ffffffffc02096f8:	59f1                	li	s3,-4
ffffffffc02096fa:	b7d5                	j	ffffffffc02096de <sfs_do_mount+0x194>
ffffffffc02096fc:	85be                	mv	a1,a5
ffffffffc02096fe:	00005517          	auipc	a0,0x5
ffffffffc0209702:	08a50513          	addi	a0,a0,138 # ffffffffc020e788 <etext+0x2f96>
ffffffffc0209706:	aa1f60ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020970a:	59f5                	li	s3,-3
ffffffffc020970c:	b7f1                	j	ffffffffc02096d8 <sfs_do_mount+0x18e>
ffffffffc020970e:	00005517          	auipc	a0,0x5
ffffffffc0209712:	04250513          	addi	a0,a0,66 # ffffffffc020e750 <etext+0x2f5e>
ffffffffc0209716:	a91f60ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc020971a:	59f5                	li	s3,-3
ffffffffc020971c:	bf75                	j	ffffffffc02096d8 <sfs_do_mount+0x18e>
ffffffffc020971e:	7b46                	ld	s6,112(sp)
ffffffffc0209720:	00442903          	lw	s2,4(s0)
ffffffffc0209724:	0a0c8863          	beqz	s9,ffffffffc02097d4 <sfs_do_mount+0x28a>
ffffffffc0209728:	4481                	li	s1,0
ffffffffc020972a:	85a6                	mv	a1,s1
ffffffffc020972c:	856a                	mv	a0,s10
ffffffffc020972e:	b05ff0ef          	jal	ffffffffc0209232 <bitmap_test>
ffffffffc0209732:	c111                	beqz	a0,ffffffffc0209736 <sfs_do_mount+0x1ec>
ffffffffc0209734:	2a05                	addiw	s4,s4,1
ffffffffc0209736:	2485                	addiw	s1,s1,1
ffffffffc0209738:	fe9c99e3          	bne	s9,s1,ffffffffc020972a <sfs_do_mount+0x1e0>
ffffffffc020973c:	441c                	lw	a5,8(s0)
ffffffffc020973e:	0f479a63          	bne	a5,s4,ffffffffc0209832 <sfs_do_mount+0x2e8>
ffffffffc0209742:	05040513          	addi	a0,s0,80
ffffffffc0209746:	04043023          	sd	zero,64(s0)
ffffffffc020974a:	4585                	li	a1,1
ffffffffc020974c:	eedfa0ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc0209750:	06840513          	addi	a0,s0,104
ffffffffc0209754:	4585                	li	a1,1
ffffffffc0209756:	ee3fa0ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc020975a:	08040513          	addi	a0,s0,128
ffffffffc020975e:	4585                	li	a1,1
ffffffffc0209760:	ed9fa0ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc0209764:	09840793          	addi	a5,s0,152
ffffffffc0209768:	4149063b          	subw	a2,s2,s4
ffffffffc020976c:	f05c                	sd	a5,160(s0)
ffffffffc020976e:	ec5c                	sd	a5,152(s0)
ffffffffc0209770:	874a                	mv	a4,s2
ffffffffc0209772:	86d2                	mv	a3,s4
ffffffffc0209774:	00c40593          	addi	a1,s0,12
ffffffffc0209778:	00005517          	auipc	a0,0x5
ffffffffc020977c:	0a050513          	addi	a0,a0,160 # ffffffffc020e818 <etext+0x3026>
ffffffffc0209780:	a27f60ef          	jal	ffffffffc02001a6 <cprintf>
ffffffffc0209784:	00000617          	auipc	a2,0x0
ffffffffc0209788:	c9260613          	addi	a2,a2,-878 # ffffffffc0209416 <sfs_sync>
ffffffffc020978c:	00000697          	auipc	a3,0x0
ffffffffc0209790:	d6668693          	addi	a3,a3,-666 # ffffffffc02094f2 <sfs_get_root>
ffffffffc0209794:	00000717          	auipc	a4,0x0
ffffffffc0209798:	b6e70713          	addi	a4,a4,-1170 # ffffffffc0209302 <sfs_unmount>
ffffffffc020979c:	00000797          	auipc	a5,0x0
ffffffffc02097a0:	bea78793          	addi	a5,a5,-1046 # ffffffffc0209386 <sfs_cleanup>
ffffffffc02097a4:	fc50                	sd	a2,184(s0)
ffffffffc02097a6:	e074                	sd	a3,192(s0)
ffffffffc02097a8:	e478                	sd	a4,200(s0)
ffffffffc02097aa:	e87c                	sd	a5,208(s0)
ffffffffc02097ac:	008bb023          	sd	s0,0(s7)
ffffffffc02097b0:	64ea                	ld	s1,152(sp)
ffffffffc02097b2:	740a                	ld	s0,160(sp)
ffffffffc02097b4:	694a                	ld	s2,144(sp)
ffffffffc02097b6:	6a0a                	ld	s4,128(sp)
ffffffffc02097b8:	7ae6                	ld	s5,120(sp)
ffffffffc02097ba:	7ba6                	ld	s7,104(sp)
ffffffffc02097bc:	7c06                	ld	s8,96(sp)
ffffffffc02097be:	6ce6                	ld	s9,88(sp)
ffffffffc02097c0:	6d46                	ld	s10,80(sp)
ffffffffc02097c2:	6da6                	ld	s11,72(sp)
ffffffffc02097c4:	b72d                	j	ffffffffc02096ee <sfs_do_mount+0x1a4>
ffffffffc02097c6:	59f1                	li	s3,-4
ffffffffc02097c8:	b709                	j	ffffffffc02096ca <sfs_do_mount+0x180>
ffffffffc02097ca:	59c9                	li	s3,-14
ffffffffc02097cc:	b70d                	j	ffffffffc02096ee <sfs_do_mount+0x1a4>
ffffffffc02097ce:	6da6                	ld	s11,72(sp)
ffffffffc02097d0:	59f1                	li	s3,-4
ffffffffc02097d2:	b719                	j	ffffffffc02096d8 <sfs_do_mount+0x18e>
ffffffffc02097d4:	4a01                	li	s4,0
ffffffffc02097d6:	b79d                	j	ffffffffc020973c <sfs_do_mount+0x1f2>
ffffffffc02097d8:	740a                	ld	s0,160(sp)
ffffffffc02097da:	64ea                	ld	s1,152(sp)
ffffffffc02097dc:	7ba6                	ld	s7,104(sp)
ffffffffc02097de:	59f1                	li	s3,-4
ffffffffc02097e0:	b739                	j	ffffffffc02096ee <sfs_do_mount+0x1a4>
ffffffffc02097e2:	00005697          	auipc	a3,0x5
ffffffffc02097e6:	fd668693          	addi	a3,a3,-42 # ffffffffc020e7b8 <etext+0x2fc6>
ffffffffc02097ea:	00002617          	auipc	a2,0x2
ffffffffc02097ee:	44660613          	addi	a2,a2,1094 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02097f2:	08300593          	li	a1,131
ffffffffc02097f6:	00005517          	auipc	a0,0x5
ffffffffc02097fa:	eca50513          	addi	a0,a0,-310 # ffffffffc020e6c0 <etext+0x2ece>
ffffffffc02097fe:	f8da                	sd	s6,112(sp)
ffffffffc0209800:	f0e2                	sd	s8,96(sp)
ffffffffc0209802:	c49f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209806:	00005697          	auipc	a3,0x5
ffffffffc020980a:	e8a68693          	addi	a3,a3,-374 # ffffffffc020e690 <etext+0x2e9e>
ffffffffc020980e:	00002617          	auipc	a2,0x2
ffffffffc0209812:	42260613          	addi	a2,a2,1058 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209816:	0a300593          	li	a1,163
ffffffffc020981a:	00005517          	auipc	a0,0x5
ffffffffc020981e:	ea650513          	addi	a0,a0,-346 # ffffffffc020e6c0 <etext+0x2ece>
ffffffffc0209822:	fcd6                	sd	s5,120(sp)
ffffffffc0209824:	f8da                	sd	s6,112(sp)
ffffffffc0209826:	f0e2                	sd	s8,96(sp)
ffffffffc0209828:	ece6                	sd	s9,88(sp)
ffffffffc020982a:	e8ea                	sd	s10,80(sp)
ffffffffc020982c:	e4ee                	sd	s11,72(sp)
ffffffffc020982e:	c1df60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209832:	00005697          	auipc	a3,0x5
ffffffffc0209836:	fb668693          	addi	a3,a3,-74 # ffffffffc020e7e8 <etext+0x2ff6>
ffffffffc020983a:	00002617          	auipc	a2,0x2
ffffffffc020983e:	3f660613          	addi	a2,a2,1014 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209842:	0e000593          	li	a1,224
ffffffffc0209846:	00005517          	auipc	a0,0x5
ffffffffc020984a:	e7a50513          	addi	a0,a0,-390 # ffffffffc020e6c0 <etext+0x2ece>
ffffffffc020984e:	f8da                	sd	s6,112(sp)
ffffffffc0209850:	bfbf60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209854 <sfs_mount>:
ffffffffc0209854:	00000597          	auipc	a1,0x0
ffffffffc0209858:	cf658593          	addi	a1,a1,-778 # ffffffffc020954a <sfs_do_mount>
ffffffffc020985c:	fccfe06f          	j	ffffffffc0208028 <vfs_mount>

ffffffffc0209860 <sfs_opendir>:
ffffffffc0209860:	0235f593          	andi	a1,a1,35
ffffffffc0209864:	e199                	bnez	a1,ffffffffc020986a <sfs_opendir+0xa>
ffffffffc0209866:	4501                	li	a0,0
ffffffffc0209868:	8082                	ret
ffffffffc020986a:	553d                	li	a0,-17
ffffffffc020986c:	8082                	ret

ffffffffc020986e <sfs_openfile>:
ffffffffc020986e:	4501                	li	a0,0
ffffffffc0209870:	8082                	ret

ffffffffc0209872 <sfs_gettype>:
ffffffffc0209872:	1141                	addi	sp,sp,-16
ffffffffc0209874:	e406                	sd	ra,8(sp)
ffffffffc0209876:	c529                	beqz	a0,ffffffffc02098c0 <sfs_gettype+0x4e>
ffffffffc0209878:	4d38                	lw	a4,88(a0)
ffffffffc020987a:	6785                	lui	a5,0x1
ffffffffc020987c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209880:	04f71063          	bne	a4,a5,ffffffffc02098c0 <sfs_gettype+0x4e>
ffffffffc0209884:	6118                	ld	a4,0(a0)
ffffffffc0209886:	4789                	li	a5,2
ffffffffc0209888:	00475683          	lhu	a3,4(a4)
ffffffffc020988c:	02f68463          	beq	a3,a5,ffffffffc02098b4 <sfs_gettype+0x42>
ffffffffc0209890:	478d                	li	a5,3
ffffffffc0209892:	00f68b63          	beq	a3,a5,ffffffffc02098a8 <sfs_gettype+0x36>
ffffffffc0209896:	4705                	li	a4,1
ffffffffc0209898:	6785                	lui	a5,0x1
ffffffffc020989a:	04e69363          	bne	a3,a4,ffffffffc02098e0 <sfs_gettype+0x6e>
ffffffffc020989e:	60a2                	ld	ra,8(sp)
ffffffffc02098a0:	c19c                	sw	a5,0(a1)
ffffffffc02098a2:	4501                	li	a0,0
ffffffffc02098a4:	0141                	addi	sp,sp,16
ffffffffc02098a6:	8082                	ret
ffffffffc02098a8:	60a2                	ld	ra,8(sp)
ffffffffc02098aa:	678d                	lui	a5,0x3
ffffffffc02098ac:	c19c                	sw	a5,0(a1)
ffffffffc02098ae:	4501                	li	a0,0
ffffffffc02098b0:	0141                	addi	sp,sp,16
ffffffffc02098b2:	8082                	ret
ffffffffc02098b4:	60a2                	ld	ra,8(sp)
ffffffffc02098b6:	6789                	lui	a5,0x2
ffffffffc02098b8:	c19c                	sw	a5,0(a1)
ffffffffc02098ba:	4501                	li	a0,0
ffffffffc02098bc:	0141                	addi	sp,sp,16
ffffffffc02098be:	8082                	ret
ffffffffc02098c0:	00005697          	auipc	a3,0x5
ffffffffc02098c4:	f7868693          	addi	a3,a3,-136 # ffffffffc020e838 <etext+0x3046>
ffffffffc02098c8:	00002617          	auipc	a2,0x2
ffffffffc02098cc:	36860613          	addi	a2,a2,872 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02098d0:	38200593          	li	a1,898
ffffffffc02098d4:	00005517          	auipc	a0,0x5
ffffffffc02098d8:	f9c50513          	addi	a0,a0,-100 # ffffffffc020e870 <etext+0x307e>
ffffffffc02098dc:	b6ff60ef          	jal	ffffffffc020044a <__panic>
ffffffffc02098e0:	00005617          	auipc	a2,0x5
ffffffffc02098e4:	fa860613          	addi	a2,a2,-88 # ffffffffc020e888 <etext+0x3096>
ffffffffc02098e8:	38e00593          	li	a1,910
ffffffffc02098ec:	00005517          	auipc	a0,0x5
ffffffffc02098f0:	f8450513          	addi	a0,a0,-124 # ffffffffc020e870 <etext+0x307e>
ffffffffc02098f4:	b57f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc02098f8 <sfs_fsync>:
ffffffffc02098f8:	7530                	ld	a2,104(a0)
ffffffffc02098fa:	7179                	addi	sp,sp,-48
ffffffffc02098fc:	f406                	sd	ra,40(sp)
ffffffffc02098fe:	ca2d                	beqz	a2,ffffffffc0209970 <sfs_fsync+0x78>
ffffffffc0209900:	0b062703          	lw	a4,176(a2)
ffffffffc0209904:	e735                	bnez	a4,ffffffffc0209970 <sfs_fsync+0x78>
ffffffffc0209906:	4d34                	lw	a3,88(a0)
ffffffffc0209908:	6705                	lui	a4,0x1
ffffffffc020990a:	23570713          	addi	a4,a4,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020990e:	08e69263          	bne	a3,a4,ffffffffc0209992 <sfs_fsync+0x9a>
ffffffffc0209912:	6914                	ld	a3,16(a0)
ffffffffc0209914:	4701                	li	a4,0
ffffffffc0209916:	e689                	bnez	a3,ffffffffc0209920 <sfs_fsync+0x28>
ffffffffc0209918:	70a2                	ld	ra,40(sp)
ffffffffc020991a:	853a                	mv	a0,a4
ffffffffc020991c:	6145                	addi	sp,sp,48
ffffffffc020991e:	8082                	ret
ffffffffc0209920:	f022                	sd	s0,32(sp)
ffffffffc0209922:	e42a                	sd	a0,8(sp)
ffffffffc0209924:	02050413          	addi	s0,a0,32
ffffffffc0209928:	02050513          	addi	a0,a0,32
ffffffffc020992c:	ec3a                	sd	a4,24(sp)
ffffffffc020992e:	e832                	sd	a2,16(sp)
ffffffffc0209930:	d13fa0ef          	jal	ffffffffc0204642 <down>
ffffffffc0209934:	67a2                	ld	a5,8(sp)
ffffffffc0209936:	6762                	ld	a4,24(sp)
ffffffffc0209938:	6b94                	ld	a3,16(a5)
ffffffffc020993a:	ea99                	bnez	a3,ffffffffc0209950 <sfs_fsync+0x58>
ffffffffc020993c:	8522                	mv	a0,s0
ffffffffc020993e:	e43a                	sd	a4,8(sp)
ffffffffc0209940:	cfffa0ef          	jal	ffffffffc020463e <up>
ffffffffc0209944:	6722                	ld	a4,8(sp)
ffffffffc0209946:	7402                	ld	s0,32(sp)
ffffffffc0209948:	70a2                	ld	ra,40(sp)
ffffffffc020994a:	853a                	mv	a0,a4
ffffffffc020994c:	6145                	addi	sp,sp,48
ffffffffc020994e:	8082                	ret
ffffffffc0209950:	4794                	lw	a3,8(a5)
ffffffffc0209952:	638c                	ld	a1,0(a5)
ffffffffc0209954:	6542                	ld	a0,16(sp)
ffffffffc0209956:	4701                	li	a4,0
ffffffffc0209958:	0007b823          	sd	zero,16(a5) # 2010 <_binary_bin_swap_img_size-0x5cf0>
ffffffffc020995c:	04000613          	li	a2,64
ffffffffc0209960:	71a010ef          	jal	ffffffffc020b07a <sfs_wbuf>
ffffffffc0209964:	872a                	mv	a4,a0
ffffffffc0209966:	d979                	beqz	a0,ffffffffc020993c <sfs_fsync+0x44>
ffffffffc0209968:	67a2                	ld	a5,8(sp)
ffffffffc020996a:	4685                	li	a3,1
ffffffffc020996c:	eb94                	sd	a3,16(a5)
ffffffffc020996e:	b7f9                	j	ffffffffc020993c <sfs_fsync+0x44>
ffffffffc0209970:	00005697          	auipc	a3,0x5
ffffffffc0209974:	d2068693          	addi	a3,a3,-736 # ffffffffc020e690 <etext+0x2e9e>
ffffffffc0209978:	00002617          	auipc	a2,0x2
ffffffffc020997c:	2b860613          	addi	a2,a2,696 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209980:	2c600593          	li	a1,710
ffffffffc0209984:	00005517          	auipc	a0,0x5
ffffffffc0209988:	eec50513          	addi	a0,a0,-276 # ffffffffc020e870 <etext+0x307e>
ffffffffc020998c:	f022                	sd	s0,32(sp)
ffffffffc020998e:	abdf60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209992:	00005697          	auipc	a3,0x5
ffffffffc0209996:	ea668693          	addi	a3,a3,-346 # ffffffffc020e838 <etext+0x3046>
ffffffffc020999a:	00002617          	auipc	a2,0x2
ffffffffc020999e:	29660613          	addi	a2,a2,662 # ffffffffc020bc30 <etext+0x43e>
ffffffffc02099a2:	2c700593          	li	a1,711
ffffffffc02099a6:	00005517          	auipc	a0,0x5
ffffffffc02099aa:	eca50513          	addi	a0,a0,-310 # ffffffffc020e870 <etext+0x307e>
ffffffffc02099ae:	f022                	sd	s0,32(sp)
ffffffffc02099b0:	a9bf60ef          	jal	ffffffffc020044a <__panic>

ffffffffc02099b4 <sfs_fstat>:
ffffffffc02099b4:	1101                	addi	sp,sp,-32
ffffffffc02099b6:	e822                	sd	s0,16(sp)
ffffffffc02099b8:	e426                	sd	s1,8(sp)
ffffffffc02099ba:	842a                	mv	s0,a0
ffffffffc02099bc:	84ae                	mv	s1,a1
ffffffffc02099be:	852e                	mv	a0,a1
ffffffffc02099c0:	02000613          	li	a2,32
ffffffffc02099c4:	4581                	li	a1,0
ffffffffc02099c6:	ec06                	sd	ra,24(sp)
ffffffffc02099c8:	5c3010ef          	jal	ffffffffc020b78a <memset>
ffffffffc02099cc:	c439                	beqz	s0,ffffffffc0209a1a <sfs_fstat+0x66>
ffffffffc02099ce:	783c                	ld	a5,112(s0)
ffffffffc02099d0:	c7a9                	beqz	a5,ffffffffc0209a1a <sfs_fstat+0x66>
ffffffffc02099d2:	6bbc                	ld	a5,80(a5)
ffffffffc02099d4:	c3b9                	beqz	a5,ffffffffc0209a1a <sfs_fstat+0x66>
ffffffffc02099d6:	00005597          	auipc	a1,0x5
ffffffffc02099da:	8ca58593          	addi	a1,a1,-1846 # ffffffffc020e2a0 <etext+0x2aae>
ffffffffc02099de:	8522                	mv	a0,s0
ffffffffc02099e0:	85afe0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc02099e4:	783c                	ld	a5,112(s0)
ffffffffc02099e6:	85a6                	mv	a1,s1
ffffffffc02099e8:	8522                	mv	a0,s0
ffffffffc02099ea:	6bbc                	ld	a5,80(a5)
ffffffffc02099ec:	9782                	jalr	a5
ffffffffc02099ee:	e10d                	bnez	a0,ffffffffc0209a10 <sfs_fstat+0x5c>
ffffffffc02099f0:	4c38                	lw	a4,88(s0)
ffffffffc02099f2:	6785                	lui	a5,0x1
ffffffffc02099f4:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02099f8:	04f71163          	bne	a4,a5,ffffffffc0209a3a <sfs_fstat+0x86>
ffffffffc02099fc:	601c                	ld	a5,0(s0)
ffffffffc02099fe:	0067d683          	lhu	a3,6(a5)
ffffffffc0209a02:	0087e703          	lwu	a4,8(a5)
ffffffffc0209a06:	0007e783          	lwu	a5,0(a5)
ffffffffc0209a0a:	e494                	sd	a3,8(s1)
ffffffffc0209a0c:	e898                	sd	a4,16(s1)
ffffffffc0209a0e:	ec9c                	sd	a5,24(s1)
ffffffffc0209a10:	60e2                	ld	ra,24(sp)
ffffffffc0209a12:	6442                	ld	s0,16(sp)
ffffffffc0209a14:	64a2                	ld	s1,8(sp)
ffffffffc0209a16:	6105                	addi	sp,sp,32
ffffffffc0209a18:	8082                	ret
ffffffffc0209a1a:	00005697          	auipc	a3,0x5
ffffffffc0209a1e:	81e68693          	addi	a3,a3,-2018 # ffffffffc020e238 <etext+0x2a46>
ffffffffc0209a22:	00002617          	auipc	a2,0x2
ffffffffc0209a26:	20e60613          	addi	a2,a2,526 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209a2a:	2b700593          	li	a1,695
ffffffffc0209a2e:	00005517          	auipc	a0,0x5
ffffffffc0209a32:	e4250513          	addi	a0,a0,-446 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209a36:	a15f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209a3a:	00005697          	auipc	a3,0x5
ffffffffc0209a3e:	dfe68693          	addi	a3,a3,-514 # ffffffffc020e838 <etext+0x3046>
ffffffffc0209a42:	00002617          	auipc	a2,0x2
ffffffffc0209a46:	1ee60613          	addi	a2,a2,494 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209a4a:	2ba00593          	li	a1,698
ffffffffc0209a4e:	00005517          	auipc	a0,0x5
ffffffffc0209a52:	e2250513          	addi	a0,a0,-478 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209a56:	9f5f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209a5a <sfs_tryseek>:
ffffffffc0209a5a:	08000737          	lui	a4,0x8000
ffffffffc0209a5e:	04e5f863          	bgeu	a1,a4,ffffffffc0209aae <sfs_tryseek+0x54>
ffffffffc0209a62:	1101                	addi	sp,sp,-32
ffffffffc0209a64:	ec06                	sd	ra,24(sp)
ffffffffc0209a66:	c531                	beqz	a0,ffffffffc0209ab2 <sfs_tryseek+0x58>
ffffffffc0209a68:	4d30                	lw	a2,88(a0)
ffffffffc0209a6a:	6685                	lui	a3,0x1
ffffffffc0209a6c:	23568693          	addi	a3,a3,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209a70:	04d61163          	bne	a2,a3,ffffffffc0209ab2 <sfs_tryseek+0x58>
ffffffffc0209a74:	6114                	ld	a3,0(a0)
ffffffffc0209a76:	0006e683          	lwu	a3,0(a3)
ffffffffc0209a7a:	02b6d663          	bge	a3,a1,ffffffffc0209aa6 <sfs_tryseek+0x4c>
ffffffffc0209a7e:	7934                	ld	a3,112(a0)
ffffffffc0209a80:	caa9                	beqz	a3,ffffffffc0209ad2 <sfs_tryseek+0x78>
ffffffffc0209a82:	72b4                	ld	a3,96(a3)
ffffffffc0209a84:	c6b9                	beqz	a3,ffffffffc0209ad2 <sfs_tryseek+0x78>
ffffffffc0209a86:	e02e                	sd	a1,0(sp)
ffffffffc0209a88:	00004597          	auipc	a1,0x4
ffffffffc0209a8c:	70858593          	addi	a1,a1,1800 # ffffffffc020e190 <etext+0x299e>
ffffffffc0209a90:	e42a                	sd	a0,8(sp)
ffffffffc0209a92:	fa9fd0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc0209a96:	67a2                	ld	a5,8(sp)
ffffffffc0209a98:	6582                	ld	a1,0(sp)
ffffffffc0209a9a:	60e2                	ld	ra,24(sp)
ffffffffc0209a9c:	7bb4                	ld	a3,112(a5)
ffffffffc0209a9e:	853e                	mv	a0,a5
ffffffffc0209aa0:	72bc                	ld	a5,96(a3)
ffffffffc0209aa2:	6105                	addi	sp,sp,32
ffffffffc0209aa4:	8782                	jr	a5
ffffffffc0209aa6:	60e2                	ld	ra,24(sp)
ffffffffc0209aa8:	4501                	li	a0,0
ffffffffc0209aaa:	6105                	addi	sp,sp,32
ffffffffc0209aac:	8082                	ret
ffffffffc0209aae:	5575                	li	a0,-3
ffffffffc0209ab0:	8082                	ret
ffffffffc0209ab2:	00005697          	auipc	a3,0x5
ffffffffc0209ab6:	d8668693          	addi	a3,a3,-634 # ffffffffc020e838 <etext+0x3046>
ffffffffc0209aba:	00002617          	auipc	a2,0x2
ffffffffc0209abe:	17660613          	addi	a2,a2,374 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209ac2:	39900593          	li	a1,921
ffffffffc0209ac6:	00005517          	auipc	a0,0x5
ffffffffc0209aca:	daa50513          	addi	a0,a0,-598 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209ace:	97df60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209ad2:	00004697          	auipc	a3,0x4
ffffffffc0209ad6:	66668693          	addi	a3,a3,1638 # ffffffffc020e138 <etext+0x2946>
ffffffffc0209ada:	00002617          	auipc	a2,0x2
ffffffffc0209ade:	15660613          	addi	a2,a2,342 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209ae2:	39b00593          	li	a1,923
ffffffffc0209ae6:	00005517          	auipc	a0,0x5
ffffffffc0209aea:	d8a50513          	addi	a0,a0,-630 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209aee:	95df60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209af2 <sfs_close>:
ffffffffc0209af2:	1141                	addi	sp,sp,-16
ffffffffc0209af4:	e406                	sd	ra,8(sp)
ffffffffc0209af6:	e022                	sd	s0,0(sp)
ffffffffc0209af8:	c11d                	beqz	a0,ffffffffc0209b1e <sfs_close+0x2c>
ffffffffc0209afa:	793c                	ld	a5,112(a0)
ffffffffc0209afc:	842a                	mv	s0,a0
ffffffffc0209afe:	c385                	beqz	a5,ffffffffc0209b1e <sfs_close+0x2c>
ffffffffc0209b00:	7b9c                	ld	a5,48(a5)
ffffffffc0209b02:	cf91                	beqz	a5,ffffffffc0209b1e <sfs_close+0x2c>
ffffffffc0209b04:	00004597          	auipc	a1,0x4
ffffffffc0209b08:	a0c58593          	addi	a1,a1,-1524 # ffffffffc020d510 <etext+0x1d1e>
ffffffffc0209b0c:	f2ffd0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc0209b10:	783c                	ld	a5,112(s0)
ffffffffc0209b12:	8522                	mv	a0,s0
ffffffffc0209b14:	6402                	ld	s0,0(sp)
ffffffffc0209b16:	60a2                	ld	ra,8(sp)
ffffffffc0209b18:	7b9c                	ld	a5,48(a5)
ffffffffc0209b1a:	0141                	addi	sp,sp,16
ffffffffc0209b1c:	8782                	jr	a5
ffffffffc0209b1e:	00004697          	auipc	a3,0x4
ffffffffc0209b22:	9a268693          	addi	a3,a3,-1630 # ffffffffc020d4c0 <etext+0x1cce>
ffffffffc0209b26:	00002617          	auipc	a2,0x2
ffffffffc0209b2a:	10a60613          	addi	a2,a2,266 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209b2e:	21d00593          	li	a1,541
ffffffffc0209b32:	00005517          	auipc	a0,0x5
ffffffffc0209b36:	d3e50513          	addi	a0,a0,-706 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209b3a:	911f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209b3e <sfs_io.part.0>:
ffffffffc0209b3e:	1141                	addi	sp,sp,-16
ffffffffc0209b40:	00005697          	auipc	a3,0x5
ffffffffc0209b44:	cf868693          	addi	a3,a3,-776 # ffffffffc020e838 <etext+0x3046>
ffffffffc0209b48:	00002617          	auipc	a2,0x2
ffffffffc0209b4c:	0e860613          	addi	a2,a2,232 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209b50:	29600593          	li	a1,662
ffffffffc0209b54:	00005517          	auipc	a0,0x5
ffffffffc0209b58:	d1c50513          	addi	a0,a0,-740 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209b5c:	e406                	sd	ra,8(sp)
ffffffffc0209b5e:	8edf60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209b62 <sfs_block_free>:
ffffffffc0209b62:	1101                	addi	sp,sp,-32
ffffffffc0209b64:	e822                	sd	s0,16(sp)
ffffffffc0209b66:	e426                	sd	s1,8(sp)
ffffffffc0209b68:	ec06                	sd	ra,24(sp)
ffffffffc0209b6a:	84ae                	mv	s1,a1
ffffffffc0209b6c:	842a                	mv	s0,a0
ffffffffc0209b6e:	c595                	beqz	a1,ffffffffc0209b9a <sfs_block_free+0x38>
ffffffffc0209b70:	415c                	lw	a5,4(a0)
ffffffffc0209b72:	02f5f463          	bgeu	a1,a5,ffffffffc0209b9a <sfs_block_free+0x38>
ffffffffc0209b76:	7d08                	ld	a0,56(a0)
ffffffffc0209b78:	ebaff0ef          	jal	ffffffffc0209232 <bitmap_test>
ffffffffc0209b7c:	ed0d                	bnez	a0,ffffffffc0209bb6 <sfs_block_free+0x54>
ffffffffc0209b7e:	7c08                	ld	a0,56(s0)
ffffffffc0209b80:	85a6                	mv	a1,s1
ffffffffc0209b82:	ed8ff0ef          	jal	ffffffffc020925a <bitmap_free>
ffffffffc0209b86:	441c                	lw	a5,8(s0)
ffffffffc0209b88:	4705                	li	a4,1
ffffffffc0209b8a:	60e2                	ld	ra,24(sp)
ffffffffc0209b8c:	2785                	addiw	a5,a5,1
ffffffffc0209b8e:	e038                	sd	a4,64(s0)
ffffffffc0209b90:	c41c                	sw	a5,8(s0)
ffffffffc0209b92:	6442                	ld	s0,16(sp)
ffffffffc0209b94:	64a2                	ld	s1,8(sp)
ffffffffc0209b96:	6105                	addi	sp,sp,32
ffffffffc0209b98:	8082                	ret
ffffffffc0209b9a:	4054                	lw	a3,4(s0)
ffffffffc0209b9c:	8726                	mv	a4,s1
ffffffffc0209b9e:	00005617          	auipc	a2,0x5
ffffffffc0209ba2:	d0260613          	addi	a2,a2,-766 # ffffffffc020e8a0 <etext+0x30ae>
ffffffffc0209ba6:	05300593          	li	a1,83
ffffffffc0209baa:	00005517          	auipc	a0,0x5
ffffffffc0209bae:	cc650513          	addi	a0,a0,-826 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209bb2:	899f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209bb6:	00005697          	auipc	a3,0x5
ffffffffc0209bba:	d2268693          	addi	a3,a3,-734 # ffffffffc020e8d8 <etext+0x30e6>
ffffffffc0209bbe:	00002617          	auipc	a2,0x2
ffffffffc0209bc2:	07260613          	addi	a2,a2,114 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209bc6:	06a00593          	li	a1,106
ffffffffc0209bca:	00005517          	auipc	a0,0x5
ffffffffc0209bce:	ca650513          	addi	a0,a0,-858 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209bd2:	879f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209bd6 <sfs_reclaim>:
ffffffffc0209bd6:	1101                	addi	sp,sp,-32
ffffffffc0209bd8:	e426                	sd	s1,8(sp)
ffffffffc0209bda:	7524                	ld	s1,104(a0)
ffffffffc0209bdc:	ec06                	sd	ra,24(sp)
ffffffffc0209bde:	e822                	sd	s0,16(sp)
ffffffffc0209be0:	e04a                	sd	s2,0(sp)
ffffffffc0209be2:	0e048963          	beqz	s1,ffffffffc0209cd4 <sfs_reclaim+0xfe>
ffffffffc0209be6:	0b04a783          	lw	a5,176(s1)
ffffffffc0209bea:	0e079563          	bnez	a5,ffffffffc0209cd4 <sfs_reclaim+0xfe>
ffffffffc0209bee:	4d38                	lw	a4,88(a0)
ffffffffc0209bf0:	6785                	lui	a5,0x1
ffffffffc0209bf2:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209bf6:	842a                	mv	s0,a0
ffffffffc0209bf8:	10f71e63          	bne	a4,a5,ffffffffc0209d14 <sfs_reclaim+0x13e>
ffffffffc0209bfc:	8526                	mv	a0,s1
ffffffffc0209bfe:	630010ef          	jal	ffffffffc020b22e <lock_sfs_fs>
ffffffffc0209c02:	4c1c                	lw	a5,24(s0)
ffffffffc0209c04:	0ef05863          	blez	a5,ffffffffc0209cf4 <sfs_reclaim+0x11e>
ffffffffc0209c08:	37fd                	addiw	a5,a5,-1
ffffffffc0209c0a:	cc1c                	sw	a5,24(s0)
ffffffffc0209c0c:	ebd9                	bnez	a5,ffffffffc0209ca2 <sfs_reclaim+0xcc>
ffffffffc0209c0e:	05c42903          	lw	s2,92(s0)
ffffffffc0209c12:	08091863          	bnez	s2,ffffffffc0209ca2 <sfs_reclaim+0xcc>
ffffffffc0209c16:	601c                	ld	a5,0(s0)
ffffffffc0209c18:	0067d783          	lhu	a5,6(a5)
ffffffffc0209c1c:	e785                	bnez	a5,ffffffffc0209c44 <sfs_reclaim+0x6e>
ffffffffc0209c1e:	783c                	ld	a5,112(s0)
ffffffffc0209c20:	10078a63          	beqz	a5,ffffffffc0209d34 <sfs_reclaim+0x15e>
ffffffffc0209c24:	73bc                	ld	a5,96(a5)
ffffffffc0209c26:	10078763          	beqz	a5,ffffffffc0209d34 <sfs_reclaim+0x15e>
ffffffffc0209c2a:	00004597          	auipc	a1,0x4
ffffffffc0209c2e:	56658593          	addi	a1,a1,1382 # ffffffffc020e190 <etext+0x299e>
ffffffffc0209c32:	8522                	mv	a0,s0
ffffffffc0209c34:	e07fd0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc0209c38:	783c                	ld	a5,112(s0)
ffffffffc0209c3a:	8522                	mv	a0,s0
ffffffffc0209c3c:	4581                	li	a1,0
ffffffffc0209c3e:	73bc                	ld	a5,96(a5)
ffffffffc0209c40:	9782                	jalr	a5
ffffffffc0209c42:	e559                	bnez	a0,ffffffffc0209cd0 <sfs_reclaim+0xfa>
ffffffffc0209c44:	681c                	ld	a5,16(s0)
ffffffffc0209c46:	c39d                	beqz	a5,ffffffffc0209c6c <sfs_reclaim+0x96>
ffffffffc0209c48:	783c                	ld	a5,112(s0)
ffffffffc0209c4a:	10078563          	beqz	a5,ffffffffc0209d54 <sfs_reclaim+0x17e>
ffffffffc0209c4e:	7b9c                	ld	a5,48(a5)
ffffffffc0209c50:	10078263          	beqz	a5,ffffffffc0209d54 <sfs_reclaim+0x17e>
ffffffffc0209c54:	8522                	mv	a0,s0
ffffffffc0209c56:	00004597          	auipc	a1,0x4
ffffffffc0209c5a:	8ba58593          	addi	a1,a1,-1862 # ffffffffc020d510 <etext+0x1d1e>
ffffffffc0209c5e:	dddfd0ef          	jal	ffffffffc0207a3a <inode_check>
ffffffffc0209c62:	783c                	ld	a5,112(s0)
ffffffffc0209c64:	8522                	mv	a0,s0
ffffffffc0209c66:	7b9c                	ld	a5,48(a5)
ffffffffc0209c68:	9782                	jalr	a5
ffffffffc0209c6a:	e13d                	bnez	a0,ffffffffc0209cd0 <sfs_reclaim+0xfa>
ffffffffc0209c6c:	7c18                	ld	a4,56(s0)
ffffffffc0209c6e:	603c                	ld	a5,64(s0)
ffffffffc0209c70:	8526                	mv	a0,s1
ffffffffc0209c72:	e71c                	sd	a5,8(a4)
ffffffffc0209c74:	e398                	sd	a4,0(a5)
ffffffffc0209c76:	6438                	ld	a4,72(s0)
ffffffffc0209c78:	683c                	ld	a5,80(s0)
ffffffffc0209c7a:	e71c                	sd	a5,8(a4)
ffffffffc0209c7c:	e398                	sd	a4,0(a5)
ffffffffc0209c7e:	5c0010ef          	jal	ffffffffc020b23e <unlock_sfs_fs>
ffffffffc0209c82:	6008                	ld	a0,0(s0)
ffffffffc0209c84:	00655783          	lhu	a5,6(a0)
ffffffffc0209c88:	cb85                	beqz	a5,ffffffffc0209cb8 <sfs_reclaim+0xe2>
ffffffffc0209c8a:	bdcf80ef          	jal	ffffffffc0202066 <kfree>
ffffffffc0209c8e:	8522                	mv	a0,s0
ffffffffc0209c90:	d43fd0ef          	jal	ffffffffc02079d2 <inode_kill>
ffffffffc0209c94:	60e2                	ld	ra,24(sp)
ffffffffc0209c96:	6442                	ld	s0,16(sp)
ffffffffc0209c98:	64a2                	ld	s1,8(sp)
ffffffffc0209c9a:	854a                	mv	a0,s2
ffffffffc0209c9c:	6902                	ld	s2,0(sp)
ffffffffc0209c9e:	6105                	addi	sp,sp,32
ffffffffc0209ca0:	8082                	ret
ffffffffc0209ca2:	5945                	li	s2,-15
ffffffffc0209ca4:	8526                	mv	a0,s1
ffffffffc0209ca6:	598010ef          	jal	ffffffffc020b23e <unlock_sfs_fs>
ffffffffc0209caa:	60e2                	ld	ra,24(sp)
ffffffffc0209cac:	6442                	ld	s0,16(sp)
ffffffffc0209cae:	64a2                	ld	s1,8(sp)
ffffffffc0209cb0:	854a                	mv	a0,s2
ffffffffc0209cb2:	6902                	ld	s2,0(sp)
ffffffffc0209cb4:	6105                	addi	sp,sp,32
ffffffffc0209cb6:	8082                	ret
ffffffffc0209cb8:	440c                	lw	a1,8(s0)
ffffffffc0209cba:	8526                	mv	a0,s1
ffffffffc0209cbc:	ea7ff0ef          	jal	ffffffffc0209b62 <sfs_block_free>
ffffffffc0209cc0:	6008                	ld	a0,0(s0)
ffffffffc0209cc2:	5d4c                	lw	a1,60(a0)
ffffffffc0209cc4:	d1f9                	beqz	a1,ffffffffc0209c8a <sfs_reclaim+0xb4>
ffffffffc0209cc6:	8526                	mv	a0,s1
ffffffffc0209cc8:	e9bff0ef          	jal	ffffffffc0209b62 <sfs_block_free>
ffffffffc0209ccc:	6008                	ld	a0,0(s0)
ffffffffc0209cce:	bf75                	j	ffffffffc0209c8a <sfs_reclaim+0xb4>
ffffffffc0209cd0:	892a                	mv	s2,a0
ffffffffc0209cd2:	bfc9                	j	ffffffffc0209ca4 <sfs_reclaim+0xce>
ffffffffc0209cd4:	00005697          	auipc	a3,0x5
ffffffffc0209cd8:	9bc68693          	addi	a3,a3,-1604 # ffffffffc020e690 <etext+0x2e9e>
ffffffffc0209cdc:	00002617          	auipc	a2,0x2
ffffffffc0209ce0:	f5460613          	addi	a2,a2,-172 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209ce4:	35700593          	li	a1,855
ffffffffc0209ce8:	00005517          	auipc	a0,0x5
ffffffffc0209cec:	b8850513          	addi	a0,a0,-1144 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209cf0:	f5af60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209cf4:	00005697          	auipc	a3,0x5
ffffffffc0209cf8:	c0468693          	addi	a3,a3,-1020 # ffffffffc020e8f8 <etext+0x3106>
ffffffffc0209cfc:	00002617          	auipc	a2,0x2
ffffffffc0209d00:	f3460613          	addi	a2,a2,-204 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209d04:	35d00593          	li	a1,861
ffffffffc0209d08:	00005517          	auipc	a0,0x5
ffffffffc0209d0c:	b6850513          	addi	a0,a0,-1176 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209d10:	f3af60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209d14:	00005697          	auipc	a3,0x5
ffffffffc0209d18:	b2468693          	addi	a3,a3,-1244 # ffffffffc020e838 <etext+0x3046>
ffffffffc0209d1c:	00002617          	auipc	a2,0x2
ffffffffc0209d20:	f1460613          	addi	a2,a2,-236 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209d24:	35800593          	li	a1,856
ffffffffc0209d28:	00005517          	auipc	a0,0x5
ffffffffc0209d2c:	b4850513          	addi	a0,a0,-1208 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209d30:	f1af60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209d34:	00004697          	auipc	a3,0x4
ffffffffc0209d38:	40468693          	addi	a3,a3,1028 # ffffffffc020e138 <etext+0x2946>
ffffffffc0209d3c:	00002617          	auipc	a2,0x2
ffffffffc0209d40:	ef460613          	addi	a2,a2,-268 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209d44:	36200593          	li	a1,866
ffffffffc0209d48:	00005517          	auipc	a0,0x5
ffffffffc0209d4c:	b2850513          	addi	a0,a0,-1240 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209d50:	efaf60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209d54:	00003697          	auipc	a3,0x3
ffffffffc0209d58:	76c68693          	addi	a3,a3,1900 # ffffffffc020d4c0 <etext+0x1cce>
ffffffffc0209d5c:	00002617          	auipc	a2,0x2
ffffffffc0209d60:	ed460613          	addi	a2,a2,-300 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209d64:	36700593          	li	a1,871
ffffffffc0209d68:	00005517          	auipc	a0,0x5
ffffffffc0209d6c:	b0850513          	addi	a0,a0,-1272 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209d70:	edaf60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209d74 <sfs_block_alloc>:
ffffffffc0209d74:	1101                	addi	sp,sp,-32
ffffffffc0209d76:	e822                	sd	s0,16(sp)
ffffffffc0209d78:	842a                	mv	s0,a0
ffffffffc0209d7a:	7d08                	ld	a0,56(a0)
ffffffffc0209d7c:	e426                	sd	s1,8(sp)
ffffffffc0209d7e:	ec06                	sd	ra,24(sp)
ffffffffc0209d80:	84ae                	mv	s1,a1
ffffffffc0209d82:	c3eff0ef          	jal	ffffffffc02091c0 <bitmap_alloc>
ffffffffc0209d86:	e90d                	bnez	a0,ffffffffc0209db8 <sfs_block_alloc+0x44>
ffffffffc0209d88:	441c                	lw	a5,8(s0)
ffffffffc0209d8a:	cbb5                	beqz	a5,ffffffffc0209dfe <sfs_block_alloc+0x8a>
ffffffffc0209d8c:	37fd                	addiw	a5,a5,-1
ffffffffc0209d8e:	c41c                	sw	a5,8(s0)
ffffffffc0209d90:	408c                	lw	a1,0(s1)
ffffffffc0209d92:	4605                	li	a2,1
ffffffffc0209d94:	e030                	sd	a2,64(s0)
ffffffffc0209d96:	c595                	beqz	a1,ffffffffc0209dc2 <sfs_block_alloc+0x4e>
ffffffffc0209d98:	405c                	lw	a5,4(s0)
ffffffffc0209d9a:	02f5f463          	bgeu	a1,a5,ffffffffc0209dc2 <sfs_block_alloc+0x4e>
ffffffffc0209d9e:	7c08                	ld	a0,56(s0)
ffffffffc0209da0:	c92ff0ef          	jal	ffffffffc0209232 <bitmap_test>
ffffffffc0209da4:	4605                	li	a2,1
ffffffffc0209da6:	ed05                	bnez	a0,ffffffffc0209dde <sfs_block_alloc+0x6a>
ffffffffc0209da8:	8522                	mv	a0,s0
ffffffffc0209daa:	6442                	ld	s0,16(sp)
ffffffffc0209dac:	408c                	lw	a1,0(s1)
ffffffffc0209dae:	60e2                	ld	ra,24(sp)
ffffffffc0209db0:	64a2                	ld	s1,8(sp)
ffffffffc0209db2:	6105                	addi	sp,sp,32
ffffffffc0209db4:	41a0106f          	j	ffffffffc020b1ce <sfs_clear_block>
ffffffffc0209db8:	60e2                	ld	ra,24(sp)
ffffffffc0209dba:	6442                	ld	s0,16(sp)
ffffffffc0209dbc:	64a2                	ld	s1,8(sp)
ffffffffc0209dbe:	6105                	addi	sp,sp,32
ffffffffc0209dc0:	8082                	ret
ffffffffc0209dc2:	4054                	lw	a3,4(s0)
ffffffffc0209dc4:	872e                	mv	a4,a1
ffffffffc0209dc6:	00005617          	auipc	a2,0x5
ffffffffc0209dca:	ada60613          	addi	a2,a2,-1318 # ffffffffc020e8a0 <etext+0x30ae>
ffffffffc0209dce:	05300593          	li	a1,83
ffffffffc0209dd2:	00005517          	auipc	a0,0x5
ffffffffc0209dd6:	a9e50513          	addi	a0,a0,-1378 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209dda:	e70f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209dde:	00005697          	auipc	a3,0x5
ffffffffc0209de2:	b5268693          	addi	a3,a3,-1198 # ffffffffc020e930 <etext+0x313e>
ffffffffc0209de6:	00002617          	auipc	a2,0x2
ffffffffc0209dea:	e4a60613          	addi	a2,a2,-438 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209dee:	06100593          	li	a1,97
ffffffffc0209df2:	00005517          	auipc	a0,0x5
ffffffffc0209df6:	a7e50513          	addi	a0,a0,-1410 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209dfa:	e50f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209dfe:	00005697          	auipc	a3,0x5
ffffffffc0209e02:	b1268693          	addi	a3,a3,-1262 # ffffffffc020e910 <etext+0x311e>
ffffffffc0209e06:	00002617          	auipc	a2,0x2
ffffffffc0209e0a:	e2a60613          	addi	a2,a2,-470 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209e0e:	05f00593          	li	a1,95
ffffffffc0209e12:	00005517          	auipc	a0,0x5
ffffffffc0209e16:	a5e50513          	addi	a0,a0,-1442 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209e1a:	e30f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc0209e1e <sfs_bmap_load_nolock>:
ffffffffc0209e1e:	711d                	addi	sp,sp,-96
ffffffffc0209e20:	e4a6                	sd	s1,72(sp)
ffffffffc0209e22:	6184                	ld	s1,0(a1)
ffffffffc0209e24:	e0ca                	sd	s2,64(sp)
ffffffffc0209e26:	ec86                	sd	ra,88(sp)
ffffffffc0209e28:	0084a903          	lw	s2,8(s1)
ffffffffc0209e2c:	e8a2                	sd	s0,80(sp)
ffffffffc0209e2e:	fc4e                	sd	s3,56(sp)
ffffffffc0209e30:	f852                	sd	s4,48(sp)
ffffffffc0209e32:	1ac96663          	bltu	s2,a2,ffffffffc0209fde <sfs_bmap_load_nolock+0x1c0>
ffffffffc0209e36:	47ad                	li	a5,11
ffffffffc0209e38:	882e                	mv	a6,a1
ffffffffc0209e3a:	8432                	mv	s0,a2
ffffffffc0209e3c:	8a36                	mv	s4,a3
ffffffffc0209e3e:	89aa                	mv	s3,a0
ffffffffc0209e40:	04c7f963          	bgeu	a5,a2,ffffffffc0209e92 <sfs_bmap_load_nolock+0x74>
ffffffffc0209e44:	ff46079b          	addiw	a5,a2,-12
ffffffffc0209e48:	3ff00713          	li	a4,1023
ffffffffc0209e4c:	f456                	sd	s5,40(sp)
ffffffffc0209e4e:	1af76a63          	bltu	a4,a5,ffffffffc020a002 <sfs_bmap_load_nolock+0x1e4>
ffffffffc0209e52:	03c4a883          	lw	a7,60(s1)
ffffffffc0209e56:	02079713          	slli	a4,a5,0x20
ffffffffc0209e5a:	01e75793          	srli	a5,a4,0x1e
ffffffffc0209e5e:	ce02                	sw	zero,28(sp)
ffffffffc0209e60:	cc46                	sw	a7,24(sp)
ffffffffc0209e62:	8abe                	mv	s5,a5
ffffffffc0209e64:	12089063          	bnez	a7,ffffffffc0209f84 <sfs_bmap_load_nolock+0x166>
ffffffffc0209e68:	08c90c63          	beq	s2,a2,ffffffffc0209f00 <sfs_bmap_load_nolock+0xe2>
ffffffffc0209e6c:	7aa2                	ld	s5,40(sp)
ffffffffc0209e6e:	4581                	li	a1,0
ffffffffc0209e70:	0049a683          	lw	a3,4(s3)
ffffffffc0209e74:	f456                	sd	s5,40(sp)
ffffffffc0209e76:	f05a                	sd	s6,32(sp)
ffffffffc0209e78:	872e                	mv	a4,a1
ffffffffc0209e7a:	00005617          	auipc	a2,0x5
ffffffffc0209e7e:	a2660613          	addi	a2,a2,-1498 # ffffffffc020e8a0 <etext+0x30ae>
ffffffffc0209e82:	05300593          	li	a1,83
ffffffffc0209e86:	00005517          	auipc	a0,0x5
ffffffffc0209e8a:	9ea50513          	addi	a0,a0,-1558 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209e8e:	dbcf60ef          	jal	ffffffffc020044a <__panic>
ffffffffc0209e92:	02061793          	slli	a5,a2,0x20
ffffffffc0209e96:	01e7d713          	srli	a4,a5,0x1e
ffffffffc0209e9a:	9726                	add	a4,a4,s1
ffffffffc0209e9c:	474c                	lw	a1,12(a4)
ffffffffc0209e9e:	ca2e                	sw	a1,20(sp)
ffffffffc0209ea0:	e581                	bnez	a1,ffffffffc0209ea8 <sfs_bmap_load_nolock+0x8a>
ffffffffc0209ea2:	0cc90063          	beq	s2,a2,ffffffffc0209f62 <sfs_bmap_load_nolock+0x144>
ffffffffc0209ea6:	d5e1                	beqz	a1,ffffffffc0209e6e <sfs_bmap_load_nolock+0x50>
ffffffffc0209ea8:	0049a683          	lw	a3,4(s3)
ffffffffc0209eac:	16d5f863          	bgeu	a1,a3,ffffffffc020a01c <sfs_bmap_load_nolock+0x1fe>
ffffffffc0209eb0:	0389b503          	ld	a0,56(s3)
ffffffffc0209eb4:	b7eff0ef          	jal	ffffffffc0209232 <bitmap_test>
ffffffffc0209eb8:	18051763          	bnez	a0,ffffffffc020a046 <sfs_bmap_load_nolock+0x228>
ffffffffc0209ebc:	45d2                	lw	a1,20(sp)
ffffffffc0209ebe:	0049a783          	lw	a5,4(s3)
ffffffffc0209ec2:	d5d5                	beqz	a1,ffffffffc0209e6e <sfs_bmap_load_nolock+0x50>
ffffffffc0209ec4:	faf5f6e3          	bgeu	a1,a5,ffffffffc0209e70 <sfs_bmap_load_nolock+0x52>
ffffffffc0209ec8:	0389b503          	ld	a0,56(s3)
ffffffffc0209ecc:	e02e                	sd	a1,0(sp)
ffffffffc0209ece:	b64ff0ef          	jal	ffffffffc0209232 <bitmap_test>
ffffffffc0209ed2:	6582                	ld	a1,0(sp)
ffffffffc0209ed4:	14051763          	bnez	a0,ffffffffc020a022 <sfs_bmap_load_nolock+0x204>
ffffffffc0209ed8:	02890063          	beq	s2,s0,ffffffffc0209ef8 <sfs_bmap_load_nolock+0xda>
ffffffffc0209edc:	000a0463          	beqz	s4,ffffffffc0209ee4 <sfs_bmap_load_nolock+0xc6>
ffffffffc0209ee0:	00ba2023          	sw	a1,0(s4)
ffffffffc0209ee4:	4781                	li	a5,0
ffffffffc0209ee6:	6446                	ld	s0,80(sp)
ffffffffc0209ee8:	60e6                	ld	ra,88(sp)
ffffffffc0209eea:	79e2                	ld	s3,56(sp)
ffffffffc0209eec:	7a42                	ld	s4,48(sp)
ffffffffc0209eee:	64a6                	ld	s1,72(sp)
ffffffffc0209ef0:	6906                	ld	s2,64(sp)
ffffffffc0209ef2:	853e                	mv	a0,a5
ffffffffc0209ef4:	6125                	addi	sp,sp,96
ffffffffc0209ef6:	8082                	ret
ffffffffc0209ef8:	449c                	lw	a5,8(s1)
ffffffffc0209efa:	2785                	addiw	a5,a5,1
ffffffffc0209efc:	c49c                	sw	a5,8(s1)
ffffffffc0209efe:	bff9                	j	ffffffffc0209edc <sfs_bmap_load_nolock+0xbe>
ffffffffc0209f00:	082c                	addi	a1,sp,24
ffffffffc0209f02:	e046                	sd	a7,0(sp)
ffffffffc0209f04:	e442                	sd	a6,8(sp)
ffffffffc0209f06:	e6fff0ef          	jal	ffffffffc0209d74 <sfs_block_alloc>
ffffffffc0209f0a:	87aa                	mv	a5,a0
ffffffffc0209f0c:	ed5d                	bnez	a0,ffffffffc0209fca <sfs_bmap_load_nolock+0x1ac>
ffffffffc0209f0e:	6882                	ld	a7,0(sp)
ffffffffc0209f10:	6822                	ld	a6,8(sp)
ffffffffc0209f12:	f05a                	sd	s6,32(sp)
ffffffffc0209f14:	01c10b13          	addi	s6,sp,28
ffffffffc0209f18:	85da                	mv	a1,s6
ffffffffc0209f1a:	854e                	mv	a0,s3
ffffffffc0209f1c:	e046                	sd	a7,0(sp)
ffffffffc0209f1e:	e442                	sd	a6,8(sp)
ffffffffc0209f20:	e55ff0ef          	jal	ffffffffc0209d74 <sfs_block_alloc>
ffffffffc0209f24:	6882                	ld	a7,0(sp)
ffffffffc0209f26:	87aa                	mv	a5,a0
ffffffffc0209f28:	e959                	bnez	a0,ffffffffc0209fbe <sfs_bmap_load_nolock+0x1a0>
ffffffffc0209f2a:	46e2                	lw	a3,24(sp)
ffffffffc0209f2c:	85da                	mv	a1,s6
ffffffffc0209f2e:	8756                	mv	a4,s5
ffffffffc0209f30:	4611                	li	a2,4
ffffffffc0209f32:	854e                	mv	a0,s3
ffffffffc0209f34:	e046                	sd	a7,0(sp)
ffffffffc0209f36:	144010ef          	jal	ffffffffc020b07a <sfs_wbuf>
ffffffffc0209f3a:	45f2                	lw	a1,28(sp)
ffffffffc0209f3c:	6882                	ld	a7,0(sp)
ffffffffc0209f3e:	e92d                	bnez	a0,ffffffffc0209fb0 <sfs_bmap_load_nolock+0x192>
ffffffffc0209f40:	5cd8                	lw	a4,60(s1)
ffffffffc0209f42:	47e2                	lw	a5,24(sp)
ffffffffc0209f44:	6822                	ld	a6,8(sp)
ffffffffc0209f46:	ca2e                	sw	a1,20(sp)
ffffffffc0209f48:	00f70863          	beq	a4,a5,ffffffffc0209f58 <sfs_bmap_load_nolock+0x13a>
ffffffffc0209f4c:	10071f63          	bnez	a4,ffffffffc020a06a <sfs_bmap_load_nolock+0x24c>
ffffffffc0209f50:	dcdc                	sw	a5,60(s1)
ffffffffc0209f52:	4785                	li	a5,1
ffffffffc0209f54:	00f83823          	sd	a5,16(a6)
ffffffffc0209f58:	7aa2                	ld	s5,40(sp)
ffffffffc0209f5a:	7b02                	ld	s6,32(sp)
ffffffffc0209f5c:	f00589e3          	beqz	a1,ffffffffc0209e6e <sfs_bmap_load_nolock+0x50>
ffffffffc0209f60:	b7a1                	j	ffffffffc0209ea8 <sfs_bmap_load_nolock+0x8a>
ffffffffc0209f62:	084c                	addi	a1,sp,20
ffffffffc0209f64:	e03a                	sd	a4,0(sp)
ffffffffc0209f66:	e442                	sd	a6,8(sp)
ffffffffc0209f68:	e0dff0ef          	jal	ffffffffc0209d74 <sfs_block_alloc>
ffffffffc0209f6c:	87aa                	mv	a5,a0
ffffffffc0209f6e:	fd25                	bnez	a0,ffffffffc0209ee6 <sfs_bmap_load_nolock+0xc8>
ffffffffc0209f70:	45d2                	lw	a1,20(sp)
ffffffffc0209f72:	6702                	ld	a4,0(sp)
ffffffffc0209f74:	6822                	ld	a6,8(sp)
ffffffffc0209f76:	4785                	li	a5,1
ffffffffc0209f78:	c74c                	sw	a1,12(a4)
ffffffffc0209f7a:	00f83823          	sd	a5,16(a6)
ffffffffc0209f7e:	ee0588e3          	beqz	a1,ffffffffc0209e6e <sfs_bmap_load_nolock+0x50>
ffffffffc0209f82:	b71d                	j	ffffffffc0209ea8 <sfs_bmap_load_nolock+0x8a>
ffffffffc0209f84:	e02e                	sd	a1,0(sp)
ffffffffc0209f86:	873e                	mv	a4,a5
ffffffffc0209f88:	086c                	addi	a1,sp,28
ffffffffc0209f8a:	86c6                	mv	a3,a7
ffffffffc0209f8c:	4611                	li	a2,4
ffffffffc0209f8e:	f05a                	sd	s6,32(sp)
ffffffffc0209f90:	e446                	sd	a7,8(sp)
ffffffffc0209f92:	068010ef          	jal	ffffffffc020affa <sfs_rbuf>
ffffffffc0209f96:	01c10b13          	addi	s6,sp,28
ffffffffc0209f9a:	87aa                	mv	a5,a0
ffffffffc0209f9c:	e505                	bnez	a0,ffffffffc0209fc4 <sfs_bmap_load_nolock+0x1a6>
ffffffffc0209f9e:	45f2                	lw	a1,28(sp)
ffffffffc0209fa0:	6802                	ld	a6,0(sp)
ffffffffc0209fa2:	00891463          	bne	s2,s0,ffffffffc0209faa <sfs_bmap_load_nolock+0x18c>
ffffffffc0209fa6:	68a2                	ld	a7,8(sp)
ffffffffc0209fa8:	d9a5                	beqz	a1,ffffffffc0209f18 <sfs_bmap_load_nolock+0xfa>
ffffffffc0209faa:	5cd8                	lw	a4,60(s1)
ffffffffc0209fac:	47e2                	lw	a5,24(sp)
ffffffffc0209fae:	bf61                	j	ffffffffc0209f46 <sfs_bmap_load_nolock+0x128>
ffffffffc0209fb0:	e42a                	sd	a0,8(sp)
ffffffffc0209fb2:	854e                	mv	a0,s3
ffffffffc0209fb4:	e046                	sd	a7,0(sp)
ffffffffc0209fb6:	badff0ef          	jal	ffffffffc0209b62 <sfs_block_free>
ffffffffc0209fba:	6882                	ld	a7,0(sp)
ffffffffc0209fbc:	67a2                	ld	a5,8(sp)
ffffffffc0209fbe:	45e2                	lw	a1,24(sp)
ffffffffc0209fc0:	00b89763          	bne	a7,a1,ffffffffc0209fce <sfs_bmap_load_nolock+0x1b0>
ffffffffc0209fc4:	7aa2                	ld	s5,40(sp)
ffffffffc0209fc6:	7b02                	ld	s6,32(sp)
ffffffffc0209fc8:	bf39                	j	ffffffffc0209ee6 <sfs_bmap_load_nolock+0xc8>
ffffffffc0209fca:	7aa2                	ld	s5,40(sp)
ffffffffc0209fcc:	bf29                	j	ffffffffc0209ee6 <sfs_bmap_load_nolock+0xc8>
ffffffffc0209fce:	854e                	mv	a0,s3
ffffffffc0209fd0:	e03e                	sd	a5,0(sp)
ffffffffc0209fd2:	b91ff0ef          	jal	ffffffffc0209b62 <sfs_block_free>
ffffffffc0209fd6:	6782                	ld	a5,0(sp)
ffffffffc0209fd8:	7aa2                	ld	s5,40(sp)
ffffffffc0209fda:	7b02                	ld	s6,32(sp)
ffffffffc0209fdc:	b729                	j	ffffffffc0209ee6 <sfs_bmap_load_nolock+0xc8>
ffffffffc0209fde:	00005697          	auipc	a3,0x5
ffffffffc0209fe2:	97a68693          	addi	a3,a3,-1670 # ffffffffc020e958 <etext+0x3166>
ffffffffc0209fe6:	00002617          	auipc	a2,0x2
ffffffffc0209fea:	c4a60613          	addi	a2,a2,-950 # ffffffffc020bc30 <etext+0x43e>
ffffffffc0209fee:	16500593          	li	a1,357
ffffffffc0209ff2:	00005517          	auipc	a0,0x5
ffffffffc0209ff6:	87e50513          	addi	a0,a0,-1922 # ffffffffc020e870 <etext+0x307e>
ffffffffc0209ffa:	f456                	sd	s5,40(sp)
ffffffffc0209ffc:	f05a                	sd	s6,32(sp)
ffffffffc0209ffe:	c4cf60ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a002:	00005617          	auipc	a2,0x5
ffffffffc020a006:	98660613          	addi	a2,a2,-1658 # ffffffffc020e988 <etext+0x3196>
ffffffffc020a00a:	11e00593          	li	a1,286
ffffffffc020a00e:	00005517          	auipc	a0,0x5
ffffffffc020a012:	86250513          	addi	a0,a0,-1950 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a016:	f05a                	sd	s6,32(sp)
ffffffffc020a018:	c32f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a01c:	f456                	sd	s5,40(sp)
ffffffffc020a01e:	f05a                	sd	s6,32(sp)
ffffffffc020a020:	bda1                	j	ffffffffc0209e78 <sfs_bmap_load_nolock+0x5a>
ffffffffc020a022:	00005697          	auipc	a3,0x5
ffffffffc020a026:	8b668693          	addi	a3,a3,-1866 # ffffffffc020e8d8 <etext+0x30e6>
ffffffffc020a02a:	00002617          	auipc	a2,0x2
ffffffffc020a02e:	c0660613          	addi	a2,a2,-1018 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a032:	16c00593          	li	a1,364
ffffffffc020a036:	00005517          	auipc	a0,0x5
ffffffffc020a03a:	83a50513          	addi	a0,a0,-1990 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a03e:	f456                	sd	s5,40(sp)
ffffffffc020a040:	f05a                	sd	s6,32(sp)
ffffffffc020a042:	c08f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a046:	00005697          	auipc	a3,0x5
ffffffffc020a04a:	97268693          	addi	a3,a3,-1678 # ffffffffc020e9b8 <etext+0x31c6>
ffffffffc020a04e:	00002617          	auipc	a2,0x2
ffffffffc020a052:	be260613          	addi	a2,a2,-1054 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a056:	12100593          	li	a1,289
ffffffffc020a05a:	00005517          	auipc	a0,0x5
ffffffffc020a05e:	81650513          	addi	a0,a0,-2026 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a062:	f456                	sd	s5,40(sp)
ffffffffc020a064:	f05a                	sd	s6,32(sp)
ffffffffc020a066:	be4f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a06a:	00005697          	auipc	a3,0x5
ffffffffc020a06e:	90668693          	addi	a3,a3,-1786 # ffffffffc020e970 <etext+0x317e>
ffffffffc020a072:	00002617          	auipc	a2,0x2
ffffffffc020a076:	bbe60613          	addi	a2,a2,-1090 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a07a:	11800593          	li	a1,280
ffffffffc020a07e:	00004517          	auipc	a0,0x4
ffffffffc020a082:	7f250513          	addi	a0,a0,2034 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a086:	bc4f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc020a08a <sfs_io_nolock>:
ffffffffc020a08a:	7175                	addi	sp,sp,-144
ffffffffc020a08c:	e4de                	sd	s7,72(sp)
ffffffffc020a08e:	8bae                	mv	s7,a1
ffffffffc020a090:	618c                	ld	a1,0(a1)
ffffffffc020a092:	e506                	sd	ra,136(sp)
ffffffffc020a094:	4809                	li	a6,2
ffffffffc020a096:	0045d883          	lhu	a7,4(a1)
ffffffffc020a09a:	1d088763          	beq	a7,a6,ffffffffc020a268 <sfs_io_nolock+0x1de>
ffffffffc020a09e:	ecd6                	sd	s5,88(sp)
ffffffffc020a0a0:	00073a83          	ld	s5,0(a4) # 8000000 <_binary_bin_sfs_img_size+0x7f8ad00>
ffffffffc020a0a4:	f4ce                	sd	s3,104(sp)
ffffffffc020a0a6:	f86a                	sd	s10,48(sp)
ffffffffc020a0a8:	8d3a                	mv	s10,a4
ffffffffc020a0aa:	000d3023          	sd	zero,0(s10)
ffffffffc020a0ae:	08000737          	lui	a4,0x8000
ffffffffc020a0b2:	89b6                	mv	s3,a3
ffffffffc020a0b4:	9ab6                	add	s5,s5,a3
ffffffffc020a0b6:	8836                	mv	a6,a3
ffffffffc020a0b8:	1ae6f663          	bgeu	a3,a4,ffffffffc020a264 <sfs_io_nolock+0x1da>
ffffffffc020a0bc:	1adac463          	blt	s5,a3,ffffffffc020a264 <sfs_io_nolock+0x1da>
ffffffffc020a0c0:	f0d2                	sd	s4,96(sp)
ffffffffc020a0c2:	8a2a                	mv	s4,a0
ffffffffc020a0c4:	4501                	li	a0,0
ffffffffc020a0c6:	13568163          	beq	a3,s5,ffffffffc020a1e8 <sfs_io_nolock+0x15e>
ffffffffc020a0ca:	fca6                	sd	s1,120(sp)
ffffffffc020a0cc:	fc66                	sd	s9,56(sp)
ffffffffc020a0ce:	f46e                	sd	s11,40(sp)
ffffffffc020a0d0:	84b2                	mv	s1,a2
ffffffffc020a0d2:	01577363          	bgeu	a4,s5,ffffffffc020a0d8 <sfs_io_nolock+0x4e>
ffffffffc020a0d6:	8aba                	mv	s5,a4
ffffffffc020a0d8:	c3f5                	beqz	a5,ffffffffc020a1bc <sfs_io_nolock+0x132>
ffffffffc020a0da:	e122                	sd	s0,128(sp)
ffffffffc020a0dc:	f8ca                	sd	s2,112(sp)
ffffffffc020a0de:	e8da                	sd	s6,80(sp)
ffffffffc020a0e0:	e0e2                	sd	s8,64(sp)
ffffffffc020a0e2:	00001c97          	auipc	s9,0x1
ffffffffc020a0e6:	eb6c8c93          	addi	s9,s9,-330 # ffffffffc020af98 <sfs_wblock>
ffffffffc020a0ea:	00001d97          	auipc	s11,0x1
ffffffffc020a0ee:	f90d8d93          	addi	s11,s11,-112 # ffffffffc020b07a <sfs_wbuf>
ffffffffc020a0f2:	6705                	lui	a4,0x1
ffffffffc020a0f4:	40c9d413          	srai	s0,s3,0xc
ffffffffc020a0f8:	fff70c13          	addi	s8,a4,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc020a0fc:	40cadb13          	srai	s6,s5,0xc
ffffffffc020a100:	408b0b3b          	subw	s6,s6,s0
ffffffffc020a104:	0189fc33          	and	s8,s3,s8
ffffffffc020a108:	2401                	sext.w	s0,s0
ffffffffc020a10a:	87da                	mv	a5,s6
ffffffffc020a10c:	0c0c0c63          	beqz	s8,ffffffffc020a1e4 <sfs_io_nolock+0x15a>
ffffffffc020a110:	413a87b3          	sub	a5,s5,s3
ffffffffc020a114:	0e0b1263          	bnez	s6,ffffffffc020a1f8 <sfs_io_nolock+0x16e>
ffffffffc020a118:	0874                	addi	a3,sp,28
ffffffffc020a11a:	8622                	mv	a2,s0
ffffffffc020a11c:	85de                	mv	a1,s7
ffffffffc020a11e:	8552                	mv	a0,s4
ffffffffc020a120:	e042                	sd	a6,0(sp)
ffffffffc020a122:	e43e                	sd	a5,8(sp)
ffffffffc020a124:	cfbff0ef          	jal	ffffffffc0209e1e <sfs_bmap_load_nolock>
ffffffffc020a128:	6802                	ld	a6,0(sp)
ffffffffc020a12a:	4901                	li	s2,0
ffffffffc020a12c:	e931                	bnez	a0,ffffffffc020a180 <sfs_io_nolock+0xf6>
ffffffffc020a12e:	6922                	ld	s2,8(sp)
ffffffffc020a130:	46f2                	lw	a3,28(sp)
ffffffffc020a132:	8762                	mv	a4,s8
ffffffffc020a134:	864a                	mv	a2,s2
ffffffffc020a136:	85a6                	mv	a1,s1
ffffffffc020a138:	8552                	mv	a0,s4
ffffffffc020a13a:	9d82                	jalr	s11
ffffffffc020a13c:	6802                	ld	a6,0(sp)
ffffffffc020a13e:	e971                	bnez	a0,ffffffffc020a212 <sfs_io_nolock+0x188>
ffffffffc020a140:	020b0e63          	beqz	s6,ffffffffc020a17c <sfs_io_nolock+0xf2>
ffffffffc020a144:	94ca                	add	s1,s1,s2
ffffffffc020a146:	2405                	addiw	s0,s0,1
ffffffffc020a148:	fffb079b          	addiw	a5,s6,-1
ffffffffc020a14c:	c7e9                	beqz	a5,ffffffffc020a216 <sfs_io_nolock+0x18c>
ffffffffc020a14e:	00878c3b          	addw	s8,a5,s0
ffffffffc020a152:	e062                	sd	s8,0(sp)
ffffffffc020a154:	6b05                	lui	s6,0x1
ffffffffc020a156:	a821                	j	ffffffffc020a16e <sfs_io_nolock+0xe4>
ffffffffc020a158:	4672                	lw	a2,28(sp)
ffffffffc020a15a:	4685                	li	a3,1
ffffffffc020a15c:	85a6                	mv	a1,s1
ffffffffc020a15e:	8552                	mv	a0,s4
ffffffffc020a160:	9c82                	jalr	s9
ffffffffc020a162:	ed09                	bnez	a0,ffffffffc020a17c <sfs_io_nolock+0xf2>
ffffffffc020a164:	2405                	addiw	s0,s0,1
ffffffffc020a166:	995a                	add	s2,s2,s6
ffffffffc020a168:	94da                	add	s1,s1,s6
ffffffffc020a16a:	0a8c0763          	beq	s8,s0,ffffffffc020a218 <sfs_io_nolock+0x18e>
ffffffffc020a16e:	0874                	addi	a3,sp,28
ffffffffc020a170:	8622                	mv	a2,s0
ffffffffc020a172:	85de                	mv	a1,s7
ffffffffc020a174:	8552                	mv	a0,s4
ffffffffc020a176:	ca9ff0ef          	jal	ffffffffc0209e1e <sfs_bmap_load_nolock>
ffffffffc020a17a:	dd79                	beqz	a0,ffffffffc020a158 <sfs_io_nolock+0xce>
ffffffffc020a17c:	01298833          	add	a6,s3,s2
ffffffffc020a180:	000bb783          	ld	a5,0(s7)
ffffffffc020a184:	012d3023          	sd	s2,0(s10)
ffffffffc020a188:	0007e703          	lwu	a4,0(a5)
ffffffffc020a18c:	01077963          	bgeu	a4,a6,ffffffffc020a19e <sfs_io_nolock+0x114>
ffffffffc020a190:	012989bb          	addw	s3,s3,s2
ffffffffc020a194:	0137a023          	sw	s3,0(a5)
ffffffffc020a198:	4785                	li	a5,1
ffffffffc020a19a:	00fbb823          	sd	a5,16(s7)
ffffffffc020a19e:	640a                	ld	s0,128(sp)
ffffffffc020a1a0:	74e6                	ld	s1,120(sp)
ffffffffc020a1a2:	7946                	ld	s2,112(sp)
ffffffffc020a1a4:	7a06                	ld	s4,96(sp)
ffffffffc020a1a6:	6b46                	ld	s6,80(sp)
ffffffffc020a1a8:	6c06                	ld	s8,64(sp)
ffffffffc020a1aa:	7ce2                	ld	s9,56(sp)
ffffffffc020a1ac:	7da2                	ld	s11,40(sp)
ffffffffc020a1ae:	60aa                	ld	ra,136(sp)
ffffffffc020a1b0:	79a6                	ld	s3,104(sp)
ffffffffc020a1b2:	6ae6                	ld	s5,88(sp)
ffffffffc020a1b4:	7d42                	ld	s10,48(sp)
ffffffffc020a1b6:	6ba6                	ld	s7,72(sp)
ffffffffc020a1b8:	6149                	addi	sp,sp,144
ffffffffc020a1ba:	8082                	ret
ffffffffc020a1bc:	0005e783          	lwu	a5,0(a1)
ffffffffc020a1c0:	4501                	li	a0,0
ffffffffc020a1c2:	06f9d463          	bge	s3,a5,ffffffffc020a22a <sfs_io_nolock+0x1a0>
ffffffffc020a1c6:	e122                	sd	s0,128(sp)
ffffffffc020a1c8:	f8ca                	sd	s2,112(sp)
ffffffffc020a1ca:	e8da                	sd	s6,80(sp)
ffffffffc020a1cc:	e0e2                	sd	s8,64(sp)
ffffffffc020a1ce:	0357c863          	blt	a5,s5,ffffffffc020a1fe <sfs_io_nolock+0x174>
ffffffffc020a1d2:	00001c97          	auipc	s9,0x1
ffffffffc020a1d6:	d64c8c93          	addi	s9,s9,-668 # ffffffffc020af36 <sfs_rblock>
ffffffffc020a1da:	00001d97          	auipc	s11,0x1
ffffffffc020a1de:	e20d8d93          	addi	s11,s11,-480 # ffffffffc020affa <sfs_rbuf>
ffffffffc020a1e2:	bf01                	j	ffffffffc020a0f2 <sfs_io_nolock+0x68>
ffffffffc020a1e4:	4901                	li	s2,0
ffffffffc020a1e6:	b79d                	j	ffffffffc020a14c <sfs_io_nolock+0xc2>
ffffffffc020a1e8:	60aa                	ld	ra,136(sp)
ffffffffc020a1ea:	7a06                	ld	s4,96(sp)
ffffffffc020a1ec:	79a6                	ld	s3,104(sp)
ffffffffc020a1ee:	6ae6                	ld	s5,88(sp)
ffffffffc020a1f0:	7d42                	ld	s10,48(sp)
ffffffffc020a1f2:	6ba6                	ld	s7,72(sp)
ffffffffc020a1f4:	6149                	addi	sp,sp,144
ffffffffc020a1f6:	8082                	ret
ffffffffc020a1f8:	418707b3          	sub	a5,a4,s8
ffffffffc020a1fc:	bf31                	j	ffffffffc020a118 <sfs_io_nolock+0x8e>
ffffffffc020a1fe:	8abe                	mv	s5,a5
ffffffffc020a200:	00001c97          	auipc	s9,0x1
ffffffffc020a204:	d36c8c93          	addi	s9,s9,-714 # ffffffffc020af36 <sfs_rblock>
ffffffffc020a208:	00001d97          	auipc	s11,0x1
ffffffffc020a20c:	df2d8d93          	addi	s11,s11,-526 # ffffffffc020affa <sfs_rbuf>
ffffffffc020a210:	b5cd                	j	ffffffffc020a0f2 <sfs_io_nolock+0x68>
ffffffffc020a212:	4901                	li	s2,0
ffffffffc020a214:	b7b5                	j	ffffffffc020a180 <sfs_io_nolock+0xf6>
ffffffffc020a216:	e022                	sd	s0,0(sp)
ffffffffc020a218:	1ad2                	slli	s5,s5,0x34
ffffffffc020a21a:	034ad413          	srli	s0,s5,0x34
ffffffffc020a21e:	020a9163          	bnez	s5,ffffffffc020a240 <sfs_io_nolock+0x1b6>
ffffffffc020a222:	01298833          	add	a6,s3,s2
ffffffffc020a226:	4501                	li	a0,0
ffffffffc020a228:	bfa1                	j	ffffffffc020a180 <sfs_io_nolock+0xf6>
ffffffffc020a22a:	60aa                	ld	ra,136(sp)
ffffffffc020a22c:	74e6                	ld	s1,120(sp)
ffffffffc020a22e:	7a06                	ld	s4,96(sp)
ffffffffc020a230:	7ce2                	ld	s9,56(sp)
ffffffffc020a232:	7da2                	ld	s11,40(sp)
ffffffffc020a234:	79a6                	ld	s3,104(sp)
ffffffffc020a236:	6ae6                	ld	s5,88(sp)
ffffffffc020a238:	7d42                	ld	s10,48(sp)
ffffffffc020a23a:	6ba6                	ld	s7,72(sp)
ffffffffc020a23c:	6149                	addi	sp,sp,144
ffffffffc020a23e:	8082                	ret
ffffffffc020a240:	6602                	ld	a2,0(sp)
ffffffffc020a242:	0874                	addi	a3,sp,28
ffffffffc020a244:	85de                	mv	a1,s7
ffffffffc020a246:	8552                	mv	a0,s4
ffffffffc020a248:	bd7ff0ef          	jal	ffffffffc0209e1e <sfs_bmap_load_nolock>
ffffffffc020a24c:	f905                	bnez	a0,ffffffffc020a17c <sfs_io_nolock+0xf2>
ffffffffc020a24e:	46f2                	lw	a3,28(sp)
ffffffffc020a250:	85a6                	mv	a1,s1
ffffffffc020a252:	8552                	mv	a0,s4
ffffffffc020a254:	4701                	li	a4,0
ffffffffc020a256:	8622                	mv	a2,s0
ffffffffc020a258:	9d82                	jalr	s11
ffffffffc020a25a:	f10d                	bnez	a0,ffffffffc020a17c <sfs_io_nolock+0xf2>
ffffffffc020a25c:	9922                	add	s2,s2,s0
ffffffffc020a25e:	01298833          	add	a6,s3,s2
ffffffffc020a262:	bf39                	j	ffffffffc020a180 <sfs_io_nolock+0xf6>
ffffffffc020a264:	5575                	li	a0,-3
ffffffffc020a266:	b7a1                	j	ffffffffc020a1ae <sfs_io_nolock+0x124>
ffffffffc020a268:	00004697          	auipc	a3,0x4
ffffffffc020a26c:	77868693          	addi	a3,a3,1912 # ffffffffc020e9e0 <etext+0x31ee>
ffffffffc020a270:	00002617          	auipc	a2,0x2
ffffffffc020a274:	9c060613          	addi	a2,a2,-1600 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a278:	22e00593          	li	a1,558
ffffffffc020a27c:	00004517          	auipc	a0,0x4
ffffffffc020a280:	5f450513          	addi	a0,a0,1524 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a284:	e122                	sd	s0,128(sp)
ffffffffc020a286:	fca6                	sd	s1,120(sp)
ffffffffc020a288:	f8ca                	sd	s2,112(sp)
ffffffffc020a28a:	f4ce                	sd	s3,104(sp)
ffffffffc020a28c:	f0d2                	sd	s4,96(sp)
ffffffffc020a28e:	ecd6                	sd	s5,88(sp)
ffffffffc020a290:	e8da                	sd	s6,80(sp)
ffffffffc020a292:	e0e2                	sd	s8,64(sp)
ffffffffc020a294:	fc66                	sd	s9,56(sp)
ffffffffc020a296:	f86a                	sd	s10,48(sp)
ffffffffc020a298:	f46e                	sd	s11,40(sp)
ffffffffc020a29a:	9b0f60ef          	jal	ffffffffc020044a <__panic>

ffffffffc020a29e <sfs_read>:
ffffffffc020a29e:	7139                	addi	sp,sp,-64
ffffffffc020a2a0:	f04a                	sd	s2,32(sp)
ffffffffc020a2a2:	06853903          	ld	s2,104(a0)
ffffffffc020a2a6:	fc06                	sd	ra,56(sp)
ffffffffc020a2a8:	f822                	sd	s0,48(sp)
ffffffffc020a2aa:	f426                	sd	s1,40(sp)
ffffffffc020a2ac:	ec4e                	sd	s3,24(sp)
ffffffffc020a2ae:	04090e63          	beqz	s2,ffffffffc020a30a <sfs_read+0x6c>
ffffffffc020a2b2:	0b092783          	lw	a5,176(s2)
ffffffffc020a2b6:	ebb1                	bnez	a5,ffffffffc020a30a <sfs_read+0x6c>
ffffffffc020a2b8:	4d38                	lw	a4,88(a0)
ffffffffc020a2ba:	6785                	lui	a5,0x1
ffffffffc020a2bc:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a2c0:	842a                	mv	s0,a0
ffffffffc020a2c2:	06f71463          	bne	a4,a5,ffffffffc020a32a <sfs_read+0x8c>
ffffffffc020a2c6:	02050993          	addi	s3,a0,32
ffffffffc020a2ca:	854e                	mv	a0,s3
ffffffffc020a2cc:	84ae                	mv	s1,a1
ffffffffc020a2ce:	b74fa0ef          	jal	ffffffffc0204642 <down>
ffffffffc020a2d2:	6c9c                	ld	a5,24(s1)
ffffffffc020a2d4:	6494                	ld	a3,8(s1)
ffffffffc020a2d6:	6090                	ld	a2,0(s1)
ffffffffc020a2d8:	85a2                	mv	a1,s0
ffffffffc020a2da:	e43e                	sd	a5,8(sp)
ffffffffc020a2dc:	854a                	mv	a0,s2
ffffffffc020a2de:	0038                	addi	a4,sp,8
ffffffffc020a2e0:	4781                	li	a5,0
ffffffffc020a2e2:	da9ff0ef          	jal	ffffffffc020a08a <sfs_io_nolock>
ffffffffc020a2e6:	65a2                	ld	a1,8(sp)
ffffffffc020a2e8:	842a                	mv	s0,a0
ffffffffc020a2ea:	ed81                	bnez	a1,ffffffffc020a302 <sfs_read+0x64>
ffffffffc020a2ec:	854e                	mv	a0,s3
ffffffffc020a2ee:	b50fa0ef          	jal	ffffffffc020463e <up>
ffffffffc020a2f2:	70e2                	ld	ra,56(sp)
ffffffffc020a2f4:	8522                	mv	a0,s0
ffffffffc020a2f6:	7442                	ld	s0,48(sp)
ffffffffc020a2f8:	74a2                	ld	s1,40(sp)
ffffffffc020a2fa:	7902                	ld	s2,32(sp)
ffffffffc020a2fc:	69e2                	ld	s3,24(sp)
ffffffffc020a2fe:	6121                	addi	sp,sp,64
ffffffffc020a300:	8082                	ret
ffffffffc020a302:	8526                	mv	a0,s1
ffffffffc020a304:	a62fb0ef          	jal	ffffffffc0205566 <iobuf_skip>
ffffffffc020a308:	b7d5                	j	ffffffffc020a2ec <sfs_read+0x4e>
ffffffffc020a30a:	00004697          	auipc	a3,0x4
ffffffffc020a30e:	38668693          	addi	a3,a3,902 # ffffffffc020e690 <etext+0x2e9e>
ffffffffc020a312:	00002617          	auipc	a2,0x2
ffffffffc020a316:	91e60613          	addi	a2,a2,-1762 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a31a:	29500593          	li	a1,661
ffffffffc020a31e:	00004517          	auipc	a0,0x4
ffffffffc020a322:	55250513          	addi	a0,a0,1362 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a326:	924f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a32a:	815ff0ef          	jal	ffffffffc0209b3e <sfs_io.part.0>

ffffffffc020a32e <sfs_write>:
ffffffffc020a32e:	7139                	addi	sp,sp,-64
ffffffffc020a330:	f04a                	sd	s2,32(sp)
ffffffffc020a332:	06853903          	ld	s2,104(a0)
ffffffffc020a336:	fc06                	sd	ra,56(sp)
ffffffffc020a338:	f822                	sd	s0,48(sp)
ffffffffc020a33a:	f426                	sd	s1,40(sp)
ffffffffc020a33c:	ec4e                	sd	s3,24(sp)
ffffffffc020a33e:	04090e63          	beqz	s2,ffffffffc020a39a <sfs_write+0x6c>
ffffffffc020a342:	0b092783          	lw	a5,176(s2)
ffffffffc020a346:	ebb1                	bnez	a5,ffffffffc020a39a <sfs_write+0x6c>
ffffffffc020a348:	4d38                	lw	a4,88(a0)
ffffffffc020a34a:	6785                	lui	a5,0x1
ffffffffc020a34c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a350:	842a                	mv	s0,a0
ffffffffc020a352:	06f71463          	bne	a4,a5,ffffffffc020a3ba <sfs_write+0x8c>
ffffffffc020a356:	02050993          	addi	s3,a0,32
ffffffffc020a35a:	854e                	mv	a0,s3
ffffffffc020a35c:	84ae                	mv	s1,a1
ffffffffc020a35e:	ae4fa0ef          	jal	ffffffffc0204642 <down>
ffffffffc020a362:	6c9c                	ld	a5,24(s1)
ffffffffc020a364:	6494                	ld	a3,8(s1)
ffffffffc020a366:	6090                	ld	a2,0(s1)
ffffffffc020a368:	85a2                	mv	a1,s0
ffffffffc020a36a:	e43e                	sd	a5,8(sp)
ffffffffc020a36c:	854a                	mv	a0,s2
ffffffffc020a36e:	0038                	addi	a4,sp,8
ffffffffc020a370:	4785                	li	a5,1
ffffffffc020a372:	d19ff0ef          	jal	ffffffffc020a08a <sfs_io_nolock>
ffffffffc020a376:	65a2                	ld	a1,8(sp)
ffffffffc020a378:	842a                	mv	s0,a0
ffffffffc020a37a:	ed81                	bnez	a1,ffffffffc020a392 <sfs_write+0x64>
ffffffffc020a37c:	854e                	mv	a0,s3
ffffffffc020a37e:	ac0fa0ef          	jal	ffffffffc020463e <up>
ffffffffc020a382:	70e2                	ld	ra,56(sp)
ffffffffc020a384:	8522                	mv	a0,s0
ffffffffc020a386:	7442                	ld	s0,48(sp)
ffffffffc020a388:	74a2                	ld	s1,40(sp)
ffffffffc020a38a:	7902                	ld	s2,32(sp)
ffffffffc020a38c:	69e2                	ld	s3,24(sp)
ffffffffc020a38e:	6121                	addi	sp,sp,64
ffffffffc020a390:	8082                	ret
ffffffffc020a392:	8526                	mv	a0,s1
ffffffffc020a394:	9d2fb0ef          	jal	ffffffffc0205566 <iobuf_skip>
ffffffffc020a398:	b7d5                	j	ffffffffc020a37c <sfs_write+0x4e>
ffffffffc020a39a:	00004697          	auipc	a3,0x4
ffffffffc020a39e:	2f668693          	addi	a3,a3,758 # ffffffffc020e690 <etext+0x2e9e>
ffffffffc020a3a2:	00002617          	auipc	a2,0x2
ffffffffc020a3a6:	88e60613          	addi	a2,a2,-1906 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a3aa:	29500593          	li	a1,661
ffffffffc020a3ae:	00004517          	auipc	a0,0x4
ffffffffc020a3b2:	4c250513          	addi	a0,a0,1218 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a3b6:	894f60ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a3ba:	f84ff0ef          	jal	ffffffffc0209b3e <sfs_io.part.0>

ffffffffc020a3be <sfs_dirent_read_nolock>:
ffffffffc020a3be:	619c                	ld	a5,0(a1)
ffffffffc020a3c0:	7139                	addi	sp,sp,-64
ffffffffc020a3c2:	f426                	sd	s1,40(sp)
ffffffffc020a3c4:	84b6                	mv	s1,a3
ffffffffc020a3c6:	0047d683          	lhu	a3,4(a5)
ffffffffc020a3ca:	fc06                	sd	ra,56(sp)
ffffffffc020a3cc:	f822                	sd	s0,48(sp)
ffffffffc020a3ce:	4709                	li	a4,2
ffffffffc020a3d0:	04e69963          	bne	a3,a4,ffffffffc020a422 <sfs_dirent_read_nolock+0x64>
ffffffffc020a3d4:	479c                	lw	a5,8(a5)
ffffffffc020a3d6:	04f67663          	bgeu	a2,a5,ffffffffc020a422 <sfs_dirent_read_nolock+0x64>
ffffffffc020a3da:	0874                	addi	a3,sp,28
ffffffffc020a3dc:	842a                	mv	s0,a0
ffffffffc020a3de:	a41ff0ef          	jal	ffffffffc0209e1e <sfs_bmap_load_nolock>
ffffffffc020a3e2:	c511                	beqz	a0,ffffffffc020a3ee <sfs_dirent_read_nolock+0x30>
ffffffffc020a3e4:	70e2                	ld	ra,56(sp)
ffffffffc020a3e6:	7442                	ld	s0,48(sp)
ffffffffc020a3e8:	74a2                	ld	s1,40(sp)
ffffffffc020a3ea:	6121                	addi	sp,sp,64
ffffffffc020a3ec:	8082                	ret
ffffffffc020a3ee:	45f2                	lw	a1,28(sp)
ffffffffc020a3f0:	c9a9                	beqz	a1,ffffffffc020a442 <sfs_dirent_read_nolock+0x84>
ffffffffc020a3f2:	405c                	lw	a5,4(s0)
ffffffffc020a3f4:	04f5f763          	bgeu	a1,a5,ffffffffc020a442 <sfs_dirent_read_nolock+0x84>
ffffffffc020a3f8:	7c08                	ld	a0,56(s0)
ffffffffc020a3fa:	e42e                	sd	a1,8(sp)
ffffffffc020a3fc:	e37fe0ef          	jal	ffffffffc0209232 <bitmap_test>
ffffffffc020a400:	ed39                	bnez	a0,ffffffffc020a45e <sfs_dirent_read_nolock+0xa0>
ffffffffc020a402:	66a2                	ld	a3,8(sp)
ffffffffc020a404:	8522                	mv	a0,s0
ffffffffc020a406:	4701                	li	a4,0
ffffffffc020a408:	10400613          	li	a2,260
ffffffffc020a40c:	85a6                	mv	a1,s1
ffffffffc020a40e:	3ed000ef          	jal	ffffffffc020affa <sfs_rbuf>
ffffffffc020a412:	f969                	bnez	a0,ffffffffc020a3e4 <sfs_dirent_read_nolock+0x26>
ffffffffc020a414:	100481a3          	sb	zero,259(s1)
ffffffffc020a418:	70e2                	ld	ra,56(sp)
ffffffffc020a41a:	7442                	ld	s0,48(sp)
ffffffffc020a41c:	74a2                	ld	s1,40(sp)
ffffffffc020a41e:	6121                	addi	sp,sp,64
ffffffffc020a420:	8082                	ret
ffffffffc020a422:	00004697          	auipc	a3,0x4
ffffffffc020a426:	5de68693          	addi	a3,a3,1502 # ffffffffc020ea00 <etext+0x320e>
ffffffffc020a42a:	00002617          	auipc	a2,0x2
ffffffffc020a42e:	80660613          	addi	a2,a2,-2042 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a432:	18f00593          	li	a1,399
ffffffffc020a436:	00004517          	auipc	a0,0x4
ffffffffc020a43a:	43a50513          	addi	a0,a0,1082 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a43e:	80cf60ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a442:	4054                	lw	a3,4(s0)
ffffffffc020a444:	872e                	mv	a4,a1
ffffffffc020a446:	00004617          	auipc	a2,0x4
ffffffffc020a44a:	45a60613          	addi	a2,a2,1114 # ffffffffc020e8a0 <etext+0x30ae>
ffffffffc020a44e:	05300593          	li	a1,83
ffffffffc020a452:	00004517          	auipc	a0,0x4
ffffffffc020a456:	41e50513          	addi	a0,a0,1054 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a45a:	ff1f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a45e:	00004697          	auipc	a3,0x4
ffffffffc020a462:	47a68693          	addi	a3,a3,1146 # ffffffffc020e8d8 <etext+0x30e6>
ffffffffc020a466:	00001617          	auipc	a2,0x1
ffffffffc020a46a:	7ca60613          	addi	a2,a2,1994 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a46e:	19600593          	li	a1,406
ffffffffc020a472:	00004517          	auipc	a0,0x4
ffffffffc020a476:	3fe50513          	addi	a0,a0,1022 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a47a:	fd1f50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020a47e <sfs_getdirentry>:
ffffffffc020a47e:	715d                	addi	sp,sp,-80
ffffffffc020a480:	f052                	sd	s4,32(sp)
ffffffffc020a482:	8a2a                	mv	s4,a0
ffffffffc020a484:	10400513          	li	a0,260
ffffffffc020a488:	e85a                	sd	s6,16(sp)
ffffffffc020a48a:	e486                	sd	ra,72(sp)
ffffffffc020a48c:	e0a2                	sd	s0,64(sp)
ffffffffc020a48e:	8b2e                	mv	s6,a1
ffffffffc020a490:	b31f70ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc020a494:	0e050963          	beqz	a0,ffffffffc020a586 <sfs_getdirentry+0x108>
ffffffffc020a498:	ec56                	sd	s5,24(sp)
ffffffffc020a49a:	068a3a83          	ld	s5,104(s4)
ffffffffc020a49e:	0e0a8663          	beqz	s5,ffffffffc020a58a <sfs_getdirentry+0x10c>
ffffffffc020a4a2:	0b0aa783          	lw	a5,176(s5)
ffffffffc020a4a6:	0e079263          	bnez	a5,ffffffffc020a58a <sfs_getdirentry+0x10c>
ffffffffc020a4aa:	058a2703          	lw	a4,88(s4)
ffffffffc020a4ae:	6785                	lui	a5,0x1
ffffffffc020a4b0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a4b4:	10f71063          	bne	a4,a5,ffffffffc020a5b4 <sfs_getdirentry+0x136>
ffffffffc020a4b8:	f44e                	sd	s3,40(sp)
ffffffffc020a4ba:	57fd                	li	a5,-1
ffffffffc020a4bc:	008b3983          	ld	s3,8(s6) # 1008 <_binary_bin_swap_img_size-0x6cf8>
ffffffffc020a4c0:	17fe                	slli	a5,a5,0x3f
ffffffffc020a4c2:	0ff78793          	addi	a5,a5,255
ffffffffc020a4c6:	00f9f7b3          	and	a5,s3,a5
ffffffffc020a4ca:	e3d5                	bnez	a5,ffffffffc020a56e <sfs_getdirentry+0xf0>
ffffffffc020a4cc:	000a3783          	ld	a5,0(s4)
ffffffffc020a4d0:	0089d993          	srli	s3,s3,0x8
ffffffffc020a4d4:	2981                	sext.w	s3,s3
ffffffffc020a4d6:	479c                	lw	a5,8(a5)
ffffffffc020a4d8:	0b37e163          	bltu	a5,s3,ffffffffc020a57a <sfs_getdirentry+0xfc>
ffffffffc020a4dc:	f84a                	sd	s2,48(sp)
ffffffffc020a4de:	892a                	mv	s2,a0
ffffffffc020a4e0:	020a0513          	addi	a0,s4,32
ffffffffc020a4e4:	e45e                	sd	s7,8(sp)
ffffffffc020a4e6:	95cfa0ef          	jal	ffffffffc0204642 <down>
ffffffffc020a4ea:	000a3783          	ld	a5,0(s4)
ffffffffc020a4ee:	0087ab83          	lw	s7,8(a5)
ffffffffc020a4f2:	07705c63          	blez	s7,ffffffffc020a56a <sfs_getdirentry+0xec>
ffffffffc020a4f6:	fc26                	sd	s1,56(sp)
ffffffffc020a4f8:	4481                	li	s1,0
ffffffffc020a4fa:	a811                	j	ffffffffc020a50e <sfs_getdirentry+0x90>
ffffffffc020a4fc:	00092783          	lw	a5,0(s2)
ffffffffc020a500:	c781                	beqz	a5,ffffffffc020a508 <sfs_getdirentry+0x8a>
ffffffffc020a502:	02098463          	beqz	s3,ffffffffc020a52a <sfs_getdirentry+0xac>
ffffffffc020a506:	39fd                	addiw	s3,s3,-1
ffffffffc020a508:	2485                	addiw	s1,s1,1
ffffffffc020a50a:	049b8d63          	beq	s7,s1,ffffffffc020a564 <sfs_getdirentry+0xe6>
ffffffffc020a50e:	86ca                	mv	a3,s2
ffffffffc020a510:	8626                	mv	a2,s1
ffffffffc020a512:	85d2                	mv	a1,s4
ffffffffc020a514:	8556                	mv	a0,s5
ffffffffc020a516:	ea9ff0ef          	jal	ffffffffc020a3be <sfs_dirent_read_nolock>
ffffffffc020a51a:	842a                	mv	s0,a0
ffffffffc020a51c:	d165                	beqz	a0,ffffffffc020a4fc <sfs_getdirentry+0x7e>
ffffffffc020a51e:	74e2                	ld	s1,56(sp)
ffffffffc020a520:	020a0513          	addi	a0,s4,32
ffffffffc020a524:	91afa0ef          	jal	ffffffffc020463e <up>
ffffffffc020a528:	a005                	j	ffffffffc020a548 <sfs_getdirentry+0xca>
ffffffffc020a52a:	020a0513          	addi	a0,s4,32
ffffffffc020a52e:	910fa0ef          	jal	ffffffffc020463e <up>
ffffffffc020a532:	855a                	mv	a0,s6
ffffffffc020a534:	00490593          	addi	a1,s2,4
ffffffffc020a538:	4701                	li	a4,0
ffffffffc020a53a:	4685                	li	a3,1
ffffffffc020a53c:	10000613          	li	a2,256
ffffffffc020a540:	fa3fa0ef          	jal	ffffffffc02054e2 <iobuf_move>
ffffffffc020a544:	74e2                	ld	s1,56(sp)
ffffffffc020a546:	842a                	mv	s0,a0
ffffffffc020a548:	854a                	mv	a0,s2
ffffffffc020a54a:	b1df70ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020a54e:	7942                	ld	s2,48(sp)
ffffffffc020a550:	79a2                	ld	s3,40(sp)
ffffffffc020a552:	6ae2                	ld	s5,24(sp)
ffffffffc020a554:	6ba2                	ld	s7,8(sp)
ffffffffc020a556:	60a6                	ld	ra,72(sp)
ffffffffc020a558:	8522                	mv	a0,s0
ffffffffc020a55a:	6406                	ld	s0,64(sp)
ffffffffc020a55c:	7a02                	ld	s4,32(sp)
ffffffffc020a55e:	6b42                	ld	s6,16(sp)
ffffffffc020a560:	6161                	addi	sp,sp,80
ffffffffc020a562:	8082                	ret
ffffffffc020a564:	74e2                	ld	s1,56(sp)
ffffffffc020a566:	5441                	li	s0,-16
ffffffffc020a568:	bf65                	j	ffffffffc020a520 <sfs_getdirentry+0xa2>
ffffffffc020a56a:	5441                	li	s0,-16
ffffffffc020a56c:	bf55                	j	ffffffffc020a520 <sfs_getdirentry+0xa2>
ffffffffc020a56e:	af9f70ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020a572:	5475                	li	s0,-3
ffffffffc020a574:	79a2                	ld	s3,40(sp)
ffffffffc020a576:	6ae2                	ld	s5,24(sp)
ffffffffc020a578:	bff9                	j	ffffffffc020a556 <sfs_getdirentry+0xd8>
ffffffffc020a57a:	aedf70ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020a57e:	5441                	li	s0,-16
ffffffffc020a580:	79a2                	ld	s3,40(sp)
ffffffffc020a582:	6ae2                	ld	s5,24(sp)
ffffffffc020a584:	bfc9                	j	ffffffffc020a556 <sfs_getdirentry+0xd8>
ffffffffc020a586:	5471                	li	s0,-4
ffffffffc020a588:	b7f9                	j	ffffffffc020a556 <sfs_getdirentry+0xd8>
ffffffffc020a58a:	00004697          	auipc	a3,0x4
ffffffffc020a58e:	10668693          	addi	a3,a3,262 # ffffffffc020e690 <etext+0x2e9e>
ffffffffc020a592:	00001617          	auipc	a2,0x1
ffffffffc020a596:	69e60613          	addi	a2,a2,1694 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a59a:	33900593          	li	a1,825
ffffffffc020a59e:	00004517          	auipc	a0,0x4
ffffffffc020a5a2:	2d250513          	addi	a0,a0,722 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a5a6:	fc26                	sd	s1,56(sp)
ffffffffc020a5a8:	f84a                	sd	s2,48(sp)
ffffffffc020a5aa:	f44e                	sd	s3,40(sp)
ffffffffc020a5ac:	e45e                	sd	s7,8(sp)
ffffffffc020a5ae:	e062                	sd	s8,0(sp)
ffffffffc020a5b0:	e9bf50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a5b4:	00004697          	auipc	a3,0x4
ffffffffc020a5b8:	28468693          	addi	a3,a3,644 # ffffffffc020e838 <etext+0x3046>
ffffffffc020a5bc:	00001617          	auipc	a2,0x1
ffffffffc020a5c0:	67460613          	addi	a2,a2,1652 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a5c4:	33a00593          	li	a1,826
ffffffffc020a5c8:	00004517          	auipc	a0,0x4
ffffffffc020a5cc:	2a850513          	addi	a0,a0,680 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a5d0:	fc26                	sd	s1,56(sp)
ffffffffc020a5d2:	f84a                	sd	s2,48(sp)
ffffffffc020a5d4:	f44e                	sd	s3,40(sp)
ffffffffc020a5d6:	e45e                	sd	s7,8(sp)
ffffffffc020a5d8:	e062                	sd	s8,0(sp)
ffffffffc020a5da:	e71f50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020a5de <sfs_truncfile>:
ffffffffc020a5de:	080007b7          	lui	a5,0x8000
ffffffffc020a5e2:	1ab7eb63          	bltu	a5,a1,ffffffffc020a798 <sfs_truncfile+0x1ba>
ffffffffc020a5e6:	7159                	addi	sp,sp,-112
ffffffffc020a5e8:	e0d2                	sd	s4,64(sp)
ffffffffc020a5ea:	06853a03          	ld	s4,104(a0)
ffffffffc020a5ee:	e8ca                	sd	s2,80(sp)
ffffffffc020a5f0:	e4ce                	sd	s3,72(sp)
ffffffffc020a5f2:	f486                	sd	ra,104(sp)
ffffffffc020a5f4:	f0a2                	sd	s0,96(sp)
ffffffffc020a5f6:	fc56                	sd	s5,56(sp)
ffffffffc020a5f8:	892a                	mv	s2,a0
ffffffffc020a5fa:	89ae                	mv	s3,a1
ffffffffc020a5fc:	1a0a0163          	beqz	s4,ffffffffc020a79e <sfs_truncfile+0x1c0>
ffffffffc020a600:	0b0a2783          	lw	a5,176(s4)
ffffffffc020a604:	18079d63          	bnez	a5,ffffffffc020a79e <sfs_truncfile+0x1c0>
ffffffffc020a608:	4d38                	lw	a4,88(a0)
ffffffffc020a60a:	6785                	lui	a5,0x1
ffffffffc020a60c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a610:	6405                	lui	s0,0x1
ffffffffc020a612:	1cf71963          	bne	a4,a5,ffffffffc020a7e4 <sfs_truncfile+0x206>
ffffffffc020a616:	00053a83          	ld	s5,0(a0)
ffffffffc020a61a:	147d                	addi	s0,s0,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc020a61c:	942e                	add	s0,s0,a1
ffffffffc020a61e:	000ae783          	lwu	a5,0(s5)
ffffffffc020a622:	8031                	srli	s0,s0,0xc
ffffffffc020a624:	2401                	sext.w	s0,s0
ffffffffc020a626:	02b79063          	bne	a5,a1,ffffffffc020a646 <sfs_truncfile+0x68>
ffffffffc020a62a:	008aa703          	lw	a4,8(s5)
ffffffffc020a62e:	4781                	li	a5,0
ffffffffc020a630:	1c871c63          	bne	a4,s0,ffffffffc020a808 <sfs_truncfile+0x22a>
ffffffffc020a634:	70a6                	ld	ra,104(sp)
ffffffffc020a636:	7406                	ld	s0,96(sp)
ffffffffc020a638:	6946                	ld	s2,80(sp)
ffffffffc020a63a:	69a6                	ld	s3,72(sp)
ffffffffc020a63c:	6a06                	ld	s4,64(sp)
ffffffffc020a63e:	7ae2                	ld	s5,56(sp)
ffffffffc020a640:	853e                	mv	a0,a5
ffffffffc020a642:	6165                	addi	sp,sp,112
ffffffffc020a644:	8082                	ret
ffffffffc020a646:	02050513          	addi	a0,a0,32
ffffffffc020a64a:	eca6                	sd	s1,88(sp)
ffffffffc020a64c:	ff7f90ef          	jal	ffffffffc0204642 <down>
ffffffffc020a650:	008aa483          	lw	s1,8(s5)
ffffffffc020a654:	0c84e363          	bltu	s1,s0,ffffffffc020a71a <sfs_truncfile+0x13c>
ffffffffc020a658:	0c947e63          	bgeu	s0,s1,ffffffffc020a734 <sfs_truncfile+0x156>
ffffffffc020a65c:	48ad                	li	a7,11
ffffffffc020a65e:	4305                	li	t1,1
ffffffffc020a660:	a895                	j	ffffffffc020a6d4 <sfs_truncfile+0xf6>
ffffffffc020a662:	37cd                	addiw	a5,a5,-13
ffffffffc020a664:	3ff00693          	li	a3,1023
ffffffffc020a668:	04f6ef63          	bltu	a3,a5,ffffffffc020a6c6 <sfs_truncfile+0xe8>
ffffffffc020a66c:	03c82683          	lw	a3,60(a6)
ffffffffc020a670:	cab9                	beqz	a3,ffffffffc020a6c6 <sfs_truncfile+0xe8>
ffffffffc020a672:	004a2603          	lw	a2,4(s4)
ffffffffc020a676:	1ac6fb63          	bgeu	a3,a2,ffffffffc020a82c <sfs_truncfile+0x24e>
ffffffffc020a67a:	038a3503          	ld	a0,56(s4)
ffffffffc020a67e:	85b6                	mv	a1,a3
ffffffffc020a680:	e436                	sd	a3,8(sp)
ffffffffc020a682:	e842                	sd	a6,16(sp)
ffffffffc020a684:	ec3e                	sd	a5,24(sp)
ffffffffc020a686:	badfe0ef          	jal	ffffffffc0209232 <bitmap_test>
ffffffffc020a68a:	66a2                	ld	a3,8(sp)
ffffffffc020a68c:	6842                	ld	a6,16(sp)
ffffffffc020a68e:	67e2                	ld	a5,24(sp)
ffffffffc020a690:	1a051d63          	bnez	a0,ffffffffc020a84a <sfs_truncfile+0x26c>
ffffffffc020a694:	02079613          	slli	a2,a5,0x20
ffffffffc020a698:	01e65713          	srli	a4,a2,0x1e
ffffffffc020a69c:	102c                	addi	a1,sp,40
ffffffffc020a69e:	4611                	li	a2,4
ffffffffc020a6a0:	8552                	mv	a0,s4
ffffffffc020a6a2:	ec42                	sd	a6,24(sp)
ffffffffc020a6a4:	e83a                	sd	a4,16(sp)
ffffffffc020a6a6:	e436                	sd	a3,8(sp)
ffffffffc020a6a8:	d602                	sw	zero,44(sp)
ffffffffc020a6aa:	151000ef          	jal	ffffffffc020affa <sfs_rbuf>
ffffffffc020a6ae:	87aa                	mv	a5,a0
ffffffffc020a6b0:	e941                	bnez	a0,ffffffffc020a740 <sfs_truncfile+0x162>
ffffffffc020a6b2:	57a2                	lw	a5,40(sp)
ffffffffc020a6b4:	66a2                	ld	a3,8(sp)
ffffffffc020a6b6:	6742                	ld	a4,16(sp)
ffffffffc020a6b8:	6862                	ld	a6,24(sp)
ffffffffc020a6ba:	48ad                	li	a7,11
ffffffffc020a6bc:	4305                	li	t1,1
ffffffffc020a6be:	ebd5                	bnez	a5,ffffffffc020a772 <sfs_truncfile+0x194>
ffffffffc020a6c0:	00882703          	lw	a4,8(a6)
ffffffffc020a6c4:	377d                	addiw	a4,a4,-1
ffffffffc020a6c6:	00e82423          	sw	a4,8(a6)
ffffffffc020a6ca:	00693823          	sd	t1,16(s2)
ffffffffc020a6ce:	34fd                	addiw	s1,s1,-1
ffffffffc020a6d0:	04940e63          	beq	s0,s1,ffffffffc020a72c <sfs_truncfile+0x14e>
ffffffffc020a6d4:	00093803          	ld	a6,0(s2)
ffffffffc020a6d8:	00882783          	lw	a5,8(a6)
ffffffffc020a6dc:	0e078363          	beqz	a5,ffffffffc020a7c2 <sfs_truncfile+0x1e4>
ffffffffc020a6e0:	fff7871b          	addiw	a4,a5,-1
ffffffffc020a6e4:	f6e8efe3          	bltu	a7,a4,ffffffffc020a662 <sfs_truncfile+0x84>
ffffffffc020a6e8:	02071693          	slli	a3,a4,0x20
ffffffffc020a6ec:	01e6d793          	srli	a5,a3,0x1e
ffffffffc020a6f0:	97c2                	add	a5,a5,a6
ffffffffc020a6f2:	47cc                	lw	a1,12(a5)
ffffffffc020a6f4:	d9e9                	beqz	a1,ffffffffc020a6c6 <sfs_truncfile+0xe8>
ffffffffc020a6f6:	8552                	mv	a0,s4
ffffffffc020a6f8:	e83e                	sd	a5,16(sp)
ffffffffc020a6fa:	e442                	sd	a6,8(sp)
ffffffffc020a6fc:	c66ff0ef          	jal	ffffffffc0209b62 <sfs_block_free>
ffffffffc020a700:	67c2                	ld	a5,16(sp)
ffffffffc020a702:	6822                	ld	a6,8(sp)
ffffffffc020a704:	48ad                	li	a7,11
ffffffffc020a706:	0007a623          	sw	zero,12(a5)
ffffffffc020a70a:	00882703          	lw	a4,8(a6)
ffffffffc020a70e:	4305                	li	t1,1
ffffffffc020a710:	377d                	addiw	a4,a4,-1
ffffffffc020a712:	bf55                	j	ffffffffc020a6c6 <sfs_truncfile+0xe8>
ffffffffc020a714:	2485                	addiw	s1,s1,1
ffffffffc020a716:	00940b63          	beq	s0,s1,ffffffffc020a72c <sfs_truncfile+0x14e>
ffffffffc020a71a:	4681                	li	a3,0
ffffffffc020a71c:	8626                	mv	a2,s1
ffffffffc020a71e:	85ca                	mv	a1,s2
ffffffffc020a720:	8552                	mv	a0,s4
ffffffffc020a722:	efcff0ef          	jal	ffffffffc0209e1e <sfs_bmap_load_nolock>
ffffffffc020a726:	87aa                	mv	a5,a0
ffffffffc020a728:	d575                	beqz	a0,ffffffffc020a714 <sfs_truncfile+0x136>
ffffffffc020a72a:	a819                	j	ffffffffc020a740 <sfs_truncfile+0x162>
ffffffffc020a72c:	008aa783          	lw	a5,8(s5)
ffffffffc020a730:	02879063          	bne	a5,s0,ffffffffc020a750 <sfs_truncfile+0x172>
ffffffffc020a734:	4785                	li	a5,1
ffffffffc020a736:	013aa023          	sw	s3,0(s5)
ffffffffc020a73a:	00f93823          	sd	a5,16(s2)
ffffffffc020a73e:	4781                	li	a5,0
ffffffffc020a740:	02090513          	addi	a0,s2,32
ffffffffc020a744:	e43e                	sd	a5,8(sp)
ffffffffc020a746:	ef9f90ef          	jal	ffffffffc020463e <up>
ffffffffc020a74a:	67a2                	ld	a5,8(sp)
ffffffffc020a74c:	64e6                	ld	s1,88(sp)
ffffffffc020a74e:	b5dd                	j	ffffffffc020a634 <sfs_truncfile+0x56>
ffffffffc020a750:	00004697          	auipc	a3,0x4
ffffffffc020a754:	36868693          	addi	a3,a3,872 # ffffffffc020eab8 <etext+0x32c6>
ffffffffc020a758:	00001617          	auipc	a2,0x1
ffffffffc020a75c:	4d860613          	addi	a2,a2,1240 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a760:	3c900593          	li	a1,969
ffffffffc020a764:	00004517          	auipc	a0,0x4
ffffffffc020a768:	10c50513          	addi	a0,a0,268 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a76c:	f85a                	sd	s6,48(sp)
ffffffffc020a76e:	cddf50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a772:	4611                	li	a2,4
ffffffffc020a774:	106c                	addi	a1,sp,44
ffffffffc020a776:	8552                	mv	a0,s4
ffffffffc020a778:	e442                	sd	a6,8(sp)
ffffffffc020a77a:	101000ef          	jal	ffffffffc020b07a <sfs_wbuf>
ffffffffc020a77e:	87aa                	mv	a5,a0
ffffffffc020a780:	f161                	bnez	a0,ffffffffc020a740 <sfs_truncfile+0x162>
ffffffffc020a782:	55a2                	lw	a1,40(sp)
ffffffffc020a784:	8552                	mv	a0,s4
ffffffffc020a786:	bdcff0ef          	jal	ffffffffc0209b62 <sfs_block_free>
ffffffffc020a78a:	6822                	ld	a6,8(sp)
ffffffffc020a78c:	4305                	li	t1,1
ffffffffc020a78e:	48ad                	li	a7,11
ffffffffc020a790:	00882703          	lw	a4,8(a6)
ffffffffc020a794:	377d                	addiw	a4,a4,-1
ffffffffc020a796:	bf05                	j	ffffffffc020a6c6 <sfs_truncfile+0xe8>
ffffffffc020a798:	57f5                	li	a5,-3
ffffffffc020a79a:	853e                	mv	a0,a5
ffffffffc020a79c:	8082                	ret
ffffffffc020a79e:	00004697          	auipc	a3,0x4
ffffffffc020a7a2:	ef268693          	addi	a3,a3,-270 # ffffffffc020e690 <etext+0x2e9e>
ffffffffc020a7a6:	00001617          	auipc	a2,0x1
ffffffffc020a7aa:	48a60613          	addi	a2,a2,1162 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a7ae:	3a800593          	li	a1,936
ffffffffc020a7b2:	00004517          	auipc	a0,0x4
ffffffffc020a7b6:	0be50513          	addi	a0,a0,190 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a7ba:	eca6                	sd	s1,88(sp)
ffffffffc020a7bc:	f85a                	sd	s6,48(sp)
ffffffffc020a7be:	c8df50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a7c2:	00004697          	auipc	a3,0x4
ffffffffc020a7c6:	2a668693          	addi	a3,a3,678 # ffffffffc020ea68 <etext+0x3276>
ffffffffc020a7ca:	00001617          	auipc	a2,0x1
ffffffffc020a7ce:	46660613          	addi	a2,a2,1126 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a7d2:	17c00593          	li	a1,380
ffffffffc020a7d6:	00004517          	auipc	a0,0x4
ffffffffc020a7da:	09a50513          	addi	a0,a0,154 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a7de:	f85a                	sd	s6,48(sp)
ffffffffc020a7e0:	c6bf50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a7e4:	00004697          	auipc	a3,0x4
ffffffffc020a7e8:	05468693          	addi	a3,a3,84 # ffffffffc020e838 <etext+0x3046>
ffffffffc020a7ec:	00001617          	auipc	a2,0x1
ffffffffc020a7f0:	44460613          	addi	a2,a2,1092 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a7f4:	3a900593          	li	a1,937
ffffffffc020a7f8:	00004517          	auipc	a0,0x4
ffffffffc020a7fc:	07850513          	addi	a0,a0,120 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a800:	eca6                	sd	s1,88(sp)
ffffffffc020a802:	f85a                	sd	s6,48(sp)
ffffffffc020a804:	c47f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a808:	00004697          	auipc	a3,0x4
ffffffffc020a80c:	24868693          	addi	a3,a3,584 # ffffffffc020ea50 <etext+0x325e>
ffffffffc020a810:	00001617          	auipc	a2,0x1
ffffffffc020a814:	42060613          	addi	a2,a2,1056 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a818:	3b000593          	li	a1,944
ffffffffc020a81c:	00004517          	auipc	a0,0x4
ffffffffc020a820:	05450513          	addi	a0,a0,84 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a824:	eca6                	sd	s1,88(sp)
ffffffffc020a826:	f85a                	sd	s6,48(sp)
ffffffffc020a828:	c23f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a82c:	8736                	mv	a4,a3
ffffffffc020a82e:	05300593          	li	a1,83
ffffffffc020a832:	86b2                	mv	a3,a2
ffffffffc020a834:	00004517          	auipc	a0,0x4
ffffffffc020a838:	03c50513          	addi	a0,a0,60 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a83c:	00004617          	auipc	a2,0x4
ffffffffc020a840:	06460613          	addi	a2,a2,100 # ffffffffc020e8a0 <etext+0x30ae>
ffffffffc020a844:	f85a                	sd	s6,48(sp)
ffffffffc020a846:	c05f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020a84a:	00004697          	auipc	a3,0x4
ffffffffc020a84e:	23668693          	addi	a3,a3,566 # ffffffffc020ea80 <etext+0x328e>
ffffffffc020a852:	00001617          	auipc	a2,0x1
ffffffffc020a856:	3de60613          	addi	a2,a2,990 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020a85a:	12b00593          	li	a1,299
ffffffffc020a85e:	00004517          	auipc	a0,0x4
ffffffffc020a862:	01250513          	addi	a0,a0,18 # ffffffffc020e870 <etext+0x307e>
ffffffffc020a866:	f85a                	sd	s6,48(sp)
ffffffffc020a868:	be3f50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020a86c <sfs_load_inode>:
ffffffffc020a86c:	7139                	addi	sp,sp,-64
ffffffffc020a86e:	fc06                	sd	ra,56(sp)
ffffffffc020a870:	f822                	sd	s0,48(sp)
ffffffffc020a872:	f426                	sd	s1,40(sp)
ffffffffc020a874:	f04a                	sd	s2,32(sp)
ffffffffc020a876:	84b2                	mv	s1,a2
ffffffffc020a878:	892a                	mv	s2,a0
ffffffffc020a87a:	ec4e                	sd	s3,24(sp)
ffffffffc020a87c:	89ae                	mv	s3,a1
ffffffffc020a87e:	1b1000ef          	jal	ffffffffc020b22e <lock_sfs_fs>
ffffffffc020a882:	8526                	mv	a0,s1
ffffffffc020a884:	45a9                	li	a1,10
ffffffffc020a886:	0a893403          	ld	s0,168(s2)
ffffffffc020a88a:	1c5000ef          	jal	ffffffffc020b24e <hash32>
ffffffffc020a88e:	02051793          	slli	a5,a0,0x20
ffffffffc020a892:	01c7d513          	srli	a0,a5,0x1c
ffffffffc020a896:	00a406b3          	add	a3,s0,a0
ffffffffc020a89a:	87b6                	mv	a5,a3
ffffffffc020a89c:	a029                	j	ffffffffc020a8a6 <sfs_load_inode+0x3a>
ffffffffc020a89e:	fc07a703          	lw	a4,-64(a5)
ffffffffc020a8a2:	10970563          	beq	a4,s1,ffffffffc020a9ac <sfs_load_inode+0x140>
ffffffffc020a8a6:	679c                	ld	a5,8(a5)
ffffffffc020a8a8:	fef69be3          	bne	a3,a5,ffffffffc020a89e <sfs_load_inode+0x32>
ffffffffc020a8ac:	04000513          	li	a0,64
ffffffffc020a8b0:	f10f70ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc020a8b4:	87aa                	mv	a5,a0
ffffffffc020a8b6:	10050b63          	beqz	a0,ffffffffc020a9cc <sfs_load_inode+0x160>
ffffffffc020a8ba:	14048f63          	beqz	s1,ffffffffc020aa18 <sfs_load_inode+0x1ac>
ffffffffc020a8be:	00492703          	lw	a4,4(s2)
ffffffffc020a8c2:	14e4fb63          	bgeu	s1,a4,ffffffffc020aa18 <sfs_load_inode+0x1ac>
ffffffffc020a8c6:	03893503          	ld	a0,56(s2)
ffffffffc020a8ca:	85a6                	mv	a1,s1
ffffffffc020a8cc:	e43e                	sd	a5,8(sp)
ffffffffc020a8ce:	965fe0ef          	jal	ffffffffc0209232 <bitmap_test>
ffffffffc020a8d2:	16051263          	bnez	a0,ffffffffc020aa36 <sfs_load_inode+0x1ca>
ffffffffc020a8d6:	65a2                	ld	a1,8(sp)
ffffffffc020a8d8:	4701                	li	a4,0
ffffffffc020a8da:	86a6                	mv	a3,s1
ffffffffc020a8dc:	04000613          	li	a2,64
ffffffffc020a8e0:	854a                	mv	a0,s2
ffffffffc020a8e2:	718000ef          	jal	ffffffffc020affa <sfs_rbuf>
ffffffffc020a8e6:	67a2                	ld	a5,8(sp)
ffffffffc020a8e8:	842a                	mv	s0,a0
ffffffffc020a8ea:	0e051e63          	bnez	a0,ffffffffc020a9e6 <sfs_load_inode+0x17a>
ffffffffc020a8ee:	0067d703          	lhu	a4,6(a5)
ffffffffc020a8f2:	10070363          	beqz	a4,ffffffffc020a9f8 <sfs_load_inode+0x18c>
ffffffffc020a8f6:	6505                	lui	a0,0x1
ffffffffc020a8f8:	23550513          	addi	a0,a0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a8fc:	e43e                	sd	a5,8(sp)
ffffffffc020a8fe:	8aafd0ef          	jal	ffffffffc02079a8 <__alloc_inode>
ffffffffc020a902:	67a2                	ld	a5,8(sp)
ffffffffc020a904:	842a                	mv	s0,a0
ffffffffc020a906:	cd79                	beqz	a0,ffffffffc020a9e4 <sfs_load_inode+0x178>
ffffffffc020a908:	0047d683          	lhu	a3,4(a5)
ffffffffc020a90c:	4705                	li	a4,1
ffffffffc020a90e:	0ee68063          	beq	a3,a4,ffffffffc020a9ee <sfs_load_inode+0x182>
ffffffffc020a912:	4709                	li	a4,2
ffffffffc020a914:	00005597          	auipc	a1,0x5
ffffffffc020a918:	f1c58593          	addi	a1,a1,-228 # ffffffffc020f830 <sfs_node_dirops>
ffffffffc020a91c:	16e69d63          	bne	a3,a4,ffffffffc020aa96 <sfs_load_inode+0x22a>
ffffffffc020a920:	864a                	mv	a2,s2
ffffffffc020a922:	8522                	mv	a0,s0
ffffffffc020a924:	e43e                	sd	a5,8(sp)
ffffffffc020a926:	89efd0ef          	jal	ffffffffc02079c4 <inode_init>
ffffffffc020a92a:	4c34                	lw	a3,88(s0)
ffffffffc020a92c:	6705                	lui	a4,0x1
ffffffffc020a92e:	23570713          	addi	a4,a4,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a932:	67a2                	ld	a5,8(sp)
ffffffffc020a934:	14e69163          	bne	a3,a4,ffffffffc020aa76 <sfs_load_inode+0x20a>
ffffffffc020a938:	4585                	li	a1,1
ffffffffc020a93a:	e01c                	sd	a5,0(s0)
ffffffffc020a93c:	c404                	sw	s1,8(s0)
ffffffffc020a93e:	00043823          	sd	zero,16(s0)
ffffffffc020a942:	cc0c                	sw	a1,24(s0)
ffffffffc020a944:	02040513          	addi	a0,s0,32
ffffffffc020a948:	e436                	sd	a3,8(sp)
ffffffffc020a94a:	ceff90ef          	jal	ffffffffc0204638 <sem_init>
ffffffffc020a94e:	4c3c                	lw	a5,88(s0)
ffffffffc020a950:	66a2                	ld	a3,8(sp)
ffffffffc020a952:	10d79263          	bne	a5,a3,ffffffffc020aa56 <sfs_load_inode+0x1ea>
ffffffffc020a956:	0a093703          	ld	a4,160(s2)
ffffffffc020a95a:	03840793          	addi	a5,s0,56
ffffffffc020a95e:	4408                	lw	a0,8(s0)
ffffffffc020a960:	e31c                	sd	a5,0(a4)
ffffffffc020a962:	0af93023          	sd	a5,160(s2)
ffffffffc020a966:	09890793          	addi	a5,s2,152
ffffffffc020a96a:	e038                	sd	a4,64(s0)
ffffffffc020a96c:	fc1c                	sd	a5,56(s0)
ffffffffc020a96e:	45a9                	li	a1,10
ffffffffc020a970:	0a893483          	ld	s1,168(s2)
ffffffffc020a974:	0db000ef          	jal	ffffffffc020b24e <hash32>
ffffffffc020a978:	02051713          	slli	a4,a0,0x20
ffffffffc020a97c:	01c75793          	srli	a5,a4,0x1c
ffffffffc020a980:	97a6                	add	a5,a5,s1
ffffffffc020a982:	6798                	ld	a4,8(a5)
ffffffffc020a984:	04840693          	addi	a3,s0,72
ffffffffc020a988:	e314                	sd	a3,0(a4)
ffffffffc020a98a:	e794                	sd	a3,8(a5)
ffffffffc020a98c:	e838                	sd	a4,80(s0)
ffffffffc020a98e:	e43c                	sd	a5,72(s0)
ffffffffc020a990:	854a                	mv	a0,s2
ffffffffc020a992:	0ad000ef          	jal	ffffffffc020b23e <unlock_sfs_fs>
ffffffffc020a996:	0089b023          	sd	s0,0(s3)
ffffffffc020a99a:	4401                	li	s0,0
ffffffffc020a99c:	70e2                	ld	ra,56(sp)
ffffffffc020a99e:	8522                	mv	a0,s0
ffffffffc020a9a0:	7442                	ld	s0,48(sp)
ffffffffc020a9a2:	74a2                	ld	s1,40(sp)
ffffffffc020a9a4:	7902                	ld	s2,32(sp)
ffffffffc020a9a6:	69e2                	ld	s3,24(sp)
ffffffffc020a9a8:	6121                	addi	sp,sp,64
ffffffffc020a9aa:	8082                	ret
ffffffffc020a9ac:	fb878413          	addi	s0,a5,-72
ffffffffc020a9b0:	8522                	mv	a0,s0
ffffffffc020a9b2:	e43e                	sd	a5,8(sp)
ffffffffc020a9b4:	872fd0ef          	jal	ffffffffc0207a26 <inode_ref_inc>
ffffffffc020a9b8:	4705                	li	a4,1
ffffffffc020a9ba:	67a2                	ld	a5,8(sp)
ffffffffc020a9bc:	fce51ae3          	bne	a0,a4,ffffffffc020a990 <sfs_load_inode+0x124>
ffffffffc020a9c0:	fd07a703          	lw	a4,-48(a5)
ffffffffc020a9c4:	2705                	addiw	a4,a4,1
ffffffffc020a9c6:	fce7a823          	sw	a4,-48(a5)
ffffffffc020a9ca:	b7d9                	j	ffffffffc020a990 <sfs_load_inode+0x124>
ffffffffc020a9cc:	5471                	li	s0,-4
ffffffffc020a9ce:	854a                	mv	a0,s2
ffffffffc020a9d0:	06f000ef          	jal	ffffffffc020b23e <unlock_sfs_fs>
ffffffffc020a9d4:	70e2                	ld	ra,56(sp)
ffffffffc020a9d6:	8522                	mv	a0,s0
ffffffffc020a9d8:	7442                	ld	s0,48(sp)
ffffffffc020a9da:	74a2                	ld	s1,40(sp)
ffffffffc020a9dc:	7902                	ld	s2,32(sp)
ffffffffc020a9de:	69e2                	ld	s3,24(sp)
ffffffffc020a9e0:	6121                	addi	sp,sp,64
ffffffffc020a9e2:	8082                	ret
ffffffffc020a9e4:	5471                	li	s0,-4
ffffffffc020a9e6:	853e                	mv	a0,a5
ffffffffc020a9e8:	e7ef70ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020a9ec:	b7cd                	j	ffffffffc020a9ce <sfs_load_inode+0x162>
ffffffffc020a9ee:	00005597          	auipc	a1,0x5
ffffffffc020a9f2:	dc258593          	addi	a1,a1,-574 # ffffffffc020f7b0 <sfs_node_fileops>
ffffffffc020a9f6:	b72d                	j	ffffffffc020a920 <sfs_load_inode+0xb4>
ffffffffc020a9f8:	00004697          	auipc	a3,0x4
ffffffffc020a9fc:	0d868693          	addi	a3,a3,216 # ffffffffc020ead0 <etext+0x32de>
ffffffffc020aa00:	00001617          	auipc	a2,0x1
ffffffffc020aa04:	23060613          	addi	a2,a2,560 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020aa08:	0ad00593          	li	a1,173
ffffffffc020aa0c:	00004517          	auipc	a0,0x4
ffffffffc020aa10:	e6450513          	addi	a0,a0,-412 # ffffffffc020e870 <etext+0x307e>
ffffffffc020aa14:	a37f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020aa18:	00492683          	lw	a3,4(s2)
ffffffffc020aa1c:	8726                	mv	a4,s1
ffffffffc020aa1e:	00004617          	auipc	a2,0x4
ffffffffc020aa22:	e8260613          	addi	a2,a2,-382 # ffffffffc020e8a0 <etext+0x30ae>
ffffffffc020aa26:	05300593          	li	a1,83
ffffffffc020aa2a:	00004517          	auipc	a0,0x4
ffffffffc020aa2e:	e4650513          	addi	a0,a0,-442 # ffffffffc020e870 <etext+0x307e>
ffffffffc020aa32:	a19f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020aa36:	00004697          	auipc	a3,0x4
ffffffffc020aa3a:	ea268693          	addi	a3,a3,-350 # ffffffffc020e8d8 <etext+0x30e6>
ffffffffc020aa3e:	00001617          	auipc	a2,0x1
ffffffffc020aa42:	1f260613          	addi	a2,a2,498 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020aa46:	0a800593          	li	a1,168
ffffffffc020aa4a:	00004517          	auipc	a0,0x4
ffffffffc020aa4e:	e2650513          	addi	a0,a0,-474 # ffffffffc020e870 <etext+0x307e>
ffffffffc020aa52:	9f9f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020aa56:	00004697          	auipc	a3,0x4
ffffffffc020aa5a:	de268693          	addi	a3,a3,-542 # ffffffffc020e838 <etext+0x3046>
ffffffffc020aa5e:	00001617          	auipc	a2,0x1
ffffffffc020aa62:	1d260613          	addi	a2,a2,466 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020aa66:	0b100593          	li	a1,177
ffffffffc020aa6a:	00004517          	auipc	a0,0x4
ffffffffc020aa6e:	e0650513          	addi	a0,a0,-506 # ffffffffc020e870 <etext+0x307e>
ffffffffc020aa72:	9d9f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020aa76:	00004697          	auipc	a3,0x4
ffffffffc020aa7a:	dc268693          	addi	a3,a3,-574 # ffffffffc020e838 <etext+0x3046>
ffffffffc020aa7e:	00001617          	auipc	a2,0x1
ffffffffc020aa82:	1b260613          	addi	a2,a2,434 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020aa86:	07700593          	li	a1,119
ffffffffc020aa8a:	00004517          	auipc	a0,0x4
ffffffffc020aa8e:	de650513          	addi	a0,a0,-538 # ffffffffc020e870 <etext+0x307e>
ffffffffc020aa92:	9b9f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020aa96:	00004617          	auipc	a2,0x4
ffffffffc020aa9a:	df260613          	addi	a2,a2,-526 # ffffffffc020e888 <etext+0x3096>
ffffffffc020aa9e:	02e00593          	li	a1,46
ffffffffc020aaa2:	00004517          	auipc	a0,0x4
ffffffffc020aaa6:	dce50513          	addi	a0,a0,-562 # ffffffffc020e870 <etext+0x307e>
ffffffffc020aaaa:	9a1f50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020aaae <sfs_lookup_once.constprop.0>:
ffffffffc020aaae:	711d                	addi	sp,sp,-96
ffffffffc020aab0:	f852                	sd	s4,48(sp)
ffffffffc020aab2:	8a2a                	mv	s4,a0
ffffffffc020aab4:	02058513          	addi	a0,a1,32
ffffffffc020aab8:	ec86                	sd	ra,88(sp)
ffffffffc020aaba:	e0ca                	sd	s2,64(sp)
ffffffffc020aabc:	f456                	sd	s5,40(sp)
ffffffffc020aabe:	e862                	sd	s8,16(sp)
ffffffffc020aac0:	8ab2                	mv	s5,a2
ffffffffc020aac2:	892e                	mv	s2,a1
ffffffffc020aac4:	8c36                	mv	s8,a3
ffffffffc020aac6:	b7df90ef          	jal	ffffffffc0204642 <down>
ffffffffc020aaca:	8556                	mv	a0,s5
ffffffffc020aacc:	40b000ef          	jal	ffffffffc020b6d6 <strlen>
ffffffffc020aad0:	0ff00793          	li	a5,255
ffffffffc020aad4:	0aa7e963          	bltu	a5,a0,ffffffffc020ab86 <sfs_lookup_once.constprop.0+0xd8>
ffffffffc020aad8:	10400513          	li	a0,260
ffffffffc020aadc:	e4a6                	sd	s1,72(sp)
ffffffffc020aade:	ce2f70ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc020aae2:	84aa                	mv	s1,a0
ffffffffc020aae4:	c959                	beqz	a0,ffffffffc020ab7a <sfs_lookup_once.constprop.0+0xcc>
ffffffffc020aae6:	00093783          	ld	a5,0(s2)
ffffffffc020aaea:	fc4e                	sd	s3,56(sp)
ffffffffc020aaec:	0087a983          	lw	s3,8(a5)
ffffffffc020aaf0:	05305d63          	blez	s3,ffffffffc020ab4a <sfs_lookup_once.constprop.0+0x9c>
ffffffffc020aaf4:	e8a2                	sd	s0,80(sp)
ffffffffc020aaf6:	4401                	li	s0,0
ffffffffc020aaf8:	a821                	j	ffffffffc020ab10 <sfs_lookup_once.constprop.0+0x62>
ffffffffc020aafa:	409c                	lw	a5,0(s1)
ffffffffc020aafc:	c799                	beqz	a5,ffffffffc020ab0a <sfs_lookup_once.constprop.0+0x5c>
ffffffffc020aafe:	00448593          	addi	a1,s1,4
ffffffffc020ab02:	8556                	mv	a0,s5
ffffffffc020ab04:	419000ef          	jal	ffffffffc020b71c <strcmp>
ffffffffc020ab08:	c139                	beqz	a0,ffffffffc020ab4e <sfs_lookup_once.constprop.0+0xa0>
ffffffffc020ab0a:	2405                	addiw	s0,s0,1
ffffffffc020ab0c:	02898e63          	beq	s3,s0,ffffffffc020ab48 <sfs_lookup_once.constprop.0+0x9a>
ffffffffc020ab10:	86a6                	mv	a3,s1
ffffffffc020ab12:	8622                	mv	a2,s0
ffffffffc020ab14:	85ca                	mv	a1,s2
ffffffffc020ab16:	8552                	mv	a0,s4
ffffffffc020ab18:	8a7ff0ef          	jal	ffffffffc020a3be <sfs_dirent_read_nolock>
ffffffffc020ab1c:	87aa                	mv	a5,a0
ffffffffc020ab1e:	dd71                	beqz	a0,ffffffffc020aafa <sfs_lookup_once.constprop.0+0x4c>
ffffffffc020ab20:	6446                	ld	s0,80(sp)
ffffffffc020ab22:	8526                	mv	a0,s1
ffffffffc020ab24:	e43e                	sd	a5,8(sp)
ffffffffc020ab26:	d40f70ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020ab2a:	02090513          	addi	a0,s2,32
ffffffffc020ab2e:	b11f90ef          	jal	ffffffffc020463e <up>
ffffffffc020ab32:	67a2                	ld	a5,8(sp)
ffffffffc020ab34:	79e2                	ld	s3,56(sp)
ffffffffc020ab36:	60e6                	ld	ra,88(sp)
ffffffffc020ab38:	64a6                	ld	s1,72(sp)
ffffffffc020ab3a:	6906                	ld	s2,64(sp)
ffffffffc020ab3c:	7a42                	ld	s4,48(sp)
ffffffffc020ab3e:	7aa2                	ld	s5,40(sp)
ffffffffc020ab40:	6c42                	ld	s8,16(sp)
ffffffffc020ab42:	853e                	mv	a0,a5
ffffffffc020ab44:	6125                	addi	sp,sp,96
ffffffffc020ab46:	8082                	ret
ffffffffc020ab48:	6446                	ld	s0,80(sp)
ffffffffc020ab4a:	57c1                	li	a5,-16
ffffffffc020ab4c:	bfd9                	j	ffffffffc020ab22 <sfs_lookup_once.constprop.0+0x74>
ffffffffc020ab4e:	8526                	mv	a0,s1
ffffffffc020ab50:	4080                	lw	s0,0(s1)
ffffffffc020ab52:	d14f70ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020ab56:	02090513          	addi	a0,s2,32
ffffffffc020ab5a:	ae5f90ef          	jal	ffffffffc020463e <up>
ffffffffc020ab5e:	8622                	mv	a2,s0
ffffffffc020ab60:	6446                	ld	s0,80(sp)
ffffffffc020ab62:	64a6                	ld	s1,72(sp)
ffffffffc020ab64:	79e2                	ld	s3,56(sp)
ffffffffc020ab66:	60e6                	ld	ra,88(sp)
ffffffffc020ab68:	6906                	ld	s2,64(sp)
ffffffffc020ab6a:	7aa2                	ld	s5,40(sp)
ffffffffc020ab6c:	85e2                	mv	a1,s8
ffffffffc020ab6e:	8552                	mv	a0,s4
ffffffffc020ab70:	6c42                	ld	s8,16(sp)
ffffffffc020ab72:	7a42                	ld	s4,48(sp)
ffffffffc020ab74:	6125                	addi	sp,sp,96
ffffffffc020ab76:	cf7ff06f          	j	ffffffffc020a86c <sfs_load_inode>
ffffffffc020ab7a:	02090513          	addi	a0,s2,32
ffffffffc020ab7e:	ac1f90ef          	jal	ffffffffc020463e <up>
ffffffffc020ab82:	57f1                	li	a5,-4
ffffffffc020ab84:	bf4d                	j	ffffffffc020ab36 <sfs_lookup_once.constprop.0+0x88>
ffffffffc020ab86:	00004697          	auipc	a3,0x4
ffffffffc020ab8a:	f6268693          	addi	a3,a3,-158 # ffffffffc020eae8 <etext+0x32f6>
ffffffffc020ab8e:	00001617          	auipc	a2,0x1
ffffffffc020ab92:	0a260613          	addi	a2,a2,162 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020ab96:	1bb00593          	li	a1,443
ffffffffc020ab9a:	00004517          	auipc	a0,0x4
ffffffffc020ab9e:	cd650513          	addi	a0,a0,-810 # ffffffffc020e870 <etext+0x307e>
ffffffffc020aba2:	e8a2                	sd	s0,80(sp)
ffffffffc020aba4:	e4a6                	sd	s1,72(sp)
ffffffffc020aba6:	fc4e                	sd	s3,56(sp)
ffffffffc020aba8:	f05a                	sd	s6,32(sp)
ffffffffc020abaa:	ec5e                	sd	s7,24(sp)
ffffffffc020abac:	89ff50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020abb0 <sfs_namefile>:
ffffffffc020abb0:	6d9c                	ld	a5,24(a1)
ffffffffc020abb2:	7175                	addi	sp,sp,-144
ffffffffc020abb4:	f86a                	sd	s10,48(sp)
ffffffffc020abb6:	e506                	sd	ra,136(sp)
ffffffffc020abb8:	f46e                	sd	s11,40(sp)
ffffffffc020abba:	4d09                	li	s10,2
ffffffffc020abbc:	1afd7763          	bgeu	s10,a5,ffffffffc020ad6a <sfs_namefile+0x1ba>
ffffffffc020abc0:	f4ce                	sd	s3,104(sp)
ffffffffc020abc2:	89aa                	mv	s3,a0
ffffffffc020abc4:	10400513          	li	a0,260
ffffffffc020abc8:	fca6                	sd	s1,120(sp)
ffffffffc020abca:	e42e                	sd	a1,8(sp)
ffffffffc020abcc:	bf4f70ef          	jal	ffffffffc0201fc0 <kmalloc>
ffffffffc020abd0:	84aa                	mv	s1,a0
ffffffffc020abd2:	18050a63          	beqz	a0,ffffffffc020ad66 <sfs_namefile+0x1b6>
ffffffffc020abd6:	f0d2                	sd	s4,96(sp)
ffffffffc020abd8:	0689ba03          	ld	s4,104(s3)
ffffffffc020abdc:	1e0a0c63          	beqz	s4,ffffffffc020add4 <sfs_namefile+0x224>
ffffffffc020abe0:	0b0a2783          	lw	a5,176(s4)
ffffffffc020abe4:	1e079863          	bnez	a5,ffffffffc020add4 <sfs_namefile+0x224>
ffffffffc020abe8:	0589a703          	lw	a4,88(s3)
ffffffffc020abec:	6785                	lui	a5,0x1
ffffffffc020abee:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020abf2:	e03a                	sd	a4,0(sp)
ffffffffc020abf4:	e122                	sd	s0,128(sp)
ffffffffc020abf6:	f8ca                	sd	s2,112(sp)
ffffffffc020abf8:	ecd6                	sd	s5,88(sp)
ffffffffc020abfa:	e8da                	sd	s6,80(sp)
ffffffffc020abfc:	e4de                	sd	s7,72(sp)
ffffffffc020abfe:	e0e2                	sd	s8,64(sp)
ffffffffc020ac00:	1af71963          	bne	a4,a5,ffffffffc020adb2 <sfs_namefile+0x202>
ffffffffc020ac04:	6722                	ld	a4,8(sp)
ffffffffc020ac06:	854e                	mv	a0,s3
ffffffffc020ac08:	8b4e                	mv	s6,s3
ffffffffc020ac0a:	6f1c                	ld	a5,24(a4)
ffffffffc020ac0c:	00073a83          	ld	s5,0(a4)
ffffffffc020ac10:	ffe78c13          	addi	s8,a5,-2
ffffffffc020ac14:	9abe                	add	s5,s5,a5
ffffffffc020ac16:	e11fc0ef          	jal	ffffffffc0207a26 <inode_ref_inc>
ffffffffc020ac1a:	0834                	addi	a3,sp,24
ffffffffc020ac1c:	00004617          	auipc	a2,0x4
ffffffffc020ac20:	ef460613          	addi	a2,a2,-268 # ffffffffc020eb10 <etext+0x331e>
ffffffffc020ac24:	85da                	mv	a1,s6
ffffffffc020ac26:	8552                	mv	a0,s4
ffffffffc020ac28:	e87ff0ef          	jal	ffffffffc020aaae <sfs_lookup_once.constprop.0>
ffffffffc020ac2c:	8daa                	mv	s11,a0
ffffffffc020ac2e:	e94d                	bnez	a0,ffffffffc020ace0 <sfs_namefile+0x130>
ffffffffc020ac30:	854e                	mv	a0,s3
ffffffffc020ac32:	008b2903          	lw	s2,8(s6)
ffffffffc020ac36:	ebffc0ef          	jal	ffffffffc0207af4 <inode_ref_dec>
ffffffffc020ac3a:	6462                	ld	s0,24(sp)
ffffffffc020ac3c:	0f340563          	beq	s0,s3,ffffffffc020ad26 <sfs_namefile+0x176>
ffffffffc020ac40:	14040863          	beqz	s0,ffffffffc020ad90 <sfs_namefile+0x1e0>
ffffffffc020ac44:	4c38                	lw	a4,88(s0)
ffffffffc020ac46:	6782                	ld	a5,0(sp)
ffffffffc020ac48:	14f71463          	bne	a4,a5,ffffffffc020ad90 <sfs_namefile+0x1e0>
ffffffffc020ac4c:	4418                	lw	a4,8(s0)
ffffffffc020ac4e:	13270063          	beq	a4,s2,ffffffffc020ad6e <sfs_namefile+0x1be>
ffffffffc020ac52:	6018                	ld	a4,0(s0)
ffffffffc020ac54:	00475703          	lhu	a4,4(a4)
ffffffffc020ac58:	11a71b63          	bne	a4,s10,ffffffffc020ad6e <sfs_namefile+0x1be>
ffffffffc020ac5c:	02040b93          	addi	s7,s0,32
ffffffffc020ac60:	855e                	mv	a0,s7
ffffffffc020ac62:	9e1f90ef          	jal	ffffffffc0204642 <down>
ffffffffc020ac66:	6018                	ld	a4,0(s0)
ffffffffc020ac68:	00872983          	lw	s3,8(a4)
ffffffffc020ac6c:	0b305763          	blez	s3,ffffffffc020ad1a <sfs_namefile+0x16a>
ffffffffc020ac70:	8b22                	mv	s6,s0
ffffffffc020ac72:	a039                	j	ffffffffc020ac80 <sfs_namefile+0xd0>
ffffffffc020ac74:	4098                	lw	a4,0(s1)
ffffffffc020ac76:	01270e63          	beq	a4,s2,ffffffffc020ac92 <sfs_namefile+0xe2>
ffffffffc020ac7a:	2d85                	addiw	s11,s11,1
ffffffffc020ac7c:	09b98763          	beq	s3,s11,ffffffffc020ad0a <sfs_namefile+0x15a>
ffffffffc020ac80:	86a6                	mv	a3,s1
ffffffffc020ac82:	866e                	mv	a2,s11
ffffffffc020ac84:	85a2                	mv	a1,s0
ffffffffc020ac86:	8552                	mv	a0,s4
ffffffffc020ac88:	f36ff0ef          	jal	ffffffffc020a3be <sfs_dirent_read_nolock>
ffffffffc020ac8c:	872a                	mv	a4,a0
ffffffffc020ac8e:	d17d                	beqz	a0,ffffffffc020ac74 <sfs_namefile+0xc4>
ffffffffc020ac90:	a8b5                	j	ffffffffc020ad0c <sfs_namefile+0x15c>
ffffffffc020ac92:	855e                	mv	a0,s7
ffffffffc020ac94:	9abf90ef          	jal	ffffffffc020463e <up>
ffffffffc020ac98:	00448513          	addi	a0,s1,4
ffffffffc020ac9c:	23b000ef          	jal	ffffffffc020b6d6 <strlen>
ffffffffc020aca0:	00150793          	addi	a5,a0,1
ffffffffc020aca4:	0afc6e63          	bltu	s8,a5,ffffffffc020ad60 <sfs_namefile+0x1b0>
ffffffffc020aca8:	fff54913          	not	s2,a0
ffffffffc020acac:	862a                	mv	a2,a0
ffffffffc020acae:	00448593          	addi	a1,s1,4
ffffffffc020acb2:	012a8533          	add	a0,s5,s2
ffffffffc020acb6:	40fc0c33          	sub	s8,s8,a5
ffffffffc020acba:	321000ef          	jal	ffffffffc020b7da <memcpy>
ffffffffc020acbe:	02f00793          	li	a5,47
ffffffffc020acc2:	fefa8fa3          	sb	a5,-1(s5)
ffffffffc020acc6:	0834                	addi	a3,sp,24
ffffffffc020acc8:	00004617          	auipc	a2,0x4
ffffffffc020accc:	e4860613          	addi	a2,a2,-440 # ffffffffc020eb10 <etext+0x331e>
ffffffffc020acd0:	85da                	mv	a1,s6
ffffffffc020acd2:	8552                	mv	a0,s4
ffffffffc020acd4:	ddbff0ef          	jal	ffffffffc020aaae <sfs_lookup_once.constprop.0>
ffffffffc020acd8:	89a2                	mv	s3,s0
ffffffffc020acda:	9aca                	add	s5,s5,s2
ffffffffc020acdc:	8daa                	mv	s11,a0
ffffffffc020acde:	d929                	beqz	a0,ffffffffc020ac30 <sfs_namefile+0x80>
ffffffffc020ace0:	854e                	mv	a0,s3
ffffffffc020ace2:	e13fc0ef          	jal	ffffffffc0207af4 <inode_ref_dec>
ffffffffc020ace6:	8526                	mv	a0,s1
ffffffffc020ace8:	b7ef70ef          	jal	ffffffffc0202066 <kfree>
ffffffffc020acec:	640a                	ld	s0,128(sp)
ffffffffc020acee:	74e6                	ld	s1,120(sp)
ffffffffc020acf0:	7946                	ld	s2,112(sp)
ffffffffc020acf2:	79a6                	ld	s3,104(sp)
ffffffffc020acf4:	7a06                	ld	s4,96(sp)
ffffffffc020acf6:	6ae6                	ld	s5,88(sp)
ffffffffc020acf8:	6b46                	ld	s6,80(sp)
ffffffffc020acfa:	6ba6                	ld	s7,72(sp)
ffffffffc020acfc:	6c06                	ld	s8,64(sp)
ffffffffc020acfe:	60aa                	ld	ra,136(sp)
ffffffffc020ad00:	7d42                	ld	s10,48(sp)
ffffffffc020ad02:	856e                	mv	a0,s11
ffffffffc020ad04:	7da2                	ld	s11,40(sp)
ffffffffc020ad06:	6149                	addi	sp,sp,144
ffffffffc020ad08:	8082                	ret
ffffffffc020ad0a:	5741                	li	a4,-16
ffffffffc020ad0c:	855e                	mv	a0,s7
ffffffffc020ad0e:	e03a                	sd	a4,0(sp)
ffffffffc020ad10:	89a2                	mv	s3,s0
ffffffffc020ad12:	92df90ef          	jal	ffffffffc020463e <up>
ffffffffc020ad16:	6d82                	ld	s11,0(sp)
ffffffffc020ad18:	b7e1                	j	ffffffffc020ace0 <sfs_namefile+0x130>
ffffffffc020ad1a:	855e                	mv	a0,s7
ffffffffc020ad1c:	923f90ef          	jal	ffffffffc020463e <up>
ffffffffc020ad20:	89a2                	mv	s3,s0
ffffffffc020ad22:	5dc1                	li	s11,-16
ffffffffc020ad24:	bf75                	j	ffffffffc020ace0 <sfs_namefile+0x130>
ffffffffc020ad26:	854e                	mv	a0,s3
ffffffffc020ad28:	dcdfc0ef          	jal	ffffffffc0207af4 <inode_ref_dec>
ffffffffc020ad2c:	6922                	ld	s2,8(sp)
ffffffffc020ad2e:	85d6                	mv	a1,s5
ffffffffc020ad30:	01893403          	ld	s0,24(s2)
ffffffffc020ad34:	00093503          	ld	a0,0(s2)
ffffffffc020ad38:	1479                	addi	s0,s0,-2
ffffffffc020ad3a:	41840433          	sub	s0,s0,s8
ffffffffc020ad3e:	8622                	mv	a2,s0
ffffffffc020ad40:	0505                	addi	a0,a0,1
ffffffffc020ad42:	25b000ef          	jal	ffffffffc020b79c <memmove>
ffffffffc020ad46:	02f00713          	li	a4,47
ffffffffc020ad4a:	fee50fa3          	sb	a4,-1(a0)
ffffffffc020ad4e:	00850733          	add	a4,a0,s0
ffffffffc020ad52:	00070023          	sb	zero,0(a4)
ffffffffc020ad56:	854a                	mv	a0,s2
ffffffffc020ad58:	85a2                	mv	a1,s0
ffffffffc020ad5a:	80dfa0ef          	jal	ffffffffc0205566 <iobuf_skip>
ffffffffc020ad5e:	b761                	j	ffffffffc020ace6 <sfs_namefile+0x136>
ffffffffc020ad60:	89a2                	mv	s3,s0
ffffffffc020ad62:	5df1                	li	s11,-4
ffffffffc020ad64:	bfb5                	j	ffffffffc020ace0 <sfs_namefile+0x130>
ffffffffc020ad66:	74e6                	ld	s1,120(sp)
ffffffffc020ad68:	79a6                	ld	s3,104(sp)
ffffffffc020ad6a:	5df1                	li	s11,-4
ffffffffc020ad6c:	bf49                	j	ffffffffc020acfe <sfs_namefile+0x14e>
ffffffffc020ad6e:	00004697          	auipc	a3,0x4
ffffffffc020ad72:	daa68693          	addi	a3,a3,-598 # ffffffffc020eb18 <etext+0x3326>
ffffffffc020ad76:	00001617          	auipc	a2,0x1
ffffffffc020ad7a:	eba60613          	addi	a2,a2,-326 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020ad7e:	2f800593          	li	a1,760
ffffffffc020ad82:	00004517          	auipc	a0,0x4
ffffffffc020ad86:	aee50513          	addi	a0,a0,-1298 # ffffffffc020e870 <etext+0x307e>
ffffffffc020ad8a:	fc66                	sd	s9,56(sp)
ffffffffc020ad8c:	ebef50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020ad90:	00004697          	auipc	a3,0x4
ffffffffc020ad94:	aa868693          	addi	a3,a3,-1368 # ffffffffc020e838 <etext+0x3046>
ffffffffc020ad98:	00001617          	auipc	a2,0x1
ffffffffc020ad9c:	e9860613          	addi	a2,a2,-360 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020ada0:	2f700593          	li	a1,759
ffffffffc020ada4:	00004517          	auipc	a0,0x4
ffffffffc020ada8:	acc50513          	addi	a0,a0,-1332 # ffffffffc020e870 <etext+0x307e>
ffffffffc020adac:	fc66                	sd	s9,56(sp)
ffffffffc020adae:	e9cf50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020adb2:	00004697          	auipc	a3,0x4
ffffffffc020adb6:	a8668693          	addi	a3,a3,-1402 # ffffffffc020e838 <etext+0x3046>
ffffffffc020adba:	00001617          	auipc	a2,0x1
ffffffffc020adbe:	e7660613          	addi	a2,a2,-394 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020adc2:	2e400593          	li	a1,740
ffffffffc020adc6:	00004517          	auipc	a0,0x4
ffffffffc020adca:	aaa50513          	addi	a0,a0,-1366 # ffffffffc020e870 <etext+0x307e>
ffffffffc020adce:	fc66                	sd	s9,56(sp)
ffffffffc020add0:	e7af50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020add4:	00004697          	auipc	a3,0x4
ffffffffc020add8:	8bc68693          	addi	a3,a3,-1860 # ffffffffc020e690 <etext+0x2e9e>
ffffffffc020addc:	00001617          	auipc	a2,0x1
ffffffffc020ade0:	e5460613          	addi	a2,a2,-428 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020ade4:	2e300593          	li	a1,739
ffffffffc020ade8:	00004517          	auipc	a0,0x4
ffffffffc020adec:	a8850513          	addi	a0,a0,-1400 # ffffffffc020e870 <etext+0x307e>
ffffffffc020adf0:	e122                	sd	s0,128(sp)
ffffffffc020adf2:	f8ca                	sd	s2,112(sp)
ffffffffc020adf4:	ecd6                	sd	s5,88(sp)
ffffffffc020adf6:	e8da                	sd	s6,80(sp)
ffffffffc020adf8:	e4de                	sd	s7,72(sp)
ffffffffc020adfa:	e0e2                	sd	s8,64(sp)
ffffffffc020adfc:	fc66                	sd	s9,56(sp)
ffffffffc020adfe:	e4cf50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020ae02 <sfs_lookup>:
ffffffffc020ae02:	7139                	addi	sp,sp,-64
ffffffffc020ae04:	f426                	sd	s1,40(sp)
ffffffffc020ae06:	7524                	ld	s1,104(a0)
ffffffffc020ae08:	fc06                	sd	ra,56(sp)
ffffffffc020ae0a:	f822                	sd	s0,48(sp)
ffffffffc020ae0c:	f04a                	sd	s2,32(sp)
ffffffffc020ae0e:	c4b5                	beqz	s1,ffffffffc020ae7a <sfs_lookup+0x78>
ffffffffc020ae10:	0b04a783          	lw	a5,176(s1)
ffffffffc020ae14:	e3bd                	bnez	a5,ffffffffc020ae7a <sfs_lookup+0x78>
ffffffffc020ae16:	0005c783          	lbu	a5,0(a1)
ffffffffc020ae1a:	c3c5                	beqz	a5,ffffffffc020aeba <sfs_lookup+0xb8>
ffffffffc020ae1c:	fd178793          	addi	a5,a5,-47
ffffffffc020ae20:	cfc9                	beqz	a5,ffffffffc020aeba <sfs_lookup+0xb8>
ffffffffc020ae22:	842a                	mv	s0,a0
ffffffffc020ae24:	8932                	mv	s2,a2
ffffffffc020ae26:	e42e                	sd	a1,8(sp)
ffffffffc020ae28:	bfffc0ef          	jal	ffffffffc0207a26 <inode_ref_inc>
ffffffffc020ae2c:	4c38                	lw	a4,88(s0)
ffffffffc020ae2e:	6785                	lui	a5,0x1
ffffffffc020ae30:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020ae34:	06f71363          	bne	a4,a5,ffffffffc020ae9a <sfs_lookup+0x98>
ffffffffc020ae38:	6018                	ld	a4,0(s0)
ffffffffc020ae3a:	4789                	li	a5,2
ffffffffc020ae3c:	00475703          	lhu	a4,4(a4)
ffffffffc020ae40:	02f71863          	bne	a4,a5,ffffffffc020ae70 <sfs_lookup+0x6e>
ffffffffc020ae44:	6622                	ld	a2,8(sp)
ffffffffc020ae46:	85a2                	mv	a1,s0
ffffffffc020ae48:	8526                	mv	a0,s1
ffffffffc020ae4a:	0834                	addi	a3,sp,24
ffffffffc020ae4c:	c63ff0ef          	jal	ffffffffc020aaae <sfs_lookup_once.constprop.0>
ffffffffc020ae50:	87aa                	mv	a5,a0
ffffffffc020ae52:	8522                	mv	a0,s0
ffffffffc020ae54:	843e                	mv	s0,a5
ffffffffc020ae56:	c9ffc0ef          	jal	ffffffffc0207af4 <inode_ref_dec>
ffffffffc020ae5a:	e401                	bnez	s0,ffffffffc020ae62 <sfs_lookup+0x60>
ffffffffc020ae5c:	67e2                	ld	a5,24(sp)
ffffffffc020ae5e:	00f93023          	sd	a5,0(s2)
ffffffffc020ae62:	70e2                	ld	ra,56(sp)
ffffffffc020ae64:	8522                	mv	a0,s0
ffffffffc020ae66:	7442                	ld	s0,48(sp)
ffffffffc020ae68:	74a2                	ld	s1,40(sp)
ffffffffc020ae6a:	7902                	ld	s2,32(sp)
ffffffffc020ae6c:	6121                	addi	sp,sp,64
ffffffffc020ae6e:	8082                	ret
ffffffffc020ae70:	8522                	mv	a0,s0
ffffffffc020ae72:	c83fc0ef          	jal	ffffffffc0207af4 <inode_ref_dec>
ffffffffc020ae76:	5439                	li	s0,-18
ffffffffc020ae78:	b7ed                	j	ffffffffc020ae62 <sfs_lookup+0x60>
ffffffffc020ae7a:	00004697          	auipc	a3,0x4
ffffffffc020ae7e:	81668693          	addi	a3,a3,-2026 # ffffffffc020e690 <etext+0x2e9e>
ffffffffc020ae82:	00001617          	auipc	a2,0x1
ffffffffc020ae86:	dae60613          	addi	a2,a2,-594 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020ae8a:	3d900593          	li	a1,985
ffffffffc020ae8e:	00004517          	auipc	a0,0x4
ffffffffc020ae92:	9e250513          	addi	a0,a0,-1566 # ffffffffc020e870 <etext+0x307e>
ffffffffc020ae96:	db4f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020ae9a:	00004697          	auipc	a3,0x4
ffffffffc020ae9e:	99e68693          	addi	a3,a3,-1634 # ffffffffc020e838 <etext+0x3046>
ffffffffc020aea2:	00001617          	auipc	a2,0x1
ffffffffc020aea6:	d8e60613          	addi	a2,a2,-626 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020aeaa:	3dc00593          	li	a1,988
ffffffffc020aeae:	00004517          	auipc	a0,0x4
ffffffffc020aeb2:	9c250513          	addi	a0,a0,-1598 # ffffffffc020e870 <etext+0x307e>
ffffffffc020aeb6:	d94f50ef          	jal	ffffffffc020044a <__panic>
ffffffffc020aeba:	00004697          	auipc	a3,0x4
ffffffffc020aebe:	c9668693          	addi	a3,a3,-874 # ffffffffc020eb50 <etext+0x335e>
ffffffffc020aec2:	00001617          	auipc	a2,0x1
ffffffffc020aec6:	d6e60613          	addi	a2,a2,-658 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020aeca:	3da00593          	li	a1,986
ffffffffc020aece:	00004517          	auipc	a0,0x4
ffffffffc020aed2:	9a250513          	addi	a0,a0,-1630 # ffffffffc020e870 <etext+0x307e>
ffffffffc020aed6:	d74f50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020aeda <sfs_rwblock_nolock>:
ffffffffc020aeda:	7139                	addi	sp,sp,-64
ffffffffc020aedc:	f822                	sd	s0,48(sp)
ffffffffc020aede:	f426                	sd	s1,40(sp)
ffffffffc020aee0:	fc06                	sd	ra,56(sp)
ffffffffc020aee2:	842a                	mv	s0,a0
ffffffffc020aee4:	84b6                	mv	s1,a3
ffffffffc020aee6:	e219                	bnez	a2,ffffffffc020aeec <sfs_rwblock_nolock+0x12>
ffffffffc020aee8:	8b05                	andi	a4,a4,1
ffffffffc020aeea:	e71d                	bnez	a4,ffffffffc020af18 <sfs_rwblock_nolock+0x3e>
ffffffffc020aeec:	405c                	lw	a5,4(s0)
ffffffffc020aeee:	02f67563          	bgeu	a2,a5,ffffffffc020af18 <sfs_rwblock_nolock+0x3e>
ffffffffc020aef2:	00c6161b          	slliw	a2,a2,0xc
ffffffffc020aef6:	02061693          	slli	a3,a2,0x20
ffffffffc020aefa:	9281                	srli	a3,a3,0x20
ffffffffc020aefc:	6605                	lui	a2,0x1
ffffffffc020aefe:	850a                	mv	a0,sp
ffffffffc020af00:	dd8fa0ef          	jal	ffffffffc02054d8 <iobuf_init>
ffffffffc020af04:	85aa                	mv	a1,a0
ffffffffc020af06:	7808                	ld	a0,48(s0)
ffffffffc020af08:	8626                	mv	a2,s1
ffffffffc020af0a:	7118                	ld	a4,32(a0)
ffffffffc020af0c:	9702                	jalr	a4
ffffffffc020af0e:	70e2                	ld	ra,56(sp)
ffffffffc020af10:	7442                	ld	s0,48(sp)
ffffffffc020af12:	74a2                	ld	s1,40(sp)
ffffffffc020af14:	6121                	addi	sp,sp,64
ffffffffc020af16:	8082                	ret
ffffffffc020af18:	00004697          	auipc	a3,0x4
ffffffffc020af1c:	c5868693          	addi	a3,a3,-936 # ffffffffc020eb70 <etext+0x337e>
ffffffffc020af20:	00001617          	auipc	a2,0x1
ffffffffc020af24:	d1060613          	addi	a2,a2,-752 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020af28:	45d5                	li	a1,21
ffffffffc020af2a:	00004517          	auipc	a0,0x4
ffffffffc020af2e:	c7e50513          	addi	a0,a0,-898 # ffffffffc020eba8 <etext+0x33b6>
ffffffffc020af32:	d18f50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020af36 <sfs_rblock>:
ffffffffc020af36:	7139                	addi	sp,sp,-64
ffffffffc020af38:	ec4e                	sd	s3,24(sp)
ffffffffc020af3a:	89b6                	mv	s3,a3
ffffffffc020af3c:	f822                	sd	s0,48(sp)
ffffffffc020af3e:	f04a                	sd	s2,32(sp)
ffffffffc020af40:	e852                	sd	s4,16(sp)
ffffffffc020af42:	fc06                	sd	ra,56(sp)
ffffffffc020af44:	f426                	sd	s1,40(sp)
ffffffffc020af46:	892e                	mv	s2,a1
ffffffffc020af48:	8432                	mv	s0,a2
ffffffffc020af4a:	8a2a                	mv	s4,a0
ffffffffc020af4c:	2ea000ef          	jal	ffffffffc020b236 <lock_sfs_io>
ffffffffc020af50:	02098763          	beqz	s3,ffffffffc020af7e <sfs_rblock+0x48>
ffffffffc020af54:	e456                	sd	s5,8(sp)
ffffffffc020af56:	013409bb          	addw	s3,s0,s3
ffffffffc020af5a:	6a85                	lui	s5,0x1
ffffffffc020af5c:	a021                	j	ffffffffc020af64 <sfs_rblock+0x2e>
ffffffffc020af5e:	9956                	add	s2,s2,s5
ffffffffc020af60:	01340e63          	beq	s0,s3,ffffffffc020af7c <sfs_rblock+0x46>
ffffffffc020af64:	8622                	mv	a2,s0
ffffffffc020af66:	4705                	li	a4,1
ffffffffc020af68:	4681                	li	a3,0
ffffffffc020af6a:	85ca                	mv	a1,s2
ffffffffc020af6c:	8552                	mv	a0,s4
ffffffffc020af6e:	f6dff0ef          	jal	ffffffffc020aeda <sfs_rwblock_nolock>
ffffffffc020af72:	84aa                	mv	s1,a0
ffffffffc020af74:	2405                	addiw	s0,s0,1
ffffffffc020af76:	d565                	beqz	a0,ffffffffc020af5e <sfs_rblock+0x28>
ffffffffc020af78:	6aa2                	ld	s5,8(sp)
ffffffffc020af7a:	a019                	j	ffffffffc020af80 <sfs_rblock+0x4a>
ffffffffc020af7c:	6aa2                	ld	s5,8(sp)
ffffffffc020af7e:	4481                	li	s1,0
ffffffffc020af80:	8552                	mv	a0,s4
ffffffffc020af82:	2c4000ef          	jal	ffffffffc020b246 <unlock_sfs_io>
ffffffffc020af86:	70e2                	ld	ra,56(sp)
ffffffffc020af88:	7442                	ld	s0,48(sp)
ffffffffc020af8a:	7902                	ld	s2,32(sp)
ffffffffc020af8c:	69e2                	ld	s3,24(sp)
ffffffffc020af8e:	6a42                	ld	s4,16(sp)
ffffffffc020af90:	8526                	mv	a0,s1
ffffffffc020af92:	74a2                	ld	s1,40(sp)
ffffffffc020af94:	6121                	addi	sp,sp,64
ffffffffc020af96:	8082                	ret

ffffffffc020af98 <sfs_wblock>:
ffffffffc020af98:	7139                	addi	sp,sp,-64
ffffffffc020af9a:	ec4e                	sd	s3,24(sp)
ffffffffc020af9c:	89b6                	mv	s3,a3
ffffffffc020af9e:	f822                	sd	s0,48(sp)
ffffffffc020afa0:	f04a                	sd	s2,32(sp)
ffffffffc020afa2:	e852                	sd	s4,16(sp)
ffffffffc020afa4:	fc06                	sd	ra,56(sp)
ffffffffc020afa6:	f426                	sd	s1,40(sp)
ffffffffc020afa8:	892e                	mv	s2,a1
ffffffffc020afaa:	8432                	mv	s0,a2
ffffffffc020afac:	8a2a                	mv	s4,a0
ffffffffc020afae:	288000ef          	jal	ffffffffc020b236 <lock_sfs_io>
ffffffffc020afb2:	02098763          	beqz	s3,ffffffffc020afe0 <sfs_wblock+0x48>
ffffffffc020afb6:	e456                	sd	s5,8(sp)
ffffffffc020afb8:	013409bb          	addw	s3,s0,s3
ffffffffc020afbc:	6a85                	lui	s5,0x1
ffffffffc020afbe:	a021                	j	ffffffffc020afc6 <sfs_wblock+0x2e>
ffffffffc020afc0:	9956                	add	s2,s2,s5
ffffffffc020afc2:	01340e63          	beq	s0,s3,ffffffffc020afde <sfs_wblock+0x46>
ffffffffc020afc6:	4705                	li	a4,1
ffffffffc020afc8:	8622                	mv	a2,s0
ffffffffc020afca:	86ba                	mv	a3,a4
ffffffffc020afcc:	85ca                	mv	a1,s2
ffffffffc020afce:	8552                	mv	a0,s4
ffffffffc020afd0:	f0bff0ef          	jal	ffffffffc020aeda <sfs_rwblock_nolock>
ffffffffc020afd4:	84aa                	mv	s1,a0
ffffffffc020afd6:	2405                	addiw	s0,s0,1
ffffffffc020afd8:	d565                	beqz	a0,ffffffffc020afc0 <sfs_wblock+0x28>
ffffffffc020afda:	6aa2                	ld	s5,8(sp)
ffffffffc020afdc:	a019                	j	ffffffffc020afe2 <sfs_wblock+0x4a>
ffffffffc020afde:	6aa2                	ld	s5,8(sp)
ffffffffc020afe0:	4481                	li	s1,0
ffffffffc020afe2:	8552                	mv	a0,s4
ffffffffc020afe4:	262000ef          	jal	ffffffffc020b246 <unlock_sfs_io>
ffffffffc020afe8:	70e2                	ld	ra,56(sp)
ffffffffc020afea:	7442                	ld	s0,48(sp)
ffffffffc020afec:	7902                	ld	s2,32(sp)
ffffffffc020afee:	69e2                	ld	s3,24(sp)
ffffffffc020aff0:	6a42                	ld	s4,16(sp)
ffffffffc020aff2:	8526                	mv	a0,s1
ffffffffc020aff4:	74a2                	ld	s1,40(sp)
ffffffffc020aff6:	6121                	addi	sp,sp,64
ffffffffc020aff8:	8082                	ret

ffffffffc020affa <sfs_rbuf>:
ffffffffc020affa:	7179                	addi	sp,sp,-48
ffffffffc020affc:	f406                	sd	ra,40(sp)
ffffffffc020affe:	f022                	sd	s0,32(sp)
ffffffffc020b000:	ec26                	sd	s1,24(sp)
ffffffffc020b002:	e84a                	sd	s2,16(sp)
ffffffffc020b004:	e44e                	sd	s3,8(sp)
ffffffffc020b006:	e052                	sd	s4,0(sp)
ffffffffc020b008:	6785                	lui	a5,0x1
ffffffffc020b00a:	04f77863          	bgeu	a4,a5,ffffffffc020b05a <sfs_rbuf+0x60>
ffffffffc020b00e:	84ba                	mv	s1,a4
ffffffffc020b010:	9732                	add	a4,a4,a2
ffffffffc020b012:	04e7e463          	bltu	a5,a4,ffffffffc020b05a <sfs_rbuf+0x60>
ffffffffc020b016:	8936                	mv	s2,a3
ffffffffc020b018:	842a                	mv	s0,a0
ffffffffc020b01a:	89ae                	mv	s3,a1
ffffffffc020b01c:	8a32                	mv	s4,a2
ffffffffc020b01e:	218000ef          	jal	ffffffffc020b236 <lock_sfs_io>
ffffffffc020b022:	642c                	ld	a1,72(s0)
ffffffffc020b024:	864a                	mv	a2,s2
ffffffffc020b026:	8522                	mv	a0,s0
ffffffffc020b028:	4705                	li	a4,1
ffffffffc020b02a:	4681                	li	a3,0
ffffffffc020b02c:	eafff0ef          	jal	ffffffffc020aeda <sfs_rwblock_nolock>
ffffffffc020b030:	892a                	mv	s2,a0
ffffffffc020b032:	cd09                	beqz	a0,ffffffffc020b04c <sfs_rbuf+0x52>
ffffffffc020b034:	8522                	mv	a0,s0
ffffffffc020b036:	210000ef          	jal	ffffffffc020b246 <unlock_sfs_io>
ffffffffc020b03a:	70a2                	ld	ra,40(sp)
ffffffffc020b03c:	7402                	ld	s0,32(sp)
ffffffffc020b03e:	64e2                	ld	s1,24(sp)
ffffffffc020b040:	69a2                	ld	s3,8(sp)
ffffffffc020b042:	6a02                	ld	s4,0(sp)
ffffffffc020b044:	854a                	mv	a0,s2
ffffffffc020b046:	6942                	ld	s2,16(sp)
ffffffffc020b048:	6145                	addi	sp,sp,48
ffffffffc020b04a:	8082                	ret
ffffffffc020b04c:	642c                	ld	a1,72(s0)
ffffffffc020b04e:	8652                	mv	a2,s4
ffffffffc020b050:	854e                	mv	a0,s3
ffffffffc020b052:	95a6                	add	a1,a1,s1
ffffffffc020b054:	786000ef          	jal	ffffffffc020b7da <memcpy>
ffffffffc020b058:	bff1                	j	ffffffffc020b034 <sfs_rbuf+0x3a>
ffffffffc020b05a:	00004697          	auipc	a3,0x4
ffffffffc020b05e:	b6668693          	addi	a3,a3,-1178 # ffffffffc020ebc0 <etext+0x33ce>
ffffffffc020b062:	00001617          	auipc	a2,0x1
ffffffffc020b066:	bce60613          	addi	a2,a2,-1074 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020b06a:	05500593          	li	a1,85
ffffffffc020b06e:	00004517          	auipc	a0,0x4
ffffffffc020b072:	b3a50513          	addi	a0,a0,-1222 # ffffffffc020eba8 <etext+0x33b6>
ffffffffc020b076:	bd4f50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020b07a <sfs_wbuf>:
ffffffffc020b07a:	7139                	addi	sp,sp,-64
ffffffffc020b07c:	fc06                	sd	ra,56(sp)
ffffffffc020b07e:	f822                	sd	s0,48(sp)
ffffffffc020b080:	f426                	sd	s1,40(sp)
ffffffffc020b082:	f04a                	sd	s2,32(sp)
ffffffffc020b084:	ec4e                	sd	s3,24(sp)
ffffffffc020b086:	e852                	sd	s4,16(sp)
ffffffffc020b088:	e456                	sd	s5,8(sp)
ffffffffc020b08a:	6785                	lui	a5,0x1
ffffffffc020b08c:	06f77163          	bgeu	a4,a5,ffffffffc020b0ee <sfs_wbuf+0x74>
ffffffffc020b090:	893a                	mv	s2,a4
ffffffffc020b092:	9732                	add	a4,a4,a2
ffffffffc020b094:	04e7ed63          	bltu	a5,a4,ffffffffc020b0ee <sfs_wbuf+0x74>
ffffffffc020b098:	89b6                	mv	s3,a3
ffffffffc020b09a:	84aa                	mv	s1,a0
ffffffffc020b09c:	8a2e                	mv	s4,a1
ffffffffc020b09e:	8ab2                	mv	s5,a2
ffffffffc020b0a0:	196000ef          	jal	ffffffffc020b236 <lock_sfs_io>
ffffffffc020b0a4:	64ac                	ld	a1,72(s1)
ffffffffc020b0a6:	864e                	mv	a2,s3
ffffffffc020b0a8:	8526                	mv	a0,s1
ffffffffc020b0aa:	4705                	li	a4,1
ffffffffc020b0ac:	4681                	li	a3,0
ffffffffc020b0ae:	e2dff0ef          	jal	ffffffffc020aeda <sfs_rwblock_nolock>
ffffffffc020b0b2:	842a                	mv	s0,a0
ffffffffc020b0b4:	cd11                	beqz	a0,ffffffffc020b0d0 <sfs_wbuf+0x56>
ffffffffc020b0b6:	8526                	mv	a0,s1
ffffffffc020b0b8:	18e000ef          	jal	ffffffffc020b246 <unlock_sfs_io>
ffffffffc020b0bc:	70e2                	ld	ra,56(sp)
ffffffffc020b0be:	8522                	mv	a0,s0
ffffffffc020b0c0:	7442                	ld	s0,48(sp)
ffffffffc020b0c2:	74a2                	ld	s1,40(sp)
ffffffffc020b0c4:	7902                	ld	s2,32(sp)
ffffffffc020b0c6:	69e2                	ld	s3,24(sp)
ffffffffc020b0c8:	6a42                	ld	s4,16(sp)
ffffffffc020b0ca:	6aa2                	ld	s5,8(sp)
ffffffffc020b0cc:	6121                	addi	sp,sp,64
ffffffffc020b0ce:	8082                	ret
ffffffffc020b0d0:	64a8                	ld	a0,72(s1)
ffffffffc020b0d2:	8656                	mv	a2,s5
ffffffffc020b0d4:	85d2                	mv	a1,s4
ffffffffc020b0d6:	954a                	add	a0,a0,s2
ffffffffc020b0d8:	702000ef          	jal	ffffffffc020b7da <memcpy>
ffffffffc020b0dc:	64ac                	ld	a1,72(s1)
ffffffffc020b0de:	4705                	li	a4,1
ffffffffc020b0e0:	864e                	mv	a2,s3
ffffffffc020b0e2:	8526                	mv	a0,s1
ffffffffc020b0e4:	86ba                	mv	a3,a4
ffffffffc020b0e6:	df5ff0ef          	jal	ffffffffc020aeda <sfs_rwblock_nolock>
ffffffffc020b0ea:	842a                	mv	s0,a0
ffffffffc020b0ec:	b7e9                	j	ffffffffc020b0b6 <sfs_wbuf+0x3c>
ffffffffc020b0ee:	00004697          	auipc	a3,0x4
ffffffffc020b0f2:	ad268693          	addi	a3,a3,-1326 # ffffffffc020ebc0 <etext+0x33ce>
ffffffffc020b0f6:	00001617          	auipc	a2,0x1
ffffffffc020b0fa:	b3a60613          	addi	a2,a2,-1222 # ffffffffc020bc30 <etext+0x43e>
ffffffffc020b0fe:	06b00593          	li	a1,107
ffffffffc020b102:	00004517          	auipc	a0,0x4
ffffffffc020b106:	aa650513          	addi	a0,a0,-1370 # ffffffffc020eba8 <etext+0x33b6>
ffffffffc020b10a:	b40f50ef          	jal	ffffffffc020044a <__panic>

ffffffffc020b10e <sfs_sync_super>:
ffffffffc020b10e:	1101                	addi	sp,sp,-32
ffffffffc020b110:	ec06                	sd	ra,24(sp)
ffffffffc020b112:	e822                	sd	s0,16(sp)
ffffffffc020b114:	e426                	sd	s1,8(sp)
ffffffffc020b116:	842a                	mv	s0,a0
ffffffffc020b118:	11e000ef          	jal	ffffffffc020b236 <lock_sfs_io>
ffffffffc020b11c:	6428                	ld	a0,72(s0)
ffffffffc020b11e:	6605                	lui	a2,0x1
ffffffffc020b120:	4581                	li	a1,0
ffffffffc020b122:	668000ef          	jal	ffffffffc020b78a <memset>
ffffffffc020b126:	6428                	ld	a0,72(s0)
ffffffffc020b128:	85a2                	mv	a1,s0
ffffffffc020b12a:	02c00613          	li	a2,44
ffffffffc020b12e:	6ac000ef          	jal	ffffffffc020b7da <memcpy>
ffffffffc020b132:	642c                	ld	a1,72(s0)
ffffffffc020b134:	8522                	mv	a0,s0
ffffffffc020b136:	4701                	li	a4,0
ffffffffc020b138:	4685                	li	a3,1
ffffffffc020b13a:	4601                	li	a2,0
ffffffffc020b13c:	d9fff0ef          	jal	ffffffffc020aeda <sfs_rwblock_nolock>
ffffffffc020b140:	84aa                	mv	s1,a0
ffffffffc020b142:	8522                	mv	a0,s0
ffffffffc020b144:	102000ef          	jal	ffffffffc020b246 <unlock_sfs_io>
ffffffffc020b148:	60e2                	ld	ra,24(sp)
ffffffffc020b14a:	6442                	ld	s0,16(sp)
ffffffffc020b14c:	8526                	mv	a0,s1
ffffffffc020b14e:	64a2                	ld	s1,8(sp)
ffffffffc020b150:	6105                	addi	sp,sp,32
ffffffffc020b152:	8082                	ret

ffffffffc020b154 <sfs_sync_freemap>:
ffffffffc020b154:	7139                	addi	sp,sp,-64
ffffffffc020b156:	ec4e                	sd	s3,24(sp)
ffffffffc020b158:	e852                	sd	s4,16(sp)
ffffffffc020b15a:	00456983          	lwu	s3,4(a0)
ffffffffc020b15e:	8a2a                	mv	s4,a0
ffffffffc020b160:	7d08                	ld	a0,56(a0)
ffffffffc020b162:	67a1                	lui	a5,0x8
ffffffffc020b164:	17fd                	addi	a5,a5,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
ffffffffc020b166:	4581                	li	a1,0
ffffffffc020b168:	f822                	sd	s0,48(sp)
ffffffffc020b16a:	fc06                	sd	ra,56(sp)
ffffffffc020b16c:	f426                	sd	s1,40(sp)
ffffffffc020b16e:	99be                	add	s3,s3,a5
ffffffffc020b170:	954fe0ef          	jal	ffffffffc02092c4 <bitmap_getdata>
ffffffffc020b174:	00f9d993          	srli	s3,s3,0xf
ffffffffc020b178:	842a                	mv	s0,a0
ffffffffc020b17a:	8552                	mv	a0,s4
ffffffffc020b17c:	0ba000ef          	jal	ffffffffc020b236 <lock_sfs_io>
ffffffffc020b180:	02098b63          	beqz	s3,ffffffffc020b1b6 <sfs_sync_freemap+0x62>
ffffffffc020b184:	09b2                	slli	s3,s3,0xc
ffffffffc020b186:	f04a                	sd	s2,32(sp)
ffffffffc020b188:	e456                	sd	s5,8(sp)
ffffffffc020b18a:	99a2                	add	s3,s3,s0
ffffffffc020b18c:	4909                	li	s2,2
ffffffffc020b18e:	6a85                	lui	s5,0x1
ffffffffc020b190:	a021                	j	ffffffffc020b198 <sfs_sync_freemap+0x44>
ffffffffc020b192:	2905                	addiw	s2,s2,1
ffffffffc020b194:	01340f63          	beq	s0,s3,ffffffffc020b1b2 <sfs_sync_freemap+0x5e>
ffffffffc020b198:	4705                	li	a4,1
ffffffffc020b19a:	85a2                	mv	a1,s0
ffffffffc020b19c:	86ba                	mv	a3,a4
ffffffffc020b19e:	864a                	mv	a2,s2
ffffffffc020b1a0:	8552                	mv	a0,s4
ffffffffc020b1a2:	d39ff0ef          	jal	ffffffffc020aeda <sfs_rwblock_nolock>
ffffffffc020b1a6:	84aa                	mv	s1,a0
ffffffffc020b1a8:	9456                	add	s0,s0,s5
ffffffffc020b1aa:	d565                	beqz	a0,ffffffffc020b192 <sfs_sync_freemap+0x3e>
ffffffffc020b1ac:	7902                	ld	s2,32(sp)
ffffffffc020b1ae:	6aa2                	ld	s5,8(sp)
ffffffffc020b1b0:	a021                	j	ffffffffc020b1b8 <sfs_sync_freemap+0x64>
ffffffffc020b1b2:	7902                	ld	s2,32(sp)
ffffffffc020b1b4:	6aa2                	ld	s5,8(sp)
ffffffffc020b1b6:	4481                	li	s1,0
ffffffffc020b1b8:	8552                	mv	a0,s4
ffffffffc020b1ba:	08c000ef          	jal	ffffffffc020b246 <unlock_sfs_io>
ffffffffc020b1be:	70e2                	ld	ra,56(sp)
ffffffffc020b1c0:	7442                	ld	s0,48(sp)
ffffffffc020b1c2:	69e2                	ld	s3,24(sp)
ffffffffc020b1c4:	6a42                	ld	s4,16(sp)
ffffffffc020b1c6:	8526                	mv	a0,s1
ffffffffc020b1c8:	74a2                	ld	s1,40(sp)
ffffffffc020b1ca:	6121                	addi	sp,sp,64
ffffffffc020b1cc:	8082                	ret

ffffffffc020b1ce <sfs_clear_block>:
ffffffffc020b1ce:	7179                	addi	sp,sp,-48
ffffffffc020b1d0:	f022                	sd	s0,32(sp)
ffffffffc020b1d2:	e84a                	sd	s2,16(sp)
ffffffffc020b1d4:	e44e                	sd	s3,8(sp)
ffffffffc020b1d6:	f406                	sd	ra,40(sp)
ffffffffc020b1d8:	89b2                	mv	s3,a2
ffffffffc020b1da:	ec26                	sd	s1,24(sp)
ffffffffc020b1dc:	842e                	mv	s0,a1
ffffffffc020b1de:	892a                	mv	s2,a0
ffffffffc020b1e0:	056000ef          	jal	ffffffffc020b236 <lock_sfs_io>
ffffffffc020b1e4:	04893503          	ld	a0,72(s2)
ffffffffc020b1e8:	6605                	lui	a2,0x1
ffffffffc020b1ea:	4581                	li	a1,0
ffffffffc020b1ec:	59e000ef          	jal	ffffffffc020b78a <memset>
ffffffffc020b1f0:	02098d63          	beqz	s3,ffffffffc020b22a <sfs_clear_block+0x5c>
ffffffffc020b1f4:	013409bb          	addw	s3,s0,s3
ffffffffc020b1f8:	a019                	j	ffffffffc020b1fe <sfs_clear_block+0x30>
ffffffffc020b1fa:	03340863          	beq	s0,s3,ffffffffc020b22a <sfs_clear_block+0x5c>
ffffffffc020b1fe:	04893583          	ld	a1,72(s2)
ffffffffc020b202:	4705                	li	a4,1
ffffffffc020b204:	8622                	mv	a2,s0
ffffffffc020b206:	86ba                	mv	a3,a4
ffffffffc020b208:	854a                	mv	a0,s2
ffffffffc020b20a:	cd1ff0ef          	jal	ffffffffc020aeda <sfs_rwblock_nolock>
ffffffffc020b20e:	84aa                	mv	s1,a0
ffffffffc020b210:	2405                	addiw	s0,s0,1
ffffffffc020b212:	d565                	beqz	a0,ffffffffc020b1fa <sfs_clear_block+0x2c>
ffffffffc020b214:	854a                	mv	a0,s2
ffffffffc020b216:	030000ef          	jal	ffffffffc020b246 <unlock_sfs_io>
ffffffffc020b21a:	70a2                	ld	ra,40(sp)
ffffffffc020b21c:	7402                	ld	s0,32(sp)
ffffffffc020b21e:	6942                	ld	s2,16(sp)
ffffffffc020b220:	69a2                	ld	s3,8(sp)
ffffffffc020b222:	8526                	mv	a0,s1
ffffffffc020b224:	64e2                	ld	s1,24(sp)
ffffffffc020b226:	6145                	addi	sp,sp,48
ffffffffc020b228:	8082                	ret
ffffffffc020b22a:	4481                	li	s1,0
ffffffffc020b22c:	b7e5                	j	ffffffffc020b214 <sfs_clear_block+0x46>

ffffffffc020b22e <lock_sfs_fs>:
ffffffffc020b22e:	05050513          	addi	a0,a0,80
ffffffffc020b232:	c10f906f          	j	ffffffffc0204642 <down>

ffffffffc020b236 <lock_sfs_io>:
ffffffffc020b236:	06850513          	addi	a0,a0,104
ffffffffc020b23a:	c08f906f          	j	ffffffffc0204642 <down>

ffffffffc020b23e <unlock_sfs_fs>:
ffffffffc020b23e:	05050513          	addi	a0,a0,80
ffffffffc020b242:	bfcf906f          	j	ffffffffc020463e <up>

ffffffffc020b246 <unlock_sfs_io>:
ffffffffc020b246:	06850513          	addi	a0,a0,104
ffffffffc020b24a:	bf4f906f          	j	ffffffffc020463e <up>

ffffffffc020b24e <hash32>:
ffffffffc020b24e:	9e3707b7          	lui	a5,0x9e370
ffffffffc020b252:	2785                	addiw	a5,a5,1 # ffffffff9e370001 <_binary_bin_sfs_img_size+0xffffffff9e2fad01>
ffffffffc020b254:	02a787bb          	mulw	a5,a5,a0
ffffffffc020b258:	02000513          	li	a0,32
ffffffffc020b25c:	9d0d                	subw	a0,a0,a1
ffffffffc020b25e:	00a7d53b          	srlw	a0,a5,a0
ffffffffc020b262:	8082                	ret

ffffffffc020b264 <printnum>:
ffffffffc020b264:	7139                	addi	sp,sp,-64
ffffffffc020b266:	02071893          	slli	a7,a4,0x20
ffffffffc020b26a:	f822                	sd	s0,48(sp)
ffffffffc020b26c:	f426                	sd	s1,40(sp)
ffffffffc020b26e:	f04a                	sd	s2,32(sp)
ffffffffc020b270:	ec4e                	sd	s3,24(sp)
ffffffffc020b272:	e456                	sd	s5,8(sp)
ffffffffc020b274:	0208d893          	srli	a7,a7,0x20
ffffffffc020b278:	fc06                	sd	ra,56(sp)
ffffffffc020b27a:	0316fab3          	remu	s5,a3,a7
ffffffffc020b27e:	fff7841b          	addiw	s0,a5,-1
ffffffffc020b282:	84aa                	mv	s1,a0
ffffffffc020b284:	89ae                	mv	s3,a1
ffffffffc020b286:	8932                	mv	s2,a2
ffffffffc020b288:	0516f063          	bgeu	a3,a7,ffffffffc020b2c8 <printnum+0x64>
ffffffffc020b28c:	e852                	sd	s4,16(sp)
ffffffffc020b28e:	4705                	li	a4,1
ffffffffc020b290:	8a42                	mv	s4,a6
ffffffffc020b292:	00f75863          	bge	a4,a5,ffffffffc020b2a2 <printnum+0x3e>
ffffffffc020b296:	864e                	mv	a2,s3
ffffffffc020b298:	85ca                	mv	a1,s2
ffffffffc020b29a:	8552                	mv	a0,s4
ffffffffc020b29c:	347d                	addiw	s0,s0,-1
ffffffffc020b29e:	9482                	jalr	s1
ffffffffc020b2a0:	f87d                	bnez	s0,ffffffffc020b296 <printnum+0x32>
ffffffffc020b2a2:	6a42                	ld	s4,16(sp)
ffffffffc020b2a4:	00004797          	auipc	a5,0x4
ffffffffc020b2a8:	96478793          	addi	a5,a5,-1692 # ffffffffc020ec08 <etext+0x3416>
ffffffffc020b2ac:	97d6                	add	a5,a5,s5
ffffffffc020b2ae:	7442                	ld	s0,48(sp)
ffffffffc020b2b0:	0007c503          	lbu	a0,0(a5)
ffffffffc020b2b4:	70e2                	ld	ra,56(sp)
ffffffffc020b2b6:	6aa2                	ld	s5,8(sp)
ffffffffc020b2b8:	864e                	mv	a2,s3
ffffffffc020b2ba:	85ca                	mv	a1,s2
ffffffffc020b2bc:	69e2                	ld	s3,24(sp)
ffffffffc020b2be:	7902                	ld	s2,32(sp)
ffffffffc020b2c0:	87a6                	mv	a5,s1
ffffffffc020b2c2:	74a2                	ld	s1,40(sp)
ffffffffc020b2c4:	6121                	addi	sp,sp,64
ffffffffc020b2c6:	8782                	jr	a5
ffffffffc020b2c8:	0316d6b3          	divu	a3,a3,a7
ffffffffc020b2cc:	87a2                	mv	a5,s0
ffffffffc020b2ce:	f97ff0ef          	jal	ffffffffc020b264 <printnum>
ffffffffc020b2d2:	bfc9                	j	ffffffffc020b2a4 <printnum+0x40>

ffffffffc020b2d4 <sprintputch>:
ffffffffc020b2d4:	499c                	lw	a5,16(a1)
ffffffffc020b2d6:	6198                	ld	a4,0(a1)
ffffffffc020b2d8:	6594                	ld	a3,8(a1)
ffffffffc020b2da:	2785                	addiw	a5,a5,1
ffffffffc020b2dc:	c99c                	sw	a5,16(a1)
ffffffffc020b2de:	00d77763          	bgeu	a4,a3,ffffffffc020b2ec <sprintputch+0x18>
ffffffffc020b2e2:	00170793          	addi	a5,a4,1
ffffffffc020b2e6:	e19c                	sd	a5,0(a1)
ffffffffc020b2e8:	00a70023          	sb	a0,0(a4)
ffffffffc020b2ec:	8082                	ret

ffffffffc020b2ee <vprintfmt>:
ffffffffc020b2ee:	7119                	addi	sp,sp,-128
ffffffffc020b2f0:	f4a6                	sd	s1,104(sp)
ffffffffc020b2f2:	f0ca                	sd	s2,96(sp)
ffffffffc020b2f4:	ecce                	sd	s3,88(sp)
ffffffffc020b2f6:	e8d2                	sd	s4,80(sp)
ffffffffc020b2f8:	e4d6                	sd	s5,72(sp)
ffffffffc020b2fa:	e0da                	sd	s6,64(sp)
ffffffffc020b2fc:	fc5e                	sd	s7,56(sp)
ffffffffc020b2fe:	f466                	sd	s9,40(sp)
ffffffffc020b300:	fc86                	sd	ra,120(sp)
ffffffffc020b302:	f8a2                	sd	s0,112(sp)
ffffffffc020b304:	f862                	sd	s8,48(sp)
ffffffffc020b306:	f06a                	sd	s10,32(sp)
ffffffffc020b308:	ec6e                	sd	s11,24(sp)
ffffffffc020b30a:	84aa                	mv	s1,a0
ffffffffc020b30c:	8cb6                	mv	s9,a3
ffffffffc020b30e:	8aba                	mv	s5,a4
ffffffffc020b310:	89ae                	mv	s3,a1
ffffffffc020b312:	8932                	mv	s2,a2
ffffffffc020b314:	02500a13          	li	s4,37
ffffffffc020b318:	05500b93          	li	s7,85
ffffffffc020b31c:	00004b17          	auipc	s6,0x4
ffffffffc020b320:	594b0b13          	addi	s6,s6,1428 # ffffffffc020f8b0 <sfs_node_dirops+0x80>
ffffffffc020b324:	000cc503          	lbu	a0,0(s9)
ffffffffc020b328:	001c8413          	addi	s0,s9,1
ffffffffc020b32c:	01450b63          	beq	a0,s4,ffffffffc020b342 <vprintfmt+0x54>
ffffffffc020b330:	cd15                	beqz	a0,ffffffffc020b36c <vprintfmt+0x7e>
ffffffffc020b332:	864e                	mv	a2,s3
ffffffffc020b334:	85ca                	mv	a1,s2
ffffffffc020b336:	9482                	jalr	s1
ffffffffc020b338:	00044503          	lbu	a0,0(s0)
ffffffffc020b33c:	0405                	addi	s0,s0,1
ffffffffc020b33e:	ff4519e3          	bne	a0,s4,ffffffffc020b330 <vprintfmt+0x42>
ffffffffc020b342:	5d7d                	li	s10,-1
ffffffffc020b344:	8dea                	mv	s11,s10
ffffffffc020b346:	02000813          	li	a6,32
ffffffffc020b34a:	4c01                	li	s8,0
ffffffffc020b34c:	4581                	li	a1,0
ffffffffc020b34e:	00044703          	lbu	a4,0(s0)
ffffffffc020b352:	00140c93          	addi	s9,s0,1
ffffffffc020b356:	fdd7061b          	addiw	a2,a4,-35
ffffffffc020b35a:	0ff67613          	zext.b	a2,a2
ffffffffc020b35e:	02cbe663          	bltu	s7,a2,ffffffffc020b38a <vprintfmt+0x9c>
ffffffffc020b362:	060a                	slli	a2,a2,0x2
ffffffffc020b364:	965a                	add	a2,a2,s6
ffffffffc020b366:	421c                	lw	a5,0(a2)
ffffffffc020b368:	97da                	add	a5,a5,s6
ffffffffc020b36a:	8782                	jr	a5
ffffffffc020b36c:	70e6                	ld	ra,120(sp)
ffffffffc020b36e:	7446                	ld	s0,112(sp)
ffffffffc020b370:	74a6                	ld	s1,104(sp)
ffffffffc020b372:	7906                	ld	s2,96(sp)
ffffffffc020b374:	69e6                	ld	s3,88(sp)
ffffffffc020b376:	6a46                	ld	s4,80(sp)
ffffffffc020b378:	6aa6                	ld	s5,72(sp)
ffffffffc020b37a:	6b06                	ld	s6,64(sp)
ffffffffc020b37c:	7be2                	ld	s7,56(sp)
ffffffffc020b37e:	7c42                	ld	s8,48(sp)
ffffffffc020b380:	7ca2                	ld	s9,40(sp)
ffffffffc020b382:	7d02                	ld	s10,32(sp)
ffffffffc020b384:	6de2                	ld	s11,24(sp)
ffffffffc020b386:	6109                	addi	sp,sp,128
ffffffffc020b388:	8082                	ret
ffffffffc020b38a:	864e                	mv	a2,s3
ffffffffc020b38c:	85ca                	mv	a1,s2
ffffffffc020b38e:	02500513          	li	a0,37
ffffffffc020b392:	9482                	jalr	s1
ffffffffc020b394:	fff44783          	lbu	a5,-1(s0)
ffffffffc020b398:	02500713          	li	a4,37
ffffffffc020b39c:	8ca2                	mv	s9,s0
ffffffffc020b39e:	f8e783e3          	beq	a5,a4,ffffffffc020b324 <vprintfmt+0x36>
ffffffffc020b3a2:	ffecc783          	lbu	a5,-2(s9)
ffffffffc020b3a6:	1cfd                	addi	s9,s9,-1
ffffffffc020b3a8:	fee79de3          	bne	a5,a4,ffffffffc020b3a2 <vprintfmt+0xb4>
ffffffffc020b3ac:	bfa5                	j	ffffffffc020b324 <vprintfmt+0x36>
ffffffffc020b3ae:	00144683          	lbu	a3,1(s0)
ffffffffc020b3b2:	4525                	li	a0,9
ffffffffc020b3b4:	fd070d1b          	addiw	s10,a4,-48
ffffffffc020b3b8:	fd06879b          	addiw	a5,a3,-48
ffffffffc020b3bc:	28f56063          	bltu	a0,a5,ffffffffc020b63c <vprintfmt+0x34e>
ffffffffc020b3c0:	2681                	sext.w	a3,a3
ffffffffc020b3c2:	8466                	mv	s0,s9
ffffffffc020b3c4:	002d179b          	slliw	a5,s10,0x2
ffffffffc020b3c8:	00144703          	lbu	a4,1(s0)
ffffffffc020b3cc:	01a787bb          	addw	a5,a5,s10
ffffffffc020b3d0:	0017979b          	slliw	a5,a5,0x1
ffffffffc020b3d4:	9fb5                	addw	a5,a5,a3
ffffffffc020b3d6:	fd07061b          	addiw	a2,a4,-48
ffffffffc020b3da:	0405                	addi	s0,s0,1
ffffffffc020b3dc:	fd078d1b          	addiw	s10,a5,-48
ffffffffc020b3e0:	0007069b          	sext.w	a3,a4
ffffffffc020b3e4:	fec570e3          	bgeu	a0,a2,ffffffffc020b3c4 <vprintfmt+0xd6>
ffffffffc020b3e8:	f60dd3e3          	bgez	s11,ffffffffc020b34e <vprintfmt+0x60>
ffffffffc020b3ec:	8dea                	mv	s11,s10
ffffffffc020b3ee:	5d7d                	li	s10,-1
ffffffffc020b3f0:	bfb9                	j	ffffffffc020b34e <vprintfmt+0x60>
ffffffffc020b3f2:	883a                	mv	a6,a4
ffffffffc020b3f4:	8466                	mv	s0,s9
ffffffffc020b3f6:	bfa1                	j	ffffffffc020b34e <vprintfmt+0x60>
ffffffffc020b3f8:	8466                	mv	s0,s9
ffffffffc020b3fa:	4c05                	li	s8,1
ffffffffc020b3fc:	bf89                	j	ffffffffc020b34e <vprintfmt+0x60>
ffffffffc020b3fe:	4785                	li	a5,1
ffffffffc020b400:	008a8613          	addi	a2,s5,8 # 1008 <_binary_bin_swap_img_size-0x6cf8>
ffffffffc020b404:	00b7c463          	blt	a5,a1,ffffffffc020b40c <vprintfmt+0x11e>
ffffffffc020b408:	1c058363          	beqz	a1,ffffffffc020b5ce <vprintfmt+0x2e0>
ffffffffc020b40c:	000ab683          	ld	a3,0(s5)
ffffffffc020b410:	4741                	li	a4,16
ffffffffc020b412:	8ab2                	mv	s5,a2
ffffffffc020b414:	2801                	sext.w	a6,a6
ffffffffc020b416:	87ee                	mv	a5,s11
ffffffffc020b418:	864a                	mv	a2,s2
ffffffffc020b41a:	85ce                	mv	a1,s3
ffffffffc020b41c:	8526                	mv	a0,s1
ffffffffc020b41e:	e47ff0ef          	jal	ffffffffc020b264 <printnum>
ffffffffc020b422:	b709                	j	ffffffffc020b324 <vprintfmt+0x36>
ffffffffc020b424:	000aa503          	lw	a0,0(s5)
ffffffffc020b428:	864e                	mv	a2,s3
ffffffffc020b42a:	85ca                	mv	a1,s2
ffffffffc020b42c:	9482                	jalr	s1
ffffffffc020b42e:	0aa1                	addi	s5,s5,8
ffffffffc020b430:	bdd5                	j	ffffffffc020b324 <vprintfmt+0x36>
ffffffffc020b432:	4785                	li	a5,1
ffffffffc020b434:	008a8613          	addi	a2,s5,8
ffffffffc020b438:	00b7c463          	blt	a5,a1,ffffffffc020b440 <vprintfmt+0x152>
ffffffffc020b43c:	18058463          	beqz	a1,ffffffffc020b5c4 <vprintfmt+0x2d6>
ffffffffc020b440:	000ab683          	ld	a3,0(s5)
ffffffffc020b444:	4729                	li	a4,10
ffffffffc020b446:	8ab2                	mv	s5,a2
ffffffffc020b448:	b7f1                	j	ffffffffc020b414 <vprintfmt+0x126>
ffffffffc020b44a:	864e                	mv	a2,s3
ffffffffc020b44c:	85ca                	mv	a1,s2
ffffffffc020b44e:	03000513          	li	a0,48
ffffffffc020b452:	e042                	sd	a6,0(sp)
ffffffffc020b454:	9482                	jalr	s1
ffffffffc020b456:	864e                	mv	a2,s3
ffffffffc020b458:	85ca                	mv	a1,s2
ffffffffc020b45a:	07800513          	li	a0,120
ffffffffc020b45e:	9482                	jalr	s1
ffffffffc020b460:	000ab683          	ld	a3,0(s5)
ffffffffc020b464:	6802                	ld	a6,0(sp)
ffffffffc020b466:	4741                	li	a4,16
ffffffffc020b468:	0aa1                	addi	s5,s5,8
ffffffffc020b46a:	b76d                	j	ffffffffc020b414 <vprintfmt+0x126>
ffffffffc020b46c:	864e                	mv	a2,s3
ffffffffc020b46e:	85ca                	mv	a1,s2
ffffffffc020b470:	02500513          	li	a0,37
ffffffffc020b474:	9482                	jalr	s1
ffffffffc020b476:	b57d                	j	ffffffffc020b324 <vprintfmt+0x36>
ffffffffc020b478:	000aad03          	lw	s10,0(s5)
ffffffffc020b47c:	8466                	mv	s0,s9
ffffffffc020b47e:	0aa1                	addi	s5,s5,8
ffffffffc020b480:	b7a5                	j	ffffffffc020b3e8 <vprintfmt+0xfa>
ffffffffc020b482:	4785                	li	a5,1
ffffffffc020b484:	008a8613          	addi	a2,s5,8
ffffffffc020b488:	00b7c463          	blt	a5,a1,ffffffffc020b490 <vprintfmt+0x1a2>
ffffffffc020b48c:	12058763          	beqz	a1,ffffffffc020b5ba <vprintfmt+0x2cc>
ffffffffc020b490:	000ab683          	ld	a3,0(s5)
ffffffffc020b494:	4721                	li	a4,8
ffffffffc020b496:	8ab2                	mv	s5,a2
ffffffffc020b498:	bfb5                	j	ffffffffc020b414 <vprintfmt+0x126>
ffffffffc020b49a:	87ee                	mv	a5,s11
ffffffffc020b49c:	000dd363          	bgez	s11,ffffffffc020b4a2 <vprintfmt+0x1b4>
ffffffffc020b4a0:	4781                	li	a5,0
ffffffffc020b4a2:	00078d9b          	sext.w	s11,a5
ffffffffc020b4a6:	8466                	mv	s0,s9
ffffffffc020b4a8:	b55d                	j	ffffffffc020b34e <vprintfmt+0x60>
ffffffffc020b4aa:	0008041b          	sext.w	s0,a6
ffffffffc020b4ae:	fd340793          	addi	a5,s0,-45
ffffffffc020b4b2:	01b02733          	sgtz	a4,s11
ffffffffc020b4b6:	00f037b3          	snez	a5,a5
ffffffffc020b4ba:	8ff9                	and	a5,a5,a4
ffffffffc020b4bc:	000ab703          	ld	a4,0(s5)
ffffffffc020b4c0:	008a8693          	addi	a3,s5,8
ffffffffc020b4c4:	e436                	sd	a3,8(sp)
ffffffffc020b4c6:	12070563          	beqz	a4,ffffffffc020b5f0 <vprintfmt+0x302>
ffffffffc020b4ca:	12079d63          	bnez	a5,ffffffffc020b604 <vprintfmt+0x316>
ffffffffc020b4ce:	00074783          	lbu	a5,0(a4)
ffffffffc020b4d2:	0007851b          	sext.w	a0,a5
ffffffffc020b4d6:	c78d                	beqz	a5,ffffffffc020b500 <vprintfmt+0x212>
ffffffffc020b4d8:	00170a93          	addi	s5,a4,1
ffffffffc020b4dc:	547d                	li	s0,-1
ffffffffc020b4de:	000d4563          	bltz	s10,ffffffffc020b4e8 <vprintfmt+0x1fa>
ffffffffc020b4e2:	3d7d                	addiw	s10,s10,-1
ffffffffc020b4e4:	008d0e63          	beq	s10,s0,ffffffffc020b500 <vprintfmt+0x212>
ffffffffc020b4e8:	020c1863          	bnez	s8,ffffffffc020b518 <vprintfmt+0x22a>
ffffffffc020b4ec:	864e                	mv	a2,s3
ffffffffc020b4ee:	85ca                	mv	a1,s2
ffffffffc020b4f0:	9482                	jalr	s1
ffffffffc020b4f2:	000ac783          	lbu	a5,0(s5)
ffffffffc020b4f6:	0a85                	addi	s5,s5,1
ffffffffc020b4f8:	3dfd                	addiw	s11,s11,-1
ffffffffc020b4fa:	0007851b          	sext.w	a0,a5
ffffffffc020b4fe:	f3e5                	bnez	a5,ffffffffc020b4de <vprintfmt+0x1f0>
ffffffffc020b500:	01b05a63          	blez	s11,ffffffffc020b514 <vprintfmt+0x226>
ffffffffc020b504:	864e                	mv	a2,s3
ffffffffc020b506:	85ca                	mv	a1,s2
ffffffffc020b508:	02000513          	li	a0,32
ffffffffc020b50c:	3dfd                	addiw	s11,s11,-1
ffffffffc020b50e:	9482                	jalr	s1
ffffffffc020b510:	fe0d9ae3          	bnez	s11,ffffffffc020b504 <vprintfmt+0x216>
ffffffffc020b514:	6aa2                	ld	s5,8(sp)
ffffffffc020b516:	b539                	j	ffffffffc020b324 <vprintfmt+0x36>
ffffffffc020b518:	3781                	addiw	a5,a5,-32
ffffffffc020b51a:	05e00713          	li	a4,94
ffffffffc020b51e:	fcf777e3          	bgeu	a4,a5,ffffffffc020b4ec <vprintfmt+0x1fe>
ffffffffc020b522:	03f00513          	li	a0,63
ffffffffc020b526:	864e                	mv	a2,s3
ffffffffc020b528:	85ca                	mv	a1,s2
ffffffffc020b52a:	9482                	jalr	s1
ffffffffc020b52c:	000ac783          	lbu	a5,0(s5)
ffffffffc020b530:	0a85                	addi	s5,s5,1
ffffffffc020b532:	3dfd                	addiw	s11,s11,-1
ffffffffc020b534:	0007851b          	sext.w	a0,a5
ffffffffc020b538:	d7e1                	beqz	a5,ffffffffc020b500 <vprintfmt+0x212>
ffffffffc020b53a:	fa0d54e3          	bgez	s10,ffffffffc020b4e2 <vprintfmt+0x1f4>
ffffffffc020b53e:	bfe9                	j	ffffffffc020b518 <vprintfmt+0x22a>
ffffffffc020b540:	000aa783          	lw	a5,0(s5)
ffffffffc020b544:	46e1                	li	a3,24
ffffffffc020b546:	0aa1                	addi	s5,s5,8
ffffffffc020b548:	41f7d71b          	sraiw	a4,a5,0x1f
ffffffffc020b54c:	8fb9                	xor	a5,a5,a4
ffffffffc020b54e:	40e7873b          	subw	a4,a5,a4
ffffffffc020b552:	02e6c663          	blt	a3,a4,ffffffffc020b57e <vprintfmt+0x290>
ffffffffc020b556:	00004797          	auipc	a5,0x4
ffffffffc020b55a:	4b278793          	addi	a5,a5,1202 # ffffffffc020fa08 <error_string>
ffffffffc020b55e:	00371693          	slli	a3,a4,0x3
ffffffffc020b562:	97b6                	add	a5,a5,a3
ffffffffc020b564:	639c                	ld	a5,0(a5)
ffffffffc020b566:	cf81                	beqz	a5,ffffffffc020b57e <vprintfmt+0x290>
ffffffffc020b568:	873e                	mv	a4,a5
ffffffffc020b56a:	00000697          	auipc	a3,0x0
ffffffffc020b56e:	2b668693          	addi	a3,a3,694 # ffffffffc020b820 <etext+0x2e>
ffffffffc020b572:	864a                	mv	a2,s2
ffffffffc020b574:	85ce                	mv	a1,s3
ffffffffc020b576:	8526                	mv	a0,s1
ffffffffc020b578:	0f2000ef          	jal	ffffffffc020b66a <printfmt>
ffffffffc020b57c:	b365                	j	ffffffffc020b324 <vprintfmt+0x36>
ffffffffc020b57e:	00003697          	auipc	a3,0x3
ffffffffc020b582:	6aa68693          	addi	a3,a3,1706 # ffffffffc020ec28 <etext+0x3436>
ffffffffc020b586:	864a                	mv	a2,s2
ffffffffc020b588:	85ce                	mv	a1,s3
ffffffffc020b58a:	8526                	mv	a0,s1
ffffffffc020b58c:	0de000ef          	jal	ffffffffc020b66a <printfmt>
ffffffffc020b590:	bb51                	j	ffffffffc020b324 <vprintfmt+0x36>
ffffffffc020b592:	4785                	li	a5,1
ffffffffc020b594:	008a8c13          	addi	s8,s5,8
ffffffffc020b598:	00b7c363          	blt	a5,a1,ffffffffc020b59e <vprintfmt+0x2b0>
ffffffffc020b59c:	cd81                	beqz	a1,ffffffffc020b5b4 <vprintfmt+0x2c6>
ffffffffc020b59e:	000ab403          	ld	s0,0(s5)
ffffffffc020b5a2:	02044b63          	bltz	s0,ffffffffc020b5d8 <vprintfmt+0x2ea>
ffffffffc020b5a6:	86a2                	mv	a3,s0
ffffffffc020b5a8:	8ae2                	mv	s5,s8
ffffffffc020b5aa:	4729                	li	a4,10
ffffffffc020b5ac:	b5a5                	j	ffffffffc020b414 <vprintfmt+0x126>
ffffffffc020b5ae:	2585                	addiw	a1,a1,1
ffffffffc020b5b0:	8466                	mv	s0,s9
ffffffffc020b5b2:	bb71                	j	ffffffffc020b34e <vprintfmt+0x60>
ffffffffc020b5b4:	000aa403          	lw	s0,0(s5)
ffffffffc020b5b8:	b7ed                	j	ffffffffc020b5a2 <vprintfmt+0x2b4>
ffffffffc020b5ba:	000ae683          	lwu	a3,0(s5)
ffffffffc020b5be:	4721                	li	a4,8
ffffffffc020b5c0:	8ab2                	mv	s5,a2
ffffffffc020b5c2:	bd89                	j	ffffffffc020b414 <vprintfmt+0x126>
ffffffffc020b5c4:	000ae683          	lwu	a3,0(s5)
ffffffffc020b5c8:	4729                	li	a4,10
ffffffffc020b5ca:	8ab2                	mv	s5,a2
ffffffffc020b5cc:	b5a1                	j	ffffffffc020b414 <vprintfmt+0x126>
ffffffffc020b5ce:	000ae683          	lwu	a3,0(s5)
ffffffffc020b5d2:	4741                	li	a4,16
ffffffffc020b5d4:	8ab2                	mv	s5,a2
ffffffffc020b5d6:	bd3d                	j	ffffffffc020b414 <vprintfmt+0x126>
ffffffffc020b5d8:	864e                	mv	a2,s3
ffffffffc020b5da:	85ca                	mv	a1,s2
ffffffffc020b5dc:	02d00513          	li	a0,45
ffffffffc020b5e0:	e042                	sd	a6,0(sp)
ffffffffc020b5e2:	9482                	jalr	s1
ffffffffc020b5e4:	6802                	ld	a6,0(sp)
ffffffffc020b5e6:	408006b3          	neg	a3,s0
ffffffffc020b5ea:	8ae2                	mv	s5,s8
ffffffffc020b5ec:	4729                	li	a4,10
ffffffffc020b5ee:	b51d                	j	ffffffffc020b414 <vprintfmt+0x126>
ffffffffc020b5f0:	eba1                	bnez	a5,ffffffffc020b640 <vprintfmt+0x352>
ffffffffc020b5f2:	02800793          	li	a5,40
ffffffffc020b5f6:	853e                	mv	a0,a5
ffffffffc020b5f8:	00003a97          	auipc	s5,0x3
ffffffffc020b5fc:	629a8a93          	addi	s5,s5,1577 # ffffffffc020ec21 <etext+0x342f>
ffffffffc020b600:	547d                	li	s0,-1
ffffffffc020b602:	bdf1                	j	ffffffffc020b4de <vprintfmt+0x1f0>
ffffffffc020b604:	853a                	mv	a0,a4
ffffffffc020b606:	85ea                	mv	a1,s10
ffffffffc020b608:	e03a                	sd	a4,0(sp)
ffffffffc020b60a:	0e4000ef          	jal	ffffffffc020b6ee <strnlen>
ffffffffc020b60e:	40ad8dbb          	subw	s11,s11,a0
ffffffffc020b612:	6702                	ld	a4,0(sp)
ffffffffc020b614:	01b05b63          	blez	s11,ffffffffc020b62a <vprintfmt+0x33c>
ffffffffc020b618:	864e                	mv	a2,s3
ffffffffc020b61a:	85ca                	mv	a1,s2
ffffffffc020b61c:	8522                	mv	a0,s0
ffffffffc020b61e:	e03a                	sd	a4,0(sp)
ffffffffc020b620:	3dfd                	addiw	s11,s11,-1
ffffffffc020b622:	9482                	jalr	s1
ffffffffc020b624:	6702                	ld	a4,0(sp)
ffffffffc020b626:	fe0d99e3          	bnez	s11,ffffffffc020b618 <vprintfmt+0x32a>
ffffffffc020b62a:	00074783          	lbu	a5,0(a4)
ffffffffc020b62e:	0007851b          	sext.w	a0,a5
ffffffffc020b632:	ee0781e3          	beqz	a5,ffffffffc020b514 <vprintfmt+0x226>
ffffffffc020b636:	00170a93          	addi	s5,a4,1
ffffffffc020b63a:	b54d                	j	ffffffffc020b4dc <vprintfmt+0x1ee>
ffffffffc020b63c:	8466                	mv	s0,s9
ffffffffc020b63e:	b36d                	j	ffffffffc020b3e8 <vprintfmt+0xfa>
ffffffffc020b640:	85ea                	mv	a1,s10
ffffffffc020b642:	00003517          	auipc	a0,0x3
ffffffffc020b646:	5de50513          	addi	a0,a0,1502 # ffffffffc020ec20 <etext+0x342e>
ffffffffc020b64a:	0a4000ef          	jal	ffffffffc020b6ee <strnlen>
ffffffffc020b64e:	40ad8dbb          	subw	s11,s11,a0
ffffffffc020b652:	02800793          	li	a5,40
ffffffffc020b656:	00003717          	auipc	a4,0x3
ffffffffc020b65a:	5ca70713          	addi	a4,a4,1482 # ffffffffc020ec20 <etext+0x342e>
ffffffffc020b65e:	853e                	mv	a0,a5
ffffffffc020b660:	fbb04ce3          	bgtz	s11,ffffffffc020b618 <vprintfmt+0x32a>
ffffffffc020b664:	00170a93          	addi	s5,a4,1
ffffffffc020b668:	bd95                	j	ffffffffc020b4dc <vprintfmt+0x1ee>

ffffffffc020b66a <printfmt>:
ffffffffc020b66a:	7139                	addi	sp,sp,-64
ffffffffc020b66c:	02010313          	addi	t1,sp,32
ffffffffc020b670:	f03a                	sd	a4,32(sp)
ffffffffc020b672:	871a                	mv	a4,t1
ffffffffc020b674:	ec06                	sd	ra,24(sp)
ffffffffc020b676:	f43e                	sd	a5,40(sp)
ffffffffc020b678:	f842                	sd	a6,48(sp)
ffffffffc020b67a:	fc46                	sd	a7,56(sp)
ffffffffc020b67c:	e41a                	sd	t1,8(sp)
ffffffffc020b67e:	c71ff0ef          	jal	ffffffffc020b2ee <vprintfmt>
ffffffffc020b682:	60e2                	ld	ra,24(sp)
ffffffffc020b684:	6121                	addi	sp,sp,64
ffffffffc020b686:	8082                	ret

ffffffffc020b688 <snprintf>:
ffffffffc020b688:	711d                	addi	sp,sp,-96
ffffffffc020b68a:	15fd                	addi	a1,a1,-1
ffffffffc020b68c:	95aa                	add	a1,a1,a0
ffffffffc020b68e:	03810313          	addi	t1,sp,56
ffffffffc020b692:	f406                	sd	ra,40(sp)
ffffffffc020b694:	e82e                	sd	a1,16(sp)
ffffffffc020b696:	e42a                	sd	a0,8(sp)
ffffffffc020b698:	fc36                	sd	a3,56(sp)
ffffffffc020b69a:	e0ba                	sd	a4,64(sp)
ffffffffc020b69c:	e4be                	sd	a5,72(sp)
ffffffffc020b69e:	e8c2                	sd	a6,80(sp)
ffffffffc020b6a0:	ecc6                	sd	a7,88(sp)
ffffffffc020b6a2:	cc02                	sw	zero,24(sp)
ffffffffc020b6a4:	e01a                	sd	t1,0(sp)
ffffffffc020b6a6:	c515                	beqz	a0,ffffffffc020b6d2 <snprintf+0x4a>
ffffffffc020b6a8:	02a5e563          	bltu	a1,a0,ffffffffc020b6d2 <snprintf+0x4a>
ffffffffc020b6ac:	75dd                	lui	a1,0xffff7
ffffffffc020b6ae:	86b2                	mv	a3,a2
ffffffffc020b6b0:	00000517          	auipc	a0,0x0
ffffffffc020b6b4:	c2450513          	addi	a0,a0,-988 # ffffffffc020b2d4 <sprintputch>
ffffffffc020b6b8:	871a                	mv	a4,t1
ffffffffc020b6ba:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc020b6be:	0030                	addi	a2,sp,8
ffffffffc020b6c0:	c2fff0ef          	jal	ffffffffc020b2ee <vprintfmt>
ffffffffc020b6c4:	67a2                	ld	a5,8(sp)
ffffffffc020b6c6:	00078023          	sb	zero,0(a5)
ffffffffc020b6ca:	4562                	lw	a0,24(sp)
ffffffffc020b6cc:	70a2                	ld	ra,40(sp)
ffffffffc020b6ce:	6125                	addi	sp,sp,96
ffffffffc020b6d0:	8082                	ret
ffffffffc020b6d2:	5575                	li	a0,-3
ffffffffc020b6d4:	bfe5                	j	ffffffffc020b6cc <snprintf+0x44>

ffffffffc020b6d6 <strlen>:
ffffffffc020b6d6:	00054783          	lbu	a5,0(a0)
ffffffffc020b6da:	cb81                	beqz	a5,ffffffffc020b6ea <strlen+0x14>
ffffffffc020b6dc:	4781                	li	a5,0
ffffffffc020b6de:	0785                	addi	a5,a5,1
ffffffffc020b6e0:	00f50733          	add	a4,a0,a5
ffffffffc020b6e4:	00074703          	lbu	a4,0(a4)
ffffffffc020b6e8:	fb7d                	bnez	a4,ffffffffc020b6de <strlen+0x8>
ffffffffc020b6ea:	853e                	mv	a0,a5
ffffffffc020b6ec:	8082                	ret

ffffffffc020b6ee <strnlen>:
ffffffffc020b6ee:	4781                	li	a5,0
ffffffffc020b6f0:	e589                	bnez	a1,ffffffffc020b6fa <strnlen+0xc>
ffffffffc020b6f2:	a811                	j	ffffffffc020b706 <strnlen+0x18>
ffffffffc020b6f4:	0785                	addi	a5,a5,1
ffffffffc020b6f6:	00f58863          	beq	a1,a5,ffffffffc020b706 <strnlen+0x18>
ffffffffc020b6fa:	00f50733          	add	a4,a0,a5
ffffffffc020b6fe:	00074703          	lbu	a4,0(a4)
ffffffffc020b702:	fb6d                	bnez	a4,ffffffffc020b6f4 <strnlen+0x6>
ffffffffc020b704:	85be                	mv	a1,a5
ffffffffc020b706:	852e                	mv	a0,a1
ffffffffc020b708:	8082                	ret

ffffffffc020b70a <strcpy>:
ffffffffc020b70a:	87aa                	mv	a5,a0
ffffffffc020b70c:	0005c703          	lbu	a4,0(a1)
ffffffffc020b710:	0585                	addi	a1,a1,1
ffffffffc020b712:	0785                	addi	a5,a5,1
ffffffffc020b714:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b718:	fb75                	bnez	a4,ffffffffc020b70c <strcpy+0x2>
ffffffffc020b71a:	8082                	ret

ffffffffc020b71c <strcmp>:
ffffffffc020b71c:	00054783          	lbu	a5,0(a0)
ffffffffc020b720:	e791                	bnez	a5,ffffffffc020b72c <strcmp+0x10>
ffffffffc020b722:	a01d                	j	ffffffffc020b748 <strcmp+0x2c>
ffffffffc020b724:	00054783          	lbu	a5,0(a0)
ffffffffc020b728:	cb99                	beqz	a5,ffffffffc020b73e <strcmp+0x22>
ffffffffc020b72a:	0585                	addi	a1,a1,1
ffffffffc020b72c:	0005c703          	lbu	a4,0(a1)
ffffffffc020b730:	0505                	addi	a0,a0,1
ffffffffc020b732:	fef709e3          	beq	a4,a5,ffffffffc020b724 <strcmp+0x8>
ffffffffc020b736:	0007851b          	sext.w	a0,a5
ffffffffc020b73a:	9d19                	subw	a0,a0,a4
ffffffffc020b73c:	8082                	ret
ffffffffc020b73e:	0015c703          	lbu	a4,1(a1)
ffffffffc020b742:	4501                	li	a0,0
ffffffffc020b744:	9d19                	subw	a0,a0,a4
ffffffffc020b746:	8082                	ret
ffffffffc020b748:	0005c703          	lbu	a4,0(a1)
ffffffffc020b74c:	4501                	li	a0,0
ffffffffc020b74e:	b7f5                	j	ffffffffc020b73a <strcmp+0x1e>

ffffffffc020b750 <strncmp>:
ffffffffc020b750:	ce01                	beqz	a2,ffffffffc020b768 <strncmp+0x18>
ffffffffc020b752:	00054783          	lbu	a5,0(a0)
ffffffffc020b756:	167d                	addi	a2,a2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc020b758:	cb91                	beqz	a5,ffffffffc020b76c <strncmp+0x1c>
ffffffffc020b75a:	0005c703          	lbu	a4,0(a1)
ffffffffc020b75e:	00f71763          	bne	a4,a5,ffffffffc020b76c <strncmp+0x1c>
ffffffffc020b762:	0505                	addi	a0,a0,1
ffffffffc020b764:	0585                	addi	a1,a1,1
ffffffffc020b766:	f675                	bnez	a2,ffffffffc020b752 <strncmp+0x2>
ffffffffc020b768:	4501                	li	a0,0
ffffffffc020b76a:	8082                	ret
ffffffffc020b76c:	00054503          	lbu	a0,0(a0)
ffffffffc020b770:	0005c783          	lbu	a5,0(a1)
ffffffffc020b774:	9d1d                	subw	a0,a0,a5
ffffffffc020b776:	8082                	ret

ffffffffc020b778 <strchr>:
ffffffffc020b778:	a021                	j	ffffffffc020b780 <strchr+0x8>
ffffffffc020b77a:	00f58763          	beq	a1,a5,ffffffffc020b788 <strchr+0x10>
ffffffffc020b77e:	0505                	addi	a0,a0,1
ffffffffc020b780:	00054783          	lbu	a5,0(a0)
ffffffffc020b784:	fbfd                	bnez	a5,ffffffffc020b77a <strchr+0x2>
ffffffffc020b786:	4501                	li	a0,0
ffffffffc020b788:	8082                	ret

ffffffffc020b78a <memset>:
ffffffffc020b78a:	ca01                	beqz	a2,ffffffffc020b79a <memset+0x10>
ffffffffc020b78c:	962a                	add	a2,a2,a0
ffffffffc020b78e:	87aa                	mv	a5,a0
ffffffffc020b790:	0785                	addi	a5,a5,1
ffffffffc020b792:	feb78fa3          	sb	a1,-1(a5)
ffffffffc020b796:	fef61de3          	bne	a2,a5,ffffffffc020b790 <memset+0x6>
ffffffffc020b79a:	8082                	ret

ffffffffc020b79c <memmove>:
ffffffffc020b79c:	02a5f163          	bgeu	a1,a0,ffffffffc020b7be <memmove+0x22>
ffffffffc020b7a0:	00c587b3          	add	a5,a1,a2
ffffffffc020b7a4:	00f57d63          	bgeu	a0,a5,ffffffffc020b7be <memmove+0x22>
ffffffffc020b7a8:	c61d                	beqz	a2,ffffffffc020b7d6 <memmove+0x3a>
ffffffffc020b7aa:	962a                	add	a2,a2,a0
ffffffffc020b7ac:	fff7c703          	lbu	a4,-1(a5)
ffffffffc020b7b0:	17fd                	addi	a5,a5,-1
ffffffffc020b7b2:	167d                	addi	a2,a2,-1
ffffffffc020b7b4:	00e60023          	sb	a4,0(a2)
ffffffffc020b7b8:	fef59ae3          	bne	a1,a5,ffffffffc020b7ac <memmove+0x10>
ffffffffc020b7bc:	8082                	ret
ffffffffc020b7be:	00c586b3          	add	a3,a1,a2
ffffffffc020b7c2:	87aa                	mv	a5,a0
ffffffffc020b7c4:	ca11                	beqz	a2,ffffffffc020b7d8 <memmove+0x3c>
ffffffffc020b7c6:	0005c703          	lbu	a4,0(a1)
ffffffffc020b7ca:	0585                	addi	a1,a1,1
ffffffffc020b7cc:	0785                	addi	a5,a5,1
ffffffffc020b7ce:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b7d2:	feb69ae3          	bne	a3,a1,ffffffffc020b7c6 <memmove+0x2a>
ffffffffc020b7d6:	8082                	ret
ffffffffc020b7d8:	8082                	ret

ffffffffc020b7da <memcpy>:
ffffffffc020b7da:	ca19                	beqz	a2,ffffffffc020b7f0 <memcpy+0x16>
ffffffffc020b7dc:	962e                	add	a2,a2,a1
ffffffffc020b7de:	87aa                	mv	a5,a0
ffffffffc020b7e0:	0005c703          	lbu	a4,0(a1)
ffffffffc020b7e4:	0585                	addi	a1,a1,1
ffffffffc020b7e6:	0785                	addi	a5,a5,1
ffffffffc020b7e8:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b7ec:	feb61ae3          	bne	a2,a1,ffffffffc020b7e0 <memcpy+0x6>
ffffffffc020b7f0:	8082                	ret
