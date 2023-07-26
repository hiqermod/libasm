section .text
    global _ft_write

;Fonksiyonlara gelen parametreler rdi, rsi, rdx, rcx, r8 ve r9 gibi kaydedicilere atanır
_ft_write:
    ;rdi fd
    ;rsi string
    ;rdx len
    ; Metni ekrana yazdır
    mov rax, 0x2000004 ; syscall numarası: 4 (sys_write)      ; rsi, rdi'deki değeri alır (yani yazdırılacak metni alır)      ; yazdırılacak toplam bayt uzunluğu (0x0A dahil)
    syscall
    ret
