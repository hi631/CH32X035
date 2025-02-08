
bin/pd_adapter.elf:     file format elf32-littleriscv


Disassembly of section .init:

00000000 <jump_reset>:
   0:	7b50106f          	j	1fb4 <reset_handler>

Disassembly of section .text:

000000e0 <getlineno>:
      e0:	00054783          	lbu	a5,0(a0)
      e4:	cb91                	beqz	a5,f8 <getlineno+0x18>
      e6:	00154783          	lbu	a5,1(a0)
      ea:	00254503          	lbu	a0,2(a0)
      ee:	0522                	sll	a0,a0,0x8
      f0:	8d5d                	or	a0,a0,a5
      f2:	0542                	sll	a0,a0,0x10
      f4:	8541                	sra	a0,a0,0x10
      f6:	8082                	ret
      f8:	6521                	lui	a0,0x8
      fa:	157d                	add	a0,a0,-1 # 7fff <usbpd_sink.c.eec41fa6+0x5221>
      fc:	8082                	ret

000000fe <getlp>:
      fe:	1141                	add	sp,sp,-16
     100:	c422                	sw	s0,8(sp)
     102:	20000437          	lui	s0,0x20000
     106:	c226                	sw	s1,4(sp)
     108:	c606                	sw	ra,12(sp)
     10a:	c04a                	sw	s2,0(sp)
     10c:	84aa                	mv	s1,a0
     10e:	1f040413          	add	s0,s0,496 # 200001f0 <listbuf>
     112:	00044903          	lbu	s2,0(s0)
     116:	00091963          	bnez	s2,128 <getlp+0x2a>
     11a:	40b2                	lw	ra,12(sp)
     11c:	8522                	mv	a0,s0
     11e:	4422                	lw	s0,8(sp)
     120:	4492                	lw	s1,4(sp)
     122:	4902                	lw	s2,0(sp)
     124:	0141                	add	sp,sp,16
     126:	8082                	ret
     128:	8522                	mv	a0,s0
     12a:	3f5d                	jal	e0 <getlineno>
     12c:	fe9557e3          	bge	a0,s1,11a <getlp+0x1c>
     130:	944a                	add	s0,s0,s2
     132:	b7c5                	j	112 <getlp+0x14>

00000134 <iexp>:
     134:	1101                	add	sp,sp,-32
     136:	cc22                	sw	s0,24(sp)
     138:	ce06                	sw	ra,28(sp)
     13a:	ca26                	sw	s1,20(sp)
     13c:	c84a                	sw	s2,16(sp)
     13e:	c64e                	sw	s3,12(sp)
     140:	249d                	jal	3a6 <iplus>
     142:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
     146:	547d                	li	s0,-1
     148:	e3bd                	bnez	a5,1ae <iexp+0x7a>
     14a:	6909                	lui	s2,0x2
     14c:	842a                	mv	s0,a0
     14e:	4995                	li	s3,5
     150:	04890913          	add	s2,s2,72 # 2048 <reset_handler+0x94>
     154:	8081a703          	lw	a4,-2040(gp) # 20000008 <cip>
     158:	00074783          	lbu	a5,0(a4)
     15c:	17a1                	add	a5,a5,-24
     15e:	0ff7f793          	zext.b	a5,a5
     162:	04f9e663          	bltu	s3,a5,1ae <iexp+0x7a>
     166:	078a                	sll	a5,a5,0x2
     168:	97ca                	add	a5,a5,s2
     16a:	4394                	lw	a3,0(a5)
     16c:	00170793          	add	a5,a4,1
     170:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     174:	8682                	jr	a3
     176:	2c05                	jal	3a6 <iplus>
     178:	8c09                	sub	s0,s0,a0
     17a:	00143413          	seqz	s0,s0
     17e:	bfd9                	j	154 <iexp+0x20>
     180:	241d                	jal	3a6 <iplus>
     182:	8c09                	sub	s0,s0,a0
     184:	00803433          	snez	s0,s0
     188:	b7f1                	j	154 <iexp+0x20>
     18a:	2c31                	jal	3a6 <iplus>
     18c:	00a42433          	slt	s0,s0,a0
     190:	b7d1                	j	154 <iexp+0x20>
     192:	2c11                	jal	3a6 <iplus>
     194:	00852433          	slt	s0,a0,s0
     198:	00144413          	xor	s0,s0,1
     19c:	bf65                	j	154 <iexp+0x20>
     19e:	2421                	jal	3a6 <iplus>
     1a0:	00852433          	slt	s0,a0,s0
     1a4:	bf45                	j	154 <iexp+0x20>
     1a6:	2401                	jal	3a6 <iplus>
     1a8:	00a42433          	slt	s0,s0,a0
     1ac:	b7f5                	j	198 <iexp+0x64>
     1ae:	40f2                	lw	ra,28(sp)
     1b0:	8522                	mv	a0,s0
     1b2:	4462                	lw	s0,24(sp)
     1b4:	44d2                	lw	s1,20(sp)
     1b6:	4942                	lw	s2,16(sp)
     1b8:	49b2                	lw	s3,12(sp)
     1ba:	6105                	add	sp,sp,32
     1bc:	8082                	ret

000001be <getparam>:
     1be:	1141                	add	sp,sp,-16
     1c0:	c422                	sw	s0,8(sp)
     1c2:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
     1c6:	c226                	sw	s1,4(sp)
     1c8:	c606                	sw	ra,12(sp)
     1ca:	0007c683          	lbu	a3,0(a5)
     1ce:	4759                	li	a4,22
     1d0:	00e68b63          	beq	a3,a4,1e6 <getparam+0x28>
     1d4:	47c5                	li	a5,17
     1d6:	80f18623          	sb	a5,-2036(gp) # 2000000c <err>
     1da:	4501                	li	a0,0
     1dc:	40b2                	lw	ra,12(sp)
     1de:	4422                	lw	s0,8(sp)
     1e0:	4492                	lw	s1,4(sp)
     1e2:	0141                	add	sp,sp,16
     1e4:	8082                	ret
     1e6:	0785                	add	a5,a5,1
     1e8:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     1ec:	37a1                	jal	134 <iexp>
     1ee:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
     1f2:	f7e5                	bnez	a5,1da <getparam+0x1c>
     1f4:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
     1f8:	475d                	li	a4,23
     1fa:	0007c683          	lbu	a3,0(a5)
     1fe:	fce69be3          	bne	a3,a4,1d4 <getparam+0x16>
     202:	0785                	add	a5,a5,1
     204:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     208:	bfd1                	j	1dc <getparam+0x1e>

0000020a <ivalue>:
     20a:	8081a603          	lw	a2,-2040(gp) # 20000008 <cip>
     20e:	1141                	add	sp,sp,-16
     210:	c422                	sw	s0,8(sp)
     212:	c606                	sw	ra,12(sp)
     214:	4501                	li	a0,0
     216:	0605                	add	a2,a2,1
     218:	4581                	li	a1,0
     21a:	4405                	li	s0,1
     21c:	48d5                	li	a7,21
     21e:	fff64683          	lbu	a3,-1(a2)
     222:	fff60793          	add	a5,a2,-1
     226:	16b9                	add	a3,a3,-18
     228:	0ff6f693          	zext.b	a3,a3
     22c:	10d8e363          	bltu	a7,a3,332 <ivalue+0x128>
     230:	6809                	lui	a6,0x2
     232:	068a                	sll	a3,a3,0x2
     234:	06080813          	add	a6,a6,96 # 2060 <reset_handler+0xac>
     238:	96c2                	add	a3,a3,a6
     23a:	4294                	lw	a3,0(a3)
     23c:	8682                	jr	a3
     23e:	0027c503          	lbu	a0,2(a5)
     242:	0017c683          	lbu	a3,1(a5)
     246:	078d                	add	a5,a5,3
     248:	0522                	sll	a0,a0,0x8
     24a:	8d55                	or	a0,a0,a3
     24c:	0542                	sll	a0,a0,0x10
     24e:	8541                	sra	a0,a0,0x10
     250:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     254:	02a40533          	mul	a0,s0,a0
     258:	40b2                	lw	ra,12(sp)
     25a:	4422                	lw	s0,8(sp)
     25c:	0141                	add	sp,sp,16
     25e:	0542                	sll	a0,a0,0x10
     260:	8541                	sra	a0,a0,0x10
     262:	8082                	ret
     264:	40800433          	neg	s0,s0
     268:	0442                	sll	s0,s0,0x10
     26a:	8441                	sra	s0,s0,0x10
     26c:	0605                	add	a2,a2,1
     26e:	4585                	li	a1,1
     270:	b77d                	j	21e <ivalue+0x14>
     272:	00278693          	add	a3,a5,2
     276:	80d1a423          	sw	a3,-2040(gp) # 20000008 <cip>
     27a:	0017c683          	lbu	a3,1(a5)
     27e:	9bc18793          	add	a5,gp,-1604 # 200001bc <var>
     282:	0686                	sll	a3,a3,0x1
     284:	97b6                	add	a5,a5,a3
     286:	00079503          	lh	a0,0(a5)
     28a:	b7e9                	j	254 <ivalue+0x4a>
     28c:	c199                	beqz	a1,292 <ivalue+0x88>
     28e:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     292:	3735                	jal	1be <getparam>
     294:	b7c1                	j	254 <ivalue+0x4a>
     296:	0785                	add	a5,a5,1
     298:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     29c:	370d                	jal	1be <getparam>
     29e:	80c1c703          	lbu	a4,-2036(gp) # 2000000c <err>
     2a2:	fb4d                	bnez	a4,254 <ivalue+0x4a>
     2a4:	03f00713          	li	a4,63
     2a8:	00a75663          	bge	a4,a0,2b4 <ivalue+0xaa>
     2ac:	470d                	li	a4,3
     2ae:	80e18623          	sb	a4,-2036(gp) # 2000000c <err>
     2b2:	b74d                	j	254 <ivalue+0x4a>
     2b4:	0506                	sll	a0,a0,0x1
     2b6:	93c18793          	add	a5,gp,-1732 # 2000013c <arr>
     2ba:	953e                	add	a0,a0,a5
     2bc:	00051503          	lh	a0,0(a0)
     2c0:	bf51                	j	254 <ivalue+0x4a>
     2c2:	0785                	add	a5,a5,1
     2c4:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     2c8:	3ddd                	jal	1be <getparam>
     2ca:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
     2ce:	f3d9                	bnez	a5,254 <ivalue+0x4a>
     2d0:	4505                	li	a0,1
     2d2:	b749                	j	254 <ivalue+0x4a>
     2d4:	0785                	add	a5,a5,1
     2d6:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     2da:	35d5                	jal	1be <getparam>
     2dc:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
     2e0:	fbb5                	bnez	a5,254 <ivalue+0x4a>
     2e2:	f60559e3          	bgez	a0,254 <ivalue+0x4a>
     2e6:	40a00533          	neg	a0,a0
     2ea:	0542                	sll	a0,a0,0x10
     2ec:	8541                	sra	a0,a0,0x10
     2ee:	b79d                	j	254 <ivalue+0x4a>
     2f0:	0017c603          	lbu	a2,1(a5)
     2f4:	00178693          	add	a3,a5,1
     2f8:	80d1a423          	sw	a3,-2040(gp) # 20000008 <cip>
     2fc:	46d9                	li	a3,22
     2fe:	00d61763          	bne	a2,a3,30c <ivalue+0x102>
     302:	0027c603          	lbu	a2,2(a5)
     306:	46dd                	li	a3,23
     308:	00d60463          	beq	a2,a3,310 <ivalue+0x106>
     30c:	4745                	li	a4,17
     30e:	b745                	j	2ae <ivalue+0xa4>
     310:	078d                	add	a5,a5,3
     312:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     316:	200007b7          	lui	a5,0x20000
     31a:	1f078793          	add	a5,a5,496 # 200001f0 <listbuf>
     31e:	0007c703          	lbu	a4,0(a5)
     322:	e711                	bnez	a4,32e <ivalue+0x124>
     324:	df018513          	add	a0,gp,-528 # 200005f0 <lbuf>
     328:	8d1d                	sub	a0,a0,a5
     32a:	157d                	add	a0,a0,-1
     32c:	bf7d                	j	2ea <ivalue+0xe0>
     32e:	97ba                	add	a5,a5,a4
     330:	b7fd                	j	31e <ivalue+0x114>
     332:	c199                	beqz	a1,338 <ivalue+0x12e>
     334:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     338:	4751                	li	a4,20
     33a:	bf95                	j	2ae <ivalue+0xa4>

0000033c <imul>:
     33c:	1101                	add	sp,sp,-32
     33e:	c84a                	sw	s2,16(sp)
     340:	ce06                	sw	ra,28(sp)
     342:	cc22                	sw	s0,24(sp)
     344:	ca26                	sw	s1,20(sp)
     346:	c64e                	sw	s3,12(sp)
     348:	c452                	sw	s4,8(sp)
     34a:	35c1                	jal	20a <ivalue>
     34c:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
     350:	e7b1                	bnez	a5,39c <imul+0x60>
     352:	842a                	mv	s0,a0
     354:	49d1                	li	s3,20
     356:	4a55                	li	s4,21
     358:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
     35c:	0007c703          	lbu	a4,0(a5)
     360:	01370d63          	beq	a4,s3,37a <imul+0x3e>
     364:	03470463          	beq	a4,s4,38c <imul+0x50>
     368:	40f2                	lw	ra,28(sp)
     36a:	8522                	mv	a0,s0
     36c:	4462                	lw	s0,24(sp)
     36e:	44d2                	lw	s1,20(sp)
     370:	4942                	lw	s2,16(sp)
     372:	49b2                	lw	s3,12(sp)
     374:	4a22                	lw	s4,8(sp)
     376:	6105                	add	sp,sp,32
     378:	8082                	ret
     37a:	0785                	add	a5,a5,1
     37c:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     380:	3569                	jal	20a <ivalue>
     382:	02a40433          	mul	s0,s0,a0
     386:	0442                	sll	s0,s0,0x10
     388:	8441                	sra	s0,s0,0x10
     38a:	b7f9                	j	358 <imul+0x1c>
     38c:	0785                	add	a5,a5,1
     38e:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     392:	3da5                	jal	20a <ivalue>
     394:	e511                	bnez	a0,3a0 <imul+0x64>
     396:	4785                	li	a5,1
     398:	80f18623          	sb	a5,-2036(gp) # 2000000c <err>
     39c:	547d                	li	s0,-1
     39e:	b7e9                	j	368 <imul+0x2c>
     3a0:	02a44433          	div	s0,s0,a0
     3a4:	b7cd                	j	386 <imul+0x4a>

000003a6 <iplus>:
     3a6:	1101                	add	sp,sp,-32
     3a8:	cc22                	sw	s0,24(sp)
     3aa:	ce06                	sw	ra,28(sp)
     3ac:	ca26                	sw	s1,20(sp)
     3ae:	c84a                	sw	s2,16(sp)
     3b0:	c64e                	sw	s3,12(sp)
     3b2:	3769                	jal	33c <imul>
     3b4:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
     3b8:	547d                	li	s0,-1
     3ba:	eb95                	bnez	a5,3ee <iplus+0x48>
     3bc:	842a                	mv	s0,a0
     3be:	4949                	li	s2,18
     3c0:	49cd                	li	s3,19
     3c2:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
     3c6:	0007c703          	lbu	a4,0(a5)
     3ca:	01270c63          	beq	a4,s2,3e2 <iplus+0x3c>
     3ce:	03371063          	bne	a4,s3,3ee <iplus+0x48>
     3d2:	0785                	add	a5,a5,1
     3d4:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     3d8:	3795                	jal	33c <imul>
     3da:	942a                	add	s0,s0,a0
     3dc:	0442                	sll	s0,s0,0x10
     3de:	8441                	sra	s0,s0,0x10
     3e0:	b7cd                	j	3c2 <iplus+0x1c>
     3e2:	0785                	add	a5,a5,1
     3e4:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     3e8:	3f91                	jal	33c <imul>
     3ea:	8c09                	sub	s0,s0,a0
     3ec:	bfc5                	j	3dc <iplus+0x36>
     3ee:	40f2                	lw	ra,28(sp)
     3f0:	8522                	mv	a0,s0
     3f2:	4462                	lw	s0,24(sp)
     3f4:	44d2                	lw	s1,20(sp)
     3f6:	4942                	lw	s2,16(sp)
     3f8:	49b2                	lw	s3,12(sp)
     3fa:	6105                	add	sp,sp,32
     3fc:	8082                	ret

000003fe <ivar>:
     3fe:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
     402:	1141                	add	sp,sp,-16
     404:	c226                	sw	s1,4(sp)
     406:	c606                	sw	ra,12(sp)
     408:	c422                	sw	s0,8(sp)
     40a:	0017c603          	lbu	a2,1(a5)
     40e:	00178693          	add	a3,a5,1
     412:	80d1a423          	sw	a3,-2040(gp) # 20000008 <cip>
     416:	46ed                	li	a3,27
     418:	0007c403          	lbu	s0,0(a5)
     41c:	00d60a63          	beq	a2,a3,430 <ivar+0x32>
     420:	47c9                	li	a5,18
     422:	80f18623          	sb	a5,-2036(gp) # 2000000c <err>
     426:	40b2                	lw	ra,12(sp)
     428:	4422                	lw	s0,8(sp)
     42a:	4492                	lw	s1,4(sp)
     42c:	0141                	add	sp,sp,16
     42e:	8082                	ret
     430:	0789                	add	a5,a5,2
     432:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     436:	39fd                	jal	134 <iexp>
     438:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
     43c:	f7ed                	bnez	a5,426 <ivar+0x28>
     43e:	0406                	sll	s0,s0,0x1
     440:	9bc18793          	add	a5,gp,-1604 # 200001bc <var>
     444:	97a2                	add	a5,a5,s0
     446:	00a79023          	sh	a0,0(a5)
     44a:	bff1                	j	426 <ivar+0x28>

0000044c <iarray>:
     44c:	1141                	add	sp,sp,-16
     44e:	c226                	sw	s1,4(sp)
     450:	c606                	sw	ra,12(sp)
     452:	c422                	sw	s0,8(sp)
     454:	33ad                	jal	1be <getparam>
     456:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
     45a:	eb89                	bnez	a5,46c <iarray+0x20>
     45c:	03f00793          	li	a5,63
     460:	842a                	mv	s0,a0
     462:	00a7da63          	bge	a5,a0,476 <iarray+0x2a>
     466:	478d                	li	a5,3
     468:	80f18623          	sb	a5,-2036(gp) # 2000000c <err>
     46c:	40b2                	lw	ra,12(sp)
     46e:	4422                	lw	s0,8(sp)
     470:	4492                	lw	s1,4(sp)
     472:	0141                	add	sp,sp,16
     474:	8082                	ret
     476:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
     47a:	46ed                	li	a3,27
     47c:	0007c603          	lbu	a2,0(a5)
     480:	00d60463          	beq	a2,a3,488 <iarray+0x3c>
     484:	47c9                	li	a5,18
     486:	b7cd                	j	468 <iarray+0x1c>
     488:	0785                	add	a5,a5,1
     48a:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
     48e:	315d                	jal	134 <iexp>
     490:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
     494:	ffe1                	bnez	a5,46c <iarray+0x20>
     496:	0406                	sll	s0,s0,0x1
     498:	93c18793          	add	a5,gp,-1732 # 2000013c <arr>
     49c:	97a2                	add	a5,a5,s0
     49e:	00a79023          	sh	a0,0(a5)
     4a2:	b7e9                	j	46c <iarray+0x20>

000004a4 <inew>:
     4a4:	9bc18793          	add	a5,gp,-1604 # 200001bc <var>
     4a8:	03478713          	add	a4,a5,52
     4ac:	00079023          	sh	zero,0(a5)
     4b0:	0789                	add	a5,a5,2
     4b2:	fee79de3          	bne	a5,a4,4ac <inew+0x8>
     4b6:	93c18793          	add	a5,gp,-1732 # 2000013c <arr>
     4ba:	08078713          	add	a4,a5,128
     4be:	00079023          	sh	zero,0(a5)
     4c2:	0789                	add	a5,a5,2
     4c4:	fee79de3          	bne	a5,a4,4be <inew+0x1a>
     4c8:	200007b7          	lui	a5,0x20000
     4cc:	000780a3          	sb	zero,1(a5) # 20000001 <gstki>
     4d0:	200007b7          	lui	a5,0x20000
     4d4:	00078023          	sb	zero,0(a5) # 20000000 <lstki>
     4d8:	200007b7          	lui	a5,0x20000
     4dc:	1f078793          	add	a5,a5,496 # 200001f0 <listbuf>
     4e0:	20000737          	lui	a4,0x20000
     4e4:	00078023          	sb	zero,0(a5)
     4e8:	00f72223          	sw	a5,4(a4) # 20000004 <clp>
     4ec:	8082                	ret

000004ee <DEBUG_write>:
     4ee:	40004737          	lui	a4,0x40004
     4f2:	40075783          	lhu	a5,1024(a4) # 40004400 <_eusrstack+0x1ffff400>
     4f6:	0807f793          	and	a5,a5,128
     4fa:	dfe5                	beqz	a5,4f2 <DEBUG_write+0x4>
     4fc:	40a71223          	sh	a0,1028(a4)
     500:	8082                	ret

00000502 <newline>:
     502:	4535                	li	a0,13
     504:	b7ed                	j	4ee <DEBUG_write>

00000506 <c_puts>:
     506:	1141                	add	sp,sp,-16
     508:	c422                	sw	s0,8(sp)
     50a:	c606                	sw	ra,12(sp)
     50c:	842a                	mv	s0,a0
     50e:	00044503          	lbu	a0,0(s0)
     512:	e509                	bnez	a0,51c <c_puts+0x16>
     514:	40b2                	lw	ra,12(sp)
     516:	4422                	lw	s0,8(sp)
     518:	0141                	add	sp,sp,16
     51a:	8082                	ret
     51c:	0405                	add	s0,s0,1
     51e:	3fc1                	jal	4ee <DEBUG_write>
     520:	b7fd                	j	50e <c_puts+0x8>

