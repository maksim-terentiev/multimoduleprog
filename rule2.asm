section .text
global rule2 ; variant 3
rule2:
	push ebp
	mov ebp,esp
        push edi

	mov edx,dword[ebp+8] ; pointer to string
	mov ecx,0 ; counter

; put all in stack
.loop1:	mov al,byte[edx+ecx*1]
	and eax,0xFF ; conv to dword
	push eax
	inc ecx
	test al,al ; test that not '\0'
	jnz .loop1

	mov ecx,0
.loop2: mov edi,ecx
        shl edi,2
        neg edi
        mov al,byte[ebp-8+edi] ; take lower part of dword from stack,
       	                       ; as litle-endian
	mov byte[edx+ecx*2],al
	test al,al ; test that not '\0'
	jz .break
	mov byte[edx+ecx*2+1],al ; add second char
	inc ecx
	jmp .loop2
.break:
        mov edi,[ebp-4]
	mov esp,ebp
	pop ebp
	ret

