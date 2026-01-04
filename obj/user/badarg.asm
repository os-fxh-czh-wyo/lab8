
obj/__user_badarg.out:     file format elf64-littleriscv


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
  80002a:	1f8000ef          	jal	800222 <umain>
  80002e:	a001                	j	80002e <_start+0x4>

0000000000800030 <__panic>:
  800030:	715d                	addi	sp,sp,-80
  800032:	02810313          	addi	t1,sp,40
  800036:	e822                	sd	s0,16(sp)
  800038:	8432                	mv	s0,a2
  80003a:	862e                	mv	a2,a1
  80003c:	85aa                	mv	a1,a0
  80003e:	00000517          	auipc	a0,0x0
  800042:	76a50513          	addi	a0,a0,1898 # 8007a8 <main+0xec>
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
  800064:	76850513          	addi	a0,a0,1896 # 8007c8 <main+0x10c>
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
  800084:	75050513          	addi	a0,a0,1872 # 8007d0 <main+0x114>
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
  8000a6:	72650513          	addi	a0,a0,1830 # 8007c8 <main+0x10c>
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
  8000e0:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5e39>
  8000e4:	ec06                	sd	ra,24(sp)
  8000e6:	c602                	sw	zero,12(sp)
  8000e8:	21e000ef          	jal	800306 <vprintfmt>
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
  800112:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5e39>
  800116:	ec06                	sd	ra,24(sp)
  800118:	e4be                	sd	a5,72(sp)
  80011a:	e8c2                	sd	a6,80(sp)
  80011c:	ecc6                	sd	a7,88(sp)
  80011e:	c202                	sw	zero,4(sp)
  800120:	e41a                	sd	t1,8(sp)
  800122:	1e4000ef          	jal	800306 <vprintfmt>
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
  8001ac:	64850513          	addi	a0,a0,1608 # 8007f0 <main+0x134>
  8001b0:	f45ff0ef          	jal	8000f4 <cprintf>
  8001b4:	a001                	j	8001b4 <exit+0x14>

00000000008001b6 <fork>:
  8001b6:	bf65                	j	80016e <sys_fork>

00000000008001b8 <waitpid>:
  8001b8:	7179                	addi	sp,sp,-48
  8001ba:	f406                	sd	ra,40(sp)
  8001bc:	ec02                	sd	zero,24(sp)
  8001be:	c999                	beqz	a1,8001d4 <waitpid+0x1c>
  8001c0:	e42e                	sd	a1,8(sp)
  8001c2:	082c                	addi	a1,sp,24
  8001c4:	fafff0ef          	jal	800172 <sys_wait>
  8001c8:	6762                	ld	a4,24(sp)
  8001ca:	67a2                	ld	a5,8(sp)
  8001cc:	70a2                	ld	ra,40(sp)
  8001ce:	c398                	sw	a4,0(a5)
  8001d0:	6145                	addi	sp,sp,48
  8001d2:	8082                	ret
  8001d4:	f9fff0ef          	jal	800172 <sys_wait>
  8001d8:	70a2                	ld	ra,40(sp)
  8001da:	6145                	addi	sp,sp,48
  8001dc:	8082                	ret

00000000008001de <yield>:
  8001de:	bf71                	j	80017a <sys_yield>

00000000008001e0 <initfd>:
  8001e0:	87ae                	mv	a5,a1
  8001e2:	1101                	addi	sp,sp,-32
  8001e4:	e822                	sd	s0,16(sp)
  8001e6:	85b2                	mv	a1,a2
  8001e8:	842a                	mv	s0,a0
  8001ea:	853e                	mv	a0,a5
  8001ec:	ec06                	sd	ra,24(sp)
  8001ee:	e33ff0ef          	jal	800020 <open>
  8001f2:	87aa                	mv	a5,a0
  8001f4:	00054463          	bltz	a0,8001fc <initfd+0x1c>
  8001f8:	00851763          	bne	a0,s0,800206 <initfd+0x26>
  8001fc:	60e2                	ld	ra,24(sp)
  8001fe:	6442                	ld	s0,16(sp)
  800200:	853e                	mv	a0,a5
  800202:	6105                	addi	sp,sp,32
  800204:	8082                	ret
  800206:	e42a                	sd	a0,8(sp)
  800208:	8522                	mv	a0,s0
  80020a:	e1dff0ef          	jal	800026 <close>
  80020e:	6522                	ld	a0,8(sp)
  800210:	85a2                	mv	a1,s0
  800212:	e17ff0ef          	jal	800028 <dup2>
  800216:	842a                	mv	s0,a0
  800218:	6522                	ld	a0,8(sp)
  80021a:	e0dff0ef          	jal	800026 <close>
  80021e:	87a2                	mv	a5,s0
  800220:	bff1                	j	8001fc <initfd+0x1c>