00000522 <putnum>:
     522:	1101                	add	sp,sp,-32
     524:	ca26                	sw	s1,20(sp)
     526:	ce06                	sw	ra,28(sp)
     528:	cc22                	sw	s0,24(sp)
     52a:	c84a                	sw	s2,16(sp)
     52c:	c64e                	sw	s3,12(sp)
     52e:	84ae                	mv	s1,a1
     530:	4681                	li	a3,0
     532:	00055763          	bgez	a0,540 <putnum+0x1e>
     536:	40a00533          	neg	a0,a0
     53a:	0542                	sll	a0,a0,0x10
     53c:	8541                	sra	a0,a0,0x10
     53e:	4685                	li	a3,1
     540:	df018793          	add	a5,gp,-528 # 200005f0 <lbuf>
     544:	00078323          	sb	zero,6(a5)
     548:	4419                	li	s0,6
     54a:	df018913          	add	s2,gp,-528 # 200005f0 <lbuf>
     54e:	4629                	li	a2,10
     550:	45a5                	li	a1,9
     552:	02c56733          	rem	a4,a0,a2
     556:	87a2                	mv	a5,s0
     558:	147d                	add	s0,s0,-1
     55a:	0ff47413          	zext.b	s0,s0
     55e:	00890833          	add	a6,s2,s0
     562:	03070713          	add	a4,a4,48
     566:	00e80023          	sb	a4,0(a6)
     56a:	872a                	mv	a4,a0
     56c:	02c54533          	div	a0,a0,a2
     570:	fee5c1e3          	blt	a1,a4,552 <putnum+0x30>
     574:	ca91                	beqz	a3,588 <putnum+0x66>
     576:	17f9                	add	a5,a5,-2
     578:	0ff7f413          	zext.b	s0,a5
     57c:	008907b3          	add	a5,s2,s0
     580:	02d00713          	li	a4,45
     584:	00e78023          	sb	a4,0(a5)
     588:	4999                	li	s3,6
     58a:	408989b3          	sub	s3,s3,s0
     58e:	a039                	j	59c <putnum+0x7a>
     590:	14fd                	add	s1,s1,-1
     592:	02000513          	li	a0,32
     596:	04c2                	sll	s1,s1,0x10
     598:	3f99                	jal	4ee <DEBUG_write>
     59a:	84c1                	sra	s1,s1,0x10
     59c:	fe99cae3          	blt	s3,s1,590 <putnum+0x6e>
     5a0:	00890533          	add	a0,s2,s0
     5a4:	4462                	lw	s0,24(sp)
     5a6:	40f2                	lw	ra,28(sp)
     5a8:	44d2                	lw	s1,20(sp)
     5aa:	4942                	lw	s2,16(sp)
     5ac:	49b2                	lw	s3,12(sp)
     5ae:	6105                	add	sp,sp,32
     5b0:	bf99                	j	506 <c_puts>

000005b2 <getnum>:
     5b2:	7179                	add	sp,sp,-48
     5b4:	d226                	sw	s1,36(sp)
     5b6:	d04a                	sw	s2,32(sp)
     5b8:	400044b7          	lui	s1,0x40004
     5bc:	d422                	sw	s0,40(sp)
     5be:	ce4e                	sw	s3,28(sp)
     5c0:	cc52                	sw	s4,24(sp)
     5c2:	ca56                	sw	s5,20(sp)
     5c4:	c85a                	sw	s6,16(sp)
     5c6:	d606                	sw	ra,44(sp)
     5c8:	c65e                	sw	s7,12(sp)
     5ca:	4401                	li	s0,0
     5cc:	40048493          	add	s1,s1,1024 # 40004400 <_eusrstack+0x1ffff400>
     5d0:	49b5                	li	s3,13
     5d2:	4a21                	li	s4,8
     5d4:	07f00a93          	li	s5,127
     5d8:	df018913          	add	s2,gp,-528 # 200005f0 <lbuf>
     5dc:	4b15                	li	s6,5
     5de:	0004d783          	lhu	a5,0(s1)
     5e2:	0207f793          	and	a5,a5,32
     5e6:	dfe5                	beqz	a5,5de <getnum+0x2c>
     5e8:	0044d503          	lhu	a0,4(s1)
     5ec:	0ff57513          	zext.b	a0,a0
     5f0:	07351363          	bne	a0,s3,656 <getnum+0xa4>
     5f4:	3739                	jal	502 <newline>
     5f6:	df018713          	add	a4,gp,-528 # 200005f0 <lbuf>
     5fa:	943a                	add	s0,s0,a4
     5fc:	00040023          	sb	zero,0(s0)
     600:	00074703          	lbu	a4,0(a4)
     604:	02b00613          	li	a2,43
     608:	df018693          	add	a3,gp,-528 # 200005f0 <lbuf>
     60c:	08c70f63          	beq	a4,a2,6aa <getnum+0xf8>
     610:	02d00793          	li	a5,45
     614:	08f70e63          	beq	a4,a5,6b0 <getnum+0xfe>
     618:	4601                	li	a2,0
     61a:	4781                	li	a5,0
     61c:	4801                	li	a6,0
     61e:	4501                	li	a0,0
     620:	48a9                	li	a7,10
     622:	00f68733          	add	a4,a3,a5
     626:	00074703          	lbu	a4,0(a4)
     62a:	e749                	bnez	a4,6b4 <getnum+0x102>
     62c:	00080563          	beqz	a6,636 <getnum+0x84>
     630:	4709                	li	a4,2
     632:	80e18623          	sb	a4,-2036(gp) # 2000000c <err>
     636:	c609                	beqz	a2,640 <getnum+0x8e>
     638:	40a00533          	neg	a0,a0
     63c:	0542                	sll	a0,a0,0x10
     63e:	8541                	sra	a0,a0,0x10
     640:	50b2                	lw	ra,44(sp)
     642:	5422                	lw	s0,40(sp)
     644:	5492                	lw	s1,36(sp)
     646:	5902                	lw	s2,32(sp)
     648:	49f2                	lw	s3,28(sp)
     64a:	4a62                	lw	s4,24(sp)
     64c:	4ad2                	lw	s5,20(sp)
     64e:	4b42                	lw	s6,16(sp)
     650:	4bb2                	lw	s7,12(sp)
     652:	6145                	add	sp,sp,48
     654:	8082                	ret
     656:	01451e63          	bne	a0,s4,672 <getnum+0xc0>
     65a:	d051                	beqz	s0,5de <getnum+0x2c>
     65c:	4521                	li	a0,8
     65e:	3d41                	jal	4ee <DEBUG_write>
     660:	02000513          	li	a0,32
     664:	3569                	jal	4ee <DEBUG_write>
     666:	147d                	add	s0,s0,-1
     668:	4521                	li	a0,8
     66a:	0ff47413          	zext.b	s0,s0
     66e:	3541                	jal	4ee <DEBUG_write>
     670:	b7bd                	j	5de <getnum+0x2c>
     672:	ff5504e3          	beq	a0,s5,65a <getnum+0xa8>
     676:	e41d                	bnez	s0,6a4 <getnum+0xf2>
     678:	fd550793          	add	a5,a0,-43
     67c:	0fd7f793          	and	a5,a5,253
     680:	cb81                	beqz	a5,690 <getnum+0xde>
     682:	fd050793          	add	a5,a0,-48
     686:	0ff7f793          	zext.b	a5,a5
     68a:	4725                	li	a4,9
     68c:	f4f769e3          	bltu	a4,a5,5de <getnum+0x2c>
     690:	00140b93          	add	s7,s0,1
     694:	0ffbfb93          	zext.b	s7,s7
     698:	944a                	add	s0,s0,s2
     69a:	00a40023          	sb	a0,0(s0)
     69e:	3d81                	jal	4ee <DEBUG_write>
     6a0:	845e                	mv	s0,s7
     6a2:	bf35                	j	5de <getnum+0x2c>
     6a4:	f28b6de3          	bltu	s6,s0,5de <getnum+0x2c>
     6a8:	bfe9                	j	682 <getnum+0xd0>
     6aa:	4601                	li	a2,0
     6ac:	4785                	li	a5,1
     6ae:	b7bd                	j	61c <getnum+0x6a>
     6b0:	4605                	li	a2,1
     6b2:	bfed                	j	6ac <getnum+0xfa>
     6b4:	031505b3          	mul	a1,a0,a7
     6b8:	0785                	add	a5,a5,1
     6ba:	0ff7f793          	zext.b	a5,a5
     6be:	fd058593          	add	a1,a1,-48
     6c2:	972e                	add	a4,a4,a1
     6c4:	0742                	sll	a4,a4,0x10
     6c6:	8741                	sra	a4,a4,0x10
     6c8:	00a75363          	bge	a4,a0,6ce <getnum+0x11c>
     6cc:	4805                	li	a6,1
     6ce:	853a                	mv	a0,a4
     6d0:	bf89                	j	622 <getnum+0x70>

000006d2 <putlist>:
     6d2:	7179                	add	sp,sp,-48
     6d4:	d226                	sw	s1,36(sp)
     6d6:	d04a                	sw	s2,32(sp)
     6d8:	ce4e                	sw	s3,28(sp)
     6da:	6489                	lui	s1,0x2
     6dc:	6909                	lui	s2,0x2
     6de:	6989                	lui	s3,0x2
     6e0:	d422                	sw	s0,40(sp)
     6e2:	d606                	sw	ra,44(sp)
     6e4:	cc52                	sw	s4,24(sp)
     6e6:	ca56                	sw	s5,20(sp)
     6e8:	c85a                	sw	s6,16(sp)
     6ea:	c65e                	sw	s7,12(sp)
     6ec:	842a                	mv	s0,a0
     6ee:	4ac48493          	add	s1,s1,1196 # 24ac <i_nsb>
     6f2:	4d090913          	add	s2,s2,1232 # 24d0 <kwtbl>
     6f6:	4bc98993          	add	s3,s3,1212 # 24bc <i_nsa>
     6fa:	00044783          	lbu	a5,0(s0)
     6fe:	02900713          	li	a4,41
     702:	04e78763          	beq	a5,a4,750 <putlist+0x7e>
     706:	02500713          	li	a4,37
     70a:	06f76863          	bltu	a4,a5,77a <putlist+0xa8>
     70e:	078a                	sll	a5,a5,0x2
     710:	97ca                	add	a5,a5,s2
     712:	4388                	lw	a0,0(a5)
     714:	3bcd                	jal	506 <c_puts>
     716:	00044683          	lbu	a3,0(s0)
     71a:	47cd                	li	a5,19
     71c:	0ff00713          	li	a4,255
     720:	17fd                	add	a5,a5,-1
     722:	0ff7f793          	zext.b	a5,a5
     726:	00e79663          	bne	a5,a4,732 <putlist+0x60>
     72a:	02000513          	li	a0,32
     72e:	33c1                	jal	4ee <DEBUG_write>
     730:	a039                	j	73e <putlist+0x6c>
     732:	01378633          	add	a2,a5,s3
     736:	00064603          	lbu	a2,0(a2)
     73a:	fed613e3          	bne	a2,a3,720 <putlist+0x4e>
     73e:	00044703          	lbu	a4,0(s0)
     742:	47a1                	li	a5,8
     744:	02f71963          	bne	a4,a5,776 <putlist+0xa4>
     748:	00144483          	lbu	s1,1(s0)
     74c:	0409                	add	s0,s0,2
     74e:	ec81                	bnez	s1,766 <putlist+0x94>
     750:	50b2                	lw	ra,44(sp)
     752:	5422                	lw	s0,40(sp)
     754:	5492                	lw	s1,36(sp)
     756:	5902                	lw	s2,32(sp)
     758:	49f2                	lw	s3,28(sp)
     75a:	4a62                	lw	s4,24(sp)
     75c:	4ad2                	lw	s5,20(sp)
     75e:	4b42                	lw	s6,16(sp)
     760:	4bb2                	lw	s7,12(sp)
     762:	6145                	add	sp,sp,48
     764:	8082                	ret
     766:	00044503          	lbu	a0,0(s0)
     76a:	14fd                	add	s1,s1,-1
     76c:	0405                	add	s0,s0,1
     76e:	3341                	jal	4ee <DEBUG_write>
     770:	0ff4f493          	zext.b	s1,s1
     774:	bfe9                	j	74e <putlist+0x7c>
     776:	0405                	add	s0,s0,1
     778:	b749                	j	6fa <putlist+0x28>
     77a:	02600713          	li	a4,38
     77e:	04e79263          	bne	a5,a4,7c2 <putlist+0xf0>
     782:	00244503          	lbu	a0,2(s0)
     786:	00144783          	lbu	a5,1(s0)
     78a:	4581                	li	a1,0
     78c:	0522                	sll	a0,a0,0x8
     78e:	8d5d                	or	a0,a0,a5
     790:	0542                	sll	a0,a0,0x10
     792:	8541                	sra	a0,a0,0x10
     794:	3379                	jal	522 <putnum>
     796:	00344683          	lbu	a3,3(s0)
     79a:	47bd                	li	a5,15
     79c:	0ff00713          	li	a4,255
     7a0:	17fd                	add	a5,a5,-1
     7a2:	0ff7f793          	zext.b	a5,a5
     7a6:	00e79663          	bne	a5,a4,7b2 <putlist+0xe0>
     7aa:	02000513          	li	a0,32
     7ae:	3381                	jal	4ee <DEBUG_write>
     7b0:	a039                	j	7be <putlist+0xec>
     7b2:	00978633          	add	a2,a5,s1
     7b6:	00064603          	lbu	a2,0(a2)
     7ba:	fed613e3          	bne	a2,a3,7a0 <putlist+0xce>
     7be:	040d                	add	s0,s0,3
     7c0:	bf2d                	j	6fa <putlist+0x28>
     7c2:	02700713          	li	a4,39
     7c6:	02e79f63          	bne	a5,a4,804 <putlist+0x132>
     7ca:	00144503          	lbu	a0,1(s0)
     7ce:	04150513          	add	a0,a0,65
     7d2:	0ff57513          	zext.b	a0,a0
     7d6:	3b21                	jal	4ee <DEBUG_write>
     7d8:	00244683          	lbu	a3,2(s0)
     7dc:	47bd                	li	a5,15
     7de:	0ff00713          	li	a4,255
     7e2:	17fd                	add	a5,a5,-1
     7e4:	0ff7f793          	zext.b	a5,a5
     7e8:	00e79663          	bne	a5,a4,7f4 <putlist+0x122>
     7ec:	02000513          	li	a0,32
     7f0:	39fd                	jal	4ee <DEBUG_write>
     7f2:	a039                	j	800 <putlist+0x12e>
     7f4:	00978633          	add	a2,a5,s1
     7f8:	00064603          	lbu	a2,0(a2)
     7fc:	fed613e3          	bne	a2,a3,7e2 <putlist+0x110>
     800:	0409                	add	s0,s0,2
     802:	bde5                	j	6fa <putlist+0x28>
     804:	02800713          	li	a4,40
     808:	06e79263          	bne	a5,a4,86c <putlist+0x19a>
     80c:	00144783          	lbu	a5,1(s0)
     810:	02200713          	li	a4,34
     814:	97a2                	add	a5,a5,s0
     816:	02f41b63          	bne	s0,a5,84c <putlist+0x17a>
     81a:	02200a93          	li	s5,34
     81e:	8556                	mv	a0,s5
     820:	00240b93          	add	s7,s0,2
     824:	31e9                	jal	4ee <DEBUG_write>
     826:	00144403          	lbu	s0,1(s0)
     82a:	8b5e                	mv	s6,s7
     82c:	8a22                	mv	s4,s0
     82e:	020a1763          	bnez	s4,85c <putlist+0x18a>
     832:	8556                	mv	a0,s5
     834:	396d                	jal	4ee <DEBUG_write>
     836:	945e                	add	s0,s0,s7
     838:	00044703          	lbu	a4,0(s0)
     83c:	02700793          	li	a5,39
     840:	eaf71de3          	bne	a4,a5,6fa <putlist+0x28>
     844:	02000513          	li	a0,32
     848:	315d                	jal	4ee <DEBUG_write>
     84a:	bd45                	j	6fa <putlist+0x28>
     84c:	0017c683          	lbu	a3,1(a5)
     850:	17fd                	add	a5,a5,-1
     852:	fce692e3          	bne	a3,a4,816 <putlist+0x144>
     856:	02700a93          	li	s5,39
     85a:	b7d1                	j	81e <putlist+0x14c>
     85c:	000b4503          	lbu	a0,0(s6)
     860:	1a7d                	add	s4,s4,-1
     862:	0b05                	add	s6,s6,1
     864:	3169                	jal	4ee <DEBUG_write>
     866:	0ffa7a13          	zext.b	s4,s4
     86a:	b7d1                	j	82e <putlist+0x15c>
     86c:	4755                	li	a4,21
     86e:	80e18623          	sb	a4,-2036(gp) # 2000000c <err>
     872:	bdf9                	j	750 <putlist+0x7e>

00000874 <error>:
     874:	1141                	add	sp,sp,-16
     876:	c422                	sw	s0,8(sp)
     878:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
     87c:	c606                	sw	ra,12(sp)
     87e:	c226                	sw	s1,4(sp)
     880:	c7a1                	beqz	a5,8c8 <error+0x54>
     882:	8081a703          	lw	a4,-2040(gp) # 20000008 <cip>
     886:	200007b7          	lui	a5,0x20000
     88a:	1f078793          	add	a5,a5,496 # 200001f0 <listbuf>
     88e:	04f76f63          	bltu	a4,a5,8ec <error+0x78>
     892:	df018793          	add	a5,gp,-528 # 200005f0 <lbuf>
     896:	04f77b63          	bgeu	a4,a5,8ec <error+0x78>
     89a:	200007b7          	lui	a5,0x20000
     89e:	0047a483          	lw	s1,4(a5) # 20000004 <clp>
     8a2:	0004c783          	lbu	a5,0(s1)
     8a6:	c3b9                	beqz	a5,8ec <error+0x78>
     8a8:	39a9                	jal	502 <newline>
     8aa:	6509                	lui	a0,0x2
     8ac:	0b850513          	add	a0,a0,184 # 20b8 <reset_handler+0x104>
     8b0:	3999                	jal	506 <c_puts>
     8b2:	8526                	mv	a0,s1
     8b4:	82dff0ef          	jal	e0 <getlineno>
     8b8:	4581                	li	a1,0
     8ba:	31a5                	jal	522 <putnum>
     8bc:	02000513          	li	a0,32
     8c0:	313d                	jal	4ee <DEBUG_write>
     8c2:	00348513          	add	a0,s1,3
     8c6:	3531                	jal	6d2 <putlist>
     8c8:	392d                	jal	502 <newline>
     8ca:	80c1c703          	lbu	a4,-2036(gp) # 2000000c <err>
     8ce:	6789                	lui	a5,0x2
     8d0:	44c78793          	add	a5,a5,1100 # 244c <errmsg>
     8d4:	070a                	sll	a4,a4,0x2
     8d6:	97ba                	add	a5,a5,a4
     8d8:	4388                	lw	a0,0(a5)
     8da:	3135                	jal	506 <c_puts>
     8dc:	311d                	jal	502 <newline>
     8de:	40b2                	lw	ra,12(sp)
     8e0:	80018623          	sb	zero,-2036(gp) # 2000000c <err>
     8e4:	4422                	lw	s0,8(sp)
     8e6:	4492                	lw	s1,4(sp)
     8e8:	0141                	add	sp,sp,16
     8ea:	8082                	ret
     8ec:	3919                	jal	502 <newline>
     8ee:	6509                	lui	a0,0x2
     8f0:	0c050513          	add	a0,a0,192 # 20c0 <reset_handler+0x10c>
     8f4:	3909                	jal	506 <c_puts>
     8f6:	df018513          	add	a0,gp,-528 # 200005f0 <lbuf>
     8fa:	3131                	jal	506 <c_puts>
     8fc:	b7f1                	j	8c8 <error+0x54>

000008fe <DEBUG_itoa>:
     8fe:	4881                	li	a7,0
     900:	0005dc63          	bgez	a1,918 <DEBUG_itoa+0x1a>
     904:	40b005b3          	neg	a1,a1
     908:	05e2                	sll	a1,a1,0x18
     90a:	85e1                	sra	a1,a1,0x18
     90c:	00055663          	bgez	a0,918 <DEBUG_itoa+0x1a>
     910:	40a00533          	neg	a0,a0
     914:	02d00893          	li	a7,45
     918:	02000813          	li	a6,32
     91c:	00065863          	bgez	a2,92c <DEBUG_itoa+0x2e>
     920:	40c00633          	neg	a2,a2
     924:	0662                	sll	a2,a2,0x18
     926:	8661                	sra	a2,a2,0x18
     928:	03000813          	li	a6,48
     92c:	47d1                	li	a5,20
     92e:	4681                	li	a3,0
     930:	4e25                	li	t3,9
     932:	0ac7dc63          	bge	a5,a2,9ea <DEBUG_itoa+0xec>
     936:	8082                	ret
     938:	86be                	mv	a3,a5
     93a:	02b577b3          	remu	a5,a0,a1
     93e:	0ff7f713          	zext.b	a4,a5
     942:	08fe7863          	bgeu	t3,a5,9d2 <DEBUG_itoa+0xd4>
     946:	03770713          	add	a4,a4,55
     94a:	02b55533          	divu	a0,a0,a1
     94e:	02068413          	add	s0,a3,32
     952:	0ff77713          	zext.b	a4,a4
     956:	00240333          	add	t1,s0,sp
     95a:	00168793          	add	a5,a3,1
     95e:	fee30623          	sb	a4,-20(t1)
     962:	0ff7f793          	zext.b	a5,a5
     966:	f969                	bnez	a0,938 <DEBUG_itoa+0x3a>
     968:	02088063          	beqz	a7,988 <DEBUG_itoa+0x8a>
     96c:	03000713          	li	a4,48
     970:	00e80c63          	beq	a6,a4,988 <DEBUG_itoa+0x8a>
     974:	02078793          	add	a5,a5,32
     978:	978a                	add	a5,a5,sp
     97a:	0689                	add	a3,a3,2
     97c:	02d00713          	li	a4,45
     980:	fee78623          	sb	a4,-20(a5)
     984:	0ff6f793          	zext.b	a5,a3
     988:	873e                	mv	a4,a5
     98a:	04c7c763          	blt	a5,a2,9d8 <DEBUG_itoa+0xda>
     98e:	02088063          	beqz	a7,9ae <DEBUG_itoa+0xb0>
     992:	03000693          	li	a3,48
     996:	00d81c63          	bne	a6,a3,9ae <DEBUG_itoa+0xb0>
     99a:	02070713          	add	a4,a4,32
     99e:	0785                	add	a5,a5,1
     9a0:	970a                	add	a4,a4,sp
     9a2:	02d00693          	li	a3,45
     9a6:	0ff7f793          	zext.b	a5,a5
     9aa:	fed70623          	sb	a3,-20(a4)
     9ae:	fff78413          	add	s0,a5,-1
     9b2:	0064                	add	s1,sp,12
     9b4:	0ff47413          	zext.b	s0,s0
     9b8:	9426                	add	s0,s0,s1
     9ba:	00044503          	lbu	a0,0(s0)
     9be:	3e05                	jal	4ee <DEBUG_write>
     9c0:	87a2                	mv	a5,s0
     9c2:	147d                	add	s0,s0,-1
     9c4:	fef49be3          	bne	s1,a5,9ba <DEBUG_itoa+0xbc>
     9c8:	50b2                	lw	ra,44(sp)
     9ca:	5422                	lw	s0,40(sp)
     9cc:	5492                	lw	s1,36(sp)
     9ce:	6145                	add	sp,sp,48
     9d0:	8082                	ret
     9d2:	03070713          	add	a4,a4,48
     9d6:	bf95                	j	94a <DEBUG_itoa+0x4c>
     9d8:	02070713          	add	a4,a4,32
     9dc:	0785                	add	a5,a5,1
     9de:	970a                	add	a4,a4,sp
     9e0:	0ff7f793          	zext.b	a5,a5
     9e4:	ff070623          	sb	a6,-20(a4)
     9e8:	b745                	j	988 <DEBUG_itoa+0x8a>
     9ea:	7179                	add	sp,sp,-48
     9ec:	d606                	sw	ra,44(sp)
     9ee:	d422                	sw	s0,40(sp)
     9f0:	d226                	sw	s1,36(sp)
     9f2:	b7a1                	j	93a <DEBUG_itoa+0x3c>

