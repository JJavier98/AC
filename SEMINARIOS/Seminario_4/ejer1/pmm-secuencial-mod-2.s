	.file	"pmm-secuencial-mod-2.c"
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
	subq	$200, %rsp
	.cfi_def_cfa_offset 256
	movq	%fs:40, %rax
	movq	%rax, 184(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L70
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, %rbx
	movq	%rax, 128(%rsp)
	movl	%eax, 96(%rsp)
	cltq
	movl	%ebx, %ebp
	leaq	0(,%rax,8), %r13
	movq	%r13, %rdi
	movq	%r13, 136(%rsp)
	call	malloc@PLT
	movq	%r13, %rdi
	movq	%rax, 88(%rsp)
	call	malloc@PLT
	movq	%r13, %rdi
	movq	%rax, 40(%rsp)
	call	malloc@PLT
	xorl	%edi, %edi
	movq	%rax, %r14
	movq	%rax, 104(%rsp)
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
	xorl	%ebx, %ebx
	movl	%ebp, 8(%rsp)
	leaq	8(,%rax,8), %r15
	movl	%eax, 16(%rsp)
	movq	%r15, %r12
	movq	%r14, %r15
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%r13, %rdi
	movsd	%xmm0, (%rsp)
	call	malloc@PLT
	movq	%rax, %r14
	movq	88(%rsp), %rax
	movq	%r13, %rdi
	movq	%r14, (%rax,%rbx)
	call	malloc@PLT
	movq	%rax, %rbp
	movq	40(%rsp), %rax
	movq	%r13, %rdi
	movq	%rbp, (%rax,%rbx)
	call	malloc@PLT
	movsd	(%rsp), %xmm0
	movq	%rax, (%r15,%rbx)
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L4:
	movsd	%xmm0, 0(%rbp,%rdx)
	movq	$0x000000000, (%rax,%rdx)
	movsd	%xmm0, (%r14,%rdx)
	addq	$8, %rdx
	cmpq	%rdx, %r12
	jne	.L4
	addq	$8, %rbx
	cmpq	%r12, %rbx
	jne	.L5
	movl	8(%rsp), %ebp
	leaq	144(%rsp), %rsi
	xorl	%edi, %edi
	movl	16(%rsp), %r12d
	call	clock_gettime@PLT
	testl	%ebp, %ebp
	jne	.L28
	movq	104(%rsp), %rax
	movl	$0, 100(%rsp)
	movq	%rax, 120(%rsp)
	movq	88(%rsp), %rax
	movq	%rax, 112(%rsp)
	.p2align 4,,10
	.p2align 3
.L29:
	movq	112(%rsp), %rax
	movl	$0, 32(%rsp)
	movl	$16, %r15d
	movq	(%rax), %rdi
	movq	%rdi, 48(%rsp)
	movq	8(%rax), %rdi
	movq	%rdi, 56(%rsp)
	movq	16(%rax), %rdi
	movq	%rdi, 64(%rsp)
	movq	24(%rax), %rdi
	movq	32(%rax), %rax
	movq	%rdi, 72(%rsp)
	movq	%rax, 80(%rsp)
	movq	120(%rsp), %rax
	movq	(%rax), %r12
	movq	8(%rax), %rcx
	movq	16(%rax), %rbp
	movq	24(%rax), %rdx
	movq	32(%rax), %rax
	.p2align 4,,10
	.p2align 3
.L12:
	leaq	8(%r15), %rdi
	leaq	-8(%r15), %r13
	movq	48(%rsp), %r11
	movq	40(%rsp), %r10
	movq	56(%rsp), %r9
	leaq	-16(%r15), %r14
	movq	%rdi, (%rsp)
	leaq	16(%r15), %rdi
	movq	64(%rsp), %r8
	movq	80(%rsp), %rsi
	movl	$0, 24(%rsp)
	movq	%rdi, 8(%rsp)
	movq	72(%rsp), %rdi
	movq	%r13, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L9:
	movq	(%r10), %rbx
	movsd	(%r11), %xmm5
	movsd	(%r9), %xmm4
	movq	16(%rsp), %r13
	movapd	%xmm5, %xmm1
	addq	$40, %r11
	movsd	(%rbx,%r14), %xmm0
	addq	$40, %r10
	movsd	(%r8), %xmm3
	addq	$40, %r9
	mulsd	%xmm0, %xmm1
	movapd	%xmm5, %xmm6
	movsd	(%rdi), %xmm2
	addq	$40, %r8
	addq	$40, %rdi
	addq	$40, %rsi
	addsd	(%r12), %xmm1
	movsd	%xmm1, (%r12)
	movapd	%xmm0, %xmm1
	mulsd	%xmm4, %xmm1
	addsd	(%rcx), %xmm1
	movsd	%xmm1, (%rcx)
	movapd	%xmm0, %xmm1
	mulsd	%xmm3, %xmm1
	addsd	0(%rbp), %xmm1
	movsd	%xmm1, 0(%rbp)
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	(%rdx), %xmm1
	movsd	%xmm1, (%rdx)
	movsd	-40(%rsi), %xmm1
	mulsd	%xmm1, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movsd	(%rbx,%r13), %xmm0
	mulsd	%xmm0, %xmm6
	addsd	8(%r12), %xmm6
	movsd	%xmm6, 8(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	8(%rcx), %xmm6
	movsd	%xmm6, 8(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	8(%rbp), %xmm6
	movsd	%xmm6, 8(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	8(%rdx), %xmm6
	movsd	%xmm6, 8(%rdx)
	movapd	%xmm5, %xmm6
	addsd	8(%rax), %xmm0
	movsd	%xmm0, 8(%rax)
	movsd	(%rbx,%r15), %xmm0
	mulsd	%xmm0, %xmm6
	addsd	16(%r12), %xmm6
	movsd	%xmm6, 16(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	16(%rcx), %xmm6
	movq	(%rsp), %r13
	movsd	%xmm6, 16(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	16(%rbp), %xmm6
	movsd	%xmm6, 16(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	16(%rdx), %xmm6
	movsd	%xmm6, 16(%rdx)
	movapd	%xmm5, %xmm6
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 16(%rax)
	movsd	(%rbx,%r13), %xmm0
	movq	8(%rsp), %r13
	mulsd	%xmm0, %xmm6
	addsd	24(%r12), %xmm6
	movsd	%xmm6, 24(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	24(%rcx), %xmm6
	movsd	%xmm6, 24(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	24(%rbp), %xmm6
	movsd	%xmm6, 24(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	24(%rdx), %xmm6
	movsd	%xmm6, 24(%rdx)
	addsd	24(%rax), %xmm0
	movsd	%xmm0, 24(%rax)
	movsd	(%rbx,%r13), %xmm0
	mulsd	%xmm0, %xmm5
	mulsd	%xmm0, %xmm4
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	addsd	32(%r12), %xmm5
	mulsd	%xmm1, %xmm0
	movsd	%xmm5, 32(%r12)
	addsd	32(%rcx), %xmm4
	movsd	%xmm4, 32(%rcx)
	addsd	32(%rbp), %xmm3
	movsd	%xmm3, 32(%rbp)
	addsd	32(%rdx), %xmm2
	movsd	%xmm2, 32(%rdx)
	addsd	32(%rax), %xmm0
	movsd	%xmm0, 32(%rax)
	movsd	-32(%r11), %xmm5
	movq	-32(%r10), %rbx
	movsd	-32(%r9), %xmm4
	movapd	%xmm5, %xmm1
	movsd	-32(%r8), %xmm3
	movsd	(%rbx,%r14), %xmm0
	movq	16(%rsp), %r13
	movsd	-32(%rdi), %xmm2
	mulsd	%xmm0, %xmm1
	movapd	%xmm5, %xmm6
	addsd	(%r12), %xmm1
	movsd	%xmm1, (%r12)
	movapd	%xmm0, %xmm1
	mulsd	%xmm4, %xmm1
	addsd	(%rcx), %xmm1
	movsd	%xmm1, (%rcx)
	movapd	%xmm0, %xmm1
	mulsd	%xmm3, %xmm1
	addsd	0(%rbp), %xmm1
	movsd	%xmm1, 0(%rbp)
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	(%rdx), %xmm1
	movsd	%xmm1, (%rdx)
	movsd	-32(%rsi), %xmm1
	mulsd	%xmm1, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movsd	(%rbx,%r13), %xmm0
	mulsd	%xmm0, %xmm6
	addsd	8(%r12), %xmm6
	movsd	%xmm6, 8(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	8(%rcx), %xmm6
	movsd	%xmm6, 8(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	8(%rbp), %xmm6
	movsd	%xmm6, 8(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	8(%rdx), %xmm6
	movsd	%xmm6, 8(%rdx)
	movapd	%xmm5, %xmm6
	addsd	8(%rax), %xmm0
	movsd	%xmm0, 8(%rax)
	movsd	(%rbx,%r15), %xmm0
	mulsd	%xmm0, %xmm6
	addsd	16(%r12), %xmm6
	movsd	%xmm6, 16(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	16(%rcx), %xmm6
	movq	(%rsp), %r13
	movsd	%xmm6, 16(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	16(%rbp), %xmm6
	movsd	%xmm6, 16(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	16(%rdx), %xmm6
	movsd	%xmm6, 16(%rdx)
	movapd	%xmm5, %xmm6
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 16(%rax)
	movsd	(%rbx,%r13), %xmm0
	movq	8(%rsp), %r13
	mulsd	%xmm0, %xmm6
	addsd	24(%r12), %xmm6
	movsd	%xmm6, 24(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	24(%rcx), %xmm6
	movsd	%xmm6, 24(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	24(%rbp), %xmm6
	movsd	%xmm6, 24(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	24(%rdx), %xmm6
	movsd	%xmm6, 24(%rdx)
	addsd	24(%rax), %xmm0
	movsd	%xmm0, 24(%rax)
	movsd	(%rbx,%r13), %xmm0
	mulsd	%xmm0, %xmm5
	mulsd	%xmm0, %xmm4
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	addsd	32(%r12), %xmm5
	mulsd	%xmm1, %xmm0
	movsd	%xmm5, 32(%r12)
	addsd	32(%rcx), %xmm4
	movsd	%xmm4, 32(%rcx)
	addsd	32(%rbp), %xmm3
	movsd	%xmm3, 32(%rbp)
	addsd	32(%rdx), %xmm2
	movsd	%xmm2, 32(%rdx)
	addsd	32(%rax), %xmm0
	movsd	%xmm0, 32(%rax)
	movsd	-24(%r11), %xmm5
	movq	-24(%r10), %rbx
	movsd	-24(%r9), %xmm4
	movapd	%xmm5, %xmm1
	movsd	-24(%r8), %xmm3
	movsd	(%rbx,%r14), %xmm0
	movq	16(%rsp), %r13
	movsd	-24(%rdi), %xmm2
	mulsd	%xmm0, %xmm1
	movapd	%xmm5, %xmm6
	addsd	(%r12), %xmm1
	movsd	%xmm1, (%r12)
	movapd	%xmm0, %xmm1
	mulsd	%xmm4, %xmm1
	addsd	(%rcx), %xmm1
	movsd	%xmm1, (%rcx)
	movapd	%xmm0, %xmm1
	mulsd	%xmm3, %xmm1
	addsd	0(%rbp), %xmm1
	movsd	%xmm1, 0(%rbp)
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	(%rdx), %xmm1
	movsd	%xmm1, (%rdx)
	movsd	-24(%rsi), %xmm1
	mulsd	%xmm1, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movsd	(%rbx,%r13), %xmm0
	mulsd	%xmm0, %xmm6
	addsd	8(%r12), %xmm6
	movsd	%xmm6, 8(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	8(%rcx), %xmm6
	movsd	%xmm6, 8(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	8(%rbp), %xmm6
	movsd	%xmm6, 8(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	8(%rdx), %xmm6
	movsd	%xmm6, 8(%rdx)
	movapd	%xmm5, %xmm6
	addsd	8(%rax), %xmm0
	movsd	%xmm0, 8(%rax)
	movsd	(%rbx,%r15), %xmm0
	mulsd	%xmm0, %xmm6
	addsd	16(%r12), %xmm6
	movsd	%xmm6, 16(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	16(%rcx), %xmm6
	movq	(%rsp), %r13
	movsd	%xmm6, 16(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	16(%rbp), %xmm6
	movsd	%xmm6, 16(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	16(%rdx), %xmm6
	movsd	%xmm6, 16(%rdx)
	movapd	%xmm5, %xmm6
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 16(%rax)
	movsd	(%rbx,%r13), %xmm0
	movq	8(%rsp), %r13
	mulsd	%xmm0, %xmm6
	addsd	24(%r12), %xmm6
	movsd	%xmm6, 24(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	24(%rcx), %xmm6
	movsd	%xmm6, 24(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	24(%rbp), %xmm6
	movsd	%xmm6, 24(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	24(%rdx), %xmm6
	movsd	%xmm6, 24(%rdx)
	addsd	24(%rax), %xmm0
	movsd	%xmm0, 24(%rax)
	movsd	(%rbx,%r13), %xmm0
	mulsd	%xmm0, %xmm5
	mulsd	%xmm0, %xmm4
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	addsd	32(%r12), %xmm5
	mulsd	%xmm1, %xmm0
	movsd	%xmm5, 32(%r12)
	addsd	32(%rcx), %xmm4
	movsd	%xmm4, 32(%rcx)
	addsd	32(%rbp), %xmm3
	movsd	%xmm3, 32(%rbp)
	addsd	32(%rdx), %xmm2
	movsd	%xmm2, 32(%rdx)
	addsd	32(%rax), %xmm0
	movsd	%xmm0, 32(%rax)
	movsd	-16(%r11), %xmm5
	movq	-16(%r10), %rbx
	movsd	-16(%r9), %xmm4
	movapd	%xmm5, %xmm1
	movsd	-16(%r8), %xmm3
	movsd	(%rbx,%r14), %xmm0
	movq	16(%rsp), %r13
	movsd	-16(%rdi), %xmm2
	mulsd	%xmm0, %xmm1
	movapd	%xmm5, %xmm6
	addsd	(%r12), %xmm1
	movsd	%xmm1, (%r12)
	movapd	%xmm0, %xmm1
	mulsd	%xmm4, %xmm1
	addsd	(%rcx), %xmm1
	movsd	%xmm1, (%rcx)
	movapd	%xmm0, %xmm1
	mulsd	%xmm3, %xmm1
	addsd	0(%rbp), %xmm1
	movsd	%xmm1, 0(%rbp)
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	(%rdx), %xmm1
	movsd	%xmm1, (%rdx)
	movsd	-16(%rsi), %xmm1
	mulsd	%xmm1, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movsd	(%rbx,%r13), %xmm0
	mulsd	%xmm0, %xmm6
	addsd	8(%r12), %xmm6
	movsd	%xmm6, 8(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	8(%rcx), %xmm6
	movsd	%xmm6, 8(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	8(%rbp), %xmm6
	movsd	%xmm6, 8(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	8(%rdx), %xmm6
	movsd	%xmm6, 8(%rdx)
	movapd	%xmm5, %xmm6
	addsd	8(%rax), %xmm0
	movsd	%xmm0, 8(%rax)
	movsd	(%rbx,%r15), %xmm0
	mulsd	%xmm0, %xmm6
	addsd	16(%r12), %xmm6
	movsd	%xmm6, 16(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	16(%rcx), %xmm6
	movq	(%rsp), %r13
	movsd	%xmm6, 16(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	16(%rbp), %xmm6
	movsd	%xmm6, 16(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	16(%rdx), %xmm6
	movsd	%xmm6, 16(%rdx)
	movapd	%xmm5, %xmm6
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 16(%rax)
	movsd	(%rbx,%r13), %xmm0
	movq	8(%rsp), %r13
	mulsd	%xmm0, %xmm6
	addsd	24(%r12), %xmm6
	movsd	%xmm6, 24(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	24(%rcx), %xmm6
	movsd	%xmm6, 24(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	24(%rbp), %xmm6
	movsd	%xmm6, 24(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	24(%rdx), %xmm6
	movsd	%xmm6, 24(%rdx)
	addsd	24(%rax), %xmm0
	movsd	%xmm0, 24(%rax)
	movsd	(%rbx,%r13), %xmm0
	mulsd	%xmm0, %xmm5
	mulsd	%xmm0, %xmm4
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	addsd	32(%r12), %xmm5
	mulsd	%xmm1, %xmm0
	movsd	%xmm5, 32(%r12)
	addsd	32(%rcx), %xmm4
	movsd	%xmm4, 32(%rcx)
	addsd	32(%rbp), %xmm3
	movsd	%xmm3, 32(%rbp)
	addsd	32(%rdx), %xmm2
	movsd	%xmm2, 32(%rdx)
	addsd	32(%rax), %xmm0
	movsd	%xmm0, 32(%rax)
	movsd	-8(%r11), %xmm5
	movq	-8(%r10), %rbx
	movsd	-8(%r9), %xmm4
	movapd	%xmm5, %xmm1
	movsd	-8(%r8), %xmm3
	movsd	(%rbx,%r14), %xmm0
	movq	16(%rsp), %r13
	movsd	-8(%rdi), %xmm2
	mulsd	%xmm0, %xmm1
	movapd	%xmm5, %xmm6
	addsd	(%r12), %xmm1
	movsd	%xmm1, (%r12)
	movapd	%xmm0, %xmm1
	mulsd	%xmm4, %xmm1
	addsd	(%rcx), %xmm1
	movsd	%xmm1, (%rcx)
	movapd	%xmm0, %xmm1
	mulsd	%xmm3, %xmm1
	addsd	0(%rbp), %xmm1
	movsd	%xmm1, 0(%rbp)
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	(%rdx), %xmm1
	movsd	%xmm1, (%rdx)
	movsd	-8(%rsi), %xmm1
	mulsd	%xmm1, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movsd	(%rbx,%r13), %xmm0
	mulsd	%xmm0, %xmm6
	addsd	8(%r12), %xmm6
	movsd	%xmm6, 8(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	8(%rcx), %xmm6
	movsd	%xmm6, 8(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	8(%rbp), %xmm6
	movsd	%xmm6, 8(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	8(%rdx), %xmm6
	movsd	%xmm6, 8(%rdx)
	movapd	%xmm5, %xmm6
	addsd	8(%rax), %xmm0
	movsd	%xmm0, 8(%rax)
	movsd	(%rbx,%r15), %xmm0
	mulsd	%xmm0, %xmm6
	addsd	16(%r12), %xmm6
	movsd	%xmm6, 16(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	16(%rcx), %xmm6
	movq	(%rsp), %r13
	movsd	%xmm6, 16(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	16(%rbp), %xmm6
	movsd	%xmm6, 16(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	16(%rdx), %xmm6
	movsd	%xmm6, 16(%rdx)
	movapd	%xmm5, %xmm6
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 16(%rax)
	movsd	(%rbx,%r13), %xmm0
	movq	8(%rsp), %r13
	mulsd	%xmm0, %xmm6
	addsd	24(%r12), %xmm6
	movsd	%xmm6, 24(%r12)
	movapd	%xmm4, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	24(%rcx), %xmm6
	movsd	%xmm6, 24(%rcx)
	movapd	%xmm3, %xmm6
	mulsd	%xmm0, %xmm6
	addsd	24(%rbp), %xmm6
	movsd	%xmm6, 24(%rbp)
	movapd	%xmm2, %xmm6
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm0
	addsd	24(%rdx), %xmm6
	movsd	%xmm6, 24(%rdx)
	addsd	24(%rax), %xmm0
	movsd	%xmm0, 24(%rax)
	movsd	(%rbx,%r13), %xmm0
	mulsd	%xmm0, %xmm5
	mulsd	%xmm0, %xmm4
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	addsd	32(%r12), %xmm5
	mulsd	%xmm1, %xmm0
	movsd	%xmm5, 32(%r12)
	addsd	32(%rcx), %xmm4
	movsd	%xmm4, 32(%rcx)
	addsd	32(%rbp), %xmm3
	movsd	%xmm3, 32(%rbp)
	addsd	32(%rdx), %xmm2
	movsd	%xmm2, 32(%rdx)
	addsd	32(%rax), %xmm0
	movsd	%xmm0, 32(%rax)
	addl	$5, 24(%rsp)
	movl	24(%rsp), %ebx
	cmpl	96(%rsp), %ebx
	jl	.L9
	addl	$5, 32(%rsp)
	addq	$40, %r12
	addq	$40, %rcx
	movl	32(%rsp), %edi
	addq	$40, %rbp
	addq	$40, %rdx
	addq	$40, %rax
	addq	$40, %r15
	cmpl	96(%rsp), %edi
	jl	.L12
	addl	$5, 100(%rsp)
	addq	$40, 120(%rsp)
	movl	100(%rsp), %eax
	addq	$40, 112(%rsp)
	cmpl	96(%rsp), %eax
	jl	.L29
.L11:
	leaq	160(%rsp), %rsi
	xorl	%edi, %edi
	xorl	%r12d, %r12d
	leaq	.LC3(%rip), %rbp
	call	clock_gettime@PLT
	movq	168(%rsp), %rax
	subq	152(%rsp), %rax
	pxor	%xmm0, %xmm0
	movl	96(%rsp), %r13d
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	160(%rsp), %rax
	subq	144(%rsp), %rax
	cmpl	$15, 128(%rsp)
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC5(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsp)
	jg	.L71
	.p2align 4,,10
	.p2align 3
.L26:
	movq	104(%rsp), %rax
	movl	%r12d, %r14d
	xorl	%ebx, %ebx
	movq	(%rax,%r12,8), %r15
	.p2align 4,,10
	.p2align 3
.L25:
	movsd	(%r15,%rbx,8), %xmm0
	movl	%ebx, %ecx
	movl	%r14d, %edx
	movq	%rbp, %rsi
	movl	$1, %edi
	movl	$1, %eax
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpl	%ebx, %r13d
	jg	.L25
	movl	$10, %edi
	addq	$1, %r12
	call	putchar@PLT
	cmpl	%r12d, %r13d
	jg	.L26
.L34:
	movq	88(%rsp), %rbp
	movq	40(%rsp), %r12
	xorl	%ebx, %ebx
	movq	104(%rsp), %r13
	movl	96(%rsp), %r14d
	.p2align 4,,10
	.p2align 3
.L27:
	movq	0(%rbp,%rbx,8), %rdi
	call	free@PLT
	movq	(%r12,%rbx,8), %rdi
	call	free@PLT
	movq	0(%r13,%rbx,8), %rdi
	addq	$1, %rbx
	call	free@PLT
	cmpl	%ebx, %r14d
	jg	.L27
.L35:
	movq	88(%rsp), %rdi
	call	free@PLT
	movq	40(%rsp), %rdi
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movsd	(%rsp), %xmm0
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	184(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L72
	addq	$200, %rsp
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
.L28:
	.cfi_restore_state
	movq	128(%rsp), %rax
	testb	$3, %al
	movl	%eax, %ecx
	je	.L31
	movl	96(%rsp), %eax
	movl	$3, %esi
	xorl	%r13d, %r13d
	cltd
	idivl	%esi
	testl	%edx, %edx
	jne	.L33
	movq	40(%rsp), %r12
	movl	96(%rsp), %r14d
.L32:
	movq	88(%rsp), %rax
	xorl	%r15d, %r15d
	movl	$16, %r8d
	movq	(%rax,%r13,8), %rbp
	movq	8(%rax,%r13,8), %rbx
	movq	16(%rax,%r13,8), %r11
	movq	104(%rsp), %rax
	movq	(%rax,%r13,8), %rcx
	movq	8(%rax,%r13,8), %rdx
	movq	16(%rax,%r13,8), %rax
	.p2align 4,,10
	.p2align 3
.L21:
	leaq	-16(%r8), %r10
	leaq	-8(%r8), %r9
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L19:
	movq	(%r12,%rsi,8), %rdi
	movsd	0(%rbp,%rsi,8), %xmm3
	movsd	(%rbx,%rsi,8), %xmm2
	movapd	%xmm3, %xmm1
	movapd	%xmm3, %xmm4
	movsd	(%rdi,%r10), %xmm0
	mulsd	%xmm0, %xmm1
	addsd	(%rcx), %xmm1
	movsd	%xmm1, (%rcx)
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	(%rdx), %xmm1
	movsd	%xmm1, (%rdx)
	movsd	(%r11,%rsi,8), %xmm1
	mulsd	%xmm1, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movsd	(%rdi,%r9), %xmm0
	mulsd	%xmm0, %xmm4
	addsd	8(%rcx), %xmm4
	movsd	%xmm4, 8(%rcx)
	movapd	%xmm2, %xmm4
	mulsd	%xmm0, %xmm4
	mulsd	%xmm1, %xmm0
	addsd	8(%rdx), %xmm4
	movsd	%xmm4, 8(%rdx)
	addsd	8(%rax), %xmm0
	movsd	%xmm0, 8(%rax)
	movsd	(%rdi,%r8), %xmm0
	movq	8(%r12,%rsi,8), %rdi
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	mulsd	%xmm1, %xmm0
	addsd	16(%rcx), %xmm3
	movsd	%xmm3, 16(%rcx)
	movsd	8(%rbp,%rsi,8), %xmm3
	addsd	16(%rdx), %xmm2
	movapd	%xmm3, %xmm1
	movapd	%xmm3, %xmm4
	movsd	%xmm2, 16(%rdx)
	movsd	8(%rbx,%rsi,8), %xmm2
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 16(%rax)
	movsd	(%rdi,%r10), %xmm0
	mulsd	%xmm0, %xmm1
	addsd	(%rcx), %xmm1
	movsd	%xmm1, (%rcx)
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	(%rdx), %xmm1
	movsd	%xmm1, (%rdx)
	movsd	8(%r11,%rsi,8), %xmm1
	mulsd	%xmm1, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movsd	(%rdi,%r9), %xmm0
	mulsd	%xmm0, %xmm4
	addsd	8(%rcx), %xmm4
	movsd	%xmm4, 8(%rcx)
	movapd	%xmm2, %xmm4
	mulsd	%xmm0, %xmm4
	mulsd	%xmm1, %xmm0
	addsd	8(%rdx), %xmm4
	movsd	%xmm4, 8(%rdx)
	addsd	8(%rax), %xmm0
	movsd	%xmm0, 8(%rax)
	movsd	(%rdi,%r8), %xmm0
	movq	16(%r12,%rsi,8), %rdi
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	mulsd	%xmm1, %xmm0
	addsd	16(%rcx), %xmm3
	movsd	%xmm3, 16(%rcx)
	movsd	16(%rbp,%rsi,8), %xmm3
	addsd	16(%rdx), %xmm2
	movapd	%xmm3, %xmm1
	movapd	%xmm3, %xmm4
	movsd	%xmm2, 16(%rdx)
	movsd	16(%rbx,%rsi,8), %xmm2
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 16(%rax)
	movsd	(%rdi,%r10), %xmm0
	mulsd	%xmm0, %xmm1
	addsd	(%rcx), %xmm1
	movsd	%xmm1, (%rcx)
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	(%rdx), %xmm1
	movsd	%xmm1, (%rdx)
	movsd	16(%r11,%rsi,8), %xmm1
	addq	$3, %rsi
	cmpl	%esi, %r14d
	mulsd	%xmm1, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movsd	(%rdi,%r9), %xmm0
	mulsd	%xmm0, %xmm4
	addsd	8(%rcx), %xmm4
	movsd	%xmm4, 8(%rcx)
	movapd	%xmm2, %xmm4
	mulsd	%xmm0, %xmm4
	mulsd	%xmm1, %xmm0
	addsd	8(%rdx), %xmm4
	movsd	%xmm4, 8(%rdx)
	addsd	8(%rax), %xmm0
	movsd	%xmm0, 8(%rax)
	movsd	(%rdi,%r8), %xmm0
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	mulsd	%xmm1, %xmm0
	addsd	16(%rcx), %xmm3
	movsd	%xmm3, 16(%rcx)
	addsd	16(%rdx), %xmm2
	movsd	%xmm2, 16(%rdx)
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 16(%rax)
	jg	.L19
	addl	$3, %r15d
	addq	$24, %rcx
	addq	$24, %rdx
	addq	$24, %rax
	addq	$24, %r8
	cmpl	%r14d, %r15d
	jl	.L21
	addq	$3, %r13
	cmpl	%r13d, %r14d
	jg	.L32
	jmp	.L11
.L71:
	movq	104(%rsp), %rbx
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movq	(%rbx), %rax
	movsd	(%rax), %xmm0
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	136(%rsp), %rdi
	movl	128(%rsp), %edx
	leaq	.LC7(%rip), %rsi
	movq	-8(%rbx,%rdi), %rax
	subl	$1, %edx
	movl	%edx, %ecx
	movsd	-8(%rax,%rdi), %xmm0
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	jmp	.L34
.L31:
	movq	88(%rsp), %rax
	shrl	$2, %r12d
	movq	104(%rsp), %rdi
	movq	%rax, 56(%rsp)
	movl	%r12d, %eax
	movq	%rdi, 48(%rsp)
	movq	%rax, %rdx
	addq	$1, %rax
	salq	$5, %rdx
	salq	$5, %rax
	leaq	32(%rdi,%rdx), %rdi
	movq	%rax, 32(%rsp)
	leaq	32(%rdx), %rax
	movq	%rdi, 64(%rsp)
	movq	%rax, 72(%rsp)
	.p2align 4,,10
	.p2align 3
.L14:
	movq	56(%rsp), %rdi
	movq	72(%rsp), %r15
	xorl	%ebx, %ebx
	movq	8(%rdi), %rax
	movq	%rax, (%rsp)
	movq	16(%rdi), %rax
	movq	%rax, 8(%rsp)
	movq	24(%rdi), %rax
	movq	(%rdi), %rdi
	movq	%rax, 16(%rsp)
	movq	48(%rsp), %rax
	movq	%rdi, 24(%rsp)
	addq	%rdi, %r15
	movq	(%rax), %rsi
	movq	8(%rax), %rcx
	movq	16(%rax), %rdx
	movq	24(%rax), %rax
	.p2align 4,,10
	.p2align 3
.L17:
	movq	40(%rsp), %r11
	movq	(%rsp), %r10
	leaq	8(%rbx), %r14
	movq	8(%rsp), %r9
	movq	16(%rsp), %r8
	leaq	16(%rbx), %r13
	movq	24(%rsp), %rdi
	leaq	24(%rbx), %r12
	.p2align 4,,10
	.p2align 3
.L15:
	movq	(%r11), %rbp
	movsd	(%rdi), %xmm4
	movsd	(%r10), %xmm3
	addq	$32, %rdi
	movapd	%xmm4, %xmm1
	addq	$32, %r11
	movsd	0(%rbp,%rbx), %xmm0
	addq	$32, %r10
	movsd	(%r9), %xmm2
	addq	$32, %r8
	mulsd	%xmm0, %xmm1
	movapd	%xmm4, %xmm5
	addq	$32, %r9
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
	movsd	-32(%r8), %xmm1
	mulsd	%xmm1, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movsd	0(%rbp,%r14), %xmm0
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
	movsd	0(%rbp,%r13), %xmm0
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
	movsd	0(%rbp,%r12), %xmm0
	movq	-24(%r11), %rbp
	mulsd	%xmm0, %xmm4
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	mulsd	%xmm1, %xmm0
	addsd	24(%rsi), %xmm4
	movsd	%xmm4, 24(%rsi)
	movsd	-24(%rdi), %xmm4
	addsd	24(%rcx), %xmm3
	movapd	%xmm4, %xmm1
	movapd	%xmm4, %xmm5
	movsd	%xmm3, 24(%rcx)
	movsd	-24(%r10), %xmm3
	addsd	24(%rdx), %xmm2
	movsd	%xmm2, 24(%rdx)
	movsd	-24(%r9), %xmm2
	addsd	24(%rax), %xmm0
	movsd	%xmm0, 24(%rax)
	movsd	0(%rbp,%rbx), %xmm0
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
	movsd	-24(%r8), %xmm1
	mulsd	%xmm1, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movsd	0(%rbp,%r14), %xmm0
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
	movsd	0(%rbp,%r13), %xmm0
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
	movsd	0(%rbp,%r12), %xmm0
	movq	-16(%r11), %rbp
	mulsd	%xmm0, %xmm4
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	mulsd	%xmm1, %xmm0
	addsd	24(%rsi), %xmm4
	movsd	%xmm4, 24(%rsi)
	movsd	-16(%rdi), %xmm4
	addsd	24(%rcx), %xmm3
	movapd	%xmm4, %xmm1
	movapd	%xmm4, %xmm5
	movsd	%xmm3, 24(%rcx)
	movsd	-16(%r10), %xmm3
	addsd	24(%rdx), %xmm2
	movsd	%xmm2, 24(%rdx)
	movsd	-16(%r9), %xmm2
	addsd	24(%rax), %xmm0
	movsd	%xmm0, 24(%rax)
	movsd	0(%rbp,%rbx), %xmm0
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
	movsd	-16(%r8), %xmm1
	mulsd	%xmm1, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movsd	0(%rbp,%r14), %xmm0
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
	movsd	0(%rbp,%r13), %xmm0
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
	movsd	0(%rbp,%r12), %xmm0
	movq	-8(%r11), %rbp
	mulsd	%xmm0, %xmm4
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm2
	mulsd	%xmm1, %xmm0
	addsd	24(%rsi), %xmm4
	movsd	%xmm4, 24(%rsi)
	movsd	-8(%rdi), %xmm4
	addsd	24(%rcx), %xmm3
	movapd	%xmm4, %xmm1
	movapd	%xmm4, %xmm5
	movsd	%xmm3, 24(%rcx)
	addsd	24(%rdx), %xmm2
	movsd	%xmm2, 24(%rdx)
	addsd	24(%rax), %xmm0
	movsd	%xmm0, 24(%rax)
	movsd	0(%rbp,%rbx), %xmm0
	mulsd	%xmm0, %xmm1
	addsd	(%rsi), %xmm1
	movsd	%xmm1, (%rsi)
	movapd	%xmm0, %xmm1
	movsd	-8(%r10), %xmm3
	movsd	-8(%r9), %xmm2
	mulsd	%xmm3, %xmm1
	addsd	(%rcx), %xmm1
	movsd	%xmm1, (%rcx)
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	(%rdx), %xmm1
	movsd	%xmm1, (%rdx)
	movsd	-8(%r8), %xmm1
	cmpq	%rdi, %r15
	mulsd	%xmm1, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movsd	0(%rbp,%r14), %xmm0
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
	movsd	0(%rbp,%r13), %xmm0
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
	movsd	0(%rbp,%r12), %xmm0
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
	addq	$32, %rbx
	addq	$32, %rcx
	addq	$32, %rdx
	addq	$32, %rax
	cmpq	%rbx, 32(%rsp)
	jne	.L17
	addq	$32, 48(%rsp)
	addq	$32, 56(%rsp)
	movq	48(%rsp), %rax
	cmpq	%rax, 64(%rsp)
	jne	.L14
	jmp	.L11
.L3:
	leaq	144(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	testl	%ebp, %ebp
	je	.L7
	movq	128(%rsp), %rax
	testb	$3, %al
	movl	%eax, %ecx
	je	.L7
	movl	96(%rsp), %eax
	movl	$3, %esi
	cltd
	idivl	%esi
	testl	%edx, %edx
	je	.L7
.L33:
	cmpl	$0, 128(%rsp)
	jle	.L7
	leal	-1(%rcx), %eax
	movq	88(%rsp), %r11
	movq	40(%rsp), %r8
	movq	104(%rsp), %rbx
	xorl	%r9d, %r9d
	leaq	8(,%rax,8), %rsi
.L18:
	movq	(%rbx,%r9), %r10
	movq	(%r11,%r9), %rdi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L24:
	movsd	(%r10,%rcx), %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L22:
	movq	(%r8,%rax), %rdx
	movsd	(%rdx,%rcx), %xmm0
	mulsd	(%rdi,%rax), %xmm0
	addq	$8, %rax
	cmpq	%rax, %rsi
	addsd	%xmm0, %xmm1
	jne	.L22
	movsd	%xmm1, (%r10,%rcx)
	addq	$8, %rcx
	cmpq	%rsi, %rcx
	jne	.L24
	addq	$8, %r9
	cmpq	%rsi, %r9
	jne	.L18
	jmp	.L11
.L7:
	leaq	160(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	168(%rsp), %rax
	subq	152(%rsp), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	160(%rsp), %rax
	subq	144(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC5(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsp)
	jmp	.L35
.L70:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
.L72:
	call	__stack_chk_fail@PLT
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
