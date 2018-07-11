;Basic addition, multiply, division and if statement
.model small
.stack 100h
.data
A1 dw 03h
A2 dw 07h
A3 dw 012h
A4 dw 020h
mulNumber db 3
divNumber db 4
.code
mov ax, @data
mov ds, ax
mov ax, A1
add ax, A2
add ax, A3
add ax, A4
mul mulNumber
div divNumber
mov cx, ax
cmp cx, 80h
JA L1
mov bx, 0000h
.exit
L1:
mov bx, 0FFFFh


.exit
end