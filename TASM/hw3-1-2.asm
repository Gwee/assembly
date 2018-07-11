.model  small
.stack  100H
.data
A   db   '     This      is     a          test     $'
C db ' gu ya  $'
B   db   100 dup('$')
.code
	mov ax, @data
	mov ds, ax
	mov si, 0
	mov cx, 0
	myloop:
		mov al, C[si]
		cmp al, 24h
		JE  continue
		cmp al, 20h
		JNE isNotSpace
		inc si
		jmp myloop
		isNotSpace:
			cmp al, 20h
			JNE wordCounter
			inc cx
			inc si
			jmp myloop
			wordCounter:
				inc si
				jmp isNotSpace
continue:

.exit
end