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
    out dx,al    ;����8255��A��Ϊ����˿ڣ�C���°��Ϊ���
    
    
III:mov di,offset x1 ;������׵�ַ
   
    mov cl,00000010b
II: mov al,cl
    mov dx,28ah
    out dx,al                   ;λ����λ���ƶ˿�
    
   
    mov al, [di]                 ;AL��ΪҪ��ʾ����
    mov dx,288h
    out dx,al                    ;�����Ͷο��ƶ˿�
  
    
    call delay                  ;��ʱ
    cmp cl,01b
    jz I
       
    inc di
    shr cl,1
    jmp II                      ;ִ����һλ����ʾ
    
    
  I: mov ah,06h
    mov dl,0ffh
    int 21h
    jz III                         ;�����ʱ
    
    mov ah,4ch
    int 21h                         
    
   delay proc near
   push cx
   mov bx,08h
 a:mov cx,0ffffh                    ;��ʱ??????????
   IIII:  loop IIII
   dec  bx
   
   jnz a
    pop cx
    ret
    delay endp
    
    code ends
    end start
    
    