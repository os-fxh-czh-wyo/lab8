
obj/__user_exit.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <open>:
  800020:	1582                	slli	a1,a1,0x20
  800022:	9181                	srli	a1,a1,0x20
  800024:	a285                	j	800184 <sys_open>

0000000000800026 <close>:
  800026:	a2a5                	j	80018e <sys_close>

0000000000800028 <dup2>:
  800028:	a2bd                	j	800196 <sys_dup>

000000000080002a <_start>:
  80002a:	1fe000ef          	jal	800228 <umain>
  80002e:	a001                	j	80002e <_start+0x4>

0000000000800030 <__panic>:
  800030:	715d                	addi	sp,sp,-80
  800032:	02810313          	addi	t1,sp,40
  800036:	e822                	sd	s0,16(sp)
  800038:	8432                	mv	s0,a2
  80003a:	862e                	mv	a2,a1
  80003c:	85aa                	mv	a1,a0
  80003e:	00000517          	auipc	a0,0x0
  800042:	79a50513          	addi	a0,a0,1946 # 8007d8 <main+0x116>
  800046:	ec06                	sd	ra,24(sp)
  800048:	f436                	sd	a3,40(sp)
  80004a:	f83a                	sd	a4,48(sp)
  80004c:	fc3e                	sd	a5,56(sp)
  80004e:	e0c2                	sd	a6,64(sp)
  800050:	e4c6                	sd	a7,72(sp)
  800052:	e41a                	sd	t1,8(sp)
  800054:	0a0000ef          	jal	8000f4 <cprintf>
  800058:	65a2                	ld	a1,8(sp)
  80005a:	8522                	mv	a0,s0
  80005c:	072000ef          	jal	8000ce <vcprintf>
  800060:	00000517          	auipc	a0,0x0
  800064:	79850513          	addi	a0,a0,1944 # 8007f8 <main+0x136>
  800068:	08c000ef          	jal	8000f4 <cprintf>
  80006c:	5559                	li	a0,-10
  80006e:	132000ef          	jal	8001a0 <exit>

0000000000800072 <__warn>:
  800072:	715d                	addi	sp,sp,-80
  800074:	e822                	sd	s0,16(sp)
  800076:	02810313          	addi	t1,sp,40
  80007a:	8432                	mv	s0,a2
  80007c:	862e                	mv	a2,a1
  80007e:	85aa                	mv	a1,a0
  800080:	00000517          	auipc	a0,0x0
  800084:	78050513          	addi	a0,a0,1920 # 800800 <main+0x13e>
  800088:	ec06                	sd	ra,24(sp)
  80008a:	f436                	sd	a3,40(sp)
  80008c:	f83a                	sd	a4,48(sp)
  80008e:	fc3e                	sd	a5,56(sp)
  800090:	e0c2                	sd	a6,64(sp)
  800092:	e4c6                	sd	a7,72(sp)
  800094:	e41a                	sd	t1,8(sp)
  800096:	05e000ef          	jal	8000f4 <cprintf>
  80009a:	65a2                	ld	a1,8(sp)
  80009c:	8522                	mv	a0,s0
  80009e:	030000ef          	jal	8000ce <vcprintf>
  8000a2:	00000517          	auipc	a0,0x0
  8000a6:	75650513          	addi	a0,a0,1878 # 8007f8 <main+0x136>
  8000aa:	04a000ef          	jal	8000f4 <cprintf>
  8000ae:	60e2                	ld	ra,24(sp)
  8000b0:	6442                	ld	s0,16(sp)
  8000b2:	6161                	addi	sp,sp,80
  8000b4:	8082                	ret

00000000008000b6 <cputch>:
  8000b6:	1101                	addi	sp,sp,-32
  8000b8:	ec06                	sd	ra,24(sp)
  8000ba:	e42e                	sd	a1,8(sp)
  8000bc:	0c2000ef          	jal	80017e <sys_putc>
  8000c0:	65a2                	ld	a1,8(sp)
  8000c2:	60e2                	ld	ra,24(sp)
  8000c4:	419c                	lw	a5,0(a1)
  8000c6:	2785                	addiw	a5,a5,1
  8000c8:	c19c                	sw	a5,0(a1)
  8000ca:	6105                	addi	sp,sp,32
  8000cc:	8082                	ret

00000000008000ce <vcprintf>:
  8000ce:	1101                	addi	sp,sp,-32
  8000d0:	872e                	mv	a4,a1
  8000d2:	75dd                	lui	a1,0xffff7
  8000d4:	86aa                	mv	a3,a0
  8000d6:	0070                	addi	a2,sp,12
  8000d8:	00000517          	auipc	a0,0x0
  8000dc:	fde50513          	addi	a0,a0,-34 # 8000b6 <cputch>
  8000e0:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <magic+0xffffffffff7f5ad9>
  8000e4:	ec06                	sd	ra,24(sp)
  8000e6:	c602                	sw	zero,12(sp)
  8000e8:	224000ef          	jal	80030c <vprintfmt>
  8000ec:	60e2                	ld	ra,24(sp)
  8000ee:	4532                	lw	a0,12(sp)
  8000f0:	6105                	addi	sp,sp,32
  8000f2:	8082                	ret

