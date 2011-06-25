
bootloader.elf:     file format elf32-zpu

Disassembly of section .fixed_vectors:

00000000 <_start>:
   0:	0b          	nop
   1:	0b          	nop
   2:	0b          	nop
   3:	98          	im 24
   4:	ea          	im -22
   5:	04          	poppc
	...

00000020 <_zpu_interrupt_vector>:
  20:	0b          	nop
  21:	0b          	nop
  22:	0b          	nop
  23:	98          	im 24
  24:	cb          	im -53
  25:	04          	poppc
	...

00000040 <_loadh>:
  40:	71          	loadsp 4
  41:	fd          	im -3
  42:	06          	and
  43:	08          	load
  44:	72          	loadsp 8
  45:	83          	im 3
  46:	06          	and
  47:	09          	not
  48:	81          	im 1
  49:	05          	add
  4a:	82          	im 2
  4b:	05          	add
  4c:	83          	im 3
  4d:	2b          	ashiftleft
  4e:	2a          	lshiftright
  4f:	83          	im 3
  50:	ff          	im -1
  51:	ff          	im -1
  52:	06          	and
  53:	52          	storesp 8
  54:	04          	poppc
	...

00000060 <_storeh>:
  60:	71          	loadsp 4
  61:	fd          	im -3
  62:	06          	and
  63:	08          	load
  64:	83          	im 3
  65:	ff          	im -1
  66:	ff          	im -1
  67:	73          	loadsp 12
  68:	83          	im 3
  69:	06          	and
  6a:	09          	not
  6b:	81          	im 1
  6c:	05          	add
  6d:	82          	im 2
  6e:	05          	add
  6f:	83          	im 3
  70:	2b          	ashiftleft
  71:	2b          	ashiftleft
  72:	09          	not
  73:	06          	and
  74:	73          	loadsp 12
  75:	83          	im 3
  76:	ff          	im -1
  77:	ff          	im -1
  78:	0b          	nop
  79:	0b          	nop
  7a:	0b          	nop
  7b:	0b          	nop
  7c:	83          	im 3
  7d:	a7          	im 39
  7e:	04          	poppc
	...

00000080 <_lessthan>:
  80:	72          	loadsp 8
  81:	09          	not
  82:	81          	im 1
  83:	05          	add
  84:	72          	loadsp 8
  85:	05          	add
  86:	73          	loadsp 12
  87:	73          	loadsp 12
  88:	09          	not
  89:	06          	and
  8a:	09          	not
  8b:	06          	and
  8c:	73          	loadsp 12
  8d:	09          	not
  8e:	73          	loadsp 12
  8f:	06          	and
  90:	07          	or
  91:	0a          	flip
  92:	81          	im 1
  93:	06          	and
  94:	53          	storesp 12
  95:	51          	storesp 4
  96:	04          	poppc
	...

000000a0 <_lessthanorequal>:
  a0:	72          	loadsp 8
  a1:	72          	loadsp 8
  a2:	24          	lessthan
  a3:	73          	loadsp 12
  a4:	73          	loadsp 12
  a5:	2e          	eq
  a6:	07          	or
  a7:	53          	storesp 12
  a8:	51          	storesp 4
  a9:	04          	poppc
	...

000000c0 <_ulessthan>:
  c0:	71          	loadsp 4
  c1:	73          	loadsp 12
  c2:	71          	loadsp 4
  c3:	09          	not
  c4:	71          	loadsp 4
  c5:	06          	and
  c6:	81          	im 1
  c7:	06          	and
  c8:	30          	neg
  c9:	72          	loadsp 8
  ca:	0a          	flip
  cb:	10          	addsp 0
  cc:	0a          	flip
  cd:	72          	loadsp 8
  ce:	0a          	flip
  cf:	10          	addsp 0
  d0:	0a          	flip
  d1:	31          	sub
  d2:	05          	add
  d3:	0a          	flip
  d4:	81          	im 1
  d5:	06          	and
  d6:	51          	storesp 4
  d7:	51          	storesp 4
  d8:	53          	storesp 12
  d9:	51          	storesp 4
  da:	04          	poppc
  db:	00          	breakpoint
  dc:	00          	breakpoint
  dd:	00          	breakpoint
	...

000000e0 <_ulessthanorequal>:
  e0:	72          	loadsp 8
  e1:	72          	loadsp 8
  e2:	26          	ulessthan
  e3:	73          	loadsp 12
  e4:	73          	loadsp 12
  e5:	2e          	eq
  e6:	07          	or
  e7:	53          	storesp 12
  e8:	51          	storesp 4
  e9:	04          	poppc
	...

00000100 <_swap>:
	...

00000120 <_slowmult>:
 120:	0b          	nop
 121:	0b          	nop
 122:	0b          	nop
 123:	88          	im 8
 124:	c3          	im -61
 125:	04          	poppc
	...

00000140 <_lshiftright>:
 140:	72          	loadsp 8
 141:	0a          	flip
 142:	72          	loadsp 8
 143:	2b          	ashiftleft
 144:	0a          	flip
 145:	53          	storesp 12
 146:	51          	storesp 4
 147:	04          	poppc
	...

00000160 <_ashiftleft>:
 160:	72          	loadsp 8
 161:	72          	loadsp 8
 162:	9f          	im 31
 163:	06          	and
 164:	09          	not
 165:	81          	im 1
 166:	05          	add
 167:	0b          	nop
 168:	0b          	nop
 169:	0b          	nop
 16a:	88          	im 8
 16b:	a6          	im 38
 16c:	05          	add
 16d:	04          	poppc
	...

00000180 <_ashiftright>:
 180:	72          	loadsp 8
 181:	72          	loadsp 8
 182:	2a          	lshiftright
 183:	ff          	im -1
 184:	73          	loadsp 12
 185:	9f          	im 31
 186:	06          	and
 187:	2a          	lshiftright
 188:	09          	not
 189:	74          	loadsp 16
 18a:	09          	not
 18b:	0a          	flip
 18c:	81          	im 1
 18d:	06          	and
 18e:	ff          	im -1
 18f:	05          	add
 190:	06          	and
 191:	07          	or
 192:	53          	storesp 12
 193:	51          	storesp 4
 194:	04          	poppc
	...

000001a0 <_call>:
 1a0:	71          	loadsp 4
 1a1:	71          	loadsp 4
 1a2:	53          	storesp 12
 1a3:	51          	storesp 4
 1a4:	02          	pushsp
 1a5:	0d          	popsp
 1a6:	04          	poppc

000001a7 <_storehtail>:
 1a7:	06          	and
 1a8:	73          	loadsp 12
 1a9:	83          	im 3
 1aa:	06          	and
 1ab:	09          	not
 1ac:	81          	im 1
 1ad:	05          	add
 1ae:	82          	im 2
 1af:	05          	add
 1b0:	83          	im 3
 1b1:	2b          	ashiftleft
 1b2:	0b          	nop
 1b3:	2b          	ashiftleft
 1b4:	07          	or
 1b5:	72          	loadsp 8
 1b6:	fc          	im -4
 1b7:	06          	and
 1b8:	0c          	store
 1b9:	51          	storesp 4
 1ba:	51          	storesp 4
 1bb:	04          	poppc
 1bc:	00          	breakpoint
 1bd:	00          	breakpoint
	...

000001c0 <_eq>:
 1c0:	72          	loadsp 8
 1c1:	09          	not
 1c2:	81          	im 1
 1c3:	05          	add
 1c4:	72          	loadsp 8
 1c5:	05          	add
 1c6:	09          	not
 1c7:	70          	loadsp 0
 1c8:	81          	im 1
 1c9:	05          	add
 1ca:	09          	not
 1cb:	06          	and
 1cc:	0a          	flip
 1cd:	81          	im 1
 1ce:	06          	and
 1cf:	53          	storesp 12
 1d0:	51          	storesp 4
 1d1:	04          	poppc
	...

000001e0 <_neq>:
 1e0:	72          	loadsp 8
 1e1:	09          	not
 1e2:	81          	im 1
 1e3:	05          	add
 1e4:	72          	loadsp 8
 1e5:	05          	add
 1e6:	09          	not
 1e7:	70          	loadsp 0
 1e8:	81          	im 1
 1e9:	05          	add
 1ea:	09          	not
 1eb:	06          	and
 1ec:	0a          	flip
 1ed:	09          	not
 1ee:	81          	im 1
 1ef:	06          	and
 1f0:	53          	storesp 12
 1f1:	51          	storesp 4
 1f2:	04          	poppc
	...

00000200 <_neg>:
 200:	71          	loadsp 4
 201:	09          	not
 202:	81          	im 1
 203:	05          	add
 204:	52          	storesp 8
 205:	04          	poppc
	...

00000220 <_sub>:
 220:	72          	loadsp 8
 221:	72          	loadsp 8
 222:	09          	not
 223:	81          	im 1
 224:	05          	add
 225:	05          	add
 226:	53          	storesp 12
 227:	51          	storesp 4
 228:	04          	poppc
	...

00000240 <_xor>:
 240:	72          	loadsp 8
 241:	09          	not
 242:	72          	loadsp 8
 243:	06          	and
 244:	73          	loadsp 12
 245:	73          	loadsp 12
 246:	09          	not
 247:	06          	and
 248:	07          	or
 249:	53          	storesp 12
 24a:	51          	storesp 4
 24b:	04          	poppc
	...

00000260 <_loadb>:
 260:	71          	loadsp 4
 261:	fc          	im -4
 262:	06          	and
 263:	08          	load
 264:	72          	loadsp 8
 265:	83          	im 3
 266:	06          	and
 267:	09          	not
 268:	81          	im 1
 269:	05          	add
 26a:	83          	im 3
 26b:	05          	add
 26c:	10          	addsp 0
 26d:	10          	addsp 0
 26e:	10          	addsp 0
 26f:	2a          	lshiftright
 270:	81          	im 1
 271:	ff          	im -1
 272:	06          	and
 273:	52          	storesp 8
 274:	04          	poppc
	...

00000280 <_storeb>:
 280:	71          	loadsp 4
 281:	fc          	im -4
 282:	06          	and
 283:	08          	load
 284:	0b          	nop
 285:	0b          	nop
 286:	0b          	nop
 287:	9d          	im 29
 288:	a0          	im 32
 289:	73          	loadsp 12
 28a:	83          	im 3
 28b:	06          	and
 28c:	10          	addsp 0
 28d:	10          	addsp 0
 28e:	05          	add
 28f:	08          	load
 290:	06          	and
 291:	0b          	nop
 292:	0b          	nop
 293:	0b          	nop
 294:	88          	im 8
 295:	a9          	im 41
 296:	04          	poppc
	...

000002a0 <_div>:
 2a0:	0b          	nop
 2a1:	0b          	nop
 2a2:	0b          	nop
 2a3:	88          	im 8
 2a4:	f7          	im -9
 2a5:	04          	poppc
	...

000002c0 <_mod>:
 2c0:	0b          	nop
 2c1:	0b          	nop
 2c2:	0b          	nop
 2c3:	88          	im 8
 2c4:	df          	im -33
 2c5:	04          	poppc
	...

000002e0 <_eqbranch>:
 2e0:	72          	loadsp 8
 2e1:	09          	not
 2e2:	70          	loadsp 0
 2e3:	81          	im 1
 2e4:	05          	add
 2e5:	09          	not
 2e6:	06          	and
 2e7:	0a          	flip
 2e8:	81          	im 1
 2e9:	06          	and
 2ea:	ff          	im -1
 2eb:	05          	add
 2ec:	70          	loadsp 0
 2ed:	54          	storesp 16
 2ee:	71          	loadsp 4
 2ef:	06          	and
 2f0:	73          	loadsp 12
 2f1:	09          	not
 2f2:	72          	loadsp 8
 2f3:	74          	loadsp 16
 2f4:	05          	add
 2f5:	ff          	im -1
 2f6:	05          	add
 2f7:	06          	and
 2f8:	07          	or
 2f9:	51          	storesp 4
 2fa:	51          	storesp 4
 2fb:	51          	storesp 4
 2fc:	04          	poppc
 2fd:	00          	breakpoint
	...

00000300 <_neqbranch>:
 300:	72          	loadsp 8
 301:	09          	not
 302:	70          	loadsp 0
 303:	81          	im 1
 304:	05          	add
 305:	09          	not
 306:	06          	and
 307:	0a          	flip
 308:	09          	not
 309:	81          	im 1
 30a:	06          	and
 30b:	ff          	im -1
 30c:	05          	add
 30d:	70          	loadsp 0
 30e:	54          	storesp 16
 30f:	71          	loadsp 4
 310:	06          	and
 311:	73          	loadsp 12
 312:	09          	not
 313:	72          	loadsp 8
 314:	74          	loadsp 16
 315:	05          	add
 316:	ff          	im -1
 317:	05          	add
 318:	06          	and
 319:	07          	or
 31a:	51          	storesp 4
 31b:	51          	storesp 4
 31c:	51          	storesp 4
 31d:	04          	poppc
	...

00000320 <_poppcrel>:
 320:	05          	add
 321:	ff          	im -1
 322:	05          	add
 323:	04          	poppc
	...

00000340 <_config>:
 340:	81          	im 1
 341:	0b          	nop
 342:	0b          	nop
 343:	0b          	nop
 344:	0b          	nop
 345:	a0          	im 32
 346:	8c          	im 12
 347:	0c          	store
 348:	51          	storesp 4
 349:	04          	poppc
	...

00000360 <_pushpc>:
 360:	71          	loadsp 4
 361:	81          	im 1
 362:	05          	add
 363:	52          	storesp 8
 364:	04          	poppc
	...

00000380 <_syscall_emulate>:
	...

000003a0 <_pushspadd>:
 3a0:	02          	pushsp
 3a1:	84          	im 4
 3a2:	05          	add
 3a3:	72          	loadsp 8
 3a4:	10          	addsp 0
 3a5:	10          	addsp 0
 3a6:	05          	add
 3a7:	52          	storesp 8
 3a8:	04          	poppc
	...

000003c0 <_halfmult>:
	...

000003e0 <_callpcrel>:
 3e0:	71          	loadsp 4
 3e1:	71          	loadsp 4
 3e2:	05          	add
 3e3:	ff          	im -1
 3e4:	05          	add
 3e5:	71          	loadsp 4
 3e6:	53          	storesp 12
 3e7:	51          	storesp 4
 3e8:	02          	pushsp
 3e9:	0d          	popsp
 3ea:	04          	poppc
	...
Disassembly of section .init:

00000400 <_init>:
 400:	81          	im 1
 401:	d4          	im -44
 402:	3f          	callpcrel
 403:	94          	im 20
 404:	ef          	im -17
 405:	3f          	callpcrel
 406:	04          	poppc
Disassembly of section .text:

00000407 <_ashiftleftBegin>:
 407:	10          	addsp 0
 408:	10          	addsp 0
 409:	10          	addsp 0
 40a:	10          	addsp 0
 40b:	10          	addsp 0
 40c:	10          	addsp 0
 40d:	10          	addsp 0
 40e:	10          	addsp 0
 40f:	10          	addsp 0
 410:	10          	addsp 0
 411:	10          	addsp 0
 412:	10          	addsp 0
 413:	10          	addsp 0
 414:	10          	addsp 0
 415:	10          	addsp 0
 416:	10          	addsp 0
 417:	10          	addsp 0
 418:	10          	addsp 0
 419:	10          	addsp 0
 41a:	10          	addsp 0
 41b:	10          	addsp 0
 41c:	10          	addsp 0
 41d:	10          	addsp 0
 41e:	10          	addsp 0
 41f:	10          	addsp 0
 420:	10          	addsp 0
 421:	10          	addsp 0
 422:	10          	addsp 0
 423:	10          	addsp 0
 424:	10          	addsp 0
 425:	10          	addsp 0

00000426 <_ashiftleftEnd>:
 426:	53          	storesp 12
 427:	51          	storesp 4
 428:	04          	poppc

00000429 <_storebtail>:
 429:	73          	loadsp 12
 42a:	81          	im 1
 42b:	ff          	im -1
 42c:	06          	and
 42d:	73          	loadsp 12
 42e:	83          	im 3
 42f:	06          	and
 430:	09          	not
 431:	81          	im 1
 432:	05          	add
 433:	83          	im 3
 434:	05          	add
 435:	10          	addsp 0
 436:	10          	addsp 0
 437:	10          	addsp 0
 438:	2b          	ashiftleft
 439:	07          	or
 43a:	72          	loadsp 8
 43b:	fc          	im -4
 43c:	06          	and
 43d:	0c          	store
 43e:	51          	storesp 4
 43f:	51          	storesp 4
 440:	04          	poppc

00000441 <_syscall>:
 441:	3c          	syscall
 442:	04          	poppc

00000443 <_slowmultImpl>:
 443:	72          	loadsp 8
 444:	72          	loadsp 8
 445:	80          	im 0
 446:	72          	loadsp 8
 447:	81          	im 1
 448:	06          	and
 449:	ff          	im -1
 44a:	05          	add
 44b:	09          	not
 44c:	72          	loadsp 8
 44d:	06          	and
 44e:	05          	add
 44f:	71          	loadsp 4
 450:	10          	addsp 0
 451:	52          	storesp 8
 452:	72          	loadsp 8
 453:	0a          	flip
 454:	10          	addsp 0
 455:	0a          	flip
 456:	53          	storesp 12
 457:	72          	loadsp 8
 458:	ed          	im -19
 459:	38          	neqbranch
 45a:	51          	storesp 4
 45b:	51          	storesp 4
 45c:	53          	storesp 12
 45d:	51          	storesp 4
 45e:	04          	poppc

0000045f <___mod>:
 45f:	88          	im 8
 460:	08          	load
 461:	8c          	im 12
 462:	08          	load
 463:	90          	im 16
 464:	08          	load
 465:	75          	loadsp 20
 466:	75          	loadsp 20
 467:	9a          	im 26
 468:	aa          	im 42
 469:	2d          	call
 46a:	50          	storesp 0
 46b:	50          	storesp 0
 46c:	88          	im 8
 46d:	08          	load
 46e:	56          	storesp 24
 46f:	90          	im 16
 470:	0c          	store
 471:	8c          	im 12
 472:	0c          	store
 473:	88          	im 8
 474:	0c          	store
 475:	51          	storesp 4
 476:	04          	poppc

00000477 <___div>:
 477:	88          	im 8
 478:	08          	load
 479:	8c          	im 12
 47a:	08          	load
 47b:	90          	im 16
 47c:	08          	load
 47d:	75          	loadsp 20
 47e:	75          	loadsp 20
 47f:	98          	im 24
 480:	f8          	im -8
 481:	2d          	call
 482:	50          	storesp 0
 483:	50          	storesp 0
 484:	88          	im 8
 485:	08          	load
 486:	56          	storesp 24
 487:	90          	im 16
 488:	0c          	store
 489:	8c          	im 12
 48a:	0c          	store
 48b:	88          	im 8
 48c:	0c          	store
 48d:	51          	storesp 4
 48e:	04          	poppc
 48f:	88          	im 8
 490:	08          	load
 491:	8c          	im 12
 492:	08          	load
 493:	90          	im 16
 494:	08          	load
 495:	8f          	im 15
 496:	bc          	im 60
 497:	2d          	call
 498:	90          	im 16
 499:	0c          	store
 49a:	8c          	im 12
 49b:	0c          	store
 49c:	88          	im 8
 49d:	0c          	store
 49e:	04          	poppc

0000049f <__do_global_dtors_aux>:
 49f:	ff          	im -1
 4a0:	3d          	pushspadd
 4a1:	0d          	popsp
 4a2:	0b          	nop
 4a3:	0b          	nop
 4a4:	0b          	nop
 4a5:	a0          	im 32
 4a6:	9c          	im 28
 4a7:	33          	loadb
 4a8:	51          	storesp 4
 4a9:	70          	loadsp 0
 4aa:	a6          	im 38
 4ab:	38          	neqbranch
 4ac:	a0          	im 32
 4ad:	98          	im 24
 4ae:	08          	load
 4af:	70          	loadsp 0
 4b0:	08          	load
 4b1:	52          	storesp 8
 4b2:	52          	storesp 8
 4b3:	70          	loadsp 0
 4b4:	80          	im 0
 4b5:	2e          	eq
 4b6:	92          	im 18
 4b7:	38          	neqbranch

000004b8 <.L10>:
 4b8:	84          	im 4
 4b9:	12          	addsp 8
 4ba:	a0          	im 32
 4bb:	98          	im 24
 4bc:	0c          	store
 4bd:	70          	loadsp 0
 4be:	2d          	call
 4bf:	a0          	im 32
 4c0:	98          	im 24
 4c1:	08          	load
 4c2:	70          	loadsp 0
 4c3:	08          	load
 4c4:	52          	storesp 8
 4c5:	52          	storesp 8
 4c6:	70          	loadsp 0
 4c7:	f0          	im -16
 4c8:	38          	neqbranch

000004c9 <.L7>:
 4c9:	81          	im 1
 4ca:	0b          	nop
 4cb:	0b          	nop
 4cc:	0b          	nop
 4cd:	0b          	nop
 4ce:	a0          	im 32
 4cf:	9c          	im 28
 4d0:	34          	storeb

000004d1 <.L1>:
 4d1:	83          	im 3
 4d2:	3d          	pushspadd
 4d3:	0d          	popsp
 4d4:	04          	poppc

000004d5 <call___do_global_dtors_aux>:
 4d5:	04          	poppc

000004d6 <frame_dummy>:
 4d6:	80          	im 0
 4d7:	3d          	pushspadd
 4d8:	0d          	popsp
 4d9:	0b          	nop
 4da:	0b          	nop
 4db:	0b          	nop
 4dc:	9e          	im 30
 4dd:	a0          	im 32
 4de:	08          	load
 4df:	80          	im 0
 4e0:	2e          	eq
 4e1:	8e          	im 14
 4e2:	38          	neqbranch
 4e3:	0b          	nop
 4e4:	0b          	nop
 4e5:	0b          	nop
 4e6:	0b          	nop
 4e7:	80          	im 0
 4e8:	0b          	nop
 4e9:	80          	im 0
 4ea:	2e          	eq
 4eb:	09          	not
 4ec:	81          	im 1
 4ed:	06          	and
 4ee:	85          	im 5
 4ef:	38          	neqbranch

000004f0 <.L12>:
 4f0:	82          	im 2
 4f1:	3d          	pushspadd
 4f2:	0d          	popsp
 4f3:	04          	poppc

000004f4 <.L15>:
 4f4:	0b          	nop
 4f5:	0b          	nop
 4f6:	0b          	nop
 4f7:	9e          	im 30
 4f8:	a0          	im 32
 4f9:	51          	storesp 4
 4fa:	0b          	nop
 4fb:	0b          	nop
 4fc:	0b          	nop
 4fd:	f6          	im -10
 4fe:	81          	im 1
 4ff:	3f          	callpcrel
 500:	82          	im 2
 501:	3d          	pushspadd
 502:	0d          	popsp
 503:	04          	poppc

00000504 <call_frame_dummy>:
 504:	04          	poppc

00000505 <_Z7outbytei>:
 505:	80          	im 0
 506:	3d          	pushspadd
 507:	0d          	popsp

00000508 <.L2>:
 508:	80          	im 0
 509:	c4          	im -60
 50a:	80          	im 0
 50b:	80          	im 0
 50c:	84          	im 4
 50d:	08          	load
 50e:	70          	loadsp 0
 50f:	81          	im 1
 510:	2a          	lshiftright
 511:	70          	loadsp 0
 512:	81          	im 1
 513:	06          	and
 514:	51          	storesp 4
 515:	51          	storesp 4
 516:	51          	storesp 4
 517:	70          	loadsp 0
 518:	ef          	im -17
 519:	38          	neqbranch
 51a:	72          	loadsp 8
 51b:	82          	im 2
 51c:	90          	im 16
 51d:	0a          	flip
 51e:	0c          	store
 51f:	82          	im 2
 520:	3d          	pushspadd
 521:	0d          	popsp
 522:	04          	poppc

00000523 <_Z8sendBytej>:
 523:	fe          	im -2
 524:	3d          	pushspadd
 525:	0d          	popsp
 526:	74          	loadsp 16
 527:	70          	loadsp 0
 528:	80          	im 0
 529:	dc          	im -36
 52a:	80          	im 0
 52b:	80          	im 0
 52c:	88          	im 8
 52d:	0c          	store
 52e:	70          	loadsp 0
 52f:	81          	im 1
 530:	ff          	im -1
 531:	06          	and
 532:	ff          	im -1
 533:	83          	im 3
 534:	11          	addsp 4
 535:	54          	storesp 16
 536:	51          	storesp 4
 537:	53          	storesp 12
 538:	71          	loadsp 4
 539:	81          	im 1
 53a:	26          	ulessthan
 53b:	8d          	im 13
 53c:	38          	neqbranch
 53d:	80          	im 0
 53e:	fd          	im -3
 53f:	51          	storesp 4
 540:	8a          	im 10
 541:	85          	im 5
 542:	2d          	call
 543:	72          	loadsp 8
 544:	a0          	im 32
 545:	32          	xor
 546:	51          	storesp 4
 547:	83          	im 3
 548:	39          	poppcrel

