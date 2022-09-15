.section .rodata
.intout: .string "%ld "
.strout: .string "%s "
.errout: .string "Wrong number of arguments"
.section .data
.globl main
.section .text
main:
	pushq   %rbp
	movq    %rsp, %rbp
	subq	$1,%rdi
	cmpq	$0,%rdi
	jne	ABORT
	cmpq	$0,%rdi
	jz	SKIP_ARGS
	movq	%rdi,%rcx
	addq $0, %rsi
PARSE_ARGV:
	pushq %rcx
	pushq %rsi
	movq	(%rsi),%rdi
	movq	$0,%rsi
	movq	$10,%rdx
	call	strtol
	popq %rsi
	popq %rcx
	pushq %rax
	subq $8, %rsi
	loop PARSE_ARGV
SKIP_ARGS:
	call	_main
	jmp	END
ABORT:
	movq	$.errout, %rdi
	call puts
END:
	movq    %rax, %rdi
	call    exit
_main:
	pushq   %rbp
	movq    %rsp, %rbp
	subq $40, %rsp
	pushq	$0 /* Stack padding for 16-byte alignment */
	movq	$1, %rax
	movq	%rax, -8(%rbp)
	movq	$2, %rax
	movq	%rax, -24(%rbp)
	movq	$40, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	addq	%rax, (%rsp)
	popq	%rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rsi
	movq	$.intout, %rdi
	movq	$0, %rax
	call	printf
	movq	-16(%rbp), %rsi
	movq	$.intout, %rdi
	movq	$0, %rax
	call	printf
	movq	$0x0A, %rdi
	call	putchar
	movq	-24(%rbp), %rsi
	movq	$.intout, %rdi
	movq	$0, %rax
	call	printf
	movq	$0x0A, %rdi
	call	putchar
	movq	$38, %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	addq	%rax, (%rsp)
	popq	%rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rsi
	movq	$.intout, %rdi
	movq	$0, %rax
	call	printf
	movq	-40(%rbp), %rsi
	movq	$.intout, %rdi
	movq	$0, %rax
	call	printf
	movq	$0x0A, %rdi
	call	putchar
	movq	-24(%rbp), %rsi
	movq	$.intout, %rdi
	movq	$0, %rax
	call	printf
	movq	$0x0A, %rdi
	call	putchar
	movq	-16(%rbp), %rsi
	movq	$.intout, %rdi
	movq	$0, %rax
	call	printf
	movq	$0x0A, %rdi
	call	putchar
	movq	%rbp, %rsp
	movq	$0, %rax
	popq	%rbp
	ret