00000000008000f4 <cprintf>:
  8000f4:	711d                	addi	sp,sp,-96
  8000f6:	02810313          	addi	t1,sp,40
  8000fa:	f42e                	sd	a1,40(sp)
  8000fc:	75dd                	lui	a1,0xffff7
  8000fe:	f832                	sd	a2,48(sp)
  800100:	fc36                	sd	a3,56(sp)
  800102:	e0ba                	sd	a4,64(sp)
  800104:	86aa                	mv	a3,a0
  800106:	0050                	addi	a2,sp,4
  800108:	00000517          	auipc	a0,0x0
  80010c:	fae50513          	addi	a0,a0,-82 # 8000b6 <cputch>
  800110:	871a                	mv	a4,t1
  800112:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <magic+0xffffffffff7f5ad9>
  800116:	ec06                	sd	ra,24(sp)
  800118:	e4be                	sd	a5,72(sp)
  80011a:	e8c2                	sd	a6,80(sp)
  80011c:	ecc6                	sd	a7,88(sp)
  80011e:	c202                	sw	zero,4(sp)
  800120:	e41a                	sd	t1,8(sp)
  800122:	1ea000ef          	jal	80030c <vprintfmt>
  800126:	60e2                	ld	ra,24(sp)
  800128:	4512                	lw	a0,4(sp)
  80012a:	6125                	addi	sp,sp,96
  80012c:	8082                	ret

000000000080012e <syscall>:
  80012e:	7175                	addi	sp,sp,-144
  800130:	08010313          	addi	t1,sp,128
  800134:	e42a                	sd	a0,8(sp)
  800136:	ecae                	sd	a1,88(sp)
  800138:	f42e                	sd	a1,40(sp)
  80013a:	f0b2                	sd	a2,96(sp)
  80013c:	f832                	sd	a2,48(sp)
  80013e:	f4b6                	sd	a3,104(sp)
  800140:	fc36                	sd	a3,56(sp)
  800142:	f8ba                	sd	a4,112(sp)
  800144:	e0ba                	sd	a4,64(sp)
  800146:	fcbe                	sd	a5,120(sp)
  800148:	e4be                	sd	a5,72(sp)
  80014a:	e142                	sd	a6,128(sp)
  80014c:	e546                	sd	a7,136(sp)
  80014e:	f01a                	sd	t1,32(sp)
  800150:	4522                	lw	a0,8(sp)
  800152:	55a2                	lw	a1,40(sp)
  800154:	5642                	lw	a2,48(sp)
  800156:	56e2                	lw	a3,56(sp)
  800158:	4706                	lw	a4,64(sp)
  80015a:	47a6                	lw	a5,72(sp)
  80015c:	00000073          	ecall
  800160:	ce2a                	sw	a0,28(sp)
  800162:	4572                	lw	a0,28(sp)
  800164:	6149                	addi	sp,sp,144
  800166:	8082                	ret

0000000000800168 <sys_exit>:
  800168:	85aa                	mv	a1,a0
  80016a:	4505                	li	a0,1
  80016c:	b7c9                	j	80012e <syscall>

000000000080016e <sys_fork>:
  80016e:	4509                	li	a0,2
  800170:	bf7d                	j	80012e <syscall>

0000000000800172 <sys_wait>:
  800172:	862e                	mv	a2,a1
  800174:	85aa                	mv	a1,a0
  800176:	450d                	li	a0,3
  800178:	bf5d                	j	80012e <syscall>

000000000080017a <sys_yield>:
  80017a:	4529                	li	a0,10
  80017c:	bf4d                	j	80012e <syscall>

000000000080017e <sys_putc>:
  80017e:	85aa                	mv	a1,a0
  800180:	4579                	li	a0,30
  800182:	b775                	j	80012e <syscall>

0000000000800184 <sys_open>:
  800184:	862e                	mv	a2,a1
  800186:	85aa                	mv	a1,a0
  800188:	06400513          	li	a0,100
  80018c:	b74d                	j	80012e <syscall>

000000000080018e <sys_close>:
  80018e:	85aa                	mv	a1,a0
  800190:	06500513          	li	a0,101
  800194:	bf69                	j	80012e <syscall>

0000000000800196 <sys_dup>:
  800196:	862e                	mv	a2,a1
  800198:	85aa                	mv	a1,a0
  80019a:	08200513          	li	a0,130
  80019e:	bf41                	j	80012e <syscall>

00000000008001a0 <exit>:
  8001a0:	1141                	addi	sp,sp,-16
  8001a2:	e406                	sd	ra,8(sp)
  8001a4:	fc5ff0ef          	jal	800168 <sys_exit>
  8001a8:	00000517          	auipc	a0,0x0
  8001ac:	67850513          	addi	a0,a0,1656 # 800820 <main+0x15e>
  8001b0:	f45ff0ef          	jal	8000f4 <cprintf>
  8001b4:	a001                	j	8001b4 <exit+0x14>

00000000008001b6 <fork>:
  8001b6:	bf65                	j	80016e <sys_fork>

00000000008001b8 <wait>:
  8001b8:	4581                	li	a1,0
  8001ba:	4501                	li	a0,0
  8001bc:	bf5d                	j	800172 <sys_wait>

00000000008001be <waitpid>:
  8001be:	7179                	addi	sp,sp,-48
  8001c0:	f406                	sd	ra,40(sp)
  8001c2:	ec02                	sd	zero,24(sp)
  8001c4:	c999                	beqz	a1,8001da <waitpid+0x1c>
  8001c6:	e42e                	sd	a1,8(sp)
  8001c8:	082c                	addi	a1,sp,24
  8001ca:	fa9ff0ef          	jal	800172 <sys_wait>
  8001ce:	6762                	ld	a4,24(sp)
  8001d0:	67a2                	ld	a5,8(sp)
  8001d2:	70a2                	ld	ra,40(sp)
  8001d4:	c398                	sw	a4,0(a5)
  8001d6:	6145                	addi	sp,sp,48
  8001d8:	8082                	ret
  8001da:	f99ff0ef          	jal	800172 <sys_wait>
  8001de:	70a2                	ld	ra,40(sp)
  8001e0:	6145                	addi	sp,sp,48
  8001e2:	8082                	ret

