section .data
msg1 db "Enter your Name? ",0xA,0xD
len1 equ $ - msg1
msg2 db "Enter your Enrollment Number: ",0xA,0xD
len2 equ $ - msg2
msg3 db "Your name is ",
len3 equ $ - msg3
msg4 db "Your enrollment number is "
len4 equ $ - msg4
section .bss
name resb 30
Eroll resb 10
section .text
global _start
_start:
;sequence :
msg1 -> setname -> msg2 -> setroll -> msg3 -> getname
-> msg4 -> getroll
;Printing "What is your Name? "
mov eax, 4 ;message length
mov ebx, 1 ;file descriptor (stdout)
mov ecx, msg1 ;message what to print
mov edx, len1 ;length of the message
int 80h ;call kernel
;Read and Store "User Name"
mov eax, 3 ;message is read
mov ebx, 2 ;value is to be inserted
mov ecx, name ;name is entered
mov edx, 30 ;length of the 'name'
int 80h ;call kernel
;Asking user to enter enrollment number
mov eax, 4 ;message length
mov ebx, 1 ;file descriptor (stdout)
mov ecx, msg2 ;stating what to print
mov edx, len2 ;length of the message
int 80h ;call kernel
;Read and Store "User Identity Number"
mov eax, 3 ;message is read
mov ebx, 2 ;value is to be inserted
mov ecx, Eroll ;enrollment number is entered
mov edx, 10 ;length of the Eroll
int 80h ;call kernel
;Printing "Your name is "
mov eax, 4 ;message length
mov ebx, 1 ;file descriptor (stdout)
mov ecx, msg3 ;stating what to print
mov edx, len3 ;length of the message
int 80h ;call kernel
;printing "User Name"
mov eax, 4 ;message length
mov ebx, 1 ;file descriptor (stdout)
mov ecx, name ;stating what to print
mov edx, 30 ;length of the 'name'
int 80h ;call kernel
;Printing "Your Enrollment number is "
mov eax, 4 ;message length
mov ebx, 1 ;file descriptor (stdout)
mov ecx, msg4 ;stating what to print
mov edx, len4 ;length of the message
int 80h ;call kernel
;Read and Store "User Enrollment Number"
mov eax, 4 ;message length
mov ebx, 1 ;file descriptor (stdout)
mov ecx, Eroll ;stating what to print
mov edx, 10 ;length of the 'roll'
int 80h ;call kernel
 ;exit code
mov eax, 1
mov ebx, 0
int 80h
