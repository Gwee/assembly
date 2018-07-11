.model  small
.stack  100H
.data
A   db   '     This      is     a          test     $'
B   db   100 dup('$')
.code
	mov ax, @data
	mov ds, ax
	mov si, 0
	mov cx, 0
	myloop:
		mov al, A[si]
		cmp al, 24h
		JE  continue
		cmp al, 20h
		JE isSpace
		inc si
		jmp myloop
		isSpace:
			inc cx
			inc si
			jmp myloop
continue:

.exit
end