00000000008001e4 <yield>:
  8001e4:	bf59                	j	80017a <sys_yield>

00000000008001e6 <initfd>:
  8001e6:	87ae                	mv	a5,a1
  8001e8:	1101                	addi	sp,sp,-32
  8001ea:	e822                	sd	s0,16(sp)
  8001ec:	85b2                	mv	a1,a2
  8001ee:	842a                	mv	s0,a0
  8001f0:	853e                	mv	a0,a5
  8001f2:	ec06                	sd	ra,24(sp)
  8001f4:	e2dff0ef          	jal	800020 <open>
  8001f8:	87aa                	mv	a5,a0
  8001fa:	00054463          	bltz	a0,800202 <initfd+0x1c>
  8001fe:	00851763          	bne	a0,s0,80020c <initfd+0x26>
  800202:	60e2                	ld	ra,24(sp)
  800204:	6442                	ld	s0,16(sp)
  800206:	853e                	mv	a0,a5
  800208:	6105                	addi	sp,sp,32
  80020a:	8082                	ret
  80020c:	e42a                	sd	a0,8(sp)
  80020e:	8522                	mv	a0,s0
  800210:	e17ff0ef          	jal	800026 <close>
  800214:	6522                	ld	a0,8(sp)
  800216:	85a2                	mv	a1,s0
  800218:	e11ff0ef          	jal	800028 <dup2>
  80021c:	842a                	mv	s0,a0
  80021e:	6522                	ld	a0,8(sp)
  800220:	e07ff0ef          	jal	800026 <close>
  800224:	87a2                	mv	a5,s0
  800226:	bff1                	j	800202 <initfd+0x1c>

0000000000800228 <umain>:
  800228:	1101                	addi	sp,sp,-32
  80022a:	e822                	sd	s0,16(sp)
  80022c:	e426                	sd	s1,8(sp)
  80022e:	842a                	mv	s0,a0
  800230:	84ae                	mv	s1,a1
  800232:	4601                	li	a2,0
  800234:	00000597          	auipc	a1,0x0
  800238:	60458593          	addi	a1,a1,1540 # 800838 <main+0x176>
  80023c:	4501                	li	a0,0
  80023e:	ec06                	sd	ra,24(sp)
  800240:	fa7ff0ef          	jal	8001e6 <initfd>
  800244:	02054263          	bltz	a0,800268 <umain+0x40>
  800248:	4605                	li	a2,1
  80024a:	8532                	mv	a0,a2
  80024c:	00000597          	auipc	a1,0x0
  800250:	62c58593          	addi	a1,a1,1580 # 800878 <main+0x1b6>
  800254:	f93ff0ef          	jal	8001e6 <initfd>
  800258:	02054563          	bltz	a0,800282 <umain+0x5a>
  80025c:	85a6                	mv	a1,s1
  80025e:	8522                	mv	a0,s0
  800260:	462000ef          	jal	8006c2 <main>
  800264:	f3dff0ef          	jal	8001a0 <exit>
  800268:	86aa                	mv	a3,a0
  80026a:	00000617          	auipc	a2,0x0
  80026e:	5d660613          	addi	a2,a2,1494 # 800840 <main+0x17e>
  800272:	45e9                	li	a1,26
  800274:	00000517          	auipc	a0,0x0
  800278:	5ec50513          	addi	a0,a0,1516 # 800860 <main+0x19e>
  80027c:	df7ff0ef          	jal	800072 <__warn>
  800280:	b7e1                	j	800248 <umain+0x20>
  800282:	86aa                	mv	a3,a0
  800284:	00000617          	auipc	a2,0x0
  800288:	5fc60613          	addi	a2,a2,1532 # 800880 <main+0x1be>
  80028c:	45f5                	li	a1,29
  80028e:	00000517          	auipc	a0,0x0
  800292:	5d250513          	addi	a0,a0,1490 # 800860 <main+0x19e>
  800296:	dddff0ef          	jal	800072 <__warn>
  80029a:	b7c9                	j	80025c <umain+0x34>

000000000080029c <printnum>:
  80029c:	7139                	addi	sp,sp,-64
  80029e:	02071893          	slli	a7,a4,0x20
  8002a2:	f822                	sd	s0,48(sp)
  8002a4:	f426                	sd	s1,40(sp)
  8002a6:	f04a                	sd	s2,32(sp)
  8002a8:	ec4e                	sd	s3,24(sp)
  8002aa:	e456                	sd	s5,8(sp)
  8002ac:	0208d893          	srli	a7,a7,0x20
  8002b0:	fc06                	sd	ra,56(sp)
  8002b2:	0316fab3          	remu	s5,a3,a7
  8002b6:	fff7841b          	addiw	s0,a5,-1
  8002ba:	84aa                	mv	s1,a0
  8002bc:	89ae                	mv	s3,a1
  8002be:	8932                	mv	s2,a2
  8002c0:	0516f063          	bgeu	a3,a7,800300 <printnum+0x64>
  8002c4:	e852                	sd	s4,16(sp)
  8002c6:	4705                	li	a4,1
  8002c8:	8a42                	mv	s4,a6
  8002ca:	00f75863          	bge	a4,a5,8002da <printnum+0x3e>
  8002ce:	864e                	mv	a2,s3
  8002d0:	85ca                	mv	a1,s2
  8002d2:	8552                	mv	a0,s4
  8002d4:	347d                	addiw	s0,s0,-1
  8002d6:	9482                	jalr	s1
  8002d8:	f87d                	bnez	s0,8002ce <printnum+0x32>
  8002da:	6a42                	ld	s4,16(sp)
  8002dc:	00000797          	auipc	a5,0x0
  8002e0:	5c478793          	addi	a5,a5,1476 # 8008a0 <main+0x1de>
  8002e4:	97d6                	add	a5,a5,s5
  8002e6:	7442                	ld	s0,48(sp)
  8002e8:	0007c503          	lbu	a0,0(a5)
  8002ec:	70e2                	ld	ra,56(sp)
  8002ee:	6aa2                	ld	s5,8(sp)
  8002f0:	864e                	mv	a2,s3
  8002f2:	85ca                	mv	a1,s2
  8002f4:	69e2                	ld	s3,24(sp)
  8002f6:	7902                	ld	s2,32(sp)
  8002f8:	87a6                	mv	a5,s1
  8002fa:	74a2                	ld	s1,40(sp)
  8002fc:	6121                	addi	sp,sp,64
  8002fe:	8782                	jr	a5
  800300:	0316d6b3          	divu	a3,a3,a7
  800304:	87a2                	mv	a5,s0
  800306:	f97ff0ef          	jal	80029c <printnum>
  80030a:	bfc9                	j	8002dc <printnum+0x40>

