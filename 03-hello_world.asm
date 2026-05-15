section .data
	msg db 'hello world', 0xA, 	; Variável msg que tem a string desejada
	len equ $ - msg			; Variável len que receberá o tamanho da string

section .text
global _start

_start:
	mov eax, 4			; Método de escrita (sys_write)
	mov ebx, 1			; Método de saída (std_out)
	mov ecx, msg			; Mensagem
	mov edx, len			; Tamanho
	int 0x80			; Chamando o kernel

	mov eax, 1			; Método de saída (sys_exit)
	int 0x80