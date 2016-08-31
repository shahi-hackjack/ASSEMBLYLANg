.model small
.data
a1 db 10 dup(?)
a2 db 10 dup(?)
sum db 10 dup(?)
.code
mov ax,@data
mov ds,ax
mov a1,04h
mov a2,03h
mov al,a1
mov bl,a2
div bl
mov sum,al
mov ah,4ch
int 21h
end
