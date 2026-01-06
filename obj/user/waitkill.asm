
obj/__user_waitkill.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <open>:
  800020:	1582                	slli	a1,a1,0x20
  800022:	9181                	srli	a1,a1,0x20
  800024:	a2ad                	j	80018e <sys_open>

0000000000800026 <close>:
  800026:	aa8d                	j	800198 <sys_close>

0000000000800028 <dup2>:
  800028:	aaa5                	j	8001a0 <sys_dup>

000000000080002a <_start>:
  80002a:	206000ef          	jal	800230 <umain>
  80002e:	a001                	j	80002e <_start+0x4>

0000000000800030 <__panic>:
  800030:	715d                	addi	sp,sp,-80
  800032:	02810313          	addi	t1,sp,40
  800036:	e822                	sd	s0,16(sp)
  800038:	8432                	mv	s0,a2
  80003a:	862e                	mv	a2,a1
  80003c:	85aa                	mv	a1,a0
  80003e:	00000517          	auipc	a0,0x0
  800042:	7d250513          	addi	a0,a0,2002 # 800810 <main+0xbe>
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
  800060:	00001517          	auipc	a0,0x1
  800064:	a8850513          	addi	a0,a0,-1400 # 800ae8 <main+0x396>
  800068:	08c000ef          	jal	8000f4 <cprintf>
  80006c:	5559                	li	a0,-10
  80006e:	13c000ef          	jal	8001aa <exit>

0000000000800072 <__warn>:
  800072:	715d                	addi	sp,sp,-80
  800074:	e822                	sd	s0,16(sp)
  800076:	02810313          	addi	t1,sp,40
  80007a:	8432                	mv	s0,a2
  80007c:	862e                	mv	a2,a1
  80007e:	85aa                	mv	a1,a0
  800080:	00000517          	auipc	a0,0x0
  800084:	7b050513          	addi	a0,a0,1968 # 800830 <main+0xde>
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
  8000a2:	00001517          	auipc	a0,0x1
  8000a6:	a4650513          	addi	a0,a0,-1466 # 800ae8 <main+0x396>
  8000aa:	04a000ef          	jal	8000f4 <cprintf>
  8000ae:	60e2                	ld	ra,24(sp)
  8000b0:	6442                	ld	s0,16(sp)
  8000b2:	6161                	addi	sp,sp,80
  8000b4:	8082                	ret

00000000008000b6 <cputch>:
  8000b6:	1101                	addi	sp,sp,-32
  8000b8:	ec06                	sd	ra,24(sp)
  8000ba:	e42e                	sd	a1,8(sp)
  8000bc:	0cc000ef          	jal	800188 <sys_putc>
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
  8000e0:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <parent+0xffffffffff7f5ad1>
  8000e4:	ec06                	sd	ra,24(sp)
  8000e6:	c602                	sw	zero,12(sp)
  8000e8:	22c000ef          	jal	800314 <vprintfmt>
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
  800112:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <parent+0xffffffffff7f5ad1>
  800116:	ec06                	sd	ra,24(sp)
  800118:	e4be                	sd	a5,72(sp)
  80011a:	e8c2                	sd	a6,80(sp)
  80011c:	ecc6                	sd	a7,88(sp)
  80011e:	c202                	sw	zero,4(sp)
  800120:	e41a                	sd	t1,8(sp)
  800122:	1f2000ef          	jal	800314 <vprintfmt>
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

000000000080017e <sys_kill>:
  80017e:	85aa                	mv	a1,a0
  800180:	4531                	li	a0,12
  800182:	b775                	j	80012e <syscall>

0000000000800184 <sys_getpid>:
  800184:	4549                	li	a0,18
  800186:	b765                	j	80012e <syscall>

0000000000800188 <sys_putc>:
  800188:	85aa                	mv	a1,a0
  80018a:	4579                	li	a0,30
  80018c:	b74d                	j	80012e <syscall>

000000000080018e <sys_open>:
  80018e:	862e                	mv	a2,a1
  800190:	85aa                	mv	a1,a0
  800192:	06400513          	li	a0,100
  800196:	bf61                	j	80012e <syscall>

0000000000800198 <sys_close>:
  800198:	85aa                	mv	a1,a0
  80019a:	06500513          	li	a0,101
  80019e:	bf41                	j	80012e <syscall>

00000000008001a0 <sys_dup>:
  8001a0:	862e                	mv	a2,a1
  8001a2:	85aa                	mv	a1,a0
  8001a4:	08200513          	li	a0,130
  8001a8:	b759                	j	80012e <syscall>

00000000008001aa <exit>:
  8001aa:	1141                	addi	sp,sp,-16
  8001ac:	e406                	sd	ra,8(sp)
  8001ae:	fbbff0ef          	jal	800168 <sys_exit>
  8001b2:	00000517          	auipc	a0,0x0
  8001b6:	69e50513          	addi	a0,a0,1694 # 800850 <main+0xfe>
  8001ba:	f3bff0ef          	jal	8000f4 <cprintf>
  8001be:	a001                	j	8001be <exit+0x14>