000009f4 <DLY_ticks>:
     9f4:	e000f7b7          	lui	a5,0xe000f
     9f8:	479c                	lw	a5,8(a5)
     9fa:	e000f737          	lui	a4,0xe000f
     9fe:	953e                	add	a0,a0,a5
     a00:	471c                	lw	a5,8(a4)
     a02:	8f89                	sub	a5,a5,a0
     a04:	fe07cee3          	bltz	a5,a00 <DLY_ticks+0xc>
     a08:	8082                	ret

00000a0a <ADC1_IRQHandler>:
     a0a:	a001                	j	a0a <ADC1_IRQHandler>

00000a0c <PD_reset>:
     a0c:	400277b7          	lui	a5,0x40027
     a10:	0a200713          	li	a4,162
     a14:	00e79623          	sh	a4,12(a5) # 4002700c <_eusrstack+0x2002200c>
     a18:	00e79723          	sh	a4,14(a5)
     a1c:	8c018793          	add	a5,gp,-1856 # 200000c0 <PD_control>
     a20:	000784a3          	sb	zero,9(a5)
     a24:	00078523          	sb	zero,10(a5)
     a28:	00078423          	sb	zero,8(a5)
     a2c:	00078a23          	sb	zero,20(a5)
     a30:	00078aa3          	sb	zero,21(a5)
     a34:	0007a023          	sw	zero,0(a5)
     a38:	0007a223          	sw	zero,4(a5)
     a3c:	82c18713          	add	a4,gp,-2004 # 2000002c <PD_SC_fixed>
     a40:	02078123          	sb	zero,34(a5)
     a44:	c7d8                	sw	a4,12(a5)
     a46:	020781a3          	sb	zero,35(a5)
     a4a:	84018713          	add	a4,gp,-1984 # 20000040 <PD_SC_PPS>
     a4e:	02078223          	sb	zero,36(a5)
     a52:	cb98                	sw	a4,16(a5)
     a54:	4705                	li	a4,1
     a56:	00e78b23          	sb	a4,22(a5)
     a5a:	02078023          	sb	zero,32(a5)
     a5e:	00e78d23          	sb	a4,26(a5)
     a62:	00e78da3          	sb	a4,27(a5)
     a66:	6705                	lui	a4,0x1
     a68:	38870713          	add	a4,a4,904 # 1388 <iexe+0x170>
     a6c:	00e79e23          	sh	a4,28(a5)
     a70:	00e79f23          	sh	a4,30(a5)
     a74:	8082                	ret

00000a76 <PD_sendData>:
     a76:	400277b7          	lui	a5,0x40027
     a7a:	0007d703          	lhu	a4,0(a5) # 40027000 <_eusrstack+0x20022000>
     a7e:	8b11                	and	a4,a4,4
     a80:	cb15                	beqz	a4,ab4 <PD_sendData+0x3e>
     a82:	00e7d703          	lhu	a4,14(a5)
     a86:	01076713          	or	a4,a4,16
     a8a:	00e79723          	sh	a4,14(a5)
     a8e:	400277b7          	lui	a5,0x40027
     a92:	04f00713          	li	a4,79
     a96:	00e79123          	sh	a4,2(a5) # 40027002 <_eusrstack+0x20022002>
     a9a:	000782a3          	sb	zero,5(a5)
     a9e:	00a79323          	sh	a0,6(a5)
     aa2:	000784a3          	sb	zero,9(a5)
     aa6:	0047c703          	lbu	a4,4(a5)
     aaa:	00376713          	or	a4,a4,3
     aae:	00e78223          	sb	a4,4(a5)
     ab2:	8082                	ret
     ab4:	00c7d703          	lhu	a4,12(a5)
     ab8:	01076713          	or	a4,a4,16
     abc:	00e79623          	sh	a4,12(a5)
     ac0:	b7f9                	j	a8e <PD_sendData+0x18>

00000ac2 <PD_negotiate>:
     ac2:	7179                	add	sp,sp,-48
     ac4:	d422                	sw	s0,40(sp)
     ac6:	d226                	sw	s1,36(sp)
     ac8:	d04a                	sw	s2,32(sp)
     aca:	ce4e                	sw	s3,28(sp)
     acc:	cc52                	sw	s4,24(sp)
     ace:	ca56                	sw	s5,20(sp)
     ad0:	c85a                	sw	s6,16(sp)
     ad2:	c65e                	sw	s7,12(sp)
     ad4:	8c018793          	add	a5,gp,-1856 # 200000c0 <PD_control>
     ad8:	d606                	sw	ra,44(sp)
     ada:	c462                	sw	s8,8(sp)
     adc:	c266                	sw	s9,4(sp)
     ade:	00079f23          	sh	zero,30(a5)
     ae2:	6909                	lui	s2,0x2
     ae4:	6985                	lui	s3,0x1
     ae6:	6aa1                	lui	s5,0x8
     ae8:	02078023          	sb	zero,32(a5)
     aec:	0ff00493          	li	s1,255
     af0:	8c018413          	add	s0,gp,-1856 # 200000c0 <PD_control>
     af4:	0cc90913          	add	s2,s2,204 # 20cc <reset_handler+0x118>
     af8:	e1f98b93          	add	s7,s3,-481 # e1f <PD_negotiate+0x35d>
     afc:	e1fa8a93          	add	s5,s5,-481 # 7e1f <usbpd_sink.c.eec41fa6+0x5041>
     b00:	89c18b13          	add	s6,gp,-1892 # 2000009c <PD_TR_buffer>
     b04:	02044783          	lbu	a5,32(s0)
     b08:	0ff7fc93          	zext.b	s9,a5
     b0c:	e789                	bnez	a5,b16 <PD_negotiate+0x54>
     b0e:	14fd                	add	s1,s1,-1
     b10:	0ff4f493          	zext.b	s1,s1
     b14:	e085                	bnez	s1,b34 <PD_negotiate+0x72>
     b16:	50b2                	lw	ra,44(sp)
     b18:	5422                	lw	s0,40(sp)
     b1a:	5902                	lw	s2,32(sp)
     b1c:	49f2                	lw	s3,28(sp)
     b1e:	4a62                	lw	s4,24(sp)
     b20:	4ad2                	lw	s5,20(sp)
     b22:	4b42                	lw	s6,16(sp)
     b24:	4bb2                	lw	s7,12(sp)
     b26:	4c22                	lw	s8,8(sp)
     b28:	4c92                	lw	s9,4(sp)
     b2a:	00903533          	snez	a0,s1
     b2e:	5492                	lw	s1,36(sp)
     b30:	6145                	add	sp,sp,48
     b32:	8082                	ret
     b34:	0003b537          	lui	a0,0x3b
     b38:	98050513          	add	a0,a0,-1664 # 3a980 <usbpd_sink.c.eec41fa6+0x37ba2>
     b3c:	3d65                	jal	9f4 <DLY_ticks>
     b3e:	400277b7          	lui	a5,0x40027
     b42:	00c7d703          	lhu	a4,12(a5) # 4002700c <_eusrstack+0x2002200c>
     b46:	0742                	sll	a4,a4,0x10
     b48:	8341                	srl	a4,a4,0x10
     b4a:	f1e77713          	and	a4,a4,-226
     b4e:	0742                	sll	a4,a4,0x10
     b50:	8341                	srl	a4,a4,0x10
     b52:	00e79623          	sh	a4,12(a5)
     b56:	00c7d703          	lhu	a4,12(a5)
     b5a:	04076713          	or	a4,a4,64
     b5e:	00e79623          	sh	a4,12(a5)
     b62:	00c7d703          	lhu	a4,12(a5)
     b66:	01071693          	sll	a3,a4,0x10
     b6a:	00e7d703          	lhu	a4,14(a5)
     b6e:	82c1                	srl	a3,a3,0x10
     b70:	0742                	sll	a4,a4,0x10
     b72:	8341                	srl	a4,a4,0x10
     b74:	f1e77713          	and	a4,a4,-226
     b78:	0742                	sll	a4,a4,0x10
     b7a:	8341                	srl	a4,a4,0x10
     b7c:	00e79723          	sh	a4,14(a5)
     b80:	00e7d703          	lhu	a4,14(a5)
     b84:	04076713          	or	a4,a4,64
     b88:	00e79723          	sh	a4,14(a5)
     b8c:	00e7d703          	lhu	a4,14(a5)
     b90:	8b05                	and	a4,a4,1
     b92:	c339                	beqz	a4,bd8 <PD_negotiate+0x116>
     b94:	01845703          	lhu	a4,24(s0)
     b98:	0705                	add	a4,a4,1
     b9a:	0742                	sll	a4,a4,0x10
     b9c:	8341                	srl	a4,a4,0x10
     b9e:	00e41c23          	sh	a4,24(s0)
     ba2:	4014                	lw	a3,0(s0)
     ba4:	4705                	li	a4,1
     ba6:	0ce69563          	bne	a3,a4,c70 <PD_negotiate+0x1ae>
     baa:	000404a3          	sb	zero,9(s0)
     bae:	00a44703          	lbu	a4,10(s0)
     bb2:	0705                	add	a4,a4,1
     bb4:	0ff77713          	zext.b	a4,a4
     bb8:	00e40523          	sb	a4,10(s0)
     bbc:	00a44603          	lbu	a2,10(s0)
     bc0:	4715                	li	a4,5
     bc2:	06c77463          	bgeu	a4,a2,c2a <PD_negotiate+0x168>
     bc6:	00040523          	sb	zero,10(s0)
     bca:	4709                	li	a4,2
     bcc:	c018                	sw	a4,0(s0)
     bce:	0007d703          	lhu	a4,0(a5)
     bd2:	00476713          	or	a4,a4,4
     bd6:	a881                	j	c26 <PD_negotiate+0x164>
     bd8:	0016f713          	and	a4,a3,1
     bdc:	01845683          	lhu	a3,24(s0)
     be0:	4605                	li	a2,1
     be2:	0685                	add	a3,a3,1
     be4:	06c2                	sll	a3,a3,0x10
     be6:	82c1                	srl	a3,a3,0x10
     be8:	00d41c23          	sh	a3,24(s0)
     bec:	4014                	lw	a3,0(s0)
     bee:	08c69563          	bne	a3,a2,c78 <PD_negotiate+0x1b6>
     bf2:	c331                	beqz	a4,c36 <PD_negotiate+0x174>
     bf4:	00040523          	sb	zero,10(s0)
     bf8:	00944703          	lbu	a4,9(s0)
     bfc:	0705                	add	a4,a4,1
     bfe:	0ff77713          	zext.b	a4,a4
     c02:	00e404a3          	sb	a4,9(s0)
     c06:	00944603          	lbu	a2,9(s0)
     c0a:	4715                	li	a4,5
     c0c:	00c77f63          	bgeu	a4,a2,c2a <PD_negotiate+0x168>
     c10:	000404a3          	sb	zero,9(s0)
     c14:	4709                	li	a4,2
     c16:	c018                	sw	a4,0(s0)
     c18:	0007d703          	lhu	a4,0(a5)
     c1c:	0742                	sll	a4,a4,0x10
     c1e:	8341                	srl	a4,a4,0x10
     c20:	9b6d                	and	a4,a4,-5
     c22:	0742                	sll	a4,a4,0x10
     c24:	8341                	srl	a4,a4,0x10
     c26:	00e79023          	sh	a4,0(a5)
     c2a:	401c                	lw	a5,0(s0)
     c2c:	02f6f863          	bgeu	a3,a5,c5c <PD_negotiate+0x19a>
     c30:	00040423          	sb	zero,8(s0)
     c34:	a025                	j	c5c <PD_negotiate+0x19a>
     c36:	000404a3          	sb	zero,9(s0)
     c3a:	00040523          	sb	zero,10(s0)
     c3e:	401c                	lw	a5,0(s0)
     c40:	00f6fe63          	bgeu	a3,a5,c5c <PD_negotiate+0x19a>
     c44:	00844783          	lbu	a5,8(s0)
     c48:	0785                	add	a5,a5,1
     c4a:	0ff7f793          	zext.b	a5,a5
     c4e:	00f40423          	sb	a5,8(s0)
     c52:	00844703          	lbu	a4,8(s0)
     c56:	4795                	li	a5,5
     c58:	02e7e563          	bltu	a5,a4,c82 <PD_negotiate+0x1c0>
     c5c:	00042c03          	lw	s8,0(s0)
     c60:	401c                	lw	a5,0(s0)
     c62:	4725                	li	a4,9
     c64:	06f76e63          	bltu	a4,a5,ce0 <PD_negotiate+0x21e>
     c68:	078a                	sll	a5,a5,0x2
     c6a:	97ca                	add	a5,a5,s2
     c6c:	439c                	lw	a5,0(a5)
     c6e:	8782                	jr	a5
     c70:	401c                	lw	a5,0(s0)
     c72:	faf76fe3          	bltu	a4,a5,c30 <PD_negotiate+0x16e>
     c76:	b7dd                	j	c5c <PD_negotiate+0x19a>
     c78:	401c                	lw	a5,0(s0)
     c7a:	fef671e3          	bgeu	a2,a5,c5c <PD_negotiate+0x19a>
     c7e:	d379                	beqz	a4,c44 <PD_negotiate+0x182>
     c80:	bf45                	j	c30 <PD_negotiate+0x16e>
     c82:	00040423          	sb	zero,8(s0)
     c86:	00042023          	sw	zero,0(s0)
     c8a:	e000e7b7          	lui	a5,0xe000e
     c8e:	00020737          	lui	a4,0x20
     c92:	18e7a223          	sw	a4,388(a5) # e000e184 <_eusrstack+0xc0009184>
     c96:	b7d9                	j	c5c <PD_negotiate+0x19a>
     c98:	e000e7b7          	lui	a5,0xe000e
     c9c:	00020737          	lui	a4,0x20
     ca0:	18e7a223          	sw	a4,388(a5) # e000e184 <_eusrstack+0xc0009184>
     ca4:	33a5                	jal	a0c <PD_reset>
     ca6:	4785                	li	a5,1
     ca8:	c01c                	sw	a5,0(s0)
     caa:	a81d                	j	ce0 <PD_negotiate+0x21e>
     cac:	4058                	lw	a4,4(s0)
     cae:	401c                	lw	a5,0(s0)
     cb0:	02f70863          	beq	a4,a5,ce0 <PD_negotiate+0x21e>
     cb4:	40027737          	lui	a4,0x40027
     cb8:	07700793          	li	a5,119
     cbc:	00f71123          	sh	a5,2(a4) # 40027002 <_eusrstack+0x20022002>
     cc0:	00474783          	lbu	a5,4(a4)
     cc4:	0fc7f793          	and	a5,a5,252
     cc8:	0027e793          	or	a5,a5,2
     ccc:	00f70223          	sb	a5,4(a4)
     cd0:	e000e7b7          	lui	a5,0xe000e
     cd4:	420788a3          	sb	zero,1073(a5) # e000e431 <_eusrstack+0xc0009431>
     cd8:	00020737          	lui	a4,0x20
     cdc:	10e7a223          	sw	a4,260(a5)
     ce0:	01842223          	sw	s8,4(s0)
     ce4:	b505                	j	b04 <PD_negotiate+0x42>
     ce6:	02344783          	lbu	a5,35(s0)
     cea:	dbfd                	beqz	a5,ce0 <PD_negotiate+0x21e>
     cec:	020401a3          	sb	zero,35(s0)
     cf0:	e000e7b7          	lui	a5,0xe000e
     cf4:	00020737          	lui	a4,0x20
     cf8:	00c42883          	lw	a7,12(s0)
     cfc:	4814                	lw	a3,16(s0)
     cfe:	18e7a223          	sw	a4,388(a5) # e000e184 <_eusrstack+0xc0009184>
     d02:	20000637          	lui	a2,0x20000
     d06:	00040aa3          	sb	zero,21(s0)
     d0a:	01060613          	add	a2,a2,16 # 20000010 <PD_SC_buffer>
     d0e:	f0000337          	lui	t1,0xf0000
     d12:	c0000e37          	lui	t3,0xc0000
     d16:	4ea9                	li	t4,10
     d18:	03200513          	li	a0,50
     d1c:	4599                	li	a1,6
     d1e:	06400813          	li	a6,100
     d22:	01444783          	lbu	a5,20(s0)
     d26:	00fcea63          	bltu	s9,a5,d3a <PD_negotiate+0x278>
     d2a:	e000e7b7          	lui	a5,0xe000e
     d2e:	00020737          	lui	a4,0x20
     d32:	10e7a223          	sw	a4,260(a5) # e000e104 <_eusrstack+0xc0009104>
     d36:	4791                	li	a5,4
     d38:	bf85                	j	ca8 <PD_negotiate+0x1e6>
     d3a:	002c9713          	sll	a4,s9,0x2
     d3e:	00c707b3          	add	a5,a4,a2
     d42:	439c                	lw	a5,0(a5)
     d44:	0067ff33          	and	t5,a5,t1
     d48:	07cf1263          	bne	t5,t3,dac <PD_negotiate+0x2ea>
     d4c:	01544703          	lbu	a4,21(s0)
     d50:	0117df13          	srl	t5,a5,0x11
     d54:	0fff7f13          	zext.b	t5,t5
     d58:	02b70733          	mul	a4,a4,a1
     d5c:	030f0f33          	mul	t5,t5,a6
     d60:	9736                	add	a4,a4,a3
     d62:	01e71123          	sh	t5,2(a4) # 20002 <usbpd_sink.c.eec41fa6+0x1d224>
     d66:	01544703          	lbu	a4,21(s0)
     d6a:	0087df13          	srl	t5,a5,0x8
     d6e:	0fff7f13          	zext.b	t5,t5
     d72:	02b70733          	mul	a4,a4,a1
     d76:	07f7f793          	and	a5,a5,127
     d7a:	030f0f33          	mul	t5,t5,a6
     d7e:	9736                	add	a4,a4,a3
     d80:	01e71023          	sh	t5,0(a4)
     d84:	01544703          	lbu	a4,21(s0)
     d88:	02a787b3          	mul	a5,a5,a0
     d8c:	02b70733          	mul	a4,a4,a1
     d90:	9736                	add	a4,a4,a3
     d92:	00f71223          	sh	a5,4(a4)
     d96:	01544783          	lbu	a5,21(s0)
     d9a:	0785                	add	a5,a5,1
     d9c:	0ff7f793          	zext.b	a5,a5
     da0:	00f40aa3          	sb	a5,21(s0)
     da4:	0c85                	add	s9,s9,1
     da6:	0ffcfc93          	zext.b	s9,s9
     daa:	bfa5                	j	d22 <PD_negotiate+0x260>
     dac:	3ff7ff13          	and	t5,a5,1023
     db0:	83a9                	srl	a5,a5,0xa
     db2:	3ff7f793          	and	a5,a5,1023
     db6:	03df0f33          	mul	t5,t5,t4
     dba:	9746                	add	a4,a4,a7
     dbc:	02a787b3          	mul	a5,a5,a0
     dc0:	01e71023          	sh	t5,0(a4)
     dc4:	00f71123          	sh	a5,2(a4)
     dc8:	bff1                	j	da4 <PD_negotiate+0x2e2>
     dca:	4058                	lw	a4,4(s0)
     dcc:	401c                	lw	a5,0(s0)
     dce:	0af70163          	beq	a4,a5,e70 <PD_negotiate+0x3ae>
     dd2:	01a44503          	lbu	a0,26(s0)
     dd6:	02244783          	lbu	a5,34(s0)
     dda:	00298713          	add	a4,s3,2
     dde:	0ff57593          	zext.b	a1,a0
     de2:	8b9d                	and	a5,a5,7
     de4:	07a6                	sll	a5,a5,0x9
     de6:	8fd9                	or	a5,a5,a4
     de8:	01644703          	lbu	a4,22(s0)
     dec:	0157f7b3          	and	a5,a5,s5
     df0:	f3f7f793          	and	a5,a5,-193
     df4:	8b0d                	and	a4,a4,3
     df6:	071a                	sll	a4,a4,0x6
     df8:	00e7e6b3          	or	a3,a5,a4
     dfc:	01444783          	lbu	a5,20(s0)
     e00:	01544703          	lbu	a4,21(s0)
     e04:	01c51613          	sll	a2,a0,0x1c
     e08:	8f99                	sub	a5,a5,a4
     e0a:	06a7db63          	bge	a5,a0,e80 <PD_negotiate+0x3be>
     e0e:	01c45783          	lhu	a5,28(s0)
     e12:	4751                	li	a4,20
     e14:	02e7d7b3          	divu	a5,a5,a4
     e18:	fff98713          	add	a4,s3,-1
     e1c:	8ff9                	and	a5,a5,a4
     e1e:	01544703          	lbu	a4,21(s0)
     e22:	01444503          	lbu	a0,20(s0)
     e26:	07a6                	sll	a5,a5,0x9
     e28:	972e                	add	a4,a4,a1
     e2a:	8f09                	sub	a4,a4,a0
     e2c:	177d                	add	a4,a4,-1
     e2e:	4599                	li	a1,6
     e30:	02b70733          	mul	a4,a4,a1
     e34:	8fd1                	or	a5,a5,a2
     e36:	84018613          	add	a2,gp,-1984 # 20000040 <PD_SC_PPS>
     e3a:	9732                	add	a4,a4,a2
     e3c:	00475703          	lhu	a4,4(a4)
     e40:	03200613          	li	a2,50
     e44:	02c75733          	divu	a4,a4,a2
     e48:	03000637          	lui	a2,0x3000
     e4c:	07f77713          	and	a4,a4,127
     e50:	8f51                	or	a4,a4,a2
     e52:	fd000637          	lui	a2,0xfd000
     e56:	f8060613          	add	a2,a2,-128 # fcffff80 <_eusrstack+0xdcffaf80>
     e5a:	8ff1                	and	a5,a5,a2
     e5c:	8fd9                	or	a5,a5,a4
     e5e:	00fb1123          	sh	a5,2(s6)
     e62:	4519                	li	a0,6
     e64:	83c1                	srl	a5,a5,0x10
     e66:	88d19e23          	sh	a3,-1892(gp) # 2000009c <PD_TR_buffer>
     e6a:	00fb1223          	sh	a5,4(s6)
     e6e:	3121                	jal	a76 <PD_sendData>
     e70:	02444783          	lbu	a5,36(s0)
     e74:	e60786e3          	beqz	a5,ce0 <PD_negotiate+0x21e>
     e78:	02040223          	sb	zero,36(s0)
     e7c:	4795                	li	a5,5
     e7e:	b52d                	j	ca8 <PD_negotiate+0x1e6>
     e80:	fff58793          	add	a5,a1,-1
     e84:	82c18713          	add	a4,gp,-2004 # 2000002c <PD_SC_fixed>
     e88:	078a                	sll	a5,a5,0x2
     e8a:	97ba                	add	a5,a5,a4
     e8c:	0007d703          	lhu	a4,0(a5)
     e90:	47a9                	li	a5,10
     e92:	030005b7          	lui	a1,0x3000
     e96:	02f75733          	divu	a4,a4,a5
     e9a:	3ff77713          	and	a4,a4,1023
     e9e:	00a71793          	sll	a5,a4,0xa
     ea2:	8f4d                	or	a4,a4,a1
     ea4:	8fd9                	or	a5,a5,a4
     ea6:	8fd1                	or	a5,a5,a2
     ea8:	bf5d                	j	e5e <PD_negotiate+0x39c>
     eaa:	02344783          	lbu	a5,35(s0)
     eae:	e20789e3          	beqz	a5,ce0 <PD_negotiate+0x21e>
     eb2:	020401a3          	sb	zero,35(s0)
     eb6:	47a5                	li	a5,9
     eb8:	c01c                	sw	a5,0(s0)
     eba:	00041c23          	sh	zero,24(s0)
     ebe:	b50d                	j	ce0 <PD_negotiate+0x21e>
     ec0:	4785                	li	a5,1
     ec2:	02f40023          	sb	a5,32(s0)
     ec6:	01a44703          	lbu	a4,26(s0)
     eca:	01b44783          	lbu	a5,27(s0)
     ece:	00f71863          	bne	a4,a5,ede <PD_negotiate+0x41c>
     ed2:	01c45703          	lhu	a4,28(s0)
     ed6:	01e45783          	lhu	a5,30(s0)
     eda:	e0f703e3          	beq	a4,a5,ce0 <PD_negotiate+0x21e>
     ede:	01a44783          	lbu	a5,26(s0)
     ee2:	4509                	li	a0,2
     ee4:	0ff7f793          	zext.b	a5,a5
     ee8:	00f40da3          	sb	a5,27(s0)
     eec:	01c45783          	lhu	a5,28(s0)
     ef0:	07c2                	sll	a5,a5,0x10
     ef2:	83c1                	srl	a5,a5,0x10
     ef4:	00f41f23          	sh	a5,30(s0)
     ef8:	02040023          	sb	zero,32(s0)
     efc:	02244783          	lbu	a5,34(s0)
     f00:	01644703          	lbu	a4,22(s0)
     f04:	8b9d                	and	a5,a5,7
     f06:	07a6                	sll	a5,a5,0x9
     f08:	0077e793          	or	a5,a5,7
     f0c:	8b0d                	and	a4,a4,3
     f0e:	071a                	sll	a4,a4,0x6
     f10:	0177f7b3          	and	a5,a5,s7
     f14:	8fd9                	or	a5,a5,a4
     f16:	88f19e23          	sh	a5,-1892(gp) # 2000009c <PD_TR_buffer>
     f1a:	3eb1                	jal	a76 <PD_sendData>
     f1c:	47a9                	li	a5,10
     f1e:	b369                	j	ca8 <PD_negotiate+0x1e6>

