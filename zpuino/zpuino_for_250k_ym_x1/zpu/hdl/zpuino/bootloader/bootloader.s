
bootloader.elf:     file format elf32-zpu

Disassembly of section .fixed_vectors:

00000000 <_start>:
   0:	0b          	nop
   1:	0b          	nop
   2:	0b          	nop
   3:	98          	im 24
   4:	92          	im 18
   5:	04          	poppc
	...

00000020 <_zpu_interrupt_vector>:
  20:	0b          	nop
  21:	0b          	nop
  22:	0b          	nop
  23:	97          	im 23
  24:	f3          	im -13
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
 287:	9c          	im 28
 288:	c8          	im -56
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
 346:	88          	im 8
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
 404:	97          	im 23
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
 467:	99          	im 25
 468:	d2          	im -46
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
 480:	a0          	im 32
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
 495:	8d          	im 13
 496:	e1          	im -31
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
 4a6:	98          	im 24
 4a7:	33          	loadb
 4a8:	51          	storesp 4
 4a9:	70          	loadsp 0
 4aa:	a6          	im 38
 4ab:	38          	neqbranch
 4ac:	a0          	im 32
 4ad:	94          	im 20
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
 4bb:	94          	im 20
 4bc:	0c          	store
 4bd:	70          	loadsp 0
 4be:	2d          	call
 4bf:	a0          	im 32
 4c0:	94          	im 20
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
 4cf:	98          	im 24
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
 4dc:	9d          	im 29
 4dd:	ac          	im 44
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
 4f7:	9d          	im 29
 4f8:	ac          	im 44
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
 508:	82          	im 2
 509:	90          	im 16
 50a:	84          	im 4
 50b:	08          	load
 50c:	70          	loadsp 0
 50d:	81          	im 1
 50e:	2a          	lshiftright
 50f:	70          	loadsp 0
 510:	81          	im 1
 511:	06          	and
 512:	51          	storesp 4
 513:	51          	storesp 4
 514:	51          	storesp 4
 515:	70          	loadsp 0
 516:	f1          	im -15
 517:	38          	neqbranch
 518:	72          	loadsp 8
 519:	82          	im 2
 51a:	90          	im 16
 51b:	80          	im 0
 51c:	0c          	store
 51d:	82          	im 2
 51e:	3d          	pushspadd
 51f:	0d          	popsp
 520:	04          	poppc

00000521 <_Z8sendBytej>:
 521:	fe          	im -2
 522:	3d          	pushspadd
 523:	0d          	popsp
 524:	74          	loadsp 16
 525:	70          	loadsp 0
 526:	82          	im 2
 527:	f0          	im -16
 528:	88          	im 8
 529:	0c          	store
 52a:	70          	loadsp 0
 52b:	81          	im 1
 52c:	ff          	im -1
 52d:	06          	and
 52e:	ff          	im -1
 52f:	83          	im 3
 530:	11          	addsp 4
 531:	54          	storesp 16
 532:	51          	storesp 4
 533:	53          	storesp 12
 534:	71          	loadsp 4
 535:	81          	im 1
 536:	26          	ulessthan
 537:	8d          	im 13
 538:	38          	neqbranch
 539:	80          	im 0
 53a:	fd          	im -3
 53b:	51          	storesp 4
 53c:	8a          	im 10
 53d:	85          	im 5
 53e:	2d          	call
 53f:	72          	loadsp 8
 540:	a0          	im 32
 541:	32          	xor
 542:	51          	storesp 4
 543:	83          	im 3
 544:	39          	poppcrel

00000545 <.L6>:
 545:	72          	loadsp 8
 546:	51          	storesp 4

00000547 <.L8>:
 547:	8a          	im 10
 548:	85          	im 5
 549:	2d          	call
 54a:	84          	im 4
 54b:	3d          	pushspadd
 54c:	0d          	popsp
 54d:	04          	poppc

0000054e <_Z10sendBufferPKhj>:
 54e:	fe          	im -2
 54f:	3d          	pushspadd
 550:	0d          	popsp
 551:	74          	loadsp 16
 552:	ff          	im -1
 553:	17          	addsp 28
 554:	53          	storesp 12
 555:	53          	storesp 12

00000556 <.L15>:
 556:	71          	loadsp 4
 557:	ff          	im -1
 558:	2e          	eq
 559:	90          	im 16
 55a:	38          	neqbranch
 55b:	72          	loadsp 8
 55c:	70          	loadsp 0
 55d:	81          	im 1
 55e:	05          	add
 55f:	54          	storesp 16
 560:	33          	loadb
 561:	51          	storesp 4
 562:	8a          	im 10
 563:	a1          	im 33
 564:	2d          	call
 565:	ff          	im -1
 566:	12          	addsp 8
 567:	52          	storesp 8
 568:	ed          	im -19
 569:	39          	poppcrel

0000056a <.L14>:
 56a:	84          	im 4
 56b:	3d          	pushspadd
 56c:	0d          	popsp
 56d:	04          	poppc

0000056e <_Z11prepareSendv>:
 56e:	80          	im 0
 56f:	3d          	pushspadd
 570:	0d          	popsp
 571:	83          	im 3
 572:	ff          	im -1
 573:	ff          	im -1
 574:	0b          	nop
 575:	82          	im 2
 576:	f0          	im -16
 577:	80          	im 0
 578:	0c          	store
 579:	80          	im 0
 57a:	fe          	im -2
 57b:	51          	storesp 4
 57c:	8a          	im 10
 57d:	85          	im 5
 57e:	2d          	call
 57f:	82          	im 2
 580:	3d          	pushspadd
 581:	0d          	popsp
 582:	04          	poppc

00000583 <_Z10finishSendv>:
 583:	ff          	im -1
 584:	3d          	pushspadd
 585:	0d          	popsp
 586:	82          	im 2
 587:	f0          	im -16
 588:	80          	im 0
 589:	08          	load
 58a:	70          	loadsp 0
 58b:	88          	im 8
 58c:	2a          	lshiftright
 58d:	52          	storesp 8
 58e:	52          	storesp 8
 58f:	8a          	im 10
 590:	a1          	im 33
 591:	2d          	call
 592:	71          	loadsp 4
 593:	81          	im 1
 594:	ff          	im -1
 595:	06          	and
 596:	51          	storesp 4
 597:	8a          	im 10
 598:	a1          	im 33
 599:	2d          	call
 59a:	80          	im 0
 59b:	fe          	im -2
 59c:	51          	storesp 4
 59d:	8a          	im 10
 59e:	85          	im 5
 59f:	2d          	call
 5a0:	83          	im 3
 5a1:	3d          	pushspadd
 5a2:	0d          	popsp
 5a3:	04          	poppc

000005a4 <_Z8spi_copyv>:
 5a4:	80          	im 0
 5a5:	ff          	im -1
 5a6:	f8          	im -8
 5a7:	0d          	popsp
 5a8:	8c          	im 12
 5a9:	b2          	im 50
 5aa:	04          	poppc

000005ab <.L19>:
 5ab:	ff          	im -1
 5ac:	39          	poppcrel

000005ad <_Z6inbytev>:
 5ad:	ff          	im -1
 5ae:	3d          	pushspadd
 5af:	0d          	popsp

000005b0 <.L30>:
 5b0:	82          	im 2
 5b1:	90          	im 16
 5b2:	84          	im 4
 5b3:	08          	load
 5b4:	70          	loadsp 0
 5b5:	81          	im 1
 5b6:	06          	and
 5b7:	51          	storesp 4
 5b8:	51          	storesp 4
 5b9:	70          	loadsp 0
 5ba:	9f          	im 31
 5bb:	38          	neqbranch
 5bc:	a2          	im 34
 5bd:	cc          	im -52
 5be:	08          	load
 5bf:	52          	storesp 8
 5c0:	71          	loadsp 4
 5c1:	ee          	im -18
 5c2:	38          	neqbranch
 5c3:	a2          	im 34
 5c4:	c8          	im -56
 5c5:	08          	load
 5c6:	51          	storesp 4
 5c7:	87          	im 7
 5c8:	e8          	im -24
 5c9:	71          	loadsp 4
 5ca:	27          	ulessthanorequal
 5cb:	e4          	im -28
 5cc:	38          	neqbranch
 5cd:	71          	loadsp 4
 5ce:	82          	im 2
 5cf:	c0          	im -64
 5d0:	80          	im 0
 5d1:	0c          	store
 5d2:	71          	loadsp 4
 5d3:	82          	im 2
 5d4:	b0          	im 48
 5d5:	80          	im 0
 5d6:	0c          	store
 5d7:	8b          	im 11
 5d8:	a4          	im 36
 5d9:	2d          	call

000005da <.L26>:
 5da:	82          	im 2
 5db:	90          	im 16
 5dc:	80          	im 0
 5dd:	08          	load
 5de:	88          	im 8
 5df:	0c          	store
 5e0:	83          	im 3
 5e1:	3d          	pushspadd
 5e2:	0d          	popsp
 5e3:	04          	poppc

000005e4 <_Z11enableTimerv>:
 5e4:	82          	im 2
 5e5:	f6          	im -10
 5e6:	ff          	im -1
 5e7:	0b          	nop
 5e8:	82          	im 2
 5e9:	b0          	im 48
 5ea:	88          	im 8
 5eb:	0c          	store
 5ec:	80          	im 0
 5ed:	0b          	nop
 5ee:	82          	im 2
 5ef:	b0          	im 48
 5f0:	84          	im 4
 5f1:	0c          	store
 5f2:	9f          	im 31
 5f3:	0b          	nop
 5f4:	82          	im 2
 5f5:	b0          	im 48
 5f6:	80          	im 0
 5f7:	0c          	store
 5f8:	04          	poppc

000005f9 <_Z11spi_disablev>:
 5f9:	ff          	im -1
 5fa:	3d          	pushspadd
 5fb:	0d          	popsp
 5fc:	82          	im 2
 5fd:	a0          	im 32
 5fe:	84          	im 4
 5ff:	70          	loadsp 0
 600:	08          	load
 601:	70          	loadsp 0
 602:	90          	im 16
 603:	80          	im 0
 604:	0a          	flip
 605:	07          	or
 606:	72          	loadsp 8
 607:	0c          	store
 608:	52          	storesp 8
 609:	52          	storesp 8
 60a:	83          	im 3
 60b:	3d          	pushspadd
 60c:	0d          	popsp
 60d:	04          	poppc