0000000000800222 <umain>:
  800222:	1101                	addi	sp,sp,-32
  800224:	e822                	sd	s0,16(sp)
  800226:	e426                	sd	s1,8(sp)
  800228:	842a                	mv	s0,a0
  80022a:	84ae                	mv	s1,a1
  80022c:	4601                	li	a2,0
  80022e:	00000597          	auipc	a1,0x0
  800232:	5da58593          	addi	a1,a1,1498 # 800808 <main+0x14c>
  800236:	4501                	li	a0,0
  800238:	ec06                	sd	ra,24(sp)
  80023a:	fa7ff0ef          	jal	8001e0 <initfd>
  80023e:	02054263          	bltz	a0,800262 <umain+0x40>
  800242:	4605                	li	a2,1
  800244:	8532                	mv	a0,a2
  800246:	00000597          	auipc	a1,0x0
  80024a:	60258593          	addi	a1,a1,1538 # 800848 <main+0x18c>
  80024e:	f93ff0ef          	jal	8001e0 <initfd>
  800252:	02054563          	bltz	a0,80027c <umain+0x5a>
  800256:	85a6                	mv	a1,s1
  800258:	8522                	mv	a0,s0
  80025a:	462000ef          	jal	8006bc <main>
  80025e:	f43ff0ef          	jal	8001a0 <exit>
  800262:	86aa                	mv	a3,a0
  800264:	00000617          	auipc	a2,0x0
  800268:	5ac60613          	addi	a2,a2,1452 # 800810 <main+0x154>
  80026c:	45e9                	li	a1,26
  80026e:	00000517          	auipc	a0,0x0
  800272:	5c250513          	addi	a0,a0,1474 # 800830 <main+0x174>
  800276:	dfdff0ef          	jal	800072 <__warn>
  80027a:	b7e1                	j	800242 <umain+0x20>
  80027c:	86aa                	mv	a3,a0
  80027e:	00000617          	auipc	a2,0x0
  800282:	5d260613          	addi	a2,a2,1490 # 800850 <main+0x194>
  800286:	45f5                	li	a1,29
  800288:	00000517          	auipc	a0,0x0
  80028c:	5a850513          	addi	a0,a0,1448 # 800830 <main+0x174>
  800290:	de3ff0ef          	jal	800072 <__warn>
  800294:	b7c9                	j	800256 <umain+0x34>

0000000000800296 <printnum>:
  800296:	7139                	addi	sp,sp,-64
  800298:	02071893          	slli	a7,a4,0x20
  80029c:	f822                	sd	s0,48(sp)
  80029e:	f426                	sd	s1,40(sp)
  8002a0:	f04a                	sd	s2,32(sp)
  8002a2:	ec4e                	sd	s3,24(sp)
  8002a4:	e456                	sd	s5,8(sp)
  8002a6:	0208d893          	srli	a7,a7,0x20
  8002aa:	fc06                	sd	ra,56(sp)
  8002ac:	0316fab3          	remu	s5,a3,a7
  8002b0:	fff7841b          	addiw	s0,a5,-1
  8002b4:	84aa                	mv	s1,a0
  8002b6:	89ae                	mv	s3,a1
  8002b8:	8932                	mv	s2,a2
  8002ba:	0516f063          	bgeu	a3,a7,8002fa <printnum+0x64>
  8002be:	e852                	sd	s4,16(sp)
  8002c0:	4705                	li	a4,1
  8002c2:	8a42                	mv	s4,a6
  8002c4:	00f75863          	bge	a4,a5,8002d4 <printnum+0x3e>
  8002c8:	864e                	mv	a2,s3
  8002ca:	85ca                	mv	a1,s2
  8002cc:	8552                	mv	a0,s4
  8002ce:	347d                	addiw	s0,s0,-1
  8002d0:	9482                	jalr	s1
  8002d2:	f87d                	bnez	s0,8002c8 <printnum+0x32>
  8002d4:	6a42                	ld	s4,16(sp)
  8002d6:	00000797          	auipc	a5,0x0
  8002da:	59a78793          	addi	a5,a5,1434 # 800870 <main+0x1b4>
  8002de:	97d6                	add	a5,a5,s5
  8002e0:	7442                	ld	s0,48(sp)
  8002e2:	0007c503          	lbu	a0,0(a5)
  8002e6:	70e2                	ld	ra,56(sp)
  8002e8:	6aa2                	ld	s5,8(sp)
  8002ea:	864e                	mv	a2,s3
  8002ec:	85ca                	mv	a1,s2
  8002ee:	69e2                	ld	s3,24(sp)
  8002f0:	7902                	ld	s2,32(sp)
  8002f2:	87a6                	mv	a5,s1
  8002f4:	74a2                	ld	s1,40(sp)
  8002f6:	6121                	addi	sp,sp,64
  8002f8:	8782                	jr	a5
  8002fa:	0316d6b3          	divu	a3,a3,a7
  8002fe:	87a2                	mv	a5,s0
  800300:	f97ff0ef          	jal	800296 <printnum>
  800304:	bfc9                	j	8002d6 <printnum+0x40>

