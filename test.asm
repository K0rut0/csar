.model small
.data
   hello db "hello world$"
   nl db '\n$'
   temp db 0
.code
main:
    
    mov ax, @data
    mov ds, ax
    
    
    mov dh, '0'
    mov bl, '0'
    mov ch, '0'
    call loop_msg
    
    
loop_msg:
    call msg
    call delay
    call delay
    call delay
    cmp bl, '9'
    jl loop_msg
    
    mov ah, 4ch
    int 21h
    
    
msg PROC NEAR
    
    ADD bl, 1
    
    
    cmp ch, '0'
    jg printfront
    
    mov ah, 02h
    mov dl, bl
    int 21h
    
    
    cmp dh, '9'
    jg ender
    cmp bl, '8'
    jg return
    
    mov bl, dl
    
    mov DL, 10      ;printing new line
    mov AH, 02h
    int 21h
    mov DL, 13
    mov AH, 02h
    int 21h
    
    ret
return:
    SUB bl, 10
    ADD dh, 1
    ADD ch, 1
    
    mov DL, 10      ;printing new line
    mov AH, 02h
    int 21h
    mov DL, 13
    mov AH, 02h
    int 21h
    ret
printfront:
    mov ah, 02h
    mov dl, dh 
    int 21h
    ret
delay:
    mov cx, 65535
delay_loop:
    SUB cx, 1
    jnz delay_loop
    ret

ender:
    mov ah, 4ch
    int 21h
end main
    
    