00000549 <.L6>:
 549:	72          	loadsp 8
 54a:	51          	storesp 4

0000054b <.L8>:
 54b:	8a          	im 10
 54c:	85          	im 5
 54d:	2d          	call
 54e:	84          	im 4
 54f:	3d          	pushspadd
 550:	0d          	popsp
 551:	04          	poppc

00000552 <_Z10sendBufferPKhj>:
 552:	fe          	im -2
 553:	3d          	pushspadd
 554:	0d          	popsp
 555:	74          	loadsp 16
 556:	ff          	im -1
 557:	17          	addsp 28
 558:	53          	storesp 12
 559:	53          	storesp 12

0000055a <.L15>:
 55a:	71          	loadsp 4
 55b:	ff          	im -1
 55c:	2e          	eq
 55d:	90          	im 16
 55e:	38          	neqbranch
 55f:	72          	loadsp 8
 560:	70          	loadsp 0
 561:	81          	im 1
 562:	05          	add
 563:	54          	storesp 16
 564:	33          	loadb
 565:	51          	storesp 4
 566:	8a          	im 10
 567:	a3          	im 35
 568:	2d          	call
 569:	ff          	im -1
 56a:	12          	addsp 8
 56b:	52          	storesp 8
 56c:	ed          	im -19
 56d:	39          	poppcrel

0000056e <.L14>:
 56e:	84          	im 4
 56f:	3d          	pushspadd
 570:	0d          	popsp
 571:	04          	poppc

00000572 <_Z11prepareSendv>:
 572:	80          	im 0
 573:	3d          	pushspadd
 574:	0d          	popsp
 575:	83          	im 3
 576:	ff          	im -1
 577:	ff          	im -1
 578:	0b          	nop
 579:	83          	im 3
 57a:	d0          	im -48
 57b:	0a          	flip
 57c:	0c          	store
 57d:	80          	im 0
 57e:	fe          	im -2
 57f:	51          	storesp 4
 580:	8a          	im 10
 581:	85          	im 5
 582:	2d          	call
 583:	82          	im 2
 584:	3d          	pushspadd
 585:	0d          	popsp
 586:	04          	poppc

00000587 <_Z10finishSendv>:
 587:	ff          	im -1
 588:	3d          	pushspadd
 589:	0d          	popsp
 58a:	83          	im 3
 58b:	d0          	im -48
 58c:	0a          	flip
 58d:	08          	load
 58e:	70          	loadsp 0
 58f:	88          	im 8
 590:	2a          	lshiftright
 591:	52          	storesp 8
 592:	52          	storesp 8
 593:	8a          	im 10
 594:	a3          	im 35
 595:	2d          	call
 596:	71          	loadsp 4
 597:	81          	im 1
 598:	ff          	im -1
 599:	06          	and
 59a:	51          	storesp 4
 59b:	8a          	im 10
 59c:	a3          	im 35
 59d:	2d          	call
 59e:	80          	im 0
 59f:	fe          	im -2
 5a0:	51          	storesp 4
 5a1:	8a          	im 10
 5a2:	85          	im 5
 5a3:	2d          	call
 5a4:	83          	im 3
 5a5:	3d          	pushspadd
 5a6:	0d          	popsp
 5a7:	04          	poppc

000005a8 <_Z8spi_copyv>:
 5a8:	81          	im 1
 5a9:	ff          	im -1
 5aa:	f8          	im -8
 5ab:	0d          	popsp
 5ac:	8d          	im 13
 5ad:	bb          	im 59
 5ae:	04          	poppc

000005af <.L19>:
 5af:	ff          	im -1
 5b0:	39          	poppcrel

000005b1 <_Z6inbytev>:
 5b1:	ff          	im -1
 5b2:	3d          	pushspadd
 5b3:	0d          	popsp

000005b4 <.L30>:
 5b4:	80          	im 0
 5b5:	c4          	im -60
 5b6:	80          	im 0
 5b7:	80          	im 0
 5b8:	84          	im 4
 5b9:	08          	load
 5ba:	70          	loadsp 0
 5bb:	81          	im 1
 5bc:	06          	and
 5bd:	51          	storesp 4
 5be:	51          	storesp 4
 5bf:	70          	loadsp 0
 5c0:	9f          	im 31
 5c1:	38          	neqbranch
 5c2:	a2          	im 34
 5c3:	d0          	im -48
 5c4:	08          	load
 5c5:	52          	storesp 8
 5c6:	71          	loadsp 4
 5c7:	ec          	im -20
 5c8:	38          	neqbranch
 5c9:	a2          	im 34
 5ca:	cc          	im -52
 5cb:	08          	load
 5cc:	51          	storesp 4
 5cd:	87          	im 7
 5ce:	e8          	im -24
 5cf:	71          	loadsp 4
 5d0:	27          	ulessthanorequal
 5d1:	e2          	im -30
 5d2:	38          	neqbranch
 5d3:	71          	loadsp 4
 5d4:	80          	im 0
 5d5:	d0          	im -48
 5d6:	0a          	flip
 5d7:	0c          	store
 5d8:	71          	loadsp 4
 5d9:	83          	im 3
 5da:	90          	im 16
 5db:	0a          	flip
 5dc:	0c          	store
 5dd:	8b          	im 11
 5de:	a8          	im 40
 5df:	2d          	call

000005e0 <.L26>:
 5e0:	82          	im 2
 5e1:	90          	im 16
 5e2:	0a          	flip
 5e3:	08          	load
 5e4:	88          	im 8
 5e5:	0c          	store
 5e6:	83          	im 3
 5e7:	3d          	pushspadd
 5e8:	0d          	popsp
 5e9:	04          	poppc

000005ea <_Z11enableTimerv>:
 5ea:	82          	im 2
 5eb:	f6          	im -10
 5ec:	ff          	im -1
 5ed:	0b          	nop
 5ee:	80          	im 0
 5ef:	cc          	im -52
 5f0:	80          	im 0
 5f1:	80          	im 0
 5f2:	88          	im 8
 5f3:	0c          	store
 5f4:	80          	im 0
 5f5:	0b          	nop
 5f6:	80          	im 0
 5f7:	cc          	im -52
 5f8:	80          	im 0
 5f9:	80          	im 0
 5fa:	84          	im 4
 5fb:	0c          	store
 5fc:	9f          	im 31
 5fd:	0b          	nop
 5fe:	83          	im 3
 5ff:	90          	im 16
 600:	0a          	flip
 601:	0c          	store
 602:	04          	poppc

00000603 <_Z11spi_disablev>:
 603:	ff          	im -1
 604:	3d          	pushspadd
 605:	0d          	popsp
 606:	80          	im 0
 607:	c8          	im -56
 608:	80          	im 0
 609:	80          	im 0
 60a:	84          	im 4
 60b:	70          	loadsp 0
 60c:	08          	load
 60d:	70          	loadsp 0
 60e:	82          	im 2
 60f:	80          	im 0
 610:	07          	or
 611:	72          	loadsp 8
 612:	0c          	store
 613:	52          	storesp 8
 614:	52          	storesp 8
 615:	83          	im 3
 616:	3d          	pushspadd
 617:	0d          	popsp
 618:	04          	poppc

00000619 <_Z10spi_enablev>:
 619:	ff          	im -1
 61a:	3d          	pushspadd
 61b:	0d          	popsp
 61c:	80          	im 0
 61d:	c8          	im -56
 61e:	80          	im 0
 61f:	80          	im 0
 620:	84          	im 4
 621:	70          	loadsp 0
 622:	08          	load
 623:	70          	loadsp 0
 624:	fd          	im -3
 625:	ff          	im -1
 626:	06          	and
 627:	72          	loadsp 8
 628:	0c          	store
 629:	52          	storesp 8
 62a:	52          	storesp 8
 62b:	83          	im 3
 62c:	3d          	pushspadd
 62d:	0d          	popsp
 62e:	04          	poppc

0000062f <printnibble>:
 62f:	ff          	im -1
 630:	3d          	pushspadd
 631:	0d          	popsp
 632:	73          	loadsp 12
 633:	8f          	im 15
 634:	06          	and
 635:	52          	storesp 8
 636:	89          	im 9
 637:	72          	loadsp 8
 638:	27          	ulessthanorequal
 639:	87          	im 7
 63a:	38          	neqbranch
 63b:	80          	im 0
 63c:	d7          	im -41
 63d:	12          	addsp 8
 63e:	51          	storesp 4
 63f:	84          	im 4
 640:	39          	poppcrel

00000641 <.L49>:
 641:	b0          	im 48
 642:	12          	addsp 8
 643:	51          	storesp 4

00000644 <.L51>:
 644:	8a          	im 10
 645:	85          	im 5
 646:	2d          	call
 647:	83          	im 3
 648:	3d          	pushspadd
 649:	0d          	popsp
 64a:	04          	poppc

0000064b <printstring>:
 64b:	fd          	im -3
 64c:	3d          	pushspadd
 64d:	0d          	popsp
 64e:	75          	loadsp 20
 64f:	54          	storesp 16

00000650 <.L58>:
 650:	73          	loadsp 12
 651:	33          	loadb
 652:	70          	loadsp 0
 653:	81          	im 1
 654:	ff          	im -1
 655:	06          	and
 656:	53          	storesp 12
 657:	53          	storesp 12
 658:	71          	loadsp 4
 659:	80          	im 0
 65a:	2e          	eq
 65b:	8e          	im 14
 65c:	38          	neqbranch
 65d:	72          	loadsp 8
 65e:	81          	im 1
 65f:	ff          	im -1
 660:	06          	and
 661:	51          	storesp 4
 662:	8a          	im 10
 663:	85          	im 5
 664:	2d          	call
 665:	81          	im 1
 666:	14          	addsp 16
 667:	54          	storesp 16
 668:	e7          	im -25
 669:	39          	poppcrel

0000066a <.L57>:
 66a:	85          	im 5
 66b:	3d          	pushspadd
 66c:	0d          	popsp
 66d:	04          	poppc

0000066e <printhexbyte>:
 66e:	ff          	im -1
 66f:	3d          	pushspadd
 670:	0d          	popsp
 671:	73          	loadsp 12
 672:	70          	loadsp 0
 673:	84          	im 4
 674:	2a          	lshiftright
 675:	52          	storesp 8
 676:	52          	storesp 8
 677:	8c          	im 12
 678:	af          	im 47
 679:	2d          	call
 67a:	71          	loadsp 4
 67b:	51          	storesp 4
 67c:	8c          	im 12
 67d:	af          	im 47
 67e:	2d          	call
 67f:	83          	im 3
 680:	3d          	pushspadd
 681:	0d          	popsp
 682:	04          	poppc

00000683 <printhex>:
 683:	ff          	im -1
 684:	3d          	pushspadd
 685:	0d          	popsp
 686:	73          	loadsp 12
 687:	70          	loadsp 0
 688:	98          	im 24
 689:	2a          	lshiftright
 68a:	52          	storesp 8
 68b:	52          	storesp 8
 68c:	8c          	im 12
 68d:	ee          	im -18
 68e:	2d          	call
 68f:	71          	loadsp 4
 690:	90          	im 16
 691:	2a          	lshiftright
 692:	51          	storesp 4
 693:	8c          	im 12
 694:	ee          	im -18
 695:	2d          	call
 696:	71          	loadsp 4
 697:	88          	im 8
 698:	2a          	lshiftright
 699:	51          	storesp 4
 69a:	8c          	im 12
 69b:	ee          	im -18
 69c:	2d          	call
 69d:	71          	loadsp 4
 69e:	51          	storesp 4
 69f:	8c          	im 12
 6a0:	ee          	im -18
 6a1:	2d          	call
 6a2:	83          	im 3
 6a3:	3d          	pushspadd
 6a4:	0d          	popsp
 6a5:	04          	poppc

000006a6 <start>:
 6a6:	a0          	im 32
 6a7:	90          	im 16
 6a8:	0b          	nop
 6a9:	a0          	im 32
 6aa:	80          	im 0
 6ab:	0c          	store
 6ac:	9d          	im 29
 6ad:	b0          	im 48
 6ae:	0b          	nop
 6af:	a0          	im 32
 6b0:	84          	im 4
 6b1:	0c          	store
 6b2:	81          	im 1
 6b3:	ff          	im -1
 6b4:	f8          	im -8
 6b5:	0d          	popsp
 6b6:	a0          	im 32
 6b7:	88          	im 8
 6b8:	04          	poppc

000006b9 <.L62>:
 6b9:	ff          	im -1
 6ba:	39          	poppcrel

000006bb <spi_copy_impl>:
 6bb:	fb          	im -5
 6bc:	3d          	pushspadd
 6bd:	0d          	popsp
 6be:	a0          	im 32
 6bf:	80          	im 0
 6c0:	55          	storesp 20
 6c1:	8c          	im 12
 6c2:	99          	im 25
 6c3:	2d          	call
 6c4:	8b          	im 11
 6c5:	0b          	nop
 6c6:	80          	im 0
 6c7:	c0          	im -64
 6c8:	80          	im 0
 6c9:	80          	im 0
 6ca:	84          	im 4
 6cb:	0c          	store
 6cc:	80          	im 0
 6cd:	0b          	nop
 6ce:	80          	im 0
 6cf:	c0          	im -64
 6d0:	80          	im 0
 6d1:	80          	im 0
 6d2:	84          	im 4
 6d3:	0c          	store
 6d4:	80          	im 0
 6d5:	0b          	nop
 6d6:	80          	im 0
 6d7:	c0          	im -64
 6d8:	80          	im 0
 6d9:	80          	im 0
 6da:	84          	im 4
 6db:	0c          	store
 6dc:	80          	im 0
 6dd:	0b          	nop
 6de:	80          	im 0
 6df:	c0          	im -64
 6e0:	80          	im 0
 6e1:	80          	im 0
 6e2:	84          	im 4
 6e3:	0c          	store
 6e4:	80          	im 0
 6e5:	0b          	nop
 6e6:	80          	im 0
 6e7:	c0          	im -64
 6e8:	80          	im 0
 6e9:	80          	im 0
 6ea:	84          	im 4
 6eb:	0c          	store
 6ec:	80          	im 0
 6ed:	0b          	nop
 6ee:	80          	im 0
 6ef:	c0          	im -64
 6f0:	80          	im 0
 6f1:	80          	im 0
 6f2:	84          	im 4
 6f3:	0c          	store
 6f4:	80          	im 0
 6f5:	0b          	nop
 6f6:	80          	im 0
 6f7:	c0          	im -64
 6f8:	80          	im 0
 6f9:	80          	im 0
 6fa:	84          	im 4
 6fb:	0c          	store
 6fc:	80          	im 0
 6fd:	c0          	im -64
 6fe:	80          	im 0
 6ff:	80          	im 0
 700:	84          	im 4
 701:	08          	load
 702:	83          	im 3
 703:	ff          	im -1
 704:	ff          	im -1
 705:	06          	and
 706:	54          	storesp 16
 707:	80          	im 0
 708:	0b          	nop
 709:	80          	im 0
 70a:	c0          	im -64
 70b:	80          	im 0
 70c:	80          	im 0
 70d:	84          	im 4
 70e:	0c          	store
 70f:	80          	im 0
 710:	0b          	nop
 711:	80          	im 0
 712:	c0          	im -64
 713:	80          	im 0
 714:	80          	im 0
 715:	84          	im 4
 716:	0c          	store
 717:	80          	im 0
 718:	c0          	im -64
 719:	80          	im 0
 71a:	80          	im 0
 71b:	84          	im 4
 71c:	08          	load
 71d:	83          	im 3
 71e:	ff          	im -1
 71f:	ff          	im -1
 720:	06          	and
 721:	56          	storesp 24
 722:	81          	im 1
 723:	df          	im -33
 724:	80          	im 0
 725:	74          	loadsp 16
 726:	27          	ulessthanorequal
 727:	83          	im 3
 728:	38          	neqbranch

00000729 <.L88>:
 729:	ff          	im -1
 72a:	39          	poppcrel

0000072b <.L87>:
 72b:	83          	im 3
 72c:	ff          	im -1
 72d:	ff          	im -1
 72e:	0b          	nop
 72f:	83          	im 3
 730:	d0          	im -48
 731:	0a          	flip
 732:	0c          	store
 733:	73          	loadsp 12
 734:	84          	im 4
 735:	29          	mult
 736:	84          	im 4
 737:	05          	add
 738:	9d          	im 29
 739:	b0          	im 48
 73a:	0c          	store

0000073b <.L113>:
 73b:	ff          	im -1
 73c:	14          	addsp 16
 73d:	54          	storesp 16
 73e:	73          	loadsp 12
 73f:	ff          	im -1
 740:	2e          	eq
 741:	ac          	im 44
 742:	38          	neqbranch
 743:	84          	im 4
 744:	53          	storesp 12

00000745 <.L99>:
 745:	80          	im 0
 746:	0b          	nop
 747:	80          	im 0
 748:	c0          	im -64
 749:	80          	im 0
 74a:	80          	im 0
 74b:	84          	im 4
 74c:	0c          	store
 74d:	80          	im 0
 74e:	c0          	im -64
 74f:	80          	im 0
 750:	80          	im 0
 751:	84          	im 4
 752:	08          	load
 753:	80          	im 0
 754:	dc          	im -36
 755:	80          	im 0
 756:	80          	im 0
 757:	88          	im 8
 758:	0c          	store
 759:	ff          	im -1
 75a:	13          	addsp 12
 75b:	53          	storesp 12
 75c:	72          	loadsp 8
 75d:	e7          	im -25
 75e:	38          	neqbranch
 75f:	74          	loadsp 16
 760:	84          	im 4
 761:	16          	addsp 24
 762:	80          	im 0
 763:	c0          	im -64
 764:	80          	im 0
 765:	80          	im 0
 766:	84          	im 4
 767:	08          	load
 768:	72          	loadsp 8
 769:	0c          	store
 76a:	56          	storesp 24
 76b:	53          	storesp 12
 76c:	ce          	im -50
 76d:	39          	poppcrel

0000076e <.L110>:
 76e:	8c          	im 12
 76f:	83          	im 3
 770:	2d          	call
 771:	83          	im 3
 772:	d0          	im -48
 773:	0a          	flip
 774:	08          	load
 775:	52          	storesp 8
 776:	75          	loadsp 20
 777:	72          	loadsp 8
 778:	2e          	eq
 779:	89          	im 9
 77a:	38          	neqbranch
 77b:	9d          	im 29
 77c:	ec          	im -20
 77d:	51          	storesp 4
 77e:	8c          	im 12
 77f:	cb          	im -53
 780:	2d          	call

00000781 <.L104>:
 781:	ff          	im -1
 782:	39          	poppcrel

00000783 <.L103>:
 783:	a0          	im 32
 784:	84          	im 4
 785:	08          	load
 786:	52          	storesp 8
 787:	71          	loadsp 4
 788:	f8          	im -8
 789:	98          	im 24
 78a:	84          	im 4
 78b:	9e          	im 30
 78c:	80          	im 0
 78d:	2e          	eq
 78e:	9f          	im 31
 78f:	38          	neqbranch
 790:	9d          	im 29
 791:	f0          	im -16
 792:	51          	storesp 4
 793:	8c          	im 12
 794:	cb          	im -53
 795:	2d          	call
 796:	a0          	im 32
 797:	84          	im 4
 798:	08          	load
 799:	51          	storesp 4
 79a:	8d          	im 13
 79b:	83          	im 3
 79c:	2d          	call
 79d:	9d          	im 29
 79e:	f8          	im -8
 79f:	51          	storesp 4
 7a0:	8c          	im 12
 7a1:	cb          	im -53
 7a2:	2d          	call
 7a3:	f8          	im -8
 7a4:	98          	im 24
 7a5:	84          	im 4
 7a6:	9e          	im 30
 7a7:	80          	im 0
 7a8:	51          	storesp 4
 7a9:	8d          	im 13
 7aa:	83          	im 3
 7ab:	2d          	call

000007ac <.L107>:
 7ac:	ff          	im -1
 7ad:	39          	poppcrel

000007ae <.L106>:
 7ae:	90          	im 16
 7af:	0a          	flip
 7b0:	08          	load
 7b1:	70          	loadsp 0
 7b2:	ff          	im -1
 7b3:	bf          	im 63
 7b4:	06          	and
 7b5:	90          	im 16
 7b6:	0a          	flip
 7b7:	0c          	store
 7b8:	52          	storesp 8
 7b9:	8d          	im 13
 7ba:	a6          	im 38
 7bb:	2d          	call

000007bc <_zpu_interrupt>:
 7bc:	ff          	im -1
 7bd:	3d          	pushspadd
 7be:	0d          	popsp
 7bf:	a2          	im 34
 7c0:	cc          	im -52
 7c1:	08          	load
 7c2:	81          	im 1
 7c3:	11          	addsp 4
 7c4:	a2          	im 34
 7c5:	cc          	im -52
 7c6:	0c          	store
 7c7:	51          	storesp 4
 7c8:	83          	im 3
 7c9:	90          	im 16
 7ca:	0a          	flip
 7cb:	70          	loadsp 0
 7cc:	08          	load
 7cd:	70          	loadsp 0
 7ce:	fe          	im -2
 7cf:	ff          	im -1
 7d0:	06          	and
 7d1:	72          	loadsp 8
 7d2:	0c          	store
 7d3:	52          	storesp 8
 7d4:	52          	storesp 8
 7d5:	83          	im 3
 7d6:	3d          	pushspadd
 7d7:	0d          	popsp
 7d8:	04          	poppc

000007d9 <_Z14is_atmel_flashv>:
 7d9:	ff          	im -1
 7da:	3d          	pushspadd
 7db:	0d          	popsp
 7dc:	80          	im 0
 7dd:	0b          	nop
 7de:	a2          	im 34
 7df:	d4          	im -44
 7e0:	08          	load
 7e1:	87          	im 7
 7e2:	fc          	im -4
 7e3:	80          	im 0
 7e4:	80          	im 0
 7e5:	06          	and
 7e6:	52          	storesp 8
 7e7:	52          	storesp 8
 7e8:	70          	loadsp 0
 7e9:	80          	im 0
 7ea:	fc          	im -4
 7eb:	80          	im 0
 7ec:	80          	im 0
 7ed:	2e          	eq
 7ee:	09          	not
 7ef:	81          	im 1
 7f0:	06          	and
 7f1:	83          	im 3
 7f2:	38          	neqbranch
 7f3:	81          	im 1
 7f4:	52          	storesp 8

000007f5 <.L116>:
 7f5:	71          	loadsp 4
 7f6:	88          	im 8
 7f7:	0c          	store
 7f8:	83          	im 3
 7f9:	3d          	pushspadd
 7fa:	0d          	popsp
 7fb:	04          	poppc

000007fc <_Z15spi_read_statusv>:
 7fc:	80          	im 0
 7fd:	3d          	pushspadd
 7fe:	0d          	popsp
 7ff:	8c          	im 12
 800:	99          	im 25
 801:	2d          	call
 802:	8f          	im 15
 803:	d9          	im -39
 804:	2d          	call
 805:	88          	im 8
 806:	08          	load
 807:	80          	im 0
 808:	2e          	eq
 809:	8c          	im 12
 80a:	38          	neqbranch
 80b:	80          	im 0
 80c:	d7          	im -41
 80d:	0b          	nop
 80e:	80          	im 0
 80f:	c0          	im -64
 810:	80          	im 0
 811:	80          	im 0
 812:	84          	im 4
 813:	0c          	store
 814:	89          	im 9
 815:	39          	poppcrel

00000816 <.L118>:
 816:	85          	im 5
 817:	0b          	nop
 818:	80          	im 0
 819:	c0          	im -64
 81a:	80          	im 0
 81b:	80          	im 0
 81c:	84          	im 4
 81d:	0c          	store

0000081e <.L121>:
 81e:	80          	im 0
 81f:	0b          	nop
 820:	80          	im 0
 821:	c0          	im -64
 822:	80          	im 0
 823:	80          	im 0
 824:	84          	im 4
 825:	0c          	store
 826:	80          	im 0
 827:	c0          	im -64
 828:	80          	im 0
 829:	80          	im 0
 82a:	84          	im 4
 82b:	08          	load
 82c:	70          	loadsp 0
 82d:	81          	im 1
 82e:	ff          	im -1
 82f:	06          	and
 830:	51          	storesp 4
 831:	51          	storesp 4
 832:	8c          	im 12
 833:	83          	im 3
 834:	2d          	call
 835:	70          	loadsp 0
 836:	88          	im 8
 837:	0c          	store
 838:	82          	im 2
 839:	3d          	pushspadd
 83a:	0d          	popsp
 83b:	04          	poppc

