
_testsymlink:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fcntl.h"

static void die(const char *m){ printf(1, "FAIL: %s\n", m); exit(); }
static void ok(const char *m){ printf(1, "PASS: %s\n", m); }

int main(void){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 54             	sub    $0x54,%esp
  int fd;
  char buf[64];

  fd = open("tgt", O_CREATE | O_WRONLY);
  13:	68 01 02 00 00       	push   $0x201
  18:	68 8f 08 00 00       	push   $0x88f
  1d:	e8 31 04 00 00       	call   453 <open>
  if(fd < 0) die("open tgt create");
  22:	83 c4 10             	add    $0x10,%esp
  25:	85 c0                	test   %eax,%eax
  27:	0f 88 ac 00 00 00    	js     d9 <main+0xd9>
  if(write(fd, "hello\n", 6) != 6) die("write tgt");
  2d:	56                   	push   %esi
  2e:	89 c3                	mov    %eax,%ebx
  30:	6a 06                	push   $0x6
  32:	68 82 08 00 00       	push   $0x882
  37:	50                   	push   %eax
  38:	e8 f6 03 00 00       	call   433 <write>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	83 f8 06             	cmp    $0x6,%eax
  43:	74 0a                	je     4f <main+0x4f>
  45:	b8 89 08 00 00       	mov    $0x889,%eax
  4a:	e8 61 01 00 00       	call   1b0 <die>
  close(fd);
  4f:	83 ec 0c             	sub    $0xc,%esp
  52:	53                   	push   %ebx
  53:	e8 e3 03 00 00       	call   43b <close>

  if(symlink("tgt", "lnk") != 0) die("symlink tgt lnk");
  58:	59                   	pop    %ecx
  59:	5b                   	pop    %ebx
  5a:	68 cb 08 00 00       	push   $0x8cb
  5f:	68 8f 08 00 00       	push   $0x88f
  64:	e8 4a 04 00 00       	call   4b3 <symlink>
  69:	83 c4 10             	add    $0x10,%esp
  6c:	85 c0                	test   %eax,%eax
  6e:	75 73                	jne    e3 <main+0xe3>
static void ok(const char *m){ printf(1, "PASS: %s\n", m); }
  70:	50                   	push   %eax
  71:	68 a3 08 00 00       	push   $0x8a3
  76:	68 b3 08 00 00       	push   $0x8b3
  7b:	6a 01                	push   $0x1
  7d:	e8 de 04 00 00       	call   560 <printf>
  ok("symlink created");

  fd = open("lnk", O_RDONLY);
  82:	58                   	pop    %eax
  83:	5a                   	pop    %edx
  84:	6a 00                	push   $0x0
  86:	68 cb 08 00 00       	push   $0x8cb
  8b:	e8 c3 03 00 00       	call   453 <open>
  if(fd < 0) die("open lnk");
  90:	83 c4 10             	add    $0x10,%esp
  fd = open("lnk", O_RDONLY);
  93:	89 c3                	mov    %eax,%ebx
  if(fd < 0) die("open lnk");
  95:	85 c0                	test   %eax,%eax
  97:	78 5e                	js     f7 <main+0xf7>
  int n = read(fd, buf, sizeof(buf)-1);
  99:	56                   	push   %esi
  9a:	8d 75 a8             	lea    -0x58(%ebp),%esi
  9d:	6a 3f                	push   $0x3f
  9f:	56                   	push   %esi
  a0:	50                   	push   %eax
  a1:	e8 85 03 00 00       	call   42b <read>
  if(n < 0) die("read lnk");
  a6:	83 c4 10             	add    $0x10,%esp
  a9:	85 c0                	test   %eax,%eax
  ab:	78 40                	js     ed <main+0xed>
  buf[n] = 0;
  close(fd);
  ad:	83 ec 0c             	sub    $0xc,%esp
  buf[n] = 0;
  b0:	c6 44 05 a8 00       	movb   $0x0,-0x58(%ebp,%eax,1)
  close(fd);
  b5:	53                   	push   %ebx
  b6:	e8 80 03 00 00       	call   43b <close>
  if(strcmp(buf, "hello\n") != 0) die("content mismatch through symlink");
  bb:	59                   	pop    %ecx
  bc:	5b                   	pop    %ebx
  bd:	68 82 08 00 00       	push   $0x882
  c2:	56                   	push   %esi
  c3:	e8 38 01 00 00       	call   200 <strcmp>
  c8:	83 c4 10             	add    $0x10,%esp
  cb:	85 c0                	test   %eax,%eax
  cd:	74 32                	je     101 <main+0x101>
  cf:	b8 34 09 00 00       	mov    $0x934,%eax
  d4:	e8 d7 00 00 00       	call   1b0 <die>
  if(fd < 0) die("open tgt create");
  d9:	b8 72 08 00 00       	mov    $0x872,%eax
  de:	e8 cd 00 00 00       	call   1b0 <die>
  if(symlink("tgt", "lnk") != 0) die("symlink tgt lnk");
  e3:	b8 93 08 00 00       	mov    $0x893,%eax
  e8:	e8 c3 00 00 00       	call   1b0 <die>
  if(n < 0) die("read lnk");
  ed:	b8 c6 08 00 00       	mov    $0x8c6,%eax
  f2:	e8 b9 00 00 00       	call   1b0 <die>
  if(fd < 0) die("open lnk");
  f7:	b8 bd 08 00 00       	mov    $0x8bd,%eax
  fc:	e8 af 00 00 00       	call   1b0 <die>
static void ok(const char *m){ printf(1, "PASS: %s\n", m); }
 101:	50                   	push   %eax
 102:	68 cf 08 00 00       	push   $0x8cf
 107:	68 b3 08 00 00       	push   $0x8b3
 10c:	6a 01                	push   $0x1
 10e:	e8 4d 04 00 00       	call   560 <printf>
  ok("read through symlink");

  if(symlink("b", "a") != 0) die("symlink b a");
 113:	58                   	pop    %eax
 114:	5a                   	pop    %edx
 115:	68 ee 08 00 00       	push   $0x8ee
 11a:	68 fa 08 00 00       	push   $0x8fa
 11f:	e8 8f 03 00 00       	call   4b3 <symlink>
 124:	83 c4 10             	add    $0x10,%esp
 127:	85 c0                	test   %eax,%eax
 129:	74 0a                	je     135 <main+0x135>
 12b:	b8 e4 08 00 00       	mov    $0x8e4,%eax
 130:	e8 7b 00 00 00       	call   1b0 <die>
  if(symlink("a", "b") != 0) die("symlink a b");
 135:	56                   	push   %esi
 136:	56                   	push   %esi
 137:	68 fa 08 00 00       	push   $0x8fa
 13c:	68 ee 08 00 00       	push   $0x8ee
 141:	e8 6d 03 00 00       	call   4b3 <symlink>
 146:	83 c4 10             	add    $0x10,%esp
 149:	85 c0                	test   %eax,%eax
 14b:	74 0a                	je     157 <main+0x157>
 14d:	b8 f0 08 00 00       	mov    $0x8f0,%eax
 152:	e8 59 00 00 00       	call   1b0 <die>
  fd = open("a", O_RDONLY);
 157:	53                   	push   %ebx
 158:	53                   	push   %ebx
 159:	6a 00                	push   $0x0
 15b:	68 ee 08 00 00       	push   $0x8ee
 160:	e8 ee 02 00 00       	call   453 <open>
  if(fd >= 0){
 165:	83 c4 10             	add    $0x10,%esp
 168:	85 c0                	test   %eax,%eax
 16a:	78 13                	js     17f <main+0x17f>
    close(fd);
 16c:	83 ec 0c             	sub    $0xc,%esp
 16f:	50                   	push   %eax
 170:	e8 c6 02 00 00       	call   43b <close>
    die("expected open(a) to fail due to loop");
 175:	b8 58 09 00 00       	mov    $0x958,%eax
 17a:	e8 31 00 00 00       	call   1b0 <die>
static void ok(const char *m){ printf(1, "PASS: %s\n", m); }
 17f:	50                   	push   %eax
 180:	68 fc 08 00 00       	push   $0x8fc
 185:	68 b3 08 00 00       	push   $0x8b3
 18a:	6a 01                	push   $0x1
 18c:	e8 cf 03 00 00       	call   560 <printf>
  }
  ok("loop detected (open failed)");

  printf(1, "testsymlink done\n");
 191:	5a                   	pop    %edx
 192:	59                   	pop    %ecx
 193:	68 18 09 00 00       	push   $0x918
 198:	6a 01                	push   $0x1
 19a:	e8 c1 03 00 00       	call   560 <printf>
  exit();
 19f:	e8 6f 02 00 00       	call   413 <exit>
 1a4:	66 90                	xchg   %ax,%ax
 1a6:	66 90                	xchg   %ax,%ax
 1a8:	66 90                	xchg   %ax,%ax
 1aa:	66 90                	xchg   %ax,%ax
 1ac:	66 90                	xchg   %ax,%ax
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <die>:
static void die(const char *m){ printf(1, "FAIL: %s\n", m); exit(); }
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	83 ec 0c             	sub    $0xc,%esp
 1b6:	50                   	push   %eax
 1b7:	68 68 08 00 00       	push   $0x868
 1bc:	6a 01                	push   $0x1
 1be:	e8 9d 03 00 00       	call   560 <printf>
 1c3:	e8 4b 02 00 00       	call   413 <exit>
 1c8:	66 90                	xchg   %ax,%ax
 1ca:	66 90                	xchg   %ax,%ax
 1cc:	66 90                	xchg   %ax,%ax
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1d0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1d1:	31 c0                	xor    %eax,%eax
{
 1d3:	89 e5                	mov    %esp,%ebp
 1d5:	53                   	push   %ebx
 1d6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1e0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1e4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1e7:	83 c0 01             	add    $0x1,%eax
 1ea:	84 d2                	test   %dl,%dl
 1ec:	75 f2                	jne    1e0 <strcpy+0x10>
    ;
  return os;
}
 1ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1f1:	89 c8                	mov    %ecx,%eax
 1f3:	c9                   	leave
 1f4:	c3                   	ret
 1f5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1fc:	00 
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	53                   	push   %ebx
 204:	8b 55 08             	mov    0x8(%ebp),%edx
 207:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 20a:	0f b6 02             	movzbl (%edx),%eax
 20d:	84 c0                	test   %al,%al
 20f:	75 17                	jne    228 <strcmp+0x28>
 211:	eb 3a                	jmp    24d <strcmp+0x4d>
 213:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 218:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 21c:	83 c2 01             	add    $0x1,%edx
 21f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 222:	84 c0                	test   %al,%al
 224:	74 1a                	je     240 <strcmp+0x40>
 226:	89 d9                	mov    %ebx,%ecx
 228:	0f b6 19             	movzbl (%ecx),%ebx
 22b:	38 c3                	cmp    %al,%bl
 22d:	74 e9                	je     218 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 22f:	29 d8                	sub    %ebx,%eax
}
 231:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 234:	c9                   	leave
 235:	c3                   	ret
 236:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23d:	00 
 23e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 240:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 244:	31 c0                	xor    %eax,%eax
 246:	29 d8                	sub    %ebx,%eax
}
 248:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 24b:	c9                   	leave
 24c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 24d:	0f b6 19             	movzbl (%ecx),%ebx
 250:	31 c0                	xor    %eax,%eax
 252:	eb db                	jmp    22f <strcmp+0x2f>
 254:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 25b:	00 
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000260 <strlen>:

