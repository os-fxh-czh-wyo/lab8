
obj/__user_spin.out:     file format elf64-littleriscv


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
  80002a:	200000ef          	jal	80022a <umain>
  80002e:	a001                	j	80002e <_start+0x4>

0000000000800030 <__panic>:
  800030:	715d                	addi	sp,sp,-80
  800032:	02810313          	addi	t1,sp,40
  800036:	e822                	sd	s0,16(sp)
  800038:	8432                	mv	s0,a2
  80003a:	862e                	mv	a2,a1
  80003c:	85aa                	mv	a1,a0
  80003e:	00000517          	auipc	a0,0x0
  800042:	75250513          	addi	a0,a0,1874 # 800790 <main+0xcc>
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
  800064:	75050513          	addi	a0,a0,1872 # 8007b0 <main+0xec>
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
  800084:	73850513          	addi	a0,a0,1848 # 8007b8 <main+0xf4>
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
  8000a6:	70e50513          	addi	a0,a0,1806 # 8007b0 <main+0xec>
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
  8000e0:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5de1>
  8000e4:	ec06                	sd	ra,24(sp)
  8000e6:	c602                	sw	zero,12(sp)
  8000e8:	226000ef          	jal	80030e <vprintfmt>
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
  800112:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5de1>
  800116:	ec06                	sd	ra,24(sp)
  800118:	e4be                	sd	a5,72(sp)
  80011a:	e8c2                	sd	a6,80(sp)
  80011c:	ecc6                	sd	a7,88(sp)
  80011e:	c202                	sw	zero,4(sp)
  800120:	e41a                	sd	t1,8(sp)
  800122:	1ec000ef          	jal	80030e <vprintfmt>
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

0000000000800184 <sys_putc>:
  800184:	85aa                	mv	a1,a0
  800186:	4579                	li	a0,30
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
  8001b2:	62a50513          	addi	a0,a0,1578 # 8007d8 <main+0x114>
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

00000000008001e4 <yield>:
  8001e4:	bf59                	j	80017a <sys_yield>

00000000008001e6 <kill>:
  8001e6:	bf61                	j	80017e <sys_kill>

00000000008001e8 <initfd>:
  8001e8:	87ae                	mv	a5,a1
  8001ea:	1101                	addi	sp,sp,-32
  8001ec:	e822                	sd	s0,16(sp)
  8001ee:	85b2                	mv	a1,a2
  8001f0:	842a                	mv	s0,a0
  8001f2:	853e                	mv	a0,a5
  8001f4:	ec06                	sd	ra,24(sp)
  8001f6:	e2bff0ef          	jal	800020 <open>
  8001fa:	87aa                	mv	a5,a0
  8001fc:	00054463          	bltz	a0,800204 <initfd+0x1c>
  800200:	00851763          	bne	a0,s0,80020e <initfd+0x26>
  800204:	60e2                	ld	ra,24(sp)
  800206:	6442                	ld	s0,16(sp)
  800208:	853e                	mv	a0,a5
  80020a:	6105                	addi	sp,sp,32
  80020c:	8082                	ret
  80020e:	e42a                	sd	a0,8(sp)
  800210:	8522                	mv	a0,s0
  800212:	e15ff0ef          	jal	800026 <close>
  800216:	6522                	ld	a0,8(sp)
  800218:	85a2                	mv	a1,s0
  80021a:	e0fff0ef          	jal	800028 <dup2>
  80021e:	842a                	mv	s0,a0
  800220:	6522                	ld	a0,8(sp)
  800222:	e05ff0ef          	jal	800026 <close>
  800226:	87a2                	mv	a5,s0
  800228:	bff1                	j	800204 <initfd+0x1c>

