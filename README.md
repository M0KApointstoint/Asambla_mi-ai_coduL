# Asambla_mi-ai_coduL

## Lectii facute de Claude, cod scris de mine (ai incredere).
## Mai am si eu modificarile proprii ca sa fie mai riguros.

# x86-64 NASM Loop Mastery Course

## Curriculum
| Lesson | Topic | Status |
|--------|-------|--------|
| 1 | `for` loops — `cmp` + `jmp` fundamentals | 🔄 In Progress |
| 2 | `while` loops — condition-first branching | ⏳ Locked |
| 3 | `do-while` loops — body-first execution | ⏳ Locked |
| 4 | Nested loops — multi-dimensional thinking | ⏳ Locked |

## Key Registers Used
- `rcx` — loop counter (by convention)
- `rax`, `rbx`, `rdx` — general purpose work registers
- `rsi`, `rdi` — source/destination (also syscall args)

## Compile & Run Template
```bash
nasm -f elf64 file.asm -o file.o
ld file.o -o file
./file
```