00000000008001c0 <fork>:
  8001c0:	b77d                	j	80016e <sys_fork>

00000000008001c2 <waitpid>:
  8001c2:	7179                	addi	sp,sp,-48
  8001c4:	f406                	sd	ra,40(sp)
  8001c6:	ec02                	sd	zero,24(sp)
  8001c8:	c999                	beqz	a1,8001de <waitpid+0x1c>
  8001ca:	e42e                	sd	a1,8(sp)
  8001cc:	082c                	addi	a1,sp,24
  8001ce:	fa5ff0ef          	jal	800172 <sys_wait>
  8001d2:	6762                	ld	a4,24(sp)
  8001d4:	67a2                	ld	a5,8(sp)
  8001d6:	70a2                	ld	ra,40(sp)
  8001d8:	c398                	sw	a4,0(a5)
  8001da:	6145                	addi	sp,sp,48
  8001dc:	8082                	ret
  8001de:	f95ff0ef          	jal	800172 <sys_wait>
  8001e2:	70a2                	ld	ra,40(sp)
  8001e4:	6145                	addi	sp,sp,48
  8001e6:	8082                	ret

00000000008001e8 <yield>:
  8001e8:	bf49                	j	80017a <sys_yield>

00000000008001ea <kill>:
  8001ea:	bf51                	j	80017e <sys_kill>

00000000008001ec <getpid>:
  8001ec:	bf61                	j	800184 <sys_getpid>

00000000008001ee <initfd>:
  8001ee:	87ae                	mv	a5,a1
  8001f0:	1101                	addi	sp,sp,-32
  8001f2:	e822                	sd	s0,16(sp)
  8001f4:	85b2                	mv	a1,a2
  8001f6:	842a                	mv	s0,a0
  8001f8:	853e                	mv	a0,a5
  8001fa:	ec06                	sd	ra,24(sp)
  8001fc:	e25ff0ef          	jal	800020 <open>
  800200:	87aa                	mv	a5,a0
  800202:	00054463          	bltz	a0,80020a <initfd+0x1c>
  800206:	00851763          	bne	a0,s0,800214 <initfd+0x26>
  80020a:	60e2                	ld	ra,24(sp)
  80020c:	6442                	ld	s0,16(sp)
  80020e:	853e                	mv	a0,a5
  800210:	6105                	addi	sp,sp,32
  800212:	8082                	ret
  800214:	e42a                	sd	a0,8(sp)
  800216:	8522                	mv	a0,s0
  800218:	e0fff0ef          	jal	800026 <close>
  80021c:	6522                	ld	a0,8(sp)
  80021e:	85a2                	mv	a1,s0
  800220:	e09ff0ef          	jal	800028 <dup2>
  800224:	842a                	mv	s0,a0
  800226:	6522                	ld	a0,8(sp)
  800228:	dffff0ef          	jal	800026 <close>
  80022c:	87a2                	mv	a5,s0
  80022e:	bff1                	j	80020a <initfd+0x1c>

0000000000800230 <umain>:
  800230:	1101                	addi	sp,sp,-32
  800232:	e822                	sd	s0,16(sp)
  800234:	e426                	sd	s1,8(sp)
  800236:	842a                	mv	s0,a0
  800238:	84ae                	mv	s1,a1
  80023a:	4601                	li	a2,0
  80023c:	00000597          	auipc	a1,0x0
  800240:	62c58593          	addi	a1,a1,1580 # 800868 <main+0x116>
  800244:	4501                	li	a0,0
  800246:	ec06                	sd	ra,24(sp)
  800248:	fa7ff0ef          	jal	8001ee <initfd>
  80024c:	02054263          	bltz	a0,800270 <umain+0x40>
  800250:	4605                	li	a2,1
  800252:	8532                	mv	a0,a2
  800254:	00000597          	auipc	a1,0x0
  800258:	65458593          	addi	a1,a1,1620 # 8008a8 <main+0x156>
  80025c:	f93ff0ef          	jal	8001ee <initfd>
  800260:	02054563          	bltz	a0,80028a <umain+0x5a>
  800264:	85a6                	mv	a1,s1
  800266:	8522                	mv	a0,s0
  800268:	4ea000ef          	jal	800752 <main>
  80026c:	f3fff0ef          	jal	8001aa <exit>
  800270:	86aa                	mv	a3,a0
  800272:	00000617          	auipc	a2,0x0
  800276:	5fe60613          	addi	a2,a2,1534 # 800870 <main+0x11e>
  80027a:	45e9                	li	a1,26
  80027c:	00000517          	auipc	a0,0x0
  800280:	61450513          	addi	a0,a0,1556 # 800890 <main+0x13e>
  800284:	defff0ef          	jal	800072 <__warn>
  800288:	b7e1                	j	800250 <umain+0x20>
  80028a:	86aa                	mv	a3,a0
  80028c:	00000617          	auipc	a2,0x0
  800290:	62460613          	addi	a2,a2,1572 # 8008b0 <main+0x15e>
  800294:	45f5                	li	a1,29
  800296:	00000517          	auipc	a0,0x0
  80029a:	5fa50513          	addi	a0,a0,1530 # 800890 <main+0x13e>
  80029e:	dd5ff0ef          	jal	800072 <__warn>
  8002a2:	b7c9                	j	800264 <umain+0x34>

