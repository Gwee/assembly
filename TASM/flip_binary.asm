.model  small
.stack 100h
.data
a db 11001010b,00010011b,00111101b
N equ 3
b db N dup (2)
.code
	mov  ax,@data
	mov  ds,ax
   
    mov di,N-1 
	mov si,0
arrayLoop:	  
	cmp si,N
	jz exitArrayLoop
	
	mov dl,a[si]
	mov cx,0
	xor dh,dh
myloop:
    cmp cx,8
	jz exitMyLoop
	shl dh,1
	shr dl,1
	adc dh,0
	inc cx
	jmp myloop
	
	
exitMyLoop:	
	mov b[di],dh
	dec di
	inc si
	jmp arrayLoop

exitArrayLoop:	
	
mov si,0
printArray:	
    
    cmp si,N
	jz exitPrintArray
	mov   cx,0
next:
	cmp  cx,8
	jz   exitNext
	mov  ah,2
	mov  dl,48
	rol   b[si],1
	adc   dl,0
	int     21h
	inc    cx
    jmp   next
exitNext:
    cmp si,N-1
	jz last
    mov dl,','
    int 21h	
last:	
	inc si
	jmp printArray
exitPrintArray:


	.exit
end
