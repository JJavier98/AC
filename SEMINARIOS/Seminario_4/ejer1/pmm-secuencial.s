	.file	"pmm-secuencial.c"
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
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L30
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movslq	%eax, %rbp
	movq	%rax, %rbx
	movq	%rax, 32(%rsp)
	salq	$3, %rbp
	movl	%eax, 40(%rsp)
	movq	%rbp, %rdi
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, (%rsp)
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %r15
	call	malloc@PLT
	xorl	%edi, %edi
	movq	%rax, %r12
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	testl	%ebx, %ebx
	jle	.L3
	subl	$1, %ebx
	movsd	.LC1(%rip), %xmm0
	movl	%ebx, 44(%rsp)
	addq	$1, %rbx
	xorl	%r13d, %r13d
	leaq	0(,%rbx,8), %rsi
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rbp, %rdi
	movsd	%xmm0, 24(%rsp)
	movq	%rsi, 16(%rsp)
	call	malloc@PLT
	movq	%rax, %rcx
	movq	(%rsp), %rax
	movq	%rbp, %rdi
	movq	%rcx, 8(%rsp)
	movq	%rcx, (%rax,%r13)
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %r14
	movq	%rax, (%r15,%r13)
	call	malloc@PLT
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rcx
	xorl	%edx, %edx
	movsd	24(%rsp), %xmm0
	movq	%rax, (%r12,%r13)
	.p2align 4,,10
	.p2align 3
.L4:
	movsd	%xmm0, (%r14,%rdx)
	movq	$0x000000000, (%rax,%rdx)
	movsd	%xmm0, (%rcx,%rdx)
	addq	$8, %rdx
	cmpq	%rdx, %rsi
	jne	.L4
	addq	$8, %r13
	cmpq	%rsi, %r13
	jne	.L5
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L15:
	movq	(%rsp), %rax
	movq	(%r12,%r9), %rdi
	xorl	%ecx, %ecx
	movq	(%rax,%r9), %rsi
	.p2align 4,,10
	.p2align 3
.L10:
	movsd	(%rdi,%rcx), %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7:
	movq	(%r15,%rax), %rdx
	movsd	(%rdx,%rcx), %xmm0
	mulsd	(%rsi,%rax), %xmm0
	addq	$8, %rax
	cmpq	%rax, %r13
	addsd	%xmm0, %xmm1
	jne	.L7
	movsd	%xmm1, (%rdi,%rcx)
	addq	$8, %rcx
	cmpq	%rcx, %r13
	jne	.L10
	addq	$8, %r9
	cmpq	%r9, %r13
	jne	.L15
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	72(%rsp), %rax
	subq	56(%rsp), %rax
	pxor	%xmm0, %xmm0
	movq	$0, 8(%rsp)
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
	cmpl	$15, 32(%rsp)
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC5(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 16(%rsp)
	jg	.L31
	.p2align 4,,10
	.p2align 3
.L12:
	movq	8(%rsp), %rax
	xorl	%r14d, %r14d
	movq	(%r12,%rax,8), %r13
	movl	%eax, %ebp
	.p2align 4,,10
	.p2align 3
.L11:
	movsd	0(%r13,%r14,8), %xmm0
	leaq	.LC3(%rip), %rsi
	movl	%r14d, %ecx
	movl	%ebp, %edx
	movl	$1, %edi
	movl	$1, %eax
	addq	$1, %r14
	call	__printf_chk@PLT
	cmpq	%r14, %rbx
	jne	.L11
	movl	$10, %edi
	call	putchar@PLT
	addq	$1, 8(%rsp)
	movq	8(%rsp), %rax
	cmpq	%rbx, %rax
	jne	.L12
.L16:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L13:
	movq	(%rsp), %rax
	movq	(%rax,%rbx,8), %rdi
	call	free@PLT
	movq	(%r15,%rbx,8), %rdi
	call	free@PLT
	movq	(%r12,%rbx,8), %rdi
	addq	$1, %rbx
	call	free@PLT
	cmpl	%ebx, 40(%rsp)
	jg	.L13
.L14:
	movq	(%rsp), %rdi
	call	free@PLT
	movq	%r15, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	movsd	16(%rsp), %xmm0
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	88(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L32
	addq	$104, %rsp
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
.L31:
	.cfi_restore_state
	movq	(%r12), %rax
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movsd	(%rax), %xmm0
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	-8(%r12,%rbp), %rax
	movl	44(%rsp), %edx
	leaq	.LC7(%rip), %rsi
	movl	$1, %edi
	movsd	-8(%rax,%rbp), %xmm0
	movl	%edx, %ecx
	movl	$1, %eax
	call	__printf_chk@PLT
	jmp	.L16
.L3:
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	72(%rsp), %rax
	subq	56(%rsp), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC5(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 16(%rsp)
	jmp	.L14
.L32:
	call	__stack_chk_fail@PLT
.L30:
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