00000f20 <USBPD_IRQHandler>:
     f20:	715d                	add	sp,sp,-80
     f22:	d23a                	sw	a4,36(sp)
     f24:	40027737          	lui	a4,0x40027
     f28:	d03e                	sw	a5,32(sp)
     f2a:	00974783          	lbu	a5,9(a4) # 40027009 <_eusrstack+0x20022009>
     f2e:	c686                	sw	ra,76(sp)
     f30:	c496                	sw	t0,72(sp)
     f32:	c29a                	sw	t1,68(sp)
     f34:	c09e                	sw	t2,64(sp)
     f36:	de22                	sw	s0,60(sp)
     f38:	dc26                	sw	s1,56(sp)
     f3a:	da2a                	sw	a0,52(sp)
     f3c:	d82e                	sw	a1,48(sp)
     f3e:	d632                	sw	a2,44(sp)
     f40:	d436                	sw	a3,40(sp)
     f42:	ce42                	sw	a6,28(sp)
     f44:	cc46                	sw	a7,24(sp)
     f46:	ca4a                	sw	s2,20(sp)
     f48:	c872                	sw	t3,16(sp)
     f4a:	c676                	sw	t4,12(sp)
     f4c:	c47a                	sw	t5,8(sp)
     f4e:	c27e                	sw	t6,4(sp)
     f50:	0207f793          	and	a5,a5,32
     f54:	c7a5                	beqz	a5,fbc <USBPD_IRQHandler+0x9c>
     f56:	00974783          	lbu	a5,9(a4)
     f5a:	4685                	li	a3,1
     f5c:	8b8d                	and	a5,a5,3
     f5e:	04d79763          	bne	a5,a3,fac <USBPD_IRQHandler+0x8c>
     f62:	00a75683          	lhu	a3,10(a4)
     f66:	4715                	li	a4,5
     f68:	04d77263          	bgeu	a4,a3,fac <USBPD_IRQHandler+0x8c>
     f6c:	89c1d403          	lhu	s0,-1892(gp) # 2000009c <PD_TR_buffer>
     f70:	8c018493          	add	s1,gp,-1856 # 200000c0 <PD_control>
     f74:	01041713          	sll	a4,s0,0x10
     f78:	8741                	sra	a4,a4,0x10
     f7a:	0e074963          	bltz	a4,106c <USBPD_IRQHandler+0x14c>
     f7e:	669d                	lui	a3,0x7
     f80:	8ee1                	and	a3,a3,s0
     f82:	01f47713          	and	a4,s0,31
     f86:	10069c63          	bnez	a3,109e <USBPD_IRQHandler+0x17e>
     f8a:	468d                	li	a3,3
     f8c:	0cd70e63          	beq	a4,a3,1068 <USBPD_IRQHandler+0x148>
     f90:	4699                	li	a3,6
     f92:	10d70463          	beq	a4,a3,109a <USBPD_IRQHandler+0x17a>
     f96:	0cf71b63          	bne	a4,a5,106c <USBPD_IRQHandler+0x14c>
     f9a:	02e48223          	sb	a4,36(s1)
     f9e:	0224c783          	lbu	a5,34(s1)
     fa2:	0785                	add	a5,a5,1
     fa4:	0ff7f793          	zext.b	a5,a5
     fa8:	02f48123          	sb	a5,34(s1)
     fac:	40027737          	lui	a4,0x40027
     fb0:	00974783          	lbu	a5,9(a4) # 40027009 <_eusrstack+0x20022009>
     fb4:	0207e793          	or	a5,a5,32
     fb8:	00f704a3          	sb	a5,9(a4)
     fbc:	400277b7          	lui	a5,0x40027
     fc0:	0097c703          	lbu	a4,9(a5) # 40027009 <_eusrstack+0x20022009>
     fc4:	0762                	sll	a4,a4,0x18
     fc6:	8761                	sra	a4,a4,0x18
     fc8:	04075b63          	bgez	a4,101e <USBPD_IRQHandler+0xfe>
     fcc:	00c7d703          	lhu	a4,12(a5)
     fd0:	4685                	li	a3,1
     fd2:	0742                	sll	a4,a4,0x10
     fd4:	8341                	srl	a4,a4,0x10
     fd6:	9b3d                	and	a4,a4,-17
     fd8:	0742                	sll	a4,a4,0x10
     fda:	8341                	srl	a4,a4,0x10
     fdc:	00e79623          	sh	a4,12(a5)
     fe0:	00e7d703          	lhu	a4,14(a5)
     fe4:	0742                	sll	a4,a4,0x10
     fe6:	8341                	srl	a4,a4,0x10
     fe8:	9b3d                	and	a4,a4,-17
     fea:	0742                	sll	a4,a4,0x10
     fec:	8341                	srl	a4,a4,0x10
     fee:	00e79723          	sh	a4,14(a5)
     ff2:	07700713          	li	a4,119
     ff6:	00e79123          	sh	a4,2(a5)
     ffa:	0047c703          	lbu	a4,4(a5)
     ffe:	0fc77713          	and	a4,a4,252
    1002:	00276713          	or	a4,a4,2
    1006:	00e78223          	sb	a4,4(a5)
    100a:	8c018713          	add	a4,gp,-1856 # 200000c0 <PD_control>
    100e:	02d701a3          	sb	a3,35(a4)
    1012:	0097c703          	lbu	a4,9(a5)
    1016:	08076713          	or	a4,a4,128
    101a:	00e784a3          	sb	a4,9(a5)
    101e:	400277b7          	lui	a5,0x40027
    1022:	0097c703          	lbu	a4,9(a5) # 40027009 <_eusrstack+0x20022009>
    1026:	04077713          	and	a4,a4,64
    102a:	cb09                	beqz	a4,103c <USBPD_IRQHandler+0x11c>
    102c:	0097c703          	lbu	a4,9(a5)
    1030:	04076713          	or	a4,a4,64
    1034:	00e784a3          	sb	a4,9(a5)
    1038:	9d5ff0ef          	jal	a0c <PD_reset>
    103c:	5472                	lw	s0,60(sp)
    103e:	40b6                	lw	ra,76(sp)
    1040:	42a6                	lw	t0,72(sp)
    1042:	4316                	lw	t1,68(sp)
    1044:	4386                	lw	t2,64(sp)
    1046:	54e2                	lw	s1,56(sp)
    1048:	5552                	lw	a0,52(sp)
    104a:	55c2                	lw	a1,48(sp)
    104c:	5632                	lw	a2,44(sp)
    104e:	56a2                	lw	a3,40(sp)
    1050:	5712                	lw	a4,36(sp)
    1052:	5782                	lw	a5,32(sp)
    1054:	4872                	lw	a6,28(sp)
    1056:	48e2                	lw	a7,24(sp)
    1058:	4952                	lw	s2,20(sp)
    105a:	4e42                	lw	t3,16(sp)
    105c:	4eb2                	lw	t4,12(sp)
    105e:	4f22                	lw	t5,8(sp)
    1060:	4f92                	lw	t6,4(sp)
    1062:	6161                	add	sp,sp,80
    1064:	30200073          	mret
    1068:	479d                	li	a5,7
    106a:	c09c                	sw	a5,0(s1)
    106c:	5a000513          	li	a0,1440
    1070:	985ff0ef          	jal	9f4 <DLY_ticks>
    1074:	020481a3          	sb	zero,35(s1)
    1078:	0164c703          	lbu	a4,22(s1)
    107c:	00945793          	srl	a5,s0,0x9
    1080:	8b9d                	and	a5,a5,7
    1082:	07a6                	sll	a5,a5,0x9
    1084:	8b0d                	and	a4,a4,3
    1086:	071a                	sll	a4,a4,0x6
    1088:	0017e793          	or	a5,a5,1
    108c:	8fd9                	or	a5,a5,a4
    108e:	4509                	li	a0,2
    1090:	88f19e23          	sh	a5,-1892(gp) # 2000009c <PD_TR_buffer>
    1094:	9e3ff0ef          	jal	a76 <PD_sendData>
    1098:	bf11                	j	fac <USBPD_IRQHandler+0x8c>
    109a:	47a1                	li	a5,8
    109c:	b7f9                	j	106a <USBPD_IRQHandler+0x14a>
    109e:	fcf717e3          	bne	a4,a5,106c <USBPD_IRQHandler+0x14c>
    10a2:	478d                	li	a5,3
    10a4:	c09c                	sw	a5,0(s1)
    10a6:	00c45793          	srl	a5,s0,0xc
    10aa:	8b9d                	and	a5,a5,7
    10ac:	00f48a23          	sb	a5,20(s1)
    10b0:	00645793          	srl	a5,s0,0x6
    10b4:	8b8d                	and	a5,a5,3
    10b6:	200006b7          	lui	a3,0x20000
    10ba:	00f48b23          	sb	a5,22(s1)
    10be:	89c18713          	add	a4,gp,-1892 # 2000009c <PD_TR_buffer>
    10c2:	4781                	li	a5,0
    10c4:	01068693          	add	a3,a3,16 # 20000010 <PD_SC_buffer>
    10c8:	4671                	li	a2,28
    10ca:	00274503          	lbu	a0,2(a4)
    10ce:	00d785b3          	add	a1,a5,a3
    10d2:	0785                	add	a5,a5,1
    10d4:	00a58023          	sb	a0,0(a1) # 3000000 <usbpd_sink.c.eec41fa6+0x2ffd222>
    10d8:	0705                	add	a4,a4,1
    10da:	fec798e3          	bne	a5,a2,10ca <USBPD_IRQHandler+0x1aa>
    10de:	b779                	j	106c <USBPD_IRQHandler+0x14c>

000010e0 <DEBUG_printf.constprop.0>:
    10e0:	711d                	add	sp,sp,-96
    10e2:	dc22                	sw	s0,56(sp)
    10e4:	da26                	sw	s1,52(sp)
    10e6:	6409                	lui	s0,0x2
    10e8:	00c4                	add	s1,sp,68
    10ea:	d64e                	sw	s3,44(sp)
    10ec:	d452                	sw	s4,40(sp)
    10ee:	d256                	sw	s5,36(sp)
    10f0:	d05a                	sw	s6,32(sp)
    10f2:	ce5e                	sw	s7,28(sp)
    10f4:	cc62                	sw	s8,24(sp)
    10f6:	de06                	sw	ra,60(sp)
    10f8:	d84a                	sw	s2,48(sp)
    10fa:	c2ae                	sw	a1,68(sp)
    10fc:	c4b2                	sw	a2,72(sp)
    10fe:	c6b6                	sw	a3,76(sp)
    1100:	c8ba                	sw	a4,80(sp)
    1102:	cabe                	sw	a5,84(sp)
    1104:	ccc2                	sw	a6,88(sp)
    1106:	cec6                	sw	a7,92(sp)
    1108:	c626                	sw	s1,12(sp)
    110a:	0f440413          	add	s0,s0,244 # 20f4 <reset_handler+0x140>
    110e:	02500993          	li	s3,37
    1112:	03000a93          	li	s5,48
    1116:	4b25                	li	s6,9
    1118:	4ba9                	li	s7,10
    111a:	07300c13          	li	s8,115
    111e:	06400a13          	li	s4,100
    1122:	00044503          	lbu	a0,0(s0)
    1126:	ed09                	bnez	a0,1140 <DEBUG_printf.constprop.0+0x60>
    1128:	50f2                	lw	ra,60(sp)
    112a:	5462                	lw	s0,56(sp)
    112c:	54d2                	lw	s1,52(sp)
    112e:	5942                	lw	s2,48(sp)
    1130:	59b2                	lw	s3,44(sp)
    1132:	5a22                	lw	s4,40(sp)
    1134:	5a92                	lw	s5,36(sp)
    1136:	5b02                	lw	s6,32(sp)
    1138:	4bf2                	lw	s7,28(sp)
    113a:	4c62                	lw	s8,24(sp)
    113c:	6125                	add	sp,sp,96
    113e:	8082                	ret
    1140:	01350763          	beq	a0,s3,114e <DEBUG_printf.constprop.0+0x6e>
    1144:	0405                	add	s0,s0,1
    1146:	ba8ff0ef          	jal	4ee <DEBUG_write>
    114a:	8926                	mv	s2,s1
    114c:	a8b9                	j	11aa <DEBUG_printf.constprop.0+0xca>
    114e:	00144783          	lbu	a5,1(s0)
    1152:	00240713          	add	a4,s0,2
    1156:	01379a63          	bne	a5,s3,116a <DEBUG_printf.constprop.0+0x8a>
    115a:	02500513          	li	a0,37
    115e:	b90ff0ef          	jal	4ee <DEBUG_write>
    1162:	00244783          	lbu	a5,2(s0)
    1166:	00340713          	add	a4,s0,3
    116a:	4681                	li	a3,0
    116c:	01579663          	bne	a5,s5,1178 <DEBUG_printf.constprop.0+0x98>
    1170:	00074783          	lbu	a5,0(a4)
    1174:	4685                	li	a3,1
    1176:	0705                	add	a4,a4,1
    1178:	843a                	mv	s0,a4
    117a:	4601                	li	a2,0
    117c:	a801                	j	118c <DEBUG_printf.constprop.0+0xac>
    117e:	037607b3          	mul	a5,a2,s7
    1182:	0405                	add	s0,s0,1
    1184:	97ba                	add	a5,a5,a4
    1186:	963e                	add	a2,a2,a5
    1188:	fff44783          	lbu	a5,-1(s0)
    118c:	fd078713          	add	a4,a5,-48
    1190:	feeb77e3          	bgeu	s6,a4,117e <DEBUG_printf.constprop.0+0x9e>
    1194:	c299                	beqz	a3,119a <DEBUG_printf.constprop.0+0xba>
    1196:	40c00633          	neg	a2,a2
    119a:	01879e63          	bne	a5,s8,11b6 <DEBUG_printf.constprop.0+0xd6>
    119e:	00448913          	add	s2,s1,4
    11a2:	4084                	lw	s1,0(s1)
    11a4:	0004c503          	lbu	a0,0(s1)
    11a8:	e119                	bnez	a0,11ae <DEBUG_printf.constprop.0+0xce>
    11aa:	84ca                	mv	s1,s2
    11ac:	bf9d                	j	1122 <DEBUG_printf.constprop.0+0x42>
    11ae:	0485                	add	s1,s1,1
    11b0:	b3eff0ef          	jal	4ee <DEBUG_write>
    11b4:	bfc5                	j	11a4 <DEBUG_printf.constprop.0+0xc4>
    11b6:	05478463          	beq	a5,s4,11fe <DEBUG_printf.constprop.0+0x11e>
    11ba:	00fa4d63          	blt	s4,a5,11d4 <DEBUG_printf.constprop.0+0xf4>
    11be:	06200713          	li	a4,98
    11c2:	04e78763          	beq	a5,a4,1210 <DEBUG_printf.constprop.0+0x130>
    11c6:	06300713          	li	a4,99
    11ca:	02e78363          	beq	a5,a4,11f0 <DEBUG_printf.constprop.0+0x110>
    11ce:	dfa9                	beqz	a5,1128 <DEBUG_printf.constprop.0+0x48>
    11d0:	147d                	add	s0,s0,-1
    11d2:	bfa5                	j	114a <DEBUG_printf.constprop.0+0x6a>
    11d4:	07500713          	li	a4,117
    11d8:	02e78e63          	beq	a5,a4,1214 <DEBUG_printf.constprop.0+0x134>
    11dc:	07800713          	li	a4,120
    11e0:	45c1                	li	a1,16
    11e2:	fee797e3          	bne	a5,a4,11d0 <DEBUG_printf.constprop.0+0xf0>
    11e6:	0662                	sll	a2,a2,0x18
    11e8:	00448913          	add	s2,s1,4
    11ec:	8661                	sra	a2,a2,0x18
    11ee:	a829                	j	1208 <DEBUG_printf.constprop.0+0x128>
    11f0:	0004c503          	lbu	a0,0(s1)
    11f4:	00448913          	add	s2,s1,4
    11f8:	af6ff0ef          	jal	4ee <DEBUG_write>
    11fc:	b77d                	j	11aa <DEBUG_printf.constprop.0+0xca>
    11fe:	0662                	sll	a2,a2,0x18
    1200:	00448913          	add	s2,s1,4
    1204:	8661                	sra	a2,a2,0x18
    1206:	55d9                	li	a1,-10
    1208:	4088                	lw	a0,0(s1)
    120a:	ef4ff0ef          	jal	8fe <DEBUG_itoa>
    120e:	bf71                	j	11aa <DEBUG_printf.constprop.0+0xca>
    1210:	4589                	li	a1,2
    1212:	bfd1                	j	11e6 <DEBUG_printf.constprop.0+0x106>
    1214:	45a9                	li	a1,10
    1216:	bfc1                	j	11e6 <DEBUG_printf.constprop.0+0x106>

