
obj/__user_priority.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <open>:
  800020:	1582                	slli	a1,a1,0x20
  800022:	9181                	srli	a1,a1,0x20
  800024:	aa8d                	j	800196 <sys_open>

0000000000800026 <close>:
  800026:	aaad                	j	8001a0 <sys_close>

0000000000800028 <dup2>:
  800028:	a241                	j	8001a8 <sys_dup>

000000000080002a <_start>:
  80002a:	214000ef          	jal	80023e <umain>
  80002e:	a001                	j	80002e <_start+0x4>

0000000000800030 <__panic>:
  800030:	715d                	addi	sp,sp,-80
  800032:	02810313          	addi	t1,sp,40
  800036:	e822                	sd	s0,16(sp)
  800038:	8432                	mv	s0,a2
  80003a:	862e                	mv	a2,a1
  80003c:	85aa                	mv	a1,a0
  80003e:	00001517          	auipc	a0,0x1
  800042:	85a50513          	addi	a0,a0,-1958 # 800898 <main+0x1ae>
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
  800064:	85850513          	addi	a0,a0,-1960 # 8008b8 <main+0x1ce>
  800068:	08c000ef          	jal	8000f4 <cprintf>
  80006c:	5559                	li	a0,-10
  80006e:	144000ef          	jal	8001b2 <exit>

0000000000800072 <__warn>:
  800072:	715d                	addi	sp,sp,-80
  800074:	e822                	sd	s0,16(sp)
  800076:	02810313          	addi	t1,sp,40
  80007a:	8432                	mv	s0,a2
  80007c:	862e                	mv	a2,a1
  80007e:	85aa                	mv	a1,a0
  800080:	00001517          	auipc	a0,0x1
  800084:	84050513          	addi	a0,a0,-1984 # 8008c0 <main+0x1d6>
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
  8000a6:	81650513          	addi	a0,a0,-2026 # 8008b8 <main+0x1ce>
  8000aa:	04a000ef          	jal	8000f4 <cprintf>
  8000ae:	60e2                	ld	ra,24(sp)
  8000b0:	6442                	ld	s0,16(sp)
  8000b2:	6161                	addi	sp,sp,80
  8000b4:	8082                	ret

00000000008000b6 <cputch>:
  8000b6:	1101                	addi	sp,sp,-32
  8000b8:	ec06                	sd	ra,24(sp)
  8000ba:	e42e                	sd	a1,8(sp)
  8000bc:	0c8000ef          	jal	800184 <sys_putc>
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
  8000e0:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <acc+0xffffffffff7f5aa9>
  8000e4:	ec06                	sd	ra,24(sp)
  8000e6:	c602                	sw	zero,12(sp)
  8000e8:	23a000ef          	jal	800322 <vprintfmt>
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
  800112:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <acc+0xffffffffff7f5aa9>
  800116:	ec06                	sd	ra,24(sp)
  800118:	e4be                	sd	a5,72(sp)
  80011a:	e8c2                	sd	a6,80(sp)
  80011c:	ecc6                	sd	a7,88(sp)
  80011e:	c202                	sw	zero,4(sp)
  800120:	e41a                	sd	t1,8(sp)
  800122:	200000ef          	jal	800322 <vprintfmt>
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

000000000080017a <sys_kill>:
  80017a:	85aa                	mv	a1,a0
  80017c:	4531                	li	a0,12
  80017e:	bf45                	j	80012e <syscall>

0000000000800180 <sys_getpid>:
  800180:	4549                	li	a0,18
  800182:	b775                	j	80012e <syscall>

0000000000800184 <sys_putc>:
  800184:	85aa                	mv	a1,a0
  800186:	4579                	li	a0,30
  800188:	b75d                	j	80012e <syscall>

000000000080018a <sys_lab6_set_priority>:
  80018a:	85aa                	mv	a1,a0
  80018c:	0ff00513          	li	a0,255
  800190:	bf79                	j	80012e <syscall>

0000000000800192 <sys_gettime>:
  800192:	4545                	li	a0,17
  800194:	bf69                	j	80012e <syscall>

0000000000800196 <sys_open>:
  800196:	862e                	mv	a2,a1
  800198:	85aa                	mv	a1,a0
  80019a:	06400513          	li	a0,100
  80019e:	bf41                	j	80012e <syscall>

00000000008001a0 <sys_close>:
  8001a0:	85aa                	mv	a1,a0
  8001a2:	06500513          	li	a0,101
  8001a6:	b761                	j	80012e <syscall>

00000000008001a8 <sys_dup>:
  8001a8:	862e                	mv	a2,a1
  8001aa:	85aa                	mv	a1,a0
  8001ac:	08200513          	li	a0,130
  8001b0:	bfbd                	j	80012e <syscall>

00000000008001b2 <exit>:
  8001b2:	1141                	addi	sp,sp,-16
  8001b4:	e406                	sd	ra,8(sp)
  8001b6:	fb3ff0ef          	jal	800168 <sys_exit>
  8001ba:	00000517          	auipc	a0,0x0
  8001be:	72650513          	addi	a0,a0,1830 # 8008e0 <main+0x1f6>
  8001c2:	f33ff0ef          	jal	8000f4 <cprintf>
  8001c6:	a001                	j	8001c6 <exit+0x14>

00000000008001c8 <fork>:
  8001c8:	b75d                	j	80016e <sys_fork>

