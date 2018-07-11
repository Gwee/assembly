.model small
.stack 100h
.data
num db 2 dup (2fh , 3 dup ('7'))
string db 'Aa10$'
B dw -4 , string
C db '?'
N equ 4
.code
mov ax, @data
mov ds, ax
mov ax, word ptr num+4
mov bx, 2
inc word ptr [bx +offset string ]
mov si, offset B
add word ptr [si], N
rcr num, 1
.exit
end