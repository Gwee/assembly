.model small
.stack 100h
.data

gadolStr db 'Gadol$'
katanStr db 'Katan$'
a1 db 20h
a2 db 30h
divNumber db 3

.code
mov ax,@data
mov ds,ax
mov ax, 0
mov cx,1

mov al, a1
add al, a2
div divNumber
cmp al, 15
JA gadol

;print katan
loopSmall:
mov dx,offset katanStr
mov ah,9
int 21h
dec cx
JNZ loopSmall
.exit
gadol:
;print gadol
loopLarge:
mov dx,offset gadolStr
mov ah,9
int 21h
dec cx
JNZ loopLarge
.exit

end