000000000080022a <umain>:
  80022a:	1101                	addi	sp,sp,-32
  80022c:	e822                	sd	s0,16(sp)
  80022e:	e426                	sd	s1,8(sp)
  800230:	842a                	mv	s0,a0
  800232:	84ae                	mv	s1,a1
  800234:	4601                	li	a2,0
  800236:	00000597          	auipc	a1,0x0
  80023a:	5ba58593          	addi	a1,a1,1466 # 8007f0 <main+0x12c>
  80023e:	4501                	li	a0,0
  800240:	ec06                	sd	ra,24(sp)
  800242:	fa7ff0ef          	jal	8001e8 <initfd>
  800246:	02054263          	bltz	a0,80026a <umain+0x40>
  80024a:	4605                	li	a2,1
  80024c:	8532                	mv	a0,a2
  80024e:	00000597          	auipc	a1,0x0
  800252:	5e258593          	addi	a1,a1,1506 # 800830 <main+0x16c>
  800256:	f93ff0ef          	jal	8001e8 <initfd>
  80025a:	02054563          	bltz	a0,800284 <umain+0x5a>
  80025e:	85a6                	mv	a1,s1
  800260:	8522                	mv	a0,s0
  800262:	462000ef          	jal	8006c4 <main>
  800266:	f41ff0ef          	jal	8001a6 <exit>
  80026a:	86aa                	mv	a3,a0
  80026c:	00000617          	auipc	a2,0x0
  800270:	58c60613          	addi	a2,a2,1420 # 8007f8 <main+0x134>
  800274:	45e9                	li	a1,26
  800276:	00000517          	auipc	a0,0x0
  80027a:	5a250513          	addi	a0,a0,1442 # 800818 <main+0x154>
  80027e:	df5ff0ef          	jal	800072 <__warn>
  800282:	b7e1                	j	80024a <umain+0x20>
  800284:	86aa                	mv	a3,a0
  800286:	00000617          	auipc	a2,0x0
  80028a:	5b260613          	addi	a2,a2,1458 # 800838 <main+0x174>
  80028e:	45f5                	li	a1,29
  800290:	00000517          	auipc	a0,0x0
  800294:	58850513          	addi	a0,a0,1416 # 800818 <main+0x154>
  800298:	ddbff0ef          	jal	800072 <__warn>
  80029c:	b7c9                	j	80025e <umain+0x34>

000000000080029e <printnum>:
  80029e:	7139                	addi	sp,sp,-64
  8002a0:	02071893          	slli	a7,a4,0x20
  8002a4:	f822                	sd	s0,48(sp)
  8002a6:	f426                	sd	s1,40(sp)
  8002a8:	f04a                	sd	s2,32(sp)
  8002aa:	ec4e                	sd	s3,24(sp)
  8002ac:	e456                	sd	s5,8(sp)
  8002ae:	0208d893          	srli	a7,a7,0x20
  8002b2:	fc06                	sd	ra,56(sp)
  8002b4:	0316fab3          	remu	s5,a3,a7
  8002b8:	fff7841b          	addiw	s0,a5,-1
  8002bc:	84aa                	mv	s1,a0
  8002be:	89ae                	mv	s3,a1
  8002c0:	8932                	mv	s2,a2
  8002c2:	0516f063          	bgeu	a3,a7,800302 <printnum+0x64>
  8002c6:	e852                	sd	s4,16(sp)
  8002c8:	4705                	li	a4,1
  8002ca:	8a42                	mv	s4,a6
  8002cc:	00f75863          	bge	a4,a5,8002dc <printnum+0x3e>
  8002d0:	864e                	mv	a2,s3
  8002d2:	85ca                	mv	a1,s2
  8002d4:	8552                	mv	a0,s4
  8002d6:	347d                	addiw	s0,s0,-1
  8002d8:	9482                	jalr	s1
  8002da:	f87d                	bnez	s0,8002d0 <printnum+0x32>
  8002dc:	6a42                	ld	s4,16(sp)
  8002de:	00000797          	auipc	a5,0x0
  8002e2:	57a78793          	addi	a5,a5,1402 # 800858 <main+0x194>
  8002e6:	97d6                	add	a5,a5,s5
  8002e8:	7442                	ld	s0,48(sp)
  8002ea:	0007c503          	lbu	a0,0(a5)
  8002ee:	70e2                	ld	ra,56(sp)
  8002f0:	6aa2                	ld	s5,8(sp)
  8002f2:	864e                	mv	a2,s3
  8002f4:	85ca                	mv	a1,s2
  8002f6:	69e2                	ld	s3,24(sp)
  8002f8:	7902                	ld	s2,32(sp)
  8002fa:	87a6                	mv	a5,s1
  8002fc:	74a2                	ld	s1,40(sp)
  8002fe:	6121                	addi	sp,sp,64
  800300:	8782                	jr	a5
  800302:	0316d6b3          	divu	a3,a3,a7
  800306:	87a2                	mv	a5,s0
  800308:	f97ff0ef          	jal	80029e <printnum>
  80030c:	bfc9                	j	8002de <printnum+0x40>