0000060e <_Z10spi_enablev>:
 60e:	ff          	im -1
 60f:	3d          	pushspadd
 610:	0d          	popsp
 611:	82          	im 2
 612:	a0          	im 32
 613:	84          	im 4
 614:	70          	loadsp 0
 615:	08          	load
 616:	70          	loadsp 0
 617:	ef          	im -17
 618:	ff          	im -1
 619:	0a          	flip
 61a:	06          	and
 61b:	72          	loadsp 8
 61c:	0c          	store
 61d:	52          	storesp 8
 61e:	52          	storesp 8
 61f:	83          	im 3
 620:	3d          	pushspadd
 621:	0d          	popsp
 622:	04          	poppc

00000623 <start>:
 623:	a0          	im 32
 624:	8c          	im 12
 625:	0b          	nop
 626:	a0          	im 32
 627:	80          	im 0
 628:	0c          	store
 629:	80          	im 0
 62a:	ff          	im -1
 62b:	f8          	im -8
 62c:	0d          	popsp
 62d:	a0          	im 32
 62e:	84          	im 4
 62f:	04          	poppc

00000630 <.L62>:
 630:	ff          	im -1
 631:	39          	poppcrel

00000632 <spi_copy_impl>:
 632:	fc          	im -4
 633:	3d          	pushspadd
 634:	0d          	popsp
 635:	a0          	im 32
 636:	80          	im 0
 637:	54          	storesp 16
 638:	8c          	im 12
 639:	8e          	im 14
 63a:	2d          	call
 63b:	8b          	im 11
 63c:	0b          	nop
 63d:	82          	im 2
 63e:	80          	im 0
 63f:	84          	im 4
 640:	0c          	store
 641:	84          	im 4
 642:	0b          	nop
 643:	82          	im 2
 644:	80          	im 0
 645:	84          	im 4
 646:	0c          	store
 647:	88          	im 8
 648:	a0          	im 32
 649:	0b          	nop
 64a:	82          	im 2
 64b:	80          	im 0
 64c:	84          	im 4
 64d:	0c          	store
 64e:	90          	im 16
 64f:	c0          	im -64
 650:	80          	im 0
 651:	0b          	nop
 652:	82          	im 2
 653:	80          	im 0
 654:	84          	im 4
 655:	0c          	store
 656:	80          	im 0
 657:	0b          	nop
 658:	82          	im 2
 659:	80          	im 0
 65a:	84          	im 4
 65b:	0c          	store
 65c:	80          	im 0
 65d:	0b          	nop
 65e:	82          	im 2
 65f:	80          	im 0
 660:	84          	im 4
 661:	0c          	store
 662:	80          	im 0
 663:	0b          	nop
 664:	82          	im 2
 665:	80          	im 0
 666:	84          	im 4
 667:	0c          	store
 668:	82          	im 2
 669:	80          	im 0
 66a:	84          	im 4
 66b:	08          	load
 66c:	83          	im 3
 66d:	ff          	im -1
 66e:	ff          	im -1
 66f:	06          	and
 670:	53          	storesp 12
 671:	80          	im 0
 672:	0b          	nop
 673:	82          	im 2
 674:	80          	im 0
 675:	84          	im 4
 676:	0c          	store
 677:	80          	im 0
 678:	0b          	nop
 679:	82          	im 2
 67a:	80          	im 0
 67b:	84          	im 4
 67c:	0c          	store
 67d:	82          	im 2
 67e:	80          	im 0
 67f:	84          	im 4
 680:	08          	load
 681:	83          	im 3
 682:	ff          	im -1
 683:	ff          	im -1
 684:	06          	and
 685:	55          	storesp 20
 686:	80          	im 0
 687:	df          	im -33
 688:	80          	im 0
 689:	73          	loadsp 12
 68a:	27          	ulessthanorequal
 68b:	83          	im 3
 68c:	38          	neqbranch

0000068d <.L88>:
 68d:	ff          	im -1
 68e:	39          	poppcrel

0000068f <.L87>:
 68f:	83          	im 3
 690:	ff          	im -1
 691:	ff          	im -1
 692:	0b          	nop
 693:	82          	im 2
 694:	f0          	im -16
 695:	80          	im 0
 696:	0c          	store

00000697 <.L110>:
 697:	ff          	im -1
 698:	13          	addsp 12
 699:	53          	storesp 12
 69a:	72          	loadsp 8
 69b:	ff          	im -1
 69c:	2e          	eq
 69d:	a4          	im 36
 69e:	38          	neqbranch
 69f:	84          	im 4
 6a0:	52          	storesp 8

000006a1 <.L99>:
 6a1:	80          	im 0
 6a2:	0b          	nop
 6a3:	82          	im 2
 6a4:	80          	im 0
 6a5:	84          	im 4
 6a6:	0c          	store
 6a7:	82          	im 2
 6a8:	80          	im 0
 6a9:	84          	im 4
 6aa:	08          	load
 6ab:	82          	im 2
 6ac:	f0          	im -16
 6ad:	88          	im 8
 6ae:	0c          	store
 6af:	ff          	im -1
 6b0:	12          	addsp 8
 6b1:	52          	storesp 8
 6b2:	71          	loadsp 4
 6b3:	ed          	im -19
 6b4:	38          	neqbranch
 6b5:	73          	loadsp 12
 6b6:	84          	im 4
 6b7:	15          	addsp 20
 6b8:	82          	im 2
 6b9:	80          	im 0
 6ba:	84          	im 4
 6bb:	08          	load
 6bc:	72          	loadsp 8
 6bd:	0c          	store
 6be:	55          	storesp 20
 6bf:	52          	storesp 8
 6c0:	d6          	im -42
 6c1:	39          	poppcrel

000006c2 <.L107>:
 6c2:	8b          	im 11
 6c3:	f9          	im -7
 6c4:	2d          	call
 6c5:	82          	im 2
 6c6:	f0          	im -16
 6c7:	80          	im 0
 6c8:	08          	load
 6c9:	51          	storesp 4
 6ca:	74          	loadsp 16
 6cb:	71          	loadsp 4
 6cc:	2e          	eq
 6cd:	83          	im 3
 6ce:	38          	neqbranch

000006cf <.L104>:
 6cf:	ff          	im -1
 6d0:	39          	poppcrel

000006d1 <.L103>:
 6d1:	82          	im 2
 6d2:	80          	im 0
 6d3:	80          	im 0
 6d4:	08          	load
 6d5:	70          	loadsp 0
 6d6:	ff          	im -1
 6d7:	bf          	im 63
 6d8:	06          	and
 6d9:	82          	im 2
 6da:	80          	im 0
 6db:	80          	im 0
 6dc:	0c          	store
 6dd:	51          	storesp 4
 6de:	8c          	im 12
 6df:	a3          	im 35
 6e0:	2d          	call

000006e1 <_zpu_interrupt>:
 6e1:	ff          	im -1
 6e2:	3d          	pushspadd
 6e3:	0d          	popsp
 6e4:	a2          	im 34
 6e5:	c8          	im -56
 6e6:	08          	load
 6e7:	81          	im 1
 6e8:	11          	addsp 4
 6e9:	a2          	im 34
 6ea:	c8          	im -56
 6eb:	0c          	store
 6ec:	51          	storesp 4
 6ed:	82          	im 2
 6ee:	b0          	im 48
 6ef:	80          	im 0
 6f0:	70          	loadsp 0
 6f1:	08          	load
 6f2:	70          	loadsp 0
 6f3:	fe          	im -2
 6f4:	ff          	im -1
 6f5:	06          	and
 6f6:	72          	loadsp 8
 6f7:	0c          	store
 6f8:	52          	storesp 8
 6f9:	52          	storesp 8
 6fa:	83          	im 3
 6fb:	3d          	pushspadd
 6fc:	0d          	popsp
 6fd:	04          	poppc

000006fe <_Z14is_atmel_flashv>:
 6fe:	ff          	im -1
 6ff:	3d          	pushspadd
 700:	0d          	popsp
 701:	80          	im 0
 702:	0b          	nop
 703:	a2          	im 34
 704:	d0          	im -48
 705:	08          	load
 706:	87          	im 7
 707:	fc          	im -4
 708:	80          	im 0
 709:	80          	im 0
 70a:	06          	and
 70b:	52          	storesp 8
 70c:	52          	storesp 8
 70d:	70          	loadsp 0
 70e:	80          	im 0
 70f:	fc          	im -4
 710:	80          	im 0
 711:	80          	im 0
 712:	2e          	eq
 713:	09          	not
 714:	81          	im 1
 715:	06          	and
 716:	83          	im 3
 717:	38          	neqbranch
 718:	81          	im 1
 719:	52          	storesp 8

0000071a <.L113>:
 71a:	71          	loadsp 4
 71b:	88          	im 8
 71c:	0c          	store
 71d:	83          	im 3
 71e:	3d          	pushspadd
 71f:	0d          	popsp
 720:	04          	poppc

00000721 <_Z15spi_read_statusv>:
 721:	80          	im 0
 722:	3d          	pushspadd
 723:	0d          	popsp
 724:	8c          	im 12
 725:	8e          	im 14
 726:	2d          	call
 727:	8d          	im 13
 728:	fe          	im -2
 729:	2d          	call
 72a:	88          	im 8
 72b:	08          	load
 72c:	80          	im 0
 72d:	2e          	eq
 72e:	8a          	im 10
 72f:	38          	neqbranch
 730:	80          	im 0
 731:	d7          	im -41
 732:	0b          	nop
 733:	82          	im 2
 734:	80          	im 0
 735:	84          	im 4
 736:	0c          	store
 737:	87          	im 7
 738:	39          	poppcrel

00000739 <.L115>:
 739:	85          	im 5
 73a:	0b          	nop
 73b:	82          	im 2
 73c:	80          	im 0
 73d:	84          	im 4
 73e:	0c          	store

0000073f <.L118>:
 73f:	80          	im 0
 740:	0b          	nop
 741:	82          	im 2
 742:	80          	im 0
 743:	84          	im 4
 744:	0c          	store
 745:	82          	im 2
 746:	80          	im 0
 747:	84          	im 4
 748:	08          	load
 749:	70          	loadsp 0
 74a:	81          	im 1
 74b:	ff          	im -1
 74c:	06          	and
 74d:	51          	storesp 4
 74e:	51          	storesp 4
 74f:	8b          	im 11
 750:	f9          	im -7
 751:	2d          	call
 752:	70          	loadsp 0
 753:	88          	im 8
 754:	0c          	store
 755:	82          	im 2
 756:	3d          	pushspadd
 757:	0d          	popsp
 758:	04          	poppc

