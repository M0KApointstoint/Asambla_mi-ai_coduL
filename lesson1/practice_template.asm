; ============================================================
; Lesson 1 — for loop practice
; Compile: nasm -f elf64 practice_template.asm -o practice_template.o && ld practice_template.o -o practice
; Run:     ./practice ; echo "Exit code: $?"
; ============================================================

section .text
global _start

_start:
    ; ---- YOUR CODE BELOW ----



    ; ---- EXIT (keep this at the bottom) ----
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; exit code 0
    syscall