00001218 <iexe>:
    1218:	715d                	add	sp,sp,-80
    121a:	004947b7          	lui	a5,0x494
    121e:	e0078793          	add	a5,a5,-512 # 493e00 <usbpd_sink.c.eec41fa6+0x491022>
    1222:	da56                	sw	s5,52(sp)
    1224:	02dc7ab7          	lui	s5,0x2dc7
    1228:	dc52                	sw	s4,56(sp)
    122a:	c43e                	sw	a5,8(sp)
    122c:	6a09                	lui	s4,0x2
    122e:	c00a8793          	add	a5,s5,-1024 # 2dc6c00 <usbpd_sink.c.eec41fa6+0x2dc3e22>
    1232:	c4a2                	sw	s0,72(sp)
    1234:	c686                	sw	ra,76(sp)
    1236:	c2a6                	sw	s1,68(sp)
    1238:	c0ca                	sw	s2,64(sp)
    123a:	de4e                	sw	s3,60(sp)
    123c:	d85a                	sw	s6,48(sp)
    123e:	d65e                	sw	s7,44(sp)
    1240:	d462                	sw	s8,40(sp)
    1242:	d266                	sw	s9,36(sp)
    1244:	d06a                	sw	s10,32(sp)
    1246:	ce6e                	sw	s11,28(sp)
    1248:	100a0a13          	add	s4,s4,256 # 2100 <reset_handler+0x14c>
    124c:	c63e                	sw	a5,12(sp)
    124e:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
    1252:	02900693          	li	a3,41
    1256:	0007c703          	lbu	a4,0(a5)
    125a:	00d71a63          	bne	a4,a3,126e <iexe+0x56>
    125e:	200007b7          	lui	a5,0x20000
    1262:	0047a503          	lw	a0,4(a5) # 20000004 <clp>
    1266:	00054783          	lbu	a5,0(a0)
    126a:	953e                	add	a0,a0,a5
    126c:	a02d                	j	1296 <iexe+0x7e>
    126e:	02700693          	li	a3,39
    1272:	54e6e463          	bltu	a3,a4,17ba <basic.c.99f691d0+0x3a8>
    1276:	070a                	sll	a4,a4,0x2
    1278:	9752                	add	a4,a4,s4
    127a:	4318                	lw	a4,0(a4)
    127c:	8702                	jr	a4
    127e:	200007b7          	lui	a5,0x20000
    1282:	0047a503          	lw	a0,4(a5) # 20000004 <clp>
    1286:	4701                	li	a4,0
    1288:	00054683          	lbu	a3,0(a0)
    128c:	2e069b63          	bnez	a3,1582 <basic.c.99f691d0+0x170>
    1290:	c319                	beqz	a4,1296 <iexe+0x7e>
    1292:	00a7a223          	sw	a0,4(a5)
    1296:	40b6                	lw	ra,76(sp)
    1298:	4426                	lw	s0,72(sp)
    129a:	4496                	lw	s1,68(sp)
    129c:	4906                	lw	s2,64(sp)
    129e:	59f2                	lw	s3,60(sp)
    12a0:	5a62                	lw	s4,56(sp)
    12a2:	5ad2                	lw	s5,52(sp)
    12a4:	5b42                	lw	s6,48(sp)
    12a6:	5bb2                	lw	s7,44(sp)
    12a8:	5c22                	lw	s8,40(sp)
    12aa:	5c92                	lw	s9,36(sp)
    12ac:	5d02                	lw	s10,32(sp)
    12ae:	4df2                	lw	s11,28(sp)
    12b0:	6161                	add	sp,sp,80
    12b2:	8082                	ret
    12b4:	0785                	add	a5,a5,1
    12b6:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    12ba:	e7bfe0ef          	jal	134 <iexp>
    12be:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
    12c2:	892a                	mv	s2,a0
    12c4:	e39d                	bnez	a5,12ea <iexe+0xd2>
    12c6:	e39fe0ef          	jal	fe <getlp>
    12ca:	84aa                	mv	s1,a0
    12cc:	e15fe0ef          	jal	e0 <getlineno>
    12d0:	01250663          	beq	a0,s2,12dc <iexe+0xc4>
    12d4:	4741                	li	a4,16
    12d6:	80e18623          	sb	a4,-2036(gp) # 2000000c <err>
    12da:	a801                	j	12ea <iexe+0xd2>
    12dc:	200007b7          	lui	a5,0x20000
    12e0:	0097a223          	sw	s1,4(a5) # 20000004 <clp>
    12e4:	048d                	add	s1,s1,3
    12e6:	8091a423          	sw	s1,-2040(gp) # 20000008 <cip>
    12ea:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
    12ee:	d3a5                	beqz	a5,124e <iexe+0x36>
    12f0:	4501                	li	a0,0
    12f2:	b755                	j	1296 <iexe+0x7e>
    12f4:	0785                	add	a5,a5,1
    12f6:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    12fa:	e3bfe0ef          	jal	134 <iexp>
    12fe:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
    1302:	892a                	mv	s2,a0
    1304:	f3fd                	bnez	a5,12ea <iexe+0xd2>
    1306:	df9fe0ef          	jal	fe <getlp>
    130a:	84aa                	mv	s1,a0
    130c:	dd5fe0ef          	jal	e0 <getlineno>
    1310:	fd2512e3          	bne	a0,s2,12d4 <iexe+0xbc>
    1314:	200005b7          	lui	a1,0x20000
    1318:	0015c783          	lbu	a5,1(a1) # 20000001 <gstki>
    131c:	470d                	li	a4,3
    131e:	00f77663          	bgeu	a4,a5,132a <iexe+0x112>
    1322:	4799                	li	a5,6
    1324:	80f18623          	sb	a5,-2036(gp) # 2000000c <err>
    1328:	b7c9                	j	12ea <iexe+0xd2>
    132a:	20000637          	lui	a2,0x20000
    132e:	00462503          	lw	a0,4(a2) # 20000004 <clp>
    1332:	92418713          	add	a4,gp,-1756 # 20000124 <gstk>
    1336:	00279693          	sll	a3,a5,0x2
    133a:	96ba                	add	a3,a3,a4
    133c:	c288                	sw	a0,0(a3)
    133e:	00278693          	add	a3,a5,2
    1342:	0785                	add	a5,a5,1
    1344:	0ff7f793          	zext.b	a5,a5
    1348:	078a                	sll	a5,a5,0x2
    134a:	973e                	add	a4,a4,a5
    134c:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
    1350:	00d580a3          	sb	a3,1(a1)
    1354:	00962223          	sw	s1,4(a2)
    1358:	c31c                	sw	a5,0(a4)
    135a:	b769                	j	12e4 <iexe+0xcc>
    135c:	20000637          	lui	a2,0x20000
    1360:	00164783          	lbu	a5,1(a2) # 20000001 <gstki>
    1364:	4705                	li	a4,1
    1366:	00f76463          	bltu	a4,a5,136e <iexe+0x156>
    136a:	471d                	li	a4,7
    136c:	b7ad                	j	12d6 <iexe+0xbe>
    136e:	fff78713          	add	a4,a5,-1
    1372:	0ff77713          	zext.b	a4,a4
    1376:	92418693          	add	a3,gp,-1756 # 20000124 <gstk>
    137a:	070a                	sll	a4,a4,0x2
    137c:	9736                	add	a4,a4,a3
    137e:	4318                	lw	a4,0(a4)
    1380:	17f9                	add	a5,a5,-2
    1382:	0ff7f793          	zext.b	a5,a5
    1386:	00f600a3          	sb	a5,1(a2)
    138a:	078a                	sll	a5,a5,0x2
    138c:	80e1a423          	sw	a4,-2040(gp) # 20000008 <cip>
    1390:	96be                	add	a3,a3,a5
    1392:	4298                	lw	a4,0(a3)
    1394:	200007b7          	lui	a5,0x20000
    1398:	00e7a223          	sw	a4,4(a5) # 20000004 <clp>
    139c:	b7b9                	j	12ea <iexe+0xd2>
    139e:	0017c683          	lbu	a3,1(a5)
    13a2:	00278713          	add	a4,a5,2
    13a6:	80e1a423          	sw	a4,-2040(gp) # 20000008 <cip>
    13aa:	02700713          	li	a4,39
    13ae:	00e68463          	beq	a3,a4,13b6 <iexe+0x19e>
    13b2:	47b1                	li	a5,12
    13b4:	bf85                	j	1324 <iexe+0x10c>
    13b6:	0027c483          	lbu	s1,2(a5)
    13ba:	844ff0ef          	jal	3fe <ivar>
    13be:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
    13c2:	f785                	bnez	a5,12ea <iexe+0xd2>
    13c4:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
    13c8:	4711                	li	a4,4
    13ca:	0007c683          	lbu	a3,0(a5)
    13ce:	02e69f63          	bne	a3,a4,140c <iexe+0x1f4>
    13d2:	0785                	add	a5,a5,1
    13d4:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    13d8:	d5dfe0ef          	jal	134 <iexp>
    13dc:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
    13e0:	4715                	li	a4,5
    13e2:	892a                	mv	s2,a0
    13e4:	0007c683          	lbu	a3,0(a5)
    13e8:	4605                	li	a2,1
    13ea:	02e69463          	bne	a3,a4,1412 <basic.c.99f691d0>
    13ee:	0785                	add	a5,a5,1
    13f0:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    13f4:	d41fe0ef          	jal	134 <iexp>
    13f8:	862a                	mv	a2,a0
    13fa:	00055b63          	bgez	a0,1410 <iexe+0x1f8>
    13fe:	77e1                	lui	a5,0xffff8
    1400:	0785                	add	a5,a5,1 # ffff8001 <_eusrstack+0xdfff3001>
    1402:	8f89                	sub	a5,a5,a0
    1404:	00f95c63          	bge	s2,a5,141c <basic.c.99f691d0+0xa>
    1408:	4789                	li	a5,2
    140a:	bf29                	j	1324 <iexe+0x10c>
    140c:	47b5                	li	a5,13
    140e:	bf19                	j	1324 <iexe+0x10c>
    1410:	c511                	beqz	a0,141c <basic.c.99f691d0+0xa>
    1412:	67a1                	lui	a5,0x8
    1414:	17fd                	add	a5,a5,-1 # 7fff <usbpd_sink.c.eec41fa6+0x5221>
    1416:	8f91                	sub	a5,a5,a2
    1418:	ff27c8e3          	blt	a5,s2,1408 <iexe+0x1f0>
    141c:	200005b7          	lui	a1,0x20000
    1420:	0005c783          	lbu	a5,0(a1) # 20000000 <lstki>
    1424:	4725                	li	a4,9
    1426:	00f77463          	bgeu	a4,a5,142e <basic.c.99f691d0+0x1c>
    142a:	47a1                	li	a5,8
    142c:	bde5                	j	1324 <iexe+0x10c>
    142e:	20000537          	lui	a0,0x20000
    1432:	00452503          	lw	a0,4(a0) # 20000004 <clp>
    1436:	8e818713          	add	a4,gp,-1816 # 200000e8 <lstk>
    143a:	00279693          	sll	a3,a5,0x2
    143e:	96ba                	add	a3,a3,a4
    1440:	c288                	sw	a0,0(a3)
    1442:	00178693          	add	a3,a5,1
    1446:	8081a503          	lw	a0,-2040(gp) # 20000008 <cip>
    144a:	0ff6f693          	zext.b	a3,a3
    144e:	068a                	sll	a3,a3,0x2
    1450:	96ba                	add	a3,a3,a4
    1452:	c288                	sw	a0,0(a3)
    1454:	00278693          	add	a3,a5,2
    1458:	0ff6f693          	zext.b	a3,a3
    145c:	068a                	sll	a3,a3,0x2
    145e:	96ba                	add	a3,a3,a4
    1460:	0126a023          	sw	s2,0(a3)
    1464:	00378693          	add	a3,a5,3
    1468:	0ff6f693          	zext.b	a3,a3
    146c:	068a                	sll	a3,a3,0x2
    146e:	96ba                	add	a3,a3,a4
    1470:	c290                	sw	a2,0(a3)
    1472:	00578693          	add	a3,a5,5
    1476:	0791                	add	a5,a5,4
    1478:	0ff7f793          	zext.b	a5,a5
    147c:	078a                	sll	a5,a5,0x2
    147e:	973e                	add	a4,a4,a5
    1480:	00d58023          	sb	a3,0(a1)
    1484:	c304                	sw	s1,0(a4)
    1486:	b595                	j	12ea <iexe+0xd2>
    1488:	00178713          	add	a4,a5,1
    148c:	20000837          	lui	a6,0x20000
    1490:	80e1a423          	sw	a4,-2040(gp) # 20000008 <cip>
    1494:	00084703          	lbu	a4,0(a6) # 20000000 <lstki>
    1498:	4691                	li	a3,4
    149a:	00e6e663          	bltu	a3,a4,14a6 <basic.c.99f691d0+0x94>
    149e:	47a5                	li	a5,9
    14a0:	80f18623          	sb	a5,-2036(gp) # 2000000c <err>
    14a4:	b599                	j	12ea <iexe+0xd2>
    14a6:	fff70513          	add	a0,a4,-1
    14aa:	8e818593          	add	a1,gp,-1816 # 200000e8 <lstk>
    14ae:	050a                	sll	a0,a0,0x2
    14b0:	95aa                	add	a1,a1,a0
    14b2:	0017c883          	lbu	a7,1(a5)
    14b6:	4188                	lw	a0,0(a1)
    14b8:	00278593          	add	a1,a5,2
    14bc:	80b1a423          	sw	a1,-2040(gp) # 20000008 <cip>
    14c0:	02700593          	li	a1,39
    14c4:	8e818693          	add	a3,gp,-1816 # 200000e8 <lstk>
    14c8:	00b88463          	beq	a7,a1,14d0 <basic.c.99f691d0+0xbe>
    14cc:	47a9                	li	a5,10
    14ce:	bfc9                	j	14a0 <basic.c.99f691d0+0x8e>
    14d0:	00378593          	add	a1,a5,3
    14d4:	80b1a423          	sw	a1,-2040(gp) # 20000008 <cip>
    14d8:	0027c583          	lbu	a1,2(a5)
    14dc:	0542                	sll	a0,a0,0x10
    14de:	8541                	sra	a0,a0,0x10
    14e0:	47ad                	li	a5,11
    14e2:	faa59fe3          	bne	a1,a0,14a0 <basic.c.99f691d0+0x8e>
    14e6:	ffe70793          	add	a5,a4,-2
    14ea:	0586                	sll	a1,a1,0x1
    14ec:	078a                	sll	a5,a5,0x2
    14ee:	9bc18613          	add	a2,gp,-1604 # 200001bc <var>
    14f2:	962e                	add	a2,a2,a1
    14f4:	97b6                	add	a5,a5,a3
    14f6:	0007a883          	lw	a7,0(a5)
    14fa:	00065783          	lhu	a5,0(a2)
    14fe:	01089513          	sll	a0,a7,0x10
    1502:	97c6                	add	a5,a5,a7
    1504:	07c2                	sll	a5,a5,0x10
    1506:	87c1                	sra	a5,a5,0x10
    1508:	00f61023          	sh	a5,0(a2)
    150c:	ffd70613          	add	a2,a4,-3
    1510:	060a                	sll	a2,a2,0x2
    1512:	9636                	add	a2,a2,a3
    1514:	8541                	sra	a0,a0,0x10
    1516:	00061583          	lh	a1,0(a2)
    151a:	ffb70613          	add	a2,a4,-5
    151e:	00055e63          	bgez	a0,153a <basic.c.99f691d0+0x128>
    1522:	00b7cf63          	blt	a5,a1,1540 <basic.c.99f691d0+0x12e>
    1526:	ffc70793          	add	a5,a4,-4
    152a:	078a                	sll	a5,a5,0x2
    152c:	97b6                	add	a5,a5,a3
    152e:	439c                	lw	a5,0(a5)
    1530:	060a                	sll	a2,a2,0x2
    1532:	96b2                	add	a3,a3,a2
    1534:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    1538:	bda9                	j	1392 <iexe+0x17a>
    153a:	d575                	beqz	a0,1526 <basic.c.99f691d0+0x114>
    153c:	fef5d5e3          	bge	a1,a5,1526 <basic.c.99f691d0+0x114>
    1540:	00c80023          	sb	a2,0(a6)
    1544:	b35d                	j	12ea <iexe+0xd2>
    1546:	0785                	add	a5,a5,1
    1548:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    154c:	be9fe0ef          	jal	134 <iexp>
    1550:	80c1c703          	lbu	a4,-2036(gp) # 2000000c <err>
    1554:	c319                	beqz	a4,155a <basic.c.99f691d0+0x148>
    1556:	473d                	li	a4,15
    1558:	bbbd                	j	12d6 <iexe+0xbe>
    155a:	d80518e3          	bnez	a0,12ea <iexe+0xd2>
    155e:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
    1562:	4701                	li	a4,0
    1564:	02900613          	li	a2,41
    1568:	86be                	mv	a3,a5
    156a:	0007c583          	lbu	a1,0(a5)
    156e:	0785                	add	a5,a5,1
    1570:	00c59763          	bne	a1,a2,157e <basic.c.99f691d0+0x16c>
    1574:	d6070be3          	beqz	a4,12ea <iexe+0xd2>
    1578:	80d1a423          	sw	a3,-2040(gp) # 20000008 <cip>
    157c:	b3bd                	j	12ea <iexe+0xd2>
    157e:	4705                	li	a4,1
    1580:	b7e5                	j	1568 <basic.c.99f691d0+0x156>
    1582:	9536                	add	a0,a0,a3
    1584:	4705                	li	a4,1
    1586:	b309                	j	1288 <iexe+0x70>
    1588:	0785                	add	a5,a5,1
    158a:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    158e:	e71fe0ef          	jal	3fe <ivar>
    1592:	bba1                	j	12ea <iexe+0xd2>
    1594:	0785                	add	a5,a5,1
    1596:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    159a:	eb3fe0ef          	jal	44c <iarray>
    159e:	b3b1                	j	12ea <iexe+0xd2>
    15a0:	00178713          	add	a4,a5,1
    15a4:	80e1a423          	sw	a4,-2040(gp) # 20000008 <cip>
    15a8:	0017c703          	lbu	a4,1(a5)
    15ac:	46f9                	li	a3,30
    15ae:	00d70863          	beq	a4,a3,15be <basic.c.99f691d0+0x1ac>
    15b2:	02700693          	li	a3,39
    15b6:	00d71663          	bne	a4,a3,15c2 <basic.c.99f691d0+0x1b0>
    15ba:	0789                	add	a5,a5,2
    15bc:	b7f9                	j	158a <basic.c.99f691d0+0x178>
    15be:	0789                	add	a5,a5,2
    15c0:	bfd9                	j	1596 <basic.c.99f691d0+0x184>
    15c2:	4739                	li	a4,14
    15c4:	bb09                	j	12d6 <iexe+0xbe>
    15c6:	0785                	add	a5,a5,1
    15c8:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    15cc:	b69fe0ef          	jal	134 <iexp>
    15d0:	01051493          	sll	s1,a0,0x10
    15d4:	01000bb7          	lui	s7,0x1000
    15d8:	7cf9                	lui	s9,0xffffe
    15da:	80c1                	srl	s1,s1,0x10
    15dc:	4b15                	li	s6,5
    15de:	400219b7          	lui	s3,0x40021
    15e2:	1bfd                	add	s7,s7,-1 # ffffff <usbpd_sink.c.eec41fa6+0xffd221>
    15e4:	40027c37          	lui	s8,0x40027
    15e8:	89c18913          	add	s2,gp,-1892 # 2000009c <PD_TR_buffer>
    15ec:	0ca1                	add	s9,s9,8 # ffffe008 <_eusrstack+0xdfff9008>
    15ee:	6d89                	lui	s11,0x2
    15f0:	8c018d13          	add	s10,gp,-1856 # 200000c0 <PD_control>
    15f4:	0189a783          	lw	a5,24(s3) # 40021018 <_eusrstack+0x2001c018>
    15f8:	000206b7          	lui	a3,0x20
    15fc:	44000637          	lui	a2,0x44000
    1600:	0117e793          	or	a5,a5,17
    1604:	00f9ac23          	sw	a5,24(s3)
    1608:	0149a783          	lw	a5,20(s3)
    160c:	8fd5                	or	a5,a5,a3
    160e:	400116b7          	lui	a3,0x40011
    1612:	00f9aa23          	sw	a5,20(s3)
    1616:	c0068693          	add	a3,a3,-1024 # 40010c00 <_eusrstack+0x2000bc00>
    161a:	42dc                	lw	a5,4(a3)
    161c:	0177f7b3          	and	a5,a5,s7
    1620:	8fd1                	or	a5,a5,a2
    1622:	c2dc                	sw	a5,4(a3)
    1624:	400106b7          	lui	a3,0x40010
    1628:	4e9c                	lw	a5,24(a3)
    162a:	3007e793          	or	a5,a5,768
    162e:	ce9c                	sw	a5,24(a3)
    1630:	012c1823          	sh	s2,16(s8) # 40027010 <_eusrstack+0x20022010>
    1634:	019c1023          	sh	s9,0(s8)
    1638:	57f1                	li	a5,-4
    163a:	00fc04a3          	sb	a5,9(s8)
    163e:	c84ff0ef          	jal	ac2 <PD_negotiate>
    1642:	c145                	beqz	a0,16e2 <basic.c.99f691d0+0x2d0>
    1644:	015d4783          	lbu	a5,21(s10)
    1648:	cfc9                	beqz	a5,16e2 <basic.c.99f691d0+0x2d0>
    164a:	014d4603          	lbu	a2,20(s10)
    164e:	015d4783          	lbu	a5,21(s10)
    1652:	010d2503          	lw	a0,16(s10)
    1656:	00cd2583          	lw	a1,12(s10)
    165a:	8e1d                	sub	a2,a2,a5
    165c:	0ff67613          	zext.b	a2,a2
    1660:	4781                	li	a5,0
    1662:	4819                	li	a6,6
    1664:	014d4683          	lbu	a3,20(s10)
    1668:	02d7e963          	bltu	a5,a3,169a <basic.c.99f691d0+0x288>
    166c:	4522                	lw	a0,8(sp)
    166e:	400117b7          	lui	a5,0x40011
    1672:	6685                	lui	a3,0x1
    1674:	c0d7a823          	sw	a3,-1008(a5) # 40010c10 <_eusrstack+0x2000bc10>
    1678:	c0078a93          	add	s5,a5,-1024
    167c:	b78ff0ef          	jal	9f4 <DLY_ticks>
    1680:	4532                	lw	a0,12(sp)
    1682:	6685                	lui	a3,0x1
    1684:	00daaa23          	sw	a3,20(s5)
    1688:	1b7d                	add	s6,s6,-1
    168a:	b6aff0ef          	jal	9f4 <DLY_ticks>
    168e:	f60b13e3          	bnez	s6,15f4 <basic.c.99f691d0+0x1e2>
    1692:	47dd                	li	a5,23
    1694:	80f18623          	sb	a5,-2036(gp) # 2000000c <err>
    1698:	b989                	j	12ea <iexe+0xd2>
    169a:	00178693          	add	a3,a5,1
    169e:	02c7f363          	bgeu	a5,a2,16c4 <basic.c.99f691d0+0x2b2>
    16a2:	078a                	sll	a5,a5,0x2
    16a4:	97ae                	add	a5,a5,a1
    16a6:	0027d783          	lhu	a5,2(a5)
    16aa:	02979963          	bne	a5,s1,16dc <basic.c.99f691d0+0x2ca>
    16ae:	0ff6f693          	zext.b	a3,a3
    16b2:	00dd0d23          	sb	a3,26(s10)
    16b6:	009d1e23          	sh	s1,28(s10)
    16ba:	c08ff0ef          	jal	ac2 <PD_negotiate>
    16be:	d55d                	beqz	a0,166c <basic.c.99f691d0+0x25a>
    16c0:	4781                	li	a5,0
    16c2:	bfc9                	j	1694 <basic.c.99f691d0+0x282>
    16c4:	8f91                	sub	a5,a5,a2
    16c6:	030787b3          	mul	a5,a5,a6
    16ca:	97aa                	add	a5,a5,a0
    16cc:	0007d883          	lhu	a7,0(a5)
    16d0:	0114e663          	bltu	s1,a7,16dc <basic.c.99f691d0+0x2ca>
    16d4:	0027d783          	lhu	a5,2(a5)
    16d8:	fc97fbe3          	bgeu	a5,s1,16ae <basic.c.99f691d0+0x29c>
    16dc:	0ff6f793          	zext.b	a5,a3
    16e0:	b751                	j	1664 <basic.c.99f691d0+0x252>
    16e2:	0f4d8513          	add	a0,s11,244 # 20f4 <reset_handler+0x140>
    16e6:	9fbff0ef          	jal	10e0 <DEBUG_printf.constprop.0>
    16ea:	b749                	j	166c <basic.c.99f691d0+0x25a>
    16ec:	0785                	add	a5,a5,1
    16ee:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    16f2:	a43fe0ef          	jal	134 <iexp>
    16f6:	400117b7          	lui	a5,0x40011
    16fa:	c0078793          	add	a5,a5,-1024 # 40010c00 <_eusrstack+0x2000bc00>
    16fe:	6705                	lui	a4,0x1
    1700:	e119                	bnez	a0,1706 <basic.c.99f691d0+0x2f4>
    1702:	cbd8                	sw	a4,20(a5)
    1704:	b6dd                	j	12ea <iexe+0xd2>
    1706:	cb98                	sw	a4,16(a5)
    1708:	b6cd                	j	12ea <iexe+0xd2>
    170a:	0785                	add	a5,a5,1
    170c:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    1710:	4481                	li	s1,0
    1712:	49c5                	li	s3,17
    1714:	02900913          	li	s2,41
    1718:	4be5                	li	s7,25
    171a:	02800c13          	li	s8,40
    171e:	4cc1                	li	s9,16
    1720:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
    1724:	0007c703          	lbu	a4,0(a5)
    1728:	01370463          	beq	a4,s3,1730 <basic.c.99f691d0+0x31e>
    172c:	01271563          	bne	a4,s2,1736 <basic.c.99f691d0+0x324>
    1730:	dd3fe0ef          	jal	502 <newline>
    1734:	be5d                	j	12ea <iexe+0xd2>
    1736:	05770a63          	beq	a4,s7,178a <basic.c.99f691d0+0x378>
    173a:	07871263          	bne	a4,s8,179e <basic.c.99f691d0+0x38c>
    173e:	0017cd83          	lbu	s11,1(a5)
    1742:	00278713          	add	a4,a5,2
    1746:	80e1a423          	sw	a4,-2040(gp) # 20000008 <cip>
    174a:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
    174e:	0007c503          	lbu	a0,0(a5)
    1752:	020d9363          	bnez	s11,1778 <basic.c.99f691d0+0x366>
    1756:	8081a703          	lw	a4,-2040(gp) # 20000008 <cip>
    175a:	00074783          	lbu	a5,0(a4) # 1000 <USBPD_IRQHandler+0xe0>
    175e:	05979a63          	bne	a5,s9,17b2 <basic.c.99f691d0+0x3a0>
    1762:	00170793          	add	a5,a4,1
    1766:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    176a:	00174783          	lbu	a5,1(a4)
    176e:	b7378ee3          	beq	a5,s3,12ea <iexe+0xd2>
    1772:	fb2797e3          	bne	a5,s2,1720 <basic.c.99f691d0+0x30e>
    1776:	be95                	j	12ea <iexe+0xd2>
    1778:	0785                	add	a5,a5,1
    177a:	1dfd                	add	s11,s11,-1
    177c:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    1780:	0ffdfd93          	zext.b	s11,s11
    1784:	d6bfe0ef          	jal	4ee <DEBUG_write>
    1788:	b7c9                	j	174a <basic.c.99f691d0+0x338>
    178a:	0785                	add	a5,a5,1
    178c:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    1790:	9a5fe0ef          	jal	134 <iexp>
    1794:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
    1798:	84aa                	mv	s1,a0
    179a:	dfd5                	beqz	a5,1756 <basic.c.99f691d0+0x344>
    179c:	b6b9                	j	12ea <iexe+0xd2>
    179e:	997fe0ef          	jal	134 <iexp>
    17a2:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
    17a6:	b40792e3          	bnez	a5,12ea <iexe+0xd2>
    17aa:	85a6                	mv	a1,s1
    17ac:	d77fe0ef          	jal	522 <putnum>
    17b0:	b75d                	j	1756 <basic.c.99f691d0+0x344>
    17b2:	f73787e3          	beq	a5,s3,1720 <basic.c.99f691d0+0x30e>
    17b6:	f72785e3          	beq	a5,s2,1720 <basic.c.99f691d0+0x30e>
    17ba:	4751                	li	a4,20
    17bc:	be29                	j	12d6 <iexe+0xbe>
    17be:	0785                	add	a5,a5,1
    17c0:	02800993          	li	s3,40
    17c4:	4b79                	li	s6,30
    17c6:	02700b93          	li	s7,39
    17ca:	0007c703          	lbu	a4,0(a5)
    17ce:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    17d2:	4485                	li	s1,1
    17d4:	01371d63          	bne	a4,s3,17ee <basic.c.99f691d0+0x3dc>
    17d8:	0017c483          	lbu	s1,1(a5)
    17dc:	00278713          	add	a4,a5,2
    17e0:	80e1a423          	sw	a4,-2040(gp) # 20000008 <cip>
    17e4:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
    17e8:	0007c503          	lbu	a0,0(a5)
    17ec:	eca5                	bnez	s1,1864 <basic.c.99f691d0+0x452>
    17ee:	8081ac03          	lw	s8,-2040(gp) # 20000008 <cip>
    17f2:	000c4783          	lbu	a5,0(s8)
    17f6:	09678063          	beq	a5,s6,1876 <basic.c.99f691d0+0x464>
    17fa:	fd7790e3          	bne	a5,s7,17ba <basic.c.99f691d0+0x3a8>
    17fe:	001c0793          	add	a5,s8,1
    1802:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    1806:	cc89                	beqz	s1,1820 <basic.c.99f691d0+0x40e>
    1808:	001c4503          	lbu	a0,1(s8)
    180c:	04150513          	add	a0,a0,65
    1810:	0ff57513          	zext.b	a0,a0
    1814:	cdbfe0ef          	jal	4ee <DEBUG_write>
    1818:	03a00513          	li	a0,58
    181c:	cd3fe0ef          	jal	4ee <DEBUG_write>
    1820:	d93fe0ef          	jal	5b2 <getnum>
    1824:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
    1828:	ac0791e3          	bnez	a5,12ea <iexe+0xd2>
    182c:	001c4703          	lbu	a4,1(s8)
    1830:	002c0793          	add	a5,s8,2
    1834:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    1838:	0706                	sll	a4,a4,0x1
    183a:	9bc18793          	add	a5,gp,-1604 # 200001bc <var>
    183e:	97ba                	add	a5,a5,a4
    1840:	00a79023          	sh	a0,0(a5)
    1844:	8081a783          	lw	a5,-2040(gp) # 20000008 <cip>
    1848:	46c5                	li	a3,17
    184a:	0007c703          	lbu	a4,0(a5)
    184e:	a8d70ee3          	beq	a4,a3,12ea <iexe+0xd2>
    1852:	02900693          	li	a3,41
    1856:	a8d70ae3          	beq	a4,a3,12ea <iexe+0xd2>
    185a:	46c1                	li	a3,16
    185c:	f4d71fe3          	bne	a4,a3,17ba <basic.c.99f691d0+0x3a8>
    1860:	0785                	add	a5,a5,1
    1862:	b7a5                	j	17ca <basic.c.99f691d0+0x3b8>
    1864:	0785                	add	a5,a5,1
    1866:	14fd                	add	s1,s1,-1
    1868:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    186c:	0ff4f493          	zext.b	s1,s1
    1870:	c7ffe0ef          	jal	4ee <DEBUG_write>
    1874:	bf85                	j	17e4 <basic.c.99f691d0+0x3d2>
    1876:	0c05                	add	s8,s8,1
    1878:	8181a423          	sw	s8,-2040(gp) # 20000008 <cip>
    187c:	943fe0ef          	jal	1be <getparam>
    1880:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
    1884:	8c2a                	mv	s8,a0
    1886:	a60792e3          	bnez	a5,12ea <iexe+0xd2>
    188a:	03f00793          	li	a5,63
    188e:	00a7d663          	bge	a5,a0,189a <basic.c.99f691d0+0x488>
    1892:	478d                	li	a5,3
    1894:	80f18623          	sb	a5,-2036(gp) # 2000000c <err>
    1898:	bc89                	j	12ea <iexe+0xd2>
    189a:	cc99                	beqz	s1,18b8 <basic.c.99f691d0+0x4a6>
    189c:	6509                	lui	a0,0x2
    189e:	0f850513          	add	a0,a0,248 # 20f8 <reset_handler+0x144>
    18a2:	c65fe0ef          	jal	506 <c_puts>
    18a6:	8562                	mv	a0,s8
    18a8:	4581                	li	a1,0
    18aa:	c79fe0ef          	jal	522 <putnum>
    18ae:	6509                	lui	a0,0x2
    18b0:	0fc50513          	add	a0,a0,252 # 20fc <reset_handler+0x148>
    18b4:	c53fe0ef          	jal	506 <c_puts>
    18b8:	cfbfe0ef          	jal	5b2 <getnum>
    18bc:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
    18c0:	a20795e3          	bnez	a5,12ea <iexe+0xd2>
    18c4:	0c06                	sll	s8,s8,0x1
    18c6:	93c18793          	add	a5,gp,-1732 # 2000013c <arr>
    18ca:	9c3e                	add	s8,s8,a5
    18cc:	00ac1023          	sh	a0,0(s8)
    18d0:	bf95                	j	1844 <basic.c.99f691d0+0x432>
    18d2:	0785                	add	a5,a5,1
    18d4:	80f1a423          	sw	a5,-2040(gp) # 20000008 <cip>
    18d8:	bc09                	j	12ea <iexe+0xd2>
    18da:	474d                	li	a4,19
    18dc:	baed                	j	12d6 <iexe+0xbe>

