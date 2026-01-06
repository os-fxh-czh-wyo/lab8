
obj/__user_sh.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <open>:
  800020:	1582                	slli	a1,a1,0x20
  800022:	9181                	srli	a1,a1,0x20
  800024:	ac09                	j	800236 <sys_open>

0000000000800026 <close>:
  800026:	ac29                	j	800240 <sys_close>

0000000000800028 <read>:
  800028:	a405                	j	800248 <sys_read>

000000000080002a <write>:
  80002a:	a42d                	j	800254 <sys_write>

000000000080002c <dup2>:
  80002c:	ac15                	j	800260 <sys_dup>

000000000080002e <_start>:
  80002e:	2d8000ef          	jal	800306 <umain>
  800032:	a001                	j	800032 <_start+0x4>

0000000000800034 <__panic>:
  800034:	715d                	addi	sp,sp,-80
  800036:	02810313          	addi	t1,sp,40
  80003a:	e822                	sd	s0,16(sp)
  80003c:	8432                	mv	s0,a2
  80003e:	862e                	mv	a2,a1
  800040:	85aa                	mv	a1,a0
  800042:	00001517          	auipc	a0,0x1
  800046:	d3e50513          	addi	a0,a0,-706 # 800d80 <main+0xc6>
  80004a:	ec06                	sd	ra,24(sp)
  80004c:	f436                	sd	a3,40(sp)
  80004e:	f83a                	sd	a4,48(sp)
  800050:	fc3e                	sd	a5,56(sp)
  800052:	e0c2                	sd	a6,64(sp)
  800054:	e4c6                	sd	a7,72(sp)
  800056:	e41a                	sd	t1,8(sp)
  800058:	0c6000ef          	jal	80011e <cprintf>
  80005c:	65a2                	ld	a1,8(sp)
  80005e:	8522                	mv	a0,s0
  800060:	098000ef          	jal	8000f8 <vcprintf>
  800064:	00001517          	auipc	a0,0x1
  800068:	d3c50513          	addi	a0,a0,-708 # 800da0 <main+0xe6>
  80006c:	0b2000ef          	jal	80011e <cprintf>
  800070:	5559                	li	a0,-10
  800072:	1f8000ef          	jal	80026a <exit>

0000000000800076 <__warn>:
  800076:	715d                	addi	sp,sp,-80
  800078:	e822                	sd	s0,16(sp)
  80007a:	02810313          	addi	t1,sp,40
  80007e:	8432                	mv	s0,a2
  800080:	862e                	mv	a2,a1
  800082:	85aa                	mv	a1,a0
  800084:	00001517          	auipc	a0,0x1
  800088:	d2450513          	addi	a0,a0,-732 # 800da8 <main+0xee>
  80008c:	ec06                	sd	ra,24(sp)
  80008e:	f436                	sd	a3,40(sp)
  800090:	f83a                	sd	a4,48(sp)
  800092:	fc3e                	sd	a5,56(sp)
  800094:	e0c2                	sd	a6,64(sp)
  800096:	e4c6                	sd	a7,72(sp)
  800098:	e41a                	sd	t1,8(sp)
  80009a:	084000ef          	jal	80011e <cprintf>
  80009e:	65a2                	ld	a1,8(sp)
  8000a0:	8522                	mv	a0,s0
  8000a2:	056000ef          	jal	8000f8 <vcprintf>
  8000a6:	00001517          	auipc	a0,0x1
  8000aa:	cfa50513          	addi	a0,a0,-774 # 800da0 <main+0xe6>
  8000ae:	070000ef          	jal	80011e <cprintf>
  8000b2:	60e2                	ld	ra,24(sp)
  8000b4:	6442                	ld	s0,16(sp)
  8000b6:	6161                	addi	sp,sp,80
  8000b8:	8082                	ret

00000000008000ba <cputch>:
  8000ba:	1101                	addi	sp,sp,-32
  8000bc:	ec06                	sd	ra,24(sp)
  8000be:	e42e                	sd	a1,8(sp)
  8000c0:	166000ef          	jal	800226 <sys_putc>
  8000c4:	65a2                	ld	a1,8(sp)
  8000c6:	60e2                	ld	ra,24(sp)
  8000c8:	419c                	lw	a5,0(a1)
  8000ca:	2785                	addiw	a5,a5,1
  8000cc:	c19c                	sw	a5,0(a1)
  8000ce:	6105                	addi	sp,sp,32
  8000d0:	8082                	ret

00000000008000d2 <fputch>:
  8000d2:	1101                	addi	sp,sp,-32
  8000d4:	e822                	sd	s0,16(sp)
  8000d6:	00a107a3          	sb	a0,15(sp)
  8000da:	842e                	mv	s0,a1
  8000dc:	8532                	mv	a0,a2
  8000de:	00f10593          	addi	a1,sp,15
  8000e2:	4605                	li	a2,1
  8000e4:	ec06                	sd	ra,24(sp)
  8000e6:	f45ff0ef          	jal	80002a <write>
  8000ea:	401c                	lw	a5,0(s0)
  8000ec:	60e2                	ld	ra,24(sp)
  8000ee:	2785                	addiw	a5,a5,1
  8000f0:	c01c                	sw	a5,0(s0)
  8000f2:	6442                	ld	s0,16(sp)
  8000f4:	6105                	addi	sp,sp,32
  8000f6:	8082                	ret

00000000008000f8 <vcprintf>:
  8000f8:	1101                	addi	sp,sp,-32
  8000fa:	872e                	mv	a4,a1
  8000fc:	75dd                	lui	a1,0xffff7
  8000fe:	86aa                	mv	a3,a0
  800100:	0070                	addi	a2,sp,12
  800102:	00000517          	auipc	a0,0x0
  800106:	fb850513          	addi	a0,a0,-72 # 8000ba <cputch>
  80010a:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <shcwd+0xffffffffff7f29d1>
  80010e:	ec06                	sd	ra,24(sp)
  800110:	c602                	sw	zero,12(sp)
  800112:	2f2000ef          	jal	800404 <vprintfmt>
  800116:	60e2                	ld	ra,24(sp)
  800118:	4532                	lw	a0,12(sp)
  80011a:	6105                	addi	sp,sp,32
  80011c:	8082                	ret

000000000080011e <cprintf>:
  80011e:	711d                	addi	sp,sp,-96
  800120:	02810313          	addi	t1,sp,40
  800124:	f42e                	sd	a1,40(sp)
  800126:	75dd                	lui	a1,0xffff7
  800128:	f832                	sd	a2,48(sp)
  80012a:	fc36                	sd	a3,56(sp)
  80012c:	e0ba                	sd	a4,64(sp)
  80012e:	86aa                	mv	a3,a0
  800130:	0050                	addi	a2,sp,4
  800132:	00000517          	auipc	a0,0x0
  800136:	f8850513          	addi	a0,a0,-120 # 8000ba <cputch>
  80013a:	871a                	mv	a4,t1
  80013c:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <shcwd+0xffffffffff7f29d1>
  800140:	ec06                	sd	ra,24(sp)
  800142:	e4be                	sd	a5,72(sp)
  800144:	e8c2                	sd	a6,80(sp)
  800146:	ecc6                	sd	a7,88(sp)
  800148:	c202                	sw	zero,4(sp)
  80014a:	e41a                	sd	t1,8(sp)
  80014c:	2b8000ef          	jal	800404 <vprintfmt>
  800150:	60e2                	ld	ra,24(sp)
  800152:	4512                	lw	a0,4(sp)
  800154:	6125                	addi	sp,sp,96
  800156:	8082                	ret

0000000000800158 <cputs>:
  800158:	1101                	addi	sp,sp,-32
  80015a:	e822                	sd	s0,16(sp)
  80015c:	ec06                	sd	ra,24(sp)
  80015e:	842a                	mv	s0,a0
  800160:	00054503          	lbu	a0,0(a0)
  800164:	c51d                	beqz	a0,800192 <cputs+0x3a>
  800166:	e426                	sd	s1,8(sp)
  800168:	0405                	addi	s0,s0,1
  80016a:	4481                	li	s1,0
  80016c:	0ba000ef          	jal	800226 <sys_putc>
  800170:	00044503          	lbu	a0,0(s0)
  800174:	0405                	addi	s0,s0,1
  800176:	87a6                	mv	a5,s1
  800178:	2485                	addiw	s1,s1,1
  80017a:	f96d                	bnez	a0,80016c <cputs+0x14>
  80017c:	4529                	li	a0,10
  80017e:	0027841b          	addiw	s0,a5,2
  800182:	64a2                	ld	s1,8(sp)
  800184:	0a2000ef          	jal	800226 <sys_putc>
  800188:	60e2                	ld	ra,24(sp)
  80018a:	8522                	mv	a0,s0
  80018c:	6442                	ld	s0,16(sp)
  80018e:	6105                	addi	sp,sp,32
  800190:	8082                	ret
  800192:	4529                	li	a0,10
  800194:	092000ef          	jal	800226 <sys_putc>
  800198:	4405                	li	s0,1
  80019a:	60e2                	ld	ra,24(sp)
  80019c:	8522                	mv	a0,s0
  80019e:	6442                	ld	s0,16(sp)
  8001a0:	6105                	addi	sp,sp,32
  8001a2:	8082                	ret

