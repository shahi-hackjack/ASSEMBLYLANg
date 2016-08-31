.model small
.data
msg1 db 10,13,'enter your name:$'
msg2 db 10,13,'what is your name?$'
str db 10
db 0
db 20 dup('$')
x db 04
y db 12
.code
mov ax,@data
mov ds,ax
mov ah,09h
lea dx,msg1
int 21h
mov ah,0ah
lea dx,str
int 21h
call clear
mov ah,02h
mov bh,00h
mov dh,y
mov dl,x
int 10h
mov ah,09h
lea dx,msg2
int 21h
lea dx,(str+2)
int 21h
mov ah,4ch
int 21h
clear proc near
mov cx,2000
mov ah,02h
mov dl,32
back :int 21h
loop back
ret
clear endp
end

