
; Primeiro os dois valores a serem comparados devem ser passados para `eax` e `ebx` mas juntos DWORD, ex: `mov eax, DWORD [value]`
; Depois criamos a comparação usando `cmp eax, ebx`
; E então passamos o tipo de comparação usando o comando `j` seguido de um prefixo de comparação:
; `je` usado para comparação de igualdade `==`
; `jg` mesma lógica de `>`
; `jge` mesma lógica de `>=`
; `jl` mesma lógica de `<`
; `jle` mesma lógica de `<=`
; `jne` mesma lógica de `!=`
; E seguido do que deve acontecer se a comparação for verdadeira, por exemplo pular para uma label chamada "resultado": `je resultado`

section .data
    n1 dd 25                        ; `nd` significa "Define DWORD", atribui 25 a `n1`
    n2 dd 50

    msg1 db 'Sao Iguais!', 0xA
    len1 equ $ - msg1

    msg2 db  'Sao Diferentes', 0xA
    len2 equ $ - msg2

section .text
global _start
_start:
    mov eax, DWORD [n1]             ; `DWORD` significa 32bits, `[ ] ` significa dereferência (pegar o valor na memória)
    mov ebx, DWORD [n2]
    cmp eax, ebx
    je iguais
    jne nao_iguais

iguais:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 0x80

    mov eax, 1

nao_iguais:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 0x80

    mov eax, 1
    int 0x80