00000000008002a4 <printnum>:
  8002a4:	7139                	addi	sp,sp,-64
  8002a6:	02071893          	slli	a7,a4,0x20
  8002aa:	f822                	sd	s0,48(sp)
  8002ac:	f426                	sd	s1,40(sp)
  8002ae:	f04a                	sd	s2,32(sp)
  8002b0:	ec4e                	sd	s3,24(sp)
  8002b2:	e456                	sd	s5,8(sp)
  8002b4:	0208d893          	srli	a7,a7,0x20
  8002b8:	fc06                	sd	ra,56(sp)
  8002ba:	0316fab3          	remu	s5,a3,a7
  8002be:	fff7841b          	addiw	s0,a5,-1
  8002c2:	84aa                	mv	s1,a0
  8002c4:	89ae                	mv	s3,a1
  8002c6:	8932                	mv	s2,a2
  8002c8:	0516f063          	bgeu	a3,a7,800308 <printnum+0x64>
  8002cc:	e852                	sd	s4,16(sp)
  8002ce:	4705                	li	a4,1
  8002d0:	8a42                	mv	s4,a6
  8002d2:	00f75863          	bge	a4,a5,8002e2 <printnum+0x3e>
  8002d6:	864e                	mv	a2,s3
  8002d8:	85ca                	mv	a1,s2
  8002da:	8552                	mv	a0,s4
  8002dc:	347d                	addiw	s0,s0,-1
  8002de:	9482                	jalr	s1
  8002e0:	f87d                	bnez	s0,8002d6 <printnum+0x32>
  8002e2:	6a42                	ld	s4,16(sp)
  8002e4:	00000797          	auipc	a5,0x0
  8002e8:	5ec78793          	addi	a5,a5,1516 # 8008d0 <main+0x17e>
  8002ec:	97d6                	add	a5,a5,s5
  8002ee:	7442                	ld	s0,48(sp)
  8002f0:	0007c503          	lbu	a0,0(a5)
  8002f4:	70e2                	ld	ra,56(sp)
  8002f6:	6aa2                	ld	s5,8(sp)
  8002f8:	864e                	mv	a2,s3
  8002fa:	85ca                	mv	a1,s2
  8002fc:	69e2                	ld	s3,24(sp)
  8002fe:	7902                	ld	s2,32(sp)
  800300:	87a6                	mv	a5,s1
  800302:	74a2                	ld	s1,40(sp)
  800304:	6121                	addi	sp,sp,64
  800306:	8782                	jr	a5
  800308:	0316d6b3          	divu	a3,a3,a7
  80030c:	87a2                	mv	a5,s0
  80030e:	f97ff0ef          	jal	8002a4 <printnum>
  800312:	bfc9                	j	8002e4 <printnum+0x40>

