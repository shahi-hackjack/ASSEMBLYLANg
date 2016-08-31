; program to compute the ncr

.model small
.stack

.data

n db 05h
r db 02h
ncr fb ?


.code
mov ax,@data
mov ds,ax
mov bx,n
mov cx,r
call ncrrec

cmp cx,00h
je exit

ncrrec proc near
push bx
push cx

add ax,bx
div bx
mul ncr
mov ncr,ax


exit : mov ncr,01h
mov ah,4ch
int 21h

pop cx
pop bx
ret
ncrrec endp
end

