
obj/__user_sleep.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <open>:
  800020:	1582                	slli	a1,a1,0x20
  800022:	9181                	srli	a1,a1,0x20
  800024:	a29d                	j	80018a <sys_open>

0000000000800026 <close>:
  800026:	a2bd                	j	800194 <sys_close>

0000000000800028 <dup2>:
  800028:	aa95                	j	80019c <sys_dup>

000000000080002a <_start>:
  80002a:	204000ef          	jal	80022e <umain>
  80002e:	a001                	j	80002e <_start+0x4>

0000000000800030 <__panic>:
  800030:	715d                	addi	sp,sp,-80
  800032:	02810313          	addi	t1,sp,40
  800036:	e822                	sd	s0,16(sp)
  800038:	8432                	mv	s0,a2
  80003a:	862e                	mv	a2,a1
  80003c:	85aa                	mv	a1,a0
  80003e:	00000517          	auipc	a0,0x0
  800042:	72a50513          	addi	a0,a0,1834 # 800768 <main+0x6e>
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
  800064:	72850513          	addi	a0,a0,1832 # 800788 <main+0x8e>
  800068:	08c000ef          	jal	8000f4 <cprintf>
  80006c:	5559                	li	a0,-10
  80006e:	138000ef          	jal	8001a6 <exit>

0000000000800072 <__warn>:
  800072:	715d                	addi	sp,sp,-80
  800074:	e822                	sd	s0,16(sp)
  800076:	02810313          	addi	t1,sp,40
  80007a:	8432                	mv	s0,a2
  80007c:	862e                	mv	a2,a1
  80007e:	85aa                	mv	a1,a0
  800080:	00000517          	auipc	a0,0x0
  800084:	71050513          	addi	a0,a0,1808 # 800790 <main+0x96>
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
  8000a6:	6e650513          	addi	a0,a0,1766 # 800788 <main+0x8e>
  8000aa:	04a000ef          	jal	8000f4 <cprintf>
  8000ae:	60e2                	ld	ra,24(sp)
  8000b0:	6442                	ld	s0,16(sp)
  8000b2:	6161                	addi	sp,sp,80
  8000b4:	8082                	ret

00000000008000b6 <cputch>:
  8000b6:	1101                	addi	sp,sp,-32
  8000b8:	ec06                	sd	ra,24(sp)
  8000ba:	e42e                	sd	a1,8(sp)
  8000bc:	0be000ef          	jal	80017a <sys_putc>
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
  8000e0:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5ea1>
  8000e4:	ec06                	sd	ra,24(sp)
  8000e6:	c602                	sw	zero,12(sp)
  8000e8:	22a000ef          	jal	800312 <vprintfmt>
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
  800112:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5ea1>
  800116:	ec06                	sd	ra,24(sp)
  800118:	e4be                	sd	a5,72(sp)
  80011a:	e8c2                	sd	a6,80(sp)
  80011c:	ecc6                	sd	a7,88(sp)
  80011e:	c202                	sw	zero,4(sp)
  800120:	e41a                	sd	t1,8(sp)
  800122:	1f0000ef          	jal	800312 <vprintfmt>
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

000000000080017a <sys_putc>:
  80017a:	85aa                	mv	a1,a0
  80017c:	4579                	li	a0,30
  80017e:	bf45                	j	80012e <syscall>

0000000000800180 <sys_sleep>:
  800180:	85aa                	mv	a1,a0
  800182:	452d                	li	a0,11
  800184:	b76d                	j	80012e <syscall>

0000000000800186 <sys_gettime>:
  800186:	4545                	li	a0,17
  800188:	b75d                	j	80012e <syscall>

000000000080018a <sys_open>:
  80018a:	862e                	mv	a2,a1
  80018c:	85aa                	mv	a1,a0
  80018e:	06400513          	li	a0,100
  800192:	bf71                	j	80012e <syscall>

0000000000800194 <sys_close>:
  800194:	85aa                	mv	a1,a0
  800196:	06500513          	li	a0,101
  80019a:	bf51                	j	80012e <syscall>

000000000080019c <sys_dup>:
  80019c:	862e                	mv	a2,a1
  80019e:	85aa                	mv	a1,a0
  8001a0:	08200513          	li	a0,130
  8001a4:	b769                	j	80012e <syscall>

00000000008001a6 <exit>:
  8001a6:	1141                	addi	sp,sp,-16
  8001a8:	e406                	sd	ra,8(sp)
  8001aa:	fbfff0ef          	jal	800168 <sys_exit>
  8001ae:	00000517          	auipc	a0,0x0
  8001b2:	60250513          	addi	a0,a0,1538 # 8007b0 <main+0xb6>
  8001b6:	f3fff0ef          	jal	8000f4 <cprintf>
  8001ba:	a001                	j	8001ba <exit+0x14>

