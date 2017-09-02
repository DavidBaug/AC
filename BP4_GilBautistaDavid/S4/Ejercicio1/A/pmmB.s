	.file	"pmmB.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d "
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	printMatriz
	.type	printMatriz, @function
printMatriz:
.LFB60:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L11
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leal	-1(%rdi), %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbp
	addq	$1, %r12
	leaq	(%rsi,%r12,8), %r13
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	salq	$2, %r12
	.p2align 4,,10
	.p2align 3
.L5:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L4:
	movq	0(%rbp), %rax
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	(%rax,%rbx), %edx
	xorl	%eax, %eax
	addq	$4, %rbx
	call	__printf_chk
	cmpq	%rbx, %r12
	jne	.L4
	movl	$10, %edi
	addq	$8, %rbp
	call	putchar
	cmpq	%r13, %rbp
	jne	.L5
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 8
	ret
.L11:
	rep ret
	.cfi_endproc
.LFE60:
	.size	printMatriz, .-printMatriz
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"ERROR: falta numero de filas y columnas\n"
	.section	.rodata.str1.1
.LC3:
	.string	"M1:"
.LC4:
	.string	"M2:"
.LC5:
	.string	"Sol:"
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Tiempo = %11.9f\t Primera = %d\t Ultima=%d\n"
	.section	.text.unlikely
.LCOLDB8:
	.section	.text.startup,"ax",@progbits
.LHOTB8:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB61:
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
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L41
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	%rax, 16(%rsp)
	movl	16(%rsp), %r13d
	movl	%eax, %r15d
	leaq	0(,%r13,8), %rbx
	movq	%rbx, %rdi
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	malloc
	movq	%rax, %r14
	movq	16(%rsp), %rax
	testl	%eax, %eax
	je	.L14
	subl	$1, %eax
	salq	$2, %r13
	xorl	%ebx, %ebx
	movl	%eax, 28(%rsp)
	leaq	8(,%rax,8), %rax
	movq	%rax, 8(%rsp)
.L15:
	movq	%r13, %rdi
	call	malloc
	movq	%r13, %rdi
	movq	%rax, 0(%rbp,%rbx)
	call	malloc
	movq	%r13, %rdi
	movq	%rax, (%r12,%rbx)
	call	malloc
	movq	%rax, (%r14,%rbx)
	addq	$8, %rbx
	cmpq	%rbx, 8(%rsp)
	jne	.L15
	xorl	%edi, %edi
.L18:
	movq	0(%rbp,%rdi,8), %rsi
	movq	(%r12,%rdi,8), %rcx
	xorl	%eax, %eax
	movq	(%r14,%rdi,8), %rdx
	.p2align 4,,10
	.p2align 3
.L17:
	movl	$0, (%rsi,%rax,4)
	movl	$2, (%rcx,%rax,4)
	movl	$1, (%rdx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r15d
	ja	.L17
	addq	$1, %rdi
	cmpl	%edi, %r15d
	ja	.L18
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	call	clock_gettime
.L29:
	movq	0(%rbp,%rbx,8), %rdi
	movq	(%r12,%rbx,8), %r11
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L24:
	movl	(%rdi,%rsi,4), %ecx
	leaq	0(,%rsi,4), %r10
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L21:
	movq	(%r14,%rax,8), %rdx
	movl	(%rdx,%r10), %edx
	imull	(%r11,%rax,4), %edx
	addq	$1, %rax
	addl	%edx, %ecx
	cmpl	%eax, %r15d
	movl	%ecx, (%rdi,%rsi,4)
	ja	.L21
	addq	$1, %rsi
	cmpl	%esi, %r15d
	ja	.L24
	addq	$1, %rbx
	cmpl	%ebx, %r15d
	ja	.L29
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	cmpl	$14, 16(%rsp)
	jbe	.L20
	movl	28(%rsp), %eax
	pxor	%xmm0, %xmm0
	movl	$.LC7, %esi
	movl	$1, %edi
	movq	0(%rbp,%rax,8), %rdx
	movl	(%rdx,%rax,4), %ecx
	movq	56(%rsp), %rax
	subq	40(%rsp), %rax
	movq	0(%rbp), %rdx
	movl	(%rdx), %edx
	cvtsi2sdq	%rax, %xmm0
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC6(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk
.L26:
	movl	28(%rsp), %eax
	xorl	%ebx, %ebx
	leaq	8(,%rax,8), %r13
.L28:
	movq	0(%rbp,%rbx), %rdi
	call	free
	movq	(%r12,%rbx), %rdi
	call	free
	movq	(%r14,%rbx), %rdi
	addq	$8, %rbx
	call	free
	cmpq	%rbx, %r13
	jne	.L28
.L27:
	movq	%rbp, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	movq	%r14, %rdi
	call	free
	xorl	%eax, %eax
	movq	72(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L42
	addq	$88, %rsp
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
.L14:
	.cfi_restore_state
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
.L20:
	movl	$.LC3, %edi
	call	puts
	movq	16(%rsp), %rbx
	movq	%r12, %rsi
	movl	%ebx, %edi
	call	printMatriz
	movl	$.LC4, %edi
	call	puts
	movq	%r14, %rsi
	movl	%ebx, %edi
	call	printMatriz
	movl	$.LC5, %edi
	call	puts
	movl	%ebx, %edi
	movq	%rbp, %rsi
	call	printMatriz
	movq	%rbx, %rax
	leal	-1(%rbx), %ebx
	testl	%eax, %eax
	movl	%ebx, 28(%rsp)
	jne	.L26
	jmp	.L27
.L41:
	movq	stderr(%rip), %rcx
	movl	$.LC2, %edi
	movl	$40, %edx
	movl	$1, %esi
	call	fwrite
	movl	$1, %edi
	call	exit
.L42:
	call	__stack_chk_fail
	.cfi_endproc
.LFE61:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE8:
	.section	.text.startup
.LHOTE8:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC6:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