00000759 <_Z11cmd_progmemv>:
 759:	fc          	im -4
 75a:	3d          	pushspadd
 75b:	0d          	popsp
 75c:	a0          	im 32
 75d:	9f          	im 31
 75e:	33          	loadb
 75f:	a0          	im 32
 760:	a0          	im 32
 761:	33          	loadb
 762:	71          	loadsp 4
 763:	82          	im 2
 764:	80          	im 0
 765:	29          	mult
 766:	05          	add
 767:	a0          	im 32
 768:	9d          	im 29
 769:	33          	loadb
 76a:	a0          	im 32
 76b:	9e          	im 30
 76c:	33          	loadb
 76d:	71          	loadsp 4
 76e:	82          	im 2
 76f:	80          	im 0
 770:	29          	mult
 771:	05          	add
 772:	57          	storesp 28
 773:	57          	storesp 28
 774:	54          	storesp 16
 775:	52          	storesp 8

00000776 <.L137>:
 776:	ff          	im -1
 777:	13          	addsp 12
 778:	53          	storesp 12
 779:	72          	loadsp 8
 77a:	ff          	im -1
 77b:	2e          	eq
 77c:	a0          	im 32
 77d:	38          	neqbranch

0000077e <.L136>:
 77e:	82          	im 2
 77f:	90          	im 16
 780:	84          	im 4
 781:	08          	load
 782:	70          	loadsp 0
 783:	81          	im 1
 784:	06          	and
 785:	51          	storesp 4
 786:	52          	storesp 8
 787:	71          	loadsp 4
 788:	f5          	im -11
 789:	38          	neqbranch
 78a:	82          	im 2
 78b:	90          	im 16
 78c:	80          	im 0
 78d:	08          	load
 78e:	52          	storesp 8
 78f:	71          	loadsp 4
 790:	74          	loadsp 16
 791:	70          	loadsp 0
 792:	81          	im 1
 793:	05          	add
 794:	56          	storesp 24
 795:	34          	storeb
 796:	71          	loadsp 4
 797:	51          	storesp 4
 798:	8a          	im 10
 799:	85          	im 5
 79a:	2d          	call
 79b:	da          	im -38
 79c:	39          	poppcrel

0000079d <.L133>:
 79d:	8c          	im 12
 79e:	a3          	im 35
 79f:	2d          	call

000007a0 <_Z20cmd_raw_send_receivev>:
 7a0:	fd          	im -3
 7a1:	3d          	pushspadd
 7a2:	0d          	popsp
 7a3:	8c          	im 12
 7a4:	8e          	im 14
 7a5:	2d          	call
 7a6:	a0          	im 32
 7a7:	9d          	im 29
 7a8:	33          	loadb
 7a9:	a0          	im 32
 7aa:	9e          	im 30
 7ab:	33          	loadb
 7ac:	71          	loadsp 4
 7ad:	82          	im 2
 7ae:	80          	im 0
 7af:	29          	mult
 7b0:	05          	add
 7b1:	53          	storesp 12
 7b2:	53          	storesp 12
 7b3:	80          	im 0
 7b4:	72          	loadsp 8
 7b5:	27          	ulessthanorequal
 7b6:	96          	im 22
 7b7:	38          	neqbranch
 7b8:	a0          	im 32
 7b9:	a1          	im 33
 7ba:	72          	loadsp 8
 7bb:	54          	storesp 16
 7bc:	54          	storesp 16

000007bd <.L144>:
 7bd:	73          	loadsp 12
 7be:	70          	loadsp 0
 7bf:	81          	im 1
 7c0:	05          	add
 7c1:	55          	storesp 20
 7c2:	33          	loadb
 7c3:	82          	im 2
 7c4:	80          	im 0
 7c5:	84          	im 4
 7c6:	0c          	store
 7c7:	ff          	im -1
 7c8:	13          	addsp 12
 7c9:	53          	storesp 12
 7ca:	72          	loadsp 8
 7cb:	f1          	im -15
 7cc:	38          	neqbranch

000007cd <.L158>:
 7cd:	a0          	im 32
 7ce:	9f          	im 31
 7cf:	33          	loadb
 7d0:	a0          	im 32
 7d1:	a0          	im 32
 7d2:	33          	loadb
 7d3:	71          	loadsp 4
 7d4:	82          	im 2
 7d5:	80          	im 0
 7d6:	29          	mult
 7d7:	05          	add
 7d8:	55          	storesp 20
 7d9:	52          	storesp 8
 7da:	80          	im 0
 7db:	53          	storesp 12

000007dc <.L163>:
 7dc:	72          	loadsp 8
 7dd:	74          	loadsp 16
 7de:	27          	ulessthanorequal
 7df:	96          	im 22
 7e0:	38          	neqbranch
 7e1:	80          	im 0
 7e2:	0b          	nop
 7e3:	82          	im 2
 7e4:	80          	im 0
 7e5:	84          	im 4
 7e6:	0c          	store
 7e7:	82          	im 2
 7e8:	80          	im 0
 7e9:	84          	im 4
 7ea:	08          	load
 7eb:	52          	storesp 8
 7ec:	71          	loadsp 4
 7ed:	a0          	im 32
 7ee:	9c          	im 28
 7ef:	14          	addsp 16
 7f0:	34          	storeb
 7f1:	81          	im 1
 7f2:	13          	addsp 12
 7f3:	53          	storesp 12
 7f4:	e7          	im -25
 7f5:	39          	poppcrel

000007f6 <.L160>:
 7f6:	8b          	im 11
 7f7:	f9          	im -7
 7f8:	2d          	call
 7f9:	8a          	im 10
 7fa:	ee          	im -18
 7fb:	2d          	call
 7fc:	81          	im 1
 7fd:	84          	im 4
 7fe:	51          	storesp 4
 7ff:	8a          	im 10
 800:	a1          	im 33
 801:	2d          	call
 802:	73          	loadsp 12
 803:	88          	im 8
 804:	2a          	lshiftright
 805:	51          	storesp 4
 806:	8a          	im 10
 807:	a1          	im 33
 808:	2d          	call
 809:	73          	loadsp 12
 80a:	51          	storesp 4
 80b:	8a          	im 10
 80c:	a1          	im 33
 80d:	2d          	call
 80e:	80          	im 0
 80f:	53          	storesp 12

00000810 <.L164>:
 810:	72          	loadsp 8
 811:	74          	loadsp 16
 812:	27          	ulessthanorequal
 813:	8e          	im 14
 814:	38          	neqbranch
 815:	a0          	im 32
 816:	9c          	im 28
 817:	13          	addsp 12
 818:	33          	loadb
 819:	51          	storesp 4
 81a:	8a          	im 10
 81b:	a1          	im 33
 81c:	2d          	call
 81d:	81          	im 1
 81e:	13          	addsp 12
 81f:	53          	storesp 12
 820:	ef          	im -17
 821:	39          	poppcrel

00000822 <.L162>:
 822:	8b          	im 11
 823:	83          	im 3
 824:	2d          	call
 825:	85          	im 5
 826:	3d          	pushspadd
 827:	0d          	popsp
 828:	04          	poppc

00000829 <_Z19cmd_sst_aai_programv>:
 829:	fc          	im -4
 82a:	3d          	pushspadd
 82b:	0d          	popsp
 82c:	8c          	im 12
 82d:	8e          	im 14
 82e:	2d          	call
 82f:	86          	im 6
 830:	0b          	nop
 831:	82          	im 2
 832:	80          	im 0
 833:	84          	im 4
 834:	0c          	store
 835:	8b          	im 11
 836:	f9          	im -7
 837:	2d          	call
 838:	8c          	im 12
 839:	8e          	im 14
 83a:	2d          	call
 83b:	81          	im 1
 83c:	ad          	im 45
 83d:	0b          	nop
 83e:	82          	im 2
 83f:	80          	im 0
 840:	84          	im 4
 841:	0c          	store
 842:	a0          	im 32
 843:	9d          	im 29
 844:	33          	loadb
 845:	a0          	im 32
 846:	9e          	im 30
 847:	33          	loadb
 848:	71          	loadsp 4
 849:	82          	im 2
 84a:	80          	im 0
 84b:	29          	mult
 84c:	05          	add
 84d:	a0          	im 32
 84e:	9f          	im 31
 84f:	33          	loadb
 850:	82          	im 2
 851:	80          	im 0
 852:	84          	im 4
 853:	0c          	store
 854:	a0          	im 32
 855:	a0          	im 32
 856:	33          	loadb
 857:	82          	im 2
 858:	80          	im 0
 859:	84          	im 4
 85a:	0c          	store
 85b:	a0          	im 32
 85c:	a1          	im 33
 85d:	33          	loadb
 85e:	82          	im 2
 85f:	80          	im 0
 860:	84          	im 4
 861:	0c          	store
 862:	56          	storesp 24
 863:	52          	storesp 8
 864:	80          	im 0
 865:	54          	storesp 16
 866:	73          	loadsp 12
 867:	75          	loadsp 20
 868:	27          	ulessthanorequal
 869:	b9          	im 57
 86a:	38          	neqbranch
 86b:	a0          	im 32
 86c:	a3          	im 35
 86d:	53          	storesp 12

0000086e <.L189>:
 86e:	73          	loadsp 12
 86f:	80          	im 0
 870:	2e          	eq
 871:	8b          	im 11
 872:	38          	neqbranch
 873:	8c          	im 12
 874:	8e          	im 14
 875:	2d          	call
 876:	81          	im 1
 877:	ad          	im 45
 878:	0b          	nop
 879:	82          	im 2
 87a:	80          	im 0
 87b:	84          	im 4
 87c:	0c          	store

0000087d <.L179>:
 87d:	ff          	im -1
 87e:	13          	addsp 12
 87f:	33          	loadb
 880:	82          	im 2
 881:	80          	im 0
 882:	84          	im 4
 883:	0c          	store
 884:	72          	loadsp 8
 885:	33          	loadb
 886:	82          	im 2
 887:	80          	im 0
 888:	84          	im 4
 889:	0c          	store
 88a:	8b          	im 11
 88b:	f9          	im -7
 88c:	2d          	call

