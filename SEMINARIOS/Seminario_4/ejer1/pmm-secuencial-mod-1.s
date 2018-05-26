	.file	"pmm-secuencial-mod-1.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Faltan tama\303\261o de la matriz"
.LC3:
	.string	"m[%d][%d]: %f"
.LC4:
	.string	"tiempo:  %11.9f\n"
.LC6:
	.string	"m[0][0]: %f\n"
.LC7:
	.string	"m[%d][%d]: %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L73
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, %rbx
	movq	%rax, 96(%rsp)
	movl	%eax, 72(%rsp)
	cltq
	movl	%ebx, %ebp
	leaq	0(,%rax,8), %r13
	movq	%r13, %rdi
	movq	%r13, 104(%rsp)
	call	malloc@PLT
	movq	%r13, %rdi
	movq	%rax, 64(%rsp)
	call	malloc@PLT
	movq	%r13, %rdi
	movq	%rax, %r15
	call	malloc@PLT
	xorl	%edi, %edi
	movq	%rax, 56(%rsp)
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	%ebx, %eax
	movl	$1717986919, %edx
	imull	%edx
	movl	%ebx, %eax
	sarl	$31, %eax
	sarl	%edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %eax
	subl	%eax, %ebp
	testl	%ebx, %ebx
	jle	.L3
	movl	%ebx, %eax
	movsd	.LC1(%rip), %xmm0
	subl	$1, %eax
	movl	%ebp, 16(%rsp)
	xorl	%r12d, %r12d
	leaq	8(,%rax,8), %r14
	movl	%eax, 24(%rsp)
	movq	%r14, %rbp
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%r13, %rdi
	movsd	%xmm0, 8(%rsp)
	call	malloc@PLT
	movq	%rax, %r14
	movq	64(%rsp), %rax
	movq	%r13, %rdi
	movq	%r14, (%rax,%r12)
	call	malloc@PLT
	movq	%r13, %rdi
	movq	%rax, (%r15,%r12)
	movq	%rax, %rbx
	call	malloc@PLT
	movq	56(%rsp), %rdi
	movsd	8(%rsp), %xmm0
	xorl	%edx, %edx
	movq	%rax, (%rdi,%r12)
	.p2align 4,,10
	.p2align 3
.L4:
	movsd	%xmm0, (%rbx,%rdx)
	movq	$0x000000000, (%rax,%rdx)
	movsd	%xmm0, (%r14,%rdx)
	addq	$8, %rdx
	cmpq	%rdx, %rbp
	jne	.L4
	addq	$8, %r12
	cmpq	%rbp, %r12
	jne	.L5
	movl	16(%rsp), %ebp
	leaq	112(%rsp), %rsi
	xorl	%edi, %edi
	movq	%r12, 32(%rsp)
	movl	24(%rsp), %ebx
	call	clock_gettime@PLT
	testl	%ebp, %ebp
	je	.L74
	movq	96(%rsp), %rax
	testb	$3, %al
	movl	%eax, %ecx
	jne	.L75
	movq	64(%rsp), %rax
	movq	56(%rsp), %rdi
	movq	%rax, 32(%rsp)
	movl	%ebx, %eax
	movq	%rdi, 24(%rsp)
	shrl	$2, %eax
	movq	%rax, %rdx
	addq	$1, %rax
	salq	$5, %rax
	salq	$5, %rdx
	leaq	32(%rdi,%rdx), %rdi
	movq	%rax, 16(%rsp)
	leaq	8(,%rbx,8), %rax
	movq	%rdi, 40(%rsp)
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L14:
	movq	32(%rsp), %rax
	xorl	%r9d, %r9d
	movq	(%rax), %r14
	movq	8(%rax), %r13
	movq	16(%rax), %r12
	movq	24(%rax), %rbp
	movq	24(%rsp), %rax
	movq	(%rax), %rsi
	movq	8(%rax), %rcx
	movq	16(%rax), %rdx
	movq	24(%rax), %rax
	.p2align 4,,10
	.p2align 3