uint
strlen(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 266:	80 3a 00             	cmpb   $0x0,(%edx)
 269:	74 15                	je     280 <strlen+0x20>
 26b:	31 c0                	xor    %eax,%eax
 26d:	8d 76 00             	lea    0x0(%esi),%esi
 270:	83 c0 01             	add    $0x1,%eax
 273:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 277:	89 c1                	mov    %eax,%ecx
 279:	75 f5                	jne    270 <strlen+0x10>
    ;
  return n;
}
 27b:	89 c8                	mov    %ecx,%eax
 27d:	5d                   	pop    %ebp
 27e:	c3                   	ret
 27f:	90                   	nop
  for(n = 0; s[n]; n++)
 280:	31 c9                	xor    %ecx,%ecx
}
 282:	5d                   	pop    %ebp
 283:	89 c8                	mov    %ecx,%eax
 285:	c3                   	ret
 286:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 28d:	00 
 28e:	66 90                	xchg   %ax,%ax

00000290 <memset>:

void*
memset(void *dst, int c, uint n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 297:	8b 4d 10             	mov    0x10(%ebp),%ecx
 29a:	8b 45 0c             	mov    0xc(%ebp),%eax
 29d:	89 d7                	mov    %edx,%edi
 29f:	fc                   	cld
 2a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2a2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2a5:	89 d0                	mov    %edx,%eax
 2a7:	c9                   	leave
 2a8:	c3                   	ret
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002b0 <strchr>:

char*
strchr(const char *s, char c)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ba:	0f b6 10             	movzbl (%eax),%edx
 2bd:	84 d2                	test   %dl,%dl
 2bf:	75 12                	jne    2d3 <strchr+0x23>
 2c1:	eb 1d                	jmp    2e0 <strchr+0x30>
 2c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 2c8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2cc:	83 c0 01             	add    $0x1,%eax
 2cf:	84 d2                	test   %dl,%dl
 2d1:	74 0d                	je     2e0 <strchr+0x30>
    if(*s == c)
 2d3:	38 d1                	cmp    %dl,%cl
 2d5:	75 f1                	jne    2c8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2d7:	5d                   	pop    %ebp
 2d8:	c3                   	ret
 2d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2e0:	31 c0                	xor    %eax,%eax
}
 2e2:	5d                   	pop    %ebp
 2e3:	c3                   	ret
 2e4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2eb:	00 
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002f0 <gets>:

char*
gets(char *buf, int max)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2f5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 2f8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2f9:	31 db                	xor    %ebx,%ebx
{
 2fb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2fe:	eb 27                	jmp    327 <gets+0x37>
    cc = read(0, &c, 1);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	6a 01                	push   $0x1
 305:	56                   	push   %esi
 306:	6a 00                	push   $0x0
 308:	e8 1e 01 00 00       	call   42b <read>
    if(cc < 1)
 30d:	83 c4 10             	add    $0x10,%esp
 310:	85 c0                	test   %eax,%eax
 312:	7e 1d                	jle    331 <gets+0x41>
      break;
    buf[i++] = c;
 314:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 318:	8b 55 08             	mov    0x8(%ebp),%edx
 31b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 31f:	3c 0a                	cmp    $0xa,%al
 321:	74 10                	je     333 <gets+0x43>
 323:	3c 0d                	cmp    $0xd,%al
 325:	74 0c                	je     333 <gets+0x43>
  for(i=0; i+1 < max; ){
 327:	89 df                	mov    %ebx,%edi
 329:	83 c3 01             	add    $0x1,%ebx
 32c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 32f:	7c cf                	jl     300 <gets+0x10>
 331:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 333:	8b 45 08             	mov    0x8(%ebp),%eax
 336:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 33a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 33d:	5b                   	pop    %ebx
 33e:	5e                   	pop    %esi
 33f:	5f                   	pop    %edi
 340:	5d                   	pop    %ebp
 341:	c3                   	ret
 342:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 349:	00 
 34a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000350 <stat>:

int
stat(const char *n, struct stat *st)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	56                   	push   %esi
 354:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 355:	83 ec 08             	sub    $0x8,%esp
 358:	6a 00                	push   $0x0
 35a:	ff 75 08             	push   0x8(%ebp)
 35d:	e8 f1 00 00 00       	call   453 <open>
  if(fd < 0)
 362:	83 c4 10             	add    $0x10,%esp
 365:	85 c0                	test   %eax,%eax
 367:	78 27                	js     390 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 369:	83 ec 08             	sub    $0x8,%esp
 36c:	ff 75 0c             	push   0xc(%ebp)
 36f:	89 c3                	mov    %eax,%ebx
 371:	50                   	push   %eax
 372:	e8 f4 00 00 00       	call   46b <fstat>
  close(fd);
 377:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 37a:	89 c6                	mov    %eax,%esi
  close(fd);
 37c:	e8 ba 00 00 00       	call   43b <close>
  return r;
 381:	83 c4 10             	add    $0x10,%esp
}
 384:	8d 65 f8             	lea    -0x8(%ebp),%esp
 387:	89 f0                	mov    %esi,%eax
 389:	5b                   	pop    %ebx
 38a:	5e                   	pop    %esi
 38b:	5d                   	pop    %ebp
 38c:	c3                   	ret
 38d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 390:	be ff ff ff ff       	mov    $0xffffffff,%esi
 395:	eb ed                	jmp    384 <stat+0x34>
 397:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 39e:	00 
 39f:	90                   	nop

000003a0 <atoi>:

int
atoi(const char *s)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3a7:	0f be 02             	movsbl (%edx),%eax
 3aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3b5:	77 1e                	ja     3d5 <atoi+0x35>
 3b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3be:	00 
 3bf:	90                   	nop
    n = n*10 + *s++ - '0';
 3c0:	83 c2 01             	add    $0x1,%edx
 3c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3ca:	0f be 02             	movsbl (%edx),%eax
 3cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3d0:	80 fb 09             	cmp    $0x9,%bl
 3d3:	76 eb                	jbe    3c0 <atoi+0x20>
  return n;
}
 3d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d8:	89 c8                	mov    %ecx,%eax
 3da:	c9                   	leave
 3db:	c3                   	ret
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	8b 45 10             	mov    0x10(%ebp),%eax
 3e7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ea:	56                   	push   %esi
 3eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ee:	85 c0                	test   %eax,%eax
 3f0:	7e 13                	jle    405 <memmove+0x25>
 3f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3f4:	89 d7                	mov    %edx,%edi
 3f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3fd:	00 
 3fe:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 400:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 401:	39 f8                	cmp    %edi,%eax
 403:	75 fb                	jne    400 <memmove+0x20>
  return vdst;
}
 405:	5e                   	pop    %esi
 406:	89 d0                	mov    %edx,%eax
 408:	5f                   	pop    %edi
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret

0000040b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 40b:	b8 01 00 00 00       	mov    $0x1,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret

00000413 <exit>:
SYSCALL(exit)
 413:	b8 02 00 00 00       	mov    $0x2,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret

0000041b <wait>:
SYSCALL(wait)
 41b:	b8 03 00 00 00       	mov    $0x3,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret

00000423 <pipe>:
SYSCALL(pipe)
 423:	b8 04 00 00 00       	mov    $0x4,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret

0000042b <read>:
SYSCALL(read)
 42b:	b8 05 00 00 00       	mov    $0x5,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret

00000433 <write>:
SYSCALL(write)
 433:	b8 10 00 00 00       	mov    $0x10,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret

0000043b <close>:
SYSCALL(close)
 43b:	b8 15 00 00 00       	mov    $0x15,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret

00000443 <kill>:
SYSCALL(kill)
 443:	b8 06 00 00 00       	mov    $0x6,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret

0000044b <exec>:
SYSCALL(exec)
 44b:	b8 07 00 00 00       	mov    $0x7,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret

00000453 <open>:
SYSCALL(open)
 453:	b8 0f 00 00 00       	mov    $0xf,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret

0000045b <mknod>:
SYSCALL(mknod)
 45b:	b8 11 00 00 00       	mov    $0x11,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret

00000463 <unlink>:
SYSCALL(unlink)
 463:	b8 12 00 00 00       	mov    $0x12,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret

0000046b <fstat>:
SYSCALL(fstat)
 46b:	b8 08 00 00 00       	mov    $0x8,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret

00000473 <link>:
SYSCALL(link)
 473:	b8 13 00 00 00       	mov    $0x13,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret

0000047b <mkdir>:
SYSCALL(mkdir)
 47b:	b8 14 00 00 00       	mov    $0x14,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret

00000483 <chdir>:
SYSCALL(chdir)
 483:	b8 09 00 00 00       	mov    $0x9,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret

0000048b <dup>:
SYSCALL(dup)
 48b:	b8 0a 00 00 00       	mov    $0xa,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret

00000493 <getpid>:
SYSCALL(getpid)
 493:	b8 0b 00 00 00       	mov    $0xb,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret

0000049b <sbrk>:
SYSCALL(sbrk)
 49b:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret

000004a3 <sleep>:
SYSCALL(sleep)
 4a3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret

000004ab <uptime>:
SYSCALL(uptime)
 4ab:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret

000004b3 <symlink>:
 4b3:	b8 16 00 00 00       	mov    $0x16,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret
 4bb:	66 90                	xchg   %ax,%ax
 4bd:	66 90                	xchg   %ax,%ax
 4bf:	90                   	nop

