.model small
.data
array dw 1234h,1324h,2146h,5678h,6755h
len dw ($-array)/2
srchkey equ 5678h
msg1 db "Element Found",'$'
msg2 db "Element not Found",'$'
.code
        mov ax,@data
        mov ds,ax
        mov bx,01
        mov dx,len
        mov cx,srchkey
Again:
        cmp bx,dx
        ja Failure
        mov ax,dx
        add ax,bx
        shr ax,01
        mov si,ax
        dec si
        add si,si
        cmp cx,array[si]
        jae bigger
        dec ax
        mov dx,ax
        jmp Again
Bigger:
        je Success
        inc ax
        mov bx,ax
        jmp Again
Success:
        lea dx,msg1
        jmp Display
Failure:
        lea dx,msg2
Display:
        mov ah,09h
        int 21h
        mov ah,4ch
        int 21h
        end
