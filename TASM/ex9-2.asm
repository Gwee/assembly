.model small
.stack 100h
.data
x db 1,2,3,4,5,6
gadolStr db 'Gadol$'
katanStr db 'Katan$'
.code
	mov ax,@data
	mov ds,ax
	mov cx, 0
	mov si, [1]
	mov al, [si]
	mov si, [2]
	add al, [si]
	mov si, [3]
	mov cl, [si]
	mov si, [4]
	add cl, [si]
	cmp cl, al
	JA gadol
	;print katan
	loopSmall:
		mov dx,offset katanStr
		mov ah,9
		int 21h
	.exit
	;print gadol
	gadol:
	loopLarge:
		mov dx,offset gadolStr
		mov ah,9
		int 21h
	.exit
.exit
end