0000088d <.L186>:
 88d:	8e          	im 14
 88e:	a1          	im 33
 88f:	2d          	call
 890:	88          	im 8
 891:	08          	load
 892:	81          	im 1
 893:	06          	and
 894:	52          	storesp 8
 895:	71          	loadsp 4
 896:	f6          	im -10
 897:	38          	neqbranch
 898:	82          	im 2
 899:	14          	addsp 16
 89a:	82          	im 2
 89b:	14          	addsp 16
 89c:	54          	storesp 16
 89d:	54          	storesp 16
 89e:	74          	loadsp 16
 89f:	74          	loadsp 16
 8a0:	26          	ulessthan
 8a1:	cc          	im -52
 8a2:	38          	neqbranch

000008a3 <.L193>:
 8a3:	8c          	im 12
 8a4:	8e          	im 14
 8a5:	2d          	call
 8a6:	84          	im 4
 8a7:	0b          	nop
 8a8:	82          	im 2
 8a9:	80          	im 0
 8aa:	84          	im 4
 8ab:	0c          	store
 8ac:	8b          	im 11
 8ad:	f9          	im -7
 8ae:	2d          	call
 8af:	8a          	im 10
 8b0:	ee          	im -18
 8b1:	2d          	call
 8b2:	81          	im 1
 8b3:	87          	im 7
 8b4:	51          	storesp 4
 8b5:	8a          	im 10
 8b6:	a1          	im 33
 8b7:	2d          	call
 8b8:	8b          	im 11
 8b9:	83          	im 3
 8ba:	2d          	call
 8bb:	86          	im 6
 8bc:	3d          	pushspadd
 8bd:	0d          	popsp
 8be:	04          	poppc

000008bf <_Z11simpleReplyj>:
 8bf:	80          	im 0
 8c0:	3d          	pushspadd
 8c1:	0d          	popsp
 8c2:	8a          	im 10
 8c3:	ee          	im -18
 8c4:	2d          	call
 8c5:	72          	loadsp 8
 8c6:	81          	im 1
 8c7:	80          	im 0
 8c8:	07          	or
 8c9:	51          	storesp 4
 8ca:	8a          	im 10
 8cb:	a1          	im 33
 8cc:	2d          	call
 8cd:	8b          	im 11
 8ce:	83          	im 3
 8cf:	2d          	call
 8d0:	82          	im 2
 8d1:	3d          	pushspadd
 8d2:	0d          	popsp
 8d3:	04          	poppc

000008d4 <_Z16cmd_set_baudratev>:
 8d4:	fd          	im -3
 8d5:	3d          	pushspadd
 8d6:	0d          	popsp
 8d7:	a0          	im 32
 8d8:	9d          	im 29
 8d9:	33          	loadb
 8da:	a0          	im 32
 8db:	9e          	im 30
 8dc:	33          	loadb
 8dd:	71          	loadsp 4
 8de:	90          	im 16
 8df:	2b          	ashiftleft
 8e0:	71          	loadsp 4
 8e1:	88          	im 8
 8e2:	2b          	ashiftleft
 8e3:	07          	or
 8e4:	a0          	im 32
 8e5:	9f          	im 31
 8e6:	33          	loadb
 8e7:	70          	loadsp 0
 8e8:	72          	loadsp 8
 8e9:	07          	or
 8ea:	88          	im 8
 8eb:	2b          	ashiftleft
 8ec:	a0          	im 32
 8ed:	a0          	im 32
 8ee:	33          	loadb
 8ef:	71          	loadsp 4
 8f0:	07          	or
 8f1:	51          	storesp 4
 8f2:	52          	storesp 8
 8f3:	53          	storesp 12
 8f4:	55          	storesp 20
 8f5:	55          	storesp 20
 8f6:	52          	storesp 8
 8f7:	88          	im 8
 8f8:	51          	storesp 4
 8f9:	91          	im 17
 8fa:	bf          	im 63
 8fb:	2d          	call
 8fc:	81          	im 1
 8fd:	ff          	im -1
 8fe:	51          	storesp 4
 8ff:	8a          	im 10
 900:	85          	im 5
 901:	2d          	call

00000902 <.L196>:
 902:	82          	im 2
 903:	90          	im 16
 904:	84          	im 4
 905:	08          	load
 906:	70          	loadsp 0
 907:	81          	im 1
 908:	2a          	lshiftright
 909:	70          	loadsp 0
 90a:	81          	im 1
 90b:	06          	and
 90c:	51          	storesp 4
 90d:	51          	storesp 4
 90e:	52          	storesp 8
 90f:	71          	loadsp 4
 910:	f1          	im -15
 911:	38          	neqbranch
 912:	72          	loadsp 8
 913:	84          	im 4
 914:	80          	im 0
 915:	80          	im 0
 916:	07          	or
 917:	82          	im 2
 918:	90          	im 16
 919:	84          	im 4
 91a:	0c          	store
 91b:	85          	im 5
 91c:	3d          	pushspadd
 91d:	0d          	popsp
 91e:	04          	poppc

0000091f <_Z13cmd_waitreadyv>:
 91f:	fe          	im -2
 920:	3d          	pushspadd
 921:	0d          	popsp
 922:	8d          	im 13
 923:	fe          	im -2
 924:	2d          	call
 925:	88          	im 8
 926:	08          	load
 927:	80          	im 0
 928:	2e          	eq
 929:	97          	im 23
 92a:	38          	neqbranch

0000092b <.L201>:
 92b:	8e          	im 14
 92c:	a1          	im 33
 92d:	2d          	call
 92e:	88          	im 8
 92f:	08          	load
 930:	88          	im 8
 931:	08          	load
 932:	87          	im 7
 933:	2a          	lshiftright
 934:	81          	im 1
 935:	32          	xor
 936:	70          	loadsp 0
 937:	81          	im 1
 938:	06          	and
 939:	51          	storesp 4
 93a:	53          	storesp 12
 93b:	53          	storesp 12
 93c:	71          	loadsp 4
 93d:	ed          	im -19
 93e:	38          	neqbranch
 93f:	8f          	im 15
 940:	39          	poppcrel

00000941 <.L205>:
 941:	8e          	im 14
 942:	a1          	im 33
 943:	2d          	call
 944:	88          	im 8
 945:	08          	load
 946:	88          	im 8
 947:	08          	load
 948:	81          	im 1
 949:	06          	and
 94a:	53          	storesp 12
 94b:	53          	storesp 12
 94c:	71          	loadsp 4
 94d:	f3          	im -13
 94e:	38          	neqbranch

0000094f <.L204>:
 94f:	8a          	im 10
 950:	ee          	im -18
 951:	2d          	call
 952:	81          	im 1
 953:	83          	im 3
 954:	51          	storesp 4
 955:	8a          	im 10
 956:	a1          	im 33
 957:	2d          	call
 958:	72          	loadsp 8
 959:	51          	storesp 4
 95a:	8a          	im 10
 95b:	a1          	im 33
 95c:	2d          	call
 95d:	8b          	im 11
 95e:	83          	im 3
 95f:	2d          	call
 960:	84          	im 4
 961:	3d          	pushspadd
 962:	0d          	popsp
 963:	04          	poppc

00000964 <_Z11cmd_versionv>:
 964:	ff          	im -1
 965:	3d          	pushspadd
 966:	0d          	popsp
 967:	80          	im 0
 968:	0b          	nop
 969:	a2          	im 34
 96a:	c8          	im -56
 96b:	0c          	store
 96c:	8a          	im 10
 96d:	ee          	im -18
 96e:	2d          	call
 96f:	81          	im 1
 970:	81          	im 1
 971:	51          	storesp 4
 972:	8a          	im 10
 973:	a1          	im 33
 974:	2d          	call
 975:	8c          	im 12
 976:	52          	storesp 8
 977:	9d          	im 29
 978:	80          	im 0
 979:	51          	storesp 4
 97a:	8a          	im 10
 97b:	ce          	im -50
 97c:	2d          	call
 97d:	8b          	im 11
 97e:	83          	im 3
 97f:	2d          	call
 980:	83          	im 3
 981:	3d          	pushspadd
 982:	0d          	popsp
 983:	04          	poppc

00000984 <_Z12cmd_identifyv>:
 984:	fe          	im -2
 985:	3d          	pushspadd
 986:	0d          	popsp
 987:	80          	im 0
 988:	0b          	nop
 989:	a2          	im 34
 98a:	c8          	im -56
 98b:	0c          	store
 98c:	8a          	im 10
 98d:	ee          	im -18
 98e:	2d          	call
 98f:	81          	im 1
 990:	82          	im 2
 991:	51          	storesp 4
 992:	8a          	im 10
 993:	a1          	im 33
 994:	2d          	call
 995:	8c          	im 12
 996:	8e          	im 14
 997:	2d          	call
 998:	82          	im 2
 999:	80          	im 0
 99a:	84          	im 4
 99b:	52          	storesp 8
 99c:	81          	im 1
 99d:	9f          	im 31
 99e:	72          	loadsp 8
 99f:	0c          	store
 9a0:	80          	im 0
 9a1:	70          	loadsp 0
 9a2:	73          	loadsp 12
 9a3:	0c          	store
 9a4:	70          	loadsp 0
 9a5:	73          	loadsp 12
 9a6:	0c          	store
 9a7:	72          	loadsp 8
 9a8:	0c          	store
 9a9:	71          	loadsp 4
 9aa:	08          	load
 9ab:	52          	storesp 8
 9ac:	8b          	im 11
 9ad:	f9          	im -7
 9ae:	2d          	call
 9af:	71          	loadsp 4
 9b0:	a2          	im 34
 9b1:	d0          	im -48
 9b2:	0c          	store
 9b3:	71          	loadsp 4
 9b4:	90          	im 16
 9b5:	2a          	lshiftright
 9b6:	51          	storesp 4
 9b7:	8a          	im 10
 9b8:	a1          	im 33
 9b9:	2d          	call
 9ba:	a2          	im 34
 9bb:	d0          	im -48
 9bc:	08          	load
 9bd:	88          	im 8
 9be:	2a          	lshiftright
 9bf:	51          	storesp 4
 9c0:	8a          	im 10
 9c1:	a1          	im 33
 9c2:	2d          	call
 9c3:	a2          	im 34
 9c4:	d0          	im -48
 9c5:	08          	load
 9c6:	51          	storesp 4
 9c7:	8a          	im 10
 9c8:	a1          	im 33
 9c9:	2d          	call
 9ca:	8e          	im 14
 9cb:	a1          	im 33
 9cc:	2d          	call
 9cd:	88          	im 8
 9ce:	08          	load
 9cf:	51          	storesp 4
 9d0:	8a          	im 10
 9d1:	a1          	im 33
 9d2:	2d          	call
 9d3:	8b          	im 11
 9d4:	83          	im 3
 9d5:	2d          	call
 9d6:	84          	im 4
 9d7:	3d          	pushspadd
 9d8:	0d          	popsp
 9d9:	04          	poppc

