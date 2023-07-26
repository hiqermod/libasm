section .text
    global _ft_list_size

_ft_list_size:;rdi rsi
    xor rcx, rcx

    jmp loop
    beginLoop:
        inc rcx
        mov rax, [rdi + 8]
        mov rdi, rax
    loop:
        mov rax, rdi
        cmp rax, 0
        jne beginLoop
    mov rax, rcx
    ret