00000000008001bc <fork>:
  8001bc:	bf4d                	j	80016e <sys_fork>

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

00000000008001e4 <gettime_msec>:
  8001e4:	b74d                	j	800186 <sys_gettime>

00000000008001e6 <sleep>:
  8001e6:	1502                	slli	a0,a0,0x20
  8001e8:	9101                	srli	a0,a0,0x20
  8001ea:	bf59                	j	800180 <sys_sleep>

00000000008001ec <initfd>:
  8001ec:	87ae                	mv	a5,a1
  8001ee:	1101                	addi	sp,sp,-32
  8001f0:	e822                	sd	s0,16(sp)
  8001f2:	85b2                	mv	a1,a2
  8001f4:	842a                	mv	s0,a0
  8001f6:	853e                	mv	a0,a5
  8001f8:	ec06                	sd	ra,24(sp)
  8001fa:	e27ff0ef          	jal	800020 <open>
  8001fe:	87aa                	mv	a5,a0
  800200:	00054463          	bltz	a0,800208 <initfd+0x1c>
  800204:	00851763          	bne	a0,s0,800212 <initfd+0x26>
  800208:	60e2                	ld	ra,24(sp)
  80020a:	6442                	ld	s0,16(sp)
  80020c:	853e                	mv	a0,a5
  80020e:	6105                	addi	sp,sp,32
  800210:	8082                	ret
  800212:	e42a                	sd	a0,8(sp)
  800214:	8522                	mv	a0,s0
  800216:	e11ff0ef          	jal	800026 <close>
  80021a:	6522                	ld	a0,8(sp)
  80021c:	85a2                	mv	a1,s0
  80021e:	e0bff0ef          	jal	800028 <dup2>
  800222:	842a                	mv	s0,a0
  800224:	6522                	ld	a0,8(sp)
  800226:	e01ff0ef          	jal	800026 <close>
  80022a:	87a2                	mv	a5,s0
  80022c:	bff1                	j	800208 <initfd+0x1c>

000000000080022e <umain>:
  80022e:	1101                	addi	sp,sp,-32
  800230:	e822                	sd	s0,16(sp)
  800232:	e426                	sd	s1,8(sp)
  800234:	842a                	mv	s0,a0
  800236:	84ae                	mv	s1,a1
  800238:	4601                	li	a2,0
  80023a:	00000597          	auipc	a1,0x0
  80023e:	58e58593          	addi	a1,a1,1422 # 8007c8 <main+0xce>
  800242:	4501                	li	a0,0
  800244:	ec06                	sd	ra,24(sp)
  800246:	fa7ff0ef          	jal	8001ec <initfd>
  80024a:	02054263          	bltz	a0,80026e <umain+0x40>
  80024e:	4605                	li	a2,1
  800250:	8532                	mv	a0,a2
  800252:	00000597          	auipc	a1,0x0
  800256:	5b658593          	addi	a1,a1,1462 # 800808 <main+0x10e>
  80025a:	f93ff0ef          	jal	8001ec <initfd>
  80025e:	02054563          	bltz	a0,800288 <umain+0x5a>
  800262:	85a6                	mv	a1,s1
  800264:	8522                	mv	a0,s0
  800266:	494000ef          	jal	8006fa <main>
  80026a:	f3dff0ef          	jal	8001a6 <exit>
  80026e:	86aa                	mv	a3,a0
  800270:	00000617          	auipc	a2,0x0
  800274:	56060613          	addi	a2,a2,1376 # 8007d0 <main+0xd6>
  800278:	45e9                	li	a1,26
  80027a:	00000517          	auipc	a0,0x0
  80027e:	57650513          	addi	a0,a0,1398 # 8007f0 <main+0xf6>
  800282:	df1ff0ef          	jal	800072 <__warn>
  800286:	b7e1                	j	80024e <umain+0x20>
  800288:	86aa                	mv	a3,a0
  80028a:	00000617          	auipc	a2,0x0
  80028e:	58660613          	addi	a2,a2,1414 # 800810 <main+0x116>
  800292:	45f5                	li	a1,29
  800294:	00000517          	auipc	a0,0x0
  800298:	55c50513          	addi	a0,a0,1372 # 8007f0 <main+0xf6>
  80029c:	dd7ff0ef          	jal	800072 <__warn>
  8002a0:	b7c9                	j	800262 <umain+0x34>