0000083c <_Z11cmd_progmemv>:
 83c:	04          	poppc

0000083d <_Z20cmd_raw_send_receivev>:
 83d:	fd          	im -3
 83e:	3d          	pushspadd
 83f:	0d          	popsp
 840:	8c          	im 12
 841:	99          	im 25
 842:	2d          	call
 843:	a0          	im 32
 844:	a1          	im 33
 845:	33          	loadb
 846:	a0          	im 32
 847:	a2          	im 34
 848:	33          	loadb
 849:	71          	loadsp 4
 84a:	82          	im 2
 84b:	80          	im 0
 84c:	29          	mult
 84d:	05          	add
 84e:	53          	storesp 12
 84f:	53          	storesp 12
 850:	80          	im 0
 851:	72          	loadsp 8
 852:	27          	ulessthanorequal
 853:	98          	im 24
 854:	38          	neqbranch
 855:	a0          	im 32
 856:	a5          	im 37
 857:	72          	loadsp 8
 858:	54          	storesp 16
 859:	54          	storesp 16

0000085a <.L135>:
 85a:	73          	loadsp 12
 85b:	70          	loadsp 0
 85c:	81          	im 1
 85d:	05          	add
 85e:	55          	storesp 20
 85f:	33          	loadb
 860:	80          	im 0
 861:	c0          	im -64
 862:	80          	im 0
 863:	80          	im 0
 864:	84          	im 4
 865:	0c          	store
 866:	ff          	im -1
 867:	13          	addsp 12
 868:	53          	storesp 12
 869:	72          	loadsp 8
 86a:	ef          	im -17
 86b:	38          	neqbranch

0000086c <.L149>:
 86c:	a0          	im 32
 86d:	a3          	im 35
 86e:	33          	loadb
 86f:	a0          	im 32
 870:	a4          	im 36
 871:	33          	loadb
 872:	71          	loadsp 4
 873:	82          	im 2
 874:	80          	im 0
 875:	29          	mult
 876:	05          	add
 877:	55          	storesp 20
 878:	52          	storesp 8
 879:	80          	im 0
 87a:	53          	storesp 12

0000087b <.L154>:
 87b:	72          	loadsp 8
 87c:	74          	loadsp 16
 87d:	27          	ulessthanorequal
 87e:	9a          	im 26
 87f:	38          	neqbranch
 880:	80          	im 0
 881:	0b          	nop
 882:	80          	im 0
 883:	c0          	im -64
 884:	80          	im 0
 885:	80          	im 0
 886:	84          	im 4
 887:	0c          	store
 888:	80          	im 0
 889:	c0          	im -64
 88a:	80          	im 0
 88b:	80          	im 0
 88c:	84          	im 4
 88d:	08          	load
 88e:	52          	storesp 8
 88f:	71          	loadsp 4
 890:	a0          	im 32
 891:	a0          	im 32
 892:	14          	addsp 16
 893:	34          	storeb
 894:	81          	im 1
 895:	13          	addsp 12
 896:	53          	storesp 12
 897:	e3          	im -29
 898:	39          	poppcrel

00000899 <.L151>:
 899:	8c          	im 12
 89a:	83          	im 3
 89b:	2d          	call
 89c:	8a          	im 10
 89d:	f2          	im -14
 89e:	2d          	call
 89f:	81          	im 1
 8a0:	84          	im 4
 8a1:	51          	storesp 4
 8a2:	8a          	im 10
 8a3:	a3          	im 35
 8a4:	2d          	call
 8a5:	73          	loadsp 12
 8a6:	88          	im 8
 8a7:	2a          	lshiftright
 8a8:	51          	storesp 4
 8a9:	8a          	im 10
 8aa:	a3          	im 35
 8ab:	2d          	call
 8ac:	73          	loadsp 12
 8ad:	51          	storesp 4
 8ae:	8a          	im 10
 8af:	a3          	im 35
 8b0:	2d          	call
 8b1:	80          	im 0
 8b2:	53          	storesp 12

000008b3 <.L155>:
 8b3:	72          	loadsp 8
 8b4:	74          	loadsp 16
 8b5:	27          	ulessthanorequal
 8b6:	8e          	im 14
 8b7:	38          	neqbranch
 8b8:	a0          	im 32
 8b9:	a0          	im 32
 8ba:	13          	addsp 12
 8bb:	33          	loadb
 8bc:	51          	storesp 4
 8bd:	8a          	im 10
 8be:	a3          	im 35
 8bf:	2d          	call
 8c0:	81          	im 1
 8c1:	13          	addsp 12
 8c2:	53          	storesp 12
 8c3:	ef          	im -17
 8c4:	39          	poppcrel

000008c5 <.L153>:
 8c5:	8b          	im 11
 8c6:	87          	im 7
 8c7:	2d          	call
 8c8:	85          	im 5
 8c9:	3d          	pushspadd
 8ca:	0d          	popsp
 8cb:	04          	poppc

000008cc <_Z19cmd_sst_aai_programv>:
 8cc:	04          	poppc

000008cd <_Z11simpleReplyj>:
 8cd:	80          	im 0
 8ce:	3d          	pushspadd
 8cf:	0d          	popsp
 8d0:	8a          	im 10
 8d1:	f2          	im -14
 8d2:	2d          	call
 8d3:	72          	loadsp 8
 8d4:	81          	im 1
 8d5:	80          	im 0
 8d6:	07          	or
 8d7:	51          	storesp 4
 8d8:	8a          	im 10
 8d9:	a3          	im 35
 8da:	2d          	call
 8db:	8b          	im 11
 8dc:	87          	im 7
 8dd:	2d          	call
 8de:	82          	im 2
 8df:	3d          	pushspadd
 8e0:	0d          	popsp
 8e1:	04          	poppc

000008e2 <_Z16cmd_set_baudratev>:
 8e2:	fd          	im -3
 8e3:	3d          	pushspadd
 8e4:	0d          	popsp
 8e5:	a0          	im 32
 8e6:	a1          	im 33
 8e7:	33          	loadb
 8e8:	a0          	im 32
 8e9:	a2          	im 34
 8ea:	33          	loadb
 8eb:	71          	loadsp 4
 8ec:	90          	im 16
 8ed:	2b          	ashiftleft
 8ee:	71          	loadsp 4
 8ef:	88          	im 8
 8f0:	2b          	ashiftleft
 8f1:	07          	or
 8f2:	a0          	im 32
 8f3:	a3          	im 35
 8f4:	33          	loadb
 8f5:	70          	loadsp 0
 8f6:	72          	loadsp 8
 8f7:	07          	or
 8f8:	88          	im 8
 8f9:	2b          	ashiftleft
 8fa:	a0          	im 32
 8fb:	a4          	im 36
 8fc:	33          	loadb
 8fd:	71          	loadsp 4
 8fe:	07          	or
 8ff:	51          	storesp 4
 900:	52          	storesp 8
 901:	53          	storesp 12
 902:	55          	storesp 20
 903:	55          	storesp 20
 904:	52          	storesp 8
 905:	88          	im 8
 906:	51          	storesp 4
 907:	91          	im 17
 908:	cd          	im -51
 909:	2d          	call
 90a:	81          	im 1
 90b:	ff          	im -1
 90c:	51          	storesp 4
 90d:	8a          	im 10
 90e:	85          	im 5
 90f:	2d          	call

00000910 <.L159>:
 910:	80          	im 0
 911:	c4          	im -60
 912:	80          	im 0
 913:	80          	im 0
 914:	84          	im 4
 915:	08          	load
 916:	70          	loadsp 0
 917:	81          	im 1
 918:	2a          	lshiftright
 919:	70          	loadsp 0
 91a:	81          	im 1
 91b:	06          	and
 91c:	51          	storesp 4
 91d:	51          	storesp 4
 91e:	52          	storesp 8
 91f:	71          	loadsp 4
 920:	ef          	im -17
 921:	38          	neqbranch
 922:	72          	loadsp 8
 923:	84          	im 4
 924:	80          	im 0
 925:	80          	im 0
 926:	07          	or
 927:	80          	im 0
 928:	c4          	im -60
 929:	80          	im 0
 92a:	80          	im 0
 92b:	84          	im 4
 92c:	0c          	store
 92d:	85          	im 5
 92e:	3d          	pushspadd
 92f:	0d          	popsp
 930:	04          	poppc

00000931 <_Z13cmd_waitreadyv>:
 931:	fe          	im -2
 932:	3d          	pushspadd
 933:	0d          	popsp
 934:	8f          	im 15
 935:	d9          	im -39
 936:	2d          	call
 937:	88          	im 8
 938:	08          	load
 939:	80          	im 0
 93a:	2e          	eq
 93b:	97          	im 23
 93c:	38          	neqbranch

0000093d <.L164>:
 93d:	8f          	im 15
 93e:	fc          	im -4
 93f:	2d          	call
 940:	88          	im 8
 941:	08          	load
 942:	88          	im 8
 943:	08          	load
 944:	87          	im 7
 945:	2a          	lshiftright
 946:	81          	im 1
 947:	32          	xor
 948:	70          	loadsp 0
 949:	81          	im 1
 94a:	06          	and
 94b:	51          	storesp 4
 94c:	53          	storesp 12
 94d:	53          	storesp 12
 94e:	71          	loadsp 4
 94f:	ed          	im -19
 950:	38          	neqbranch
 951:	8f          	im 15
 952:	39          	poppcrel

00000953 <.L168>:
 953:	8f          	im 15
 954:	fc          	im -4
 955:	2d          	call
 956:	88          	im 8
 957:	08          	load
 958:	88          	im 8
 959:	08          	load
 95a:	81          	im 1
 95b:	06          	and
 95c:	53          	storesp 12
 95d:	53          	storesp 12
 95e:	71          	loadsp 4
 95f:	f3          	im -13
 960:	38          	neqbranch

00000961 <.L167>:
 961:	8a          	im 10
 962:	f2          	im -14
 963:	2d          	call
 964:	81          	im 1
 965:	83          	im 3
 966:	51          	storesp 4
 967:	8a          	im 10
 968:	a3          	im 35
 969:	2d          	call
 96a:	72          	loadsp 8
 96b:	51          	storesp 4
 96c:	8a          	im 10
 96d:	a3          	im 35
 96e:	2d          	call
 96f:	8b          	im 11
 970:	87          	im 7
 971:	2d          	call
 972:	84          	im 4
 973:	3d          	pushspadd
 974:	0d          	popsp
 975:	04          	poppc

00000976 <_Z11cmd_versionv>:
 976:	ff          	im -1
 977:	3d          	pushspadd
 978:	0d          	popsp
 979:	80          	im 0
 97a:	0b          	nop
 97b:	a2          	im 34
 97c:	cc          	im -52
 97d:	0c          	store
 97e:	8a          	im 10
 97f:	f2          	im -14
 980:	2d          	call
 981:	81          	im 1
 982:	81          	im 1
 983:	51          	storesp 4
 984:	8a          	im 10
 985:	a3          	im 35
 986:	2d          	call
 987:	90          	im 16
 988:	52          	storesp 8
 989:	9d          	im 29
 98a:	dc          	im -36
 98b:	51          	storesp 4
 98c:	8a          	im 10
 98d:	d2          	im -46
 98e:	2d          	call
 98f:	8b          	im 11
 990:	87          	im 7
 991:	2d          	call
 992:	83          	im 3
 993:	3d          	pushspadd
 994:	0d          	popsp
 995:	04          	poppc

00000996 <_Z12cmd_identifyv>:
 996:	fe          	im -2
 997:	3d          	pushspadd
 998:	0d          	popsp
 999:	80          	im 0
 99a:	0b          	nop
 99b:	a2          	im 34
 99c:	cc          	im -52
 99d:	0c          	store
 99e:	8a          	im 10
 99f:	f2          	im -14
 9a0:	2d          	call
 9a1:	81          	im 1
 9a2:	82          	im 2
 9a3:	51          	storesp 4
 9a4:	8a          	im 10
 9a5:	a3          	im 35
 9a6:	2d          	call
 9a7:	8c          	im 12
 9a8:	99          	im 25
 9a9:	2d          	call
 9aa:	80          	im 0
 9ab:	c0          	im -64
 9ac:	80          	im 0
 9ad:	80          	im 0
 9ae:	84          	im 4
 9af:	52          	storesp 8
 9b0:	81          	im 1
 9b1:	9f          	im 31
 9b2:	72          	loadsp 8
 9b3:	0c          	store
 9b4:	80          	im 0
 9b5:	70          	loadsp 0
 9b6:	73          	loadsp 12
 9b7:	0c          	store
 9b8:	70          	loadsp 0
 9b9:	73          	loadsp 12
 9ba:	0c          	store
 9bb:	72          	loadsp 8
 9bc:	0c          	store
 9bd:	71          	loadsp 4
 9be:	08          	load
 9bf:	52          	storesp 8
 9c0:	8c          	im 12
 9c1:	83          	im 3
 9c2:	2d          	call
 9c3:	71          	loadsp 4
 9c4:	a2          	im 34
 9c5:	d4          	im -44
 9c6:	0c          	store
 9c7:	71          	loadsp 4
 9c8:	90          	im 16
 9c9:	2a          	lshiftright
 9ca:	51          	storesp 4
 9cb:	8a          	im 10
 9cc:	a3          	im 35
 9cd:	2d          	call
 9ce:	a2          	im 34
 9cf:	d4          	im -44
 9d0:	08          	load
 9d1:	88          	im 8
 9d2:	2a          	lshiftright
 9d3:	51          	storesp 4
 9d4:	8a          	im 10
 9d5:	a3          	im 35
 9d6:	2d          	call
 9d7:	a2          	im 34
 9d8:	d4          	im -44
 9d9:	08          	load
 9da:	51          	storesp 4
 9db:	8a          	im 10
 9dc:	a3          	im 35
 9dd:	2d          	call
 9de:	8f          	im 15
 9df:	fc          	im -4
 9e0:	2d          	call
 9e1:	88          	im 8
 9e2:	08          	load
 9e3:	51          	storesp 4
 9e4:	8a          	im 10
 9e5:	a3          	im 35
 9e6:	2d          	call
 9e7:	8b          	im 11
 9e8:	87          	im 7
 9e9:	2d          	call
 9ea:	84          	im 4
 9eb:	3d          	pushspadd
 9ec:	0d          	popsp
 9ed:	04          	poppc

000009ee <_Z12cmd_enterpgmv>:
 9ee:	80          	im 0
 9ef:	3d          	pushspadd
 9f0:	0d          	popsp
 9f1:	81          	im 1
 9f2:	0b          	nop
 9f3:	a2          	im 34
 9f4:	d0          	im -48
 9f5:	0c          	store
 9f6:	80          	im 0
 9f7:	0b          	nop
 9f8:	83          	im 3
 9f9:	90          	im 16
 9fa:	0a          	flip
 9fb:	0c          	store
 9fc:	85          	im 5
 9fd:	51          	storesp 4
 9fe:	91          	im 17
 9ff:	cd          	im -51
 a00:	2d          	call
 a01:	82          	im 2
 a02:	3d          	pushspadd
 a03:	0d          	popsp
 a04:	04          	poppc

00000a05 <_Z12cmd_leavepgmv>:
 a05:	80          	im 0
 a06:	3d          	pushspadd
 a07:	0d          	popsp
 a08:	80          	im 0
 a09:	0b          	nop
 a0a:	a2          	im 34
 a0b:	d0          	im -48
 a0c:	0c          	store
 a0d:	8b          	im 11
 a0e:	ea          	im -22
 a0f:	2d          	call
 a10:	86          	im 6
 a11:	51          	storesp 4
 a12:	91          	im 17
 a13:	cd          	im -51
 a14:	2d          	call
 a15:	82          	im 2
 a16:	3d          	pushspadd
 a17:	0d          	popsp
 a18:	04          	poppc

00000a19 <_Z9cmd_startv>:
 a19:	80          	im 0
 a1a:	3d          	pushspadd
 a1b:	0d          	popsp
 a1c:	8a          	im 10
 a1d:	51          	storesp 4
 a1e:	91          	im 17
 a1f:	cd          	im -51
 a20:	2d          	call
 a21:	8d          	im 13
 a22:	a6          	im 38
 a23:	2d          	call

00000a24 <_Z14processCommandv>:
 a24:	fe          	im -2
 a25:	3d          	pushspadd
 a26:	0d          	popsp
 a27:	80          	im 0
 a28:	0b          	nop
 a29:	a2          	im 34
 a2a:	c8          	im -56
 a2b:	08          	load
 a2c:	52          	storesp 8
 a2d:	52          	storesp 8
 a2e:	82          	im 2
 a2f:	71          	loadsp 4
 a30:	27          	ulessthanorequal
 a31:	80          	im 0
 a32:	e7          	im -25
 a33:	38          	neqbranch
 a34:	83          	im 3
 a35:	ff          	im -1
 a36:	ff          	im -1
 a37:	0b          	nop
 a38:	83          	im 3
 a39:	d0          	im -48
 a3a:	0a          	flip
 a3b:	0c          	store
 a3c:	fe          	im -2
 a3d:	11          	addsp 4
 a3e:	53          	storesp 12

00000a3f <.L197>:
 a3f:	71          	loadsp 4
 a40:	73          	loadsp 12
 a41:	27          	ulessthanorequal
 a42:	90          	im 16
 a43:	38          	neqbranch
 a44:	a0          	im 32
 a45:	a0          	im 32
 a46:	12          	addsp 8
 a47:	33          	loadb
 a48:	80          	im 0
 a49:	dc          	im -36
 a4a:	80          	im 0
 a4b:	80          	im 0
 a4c:	88          	im 8
 a4d:	0c          	store
 a4e:	81          	im 1
 a4f:	12          	addsp 8
 a50:	52          	storesp 8
 a51:	ed          	im -19
 a52:	39          	poppcrel

00000a53 <.L196>:
 a53:	a2          	im 34
 a54:	c8          	im -56
 a55:	08          	load
 a56:	ff          	im -1
 a57:	05          	add
 a58:	a2          	im 34
 a59:	c8          	im -56
 a5a:	0c          	store
 a5b:	a2          	im 34
 a5c:	c8          	im -56
 a5d:	08          	load
 a5e:	a0          	im 32
 a5f:	a0          	im 32
 a60:	11          	addsp 4
 a61:	33          	loadb
 a62:	53          	storesp 12
 a63:	ff          	im -1
 a64:	05          	add
 a65:	a2          	im 34
 a66:	c8          	im -56
 a67:	0c          	store
 a68:	a2          	im 34
 a69:	c8          	im -56
 a6a:	08          	load
 a6b:	a0          	im 32
 a6c:	a0          	im 32
 a6d:	05          	add
 a6e:	70          	loadsp 0
 a6f:	33          	loadb
 a70:	70          	loadsp 0
 a71:	88          	im 8
 a72:	2b          	ashiftleft
 a73:	74          	loadsp 16
 a74:	07          	or
 a75:	83          	im 3
 a76:	d0          	im -48
 a77:	0a          	flip
 a78:	08          	load
 a79:	52          	storesp 8
 a7a:	54          	storesp 16
 a7b:	51          	storesp 4
 a7c:	51          	storesp 4
 a7d:	70          	loadsp 0
 a7e:	72          	loadsp 8
 a7f:	2e          	eq
 a80:	09          	not
 a81:	81          	im 1
 a82:	06          	and
 a83:	96          	im 22
 a84:	38          	neqbranch
 a85:	a0          	im 32
 a86:	a0          	im 32
 a87:	33          	loadb
 a88:	52          	storesp 8
 a89:	71          	loadsp 4
 a8a:	8a          	im 10
 a8b:	26          	ulessthan
 a8c:	8d          	im 13
 a8d:	38          	neqbranch
 a8e:	71          	loadsp 4
 a8f:	84          	im 4
 a90:	29          	mult
 a91:	9d          	im 29
 a92:	b0          	im 48
 a93:	05          	add
 a94:	70          	loadsp 0
 a95:	08          	load
 a96:	51          	storesp 4
 a97:	51          	storesp 4
 a98:	70          	loadsp 0
 a99:	2d          	call

00000a9a <.L187>:
 a9a:	84          	im 4
 a9b:	3d          	pushspadd
 a9c:	0d          	popsp
 a9d:	04          	poppc

00000a9e <_Z14configure_pinsv>:
 a9e:	fd          	im -3
 a9f:	3d          	pushspadd
 aa0:	0d          	popsp
 aa1:	80          	im 0
 aa2:	c8          	im -56
 aa3:	80          	im 0
 aa4:	80          	im 0
 aa5:	84          	im 4
 aa6:	52          	storesp 8
 aa7:	ef          	im -17
 aa8:	72          	loadsp 8
 aa9:	08          	load
 aaa:	70          	loadsp 0
 aab:	72          	loadsp 8
 aac:	06          	and
 aad:	74          	loadsp 16
 aae:	0c          	store
 aaf:	52          	storesp 8
 ab0:	72          	loadsp 8
 ab1:	08          	load
 ab2:	70          	loadsp 0
 ab3:	a0          	im 32
 ab4:	07          	or
 ab5:	74          	loadsp 16
 ab6:	0c          	store
 ab7:	52          	storesp 8
 ab8:	72          	loadsp 8
 ab9:	08          	load
 aba:	70          	loadsp 0
 abb:	80          	im 0
 abc:	c0          	im -64
 abd:	07          	or
 abe:	74          	loadsp 16
 abf:	0c          	store
 ac0:	52          	storesp 8
 ac1:	72          	loadsp 8
 ac2:	08          	load
 ac3:	70          	loadsp 0
 ac4:	81          	im 1
 ac5:	80          	im 0
 ac6:	07          	or
 ac7:	74          	loadsp 16
 ac8:	0c          	store
 ac9:	52          	storesp 8
 aca:	72          	loadsp 8
 acb:	08          	load
 acc:	70          	loadsp 0
 acd:	82          	im 2
 ace:	80          	im 0
 acf:	07          	or
 ad0:	74          	loadsp 16
 ad1:	0c          	store
 ad2:	52          	storesp 8
 ad3:	54          	storesp 16
 ad4:	81          	im 1
 ad5:	0b          	nop
 ad6:	80          	im 0
 ad7:	c8          	im -56
 ad8:	80          	im 0
 ad9:	84          	im 4
 ada:	8c          	im 12
 adb:	0c          	store
 adc:	82          	im 2
 add:	70          	loadsp 0
 ade:	80          	im 0
 adf:	c8          	im -56
 ae0:	80          	im 0
 ae1:	84          	im 4
 ae2:	90          	im 16
 ae3:	0c          	store
 ae4:	80          	im 0
 ae5:	c8          	im -56
 ae6:	80          	im 0
 ae7:	88          	im 8
 ae8:	80          	im 0
 ae9:	0c          	store
 aea:	80          	im 0
 aeb:	c8          	im -56
 aec:	80          	im 0
 aed:	80          	im 0
 aee:	a0          	im 32
 aef:	70          	loadsp 0
 af0:	08          	load
 af1:	70          	loadsp 0
 af2:	88          	im 8
 af3:	07          	or
 af4:	72          	loadsp 8
 af5:	0c          	store
 af6:	52          	storesp 8
 af7:	70          	loadsp 0
 af8:	08          	load
 af9:	70          	loadsp 0
 afa:	90          	im 16
 afb:	07          	or
 afc:	72          	loadsp 8
 afd:	0c          	store
 afe:	52          	storesp 8
 aff:	52          	storesp 8
 b00:	80          	im 0
 b01:	c8          	im -56
 b02:	80          	im 0
 b03:	80          	im 0
 b04:	90          	im 16
 b05:	70          	loadsp 0
 b06:	08          	load
 b07:	70          	loadsp 0
 b08:	f7          	im -9
 b09:	06          	and
 b0a:	72          	loadsp 8
 b0b:	0c          	store
 b0c:	52          	storesp 8
 b0d:	70          	loadsp 0
 b0e:	08          	load
 b0f:	70          	loadsp 0
 b10:	76          	loadsp 24
 b11:	06          	and
 b12:	72          	loadsp 8
 b13:	0c          	store
 b14:	52          	storesp 8
 b15:	53          	storesp 12
 b16:	80          	im 0
 b17:	c8          	im -56
 b18:	80          	im 0
 b19:	80          	im 0
 b1a:	94          	im 20
 b1b:	70          	loadsp 0
 b1c:	08          	load
 b1d:	70          	loadsp 0
 b1e:	fd          	im -3
 b1f:	ff          	im -1
 b20:	06          	and
 b21:	72          	loadsp 8
 b22:	0c          	store
 b23:	52          	storesp 8
 b24:	70          	loadsp 0
 b25:	08          	load
 b26:	70          	loadsp 0
 b27:	76          	loadsp 24
 b28:	06          	and
 b29:	72          	loadsp 8
 b2a:	0c          	store
 b2b:	52          	storesp 8
 b2c:	70          	loadsp 0
 b2d:	08          	load
 b2e:	70          	loadsp 0
 b2f:	df          	im -33
 b30:	06          	and
 b31:	72          	loadsp 8
 b32:	0c          	store
 b33:	52          	storesp 8
 b34:	70          	loadsp 0
 b35:	08          	load
 b36:	70          	loadsp 0
 b37:	ff          	im -1
 b38:	bf          	im 63
 b39:	06          	and
 b3a:	72          	loadsp 8
 b3b:	0c          	store
 b3c:	52          	storesp 8
 b3d:	70          	loadsp 0
 b3e:	08          	load
 b3f:	70          	loadsp 0
 b40:	fe          	im -2
 b41:	ff          	im -1
 b42:	06          	and
 b43:	72          	loadsp 8
 b44:	0c          	store
 b45:	52          	storesp 8
 b46:	52          	storesp 8
 b47:	72          	loadsp 8
 b48:	08          	load
 b49:	70          	loadsp 0
 b4a:	fe          	im -2
 b4b:	ff          	im -1
 b4c:	0a          	flip
 b4d:	06          	and
 b4e:	74          	loadsp 16
 b4f:	0c          	store
 b50:	51          	storesp 4
 b51:	81          	im 1
 b52:	90          	im 16
 b53:	0a          	flip
 b54:	70          	loadsp 0
 b55:	08          	load
 b56:	70          	loadsp 0
 b57:	81          	im 1
 b58:	80          	im 0
 b59:	0a          	flip
 b5a:	07          	or
 b5b:	72          	loadsp 8
 b5c:	0c          	store
 b5d:	52          	storesp 8
 b5e:	52          	storesp 8
 b5f:	85          	im 5
 b60:	3d          	pushspadd
 b61:	0d          	popsp
 b62:	04          	poppc