000000000080030c <vprintfmt>:
  80030c:	7119                	addi	sp,sp,-128
  80030e:	f4a6                	sd	s1,104(sp)
  800310:	f0ca                	sd	s2,96(sp)
  800312:	ecce                	sd	s3,88(sp)
  800314:	e8d2                	sd	s4,80(sp)
  800316:	e4d6                	sd	s5,72(sp)
  800318:	e0da                	sd	s6,64(sp)
  80031a:	fc5e                	sd	s7,56(sp)
  80031c:	f466                	sd	s9,40(sp)
  80031e:	fc86                	sd	ra,120(sp)
  800320:	f8a2                	sd	s0,112(sp)
  800322:	f862                	sd	s8,48(sp)
  800324:	f06a                	sd	s10,32(sp)
  800326:	ec6e                	sd	s11,24(sp)
  800328:	84aa                	mv	s1,a0
  80032a:	8cb6                	mv	s9,a3
  80032c:	8aba                	mv	s5,a4
  80032e:	89ae                	mv	s3,a1
  800330:	8932                	mv	s2,a2
  800332:	02500a13          	li	s4,37
  800336:	05500b93          	li	s7,85
  80033a:	00001b17          	auipc	s6,0x1
  80033e:	8a2b0b13          	addi	s6,s6,-1886 # 800bdc <main+0x51a>
  800342:	000cc503          	lbu	a0,0(s9)
  800346:	001c8413          	addi	s0,s9,1
  80034a:	01450b63          	beq	a0,s4,800360 <vprintfmt+0x54>
  80034e:	cd15                	beqz	a0,80038a <vprintfmt+0x7e>
  800350:	864e                	mv	a2,s3
  800352:	85ca                	mv	a1,s2
  800354:	9482                	jalr	s1
  800356:	00044503          	lbu	a0,0(s0)
  80035a:	0405                	addi	s0,s0,1
  80035c:	ff4519e3          	bne	a0,s4,80034e <vprintfmt+0x42>
  800360:	5d7d                	li	s10,-1
  800362:	8dea                	mv	s11,s10
  800364:	02000813          	li	a6,32
  800368:	4c01                	li	s8,0
  80036a:	4581                	li	a1,0
  80036c:	00044703          	lbu	a4,0(s0)
  800370:	00140c93          	addi	s9,s0,1
  800374:	fdd7061b          	addiw	a2,a4,-35
  800378:	0ff67613          	zext.b	a2,a2
  80037c:	02cbe663          	bltu	s7,a2,8003a8 <vprintfmt+0x9c>
  800380:	060a                	slli	a2,a2,0x2
  800382:	965a                	add	a2,a2,s6
  800384:	421c                	lw	a5,0(a2)
  800386:	97da                	add	a5,a5,s6
  800388:	8782                	jr	a5
  80038a:	70e6                	ld	ra,120(sp)
  80038c:	7446                	ld	s0,112(sp)
  80038e:	74a6                	ld	s1,104(sp)
  800390:	7906                	ld	s2,96(sp)
  800392:	69e6                	ld	s3,88(sp)
  800394:	6a46                	ld	s4,80(sp)
  800396:	6aa6                	ld	s5,72(sp)
  800398:	6b06                	ld	s6,64(sp)
  80039a:	7be2                	ld	s7,56(sp)
  80039c:	7c42                	ld	s8,48(sp)
  80039e:	7ca2                	ld	s9,40(sp)
  8003a0:	7d02                	ld	s10,32(sp)
  8003a2:	6de2                	ld	s11,24(sp)
  8003a4:	6109                	addi	sp,sp,128
  8003a6:	8082                	ret
  8003a8:	864e                	mv	a2,s3
  8003aa:	85ca                	mv	a1,s2
  8003ac:	02500513          	li	a0,37
  8003b0:	9482                	jalr	s1
  8003b2:	fff44783          	lbu	a5,-1(s0)
  8003b6:	02500713          	li	a4,37
  8003ba:	8ca2                	mv	s9,s0
  8003bc:	f8e783e3          	beq	a5,a4,800342 <vprintfmt+0x36>
  8003c0:	ffecc783          	lbu	a5,-2(s9)
  8003c4:	1cfd                	addi	s9,s9,-1
  8003c6:	fee79de3          	bne	a5,a4,8003c0 <vprintfmt+0xb4>
  8003ca:	bfa5                	j	800342 <vprintfmt+0x36>
  8003cc:	00144683          	lbu	a3,1(s0)
  8003d0:	4525                	li	a0,9
  8003d2:	fd070d1b          	addiw	s10,a4,-48
  8003d6:	fd06879b          	addiw	a5,a3,-48
  8003da:	28f56063          	bltu	a0,a5,80065a <vprintfmt+0x34e>
  8003de:	2681                	sext.w	a3,a3
  8003e0:	8466                	mv	s0,s9
  8003e2:	002d179b          	slliw	a5,s10,0x2
  8003e6:	00144703          	lbu	a4,1(s0)
  8003ea:	01a787bb          	addw	a5,a5,s10
  8003ee:	0017979b          	slliw	a5,a5,0x1
  8003f2:	9fb5                	addw	a5,a5,a3
  8003f4:	fd07061b          	addiw	a2,a4,-48
  8003f8:	0405                	addi	s0,s0,1
  8003fa:	fd078d1b          	addiw	s10,a5,-48
  8003fe:	0007069b          	sext.w	a3,a4
  800402:	fec570e3          	bgeu	a0,a2,8003e2 <vprintfmt+0xd6>
  800406:	f60dd3e3          	bgez	s11,80036c <vprintfmt+0x60>
  80040a:	8dea                	mv	s11,s10
  80040c:	5d7d                	li	s10,-1
  80040e:	bfb9                	j	80036c <vprintfmt+0x60>
  800410:	883a                	mv	a6,a4
  800412:	8466                	mv	s0,s9
  800414:	bfa1                	j	80036c <vprintfmt+0x60>
  800416:	8466                	mv	s0,s9
  800418:	4c05                	li	s8,1
  80041a:	bf89                	j	80036c <vprintfmt+0x60>
  80041c:	4785                	li	a5,1
  80041e:	008a8613          	addi	a2,s5,8
  800422:	00b7c463          	blt	a5,a1,80042a <vprintfmt+0x11e>
  800426:	1c058363          	beqz	a1,8005ec <vprintfmt+0x2e0>
  80042a:	000ab683          	ld	a3,0(s5)
  80042e:	4741                	li	a4,16
  800430:	8ab2                	mv	s5,a2
  800432:	2801                	sext.w	a6,a6
  800434:	87ee                	mv	a5,s11
  800436:	864a                	mv	a2,s2
  800438:	85ce                	mv	a1,s3
  80043a:	8526                	mv	a0,s1
  80043c:	e61ff0ef          	jal	80029c <printnum>
  800440:	b709                	j	800342 <vprintfmt+0x36>
  800442:	000aa503          	lw	a0,0(s5)
  800446:	864e                	mv	a2,s3
  800448:	85ca                	mv	a1,s2
  80044a:	9482                	jalr	s1
  80044c:	0aa1                	addi	s5,s5,8
  80044e:	bdd5                	j	800342 <vprintfmt+0x36>
  800450:	4785                	li	a5,1
  800452:	008a8613          	addi	a2,s5,8
  800456:	00b7c463          	blt	a5,a1,80045e <vprintfmt+0x152>
  80045a:	18058463          	beqz	a1,8005e2 <vprintfmt+0x2d6>
  80045e:	000ab683          	ld	a3,0(s5)
  800462:	4729                	li	a4,10
  800464:	8ab2                	mv	s5,a2
  800466:	b7f1                	j	800432 <vprintfmt+0x126>
  800468:	864e                	mv	a2,s3
  80046a:	85ca                	mv	a1,s2
  80046c:	03000513          	li	a0,48
  800470:	e042                	sd	a6,0(sp)
  800472:	9482                	jalr	s1
  800474:	864e                	mv	a2,s3
  800476:	85ca                	mv	a1,s2
  800478:	07800513          	li	a0,120
  80047c:	9482                	jalr	s1
  80047e:	000ab683          	ld	a3,0(s5)
  800482:	6802                	ld	a6,0(sp)
  800484:	4741                	li	a4,16
  800486:	0aa1                	addi	s5,s5,8
  800488:	b76d                	j	800432 <vprintfmt+0x126>
  80048a:	864e                	mv	a2,s3
  80048c:	85ca                	mv	a1,s2
  80048e:	02500513          	li	a0,37
  800492:	9482                	jalr	s1
  800494:	b57d                	j	800342 <vprintfmt+0x36>
  800496:	000aad03          	lw	s10,0(s5)
  80049a:	8466                	mv	s0,s9
  80049c:	0aa1                	addi	s5,s5,8
  80049e:	b7a5                	j	800406 <vprintfmt+0xfa>
  8004a0:	4785                	li	a5,1
  8004a2:	008a8613          	addi	a2,s5,8
  8004a6:	00b7c463          	blt	a5,a1,8004ae <vprintfmt+0x1a2>
  8004aa:	12058763          	beqz	a1,8005d8 <vprintfmt+0x2cc>
  8004ae:	000ab683          	ld	a3,0(s5)
  8004b2:	4721                	li	a4,8
  8004b4:	8ab2                	mv	s5,a2
  8004b6:	bfb5                	j	800432 <vprintfmt+0x126>
  8004b8:	87ee                	mv	a5,s11
  8004ba:	000dd363          	bgez	s11,8004c0 <vprintfmt+0x1b4>
  8004be:	4781                	li	a5,0
  8004c0:	00078d9b          	sext.w	s11,a5
  8004c4:	8466                	mv	s0,s9
  8004c6:	b55d                	j	80036c <vprintfmt+0x60>
  8004c8:	0008041b          	sext.w	s0,a6
  8004cc:	fd340793          	addi	a5,s0,-45
  8004d0:	01b02733          	sgtz	a4,s11
  8004d4:	00f037b3          	snez	a5,a5
  8004d8:	8ff9                	and	a5,a5,a4
  8004da:	000ab703          	ld	a4,0(s5)
  8004de:	008a8693          	addi	a3,s5,8
  8004e2:	e436                	sd	a3,8(sp)
  8004e4:	12070563          	beqz	a4,80060e <vprintfmt+0x302>
  8004e8:	12079d63          	bnez	a5,800622 <vprintfmt+0x316>
  8004ec:	00074783          	lbu	a5,0(a4)
  8004f0:	0007851b          	sext.w	a0,a5
  8004f4:	c78d                	beqz	a5,80051e <vprintfmt+0x212>
  8004f6:	00170a93          	addi	s5,a4,1
  8004fa:	547d                	li	s0,-1
  8004fc:	000d4563          	bltz	s10,800506 <vprintfmt+0x1fa>
  800500:	3d7d                	addiw	s10,s10,-1
  800502:	008d0e63          	beq	s10,s0,80051e <vprintfmt+0x212>
  800506:	020c1863          	bnez	s8,800536 <vprintfmt+0x22a>
  80050a:	864e                	mv	a2,s3
  80050c:	85ca                	mv	a1,s2
  80050e:	9482                	jalr	s1
  800510:	000ac783          	lbu	a5,0(s5)
  800514:	0a85                	addi	s5,s5,1
  800516:	3dfd                	addiw	s11,s11,-1
  800518:	0007851b          	sext.w	a0,a5
  80051c:	f3e5                	bnez	a5,8004fc <vprintfmt+0x1f0>
  80051e:	01b05a63          	blez	s11,800532 <vprintfmt+0x226>
  800522:	864e                	mv	a2,s3
  800524:	85ca                	mv	a1,s2
  800526:	02000513          	li	a0,32
  80052a:	3dfd                	addiw	s11,s11,-1
  80052c:	9482                	jalr	s1
  80052e:	fe0d9ae3          	bnez	s11,800522 <vprintfmt+0x216>
  800532:	6aa2                	ld	s5,8(sp)
  800534:	b539                	j	800342 <vprintfmt+0x36>
  800536:	3781                	addiw	a5,a5,-32
  800538:	05e00713          	li	a4,94
  80053c:	fcf777e3          	bgeu	a4,a5,80050a <vprintfmt+0x1fe>
  800540:	03f00513          	li	a0,63
  800544:	864e                	mv	a2,s3
  800546:	85ca                	mv	a1,s2
  800548:	9482                	jalr	s1
  80054a:	000ac783          	lbu	a5,0(s5)
  80054e:	0a85                	addi	s5,s5,1
  800550:	3dfd                	addiw	s11,s11,-1
  800552:	0007851b          	sext.w	a0,a5
  800556:	d7e1                	beqz	a5,80051e <vprintfmt+0x212>
  800558:	fa0d54e3          	bgez	s10,800500 <vprintfmt+0x1f4>
  80055c:	bfe9                	j	800536 <vprintfmt+0x22a>
  80055e:	000aa783          	lw	a5,0(s5)
  800562:	46e1                	li	a3,24
  800564:	0aa1                	addi	s5,s5,8
  800566:	41f7d71b          	sraiw	a4,a5,0x1f
  80056a:	8fb9                	xor	a5,a5,a4
  80056c:	40e7873b          	subw	a4,a5,a4
  800570:	02e6c663          	blt	a3,a4,80059c <vprintfmt+0x290>
  800574:	00000797          	auipc	a5,0x0
  800578:	7c478793          	addi	a5,a5,1988 # 800d38 <error_string>
  80057c:	00371693          	slli	a3,a4,0x3
  800580:	97b6                	add	a5,a5,a3
  800582:	639c                	ld	a5,0(a5)
  800584:	cf81                	beqz	a5,80059c <vprintfmt+0x290>
  800586:	873e                	mv	a4,a5
  800588:	00000697          	auipc	a3,0x0
  80058c:	34868693          	addi	a3,a3,840 # 8008d0 <main+0x20e>
  800590:	864a                	mv	a2,s2
  800592:	85ce                	mv	a1,s3
  800594:	8526                	mv	a0,s1
  800596:	0f2000ef          	jal	800688 <printfmt>
  80059a:	b365                	j	800342 <vprintfmt+0x36>
  80059c:	00000697          	auipc	a3,0x0
  8005a0:	32468693          	addi	a3,a3,804 # 8008c0 <main+0x1fe>
  8005a4:	864a                	mv	a2,s2
  8005a6:	85ce                	mv	a1,s3
  8005a8:	8526                	mv	a0,s1
  8005aa:	0de000ef          	jal	800688 <printfmt>
  8005ae:	bb51                	j	800342 <vprintfmt+0x36>
  8005b0:	4785                	li	a5,1
  8005b2:	008a8c13          	addi	s8,s5,8
  8005b6:	00b7c363          	blt	a5,a1,8005bc <vprintfmt+0x2b0>
  8005ba:	cd81                	beqz	a1,8005d2 <vprintfmt+0x2c6>
  8005bc:	000ab403          	ld	s0,0(s5)
  8005c0:	02044b63          	bltz	s0,8005f6 <vprintfmt+0x2ea>
  8005c4:	86a2                	mv	a3,s0
  8005c6:	8ae2                	mv	s5,s8
  8005c8:	4729                	li	a4,10
  8005ca:	b5a5                	j	800432 <vprintfmt+0x126>
  8005cc:	2585                	addiw	a1,a1,1
  8005ce:	8466                	mv	s0,s9
  8005d0:	bb71                	j	80036c <vprintfmt+0x60>
  8005d2:	000aa403          	lw	s0,0(s5)
  8005d6:	b7ed                	j	8005c0 <vprintfmt+0x2b4>
  8005d8:	000ae683          	lwu	a3,0(s5)
  8005dc:	4721                	li	a4,8
  8005de:	8ab2                	mv	s5,a2
  8005e0:	bd89                	j	800432 <vprintfmt+0x126>
  8005e2:	000ae683          	lwu	a3,0(s5)
  8005e6:	4729                	li	a4,10
  8005e8:	8ab2                	mv	s5,a2
  8005ea:	b5a1                	j	800432 <vprintfmt+0x126>
  8005ec:	000ae683          	lwu	a3,0(s5)
  8005f0:	4741                	li	a4,16
  8005f2:	8ab2                	mv	s5,a2
  8005f4:	bd3d                	j	800432 <vprintfmt+0x126>
  8005f6:	864e                	mv	a2,s3
  8005f8:	85ca                	mv	a1,s2
  8005fa:	02d00513          	li	a0,45
  8005fe:	e042                	sd	a6,0(sp)
  800600:	9482                	jalr	s1
  800602:	6802                	ld	a6,0(sp)
  800604:	408006b3          	neg	a3,s0
  800608:	8ae2                	mv	s5,s8
  80060a:	4729                	li	a4,10
  80060c:	b51d                	j	800432 <vprintfmt+0x126>
  80060e:	eba1                	bnez	a5,80065e <vprintfmt+0x352>
  800610:	02800793          	li	a5,40
  800614:	853e                	mv	a0,a5
  800616:	00000a97          	auipc	s5,0x0
  80061a:	2a3a8a93          	addi	s5,s5,675 # 8008b9 <main+0x1f7>
  80061e:	547d                	li	s0,-1
  800620:	bdf1                	j	8004fc <vprintfmt+0x1f0>
  800622:	853a                	mv	a0,a4
  800624:	85ea                	mv	a1,s10
  800626:	e03a                	sd	a4,0(sp)
  800628:	07e000ef          	jal	8006a6 <strnlen>
  80062c:	40ad8dbb          	subw	s11,s11,a0
  800630:	6702                	ld	a4,0(sp)
  800632:	01b05b63          	blez	s11,800648 <vprintfmt+0x33c>
  800636:	864e                	mv	a2,s3
  800638:	85ca                	mv	a1,s2
  80063a:	8522                	mv	a0,s0
  80063c:	e03a                	sd	a4,0(sp)
  80063e:	3dfd                	addiw	s11,s11,-1
  800640:	9482                	jalr	s1
  800642:	6702                	ld	a4,0(sp)
  800644:	fe0d99e3          	bnez	s11,800636 <vprintfmt+0x32a>
  800648:	00074783          	lbu	a5,0(a4)
  80064c:	0007851b          	sext.w	a0,a5
  800650:	ee0781e3          	beqz	a5,800532 <vprintfmt+0x226>
  800654:	00170a93          	addi	s5,a4,1
  800658:	b54d                	j	8004fa <vprintfmt+0x1ee>
  80065a:	8466                	mv	s0,s9
  80065c:	b36d                	j	800406 <vprintfmt+0xfa>
  80065e:	85ea                	mv	a1,s10
  800660:	00000517          	auipc	a0,0x0
  800664:	25850513          	addi	a0,a0,600 # 8008b8 <main+0x1f6>
  800668:	03e000ef          	jal	8006a6 <strnlen>
  80066c:	40ad8dbb          	subw	s11,s11,a0
  800670:	02800793          	li	a5,40
  800674:	00000717          	auipc	a4,0x0
  800678:	24470713          	addi	a4,a4,580 # 8008b8 <main+0x1f6>
  80067c:	853e                	mv	a0,a5
  80067e:	fbb04ce3          	bgtz	s11,800636 <vprintfmt+0x32a>
  800682:	00170a93          	addi	s5,a4,1
  800686:	bd95                	j	8004fa <vprintfmt+0x1ee>