00000000008002a2 <printnum>:
  8002a2:	7139                	addi	sp,sp,-64
  8002a4:	02071893          	slli	a7,a4,0x20
  8002a8:	f822                	sd	s0,48(sp)
  8002aa:	f426                	sd	s1,40(sp)
  8002ac:	f04a                	sd	s2,32(sp)
  8002ae:	ec4e                	sd	s3,24(sp)
  8002b0:	e456                	sd	s5,8(sp)
  8002b2:	0208d893          	srli	a7,a7,0x20
  8002b6:	fc06                	sd	ra,56(sp)
  8002b8:	0316fab3          	remu	s5,a3,a7
  8002bc:	fff7841b          	addiw	s0,a5,-1
  8002c0:	84aa                	mv	s1,a0
  8002c2:	89ae                	mv	s3,a1
  8002c4:	8932                	mv	s2,a2
  8002c6:	0516f063          	bgeu	a3,a7,800306 <printnum+0x64>
  8002ca:	e852                	sd	s4,16(sp)
  8002cc:	4705                	li	a4,1
  8002ce:	8a42                	mv	s4,a6
  8002d0:	00f75863          	bge	a4,a5,8002e0 <printnum+0x3e>
  8002d4:	864e                	mv	a2,s3
  8002d6:	85ca                	mv	a1,s2
  8002d8:	8552                	mv	a0,s4
  8002da:	347d                	addiw	s0,s0,-1
  8002dc:	9482                	jalr	s1
  8002de:	f87d                	bnez	s0,8002d4 <printnum+0x32>
  8002e0:	6a42                	ld	s4,16(sp)
  8002e2:	00000797          	auipc	a5,0x0
  8002e6:	54e78793          	addi	a5,a5,1358 # 800830 <main+0x136>
  8002ea:	97d6                	add	a5,a5,s5
  8002ec:	7442                	ld	s0,48(sp)
  8002ee:	0007c503          	lbu	a0,0(a5)
  8002f2:	70e2                	ld	ra,56(sp)
  8002f4:	6aa2                	ld	s5,8(sp)
  8002f6:	864e                	mv	a2,s3
  8002f8:	85ca                	mv	a1,s2
  8002fa:	69e2                	ld	s3,24(sp)
  8002fc:	7902                	ld	s2,32(sp)
  8002fe:	87a6                	mv	a5,s1
  800300:	74a2                	ld	s1,40(sp)
  800302:	6121                	addi	sp,sp,64
  800304:	8782                	jr	a5
  800306:	0316d6b3          	divu	a3,a3,a7
  80030a:	87a2                	mv	a5,s0
  80030c:	f97ff0ef          	jal	8002a2 <printnum>
  800310:	bfc9                	j	8002e2 <printnum+0x40>

