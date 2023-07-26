section .text
    global _ft_strdup
    extern _ft_strlen
    extern _malloc
_ft_strdup:; ilk param rdi rsi 
    push rdi
    call _ft_strlen
    mov rdi, rax
    call _malloc
    cmp rax, -1
    je malloc_error
    mov rsi, rax
    pop rdi
    xor rcx, rcx
    jmp loop

    malloc_error:
        ret
    begin:
        mov rax, [rdi + rcx]
        mov [rsi + rcx], rax
        inc rcx
    loop:
        cmp BYTE [rdi + rcx], 0
        je exit
        jmp begin
    exit:
        mov rax, rdi
        ret