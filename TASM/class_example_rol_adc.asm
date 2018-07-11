.model small
.stack 100h
.data
x db 65
.code
	mov ax, @data
	mov ds,ax
	mov cx,0
myLoop:
		cmp cx,8
		jz exitMyLoop
		mov ah,2
		mov dl, 48
		rol x,1
		adc dl,0
		int 21h
		inc cx
	jmp myLoop
exitMyLoop:
	.exit
end