.model  small
.stack 100h
.data
  num dw -512
.code
  mov ax,@data
  mov ds,ax
  mov ax, num
  mov bx, 10

  next:
  cwd
  idiv bx ;divides the number by bx, places the remainder in dx due to idiv
  cmp dx, 0 ;remainder is in dx - this checks if its positive or negative
  jge cont ;if remainder is positive, go to cont, else make it positive
  neg dx
  cont:
  add dl, 48 ;convert digit to ascii char for print
  push offset dx ;push remainder to stack
  inc cx
  cmp ax, 0
  jz print
  jmp next

  print:
  call printNum
  ext:
  .exit

  printNum proc near
  push bp
  mov bp, sp
  printpop:
  mov dx, [bp + 4]
  mov ah, 2
  int 21h
  pop bp
  cmp cx, 0
  jz ext2
  dec cx
  jmp printpop
  ext2:
  ret 2
  printNum endp
end