0000000000800306 <vprintfmt>:
  800306:	7119                	addi	sp,sp,-128
  800308:	f4a6                	sd	s1,104(sp)
  80030a:	f0ca                	sd	s2,96(sp)
  80030c:	ecce                	sd	s3,88(sp)
  80030e:	e8d2                	sd	s4,80(sp)
  800310:	e4d6                	sd	s5,72(sp)
  800312:	e0da                	sd	s6,64(sp)
  800314:	fc5e                	sd	s7,56(sp)
  800316:	f466                	sd	s9,40(sp)
  800318:	fc86                	sd	ra,120(sp)
  80031a:	f8a2                	sd	s0,112(sp)
  80031c:	f862                	sd	s8,48(sp)
  80031e:	f06a                	sd	s10,32(sp)
  800320:	ec6e                	sd	s11,24(sp)
  800322:	84aa                	mv	s1,a0
  800324:	8cb6                	mv	s9,a3
  800326:	8aba                	mv	s5,a4
  800328:	89ae                	mv	s3,a1
  80032a:	8932                	mv	s2,a2
  80032c:	02500a13          	li	s4,37
  800330:	05500b93          	li	s7,85
  800334:	00001b17          	auipc	s6,0x1
  800338:	814b0b13          	addi	s6,s6,-2028 # 800b48 <main+0x48c>
  80033c:	000cc503          	lbu	a0,0(s9)
  800340:	001c8413          	addi	s0,s9,1
  800344:	01450b63          	beq	a0,s4,80035a <vprintfmt+0x54>
  800348:	cd15                	beqz	a0,800384 <vprintfmt+0x7e>
  80034a:	864e                	mv	a2,s3
  80034c:	85ca                	mv	a1,s2
  80034e:	9482                	jalr	s1
  800350:	00044503          	lbu	a0,0(s0)
  800354:	0405                	addi	s0,s0,1
  800356:	ff4519e3          	bne	a0,s4,800348 <vprintfmt+0x42>
  80035a:	5d7d                	li	s10,-1
  80035c:	8dea                	mv	s11,s10
  80035e:	02000813          	li	a6,32
  800362:	4c01                	li	s8,0
  800364:	4581                	li	a1,0
  800366:	00044703          	lbu	a4,0(s0)
  80036a:	00140c93          	addi	s9,s0,1
  80036e:	fdd7061b          	addiw	a2,a4,-35
  800372:	0ff67613          	zext.b	a2,a2
  800376:	02cbe663          	bltu	s7,a2,8003a2 <vprintfmt+0x9c>
  80037a:	060a                	slli	a2,a2,0x2
  80037c:	965a                	add	a2,a2,s6
  80037e:	421c                	lw	a5,0(a2)
  800380:	97da                	add	a5,a5,s6
  800382:	8782                	jr	a5
  800384:	70e6                	ld	ra,120(sp)
  800386:	7446                	ld	s0,112(sp)
  800388:	74a6                	ld	s1,104(sp)
  80038a:	7906                	ld	s2,96(sp)
  80038c:	69e6                	ld	s3,88(sp)
  80038e:	6a46                	ld	s4,80(sp)
  800390:	6aa6                	ld	s5,72(sp)
  800392:	6b06                	ld	s6,64(sp)
  800394:	7be2                	ld	s7,56(sp)
  800396:	7c42                	ld	s8,48(sp)
  800398:	7ca2                	ld	s9,40(sp)
  80039a:	7d02                	ld	s10,32(sp)
  80039c:	6de2                	ld	s11,24(sp)
  80039e:	6109                	addi	sp,sp,128
  8003a0:	8082                	ret
  8003a2:	864e                	mv	a2,s3
  8003a4:	85ca                	mv	a1,s2
  8003a6:	02500513          	li	a0,37
  8003aa:	9482                	jalr	s1
  8003ac:	fff44783          	lbu	a5,-1(s0)
  8003b0:	02500713          	li	a4,37
  8003b4:	8ca2                	mv	s9,s0
  8003b6:	f8e783e3          	beq	a5,a4,80033c <vprintfmt+0x36>
  8003ba:	ffecc783          	lbu	a5,-2(s9)
  8003be:	1cfd                	addi	s9,s9,-1
  8003c0:	fee79de3          	bne	a5,a4,8003ba <vprintfmt+0xb4>
  8003c4:	bfa5                	j	80033c <vprintfmt+0x36>
  8003c6:	00144683          	lbu	a3,1(s0)
  8003ca:	4525                	li	a0,9
  8003cc:	fd070d1b          	addiw	s10,a4,-48
  8003d0:	fd06879b          	addiw	a5,a3,-48
  8003d4:	28f56063          	bltu	a0,a5,800654 <vprintfmt+0x34e>
  8003d8:	2681                	sext.w	a3,a3
  8003da:	8466                	mv	s0,s9
  8003dc:	002d179b          	slliw	a5,s10,0x2
  8003e0:	00144703          	lbu	a4,1(s0)
  8003e4:	01a787bb          	addw	a5,a5,s10
  8003e8:	0017979b          	slliw	a5,a5,0x1
  8003ec:	9fb5                	addw	a5,a5,a3
  8003ee:	fd07061b          	addiw	a2,a4,-48
  8003f2:	0405                	addi	s0,s0,1
  8003f4:	fd078d1b          	addiw	s10,a5,-48
  8003f8:	0007069b          	sext.w	a3,a4
  8003fc:	fec570e3          	bgeu	a0,a2,8003dc <vprintfmt+0xd6>
  800400:	f60dd3e3          	bgez	s11,800366 <vprintfmt+0x60>
  800404:	8dea                	mv	s11,s10
  800406:	5d7d                	li	s10,-1
  800408:	bfb9                	j	800366 <vprintfmt+0x60>
  80040a:	883a                	mv	a6,a4
  80040c:	8466                	mv	s0,s9
  80040e:	bfa1                	j	800366 <vprintfmt+0x60>
  800410:	8466                	mv	s0,s9
  800412:	4c05                	li	s8,1
  800414:	bf89                	j	800366 <vprintfmt+0x60>
  800416:	4785                	li	a5,1
  800418:	008a8613          	addi	a2,s5,8
  80041c:	00b7c463          	blt	a5,a1,800424 <vprintfmt+0x11e>
  800420:	1c058363          	beqz	a1,8005e6 <vprintfmt+0x2e0>
  800424:	000ab683          	ld	a3,0(s5)
  800428:	4741                	li	a4,16
  80042a:	8ab2                	mv	s5,a2
  80042c:	2801                	sext.w	a6,a6
  80042e:	87ee                	mv	a5,s11
  800430:	864a                	mv	a2,s2
  800432:	85ce                	mv	a1,s3
  800434:	8526                	mv	a0,s1
  800436:	e61ff0ef          	jal	800296 <printnum>
  80043a:	b709                	j	80033c <vprintfmt+0x36>
  80043c:	000aa503          	lw	a0,0(s5)
  800440:	864e                	mv	a2,s3
  800442:	85ca                	mv	a1,s2
  800444:	9482                	jalr	s1
  800446:	0aa1                	addi	s5,s5,8
  800448:	bdd5                	j	80033c <vprintfmt+0x36>
  80044a:	4785                	li	a5,1
  80044c:	008a8613          	addi	a2,s5,8
  800450:	00b7c463          	blt	a5,a1,800458 <vprintfmt+0x152>
  800454:	18058463          	beqz	a1,8005dc <vprintfmt+0x2d6>
  800458:	000ab683          	ld	a3,0(s5)
  80045c:	4729                	li	a4,10
  80045e:	8ab2                	mv	s5,a2
  800460:	b7f1                	j	80042c <vprintfmt+0x126>
  800462:	864e                	mv	a2,s3
  800464:	85ca                	mv	a1,s2
  800466:	03000513          	li	a0,48
  80046a:	e042                	sd	a6,0(sp)
  80046c:	9482                	jalr	s1
  80046e:	864e                	mv	a2,s3
  800470:	85ca                	mv	a1,s2
  800472:	07800513          	li	a0,120
  800476:	9482                	jalr	s1
  800478:	000ab683          	ld	a3,0(s5)
  80047c:	6802                	ld	a6,0(sp)
  80047e:	4741                	li	a4,16
  800480:	0aa1                	addi	s5,s5,8
  800482:	b76d                	j	80042c <vprintfmt+0x126>
  800484:	864e                	mv	a2,s3
  800486:	85ca                	mv	a1,s2
  800488:	02500513          	li	a0,37
  80048c:	9482                	jalr	s1
  80048e:	b57d                	j	80033c <vprintfmt+0x36>
  800490:	000aad03          	lw	s10,0(s5)
  800494:	8466                	mv	s0,s9
  800496:	0aa1                	addi	s5,s5,8
  800498:	b7a5                	j	800400 <vprintfmt+0xfa>
  80049a:	4785                	li	a5,1
  80049c:	008a8613          	addi	a2,s5,8
  8004a0:	00b7c463          	blt	a5,a1,8004a8 <vprintfmt+0x1a2>
  8004a4:	12058763          	beqz	a1,8005d2 <vprintfmt+0x2cc>
  8004a8:	000ab683          	ld	a3,0(s5)
  8004ac:	4721                	li	a4,8
  8004ae:	8ab2                	mv	s5,a2
  8004b0:	bfb5                	j	80042c <vprintfmt+0x126>
  8004b2:	87ee                	mv	a5,s11
  8004b4:	000dd363          	bgez	s11,8004ba <vprintfmt+0x1b4>
  8004b8:	4781                	li	a5,0
  8004ba:	00078d9b          	sext.w	s11,a5
  8004be:	8466                	mv	s0,s9
  8004c0:	b55d                	j	800366 <vprintfmt+0x60>
  8004c2:	0008041b          	sext.w	s0,a6
  8004c6:	fd340793          	addi	a5,s0,-45
  8004ca:	01b02733          	sgtz	a4,s11
  8004ce:	00f037b3          	snez	a5,a5
  8004d2:	8ff9                	and	a5,a5,a4
  8004d4:	000ab703          	ld	a4,0(s5)
  8004d8:	008a8693          	addi	a3,s5,8
  8004dc:	e436                	sd	a3,8(sp)
  8004de:	12070563          	beqz	a4,800608 <vprintfmt+0x302>
  8004e2:	12079d63          	bnez	a5,80061c <vprintfmt+0x316>
  8004e6:	00074783          	lbu	a5,0(a4)
  8004ea:	0007851b          	sext.w	a0,a5
  8004ee:	c78d                	beqz	a5,800518 <vprintfmt+0x212>
  8004f0:	00170a93          	addi	s5,a4,1
  8004f4:	547d                	li	s0,-1
  8004f6:	000d4563          	bltz	s10,800500 <vprintfmt+0x1fa>
  8004fa:	3d7d                	addiw	s10,s10,-1
  8004fc:	008d0e63          	beq	s10,s0,800518 <vprintfmt+0x212>
  800500:	020c1863          	bnez	s8,800530 <vprintfmt+0x22a>
  800504:	864e                	mv	a2,s3
  800506:	85ca                	mv	a1,s2
  800508:	9482                	jalr	s1
  80050a:	000ac783          	lbu	a5,0(s5)
  80050e:	0a85                	addi	s5,s5,1
  800510:	3dfd                	addiw	s11,s11,-1
  800512:	0007851b          	sext.w	a0,a5
  800516:	f3e5                	bnez	a5,8004f6 <vprintfmt+0x1f0>
  800518:	01b05a63          	blez	s11,80052c <vprintfmt+0x226>
  80051c:	864e                	mv	a2,s3
  80051e:	85ca                	mv	a1,s2
  800520:	02000513          	li	a0,32
  800524:	3dfd                	addiw	s11,s11,-1
  800526:	9482                	jalr	s1
  800528:	fe0d9ae3          	bnez	s11,80051c <vprintfmt+0x216>
  80052c:	6aa2                	ld	s5,8(sp)
  80052e:	b539                	j	80033c <vprintfmt+0x36>
  800530:	3781                	addiw	a5,a5,-32
  800532:	05e00713          	li	a4,94
  800536:	fcf777e3          	bgeu	a4,a5,800504 <vprintfmt+0x1fe>
  80053a:	03f00513          	li	a0,63
  80053e:	864e                	mv	a2,s3
  800540:	85ca                	mv	a1,s2
  800542:	9482                	jalr	s1
  800544:	000ac783          	lbu	a5,0(s5)
  800548:	0a85                	addi	s5,s5,1
  80054a:	3dfd                	addiw	s11,s11,-1
  80054c:	0007851b          	sext.w	a0,a5
  800550:	d7e1                	beqz	a5,800518 <vprintfmt+0x212>
  800552:	fa0d54e3          	bgez	s10,8004fa <vprintfmt+0x1f4>
  800556:	bfe9                	j	800530 <vprintfmt+0x22a>
  800558:	000aa783          	lw	a5,0(s5)
  80055c:	46e1                	li	a3,24
  80055e:	0aa1                	addi	s5,s5,8
  800560:	41f7d71b          	sraiw	a4,a5,0x1f
  800564:	8fb9                	xor	a5,a5,a4
  800566:	40e7873b          	subw	a4,a5,a4
  80056a:	02e6c663          	blt	a3,a4,800596 <vprintfmt+0x290>
  80056e:	00000797          	auipc	a5,0x0
  800572:	73278793          	addi	a5,a5,1842 # 800ca0 <error_string>
  800576:	00371693          	slli	a3,a4,0x3
  80057a:	97b6                	add	a5,a5,a3
  80057c:	639c                	ld	a5,0(a5)
  80057e:	cf81                	beqz	a5,800596 <vprintfmt+0x290>
  800580:	873e                	mv	a4,a5
  800582:	00000697          	auipc	a3,0x0
  800586:	31e68693          	addi	a3,a3,798 # 8008a0 <main+0x1e4>
  80058a:	864a                	mv	a2,s2
  80058c:	85ce                	mv	a1,s3
  80058e:	8526                	mv	a0,s1
  800590:	0f2000ef          	jal	800682 <printfmt>
  800594:	b365                	j	80033c <vprintfmt+0x36>
  800596:	00000697          	auipc	a3,0x0
  80059a:	2fa68693          	addi	a3,a3,762 # 800890 <main+0x1d4>
  80059e:	864a                	mv	a2,s2
  8005a0:	85ce                	mv	a1,s3
  8005a2:	8526                	mv	a0,s1
  8005a4:	0de000ef          	jal	800682 <printfmt>
  8005a8:	bb51                	j	80033c <vprintfmt+0x36>
  8005aa:	4785                	li	a5,1
  8005ac:	008a8c13          	addi	s8,s5,8
  8005b0:	00b7c363          	blt	a5,a1,8005b6 <vprintfmt+0x2b0>
  8005b4:	cd81                	beqz	a1,8005cc <vprintfmt+0x2c6>
  8005b6:	000ab403          	ld	s0,0(s5)
  8005ba:	02044b63          	bltz	s0,8005f0 <vprintfmt+0x2ea>
  8005be:	86a2                	mv	a3,s0
  8005c0:	8ae2                	mv	s5,s8
  8005c2:	4729                	li	a4,10
  8005c4:	b5a5                	j	80042c <vprintfmt+0x126>
  8005c6:	2585                	addiw	a1,a1,1
  8005c8:	8466                	mv	s0,s9
  8005ca:	bb71                	j	800366 <vprintfmt+0x60>
  8005cc:	000aa403          	lw	s0,0(s5)
  8005d0:	b7ed                	j	8005ba <vprintfmt+0x2b4>
  8005d2:	000ae683          	lwu	a3,0(s5)
  8005d6:	4721                	li	a4,8
  8005d8:	8ab2                	mv	s5,a2
  8005da:	bd89                	j	80042c <vprintfmt+0x126>
  8005dc:	000ae683          	lwu	a3,0(s5)
  8005e0:	4729                	li	a4,10
  8005e2:	8ab2                	mv	s5,a2
  8005e4:	b5a1                	j	80042c <vprintfmt+0x126>
  8005e6:	000ae683          	lwu	a3,0(s5)
  8005ea:	4741                	li	a4,16
  8005ec:	8ab2                	mv	s5,a2
  8005ee:	bd3d                	j	80042c <vprintfmt+0x126>
  8005f0:	864e                	mv	a2,s3
  8005f2:	85ca                	mv	a1,s2
  8005f4:	02d00513          	li	a0,45
  8005f8:	e042                	sd	a6,0(sp)
  8005fa:	9482                	jalr	s1
  8005fc:	6802                	ld	a6,0(sp)
  8005fe:	408006b3          	neg	a3,s0
  800602:	8ae2                	mv	s5,s8
  800604:	4729                	li	a4,10
  800606:	b51d                	j	80042c <vprintfmt+0x126>
  800608:	eba1                	bnez	a5,800658 <vprintfmt+0x352>
  80060a:	02800793          	li	a5,40
  80060e:	853e                	mv	a0,a5
  800610:	00000a97          	auipc	s5,0x0
  800614:	279a8a93          	addi	s5,s5,633 # 800889 <main+0x1cd>
  800618:	547d                	li	s0,-1
  80061a:	bdf1                	j	8004f6 <vprintfmt+0x1f0>
  80061c:	853a                	mv	a0,a4
  80061e:	85ea                	mv	a1,s10
  800620:	e03a                	sd	a4,0(sp)
  800622:	07e000ef          	jal	8006a0 <strnlen>
  800626:	40ad8dbb          	subw	s11,s11,a0
  80062a:	6702                	ld	a4,0(sp)
  80062c:	01b05b63          	blez	s11,800642 <vprintfmt+0x33c>
  800630:	864e                	mv	a2,s3
  800632:	85ca                	mv	a1,s2
  800634:	8522                	mv	a0,s0
  800636:	e03a                	sd	a4,0(sp)
  800638:	3dfd                	addiw	s11,s11,-1
  80063a:	9482                	jalr	s1
  80063c:	6702                	ld	a4,0(sp)
  80063e:	fe0d99e3          	bnez	s11,800630 <vprintfmt+0x32a>
  800642:	00074783          	lbu	a5,0(a4)
  800646:	0007851b          	sext.w	a0,a5
  80064a:	ee0781e3          	beqz	a5,80052c <vprintfmt+0x226>
  80064e:	00170a93          	addi	s5,a4,1
  800652:	b54d                	j	8004f4 <vprintfmt+0x1ee>
  800654:	8466                	mv	s0,s9
  800656:	b36d                	j	800400 <vprintfmt+0xfa>
  800658:	85ea                	mv	a1,s10
  80065a:	00000517          	auipc	a0,0x0
  80065e:	22e50513          	addi	a0,a0,558 # 800888 <main+0x1cc>
  800662:	03e000ef          	jal	8006a0 <strnlen>
  800666:	40ad8dbb          	subw	s11,s11,a0
  80066a:	02800793          	li	a5,40
  80066e:	00000717          	auipc	a4,0x0
  800672:	21a70713          	addi	a4,a4,538 # 800888 <main+0x1cc>
  800676:	853e                	mv	a0,a5
  800678:	fbb04ce3          	bgtz	s11,800630 <vprintfmt+0x32a>
  80067c:	00170a93          	addi	s5,a4,1
  800680:	bd95                	j	8004f4 <vprintfmt+0x1ee>

