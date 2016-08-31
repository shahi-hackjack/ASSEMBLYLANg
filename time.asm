.model small
.data
msg db 'current time is:$'
.code
start:mov ax,@data
mov ds,ax
lea dx,msg
mov ah,09h
int 21h
mov ah,2ch
int 21h
mov al,ch
call display
mov dl,':'
mov ah,02h
int 21h
mov al,cl
call display
mov dl,':'
mov ah,02h
int 21h
mov al,dh
call display
mov ah,4ch
int 21h
display proc
aam
mov bx,ax
add bx,3030h
mov dl,bh
mov ah,02h
int 21h
mov dl,bl
mov ah,02h
int 21h
ret
display endp
end