0000000000800688 <printfmt>:
  800688:	7139                	addi	sp,sp,-64
  80068a:	02010313          	addi	t1,sp,32
  80068e:	f03a                	sd	a4,32(sp)
  800690:	871a                	mv	a4,t1
  800692:	ec06                	sd	ra,24(sp)
  800694:	f43e                	sd	a5,40(sp)
  800696:	f842                	sd	a6,48(sp)
  800698:	fc46                	sd	a7,56(sp)
  80069a:	e41a                	sd	t1,8(sp)
  80069c:	c71ff0ef          	jal	80030c <vprintfmt>
  8006a0:	60e2                	ld	ra,24(sp)
  8006a2:	6121                	addi	sp,sp,64
  8006a4:	8082                	ret

00000000008006a6 <strnlen>:
  8006a6:	4781                	li	a5,0
  8006a8:	e589                	bnez	a1,8006b2 <strnlen+0xc>
  8006aa:	a811                	j	8006be <strnlen+0x18>
  8006ac:	0785                	addi	a5,a5,1
  8006ae:	00f58863          	beq	a1,a5,8006be <strnlen+0x18>
  8006b2:	00f50733          	add	a4,a0,a5
  8006b6:	00074703          	lbu	a4,0(a4)
  8006ba:	fb6d                	bnez	a4,8006ac <strnlen+0x6>
  8006bc:	85be                	mv	a1,a5
  8006be:	852e                	mv	a0,a1
  8006c0:	8082                	ret

