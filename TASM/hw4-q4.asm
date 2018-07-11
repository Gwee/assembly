
.model small
.stack 100H
.data
    A dw 1100100000010011b
    Y db 'Yes$'
    N db 'No$'
.code
    mov ax, @data
    mov ds, ax
    mov al, byte ptr A[0]
    mov ah, byte ptr A[1]
    mov si, 0
    mov bx, 0
    start:
        shr al, 1
        adc bl, 0
        shl ah, 1
        adc bh, 0
        inc si
    check:
        cmp bl, bh
        JNE printNo
        cmp si, 8
        JB start
    printYes:
        mov dx, offset Y
        JMP printAnsw
    printNo:
        mov dx, offset N
    printAnsw:
        mov ah, 9
        int 21h

.exit
end
