.model  small
.stack 100h
.data
a db 00000011b
valStr db 3 dup('$')
.code
	mov ax,@data
	mov ds,ax
	mov al, a
	mov cl, al
	mov dl, al
	shl cl, 3
	shl dl, 1
	add dl,cl

.exit
end