.L17:
	leaq	8(%r9), %rbx
	leaq	16(%r9), %r11
	leaq	24(%r9), %r10
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L15:
	movq	(%r15,%rdi), %r8
	movsd	(%r14,%rdi), %xmm4
	movsd	0(%r13,%rdi), %xmm3
	movapd	%xmm4, %xmm1
	movsd	(%r12,%rdi), %xmm2
	movsd	(%r8,%r9), %xmm0
	movapd	%xmm4, %xmm5
	mulsd	%xmm0, %xmm1
	addsd	(%rsi), %xmm1
	movsd	%xmm1, (%rsi)
	movapd	%xmm0, %xmm1
	mulsd	%xmm3, %xmm1
	addsd	(%rcx), %xmm1
	movsd	%xmm1, (%rcx)
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	(%rdx), %xmm1
	movsd	%xmm1, (%rdx)
	movsd	0(%rbp,%rdi), %xmm1
	addq	$8, %rdi
	mulsd	%xmm1, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movsd	(%r8,%rbx), %xmm0
	mulsd	%xmm0, %xmm5
	addsd	8(%rsi), %xmm5
	movsd	%xmm5, 8(%rsi)
	movapd	%xmm3, %xmm5
	mulsd	%xmm0, %xmm5
	addsd	8(%rcx), %xmm5
	movsd	%xmm5, 8(%rcx)
	movapd	%xmm2, %xmm5
	mulsd	%xmm0, %xmm5
	mulsd	%xmm1, %xmm0
	addsd	8(%rdx), %xmm5
	movsd	%xmm5, 8(%rdx)
	movapd	%xmm4, %xmm5
	addsd	8(%rax), %xmm0
	movsd	%xmm0, 8(%rax)
	movsd	(%r8,%r11), %xmm0
	mulsd	%xmm0, %xmm5
	addsd	16(%rsi), %xmm5
	movsd	%xmm5, 16(%rsi)
	movapd	%xmm3, %xmm5
	mulsd	%xmm0, %xmm5
	addsd	16(%rcx), %xmm5
	movsd	%xmm5, 16(%rcx)
	movapd	%xmm2, %xmm5
	mulsd	%xmm0, %xmm5
	mulsd	%xmm1, %xmm0
	addsd	16(%rdx), %xmm5
	movsd	%xmm5, 16(%rdx)
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 16(%rax)
	movsd	(%r8,%r10), %xmm0
	cmpq	%rdi, 8(%rsp)
	mulsd	%xmm0, %xmm4
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	mulsd	%xmm1, %xmm0
	addsd	24(%rsi), %xmm4
	movsd	%xmm4, 24(%rsi)
	addsd	24(%rcx), %xmm3
	movsd	%xmm3, 24(%rcx)
	addsd	24(%rdx), %xmm2
	movsd	%xmm2, 24(%rdx)
	addsd	24(%rax), %xmm0
	movsd	%xmm0, 24(%rax)
	jne	.L15
	addq	$32, %rsi
	addq	$32, %r9
	addq	$32, %rcx
	addq	$32, %rdx
	addq	$32, %rax
	cmpq	%r9, 16(%rsp)
	jne	.L17
	addq	$32, 24(%rsp)
	addq	$32, 32(%rsp)
	movq	24(%rsp), %rax
	cmpq	%rax, 40(%rsp)
	jne	.L14
	jmp	.L11
.L74:
	movq	56(%rsp), %rax
	movl	$0, 76(%rsp)
	movq	%r15, 40(%rsp)
	movq	%rax, 88(%rsp)
	movq	64(%rsp), %rax
	movq	%rax, 80(%rsp)
	.p2align 4,,10
	.p2align 3