0000000000800682 <printfmt>:
  800682:	7139                	addi	sp,sp,-64
  800684:	02010313          	addi	t1,sp,32
  800688:	f03a                	sd	a4,32(sp)
  80068a:	871a                	mv	a4,t1
  80068c:	ec06                	sd	ra,24(sp)
  80068e:	f43e                	sd	a5,40(sp)
  800690:	f842                	sd	a6,48(sp)
  800692:	fc46                	sd	a7,56(sp)
  800694:	e41a                	sd	t1,8(sp)
  800696:	c71ff0ef          	jal	800306 <vprintfmt>
  80069a:	60e2                	ld	ra,24(sp)
  80069c:	6121                	addi	sp,sp,64
  80069e:	8082                	ret

00000000008006a0 <strnlen>:
  8006a0:	4781                	li	a5,0
  8006a2:	e589                	bnez	a1,8006ac <strnlen+0xc>
  8006a4:	a811                	j	8006b8 <strnlen+0x18>
  8006a6:	0785                	addi	a5,a5,1
  8006a8:	00f58863          	beq	a1,a5,8006b8 <strnlen+0x18>
  8006ac:	00f50733          	add	a4,a0,a5
  8006b0:	00074703          	lbu	a4,0(a4)
  8006b4:	fb6d                	bnez	a4,8006a6 <strnlen+0x6>
  8006b6:	85be                	mv	a1,a5
  8006b8:	852e                	mv	a0,a1
  8006ba:	8082                	ret

