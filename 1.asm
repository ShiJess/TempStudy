data segment
  BB equ 28bh
  CC equ 288h
  EE equ 28ah
  MODE    db  10000010B  ;8255控制字，A口输出
data ends
code segment
     assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
      mov al,80h
      mov dx,BB
      out dx,al      ;写控制字     
A1:  mov al,6dh      ;输入5到A
      mov dx,CC
      out dx,al       
      mov dx,EE
      mov al,02h
      out dx,al     ;送位码02h到C口
      call delay
      mov al,7dh    ;输入6到A     
      mov dx,CC
      out dx,al        
      mov dx,EE
      mov al,01h
      out dx,al     ;送位码01h到C口
      call delay
      jnz A2
      jmp A1
 A2: mov ah,4ch
      int 21h
delay proc near
      push bx
      mov bx,5h
 AA:  mov cx,0
  A3:  loop A3
      dec bx
      jne AA
      pop bx
      ret
delay endp
code  ends
      end start  