00000000008001a4 <fprintf>:
  8001a4:	715d                	addi	sp,sp,-80
  8001a6:	02010313          	addi	t1,sp,32
  8001aa:	8e2e                	mv	t3,a1
  8001ac:	f032                	sd	a2,32(sp)
  8001ae:	f436                	sd	a3,40(sp)
  8001b0:	f83a                	sd	a4,48(sp)
  8001b2:	85aa                	mv	a1,a0
  8001b4:	0050                	addi	a2,sp,4
  8001b6:	00000517          	auipc	a0,0x0
  8001ba:	f1c50513          	addi	a0,a0,-228 # 8000d2 <fputch>
  8001be:	86f2                	mv	a3,t3
  8001c0:	871a                	mv	a4,t1
  8001c2:	ec06                	sd	ra,24(sp)
  8001c4:	fc3e                	sd	a5,56(sp)
  8001c6:	e0c2                	sd	a6,64(sp)
  8001c8:	e4c6                	sd	a7,72(sp)
  8001ca:	c202                	sw	zero,4(sp)
  8001cc:	e41a                	sd	t1,8(sp)
  8001ce:	236000ef          	jal	800404 <vprintfmt>
  8001d2:	60e2                	ld	ra,24(sp)
  8001d4:	4512                	lw	a0,4(sp)
  8001d6:	6161                	addi	sp,sp,80
  8001d8:	8082                	ret

00000000008001da <syscall>:
  8001da:	7175                	addi	sp,sp,-144
  8001dc:	08010313          	addi	t1,sp,128
  8001e0:	e42a                	sd	a0,8(sp)
  8001e2:	ecae                	sd	a1,88(sp)
  8001e4:	f42e                	sd	a1,40(sp)
  8001e6:	f0b2                	sd	a2,96(sp)
  8001e8:	f832                	sd	a2,48(sp)
  8001ea:	f4b6                	sd	a3,104(sp)
  8001ec:	fc36                	sd	a3,56(sp)
  8001ee:	f8ba                	sd	a4,112(sp)
  8001f0:	e0ba                	sd	a4,64(sp)
  8001f2:	fcbe                	sd	a5,120(sp)
  8001f4:	e4be                	sd	a5,72(sp)
  8001f6:	e142                	sd	a6,128(sp)
  8001f8:	e546                	sd	a7,136(sp)
  8001fa:	f01a                	sd	t1,32(sp)
  8001fc:	4522                	lw	a0,8(sp)
  8001fe:	55a2                	lw	a1,40(sp)
  800200:	5642                	lw	a2,48(sp)
  800202:	56e2                	lw	a3,56(sp)
  800204:	4706                	lw	a4,64(sp)
  800206:	47a6                	lw	a5,72(sp)
  800208:	00000073          	ecall
  80020c:	ce2a                	sw	a0,28(sp)
  80020e:	4572                	lw	a0,28(sp)
  800210:	6149                	addi	sp,sp,144
  800212:	8082                	ret

0000000000800214 <sys_exit>:
  800214:	85aa                	mv	a1,a0
  800216:	4505                	li	a0,1
  800218:	b7c9                	j	8001da <syscall>

000000000080021a <sys_fork>:
  80021a:	4509                	li	a0,2
  80021c:	bf7d                	j	8001da <syscall>

000000000080021e <sys_wait>:
  80021e:	862e                	mv	a2,a1
  800220:	85aa                	mv	a1,a0
  800222:	450d                	li	a0,3
  800224:	bf5d                	j	8001da <syscall>

0000000000800226 <sys_putc>:
  800226:	85aa                	mv	a1,a0
  800228:	4579                	li	a0,30
  80022a:	bf45                	j	8001da <syscall>

000000000080022c <sys_exec>:
  80022c:	86b2                	mv	a3,a2
  80022e:	862e                	mv	a2,a1
  800230:	85aa                	mv	a1,a0
  800232:	4511                	li	a0,4
  800234:	b75d                	j	8001da <syscall>

0000000000800236 <sys_open>:
  800236:	862e                	mv	a2,a1
  800238:	85aa                	mv	a1,a0
  80023a:	06400513          	li	a0,100
  80023e:	bf71                	j	8001da <syscall>

0000000000800240 <sys_close>:
  800240:	85aa                	mv	a1,a0
  800242:	06500513          	li	a0,101
  800246:	bf51                	j	8001da <syscall>

0000000000800248 <sys_read>:
  800248:	86b2                	mv	a3,a2
  80024a:	862e                	mv	a2,a1
  80024c:	85aa                	mv	a1,a0
  80024e:	06600513          	li	a0,102
  800252:	b761                	j	8001da <syscall>

0000000000800254 <sys_write>:
  800254:	86b2                	mv	a3,a2
  800256:	862e                	mv	a2,a1
  800258:	85aa                	mv	a1,a0
  80025a:	06700513          	li	a0,103
  80025e:	bfb5                	j	8001da <syscall>

0000000000800260 <sys_dup>:
  800260:	862e                	mv	a2,a1
  800262:	85aa                	mv	a1,a0
  800264:	08200513          	li	a0,130
  800268:	bf8d                	j	8001da <syscall>

000000000080026a <exit>:
  80026a:	1141                	addi	sp,sp,-16
  80026c:	e406                	sd	ra,8(sp)
  80026e:	fa7ff0ef          	jal	800214 <sys_exit>
  800272:	00001517          	auipc	a0,0x1
  800276:	b5650513          	addi	a0,a0,-1194 # 800dc8 <main+0x10e>
  80027a:	ea5ff0ef          	jal	80011e <cprintf>
  80027e:	a001                	j	80027e <exit+0x14>

0000000000800280 <fork>:
  800280:	bf69                	j	80021a <sys_fork>

0000000000800282 <waitpid>:
  800282:	7179                	addi	sp,sp,-48
  800284:	f406                	sd	ra,40(sp)
  800286:	ec02                	sd	zero,24(sp)
  800288:	c999                	beqz	a1,80029e <waitpid+0x1c>
  80028a:	e42e                	sd	a1,8(sp)
  80028c:	082c                	addi	a1,sp,24
  80028e:	f91ff0ef          	jal	80021e <sys_wait>
  800292:	6762                	ld	a4,24(sp)
  800294:	67a2                	ld	a5,8(sp)
  800296:	70a2                	ld	ra,40(sp)
  800298:	c398                	sw	a4,0(a5)
  80029a:	6145                	addi	sp,sp,48
  80029c:	8082                	ret
  80029e:	f81ff0ef          	jal	80021e <sys_wait>
  8002a2:	70a2                	ld	ra,40(sp)
  8002a4:	6145                	addi	sp,sp,48
  8002a6:	8082                	ret

00000000008002a8 <__exec>:
  8002a8:	619c                	ld	a5,0(a1)
  8002aa:	862e                	mv	a2,a1
  8002ac:	cb91                	beqz	a5,8002c0 <__exec+0x18>
  8002ae:	00858793          	addi	a5,a1,8
  8002b2:	4701                	li	a4,0
  8002b4:	6394                	ld	a3,0(a5)
  8002b6:	07a1                	addi	a5,a5,8
  8002b8:	2705                	addiw	a4,a4,1
  8002ba:	feed                	bnez	a3,8002b4 <__exec+0xc>
  8002bc:	85ba                	mv	a1,a4
  8002be:	b7bd                	j	80022c <sys_exec>
  8002c0:	4581                	li	a1,0
  8002c2:	b7ad                	j	80022c <sys_exec>

00000000008002c4 <initfd>:
  8002c4:	87ae                	mv	a5,a1
  8002c6:	1101                	addi	sp,sp,-32
  8002c8:	e822                	sd	s0,16(sp)
  8002ca:	85b2                	mv	a1,a2
  8002cc:	842a                	mv	s0,a0
  8002ce:	853e                	mv	a0,a5
  8002d0:	ec06                	sd	ra,24(sp)
  8002d2:	d4fff0ef          	jal	800020 <open>
  8002d6:	87aa                	mv	a5,a0
  8002d8:	00054463          	bltz	a0,8002e0 <initfd+0x1c>
  8002dc:	00851763          	bne	a0,s0,8002ea <initfd+0x26>
  8002e0:	60e2                	ld	ra,24(sp)
  8002e2:	6442                	ld	s0,16(sp)
  8002e4:	853e                	mv	a0,a5
  8002e6:	6105                	addi	sp,sp,32
  8002e8:	8082                	ret
  8002ea:	e42a                	sd	a0,8(sp)
  8002ec:	8522                	mv	a0,s0
  8002ee:	d39ff0ef          	jal	800026 <close>
  8002f2:	6522                	ld	a0,8(sp)
  8002f4:	85a2                	mv	a1,s0
  8002f6:	d37ff0ef          	jal	80002c <dup2>
  8002fa:	842a                	mv	s0,a0
  8002fc:	6522                	ld	a0,8(sp)
  8002fe:	d29ff0ef          	jal	800026 <close>
  800302:	87a2                	mv	a5,s0
  800304:	bff1                	j	8002e0 <initfd+0x1c>