00000000008001ca <waitpid>:
  8001ca:	7179                	addi	sp,sp,-48
  8001cc:	f406                	sd	ra,40(sp)
  8001ce:	ec02                	sd	zero,24(sp)
  8001d0:	c999                	beqz	a1,8001e6 <waitpid+0x1c>
  8001d2:	e42e                	sd	a1,8(sp)
  8001d4:	082c                	addi	a1,sp,24
  8001d6:	f9dff0ef          	jal	800172 <sys_wait>
  8001da:	6762                	ld	a4,24(sp)
  8001dc:	67a2                	ld	a5,8(sp)
  8001de:	70a2                	ld	ra,40(sp)
  8001e0:	c398                	sw	a4,0(a5)
  8001e2:	6145                	addi	sp,sp,48
  8001e4:	8082                	ret
  8001e6:	f8dff0ef          	jal	800172 <sys_wait>
  8001ea:	70a2                	ld	ra,40(sp)
  8001ec:	6145                	addi	sp,sp,48
  8001ee:	8082                	ret

00000000008001f0 <kill>:
  8001f0:	b769                	j	80017a <sys_kill>

00000000008001f2 <getpid>:
  8001f2:	b779                	j	800180 <sys_getpid>

00000000008001f4 <gettime_msec>:
  8001f4:	bf79                	j	800192 <sys_gettime>

00000000008001f6 <lab6_set_priority>:
  8001f6:	1502                	slli	a0,a0,0x20
  8001f8:	9101                	srli	a0,a0,0x20
  8001fa:	bf41                	j	80018a <sys_lab6_set_priority>

00000000008001fc <initfd>:
  8001fc:	87ae                	mv	a5,a1
  8001fe:	1101                	addi	sp,sp,-32
  800200:	e822                	sd	s0,16(sp)
  800202:	85b2                	mv	a1,a2
  800204:	842a                	mv	s0,a0
  800206:	853e                	mv	a0,a5
  800208:	ec06                	sd	ra,24(sp)
  80020a:	e17ff0ef          	jal	800020 <open>
  80020e:	87aa                	mv	a5,a0
  800210:	00054463          	bltz	a0,800218 <initfd+0x1c>
  800214:	00851763          	bne	a0,s0,800222 <initfd+0x26>
  800218:	60e2                	ld	ra,24(sp)
  80021a:	6442                	ld	s0,16(sp)
  80021c:	853e                	mv	a0,a5
  80021e:	6105                	addi	sp,sp,32
  800220:	8082                	ret
  800222:	e42a                	sd	a0,8(sp)
  800224:	8522                	mv	a0,s0
  800226:	e01ff0ef          	jal	800026 <close>
  80022a:	6522                	ld	a0,8(sp)
  80022c:	85a2                	mv	a1,s0
  80022e:	dfbff0ef          	jal	800028 <dup2>
  800232:	842a                	mv	s0,a0
  800234:	6522                	ld	a0,8(sp)
  800236:	df1ff0ef          	jal	800026 <close>
  80023a:	87a2                	mv	a5,s0
  80023c:	bff1                	j	800218 <initfd+0x1c>

000000000080023e <umain>:
  80023e:	1101                	addi	sp,sp,-32
  800240:	e822                	sd	s0,16(sp)
  800242:	e426                	sd	s1,8(sp)
  800244:	842a                	mv	s0,a0
  800246:	84ae                	mv	s1,a1
  800248:	4601                	li	a2,0
  80024a:	00000597          	auipc	a1,0x0
  80024e:	6ae58593          	addi	a1,a1,1710 # 8008f8 <main+0x20e>
  800252:	4501                	li	a0,0
  800254:	ec06                	sd	ra,24(sp)
  800256:	fa7ff0ef          	jal	8001fc <initfd>
  80025a:	02054263          	bltz	a0,80027e <umain+0x40>
  80025e:	4605                	li	a2,1
  800260:	8532                	mv	a0,a2
  800262:	00000597          	auipc	a1,0x0
  800266:	6d658593          	addi	a1,a1,1750 # 800938 <main+0x24e>
  80026a:	f93ff0ef          	jal	8001fc <initfd>
  80026e:	02054563          	bltz	a0,800298 <umain+0x5a>
  800272:	85a6                	mv	a1,s1
  800274:	8522                	mv	a0,s0
  800276:	474000ef          	jal	8006ea <main>
  80027a:	f39ff0ef          	jal	8001b2 <exit>
  80027e:	86aa                	mv	a3,a0
  800280:	00000617          	auipc	a2,0x0
  800284:	68060613          	addi	a2,a2,1664 # 800900 <main+0x216>
  800288:	45e9                	li	a1,26
  80028a:	00000517          	auipc	a0,0x0
  80028e:	69650513          	addi	a0,a0,1686 # 800920 <main+0x236>
  800292:	de1ff0ef          	jal	800072 <__warn>
  800296:	b7e1                	j	80025e <umain+0x20>
  800298:	86aa                	mv	a3,a0
  80029a:	00000617          	auipc	a2,0x0
  80029e:	6a660613          	addi	a2,a2,1702 # 800940 <main+0x256>
  8002a2:	45f5                	li	a1,29
  8002a4:	00000517          	auipc	a0,0x0
  8002a8:	67c50513          	addi	a0,a0,1660 # 800920 <main+0x236>
  8002ac:	dc7ff0ef          	jal	800072 <__warn>
  8002b0:	b7c9                	j	800272 <umain+0x34>

