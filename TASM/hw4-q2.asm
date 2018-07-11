.model  small
.stack 100h
.data
a db 00000011b
valStr db 3 dup('$')
.code
	mov ax,@data
	mov ds,ax
	mov di, offset valStr
	mov al, a
	mov bl, al ;holds record of al on the side before manipulation
	mov cx, 8
	mov dl, 0
	not al
	countZeroLoop:
		sal al,1
		adc dl,0
		dec cx
		JNZ countZeroLoop
	;mov dx, bx
	add dl, 48
	mov [di], dl
	mov dx, di
	mov ah,9
	int 21h	
	mov al, bl ;returns original value of al from bl

.exit
end