000000000080030e <vprintfmt>:
  80030e:	7119                	addi	sp,sp,-128
  800310:	f4a6                	sd	s1,104(sp)
  800312:	f0ca                	sd	s2,96(sp)
  800314:	ecce                	sd	s3,88(sp)
  800316:	e8d2                	sd	s4,80(sp)
  800318:	e4d6                	sd	s5,72(sp)
  80031a:	e0da                	sd	s6,64(sp)
  80031c:	fc5e                	sd	s7,56(sp)
  80031e:	f466                	sd	s9,40(sp)
  800320:	fc86                	sd	ra,120(sp)
  800322:	f8a2                	sd	s0,112(sp)
  800324:	f862                	sd	s8,48(sp)
  800326:	f06a                	sd	s10,32(sp)
  800328:	ec6e                	sd	s11,24(sp)
  80032a:	84aa                	mv	s1,a0
  80032c:	8cb6                	mv	s9,a3
  80032e:	8aba                	mv	s5,a4
  800330:	89ae                	mv	s3,a1
  800332:	8932                	mv	s2,a2
  800334:	02500a13          	li	s4,37
  800338:	05500b93          	li	s7,85
  80033c:	00001b17          	auipc	s6,0x1
  800340:	864b0b13          	addi	s6,s6,-1948 # 800ba0 <main+0x4dc>
  800344:	000cc503          	lbu	a0,0(s9)
  800348:	001c8413          	addi	s0,s9,1
  80034c:	01450b63          	beq	a0,s4,800362 <vprintfmt+0x54>
  800350:	cd15                	beqz	a0,80038c <vprintfmt+0x7e>
  800352:	864e                	mv	a2,s3
  800354:	85ca                	mv	a1,s2
  800356:	9482                	jalr	s1
  800358:	00044503          	lbu	a0,0(s0)
  80035c:	0405                	addi	s0,s0,1
  80035e:	ff4519e3          	bne	a0,s4,800350 <vprintfmt+0x42>
  800362:	5d7d                	li	s10,-1
  800364:	8dea                	mv	s11,s10
  800366:	02000813          	li	a6,32
  80036a:	4c01                	li	s8,0
  80036c:	4581                	li	a1,0
  80036e:	00044703          	lbu	a4,0(s0)
  800372:	00140c93          	addi	s9,s0,1
  800376:	fdd7061b          	addiw	a2,a4,-35
  80037a:	0ff67613          	zext.b	a2,a2
  80037e:	02cbe663          	bltu	s7,a2,8003aa <vprintfmt+0x9c>
  800382:	060a                	slli	a2,a2,0x2
  800384:	965a                	add	a2,a2,s6
  800386:	421c                	lw	a5,0(a2)
  800388:	97da                	add	a5,a5,s6
  80038a:	8782                	jr	a5
  80038c:	70e6                	ld	ra,120(sp)
  80038e:	7446                	ld	s0,112(sp)
  800390:	74a6                	ld	s1,104(sp)
  800392:	7906                	ld	s2,96(sp)
  800394:	69e6                	ld	s3,88(sp)
  800396:	6a46                	ld	s4,80(sp)
  800398:	6aa6                	ld	s5,72(sp)
  80039a:	6b06                	ld	s6,64(sp)
  80039c:	7be2                	ld	s7,56(sp)
  80039e:	7c42                	ld	s8,48(sp)
  8003a0:	7ca2                	ld	s9,40(sp)
  8003a2:	7d02                	ld	s10,32(sp)
  8003a4:	6de2                	ld	s11,24(sp)
  8003a6:	6109                	addi	sp,sp,128
  8003a8:	8082                	ret
  8003aa:	864e                	mv	a2,s3
  8003ac:	85ca                	mv	a1,s2
  8003ae:	02500513          	li	a0,37
  8003b2:	9482                	jalr	s1
  8003b4:	fff44783          	lbu	a5,-1(s0)
  8003b8:	02500713          	li	a4,37
  8003bc:	8ca2                	mv	s9,s0
  8003be:	f8e783e3          	beq	a5,a4,800344 <vprintfmt+0x36>
  8003c2:	ffecc783          	lbu	a5,-2(s9)
  8003c6:	1cfd                	addi	s9,s9,-1
  8003c8:	fee79de3          	bne	a5,a4,8003c2 <vprintfmt+0xb4>
  8003cc:	bfa5                	j	800344 <vprintfmt+0x36>
  8003ce:	00144683          	lbu	a3,1(s0)
  8003d2:	4525                	li	a0,9
  8003d4:	fd070d1b          	addiw	s10,a4,-48
  8003d8:	fd06879b          	addiw	a5,a3,-48
  8003dc:	28f56063          	bltu	a0,a5,80065c <vprintfmt+0x34e>
  8003e0:	2681                	sext.w	a3,a3
  8003e2:	8466                	mv	s0,s9
  8003e4:	002d179b          	slliw	a5,s10,0x2
  8003e8:	00144703          	lbu	a4,1(s0)
  8003ec:	01a787bb          	addw	a5,a5,s10
  8003f0:	0017979b          	slliw	a5,a5,0x1
  8003f4:	9fb5                	addw	a5,a5,a3
  8003f6:	fd07061b          	addiw	a2,a4,-48
  8003fa:	0405                	addi	s0,s0,1
  8003fc:	fd078d1b          	addiw	s10,a5,-48
  800400:	0007069b          	sext.w	a3,a4
  800404:	fec570e3          	bgeu	a0,a2,8003e4 <vprintfmt+0xd6>
  800408:	f60dd3e3          	bgez	s11,80036e <vprintfmt+0x60>
  80040c:	8dea                	mv	s11,s10
  80040e:	5d7d                	li	s10,-1
  800410:	bfb9                	j	80036e <vprintfmt+0x60>
  800412:	883a                	mv	a6,a4
  800414:	8466                	mv	s0,s9
  800416:	bfa1                	j	80036e <vprintfmt+0x60>
  800418:	8466                	mv	s0,s9
  80041a:	4c05                	li	s8,1
  80041c:	bf89                	j	80036e <vprintfmt+0x60>
  80041e:	4785                	li	a5,1
  800420:	008a8613          	addi	a2,s5,8
  800424:	00b7c463          	blt	a5,a1,80042c <vprintfmt+0x11e>
  800428:	1c058363          	beqz	a1,8005ee <vprintfmt+0x2e0>
  80042c:	000ab683          	ld	a3,0(s5)
  800430:	4741                	li	a4,16
  800432:	8ab2                	mv	s5,a2
  800434:	2801                	sext.w	a6,a6
  800436:	87ee                	mv	a5,s11
  800438:	864a                	mv	a2,s2
  80043a:	85ce                	mv	a1,s3
  80043c:	8526                	mv	a0,s1
  80043e:	e61ff0ef          	jal	80029e <printnum>
  800442:	b709                	j	800344 <vprintfmt+0x36>
  800444:	000aa503          	lw	a0,0(s5)
  800448:	864e                	mv	a2,s3
  80044a:	85ca                	mv	a1,s2
  80044c:	9482                	jalr	s1
  80044e:	0aa1                	addi	s5,s5,8
  800450:	bdd5                	j	800344 <vprintfmt+0x36>
  800452:	4785                	li	a5,1
  800454:	008a8613          	addi	a2,s5,8
  800458:	00b7c463          	blt	a5,a1,800460 <vprintfmt+0x152>
  80045c:	18058463          	beqz	a1,8005e4 <vprintfmt+0x2d6>
  800460:	000ab683          	ld	a3,0(s5)
  800464:	4729                	li	a4,10
  800466:	8ab2                	mv	s5,a2
  800468:	b7f1                	j	800434 <vprintfmt+0x126>
  80046a:	864e                	mv	a2,s3
  80046c:	85ca                	mv	a1,s2
  80046e:	03000513          	li	a0,48
  800472:	e042                	sd	a6,0(sp)
  800474:	9482                	jalr	s1
  800476:	864e                	mv	a2,s3
  800478:	85ca                	mv	a1,s2
  80047a:	07800513          	li	a0,120
  80047e:	9482                	jalr	s1
  800480:	000ab683          	ld	a3,0(s5)
  800484:	6802                	ld	a6,0(sp)
  800486:	4741                	li	a4,16
  800488:	0aa1                	addi	s5,s5,8
  80048a:	b76d                	j	800434 <vprintfmt+0x126>
  80048c:	864e                	mv	a2,s3
  80048e:	85ca                	mv	a1,s2
  800490:	02500513          	li	a0,37
  800494:	9482                	jalr	s1
  800496:	b57d                	j	800344 <vprintfmt+0x36>
  800498:	000aad03          	lw	s10,0(s5)
  80049c:	8466                	mv	s0,s9
  80049e:	0aa1                	addi	s5,s5,8
  8004a0:	b7a5                	j	800408 <vprintfmt+0xfa>
  8004a2:	4785                	li	a5,1
  8004a4:	008a8613          	addi	a2,s5,8
  8004a8:	00b7c463          	blt	a5,a1,8004b0 <vprintfmt+0x1a2>
  8004ac:	12058763          	beqz	a1,8005da <vprintfmt+0x2cc>
  8004b0:	000ab683          	ld	a3,0(s5)
  8004b4:	4721                	li	a4,8
  8004b6:	8ab2                	mv	s5,a2
  8004b8:	bfb5                	j	800434 <vprintfmt+0x126>
  8004ba:	87ee                	mv	a5,s11
  8004bc:	000dd363          	bgez	s11,8004c2 <vprintfmt+0x1b4>
  8004c0:	4781                	li	a5,0
  8004c2:	00078d9b          	sext.w	s11,a5
  8004c6:	8466                	mv	s0,s9
  8004c8:	b55d                	j	80036e <vprintfmt+0x60>
  8004ca:	0008041b          	sext.w	s0,a6
  8004ce:	fd340793          	addi	a5,s0,-45
  8004d2:	01b02733          	sgtz	a4,s11
  8004d6:	00f037b3          	snez	a5,a5
  8004da:	8ff9                	and	a5,a5,a4
  8004dc:	000ab703          	ld	a4,0(s5)
  8004e0:	008a8693          	addi	a3,s5,8
  8004e4:	e436                	sd	a3,8(sp)
  8004e6:	12070563          	beqz	a4,800610 <vprintfmt+0x302>
  8004ea:	12079d63          	bnez	a5,800624 <vprintfmt+0x316>
  8004ee:	00074783          	lbu	a5,0(a4)
  8004f2:	0007851b          	sext.w	a0,a5
  8004f6:	c78d                	beqz	a5,800520 <vprintfmt+0x212>
  8004f8:	00170a93          	addi	s5,a4,1
  8004fc:	547d                	li	s0,-1
  8004fe:	000d4563          	bltz	s10,800508 <vprintfmt+0x1fa>
  800502:	3d7d                	addiw	s10,s10,-1
  800504:	008d0e63          	beq	s10,s0,800520 <vprintfmt+0x212>
  800508:	020c1863          	bnez	s8,800538 <vprintfmt+0x22a>
  80050c:	864e                	mv	a2,s3
  80050e:	85ca                	mv	a1,s2
  800510:	9482                	jalr	s1
  800512:	000ac783          	lbu	a5,0(s5)
  800516:	0a85                	addi	s5,s5,1
  800518:	3dfd                	addiw	s11,s11,-1
  80051a:	0007851b          	sext.w	a0,a5
  80051e:	f3e5                	bnez	a5,8004fe <vprintfmt+0x1f0>
  800520:	01b05a63          	blez	s11,800534 <vprintfmt+0x226>
  800524:	864e                	mv	a2,s3
  800526:	85ca                	mv	a1,s2
  800528:	02000513          	li	a0,32
  80052c:	3dfd                	addiw	s11,s11,-1
  80052e:	9482                	jalr	s1
  800530:	fe0d9ae3          	bnez	s11,800524 <vprintfmt+0x216>
  800534:	6aa2                	ld	s5,8(sp)
  800536:	b539                	j	800344 <vprintfmt+0x36>
  800538:	3781                	addiw	a5,a5,-32
  80053a:	05e00713          	li	a4,94
  80053e:	fcf777e3          	bgeu	a4,a5,80050c <vprintfmt+0x1fe>
  800542:	03f00513          	li	a0,63
  800546:	864e                	mv	a2,s3
  800548:	85ca                	mv	a1,s2
  80054a:	9482                	jalr	s1
  80054c:	000ac783          	lbu	a5,0(s5)
  800550:	0a85                	addi	s5,s5,1
  800552:	3dfd                	addiw	s11,s11,-1
  800554:	0007851b          	sext.w	a0,a5
  800558:	d7e1                	beqz	a5,800520 <vprintfmt+0x212>
  80055a:	fa0d54e3          	bgez	s10,800502 <vprintfmt+0x1f4>
  80055e:	bfe9                	j	800538 <vprintfmt+0x22a>
  800560:	000aa783          	lw	a5,0(s5)
  800564:	46e1                	li	a3,24
  800566:	0aa1                	addi	s5,s5,8
  800568:	41f7d71b          	sraiw	a4,a5,0x1f
  80056c:	8fb9                	xor	a5,a5,a4
  80056e:	40e7873b          	subw	a4,a5,a4
  800572:	02e6c663          	blt	a3,a4,80059e <vprintfmt+0x290>
  800576:	00000797          	auipc	a5,0x0
  80057a:	78278793          	addi	a5,a5,1922 # 800cf8 <error_string>
  80057e:	00371693          	slli	a3,a4,0x3
  800582:	97b6                	add	a5,a5,a3
  800584:	639c                	ld	a5,0(a5)
  800586:	cf81                	beqz	a5,80059e <vprintfmt+0x290>
  800588:	873e                	mv	a4,a5
  80058a:	00000697          	auipc	a3,0x0
  80058e:	2fe68693          	addi	a3,a3,766 # 800888 <main+0x1c4>
  800592:	864a                	mv	a2,s2
  800594:	85ce                	mv	a1,s3
  800596:	8526                	mv	a0,s1
  800598:	0f2000ef          	jal	80068a <printfmt>
  80059c:	b365                	j	800344 <vprintfmt+0x36>
  80059e:	00000697          	auipc	a3,0x0
  8005a2:	2da68693          	addi	a3,a3,730 # 800878 <main+0x1b4>
  8005a6:	864a                	mv	a2,s2
  8005a8:	85ce                	mv	a1,s3
  8005aa:	8526                	mv	a0,s1
  8005ac:	0de000ef          	jal	80068a <printfmt>
  8005b0:	bb51                	j	800344 <vprintfmt+0x36>
  8005b2:	4785                	li	a5,1
  8005b4:	008a8c13          	addi	s8,s5,8
  8005b8:	00b7c363          	blt	a5,a1,8005be <vprintfmt+0x2b0>
  8005bc:	cd81                	beqz	a1,8005d4 <vprintfmt+0x2c6>
  8005be:	000ab403          	ld	s0,0(s5)
  8005c2:	02044b63          	bltz	s0,8005f8 <vprintfmt+0x2ea>
  8005c6:	86a2                	mv	a3,s0
  8005c8:	8ae2                	mv	s5,s8
  8005ca:	4729                	li	a4,10
  8005cc:	b5a5                	j	800434 <vprintfmt+0x126>
  8005ce:	2585                	addiw	a1,a1,1
  8005d0:	8466                	mv	s0,s9
  8005d2:	bb71                	j	80036e <vprintfmt+0x60>
  8005d4:	000aa403          	lw	s0,0(s5)
  8005d8:	b7ed                	j	8005c2 <vprintfmt+0x2b4>
  8005da:	000ae683          	lwu	a3,0(s5)
  8005de:	4721                	li	a4,8
  8005e0:	8ab2                	mv	s5,a2
  8005e2:	bd89                	j	800434 <vprintfmt+0x126>
  8005e4:	000ae683          	lwu	a3,0(s5)
  8005e8:	4729                	li	a4,10
  8005ea:	8ab2                	mv	s5,a2
  8005ec:	b5a1                	j	800434 <vprintfmt+0x126>
  8005ee:	000ae683          	lwu	a3,0(s5)
  8005f2:	4741                	li	a4,16
  8005f4:	8ab2                	mv	s5,a2
  8005f6:	bd3d                	j	800434 <vprintfmt+0x126>
  8005f8:	864e                	mv	a2,s3
  8005fa:	85ca                	mv	a1,s2
  8005fc:	02d00513          	li	a0,45
  800600:	e042                	sd	a6,0(sp)
  800602:	9482                	jalr	s1
  800604:	6802                	ld	a6,0(sp)
  800606:	408006b3          	neg	a3,s0
  80060a:	8ae2                	mv	s5,s8
  80060c:	4729                	li	a4,10
  80060e:	b51d                	j	800434 <vprintfmt+0x126>
  800610:	eba1                	bnez	a5,800660 <vprintfmt+0x352>
  800612:	02800793          	li	a5,40
  800616:	853e                	mv	a0,a5
  800618:	00000a97          	auipc	s5,0x0
  80061c:	259a8a93          	addi	s5,s5,601 # 800871 <main+0x1ad>
  800620:	547d                	li	s0,-1
  800622:	bdf1                	j	8004fe <vprintfmt+0x1f0>
  800624:	853a                	mv	a0,a4
  800626:	85ea                	mv	a1,s10
  800628:	e03a                	sd	a4,0(sp)
  80062a:	07e000ef          	jal	8006a8 <strnlen>
  80062e:	40ad8dbb          	subw	s11,s11,a0
  800632:	6702                	ld	a4,0(sp)
  800634:	01b05b63          	blez	s11,80064a <vprintfmt+0x33c>
  800638:	864e                	mv	a2,s3
  80063a:	85ca                	mv	a1,s2
  80063c:	8522                	mv	a0,s0
  80063e:	e03a                	sd	a4,0(sp)
  800640:	3dfd                	addiw	s11,s11,-1
  800642:	9482                	jalr	s1
  800644:	6702                	ld	a4,0(sp)
  800646:	fe0d99e3          	bnez	s11,800638 <vprintfmt+0x32a>
  80064a:	00074783          	lbu	a5,0(a4)
  80064e:	0007851b          	sext.w	a0,a5
  800652:	ee0781e3          	beqz	a5,800534 <vprintfmt+0x226>
  800656:	00170a93          	addi	s5,a4,1
  80065a:	b54d                	j	8004fc <vprintfmt+0x1ee>
  80065c:	8466                	mv	s0,s9
  80065e:	b36d                	j	800408 <vprintfmt+0xfa>
  800660:	85ea                	mv	a1,s10
  800662:	00000517          	auipc	a0,0x0
  800666:	20e50513          	addi	a0,a0,526 # 800870 <main+0x1ac>
  80066a:	03e000ef          	jal	8006a8 <strnlen>
  80066e:	40ad8dbb          	subw	s11,s11,a0
  800672:	02800793          	li	a5,40
  800676:	00000717          	auipc	a4,0x0
  80067a:	1fa70713          	addi	a4,a4,506 # 800870 <main+0x1ac>
  80067e:	853e                	mv	a0,a5
  800680:	fbb04ce3          	bgtz	s11,800638 <vprintfmt+0x32a>
  800684:	00170a93          	addi	s5,a4,1
  800688:	bd95                	j	8004fc <vprintfmt+0x1ee>