00000000008002b2 <printnum>:
  8002b2:	7139                	addi	sp,sp,-64
  8002b4:	02071893          	slli	a7,a4,0x20
  8002b8:	f822                	sd	s0,48(sp)
  8002ba:	f426                	sd	s1,40(sp)
  8002bc:	f04a                	sd	s2,32(sp)
  8002be:	ec4e                	sd	s3,24(sp)
  8002c0:	e456                	sd	s5,8(sp)
  8002c2:	0208d893          	srli	a7,a7,0x20
  8002c6:	fc06                	sd	ra,56(sp)
  8002c8:	0316fab3          	remu	s5,a3,a7
  8002cc:	fff7841b          	addiw	s0,a5,-1
  8002d0:	84aa                	mv	s1,a0
  8002d2:	89ae                	mv	s3,a1
  8002d4:	8932                	mv	s2,a2
  8002d6:	0516f063          	bgeu	a3,a7,800316 <printnum+0x64>
  8002da:	e852                	sd	s4,16(sp)
  8002dc:	4705                	li	a4,1
  8002de:	8a42                	mv	s4,a6
  8002e0:	00f75863          	bge	a4,a5,8002f0 <printnum+0x3e>
  8002e4:	864e                	mv	a2,s3
  8002e6:	85ca                	mv	a1,s2
  8002e8:	8552                	mv	a0,s4
  8002ea:	347d                	addiw	s0,s0,-1
  8002ec:	9482                	jalr	s1
  8002ee:	f87d                	bnez	s0,8002e4 <printnum+0x32>
  8002f0:	6a42                	ld	s4,16(sp)
  8002f2:	00000797          	auipc	a5,0x0
  8002f6:	66e78793          	addi	a5,a5,1646 # 800960 <main+0x276>
  8002fa:	97d6                	add	a5,a5,s5
  8002fc:	7442                	ld	s0,48(sp)
  8002fe:	0007c503          	lbu	a0,0(a5)
  800302:	70e2                	ld	ra,56(sp)
  800304:	6aa2                	ld	s5,8(sp)
  800306:	864e                	mv	a2,s3
  800308:	85ca                	mv	a1,s2
  80030a:	69e2                	ld	s3,24(sp)
  80030c:	7902                	ld	s2,32(sp)
  80030e:	87a6                	mv	a5,s1
  800310:	74a2                	ld	s1,40(sp)
  800312:	6121                	addi	sp,sp,64
  800314:	8782                	jr	a5
  800316:	0316d6b3          	divu	a3,a3,a7
  80031a:	87a2                	mv	a5,s0
  80031c:	f97ff0ef          	jal	8002b2 <printnum>
  800320:	bfc9                	j	8002f2 <printnum+0x40>

