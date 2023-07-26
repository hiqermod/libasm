section .data
    msg db 'Merhaba, Dunya!', 0

section .text
    global _main

_main:
    ; Ekrana yazdır
    mov rax, 0x2000004 ; macOS'da sys_write için sistem çağrısı numarası
    mov rdi, 1         ; STDOUT (standart çıkış) dosya tanıtıcısı
    mov rsi, msg       ; Karakter dizisinin adresini rsi'ye kopyala
    mov rdx, 15        ; Karakter dizisinin uzunluğu
    syscall            ; Sistem çağrısını yap

    ; Çıkış yap
    mov rax, 0x2000001 ; macOS'da sys_exit için sistem çağrısı numarası
    xor rdi, rdi       ; Hata kodu (0, başarılı çıkış)
    syscall            ; Sistem çağrısını yap