00000b63 <main>:
 b63:	ff          	im -1
 b64:	3d          	pushspadd
 b65:	0d          	popsp
 b66:	80          	im 0
 b67:	0b          	nop
 b68:	a2          	im 34
 b69:	d0          	im -48
 b6a:	0c          	store
 b6b:	80          	im 0
 b6c:	0b          	nop
 b6d:	a2          	im 34
 b6e:	cc          	im -52
 b6f:	0c          	store
 b70:	80          	im 0
 b71:	0b          	nop
 b72:	a2          	im 34
 b73:	c8          	im -56
 b74:	0c          	store
 b75:	8f          	im 15
 b76:	bc          	im 60
 b77:	0b          	nop
 b78:	a0          	im 32
 b79:	80          	im 0
 b7a:	0c          	store
 b7b:	95          	im 21
 b7c:	9e          	im 30
 b7d:	2d          	call
 b7e:	84          	im 4
 b7f:	80          	im 0
 b80:	b3          	im 51
 b81:	0b          	nop
 b82:	80          	im 0
 b83:	c4          	im -60
 b84:	80          	im 0
 b85:	80          	im 0
 b86:	84          	im 4
 b87:	0c          	store
 b88:	88          	im 8
 b89:	0b          	nop
 b8a:	80          	im 0
 b8b:	d0          	im -48
 b8c:	80          	im 0
 b8d:	80          	im 0
 b8e:	84          	im 4
 b8f:	0c          	store
 b90:	81          	im 1
 b91:	0b          	nop
 b92:	80          	im 0
 b93:	d0          	im -48
 b94:	0a          	flip
 b95:	0c          	store
 b96:	8b          	im 11
 b97:	ea          	im -22
 b98:	2d          	call
 b99:	82          	im 2
 b9a:	88          	im 8
 b9b:	88          	im 8
 b9c:	0b          	nop
 b9d:	80          	im 0
 b9e:	dc          	im -36
 b9f:	80          	im 0
 ba0:	80          	im 0
 ba1:	84          	im 4
 ba2:	0c          	store
 ba3:	81          	im 1
 ba4:	f4          	im -12
 ba5:	0b          	nop
 ba6:	90          	im 16
 ba7:	0a          	flip
 ba8:	0c          	store
 ba9:	8c          	im 12
 baa:	83          	im 3
 bab:	2d          	call
 bac:	8c          	im 12
 bad:	99          	im 25
 bae:	2d          	call
 baf:	80          	im 0
 bb0:	0b          	nop
 bb1:	a2          	im 34
 bb2:	c4          	im -60
 bb3:	0c          	store
 bb4:	80          	im 0
 bb5:	0b          	nop
 bb6:	a2          	im 34
 bb7:	c0          	im -64
 bb8:	0c          	store

00000bb9 <.L333>:
 bb9:	8b          	im 11
 bba:	b1          	im 49
 bbb:	2d          	call
 bbc:	88          	im 8
 bbd:	08          	load
 bbe:	a2          	im 34
 bbf:	c4          	im -60
 bc0:	08          	load
 bc1:	52          	storesp 8
 bc2:	52          	storesp 8
 bc3:	70          	loadsp 0
 bc4:	80          	im 0
 bc5:	2e          	eq
 bc6:	80          	im 0
 bc7:	e0          	im -32
 bc8:	38          	neqbranch
 bc9:	88          	im 8
 bca:	08          	load
 bcb:	80          	im 0
 bcc:	fe          	im -2
 bcd:	2e          	eq
 bce:	09          	not
 bcf:	81          	im 1
 bd0:	06          	and
 bd1:	92          	im 18
 bd2:	38          	neqbranch
 bd3:	a2          	im 34
 bd4:	c8          	im -56
 bd5:	08          	load
 bd6:	80          	im 0
 bd7:	2e          	eq
 bd8:	e0          	im -32
 bd9:	38          	neqbranch
 bda:	80          	im 0
 bdb:	0b          	nop
 bdc:	a2          	im 34
 bdd:	c4          	im -60
 bde:	0c          	store
 bdf:	94          	im 20
 be0:	a4          	im 36
 be1:	2d          	call
 be2:	d6          	im -42
 be3:	39          	poppcrel

00000be4 <.L319>:
 be4:	88          	im 8
 be5:	08          	load
 be6:	80          	im 0
 be7:	fd          	im -3
 be8:	2e          	eq
 be9:	09          	not
 bea:	81          	im 1
 beb:	06          	and
 bec:	88          	im 8
 bed:	38          	neqbranch
 bee:	81          	im 1
 bef:	0b          	nop
 bf0:	a2          	im 34
 bf1:	c0          	im -64
 bf2:	0c          	store
 bf3:	c5          	im -59
 bf4:	39          	poppcrel

00000bf5 <.L322>:
 bf5:	a2          	im 34
 bf6:	c8          	im -56
 bf7:	08          	load
 bf8:	51          	storesp 4
 bf9:	70          	loadsp 0
 bfa:	82          	im 2
 bfb:	9f          	im 31
 bfc:	26          	ulessthan
 bfd:	a2          	im 34
 bfe:	38          	neqbranch
 bff:	a2          	im 34
 c00:	c0          	im -64
 c01:	08          	load
 c02:	80          	im 0
 c03:	2e          	eq
 c04:	8b          	im 11
 c05:	38          	neqbranch
 c06:	80          	im 0
 c07:	0b          	nop
 c08:	a2          	im 34
 c09:	c0          	im -64
 c0a:	0c          	store
 c0b:	88          	im 8
 c0c:	08          	load
 c0d:	a0          	im 32
 c0e:	32          	xor
 c0f:	52          	storesp 8

00000c10 <.L325>:
 c10:	71          	loadsp 4
 c11:	a0          	im 32
 c12:	a0          	im 32
 c13:	12          	addsp 8
 c14:	34          	storeb
 c15:	a2          	im 34
 c16:	c8          	im -56
 c17:	08          	load
 c18:	81          	im 1
 c19:	05          	add
 c1a:	a2          	im 34
 c1b:	c8          	im -56
 c1c:	0c          	store
 c1d:	ff          	im -1
 c1e:	9a          	im 26
 c1f:	39          	poppcrel

00000c20 <.L324>:
 c20:	80          	im 0
 c21:	0b          	nop
 c22:	a2          	im 34
 c23:	c4          	im -60
 c24:	0c          	store
 c25:	ff          	im -1
 c26:	92          	im 18
 c27:	39          	poppcrel

00000c28 <.L318>:
 c28:	88          	im 8
 c29:	08          	load
 c2a:	80          	im 0
 c2b:	fe          	im -2
 c2c:	2e          	eq
 c2d:	09          	not
 c2e:	81          	im 1
 c2f:	06          	and
 c30:	ff          	im -1
 c31:	87          	im 7
 c32:	38          	neqbranch
 c33:	70          	loadsp 0
 c34:	a2          	im 34
 c35:	c8          	im -56
 c36:	0c          	store
 c37:	83          	im 3
 c38:	ff          	im -1
 c39:	ff          	im -1
 c3a:	0b          	nop
 c3b:	83          	im 3
 c3c:	d0          	im -48
 c3d:	0a          	flip
 c3e:	0c          	store
 c3f:	81          	im 1
 c40:	0b          	nop
 c41:	a2          	im 34
 c42:	c4          	im -60
 c43:	0c          	store
 c44:	70          	loadsp 0
 c45:	a2          	im 34
 c46:	c0          	im -64
 c47:	0c          	store
 c48:	fe          	im -2
 c49:	ef          	im -17
 c4a:	39          	poppcrel

00000c4b <___zpu_interrupt_vector>:
 c4b:	80          	im 0
 c4c:	3d          	pushspadd
 c4d:	0d          	popsp
 c4e:	88          	im 8
 c4f:	08          	load
 c50:	8c          	im 12
 c51:	08          	load
 c52:	90          	im 16
 c53:	08          	load
 c54:	a0          	im 32
 c55:	80          	im 0
 c56:	08          	load
 c57:	51          	storesp 4
 c58:	70          	loadsp 0
 c59:	2d          	call
 c5a:	90          	im 16
 c5b:	0c          	store
 c5c:	8c          	im 12
 c5d:	0c          	store
 c5e:	8a          	im 10
 c5f:	0c          	store
 c60:	81          	im 1
 c61:	0b          	nop
 c62:	80          	im 0
 c63:	d0          	im -48
 c64:	0a          	flip
 c65:	0c          	store
 c66:	82          	im 2
 c67:	3d          	pushspadd
 c68:	0d          	popsp
 c69:	04          	poppc

00000c6a <_premain>:
 c6a:	ff          	im -1
 c6b:	3d          	pushspadd
 c6c:	0d          	popsp
 c6d:	80          	im 0
 c6e:	52          	storesp 8
 c6f:	80          	im 0
 c70:	51          	storesp 4
 c71:	96          	im 22
 c72:	e3          	im -29
 c73:	2d          	call
 c74:	83          	im 3
 c75:	3d          	pushspadd
 c76:	0d          	popsp
 c77:	04          	poppc

00000c78 <__divsi3>:
 c78:	94          	im 20
 c79:	08          	load
 c7a:	02          	pushsp
 c7b:	94          	im 20
 c7c:	0c          	store
 c7d:	f9          	im -7
 c7e:	3d          	pushspadd
 c7f:	0d          	popsp
 c80:	80          	im 0
 c81:	0b          	nop
 c82:	94          	im 20
 c83:	08          	load
 c84:	fc          	im -4
 c85:	05          	add
 c86:	0c          	store
 c87:	94          	im 20
 c88:	08          	load
 c89:	88          	im 8
 c8a:	05          	add
 c8b:	08          	load
 c8c:	80          	im 0
 c8d:	25          	lessthanorequal
 c8e:	ab          	im 43
 c8f:	38          	neqbranch
 c90:	94          	im 20
 c91:	08          	load
 c92:	88          	im 8
 c93:	05          	add
 c94:	08          	load
 c95:	30          	neg
 c96:	94          	im 20
 c97:	08          	load
 c98:	88          	im 8
 c99:	05          	add
 c9a:	0c          	store
 c9b:	80          	im 0
 c9c:	0b          	nop
 c9d:	94          	im 20
 c9e:	08          	load
 c9f:	f4          	im -12
 ca0:	05          	add
 ca1:	0c          	store
 ca2:	94          	im 20
 ca3:	08          	load
 ca4:	fc          	im -4
 ca5:	05          	add
 ca6:	08          	load
 ca7:	88          	im 8
 ca8:	38          	neqbranch
 ca9:	81          	im 1
 caa:	0b          	nop
 cab:	94          	im 20
 cac:	08          	load
 cad:	f4          	im -12
 cae:	05          	add
 caf:	0c          	store

00000cb0 <.L3>:
 cb0:	94          	im 20
 cb1:	08          	load
 cb2:	f4          	im -12
 cb3:	05          	add
 cb4:	08          	load
 cb5:	94          	im 20
 cb6:	08          	load
 cb7:	fc          	im -4
 cb8:	05          	add
 cb9:	0c          	store

00000cba <.L2>:
 cba:	94          	im 20
 cbb:	08          	load
 cbc:	8c          	im 12
 cbd:	05          	add
 cbe:	08          	load
 cbf:	80          	im 0
 cc0:	25          	lessthanorequal
 cc1:	ab          	im 43
 cc2:	38          	neqbranch
 cc3:	94          	im 20
 cc4:	08          	load
 cc5:	8c          	im 12
 cc6:	05          	add
 cc7:	08          	load
 cc8:	30          	neg
 cc9:	94          	im 20
 cca:	08          	load
 ccb:	8c          	im 12
 ccc:	05          	add
 ccd:	0c          	store
 cce:	80          	im 0
 ccf:	0b          	nop
 cd0:	94          	im 20
 cd1:	08          	load
 cd2:	f0          	im -16
 cd3:	05          	add
 cd4:	0c          	store
 cd5:	94          	im 20
 cd6:	08          	load
 cd7:	fc          	im -4
 cd8:	05          	add
 cd9:	08          	load
 cda:	88          	im 8
 cdb:	38          	neqbranch
 cdc:	81          	im 1
 cdd:	0b          	nop
 cde:	94          	im 20
 cdf:	08          	load
 ce0:	f0          	im -16
 ce1:	05          	add
 ce2:	0c          	store

00000ce3 <.L5>:
 ce3:	94          	im 20
 ce4:	08          	load
 ce5:	f0          	im -16
 ce6:	05          	add
 ce7:	08          	load
 ce8:	94          	im 20
 ce9:	08          	load
 cea:	fc          	im -4
 ceb:	05          	add
 cec:	0c          	store

00000ced <.L4>:
 ced:	80          	im 0
 cee:	53          	storesp 12
 cef:	94          	im 20
 cf0:	08          	load
 cf1:	8c          	im 12
 cf2:	05          	add
 cf3:	08          	load
 cf4:	52          	storesp 8
 cf5:	94          	im 20
 cf6:	08          	load
 cf7:	88          	im 8
 cf8:	05          	add
 cf9:	08          	load
 cfa:	51          	storesp 4
 cfb:	81          	im 1
 cfc:	a7          	im 39
 cfd:	3f          	callpcrel
 cfe:	88          	im 8
 cff:	08          	load
 d00:	70          	loadsp 0
 d01:	94          	im 20
 d02:	08          	load
 d03:	f8          	im -8
 d04:	05          	add
 d05:	0c          	store
 d06:	54          	storesp 16
 d07:	94          	im 20
 d08:	08          	load
 d09:	fc          	im -4
 d0a:	05          	add
 d0b:	08          	load
 d0c:	80          	im 0
 d0d:	2e          	eq
 d0e:	8c          	im 12
 d0f:	38          	neqbranch
 d10:	94          	im 20
 d11:	08          	load
 d12:	f8          	im -8
 d13:	05          	add
 d14:	08          	load
 d15:	30          	neg
 d16:	94          	im 20
 d17:	08          	load
 d18:	f8          	im -8
 d19:	05          	add
 d1a:	0c          	store

00000d1b <.L6>:
 d1b:	94          	im 20
 d1c:	08          	load
 d1d:	f8          	im -8
 d1e:	05          	add
 d1f:	08          	load
 d20:	70          	loadsp 0
 d21:	88          	im 8
 d22:	0c          	store
 d23:	54          	storesp 16
 d24:	89          	im 9
 d25:	3d          	pushspadd
 d26:	0d          	popsp
 d27:	94          	im 20
 d28:	0c          	store
 d29:	04          	poppc

00000d2a <__modsi3>:
 d2a:	94          	im 20
 d2b:	08          	load
 d2c:	02          	pushsp
 d2d:	94          	im 20
 d2e:	0c          	store
 d2f:	fb          	im -5
 d30:	3d          	pushspadd
 d31:	0d          	popsp
 d32:	80          	im 0
 d33:	0b          	nop
 d34:	94          	im 20
 d35:	08          	load
 d36:	fc          	im -4
 d37:	05          	add
 d38:	0c          	store
 d39:	94          	im 20
 d3a:	08          	load
 d3b:	88          	im 8
 d3c:	05          	add
 d3d:	08          	load
 d3e:	80          	im 0
 d3f:	25          	lessthanorequal
 d40:	93          	im 19
 d41:	38          	neqbranch
 d42:	94          	im 20
 d43:	08          	load
 d44:	88          	im 8
 d45:	05          	add
 d46:	08          	load
 d47:	30          	neg
 d48:	94          	im 20
 d49:	08          	load
 d4a:	88          	im 8
 d4b:	05          	add
 d4c:	0c          	store
 d4d:	81          	im 1
 d4e:	0b          	nop
 d4f:	94          	im 20
 d50:	08          	load
 d51:	fc          	im -4
 d52:	05          	add
 d53:	0c          	store

00000d54 <.L8>:
 d54:	94          	im 20
 d55:	08          	load
 d56:	8c          	im 12
 d57:	05          	add
 d58:	08          	load
 d59:	80          	im 0
 d5a:	25          	lessthanorequal
 d5b:	8c          	im 12
 d5c:	38          	neqbranch
 d5d:	94          	im 20
 d5e:	08          	load
 d5f:	8c          	im 12
 d60:	05          	add
 d61:	08          	load
 d62:	30          	neg
 d63:	94          	im 20
 d64:	08          	load
 d65:	8c          	im 12
 d66:	05          	add
 d67:	0c          	store

00000d68 <.L9>:
 d68:	81          	im 1
 d69:	53          	storesp 12
 d6a:	94          	im 20
 d6b:	08          	load
 d6c:	8c          	im 12
 d6d:	05          	add
 d6e:	08          	load
 d6f:	52          	storesp 8
 d70:	94          	im 20
 d71:	08          	load
 d72:	88          	im 8
 d73:	05          	add
 d74:	08          	load
 d75:	51          	storesp 4
 d76:	ad          	im 45
 d77:	3f          	callpcrel
 d78:	88          	im 8
 d79:	08          	load
 d7a:	70          	loadsp 0
 d7b:	94          	im 20
 d7c:	08          	load
 d7d:	f8          	im -8
 d7e:	05          	add
 d7f:	0c          	store
 d80:	54          	storesp 16
 d81:	94          	im 20
 d82:	08          	load
 d83:	fc          	im -4
 d84:	05          	add
 d85:	08          	load
 d86:	80          	im 0
 d87:	2e          	eq
 d88:	8c          	im 12
 d89:	38          	neqbranch
 d8a:	94          	im 20
 d8b:	08          	load
 d8c:	f8          	im -8
 d8d:	05          	add
 d8e:	08          	load
 d8f:	30          	neg
 d90:	94          	im 20
 d91:	08          	load
 d92:	f8          	im -8
 d93:	05          	add
 d94:	0c          	store

00000d95 <.L10>:
 d95:	94          	im 20
 d96:	08          	load
 d97:	f8          	im -8
 d98:	05          	add
 d99:	08          	load
 d9a:	70          	loadsp 0
 d9b:	88          	im 8
 d9c:	0c          	store
 d9d:	54          	storesp 16
 d9e:	87          	im 7
 d9f:	3d          	pushspadd
 da0:	0d          	popsp
 da1:	94          	im 20
 da2:	0c          	store
 da3:	04          	poppc

00000da4 <udivmodsi4>:
 da4:	94          	im 20
 da5:	08          	load
 da6:	02          	pushsp
 da7:	94          	im 20
 da8:	0c          	store
 da9:	fd          	im -3
 daa:	3d          	pushspadd
 dab:	0d          	popsp
 dac:	81          	im 1
 dad:	0b          	nop
 dae:	94          	im 20
 daf:	08          	load
 db0:	fc          	im -4
 db1:	05          	add
 db2:	0c          	store
 db3:	80          	im 0
 db4:	0b          	nop
 db5:	94          	im 20
 db6:	08          	load
 db7:	f8          	im -8
 db8:	05          	add
 db9:	0c          	store

00000dba <.L2>:
 dba:	94          	im 20
 dbb:	08          	load
 dbc:	8c          	im 12
 dbd:	05          	add
 dbe:	08          	load
 dbf:	94          	im 20
 dc0:	08          	load
 dc1:	88          	im 8
 dc2:	05          	add
 dc3:	08          	load
 dc4:	27          	ulessthanorequal
 dc5:	ac          	im 44
 dc6:	38          	neqbranch
 dc7:	94          	im 20
 dc8:	08          	load
 dc9:	fc          	im -4
 dca:	05          	add
 dcb:	08          	load
 dcc:	80          	im 0
 dcd:	2e          	eq
 dce:	a3          	im 35
 dcf:	38          	neqbranch
 dd0:	80          	im 0
 dd1:	0b          	nop
 dd2:	94          	im 20
 dd3:	08          	load
 dd4:	8c          	im 12
 dd5:	05          	add
 dd6:	08          	load
 dd7:	24          	lessthan
 dd8:	99          	im 25
 dd9:	38          	neqbranch
 dda:	94          	im 20
 ddb:	08          	load
 ddc:	8c          	im 12
 ddd:	05          	add
 dde:	08          	load
 ddf:	10          	addsp 0
 de0:	94          	im 20
 de1:	08          	load
 de2:	8c          	im 12
 de3:	05          	add
 de4:	0c          	store
 de5:	94          	im 20
 de6:	08          	load
 de7:	fc          	im -4
 de8:	05          	add
 de9:	08          	load
 dea:	10          	addsp 0
 deb:	94          	im 20
 dec:	08          	load
 ded:	fc          	im -4
 dee:	05          	add
 def:	0c          	store
 df0:	c9          	im -55
 df1:	39          	poppcrel

00000df2 <.L4>:
 df2:	94          	im 20
 df3:	08          	load
 df4:	fc          	im -4
 df5:	05          	add
 df6:	08          	load
 df7:	80          	im 0
 df8:	2e          	eq
 df9:	80          	im 0
 dfa:	c9          	im -55
 dfb:	38          	neqbranch
 dfc:	94          	im 20
 dfd:	08          	load
 dfe:	8c          	im 12
 dff:	05          	add
 e00:	08          	load
 e01:	94          	im 20
 e02:	08          	load
 e03:	88          	im 8
 e04:	05          	add
 e05:	08          	load
 e06:	26          	ulessthan
 e07:	a1          	im 33
 e08:	38          	neqbranch
 e09:	94          	im 20
 e0a:	08          	load
 e0b:	88          	im 8
 e0c:	05          	add
 e0d:	08          	load
 e0e:	94          	im 20
 e0f:	08          	load
 e10:	8c          	im 12
 e11:	05          	add
 e12:	08          	load
 e13:	31          	sub
 e14:	94          	im 20
 e15:	08          	load
 e16:	88          	im 8
 e17:	05          	add
 e18:	0c          	store
 e19:	94          	im 20
 e1a:	08          	load
 e1b:	f8          	im -8
 e1c:	05          	add
 e1d:	08          	load
 e1e:	94          	im 20
 e1f:	08          	load
 e20:	fc          	im -4
 e21:	05          	add
 e22:	08          	load
 e23:	07          	or
 e24:	94          	im 20
 e25:	08          	load
 e26:	f8          	im -8
 e27:	05          	add
 e28:	0c          	store

00000e29 <.L6>:
 e29:	94          	im 20
 e2a:	08          	load
 e2b:	fc          	im -4
 e2c:	05          	add
 e2d:	08          	load
 e2e:	81          	im 1
 e2f:	2a          	lshiftright
 e30:	94          	im 20
 e31:	08          	load
 e32:	fc          	im -4
 e33:	05          	add
 e34:	0c          	store
 e35:	94          	im 20
 e36:	08          	load
 e37:	8c          	im 12
 e38:	05          	add
 e39:	08          	load
 e3a:	81          	im 1
 e3b:	2a          	lshiftright
 e3c:	94          	im 20
 e3d:	08          	load
 e3e:	8c          	im 12
 e3f:	05          	add
 e40:	0c          	store
 e41:	ff          	im -1
 e42:	af          	im 47
 e43:	39          	poppcrel