0000000000800322 <vprintfmt>:
  800322:	7119                	addi	sp,sp,-128
  800324:	f4a6                	sd	s1,104(sp)
  800326:	f0ca                	sd	s2,96(sp)
  800328:	ecce                	sd	s3,88(sp)
  80032a:	e8d2                	sd	s4,80(sp)
  80032c:	e4d6                	sd	s5,72(sp)
  80032e:	e0da                	sd	s6,64(sp)
  800330:	fc5e                	sd	s7,56(sp)
  800332:	f466                	sd	s9,40(sp)
  800334:	fc86                	sd	ra,120(sp)
  800336:	f8a2                	sd	s0,112(sp)
  800338:	f862                	sd	s8,48(sp)
  80033a:	f06a                	sd	s10,32(sp)
  80033c:	ec6e                	sd	s11,24(sp)
  80033e:	84aa                	mv	s1,a0
  800340:	8cb6                	mv	s9,a3
  800342:	8aba                	mv	s5,a4
  800344:	89ae                	mv	s3,a1
  800346:	8932                	mv	s2,a2
  800348:	02500a13          	li	s4,37
  80034c:	05500b93          	li	s7,85
  800350:	00001b17          	auipc	s6,0x1
  800354:	8e8b0b13          	addi	s6,s6,-1816 # 800c38 <main+0x54e>
  800358:	000cc503          	lbu	a0,0(s9)
  80035c:	001c8413          	addi	s0,s9,1
  800360:	01450b63          	beq	a0,s4,800376 <vprintfmt+0x54>
  800364:	cd15                	beqz	a0,8003a0 <vprintfmt+0x7e>
  800366:	864e                	mv	a2,s3
  800368:	85ca                	mv	a1,s2
  80036a:	9482                	jalr	s1
  80036c:	00044503          	lbu	a0,0(s0)
  800370:	0405                	addi	s0,s0,1
  800372:	ff4519e3          	bne	a0,s4,800364 <vprintfmt+0x42>
  800376:	5d7d                	li	s10,-1
  800378:	8dea                	mv	s11,s10
  80037a:	02000813          	li	a6,32
  80037e:	4c01                	li	s8,0
  800380:	4581                	li	a1,0
  800382:	00044703          	lbu	a4,0(s0)
  800386:	00140c93          	addi	s9,s0,1
  80038a:	fdd7061b          	addiw	a2,a4,-35
  80038e:	0ff67613          	zext.b	a2,a2
  800392:	02cbe663          	bltu	s7,a2,8003be <vprintfmt+0x9c>
  800396:	060a                	slli	a2,a2,0x2
  800398:	965a                	add	a2,a2,s6
  80039a:	421c                	lw	a5,0(a2)
  80039c:	97da                	add	a5,a5,s6
  80039e:	8782                	jr	a5
  8003a0:	70e6                	ld	ra,120(sp)
  8003a2:	7446                	ld	s0,112(sp)
  8003a4:	74a6                	ld	s1,104(sp)
  8003a6:	7906                	ld	s2,96(sp)
  8003a8:	69e6                	ld	s3,88(sp)
  8003aa:	6a46                	ld	s4,80(sp)
  8003ac:	6aa6                	ld	s5,72(sp)
  8003ae:	6b06                	ld	s6,64(sp)
  8003b0:	7be2                	ld	s7,56(sp)
  8003b2:	7c42                	ld	s8,48(sp)
  8003b4:	7ca2                	ld	s9,40(sp)
  8003b6:	7d02                	ld	s10,32(sp)
  8003b8:	6de2                	ld	s11,24(sp)
  8003ba:	6109                	addi	sp,sp,128
  8003bc:	8082                	ret
  8003be:	864e                	mv	a2,s3
  8003c0:	85ca                	mv	a1,s2
  8003c2:	02500513          	li	a0,37
  8003c6:	9482                	jalr	s1
  8003c8:	fff44783          	lbu	a5,-1(s0)
  8003cc:	02500713          	li	a4,37
  8003d0:	8ca2                	mv	s9,s0
  8003d2:	f8e783e3          	beq	a5,a4,800358 <vprintfmt+0x36>
  8003d6:	ffecc783          	lbu	a5,-2(s9)
  8003da:	1cfd                	addi	s9,s9,-1
  8003dc:	fee79de3          	bne	a5,a4,8003d6 <vprintfmt+0xb4>
  8003e0:	bfa5                	j	800358 <vprintfmt+0x36>
  8003e2:	00144683          	lbu	a3,1(s0)
  8003e6:	4525                	li	a0,9
  8003e8:	fd070d1b          	addiw	s10,a4,-48
  8003ec:	fd06879b          	addiw	a5,a3,-48
  8003f0:	28f56063          	bltu	a0,a5,800670 <vprintfmt+0x34e>
  8003f4:	2681                	sext.w	a3,a3
  8003f6:	8466                	mv	s0,s9
  8003f8:	002d179b          	slliw	a5,s10,0x2
  8003fc:	00144703          	lbu	a4,1(s0)
  800400:	01a787bb          	addw	a5,a5,s10
  800404:	0017979b          	slliw	a5,a5,0x1
  800408:	9fb5                	addw	a5,a5,a3
  80040a:	fd07061b          	addiw	a2,a4,-48
  80040e:	0405                	addi	s0,s0,1
  800410:	fd078d1b          	addiw	s10,a5,-48
  800414:	0007069b          	sext.w	a3,a4
  800418:	fec570e3          	bgeu	a0,a2,8003f8 <vprintfmt+0xd6>
  80041c:	f60dd3e3          	bgez	s11,800382 <vprintfmt+0x60>
  800420:	8dea                	mv	s11,s10
  800422:	5d7d                	li	s10,-1
  800424:	bfb9                	j	800382 <vprintfmt+0x60>
  800426:	883a                	mv	a6,a4
  800428:	8466                	mv	s0,s9
  80042a:	bfa1                	j	800382 <vprintfmt+0x60>
  80042c:	8466                	mv	s0,s9
  80042e:	4c05                	li	s8,1
  800430:	bf89                	j	800382 <vprintfmt+0x60>
  800432:	4785                	li	a5,1
  800434:	008a8613          	addi	a2,s5,8
  800438:	00b7c463          	blt	a5,a1,800440 <vprintfmt+0x11e>
  80043c:	1c058363          	beqz	a1,800602 <vprintfmt+0x2e0>
  800440:	000ab683          	ld	a3,0(s5)
  800444:	4741                	li	a4,16
  800446:	8ab2                	mv	s5,a2
  800448:	2801                	sext.w	a6,a6
  80044a:	87ee                	mv	a5,s11
  80044c:	864a                	mv	a2,s2
  80044e:	85ce                	mv	a1,s3
  800450:	8526                	mv	a0,s1
  800452:	e61ff0ef          	jal	8002b2 <printnum>
  800456:	b709                	j	800358 <vprintfmt+0x36>
  800458:	000aa503          	lw	a0,0(s5)
  80045c:	864e                	mv	a2,s3
  80045e:	85ca                	mv	a1,s2
  800460:	9482                	jalr	s1
  800462:	0aa1                	addi	s5,s5,8
  800464:	bdd5                	j	800358 <vprintfmt+0x36>
  800466:	4785                	li	a5,1
  800468:	008a8613          	addi	a2,s5,8
  80046c:	00b7c463          	blt	a5,a1,800474 <vprintfmt+0x152>
  800470:	18058463          	beqz	a1,8005f8 <vprintfmt+0x2d6>
  800474:	000ab683          	ld	a3,0(s5)
  800478:	4729                	li	a4,10
  80047a:	8ab2                	mv	s5,a2
  80047c:	b7f1                	j	800448 <vprintfmt+0x126>
  80047e:	864e                	mv	a2,s3
  800480:	85ca                	mv	a1,s2
  800482:	03000513          	li	a0,48
  800486:	e042                	sd	a6,0(sp)
  800488:	9482                	jalr	s1
  80048a:	864e                	mv	a2,s3
  80048c:	85ca                	mv	a1,s2
  80048e:	07800513          	li	a0,120
  800492:	9482                	jalr	s1
  800494:	000ab683          	ld	a3,0(s5)
  800498:	6802                	ld	a6,0(sp)
  80049a:	4741                	li	a4,16
  80049c:	0aa1                	addi	s5,s5,8
  80049e:	b76d                	j	800448 <vprintfmt+0x126>
  8004a0:	864e                	mv	a2,s3
  8004a2:	85ca                	mv	a1,s2
  8004a4:	02500513          	li	a0,37
  8004a8:	9482                	jalr	s1
  8004aa:	b57d                	j	800358 <vprintfmt+0x36>
  8004ac:	000aad03          	lw	s10,0(s5)
  8004b0:	8466                	mv	s0,s9
  8004b2:	0aa1                	addi	s5,s5,8
  8004b4:	b7a5                	j	80041c <vprintfmt+0xfa>
  8004b6:	4785                	li	a5,1
  8004b8:	008a8613          	addi	a2,s5,8
  8004bc:	00b7c463          	blt	a5,a1,8004c4 <vprintfmt+0x1a2>
  8004c0:	12058763          	beqz	a1,8005ee <vprintfmt+0x2cc>
  8004c4:	000ab683          	ld	a3,0(s5)
  8004c8:	4721                	li	a4,8
  8004ca:	8ab2                	mv	s5,a2
  8004cc:	bfb5                	j	800448 <vprintfmt+0x126>
  8004ce:	87ee                	mv	a5,s11
  8004d0:	000dd363          	bgez	s11,8004d6 <vprintfmt+0x1b4>
  8004d4:	4781                	li	a5,0
  8004d6:	00078d9b          	sext.w	s11,a5
  8004da:	8466                	mv	s0,s9
  8004dc:	b55d                	j	800382 <vprintfmt+0x60>
  8004de:	0008041b          	sext.w	s0,a6
  8004e2:	fd340793          	addi	a5,s0,-45
  8004e6:	01b02733          	sgtz	a4,s11
  8004ea:	00f037b3          	snez	a5,a5
  8004ee:	8ff9                	and	a5,a5,a4
  8004f0:	000ab703          	ld	a4,0(s5)
  8004f4:	008a8693          	addi	a3,s5,8
  8004f8:	e436                	sd	a3,8(sp)
  8004fa:	12070563          	beqz	a4,800624 <vprintfmt+0x302>
  8004fe:	12079d63          	bnez	a5,800638 <vprintfmt+0x316>
  800502:	00074783          	lbu	a5,0(a4)
  800506:	0007851b          	sext.w	a0,a5
  80050a:	c78d                	beqz	a5,800534 <vprintfmt+0x212>
  80050c:	00170a93          	addi	s5,a4,1
  800510:	547d                	li	s0,-1
  800512:	000d4563          	bltz	s10,80051c <vprintfmt+0x1fa>
  800516:	3d7d                	addiw	s10,s10,-1
  800518:	008d0e63          	beq	s10,s0,800534 <vprintfmt+0x212>
  80051c:	020c1863          	bnez	s8,80054c <vprintfmt+0x22a>
  800520:	864e                	mv	a2,s3
  800522:	85ca                	mv	a1,s2
  800524:	9482                	jalr	s1
  800526:	000ac783          	lbu	a5,0(s5)
  80052a:	0a85                	addi	s5,s5,1
  80052c:	3dfd                	addiw	s11,s11,-1
  80052e:	0007851b          	sext.w	a0,a5
  800532:	f3e5                	bnez	a5,800512 <vprintfmt+0x1f0>
  800534:	01b05a63          	blez	s11,800548 <vprintfmt+0x226>
  800538:	864e                	mv	a2,s3
  80053a:	85ca                	mv	a1,s2
  80053c:	02000513          	li	a0,32
  800540:	3dfd                	addiw	s11,s11,-1
  800542:	9482                	jalr	s1
  800544:	fe0d9ae3          	bnez	s11,800538 <vprintfmt+0x216>
  800548:	6aa2                	ld	s5,8(sp)
  80054a:	b539                	j	800358 <vprintfmt+0x36>
  80054c:	3781                	addiw	a5,a5,-32
  80054e:	05e00713          	li	a4,94
  800552:	fcf777e3          	bgeu	a4,a5,800520 <vprintfmt+0x1fe>
  800556:	03f00513          	li	a0,63
  80055a:	864e                	mv	a2,s3
  80055c:	85ca                	mv	a1,s2
  80055e:	9482                	jalr	s1
  800560:	000ac783          	lbu	a5,0(s5)
  800564:	0a85                	addi	s5,s5,1
  800566:	3dfd                	addiw	s11,s11,-1
  800568:	0007851b          	sext.w	a0,a5
  80056c:	d7e1                	beqz	a5,800534 <vprintfmt+0x212>
  80056e:	fa0d54e3          	bgez	s10,800516 <vprintfmt+0x1f4>
  800572:	bfe9                	j	80054c <vprintfmt+0x22a>
  800574:	000aa783          	lw	a5,0(s5)
  800578:	46e1                	li	a3,24
  80057a:	0aa1                	addi	s5,s5,8
  80057c:	41f7d71b          	sraiw	a4,a5,0x1f
  800580:	8fb9                	xor	a5,a5,a4
  800582:	40e7873b          	subw	a4,a5,a4
  800586:	02e6c663          	blt	a3,a4,8005b2 <vprintfmt+0x290>
  80058a:	00001797          	auipc	a5,0x1
  80058e:	80678793          	addi	a5,a5,-2042 # 800d90 <error_string>
  800592:	00371693          	slli	a3,a4,0x3
  800596:	97b6                	add	a5,a5,a3
  800598:	639c                	ld	a5,0(a5)
  80059a:	cf81                	beqz	a5,8005b2 <vprintfmt+0x290>
  80059c:	873e                	mv	a4,a5
  80059e:	00000697          	auipc	a3,0x0
  8005a2:	3f268693          	addi	a3,a3,1010 # 800990 <main+0x2a6>
  8005a6:	864a                	mv	a2,s2
  8005a8:	85ce                	mv	a1,s3
  8005aa:	8526                	mv	a0,s1
  8005ac:	0f2000ef          	jal	80069e <printfmt>
  8005b0:	b365                	j	800358 <vprintfmt+0x36>
  8005b2:	00000697          	auipc	a3,0x0
  8005b6:	3ce68693          	addi	a3,a3,974 # 800980 <main+0x296>
  8005ba:	864a                	mv	a2,s2
  8005bc:	85ce                	mv	a1,s3
  8005be:	8526                	mv	a0,s1
  8005c0:	0de000ef          	jal	80069e <printfmt>
  8005c4:	bb51                	j	800358 <vprintfmt+0x36>
  8005c6:	4785                	li	a5,1
  8005c8:	008a8c13          	addi	s8,s5,8
  8005cc:	00b7c363          	blt	a5,a1,8005d2 <vprintfmt+0x2b0>
  8005d0:	cd81                	beqz	a1,8005e8 <vprintfmt+0x2c6>
  8005d2:	000ab403          	ld	s0,0(s5)
  8005d6:	02044b63          	bltz	s0,80060c <vprintfmt+0x2ea>
  8005da:	86a2                	mv	a3,s0
  8005dc:	8ae2                	mv	s5,s8
  8005de:	4729                	li	a4,10
  8005e0:	b5a5                	j	800448 <vprintfmt+0x126>
  8005e2:	2585                	addiw	a1,a1,1
  8005e4:	8466                	mv	s0,s9
  8005e6:	bb71                	j	800382 <vprintfmt+0x60>
  8005e8:	000aa403          	lw	s0,0(s5)
  8005ec:	b7ed                	j	8005d6 <vprintfmt+0x2b4>
  8005ee:	000ae683          	lwu	a3,0(s5)
  8005f2:	4721                	li	a4,8
  8005f4:	8ab2                	mv	s5,a2
  8005f6:	bd89                	j	800448 <vprintfmt+0x126>
  8005f8:	000ae683          	lwu	a3,0(s5)
  8005fc:	4729                	li	a4,10
  8005fe:	8ab2                	mv	s5,a2
  800600:	b5a1                	j	800448 <vprintfmt+0x126>
  800602:	000ae683          	lwu	a3,0(s5)
  800606:	4741                	li	a4,16
  800608:	8ab2                	mv	s5,a2
  80060a:	bd3d                	j	800448 <vprintfmt+0x126>
  80060c:	864e                	mv	a2,s3
  80060e:	85ca                	mv	a1,s2
  800610:	02d00513          	li	a0,45
  800614:	e042                	sd	a6,0(sp)
  800616:	9482                	jalr	s1
  800618:	6802                	ld	a6,0(sp)
  80061a:	408006b3          	neg	a3,s0
  80061e:	8ae2                	mv	s5,s8
  800620:	4729                	li	a4,10
  800622:	b51d                	j	800448 <vprintfmt+0x126>
  800624:	eba1                	bnez	a5,800674 <vprintfmt+0x352>
  800626:	02800793          	li	a5,40
  80062a:	853e                	mv	a0,a5
  80062c:	00000a97          	auipc	s5,0x0
  800630:	34da8a93          	addi	s5,s5,845 # 800979 <main+0x28f>
  800634:	547d                	li	s0,-1
  800636:	bdf1                	j	800512 <vprintfmt+0x1f0>
  800638:	853a                	mv	a0,a4
  80063a:	85ea                	mv	a1,s10
  80063c:	e03a                	sd	a4,0(sp)
  80063e:	07e000ef          	jal	8006bc <strnlen>
  800642:	40ad8dbb          	subw	s11,s11,a0
  800646:	6702                	ld	a4,0(sp)
  800648:	01b05b63          	blez	s11,80065e <vprintfmt+0x33c>
  80064c:	864e                	mv	a2,s3
  80064e:	85ca                	mv	a1,s2
  800650:	8522                	mv	a0,s0
  800652:	e03a                	sd	a4,0(sp)
  800654:	3dfd                	addiw	s11,s11,-1
  800656:	9482                	jalr	s1
  800658:	6702                	ld	a4,0(sp)
  80065a:	fe0d99e3          	bnez	s11,80064c <vprintfmt+0x32a>
  80065e:	00074783          	lbu	a5,0(a4)
  800662:	0007851b          	sext.w	a0,a5
  800666:	ee0781e3          	beqz	a5,800548 <vprintfmt+0x226>
  80066a:	00170a93          	addi	s5,a4,1
  80066e:	b54d                	j	800510 <vprintfmt+0x1ee>
  800670:	8466                	mv	s0,s9
  800672:	b36d                	j	80041c <vprintfmt+0xfa>
  800674:	85ea                	mv	a1,s10
  800676:	00000517          	auipc	a0,0x0
  80067a:	30250513          	addi	a0,a0,770 # 800978 <main+0x28e>
  80067e:	03e000ef          	jal	8006bc <strnlen>
  800682:	40ad8dbb          	subw	s11,s11,a0
  800686:	02800793          	li	a5,40
  80068a:	00000717          	auipc	a4,0x0
  80068e:	2ee70713          	addi	a4,a4,750 # 800978 <main+0x28e>
  800692:	853e                	mv	a0,a5
  800694:	fbb04ce3          	bgtz	s11,80064c <vprintfmt+0x32a>
  800698:	00170a93          	addi	s5,a4,1
  80069c:	bd95                	j	800510 <vprintfmt+0x1ee>

