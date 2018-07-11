.model  small
.stack 100h
.data
A dw 12, 5, 8, -1, 4
B dw -2, 9, 0, 18, 3
C dw 5 dup (?)
arrSize equ 5
.code
  mov ax, @data
  mov ds, ax
  mov cx, 0
  push offset A
  push offset B
  push offset C
  push arrSize
  call addNums
  .exit

  addNums proc near
    push bp
    mov bp, sp
    mergeArr:
    cmp cx, arrSize
    jz ext
    mov bx, [bp+10]
    mov dx, [bx+di]
    mov bx, [bp+8]
    clc
    adc dx, [bx+di]
    inc di
    inc di
    mov C[si], dx
    inc cx
    inc si
    jmp mergeArr
    ext:
    pop bp
    ret 8
  addNums endp
end
