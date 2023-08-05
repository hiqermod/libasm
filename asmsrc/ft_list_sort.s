section .text
    global _ft_list_sort

_ft_list_sort:; rdi t_list** beginList rsi cmp function
    ; 1. argüman: RDI
    ; 2. argüman: RSI
    ; 3. argüman: RDX
    ; 4. argüman: RCX
    ; 5. argüman: R8
    ; 6. argüman: R9
    ; 7. argüman: R10
    ; 8. argüman: R11

    push rdi
    mov rdi, [rdi]

    mov rax, rdi
    cmp rax, 0
    je exit
    xor rax, rax
    jmp beginLoop

    findPrev:
        mov rdx, rdi ; kalinan yeri rdx e attim
        pop rdi
        mov rax, rdi
        push rdi
        mov rdi, rax
        mov rdi, [rdi + 8]
        mov rax, rdx
        cmp rax, rdi
        je retZero
        jne prevLoopBegin

        retZero:
            xor rax, rax
            jmp findPrevRet
        prevLoopBegin:
            mov rax, [rdi + 8]
            cmp rax, rsi
            jne prevLoopBegin
            mov rax, rdi
            jmp findPrevRet

    swap:
        jmp findPrev
        findPrevRet:

        push rdx
        mov rdx, [rdx + 8]
        mov [rax + 8], rdx
        pop rdx

        mov rax, [rax + 8]
        push rdx
        mov rdx, [rdx + 8]
        mov rdx, [rax + 8]
        pop rdx
        mov [rax + 8], rdx
        pop rdi
        mov rax, rdi
        push rdi
        mov rdi, [rax]
        jmp beginLoop

    compare:
        mov rax, rsi
        push rsi

        mov rsi, [rdi + 8]
        mov rsi, [rsi]
        push rdi
        mov rdi, [rdi]

        call rax
        pop rsi
        pop rdi

        cmp rax, 0
        jg swap
        jmp compareRet

    loop:
        jmp compare
        compareRet:
        mov rax, [rdi + 8]
        mov rdi, rax
    beginLoop:
        mov rax, [rdi + 8]
        cmp rax, 0
        jne loop
        jmp exit

    exit:
        pop rdi
        ret


