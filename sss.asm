.model small
.data
b_a equ 0e880
pa equ 0e880
pb equ 0e881
pc equ 0e882
cwr equ 0e883
.code
mov ax,@data
mov ds,ax
mov dx,cwr
mov al,80h
out dx,al
mov al,88h
mov cx,15
l1:mov dx,pc
out dx,al
call delay
ror al,01
loop l1
mov cx,15
mov al,88h
l5:mov dx,pc
out dx,al
call delay
rol al,01
loop l5
mov ah,4ch
int 21h
delay proc
mov bx,8fffh
l3:mov dx,0ffffh
l4:dec dx
jnz l4
dec bx
jnz l3
ret
delay endp
end

