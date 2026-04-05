# Lesson 1 — `for` Loops in x86-64 NASM

## The Core Idea

A C `for` loop has three parts:
```c
for (int i = 0; i < 5; i++) {
    // body
}
```

In assembly, there is no magic `for` keyword.
You replicate those three parts manually using:
- A **register** as your counter (we use `rcx`)
- `cmp` to check the condition
- A **conditional jump** to either continue or exit

# Comentariu: Maestrul Claude uita ca eu vreau sa fiu riguros si daca vad int atunci lucrez cu eax.

---

## The Mental Model

```
  INIT:   mov rcx, 0          ; i = 0

LOOP_TOP:
  CHECK:  cmp rcx, 5          ; is i < 5?
          jge LOOP_END         ; if NOT (i >= 5), jump out

  BODY:   ; ... your work here ...

  STEP:   inc rcx              ; i++
          jmp LOOP_TOP         ; go back to check

LOOP_END:
```

This maps **exactly** to a C for loop. Read it side by side until it clicks.

---

## Key Instructions

| Instruction | Meaning |
|-------------|---------|
| `mov rcx, 0` | Initialize counter to 0 |
| `cmp rcx, 5` | Compare rcx with 5 (sets CPU flags) |
| `jl LABEL` | Jump if Less (signed) |
| `jge LABEL` | Jump if Greater or Equal (signed) |
| `jne LABEL` | Jump if Not Equal |
| `inc rcx` | Increment rcx by 1 |
| `dec rcx` | Decrement rcx by 1 |

> ⚠️ `cmp a, b` does NOT store a result — it just sets CPU flags.
> The jump instruction READS those flags to decide where to go.

---

## Worked Example — Count from 1 to 5

**C equivalent:**
```c
int i;
for (i = 1; i <= 5; i++) {
    // (imagine printing i)
}
```

**Assembly:**
```asm
section .text
global _start

_start:
    mov rcx, 1          ; i = 1

.loop:
    cmp rcx, 5          ; compare i with 5
    jg  .done           ; if i > 5, exit

    ; body goes here (we'll add output in later lessons)

    inc rcx             ; i++
    jmp .loop           ; repeat

.done:
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; exit code 0
    syscall
```

Notice the **dot prefix** (`.loop`, `.done`) — these are LOCAL labels in NASM.
They only exist within the current function/section scope. Good practice!

---

## Counting DOWN (a common trick)

Going from N down to 0 lets you use `loop` or `dec`+`jnz`:

```asm
mov rcx, 5          ; i = 5

.loop:
    ; body here

    dec rcx             ; i--
    jnz .loop           ; jump back if rcx != 0
```

This is *slightly* faster — CPUs love comparing to zero.

# Comentariu: Maestrul Claude a uitat ca rcx trebuie sa contina ceva mai mare sau egal decat 1 ;)
---

## Problems

### 🟢 Problem 1 (Warm-up)
Translate this C loop into NASM assembly (just the loop structure, no output needed):
```c
for (int i = 0; i < 10; i++) {
    // body
}
```
Write the full `.text` section with `_start`, the loop, and a clean exit.

---

### 🟡 Problem 2 (Medium)
Translate this C loop into NASM. Use `rax` to accumulate the sum:
```c
int sum = 0;
for (int i = 1; i <= 100; i++) {
    sum += i;
}
```
After the loop, `rax` should hold 5050. You can verify it becomes the exit code:
```asm
mov rdi, rax    ; exit code = sum (only works for small values!)
mov rax, 60
syscall
```
Then run: `echo $?` to see the result (it wraps at 256, so use 10 instead of 100 for testing).

---

### 🔴 Problem 3 (Challenge)
Translate this loop using the **count-down** technique:
```c
int result = 1;
for (int i = 5; i > 0; i--) {
    result *= i;   // factorial of 5 = 120
}
```
Use `rax` for result, `rcx` for i. Use `imul` for multiplication: `imul rax, rcx`

---

