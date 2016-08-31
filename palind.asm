.model small
.data
a1 db 20 dup(?)
a2 db 20 dup(?)
msg1 db 'Enter the string:',0ah,0dh,'$'
msg2 db 'Not a Palindrome!',0dh,0ah,'$'
msg3 db 'Palindrome!',0dh,0ah,'$'
msg4 db 0dh,0ah,'$'

.code
  mov ax,@data
  mov ds,ax
  mov es,ax
  mov si,offset a1
  mov di,offset a2
  mov dx,offset msg1
  mov ah,09h
  int 21h
  mov cx,00h
nxt1:
  mov ah,01h
  int 21h
  cmp al,0dh
  jz nxt2
  inc cx
  mov bx,cx
  mov [si],al
  inc si
  jmp nxt1
nxt2:
  dec si
nxt3:
  mov al,[si]
  mov [di],al
  inc di
  dec si
  jnz nxt3
  mov si,offset a1
  mov di,offset a2
  cld
  repe cmpsb
  je palin
  mov dx,offset msg4
  mov ah,09h
  int 21h
  mov dx,offset msg2
loc2:
  mov ah,09h
  int 21h
  mov ah,4ch
  int 21h
palin:
  mov dx,offset Msg4
  mov ah,09h
  int 21h
  mov dx,offset msg3
  jmp loc2
end