00000000008006c2 <main>:
  8006c2:	1101                	addi	sp,sp,-32
  8006c4:	00000517          	auipc	a0,0x0
  8006c8:	3ec50513          	addi	a0,a0,1004 # 800ab0 <main+0x3ee>
  8006cc:	ec06                	sd	ra,24(sp)
  8006ce:	e822                	sd	s0,16(sp)
  8006d0:	a25ff0ef          	jal	8000f4 <cprintf>
  8006d4:	ae3ff0ef          	jal	8001b6 <fork>
  8006d8:	c561                	beqz	a0,8007a0 <main+0xde>
  8006da:	842a                	mv	s0,a0
  8006dc:	85aa                	mv	a1,a0
  8006de:	00000517          	auipc	a0,0x0
  8006e2:	41250513          	addi	a0,a0,1042 # 800af0 <main+0x42e>
  8006e6:	a0fff0ef          	jal	8000f4 <cprintf>
  8006ea:	08805c63          	blez	s0,800782 <main+0xc0>
  8006ee:	00000517          	auipc	a0,0x0
  8006f2:	45a50513          	addi	a0,a0,1114 # 800b48 <main+0x486>
  8006f6:	9ffff0ef          	jal	8000f4 <cprintf>
  8006fa:	006c                	addi	a1,sp,12
  8006fc:	8522                	mv	a0,s0
  8006fe:	ac1ff0ef          	jal	8001be <waitpid>
  800702:	e131                	bnez	a0,800746 <main+0x84>
  800704:	4732                	lw	a4,12(sp)
  800706:	00001797          	auipc	a5,0x1
  80070a:	8fa7a783          	lw	a5,-1798(a5) # 801000 <magic>
  80070e:	02f71c63          	bne	a4,a5,800746 <main+0x84>
  800712:	006c                	addi	a1,sp,12
  800714:	8522                	mv	a0,s0
  800716:	aa9ff0ef          	jal	8001be <waitpid>
  80071a:	c529                	beqz	a0,800764 <main+0xa2>
  80071c:	a9dff0ef          	jal	8001b8 <wait>
  800720:	c131                	beqz	a0,800764 <main+0xa2>
  800722:	85a2                	mv	a1,s0
  800724:	00000517          	auipc	a0,0x0
  800728:	49c50513          	addi	a0,a0,1180 # 800bc0 <main+0x4fe>
  80072c:	9c9ff0ef          	jal	8000f4 <cprintf>
  800730:	00000517          	auipc	a0,0x0
  800734:	4a050513          	addi	a0,a0,1184 # 800bd0 <main+0x50e>
  800738:	9bdff0ef          	jal	8000f4 <cprintf>
  80073c:	60e2                	ld	ra,24(sp)
  80073e:	6442                	ld	s0,16(sp)
  800740:	4501                	li	a0,0
  800742:	6105                	addi	sp,sp,32
  800744:	8082                	ret
  800746:	00000697          	auipc	a3,0x0
  80074a:	42268693          	addi	a3,a3,1058 # 800b68 <main+0x4a6>
  80074e:	00000617          	auipc	a2,0x0
  800752:	3d260613          	addi	a2,a2,978 # 800b20 <main+0x45e>
  800756:	45ed                	li	a1,27
  800758:	00000517          	auipc	a0,0x0
  80075c:	3e050513          	addi	a0,a0,992 # 800b38 <main+0x476>
  800760:	8d1ff0ef          	jal	800030 <__panic>
  800764:	00000697          	auipc	a3,0x0
  800768:	43468693          	addi	a3,a3,1076 # 800b98 <main+0x4d6>
  80076c:	00000617          	auipc	a2,0x0
  800770:	3b460613          	addi	a2,a2,948 # 800b20 <main+0x45e>
  800774:	45f1                	li	a1,28
  800776:	00000517          	auipc	a0,0x0
  80077a:	3c250513          	addi	a0,a0,962 # 800b38 <main+0x476>
  80077e:	8b3ff0ef          	jal	800030 <__panic>
  800782:	00000697          	auipc	a3,0x0
  800786:	39668693          	addi	a3,a3,918 # 800b18 <main+0x456>
  80078a:	00000617          	auipc	a2,0x0
  80078e:	39660613          	addi	a2,a2,918 # 800b20 <main+0x45e>
  800792:	45e1                	li	a1,24
  800794:	00000517          	auipc	a0,0x0
  800798:	3a450513          	addi	a0,a0,932 # 800b38 <main+0x476>
  80079c:	895ff0ef          	jal	800030 <__panic>
  8007a0:	00000517          	auipc	a0,0x0
  8007a4:	33850513          	addi	a0,a0,824 # 800ad8 <main+0x416>
  8007a8:	94dff0ef          	jal	8000f4 <cprintf>
  8007ac:	a39ff0ef          	jal	8001e4 <yield>
  8007b0:	a35ff0ef          	jal	8001e4 <yield>
  8007b4:	a31ff0ef          	jal	8001e4 <yield>
  8007b8:	a2dff0ef          	jal	8001e4 <yield>
  8007bc:	a29ff0ef          	jal	8001e4 <yield>
  8007c0:	a25ff0ef          	jal	8001e4 <yield>
  8007c4:	a21ff0ef          	jal	8001e4 <yield>
  8007c8:	00001517          	auipc	a0,0x1
  8007cc:	83852503          	lw	a0,-1992(a0) # 801000 <magic>
  8007d0:	9d1ff0ef          	jal	8001a0 <exit>
