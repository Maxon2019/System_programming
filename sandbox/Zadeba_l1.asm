format ELF64
public _start

msg db "Zadeba",0xA, "Maxim" ,0xA, "Alekseevich", 0xA, 0
_start:
 ;инициализация регистров для вывода информации на экран
 mov rax, 4
 mov rbx, 1
 mov rcx, msg
 mov rdx, 27
 int 0x80
 ;инициализация регистров для успешного завершения работы программы
 mov rax, 1
 mov rbx, 0
 int 0x80
