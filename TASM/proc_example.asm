.model small
.stack 100h
.data
	a dw 0aaaah
	b dw 0bbbbh

.code
	mov ax,@data
	mov ds,ax
	push a
	push b
	call swap1 ; nothing changes - use swap2
	push offset a
	push offset b
	call swap2

.exit
	swap1 proc near
		push bp
		mov bp,sp
		mov ax,[bp+4]
		xchg [bp+6],ax
		mov [bp+4],ax
		pop bp
		ret 4
	swap1 endp

	swap2 proc near
		push bp
		mov bp,sp
		mov bx,[bp+4]
		mov ax,[bx]
		mov si,[bp+6]
		xchg [si],ax
		mov [bx],ax
		pop bp
		ret 4
	swap2 endp

end