0000000000800306 <umain>:
  800306:	1101                	addi	sp,sp,-32
  800308:	e822                	sd	s0,16(sp)
  80030a:	e426                	sd	s1,8(sp)
  80030c:	842a                	mv	s0,a0
  80030e:	84ae                	mv	s1,a1
  800310:	4601                	li	a2,0
  800312:	00001597          	auipc	a1,0x1
  800316:	ace58593          	addi	a1,a1,-1330 # 800de0 <main+0x126>
  80031a:	4501                	li	a0,0
  80031c:	ec06                	sd	ra,24(sp)
  80031e:	fa7ff0ef          	jal	8002c4 <initfd>
  800322:	02054263          	bltz	a0,800346 <umain+0x40>
  800326:	4605                	li	a2,1
  800328:	8532                	mv	a0,a2
  80032a:	00001597          	auipc	a1,0x1
  80032e:	af658593          	addi	a1,a1,-1290 # 800e20 <main+0x166>
  800332:	f93ff0ef          	jal	8002c4 <initfd>
  800336:	02054563          	bltz	a0,800360 <umain+0x5a>
  80033a:	85a6                	mv	a1,s1
  80033c:	8522                	mv	a0,s0
  80033e:	17d000ef          	jal	800cba <main>
  800342:	f29ff0ef          	jal	80026a <exit>
  800346:	86aa                	mv	a3,a0
  800348:	00001617          	auipc	a2,0x1
  80034c:	aa060613          	addi	a2,a2,-1376 # 800de8 <main+0x12e>
  800350:	45e9                	li	a1,26
  800352:	00001517          	auipc	a0,0x1
  800356:	ab650513          	addi	a0,a0,-1354 # 800e08 <main+0x14e>
  80035a:	d1dff0ef          	jal	800076 <__warn>
  80035e:	b7e1                	j	800326 <umain+0x20>
  800360:	86aa                	mv	a3,a0
  800362:	00001617          	auipc	a2,0x1
  800366:	ac660613          	addi	a2,a2,-1338 # 800e28 <main+0x16e>
  80036a:	45f5                	li	a1,29
  80036c:	00001517          	auipc	a0,0x1
  800370:	a9c50513          	addi	a0,a0,-1380 # 800e08 <main+0x14e>
  800374:	d03ff0ef          	jal	800076 <__warn>
  800378:	b7c9                	j	80033a <umain+0x34>

000000000080037a <printnum>:
  80037a:	7139                	addi	sp,sp,-64
  80037c:	02071893          	slli	a7,a4,0x20
  800380:	f822                	sd	s0,48(sp)
  800382:	f426                	sd	s1,40(sp)
  800384:	f04a                	sd	s2,32(sp)
  800386:	ec4e                	sd	s3,24(sp)
  800388:	e456                	sd	s5,8(sp)
  80038a:	0208d893          	srli	a7,a7,0x20
  80038e:	fc06                	sd	ra,56(sp)
  800390:	0316fab3          	remu	s5,a3,a7
  800394:	fff7841b          	addiw	s0,a5,-1
  800398:	84aa                	mv	s1,a0
  80039a:	89ae                	mv	s3,a1
  80039c:	8932                	mv	s2,a2
  80039e:	0516f063          	bgeu	a3,a7,8003de <printnum+0x64>
  8003a2:	e852                	sd	s4,16(sp)
  8003a4:	4705                	li	a4,1
  8003a6:	8a42                	mv	s4,a6
  8003a8:	00f75863          	bge	a4,a5,8003b8 <printnum+0x3e>
  8003ac:	864e                	mv	a2,s3
  8003ae:	85ca                	mv	a1,s2
  8003b0:	8552                	mv	a0,s4
  8003b2:	347d                	addiw	s0,s0,-1
  8003b4:	9482                	jalr	s1
  8003b6:	f87d                	bnez	s0,8003ac <printnum+0x32>
  8003b8:	6a42                	ld	s4,16(sp)
  8003ba:	00001797          	auipc	a5,0x1
  8003be:	a8e78793          	addi	a5,a5,-1394 # 800e48 <main+0x18e>
  8003c2:	97d6                	add	a5,a5,s5
  8003c4:	7442                	ld	s0,48(sp)
  8003c6:	0007c503          	lbu	a0,0(a5)
  8003ca:	70e2                	ld	ra,56(sp)
  8003cc:	6aa2                	ld	s5,8(sp)
  8003ce:	864e                	mv	a2,s3
  8003d0:	85ca                	mv	a1,s2
  8003d2:	69e2                	ld	s3,24(sp)
  8003d4:	7902                	ld	s2,32(sp)
  8003d6:	87a6                	mv	a5,s1
  8003d8:	74a2                	ld	s1,40(sp)
  8003da:	6121                	addi	sp,sp,64
  8003dc:	8782                	jr	a5
  8003de:	0316d6b3          	divu	a3,a3,a7
  8003e2:	87a2                	mv	a5,s0
  8003e4:	f97ff0ef          	jal	80037a <printnum>
  8003e8:	bfc9                	j	8003ba <printnum+0x40>

00000000008003ea <sprintputch>:
  8003ea:	499c                	lw	a5,16(a1)
  8003ec:	6198                	ld	a4,0(a1)
  8003ee:	6594                	ld	a3,8(a1)
  8003f0:	2785                	addiw	a5,a5,1
  8003f2:	c99c                	sw	a5,16(a1)
  8003f4:	00d77763          	bgeu	a4,a3,800402 <sprintputch+0x18>
  8003f8:	00170793          	addi	a5,a4,1
  8003fc:	e19c                	sd	a5,0(a1)
  8003fe:	00a70023          	sb	a0,0(a4)
  800402:	8082                	ret