00000e44 <.L5>:
 e44:	94          	im 20
 e45:	08          	load
 e46:	90          	im 16
 e47:	05          	add
 e48:	08          	load
 e49:	80          	im 0
 e4a:	2e          	eq
 e4b:	8f          	im 15
 e4c:	38          	neqbranch
 e4d:	94          	im 20
 e4e:	08          	load
 e4f:	88          	im 8
 e50:	05          	add
 e51:	08          	load
 e52:	70          	loadsp 0
 e53:	94          	im 20
 e54:	08          	load
 e55:	f4          	im -12
 e56:	05          	add
 e57:	0c          	store
 e58:	51          	storesp 4
 e59:	8d          	im 13
 e5a:	39          	poppcrel

00000e5b <.L7>:
 e5b:	94          	im 20
 e5c:	08          	load
 e5d:	f8          	im -8
 e5e:	05          	add
 e5f:	08          	load
 e60:	70          	loadsp 0
 e61:	94          	im 20
 e62:	08          	load
 e63:	f4          	im -12
 e64:	05          	add
 e65:	0c          	store
 e66:	51          	storesp 4

00000e67 <.L1>:
 e67:	94          	im 20
 e68:	08          	load
 e69:	f4          	im -12
 e6a:	05          	add
 e6b:	08          	load
 e6c:	88          	im 8
 e6d:	0c          	store
 e6e:	85          	im 5
 e6f:	3d          	pushspadd
 e70:	0d          	popsp
 e71:	94          	im 20
 e72:	0c          	store
 e73:	04          	poppc

00000e74 <__do_global_ctors_aux>:
 e74:	ff          	im -1
 e75:	3d          	pushspadd
 e76:	0d          	popsp
 e77:	9e          	im 30
 e78:	94          	im 20
 e79:	0b          	nop
 e7a:	fc          	im -4
 e7b:	05          	add
 e7c:	70          	loadsp 0
 e7d:	08          	load
 e7e:	52          	storesp 8
 e7f:	52          	storesp 8
 e80:	70          	loadsp 0
 e81:	ff          	im -1
 e82:	2e          	eq
 e83:	91          	im 17
 e84:	38          	neqbranch

00000e85 <.L10>:
 e85:	70          	loadsp 0
 e86:	2d          	call
 e87:	fc          	im -4
 e88:	12          	addsp 8
 e89:	70          	loadsp 0
 e8a:	08          	load
 e8b:	52          	storesp 8
 e8c:	52          	storesp 8
 e8d:	70          	loadsp 0
 e8e:	ff          	im -1
 e8f:	2e          	eq
 e90:	09          	not
 e91:	81          	im 1
 e92:	06          	and
 e93:	f1          	im -15
 e94:	38          	neqbranch

00000e95 <.L7>:
 e95:	83          	im 3
 e96:	3d          	pushspadd
 e97:	0d          	popsp
 e98:	04          	poppc

00000e99 <call___do_global_ctors_aux>:
 e99:	04          	poppc
Disassembly of section .fini:

00000e9a <_fini>:
 e9a:	ec          	im -20
 e9b:	83          	im 3
 e9c:	3f          	callpcrel
 e9d:	04          	poppc
Disassembly of section .rodata:

00000ea0 <_mask>:
 ea0:	00          	breakpoint
 ea1:	ff          	im -1
 ea2:	ff          	im -1
 ea3:	ff          	im -1
 ea4:	ff          	im -1
 ea5:	00          	breakpoint
 ea6:	ff          	im -1
 ea7:	ff          	im -1
 ea8:	ff          	im -1
 ea9:	ff          	im -1
 eaa:	00          	breakpoint
 eab:	ff          	im -1
 eac:	ff          	im -1
 ead:	ff          	im -1
 eae:	ff          	im -1
	...

00000eb0 <bdata>:
 eb0:	00          	breakpoint
 eb1:	00          	breakpoint
	...

00000eb4 <handlers>:
 eb4:	00          	breakpoint
 eb5:	00          	breakpoint
 eb6:	09          	not
 eb7:	76          	loadsp 24
 eb8:	00          	breakpoint
 eb9:	00          	breakpoint
 eba:	09          	not
 ebb:	96          	im 22
 ebc:	00          	breakpoint
 ebd:	00          	breakpoint
 ebe:	09          	not
 ebf:	31          	sub
 ec0:	00          	breakpoint
 ec1:	00          	breakpoint
 ec2:	08          	load
 ec3:	3d          	pushspadd
 ec4:	00          	breakpoint
 ec5:	00          	breakpoint
 ec6:	09          	not
 ec7:	ee          	im -18
 ec8:	00          	breakpoint
 ec9:	00          	breakpoint
 eca:	0a          	flip
 ecb:	05          	add
 ecc:	00          	breakpoint
 ecd:	00          	breakpoint
 ece:	08          	load
 ecf:	cc          	im -52
 ed0:	00          	breakpoint
 ed1:	00          	breakpoint
 ed2:	08          	load
 ed3:	e2          	im -30
 ed4:	00          	breakpoint
 ed5:	00          	breakpoint
 ed6:	08          	load
 ed7:	3c          	syscall
 ed8:	00          	breakpoint
 ed9:	00          	breakpoint
 eda:	0a          	flip
 edb:	19          	addsp 36

00000edc <vstring>:
 edc:	01          	.byte 1
 edd:	07          	or
 ede:	00          	breakpoint
 edf:	00          	breakpoint
 ee0:	00          	breakpoint
 ee1:	00          	breakpoint
 ee2:	6f          	loadsp 124
 ee3:	80          	im 0
 ee4:	05          	add
 ee5:	b8          	im 56
 ee6:	d8          	im -40
 ee7:	00          	breakpoint
 ee8:	83          	im 3
 ee9:	01          	.byte 1
 eea:	0f          	.byte 15
 eeb:	00          	breakpoint
 eec:	43          	storesp 76
 eed:	52          	storesp 8
 eee:	43          	storesp 76
 eef:	00          	breakpoint
 ef0:	42          	storesp 72
 ef1:	4f          	storesp 124
 ef2:	41          	storesp 68
 ef3:	52          	storesp 8
 ef4:	44          	storesp 80
 ef5:	20          	.byte 32
 ef6:	00          	breakpoint
 ef7:	00          	breakpoint
 ef8:	20          	.byte 32
 ef9:	21          	.byte 33
 efa:	3d          	pushspadd
 efb:	20          	.byte 32
	...
Disassembly of section .rodata1:

00000efd <.rodata1>:
 efd:	00          	breakpoint
	...
Disassembly of section .data:

0000100c <__data_start>:
    100c:	00          	breakpoint
    100d:	00          	breakpoint
	...

00001010 <_cpu_config>:
    1010:	00          	breakpoint
    1011:	00          	breakpoint
	...

00001014 <__dso_handle>:
    1014:	00          	breakpoint
    1015:	00          	breakpoint
	...

00001018 <p.0>:
    1018:	00          	breakpoint
    1019:	00          	breakpoint
    101a:	0f          	.byte 15
    101b:	1c          	addsp 48
Disassembly of section .ctors:

00000f10 <___ctors>:
 f10:	ff          	im -1
 f11:	ff          	im -1
 f12:	ff          	im -1
 f13:	ff          	im -1

00000f14 <__CTOR_END__>:
 f14:	00          	breakpoint
 f15:	00          	breakpoint
	...
Disassembly of section .dtors:

00000f18 <___dtors>:
 f18:	ff          	im -1
 f19:	ff          	im -1
 f1a:	ff          	im -1
 f1b:	ff          	im -1

00000f1c <__DTOR_END__>:
 f1c:	00          	breakpoint
 f1d:	00          	breakpoint
	...
Disassembly of section .jcr:

00000f20 <___jcr_begin>:
 f20:	00          	breakpoint
 f21:	00          	breakpoint
	...
Disassembly of section .bss:

0000101c <completed.1>:
    101c:	00          	breakpoint
    101d:	00          	breakpoint
	...

00001020 <buffer>:
	...

00001140 <unescaping>:
    1140:	00          	breakpoint
    1141:	00          	breakpoint
	...

00001144 <syncSeen>:
    1144:	00          	breakpoint
    1145:	00          	breakpoint
	...

00001148 <bufferpos>:
    1148:	00          	breakpoint
    1149:	00          	breakpoint
	...

0000114c <milisseconds>:
    114c:	00          	breakpoint
    114d:	00          	breakpoint
	...

00001150 <inprogrammode>:
    1150:	00          	breakpoint
    1151:	00          	breakpoint
	...

00001154 <flash_id>:
    1154:	00          	breakpoint
    1155:	00          	breakpoint
	...
Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	00          	breakpoint
   1:	00          	breakpoint
   2:	00          	breakpoint
   3:	3c          	syscall
   4:	00          	breakpoint
   5:	02          	pushsp
   6:	00          	breakpoint
   7:	00          	breakpoint
   8:	00          	breakpoint
   9:	00          	breakpoint
   a:	04          	poppc
	...
  1f:	2d          	call
  20:	00          	breakpoint
  21:	00          	breakpoint
  22:	00          	breakpoint
  23:	00          	breakpoint
  24:	00          	breakpoint
  25:	00          	breakpoint
  26:	00          	breakpoint
  27:	25          	lessthanorequal
  28:	00          	breakpoint
  29:	00          	breakpoint
  2a:	00          	breakpoint
  2b:	00          	breakpoint
  2c:	00          	breakpoint
  2d:	00          	breakpoint
  2e:	00          	breakpoint
  2f:	85          	im 5
  30:	00          	breakpoint
  31:	00          	breakpoint
  32:	00          	breakpoint
  33:	00          	breakpoint
  34:	00          	breakpoint
  35:	00          	breakpoint
  36:	00          	breakpoint
  37:	70          	loadsp 0
	...
  40:	00          	breakpoint
  41:	00          	breakpoint
  42:	00          	breakpoint
  43:	1c          	addsp 48
  44:	00          	breakpoint
  45:	02          	pushsp
  46:	00          	breakpoint
  47:	00          	breakpoint
  48:	01          	.byte 1
  49:	75          	loadsp 20
  4a:	04          	poppc
	...
  57:	bc          	im 60
	...
Disassembly of section .debug_pubnames:

00000000 <.debug_pubnames>:
   0:	00          	breakpoint
   1:	00          	breakpoint
   2:	00          	breakpoint
   3:	49          	storesp 100
   4:	00          	breakpoint
   5:	02          	pushsp
   6:	00          	breakpoint
   7:	00          	breakpoint
   8:	00          	breakpoint
   9:	00          	breakpoint
   a:	00          	breakpoint
   b:	00          	breakpoint
   c:	01          	.byte 1
   d:	75          	loadsp 20
   e:	00          	breakpoint
   f:	00          	breakpoint
  10:	00          	breakpoint
  11:	6a          	loadsp 104
  12:	69          	loadsp 100
  13:	6e          	loadsp 120
  14:	62          	loadsp 72
  15:	79          	loadsp 36
  16:	74          	loadsp 16
  17:	65          	loadsp 84
  18:	00          	breakpoint
  19:	00          	breakpoint
  1a:	00          	breakpoint
  1b:	00          	breakpoint
  1c:	93          	im 19
  1d:	6f          	loadsp 124
  1e:	75          	loadsp 20
  1f:	74          	loadsp 16
  20:	62          	loadsp 72
  21:	79          	loadsp 36
  22:	74          	loadsp 16
  23:	65          	loadsp 84
  24:	00          	breakpoint
  25:	00          	breakpoint
  26:	00          	breakpoint
  27:	00          	breakpoint
  28:	b8          	im 56
  29:	5f          	storesp 60
  2a:	69          	loadsp 100
  2b:	6e          	loadsp 120
  2c:	69          	loadsp 100
  2d:	74          	loadsp 16
  2e:	49          	storesp 100
  2f:	4f          	storesp 124
  30:	00          	breakpoint
  31:	00          	breakpoint
  32:	00          	breakpoint
  33:	00          	breakpoint
  34:	cc          	im -52
  35:	5f          	storesp 60
  36:	72          	loadsp 8
  37:	65          	loadsp 84
  38:	61          	loadsp 68
  39:	64          	loadsp 80
  3a:	43          	storesp 76
  3b:	79          	loadsp 36
  3c:	63          	loadsp 76
  3d:	6c          	loadsp 112
  3e:	65          	loadsp 84
  3f:	73          	loadsp 12
  40:	00          	breakpoint
  41:	00          	breakpoint
  42:	00          	breakpoint
  43:	01          	.byte 1
  44:	4c          	storesp 112
  45:	4d          	storesp 116
  46:	48          	storesp 96
  47:	5a          	storesp 40
	...
  50:	19          	addsp 36
  51:	00          	breakpoint
  52:	02          	pushsp
  53:	00          	breakpoint
  54:	00          	breakpoint
  55:	01          	.byte 1
  56:	75          	loadsp 20
  57:	00          	breakpoint
  58:	00          	breakpoint
  59:	00          	breakpoint
  5a:	ff          	im -1
  5b:	00          	breakpoint
  5c:	00          	breakpoint
  5d:	00          	breakpoint
  5e:	45          	storesp 84
  5f:	6d          	loadsp 116
  60:	65          	loadsp 84
  61:	6d          	loadsp 116
  62:	63          	loadsp 76
  63:	70          	loadsp 0
  64:	79          	loadsp 36
  65:	00          	breakpoint
  66:	00          	breakpoint
  67:	00          	breakpoint
	...
Disassembly of section .debug_info:

00000000 <.Ldebug_info0>:
   0:	00          	breakpoint
   1:	00          	breakpoint
   2:	01          	.byte 1
   3:	71          	loadsp 4
   4:	00          	breakpoint
   5:	02          	pushsp
   6:	00          	breakpoint
   7:	00          	breakpoint
   8:	00          	breakpoint
   9:	00          	breakpoint
   a:	04          	poppc
   b:	01          	.byte 1
   c:	00          	breakpoint
   d:	00          	breakpoint
   e:	00          	breakpoint
   f:	00          	breakpoint
  10:	00          	breakpoint
  11:	00          	breakpoint
  12:	00          	breakpoint
  13:	ad          	im 45
  14:	01          	.byte 1
  15:	00          	breakpoint
  16:	00          	breakpoint
  17:	00          	breakpoint
  18:	c3          	im -61
  19:	00          	breakpoint
  1a:	00          	breakpoint
  1b:	00          	breakpoint
  1c:	23          	storeh
  1d:	02          	pushsp
  1e:	00          	breakpoint
  1f:	00          	breakpoint
  20:	00          	breakpoint
  21:	11          	addsp 4
  22:	04          	poppc
  23:	07          	or
  24:	02          	pushsp
  25:	00          	breakpoint
  26:	00          	breakpoint
  27:	00          	breakpoint
  28:	77          	loadsp 28
  29:	04          	poppc
  2a:	05          	add
  2b:	02          	pushsp
  2c:	00          	breakpoint
  2d:	00          	breakpoint
  2e:	00          	breakpoint
  2f:	72          	loadsp 8
  30:	08          	load
  31:	05          	add
  32:	03          	.byte 3
  33:	69          	loadsp 100
  34:	6e          	loadsp 120
  35:	74          	loadsp 16
  36:	00          	breakpoint
  37:	04          	poppc
  38:	05          	add
  39:	02          	pushsp
  3a:	00          	breakpoint
  3b:	00          	breakpoint
  3c:	00          	breakpoint
  3d:	16          	addsp 24
  3e:	04          	poppc
  3f:	07          	or
  40:	02          	pushsp
  41:	00          	breakpoint
  42:	00          	breakpoint
  43:	00          	breakpoint
  44:	11          	addsp 4
  45:	04          	poppc
  46:	07          	or
  47:	02          	pushsp
  48:	00          	breakpoint
  49:	00          	breakpoint
  4a:	00          	breakpoint
  4b:	e9          	im -23
  4c:	01          	.byte 1
  4d:	08          	load
  4e:	02          	pushsp
  4f:	00          	breakpoint
  50:	00          	breakpoint
  51:	00          	breakpoint
  52:	f7          	im -9
  53:	02          	pushsp
  54:	05          	add
  55:	02          	pushsp
  56:	00          	breakpoint
  57:	00          	breakpoint
  58:	00          	breakpoint
  59:	f2          	im -14
  5a:	01          	.byte 1
  5b:	08          	load
  5c:	02          	pushsp
  5d:	00          	breakpoint
  5e:	00          	breakpoint
  5f:	00          	breakpoint
  60:	9a          	im 26
  61:	02          	pushsp
  62:	07          	or
  63:	02          	pushsp
  64:	00          	breakpoint
  65:	00          	breakpoint
  66:	00          	breakpoint
  67:	0c          	store
  68:	08          	load
  69:	07          	or
  6a:	04          	poppc
  6b:	00          	breakpoint
  6c:	00          	breakpoint
  6d:	00          	breakpoint
  6e:	93          	im 19
  6f:	01          	.byte 1
  70:	00          	breakpoint
  71:	00          	breakpoint
  72:	01          	.byte 1
  73:	01          	.byte 1
  74:	0b          	nop
  75:	18          	addsp 32
  76:	00          	breakpoint
  77:	00          	breakpoint
  78:	00          	breakpoint
  79:	32          	xor
	...
  82:	02          	pushsp
  83:	90          	im 16
  84:	20          	.byte 32
  85:	05          	add
  86:	76          	loadsp 24
  87:	61          	loadsp 68
  88:	6c          	loadsp 112
  89:	00          	breakpoint
  8a:	0b          	nop
  8b:	19          	addsp 36
  8c:	00          	breakpoint
  8d:	00          	breakpoint
  8e:	00          	breakpoint
  8f:	32          	xor
  90:	01          	.byte 1
  91:	59          	storesp 36
  92:	00          	breakpoint
  93:	06          	and
  94:	00          	breakpoint
  95:	00          	breakpoint
  96:	00          	breakpoint
  97:	b8          	im 56
  98:	01          	.byte 1
  99:	00          	breakpoint
  9a:	00          	breakpoint
  9b:	00          	breakpoint
  9c:	86          	im 6
  9d:	0b          	nop
  9e:	2c          	ashiftright
  9f:	01          	.byte 1
	...
  a8:	02          	pushsp
  a9:	90          	im 16
  aa:	20          	.byte 32
  ab:	07          	or
  ac:	63          	loadsp 76
  ad:	00          	breakpoint
  ae:	0b          	nop
  af:	2b          	ashiftleft
  b0:	00          	breakpoint
  b1:	00          	breakpoint
  b2:	00          	breakpoint
  b3:	32          	xor
  b4:	02          	pushsp
  b5:	91          	im 17
  b6:	0c          	store
  b7:	00          	breakpoint
  b8:	08          	load
  b9:	01          	.byte 1
  ba:	00          	breakpoint
  bb:	00          	breakpoint
  bc:	01          	.byte 1
  bd:	0d          	popsp
  be:	0b          	nop
  bf:	35          	div
  c0:	01          	.byte 1
	...
  c9:	02          	pushsp
  ca:	90          	im 16
  cb:	20          	.byte 32
  cc:	04          	poppc
  cd:	00          	breakpoint
  ce:	00          	breakpoint
  cf:	01          	.byte 1
  d0:	05          	add
  d1:	01          	.byte 1
  d2:	00          	breakpoint
  d3:	00          	breakpoint
  d4:	00          	breakpoint
  d5:	8e          	im 14
  d6:	0b          	nop
  d7:	50          	storesp 0
  d8:	00          	breakpoint
  d9:	00          	breakpoint
  da:	00          	breakpoint
  db:	2b          	ashiftleft
	...
  e4:	02          	pushsp
  e5:	90          	im 16
  e6:	20          	.byte 32
  e7:	09          	not
  e8:	00          	breakpoint
  e9:	00          	breakpoint
  ea:	01          	.byte 1
  eb:	15          	addsp 20
  ec:	0b          	nop
  ed:	51          	storesp 4
  ee:	00          	breakpoint
  ef:	00          	breakpoint
  f0:	00          	breakpoint
  f1:	2b          	ashiftleft
  f2:	06          	and
  f3:	5c          	storesp 48
  f4:	93          	im 19
  f5:	04          	poppc
  f6:	5d          	storesp 52
  f7:	93          	im 19
  f8:	04          	poppc
  f9:	05          	add
  fa:	69          	loadsp 100
  fb:	00          	breakpoint
  fc:	0b          	nop
  fd:	52          	storesp 8
  fe:	00          	breakpoint
  ff:	00          	breakpoint
 100:	00          	breakpoint
 101:	39          	poppcrel
 102:	01          	.byte 1
 103:	5e          	storesp 56
 104:	00          	breakpoint
 105:	0a          	flip
 106:	00          	breakpoint
 107:	00          	breakpoint
 108:	00          	breakpoint
 109:	b9          	im 57
 10a:	0b          	nop
 10b:	06          	and
 10c:	00          	breakpoint
 10d:	00          	breakpoint
 10e:	00          	breakpoint
 10f:	32          	xor
 110:	01          	.byte 1
 111:	01          	.byte 1
 112:	0a          	flip
 113:	00          	breakpoint
 114:	00          	breakpoint
 115:	00          	breakpoint
 116:	00          	breakpoint
 117:	0b          	nop
 118:	0b          	nop
 119:	00          	breakpoint
 11a:	00          	breakpoint
 11b:	00          	breakpoint
 11c:	32          	xor
 11d:	01          	.byte 1
 11e:	01          	.byte 1
 11f:	09          	not
 120:	00          	breakpoint
 121:	00          	breakpoint
 122:	01          	.byte 1
 123:	08          	load
 124:	0b          	nop
 125:	0c          	store
 126:	00          	breakpoint
 127:	00          	breakpoint
 128:	01          	.byte 1
 129:	30          	neg
 12a:	05          	add
 12b:	03          	.byte 3
 12c:	00          	breakpoint
 12d:	00          	breakpoint
 12e:	00          	breakpoint
 12f:	00          	breakpoint
 130:	0b          	nop
 131:	04          	poppc
 132:	00          	breakpoint
 133:	00          	breakpoint
 134:	01          	.byte 1
 135:	36          	mod
 136:	0c          	store
 137:	00          	breakpoint
 138:	00          	breakpoint
 139:	00          	breakpoint
 13a:	32          	xor
 13b:	09          	not
 13c:	00          	breakpoint
 13d:	00          	breakpoint
 13e:	00          	breakpoint
 13f:	80          	im 0
 140:	0b          	nop
 141:	0d          	popsp
 142:	00          	breakpoint
 143:	00          	breakpoint
 144:	01          	.byte 1
 145:	30          	neg
 146:	05          	add
 147:	03          	.byte 3
 148:	00          	breakpoint
 149:	00          	breakpoint
 14a:	00          	breakpoint
 14b:	00          	breakpoint
 14c:	0d          	popsp
 14d:	4d          	storesp 116
 14e:	48          	storesp 96
 14f:	5a          	storesp 40
 150:	00          	breakpoint
 151:	0b          	nop
 152:	0e          	.byte 14
 153:	00          	breakpoint
 154:	00          	breakpoint
 155:	01          	.byte 1
 156:	30          	neg
 157:	01          	.byte 1
 158:	05          	add
 159:	03          	.byte 3
 15a:	00          	breakpoint
 15b:	00          	breakpoint
 15c:	00          	breakpoint
 15d:	00          	breakpoint
 15e:	05          	add
 15f:	6d          	loadsp 116
 160:	68          	loadsp 96
 161:	7a          	loadsp 40
 162:	00          	breakpoint
 163:	0b          	nop
 164:	32          	xor
 165:	00          	breakpoint
 166:	00          	breakpoint
 167:	01          	.byte 1
 168:	6f          	loadsp 124
 169:	05          	add
 16a:	03          	.byte 3
 16b:	00          	breakpoint
 16c:	00          	breakpoint
 16d:	00          	breakpoint
 16e:	00          	breakpoint
 16f:	0e          	.byte 14
 170:	00          	breakpoint
 171:	00          	breakpoint
 172:	00          	breakpoint
 173:	32          	xor
	...