000009da <_Z12cmd_enterpgmv>:
 9da:	80          	im 0
 9db:	3d          	pushspadd
 9dc:	0d          	popsp
 9dd:	81          	im 1
 9de:	0b          	nop
 9df:	a2          	im 34
 9e0:	cc          	im -52
 9e1:	0c          	store
 9e2:	80          	im 0
 9e3:	0b          	nop
 9e4:	82          	im 2
 9e5:	b0          	im 48
 9e6:	80          	im 0
 9e7:	0c          	store
 9e8:	85          	im 5
 9e9:	51          	storesp 4
 9ea:	91          	im 17
 9eb:	bf          	im 63
 9ec:	2d          	call
 9ed:	82          	im 2
 9ee:	3d          	pushspadd
 9ef:	0d          	popsp
 9f0:	04          	poppc

000009f1 <_Z12cmd_leavepgmv>:
 9f1:	80          	im 0
 9f2:	3d          	pushspadd
 9f3:	0d          	popsp
 9f4:	80          	im 0
 9f5:	0b          	nop
 9f6:	a2          	im 34
 9f7:	cc          	im -52
 9f8:	0c          	store
 9f9:	8b          	im 11
 9fa:	e4          	im -28
 9fb:	2d          	call
 9fc:	86          	im 6
 9fd:	51          	storesp 4
 9fe:	91          	im 17
 9ff:	bf          	im 63
 a00:	2d          	call
 a01:	82          	im 2
 a02:	3d          	pushspadd
 a03:	0d          	popsp
 a04:	04          	poppc

00000a05 <_Z9cmd_startv>:
 a05:	80          	im 0
 a06:	3d          	pushspadd
 a07:	0d          	popsp
 a08:	8a          	im 10
 a09:	51          	storesp 4
 a0a:	91          	im 17
 a0b:	bf          	im 63
 a0c:	2d          	call
 a0d:	8c          	im 12
 a0e:	a3          	im 35
 a0f:	2d          	call

00000a10 <_Z14processCommandv>:
 a10:	fe          	im -2
 a11:	3d          	pushspadd
 a12:	0d          	popsp
 a13:	80          	im 0
 a14:	0b          	nop
 a15:	a2          	im 34
 a16:	c4          	im -60
 a17:	08          	load
 a18:	52          	storesp 8
 a19:	52          	storesp 8
 a1a:	82          	im 2
 a1b:	71          	loadsp 4
 a1c:	27          	ulessthanorequal
 a1d:	80          	im 0
 a1e:	e5          	im -27
 a1f:	38          	neqbranch
 a20:	83          	im 3
 a21:	ff          	im -1
 a22:	ff          	im -1
 a23:	0b          	nop
 a24:	82          	im 2
 a25:	f0          	im -16
 a26:	80          	im 0
 a27:	0c          	store
 a28:	fe          	im -2
 a29:	11          	addsp 4
 a2a:	53          	storesp 12

00000a2b <.L234>:
 a2b:	71          	loadsp 4
 a2c:	73          	loadsp 12
 a2d:	27          	ulessthanorequal
 a2e:	8e          	im 14
 a2f:	38          	neqbranch
 a30:	a0          	im 32
 a31:	9c          	im 28
 a32:	12          	addsp 8
 a33:	33          	loadb
 a34:	82          	im 2
 a35:	f0          	im -16
 a36:	88          	im 8
 a37:	0c          	store
 a38:	81          	im 1
 a39:	12          	addsp 8
 a3a:	52          	storesp 8
 a3b:	ef          	im -17
 a3c:	39          	poppcrel

00000a3d <.L233>:
 a3d:	a2          	im 34
 a3e:	c4          	im -60
 a3f:	08          	load
 a40:	ff          	im -1
 a41:	05          	add
 a42:	a2          	im 34
 a43:	c4          	im -60
 a44:	0c          	store
 a45:	a2          	im 34
 a46:	c4          	im -60
 a47:	08          	load
 a48:	a0          	im 32
 a49:	9c          	im 28
 a4a:	11          	addsp 4
 a4b:	33          	loadb
 a4c:	53          	storesp 12
 a4d:	ff          	im -1
 a4e:	05          	add
 a4f:	a2          	im 34
 a50:	c4          	im -60
 a51:	0c          	store
 a52:	a2          	im 34
 a53:	c4          	im -60
 a54:	08          	load
 a55:	a0          	im 32
 a56:	9c          	im 28
 a57:	05          	add
 a58:	70          	loadsp 0
 a59:	33          	loadb
 a5a:	70          	loadsp 0
 a5b:	88          	im 8
 a5c:	2b          	ashiftleft
 a5d:	74          	loadsp 16
 a5e:	07          	or
 a5f:	82          	im 2
 a60:	f0          	im -16
 a61:	80          	im 0
 a62:	08          	load
 a63:	52          	storesp 8
 a64:	54          	storesp 16
 a65:	51          	storesp 4
 a66:	51          	storesp 4
 a67:	70          	loadsp 0
 a68:	72          	loadsp 8
 a69:	2e          	eq
 a6a:	09          	not
 a6b:	81          	im 1
 a6c:	06          	and
 a6d:	96          	im 22
 a6e:	38          	neqbranch
 a6f:	a0          	im 32
 a70:	9c          	im 28
 a71:	33          	loadb
 a72:	52          	storesp 8
 a73:	71          	loadsp 4
 a74:	8a          	im 10
 a75:	26          	ulessthan
 a76:	8d          	im 13
 a77:	38          	neqbranch
 a78:	71          	loadsp 4
 a79:	84          	im 4
 a7a:	29          	mult
 a7b:	9c          	im 28
 a7c:	d4          	im -44
 a7d:	05          	add
 a7e:	70          	loadsp 0
 a7f:	08          	load
 a80:	51          	storesp 4
 a81:	51          	storesp 4
 a82:	70          	loadsp 0
 a83:	2d          	call

00000a84 <.L224>:
 a84:	84          	im 4
 a85:	3d          	pushspadd
 a86:	0d          	popsp
 a87:	04          	poppc

00000a88 <_Z14configure_pinsv>:
 a88:	fc          	im -4
 a89:	3d          	pushspadd
 a8a:	0d          	popsp
 a8b:	81          	im 1
 a8c:	70          	loadsp 0
 a8d:	82          	im 2
 a8e:	a5          	im 37
 a8f:	d4          	im -44
 a90:	0c          	store
 a91:	55          	storesp 20
 a92:	82          	im 2
 a93:	0b          	nop
 a94:	82          	im 2
 a95:	a5          	im 37
 a96:	cc          	im -52
 a97:	0c          	store
 a98:	b1          	im 49
 a99:	0b          	nop
 a9a:	82          	im 2
 a9b:	a8          	im 40
 a9c:	80          	im 0
 a9d:	0c          	store
 a9e:	82          	im 2
 a9f:	a0          	im 32
 aa0:	a4          	im 36
 aa1:	70          	loadsp 0
 aa2:	08          	load
 aa3:	70          	loadsp 0
 aa4:	88          	im 8
 aa5:	80          	im 0
 aa6:	0a          	flip
 aa7:	07          	or
 aa8:	72          	loadsp 8
 aa9:	0c          	store
 aaa:	52          	storesp 8
 aab:	70          	loadsp 0
 aac:	08          	load
 aad:	70          	loadsp 0
 aae:	a0          	im 32
 aaf:	80          	im 0
 ab0:	80          	im 0
 ab1:	07          	or
 ab2:	72          	loadsp 8
 ab3:	0c          	store
 ab4:	52          	storesp 8
 ab5:	52          	storesp 8
 ab6:	ef          	im -17
 ab7:	ff          	im -1
 ab8:	0a          	flip
 ab9:	72          	loadsp 8
 aba:	08          	load
 abb:	70          	loadsp 0
 abc:	72          	loadsp 8
 abd:	06          	and
 abe:	74          	loadsp 16
 abf:	0c          	store
 ac0:	52          	storesp 8
 ac1:	54          	storesp 16
 ac2:	fe          	im -2
 ac3:	72          	loadsp 8
 ac4:	08          	load
 ac5:	70          	loadsp 0
 ac6:	72          	loadsp 8
 ac7:	06          	and
 ac8:	74          	loadsp 16
 ac9:	0c          	store
 aca:	52          	storesp 8
 acb:	53          	storesp 12
 acc:	82          	im 2
 acd:	a0          	im 32
 ace:	94          	im 20
 acf:	70          	loadsp 0
 ad0:	08          	load
 ad1:	70          	loadsp 0
 ad2:	f7          	im -9
 ad3:	ff          	im -1
 ad4:	0a          	flip
 ad5:	06          	and
 ad6:	72          	loadsp 8
 ad7:	0c          	store
 ad8:	52          	storesp 8
 ad9:	70          	loadsp 0
 ada:	08          	load
 adb:	70          	loadsp 0
 adc:	df          	im -33
 add:	ff          	im -1
 ade:	ff          	im -1
 adf:	06          	and
 ae0:	72          	loadsp 8
 ae1:	0c          	store
 ae2:	52          	storesp 8
 ae3:	70          	loadsp 0
 ae4:	08          	load
 ae5:	70          	loadsp 0
 ae6:	76          	loadsp 24
 ae7:	06          	and
 ae8:	72          	loadsp 8
 ae9:	0c          	store
 aea:	52          	storesp 8
 aeb:	70          	loadsp 0
 aec:	08          	load
 aed:	70          	loadsp 0
 aee:	75          	loadsp 20
 aef:	06          	and
 af0:	72          	loadsp 8
 af1:	0c          	store
 af2:	52          	storesp 8
 af3:	52          	storesp 8
 af4:	82          	im 2
 af5:	a0          	im 32
 af6:	84          	im 4
 af7:	70          	loadsp 0
 af8:	08          	load
 af9:	70          	loadsp 0
 afa:	77          	loadsp 28
 afb:	07          	or
 afc:	72          	loadsp 8
 afd:	0c          	store
 afe:	52          	storesp 8
 aff:	52          	storesp 8
 b00:	86          	im 6
 b01:	3d          	pushspadd
 b02:	0d          	popsp
 b03:	04          	poppc

