.model small
.stack 100h
.data
testStr db 'test$'
.code
	mov ax,@data
	mov ds,ax
	mov cx, -7
	myLoop:
		mov dx, offset testStr
		mov ah, 9
		int 21h
	loop myLoop
	.exit
end