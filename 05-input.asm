section .data
    msg db 'Digite seu nome:'      ; Sem 0xA, pois não queremos quebra de linha
    len equ $ - msg

section .bss
        name resb 1

section .text
global _start
_start:
    mov eax, 4                      ; SYS_WRITE
    mov ebx, 1                      ; STD_OUT
    mov ecx, msg                    ; Mensagem
    mov edx, len                    ; Tamanho da Mensagem
    int 0x80                        ; Chamar o kernel

    mov eax, 3                      ; SYS_READ
    mov ebx, 0                      ; STD_IN
    mov ecx, name                   ; Variável que recebe o input
    mov edx, 60                     ; Tamanho máximo do input
    int 0x80                        ; Chamar o kernel

    mov eax, 4                      ; SYS_WRITE
    mov ebx, 1                      ; STD_OUT
    mov ecx, name                   ; Variável
    int 0x80                        ; Chamar o kernel

    mov eax, 1                      ; SYS_EXIT
    int 0x80                        ; Chamar o kernel