000018de <main>:
    18de:	400216b7          	lui	a3,0x40021
    18e2:	4e9c                	lw	a5,24(a3)
    18e4:	7179                	add	sp,sp,-48
    18e6:	d606                	sw	ra,44(sp)
    18e8:	d226                	sw	s1,36(sp)
    18ea:	d04a                	sw	s2,32(sp)
    18ec:	ce4e                	sw	s3,28(sp)
    18ee:	cc52                	sw	s4,24(sp)
    18f0:	ca56                	sw	s5,20(sp)
    18f2:	d422                	sw	s0,40(sp)
    18f4:	c85a                	sw	s6,16(sp)
    18f6:	c65e                	sw	s7,12(sp)
    18f8:	c462                	sw	s8,8(sp)
    18fa:	c266                	sw	s9,4(sp)
    18fc:	c06a                	sw	s10,0(sp)
    18fe:	0057e793          	or	a5,a5,5
    1902:	ce9c                	sw	a5,24(a3)
    1904:	400117b7          	lui	a5,0x40011
    1908:	80078613          	add	a2,a5,-2048 # 40010800 <_eusrstack+0x2000b800>
    190c:	4218                	lw	a4,0(a2)
    190e:	75fd                	lui	a1,0xfffff
    1910:	0ff58593          	add	a1,a1,255 # fffff0ff <_eusrstack+0xdfffa0ff>
    1914:	8f6d                	and	a4,a4,a1
    1916:	6585                	lui	a1,0x1
    1918:	b0058593          	add	a1,a1,-1280 # b00 <PD_negotiate+0x3e>
    191c:	8f4d                	or	a4,a4,a1
    191e:	c218                	sw	a4,0(a2)
    1920:	4258                	lw	a4,4(a2)
    1922:	75c5                	lui	a1,0xffff1
    1924:	15fd                	add	a1,a1,-1 # ffff0fff <_eusrstack+0xdffebfff>
    1926:	8f6d                	and	a4,a4,a1
    1928:	6591                	lui	a1,0x4
    192a:	8f4d                	or	a4,a4,a1
    192c:	c258                	sw	a4,4(a2)
    192e:	4ed8                	lw	a4,28(a3)
    1930:	00020637          	lui	a2,0x20
    1934:	40004937          	lui	s2,0x40004
    1938:	8f51                	or	a4,a4,a2
    193a:	ced8                	sw	a4,28(a3)
    193c:	40090913          	add	s2,s2,1024 # 40004400 <_eusrstack+0x1ffff400>
    1940:	1a100713          	li	a4,417
    1944:	00e91423          	sh	a4,8(s2)
    1948:	6709                	lui	a4,0x2
    194a:	0731                	add	a4,a4,12 # 200c <reset_handler+0x58>
    194c:	c0078793          	add	a5,a5,-1024
    1950:	00e91623          	sh	a4,12(s2)
    1954:	43d8                	lw	a4,4(a5)
    1956:	fff106b7          	lui	a3,0xfff10
    195a:	16fd                	add	a3,a3,-1 # fff0ffff <_eusrstack+0xdff0afff>
    195c:	8f75                	and	a4,a4,a3
    195e:	000306b7          	lui	a3,0x30
    1962:	8f55                	or	a4,a4,a3
    1964:	c3d8                	sw	a4,4(a5)
    1966:	b3ffe0ef          	jal	4a4 <inew>
    196a:	6509                	lui	a0,0x2
    196c:	1a050513          	add	a0,a0,416 # 21a0 <reset_handler+0x1ec>
    1970:	b97fe0ef          	jal	506 <c_puts>
    1974:	b8ffe0ef          	jal	502 <newline>
    1978:	6509                	lui	a0,0x2
    197a:	1b850513          	add	a0,a0,440 # 21b8 <reset_handler+0x204>
    197e:	b89fe0ef          	jal	506 <c_puts>
    1982:	6509                	lui	a0,0x2
    1984:	1c450513          	add	a0,a0,452 # 21c4 <reset_handler+0x210>
    1988:	20000ab7          	lui	s5,0x20000
    198c:	b7bfe0ef          	jal	506 <c_puts>
    1990:	df018493          	add	s1,gp,-528 # 200005f0 <lbuf>
    1994:	b6ffe0ef          	jal	502 <newline>
    1998:	eddfe0ef          	jal	874 <error>
    199c:	04da8a13          	add	s4,s5,77 # 2000004d <ibuf+0x1>
    19a0:	03e00513          	li	a0,62
    19a4:	b4bfe0ef          	jal	4ee <DEBUG_write>
    19a8:	4401                	li	s0,0
    19aa:	4b35                	li	s6,13
    19ac:	4ba5                	li	s7,9
    19ae:	04c00c13          	li	s8,76
    19b2:	4ca1                	li	s9,8
    19b4:	00095783          	lhu	a5,0(s2)
    19b8:	0207f793          	and	a5,a5,32
    19bc:	dfe5                	beqz	a5,19b4 <main+0xd6>
    19be:	00495503          	lhu	a0,4(s2)
    19c2:	0ff57513          	zext.b	a0,a0
    19c6:	09651963          	bne	a0,s6,1a58 <main+0x17a>
    19ca:	b39fe0ef          	jal	502 <newline>
    19ce:	008487b3          	add	a5,s1,s0
    19d2:	00078023          	sb	zero,0(a5)
    19d6:	c415                	beqz	s0,1a02 <main+0x124>
    19d8:	02000613          	li	a2,32
    19dc:	4691                	li	a3,4
    19de:	8722                	mv	a4,s0
    19e0:	147d                	add	s0,s0,-1
    19e2:	0ff47413          	zext.b	s0,s0
    19e6:	008487b3          	add	a5,s1,s0
    19ea:	0007c783          	lbu	a5,0(a5)
    19ee:	fec788e3          	beq	a5,a2,19de <main+0x100>
    19f2:	17dd                	add	a5,a5,-9
    19f4:	0ff7f793          	zext.b	a5,a5
    19f8:	fef6f3e3          	bgeu	a3,a5,19de <main+0x100>
    19fc:	9726                	add	a4,a4,s1
    19fe:	00070023          	sb	zero,0(a4)
    1a02:	200008b7          	lui	a7,0x20000
    1a06:	8726                	mv	a4,s1
    1a08:	4781                	li	a5,0
    1a0a:	02000313          	li	t1,32
    1a0e:	4e11                	li	t3,4
    1a10:	6e89                	lui	t4,0x2
    1a12:	4865                	li	a6,25
    1a14:	02600f13          	li	t5,38
    1a18:	04c00f93          	li	t6,76
    1a1c:	04c88893          	add	a7,a7,76 # 2000004c <ibuf>
    1a20:	42a1                	li	t0,8
    1a22:	43a5                	li	t2,9
    1a24:	02200413          	li	s0,34
    1a28:	02700513          	li	a0,39
    1a2c:	00074683          	lbu	a3,0(a4)
    1a30:	e2d9                	bnez	a3,1ab6 <main+0x1d8>
    1a32:	20000537          	lui	a0,0x20000
    1a36:	04c50713          	add	a4,a0,76 # 2000004c <ibuf>
    1a3a:	00f706b3          	add	a3,a4,a5
    1a3e:	02900613          	li	a2,41
    1a42:	00c68023          	sb	a2,0(a3) # 30000 <usbpd_sink.c.eec41fa6+0x2d222>
    1a46:	80c1c683          	lbu	a3,-2036(gp) # 2000000c <err>
    1a4a:	04c50b13          	add	s6,a0,76
    1a4e:	36068663          	beqz	a3,1dba <debug_serial.c.924ccdda+0x83>
    1a52:	e23fe0ef          	jal	874 <error>
    1a56:	b7a9                	j	19a0 <main+0xc2>
    1a58:	05750c63          	beq	a0,s7,1ab0 <main+0x1d2>
    1a5c:	01950663          	beq	a0,s9,1a68 <main+0x18a>
    1a60:	07f00793          	li	a5,127
    1a64:	02f51163          	bne	a0,a5,1a86 <main+0x1a8>
    1a68:	d431                	beqz	s0,19b4 <main+0xd6>
    1a6a:	4521                	li	a0,8
    1a6c:	a83fe0ef          	jal	4ee <DEBUG_write>
    1a70:	02000513          	li	a0,32
    1a74:	a7bfe0ef          	jal	4ee <DEBUG_write>
    1a78:	147d                	add	s0,s0,-1
    1a7a:	4521                	li	a0,8
    1a7c:	0ff47413          	zext.b	s0,s0
    1a80:	a6ffe0ef          	jal	4ee <DEBUG_write>
    1a84:	bf05                	j	19b4 <main+0xd6>
    1a86:	fe050793          	add	a5,a0,-32
    1a8a:	0ff7f793          	zext.b	a5,a5
    1a8e:	05e00713          	li	a4,94
    1a92:	f2f761e3          	bltu	a4,a5,19b4 <main+0xd6>
    1a96:	f08c6fe3          	bltu	s8,s0,19b4 <main+0xd6>
    1a9a:	00140d13          	add	s10,s0,1
    1a9e:	0ffd7d13          	zext.b	s10,s10
    1aa2:	9426                	add	s0,s0,s1
    1aa4:	00a40023          	sb	a0,0(s0)
    1aa8:	a47fe0ef          	jal	4ee <DEBUG_write>
    1aac:	846a                	mv	s0,s10
    1aae:	b719                	j	19b4 <main+0xd6>
    1ab0:	02000513          	li	a0,32
    1ab4:	b7cd                	j	1a96 <main+0x1b8>
    1ab6:	00074683          	lbu	a3,0(a4)
    1aba:	00668763          	beq	a3,t1,1ac8 <main+0x1ea>
    1abe:	16dd                	add	a3,a3,-9
    1ac0:	0ff6f693          	zext.b	a3,a3
    1ac4:	00de6463          	bltu	t3,a3,1acc <main+0x1ee>
    1ac8:	0705                	add	a4,a4,1
    1aca:	b7f5                	j	1ab6 <main+0x1d8>
    1acc:	4d0e8b93          	add	s7,t4,1232 # 24d0 <kwtbl>
    1ad0:	4581                	li	a1,0
    1ad2:	000bab03          	lw	s6,0(s7)
    1ad6:	863a                	mv	a2,a4
    1ad8:	000b4c83          	lbu	s9,0(s6)
    1adc:	020c8963          	beqz	s9,1b0e <main+0x230>
    1ae0:	00064683          	lbu	a3,0(a2) # 20000 <usbpd_sink.c.eec41fa6+0x1d222>
    1ae4:	f9f68c13          	add	s8,a3,-97
    1ae8:	0ffc7c13          	zext.b	s8,s8
    1aec:	01886563          	bltu	a6,s8,1af6 <main+0x218>
    1af0:	1681                	add	a3,a3,-32
    1af2:	0ff6f693          	zext.b	a3,a3
    1af6:	00dc8963          	beq	s9,a3,1b08 <main+0x22a>
    1afa:	0585                	add	a1,a1,1 # 4001 <usbpd_sink.c.eec41fa6+0x1223>
    1afc:	0ff5f593          	zext.b	a1,a1
    1b00:	0b91                	add	s7,s7,4
    1b02:	fde598e3          	bne	a1,t5,1ad2 <main+0x1f4>
    1b06:	a015                	j	1b2a <main+0x24c>
    1b08:	0b05                	add	s6,s6,1
    1b0a:	0605                	add	a2,a2,1
    1b0c:	b7f1                	j	1ad8 <main+0x1fa>
    1b0e:	00fff663          	bgeu	t6,a5,1b1a <main+0x23c>
    1b12:	4791                	li	a5,4
    1b14:	80f18623          	sb	a5,-2036(gp) # 2000000c <err>
    1b18:	bf2d                	j	1a52 <main+0x174>
    1b1a:	00178693          	add	a3,a5,1
    1b1e:	97c6                	add	a5,a5,a7
    1b20:	00b78023          	sb	a1,0(a5)
    1b24:	8732                	mv	a4,a2
    1b26:	0ff6f793          	zext.b	a5,a3
    1b2a:	00074603          	lbu	a2,0(a4)
    1b2e:	08559563          	bne	a1,t0,1bb8 <main+0x2da>
    1b32:	02000613          	li	a2,32
    1b36:	4591                	li	a1,4
    1b38:	00074683          	lbu	a3,0(a4)
    1b3c:	00c68763          	beq	a3,a2,1b4a <main+0x26c>
    1b40:	16dd                	add	a3,a3,-9
    1b42:	0ff6f693          	zext.b	a3,a3
    1b46:	00d5e463          	bltu	a1,a3,1b4e <main+0x270>
    1b4a:	0705                	add	a4,a4,1
    1b4c:	b7f5                	j	1b38 <main+0x25a>
    1b4e:	4681                	li	a3,0
    1b50:	8636                	mv	a2,a3
    1b52:	0685                	add	a3,a3,1
    1b54:	00d705b3          	add	a1,a4,a3
    1b58:	fff5c583          	lbu	a1,-1(a1)
    1b5c:	f9f5                	bnez	a1,1b50 <main+0x272>
    1b5e:	0ff67593          	zext.b	a1,a2
    1b62:	04c00693          	li	a3,76
    1b66:	8e8d                	sub	a3,a3,a1
    1b68:	fad7d5e3          	bge	a5,a3,1b12 <main+0x234>
    1b6c:	20000537          	lui	a0,0x20000
    1b70:	04c50593          	add	a1,a0,76 # 2000004c <ibuf>
    1b74:	95be                	add	a1,a1,a5
    1b76:	0ff67613          	zext.b	a2,a2
    1b7a:	00178693          	add	a3,a5,1
    1b7e:	0789                	add	a5,a5,2
    1b80:	0ff6f693          	zext.b	a3,a3
    1b84:	97b2                	add	a5,a5,a2
    1b86:	00c58023          	sb	a2,0(a1)
    1b8a:	0ff7f793          	zext.b	a5,a5
    1b8e:	85b6                	mv	a1,a3
    1b90:	04c50813          	add	a6,a0,76
    1b94:	00158513          	add	a0,a1,1
    1b98:	0ff57513          	zext.b	a0,a0
    1b9c:	00a79663          	bne	a5,a0,1ba8 <main+0x2ca>
    1ba0:	96b2                	add	a3,a3,a2
    1ba2:	0ff6f793          	zext.b	a5,a3
    1ba6:	b571                	j	1a32 <main+0x154>
    1ba8:	00074883          	lbu	a7,0(a4)
    1bac:	95c2                	add	a1,a1,a6
    1bae:	0705                	add	a4,a4,1
    1bb0:	01158023          	sb	a7,0(a1)
    1bb4:	85aa                	mv	a1,a0
    1bb6:	bff9                	j	1b94 <main+0x2b6>
    1bb8:	000b4683          	lbu	a3,0(s6)
    1bbc:	e60688e3          	beqz	a3,1a2c <main+0x14e>
    1bc0:	fd060693          	add	a3,a2,-48
    1bc4:	0ff6f693          	zext.b	a3,a3
    1bc8:	08d3e063          	bltu	t2,a3,1c48 <main+0x36a>
    1bcc:	4601                	li	a2,0
    1bce:	4ba9                	li	s7,10
    1bd0:	45a5                	li	a1,9
    1bd2:	03760b33          	mul	s6,a2,s7
    1bd6:	00074683          	lbu	a3,0(a4)
    1bda:	8c32                	mv	s8,a2
    1bdc:	0705                	add	a4,a4,1
    1bde:	fd068693          	add	a3,a3,-48
    1be2:	96da                	add	a3,a3,s6
    1be4:	01069613          	sll	a2,a3,0x10
    1be8:	01069b13          	sll	s6,a3,0x10
    1bec:	8641                	sra	a2,a2,0x10
    1bee:	010b5b13          	srl	s6,s6,0x10
    1bf2:	39864e63          	blt	a2,s8,1f8e <debug_serial.c.924ccdda+0x257>
    1bf6:	00074683          	lbu	a3,0(a4)
    1bfa:	fd068693          	add	a3,a3,-48
    1bfe:	0ff6f693          	zext.b	a3,a3
    1c02:	fcd5f8e3          	bgeu	a1,a3,1bd2 <main+0x2f4>
    1c06:	04a00693          	li	a3,74
    1c0a:	f0f6e4e3          	bltu	a3,a5,1b12 <main+0x234>
    1c0e:	200006b7          	lui	a3,0x20000
    1c12:	04c68693          	add	a3,a3,76 # 2000004c <ibuf>
    1c16:	00f685b3          	add	a1,a3,a5
    1c1a:	02600b93          	li	s7,38
    1c1e:	01758023          	sb	s7,0(a1)
    1c22:	00178593          	add	a1,a5,1
    1c26:	00278b93          	add	s7,a5,2
    1c2a:	0ff5f593          	zext.b	a1,a1
    1c2e:	95b6                	add	a1,a1,a3
    1c30:	0ffbfb93          	zext.b	s7,s7
    1c34:	01658023          	sb	s6,0(a1)
    1c38:	078d                	add	a5,a5,3
    1c3a:	96de                	add	a3,a3,s7
    1c3c:	8621                	sra	a2,a2,0x8
    1c3e:	0ff7f793          	zext.b	a5,a5
    1c42:	00c68023          	sb	a2,0(a3)
    1c46:	b3dd                	j	1a2c <main+0x14e>
    1c48:	00860463          	beq	a2,s0,1c50 <main+0x372>
    1c4c:	08a61763          	bne	a2,a0,1cda <main+0x3fc>
    1c50:	0705                	add	a4,a4,1
    1c52:	8b3a                	mv	s6,a4
    1c54:	4581                	li	a1,0
    1c56:	05e00b93          	li	s7,94
    1c5a:	000b4683          	lbu	a3,0(s6)
    1c5e:	00c68763          	beq	a3,a2,1c6c <main+0x38e>
    1c62:	1681                	add	a3,a3,-32
    1c64:	0ff6f693          	zext.b	a3,a3
    1c68:	04dbfb63          	bgeu	s7,a3,1cbe <main+0x3e0>
    1c6c:	04d00693          	li	a3,77
    1c70:	8e8d                	sub	a3,a3,a1
    1c72:	ead7d0e3          	bge	a5,a3,1b12 <main+0x234>
    1c76:	20000b37          	lui	s6,0x20000
    1c7a:	04cb0b93          	add	s7,s6,76 # 2000004c <ibuf>
    1c7e:	00fb86b3          	add	a3,s7,a5
    1c82:	02800c13          	li	s8,40
    1c86:	01868023          	sb	s8,0(a3)
    1c8a:	00278693          	add	a3,a5,2
    1c8e:	0785                	add	a5,a5,1
    1c90:	0ff7f793          	zext.b	a5,a5
    1c94:	0ff6f693          	zext.b	a3,a3
    1c98:	9bbe                	add	s7,s7,a5
    1c9a:	00d587b3          	add	a5,a1,a3
    1c9e:	00bb8023          	sb	a1,0(s7)
    1ca2:	0ff7f793          	zext.b	a5,a5
    1ca6:	8bba                	mv	s7,a4
    1ca8:	04cb0b13          	add	s6,s6,76
    1cac:	000bcc03          	lbu	s8,0(s7)
    1cb0:	00f69c63          	bne	a3,a5,1cc8 <main+0x3ea>
    1cb4:	972e                	add	a4,a4,a1
    1cb6:	d6cc1be3          	bne	s8,a2,1a2c <main+0x14e>
    1cba:	0705                	add	a4,a4,1
    1cbc:	bb85                	j	1a2c <main+0x14e>
    1cbe:	0585                	add	a1,a1,1
    1cc0:	0b05                	add	s6,s6,1
    1cc2:	0ff5f593          	zext.b	a1,a1
    1cc6:	bf51                	j	1c5a <main+0x37c>
    1cc8:	00168c93          	add	s9,a3,1
    1ccc:	96da                	add	a3,a3,s6
    1cce:	01868023          	sb	s8,0(a3)
    1cd2:	0b85                	add	s7,s7,1
    1cd4:	0ffcf693          	zext.b	a3,s9
    1cd8:	bfd1                	j	1cac <main+0x3ce>
    1cda:	f9f60b13          	add	s6,a2,-97
    1cde:	0ffb7b13          	zext.b	s6,s6
    1ce2:	03686863          	bltu	a6,s6,1d12 <main+0x434>
    1ce6:	04b00693          	li	a3,75
    1cea:	e2f6e4e3          	bltu	a3,a5,1b12 <main+0x234>
    1cee:	200005b7          	lui	a1,0x20000
    1cf2:	468d                	li	a3,3
    1cf4:	04c58593          	add	a1,a1,76 # 2000004c <ibuf>
    1cf8:	08f6e263          	bltu	a3,a5,1d7c <debug_serial.c.924ccdda+0x45>
    1cfc:	00178693          	add	a3,a5,1
    1d00:	0ff6f693          	zext.b	a3,a3
    1d04:	95be                	add	a1,a1,a5
    1d06:	00a58023          	sb	a0,0(a1)
    1d0a:	1601                	add	a2,a2,-32
    1d0c:	0ff67613          	zext.b	a2,a2
    1d10:	a80d                	j	1d42 <debug_serial.c.924ccdda+0xb>
    1d12:	fbf60693          	add	a3,a2,-65
    1d16:	0ff6f693          	zext.b	a3,a3
    1d1a:	26d86c63          	bltu	a6,a3,1f92 <debug_serial.c.924ccdda+0x25b>
    1d1e:	04b00693          	li	a3,75
    1d22:	def6e8e3          	bltu	a3,a5,1b12 <main+0x234>
    1d26:	200005b7          	lui	a1,0x20000
    1d2a:	468d                	li	a3,3
    1d2c:	04c58593          	add	a1,a1,76 # 2000004c <ibuf>
    1d30:	02f6e663          	bltu	a3,a5,1d5c <debug_serial.c.924ccdda+0x25>
    1d34:	00178693          	add	a3,a5,1
    1d38:	95be                	add	a1,a1,a5
    1d3a:	0ff6f693          	zext.b	a3,a3
    1d3e:	00a58023          	sb	a0,0(a1)
    1d42:	200005b7          	lui	a1,0x20000
    1d46:	04c58593          	add	a1,a1,76 # 2000004c <ibuf>
    1d4a:	0789                	add	a5,a5,2
    1d4c:	96ae                	add	a3,a3,a1
    1d4e:	fbf60613          	add	a2,a2,-65
    1d52:	0ff7f793          	zext.b	a5,a5
    1d56:	00c68023          	sb	a2,0(a3)
    1d5a:	b785                	j	1cba <main+0x3dc>
    1d5c:	00f586b3          	add	a3,a1,a5
    1d60:	ffe6c683          	lbu	a3,-2(a3)
    1d64:	02a68663          	beq	a3,a0,1d90 <debug_serial.c.924ccdda+0x59>
    1d68:	00178693          	add	a3,a5,1
    1d6c:	95be                	add	a1,a1,a5
    1d6e:	02700b13          	li	s6,39
    1d72:	0ff6f693          	zext.b	a3,a3
    1d76:	01658023          	sb	s6,0(a1)
    1d7a:	b7e1                	j	1d42 <debug_serial.c.924ccdda+0xb>
    1d7c:	95be                	add	a1,a1,a5
    1d7e:	ffe5c683          	lbu	a3,-2(a1)
    1d82:	00a68763          	beq	a3,a0,1d90 <debug_serial.c.924ccdda+0x59>
    1d86:	00178693          	add	a3,a5,1
    1d8a:	0ff6f693          	zext.b	a3,a3
    1d8e:	bfa5                	j	1d06 <main+0x428>
    1d90:	200005b7          	lui	a1,0x20000
    1d94:	04c58593          	add	a1,a1,76 # 2000004c <ibuf>
    1d98:	95be                	add	a1,a1,a5
    1d9a:	ffc5c683          	lbu	a3,-4(a1)
    1d9e:	02700b93          	li	s7,39
    1da2:	1f768863          	beq	a3,s7,1f92 <debug_serial.c.924ccdda+0x25b>
    1da6:	00178693          	add	a3,a5,1
    1daa:	01758023          	sb	s7,0(a1)
    1dae:	45e5                	li	a1,25
    1db0:	0ff6f693          	zext.b	a3,a3
    1db4:	f965e7e3          	bltu	a1,s6,1d42 <debug_serial.c.924ccdda+0xb>
    1db8:	bf89                	j	1d0a <main+0x42c>
    1dba:	000b4683          	lbu	a3,0(s6)
    1dbe:	02500593          	li	a1,37
    1dc2:	1cb68a63          	beq	a3,a1,1f96 <debug_serial.c.924ccdda+0x25f>
    1dc6:	02600593          	li	a1,38
    1dca:	0cb69063          	bne	a3,a1,1e8a <debug_serial.c.924ccdda+0x153>
    1dce:	0785                	add	a5,a5,1
    1dd0:	0ff7f793          	zext.b	a5,a5
    1dd4:	200006b7          	lui	a3,0x20000
    1dd8:	00fb0023          	sb	a5,0(s6)
    1ddc:	1f068693          	add	a3,a3,496 # 200001f0 <listbuf>
    1de0:	0006c703          	lbu	a4,0(a3)
    1de4:	ef09                	bnez	a4,1dfe <debug_serial.c.924ccdda+0xc7>
    1de6:	df018713          	add	a4,gp,-528 # 200005f0 <lbuf>
    1dea:	8f15                	sub	a4,a4,a3
    1dec:	177d                	add	a4,a4,-1
    1dee:	0742                	sll	a4,a4,0x10
    1df0:	8741                	sra	a4,a4,0x10
    1df2:	00f75863          	bge	a4,a5,1e02 <debug_serial.c.924ccdda+0xcb>
    1df6:	4795                	li	a5,5
    1df8:	80f18623          	sb	a5,-2036(gp) # 2000000c <err>
    1dfc:	b999                	j	1a52 <main+0x174>
    1dfe:	96ba                	add	a3,a3,a4
    1e00:	b7c5                	j	1de0 <debug_serial.c.924ccdda+0xa9>
    1e02:	04c50513          	add	a0,a0,76
    1e06:	adafe0ef          	jal	e0 <getlineno>
    1e0a:	8baa                	mv	s7,a0
    1e0c:	af2fe0ef          	jal	fe <getlp>
    1e10:	842a                	mv	s0,a0
    1e12:	acefe0ef          	jal	e0 <getlineno>
    1e16:	00ab9b63          	bne	s7,a0,1e2c <debug_serial.c.924ccdda+0xf5>
    1e1a:	00044783          	lbu	a5,0(s0)
    1e1e:	97a2                	add	a5,a5,s0
    1e20:	0007c783          	lbu	a5,0(a5)
    1e24:	e391                	bnez	a5,1e28 <debug_serial.c.924ccdda+0xf1>
    1e26:	a001                	j	1e26 <debug_serial.c.924ccdda+0xef>
    1e28:	00040023          	sb	zero,0(s0)
    1e2c:	000b4583          	lbu	a1,0(s6)
    1e30:	4791                	li	a5,4
    1e32:	b6f587e3          	beq	a1,a5,19a0 <main+0xc2>
    1e36:	87a2                	mv	a5,s0
    1e38:	0007c703          	lbu	a4,0(a5)
    1e3c:	eb15                	bnez	a4,1e70 <debug_serial.c.924ccdda+0x139>
    1e3e:	408786b3          	sub	a3,a5,s0
    1e42:	0685                	add	a3,a3,1
    1e44:	06c2                	sll	a3,a3,0x10
    1e46:	82c1                	srl	a3,a3,0x10
    1e48:	00e68633          	add	a2,a3,a4
    1e4c:	0642                	sll	a2,a2,0x10
    1e4e:	8241                	srl	a2,a2,0x10
    1e50:	e215                	bnez	a2,1e74 <debug_serial.c.924ccdda+0x13d>
    1e52:	000b4703          	lbu	a4,0(s6)
    1e56:	4781                	li	a5,0
    1e58:	b4f704e3          	beq	a4,a5,19a0 <main+0xc2>
    1e5c:	00fb06b3          	add	a3,s6,a5
    1e60:	0006c603          	lbu	a2,0(a3)
    1e64:	00f406b3          	add	a3,s0,a5
    1e68:	0785                	add	a5,a5,1
    1e6a:	00c68023          	sb	a2,0(a3)
    1e6e:	b7ed                	j	1e58 <debug_serial.c.924ccdda+0x121>
    1e70:	97ba                	add	a5,a5,a4
    1e72:	b7d9                	j	1e38 <debug_serial.c.924ccdda+0x101>
    1e74:	00e78633          	add	a2,a5,a4
    1e78:	00064503          	lbu	a0,0(a2)
    1e7c:	00b70633          	add	a2,a4,a1
    1e80:	963e                	add	a2,a2,a5
    1e82:	00a60023          	sb	a0,0(a2)
    1e86:	177d                	add	a4,a4,-1
    1e88:	b7c1                	j	1e48 <debug_serial.c.924ccdda+0x111>
    1e8a:	80e1a423          	sw	a4,-2040(gp) # 20000008 <cip>
    1e8e:	02300793          	li	a5,35
    1e92:	0af68c63          	beq	a3,a5,1f4a <debug_serial.c.924ccdda+0x213>
    1e96:	02400793          	li	a5,36
    1e9a:	08f68963          	beq	a3,a5,1f2c <debug_serial.c.924ccdda+0x1f5>
    1e9e:	02200793          	li	a5,34
    1ea2:	0ef69363          	bne	a3,a5,1f88 <debug_serial.c.924ccdda+0x251>
    1ea6:	00174783          	lbu	a5,1(a4)
    1eaa:	8141a423          	sw	s4,-2040(gp) # 20000008 <cip>
    1eae:	08c78a63          	beq	a5,a2,1f42 <debug_serial.c.924ccdda+0x20b>
    1eb2:	00474703          	lbu	a4,4(a4)
    1eb6:	08c71463          	bne	a4,a2,1f3e <debug_serial.c.924ccdda+0x207>
    1eba:	4b81                	li	s7,0
    1ebc:	00b79763          	bne	a5,a1,1eca <debug_serial.c.924ccdda+0x193>
    1ec0:	04da8513          	add	a0,s5,77
    1ec4:	a1cfe0ef          	jal	e0 <getlineno>
    1ec8:	8baa                	mv	s7,a0
    1eca:	20000b37          	lui	s6,0x20000
    1ece:	1f0b0b13          	add	s6,s6,496 # 200001f0 <listbuf>
    1ed2:	20000c37          	lui	s8,0x20000
    1ed6:	000b4c83          	lbu	s9,0(s6)
    1eda:	016c2223          	sw	s6,4(s8) # 20000004 <clp>
    1ede:	000c8763          	beqz	s9,1eec <debug_serial.c.924ccdda+0x1b5>
    1ee2:	855a                	mv	a0,s6
    1ee4:	9fcfe0ef          	jal	e0 <getlineno>
    1ee8:	05754f63          	blt	a0,s7,1f46 <debug_serial.c.924ccdda+0x20f>
    1eec:	004c2b03          	lw	s6,4(s8)
    1ef0:	000b4783          	lbu	a5,0(s6)
    1ef4:	b4078fe3          	beqz	a5,1a52 <main+0x174>
    1ef8:	855a                	mv	a0,s6
    1efa:	9e6fe0ef          	jal	e0 <getlineno>
    1efe:	4581                	li	a1,0
    1f00:	e22fe0ef          	jal	522 <putnum>
    1f04:	02000513          	li	a0,32
    1f08:	de6fe0ef          	jal	4ee <DEBUG_write>
    1f0c:	003b0513          	add	a0,s6,3
    1f10:	fc2fe0ef          	jal	6d2 <putlist>
    1f14:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
    1f18:	b2079de3          	bnez	a5,1a52 <main+0x174>
    1f1c:	de6fe0ef          	jal	502 <newline>
    1f20:	000b4783          	lbu	a5,0(s6)
    1f24:	9b3e                	add	s6,s6,a5
    1f26:	016c2223          	sw	s6,4(s8)
    1f2a:	b7c9                	j	1eec <debug_serial.c.924ccdda+0x1b5>
    1f2c:	00174783          	lbu	a5,1(a4)
    1f30:	8141a423          	sw	s4,-2040(gp) # 20000008 <cip>
    1f34:	00c79563          	bne	a5,a2,1f3e <debug_serial.c.924ccdda+0x207>
    1f38:	d6cfe0ef          	jal	4a4 <inew>
    1f3c:	be19                	j	1a52 <main+0x174>
    1f3e:	47d1                	li	a5,20
    1f40:	bd65                	j	1df8 <debug_serial.c.924ccdda+0xc1>
    1f42:	4b81                	li	s7,0
    1f44:	b759                	j	1eca <debug_serial.c.924ccdda+0x193>
    1f46:	9b66                	add	s6,s6,s9
    1f48:	b779                	j	1ed6 <debug_serial.c.924ccdda+0x19f>
    1f4a:	200007b7          	lui	a5,0x20000
    1f4e:	000780a3          	sb	zero,1(a5) # 20000001 <gstki>
    1f52:	20000537          	lui	a0,0x20000
    1f56:	200007b7          	lui	a5,0x20000
    1f5a:	8141a423          	sw	s4,-2040(gp) # 20000008 <cip>
    1f5e:	00078023          	sb	zero,0(a5) # 20000000 <lstki>
    1f62:	1f050513          	add	a0,a0,496 # 200001f0 <listbuf>
    1f66:	20000b37          	lui	s6,0x20000
    1f6a:	00054783          	lbu	a5,0(a0)
    1f6e:	00ab2223          	sw	a0,4(s6) # 20000004 <clp>
    1f72:	ae0780e3          	beqz	a5,1a52 <main+0x174>
    1f76:	050d                	add	a0,a0,3
    1f78:	80a1a423          	sw	a0,-2040(gp) # 20000008 <cip>
    1f7c:	a9cff0ef          	jal	1218 <iexe>
    1f80:	80c1c783          	lbu	a5,-2036(gp) # 2000000c <err>
    1f84:	d3fd                	beqz	a5,1f6a <debug_serial.c.924ccdda+0x233>
    1f86:	b4f1                	j	1a52 <main+0x174>
    1f88:	a90ff0ef          	jal	1218 <iexe>
    1f8c:	b4d9                	j	1a52 <main+0x174>
    1f8e:	4789                	li	a5,2
    1f90:	b651                	j	1b14 <main+0x236>
    1f92:	47d1                	li	a5,20
    1f94:	b641                	j	1b14 <main+0x236>
    1f96:	50b2                	lw	ra,44(sp)
    1f98:	5422                	lw	s0,40(sp)
    1f9a:	5492                	lw	s1,36(sp)
    1f9c:	5902                	lw	s2,32(sp)
    1f9e:	49f2                	lw	s3,28(sp)
    1fa0:	4a62                	lw	s4,24(sp)
    1fa2:	4ad2                	lw	s5,20(sp)
    1fa4:	4b42                	lw	s6,16(sp)
    1fa6:	4bb2                	lw	s7,12(sp)
    1fa8:	4c22                	lw	s8,8(sp)
    1faa:	4c92                	lw	s9,4(sp)
    1fac:	4d02                	lw	s10,0(sp)
    1fae:	4501                	li	a0,0
    1fb0:	6145                	add	sp,sp,48
    1fb2:	8082                	ret

