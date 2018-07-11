
.model small
.stack 100H
.data
    A db 12,5,'A',0FH,-1
    N equ 5
    k equ 2
.code
    mov ax, @data
    mov ds, ax
    mov di, 0
    mov si, offset A+N-1
    mov bl, 0
    start:
        rcl bl, 1
        mov al, A[si]
        mov bl, A[si]
        rcl al, 1
        mov A[si], al
        dec si
        cmp si, 0
        JGE start
        inc di
    check:
        mov si, offset A+N-1
        cmp di, k
        JNZ start

.exit
end