00000000008006bc <main>:
  8006bc:	1101                	addi	sp,sp,-32
  8006be:	ec06                	sd	ra,24(sp)
  8006c0:	e822                	sd	s0,16(sp)
  8006c2:	af5ff0ef          	jal	8001b6 <fork>
  8006c6:	c169                	beqz	a0,800788 <main+0xcc>
  8006c8:	842a                	mv	s0,a0
  8006ca:	0aa05063          	blez	a0,80076a <main+0xae>
  8006ce:	4581                	li	a1,0
  8006d0:	557d                	li	a0,-1
  8006d2:	ae7ff0ef          	jal	8001b8 <waitpid>
  8006d6:	c93d                	beqz	a0,80074c <main+0x90>
  8006d8:	458d                	li	a1,3
  8006da:	05fa                	slli	a1,a1,0x1e
  8006dc:	8522                	mv	a0,s0
  8006de:	adbff0ef          	jal	8001b8 <waitpid>
  8006e2:	c531                	beqz	a0,80072e <main+0x72>
  8006e4:	8522                	mv	a0,s0
  8006e6:	006c                	addi	a1,sp,12
  8006e8:	ad1ff0ef          	jal	8001b8 <waitpid>
  8006ec:	e115                	bnez	a0,800710 <main+0x54>
  8006ee:	4732                	lw	a4,12(sp)
  8006f0:	67b1                	lui	a5,0xc
  8006f2:	eaf78793          	addi	a5,a5,-337 # beaf <open-0x7f4171>
  8006f6:	00f71d63          	bne	a4,a5,800710 <main+0x54>
  8006fa:	00000517          	auipc	a0,0x0
  8006fe:	43e50513          	addi	a0,a0,1086 # 800b38 <main+0x47c>
  800702:	9f3ff0ef          	jal	8000f4 <cprintf>
  800706:	60e2                	ld	ra,24(sp)
  800708:	6442                	ld	s0,16(sp)
  80070a:	4501                	li	a0,0
  80070c:	6105                	addi	sp,sp,32
  80070e:	8082                	ret
  800710:	00000697          	auipc	a3,0x0
  800714:	3f068693          	addi	a3,a3,1008 # 800b00 <main+0x444>
  800718:	00000617          	auipc	a2,0x0
  80071c:	38060613          	addi	a2,a2,896 # 800a98 <main+0x3dc>
  800720:	45c9                	li	a1,18
  800722:	00000517          	auipc	a0,0x0
  800726:	38e50513          	addi	a0,a0,910 # 800ab0 <main+0x3f4>
  80072a:	907ff0ef          	jal	800030 <__panic>
  80072e:	00000697          	auipc	a3,0x0
  800732:	3aa68693          	addi	a3,a3,938 # 800ad8 <main+0x41c>
  800736:	00000617          	auipc	a2,0x0
  80073a:	36260613          	addi	a2,a2,866 # 800a98 <main+0x3dc>
  80073e:	45c5                	li	a1,17
  800740:	00000517          	auipc	a0,0x0
  800744:	37050513          	addi	a0,a0,880 # 800ab0 <main+0x3f4>
  800748:	8e9ff0ef          	jal	800030 <__panic>
  80074c:	00000697          	auipc	a3,0x0
  800750:	37468693          	addi	a3,a3,884 # 800ac0 <main+0x404>
  800754:	00000617          	auipc	a2,0x0
  800758:	34460613          	addi	a2,a2,836 # 800a98 <main+0x3dc>
  80075c:	45c1                	li	a1,16
  80075e:	00000517          	auipc	a0,0x0
  800762:	35250513          	addi	a0,a0,850 # 800ab0 <main+0x3f4>
  800766:	8cbff0ef          	jal	800030 <__panic>
  80076a:	00000697          	auipc	a3,0x0
  80076e:	32668693          	addi	a3,a3,806 # 800a90 <main+0x3d4>
  800772:	00000617          	auipc	a2,0x0
  800776:	32660613          	addi	a2,a2,806 # 800a98 <main+0x3dc>
  80077a:	45bd                	li	a1,15
  80077c:	00000517          	auipc	a0,0x0
  800780:	33450513          	addi	a0,a0,820 # 800ab0 <main+0x3f4>
  800784:	8adff0ef          	jal	800030 <__panic>
  800788:	00000517          	auipc	a0,0x0
  80078c:	2f850513          	addi	a0,a0,760 # 800a80 <main+0x3c4>
  800790:	965ff0ef          	jal	8000f4 <cprintf>
  800794:	4429                	li	s0,10
  800796:	347d                	addiw	s0,s0,-1
  800798:	a47ff0ef          	jal	8001de <yield>
  80079c:	fc6d                	bnez	s0,800796 <main+0xda>
  80079e:	6531                	lui	a0,0xc
  8007a0:	eaf50513          	addi	a0,a0,-337 # beaf <open-0x7f4171>
  8007a4:	9fdff0ef          	jal	8001a0 <exit>
