.model  small
.stack 100h
.data
b dw 01101011b
a dw 10011001b
N equ 1
.code
mov ax,@data
mov ds,ax
mov bx, N+1
.exit
end
