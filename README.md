# Am partial, frate, nici nu stiu daca imi trebuie functii, nu imi trebuie sigur.

## Ia si asambleaza:

```bash
    nasm -f elf64 main.asm -o main.o
    nasm -f elf64 add_two.asm -o add_two.o
```

## Ia si linkeaza:

```bash
    gcc -no-pie main.o add_two.o
```

## Ia si ruleaza:

```bash
    ./a.out
```

### Ai incredere ca e facut de mine si n-am vibe codat cu mine.