0000000000800404 <vprintfmt>:
  800404:	7119                	addi	sp,sp,-128
  800406:	f4a6                	sd	s1,104(sp)
  800408:	f0ca                	sd	s2,96(sp)
  80040a:	ecce                	sd	s3,88(sp)
  80040c:	e8d2                	sd	s4,80(sp)
  80040e:	e4d6                	sd	s5,72(sp)
  800410:	e0da                	sd	s6,64(sp)
  800412:	fc5e                	sd	s7,56(sp)
  800414:	f466                	sd	s9,40(sp)
  800416:	fc86                	sd	ra,120(sp)
  800418:	f8a2                	sd	s0,112(sp)
  80041a:	f862                	sd	s8,48(sp)
  80041c:	f06a                	sd	s10,32(sp)
  80041e:	ec6e                	sd	s11,24(sp)
  800420:	84aa                	mv	s1,a0
  800422:	8cb6                	mv	s9,a3
  800424:	8aba                	mv	s5,a4
  800426:	89ae                	mv	s3,a1
  800428:	8932                	mv	s2,a2
  80042a:	02500a13          	li	s4,37
  80042e:	05500b93          	li	s7,85
  800432:	00001b17          	auipc	s6,0x1
  800436:	d8ab0b13          	addi	s6,s6,-630 # 8011bc <main+0x502>
  80043a:	000cc503          	lbu	a0,0(s9)
  80043e:	001c8413          	addi	s0,s9,1
  800442:	01450b63          	beq	a0,s4,800458 <vprintfmt+0x54>
  800446:	cd15                	beqz	a0,800482 <vprintfmt+0x7e>
  800448:	864e                	mv	a2,s3
  80044a:	85ca                	mv	a1,s2
  80044c:	9482                	jalr	s1
  80044e:	00044503          	lbu	a0,0(s0)
  800452:	0405                	addi	s0,s0,1
  800454:	ff4519e3          	bne	a0,s4,800446 <vprintfmt+0x42>
  800458:	5d7d                	li	s10,-1
  80045a:	8dea                	mv	s11,s10
  80045c:	02000813          	li	a6,32
  800460:	4c01                	li	s8,0
  800462:	4581                	li	a1,0
  800464:	00044703          	lbu	a4,0(s0)
  800468:	00140c93          	addi	s9,s0,1
  80046c:	fdd7061b          	addiw	a2,a4,-35
  800470:	0ff67613          	zext.b	a2,a2
  800474:	02cbe663          	bltu	s7,a2,8004a0 <vprintfmt+0x9c>
  800478:	060a                	slli	a2,a2,0x2
  80047a:	965a                	add	a2,a2,s6
  80047c:	421c                	lw	a5,0(a2)
  80047e:	97da                	add	a5,a5,s6
  800480:	8782                	jr	a5
  800482:	70e6                	ld	ra,120(sp)
  800484:	7446                	ld	s0,112(sp)
  800486:	74a6                	ld	s1,104(sp)
  800488:	7906                	ld	s2,96(sp)
  80048a:	69e6                	ld	s3,88(sp)
  80048c:	6a46                	ld	s4,80(sp)
  80048e:	6aa6                	ld	s5,72(sp)
  800490:	6b06                	ld	s6,64(sp)
  800492:	7be2                	ld	s7,56(sp)
  800494:	7c42                	ld	s8,48(sp)
  800496:	7ca2                	ld	s9,40(sp)
  800498:	7d02                	ld	s10,32(sp)
  80049a:	6de2                	ld	s11,24(sp)
  80049c:	6109                	addi	sp,sp,128
  80049e:	8082                	ret
  8004a0:	864e                	mv	a2,s3
  8004a2:	85ca                	mv	a1,s2
  8004a4:	02500513          	li	a0,37
  8004a8:	9482                	jalr	s1
  8004aa:	fff44783          	lbu	a5,-1(s0)
  8004ae:	02500713          	li	a4,37
  8004b2:	8ca2                	mv	s9,s0
  8004b4:	f8e783e3          	beq	a5,a4,80043a <vprintfmt+0x36>
  8004b8:	ffecc783          	lbu	a5,-2(s9)
  8004bc:	1cfd                	addi	s9,s9,-1
  8004be:	fee79de3          	bne	a5,a4,8004b8 <vprintfmt+0xb4>
  8004c2:	bfa5                	j	80043a <vprintfmt+0x36>
  8004c4:	00144683          	lbu	a3,1(s0)
  8004c8:	4525                	li	a0,9
  8004ca:	fd070d1b          	addiw	s10,a4,-48
  8004ce:	fd06879b          	addiw	a5,a3,-48
  8004d2:	28f56063          	bltu	a0,a5,800752 <vprintfmt+0x34e>
  8004d6:	2681                	sext.w	a3,a3
  8004d8:	8466                	mv	s0,s9
  8004da:	002d179b          	slliw	a5,s10,0x2
  8004de:	00144703          	lbu	a4,1(s0)
  8004e2:	01a787bb          	addw	a5,a5,s10
  8004e6:	0017979b          	slliw	a5,a5,0x1
  8004ea:	9fb5                	addw	a5,a5,a3
  8004ec:	fd07061b          	addiw	a2,a4,-48
  8004f0:	0405                	addi	s0,s0,1
  8004f2:	fd078d1b          	addiw	s10,a5,-48
  8004f6:	0007069b          	sext.w	a3,a4
  8004fa:	fec570e3          	bgeu	a0,a2,8004da <vprintfmt+0xd6>
  8004fe:	f60dd3e3          	bgez	s11,800464 <vprintfmt+0x60>
  800502:	8dea                	mv	s11,s10
  800504:	5d7d                	li	s10,-1
  800506:	bfb9                	j	800464 <vprintfmt+0x60>
  800508:	883a                	mv	a6,a4
  80050a:	8466                	mv	s0,s9
  80050c:	bfa1                	j	800464 <vprintfmt+0x60>
  80050e:	8466                	mv	s0,s9
  800510:	4c05                	li	s8,1
  800512:	bf89                	j	800464 <vprintfmt+0x60>
  800514:	4785                	li	a5,1
  800516:	008a8613          	addi	a2,s5,8
  80051a:	00b7c463          	blt	a5,a1,800522 <vprintfmt+0x11e>
  80051e:	1c058363          	beqz	a1,8006e4 <vprintfmt+0x2e0>
  800522:	000ab683          	ld	a3,0(s5)
  800526:	4741                	li	a4,16
  800528:	8ab2                	mv	s5,a2
  80052a:	2801                	sext.w	a6,a6
  80052c:	87ee                	mv	a5,s11
  80052e:	864a                	mv	a2,s2
  800530:	85ce                	mv	a1,s3
  800532:	8526                	mv	a0,s1
  800534:	e47ff0ef          	jal	80037a <printnum>
  800538:	b709                	j	80043a <vprintfmt+0x36>
  80053a:	000aa503          	lw	a0,0(s5)
  80053e:	864e                	mv	a2,s3
  800540:	85ca                	mv	a1,s2
  800542:	9482                	jalr	s1
  800544:	0aa1                	addi	s5,s5,8
  800546:	bdd5                	j	80043a <vprintfmt+0x36>
  800548:	4785                	li	a5,1
  80054a:	008a8613          	addi	a2,s5,8
  80054e:	00b7c463          	blt	a5,a1,800556 <vprintfmt+0x152>
  800552:	18058463          	beqz	a1,8006da <vprintfmt+0x2d6>
  800556:	000ab683          	ld	a3,0(s5)
  80055a:	4729                	li	a4,10
  80055c:	8ab2                	mv	s5,a2
  80055e:	b7f1                	j	80052a <vprintfmt+0x126>
  800560:	864e                	mv	a2,s3
  800562:	85ca                	mv	a1,s2
  800564:	03000513          	li	a0,48
  800568:	e042                	sd	a6,0(sp)
  80056a:	9482                	jalr	s1
  80056c:	864e                	mv	a2,s3
  80056e:	85ca                	mv	a1,s2
  800570:	07800513          	li	a0,120
  800574:	9482                	jalr	s1
  800576:	000ab683          	ld	a3,0(s5)
  80057a:	6802                	ld	a6,0(sp)
  80057c:	4741                	li	a4,16
  80057e:	0aa1                	addi	s5,s5,8
  800580:	b76d                	j	80052a <vprintfmt+0x126>
  800582:	864e                	mv	a2,s3
  800584:	85ca                	mv	a1,s2
  800586:	02500513          	li	a0,37
  80058a:	9482                	jalr	s1
  80058c:	b57d                	j	80043a <vprintfmt+0x36>
  80058e:	000aad03          	lw	s10,0(s5)
  800592:	8466                	mv	s0,s9
  800594:	0aa1                	addi	s5,s5,8
  800596:	b7a5                	j	8004fe <vprintfmt+0xfa>
  800598:	4785                	li	a5,1
  80059a:	008a8613          	addi	a2,s5,8
  80059e:	00b7c463          	blt	a5,a1,8005a6 <vprintfmt+0x1a2>
  8005a2:	12058763          	beqz	a1,8006d0 <vprintfmt+0x2cc>
  8005a6:	000ab683          	ld	a3,0(s5)
  8005aa:	4721                	li	a4,8
  8005ac:	8ab2                	mv	s5,a2
  8005ae:	bfb5                	j	80052a <vprintfmt+0x126>
  8005b0:	87ee                	mv	a5,s11
  8005b2:	000dd363          	bgez	s11,8005b8 <vprintfmt+0x1b4>
  8005b6:	4781                	li	a5,0
  8005b8:	00078d9b          	sext.w	s11,a5
  8005bc:	8466                	mv	s0,s9
  8005be:	b55d                	j	800464 <vprintfmt+0x60>
  8005c0:	0008041b          	sext.w	s0,a6
  8005c4:	fd340793          	addi	a5,s0,-45
  8005c8:	01b02733          	sgtz	a4,s11
  8005cc:	00f037b3          	snez	a5,a5
  8005d0:	8ff9                	and	a5,a5,a4
  8005d2:	000ab703          	ld	a4,0(s5)
  8005d6:	008a8693          	addi	a3,s5,8
  8005da:	e436                	sd	a3,8(sp)
  8005dc:	12070563          	beqz	a4,800706 <vprintfmt+0x302>
  8005e0:	12079d63          	bnez	a5,80071a <vprintfmt+0x316>
  8005e4:	00074783          	lbu	a5,0(a4)
  8005e8:	0007851b          	sext.w	a0,a5
  8005ec:	c78d                	beqz	a5,800616 <vprintfmt+0x212>
  8005ee:	00170a93          	addi	s5,a4,1
  8005f2:	547d                	li	s0,-1
  8005f4:	000d4563          	bltz	s10,8005fe <vprintfmt+0x1fa>
  8005f8:	3d7d                	addiw	s10,s10,-1
  8005fa:	008d0e63          	beq	s10,s0,800616 <vprintfmt+0x212>
  8005fe:	020c1863          	bnez	s8,80062e <vprintfmt+0x22a>
  800602:	864e                	mv	a2,s3
  800604:	85ca                	mv	a1,s2
  800606:	9482                	jalr	s1
  800608:	000ac783          	lbu	a5,0(s5)
  80060c:	0a85                	addi	s5,s5,1
  80060e:	3dfd                	addiw	s11,s11,-1
  800610:	0007851b          	sext.w	a0,a5
  800614:	f3e5                	bnez	a5,8005f4 <vprintfmt+0x1f0>
  800616:	01b05a63          	blez	s11,80062a <vprintfmt+0x226>
  80061a:	864e                	mv	a2,s3
  80061c:	85ca                	mv	a1,s2
  80061e:	02000513          	li	a0,32
  800622:	3dfd                	addiw	s11,s11,-1
  800624:	9482                	jalr	s1
  800626:	fe0d9ae3          	bnez	s11,80061a <vprintfmt+0x216>
  80062a:	6aa2                	ld	s5,8(sp)
  80062c:	b539                	j	80043a <vprintfmt+0x36>
  80062e:	3781                	addiw	a5,a5,-32
  800630:	05e00713          	li	a4,94
  800634:	fcf777e3          	bgeu	a4,a5,800602 <vprintfmt+0x1fe>
  800638:	03f00513          	li	a0,63
  80063c:	864e                	mv	a2,s3
  80063e:	85ca                	mv	a1,s2
  800640:	9482                	jalr	s1
  800642:	000ac783          	lbu	a5,0(s5)
  800646:	0a85                	addi	s5,s5,1
  800648:	3dfd                	addiw	s11,s11,-1
  80064a:	0007851b          	sext.w	a0,a5
  80064e:	d7e1                	beqz	a5,800616 <vprintfmt+0x212>
  800650:	fa0d54e3          	bgez	s10,8005f8 <vprintfmt+0x1f4>
  800654:	bfe9                	j	80062e <vprintfmt+0x22a>
  800656:	000aa783          	lw	a5,0(s5)
  80065a:	46e1                	li	a3,24
  80065c:	0aa1                	addi	s5,s5,8
  80065e:	41f7d71b          	sraiw	a4,a5,0x1f
  800662:	8fb9                	xor	a5,a5,a4
  800664:	40e7873b          	subw	a4,a5,a4
  800668:	02e6c663          	blt	a3,a4,800694 <vprintfmt+0x290>
  80066c:	00001797          	auipc	a5,0x1
  800670:	cac78793          	addi	a5,a5,-852 # 801318 <error_string>
  800674:	00371693          	slli	a3,a4,0x3
  800678:	97b6                	add	a5,a5,a3
  80067a:	639c                	ld	a5,0(a5)
  80067c:	cf81                	beqz	a5,800694 <vprintfmt+0x290>
  80067e:	873e                	mv	a4,a5
  800680:	00000697          	auipc	a3,0x0
  800684:	7f868693          	addi	a3,a3,2040 # 800e78 <main+0x1be>
  800688:	864a                	mv	a2,s2
  80068a:	85ce                	mv	a1,s3
  80068c:	8526                	mv	a0,s1
  80068e:	0f2000ef          	jal	800780 <printfmt>
  800692:	b365                	j	80043a <vprintfmt+0x36>
  800694:	00000697          	auipc	a3,0x0
  800698:	7d468693          	addi	a3,a3,2004 # 800e68 <main+0x1ae>
  80069c:	864a                	mv	a2,s2
  80069e:	85ce                	mv	a1,s3
  8006a0:	8526                	mv	a0,s1
  8006a2:	0de000ef          	jal	800780 <printfmt>
  8006a6:	bb51                	j	80043a <vprintfmt+0x36>
  8006a8:	4785                	li	a5,1
  8006aa:	008a8c13          	addi	s8,s5,8
  8006ae:	00b7c363          	blt	a5,a1,8006b4 <vprintfmt+0x2b0>
  8006b2:	cd81                	beqz	a1,8006ca <vprintfmt+0x2c6>
  8006b4:	000ab403          	ld	s0,0(s5)
  8006b8:	02044b63          	bltz	s0,8006ee <vprintfmt+0x2ea>
  8006bc:	86a2                	mv	a3,s0
  8006be:	8ae2                	mv	s5,s8
  8006c0:	4729                	li	a4,10
  8006c2:	b5a5                	j	80052a <vprintfmt+0x126>
  8006c4:	2585                	addiw	a1,a1,1
  8006c6:	8466                	mv	s0,s9
  8006c8:	bb71                	j	800464 <vprintfmt+0x60>
  8006ca:	000aa403          	lw	s0,0(s5)
  8006ce:	b7ed                	j	8006b8 <vprintfmt+0x2b4>
  8006d0:	000ae683          	lwu	a3,0(s5)
  8006d4:	4721                	li	a4,8
  8006d6:	8ab2                	mv	s5,a2
  8006d8:	bd89                	j	80052a <vprintfmt+0x126>
  8006da:	000ae683          	lwu	a3,0(s5)
  8006de:	4729                	li	a4,10
  8006e0:	8ab2                	mv	s5,a2
  8006e2:	b5a1                	j	80052a <vprintfmt+0x126>
  8006e4:	000ae683          	lwu	a3,0(s5)
  8006e8:	4741                	li	a4,16
  8006ea:	8ab2                	mv	s5,a2
  8006ec:	bd3d                	j	80052a <vprintfmt+0x126>
  8006ee:	864e                	mv	a2,s3
  8006f0:	85ca                	mv	a1,s2
  8006f2:	02d00513          	li	a0,45
  8006f6:	e042                	sd	a6,0(sp)
  8006f8:	9482                	jalr	s1
  8006fa:	6802                	ld	a6,0(sp)
  8006fc:	408006b3          	neg	a3,s0
  800700:	8ae2                	mv	s5,s8
  800702:	4729                	li	a4,10
  800704:	b51d                	j	80052a <vprintfmt+0x126>
  800706:	eba1                	bnez	a5,800756 <vprintfmt+0x352>
  800708:	02800793          	li	a5,40
  80070c:	853e                	mv	a0,a5
  80070e:	00000a97          	auipc	s5,0x0
  800712:	753a8a93          	addi	s5,s5,1875 # 800e61 <main+0x1a7>
  800716:	547d                	li	s0,-1
  800718:	bdf1                	j	8005f4 <vprintfmt+0x1f0>
  80071a:	853a                	mv	a0,a4
  80071c:	85ea                	mv	a1,s10
  80071e:	e03a                	sd	a4,0(sp)
  800720:	0cc000ef          	jal	8007ec <strnlen>
  800724:	40ad8dbb          	subw	s11,s11,a0
  800728:	6702                	ld	a4,0(sp)
  80072a:	01b05b63          	blez	s11,800740 <vprintfmt+0x33c>
  80072e:	864e                	mv	a2,s3
  800730:	85ca                	mv	a1,s2
  800732:	8522                	mv	a0,s0
  800734:	e03a                	sd	a4,0(sp)
  800736:	3dfd                	addiw	s11,s11,-1
  800738:	9482                	jalr	s1
  80073a:	6702                	ld	a4,0(sp)
  80073c:	fe0d99e3          	bnez	s11,80072e <vprintfmt+0x32a>
  800740:	00074783          	lbu	a5,0(a4)
  800744:	0007851b          	sext.w	a0,a5
  800748:	ee0781e3          	beqz	a5,80062a <vprintfmt+0x226>
  80074c:	00170a93          	addi	s5,a4,1
  800750:	b54d                	j	8005f2 <vprintfmt+0x1ee>
  800752:	8466                	mv	s0,s9
  800754:	b36d                	j	8004fe <vprintfmt+0xfa>
  800756:	85ea                	mv	a1,s10
  800758:	00000517          	auipc	a0,0x0
  80075c:	70850513          	addi	a0,a0,1800 # 800e60 <main+0x1a6>
  800760:	08c000ef          	jal	8007ec <strnlen>
  800764:	40ad8dbb          	subw	s11,s11,a0
  800768:	02800793          	li	a5,40
  80076c:	00000717          	auipc	a4,0x0
  800770:	6f470713          	addi	a4,a4,1780 # 800e60 <main+0x1a6>
  800774:	853e                	mv	a0,a5
  800776:	fbb04ce3          	bgtz	s11,80072e <vprintfmt+0x32a>
  80077a:	00170a93          	addi	s5,a4,1
  80077e:	bd95                	j	8005f2 <vprintfmt+0x1ee>

