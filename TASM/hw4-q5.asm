model small
.stack 100h
.data
printHEXValue db ' ','$'
A dw ?
.code
 mov ax,@data
 mov ds,ax

mov di, offset printHEXValue
 mov A, 62939
 mov bx, A
 mov cx, 0
 mov ax, 0

myloop:
 cmp cx, 4
 JE exitMyloop
 shl bx, 1
 adc al, 0
 inc cx
 cmp cx, 4
 JE exitMyloop
 shl al, 1
 JMP myLoop

exitMyloop:
cmp al, 9
 JNA printLetter
 add al, 55
 mov [di], al
 mov ah, 9
 mov dx, di
 int 21h
 mov cx, 0
 mov ax, 0
 cmp bx, 0
 JE lastChar
 JMP myloop
printLetter: 
add al, 48
 mov [di], al
 mov ah, 9
 mov dx, di
 int 21h
mov cx, 0
 mov ax, 0
 cmp bx, 0
 JE lastChar
 JMP myloop
lastChar:
mov al, 'h'
 mov [di], al
 mov ah, 9
 mov dx, di
 int 21h

 .exit
End