000000000080068a <printfmt>:
  80068a:	7139                	addi	sp,sp,-64
  80068c:	02010313          	addi	t1,sp,32
  800690:	f03a                	sd	a4,32(sp)
  800692:	871a                	mv	a4,t1
  800694:	ec06                	sd	ra,24(sp)
  800696:	f43e                	sd	a5,40(sp)
  800698:	f842                	sd	a6,48(sp)
  80069a:	fc46                	sd	a7,56(sp)
  80069c:	e41a                	sd	t1,8(sp)
  80069e:	c71ff0ef          	jal	80030e <vprintfmt>
  8006a2:	60e2                	ld	ra,24(sp)
  8006a4:	6121                	addi	sp,sp,64
  8006a6:	8082                	ret

00000000008006a8 <strnlen>:
  8006a8:	4781                	li	a5,0
  8006aa:	e589                	bnez	a1,8006b4 <strnlen+0xc>
  8006ac:	a811                	j	8006c0 <strnlen+0x18>
  8006ae:	0785                	addi	a5,a5,1
  8006b0:	00f58863          	beq	a1,a5,8006c0 <strnlen+0x18>
  8006b4:	00f50733          	add	a4,a0,a5
  8006b8:	00074703          	lbu	a4,0(a4)
  8006bc:	fb6d                	bnez	a4,8006ae <strnlen+0x6>
  8006be:	85be                	mv	a1,a5
  8006c0:	852e                	mv	a0,a1
  8006c2:	8082                	ret