0000000000800780 <printfmt>:
  800780:	7139                	addi	sp,sp,-64
  800782:	02010313          	addi	t1,sp,32
  800786:	f03a                	sd	a4,32(sp)
  800788:	871a                	mv	a4,t1
  80078a:	ec06                	sd	ra,24(sp)
  80078c:	f43e                	sd	a5,40(sp)
  80078e:	f842                	sd	a6,48(sp)
  800790:	fc46                	sd	a7,56(sp)
  800792:	e41a                	sd	t1,8(sp)
  800794:	c71ff0ef          	jal	800404 <vprintfmt>
  800798:	60e2                	ld	ra,24(sp)
  80079a:	6121                	addi	sp,sp,64
  80079c:	8082                	ret

000000000080079e <snprintf>:
  80079e:	711d                	addi	sp,sp,-96
  8007a0:	15fd                	addi	a1,a1,-1
  8007a2:	95aa                	add	a1,a1,a0
  8007a4:	03810313          	addi	t1,sp,56
  8007a8:	f406                	sd	ra,40(sp)
  8007aa:	e82e                	sd	a1,16(sp)
  8007ac:	e42a                	sd	a0,8(sp)
  8007ae:	fc36                	sd	a3,56(sp)
  8007b0:	e0ba                	sd	a4,64(sp)
  8007b2:	e4be                	sd	a5,72(sp)
  8007b4:	e8c2                	sd	a6,80(sp)
  8007b6:	ecc6                	sd	a7,88(sp)
  8007b8:	cc02                	sw	zero,24(sp)
  8007ba:	e01a                	sd	t1,0(sp)
  8007bc:	c515                	beqz	a0,8007e8 <snprintf+0x4a>
  8007be:	02a5e563          	bltu	a1,a0,8007e8 <snprintf+0x4a>
  8007c2:	75dd                	lui	a1,0xffff7
  8007c4:	86b2                	mv	a3,a2
  8007c6:	00000517          	auipc	a0,0x0
  8007ca:	c2450513          	addi	a0,a0,-988 # 8003ea <sprintputch>
  8007ce:	871a                	mv	a4,t1
  8007d0:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <shcwd+0xffffffffff7f29d1>
  8007d4:	0030                	addi	a2,sp,8
  8007d6:	c2fff0ef          	jal	800404 <vprintfmt>
  8007da:	67a2                	ld	a5,8(sp)
  8007dc:	00078023          	sb	zero,0(a5)
  8007e0:	4562                	lw	a0,24(sp)
  8007e2:	70a2                	ld	ra,40(sp)
  8007e4:	6125                	addi	sp,sp,96
  8007e6:	8082                	ret
  8007e8:	5575                	li	a0,-3
  8007ea:	bfe5                	j	8007e2 <snprintf+0x44>

00000000008007ec <strnlen>:
  8007ec:	4781                	li	a5,0
  8007ee:	e589                	bnez	a1,8007f8 <strnlen+0xc>
  8007f0:	a811                	j	800804 <strnlen+0x18>
  8007f2:	0785                	addi	a5,a5,1
  8007f4:	00f58863          	beq	a1,a5,800804 <strnlen+0x18>
  8007f8:	00f50733          	add	a4,a0,a5
  8007fc:	00074703          	lbu	a4,0(a4)
  800800:	fb6d                	bnez	a4,8007f2 <strnlen+0x6>
  800802:	85be                	mv	a1,a5
  800804:	852e                	mv	a0,a1
  800806:	8082                	ret

0000000000800808 <strcpy>:
  800808:	87aa                	mv	a5,a0
  80080a:	0005c703          	lbu	a4,0(a1)
  80080e:	0585                	addi	a1,a1,1
  800810:	0785                	addi	a5,a5,1
  800812:	fee78fa3          	sb	a4,-1(a5)
  800816:	fb75                	bnez	a4,80080a <strcpy+0x2>
  800818:	8082                	ret

000000000080081a <strcmp>:
  80081a:	00054783          	lbu	a5,0(a0)
  80081e:	e791                	bnez	a5,80082a <strcmp+0x10>
  800820:	a01d                	j	800846 <strcmp+0x2c>
  800822:	00054783          	lbu	a5,0(a0)
  800826:	cb99                	beqz	a5,80083c <strcmp+0x22>
  800828:	0585                	addi	a1,a1,1
  80082a:	0005c703          	lbu	a4,0(a1)
  80082e:	0505                	addi	a0,a0,1
  800830:	fef709e3          	beq	a4,a5,800822 <strcmp+0x8>
  800834:	0007851b          	sext.w	a0,a5
  800838:	9d19                	subw	a0,a0,a4
  80083a:	8082                	ret
  80083c:	0015c703          	lbu	a4,1(a1)
  800840:	4501                	li	a0,0
  800842:	9d19                	subw	a0,a0,a4
  800844:	8082                	ret
  800846:	0005c703          	lbu	a4,0(a1)
  80084a:	4501                	li	a0,0
  80084c:	b7f5                	j	800838 <strcmp+0x1e>