000004c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4c8:	89 d1                	mov    %edx,%ecx
{
 4ca:	83 ec 3c             	sub    $0x3c,%esp
 4cd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 4d0:	85 d2                	test   %edx,%edx
 4d2:	0f 89 80 00 00 00    	jns    558 <printint+0x98>
 4d8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4dc:	74 7a                	je     558 <printint+0x98>
    x = -xx;
 4de:	f7 d9                	neg    %ecx
    neg = 1;
 4e0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 4e5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 4e8:	31 f6                	xor    %esi,%esi
 4ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4f0:	89 c8                	mov    %ecx,%eax
 4f2:	31 d2                	xor    %edx,%edx
 4f4:	89 f7                	mov    %esi,%edi
 4f6:	f7 f3                	div    %ebx
 4f8:	8d 76 01             	lea    0x1(%esi),%esi
 4fb:	0f b6 92 d8 09 00 00 	movzbl 0x9d8(%edx),%edx
 502:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 506:	89 ca                	mov    %ecx,%edx
 508:	89 c1                	mov    %eax,%ecx
 50a:	39 da                	cmp    %ebx,%edx
 50c:	73 e2                	jae    4f0 <printint+0x30>
  if(neg)
 50e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 511:	85 c0                	test   %eax,%eax
 513:	74 07                	je     51c <printint+0x5c>
    buf[i++] = '-';
 515:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 51a:	89 f7                	mov    %esi,%edi
 51c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 51f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 522:	01 df                	add    %ebx,%edi
 524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 528:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 52b:	83 ec 04             	sub    $0x4,%esp
 52e:	88 45 d7             	mov    %al,-0x29(%ebp)
 531:	8d 45 d7             	lea    -0x29(%ebp),%eax
 534:	6a 01                	push   $0x1
 536:	50                   	push   %eax
 537:	56                   	push   %esi
 538:	e8 f6 fe ff ff       	call   433 <write>
  while(--i >= 0)
 53d:	89 f8                	mov    %edi,%eax
 53f:	83 c4 10             	add    $0x10,%esp
 542:	83 ef 01             	sub    $0x1,%edi
 545:	39 c3                	cmp    %eax,%ebx
 547:	75 df                	jne    528 <printint+0x68>
}
 549:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54c:	5b                   	pop    %ebx
 54d:	5e                   	pop    %esi
 54e:	5f                   	pop    %edi
 54f:	5d                   	pop    %ebp
 550:	c3                   	ret
 551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 558:	31 c0                	xor    %eax,%eax
 55a:	eb 89                	jmp    4e5 <printint+0x25>
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000560 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 569:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 56c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 56f:	0f b6 1e             	movzbl (%esi),%ebx
 572:	83 c6 01             	add    $0x1,%esi
 575:	84 db                	test   %bl,%bl
 577:	74 67                	je     5e0 <printf+0x80>
 579:	8d 4d 10             	lea    0x10(%ebp),%ecx
 57c:	31 d2                	xor    %edx,%edx
 57e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 581:	eb 34                	jmp    5b7 <printf+0x57>
 583:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 588:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 58b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 590:	83 f8 25             	cmp    $0x25,%eax
 593:	74 18                	je     5ad <printf+0x4d>
  write(fd, &c, 1);
 595:	83 ec 04             	sub    $0x4,%esp
 598:	8d 45 e7             	lea    -0x19(%ebp),%eax
 59b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 59e:	6a 01                	push   $0x1
 5a0:	50                   	push   %eax
 5a1:	57                   	push   %edi
 5a2:	e8 8c fe ff ff       	call   433 <write>
 5a7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5aa:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5ad:	0f b6 1e             	movzbl (%esi),%ebx
 5b0:	83 c6 01             	add    $0x1,%esi
 5b3:	84 db                	test   %bl,%bl
 5b5:	74 29                	je     5e0 <printf+0x80>
    c = fmt[i] & 0xff;
 5b7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5ba:	85 d2                	test   %edx,%edx
 5bc:	74 ca                	je     588 <printf+0x28>
      }
    } else if(state == '%'){
 5be:	83 fa 25             	cmp    $0x25,%edx
 5c1:	75 ea                	jne    5ad <printf+0x4d>
      if(c == 'd'){
 5c3:	83 f8 25             	cmp    $0x25,%eax
 5c6:	0f 84 04 01 00 00    	je     6d0 <printf+0x170>
 5cc:	83 e8 63             	sub    $0x63,%eax
 5cf:	83 f8 15             	cmp    $0x15,%eax
 5d2:	77 1c                	ja     5f0 <printf+0x90>
 5d4:	ff 24 85 80 09 00 00 	jmp    *0x980(,%eax,4)
 5db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e3:	5b                   	pop    %ebx
 5e4:	5e                   	pop    %esi
 5e5:	5f                   	pop    %edi
 5e6:	5d                   	pop    %ebp
 5e7:	c3                   	ret
 5e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5ef:	00 
  write(fd, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
 5f3:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5f6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5fa:	6a 01                	push   $0x1
 5fc:	52                   	push   %edx
 5fd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 600:	57                   	push   %edi
 601:	e8 2d fe ff ff       	call   433 <write>
 606:	83 c4 0c             	add    $0xc,%esp
 609:	88 5d e7             	mov    %bl,-0x19(%ebp)
 60c:	6a 01                	push   $0x1
 60e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 611:	52                   	push   %edx
 612:	57                   	push   %edi
 613:	e8 1b fe ff ff       	call   433 <write>
        putc(fd, c);
 618:	83 c4 10             	add    $0x10,%esp
      state = 0;
 61b:	31 d2                	xor    %edx,%edx
 61d:	eb 8e                	jmp    5ad <printf+0x4d>
 61f:	90                   	nop
        printint(fd, *ap, 16, 0);
 620:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 623:	83 ec 0c             	sub    $0xc,%esp
 626:	b9 10 00 00 00       	mov    $0x10,%ecx
 62b:	8b 13                	mov    (%ebx),%edx
 62d:	6a 00                	push   $0x0
 62f:	89 f8                	mov    %edi,%eax
        ap++;
 631:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 634:	e8 87 fe ff ff       	call   4c0 <printint>
        ap++;
 639:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 63c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 63f:	31 d2                	xor    %edx,%edx
 641:	e9 67 ff ff ff       	jmp    5ad <printf+0x4d>
        s = (char*)*ap;
 646:	8b 45 d0             	mov    -0x30(%ebp),%eax
 649:	8b 18                	mov    (%eax),%ebx
        ap++;
 64b:	83 c0 04             	add    $0x4,%eax
 64e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 651:	85 db                	test   %ebx,%ebx
 653:	0f 84 87 00 00 00    	je     6e0 <printf+0x180>
        while(*s != 0){
 659:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 65c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 65e:	84 c0                	test   %al,%al
 660:	0f 84 47 ff ff ff    	je     5ad <printf+0x4d>
 666:	8d 55 e7             	lea    -0x19(%ebp),%edx
 669:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 66c:	89 de                	mov    %ebx,%esi
 66e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 670:	83 ec 04             	sub    $0x4,%esp
 673:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 676:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 679:	6a 01                	push   $0x1
 67b:	53                   	push   %ebx
 67c:	57                   	push   %edi
 67d:	e8 b1 fd ff ff       	call   433 <write>
        while(*s != 0){
 682:	0f b6 06             	movzbl (%esi),%eax
 685:	83 c4 10             	add    $0x10,%esp
 688:	84 c0                	test   %al,%al
 68a:	75 e4                	jne    670 <printf+0x110>
      state = 0;
 68c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 68f:	31 d2                	xor    %edx,%edx
 691:	e9 17 ff ff ff       	jmp    5ad <printf+0x4d>
        printint(fd, *ap, 10, 1);
 696:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 699:	83 ec 0c             	sub    $0xc,%esp
 69c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6a1:	8b 13                	mov    (%ebx),%edx
 6a3:	6a 01                	push   $0x1
 6a5:	eb 88                	jmp    62f <printf+0xcf>
        putc(fd, *ap);
 6a7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6aa:	83 ec 04             	sub    $0x4,%esp
 6ad:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 6b0:	8b 03                	mov    (%ebx),%eax
        ap++;
 6b2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 6b5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6b8:	6a 01                	push   $0x1
 6ba:	52                   	push   %edx
 6bb:	57                   	push   %edi
 6bc:	e8 72 fd ff ff       	call   433 <write>
        ap++;
 6c1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6c4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6c7:	31 d2                	xor    %edx,%edx
 6c9:	e9 df fe ff ff       	jmp    5ad <printf+0x4d>
 6ce:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 6d0:	83 ec 04             	sub    $0x4,%esp
 6d3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6d6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6d9:	6a 01                	push   $0x1
 6db:	e9 31 ff ff ff       	jmp    611 <printf+0xb1>
 6e0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 6e5:	bb 2a 09 00 00       	mov    $0x92a,%ebx
 6ea:	e9 77 ff ff ff       	jmp    666 <printf+0x106>
 6ef:	90                   	nop

000006f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	a1 98 0c 00 00       	mov    0xc98,%eax
{
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	57                   	push   %edi
 6f9:	56                   	push   %esi
 6fa:	53                   	push   %ebx
 6fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 708:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70a:	39 c8                	cmp    %ecx,%eax
 70c:	73 32                	jae    740 <free+0x50>
 70e:	39 d1                	cmp    %edx,%ecx
 710:	72 04                	jb     716 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 712:	39 d0                	cmp    %edx,%eax
 714:	72 32                	jb     748 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 716:	8b 73 fc             	mov    -0x4(%ebx),%esi
 719:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 71c:	39 fa                	cmp    %edi,%edx
 71e:	74 30                	je     750 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 720:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 723:	8b 50 04             	mov    0x4(%eax),%edx
 726:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 729:	39 f1                	cmp    %esi,%ecx
 72b:	74 3a                	je     767 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 72d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 72f:	5b                   	pop    %ebx
  freep = p;
 730:	a3 98 0c 00 00       	mov    %eax,0xc98
}
 735:	5e                   	pop    %esi
 736:	5f                   	pop    %edi
 737:	5d                   	pop    %ebp
 738:	c3                   	ret
 739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 740:	39 d0                	cmp    %edx,%eax
 742:	72 04                	jb     748 <free+0x58>
 744:	39 d1                	cmp    %edx,%ecx
 746:	72 ce                	jb     716 <free+0x26>
{
 748:	89 d0                	mov    %edx,%eax
 74a:	eb bc                	jmp    708 <free+0x18>
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 750:	03 72 04             	add    0x4(%edx),%esi
 753:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 756:	8b 10                	mov    (%eax),%edx
 758:	8b 12                	mov    (%edx),%edx
 75a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 75d:	8b 50 04             	mov    0x4(%eax),%edx
 760:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 763:	39 f1                	cmp    %esi,%ecx
 765:	75 c6                	jne    72d <free+0x3d>
    p->s.size += bp->s.size;
 767:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 76a:	a3 98 0c 00 00       	mov    %eax,0xc98
    p->s.size += bp->s.size;
 76f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 772:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 775:	89 08                	mov    %ecx,(%eax)
}
 777:	5b                   	pop    %ebx
 778:	5e                   	pop    %esi
 779:	5f                   	pop    %edi
 77a:	5d                   	pop    %ebp
 77b:	c3                   	ret
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000780 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 789:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 78c:	8b 15 98 0c 00 00    	mov    0xc98,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 792:	8d 78 07             	lea    0x7(%eax),%edi
 795:	c1 ef 03             	shr    $0x3,%edi
 798:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 79b:	85 d2                	test   %edx,%edx
 79d:	0f 84 8d 00 00 00    	je     830 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7a5:	8b 48 04             	mov    0x4(%eax),%ecx
 7a8:	39 f9                	cmp    %edi,%ecx
 7aa:	73 64                	jae    810 <malloc+0x90>
  if(nu < 4096)
 7ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7b1:	39 df                	cmp    %ebx,%edi
 7b3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7b6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7bd:	eb 0a                	jmp    7c9 <malloc+0x49>
 7bf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7c2:	8b 48 04             	mov    0x4(%eax),%ecx
 7c5:	39 f9                	cmp    %edi,%ecx
 7c7:	73 47                	jae    810 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7c9:	89 c2                	mov    %eax,%edx
 7cb:	3b 05 98 0c 00 00    	cmp    0xc98,%eax
 7d1:	75 ed                	jne    7c0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 7d3:	83 ec 0c             	sub    $0xc,%esp
 7d6:	56                   	push   %esi
 7d7:	e8 bf fc ff ff       	call   49b <sbrk>
  if(p == (char*)-1)
 7dc:	83 c4 10             	add    $0x10,%esp
 7df:	83 f8 ff             	cmp    $0xffffffff,%eax
 7e2:	74 1c                	je     800 <malloc+0x80>
  hp->s.size = nu;
 7e4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e7:	83 ec 0c             	sub    $0xc,%esp
 7ea:	83 c0 08             	add    $0x8,%eax
 7ed:	50                   	push   %eax
 7ee:	e8 fd fe ff ff       	call   6f0 <free>
  return freep;
 7f3:	8b 15 98 0c 00 00    	mov    0xc98,%edx
      if((p = morecore(nunits)) == 0)
 7f9:	83 c4 10             	add    $0x10,%esp
 7fc:	85 d2                	test   %edx,%edx
 7fe:	75 c0                	jne    7c0 <malloc+0x40>
        return 0;
  }
}
 800:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 803:	31 c0                	xor    %eax,%eax
}
 805:	5b                   	pop    %ebx
 806:	5e                   	pop    %esi
 807:	5f                   	pop    %edi
 808:	5d                   	pop    %ebp
 809:	c3                   	ret
 80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 810:	39 cf                	cmp    %ecx,%edi
 812:	74 4c                	je     860 <malloc+0xe0>
        p->s.size -= nunits;
 814:	29 f9                	sub    %edi,%ecx
 816:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 819:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 81c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 81f:	89 15 98 0c 00 00    	mov    %edx,0xc98
}
 825:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 828:	83 c0 08             	add    $0x8,%eax
}
 82b:	5b                   	pop    %ebx
 82c:	5e                   	pop    %esi
 82d:	5f                   	pop    %edi
 82e:	5d                   	pop    %ebp
 82f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 830:	c7 05 98 0c 00 00 9c 	movl   $0xc9c,0xc98
 837:	0c 00 00 
    base.s.size = 0;
 83a:	b8 9c 0c 00 00       	mov    $0xc9c,%eax
    base.s.ptr = freep = prevp = &base;
 83f:	c7 05 9c 0c 00 00 9c 	movl   $0xc9c,0xc9c
 846:	0c 00 00 
    base.s.size = 0;
 849:	c7 05 a0 0c 00 00 00 	movl   $0x0,0xca0
 850:	00 00 00 
    if(p->s.size >= nunits){
 853:	e9 54 ff ff ff       	jmp    7ac <malloc+0x2c>
 858:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 85f:	00 
        prevp->s.ptr = p->s.ptr;
 860:	8b 08                	mov    (%eax),%ecx
 862:	89 0a                	mov    %ecx,(%edx)
 864:	eb b9                	jmp    81f <malloc+0x9f>