000000000080069e <printfmt>:
  80069e:	7139                	addi	sp,sp,-64
  8006a0:	02010313          	addi	t1,sp,32
  8006a4:	f03a                	sd	a4,32(sp)
  8006a6:	871a                	mv	a4,t1
  8006a8:	ec06                	sd	ra,24(sp)
  8006aa:	f43e                	sd	a5,40(sp)
  8006ac:	f842                	sd	a6,48(sp)
  8006ae:	fc46                	sd	a7,56(sp)
  8006b0:	e41a                	sd	t1,8(sp)
  8006b2:	c71ff0ef          	jal	800322 <vprintfmt>
  8006b6:	60e2                	ld	ra,24(sp)
  8006b8:	6121                	addi	sp,sp,64
  8006ba:	8082                	ret

00000000008006bc <strnlen>:
  8006bc:	4781                	li	a5,0
  8006be:	e589                	bnez	a1,8006c8 <strnlen+0xc>
  8006c0:	a811                	j	8006d4 <strnlen+0x18>
  8006c2:	0785                	addi	a5,a5,1
  8006c4:	00f58863          	beq	a1,a5,8006d4 <strnlen+0x18>
  8006c8:	00f50733          	add	a4,a0,a5
  8006cc:	00074703          	lbu	a4,0(a4)
  8006d0:	fb6d                	bnez	a4,8006c2 <strnlen+0x6>
  8006d2:	85be                	mv	a1,a5
  8006d4:	852e                	mv	a0,a1
  8006d6:	8082                	ret

