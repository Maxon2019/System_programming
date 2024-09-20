format ELF64
public _start

section '.data' writeable
    pointer db 8 dup (';'), 0xA ; Заполняем 8 символами ';' и сразу добавим перевод строки

section '.text' executable
_start:
    mov rcx, 15             ; Количество строк
    .iter:
        push rcx
        call print_symb
        pop rcx
        dec rcx
        jne .iter ; выход как только 0
    call exit

print_symb:
  mov rax, 4
  mov rbx, 1
  mov rcx, pointer
  mov rdx, 9
  int 0x80
  ret

exit:
  mov eax, 1
  mov ebx, 0
  int 0x80