.model small
.stack 100h
.data

A db 2, 41, 77
B db 3, 12, 45
C db 6 dup('?')

.code
	mov ax,@data
	mov ds,ax
	mov ax, 0
	mov cx, 0
	mov si, 0
	mov di, 0

	myloop:
		mov al, A[si]
		mov bl, B[di]
		cmp al, bl
		JA aGreater
		mov cl, B[di]
		mov C[di], cl
		inc di
		aGreater:
			mov cl, A[si]
			mov C[si], cl
			inc si
			jmp myloop
	.exit
end