00000175 <.Ldebug_info0>:
 175:	00          	breakpoint
 176:	00          	breakpoint
 177:	00          	breakpoint
 178:	fb          	im -5
 179:	00          	breakpoint
 17a:	02          	pushsp
 17b:	00          	breakpoint
 17c:	00          	breakpoint
 17d:	00          	breakpoint
 17e:	cf          	im -49
 17f:	04          	poppc
 180:	01          	.byte 1
 181:	00          	breakpoint
 182:	00          	breakpoint
 183:	02          	pushsp
 184:	a7          	im 39
	...
 18d:	00          	breakpoint
 18e:	00          	breakpoint
 18f:	00          	breakpoint
 190:	ad          	im 45
 191:	01          	.byte 1
 192:	00          	breakpoint
 193:	00          	breakpoint
 194:	01          	.byte 1
 195:	3f          	callpcrel
 196:	00          	breakpoint
 197:	00          	breakpoint
 198:	01          	.byte 1
 199:	7f          	loadsp 60
 19a:	02          	pushsp
 19b:	00          	breakpoint
 19c:	00          	breakpoint
 19d:	00          	breakpoint
 19e:	77          	loadsp 28
 19f:	04          	poppc
 1a0:	05          	add
 1a1:	03          	.byte 3
 1a2:	00          	breakpoint
 1a3:	00          	breakpoint
 1a4:	01          	.byte 1
 1a5:	27          	ulessthanorequal
 1a6:	01          	.byte 1
 1a7:	d5          	im -43
 1a8:	00          	breakpoint
 1a9:	00          	breakpoint
 1aa:	00          	breakpoint
 1ab:	37          	eqbranch
 1ac:	02          	pushsp
 1ad:	00          	breakpoint
 1ae:	00          	breakpoint
 1af:	00          	breakpoint
 1b0:	11          	addsp 4
 1b1:	04          	poppc
 1b2:	07          	or
 1b3:	04          	poppc
 1b4:	69          	loadsp 100
 1b5:	6e          	loadsp 120
 1b6:	74          	loadsp 16
 1b7:	00          	breakpoint
 1b8:	04          	poppc
 1b9:	05          	add
 1ba:	05          	add
 1bb:	00          	breakpoint
 1bc:	00          	breakpoint
 1bd:	00          	breakpoint
 1be:	cc          	im -52
 1bf:	01          	.byte 1
 1c0:	00          	breakpoint
 1c1:	00          	breakpoint
 1c2:	01          	.byte 1
 1c3:	73          	loadsp 12
 1c4:	02          	pushsp
 1c5:	39          	poppcrel
 1c6:	01          	.byte 1
 1c7:	00          	breakpoint
 1c8:	00          	breakpoint
 1c9:	00          	breakpoint
 1ca:	cc          	im -52
	...
 1d3:	02          	pushsp
 1d4:	90          	im 16
 1d5:	20          	.byte 32
 1d6:	06          	and
 1d7:	00          	breakpoint
 1d8:	00          	breakpoint
 1d9:	01          	.byte 1
 1da:	6e          	loadsp 120
 1db:	02          	pushsp
 1dc:	35          	div
 1dd:	00          	breakpoint
 1de:	00          	breakpoint
 1df:	00          	breakpoint
 1e0:	cc          	im -52
 1e1:	01          	.byte 1
 1e2:	5c          	storesp 48
 1e3:	06          	and
 1e4:	00          	breakpoint
 1e5:	00          	breakpoint
 1e6:	01          	.byte 1
 1e7:	3a          	config
 1e8:	02          	pushsp
 1e9:	35          	div
 1ea:	00          	breakpoint
 1eb:	00          	breakpoint
 1ec:	00          	breakpoint
 1ed:	ce          	im -50
 1ee:	02          	pushsp
 1ef:	91          	im 17
 1f0:	1c          	addsp 48
 1f1:	06          	and
 1f2:	00          	breakpoint
 1f3:	00          	breakpoint
 1f4:	01          	.byte 1
 1f5:	7a          	loadsp 40
 1f6:	02          	pushsp
 1f7:	35          	div
 1f8:	00          	breakpoint
 1f9:	00          	breakpoint
 1fa:	00          	breakpoint
 1fb:	2c          	ashiftright
 1fc:	02          	pushsp
 1fd:	91          	im 17
 1fe:	20          	.byte 32
 1ff:	07          	or
 200:	64          	loadsp 80
 201:	73          	loadsp 12
 202:	74          	loadsp 16
 203:	00          	breakpoint
 204:	02          	pushsp
 205:	47          	storesp 92
 206:	00          	breakpoint
 207:	00          	breakpoint
 208:	00          	breakpoint
 209:	d5          	im -43
 20a:	01          	.byte 1
 20b:	5b          	storesp 44
 20c:	07          	or
 20d:	73          	loadsp 12
 20e:	72          	loadsp 8
 20f:	63          	loadsp 76
 210:	00          	breakpoint
 211:	02          	pushsp
 212:	48          	storesp 96
 213:	00          	breakpoint
 214:	00          	breakpoint
 215:	00          	breakpoint
 216:	e2          	im -30
 217:	01          	.byte 1
 218:	5a          	storesp 40
 219:	08          	load
 21a:	00          	breakpoint
 21b:	00          	breakpoint
 21c:	01          	.byte 1
 21d:	1b          	addsp 44
 21e:	02          	pushsp
 21f:	49          	storesp 100
 220:	00          	breakpoint
 221:	00          	breakpoint
 222:	00          	breakpoint
 223:	ed          	im -19
 224:	01          	.byte 1
 225:	58          	storesp 32
 226:	08          	load
 227:	00          	breakpoint
 228:	00          	breakpoint
 229:	01          	.byte 1
 22a:	2e          	eq
 22b:	02          	pushsp
 22c:	4a          	storesp 104
 22d:	00          	breakpoint
 22e:	00          	breakpoint
 22f:	00          	breakpoint
 230:	f3          	im -13
 231:	01          	.byte 1
 232:	5a          	storesp 40
 233:	07          	or
 234:	6c          	loadsp 112
 235:	65          	loadsp 84
 236:	6e          	loadsp 120
 237:	00          	breakpoint
 238:	02          	pushsp
 239:	4b          	storesp 108
 23a:	00          	breakpoint
 23b:	00          	breakpoint
 23c:	00          	breakpoint
 23d:	3e          	halfmult
 23e:	01          	.byte 1
 23f:	59          	storesp 36
 240:	00          	breakpoint
 241:	09          	not
 242:	04          	poppc
 243:	0a          	flip
 244:	04          	poppc
 245:	00          	breakpoint
 246:	00          	breakpoint
 247:	00          	breakpoint
 248:	d4          	im -44
 249:	0b          	nop
 24a:	0a          	flip
 24b:	04          	poppc
 24c:	00          	breakpoint
 24d:	00          	breakpoint
 24e:	00          	breakpoint
 24f:	db          	im -37
 250:	02          	pushsp
 251:	00          	breakpoint
 252:	00          	breakpoint
 253:	00          	breakpoint
 254:	f2          	im -14
 255:	01          	.byte 1
 256:	08          	load
 257:	0a          	flip
 258:	04          	poppc
 259:	00          	breakpoint
 25a:	00          	breakpoint
 25b:	00          	breakpoint
 25c:	e8          	im -24
 25d:	0c          	store
 25e:	00          	breakpoint
 25f:	00          	breakpoint
 260:	00          	breakpoint
 261:	db          	im -37
 262:	0a          	flip
 263:	04          	poppc
 264:	00          	breakpoint
 265:	00          	breakpoint
 266:	00          	breakpoint
 267:	25          	lessthanorequal
 268:	0a          	flip
 269:	04          	poppc
 26a:	00          	breakpoint
 26b:	00          	breakpoint
 26c:	00          	breakpoint
 26d:	f9          	im -7
 26e:	0c          	store
 26f:	00          	breakpoint
 270:	00          	breakpoint
 271:	00          	breakpoint
 272:	25          	lessthanorequal
	...
Disassembly of section .debug_abbrev:

00000000 <.Ldebug_abbrev0>:
   0:	01          	.byte 1
   1:	11          	addsp 4
   2:	01          	.byte 1
   3:	10          	addsp 0
   4:	06          	and
   5:	25          	lessthanorequal
   6:	0e          	.byte 14
   7:	13          	addsp 12
   8:	0b          	nop
   9:	03          	.byte 3
   a:	0e          	.byte 14
   b:	1b          	addsp 44
   c:	0e          	.byte 14
   d:	00          	breakpoint
   e:	00          	breakpoint
   f:	02          	pushsp
  10:	24          	lessthan
  11:	00          	breakpoint
  12:	03          	.byte 3
  13:	0e          	.byte 14
  14:	0b          	nop
  15:	0b          	nop
  16:	3e          	halfmult
  17:	0b          	nop
  18:	00          	breakpoint
  19:	00          	breakpoint
  1a:	03          	.byte 3
  1b:	24          	lessthan
  1c:	00          	breakpoint
  1d:	03          	.byte 3
  1e:	08          	load
  1f:	0b          	nop
  20:	0b          	nop
  21:	3e          	halfmult
  22:	0b          	nop
  23:	00          	breakpoint
  24:	00          	breakpoint
  25:	04          	poppc
  26:	2e          	eq
  27:	01          	.byte 1
  28:	01          	.byte 1
  29:	13          	addsp 12
  2a:	3f          	callpcrel
  2b:	0c          	store
  2c:	03          	.byte 3
  2d:	0e          	.byte 14
  2e:	3a          	config
  2f:	0b          	nop
  30:	3b          	pushpc
  31:	0b          	nop
  32:	49          	storesp 100
  33:	13          	addsp 12
  34:	11          	addsp 4
  35:	01          	.byte 1
  36:	12          	addsp 8
  37:	01          	.byte 1
  38:	40          	storesp 64
  39:	0a          	flip
  3a:	00          	breakpoint
  3b:	00          	breakpoint
  3c:	05          	add
  3d:	34          	storeb
  3e:	00          	breakpoint
  3f:	03          	.byte 3
  40:	08          	load
  41:	3a          	config
  42:	0b          	nop
  43:	3b          	pushpc
  44:	0b          	nop
  45:	49          	storesp 100
  46:	13          	addsp 12
  47:	02          	pushsp
  48:	0a          	flip
  49:	00          	breakpoint
  4a:	00          	breakpoint
  4b:	06          	and
  4c:	2e          	eq
  4d:	01          	.byte 1
  4e:	01          	.byte 1
  4f:	13          	addsp 12
  50:	3f          	callpcrel
  51:	0c          	store
  52:	03          	.byte 3
  53:	0e          	.byte 14
  54:	3a          	config
  55:	0b          	nop
  56:	3b          	pushpc
  57:	0b          	nop
  58:	27          	ulessthanorequal
  59:	0c          	store
  5a:	11          	addsp 4
  5b:	01          	.byte 1
  5c:	12          	addsp 8
  5d:	01          	.byte 1
  5e:	40          	storesp 64
  5f:	0a          	flip
  60:	00          	breakpoint
  61:	00          	breakpoint
  62:	07          	or
  63:	05          	add
  64:	00          	breakpoint
  65:	03          	.byte 3
  66:	08          	load
  67:	3a          	config
  68:	0b          	nop
  69:	3b          	pushpc
  6a:	0b          	nop
  6b:	49          	storesp 100
  6c:	13          	addsp 12
  6d:	02          	pushsp
  6e:	0a          	flip
  6f:	00          	breakpoint
  70:	00          	breakpoint
  71:	08          	load
  72:	2e          	eq
  73:	00          	breakpoint
  74:	3f          	callpcrel
  75:	0c          	store
  76:	03          	.byte 3
  77:	0e          	.byte 14
  78:	3a          	config
  79:	0b          	nop
  7a:	3b          	pushpc
  7b:	0b          	nop
  7c:	27          	ulessthanorequal
  7d:	0c          	store
  7e:	11          	addsp 4
  7f:	01          	.byte 1
  80:	12          	addsp 8
  81:	01          	.byte 1
  82:	40          	storesp 64
  83:	0a          	flip
  84:	00          	breakpoint
  85:	00          	breakpoint
  86:	09          	not
  87:	34          	storeb
  88:	00          	breakpoint
  89:	03          	.byte 3
  8a:	0e          	.byte 14
  8b:	3a          	config
  8c:	0b          	nop
  8d:	3b          	pushpc
  8e:	0b          	nop
  8f:	49          	storesp 100
  90:	13          	addsp 12
  91:	02          	pushsp
  92:	0a          	flip
  93:	00          	breakpoint
  94:	00          	breakpoint
  95:	0a          	flip
  96:	34          	storeb
  97:	00          	breakpoint
  98:	03          	.byte 3
  99:	0e          	.byte 14
  9a:	3a          	config
  9b:	0b          	nop
  9c:	3b          	pushpc
  9d:	0b          	nop
  9e:	49          	storesp 100
  9f:	13          	addsp 12
  a0:	3f          	callpcrel
  a1:	0c          	store
  a2:	3c          	syscall
  a3:	0c          	store
  a4:	00          	breakpoint
  a5:	00          	breakpoint
  a6:	0b          	nop
  a7:	0f          	.byte 15
  a8:	00          	breakpoint
  a9:	0b          	nop
  aa:	0b          	nop
  ab:	49          	storesp 100
  ac:	13          	addsp 12
  ad:	00          	breakpoint
  ae:	00          	breakpoint
  af:	0c          	store
  b0:	35          	div
  b1:	00          	breakpoint
  b2:	49          	storesp 100
  b3:	13          	addsp 12
  b4:	00          	breakpoint
  b5:	00          	breakpoint
  b6:	0d          	popsp
  b7:	34          	storeb
  b8:	00          	breakpoint
  b9:	03          	.byte 3
  ba:	08          	load
  bb:	3a          	config
  bc:	0b          	nop
  bd:	3b          	pushpc
  be:	0b          	nop
  bf:	49          	storesp 100
  c0:	13          	addsp 12
  c1:	3f          	callpcrel
  c2:	0c          	store
  c3:	02          	pushsp
  c4:	0a          	flip
  c5:	00          	breakpoint
  c6:	00          	breakpoint
  c7:	0e          	.byte 14
  c8:	26          	ulessthan
  c9:	00          	breakpoint
  ca:	49          	storesp 100
  cb:	13          	addsp 12
  cc:	00          	breakpoint
	...

000000cf <.Ldebug_abbrev0>:
  cf:	01          	.byte 1
  d0:	11          	addsp 4
  d1:	01          	.byte 1
  d2:	10          	addsp 0
  d3:	06          	and
  d4:	12          	addsp 8
  d5:	01          	.byte 1
  d6:	11          	addsp 4
  d7:	01          	.byte 1
  d8:	25          	lessthanorequal
  d9:	0e          	.byte 14
  da:	13          	addsp 12
  db:	0b          	nop
  dc:	03          	.byte 3
  dd:	0e          	.byte 14
  de:	1b          	addsp 44
  df:	0e          	.byte 14
  e0:	00          	breakpoint
  e1:	00          	breakpoint
  e2:	02          	pushsp
  e3:	24          	lessthan
  e4:	00          	breakpoint
  e5:	03          	.byte 3
  e6:	0e          	.byte 14
  e7:	0b          	nop
  e8:	0b          	nop
  e9:	3e          	halfmult
  ea:	0b          	nop
  eb:	00          	breakpoint
  ec:	00          	breakpoint
  ed:	03          	.byte 3
  ee:	16          	addsp 24
  ef:	00          	breakpoint
  f0:	03          	.byte 3
  f1:	0e          	.byte 14
  f2:	3a          	config
  f3:	0b          	nop
  f4:	3b          	pushpc
  f5:	0b          	nop
  f6:	49          	storesp 100
  f7:	13          	addsp 12
  f8:	00          	breakpoint
  f9:	00          	breakpoint
  fa:	04          	poppc
  fb:	24          	lessthan
  fc:	00          	breakpoint
  fd:	03          	.byte 3
  fe:	08          	load
  ff:	0b          	nop
 100:	0b          	nop
 101:	3e          	halfmult
 102:	0b          	nop
 103:	00          	breakpoint
 104:	00          	breakpoint
 105:	05          	add
 106:	2e          	eq
 107:	01          	.byte 1
 108:	01          	.byte 1
 109:	13          	addsp 12
 10a:	3f          	callpcrel
 10b:	0c          	store
 10c:	03          	.byte 3
 10d:	0e          	.byte 14
 10e:	3a          	config
 10f:	0b          	nop
 110:	3b          	pushpc
 111:	0b          	nop
 112:	27          	ulessthanorequal
 113:	0c          	store
 114:	49          	storesp 100
 115:	13          	addsp 12
 116:	11          	addsp 4
 117:	01          	.byte 1
 118:	12          	addsp 8
 119:	01          	.byte 1
 11a:	40          	storesp 64
 11b:	0a          	flip
 11c:	00          	breakpoint
 11d:	00          	breakpoint
 11e:	06          	and
 11f:	05          	add
 120:	00          	breakpoint
 121:	03          	.byte 3
 122:	0e          	.byte 14
 123:	3a          	config
 124:	0b          	nop
 125:	3b          	pushpc
 126:	0b          	nop
 127:	49          	storesp 100
 128:	13          	addsp 12
 129:	02          	pushsp
 12a:	0a          	flip
 12b:	00          	breakpoint
 12c:	00          	breakpoint
 12d:	07          	or
 12e:	34          	storeb
 12f:	00          	breakpoint
 130:	03          	.byte 3
 131:	08          	load
 132:	3a          	config
 133:	0b          	nop
 134:	3b          	pushpc
 135:	0b          	nop
 136:	49          	storesp 100
 137:	13          	addsp 12
 138:	02          	pushsp
 139:	0a          	flip
 13a:	00          	breakpoint
 13b:	00          	breakpoint
 13c:	08          	load
 13d:	34          	storeb
 13e:	00          	breakpoint
 13f:	03          	.byte 3
 140:	0e          	.byte 14
 141:	3a          	config
 142:	0b          	nop
 143:	3b          	pushpc
 144:	0b          	nop
 145:	49          	storesp 100
 146:	13          	addsp 12
 147:	02          	pushsp
 148:	0a          	flip
 149:	00          	breakpoint
 14a:	00          	breakpoint
 14b:	09          	not
 14c:	0f          	.byte 15
 14d:	00          	breakpoint
 14e:	0b          	nop
 14f:	0b          	nop
 150:	00          	breakpoint
 151:	00          	breakpoint
 152:	0a          	flip
 153:	0f          	.byte 15
 154:	00          	breakpoint
 155:	0b          	nop
 156:	0b          	nop
 157:	49          	storesp 100
 158:	13          	addsp 12
 159:	00          	breakpoint
 15a:	00          	breakpoint
 15b:	0b          	nop
 15c:	26          	ulessthan
 15d:	00          	breakpoint
 15e:	00          	breakpoint
 15f:	00          	breakpoint
 160:	0c          	store
 161:	26          	ulessthan
 162:	00          	breakpoint
 163:	49          	storesp 100
 164:	13          	addsp 12
 165:	00          	breakpoint
	...
Disassembly of section .debug_line:

00000000 <.Ldebug_line0>:
   0:	00          	breakpoint
   1:	00          	breakpoint
   2:	02          	pushsp
   3:	89          	im 9
   4:	00          	breakpoint
   5:	02          	pushsp
   6:	00          	breakpoint
   7:	00          	breakpoint
   8:	01          	.byte 1
   9:	4f          	storesp 124
   a:	01          	.byte 1
   b:	01          	.byte 1
   c:	f6          	im -10
   d:	f5          	im -11
   e:	0a          	flip
   f:	00          	breakpoint
  10:	01          	.byte 1
  11:	01          	.byte 1
  12:	01          	.byte 1
  13:	01          	.byte 1
  14:	00          	breakpoint
  15:	00          	breakpoint
  16:	00          	breakpoint
  17:	01          	.byte 1
  18:	2e          	eq
  19:	2e          	eq
  1a:	2f          	neq
  1b:	2e          	eq
  1c:	2e          	eq
  1d:	2f          	neq
  1e:	2e          	eq
  1f:	2e          	eq
  20:	2f          	neq
  21:	2e          	eq
  22:	2e          	eq
  23:	2f          	neq
  24:	67          	loadsp 92
  25:	63          	loadsp 76
  26:	63          	loadsp 76
  27:	2f          	neq
  28:	6c          	loadsp 112
  29:	69          	loadsp 100
  2a:	62          	loadsp 72
  2b:	67          	loadsp 92
  2c:	6c          	loadsp 112
  2d:	6f          	loadsp 124
  2e:	73          	loadsp 12
  2f:	73          	loadsp 12
  30:	2f          	neq
  31:	7a          	loadsp 40
  32:	70          	loadsp 0
  33:	75          	loadsp 20
  34:	00          	breakpoint
  35:	2f          	neq
  36:	68          	loadsp 96
  37:	6f          	loadsp 124
  38:	6d          	loadsp 116
  39:	65          	loadsp 84
  3a:	2f          	neq
  3b:	61          	loadsp 68
  3c:	6c          	loadsp 112
  3d:	76          	loadsp 24
  3e:	69          	loadsp 100
  3f:	65          	loadsp 84
  40:	62          	loadsp 72
  41:	6f          	loadsp 124
  42:	79          	loadsp 36
  43:	2f          	neq
  44:	7a          	loadsp 40
  45:	70          	loadsp 0
  46:	75          	loadsp 20
  47:	2f          	neq
  48:	74          	loadsp 16
  49:	6f          	loadsp 124
  4a:	6f          	loadsp 124
  4b:	6c          	loadsp 112
  4c:	63          	loadsp 76
  4d:	68          	loadsp 96
  4e:	61          	loadsp 68
  4f:	69          	loadsp 100
  50:	6e          	loadsp 120
  51:	2f          	neq
  52:	74          	loadsp 16
  53:	6f          	loadsp 124
  54:	6f          	loadsp 124
  55:	6c          	loadsp 112
  56:	63          	loadsp 76
  57:	68          	loadsp 96
  58:	61          	loadsp 68
  59:	69          	loadsp 100
  5a:	6e          	loadsp 120
  5b:	2f          	neq
  5c:	74          	loadsp 16
  5d:	6f          	loadsp 124
  5e:	6f          	loadsp 124
  5f:	6c          	loadsp 112
  60:	63          	loadsp 76
  61:	68          	loadsp 96
  62:	61          	loadsp 68
  63:	69          	loadsp 100
  64:	6e          	loadsp 120
  65:	2f          	neq
  66:	67          	loadsp 92
  67:	63          	loadsp 76
  68:	63          	loadsp 76
  69:	2f          	neq
  6a:	6e          	loadsp 120
  6b:	65          	loadsp 84
  6c:	77          	loadsp 28
  6d:	6c          	loadsp 112
  6e:	69          	loadsp 100
  6f:	62          	loadsp 72
  70:	2f          	neq
  71:	6c          	loadsp 112
  72:	69          	loadsp 100
  73:	62          	loadsp 72
  74:	63          	loadsp 76
  75:	2f          	neq
  76:	69          	loadsp 100
  77:	6e          	loadsp 120
  78:	63          	loadsp 76
  79:	6c          	loadsp 112
  7a:	75          	loadsp 20
  7b:	64          	loadsp 80
  7c:	65          	loadsp 84
  7d:	00          	breakpoint
  7e:	2f          	neq
  7f:	68          	loadsp 96
  80:	6f          	loadsp 124
  81:	6d          	loadsp 116
  82:	65          	loadsp 84
  83:	2f          	neq
  84:	61          	loadsp 68
  85:	6c          	loadsp 112
  86:	76          	loadsp 24
  87:	69          	loadsp 100
  88:	65          	loadsp 84
  89:	62          	loadsp 72
  8a:	6f          	loadsp 124
  8b:	79          	loadsp 36
  8c:	2f          	neq
  8d:	7a          	loadsp 40
  8e:	70          	loadsp 0
  8f:	75          	loadsp 20
  90:	2f          	neq
  91:	74          	loadsp 16
  92:	6f          	loadsp 124
  93:	6f          	loadsp 124
  94:	6c          	loadsp 112
  95:	63          	loadsp 76
  96:	68          	loadsp 96
  97:	61          	loadsp 68
  98:	69          	loadsp 100
  99:	6e          	loadsp 120
  9a:	2f          	neq
  9b:	74          	loadsp 16
  9c:	6f          	loadsp 124
  9d:	6f          	loadsp 124
  9e:	6c          	loadsp 112
  9f:	63          	loadsp 76
  a0:	68          	loadsp 96
  a1:	61          	loadsp 68
  a2:	69          	loadsp 100
  a3:	6e          	loadsp 120
  a4:	2f          	neq
  a5:	74          	loadsp 16
  a6:	6f          	loadsp 124
  a7:	6f          	loadsp 124
  a8:	6c          	loadsp 112
  a9:	63          	loadsp 76
  aa:	68          	loadsp 96
  ab:	61          	loadsp 68
  ac:	69          	loadsp 100
  ad:	6e          	loadsp 120
  ae:	2f          	neq
  af:	67          	loadsp 92
  b0:	63          	loadsp 76
  b1:	63          	loadsp 76
  b2:	62          	loadsp 72
  b3:	75          	loadsp 20
  b4:	69          	loadsp 100
  b5:	6c          	loadsp 112
  b6:	64          	loadsp 80
  b7:	2f          	neq
  b8:	67          	loadsp 92
  b9:	63          	loadsp 76
  ba:	63          	loadsp 76
  bb:	2f          	neq
  bc:	69          	loadsp 100
  bd:	6e          	loadsp 120
  be:	63          	loadsp 76
  bf:	6c          	loadsp 112
  c0:	75          	loadsp 20
  c1:	64          	loadsp 80
  c2:	65          	loadsp 84
  c3:	00          	breakpoint
  c4:	00          	breakpoint
  c5:	73          	loadsp 12
  c6:	74          	loadsp 16
  c7:	64          	loadsp 80
  c8:	64          	loadsp 80
  c9:	65          	loadsp 84
  ca:	66          	loadsp 88
  cb:	2e          	eq
  cc:	68          	loadsp 96
  cd:	00          	breakpoint
  ce:	03          	.byte 3
  cf:	00          	breakpoint
  d0:	00          	breakpoint
  d1:	73          	loadsp 12
  d2:	74          	loadsp 16
  d3:	64          	loadsp 80
  d4:	61          	loadsp 68
  d5:	72          	loadsp 8
  d6:	67          	loadsp 92
  d7:	2e          	eq
  d8:	68          	loadsp 96
  d9:	00          	breakpoint
  da:	03          	.byte 3
  db:	00          	breakpoint
  dc:	00          	breakpoint
  dd:	73          	loadsp 12
  de:	79          	loadsp 36
  df:	73          	loadsp 12
  e0:	2f          	neq
  e1:	5f          	storesp 60
  e2:	74          	loadsp 16
  e3:	79          	loadsp 36
  e4:	70          	loadsp 0
  e5:	65          	loadsp 84
  e6:	73          	loadsp 12
  e7:	2e          	eq
  e8:	68          	loadsp 96
  e9:	00          	breakpoint
  ea:	02          	pushsp
  eb:	00          	breakpoint
  ec:	00          	breakpoint
  ed:	73          	loadsp 12
  ee:	79          	loadsp 36
  ef:	73          	loadsp 12
  f0:	2f          	neq
  f1:	72          	loadsp 8
  f2:	65          	loadsp 84
  f3:	65          	loadsp 84
  f4:	6e          	loadsp 120
  f5:	74          	loadsp 16
  f6:	2e          	eq
  f7:	68          	loadsp 96
  f8:	00          	breakpoint
  f9:	02          	pushsp
  fa:	00          	breakpoint
  fb:	00          	breakpoint
  fc:	73          	loadsp 12
  fd:	79          	loadsp 36
  fe:	73          	loadsp 12
  ff:	2f          	neq
 100:	74          	loadsp 16
 101:	79          	loadsp 36
 102:	70          	loadsp 0
 103:	65          	loadsp 84
 104:	73          	loadsp 12
 105:	2e          	eq
 106:	68          	loadsp 96
 107:	00          	breakpoint
 108:	02          	pushsp
 109:	00          	breakpoint
 10a:	00          	breakpoint
 10b:	6d          	loadsp 116
 10c:	61          	loadsp 68
 10d:	63          	loadsp 76
 10e:	68          	loadsp 96
 10f:	69          	loadsp 100
 110:	6e          	loadsp 120
 111:	65          	loadsp 84
 112:	2f          	neq
 113:	74          	loadsp 16
 114:	79          	loadsp 36
 115:	70          	loadsp 0
 116:	65          	loadsp 84
 117:	73          	loadsp 12
 118:	2e          	eq
 119:	68          	loadsp 96
 11a:	00          	breakpoint
 11b:	02          	pushsp
 11c:	00          	breakpoint
 11d:	00          	breakpoint
 11e:	73          	loadsp 12
 11f:	74          	loadsp 16
 120:	64          	loadsp 80
 121:	69          	loadsp 100
 122:	6f          	loadsp 124
 123:	2e          	eq
 124:	68          	loadsp 96
 125:	00          	breakpoint
 126:	02          	pushsp
 127:	00          	breakpoint
 128:	00          	breakpoint
 129:	65          	loadsp 84
 12a:	72          	loadsp 8
 12b:	72          	loadsp 8
 12c:	6e          	loadsp 120
 12d:	6f          	loadsp 124
 12e:	2e          	eq
 12f:	68          	loadsp 96
 130:	00          	breakpoint
 131:	02          	pushsp
 132:	00          	breakpoint
 133:	00          	breakpoint
 134:	74          	loadsp 16
 135:	69          	loadsp 100
 136:	6d          	loadsp 116
 137:	65          	loadsp 84
 138:	2e          	eq
 139:	68          	loadsp 96
 13a:	00          	breakpoint
 13b:	02          	pushsp
 13c:	00          	breakpoint
 13d:	00          	breakpoint
 13e:	73          	loadsp 12
 13f:	79          	loadsp 36
 140:	73          	loadsp 12
 141:	2f          	neq
 142:	73          	loadsp 12
 143:	74          	loadsp 16
 144:	61          	loadsp 68
 145:	74          	loadsp 16
 146:	2e          	eq
 147:	68          	loadsp 96
 148:	00          	breakpoint
 149:	02          	pushsp
 14a:	00          	breakpoint
 14b:	00          	breakpoint
 14c:	63          	loadsp 76
 14d:	72          	loadsp 8
 14e:	74          	loadsp 16
 14f:	5f          	storesp 60
 150:	69          	loadsp 100
 151:	6f          	loadsp 124
 152:	2e          	eq
 153:	63          	loadsp 76
 154:	00          	breakpoint
 155:	01          	.byte 1
 156:	00          	breakpoint
 157:	00          	breakpoint
 158:	00          	breakpoint
 159:	00          	breakpoint
 15a:	05          	add
 15b:	02          	pushsp
 15c:	00          	breakpoint
 15d:	00          	breakpoint
 15e:	00          	breakpoint
 15f:	00          	breakpoint
 160:	00          	breakpoint
 161:	01          	.byte 1
 162:	01          	.byte 1
 163:	00          	breakpoint
 164:	05          	add
 165:	02          	pushsp
 166:	00          	breakpoint
 167:	00          	breakpoint
 168:	00          	breakpoint
 169:	00          	breakpoint
 16a:	04          	poppc
 16b:	0b          	nop
 16c:	2b          	ashiftleft
 16d:	00          	breakpoint
 16e:	05          	add
 16f:	02          	pushsp
 170:	00          	breakpoint
 171:	00          	breakpoint
 172:	00          	breakpoint
 173:	00          	breakpoint
 174:	18          	addsp 32
 175:	00          	breakpoint
 176:	05          	add
 177:	02          	pushsp
 178:	00          	breakpoint
 179:	00          	breakpoint
 17a:	00          	breakpoint
 17b:	00          	breakpoint
 17c:	15          	addsp 20
 17d:	00          	breakpoint
 17e:	05          	add
 17f:	02          	pushsp
 180:	00          	breakpoint
 181:	00          	breakpoint
 182:	00          	breakpoint
 183:	00          	breakpoint
 184:	16          	addsp 24
 185:	00          	breakpoint
 186:	05          	add
 187:	02          	pushsp
 188:	00          	breakpoint
 189:	00          	breakpoint
 18a:	00          	breakpoint
 18b:	00          	breakpoint
 18c:	17          	addsp 28
 18d:	00          	breakpoint
 18e:	05          	add
 18f:	02          	pushsp
 190:	00          	breakpoint
 191:	00          	breakpoint
 192:	00          	breakpoint
 193:	00          	breakpoint
 194:	00          	breakpoint
 195:	01          	.byte 1
 196:	01          	.byte 1
 197:	00          	breakpoint
 198:	05          	add
 199:	02          	pushsp
 19a:	00          	breakpoint
 19b:	00          	breakpoint
 19c:	00          	breakpoint
 19d:	00          	breakpoint
 19e:	04          	poppc
 19f:	0b          	nop
 1a0:	3f          	callpcrel
 1a1:	00          	breakpoint
 1a2:	05          	add
 1a3:	02          	pushsp
 1a4:	00          	breakpoint
 1a5:	00          	breakpoint
 1a6:	00          	breakpoint
 1a7:	00          	breakpoint
 1a8:	16          	addsp 24
 1a9:	00          	breakpoint
 1aa:	05          	add
 1ab:	02          	pushsp
 1ac:	00          	breakpoint
 1ad:	00          	breakpoint
 1ae:	00          	breakpoint
 1af:	00          	breakpoint
 1b0:	15          	addsp 20
 1b1:	00          	breakpoint
 1b2:	05          	add
 1b3:	02          	pushsp
 1b4:	00          	breakpoint
 1b5:	00          	breakpoint
 1b6:	00          	breakpoint
 1b7:	00          	breakpoint
 1b8:	00          	breakpoint
 1b9:	01          	.byte 1
 1ba:	01          	.byte 1
 1bb:	00          	breakpoint
 1bc:	05          	add
 1bd:	02          	pushsp
 1be:	00          	breakpoint
 1bf:	00          	breakpoint
 1c0:	00          	breakpoint
 1c1:	00          	breakpoint
 1c2:	04          	poppc
 1c3:	0b          	nop
 1c4:	48          	storesp 96
 1c5:	00          	breakpoint
 1c6:	05          	add
 1c7:	02          	pushsp
 1c8:	00          	breakpoint
 1c9:	00          	breakpoint
 1ca:	00          	breakpoint
 1cb:	00          	breakpoint
 1cc:	15          	addsp 20
 1cd:	00          	breakpoint
 1ce:	05          	add
 1cf:	02          	pushsp
 1d0:	00          	breakpoint
 1d1:	00          	breakpoint
 1d2:	00          	breakpoint
 1d3:	00          	breakpoint
 1d4:	16          	addsp 24
 1d5:	00          	breakpoint
 1d6:	05          	add
 1d7:	02          	pushsp
 1d8:	00          	breakpoint
 1d9:	00          	breakpoint
 1da:	00          	breakpoint
 1db:	00          	breakpoint
 1dc:	1d          	addsp 52
 1dd:	00          	breakpoint
 1de:	05          	add
 1df:	02          	pushsp
 1e0:	00          	breakpoint
 1e1:	00          	breakpoint
 1e2:	00          	breakpoint
 1e3:	00          	breakpoint
 1e4:	15          	addsp 20
 1e5:	00          	breakpoint
 1e6:	05          	add
 1e7:	02          	pushsp
 1e8:	00          	breakpoint
 1e9:	00          	breakpoint
 1ea:	00          	breakpoint
 1eb:	00          	breakpoint
 1ec:	15          	addsp 20
 1ed:	00          	breakpoint
 1ee:	05          	add
 1ef:	02          	pushsp
 1f0:	00          	breakpoint
 1f1:	00          	breakpoint
 1f2:	00          	breakpoint
 1f3:	00          	breakpoint
 1f4:	1c          	addsp 48
 1f5:	00          	breakpoint
 1f6:	05          	add
 1f7:	02          	pushsp
 1f8:	00          	breakpoint
 1f9:	00          	breakpoint
 1fa:	00          	breakpoint
 1fb:	00          	breakpoint
 1fc:	10          	addsp 0
 1fd:	00          	breakpoint
 1fe:	05          	add
 1ff:	02          	pushsp
 200:	00          	breakpoint
 201:	00          	breakpoint
 202:	00          	breakpoint
 203:	00          	breakpoint
 204:	15          	addsp 20
 205:	00          	breakpoint
 206:	05          	add
 207:	02          	pushsp
 208:	00          	breakpoint
 209:	00          	breakpoint
 20a:	00          	breakpoint
 20b:	00          	breakpoint
 20c:	15          	addsp 20
 20d:	00          	breakpoint
 20e:	05          	add
 20f:	02          	pushsp
 210:	00          	breakpoint
 211:	00          	breakpoint
 212:	00          	breakpoint
 213:	00          	breakpoint
 214:	16          	addsp 24
 215:	00          	breakpoint
 216:	05          	add
 217:	02          	pushsp
 218:	00          	breakpoint
 219:	00          	breakpoint
 21a:	00          	breakpoint
 21b:	00          	breakpoint
 21c:	03          	.byte 3
 21d:	70          	loadsp 0
 21e:	01          	.byte 1
 21f:	00          	breakpoint
 220:	05          	add
 221:	02          	pushsp
 222:	00          	breakpoint
 223:	00          	breakpoint
 224:	00          	breakpoint
 225:	00          	breakpoint
 226:	15          	addsp 20
 227:	00          	breakpoint
 228:	05          	add
 229:	02          	pushsp
 22a:	00          	breakpoint
 22b:	00          	breakpoint
 22c:	00          	breakpoint
 22d:	00          	breakpoint
 22e:	15          	addsp 20
 22f:	00          	breakpoint
 230:	05          	add
 231:	02          	pushsp
 232:	00          	breakpoint
 233:	00          	breakpoint
 234:	00          	breakpoint
 235:	00          	breakpoint
 236:	22          	loadh
 237:	00          	breakpoint
 238:	05          	add
 239:	02          	pushsp
 23a:	00          	breakpoint
 23b:	00          	breakpoint
 23c:	00          	breakpoint
 23d:	00          	breakpoint
 23e:	00          	breakpoint
 23f:	01          	.byte 1
 240:	01          	.byte 1
 241:	00          	breakpoint
 242:	05          	add
 243:	02          	pushsp
 244:	00          	breakpoint
 245:	00          	breakpoint
 246:	00          	breakpoint
 247:	00          	breakpoint
 248:	04          	poppc
 249:	0b          	nop
 24a:	63          	loadsp 76
 24b:	00          	breakpoint
 24c:	05          	add
 24d:	02          	pushsp
 24e:	00          	breakpoint
 24f:	00          	breakpoint
 250:	00          	breakpoint
 251:	00          	breakpoint
 252:	18          	addsp 32
 253:	00          	breakpoint
 254:	05          	add
 255:	02          	pushsp
 256:	00          	breakpoint
 257:	00          	breakpoint
 258:	00          	breakpoint
 259:	00          	breakpoint
 25a:	15          	addsp 20
 25b:	00          	breakpoint
 25c:	05          	add
 25d:	02          	pushsp
 25e:	00          	breakpoint
 25f:	00          	breakpoint
 260:	00          	breakpoint
 261:	00          	breakpoint
 262:	15          	addsp 20
 263:	00          	breakpoint
 264:	05          	add
 265:	02          	pushsp
 266:	00          	breakpoint
 267:	00          	breakpoint
 268:	00          	breakpoint
 269:	00          	breakpoint
 26a:	16          	addsp 24
 26b:	00          	breakpoint
 26c:	05          	add
 26d:	02          	pushsp
 26e:	00          	breakpoint
 26f:	00          	breakpoint
 270:	00          	breakpoint
 271:	00          	breakpoint
 272:	12          	addsp 8
 273:	00          	breakpoint
 274:	05          	add
 275:	02          	pushsp
 276:	00          	breakpoint
 277:	00          	breakpoint
 278:	00          	breakpoint
 279:	00          	breakpoint
 27a:	18          	addsp 32
 27b:	00          	breakpoint
 27c:	05          	add
 27d:	02          	pushsp
 27e:	00          	breakpoint
 27f:	00          	breakpoint
 280:	00          	breakpoint
 281:	00          	breakpoint
 282:	15          	addsp 20
 283:	00          	breakpoint
 284:	05          	add
 285:	02          	pushsp
 286:	00          	breakpoint
 287:	00          	breakpoint
 288:	00          	breakpoint
 289:	00          	breakpoint
 28a:	00          	breakpoint
 28b:	01          	.byte 1
 28c:	01          	.byte 1
 28d:	00          	breakpoint
 28e:	00          	breakpoint
 28f:	00          	breakpoint
 290:	16          	addsp 24
 291:	00          	breakpoint
 292:	02          	pushsp
 293:	00          	breakpoint
 294:	00          	breakpoint
 295:	00          	breakpoint
 296:	10          	addsp 0
 297:	01          	.byte 1
 298:	01          	.byte 1
 299:	fb          	im -5
 29a:	0e          	.byte 14
 29b:	0a          	flip
 29c:	00          	breakpoint
 29d:	01          	.byte 1
 29e:	01          	.byte 1
 29f:	01          	.byte 1
 2a0:	01          	.byte 1
 2a1:	00          	breakpoint
 2a2:	00          	breakpoint
 2a3:	00          	breakpoint
 2a4:	01          	.byte 1
	...

000002a7 <.Ldebug_line0>:
 2a7:	00          	breakpoint
 2a8:	00          	breakpoint
 2a9:	01          	.byte 1
 2aa:	30          	neg
 2ab:	00          	breakpoint
 2ac:	02          	pushsp
 2ad:	00          	breakpoint
 2ae:	00          	breakpoint
 2af:	00          	breakpoint
 2b0:	94          	im 20
 2b1:	01          	.byte 1
 2b2:	01          	.byte 1
 2b3:	f6          	im -10
 2b4:	f5          	im -11
 2b5:	0a          	flip
 2b6:	00          	breakpoint
 2b7:	01          	.byte 1
 2b8:	01          	.byte 1
 2b9:	01          	.byte 1
 2ba:	01          	.byte 1
 2bb:	00          	breakpoint
 2bc:	00          	breakpoint
 2bd:	00          	breakpoint
 2be:	01          	.byte 1
 2bf:	2e          	eq
 2c0:	2e          	eq
 2c1:	2f          	neq
 2c2:	2e          	eq
 2c3:	2e          	eq
 2c4:	2f          	neq
 2c5:	2e          	eq
 2c6:	2e          	eq
 2c7:	2f          	neq
 2c8:	2e          	eq
 2c9:	2e          	eq
 2ca:	2f          	neq
 2cb:	2e          	eq
 2cc:	2e          	eq
 2cd:	2f          	neq
 2ce:	67          	loadsp 92
 2cf:	63          	loadsp 76
 2d0:	63          	loadsp 76
 2d1:	2f          	neq
 2d2:	6e          	loadsp 120
 2d3:	65          	loadsp 84
 2d4:	77          	loadsp 28
 2d5:	6c          	loadsp 112
 2d6:	69          	loadsp 100
 2d7:	62          	loadsp 72
 2d8:	2f          	neq
 2d9:	6c          	loadsp 112
 2da:	69          	loadsp 100
 2db:	62          	loadsp 72
 2dc:	63          	loadsp 76
 2dd:	2f          	neq
 2de:	73          	loadsp 12
 2df:	74          	loadsp 16
 2e0:	72          	loadsp 8
 2e1:	69          	loadsp 100
 2e2:	6e          	loadsp 120
 2e3:	67          	loadsp 92
 2e4:	00          	breakpoint
 2e5:	2f          	neq
 2e6:	68          	loadsp 96
 2e7:	6f          	loadsp 124
 2e8:	6d          	loadsp 116
 2e9:	65          	loadsp 84
 2ea:	2f          	neq
 2eb:	61          	loadsp 68
 2ec:	6c          	loadsp 112
 2ed:	76          	loadsp 24
 2ee:	69          	loadsp 100
 2ef:	65          	loadsp 84
 2f0:	62          	loadsp 72
 2f1:	6f          	loadsp 124
 2f2:	79          	loadsp 36
 2f3:	2f          	neq
 2f4:	7a          	loadsp 40
 2f5:	70          	loadsp 0
 2f6:	75          	loadsp 20
 2f7:	2f          	neq
 2f8:	74          	loadsp 16
 2f9:	6f          	loadsp 124
 2fa:	6f          	loadsp 124
 2fb:	6c          	loadsp 112
 2fc:	63          	loadsp 76
 2fd:	68          	loadsp 96
 2fe:	61          	loadsp 68
 2ff:	69          	loadsp 100
 300:	6e          	loadsp 120
 301:	2f          	neq
 302:	74          	loadsp 16
 303:	6f          	loadsp 124
 304:	6f          	loadsp 124
 305:	6c          	loadsp 112
 306:	63          	loadsp 76
 307:	68          	loadsp 96
 308:	61          	loadsp 68
 309:	69          	loadsp 100
 30a:	6e          	loadsp 120
 30b:	2f          	neq
 30c:	74          	loadsp 16
 30d:	6f          	loadsp 124
 30e:	6f          	loadsp 124
 30f:	6c          	loadsp 112
 310:	63          	loadsp 76
 311:	68          	loadsp 96
 312:	61          	loadsp 68
 313:	69          	loadsp 100
 314:	6e          	loadsp 120
 315:	2f          	neq
 316:	67          	loadsp 92
 317:	63          	loadsp 76
 318:	63          	loadsp 76
 319:	62          	loadsp 72
 31a:	75          	loadsp 20
 31b:	69          	loadsp 100
 31c:	6c          	loadsp 112
 31d:	64          	loadsp 80
 31e:	2f          	neq
 31f:	67          	loadsp 92
 320:	63          	loadsp 76
 321:	63          	loadsp 76
 322:	2f          	neq
 323:	69          	loadsp 100
 324:	6e          	loadsp 120
 325:	63          	loadsp 76
 326:	6c          	loadsp 112
 327:	75          	loadsp 20
 328:	64          	loadsp 80
 329:	65          	loadsp 84
 32a:	00          	breakpoint
 32b:	00          	breakpoint
 32c:	73          	loadsp 12
 32d:	74          	loadsp 16
 32e:	64          	loadsp 80
 32f:	64          	loadsp 80
 330:	65          	loadsp 84
 331:	66          	loadsp 88
 332:	2e          	eq
 333:	68          	loadsp 96
 334:	00          	breakpoint
 335:	02          	pushsp
 336:	00          	breakpoint
 337:	00          	breakpoint
 338:	6d          	loadsp 116
 339:	65          	loadsp 84
 33a:	6d          	loadsp 116
 33b:	63          	loadsp 76
 33c:	70          	loadsp 0
 33d:	79          	loadsp 36
 33e:	2e          	eq
 33f:	63          	loadsp 76
 340:	00          	breakpoint
 341:	01          	.byte 1
 342:	00          	breakpoint
 343:	00          	breakpoint
 344:	00          	breakpoint
 345:	00          	breakpoint
 346:	05          	add
 347:	02          	pushsp
 348:	00          	breakpoint
 349:	00          	breakpoint
 34a:	00          	breakpoint
 34b:	00          	breakpoint
 34c:	04          	poppc
 34d:	02          	pushsp
 34e:	4c          	storesp 112
 34f:	00          	breakpoint
 350:	05          	add
 351:	02          	pushsp
 352:	00          	breakpoint
 353:	00          	breakpoint
 354:	00          	breakpoint
 355:	00          	breakpoint
 356:	22          	loadh
 357:	00          	breakpoint
 358:	05          	add
 359:	02          	pushsp
 35a:	00          	breakpoint
 35b:	00          	breakpoint
 35c:	00          	breakpoint
 35d:	00          	breakpoint
 35e:	15          	addsp 20
 35f:	00          	breakpoint
 360:	05          	add
 361:	02          	pushsp
 362:	00          	breakpoint
 363:	00          	breakpoint
 364:	00          	breakpoint
 365:	00          	breakpoint
 366:	17          	addsp 28
 367:	00          	breakpoint
 368:	05          	add
 369:	02          	pushsp
 36a:	00          	breakpoint
 36b:	00          	breakpoint
 36c:	00          	breakpoint
 36d:	00          	breakpoint
 36e:	18          	addsp 32
 36f:	00          	breakpoint
 370:	05          	add
 371:	02          	pushsp
 372:	00          	breakpoint
 373:	00          	breakpoint
 374:	00          	breakpoint
 375:	00          	breakpoint
 376:	30          	neg
 377:	00          	breakpoint
 378:	05          	add
 379:	02          	pushsp
 37a:	00          	breakpoint
 37b:	00          	breakpoint
 37c:	00          	breakpoint
 37d:	00          	breakpoint
 37e:	18          	addsp 32
 37f:	00          	breakpoint
 380:	05          	add
 381:	02          	pushsp
 382:	00          	breakpoint
 383:	00          	breakpoint
 384:	00          	breakpoint
 385:	00          	breakpoint
 386:	03          	.byte 3
 387:	62          	loadsp 72
 388:	01          	.byte 1
 389:	00          	breakpoint
 38a:	05          	add
 38b:	02          	pushsp
 38c:	00          	breakpoint
 38d:	00          	breakpoint
 38e:	00          	breakpoint
 38f:	00          	breakpoint
 390:	1a          	addsp 40
 391:	00          	breakpoint
 392:	05          	add
 393:	02          	pushsp
 394:	00          	breakpoint
 395:	00          	breakpoint
 396:	00          	breakpoint
 397:	00          	breakpoint
 398:	15          	addsp 20
 399:	00          	breakpoint
 39a:	05          	add
 39b:	02          	pushsp
 39c:	00          	breakpoint
 39d:	00          	breakpoint
 39e:	00          	breakpoint
 39f:	00          	breakpoint
 3a0:	15          	addsp 20
 3a1:	00          	breakpoint
 3a2:	05          	add
 3a3:	02          	pushsp
 3a4:	00          	breakpoint
 3a5:	00          	breakpoint
 3a6:	00          	breakpoint
 3a7:	00          	breakpoint
 3a8:	15          	addsp 20
 3a9:	00          	breakpoint
 3aa:	05          	add
 3ab:	02          	pushsp
 3ac:	00          	breakpoint
 3ad:	00          	breakpoint
 3ae:	00          	breakpoint
 3af:	00          	breakpoint
 3b0:	15          	addsp 20
 3b1:	00          	breakpoint
 3b2:	05          	add
 3b3:	02          	pushsp
 3b4:	00          	breakpoint
 3b5:	00          	breakpoint
 3b6:	00          	breakpoint
 3b7:	00          	breakpoint
 3b8:	1b          	addsp 44
 3b9:	00          	breakpoint
 3ba:	05          	add
 3bb:	02          	pushsp
 3bc:	00          	breakpoint
 3bd:	00          	breakpoint
 3be:	00          	breakpoint
 3bf:	00          	breakpoint
 3c0:	13          	addsp 12
 3c1:	00          	breakpoint
 3c2:	05          	add
 3c3:	02          	pushsp
 3c4:	00          	breakpoint
 3c5:	00          	breakpoint
 3c6:	00          	breakpoint
 3c7:	00          	breakpoint
 3c8:	15          	addsp 20
 3c9:	00          	breakpoint
 3ca:	05          	add
 3cb:	02          	pushsp
 3cc:	00          	breakpoint
 3cd:	00          	breakpoint
 3ce:	00          	breakpoint
 3cf:	00          	breakpoint
 3d0:	18          	addsp 32
 3d1:	00          	breakpoint
 3d2:	05          	add
 3d3:	02          	pushsp
 3d4:	00          	breakpoint
 3d5:	00          	breakpoint
 3d6:	00          	breakpoint
 3d7:	00          	breakpoint
 3d8:	00          	breakpoint
 3d9:	01          	.byte 1
 3da:	01          	.byte 1
 3db:	00          	breakpoint
 3dc:	00          	breakpoint
 3dd:	00          	breakpoint
 3de:	16          	addsp 24
 3df:	00          	breakpoint
 3e0:	02          	pushsp
 3e1:	00          	breakpoint
 3e2:	00          	breakpoint
 3e3:	00          	breakpoint
 3e4:	10          	addsp 0
 3e5:	01          	.byte 1
 3e6:	01          	.byte 1
 3e7:	fb          	im -5
 3e8:	0e          	.byte 14
 3e9:	0a          	flip
 3ea:	00          	breakpoint
 3eb:	01          	.byte 1
 3ec:	01          	.byte 1
 3ed:	01          	.byte 1
 3ee:	01          	.byte 1
 3ef:	00          	breakpoint
 3f0:	00          	breakpoint
 3f1:	00          	breakpoint
 3f2:	01          	.byte 1
	...
