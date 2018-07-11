.model  small
.stack 100h
.data
nameArr dw 'g'
name1 dw 'd'
name2 dw 'a'
nameArrLength equ 14
nameLength equ 3
.code
	mov ax,@data
	mov ds,ax
	mov es, ax
	cld
	push nameArr
	push name1
	push name2
	call findName
	.exit

	findName proc near
		push bp
		mov bp, sp

		pop bp
		ret 4
	findName endp
	traverserArr proc near
		push bp
		mov bp, sp
		mov di, [bp + 6]
		mov si, [bp + 4]
		repe scasb
		pop bp
		ret 4
	traverserArr endp
end
