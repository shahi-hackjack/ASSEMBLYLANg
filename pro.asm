.model small
.data
a1 db 05H
a2 db 15H
pro db 10 dup(?)
.code
mov ax,@data
mov ds,ax
mov al,a1
mov bl,a2
div bl
mov pro,al
mov ah,4ch
int 21h
end