00000000008006d8 <memset>:
  8006d8:	ca01                	beqz	a2,8006e8 <memset+0x10>
  8006da:	962a                	add	a2,a2,a0
  8006dc:	87aa                	mv	a5,a0
  8006de:	0785                	addi	a5,a5,1
  8006e0:	feb78fa3          	sb	a1,-1(a5)
  8006e4:	fef61de3          	bne	a2,a5,8006de <memset+0x6>
  8006e8:	8082                	ret

00000000008006ea <main>:
  8006ea:	715d                	addi	sp,sp,-80
  8006ec:	4651                	li	a2,20
  8006ee:	4581                	li	a1,0
  8006f0:	00001517          	auipc	a0,0x1
  8006f4:	91050513          	addi	a0,a0,-1776 # 801000 <pids>
  8006f8:	e486                	sd	ra,72(sp)
  8006fa:	e0a2                	sd	s0,64(sp)
  8006fc:	fc26                	sd	s1,56(sp)
  8006fe:	f84a                	sd	s2,48(sp)
  800700:	f44e                	sd	s3,40(sp)
  800702:	f052                	sd	s4,32(sp)
  800704:	ec56                	sd	s5,24(sp)
  800706:	fd3ff0ef          	jal	8006d8 <memset>
  80070a:	4519                	li	a0,6
  80070c:	00001a97          	auipc	s5,0x1
  800710:	924a8a93          	addi	s5,s5,-1756 # 801030 <acc>
  800714:	00001497          	auipc	s1,0x1
  800718:	8ec48493          	addi	s1,s1,-1812 # 801000 <pids>
  80071c:	adbff0ef          	jal	8001f6 <lab6_set_priority>
  800720:	89d6                	mv	s3,s5
  800722:	8926                	mv	s2,s1
  800724:	4401                	li	s0,0
  800726:	4a15                	li	s4,5
  800728:	0009a023          	sw	zero,0(s3)
  80072c:	a9dff0ef          	jal	8001c8 <fork>
  800730:	00a92023          	sw	a0,0(s2)
  800734:	c561                	beqz	a0,8007fc <main+0x112>
  800736:	12054863          	bltz	a0,800866 <main+0x17c>
  80073a:	2405                	addiw	s0,s0,1
  80073c:	0991                	addi	s3,s3,4
  80073e:	0911                	addi	s2,s2,4
  800740:	ff4414e3          	bne	s0,s4,800728 <main+0x3e>
  800744:	00000517          	auipc	a0,0x0
  800748:	44c50513          	addi	a0,a0,1100 # 800b90 <main+0x4a6>
  80074c:	00001917          	auipc	s2,0x1
  800750:	8cc90913          	addi	s2,s2,-1844 # 801018 <status>
  800754:	9a1ff0ef          	jal	8000f4 <cprintf>
  800758:	844a                	mv	s0,s2
  80075a:	00001997          	auipc	s3,0x1
  80075e:	8d298993          	addi	s3,s3,-1838 # 80102c <status+0x14>
  800762:	4088                	lw	a0,0(s1)
  800764:	85a2                	mv	a1,s0
  800766:	00042023          	sw	zero,0(s0)
  80076a:	a61ff0ef          	jal	8001ca <waitpid>
  80076e:	0004aa03          	lw	s4,0(s1)
  800772:	00042a83          	lw	s5,0(s0)
  800776:	a7fff0ef          	jal	8001f4 <gettime_msec>
  80077a:	86aa                	mv	a3,a0
  80077c:	8656                	mv	a2,s5
  80077e:	85d2                	mv	a1,s4
  800780:	00000517          	auipc	a0,0x0
  800784:	43850513          	addi	a0,a0,1080 # 800bb8 <main+0x4ce>
  800788:	0411                	addi	s0,s0,4
  80078a:	96bff0ef          	jal	8000f4 <cprintf>
  80078e:	0491                	addi	s1,s1,4
  800790:	fd3419e3          	bne	s0,s3,800762 <main+0x78>
  800794:	00000517          	auipc	a0,0x0
  800798:	44450513          	addi	a0,a0,1092 # 800bd8 <main+0x4ee>
  80079c:	959ff0ef          	jal	8000f4 <cprintf>
  8007a0:	00000517          	auipc	a0,0x0
  8007a4:	45050513          	addi	a0,a0,1104 # 800bf0 <main+0x506>
  8007a8:	94dff0ef          	jal	8000f4 <cprintf>
  8007ac:	00092783          	lw	a5,0(s2)
  8007b0:	00001717          	auipc	a4,0x1
  8007b4:	86872703          	lw	a4,-1944(a4) # 801018 <status>
  8007b8:	00000517          	auipc	a0,0x0
  8007bc:	45850513          	addi	a0,a0,1112 # 800c10 <main+0x526>
  8007c0:	0017979b          	slliw	a5,a5,0x1
  8007c4:	02e7c7bb          	divw	a5,a5,a4
  8007c8:	0911                	addi	s2,s2,4
  8007ca:	2785                	addiw	a5,a5,1
  8007cc:	01f7d59b          	srliw	a1,a5,0x1f
  8007d0:	9dbd                	addw	a1,a1,a5
  8007d2:	8585                	srai	a1,a1,0x1
  8007d4:	921ff0ef          	jal	8000f4 <cprintf>
  8007d8:	fd391ae3          	bne	s2,s3,8007ac <main+0xc2>
  8007dc:	00000517          	auipc	a0,0x0
  8007e0:	0dc50513          	addi	a0,a0,220 # 8008b8 <main+0x1ce>
  8007e4:	911ff0ef          	jal	8000f4 <cprintf>
  8007e8:	60a6                	ld	ra,72(sp)
  8007ea:	6406                	ld	s0,64(sp)
  8007ec:	74e2                	ld	s1,56(sp)
  8007ee:	7942                	ld	s2,48(sp)
  8007f0:	79a2                	ld	s3,40(sp)
  8007f2:	7a02                	ld	s4,32(sp)
  8007f4:	6ae2                	ld	s5,24(sp)
  8007f6:	4501                	li	a0,0
  8007f8:	6161                	addi	sp,sp,80
  8007fa:	8082                	ret
  8007fc:	0014051b          	addiw	a0,s0,1
  800800:	040a                	slli	s0,s0,0x2
  800802:	9aa2                	add	s5,s5,s0
  800804:	6489                	lui	s1,0x2
  800806:	6405                	lui	s0,0x1
  800808:	9efff0ef          	jal	8001f6 <lab6_set_priority>
  80080c:	fa04041b          	addiw	s0,s0,-96 # fa0 <open-0x7ff080>
  800810:	000aa023          	sw	zero,0(s5)
  800814:	71048493          	addi	s1,s1,1808 # 2710 <open-0x7fd910>
  800818:	000aa683          	lw	a3,0(s5)
  80081c:	2685                	addiw	a3,a3,1
  80081e:	0c800713          	li	a4,200
  800822:	47b2                	lw	a5,12(sp)
  800824:	377d                	addiw	a4,a4,-1
  800826:	0017b793          	seqz	a5,a5
  80082a:	c63e                	sw	a5,12(sp)
  80082c:	fb7d                	bnez	a4,800822 <main+0x138>
  80082e:	0286f7bb          	remuw	a5,a3,s0
  800832:	c399                	beqz	a5,800838 <main+0x14e>
  800834:	2685                	addiw	a3,a3,1
  800836:	b7e5                	j	80081e <main+0x134>
  800838:	00daa023          	sw	a3,0(s5)
  80083c:	9b9ff0ef          	jal	8001f4 <gettime_msec>
  800840:	892a                	mv	s2,a0
  800842:	fca4dbe3          	bge	s1,a0,800818 <main+0x12e>
  800846:	9adff0ef          	jal	8001f2 <getpid>
  80084a:	000aa603          	lw	a2,0(s5)
  80084e:	85aa                	mv	a1,a0
  800850:	86ca                	mv	a3,s2
  800852:	00000517          	auipc	a0,0x0
  800856:	31e50513          	addi	a0,a0,798 # 800b70 <main+0x486>
  80085a:	89bff0ef          	jal	8000f4 <cprintf>
  80085e:	000aa503          	lw	a0,0(s5)
  800862:	951ff0ef          	jal	8001b2 <exit>
  800866:	00000417          	auipc	s0,0x0
  80086a:	7ae40413          	addi	s0,s0,1966 # 801014 <pids+0x14>
  80086e:	4088                	lw	a0,0(s1)
  800870:	00a05463          	blez	a0,800878 <main+0x18e>
  800874:	97dff0ef          	jal	8001f0 <kill>
  800878:	0491                	addi	s1,s1,4
  80087a:	fe849ae3          	bne	s1,s0,80086e <main+0x184>
  80087e:	00000617          	auipc	a2,0x0
  800882:	39a60613          	addi	a2,a2,922 # 800c18 <main+0x52e>
  800886:	04b00593          	li	a1,75
  80088a:	00000517          	auipc	a0,0x0
  80088e:	39e50513          	addi	a0,a0,926 # 800c28 <main+0x53e>
  800892:	f9eff0ef          	jal	800030 <__panic>
