section .text
    global add_two

add_two:
    push rbp
    mov rbp, rsp

    mov rax, 0
    add rax, rdi
    add rax, rsi

    leave
    ret

