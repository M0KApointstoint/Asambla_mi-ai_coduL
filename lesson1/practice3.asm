; ============================================================
; Lesson 1 — for loop practice
; Compile: nasm -f elf64 practice3.asm -o practice3.o && ld practice3.o -o practice3
; Run:     ./practice3 ; echo "Exit code: $?"
; ============================================================

section .text
global _start

_start:
    ; ---- YOUR CODE BELOW ----
    mov eax, 1
    mov ecx, 5

.loop_start:
    cmp ecx, 0
    ; Maestrul Claude a uitat ca tehnica functioneaza cand ce e in ecx e mai mare sau egal decat 1 ;)
    jle .loop_end

    ; Maestrul Claude trebuie sa aiba grija si la inmultiri, dar avem noi grija pentru el.
    imul eax, ecx
    ; Destul de riscant asa, dar merge pentru numere mai micute.
    sub ecx, 1
    jmp .loop_start

.loop_end:

    ; ---- EXIT (keep this at the bottom) ----
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; exit code 0
    syscall