0000000000800312 <vprintfmt>:
  800312:	7119                	addi	sp,sp,-128
  800314:	f4a6                	sd	s1,104(sp)
  800316:	f0ca                	sd	s2,96(sp)
  800318:	ecce                	sd	s3,88(sp)
  80031a:	e8d2                	sd	s4,80(sp)
  80031c:	e4d6                	sd	s5,72(sp)
  80031e:	e0da                	sd	s6,64(sp)
  800320:	fc5e                	sd	s7,56(sp)
  800322:	f466                	sd	s9,40(sp)
  800324:	fc86                	sd	ra,120(sp)
  800326:	f8a2                	sd	s0,112(sp)
  800328:	f862                	sd	s8,48(sp)
  80032a:	f06a                	sd	s10,32(sp)
  80032c:	ec6e                	sd	s11,24(sp)
  80032e:	84aa                	mv	s1,a0
  800330:	8cb6                	mv	s9,a3
  800332:	8aba                	mv	s5,a4
  800334:	89ae                	mv	s3,a1
  800336:	8932                	mv	s2,a2
  800338:	02500a13          	li	s4,37
  80033c:	05500b93          	li	s7,85
  800340:	00000b17          	auipc	s6,0x0
  800344:	7a0b0b13          	addi	s6,s6,1952 # 800ae0 <main+0x3e6>
  800348:	000cc503          	lbu	a0,0(s9)
  80034c:	001c8413          	addi	s0,s9,1
  800350:	01450b63          	beq	a0,s4,800366 <vprintfmt+0x54>
  800354:	cd15                	beqz	a0,800390 <vprintfmt+0x7e>
  800356:	864e                	mv	a2,s3
  800358:	85ca                	mv	a1,s2
  80035a:	9482                	jalr	s1
  80035c:	00044503          	lbu	a0,0(s0)
  800360:	0405                	addi	s0,s0,1
  800362:	ff4519e3          	bne	a0,s4,800354 <vprintfmt+0x42>
  800366:	5d7d                	li	s10,-1
  800368:	8dea                	mv	s11,s10
  80036a:	02000813          	li	a6,32
  80036e:	4c01                	li	s8,0
  800370:	4581                	li	a1,0
  800372:	00044703          	lbu	a4,0(s0)
  800376:	00140c93          	addi	s9,s0,1
  80037a:	fdd7061b          	addiw	a2,a4,-35
  80037e:	0ff67613          	zext.b	a2,a2
  800382:	02cbe663          	bltu	s7,a2,8003ae <vprintfmt+0x9c>
  800386:	060a                	slli	a2,a2,0x2
  800388:	965a                	add	a2,a2,s6
  80038a:	421c                	lw	a5,0(a2)
  80038c:	97da                	add	a5,a5,s6
  80038e:	8782                	jr	a5
  800390:	70e6                	ld	ra,120(sp)
  800392:	7446                	ld	s0,112(sp)
  800394:	74a6                	ld	s1,104(sp)
  800396:	7906                	ld	s2,96(sp)
  800398:	69e6                	ld	s3,88(sp)
  80039a:	6a46                	ld	s4,80(sp)
  80039c:	6aa6                	ld	s5,72(sp)
  80039e:	6b06                	ld	s6,64(sp)
  8003a0:	7be2                	ld	s7,56(sp)
  8003a2:	7c42                	ld	s8,48(sp)
  8003a4:	7ca2                	ld	s9,40(sp)
  8003a6:	7d02                	ld	s10,32(sp)
  8003a8:	6de2                	ld	s11,24(sp)
  8003aa:	6109                	addi	sp,sp,128
  8003ac:	8082                	ret
  8003ae:	864e                	mv	a2,s3
  8003b0:	85ca                	mv	a1,s2
  8003b2:	02500513          	li	a0,37
  8003b6:	9482                	jalr	s1
  8003b8:	fff44783          	lbu	a5,-1(s0)
  8003bc:	02500713          	li	a4,37
  8003c0:	8ca2                	mv	s9,s0
  8003c2:	f8e783e3          	beq	a5,a4,800348 <vprintfmt+0x36>
  8003c6:	ffecc783          	lbu	a5,-2(s9)
  8003ca:	1cfd                	addi	s9,s9,-1
  8003cc:	fee79de3          	bne	a5,a4,8003c6 <vprintfmt+0xb4>
  8003d0:	bfa5                	j	800348 <vprintfmt+0x36>
  8003d2:	00144683          	lbu	a3,1(s0)
  8003d6:	4525                	li	a0,9
  8003d8:	fd070d1b          	addiw	s10,a4,-48
  8003dc:	fd06879b          	addiw	a5,a3,-48
  8003e0:	28f56063          	bltu	a0,a5,800660 <vprintfmt+0x34e>
  8003e4:	2681                	sext.w	a3,a3
  8003e6:	8466                	mv	s0,s9
  8003e8:	002d179b          	slliw	a5,s10,0x2
  8003ec:	00144703          	lbu	a4,1(s0)
  8003f0:	01a787bb          	addw	a5,a5,s10
  8003f4:	0017979b          	slliw	a5,a5,0x1
  8003f8:	9fb5                	addw	a5,a5,a3
  8003fa:	fd07061b          	addiw	a2,a4,-48
  8003fe:	0405                	addi	s0,s0,1
  800400:	fd078d1b          	addiw	s10,a5,-48
  800404:	0007069b          	sext.w	a3,a4
  800408:	fec570e3          	bgeu	a0,a2,8003e8 <vprintfmt+0xd6>
  80040c:	f60dd3e3          	bgez	s11,800372 <vprintfmt+0x60>
  800410:	8dea                	mv	s11,s10
  800412:	5d7d                	li	s10,-1
  800414:	bfb9                	j	800372 <vprintfmt+0x60>
  800416:	883a                	mv	a6,a4
  800418:	8466                	mv	s0,s9
  80041a:	bfa1                	j	800372 <vprintfmt+0x60>
  80041c:	8466                	mv	s0,s9
  80041e:	4c05                	li	s8,1
  800420:	bf89                	j	800372 <vprintfmt+0x60>
  800422:	4785                	li	a5,1
  800424:	008a8613          	addi	a2,s5,8
  800428:	00b7c463          	blt	a5,a1,800430 <vprintfmt+0x11e>
  80042c:	1c058363          	beqz	a1,8005f2 <vprintfmt+0x2e0>
  800430:	000ab683          	ld	a3,0(s5)
  800434:	4741                	li	a4,16
  800436:	8ab2                	mv	s5,a2
  800438:	2801                	sext.w	a6,a6
  80043a:	87ee                	mv	a5,s11
  80043c:	864a                	mv	a2,s2
  80043e:	85ce                	mv	a1,s3
  800440:	8526                	mv	a0,s1
  800442:	e61ff0ef          	jal	8002a2 <printnum>
  800446:	b709                	j	800348 <vprintfmt+0x36>
  800448:	000aa503          	lw	a0,0(s5)
  80044c:	864e                	mv	a2,s3
  80044e:	85ca                	mv	a1,s2
  800450:	9482                	jalr	s1
  800452:	0aa1                	addi	s5,s5,8
  800454:	bdd5                	j	800348 <vprintfmt+0x36>
  800456:	4785                	li	a5,1
  800458:	008a8613          	addi	a2,s5,8
  80045c:	00b7c463          	blt	a5,a1,800464 <vprintfmt+0x152>
  800460:	18058463          	beqz	a1,8005e8 <vprintfmt+0x2d6>
  800464:	000ab683          	ld	a3,0(s5)
  800468:	4729                	li	a4,10
  80046a:	8ab2                	mv	s5,a2
  80046c:	b7f1                	j	800438 <vprintfmt+0x126>
  80046e:	864e                	mv	a2,s3
  800470:	85ca                	mv	a1,s2
  800472:	03000513          	li	a0,48
  800476:	e042                	sd	a6,0(sp)
  800478:	9482                	jalr	s1
  80047a:	864e                	mv	a2,s3
  80047c:	85ca                	mv	a1,s2
  80047e:	07800513          	li	a0,120
  800482:	9482                	jalr	s1
  800484:	000ab683          	ld	a3,0(s5)
  800488:	6802                	ld	a6,0(sp)
  80048a:	4741                	li	a4,16
  80048c:	0aa1                	addi	s5,s5,8
  80048e:	b76d                	j	800438 <vprintfmt+0x126>
  800490:	864e                	mv	a2,s3
  800492:	85ca                	mv	a1,s2
  800494:	02500513          	li	a0,37
  800498:	9482                	jalr	s1
  80049a:	b57d                	j	800348 <vprintfmt+0x36>
  80049c:	000aad03          	lw	s10,0(s5)
  8004a0:	8466                	mv	s0,s9
  8004a2:	0aa1                	addi	s5,s5,8
  8004a4:	b7a5                	j	80040c <vprintfmt+0xfa>
  8004a6:	4785                	li	a5,1
  8004a8:	008a8613          	addi	a2,s5,8
  8004ac:	00b7c463          	blt	a5,a1,8004b4 <vprintfmt+0x1a2>
  8004b0:	12058763          	beqz	a1,8005de <vprintfmt+0x2cc>
  8004b4:	000ab683          	ld	a3,0(s5)
  8004b8:	4721                	li	a4,8
  8004ba:	8ab2                	mv	s5,a2
  8004bc:	bfb5                	j	800438 <vprintfmt+0x126>
  8004be:	87ee                	mv	a5,s11
  8004c0:	000dd363          	bgez	s11,8004c6 <vprintfmt+0x1b4>
  8004c4:	4781                	li	a5,0
  8004c6:	00078d9b          	sext.w	s11,a5
  8004ca:	8466                	mv	s0,s9
  8004cc:	b55d                	j	800372 <vprintfmt+0x60>
  8004ce:	0008041b          	sext.w	s0,a6
  8004d2:	fd340793          	addi	a5,s0,-45
  8004d6:	01b02733          	sgtz	a4,s11
  8004da:	00f037b3          	snez	a5,a5
  8004de:	8ff9                	and	a5,a5,a4
  8004e0:	000ab703          	ld	a4,0(s5)
  8004e4:	008a8693          	addi	a3,s5,8
  8004e8:	e436                	sd	a3,8(sp)
  8004ea:	12070563          	beqz	a4,800614 <vprintfmt+0x302>
  8004ee:	12079d63          	bnez	a5,800628 <vprintfmt+0x316>
  8004f2:	00074783          	lbu	a5,0(a4)
  8004f6:	0007851b          	sext.w	a0,a5
  8004fa:	c78d                	beqz	a5,800524 <vprintfmt+0x212>
  8004fc:	00170a93          	addi	s5,a4,1
  800500:	547d                	li	s0,-1
  800502:	000d4563          	bltz	s10,80050c <vprintfmt+0x1fa>
  800506:	3d7d                	addiw	s10,s10,-1
  800508:	008d0e63          	beq	s10,s0,800524 <vprintfmt+0x212>
  80050c:	020c1863          	bnez	s8,80053c <vprintfmt+0x22a>
  800510:	864e                	mv	a2,s3
  800512:	85ca                	mv	a1,s2
  800514:	9482                	jalr	s1
  800516:	000ac783          	lbu	a5,0(s5)
  80051a:	0a85                	addi	s5,s5,1
  80051c:	3dfd                	addiw	s11,s11,-1
  80051e:	0007851b          	sext.w	a0,a5
  800522:	f3e5                	bnez	a5,800502 <vprintfmt+0x1f0>
  800524:	01b05a63          	blez	s11,800538 <vprintfmt+0x226>
  800528:	864e                	mv	a2,s3
  80052a:	85ca                	mv	a1,s2
  80052c:	02000513          	li	a0,32
  800530:	3dfd                	addiw	s11,s11,-1
  800532:	9482                	jalr	s1
  800534:	fe0d9ae3          	bnez	s11,800528 <vprintfmt+0x216>
  800538:	6aa2                	ld	s5,8(sp)
  80053a:	b539                	j	800348 <vprintfmt+0x36>
  80053c:	3781                	addiw	a5,a5,-32
  80053e:	05e00713          	li	a4,94
  800542:	fcf777e3          	bgeu	a4,a5,800510 <vprintfmt+0x1fe>
  800546:	03f00513          	li	a0,63
  80054a:	864e                	mv	a2,s3
  80054c:	85ca                	mv	a1,s2
  80054e:	9482                	jalr	s1
  800550:	000ac783          	lbu	a5,0(s5)
  800554:	0a85                	addi	s5,s5,1
  800556:	3dfd                	addiw	s11,s11,-1
  800558:	0007851b          	sext.w	a0,a5
  80055c:	d7e1                	beqz	a5,800524 <vprintfmt+0x212>
  80055e:	fa0d54e3          	bgez	s10,800506 <vprintfmt+0x1f4>
  800562:	bfe9                	j	80053c <vprintfmt+0x22a>
  800564:	000aa783          	lw	a5,0(s5)
  800568:	46e1                	li	a3,24
  80056a:	0aa1                	addi	s5,s5,8
  80056c:	41f7d71b          	sraiw	a4,a5,0x1f
  800570:	8fb9                	xor	a5,a5,a4
  800572:	40e7873b          	subw	a4,a5,a4
  800576:	02e6c663          	blt	a3,a4,8005a2 <vprintfmt+0x290>
  80057a:	00000797          	auipc	a5,0x0
  80057e:	6be78793          	addi	a5,a5,1726 # 800c38 <error_string>
  800582:	00371693          	slli	a3,a4,0x3
  800586:	97b6                	add	a5,a5,a3
  800588:	639c                	ld	a5,0(a5)
  80058a:	cf81                	beqz	a5,8005a2 <vprintfmt+0x290>
  80058c:	873e                	mv	a4,a5
  80058e:	00000697          	auipc	a3,0x0
  800592:	2d268693          	addi	a3,a3,722 # 800860 <main+0x166>
  800596:	864a                	mv	a2,s2
  800598:	85ce                	mv	a1,s3
  80059a:	8526                	mv	a0,s1
  80059c:	0f2000ef          	jal	80068e <printfmt>
  8005a0:	b365                	j	800348 <vprintfmt+0x36>
  8005a2:	00000697          	auipc	a3,0x0
  8005a6:	2ae68693          	addi	a3,a3,686 # 800850 <main+0x156>
  8005aa:	864a                	mv	a2,s2
  8005ac:	85ce                	mv	a1,s3
  8005ae:	8526                	mv	a0,s1
  8005b0:	0de000ef          	jal	80068e <printfmt>
  8005b4:	bb51                	j	800348 <vprintfmt+0x36>
  8005b6:	4785                	li	a5,1
  8005b8:	008a8c13          	addi	s8,s5,8
  8005bc:	00b7c363          	blt	a5,a1,8005c2 <vprintfmt+0x2b0>
  8005c0:	cd81                	beqz	a1,8005d8 <vprintfmt+0x2c6>
  8005c2:	000ab403          	ld	s0,0(s5)
  8005c6:	02044b63          	bltz	s0,8005fc <vprintfmt+0x2ea>
  8005ca:	86a2                	mv	a3,s0
  8005cc:	8ae2                	mv	s5,s8
  8005ce:	4729                	li	a4,10
  8005d0:	b5a5                	j	800438 <vprintfmt+0x126>
  8005d2:	2585                	addiw	a1,a1,1
  8005d4:	8466                	mv	s0,s9
  8005d6:	bb71                	j	800372 <vprintfmt+0x60>
  8005d8:	000aa403          	lw	s0,0(s5)
  8005dc:	b7ed                	j	8005c6 <vprintfmt+0x2b4>
  8005de:	000ae683          	lwu	a3,0(s5)
  8005e2:	4721                	li	a4,8
  8005e4:	8ab2                	mv	s5,a2
  8005e6:	bd89                	j	800438 <vprintfmt+0x126>
  8005e8:	000ae683          	lwu	a3,0(s5)
  8005ec:	4729                	li	a4,10
  8005ee:	8ab2                	mv	s5,a2
  8005f0:	b5a1                	j	800438 <vprintfmt+0x126>
  8005f2:	000ae683          	lwu	a3,0(s5)
  8005f6:	4741                	li	a4,16
  8005f8:	8ab2                	mv	s5,a2
  8005fa:	bd3d                	j	800438 <vprintfmt+0x126>
  8005fc:	864e                	mv	a2,s3
  8005fe:	85ca                	mv	a1,s2
  800600:	02d00513          	li	a0,45
  800604:	e042                	sd	a6,0(sp)
  800606:	9482                	jalr	s1
  800608:	6802                	ld	a6,0(sp)
  80060a:	408006b3          	neg	a3,s0
  80060e:	8ae2                	mv	s5,s8
  800610:	4729                	li	a4,10
  800612:	b51d                	j	800438 <vprintfmt+0x126>
  800614:	eba1                	bnez	a5,800664 <vprintfmt+0x352>
  800616:	02800793          	li	a5,40
  80061a:	853e                	mv	a0,a5
  80061c:	00000a97          	auipc	s5,0x0
  800620:	22da8a93          	addi	s5,s5,557 # 800849 <main+0x14f>
  800624:	547d                	li	s0,-1
  800626:	bdf1                	j	800502 <vprintfmt+0x1f0>
  800628:	853a                	mv	a0,a4
  80062a:	85ea                	mv	a1,s10
  80062c:	e03a                	sd	a4,0(sp)
  80062e:	07e000ef          	jal	8006ac <strnlen>
  800632:	40ad8dbb          	subw	s11,s11,a0
  800636:	6702                	ld	a4,0(sp)
  800638:	01b05b63          	blez	s11,80064e <vprintfmt+0x33c>
  80063c:	864e                	mv	a2,s3
  80063e:	85ca                	mv	a1,s2
  800640:	8522                	mv	a0,s0
  800642:	e03a                	sd	a4,0(sp)
  800644:	3dfd                	addiw	s11,s11,-1
  800646:	9482                	jalr	s1
  800648:	6702                	ld	a4,0(sp)
  80064a:	fe0d99e3          	bnez	s11,80063c <vprintfmt+0x32a>
  80064e:	00074783          	lbu	a5,0(a4)
  800652:	0007851b          	sext.w	a0,a5
  800656:	ee0781e3          	beqz	a5,800538 <vprintfmt+0x226>
  80065a:	00170a93          	addi	s5,a4,1
  80065e:	b54d                	j	800500 <vprintfmt+0x1ee>
  800660:	8466                	mv	s0,s9
  800662:	b36d                	j	80040c <vprintfmt+0xfa>
  800664:	85ea                	mv	a1,s10
  800666:	00000517          	auipc	a0,0x0
  80066a:	1e250513          	addi	a0,a0,482 # 800848 <main+0x14e>
  80066e:	03e000ef          	jal	8006ac <strnlen>
  800672:	40ad8dbb          	subw	s11,s11,a0
  800676:	02800793          	li	a5,40
  80067a:	00000717          	auipc	a4,0x0
  80067e:	1ce70713          	addi	a4,a4,462 # 800848 <main+0x14e>
  800682:	853e                	mv	a0,a5
  800684:	fbb04ce3          	bgtz	s11,80063c <vprintfmt+0x32a>
  800688:	00170a93          	addi	s5,a4,1
  80068c:	bd95                	j	800500 <vprintfmt+0x1ee>