Disassembly of section .debug_frame:

00000000 <.Lframe0>:
   0:	00          	breakpoint
   1:	00          	breakpoint
   2:	00          	breakpoint
   3:	10          	addsp 0
   4:	ff          	im -1
   5:	ff          	im -1
   6:	ff          	im -1
   7:	ff          	im -1
   8:	01          	.byte 1
   9:	00          	breakpoint
   a:	01          	.byte 1
   b:	7c          	loadsp 48
   c:	24          	lessthan
   d:	0c          	store
   e:	20          	.byte 32
   f:	04          	poppc
  10:	a4          	im 36
  11:	01          	.byte 1
  12:	00          	breakpoint
  13:	00          	breakpoint
  14:	00          	breakpoint
  15:	00          	breakpoint
  16:	00          	breakpoint
  17:	1c          	addsp 48
	...
  20:	00          	breakpoint
  21:	00          	breakpoint
  22:	00          	breakpoint
  23:	2d          	call
  24:	04          	poppc
  25:	00          	breakpoint
  26:	00          	breakpoint
  27:	00          	breakpoint
  28:	03          	.byte 3
  29:	0e          	.byte 14
  2a:	10          	addsp 0
  2b:	04          	poppc
  2c:	00          	breakpoint
  2d:	00          	breakpoint
  2e:	00          	breakpoint
  2f:	29          	mult
  30:	0e          	.byte 14
  31:	04          	poppc
  32:	00          	breakpoint
  33:	00          	breakpoint
  34:	00          	breakpoint
  35:	00          	breakpoint
  36:	00          	breakpoint
  37:	1c          	addsp 48
	...
  40:	00          	breakpoint
  41:	00          	breakpoint
  42:	00          	breakpoint
  43:	25          	lessthanorequal
  44:	04          	poppc
  45:	00          	breakpoint
  46:	00          	breakpoint
  47:	00          	breakpoint
  48:	03          	.byte 3
  49:	0e          	.byte 14
  4a:	0c          	store
  4b:	04          	poppc
  4c:	00          	breakpoint
  4d:	00          	breakpoint
  4e:	00          	breakpoint
  4f:	21          	.byte 33
  50:	0e          	.byte 14
  51:	04          	poppc
  52:	00          	breakpoint
  53:	00          	breakpoint
  54:	00          	breakpoint
  55:	00          	breakpoint
  56:	00          	breakpoint
  57:	0c          	store
	...
  60:	00          	breakpoint
  61:	00          	breakpoint
  62:	00          	breakpoint
  63:	85          	im 5
  64:	00          	breakpoint
  65:	00          	breakpoint
  66:	00          	breakpoint
  67:	1c          	addsp 48
	...
  70:	00          	breakpoint
  71:	00          	breakpoint
  72:	00          	breakpoint
  73:	70          	loadsp 0
  74:	04          	poppc
  75:	00          	breakpoint
  76:	00          	breakpoint
  77:	00          	breakpoint
  78:	03          	.byte 3
  79:	0e          	.byte 14
  7a:	40          	storesp 64
  7b:	04          	poppc
  7c:	00          	breakpoint
  7d:	00          	breakpoint
  7e:	00          	breakpoint
  7f:	5f          	storesp 60
  80:	0e          	.byte 14
  81:	04          	poppc
	...

00000084 <.Lframe0>:
  84:	00          	breakpoint
  85:	00          	breakpoint
  86:	00          	breakpoint
  87:	10          	addsp 0
  88:	ff          	im -1
  89:	ff          	im -1
  8a:	ff          	im -1
  8b:	ff          	im -1
  8c:	01          	.byte 1
  8d:	00          	breakpoint
  8e:	01          	.byte 1
  8f:	7c          	loadsp 48
  90:	24          	lessthan
  91:	0c          	store
  92:	20          	.byte 32
  93:	04          	poppc
  94:	a4          	im 36
  95:	01          	.byte 1
  96:	00          	breakpoint
  97:	00          	breakpoint
  98:	00          	breakpoint
  99:	00          	breakpoint
  9a:	00          	breakpoint
  9b:	1c          	addsp 48
  9c:	00          	breakpoint
  9d:	00          	breakpoint
  9e:	00          	breakpoint
  9f:	84          	im 4
  a0:	00          	breakpoint
  a1:	00          	breakpoint
  a2:	00          	breakpoint
  a3:	00          	breakpoint
  a4:	00          	breakpoint
  a5:	00          	breakpoint
  a6:	00          	breakpoint
  a7:	bc          	im 60
  a8:	04          	poppc
  a9:	00          	breakpoint
  aa:	00          	breakpoint
  ab:	00          	breakpoint
  ac:	03          	.byte 3
  ad:	0e          	.byte 14
  ae:	18          	addsp 32
  af:	04          	poppc
  b0:	00          	breakpoint
  b1:	00          	breakpoint
  b2:	00          	breakpoint
  b3:	51          	storesp 4
  b4:	0e          	.byte 14
  b5:	04          	poppc
	...
Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	5f          	storesp 60
   1:	63          	loadsp 76
   2:	70          	loadsp 0
   3:	75          	loadsp 20
   4:	5f          	storesp 60
   5:	63          	loadsp 76
   6:	6f          	loadsp 124
   7:	6e          	loadsp 120
   8:	66          	loadsp 88
   9:	69          	loadsp 100
   a:	67          	loadsp 92
   b:	00          	breakpoint
   c:	6c          	loadsp 112
   d:	6f          	loadsp 124
   e:	6e          	loadsp 120
   f:	67          	loadsp 92
  10:	20          	.byte 32
  11:	6c          	loadsp 112
  12:	6f          	loadsp 124
  13:	6e          	loadsp 120
  14:	67          	loadsp 92
  15:	20          	.byte 32
  16:	75          	loadsp 20
  17:	6e          	loadsp 120
  18:	73          	loadsp 12
  19:	69          	loadsp 100
  1a:	67          	loadsp 92
  1b:	6e          	loadsp 120
  1c:	65          	loadsp 84
  1d:	64          	loadsp 80
  1e:	20          	.byte 32
  1f:	69          	loadsp 100
  20:	6e          	loadsp 120
  21:	74          	loadsp 16
  22:	00          	breakpoint
  23:	2f          	neq
  24:	68          	loadsp 96
  25:	6f          	loadsp 124
  26:	6d          	loadsp 116
  27:	65          	loadsp 84
  28:	2f          	neq
  29:	61          	loadsp 68
  2a:	6c          	loadsp 112
  2b:	76          	loadsp 24
  2c:	69          	loadsp 100
  2d:	65          	loadsp 84
  2e:	62          	loadsp 72
  2f:	6f          	loadsp 124
  30:	79          	loadsp 36
  31:	2f          	neq
  32:	7a          	loadsp 40
  33:	70          	loadsp 0
  34:	75          	loadsp 20
  35:	2f          	neq
  36:	74          	loadsp 16
  37:	6f          	loadsp 124
  38:	6f          	loadsp 124
  39:	6c          	loadsp 112
  3a:	63          	loadsp 76
  3b:	68          	loadsp 96
  3c:	61          	loadsp 68
  3d:	69          	loadsp 100
  3e:	6e          	loadsp 120
  3f:	2f          	neq
  40:	74          	loadsp 16
  41:	6f          	loadsp 124
  42:	6f          	loadsp 124
  43:	6c          	loadsp 112
  44:	63          	loadsp 76
  45:	68          	loadsp 96
  46:	61          	loadsp 68
  47:	69          	loadsp 100
  48:	6e          	loadsp 120
  49:	2f          	neq
  4a:	74          	loadsp 16
  4b:	6f          	loadsp 124
  4c:	6f          	loadsp 124
  4d:	6c          	loadsp 112
  4e:	63          	loadsp 76
  4f:	68          	loadsp 96
  50:	61          	loadsp 68
  51:	69          	loadsp 100
  52:	6e          	loadsp 120
  53:	2f          	neq
  54:	67          	loadsp 92
  55:	63          	loadsp 76
  56:	63          	loadsp 76
  57:	62          	loadsp 72
  58:	75          	loadsp 20
  59:	69          	loadsp 100
  5a:	6c          	loadsp 112
  5b:	64          	loadsp 80
  5c:	2f          	neq
  5d:	7a          	loadsp 40
  5e:	70          	loadsp 0
  5f:	75          	loadsp 20
  60:	2d          	call
  61:	65          	loadsp 84
  62:	6c          	loadsp 112
  63:	66          	loadsp 88
  64:	2f          	neq
  65:	6c          	loadsp 112
  66:	69          	loadsp 100
  67:	62          	loadsp 72
  68:	67          	loadsp 92
  69:	6c          	loadsp 112
  6a:	6f          	loadsp 124
  6b:	73          	loadsp 12
  6c:	73          	loadsp 12
  6d:	2f          	neq
  6e:	7a          	loadsp 40
  6f:	70          	loadsp 0
  70:	75          	loadsp 20
  71:	00          	breakpoint
  72:	6c          	loadsp 112
  73:	6f          	loadsp 124
  74:	6e          	loadsp 120
  75:	67          	loadsp 92
  76:	20          	.byte 32
  77:	6c          	loadsp 112
  78:	6f          	loadsp 124
  79:	6e          	loadsp 120
  7a:	67          	loadsp 92
  7b:	20          	.byte 32
  7c:	69          	loadsp 100
  7d:	6e          	loadsp 120
  7e:	74          	loadsp 16
  7f:	00          	breakpoint
  80:	54          	storesp 16
  81:	49          	storesp 100
  82:	4d          	storesp 116
  83:	45          	storesp 84
  84:	52          	storesp 8
  85:	00          	breakpoint
  86:	6f          	loadsp 124
  87:	75          	loadsp 20
  88:	74          	loadsp 16
  89:	62          	loadsp 72
  8a:	79          	loadsp 36
  8b:	74          	loadsp 16
  8c:	65          	loadsp 84
  8d:	00          	breakpoint
  8e:	5f          	storesp 60
  8f:	72          	loadsp 8
  90:	65          	loadsp 84
  91:	61          	loadsp 68
  92:	64          	loadsp 80
  93:	43          	storesp 76
  94:	79          	loadsp 36
  95:	63          	loadsp 76
  96:	6c          	loadsp 112
  97:	65          	loadsp 84
  98:	73          	loadsp 12
  99:	00          	breakpoint
  9a:	73          	loadsp 12
  9b:	68          	loadsp 96
  9c:	6f          	loadsp 124
  9d:	72          	loadsp 8
  9e:	74          	loadsp 16
  9f:	20          	.byte 32
  a0:	75          	loadsp 20
  a1:	6e          	loadsp 120
  a2:	73          	loadsp 12
  a3:	69          	loadsp 100
  a4:	67          	loadsp 92
  a5:	6e          	loadsp 120
  a6:	65          	loadsp 84
  a7:	64          	loadsp 80
  a8:	20          	.byte 32
  a9:	69          	loadsp 100
  aa:	6e          	loadsp 120
  ab:	74          	loadsp 16
  ac:	00          	breakpoint
  ad:	47          	storesp 92
  ae:	4e          	storesp 120
  af:	55          	storesp 20
  b0:	20          	.byte 32
  b1:	43          	storesp 76
  b2:	20          	.byte 32
  b3:	33          	loadb
  b4:	2e          	eq
  b5:	34          	storeb
  b6:	2e          	eq
  b7:	32          	xor
  b8:	00          	breakpoint
  b9:	5f          	storesp 60
  ba:	68          	loadsp 96
  bb:	61          	loadsp 68
  bc:	72          	loadsp 8
  bd:	64          	loadsp 80
  be:	77          	loadsp 28
  bf:	61          	loadsp 68
  c0:	72          	loadsp 8
  c1:	65          	loadsp 84
  c2:	00          	breakpoint
  c3:	2e          	eq
  c4:	2e          	eq
  c5:	2f          	neq
  c6:	2e          	eq
  c7:	2e          	eq
  c8:	2f          	neq
  c9:	2e          	eq
  ca:	2e          	eq
  cb:	2f          	neq
  cc:	2e          	eq
  cd:	2e          	eq
  ce:	2f          	neq
  cf:	67          	loadsp 92
  d0:	63          	loadsp 76
  d1:	63          	loadsp 76
  d2:	2f          	neq
  d3:	6c          	loadsp 112
  d4:	69          	loadsp 100
  d5:	62          	loadsp 72
  d6:	67          	loadsp 92
  d7:	6c          	loadsp 112
  d8:	6f          	loadsp 124
  d9:	73          	loadsp 12
  da:	73          	loadsp 12
  db:	2f          	neq
  dc:	7a          	loadsp 40
  dd:	70          	loadsp 0
  de:	75          	loadsp 20
  df:	2f          	neq
  e0:	63          	loadsp 76
  e1:	72          	loadsp 8
  e2:	74          	loadsp 16
  e3:	5f          	storesp 60
  e4:	69          	loadsp 100
  e5:	6f          	loadsp 124
  e6:	2e          	eq
  e7:	63          	loadsp 76
  e8:	00          	breakpoint
  e9:	75          	loadsp 20
  ea:	6e          	loadsp 120
  eb:	73          	loadsp 12
  ec:	69          	loadsp 100
  ed:	67          	loadsp 92
  ee:	6e          	loadsp 120
  ef:	65          	loadsp 84
  f0:	64          	loadsp 80
  f1:	20          	.byte 32
  f2:	63          	loadsp 76
  f3:	68          	loadsp 96
  f4:	61          	loadsp 68
  f5:	72          	loadsp 8
  f6:	00          	breakpoint
  f7:	73          	loadsp 12
  f8:	68          	loadsp 96
  f9:	6f          	loadsp 124
  fa:	72          	loadsp 8
  fb:	74          	loadsp 16
  fc:	20          	.byte 32
  fd:	69          	loadsp 100
  fe:	6e          	loadsp 120
  ff:	74          	loadsp 16
 100:	00          	breakpoint
 101:	69          	loadsp 100
 102:	6e          	loadsp 120
 103:	62          	loadsp 72
 104:	79          	loadsp 36
 105:	74          	loadsp 16
 106:	65          	loadsp 84
 107:	00          	breakpoint
 108:	55          	storesp 20
 109:	41          	storesp 68
 10a:	52          	storesp 8
 10b:	54          	storesp 16
 10c:	00          	breakpoint
 10d:	5f          	storesp 60
 10e:	69          	loadsp 100
 10f:	6e          	loadsp 120
 110:	69          	loadsp 100
 111:	74          	loadsp 16
 112:	49          	storesp 100
 113:	4f          	storesp 124
 114:	00          	breakpoint
 115:	63          	loadsp 76
 116:	6c          	loadsp 112
 117:	6f          	loadsp 124
 118:	63          	loadsp 76
 119:	6b          	loadsp 108
 11a:	00          	breakpoint
 11b:	61          	loadsp 68
 11c:	6c          	loadsp 112
 11d:	69          	loadsp 100
 11e:	67          	loadsp 92
 11f:	6e          	loadsp 120
 120:	65          	loadsp 84
 121:	64          	loadsp 80
 122:	5f          	storesp 60
 123:	64          	loadsp 80
 124:	73          	loadsp 12
 125:	74          	loadsp 16
 126:	00          	breakpoint
 127:	73          	loadsp 12
 128:	69          	loadsp 100
 129:	7a          	loadsp 40
 12a:	65          	loadsp 84
 12b:	5f          	storesp 60
 12c:	74          	loadsp 16
 12d:	00          	breakpoint
 12e:	61          	loadsp 68
 12f:	6c          	loadsp 112
 130:	69          	loadsp 100
 131:	67          	loadsp 92
 132:	6e          	loadsp 120
 133:	65          	loadsp 84
 134:	64          	loadsp 80
 135:	5f          	storesp 60
 136:	73          	loadsp 12
 137:	72          	loadsp 8
 138:	63          	loadsp 76
 139:	00          	breakpoint
 13a:	73          	loadsp 12
 13b:	72          	loadsp 8
 13c:	63          	loadsp 76
 13d:	30          	neg
 13e:	00          	breakpoint
 13f:	2e          	eq
 140:	2e          	eq
 141:	2f          	neq
 142:	2e          	eq
 143:	2e          	eq
 144:	2f          	neq
 145:	2e          	eq
 146:	2e          	eq
 147:	2f          	neq
 148:	2e          	eq
 149:	2e          	eq
 14a:	2f          	neq
 14b:	2e          	eq
 14c:	2e          	eq
 14d:	2f          	neq
 14e:	67          	loadsp 92
 14f:	63          	loadsp 76
 150:	63          	loadsp 76
 151:	2f          	neq
 152:	6e          	loadsp 120
 153:	65          	loadsp 84
 154:	77          	loadsp 28
 155:	6c          	loadsp 112
 156:	69          	loadsp 100
 157:	62          	loadsp 72
 158:	2f          	neq
 159:	6c          	loadsp 112
 15a:	69          	loadsp 100
 15b:	62          	loadsp 72
 15c:	63          	loadsp 76
 15d:	2f          	neq
 15e:	73          	loadsp 12
 15f:	74          	loadsp 16
 160:	72          	loadsp 8
 161:	69          	loadsp 100
 162:	6e          	loadsp 120
 163:	67          	loadsp 92
 164:	2f          	neq
 165:	6d          	loadsp 116
 166:	65          	loadsp 84
 167:	6d          	loadsp 116
 168:	63          	loadsp 76
 169:	70          	loadsp 0
 16a:	79          	loadsp 36
 16b:	2e          	eq
 16c:	63          	loadsp 76
 16d:	00          	breakpoint
 16e:	64          	loadsp 80
 16f:	73          	loadsp 12
 170:	74          	loadsp 16
 171:	30          	neg
 172:	00          	breakpoint
 173:	6d          	loadsp 116
 174:	65          	loadsp 84
 175:	6d          	loadsp 116
 176:	63          	loadsp 76
 177:	70          	loadsp 0
 178:	79          	loadsp 36
 179:	00          	breakpoint
 17a:	6c          	loadsp 112
 17b:	65          	loadsp 84
 17c:	6e          	loadsp 120
 17d:	30          	neg
 17e:	00          	breakpoint
 17f:	2f          	neq
 180:	68          	loadsp 96
 181:	6f          	loadsp 124
 182:	6d          	loadsp 116
 183:	65          	loadsp 84
 184:	2f          	neq
 185:	61          	loadsp 68
 186:	6c          	loadsp 112
 187:	76          	loadsp 24
 188:	69          	loadsp 100
 189:	65          	loadsp 84
 18a:	62          	loadsp 72
 18b:	6f          	loadsp 124
 18c:	79          	loadsp 36
 18d:	2f          	neq
 18e:	7a          	loadsp 40
 18f:	70          	loadsp 0
 190:	75          	loadsp 20
 191:	2f          	neq
 192:	74          	loadsp 16
 193:	6f          	loadsp 124
 194:	6f          	loadsp 124
 195:	6c          	loadsp 112
 196:	63          	loadsp 76
 197:	68          	loadsp 96
 198:	61          	loadsp 68
 199:	69          	loadsp 100
 19a:	6e          	loadsp 120
 19b:	2f          	neq
 19c:	74          	loadsp 16
 19d:	6f          	loadsp 124
 19e:	6f          	loadsp 124
 19f:	6c          	loadsp 112
 1a0:	63          	loadsp 76
 1a1:	68          	loadsp 96
 1a2:	61          	loadsp 68
 1a3:	69          	loadsp 100
 1a4:	6e          	loadsp 120
 1a5:	2f          	neq
 1a6:	74          	loadsp 16
 1a7:	6f          	loadsp 124
 1a8:	6f          	loadsp 124
 1a9:	6c          	loadsp 112
 1aa:	63          	loadsp 76
 1ab:	68          	loadsp 96
 1ac:	61          	loadsp 68
 1ad:	69          	loadsp 100
 1ae:	6e          	loadsp 120
 1af:	2f          	neq
 1b0:	67          	loadsp 92
 1b1:	63          	loadsp 76
 1b2:	63          	loadsp 76
 1b3:	62          	loadsp 72
 1b4:	75          	loadsp 20
 1b5:	69          	loadsp 100
 1b6:	6c          	loadsp 112
 1b7:	64          	loadsp 80
 1b8:	2f          	neq
 1b9:	7a          	loadsp 40
 1ba:	70          	loadsp 0
 1bb:	75          	loadsp 20
 1bc:	2d          	call
 1bd:	65          	loadsp 84
 1be:	6c          	loadsp 112
 1bf:	66          	loadsp 88
 1c0:	2f          	neq
 1c1:	6e          	loadsp 120
 1c2:	65          	loadsp 84
 1c3:	77          	loadsp 28
 1c4:	6c          	loadsp 112
 1c5:	69          	loadsp 100
 1c6:	62          	loadsp 72
 1c7:	2f          	neq
 1c8:	6c          	loadsp 112
 1c9:	69          	loadsp 100
 1ca:	62          	loadsp 72
 1cb:	63          	loadsp 76
 1cc:	2f          	neq
 1cd:	73          	loadsp 12
 1ce:	74          	loadsp 16
 1cf:	72          	loadsp 8
 1d0:	69          	loadsp 100
 1d1:	6e          	loadsp 120
 1d2:	67          	loadsp 92
	...
Disassembly of section .boots:

00001000 <ivector>:
    1000:	00          	breakpoint
    1001:	00          	breakpoint
	...

00001004 <bootloaderdata>:
    1004:	00          	breakpoint
    1005:	00          	breakpoint
	...

00001008 <__sketch_start>:
    1008:	0b          	nop
    1009:	00          	breakpoint
	...
Disassembly of section .vectors:

00000000 <_memreg-0x8>:
	...
