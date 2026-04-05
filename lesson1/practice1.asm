; ============================================================
; Lesson 1 — for loop practice
; Compile: nasm -f elf64 practice1.asm -o practice1.o && ld practice1.o -o practice1
; Run:     ./practice1 ; echo "Exit code: $?"
; ============================================================

section .text
global _start

_start:
    ; ---- YOUR CODE BELOW ----
    mov ecx, 0 ; 4 Bytes is 4 Bytes :D

.loop_start:
    cmp ecx, 10
    jge .loop_end

    ; Do something :D

    add ecx, 1
    jmp .loop_start

.loop_end:
    ; ---- EXIT (keep this at the bottom) ----
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; exit code 0
    syscall

