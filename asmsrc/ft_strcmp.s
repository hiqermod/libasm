section .text
    global _ft_strcmp

_ft_strcmp:;rdi rsi
    xor rax, rax
    xor rcx, rcx

    jmp loop
    greater_than:
        sub rax, 256
        ret
    begin:
        inc rcx
    loop:
        mov al, [rsi + rcx]
        cmp BYTE [rdi + rcx], 0
        je exit
        cmp BYTE [rdi + rcx] , al
        je begin
    exit:
        mov al, [rdi + rcx]
        sub al, [rsi + rcx]
        cmp rax, 127
        jg greater_than
        ret