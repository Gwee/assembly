.model  small
.stack 100h
.data
A dw 12, 5, 8, -1, 4
B dw -2, 9, 0, 18, 3
C dw 5 dup (?)
.code
  mov ax, @data
  mov ds, ax
  push b[0]
  push b[2]
  call addNums
  .exit
  addNums proc near
    push bp
    mov bp, sp
    mov dx, [bp+4]
    clc
    adc dx, [bp+6]
    pop bp
    ret 4
  addNums endp
end