.L30:
	movq	80(%rsp), %rax
	movl	$0, 52(%rsp)
	movl	$16, %r10d
	movq	24(%rax), %rbx
	movq	(%rax), %r15
	movq	8(%rax), %r14
	movq	16(%rax), %r13
	movq	32(%rax), %r11
	movq	88(%rsp), %rax
	movq	%rbx, 24(%rsp)
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	movq	16(%rax), %rcx
	movq	24(%rax), %rdx
	movq	32(%rax), %rax
	.p2align 4,,10
	.p2align 3
.L12:
	leaq	8(%r10), %rbx
	leaq	16(%r10), %r9
	leaq	-16(%r10), %r12
	leaq	-8(%r10), %rbp
	xorl	%r8d, %r8d
	movq	%r9, 8(%rsp)
	movq	%rbx, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L9:
	movq	40(%rsp), %r9
	movsd	(%r15,%r8), %xmm5
	movsd	(%r14,%r8), %xmm4
	movq	24(%rsp), %rbx
	movapd	%xmm5, %xmm1
	movq	(%r9,%r8), %r9
	movsd	0(%r13,%r8), %xmm3
	movsd	(%rbx,%r8), %xmm2
	movapd	%xmm5, %xmm6
	movsd	(%r9,%r12), %xmm0
	mulsd	%xmm0, %xmm1
	addsd	(%rdi), %xmm1
	movsd	%xmm1, (%rdi)
	movapd	%xmm0, %xmm1
	mulsd	%xmm4, %xmm1
	addsd	(%rsi), %xmm1
	movsd	%xmm1, (%rsi)
	movapd	%xmm0, %xmm1
	mulsd	%xmm3, %xmm1
	addsd	(%rcx), %xmm1
	movsd	%xmm1, (%rcx)
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	(%rdx), %xmm1
	movsd	%xmm1, (%rdx)
	movsd	(%r11,%r8), %xmm1
	addq	$8, %r8
	mulsd	%xmm1, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movsd	(%r9,%rbp), %xmm0
	mulsd	%xmm0, %xmm6
	addsd	8(%rdi), %xmm6
	movsd	%xmm6, 8(%rdi)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	8(%rsi), %xmm6
	movsd	%xmm6, 8(%rsi)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	8(%rcx), %xmm6
	movsd	%xmm6, 8(%rcx)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	8(%rdx), %xmm6
	movsd	%xmm6, 8(%rdx)
	movapd	%xmm5, %xmm6
	addsd	8(%rax), %xmm0
	movsd	%xmm0, 8(%rax)
	movsd	(%r9,%r10), %xmm0
	mulsd	%xmm0, %xmm6
	addsd	16(%rdi), %xmm6
	movsd	%xmm6, 16(%rdi)
	movapd	%xmm4, %xmm6
	movq	16(%rsp), %rbx
	mulsd	%xmm0, %xmm6
	addsd	16(%rsi), %xmm6
	movsd	%xmm6, 16(%rsi)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	16(%rcx), %xmm6
	movsd	%xmm6, 16(%rcx)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	16(%rdx), %xmm6
	movsd	%xmm6, 16(%rdx)
	movapd	%xmm5, %xmm6
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 16(%rax)
	movsd	(%r9,%rbx), %xmm0
	movq	8(%rsp), %rbx
	mulsd	%xmm0, %xmm6
	addsd	24(%rdi), %xmm6
	movsd	%xmm6, 24(%rdi)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	24(%rsi), %xmm6
	movsd	%xmm6, 24(%rsi)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	24(%rcx), %xmm6
	movsd	%xmm6, 24(%rcx)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	24(%rdx), %xmm6
	movsd	%xmm6, 24(%rdx)
	addsd	24(%rax), %xmm0
	movsd	%xmm0, 24(%rax)
	movsd	(%r9,%rbx), %xmm0
	mulsd	%xmm0, %xmm5
	mulsd	%xmm0, %xmm4
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	addsd	32(%rdi), %xmm5
	mulsd	%xmm1, %xmm0
	movsd	%xmm5, 32(%rdi)
	addsd	32(%rsi), %xmm4
	movsd	%xmm4, 32(%rsi)
	addsd	32(%rcx), %xmm3
	movsd	%xmm3, 32(%rcx)
	addsd	32(%rdx), %xmm2
	movsd	%xmm2, 32(%rdx)
	addsd	32(%rax), %xmm0
	movsd	%xmm0, 32(%rax)
	cmpq	%r8, 32(%rsp)
	jne	.L9
	addl	$5, 52(%rsp)
	addq	$40, %rdi
	addq	$40, %rsi
	movl	52(%rsp), %ebx
	addq	$40, %rcx
	addq	$40, %rdx
	addq	$40, %rax
	addq	$40, %r10
	cmpl	72(%rsp), %ebx
	jl	.L12
	addl	$5, 76(%rsp)
	addq	$40, 88(%rsp)
	movl	76(%rsp), %eax
	addq	$40, 80(%rsp)
	cmpl	72(%rsp), %eax
	jl	.L30
	movq	40(%rsp), %r15