000000000080084e <strchr>:
  80084e:	a021                	j	800856 <strchr+0x8>
  800850:	00f58763          	beq	a1,a5,80085e <strchr+0x10>
  800854:	0505                	addi	a0,a0,1
  800856:	00054783          	lbu	a5,0(a0)
  80085a:	fbfd                	bnez	a5,800850 <strchr+0x2>
  80085c:	4501                	li	a0,0
  80085e:	8082                	ret

0000000000800860 <gettoken>:
  800860:	7139                	addi	sp,sp,-64
  800862:	f822                	sd	s0,48(sp)
  800864:	6100                	ld	s0,0(a0)
  800866:	fc06                	sd	ra,56(sp)
  800868:	c815                	beqz	s0,80089c <gettoken+0x3c>
  80086a:	f04a                	sd	s2,32(sp)
  80086c:	ec4e                	sd	s3,24(sp)
  80086e:	f426                	sd	s1,40(sp)
  800870:	892a                	mv	s2,a0
  800872:	89ae                	mv	s3,a1
  800874:	a021                	j	80087c <gettoken+0x1c>
  800876:	0405                	addi	s0,s0,1
  800878:	fe040fa3          	sb	zero,-1(s0)
  80087c:	00044583          	lbu	a1,0(s0)
  800880:	00000517          	auipc	a0,0x0
  800884:	7d850513          	addi	a0,a0,2008 # 801058 <main+0x39e>
  800888:	fc7ff0ef          	jal	80084e <strchr>
  80088c:	84aa                	mv	s1,a0
  80088e:	f565                	bnez	a0,800876 <gettoken+0x16>
  800890:	00044783          	lbu	a5,0(s0)
  800894:	eb89                	bnez	a5,8008a6 <gettoken+0x46>
  800896:	74a2                	ld	s1,40(sp)
  800898:	7902                	ld	s2,32(sp)
  80089a:	69e2                	ld	s3,24(sp)
  80089c:	70e2                	ld	ra,56(sp)
  80089e:	7442                	ld	s0,48(sp)
  8008a0:	4501                	li	a0,0
  8008a2:	6121                	addi	sp,sp,64
  8008a4:	8082                	ret
  8008a6:	0089b023          	sd	s0,0(s3)
  8008aa:	00044583          	lbu	a1,0(s0)
  8008ae:	00000517          	auipc	a0,0x0
  8008b2:	7b250513          	addi	a0,a0,1970 # 801060 <main+0x3a6>
  8008b6:	f99ff0ef          	jal	80084e <strchr>
  8008ba:	00044583          	lbu	a1,0(s0)
  8008be:	c505                	beqz	a0,8008e6 <gettoken+0x86>
  8008c0:	00144783          	lbu	a5,1(s0)
  8008c4:	0005851b          	sext.w	a0,a1
  8008c8:	00040023          	sb	zero,0(s0)
  8008cc:	00140713          	addi	a4,s0,1
  8008d0:	c391                	beqz	a5,8008d4 <gettoken+0x74>
  8008d2:	84ba                	mv	s1,a4
  8008d4:	70e2                	ld	ra,56(sp)
  8008d6:	7442                	ld	s0,48(sp)
  8008d8:	00993023          	sd	s1,0(s2)
  8008dc:	69e2                	ld	s3,24(sp)
  8008de:	74a2                	ld	s1,40(sp)
  8008e0:	7902                	ld	s2,32(sp)
  8008e2:	6121                	addi	sp,sp,64
  8008e4:	8082                	ret
  8008e6:	4701                	li	a4,0
  8008e8:	02200693          	li	a3,34
  8008ec:	c185                	beqz	a1,80090c <gettoken+0xac>
  8008ee:	c31d                	beqz	a4,800914 <gettoken+0xb4>
  8008f0:	00044783          	lbu	a5,0(s0)
  8008f4:	00d79863          	bne	a5,a3,800904 <gettoken+0xa4>
  8008f8:	02000793          	li	a5,32
  8008fc:	00f40023          	sb	a5,0(s0)
  800900:	00174713          	xori	a4,a4,1
  800904:	00144583          	lbu	a1,1(s0)
  800908:	0405                	addi	s0,s0,1
  80090a:	f1f5                	bnez	a1,8008ee <gettoken+0x8e>
  80090c:	4481                	li	s1,0
  80090e:	07700513          	li	a0,119
  800912:	b7c9                	j	8008d4 <gettoken+0x74>
  800914:	00000517          	auipc	a0,0x0
  800918:	75450513          	addi	a0,a0,1876 # 801068 <main+0x3ae>
  80091c:	e43a                	sd	a4,8(sp)
  80091e:	f31ff0ef          	jal	80084e <strchr>
  800922:	6722                	ld	a4,8(sp)
  800924:	02200693          	li	a3,34
  800928:	d561                	beqz	a0,8008f0 <gettoken+0x90>
  80092a:	00044783          	lbu	a5,0(s0)
  80092e:	8722                	mv	a4,s0
  800930:	07700513          	li	a0,119
  800934:	bf71                	j	8008d0 <gettoken+0x70>

0000000000800936 <readline>:
  800936:	715d                	addi	sp,sp,-80
  800938:	e486                	sd	ra,72(sp)
  80093a:	e0a2                	sd	s0,64(sp)
  80093c:	fc26                	sd	s1,56(sp)
  80093e:	f84a                	sd	s2,48(sp)
  800940:	f44e                	sd	s3,40(sp)
  800942:	f052                	sd	s4,32(sp)
  800944:	ec56                	sd	s5,24(sp)
  800946:	c909                	beqz	a0,800958 <readline+0x22>
  800948:	862a                	mv	a2,a0
  80094a:	00000597          	auipc	a1,0x0
  80094e:	52e58593          	addi	a1,a1,1326 # 800e78 <main+0x1be>
  800952:	4505                	li	a0,1
  800954:	851ff0ef          	jal	8001a4 <fprintf>
  800958:	6985                	lui	s3,0x1
  80095a:	19f9                	addi	s3,s3,-2 # ffe <open-0x7ff022>
  80095c:	4401                	li	s0,0
  80095e:	448d                	li	s1,3
  800960:	497d                	li	s2,31
  800962:	4a21                	li	s4,8
  800964:	00002a97          	auipc	s5,0x2
  800968:	7a4a8a93          	addi	s5,s5,1956 # 803108 <buffer.2>
  80096c:	4605                	li	a2,1
  80096e:	00f10593          	addi	a1,sp,15
  800972:	4501                	li	a0,0
  800974:	eb4ff0ef          	jal	800028 <read>
  800978:	04054163          	bltz	a0,8009ba <readline+0x84>
  80097c:	c549                	beqz	a0,800a06 <readline+0xd0>
  80097e:	00f14603          	lbu	a2,15(sp)
  800982:	02960c63          	beq	a2,s1,8009ba <readline+0x84>
  800986:	04c97463          	bgeu	s2,a2,8009ce <readline+0x98>
  80098a:	fe89c1e3          	blt	s3,s0,80096c <readline+0x36>
  80098e:	00000597          	auipc	a1,0x0
  800992:	6ea58593          	addi	a1,a1,1770 # 801078 <main+0x3be>
  800996:	4505                	li	a0,1
  800998:	80dff0ef          	jal	8001a4 <fprintf>
  80099c:	00f14703          	lbu	a4,15(sp)
  8009a0:	008a87b3          	add	a5,s5,s0
  8009a4:	4605                	li	a2,1
  8009a6:	00f10593          	addi	a1,sp,15
  8009aa:	4501                	li	a0,0
  8009ac:	00e78023          	sb	a4,0(a5)
  8009b0:	2405                	addiw	s0,s0,1
  8009b2:	e76ff0ef          	jal	800028 <read>
  8009b6:	fc0553e3          	bgez	a0,80097c <readline+0x46>
  8009ba:	4501                	li	a0,0
  8009bc:	60a6                	ld	ra,72(sp)
  8009be:	6406                	ld	s0,64(sp)
  8009c0:	74e2                	ld	s1,56(sp)
  8009c2:	7942                	ld	s2,48(sp)
  8009c4:	79a2                	ld	s3,40(sp)
  8009c6:	7a02                	ld	s4,32(sp)
  8009c8:	6ae2                	ld	s5,24(sp)
  8009ca:	6161                	addi	sp,sp,80
  8009cc:	8082                	ret
  8009ce:	01461d63          	bne	a2,s4,8009e8 <readline+0xb2>
  8009d2:	f8805de3          	blez	s0,80096c <readline+0x36>
  8009d6:	00000597          	auipc	a1,0x0
  8009da:	6a258593          	addi	a1,a1,1698 # 801078 <main+0x3be>
  8009de:	4505                	li	a0,1
  8009e0:	fc4ff0ef          	jal	8001a4 <fprintf>
  8009e4:	347d                	addiw	s0,s0,-1
  8009e6:	b759                	j	80096c <readline+0x36>
  8009e8:	ff660793          	addi	a5,a2,-10
  8009ec:	2601                	sext.w	a2,a2
  8009ee:	c781                	beqz	a5,8009f6 <readline+0xc0>
  8009f0:	ff360793          	addi	a5,a2,-13
  8009f4:	ffa5                	bnez	a5,80096c <readline+0x36>
  8009f6:	00000597          	auipc	a1,0x0
  8009fa:	68258593          	addi	a1,a1,1666 # 801078 <main+0x3be>
  8009fe:	4505                	li	a0,1
  800a00:	fa4ff0ef          	jal	8001a4 <fprintf>
  800a04:	a019                	j	800a0a <readline+0xd4>
  800a06:	fa805be3          	blez	s0,8009bc <readline+0x86>
  800a0a:	00002517          	auipc	a0,0x2
  800a0e:	6fe50513          	addi	a0,a0,1790 # 803108 <buffer.2>
  800a12:	942a                	add	s0,s0,a0
  800a14:	00040023          	sb	zero,0(s0)
  800a18:	b755                	j	8009bc <readline+0x86>

