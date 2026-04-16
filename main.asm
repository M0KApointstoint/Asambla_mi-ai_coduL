section .data
    x dd 1
    y dd 2

section .text

    extern add_two
    global main

main:
    push rbp
    mov rbp, rsp
    ; Stack needs to be aligned.
    sub rsp, 8

    mov edi, [x]
    mov esi, [y]
    call add_two

    ; Restore the stack before exit.
    add rsp, 8
    leave
    ret