0000000000800314 <vprintfmt>:
  800314:	7119                	addi	sp,sp,-128
  800316:	f4a6                	sd	s1,104(sp)
  800318:	f0ca                	sd	s2,96(sp)
  80031a:	ecce                	sd	s3,88(sp)
  80031c:	e8d2                	sd	s4,80(sp)
  80031e:	e4d6                	sd	s5,72(sp)
  800320:	e0da                	sd	s6,64(sp)
  800322:	fc5e                	sd	s7,56(sp)
  800324:	f466                	sd	s9,40(sp)
  800326:	fc86                	sd	ra,120(sp)
  800328:	f8a2                	sd	s0,112(sp)
  80032a:	f862                	sd	s8,48(sp)
  80032c:	f06a                	sd	s10,32(sp)
  80032e:	ec6e                	sd	s11,24(sp)
  800330:	84aa                	mv	s1,a0
  800332:	8cb6                	mv	s9,a3
  800334:	8aba                	mv	s5,a4
  800336:	89ae                	mv	s3,a1
  800338:	8932                	mv	s2,a2
  80033a:	02500a13          	li	s4,37
  80033e:	05500b93          	li	s7,85
  800342:	00001b17          	auipc	s6,0x1
  800346:	85ab0b13          	addi	s6,s6,-1958 # 800b9c <main+0x44a>
  80034a:	000cc503          	lbu	a0,0(s9)
  80034e:	001c8413          	addi	s0,s9,1
  800352:	01450b63          	beq	a0,s4,800368 <vprintfmt+0x54>
  800356:	cd15                	beqz	a0,800392 <vprintfmt+0x7e>
  800358:	864e                	mv	a2,s3
  80035a:	85ca                	mv	a1,s2
  80035c:	9482                	jalr	s1
  80035e:	00044503          	lbu	a0,0(s0)
  800362:	0405                	addi	s0,s0,1
  800364:	ff4519e3          	bne	a0,s4,800356 <vprintfmt+0x42>
  800368:	5d7d                	li	s10,-1
  80036a:	8dea                	mv	s11,s10
  80036c:	02000813          	li	a6,32
  800370:	4c01                	li	s8,0
  800372:	4581                	li	a1,0
  800374:	00044703          	lbu	a4,0(s0)
  800378:	00140c93          	addi	s9,s0,1
  80037c:	fdd7061b          	addiw	a2,a4,-35
  800380:	0ff67613          	zext.b	a2,a2
  800384:	02cbe663          	bltu	s7,a2,8003b0 <vprintfmt+0x9c>
  800388:	060a                	slli	a2,a2,0x2
  80038a:	965a                	add	a2,a2,s6
  80038c:	421c                	lw	a5,0(a2)
  80038e:	97da                	add	a5,a5,s6
  800390:	8782                	jr	a5
  800392:	70e6                	ld	ra,120(sp)
  800394:	7446                	ld	s0,112(sp)
  800396:	74a6                	ld	s1,104(sp)
  800398:	7906                	ld	s2,96(sp)
  80039a:	69e6                	ld	s3,88(sp)
  80039c:	6a46                	ld	s4,80(sp)
  80039e:	6aa6                	ld	s5,72(sp)
  8003a0:	6b06                	ld	s6,64(sp)
  8003a2:	7be2                	ld	s7,56(sp)
  8003a4:	7c42                	ld	s8,48(sp)
  8003a6:	7ca2                	ld	s9,40(sp)
  8003a8:	7d02                	ld	s10,32(sp)
  8003aa:	6de2                	ld	s11,24(sp)
  8003ac:	6109                	addi	sp,sp,128
  8003ae:	8082                	ret
  8003b0:	864e                	mv	a2,s3
  8003b2:	85ca                	mv	a1,s2
  8003b4:	02500513          	li	a0,37
  8003b8:	9482                	jalr	s1
  8003ba:	fff44783          	lbu	a5,-1(s0)
  8003be:	02500713          	li	a4,37
  8003c2:	8ca2                	mv	s9,s0
  8003c4:	f8e783e3          	beq	a5,a4,80034a <vprintfmt+0x36>
  8003c8:	ffecc783          	lbu	a5,-2(s9)
  8003cc:	1cfd                	addi	s9,s9,-1
  8003ce:	fee79de3          	bne	a5,a4,8003c8 <vprintfmt+0xb4>
  8003d2:	bfa5                	j	80034a <vprintfmt+0x36>
  8003d4:	00144683          	lbu	a3,1(s0)
  8003d8:	4525                	li	a0,9
  8003da:	fd070d1b          	addiw	s10,a4,-48
  8003de:	fd06879b          	addiw	a5,a3,-48
  8003e2:	28f56063          	bltu	a0,a5,800662 <vprintfmt+0x34e>
  8003e6:	2681                	sext.w	a3,a3
  8003e8:	8466                	mv	s0,s9
  8003ea:	002d179b          	slliw	a5,s10,0x2
  8003ee:	00144703          	lbu	a4,1(s0)
  8003f2:	01a787bb          	addw	a5,a5,s10
  8003f6:	0017979b          	slliw	a5,a5,0x1
  8003fa:	9fb5                	addw	a5,a5,a3
  8003fc:	fd07061b          	addiw	a2,a4,-48
  800400:	0405                	addi	s0,s0,1
  800402:	fd078d1b          	addiw	s10,a5,-48
  800406:	0007069b          	sext.w	a3,a4
  80040a:	fec570e3          	bgeu	a0,a2,8003ea <vprintfmt+0xd6>
  80040e:	f60dd3e3          	bgez	s11,800374 <vprintfmt+0x60>
  800412:	8dea                	mv	s11,s10
  800414:	5d7d                	li	s10,-1
  800416:	bfb9                	j	800374 <vprintfmt+0x60>
  800418:	883a                	mv	a6,a4
  80041a:	8466                	mv	s0,s9
  80041c:	bfa1                	j	800374 <vprintfmt+0x60>
  80041e:	8466                	mv	s0,s9
  800420:	4c05                	li	s8,1
  800422:	bf89                	j	800374 <vprintfmt+0x60>
  800424:	4785                	li	a5,1
  800426:	008a8613          	addi	a2,s5,8
  80042a:	00b7c463          	blt	a5,a1,800432 <vprintfmt+0x11e>
  80042e:	1c058363          	beqz	a1,8005f4 <vprintfmt+0x2e0>
  800432:	000ab683          	ld	a3,0(s5)
  800436:	4741                	li	a4,16
  800438:	8ab2                	mv	s5,a2
  80043a:	2801                	sext.w	a6,a6
  80043c:	87ee                	mv	a5,s11
  80043e:	864a                	mv	a2,s2
  800440:	85ce                	mv	a1,s3
  800442:	8526                	mv	a0,s1
  800444:	e61ff0ef          	jal	8002a4 <printnum>
  800448:	b709                	j	80034a <vprintfmt+0x36>
  80044a:	000aa503          	lw	a0,0(s5)
  80044e:	864e                	mv	a2,s3
  800450:	85ca                	mv	a1,s2
  800452:	9482                	jalr	s1
  800454:	0aa1                	addi	s5,s5,8
  800456:	bdd5                	j	80034a <vprintfmt+0x36>
  800458:	4785                	li	a5,1
  80045a:	008a8613          	addi	a2,s5,8
  80045e:	00b7c463          	blt	a5,a1,800466 <vprintfmt+0x152>
  800462:	18058463          	beqz	a1,8005ea <vprintfmt+0x2d6>
  800466:	000ab683          	ld	a3,0(s5)
  80046a:	4729                	li	a4,10
  80046c:	8ab2                	mv	s5,a2
  80046e:	b7f1                	j	80043a <vprintfmt+0x126>
  800470:	864e                	mv	a2,s3
  800472:	85ca                	mv	a1,s2
  800474:	03000513          	li	a0,48
  800478:	e042                	sd	a6,0(sp)
  80047a:	9482                	jalr	s1
  80047c:	864e                	mv	a2,s3
  80047e:	85ca                	mv	a1,s2
  800480:	07800513          	li	a0,120
  800484:	9482                	jalr	s1
  800486:	000ab683          	ld	a3,0(s5)
  80048a:	6802                	ld	a6,0(sp)
  80048c:	4741                	li	a4,16
  80048e:	0aa1                	addi	s5,s5,8
  800490:	b76d                	j	80043a <vprintfmt+0x126>
  800492:	864e                	mv	a2,s3
  800494:	85ca                	mv	a1,s2
  800496:	02500513          	li	a0,37
  80049a:	9482                	jalr	s1
  80049c:	b57d                	j	80034a <vprintfmt+0x36>
  80049e:	000aad03          	lw	s10,0(s5)
  8004a2:	8466                	mv	s0,s9
  8004a4:	0aa1                	addi	s5,s5,8
  8004a6:	b7a5                	j	80040e <vprintfmt+0xfa>
  8004a8:	4785                	li	a5,1
  8004aa:	008a8613          	addi	a2,s5,8
  8004ae:	00b7c463          	blt	a5,a1,8004b6 <vprintfmt+0x1a2>
  8004b2:	12058763          	beqz	a1,8005e0 <vprintfmt+0x2cc>
  8004b6:	000ab683          	ld	a3,0(s5)
  8004ba:	4721                	li	a4,8
  8004bc:	8ab2                	mv	s5,a2
  8004be:	bfb5                	j	80043a <vprintfmt+0x126>
  8004c0:	87ee                	mv	a5,s11
  8004c2:	000dd363          	bgez	s11,8004c8 <vprintfmt+0x1b4>
  8004c6:	4781                	li	a5,0
  8004c8:	00078d9b          	sext.w	s11,a5
  8004cc:	8466                	mv	s0,s9
  8004ce:	b55d                	j	800374 <vprintfmt+0x60>
  8004d0:	0008041b          	sext.w	s0,a6
  8004d4:	fd340793          	addi	a5,s0,-45
  8004d8:	01b02733          	sgtz	a4,s11
  8004dc:	00f037b3          	snez	a5,a5
  8004e0:	8ff9                	and	a5,a5,a4
  8004e2:	000ab703          	ld	a4,0(s5)
  8004e6:	008a8693          	addi	a3,s5,8
  8004ea:	e436                	sd	a3,8(sp)
  8004ec:	12070563          	beqz	a4,800616 <vprintfmt+0x302>
  8004f0:	12079d63          	bnez	a5,80062a <vprintfmt+0x316>
  8004f4:	00074783          	lbu	a5,0(a4)
  8004f8:	0007851b          	sext.w	a0,a5
  8004fc:	c78d                	beqz	a5,800526 <vprintfmt+0x212>
  8004fe:	00170a93          	addi	s5,a4,1
  800502:	547d                	li	s0,-1
  800504:	000d4563          	bltz	s10,80050e <vprintfmt+0x1fa>
  800508:	3d7d                	addiw	s10,s10,-1
  80050a:	008d0e63          	beq	s10,s0,800526 <vprintfmt+0x212>
  80050e:	020c1863          	bnez	s8,80053e <vprintfmt+0x22a>
  800512:	864e                	mv	a2,s3
  800514:	85ca                	mv	a1,s2
  800516:	9482                	jalr	s1
  800518:	000ac783          	lbu	a5,0(s5)
  80051c:	0a85                	addi	s5,s5,1
  80051e:	3dfd                	addiw	s11,s11,-1
  800520:	0007851b          	sext.w	a0,a5
  800524:	f3e5                	bnez	a5,800504 <vprintfmt+0x1f0>
  800526:	01b05a63          	blez	s11,80053a <vprintfmt+0x226>
  80052a:	864e                	mv	a2,s3
  80052c:	85ca                	mv	a1,s2
  80052e:	02000513          	li	a0,32
  800532:	3dfd                	addiw	s11,s11,-1
  800534:	9482                	jalr	s1
  800536:	fe0d9ae3          	bnez	s11,80052a <vprintfmt+0x216>
  80053a:	6aa2                	ld	s5,8(sp)
  80053c:	b539                	j	80034a <vprintfmt+0x36>
  80053e:	3781                	addiw	a5,a5,-32
  800540:	05e00713          	li	a4,94
  800544:	fcf777e3          	bgeu	a4,a5,800512 <vprintfmt+0x1fe>
  800548:	03f00513          	li	a0,63
  80054c:	864e                	mv	a2,s3
  80054e:	85ca                	mv	a1,s2
  800550:	9482                	jalr	s1
  800552:	000ac783          	lbu	a5,0(s5)
  800556:	0a85                	addi	s5,s5,1
  800558:	3dfd                	addiw	s11,s11,-1
  80055a:	0007851b          	sext.w	a0,a5
  80055e:	d7e1                	beqz	a5,800526 <vprintfmt+0x212>
  800560:	fa0d54e3          	bgez	s10,800508 <vprintfmt+0x1f4>
  800564:	bfe9                	j	80053e <vprintfmt+0x22a>
  800566:	000aa783          	lw	a5,0(s5)
  80056a:	46e1                	li	a3,24
  80056c:	0aa1                	addi	s5,s5,8
  80056e:	41f7d71b          	sraiw	a4,a5,0x1f
  800572:	8fb9                	xor	a5,a5,a4
  800574:	40e7873b          	subw	a4,a5,a4
  800578:	02e6c663          	blt	a3,a4,8005a4 <vprintfmt+0x290>
  80057c:	00000797          	auipc	a5,0x0
  800580:	77c78793          	addi	a5,a5,1916 # 800cf8 <error_string>
  800584:	00371693          	slli	a3,a4,0x3
  800588:	97b6                	add	a5,a5,a3
  80058a:	639c                	ld	a5,0(a5)
  80058c:	cf81                	beqz	a5,8005a4 <vprintfmt+0x290>
  80058e:	873e                	mv	a4,a5
  800590:	00000697          	auipc	a3,0x0
  800594:	37068693          	addi	a3,a3,880 # 800900 <main+0x1ae>
  800598:	864a                	mv	a2,s2
  80059a:	85ce                	mv	a1,s3
  80059c:	8526                	mv	a0,s1
  80059e:	0f2000ef          	jal	800690 <printfmt>
  8005a2:	b365                	j	80034a <vprintfmt+0x36>
  8005a4:	00000697          	auipc	a3,0x0
  8005a8:	34c68693          	addi	a3,a3,844 # 8008f0 <main+0x19e>
  8005ac:	864a                	mv	a2,s2
  8005ae:	85ce                	mv	a1,s3
  8005b0:	8526                	mv	a0,s1
  8005b2:	0de000ef          	jal	800690 <printfmt>
  8005b6:	bb51                	j	80034a <vprintfmt+0x36>
  8005b8:	4785                	li	a5,1
  8005ba:	008a8c13          	addi	s8,s5,8
  8005be:	00b7c363          	blt	a5,a1,8005c4 <vprintfmt+0x2b0>
  8005c2:	cd81                	beqz	a1,8005da <vprintfmt+0x2c6>
  8005c4:	000ab403          	ld	s0,0(s5)
  8005c8:	02044b63          	bltz	s0,8005fe <vprintfmt+0x2ea>
  8005cc:	86a2                	mv	a3,s0
  8005ce:	8ae2                	mv	s5,s8
  8005d0:	4729                	li	a4,10
  8005d2:	b5a5                	j	80043a <vprintfmt+0x126>
  8005d4:	2585                	addiw	a1,a1,1
  8005d6:	8466                	mv	s0,s9
  8005d8:	bb71                	j	800374 <vprintfmt+0x60>
  8005da:	000aa403          	lw	s0,0(s5)
  8005de:	b7ed                	j	8005c8 <vprintfmt+0x2b4>
  8005e0:	000ae683          	lwu	a3,0(s5)
  8005e4:	4721                	li	a4,8
  8005e6:	8ab2                	mv	s5,a2
  8005e8:	bd89                	j	80043a <vprintfmt+0x126>
  8005ea:	000ae683          	lwu	a3,0(s5)
  8005ee:	4729                	li	a4,10
  8005f0:	8ab2                	mv	s5,a2
  8005f2:	b5a1                	j	80043a <vprintfmt+0x126>
  8005f4:	000ae683          	lwu	a3,0(s5)
  8005f8:	4741                	li	a4,16
  8005fa:	8ab2                	mv	s5,a2
  8005fc:	bd3d                	j	80043a <vprintfmt+0x126>
  8005fe:	864e                	mv	a2,s3
  800600:	85ca                	mv	a1,s2
  800602:	02d00513          	li	a0,45
  800606:	e042                	sd	a6,0(sp)
  800608:	9482                	jalr	s1
  80060a:	6802                	ld	a6,0(sp)
  80060c:	408006b3          	neg	a3,s0
  800610:	8ae2                	mv	s5,s8
  800612:	4729                	li	a4,10
  800614:	b51d                	j	80043a <vprintfmt+0x126>
  800616:	eba1                	bnez	a5,800666 <vprintfmt+0x352>
  800618:	02800793          	li	a5,40
  80061c:	853e                	mv	a0,a5
  80061e:	00000a97          	auipc	s5,0x0
  800622:	2cba8a93          	addi	s5,s5,715 # 8008e9 <main+0x197>
  800626:	547d                	li	s0,-1
  800628:	bdf1                	j	800504 <vprintfmt+0x1f0>
  80062a:	853a                	mv	a0,a4
  80062c:	85ea                	mv	a1,s10
  80062e:	e03a                	sd	a4,0(sp)
  800630:	07e000ef          	jal	8006ae <strnlen>
  800634:	40ad8dbb          	subw	s11,s11,a0
  800638:	6702                	ld	a4,0(sp)
  80063a:	01b05b63          	blez	s11,800650 <vprintfmt+0x33c>
  80063e:	864e                	mv	a2,s3
  800640:	85ca                	mv	a1,s2
  800642:	8522                	mv	a0,s0
  800644:	e03a                	sd	a4,0(sp)
  800646:	3dfd                	addiw	s11,s11,-1
  800648:	9482                	jalr	s1
  80064a:	6702                	ld	a4,0(sp)
  80064c:	fe0d99e3          	bnez	s11,80063e <vprintfmt+0x32a>
  800650:	00074783          	lbu	a5,0(a4)
  800654:	0007851b          	sext.w	a0,a5
  800658:	ee0781e3          	beqz	a5,80053a <vprintfmt+0x226>
  80065c:	00170a93          	addi	s5,a4,1
  800660:	b54d                	j	800502 <vprintfmt+0x1ee>
  800662:	8466                	mv	s0,s9
  800664:	b36d                	j	80040e <vprintfmt+0xfa>
  800666:	85ea                	mv	a1,s10
  800668:	00000517          	auipc	a0,0x0
  80066c:	28050513          	addi	a0,a0,640 # 8008e8 <main+0x196>
  800670:	03e000ef          	jal	8006ae <strnlen>
  800674:	40ad8dbb          	subw	s11,s11,a0
  800678:	02800793          	li	a5,40
  80067c:	00000717          	auipc	a4,0x0
  800680:	26c70713          	addi	a4,a4,620 # 8008e8 <main+0x196>
  800684:	853e                	mv	a0,a5
  800686:	fbb04ce3          	bgtz	s11,80063e <vprintfmt+0x32a>
  80068a:	00170a93          	addi	s5,a4,1
  80068e:	bd95                	j	800502 <vprintfmt+0x1ee>