00000b04 <main>:
 b04:	ff          	im -1
 b05:	3d          	pushspadd
 b06:	0d          	popsp
 b07:	80          	im 0
 b08:	0b          	nop
 b09:	a2          	im 34
 b0a:	cc          	im -52
 b0b:	0c          	store
 b0c:	80          	im 0
 b0d:	0b          	nop
 b0e:	a2          	im 34
 b0f:	c8          	im -56
 b10:	0c          	store
 b11:	80          	im 0
 b12:	0b          	nop
 b13:	a2          	im 34
 b14:	c4          	im -60
 b15:	0c          	store
 b16:	8d          	im 13
 b17:	e1          	im -31
 b18:	0b          	nop
 b19:	a0          	im 32
 b1a:	80          	im 0
 b1b:	0c          	store
 b1c:	95          	im 21
 b1d:	88          	im 8
 b1e:	2d          	call
 b1f:	84          	im 4
 b20:	80          	im 0
 b21:	b3          	im 51
 b22:	0b          	nop
 b23:	82          	im 2
 b24:	90          	im 16
 b25:	84          	im 4
 b26:	0c          	store
 b27:	88          	im 8
 b28:	0b          	nop
 b29:	82          	im 2
 b2a:	c0          	im -64
 b2b:	84          	im 4
 b2c:	0c          	store
 b2d:	81          	im 1
 b2e:	0b          	nop
 b2f:	82          	im 2
 b30:	c0          	im -64
 b31:	80          	im 0
 b32:	0c          	store
 b33:	8b          	im 11
 b34:	e4          	im -28
 b35:	2d          	call
 b36:	82          	im 2
 b37:	88          	im 8
 b38:	88          	im 8
 b39:	0b          	nop
 b3a:	82          	im 2
 b3b:	f0          	im -16
 b3c:	84          	im 4
 b3d:	0c          	store
 b3e:	81          	im 1
 b3f:	f2          	im -14
 b40:	0b          	nop
 b41:	82          	im 2
 b42:	80          	im 0
 b43:	80          	im 0
 b44:	0c          	store
 b45:	8b          	im 11
 b46:	f9          	im -7
 b47:	2d          	call
 b48:	8c          	im 12
 b49:	8e          	im 14
 b4a:	2d          	call
 b4b:	8c          	im 12
 b4c:	8e          	im 14
 b4d:	2d          	call
 b4e:	84          	im 4
 b4f:	0b          	nop
 b50:	82          	im 2
 b51:	80          	im 0
 b52:	84          	im 4
 b53:	0c          	store
 b54:	8b          	im 11
 b55:	f9          	im -7
 b56:	2d          	call
 b57:	80          	im 0
 b58:	0b          	nop
 b59:	a2          	im 34
 b5a:	c0          	im -64
 b5b:	0c          	store
 b5c:	80          	im 0
 b5d:	0b          	nop
 b5e:	a2          	im 34
 b5f:	bc          	im 60
 b60:	0c          	store

00000b61 <.L323>:
 b61:	8b          	im 11
 b62:	ad          	im 45
 b63:	2d          	call
 b64:	88          	im 8
 b65:	08          	load
 b66:	a2          	im 34
 b67:	c0          	im -64
 b68:	08          	load
 b69:	52          	storesp 8
 b6a:	52          	storesp 8
 b6b:	70          	loadsp 0
 b6c:	80          	im 0
 b6d:	2e          	eq
 b6e:	80          	im 0
 b6f:	e0          	im -32
 b70:	38          	neqbranch
 b71:	88          	im 8
 b72:	08          	load
 b73:	80          	im 0
 b74:	fe          	im -2
 b75:	2e          	eq
 b76:	09          	not
 b77:	81          	im 1
 b78:	06          	and
 b79:	92          	im 18
 b7a:	38          	neqbranch
 b7b:	a2          	im 34
 b7c:	c4          	im -60
 b7d:	08          	load
 b7e:	80          	im 0
 b7f:	2e          	eq
 b80:	e0          	im -32
 b81:	38          	neqbranch
 b82:	80          	im 0
 b83:	0b          	nop
 b84:	a2          	im 34
 b85:	c0          	im -64
 b86:	0c          	store
 b87:	94          	im 20
 b88:	90          	im 16
 b89:	2d          	call
 b8a:	d6          	im -42
 b8b:	39          	poppcrel

00000b8c <.L309>:
 b8c:	88          	im 8
 b8d:	08          	load
 b8e:	80          	im 0
 b8f:	fd          	im -3
 b90:	2e          	eq
 b91:	09          	not
 b92:	81          	im 1
 b93:	06          	and
 b94:	88          	im 8
 b95:	38          	neqbranch
 b96:	81          	im 1
 b97:	0b          	nop
 b98:	a2          	im 34
 b99:	bc          	im 60
 b9a:	0c          	store
 b9b:	c5          	im -59
 b9c:	39          	poppcrel

00000b9d <.L312>:
 b9d:	a2          	im 34
 b9e:	c4          	im -60
 b9f:	08          	load
 ba0:	51          	storesp 4
 ba1:	70          	loadsp 0
 ba2:	82          	im 2
 ba3:	9f          	im 31
 ba4:	26          	ulessthan
 ba5:	a2          	im 34
 ba6:	38          	neqbranch
 ba7:	a2          	im 34
 ba8:	bc          	im 60
 ba9:	08          	load
 baa:	80          	im 0
 bab:	2e          	eq
 bac:	8b          	im 11
 bad:	38          	neqbranch
 bae:	80          	im 0
 baf:	0b          	nop
 bb0:	a2          	im 34
 bb1:	bc          	im 60
 bb2:	0c          	store
 bb3:	88          	im 8
 bb4:	08          	load
 bb5:	a0          	im 32
 bb6:	32          	xor
 bb7:	52          	storesp 8

00000bb8 <.L315>:
 bb8:	71          	loadsp 4
 bb9:	a0          	im 32
 bba:	9c          	im 28
 bbb:	12          	addsp 8
 bbc:	34          	storeb
 bbd:	a2          	im 34
 bbe:	c4          	im -60
 bbf:	08          	load
 bc0:	81          	im 1
 bc1:	05          	add
 bc2:	a2          	im 34
 bc3:	c4          	im -60
 bc4:	0c          	store
 bc5:	ff          	im -1
 bc6:	9a          	im 26
 bc7:	39          	poppcrel

00000bc8 <.L314>:
 bc8:	80          	im 0
 bc9:	0b          	nop
 bca:	a2          	im 34
 bcb:	c0          	im -64
 bcc:	0c          	store
 bcd:	ff          	im -1
 bce:	92          	im 18
 bcf:	39          	poppcrel

00000bd0 <.L308>:
 bd0:	88          	im 8
 bd1:	08          	load
 bd2:	80          	im 0
 bd3:	fe          	im -2
 bd4:	2e          	eq
 bd5:	09          	not
 bd6:	81          	im 1
 bd7:	06          	and
 bd8:	ff          	im -1
 bd9:	87          	im 7
 bda:	38          	neqbranch
 bdb:	70          	loadsp 0
 bdc:	a2          	im 34
 bdd:	c4          	im -60
 bde:	0c          	store
 bdf:	83          	im 3
 be0:	ff          	im -1
 be1:	ff          	im -1
 be2:	0b          	nop
 be3:	82          	im 2
 be4:	f0          	im -16
 be5:	80          	im 0
 be6:	0c          	store
 be7:	81          	im 1
 be8:	0b          	nop
 be9:	a2          	im 34
 bea:	c0          	im -64
 beb:	0c          	store
 bec:	70          	loadsp 0
 bed:	a2          	im 34
 bee:	bc          	im 60
 bef:	0c          	store
 bf0:	fe          	im -2
 bf1:	ef          	im -17
 bf2:	39          	poppcrel

00000bf3 <___zpu_interrupt_vector>:
 bf3:	80          	im 0
 bf4:	3d          	pushspadd
 bf5:	0d          	popsp
 bf6:	88          	im 8
 bf7:	08          	load
 bf8:	8c          	im 12
 bf9:	08          	load
 bfa:	90          	im 16
 bfb:	08          	load
 bfc:	a0          	im 32
 bfd:	80          	im 0
 bfe:	08          	load
 bff:	51          	storesp 4
 c00:	70          	loadsp 0
 c01:	2d          	call
 c02:	90          	im 16
 c03:	0c          	store
 c04:	8c          	im 12
 c05:	0c          	store
 c06:	8a          	im 10
 c07:	0c          	store
 c08:	81          	im 1
 c09:	0b          	nop
 c0a:	82          	im 2
 c0b:	c0          	im -64
 c0c:	80          	im 0
 c0d:	0c          	store
 c0e:	82          	im 2
 c0f:	3d          	pushspadd
 c10:	0d          	popsp
 c11:	04          	poppc

00000c12 <_premain>:
 c12:	ff          	im -1
 c13:	3d          	pushspadd
 c14:	0d          	popsp
 c15:	80          	im 0
 c16:	52          	storesp 8
 c17:	80          	im 0
 c18:	51          	storesp 4
 c19:	96          	im 22
 c1a:	84          	im 4
 c1b:	2d          	call
 c1c:	83          	im 3
 c1d:	3d          	pushspadd
 c1e:	0d          	popsp
 c1f:	04          	poppc

00000c20 <__divsi3>:
 c20:	94          	im 20
 c21:	08          	load
 c22:	02          	pushsp
 c23:	94          	im 20
 c24:	0c          	store
 c25:	f9          	im -7
 c26:	3d          	pushspadd
 c27:	0d          	popsp
 c28:	80          	im 0
 c29:	0b          	nop
 c2a:	94          	im 20
 c2b:	08          	load
 c2c:	fc          	im -4
 c2d:	05          	add
 c2e:	0c          	store
 c2f:	94          	im 20
 c30:	08          	load
 c31:	88          	im 8
 c32:	05          	add
 c33:	08          	load
 c34:	80          	im 0
 c35:	25          	lessthanorequal
 c36:	ab          	im 43
 c37:	38          	neqbranch
 c38:	94          	im 20
 c39:	08          	load
 c3a:	88          	im 8
 c3b:	05          	add
 c3c:	08          	load
 c3d:	30          	neg
 c3e:	94          	im 20
 c3f:	08          	load
 c40:	88          	im 8
 c41:	05          	add
 c42:	0c          	store
 c43:	80          	im 0
 c44:	0b          	nop
 c45:	94          	im 20
 c46:	08          	load
 c47:	f4          	im -12
 c48:	05          	add
 c49:	0c          	store
 c4a:	94          	im 20
 c4b:	08          	load
 c4c:	fc          	im -4
 c4d:	05          	add
 c4e:	08          	load
 c4f:	88          	im 8
 c50:	38          	neqbranch
 c51:	81          	im 1
 c52:	0b          	nop
 c53:	94          	im 20
 c54:	08          	load
 c55:	f4          	im -12
 c56:	05          	add
 c57:	0c          	store