00001fb4 <reset_handler>:
    1fb4:	6789                	lui	a5,0x2
    1fb6:	8de78793          	add	a5,a5,-1826 # 18de <main>
    1fba:	1ffff197          	auipc	gp,0x1ffff
    1fbe:	84618193          	add	gp,gp,-1978 # 20000800 <__global_pointer$>
    1fc2:	20003117          	auipc	sp,0x20003
    1fc6:	03e10113          	add	sp,sp,62 # 20005000 <_eusrstack>
    1fca:	457d                	li	a0,31
    1fcc:	bc051073          	csrw	0xbc0,a0
    1fd0:	08800513          	li	a0,136
    1fd4:	30052073          	csrs	mstatus,a0
    1fd8:	458d                	li	a1,3
    1fda:	80459073          	csrw	0x804,a1
    1fde:	00400513          	li	a0,4
    1fe2:	8d4d                	or	a0,a0,a1
    1fe4:	30551073          	csrw	mtvec,a0
    1fe8:	34179073          	csrw	mepc,a5
    1fec:	6709                	lui	a4,0x2
    1fee:	200007b7          	lui	a5,0x20000
    1ff2:	200006b7          	lui	a3,0x20000
    1ff6:	56870713          	add	a4,a4,1384 # 2568 <_data_lma>
    1ffa:	00078793          	mv	a5,a5
    1ffe:	00068693          	mv	a3,a3
    2002:	02d7ea63          	bltu	a5,a3,2036 <reset_handler+0x82>
    2006:	200007b7          	lui	a5,0x20000
    200a:	00078793          	mv	a5,a5
    200e:	e4018713          	add	a4,gp,-448 # 20000640 <_ebss>
    2012:	02e7e763          	bltu	a5,a4,2040 <reset_handler+0x8c>
    2016:	400227b7          	lui	a5,0x40022
    201a:	4709                	li	a4,2
    201c:	c398                	sw	a4,0(a5)
    201e:	400217b7          	lui	a5,0x40021
    2022:	0007a223          	sw	zero,4(a5) # 40021004 <_eusrstack+0x2001c004>
    2026:	e000f737          	lui	a4,0xe000f
    202a:	4695                	li	a3,5
    202c:	c314                	sw	a3,0(a4)
    202e:	4771                	li	a4,28
    2030:	cf98                	sw	a4,24(a5)
    2032:	30200073          	mret
    2036:	4310                	lw	a2,0(a4)
    2038:	0711                	add	a4,a4,4 # e000f004 <_eusrstack+0xc000a004>
    203a:	c390                	sw	a2,0(a5)
    203c:	0791                	add	a5,a5,4
    203e:	b7d1                	j	2002 <reset_handler+0x4e>
    2040:	0007a023          	sw	zero,0(a5)
    2044:	0791                	add	a5,a5,4
    2046:	b7f1                	j	2012 <reset_handler+0x5e>
    2048:	01a6                	sll	gp,gp,0x9
    204a:	0000                	unimp
    204c:	0180                	add	s0,sp,192
    204e:	0000                	unimp
    2050:	019e                	sll	gp,gp,0x7
    2052:	0000                	unimp
    2054:	0176                	sll	sp,sp,0x1d
    2056:	0000                	unimp
    2058:	0192                	sll	gp,gp,0x4
    205a:	0000                	unimp
    205c:	018a                	sll	gp,gp,0x2
    205e:	0000                	unimp
    2060:	0264                	add	s1,sp,268
    2062:	0000                	unimp
    2064:	026c                	add	a1,sp,268
    2066:	0000                	unimp
    2068:	0332                	sll	t1,t1,0xc
    206a:	0000                	unimp
    206c:	0332                	sll	t1,t1,0xc
    206e:	0000                	unimp
    2070:	028c                	add	a1,sp,320
    2072:	0000                	unimp
    2074:	0332                	sll	t1,t1,0xc
    2076:	0000                	unimp
    2078:	0332                	sll	t1,t1,0xc
    207a:	0000                	unimp
    207c:	0332                	sll	t1,t1,0xc
    207e:	0000                	unimp
    2080:	0332                	sll	t1,t1,0xc
    2082:	0000                	unimp
    2084:	0332                	sll	t1,t1,0xc
    2086:	0000                	unimp
    2088:	0332                	sll	t1,t1,0xc
    208a:	0000                	unimp
    208c:	0332                	sll	t1,t1,0xc
    208e:	0000                	unimp
    2090:	0296                	sll	t0,t0,0x5
    2092:	0000                	unimp
    2094:	02c2                	sll	t0,t0,0x10
    2096:	0000                	unimp
    2098:	02d4                	add	a3,sp,324
    209a:	0000                	unimp
    209c:	02f0                	add	a2,sp,332
    209e:	0000                	unimp
    20a0:	0332                	sll	t1,t1,0xc
    20a2:	0000                	unimp
    20a4:	0332                	sll	t1,t1,0xc
    20a6:	0000                	unimp
    20a8:	0332                	sll	t1,t1,0xc
    20aa:	0000                	unimp
    20ac:	0332                	sll	t1,t1,0xc
    20ae:	0000                	unimp
    20b0:	023e                	sll	tp,tp,0xf
    20b2:	0000                	unimp
    20b4:	0272                	sll	tp,tp,0x1c
    20b6:	0000                	unimp
    20b8:	494c                	lw	a1,20(a0)
    20ba:	454e                	lw	a0,208(sp)
    20bc:	003a                	c.slli	zero,0xe
    20be:	0000                	unimp
    20c0:	4f59                	li	t5,22
    20c2:	2055                	jal	2166 <reset_handler+0x1b2>
    20c4:	5954                	lw	a3,52(a0)
    20c6:	4550                	lw	a2,12(a0)
    20c8:	203a                	.2byte	0x203a
    20ca:	0000                	unimp
    20cc:	0c98                	add	a4,sp,592
    20ce:	0000                	unimp
    20d0:	0ce0                	add	s0,sp,604
    20d2:	0000                	unimp
    20d4:	0cac                	add	a1,sp,600
    20d6:	0000                	unimp
    20d8:	0ce6                	sll	s9,s9,0x19
    20da:	0000                	unimp
    20dc:	0dca                	sll	s11,s11,0x12
    20de:	0000                	unimp
    20e0:	0ce0                	add	s0,sp,604
    20e2:	0000                	unimp
    20e4:	0ce0                	add	s0,sp,604
    20e6:	0000                	unimp
    20e8:	0ce0                	add	s0,sp,604
    20ea:	0000                	unimp
    20ec:	0eaa                	sll	t4,t4,0xa
    20ee:	0000                	unimp
    20f0:	0ec0                	add	s0,sp,852
    20f2:	0000                	unimp
    20f4:	002a                	c.slli	zero,0xa
    20f6:	0000                	unimp
    20f8:	2840                	.2byte	0x2840
    20fa:	0000                	unimp
    20fc:	3a29                	jal	1a16 <main+0x138>
    20fe:	0000                	unimp
    2100:	12b4                	add	a3,sp,360
    2102:	0000                	unimp
    2104:	12f4                	add	a3,sp,364
    2106:	0000                	unimp
    2108:	135c                	add	a5,sp,420
    210a:	0000                	unimp
    210c:	139e                	sll	t2,t2,0x27
    210e:	0000                	unimp
    2110:	17ba                	sll	a5,a5,0x2e
    2112:	0000                	unimp
    2114:	17ba                	sll	a5,a5,0x2e
    2116:	0000                	unimp
    2118:	1488                	add	a0,sp,608
    211a:	0000                	unimp
    211c:	1546                	sll	a0,a0,0x31
    211e:	0000                	unimp
    2120:	155e                	sll	a0,a0,0x37
    2122:	0000                	unimp
    2124:	127e                	sll	tp,tp,0x3f
    2126:	0000                	unimp
    2128:	17be                	sll	a5,a5,0x2f
    212a:	0000                	unimp
    212c:	170a                	sll	a4,a4,0x22
    212e:	0000                	unimp
    2130:	15a0                	add	s0,sp,744
    2132:	0000                	unimp
    2134:	170a                	sll	a4,a4,0x22
    2136:	0000                	unimp
    2138:	15c6                	sll	a1,a1,0x31
    213a:	0000                	unimp
    213c:	16ec                	add	a1,sp,876
    213e:	0000                	unimp
    2140:	17ba                	sll	a5,a5,0x2e
    2142:	0000                	unimp
    2144:	18d2                	sll	a7,a7,0x34
    2146:	0000                	unimp
    2148:	17ba                	sll	a5,a5,0x2e
    214a:	0000                	unimp
    214c:	17ba                	sll	a5,a5,0x2e
    214e:	0000                	unimp
    2150:	17ba                	sll	a5,a5,0x2e
    2152:	0000                	unimp
    2154:	17ba                	sll	a5,a5,0x2e
    2156:	0000                	unimp
    2158:	17ba                	sll	a5,a5,0x2e
    215a:	0000                	unimp
    215c:	17ba                	sll	a5,a5,0x2e
    215e:	0000                	unimp
    2160:	17ba                	sll	a5,a5,0x2e
    2162:	0000                	unimp
    2164:	17ba                	sll	a5,a5,0x2e
    2166:	0000                	unimp
    2168:	17ba                	sll	a5,a5,0x2e
    216a:	0000                	unimp
    216c:	17ba                	sll	a5,a5,0x2e
    216e:	0000                	unimp
    2170:	17ba                	sll	a5,a5,0x2e
    2172:	0000                	unimp
    2174:	17ba                	sll	a5,a5,0x2e
    2176:	0000                	unimp
    2178:	1594                	add	a3,sp,736
    217a:	0000                	unimp
    217c:	17ba                	sll	a5,a5,0x2e
    217e:	0000                	unimp
    2180:	17ba                	sll	a5,a5,0x2e
    2182:	0000                	unimp
    2184:	17ba                	sll	a5,a5,0x2e
    2186:	0000                	unimp
    2188:	18da                	sll	a7,a7,0x36
    218a:	0000                	unimp
    218c:	18da                	sll	a7,a7,0x36
    218e:	0000                	unimp
    2190:	18da                	sll	a7,a7,0x36
    2192:	0000                	unimp
    2194:	17ba                	sll	a5,a5,0x2e
    2196:	0000                	unimp
    2198:	17ba                	sll	a5,a5,0x2e
    219a:	0000                	unimp
    219c:	1588                	add	a0,sp,736
    219e:	0000                	unimp
    21a0:	4f54                	lw	a3,28(a4)
    21a2:	4f59                	li	t5,22
    21a4:	4b494853          	.4byte	0x4b494853
    21a8:	2049                	jal	222a <main.c.237c0f10+0x47>
    21aa:	4954                	lw	a3,20(a0)
    21ac:	594e                	lw	s2,240(sp)
    21ae:	4220                	lw	s0,64(a2)
    21b0:	5341                	li	t1,-16
    21b2:	4349                	li	t1,18
    21b4:	0000                	unimp
    21b6:	0000                	unimp
    21b8:	3058                	.2byte	0x3058
    21ba:	66203533          	.4byte	0x66203533
    21be:	6e75                	lui	t3,0x1d
    21c0:	0000                	unimp
    21c2:	0000                	unimp
    21c4:	4520                	lw	s0,72(a0)
    21c6:	4944                	lw	s1,20(a0)
    21c8:	4954                	lw	a3,20(a0)
    21ca:	00004e4f          	.4byte	0x4e4f
    21ce:	0000                	unimp
    21d0:	00004b4f          	.4byte	0x4b4f
    21d4:	6544                	.2byte	0x6544
    21d6:	6976                	.2byte	0x6976
    21d8:	6e6f6973          	csrrs	s2,0x6e6,30
    21dc:	6220                	.2byte	0x6220
    21de:	2079                	jal	226c <main.c.237c0f10+0x89>
    21e0:	657a                	.2byte	0x657a
    21e2:	6f72                	.2byte	0x6f72
    21e4:	0000                	unimp
    21e6:	0000                	unimp
    21e8:	7265764f          	.4byte	0x7265764f
    21ec:	6c66                	.2byte	0x6c66
    21ee:	0000776f          	jal	a4,91ee <usbpd_sink.c.eec41fa6+0x6410>
    21f2:	0000                	unimp
    21f4:	73627553          	.4byte	0x73627553
    21f8:	70697263          	bgeu	s2,t1,28fc <system.c.f15f8d88+0x2b3>
    21fc:	2074                	.2byte	0x2074
    21fe:	2074756f          	jal	a0,49c04 <usbpd_sink.c.eec41fa6+0x46e26>
    2202:	7220666f          	jal	a2,8924 <usbpd_sink.c.eec41fa6+0x5b46>
    2206:	6e61                	lui	t3,0x18
    2208:	00006567          	.4byte	0x6567
    220c:	6349                	lui	t1,0x12
    220e:	2065646f          	jal	s0,58414 <usbpd_sink.c.eec41fa6+0x55636>
    2212:	7562                	.2byte	0x7562
    2214:	6666                	.2byte	0x6666
    2216:	7265                	lui	tp,0xffff9
    2218:	6620                	.2byte	0x6620
    221a:	6c75                	lui	s8,0x1d
    221c:	006c                	add	a1,sp,12
    221e:	0000                	unimp
    2220:	694c                	.2byte	0x694c
    2222:	66207473          	csrrc	s0,0x662,0
    2226:	6c75                	lui	s8,0x1d
    2228:	006c                	add	a1,sp,12
    222a:	0000                	unimp
    222c:	55534f47          	.4byte	0x55534f47
    2230:	2042                	.2byte	0x2042
    2232:	6f74                	.2byte	0x6f74
    2234:	616d206f          	j	d484a <usbpd_sink.c.eec41fa6+0xd1a6c>
    2238:	796e                	.2byte	0x796e
    223a:	6e20                	.2byte	0x6e20
    223c:	7365                	lui	t1,0xffff9
    223e:	6574                	.2byte	0x6574
    2240:	0064                	add	s1,sp,12
    2242:	0000                	unimp
    2244:	4552                	lw	a0,20(sp)
    2246:	5554                	lw	a3,44(a0)
    2248:	4e52                	lw	t3,20(sp)
    224a:	7320                	.2byte	0x7320
    224c:	6174                	.2byte	0x6174
    224e:	75206b63          	bltu	zero,s2,29a4 <system.c.f15f8d88+0x35b>
    2252:	646e                	.2byte	0x646e
    2254:	7265                	lui	tp,0xffff9
    2256:	6c66                	.2byte	0x6c66
    2258:	0000776f          	jal	a4,9258 <usbpd_sink.c.eec41fa6+0x647a>
    225c:	4f46                	lw	t5,80(sp)
    225e:	2052                	.2byte	0x2052
    2260:	6f74                	.2byte	0x6f74
    2262:	616d206f          	j	d4878 <usbpd_sink.c.eec41fa6+0xd1a9a>
    2266:	796e                	.2byte	0x796e
    2268:	6e20                	.2byte	0x6e20
    226a:	7365                	lui	t1,0xffff9
    226c:	6574                	.2byte	0x6574
    226e:	0064                	add	s1,sp,12
    2270:	454e                	lw	a0,208(sp)
    2272:	5458                	lw	a4,44(s0)
    2274:	7720                	.2byte	0x7720
    2276:	7469                	lui	s0,0xffffa
    2278:	6f68                	.2byte	0x6f68
    227a:	7475                	lui	s0,0xffffd
    227c:	4620                	lw	s0,72(a2)
    227e:	0000524f          	.4byte	0x524f
    2282:	0000                	unimp
    2284:	454e                	lw	a0,208(sp)
    2286:	5458                	lw	a4,44(s0)
    2288:	7720                	.2byte	0x7720
    228a:	7469                	lui	s0,0xffffa
    228c:	6f68                	.2byte	0x6f68
    228e:	7475                	lui	s0,0xffffd
    2290:	6320                	.2byte	0x6320
    2292:	746e756f          	jal	a0,e99d8 <usbpd_sink.c.eec41fa6+0xe6bfa>
    2296:	7265                	lui	tp,0xffff9
    2298:	0000                	unimp
    229a:	0000                	unimp
    229c:	454e                	lw	a0,208(sp)
    229e:	5458                	lw	a4,44(s0)
    22a0:	6d20                	.2byte	0x6d20
    22a2:	7369                	lui	t1,0xffffa
    22a4:	616d                	add	sp,sp,240
    22a6:	6374                	.2byte	0x6374
    22a8:	2068                	.2byte	0x2068
    22aa:	4f46                	lw	t5,80(sp)
    22ac:	0052                	c.slli	zero,0x14
    22ae:	0000                	unimp
    22b0:	4f46                	lw	t5,80(sp)
    22b2:	2052                	.2byte	0x2052
    22b4:	68746977          	.4byte	0x68746977
    22b8:	2074756f          	jal	a0,49cbe <usbpd_sink.c.eec41fa6+0x46ee0>
    22bc:	6176                	.2byte	0x6176
    22be:	6972                	.2byte	0x6972
    22c0:	6261                	lui	tp,0x18
    22c2:	656c                	.2byte	0x656c
    22c4:	0000                	unimp
    22c6:	0000                	unimp
    22c8:	4f46                	lw	t5,80(sp)
    22ca:	2052                	.2byte	0x2052
    22cc:	68746977          	.4byte	0x68746977
    22d0:	2074756f          	jal	a0,49cd6 <usbpd_sink.c.eec41fa6+0x46ef8>
    22d4:	4f54                	lw	a3,28(a4)
    22d6:	0000                	unimp
    22d8:	454c                	lw	a1,12(a0)
    22da:	2054                	.2byte	0x2054
    22dc:	68746977          	.4byte	0x68746977
    22e0:	2074756f          	jal	a0,49ce6 <usbpd_sink.c.eec41fa6+0x46f08>
    22e4:	6176                	.2byte	0x6176
    22e6:	6972                	.2byte	0x6972
    22e8:	6261                	lui	tp,0x18
    22ea:	656c                	.2byte	0x656c
    22ec:	0000                	unimp
    22ee:	0000                	unimp
    22f0:	4649                	li	a2,18
    22f2:	7720                	.2byte	0x7720
    22f4:	7469                	lui	s0,0xffffa
    22f6:	6f68                	.2byte	0x6f68
    22f8:	7475                	lui	s0,0xffffd
    22fa:	6320                	.2byte	0x6320
    22fc:	69646e6f          	jal	t3,48992 <usbpd_sink.c.eec41fa6+0x45bb4>
    2300:	6974                	.2byte	0x6974
    2302:	00006e6f          	jal	t3,8302 <usbpd_sink.c.eec41fa6+0x5524>
    2306:	0000                	unimp
    2308:	6e55                	lui	t3,0x15
    230a:	6564                	.2byte	0x6564
    230c:	6966                	.2byte	0x6966
    230e:	656e                	.2byte	0x656e
    2310:	2064                	.2byte	0x2064
    2312:	696c                	.2byte	0x696c
    2314:	656e                	.2byte	0x656e
    2316:	6e20                	.2byte	0x6e20
    2318:	6d75                	lui	s10,0x1d
    231a:	6562                	.2byte	0x6562
    231c:	0072                	c.slli	zero,0x1c
    231e:	0000                	unimp
    2320:	20272827          	.4byte	0x20272827
    2324:	2720726f          	jal	tp,9596 <usbpd_sink.c.eec41fa6+0x67b8>
    2328:	2729                	jal	2a32 <system.c.f15f8d88+0x3e9>
    232a:	6520                	.2byte	0x6520
    232c:	7078                	.2byte	0x7078
    232e:	6365                	lui	t1,0x19
    2330:	6574                	.2byte	0x6574
    2332:	0064                	add	s1,sp,12
    2334:	20273d27          	.4byte	0x20273d27
    2338:	7865                	lui	a6,0xffff9
    233a:	6570                	.2byte	0x6570
    233c:	64657463          	bgeu	a0,t1,2984 <system.c.f15f8d88+0x33b>
    2340:	0000                	unimp
    2342:	0000                	unimp
    2344:	6c49                	lui	s8,0x12
    2346:	656c                	.2byte	0x656c
    2348:	206c6167          	.4byte	0x206c6167
    234c:	6d6d6f63          	bltu	s10,s6,2a2a <system.c.f15f8d88+0x3e1>
    2350:	6e61                	lui	t3,0x18
    2352:	0064                	add	s1,sp,12
    2354:	746e7953          	.4byte	0x746e7953
    2358:	7861                	lui	a6,0xffff8
    235a:	6520                	.2byte	0x6520
    235c:	7272                	.2byte	0x7272
    235e:	0000726f          	jal	tp,935e <usbpd_sink.c.eec41fa6+0x6580>
    2362:	0000                	unimp
    2364:	6e49                	lui	t3,0x12
    2366:	6574                	.2byte	0x6574
    2368:	6e72                	.2byte	0x6e72
    236a:	6c61                	lui	s8,0x18
    236c:	6520                	.2byte	0x6520
    236e:	7272                	.2byte	0x7272
    2370:	0000726f          	jal	tp,9370 <usbpd_sink.c.eec41fa6+0x6592>
    2374:	6241                	lui	tp,0x10
    2376:	2074726f          	jal	tp,49d7c <usbpd_sink.c.eec41fa6+0x46f9e>
    237a:	7962                	.2byte	0x7962
    237c:	5b20                	lw	s0,112(a4)
    237e:	5345                	li	t1,-15
    2380:	00005d43          	.4byte	0x5d43
    2384:	5050                	lw	a2,36(s0)
    2386:	72452053          	.4byte	0x72452053
    238a:	6f72                	.2byte	0x6f72
    238c:	0072                	c.slli	zero,0x1c
    238e:	0000                	unimp
    2390:	4f544f47          	.4byte	0x4f544f47
    2394:	0000                	unimp
    2396:	0000                	unimp
    2398:	55534f47          	.4byte	0x55534f47
    239c:	0042                	c.slli	zero,0x10
    239e:	0000                	unimp
    23a0:	4552                	lw	a0,20(sp)
    23a2:	5554                	lw	a3,44(a0)
    23a4:	4e52                	lw	t3,20(sp)
    23a6:	0000                	unimp
    23a8:	4f46                	lw	t5,80(sp)
    23aa:	0052                	c.slli	zero,0x14
    23ac:	50455453          	.4byte	0x50455453
    23b0:	0000                	unimp
    23b2:	0000                	unimp
    23b4:	454e                	lw	a0,208(sp)
    23b6:	5458                	lw	a4,44(s0)
    23b8:	0000                	unimp
    23ba:	0000                	unimp
    23bc:	4649                	li	a2,18
    23be:	0000                	unimp
    23c0:	4552                	lw	a0,20(sp)
    23c2:	004d                	c.nop	19
    23c4:	504f5453          	.4byte	0x504f5453
    23c8:	0000                	unimp
    23ca:	0000                	unimp
    23cc:	4e49                	li	t3,18
    23ce:	5550                	lw	a2,44(a0)
    23d0:	0054                	add	a3,sp,4
    23d2:	0000                	unimp
    23d4:	5250                	lw	a2,36(a2)
    23d6:	4e49                	li	t3,18
    23d8:	0054                	add	a3,sp,4
    23da:	0000                	unimp
    23dc:	454c                	lw	a1,12(a0)
    23de:	0054                	add	a3,sp,4
    23e0:	0000003f 00535050 	.8byte	0x5350500000003f
    23e8:	454c                	lw	a1,12(a0)
    23ea:	0044                	add	s1,sp,4
    23ec:	002c                	add	a1,sp,8
    23ee:	0000                	unimp
    23f0:	0000003b          	.4byte	0x3b
    23f4:	002d                	c.nop	11
    23f6:	0000                	unimp
    23f8:	0000002b          	.4byte	0x2b
    23fc:	0000002f          	.4byte	0x2f
    2400:	0028                	add	a0,sp,8
    2402:	0000                	unimp
    2404:	0029                	c.nop	10
    2406:	0000                	unimp
    2408:	3d3e                	.2byte	0x3d3e
    240a:	0000                	unimp
    240c:	00000023          	sb	zero,0(zero) # 0 <jump_reset>
    2410:	003e                	c.slli	zero,0xf
    2412:	0000                	unimp
    2414:	003d                	c.nop	15
    2416:	0000                	unimp
    2418:	3d3c                	.2byte	0x3d3c
    241a:	0000                	unimp
    241c:	003c                	add	a5,sp,8
    241e:	0000                	unimp
    2420:	0040                	add	s0,sp,4
    2422:	0000                	unimp
    2424:	4e52                	lw	t3,20(sp)
    2426:	0044                	add	s1,sp,4
    2428:	4241                	li	tp,16
    242a:	49530053          	.4byte	0x49530053
    242e:	455a                	lw	a0,148(sp)
    2430:	0000                	unimp
    2432:	0000                	unimp
    2434:	494c                	lw	a1,20(a0)
    2436:	00005453          	.4byte	0x5453
    243a:	0000                	unimp
    243c:	5552                	lw	a0,52(sp)
    243e:	004e                	c.slli	zero,0x13
    2440:	454e                	lw	a0,208(sp)
    2442:	59530057          	.4byte	0x59530057
    2446:	4d455453          	.4byte	0x4d455453
	...

