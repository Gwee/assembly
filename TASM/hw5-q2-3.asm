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
  mov di, 0
  pushCToStack:
  cmp di, arrSize
  jz finish
  mov dx, [C+di]
  xor dh,dh
  add dl, 48
  push dx
  inc di
  jmp pushCToStack
  finish:
  call printNum
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
  printNum proc near
    push bp
    mov bp, sp
    mov cx, arrSize
    mov si, 4
    print:
    cmp cx,0
    jz ext2

    mov dx, [bp + si]
    xor ax, ax
    mov ah, 2
    int 21h
    add si, 2
    dec	cx
    jmp print
    ext2:
    pop bp
    ret
  printNum endp

end
