section .text
    global _ft_list_sort
    extern _myprintfunc

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
        mov rdi, [rdi]
        mov rax, rdx
        cmp rax, rdi
        je retZero
        jne prevLoopBegin

        retZero:
            xor rax, rax
            jmp findPrevRet
        prevLoop:
            mov rdi, [rdi + 8]
        prevLoopBegin:
            mov rax, [rdi + 8]
            cmp rax, rdx
            jne prevLoop
            mov rax, rdi
            jmp findPrevRet

    swap:
        jmp findPrev
        findPrevRet:
        cmp rax, 0
        jne notBegin

        
        pop rdi
        push rdi

        mov rdi, [rdi]
        mov rax, [rdi + 8]

        push rax
        mov rax, [rax + 8]
        mov [rdi + 8], rax
        pop rax

        mov [rax + 8], rdi

        pop rdi
        mov [rdi], rax
        push rdi
        mov rdi, [rdi]
        jmp beginLoop


        notBegin:
            push rdx
            mov rdx, [rdx + 8]
            mov [rax + 8], rdx
            pop rdx

            mov rax, [rax + 8]
            push rax
            mov rax, [rax + 8]
            mov [rdx + 8], rax
            pop rax
            mov [rax + 8], rdx

            pop rdi
            push rdi
            mov rdi, [rdi]

            jmp beginLoop

    compare:
        mov rax, rsi
        push rsi

        mov rsi, [rdi + 8]
        mov rsi, [rsi]
        ;push rdi
        mov rdx, rdi
        mov rdi, [rdi]

        call rax
        pop rsi
        ;pop rdi
        mov rdi, rdx
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


