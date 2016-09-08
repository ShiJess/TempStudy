data segment
    x1 db 6dh,7dh
    x2 db 0b,1b
data ends
code segment
    assume ds:data,cs:code
    start:
    mov ax,data
    mov ds,ax
    mov dx,28bh
    mov al,82h
    out dx,al    ;设置8255，A口为输出端口，C口下半口为输出
    
    
III:mov di,offset x1 ;段码表首地址
   
    mov cl,00000010b
II: mov al,cl
    mov dx,28ah
    out dx,al                   ;位码送位控制端口
    
   
    mov al, [di]                 ;AL中为要显示的数
    mov dx,288h
    out dx,al                    ;段码送段控制端口
  
    
    call delay                  ;延时
    cmp cl,01b
    jz I
       
    inc di
    shr cl,1
    jmp II                      ;执行下一位的显示
    
    
  I: mov ah,06h
    mov dl,0ffh
    int 21h
    jz III                         ;软件延时
    
    mov ah,4ch
    int 21h                         
    
   delay proc near
   push cx
   mov bx,08h
 a:mov cx,0ffffh                    ;延时??????????
   IIII:  loop IIII
   dec  bx
   
   jnz a
    pop cx
    ret
    delay endp
    
    code ends
    end start
    
    