; ============================================================
; Lesson 1 — for loop practice
; Compile: nasm -f elf64 practice2.asm -o practice2.o && ld practice2.o -o practice2
; Run:     ./practice2 ; echo "Exit code: $?"
; ============================================================

section .text
global _start

_start:
    ; ---- YOUR CODE BELOW ----
    mov eax, 0
    mov ecx, 1

.loop_start:
    cmp ecx, 100
    jg .loop_end

    add eax, ecx
    add ecx, 1
    jmp .loop_start

.loop_end:

    ; ---- EXIT (keep this at the bottom) ----
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; exit code 0
    syscall

