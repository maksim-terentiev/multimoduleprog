section .text
global rule1 ; variant 6
rule1:
	push ebp
	mov ebp,esp

	mov edx, dword[ebp+8] ; pointer to string
	mov ecx,0 ; counter

.loop:	mov al,byte[edx+ecx*1]
	test al,al ; test that not '\0'
	jz .exit

	cmp al,'A'
	jb .cont
	cmp al,'Z'
	ja .cont

	sub al,'A'
	sub al,'Z'
	neg al

	mov byte[edx+ecx*1],al

.cont:	inc ecx
	jmp .loop
.exit:
	pop ebp
	ret
