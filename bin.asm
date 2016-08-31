.model small
.data
a db 1234h,4567h,1256h,5678h,8976h
n db 5
a 1234h
msg1 db 10,13 "key is found"
msg2 db 10,13 "key is not found"
.code
mov ax,@data
mov ds,ax
mov cx,0
mov dx,5
mov ax,key
loop:
cmp dx,cx
jne notfound

mov bx,cx
add dx,bx
shr bx,1
mov si,cx
dec si
add si,si
cmp ax,a[si]
je found
ja above

mov dx,cx
dec dx
jmp loop
above:mov cx,dx
inc dx
jmp loop
found:mov ah,09h
lea dx,msg1
int 21h
notfound:mov ah,09h
lea dx,msg2
int 21h
end
