;PROGRAM TEMPLATE
;all rights to dylan
;Prints the string 10 times
.model small
.stack 100h
.data

mystr db 'Dylan $'

.code
mov ax,@data
mov ds,ax

mov cx,10
myloop:
mov dx,offset mystr
mov ah,9
int 21h
dec cx
JNZ myloop


.exit   
end    
