	.file	"project.c"
	.text
	.globl	power
	.type	power, @function
power:
	pushl	%ebp
	movl	%esp, %ebp


	movl 12(%ebp), %ebx		#ebx = i
	test %ebx, %ebx			#if i == 0, jump to done
	je done
	
	#Could try adding and shifting to make more efficient
	movl 8(%ebp), edx		#edx = x
	imull %edx, %edx		#x = x*x
	decl %ebx				#i = i-1
	pushl %ebx				
	pushl %edx
	call power				#power(x,i)
	
	done:
	popl 	%edx
	popl 	%ebx
	popl	%ebp
	ret
	.size	power, .-power
	.globl	fillarray
	.type	fillarray, @function
fillarray:
	pushl	%ebp
	movl	%esp, %ebp
	
	xor 	%ecx, %ecx		#ecx = i = 0
	movl	8(%ebp), %edx		#edx = x
	movl	12(%ebp), %edi		#edi = a
	movl	16(%ebp), %ebx		#ebx = n
	
	
FL1:
	cmpl	%eax, %ecx			#if i == n, return
	je		F1End
	
	pushl	%ecx
	pushl 	%edx
	call power		#eax = power(x,i)
	popl	%edx
	popl	%ecx
	
	movl	%eax, (%edi)	a[i] = eax
	incl	%ecx
	jmp FL1
	
	
	

	# INSERT YOUR CODE HERE
	# USE REGISTERS FOR LOCAL VARIABLES
F1End:
	popl	%ebp
	ret
	.size	fillarray, .-fillarray
	.globl	fillarray2
	.type	fillarray2, @function
fillarray2:
	pushl	%ebp
	movl	%esp, %ebp

	# INSERT YOUR CODE HERE
	# USE REGISTERS FOR LOCAL VARIABLES
	
	popl	%ebp
	ret
	.size	fillarray2, .-fillarray2
	.globl	compare
	.type	compare, @function
compare:
	pushl	%ebp
	movl	%esp, %ebp
	
	xor 	%eax, %eax		#eax = 0
	movl	8(%ebp), %edx	#edx = array1
	movl	12(%ebp), %ebx	#ebx = array2
	movl	16(%ebp), %ecx	#ecx = n
	
CLoop:
	test	%ecx, %ecx		#if n == 0, return 1 (reached end)
	je		CLT
	cmpl	(%edx), (%ebx)	#if elements not equal, return 0
	jne		CEnd
	
	addl	$4, %edx	#gets next element
	addl	$4, %ebx	#gets next element
	decl 	%ecx		#n--
	jmp 	CLoop

	
CLT:
	movl	$1, %eax
	
	# INSERT YOUR CODE HERE
	# USE REGISTERS FOR LOCAL VARIABLES
	
CEnd:
	popl	%ebp
	ret
	.size	compare, .-compare
	.section	.rodata
.LC0:
	.string	"fillarray(2,a,10) correct"
.LC1:
	.string	"fillarray(2,a,10) inccrrect"
.LC2:
	.string	"fillarray2(2,b,10) correct"
.LC3:
	.string	"fillarray2(2,b,10) incorrect"
.LC4:
	.string	"fillarray(3,a,10) correct"
.LC5:
	.string	"fillarray(3,a,10) incorrect"
.LC6:
	.string	"fillarray2(3,b,10) correct"
.LC7:
	.string	"fillarray2(3,b,10) incorrect"
	.text
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$192, %esp
	movl	$2, 28(%esp)
	movl	$1, 112(%esp)
	movl	$2, 116(%esp)
	movl	$4, 120(%esp)
	movl	$8, 124(%esp)
	movl	$16, 128(%esp)
	movl	$32, 132(%esp)
	movl	$64, 136(%esp)
	movl	$128, 140(%esp)
	movl	$256, 144(%esp)
	movl	$512, 148(%esp)
	movl	$1, 152(%esp)
	movl	$3, 156(%esp)
	movl	$9, 160(%esp)
	movl	$27, 164(%esp)
	movl	$81, 168(%esp)
	movl	$243, 172(%esp)
	movl	$729, 176(%esp)
	movl	$2187, 180(%esp)
	movl	$6561, 184(%esp)
	movl	$19683, 188(%esp)
	movl	$10, 8(%esp)
	leal	32(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	fillarray
	movl	$10, 8(%esp)
	leal	112(%esp), %eax
	movl	%eax, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	compare
	cmpl	$1, %eax
	jne	.L17
	movl	$.LC0, (%esp)
	call	puts
	jmp	.L18
.L17:
	movl	$.LC1, (%esp)
	call	puts
.L18:
	movl	$10, 8(%esp)
	leal	72(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	fillarray2
	movl	$10, 8(%esp)
	leal	112(%esp), %eax
	movl	%eax, 4(%esp)
	leal	72(%esp), %eax
	movl	%eax, (%esp)
	call	compare
	cmpl	$1, %eax
	jne	.L19
	movl	$.LC2, (%esp)
	call	puts
	jmp	.L20
.L19:
	movl	$.LC3, (%esp)
	call	puts
.L20:
	movl	$3, 28(%esp)
	movl	$10, 8(%esp)
	leal	32(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	fillarray
	movl	$10, 8(%esp)
	leal	152(%esp), %eax
	movl	%eax, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	compare
	cmpl	$1, %eax
	jne	.L21
	movl	$.LC4, (%esp)
	call	puts
	jmp	.L22
.L21:
	movl	$.LC5, (%esp)
	call	puts
.L22:
	movl	$10, 8(%esp)
	leal	72(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	fillarray2
	movl	$10, 8(%esp)
	leal	152(%esp), %eax
	movl	%eax, 4(%esp)
	leal	72(%esp), %eax
	movl	%eax, (%esp)
	call	compare
	cmpl	$1, %eax
	jne	.L23
	movl	$.LC6, (%esp)
	call	puts
	jmp	.L25
.L23:
	movl	$.LC7, (%esp)
	call	puts
.L25:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