.L11:
	leaq	128(%rsp), %rsi
	xorl	%edi, %edi
	xorl	%r12d, %r12d
	leaq	.LC3(%rip), %rbp
	call	clock_gettime@PLT
	movq	136(%rsp), %rax
	subq	120(%rsp), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	128(%rsp), %rax
	subq	112(%rsp), %rax
	cmpl	$15, 96(%rsp)
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC5(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	jg	.L76
	movl	72(%rsp), %ebx
	movq	%r15, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L27:
	movq	56(%rsp), %rax
	movl	%r12d, %r13d
	xorl	%r15d, %r15d
	movq	(%rax,%r12,8), %r14
	.p2align 4,,10
	.p2align 3
.L26:
	movsd	(%r14,%r15,8), %xmm0
	movl	%r15d, %ecx
	movl	%r13d, %edx
	movq	%rbp, %rsi
	movl	$1, %edi
	movl	$1, %eax
	addq	$1, %r15
	call	__printf_chk@PLT
	cmpl	%r15d, %ebx
	jg	.L26
	movl	$10, %edi
	addq	$1, %r12
	call	putchar@PLT
	cmpl	%r12d, %ebx
	jg	.L27
	movq	16(%rsp), %r15
.L36:
	movq	64(%rsp), %rbp
	movq	56(%rsp), %r12
	xorl	%ebx, %ebx
	movl	72(%rsp), %r13d
	.p2align 4,,10
	.p2align 3
.L28:
	movq	0(%rbp,%rbx,8), %rdi
	call	free@PLT
	movq	(%r15,%rbx,8), %rdi
	call	free@PLT
	movq	(%r12,%rbx,8), %rdi
	addq	$1, %rbx
	call	free@PLT
	cmpl	%ebx, %r13d
	jg	.L28
.L37:
	movq	64(%rsp), %rdi
	call	free@PLT
	movq	%r15, %rdi
	call	free@PLT
	movq	56(%rsp), %rdi
	call	free@PLT
	movsd	8(%rsp), %xmm0
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	152(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L77
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L76:
	.cfi_restore_state
	movq	56(%rsp), %rbx
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movq	(%rbx), %rax
	movsd	(%rax), %xmm0
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	104(%rsp), %rdi
	movl	96(%rsp), %edx
	leaq	.LC7(%rip), %rsi
	movq	-8(%rbx,%rdi), %rax
	subl	$1, %edx
	movl	%edx, %ecx
	movsd	-8(%rax,%rdi), %xmm0
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	jmp	.L36
.L75:
	movl	72(%rsp), %eax
	movl	$3, %esi
	cltd
	idivl	%esi
	testl	%edx, %edx
	jne	.L34
	leaq	8(,%rbx,8), %r12
	xorl	%r14d, %r14d
.L19:
	movq	64(%rsp), %rax
	xorl	%r13d, %r13d
	movl	$16, %r8d
	movq	(%rax,%r14,8), %rbp
	movq	8(%rax,%r14,8), %rbx
	movq	16(%rax,%r14,8), %r11
	movq	56(%rsp), %rax
	movq	(%rax,%r14,8), %rsi
	movq	8(%rax,%r14,8), %rcx
	movq	16(%rax,%r14,8), %rdx
	.p2align 4,,10
	.p2align 3
.L22:
	leaq	-16(%r8), %r10
	leaq	-8(%r8), %r9
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L20:
	movq	(%r15,%rax), %rdi
	movsd	0(%rbp,%rax), %xmm3
	movsd	(%rbx,%rax), %xmm2
	movapd	%xmm3, %xmm1
	movapd	%xmm3, %xmm4
	movsd	(%rdi,%r10), %xmm0
	mulsd	%xmm0, %xmm1
	addsd	(%rsi), %xmm1
	movsd	%xmm1, (%rsi)
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	(%rcx), %xmm1
	movsd	%xmm1, (%rcx)
	movsd	(%r11,%rax), %xmm1
	addq	$8, %rax
	cmpq	%rax, %r12
	mulsd	%xmm1, %xmm0
	addsd	(%rdx), %xmm0
	movsd	%xmm0, (%rdx)
	movsd	(%rdi,%r9), %xmm0
	mulsd	%xmm0, %xmm4
	addsd	8(%rsi), %xmm4
	movsd	%xmm4, 8(%rsi)
	movapd	%xmm2, %xmm4
	mulsd	%xmm0, %xmm4
	mulsd	%xmm1, %xmm0
	addsd	8(%rcx), %xmm4
	movsd	%xmm4, 8(%rcx)
	addsd	8(%rdx), %xmm0
	movsd	%xmm0, 8(%rdx)
	movsd	(%rdi,%r8), %xmm0
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	mulsd	%xmm1, %xmm0
	addsd	16(%rsi), %xmm3
	movsd	%xmm3, 16(%rsi)
	addsd	16(%rcx), %xmm2
	movsd	%xmm2, 16(%rcx)
	addsd	16(%rdx), %xmm0
	movsd	%xmm0, 16(%rdx)
	jne	.L20
	addl	$3, %r13d
	addq	$24, %rsi
	addq	$24, %rcx
	addq	$24, %rdx
	addq	$24, %r8
	cmpl	72(%rsp), %r13d
	jl	.L22
	addq	$3, %r14
	cmpl	%r14d, 72(%rsp)
	jg	.L19
	jmp	.L11
.L3:
	leaq	112(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	testl	%ebp, %ebp
	je	.L7
	movq	96(%rsp), %rax
	testb	$3, %al
	movl	%eax, %ecx
	je	.L7
	movl	72(%rsp), %eax
	movl	$3, %esi
	cltd
	idivl	%esi
	testl	%edx, %edx
	je	.L7
.L34:
	cmpl	$0, 96(%rsp)
	jle	.L7
	leal	-1(%rcx), %eax
	movq	64(%rsp), %r10
	movq	56(%rsp), %r11
	xorl	%r9d, %r9d
	leaq	8(,%rax,8), %rsi
.L18:
	movq	(%r11,%r9), %r8
	movq	(%r10,%r9), %rdi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L25:
	movsd	(%r8,%rcx), %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L23:
	movq	(%r15,%rax), %rdx
	movsd	(%rdx,%rcx), %xmm0
	mulsd	(%rdi,%rax), %xmm0
	addq	$8, %rax
	cmpq	%rax, %rsi
	addsd	%xmm0, %xmm1
	jne	.L23
	movsd	%xmm1, (%r8,%rcx)
	addq	$8, %rcx
	cmpq	%rsi, %rcx
	jne	.L25
	addq	$8, %r9
	cmpq	%rsi, %r9
	jne	.L18
	jmp	.L11
.L7:
	leaq	128(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	136(%rsp), %rax
	subq	120(%rsp), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	128(%rsp), %rax
	subq	112(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC5(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	jmp	.L37
.L77:
	call	__stack_chk_fail@PLT
.L73:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC5:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