000000000080068e <printfmt>:
  80068e:	7139                	addi	sp,sp,-64
  800690:	02010313          	addi	t1,sp,32
  800694:	f03a                	sd	a4,32(sp)
  800696:	871a                	mv	a4,t1
  800698:	ec06                	sd	ra,24(sp)
  80069a:	f43e                	sd	a5,40(sp)
  80069c:	f842                	sd	a6,48(sp)
  80069e:	fc46                	sd	a7,56(sp)
  8006a0:	e41a                	sd	t1,8(sp)
  8006a2:	c71ff0ef          	jal	800312 <vprintfmt>
  8006a6:	60e2                	ld	ra,24(sp)
  8006a8:	6121                	addi	sp,sp,64
  8006aa:	8082                	ret

00000000008006ac <strnlen>:
  8006ac:	4781                	li	a5,0
  8006ae:	e589                	bnez	a1,8006b8 <strnlen+0xc>
  8006b0:	a811                	j	8006c4 <strnlen+0x18>
  8006b2:	0785                	addi	a5,a5,1
  8006b4:	00f58863          	beq	a1,a5,8006c4 <strnlen+0x18>
  8006b8:	00f50733          	add	a4,a0,a5
  8006bc:	00074703          	lbu	a4,0(a4)
  8006c0:	fb6d                	bnez	a4,8006b2 <strnlen+0x6>
  8006c2:	85be                	mv	a1,a5
  8006c4:	852e                	mv	a0,a1
  8006c6:	8082                	ret

