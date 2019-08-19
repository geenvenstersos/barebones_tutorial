#!/bin/sh

rm ./*.o
i686GCC=~/Projects/gcc-cc/bin

#i686-elf-as boot.s -o boot.o
nasm -felf32 boot.asm -o boot.o

$i686GCC/i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
$i686GCC/i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc

qemu-system-i386 -kernel myos.bin
