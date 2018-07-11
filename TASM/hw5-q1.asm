.model  small
.stack   100h
.data
num  dw  -32768
n equ 4
.code
	mov	ax,	@data
	mov	ds,	ax

	mov	ax,	num
	mov	bx,	10

	mov	cx,	0
  mov si, n
next:
	cwd
	idiv	bx
	cmp	dx,	0
	jge	cont
	neg	dx
cont:
	add	dl,	48
	push dx
	inc	cx
  cmp	ax,	0
	jz sof
	jmp next
sof:
	cmp	num,	0
	jge	soff
	push '-'
	inc	cx
soff:
  call printNum

	.exit

  printNum proc near
    push bp
    mov bp, sp
    print:
    cmp cx,0
    jz ext
    mov dx, [bp + si]
    mov ah, 2
    int 21h
    add si, 2
    dec	cx
    jmp print
    ext:
    pop bp
    ret
  printNum endp
end