0000244c <errmsg>:
    244c:	000021d0 000021d4 000021e8 000021f4     .!...!...!...!..
    245c:	0000220c 00002220 0000222c 00002244     .".. "..,"..D"..
    246c:	0000225c 00002270 00002284 0000229c     \"..p"..."..."..
    247c:	000022b0 000022c8 000022d8 000022f0     ."..."..."..."..
    248c:	00002308 00002320 00002334 00002344     .#.. #..4#..D#..
    249c:	00002354 00002364 00002374 00002384     T#..d#..t#...#..

000024ac <i_nsb>:
    24ac:	15141312 19181716 1d1c1b1a 00291110     ..............).

000024bc <i_nsa>:
    24bc:	12100902 16151413 1a191817 1e1d1c1b     ................
    24cc:	0021201f                                . !.

000024d0 <kwtbl>:
    24d0:	00002390 00002398 000023a0 000023a8     .#...#...#...#..
    24e0:	000022d4 000023ac 000023b4 000023bc     ."...#...#...#..
    24f0:	000023c0 000023c4 000023cc 000023d4     .#...#...#...#..
    2500:	000023dc 000023e0 000023e4 000023e8     .#...#...#...#..
    2510:	000023ec 000023f0 000023f4 000023f8     .#...#...#...#..
    2520:	000020f4 000023fc 00002400 00002404     . ...#...$...$..
    2530:	00002408 0000240c 00002410 00002414     .$...$...$...$..
    2540:	00002418 0000241c 00002420 00002424     .$...$.. $..$$..
    2550:	00002428 0000242c 00002434 0000243c     ($..,$..4$..<$..
    2560:	00002440 00002444                       @$..D$..