0000000000800a1a <reopen>:
  800a1a:	7179                	addi	sp,sp,-48
  800a1c:	f406                	sd	ra,40(sp)
  800a1e:	f022                	sd	s0,32(sp)
  800a20:	ec26                	sd	s1,24(sp)
  800a22:	e432                	sd	a2,8(sp)
  800a24:	84ae                	mv	s1,a1
  800a26:	842a                	mv	s0,a0
  800a28:	dfeff0ef          	jal	800026 <close>
  800a2c:	65a2                	ld	a1,8(sp)
  800a2e:	8526                	mv	a0,s1
  800a30:	df0ff0ef          	jal	800020 <open>
  800a34:	87aa                	mv	a5,a0
  800a36:	00a40763          	beq	s0,a0,800a44 <reopen+0x2a>
  800a3a:	fff54713          	not	a4,a0
  800a3e:	01f7571b          	srliw	a4,a4,0x1f
  800a42:	eb19                	bnez	a4,800a58 <reopen+0x3e>
  800a44:	0007851b          	sext.w	a0,a5
  800a48:	00f05363          	blez	a5,800a4e <reopen+0x34>
  800a4c:	4501                	li	a0,0
  800a4e:	70a2                	ld	ra,40(sp)
  800a50:	7402                	ld	s0,32(sp)
  800a52:	64e2                	ld	s1,24(sp)
  800a54:	6145                	addi	sp,sp,48
  800a56:	8082                	ret
  800a58:	e42a                	sd	a0,8(sp)
  800a5a:	8522                	mv	a0,s0
  800a5c:	dcaff0ef          	jal	800026 <close>
  800a60:	6522                	ld	a0,8(sp)
  800a62:	85a2                	mv	a1,s0
  800a64:	dc8ff0ef          	jal	80002c <dup2>
  800a68:	842a                	mv	s0,a0
  800a6a:	6522                	ld	a0,8(sp)
  800a6c:	dbaff0ef          	jal	800026 <close>
  800a70:	87a2                	mv	a5,s0
  800a72:	bfc9                	j	800a44 <reopen+0x2a>

0000000000800a74 <runcmd>:
  800a74:	711d                	addi	sp,sp,-96
  800a76:	e8a2                	sd	s0,80(sp)
  800a78:	e0ca                	sd	s2,64(sp)
  800a7a:	fc4e                	sd	s3,56(sp)
  800a7c:	f852                	sd	s4,48(sp)
  800a7e:	ec86                	sd	ra,88(sp)
  800a80:	e4a6                	sd	s1,72(sp)
  800a82:	e42a                	sd	a0,8(sp)
  800a84:	03e00413          	li	s0,62
  800a88:	07700a13          	li	s4,119
  800a8c:	03b00913          	li	s2,59
  800a90:	03c00993          	li	s3,60
  800a94:	4481                	li	s1,0
  800a96:	082c                	addi	a1,sp,24
  800a98:	0028                	addi	a0,sp,8
  800a9a:	dc7ff0ef          	jal	800860 <gettoken>
  800a9e:	0c850c63          	beq	a0,s0,800b76 <runcmd+0x102>
  800aa2:	04a44163          	blt	s0,a0,800ae4 <runcmd+0x70>
  800aa6:	13250063          	beq	a0,s2,800bc6 <runcmd+0x152>
  800aaa:	09350a63          	beq	a0,s3,800b3e <runcmd+0xca>
  800aae:	e535                	bnez	a0,800b1a <runcmd+0xa6>
  800ab0:	c885                	beqz	s1,800ae0 <runcmd+0x6c>
  800ab2:	00002417          	auipc	s0,0x2
  800ab6:	54e40413          	addi	s0,s0,1358 # 803000 <argv.1>
  800aba:	6008                	ld	a0,0(s0)
  800abc:	00000597          	auipc	a1,0x0
  800ac0:	68c58593          	addi	a1,a1,1676 # 801148 <main+0x48e>
  800ac4:	d57ff0ef          	jal	80081a <strcmp>
  800ac8:	14051263          	bnez	a0,800c0c <runcmd+0x198>
  800acc:	4789                	li	a5,2
  800ace:	04f49e63          	bne	s1,a5,800b2a <runcmd+0xb6>
  800ad2:	640c                	ld	a1,8(s0)
  800ad4:	00003517          	auipc	a0,0x3
  800ad8:	63450513          	addi	a0,a0,1588 # 804108 <shcwd>
  800adc:	d2dff0ef          	jal	800808 <strcpy>
  800ae0:	4781                	li	a5,0
  800ae2:	a0a9                	j	800b2c <runcmd+0xb8>
  800ae4:	0f450c63          	beq	a0,s4,800bdc <runcmd+0x168>
  800ae8:	07c00793          	li	a5,124
  800aec:	02f51763          	bne	a0,a5,800b1a <runcmd+0xa6>
  800af0:	f90ff0ef          	jal	800280 <fork>
  800af4:	87aa                	mv	a5,a0
  800af6:	18051f63          	bnez	a0,800c94 <runcmd+0x220>
  800afa:	d2cff0ef          	jal	800026 <close>
  800afe:	4581                	li	a1,0
  800b00:	4501                	li	a0,0
  800b02:	d2aff0ef          	jal	80002c <dup2>
  800b06:	87aa                	mv	a5,a0
  800b08:	02054263          	bltz	a0,800b2c <runcmd+0xb8>
  800b0c:	4501                	li	a0,0
  800b0e:	d18ff0ef          	jal	800026 <close>
  800b12:	4501                	li	a0,0
  800b14:	d12ff0ef          	jal	800026 <close>
  800b18:	bfb5                	j	800a94 <runcmd+0x20>
  800b1a:	862a                	mv	a2,a0
  800b1c:	00000597          	auipc	a1,0x0
  800b20:	60458593          	addi	a1,a1,1540 # 801120 <main+0x466>
  800b24:	4505                	li	a0,1
  800b26:	e7eff0ef          	jal	8001a4 <fprintf>
  800b2a:	57fd                	li	a5,-1
  800b2c:	60e6                	ld	ra,88(sp)
  800b2e:	6446                	ld	s0,80(sp)
  800b30:	64a6                	ld	s1,72(sp)
  800b32:	6906                	ld	s2,64(sp)
  800b34:	79e2                	ld	s3,56(sp)
  800b36:	7a42                	ld	s4,48(sp)
  800b38:	853e                	mv	a0,a5
  800b3a:	6125                	addi	sp,sp,96
  800b3c:	8082                	ret
  800b3e:	082c                	addi	a1,sp,24
  800b40:	0028                	addi	a0,sp,8
  800b42:	d1fff0ef          	jal	800860 <gettoken>
  800b46:	07700793          	li	a5,119
  800b4a:	10f51d63          	bne	a0,a5,800c64 <runcmd+0x1f0>
  800b4e:	f456                	sd	s5,40(sp)
  800b50:	6ae2                	ld	s5,24(sp)
  800b52:	4501                	li	a0,0
  800b54:	cd2ff0ef          	jal	800026 <close>
  800b58:	8556                	mv	a0,s5
  800b5a:	4581                	li	a1,0
  800b5c:	cc4ff0ef          	jal	800020 <open>
  800b60:	87aa                	mv	a5,a0
  800b62:	08054c63          	bltz	a0,800bfa <runcmd+0x186>
  800b66:	ed41                	bnez	a0,800bfe <runcmd+0x18a>
  800b68:	082c                	addi	a1,sp,24
  800b6a:	0028                	addi	a0,sp,8
  800b6c:	7aa2                	ld	s5,40(sp)
  800b6e:	cf3ff0ef          	jal	800860 <gettoken>
  800b72:	f28518e3          	bne	a0,s0,800aa2 <runcmd+0x2e>
  800b76:	082c                	addi	a1,sp,24
  800b78:	0028                	addi	a0,sp,8
  800b7a:	ce7ff0ef          	jal	800860 <gettoken>
  800b7e:	07700793          	li	a5,119
  800b82:	0ef51963          	bne	a0,a5,800c74 <runcmd+0x200>
  800b86:	f456                	sd	s5,40(sp)
  800b88:	6ae2                	ld	s5,24(sp)
  800b8a:	4505                	li	a0,1
  800b8c:	c9aff0ef          	jal	800026 <close>
  800b90:	8556                	mv	a0,s5
  800b92:	45d9                	li	a1,22
  800b94:	c8cff0ef          	jal	800020 <open>
  800b98:	87aa                	mv	a5,a0
  800b9a:	06054063          	bltz	a0,800bfa <runcmd+0x186>
  800b9e:	4585                	li	a1,1
  800ba0:	fcb504e3          	beq	a0,a1,800b68 <runcmd+0xf4>
  800ba4:	852e                	mv	a0,a1
  800ba6:	e03e                	sd	a5,0(sp)
  800ba8:	c7eff0ef          	jal	800026 <close>
  800bac:	6502                	ld	a0,0(sp)
  800bae:	4585                	li	a1,1
  800bb0:	c7cff0ef          	jal	80002c <dup2>
  800bb4:	8aaa                	mv	s5,a0
  800bb6:	6502                	ld	a0,0(sp)
  800bb8:	c6eff0ef          	jal	800026 <close>
  800bbc:	fa0ad6e3          	bgez	s5,800b68 <runcmd+0xf4>
  800bc0:	87d6                	mv	a5,s5
  800bc2:	7aa2                	ld	s5,40(sp)
  800bc4:	b7a5                	j	800b2c <runcmd+0xb8>
  800bc6:	ebaff0ef          	jal	800280 <fork>
  800bca:	87aa                	mv	a5,a0
  800bcc:	ee0502e3          	beqz	a0,800ab0 <runcmd+0x3c>
  800bd0:	f4054ee3          	bltz	a0,800b2c <runcmd+0xb8>
  800bd4:	4581                	li	a1,0
  800bd6:	eacff0ef          	jal	800282 <waitpid>
  800bda:	bd6d                	j	800a94 <runcmd+0x20>
  800bdc:	02000793          	li	a5,32
  800be0:	0af48263          	beq	s1,a5,800c84 <runcmd+0x210>
  800be4:	6762                	ld	a4,24(sp)
  800be6:	00349693          	slli	a3,s1,0x3
  800bea:	00002797          	auipc	a5,0x2
  800bee:	41678793          	addi	a5,a5,1046 # 803000 <argv.1>
  800bf2:	97b6                	add	a5,a5,a3
  800bf4:	2485                	addiw	s1,s1,1
  800bf6:	e398                	sd	a4,0(a5)
  800bf8:	bd79                	j	800a96 <runcmd+0x22>
  800bfa:	7aa2                	ld	s5,40(sp)
  800bfc:	bf05                	j	800b2c <runcmd+0xb8>
  800bfe:	4501                	li	a0,0
  800c00:	e03e                	sd	a5,0(sp)
  800c02:	c24ff0ef          	jal	800026 <close>
  800c06:	6502                	ld	a0,0(sp)
  800c08:	4581                	li	a1,0
  800c0a:	b75d                	j	800bb0 <runcmd+0x13c>
  800c0c:	6008                	ld	a0,0(s0)
  800c0e:	4581                	li	a1,0
  800c10:	c10ff0ef          	jal	800020 <open>
  800c14:	87aa                	mv	a5,a0
  800c16:	02054263          	bltz	a0,800c3a <runcmd+0x1c6>
  800c1a:	c0cff0ef          	jal	800026 <close>
  800c1e:	00349793          	slli	a5,s1,0x3
  800c22:	97a2                	add	a5,a5,s0
  800c24:	0007b023          	sd	zero,0(a5)
  800c28:	6008                	ld	a0,0(s0)
  800c2a:	00002597          	auipc	a1,0x2
  800c2e:	3d658593          	addi	a1,a1,982 # 803000 <argv.1>
  800c32:	e76ff0ef          	jal	8002a8 <__exec>
  800c36:	87aa                	mv	a5,a0
  800c38:	bdd5                	j	800b2c <runcmd+0xb8>
  800c3a:	5741                	li	a4,-16
  800c3c:	eee518e3          	bne	a0,a4,800b2c <runcmd+0xb8>
  800c40:	6014                	ld	a3,0(s0)
  800c42:	00000617          	auipc	a2,0x0
  800c46:	50e60613          	addi	a2,a2,1294 # 801150 <main+0x496>
  800c4a:	6585                	lui	a1,0x1
  800c4c:	00001517          	auipc	a0,0x1
  800c50:	3b450513          	addi	a0,a0,948 # 802000 <argv0.0>
  800c54:	b4bff0ef          	jal	80079e <snprintf>
  800c58:	00001797          	auipc	a5,0x1
  800c5c:	3a878793          	addi	a5,a5,936 # 802000 <argv0.0>
  800c60:	e01c                	sd	a5,0(s0)
  800c62:	bf75                	j	800c1e <runcmd+0x1aa>
  800c64:	00000597          	auipc	a1,0x0
  800c68:	45c58593          	addi	a1,a1,1116 # 8010c0 <main+0x406>
  800c6c:	4505                	li	a0,1
  800c6e:	d36ff0ef          	jal	8001a4 <fprintf>
  800c72:	bd65                	j	800b2a <runcmd+0xb6>
  800c74:	00000597          	auipc	a1,0x0
  800c78:	47c58593          	addi	a1,a1,1148 # 8010f0 <main+0x436>
  800c7c:	4505                	li	a0,1
  800c7e:	d26ff0ef          	jal	8001a4 <fprintf>
  800c82:	b565                	j	800b2a <runcmd+0xb6>
  800c84:	00000597          	auipc	a1,0x0
  800c88:	41c58593          	addi	a1,a1,1052 # 8010a0 <main+0x3e6>
  800c8c:	4505                	li	a0,1
  800c8e:	d16ff0ef          	jal	8001a4 <fprintf>
  800c92:	bd61                	j	800b2a <runcmd+0xb6>
  800c94:	e8054ce3          	bltz	a0,800b2c <runcmd+0xb8>
  800c98:	4505                	li	a0,1
  800c9a:	b8cff0ef          	jal	800026 <close>
  800c9e:	4585                	li	a1,1
  800ca0:	4501                	li	a0,0
  800ca2:	b8aff0ef          	jal	80002c <dup2>
  800ca6:	87aa                	mv	a5,a0
  800ca8:	e80542e3          	bltz	a0,800b2c <runcmd+0xb8>
  800cac:	4501                	li	a0,0
  800cae:	b78ff0ef          	jal	800026 <close>
  800cb2:	4501                	li	a0,0
  800cb4:	b72ff0ef          	jal	800026 <close>
  800cb8:	bbe5                	j	800ab0 <runcmd+0x3c>