0000000000800690 <printfmt>:
  800690:	7139                	addi	sp,sp,-64
  800692:	02010313          	addi	t1,sp,32
  800696:	f03a                	sd	a4,32(sp)
  800698:	871a                	mv	a4,t1
  80069a:	ec06                	sd	ra,24(sp)
  80069c:	f43e                	sd	a5,40(sp)
  80069e:	f842                	sd	a6,48(sp)
  8006a0:	fc46                	sd	a7,56(sp)
  8006a2:	e41a                	sd	t1,8(sp)
  8006a4:	c71ff0ef          	jal	800314 <vprintfmt>
  8006a8:	60e2                	ld	ra,24(sp)
  8006aa:	6121                	addi	sp,sp,64
  8006ac:	8082                	ret

00000000008006ae <strnlen>:
  8006ae:	4781                	li	a5,0
  8006b0:	e589                	bnez	a1,8006ba <strnlen+0xc>
  8006b2:	a811                	j	8006c6 <strnlen+0x18>
  8006b4:	0785                	addi	a5,a5,1
  8006b6:	00f58863          	beq	a1,a5,8006c6 <strnlen+0x18>
  8006ba:	00f50733          	add	a4,a0,a5
  8006be:	00074703          	lbu	a4,0(a4)
  8006c2:	fb6d                	bnez	a4,8006b4 <strnlen+0x6>
  8006c4:	85be                	mv	a1,a5
  8006c6:	852e                	mv	a0,a1
  8006c8:	8082                	ret

