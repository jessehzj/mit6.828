
./obj/boot/main.o:     file format elf32-i386


Disassembly of section .text:

00000000 <waitdisk>:
   0:	55                   	push   %ebp
   1:	ba f7 01 00 00       	mov    $0x1f7,%edx
   6:	89 e5                	mov    %esp,%ebp
   8:	ec                   	in     (%dx),%al
   9:	83 e0 c0             	and    $0xffffffc0,%eax
   c:	3c 40                	cmp    $0x40,%al
   e:	75 f8                	jne    8 <waitdisk+0x8>
  10:	5d                   	pop    %ebp
  11:	c3                   	ret    

00000012 <readsect>:
  12:	55                   	push   %ebp
  13:	89 e5                	mov    %esp,%ebp
  15:	57                   	push   %edi
  16:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  19:	e8 fc ff ff ff       	call   1a <readsect+0x8>
  1e:	ba f2 01 00 00       	mov    $0x1f2,%edx
  23:	b0 01                	mov    $0x1,%al
  25:	ee                   	out    %al,(%dx)
  26:	ba f3 01 00 00       	mov    $0x1f3,%edx
  2b:	88 c8                	mov    %cl,%al
  2d:	ee                   	out    %al,(%dx)
  2e:	89 c8                	mov    %ecx,%eax
  30:	ba f4 01 00 00       	mov    $0x1f4,%edx
  35:	c1 e8 08             	shr    $0x8,%eax
  38:	ee                   	out    %al,(%dx)
  39:	89 c8                	mov    %ecx,%eax
  3b:	ba f5 01 00 00       	mov    $0x1f5,%edx
  40:	c1 e8 10             	shr    $0x10,%eax
  43:	ee                   	out    %al,(%dx)
  44:	89 c8                	mov    %ecx,%eax
  46:	ba f6 01 00 00       	mov    $0x1f6,%edx
  4b:	c1 e8 18             	shr    $0x18,%eax
  4e:	83 c8 e0             	or     $0xffffffe0,%eax
  51:	ee                   	out    %al,(%dx)
  52:	ba f7 01 00 00       	mov    $0x1f7,%edx
  57:	b0 20                	mov    $0x20,%al
  59:	ee                   	out    %al,(%dx)
  5a:	e8 fc ff ff ff       	call   5b <readsect+0x49>
  5f:	8b 7d 08             	mov    0x8(%ebp),%edi
  62:	b9 80 00 00 00       	mov    $0x80,%ecx
  67:	ba f0 01 00 00       	mov    $0x1f0,%edx
  6c:	fc                   	cld    
  6d:	f2 6d                	repnz insl (%dx),%es:(%edi)
  6f:	5f                   	pop    %edi
  70:	5d                   	pop    %ebp
  71:	c3                   	ret    

00000072 <readseg>:
  72:	55                   	push   %ebp
  73:	89 e5                	mov    %esp,%ebp
  75:	57                   	push   %edi
  76:	56                   	push   %esi
  77:	8b 7d 10             	mov    0x10(%ebp),%edi
  7a:	53                   	push   %ebx
  7b:	8b 75 0c             	mov    0xc(%ebp),%esi
  7e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  81:	c1 ef 09             	shr    $0x9,%edi
  84:	01 de                	add    %ebx,%esi
  86:	47                   	inc    %edi
  87:	81 e3 00 fe ff ff    	and    $0xfffffe00,%ebx
  8d:	39 f3                	cmp    %esi,%ebx
  8f:	73 12                	jae    a3 <readseg+0x31>
  91:	57                   	push   %edi
  92:	53                   	push   %ebx
  93:	47                   	inc    %edi
  94:	81 c3 00 02 00 00    	add    $0x200,%ebx
  9a:	e8 fc ff ff ff       	call   9b <readseg+0x29>
  9f:	58                   	pop    %eax
  a0:	5a                   	pop    %edx
  a1:	eb ea                	jmp    8d <readseg+0x1b>
  a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  a6:	5b                   	pop    %ebx
  a7:	5e                   	pop    %esi
  a8:	5f                   	pop    %edi
  a9:	5d                   	pop    %ebp
  aa:	c3                   	ret    

000000ab <bootmain>:
  ab:	55                   	push   %ebp
  ac:	89 e5                	mov    %esp,%ebp
  ae:	56                   	push   %esi
  af:	53                   	push   %ebx
  b0:	6a 00                	push   $0x0
  b2:	68 00 10 00 00       	push   $0x1000
  b7:	68 00 00 01 00       	push   $0x10000
  bc:	e8 fc ff ff ff       	call   bd <bootmain+0x12>
  c1:	83 c4 0c             	add    $0xc,%esp
  c4:	81 3d 00 00 01 00 7f 	cmpl   $0x464c457f,0x10000
  cb:	45 4c 46 
  ce:	75 37                	jne    107 <bootmain+0x5c>
  d0:	a1 1c 00 01 00       	mov    0x1001c,%eax
  d5:	0f b7 35 2c 00 01 00 	movzwl 0x1002c,%esi
  dc:	8d 98 00 00 01 00    	lea    0x10000(%eax),%ebx
  e2:	c1 e6 05             	shl    $0x5,%esi
  e5:	01 de                	add    %ebx,%esi
  e7:	39 f3                	cmp    %esi,%ebx
  e9:	73 16                	jae    101 <bootmain+0x56>
  eb:	ff 73 04             	pushl  0x4(%ebx)
  ee:	ff 73 14             	pushl  0x14(%ebx)
  f1:	83 c3 20             	add    $0x20,%ebx
  f4:	ff 73 ec             	pushl  -0x14(%ebx)
  f7:	e8 fc ff ff ff       	call   f8 <bootmain+0x4d>
  fc:	83 c4 0c             	add    $0xc,%esp
  ff:	eb e6                	jmp    e7 <bootmain+0x3c>
 101:	ff 15 18 00 01 00    	call   *0x10018
 107:	ba 00 8a 00 00       	mov    $0x8a00,%edx
 10c:	b8 00 8a ff ff       	mov    $0xffff8a00,%eax
 111:	66 ef                	out    %ax,(%dx)
 113:	b8 00 8e ff ff       	mov    $0xffff8e00,%eax
 118:	66 ef                	out    %ax,(%dx)
 11a:	eb fe                	jmp    11a <bootmain+0x6f>
