.model  small
.stack   100h
.data
num  dw  -32768
.code
	mov	ax,	@data
	mov	ds,	ax

	mov	ax,	num
	mov	bx,	10

	mov	cx,	0

next:
	cwd
	idiv	bx
	cmp	dx,	0
	jge	cont
	neg	dx
cont:
	add	dl,	48
	push       dx
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
	cmp cx,0
	jz ext
	pop	dx
	mov	ah,2
	int	21h
	dec	cx
	jmp soff
ext:
	.exit
end