00000c58 <.L3>:
 c58:	94          	im 20
 c59:	08          	load
 c5a:	f4          	im -12
 c5b:	05          	add
 c5c:	08          	load
 c5d:	94          	im 20
 c5e:	08          	load
 c5f:	fc          	im -4
 c60:	05          	add
 c61:	0c          	store

00000c62 <.L2>:
 c62:	94          	im 20
 c63:	08          	load
 c64:	8c          	im 12
 c65:	05          	add
 c66:	08          	load
 c67:	80          	im 0
 c68:	25          	lessthanorequal
 c69:	ab          	im 43
 c6a:	38          	neqbranch
 c6b:	94          	im 20
 c6c:	08          	load
 c6d:	8c          	im 12
 c6e:	05          	add
 c6f:	08          	load
 c70:	30          	neg
 c71:	94          	im 20
 c72:	08          	load
 c73:	8c          	im 12
 c74:	05          	add
 c75:	0c          	store
 c76:	80          	im 0
 c77:	0b          	nop
 c78:	94          	im 20
 c79:	08          	load
 c7a:	f0          	im -16
 c7b:	05          	add
 c7c:	0c          	store
 c7d:	94          	im 20
 c7e:	08          	load
 c7f:	fc          	im -4
 c80:	05          	add
 c81:	08          	load
 c82:	88          	im 8
 c83:	38          	neqbranch
 c84:	81          	im 1
 c85:	0b          	nop
 c86:	94          	im 20
 c87:	08          	load
 c88:	f0          	im -16
 c89:	05          	add
 c8a:	0c          	store

00000c8b <.L5>:
 c8b:	94          	im 20
 c8c:	08          	load
 c8d:	f0          	im -16
 c8e:	05          	add
 c8f:	08          	load
 c90:	94          	im 20
 c91:	08          	load
 c92:	fc          	im -4
 c93:	05          	add
 c94:	0c          	store

00000c95 <.L4>:
 c95:	80          	im 0
 c96:	53          	storesp 12
 c97:	94          	im 20
 c98:	08          	load
 c99:	8c          	im 12
 c9a:	05          	add
 c9b:	08          	load
 c9c:	52          	storesp 8
 c9d:	94          	im 20
 c9e:	08          	load
 c9f:	88          	im 8
 ca0:	05          	add
 ca1:	08          	load
 ca2:	51          	storesp 4
 ca3:	81          	im 1
 ca4:	a7          	im 39
 ca5:	3f          	callpcrel
 ca6:	88          	im 8
 ca7:	08          	load
 ca8:	70          	loadsp 0
 ca9:	94          	im 20
 caa:	08          	load
 cab:	f8          	im -8
 cac:	05          	add
 cad:	0c          	store
 cae:	54          	storesp 16
 caf:	94          	im 20
 cb0:	08          	load
 cb1:	fc          	im -4
 cb2:	05          	add
 cb3:	08          	load
 cb4:	80          	im 0
 cb5:	2e          	eq
 cb6:	8c          	im 12
 cb7:	38          	neqbranch
 cb8:	94          	im 20
 cb9:	08          	load
 cba:	f8          	im -8
 cbb:	05          	add
 cbc:	08          	load
 cbd:	30          	neg
 cbe:	94          	im 20
 cbf:	08          	load
 cc0:	f8          	im -8
 cc1:	05          	add
 cc2:	0c          	store

00000cc3 <.L6>:
 cc3:	94          	im 20
 cc4:	08          	load
 cc5:	f8          	im -8
 cc6:	05          	add
 cc7:	08          	load
 cc8:	70          	loadsp 0
 cc9:	88          	im 8
 cca:	0c          	store
 ccb:	54          	storesp 16
 ccc:	89          	im 9
 ccd:	3d          	pushspadd
 cce:	0d          	popsp
 ccf:	94          	im 20
 cd0:	0c          	store
 cd1:	04          	poppc

00000cd2 <__modsi3>:
 cd2:	94          	im 20
 cd3:	08          	load
 cd4:	02          	pushsp
 cd5:	94          	im 20
 cd6:	0c          	store
 cd7:	fb          	im -5
 cd8:	3d          	pushspadd
 cd9:	0d          	popsp
 cda:	80          	im 0
 cdb:	0b          	nop
 cdc:	94          	im 20
 cdd:	08          	load
 cde:	fc          	im -4
 cdf:	05          	add
 ce0:	0c          	store
 ce1:	94          	im 20
 ce2:	08          	load
 ce3:	88          	im 8
 ce4:	05          	add
 ce5:	08          	load
 ce6:	80          	im 0
 ce7:	25          	lessthanorequal
 ce8:	93          	im 19
 ce9:	38          	neqbranch
 cea:	94          	im 20
 ceb:	08          	load
 cec:	88          	im 8
 ced:	05          	add
 cee:	08          	load
 cef:	30          	neg
 cf0:	94          	im 20
 cf1:	08          	load
 cf2:	88          	im 8
 cf3:	05          	add
 cf4:	0c          	store
 cf5:	81          	im 1
 cf6:	0b          	nop
 cf7:	94          	im 20
 cf8:	08          	load
 cf9:	fc          	im -4
 cfa:	05          	add
 cfb:	0c          	store

00000cfc <.L8>:
 cfc:	94          	im 20
 cfd:	08          	load
 cfe:	8c          	im 12
 cff:	05          	add
 d00:	08          	load
 d01:	80          	im 0
 d02:	25          	lessthanorequal
 d03:	8c          	im 12
 d04:	38          	neqbranch
 d05:	94          	im 20
 d06:	08          	load
 d07:	8c          	im 12
 d08:	05          	add
 d09:	08          	load
 d0a:	30          	neg
 d0b:	94          	im 20
 d0c:	08          	load
 d0d:	8c          	im 12
 d0e:	05          	add
 d0f:	0c          	store

00000d10 <.L9>:
 d10:	81          	im 1
 d11:	53          	storesp 12
 d12:	94          	im 20
 d13:	08          	load
 d14:	8c          	im 12
 d15:	05          	add
 d16:	08          	load
 d17:	52          	storesp 8
 d18:	94          	im 20
 d19:	08          	load
 d1a:	88          	im 8
 d1b:	05          	add
 d1c:	08          	load
 d1d:	51          	storesp 4
 d1e:	ad          	im 45
 d1f:	3f          	callpcrel
 d20:	88          	im 8
 d21:	08          	load
 d22:	70          	loadsp 0
 d23:	94          	im 20
 d24:	08          	load
 d25:	f8          	im -8
 d26:	05          	add
 d27:	0c          	store
 d28:	54          	storesp 16
 d29:	94          	im 20
 d2a:	08          	load
 d2b:	fc          	im -4
 d2c:	05          	add
 d2d:	08          	load
 d2e:	80          	im 0
 d2f:	2e          	eq
 d30:	8c          	im 12
 d31:	38          	neqbranch
 d32:	94          	im 20
 d33:	08          	load
 d34:	f8          	im -8
 d35:	05          	add
 d36:	08          	load
 d37:	30          	neg
 d38:	94          	im 20
 d39:	08          	load
 d3a:	f8          	im -8
 d3b:	05          	add
 d3c:	0c          	store

00000d3d <.L10>:
 d3d:	94          	im 20
 d3e:	08          	load
 d3f:	f8          	im -8
 d40:	05          	add
 d41:	08          	load
 d42:	70          	loadsp 0
 d43:	88          	im 8
 d44:	0c          	store
 d45:	54          	storesp 16
 d46:	87          	im 7
 d47:	3d          	pushspadd
 d48:	0d          	popsp
 d49:	94          	im 20
 d4a:	0c          	store
 d4b:	04          	poppc

00000d4c <udivmodsi4>:
 d4c:	94          	im 20
 d4d:	08          	load
 d4e:	02          	pushsp
 d4f:	94          	im 20
 d50:	0c          	store
 d51:	fd          	im -3
 d52:	3d          	pushspadd
 d53:	0d          	popsp
 d54:	81          	im 1
 d55:	0b          	nop
 d56:	94          	im 20
 d57:	08          	load
 d58:	fc          	im -4
 d59:	05          	add
 d5a:	0c          	store
 d5b:	80          	im 0
 d5c:	0b          	nop
 d5d:	94          	im 20
 d5e:	08          	load
 d5f:	f8          	im -8
 d60:	05          	add
 d61:	0c          	store

00000d62 <.L2>:
 d62:	94          	im 20
 d63:	08          	load
 d64:	8c          	im 12
 d65:	05          	add
 d66:	08          	load
 d67:	94          	im 20
 d68:	08          	load
 d69:	88          	im 8
 d6a:	05          	add
 d6b:	08          	load
 d6c:	27          	ulessthanorequal
 d6d:	ac          	im 44
 d6e:	38          	neqbranch
 d6f:	94          	im 20
 d70:	08          	load
 d71:	fc          	im -4
 d72:	05          	add
 d73:	08          	load
 d74:	80          	im 0
 d75:	2e          	eq
 d76:	a3          	im 35
 d77:	38          	neqbranch
 d78:	80          	im 0
 d79:	0b          	nop
 d7a:	94          	im 20
 d7b:	08          	load
 d7c:	8c          	im 12
 d7d:	05          	add
 d7e:	08          	load
 d7f:	24          	lessthan
 d80:	99          	im 25
 d81:	38          	neqbranch
 d82:	94          	im 20
 d83:	08          	load
 d84:	8c          	im 12
 d85:	05          	add
 d86:	08          	load
 d87:	10          	addsp 0
 d88:	94          	im 20
 d89:	08          	load
 d8a:	8c          	im 12
 d8b:	05          	add
 d8c:	0c          	store
 d8d:	94          	im 20
 d8e:	08          	load
 d8f:	fc          	im -4
 d90:	05          	add
 d91:	08          	load
 d92:	10          	addsp 0
 d93:	94          	im 20
 d94:	08          	load
 d95:	fc          	im -4
 d96:	05          	add
 d97:	0c          	store
 d98:	c9          	im -55
 d99:	39          	poppcrel

