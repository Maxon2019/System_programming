format ELF64
public _start


section '.bss' writeable
    string db 0xA,'pmHrtOubSrUheyWQtfyPWrAigGGSrA'
    string_length dq 31
    pointer db ?

section '.text' executable
_start:

    mov rcx, [string_length]
    .iter:
        push rcx
        mov al, [string+rcx]
        call print_symb
        pop rcx
        dec rcx
        cmp rcx, 0
        jne .iter ; выход как только 0
    mov al, 0xA
    call print_symb
    call exit

print_symb:
  mov [string], al
  mov rax, 4
  mov rbx, 1
  mov rcx, string
  mov rdx, 1
  int 0x80
  ret
    ; Завершение программы
exit:
  mov eax, 1
  mov ebx, 0
  int 0x80