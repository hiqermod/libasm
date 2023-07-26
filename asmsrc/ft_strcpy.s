section .text
    global _ft_strcpy

_ft_strcpy:
    push rdi ; Destination
    jmp loop
    begin:
        inc rdi
        inc rsi
    loop:
        mov rax, [rsi]
        mov [rdi], rax
        cmp BYTE [rsi], 0
        jne begin
    pop rdi
    mov rax, rdi
    ret