00000000008006ca <do_yield>:
  8006ca:	1141                	addi	sp,sp,-16
  8006cc:	e406                	sd	ra,8(sp)
  8006ce:	b1bff0ef          	jal	8001e8 <yield>
  8006d2:	b17ff0ef          	jal	8001e8 <yield>
  8006d6:	b13ff0ef          	jal	8001e8 <yield>
  8006da:	b0fff0ef          	jal	8001e8 <yield>
  8006de:	b0bff0ef          	jal	8001e8 <yield>
  8006e2:	60a2                	ld	ra,8(sp)
  8006e4:	0141                	addi	sp,sp,16
  8006e6:	b609                	j	8001e8 <yield>

00000000008006e8 <loop>:
  8006e8:	1141                	addi	sp,sp,-16
  8006ea:	00000517          	auipc	a0,0x0
  8006ee:	3f650513          	addi	a0,a0,1014 # 800ae0 <main+0x38e>
  8006f2:	e406                	sd	ra,8(sp)
  8006f4:	a01ff0ef          	jal	8000f4 <cprintf>
  8006f8:	a001                	j	8006f8 <loop+0x10>

00000000008006fa <work>:
  8006fa:	1141                	addi	sp,sp,-16
  8006fc:	00000517          	auipc	a0,0x0
  800700:	3f450513          	addi	a0,a0,1012 # 800af0 <main+0x39e>
  800704:	e406                	sd	ra,8(sp)
  800706:	9efff0ef          	jal	8000f4 <cprintf>
  80070a:	fc1ff0ef          	jal	8006ca <do_yield>
  80070e:	00001517          	auipc	a0,0x1
  800712:	8fa52503          	lw	a0,-1798(a0) # 801008 <parent>
  800716:	ad5ff0ef          	jal	8001ea <kill>
  80071a:	e105                	bnez	a0,80073a <work+0x40>
  80071c:	00000517          	auipc	a0,0x0
  800720:	3e450513          	addi	a0,a0,996 # 800b00 <main+0x3ae>
  800724:	9d1ff0ef          	jal	8000f4 <cprintf>
  800728:	fa3ff0ef          	jal	8006ca <do_yield>
  80072c:	00001517          	auipc	a0,0x1
  800730:	8d852503          	lw	a0,-1832(a0) # 801004 <pid1>
  800734:	ab7ff0ef          	jal	8001ea <kill>
  800738:	c501                	beqz	a0,800740 <work+0x46>
  80073a:	557d                	li	a0,-1
  80073c:	a6fff0ef          	jal	8001aa <exit>
  800740:	00000517          	auipc	a0,0x0
  800744:	3d850513          	addi	a0,a0,984 # 800b18 <main+0x3c6>
  800748:	9adff0ef          	jal	8000f4 <cprintf>
  80074c:	4501                	li	a0,0
  80074e:	a5dff0ef          	jal	8001aa <exit>

