section .text

global _start

%macro Addition 2 ;for addition
mov eax, %1
sub eax, '0'
mov ebx, %2
sub ebx, '0'
add eax, ebx
add eax, '0'

mov [addnum], eax
%endmacro

%macro Subtraction 2 ;for subtraction
mov eax, %1

sub eax, '0'
mov ebx, %2
sub ebx, '0'
sub eax, ebx
add eax, '0'

mov [subnum], eax
%endmacro

_start:

Addition [x],[y]
Subtraction [x],[y]

mov ecx, msg1
mov edx, len1
mov ebx, 1

mov eax, 4
int 0x80

mov ecx, addnum
mov edx, 1
mov ebx, 1
mov eax, 4
int 0x80

mov ecx, msg2
mov edx, len2
mov ebx, 1
mov eax, 4
int 0x80

mov ecx, subnum
mov edx, 1

mov ebx, 1
mov eax, 4
int 0x80

mov eax, 1
int 0x80

section .data
x db '5'
y db '1'
msg1 db "Sum of x and y is "
len1 equ $ - msg1
msg2 db " ------ Subtraction of y from x is "
len2 equ $ - msg2

segment .bss

addnum resb 1
subnum resb 1
