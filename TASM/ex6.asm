.model small
.stack 100h
.data
A db 24
B db 0a2h
C dw 270
D dw 0A2B5h
E db 8,-1,'A',12h
F dw 1234h,-1,'B'
G db 3 dup('A')
H db 3 dup(2 dup(3))
I dw C
J dw D
.code
mov ax,@data
mov ds,ax
mov ax,ds:[0]
mov si,offset D
mov bx,[si]
mov cx,C+2
int 21h
.exit
end