0000000000800752 <main>:
  800752:	1141                	addi	sp,sp,-16
  800754:	e406                	sd	ra,8(sp)
  800756:	a97ff0ef          	jal	8001ec <getpid>
  80075a:	00001797          	auipc	a5,0x1
  80075e:	8aa7a723          	sw	a0,-1874(a5) # 801008 <parent>
  800762:	a5fff0ef          	jal	8001c0 <fork>
  800766:	00001797          	auipc	a5,0x1
  80076a:	88a7af23          	sw	a0,-1890(a5) # 801004 <pid1>
  80076e:	c92d                	beqz	a0,8007e0 <main+0x8e>
  800770:	04a05863          	blez	a0,8007c0 <main+0x6e>
  800774:	a4dff0ef          	jal	8001c0 <fork>
  800778:	00001797          	auipc	a5,0x1
  80077c:	88a7a423          	sw	a0,-1912(a5) # 801000 <pid2>
  800780:	c541                	beqz	a0,800808 <main+0xb6>
  800782:	06a05163          	blez	a0,8007e4 <main+0x92>
  800786:	00000517          	auipc	a0,0x0
  80078a:	3e250513          	addi	a0,a0,994 # 800b68 <main+0x416>
  80078e:	967ff0ef          	jal	8000f4 <cprintf>
  800792:	00001517          	auipc	a0,0x1
  800796:	87252503          	lw	a0,-1934(a0) # 801004 <pid1>
  80079a:	4581                	li	a1,0
  80079c:	a27ff0ef          	jal	8001c2 <waitpid>
  8007a0:	00001697          	auipc	a3,0x1
  8007a4:	8646a683          	lw	a3,-1948(a3) # 801004 <pid1>
  8007a8:	00000617          	auipc	a2,0x0
  8007ac:	3d060613          	addi	a2,a2,976 # 800b78 <main+0x426>
  8007b0:	03400593          	li	a1,52
  8007b4:	00000517          	auipc	a0,0x0
  8007b8:	3a450513          	addi	a0,a0,932 # 800b58 <main+0x406>
  8007bc:	875ff0ef          	jal	800030 <__panic>
  8007c0:	00000697          	auipc	a3,0x0
  8007c4:	37068693          	addi	a3,a3,880 # 800b30 <main+0x3de>
  8007c8:	00000617          	auipc	a2,0x0
  8007cc:	37860613          	addi	a2,a2,888 # 800b40 <main+0x3ee>
  8007d0:	02c00593          	li	a1,44
  8007d4:	00000517          	auipc	a0,0x0
  8007d8:	38450513          	addi	a0,a0,900 # 800b58 <main+0x406>
  8007dc:	855ff0ef          	jal	800030 <__panic>
  8007e0:	f09ff0ef          	jal	8006e8 <loop>
  8007e4:	00001517          	auipc	a0,0x1
  8007e8:	82052503          	lw	a0,-2016(a0) # 801004 <pid1>
  8007ec:	9ffff0ef          	jal	8001ea <kill>
  8007f0:	00000617          	auipc	a2,0x0
  8007f4:	3a060613          	addi	a2,a2,928 # 800b90 <main+0x43e>
  8007f8:	03900593          	li	a1,57
  8007fc:	00000517          	auipc	a0,0x0
  800800:	35c50513          	addi	a0,a0,860 # 800b58 <main+0x406>
  800804:	82dff0ef          	jal	800030 <__panic>
  800808:	ef3ff0ef          	jal	8006fa <work>