0000000000800cba <main>:
  800cba:	7179                	addi	sp,sp,-48
  800cbc:	f022                	sd	s0,32(sp)
  800cbe:	842a                	mv	s0,a0
  800cc0:	00000517          	auipc	a0,0x0
  800cc4:	49850513          	addi	a0,a0,1176 # 801158 <main+0x49e>
  800cc8:	ec26                	sd	s1,24(sp)
  800cca:	f406                	sd	ra,40(sp)
  800ccc:	84ae                	mv	s1,a1
  800cce:	c8aff0ef          	jal	800158 <cputs>
  800cd2:	4789                	li	a5,2
  800cd4:	04f40c63          	beq	s0,a5,800d2c <main+0x72>
  800cd8:	00000497          	auipc	s1,0x0
  800cdc:	4e048493          	addi	s1,s1,1248 # 8011b8 <main+0x4fe>
  800ce0:	0287d063          	bge	a5,s0,800d00 <main+0x46>
  800ce4:	a059                	j	800d6a <main+0xb0>
  800ce6:	00003797          	auipc	a5,0x3
  800cea:	42078123          	sb	zero,1058(a5) # 804108 <shcwd>
  800cee:	d92ff0ef          	jal	800280 <fork>
  800cf2:	c535                	beqz	a0,800d5e <main+0xa4>
  800cf4:	04054563          	bltz	a0,800d3e <main+0x84>
  800cf8:	006c                	addi	a1,sp,12
  800cfa:	d88ff0ef          	jal	800282 <waitpid>
  800cfe:	cd01                	beqz	a0,800d16 <main+0x5c>
  800d00:	8526                	mv	a0,s1
  800d02:	c35ff0ef          	jal	800936 <readline>
  800d06:	842a                	mv	s0,a0
  800d08:	fd79                	bnez	a0,800ce6 <main+0x2c>
  800d0a:	4501                	li	a0,0
  800d0c:	70a2                	ld	ra,40(sp)
  800d0e:	7402                	ld	s0,32(sp)
  800d10:	64e2                	ld	s1,24(sp)
  800d12:	6145                	addi	sp,sp,48
  800d14:	8082                	ret
  800d16:	46b2                	lw	a3,12(sp)
  800d18:	d6e5                	beqz	a3,800d00 <main+0x46>
  800d1a:	8636                	mv	a2,a3
  800d1c:	00000597          	auipc	a1,0x0
  800d20:	48c58593          	addi	a1,a1,1164 # 8011a8 <main+0x4ee>
  800d24:	4505                	li	a0,1
  800d26:	c7eff0ef          	jal	8001a4 <fprintf>
  800d2a:	bfd9                	j	800d00 <main+0x46>
  800d2c:	648c                	ld	a1,8(s1)
  800d2e:	4601                	li	a2,0
  800d30:	4501                	li	a0,0
  800d32:	ce9ff0ef          	jal	800a1a <reopen>
  800d36:	c62a                	sw	a0,12(sp)
  800d38:	4481                	li	s1,0
  800d3a:	d179                	beqz	a0,800d00 <main+0x46>
  800d3c:	bfc1                	j	800d0c <main+0x52>
  800d3e:	00000697          	auipc	a3,0x0
  800d42:	43268693          	addi	a3,a3,1074 # 801170 <main+0x4b6>
  800d46:	00000617          	auipc	a2,0x0
  800d4a:	43a60613          	addi	a2,a2,1082 # 801180 <main+0x4c6>
  800d4e:	0f200593          	li	a1,242
  800d52:	00000517          	auipc	a0,0x0
  800d56:	44650513          	addi	a0,a0,1094 # 801198 <main+0x4de>
  800d5a:	adaff0ef          	jal	800034 <__panic>
  800d5e:	8522                	mv	a0,s0
  800d60:	d15ff0ef          	jal	800a74 <runcmd>
  800d64:	c62a                	sw	a0,12(sp)
  800d66:	d04ff0ef          	jal	80026a <exit>
  800d6a:	00000597          	auipc	a1,0x0
  800d6e:	31658593          	addi	a1,a1,790 # 801080 <main+0x3c6>
  800d72:	4505                	li	a0,1
  800d74:	c30ff0ef          	jal	8001a4 <fprintf>
  800d78:	557d                	li	a0,-1
  800d7a:	bf49                	j	800d0c <main+0x52>