00000d9a <.L4>:
 d9a:	94          	im 20
 d9b:	08          	load
 d9c:	fc          	im -4
 d9d:	05          	add
 d9e:	08          	load
 d9f:	80          	im 0
 da0:	2e          	eq
 da1:	80          	im 0
 da2:	c9          	im -55
 da3:	38          	neqbranch
 da4:	94          	im 20
 da5:	08          	load
 da6:	8c          	im 12
 da7:	05          	add
 da8:	08          	load
 da9:	94          	im 20
 daa:	08          	load
 dab:	88          	im 8
 dac:	05          	add
 dad:	08          	load
 dae:	26          	ulessthan
 daf:	a1          	im 33
 db0:	38          	neqbranch
 db1:	94          	im 20
 db2:	08          	load
 db3:	88          	im 8
 db4:	05          	add
 db5:	08          	load
 db6:	94          	im 20
 db7:	08          	load
 db8:	8c          	im 12
 db9:	05          	add
 dba:	08          	load
 dbb:	31          	sub
 dbc:	94          	im 20
 dbd:	08          	load
 dbe:	88          	im 8
 dbf:	05          	add
 dc0:	0c          	store
 dc1:	94          	im 20
 dc2:	08          	load
 dc3:	f8          	im -8
 dc4:	05          	add
 dc5:	08          	load
 dc6:	94          	im 20
 dc7:	08          	load
 dc8:	fc          	im -4
 dc9:	05          	add
 dca:	08          	load
 dcb:	07          	or
 dcc:	94          	im 20
 dcd:	08          	load
 dce:	f8          	im -8
 dcf:	05          	add
 dd0:	0c          	store

00000dd1 <.L6>:
 dd1:	94          	im 20
 dd2:	08          	load
 dd3:	fc          	im -4
 dd4:	05          	add
 dd5:	08          	load
 dd6:	81          	im 1
 dd7:	2a          	lshiftright
 dd8:	94          	im 20
 dd9:	08          	load
 dda:	fc          	im -4
 ddb:	05          	add
 ddc:	0c          	store
 ddd:	94          	im 20
 dde:	08          	load
 ddf:	8c          	im 12
 de0:	05          	add
 de1:	08          	load
 de2:	81          	im 1
 de3:	2a          	lshiftright
 de4:	94          	im 20
 de5:	08          	load
 de6:	8c          	im 12
 de7:	05          	add
 de8:	0c          	store
 de9:	ff          	im -1
 dea:	af          	im 47
 deb:	39          	poppcrel

00000dec <.L5>:
 dec:	94          	im 20
 ded:	08          	load
 dee:	90          	im 16
 def:	05          	add
 df0:	08          	load
 df1:	80          	im 0
 df2:	2e          	eq
 df3:	8f          	im 15
 df4:	38          	neqbranch
 df5:	94          	im 20
 df6:	08          	load
 df7:	88          	im 8
 df8:	05          	add
 df9:	08          	load
 dfa:	70          	loadsp 0
 dfb:	94          	im 20
 dfc:	08          	load
 dfd:	f4          	im -12
 dfe:	05          	add
 dff:	0c          	store
 e00:	51          	storesp 4
 e01:	8d          	im 13
 e02:	39          	poppcrel

00000e03 <.L7>:
 e03:	94          	im 20
 e04:	08          	load
 e05:	f8          	im -8
 e06:	05          	add
 e07:	08          	load
 e08:	70          	loadsp 0
 e09:	94          	im 20
 e0a:	08          	load
 e0b:	f4          	im -12
 e0c:	05          	add
 e0d:	0c          	store
 e0e:	51          	storesp 4

00000e0f <.L1>:
 e0f:	94          	im 20
 e10:	08          	load
 e11:	f4          	im -12
 e12:	05          	add
 e13:	08          	load
 e14:	88          	im 8
 e15:	0c          	store
 e16:	85          	im 5
 e17:	3d          	pushspadd
 e18:	0d          	popsp
 e19:	94          	im 20
 e1a:	0c          	store
 e1b:	04          	poppc

00000e1c <__do_global_ctors_aux>:
 e1c:	ff          	im -1
 e1d:	3d          	pushspadd
 e1e:	0d          	popsp
 e1f:	9d          	im 29
 e20:	a0          	im 32
 e21:	0b          	nop
 e22:	fc          	im -4
 e23:	05          	add
 e24:	70          	loadsp 0
 e25:	08          	load
 e26:	52          	storesp 8
 e27:	52          	storesp 8
 e28:	70          	loadsp 0
 e29:	ff          	im -1
 e2a:	2e          	eq
 e2b:	91          	im 17
 e2c:	38          	neqbranch

00000e2d <.L10>:
 e2d:	70          	loadsp 0
 e2e:	2d          	call
 e2f:	fc          	im -4
 e30:	12          	addsp 8
 e31:	70          	loadsp 0
 e32:	08          	load
 e33:	52          	storesp 8
 e34:	52          	storesp 8
 e35:	70          	loadsp 0
 e36:	ff          	im -1
 e37:	2e          	eq
 e38:	09          	not
 e39:	81          	im 1
 e3a:	06          	and
 e3b:	f1          	im -15
 e3c:	38          	neqbranch

00000e3d <.L7>:
 e3d:	83          	im 3
 e3e:	3d          	pushspadd
 e3f:	0d          	popsp
 e40:	04          	poppc

00000e41 <call___do_global_ctors_aux>:
 e41:	04          	poppc
Disassembly of section .fini:

00000e42 <_fini>:
 e42:	ec          	im -20
 e43:	db          	im -37
 e44:	3f          	callpcrel
 e45:	04          	poppc
Disassembly of section .rodata:

00000e48 <_mask>:
 e48:	00          	breakpoint
 e49:	ff          	im -1
 e4a:	ff          	im -1
 e4b:	ff          	im -1
 e4c:	ff          	im -1
 e4d:	00          	breakpoint
 e4e:	ff          	im -1
 e4f:	ff          	im -1
 e50:	ff          	im -1
 e51:	ff          	im -1
 e52:	00          	breakpoint
 e53:	ff          	im -1
 e54:	ff          	im -1
 e55:	ff          	im -1
 e56:	ff          	im -1
	...

00000e58 <handlers>:
 e58:	00          	breakpoint
 e59:	00          	breakpoint
 e5a:	09          	not
 e5b:	64          	loadsp 80
 e5c:	00          	breakpoint
 e5d:	00          	breakpoint
 e5e:	09          	not
 e5f:	84          	im 4
 e60:	00          	breakpoint
 e61:	00          	breakpoint
 e62:	09          	not
 e63:	1f          	addsp 60
 e64:	00          	breakpoint
 e65:	00          	breakpoint
 e66:	07          	or
 e67:	a0          	im 32
 e68:	00          	breakpoint
 e69:	00          	breakpoint
 e6a:	09          	not
 e6b:	da          	im -38
 e6c:	00          	breakpoint
 e6d:	00          	breakpoint
 e6e:	09          	not
 e6f:	f1          	im -15
 e70:	00          	breakpoint
 e71:	00          	breakpoint
 e72:	08          	load
 e73:	29          	mult
 e74:	00          	breakpoint
 e75:	00          	breakpoint
 e76:	08          	load
 e77:	d4          	im -44
 e78:	00          	breakpoint
 e79:	00          	breakpoint
 e7a:	07          	or
 e7b:	59          	storesp 36
 e7c:	00          	breakpoint
 e7d:	00          	breakpoint
 e7e:	0a          	flip
 e7f:	05          	add

00000e80 <vstring>:
 e80:	01          	.byte 1
 e81:	06          	and
 e82:	04          	poppc
 e83:	20          	.byte 32
 e84:	00          	breakpoint
 e85:	00          	breakpoint
 e86:	2f          	neq
 e87:	80          	im 0
 e88:	05          	add
 e89:	b8          	im 56
 e8a:	d8          	im -40
	...
Disassembly of section .data:

00001008 <__data_start>:
    1008:	00          	breakpoint
    1009:	00          	breakpoint
	...

0000100c <_cpu_config>:
    100c:	00          	breakpoint
    100d:	00          	breakpoint
	...

00001010 <__dso_handle>:
    1010:	00          	breakpoint
    1011:	00          	breakpoint
	...

00001014 <p.0>:
    1014:	00          	breakpoint
    1015:	00          	breakpoint
    1016:	0e          	.byte 14
    1017:	a8          	im 40
Disassembly of section .ctors:

00000e9c <___ctors>:
 e9c:	ff          	im -1
 e9d:	ff          	im -1
 e9e:	ff          	im -1
 e9f:	ff          	im -1

00000ea0 <__CTOR_END__>:
 ea0:	00          	breakpoint
 ea1:	00          	breakpoint
	...
Disassembly of section .dtors:

00000ea4 <___dtors>:
 ea4:	ff          	im -1
 ea5:	ff          	im -1
 ea6:	ff          	im -1
 ea7:	ff          	im -1

00000ea8 <__DTOR_END__>:
 ea8:	00          	breakpoint
 ea9:	00          	breakpoint
	...
Disassembly of section .jcr:

00000eac <___jcr_begin>:
 eac:	00          	breakpoint
 ead:	00          	breakpoint
	...
Disassembly of section .bss:

00001018 <completed.1>:
    1018:	00          	breakpoint
    1019:	00          	breakpoint
	...

0000101c <buffer>:
	...

0000113c <unescaping>:
    113c:	00          	breakpoint
    113d:	00          	breakpoint
	...

00001140 <syncSeen>:
    1140:	00          	breakpoint
    1141:	00          	breakpoint
	...

00001144 <bufferpos>:
    1144:	00          	breakpoint
    1145:	00          	breakpoint
	...

00001148 <milisseconds>:
    1148:	00          	breakpoint
    1149:	00          	breakpoint
	...

0000114c <inprogrammode>:
    114c:	00          	breakpoint
    114d:	00          	breakpoint
	...

00001150 <flash_id>:
    1150:	00          	breakpoint
    1151:	00          	breakpoint
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

00001004 <__sketch_start>:
    1004:	0b          	nop
    1005:	00          	breakpoint
	...
Disassembly of section .vectors:

00000000 <_memreg-0x8>:
	...
