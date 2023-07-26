section .text
    global _ft_list_push_front
    extern _malloc

_ft_list_push_front: ; rdi rsi
    push rdi
    push rsi
    mov rdi, 16
    call _malloc
    cmp rax, -1
    je mall_err
    pop rsi
    pop rdi
    mov [rax], rsi
    push rax
    add rax, 8
    mov rsi, rax
    mov rax, [rdi]
    mov [rsi], rax
    pop rax
    mov [rdi], rax
    mall_err:
        ret
