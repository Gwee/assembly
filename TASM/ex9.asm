.model small
.stack 100h
.data
x db 6,6,7,4,3,56,7,8,8
.code
	mov ax,@data
	mov ds,ax
	mov si, 4
	mov al, [si]
	cmp al, 2
	JNE theEnd
	mov si, 9h
	mov al,0ffh
	mov [si],al
theEnd:
.exit
end