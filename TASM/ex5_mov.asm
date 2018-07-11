.model small
.stack 100h
.data
B1 db ?
B2 db ?
B3 db ?
B4 db 01H
B5 db 11H
B6 db 0
B7 db 04H
W1 dw ?
W2 dw ?
W3 dw ?
W4 dw 1100H
W5 dw 0011H
W6 dw 0A52H
.code
mov ax, @data
mov ds, ax

mov bx, 0
;add BL, B4 + B5 <--Bad way
;add BH, B4 + B5 + B6 + B7 <--Bad way
mov BL, B4
add BL, B5
mov BH, B4

add BH, B5
add BH, B6
add BH, B7

mov ax, 0

add ax, W4
add ax, W5
add ax, W6
;TODO: See if the ax calculation above worked

;TODO: need to put B4 in B1
;TODO: need to put 7 + B4 + B5 in B2

.exit
end