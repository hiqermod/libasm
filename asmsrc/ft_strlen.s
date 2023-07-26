section .text
    global _ft_strlen

_ft_strlen:
    xor rax, rax

    jmp begin
    loop:
        inc rax
        inc rdi
    begin:
        cmp BYTE [rdi], 0
        jne loop

    ret