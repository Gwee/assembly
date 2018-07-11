.model  small
.stack 100h
.data
x dw 5
y dw 3
.code
	mov ax,@data
	mov ds,ax
	push x
	push y
	call compare
	.exit
	compare proc near
		push bp
		mov bp, sp
		mov ax, [bp+6]
		mov bx, [bp+4]
		cmp ax,bx
		JG larger
		mov ax, 2
		JMP cont
		larger:
			mov ax, 1
		cont:
		pop bp
		ret 4
		compare endp
end