00000000008006c4 <main>:
  8006c4:	1141                	addi	sp,sp,-16
  8006c6:	00000517          	auipc	a0,0x0
  8006ca:	3a250513          	addi	a0,a0,930 # 800a68 <main+0x3a4>
  8006ce:	e406                	sd	ra,8(sp)
  8006d0:	e022                	sd	s0,0(sp)
  8006d2:	a23ff0ef          	jal	8000f4 <cprintf>
  8006d6:	ae7ff0ef          	jal	8001bc <fork>
  8006da:	e901                	bnez	a0,8006ea <main+0x26>
  8006dc:	00000517          	auipc	a0,0x0
  8006e0:	3b450513          	addi	a0,a0,948 # 800a90 <main+0x3cc>
  8006e4:	a11ff0ef          	jal	8000f4 <cprintf>
  8006e8:	a001                	j	8006e8 <main+0x24>
  8006ea:	842a                	mv	s0,a0
  8006ec:	00000517          	auipc	a0,0x0
  8006f0:	3c450513          	addi	a0,a0,964 # 800ab0 <main+0x3ec>
  8006f4:	a01ff0ef          	jal	8000f4 <cprintf>
  8006f8:	aedff0ef          	jal	8001e4 <yield>
  8006fc:	ae9ff0ef          	jal	8001e4 <yield>
  800700:	ae5ff0ef          	jal	8001e4 <yield>
  800704:	00000517          	auipc	a0,0x0
  800708:	3d450513          	addi	a0,a0,980 # 800ad8 <main+0x414>
  80070c:	9e9ff0ef          	jal	8000f4 <cprintf>
  800710:	8522                	mv	a0,s0
  800712:	ad5ff0ef          	jal	8001e6 <kill>
  800716:	ed31                	bnez	a0,800772 <main+0xae>
  800718:	4581                	li	a1,0
  80071a:	00000517          	auipc	a0,0x0
  80071e:	42650513          	addi	a0,a0,1062 # 800b40 <main+0x47c>
  800722:	9d3ff0ef          	jal	8000f4 <cprintf>
  800726:	8522                	mv	a0,s0
  800728:	4581                	li	a1,0
  80072a:	a95ff0ef          	jal	8001be <waitpid>
  80072e:	e11d                	bnez	a0,800754 <main+0x90>
  800730:	4581                	li	a1,0
  800732:	00000517          	auipc	a0,0x0
  800736:	44650513          	addi	a0,a0,1094 # 800b78 <main+0x4b4>
  80073a:	9bbff0ef          	jal	8000f4 <cprintf>
  80073e:	00000517          	auipc	a0,0x0
  800742:	45250513          	addi	a0,a0,1106 # 800b90 <main+0x4cc>
  800746:	9afff0ef          	jal	8000f4 <cprintf>
  80074a:	60a2                	ld	ra,8(sp)
  80074c:	6402                	ld	s0,0(sp)
  80074e:	4501                	li	a0,0
  800750:	0141                	addi	sp,sp,16
  800752:	8082                	ret
  800754:	00000697          	auipc	a3,0x0
  800758:	40468693          	addi	a3,a3,1028 # 800b58 <main+0x494>
  80075c:	00000617          	auipc	a2,0x0
  800760:	3bc60613          	addi	a2,a2,956 # 800b18 <main+0x454>
  800764:	45dd                	li	a1,23
  800766:	00000517          	auipc	a0,0x0
  80076a:	3ca50513          	addi	a0,a0,970 # 800b30 <main+0x46c>
  80076e:	8c3ff0ef          	jal	800030 <__panic>
  800772:	00000697          	auipc	a3,0x0
  800776:	38e68693          	addi	a3,a3,910 # 800b00 <main+0x43c>
  80077a:	00000617          	auipc	a2,0x0
  80077e:	39e60613          	addi	a2,a2,926 # 800b18 <main+0x454>
  800782:	45d1                	li	a1,20
  800784:	00000517          	auipc	a0,0x0
  800788:	3ac50513          	addi	a0,a0,940 # 800b30 <main+0x46c>
  80078c:	8a5ff0ef          	jal	800030 <__panic>
