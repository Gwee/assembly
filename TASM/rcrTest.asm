.model  small
.stack 100h
.data
a db 10000001b
.code
	mov ax,@data
	mov ds,ax
	mov ah, a
	rcr ah, al
	.exit
end
