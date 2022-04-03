; A macro with two parameters
; Implements the write system call

%macro write_string 2
mov eax, 4
mov ebx, 1
mov ecx, %1
mov edx, %2
int 80h
%endmacro

section .text
global _start ;must be declared for using
gcc

_start: ;tell linker entry point
write_string msg1, len1
write_string msg2, len2
write_string msg3, len3

mov eax,1 ;system call number
(sys_exit)
int 0x80 ;call kernel

section .data
msg1 db 'NIRAJ KUMAR',0xA,0xD
len1 equ $ - msg1

msg2 db 'ENROLLMENT NO. - BT19CS031,',
0xA,0xD
len2 equ $- msg2

msg3 db 'BRANCH - COMPUTER SCIENCE AND
ENGINEERING'
len3 equ $- msg3
