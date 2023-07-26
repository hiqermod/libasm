# Makefile

# Derleyici tanımlamaları
CC = gcc
AS = nasm

# Derleme seçenekleri
CFLAGS = -Wall
ASFLAGS = -f macho64

# Çıkış dosyası adı
OUTPUT = my_program

# Nesne dosyaları
ASM_FILES = $(wildcard asmsrc/*.s)
ASM_OBJ_FILES = $(ASM_FILES:.s=.o)
C_OBJ_FILES = main.o

# Hedefler
all: $(OUTPUT)

$(OUTPUT): $(ASM_OBJ_FILES) $(C_OBJ_FILES)
	$(CC) $(ASM_OBJ_FILES) $(C_OBJ_FILES) -o $(OUTPUT)

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

clean:
	rm -f $(ASM_OBJ_FILES) $(C_OBJ_FILES) $(OUTPUT)