00000000008006c8 <sleepy>:
  8006c8:	1101                	addi	sp,sp,-32
  8006ca:	e822                	sd	s0,16(sp)
  8006cc:	e426                	sd	s1,8(sp)
  8006ce:	ec06                	sd	ra,24(sp)
  8006d0:	4401                	li	s0,0
  8006d2:	44a9                	li	s1,10
  8006d4:	06400513          	li	a0,100
  8006d8:	b0fff0ef          	jal	8001e6 <sleep>
  8006dc:	2405                	addiw	s0,s0,1
  8006de:	85a2                	mv	a1,s0
  8006e0:	06400613          	li	a2,100
  8006e4:	00000517          	auipc	a0,0x0
  8006e8:	35c50513          	addi	a0,a0,860 # 800a40 <main+0x346>
  8006ec:	a09ff0ef          	jal	8000f4 <cprintf>
  8006f0:	fe9412e3          	bne	s0,s1,8006d4 <sleepy+0xc>
  8006f4:	4501                	li	a0,0
  8006f6:	ab1ff0ef          	jal	8001a6 <exit>

00000000008006fa <main>:
  8006fa:	1101                	addi	sp,sp,-32
  8006fc:	e822                	sd	s0,16(sp)
  8006fe:	ec06                	sd	ra,24(sp)
  800700:	ae5ff0ef          	jal	8001e4 <gettime_msec>
  800704:	842a                	mv	s0,a0
  800706:	ab7ff0ef          	jal	8001bc <fork>
  80070a:	cd21                	beqz	a0,800762 <main+0x68>
  80070c:	006c                	addi	a1,sp,12
  80070e:	ab1ff0ef          	jal	8001be <waitpid>
  800712:	47b2                	lw	a5,12(sp)
  800714:	8d5d                	or	a0,a0,a5
  800716:	2501                	sext.w	a0,a0
  800718:	e515                	bnez	a0,800744 <main+0x4a>
  80071a:	acbff0ef          	jal	8001e4 <gettime_msec>
  80071e:	408505bb          	subw	a1,a0,s0
  800722:	00000517          	auipc	a0,0x0
  800726:	39650513          	addi	a0,a0,918 # 800ab8 <main+0x3be>
  80072a:	9cbff0ef          	jal	8000f4 <cprintf>
  80072e:	00000517          	auipc	a0,0x0
  800732:	3a250513          	addi	a0,a0,930 # 800ad0 <main+0x3d6>
  800736:	9bfff0ef          	jal	8000f4 <cprintf>
  80073a:	60e2                	ld	ra,24(sp)
  80073c:	6442                	ld	s0,16(sp)
  80073e:	4501                	li	a0,0
  800740:	6105                	addi	sp,sp,32
  800742:	8082                	ret
  800744:	00000697          	auipc	a3,0x0
  800748:	31468693          	addi	a3,a3,788 # 800a58 <main+0x35e>
  80074c:	00000617          	auipc	a2,0x0
  800750:	34460613          	addi	a2,a2,836 # 800a90 <main+0x396>
  800754:	45dd                	li	a1,23
  800756:	00000517          	auipc	a0,0x0
  80075a:	35250513          	addi	a0,a0,850 # 800aa8 <main+0x3ae>
  80075e:	8d3ff0ef          	jal	800030 <__panic>
  800762:	f67ff0ef          	jal	8006c8 <sleepy>
