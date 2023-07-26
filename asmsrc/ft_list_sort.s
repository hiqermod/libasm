section .text
    global _ft_list_sort
    extern _ft_list_size

_ft_list_sort:; rdi rsi
    push rdi
    mov rdi, [rdi]
    call _ft_list_size
    cmp rax, 0
    je exit
    cmp rax, 1
    je exit

    mov rcx, rax
    xor rax, rax
    pop rdi

    jmp loop

    begin:
        push rax



        pop rax
        inc rax
    loop:
        cmp rax, rcx
        jl begin

    exit:
        ret