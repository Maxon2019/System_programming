format ELF64
public _start

section '.bss' writeable
    number dq 4508075204         ; Заданное число
    sum dq 0                     ; сумма цифор
    string db ?
    cycle dq 0

section '.text' executable
_start:
    mov rax, [number]
    mov rcx, 10
    xor rbx, rbx

    ; суммирование цифр числа
    .iter:
      xor rdx, rdx
      div rcx
      add [sum], rdx
      cmp rax,0
    jne .iter

    ;перевод суммы в строку
    xor rax,rax
    mov rax, [sum]
    mov rcx, 10
    xor rbx, rbx

    .iter1:
      xor rdx, rdx
      div rcx
      add rdx, '0'
      push rdx
      inc rbx
      cmp rax,0
    jne .iter1

    ; вывод суммы
    mov [cycle], rbx
    .iter2:
      pop rax
      call print_symb
      dec [cycle]
      cmp [cycle], 0
    jne .iter2

 call exit



print_symb:
  
  mov [string], al
  mov rax, 4
  mov rbx, 1
  mov rcx, string
  mov rdx, 1
  int 0x80
  ret

exit:
  mov eax, 1
  mov ebx, 0
  int 0x80