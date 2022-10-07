TITLE Mystrings.asm
;// Description: Assignment 4
;// Name: Naomi Martinez Wilson
;// Authored: 18 March 2022

INCLUDE Irvine32.inc

;// purposefully left blank

.data

User_Input      BYTE "Enter an integer between 10 -23 to generate for your random string?: ", 0	; asks user for amount of times
StringLength            DWORD ?			; StringLength will determine how long the string will be
Input       DWORD ?			; user input

.code
main PROC

mov esi, OFFSET User_Input		; esi register will be equal to the offset of User_Input
call UserEnter					; procedure that asks for an unsigned inter
mov Input, eax					; move user input to eax
call Crlf						; print a new line with a sequence of two bytes added to the output

mov ecx, Input					; move ecx of user input
next :							; will be used to be looped back to
mov esi, OFFSET randStr			; move esi to the offset address of random string array

call HowMany					; procedure to generate a number StringLength between 10-23
mov StringLength, eax						; move StringLength to eax

call Strings					; call procedure Strings that creates a string of random length
mov edx, OFFSET randStr			; move edx to register of random string
;// irvine library
call WriteString				; call print string line 

call Crlf						; print a new line with a sequence of two bytes added to the output
loop next                       ; loop to next string

call ClrString					; deallocate generated string
;// irvine library
call WriteString				; call print string line
call ReadChar					; read a character
call ClrString					; procedure to clear temp string after using it

call ExitProcess				; exit program

main ENDP						; main of proc has ended

Strings PROC


.data
randStr BYTE 1000 DUP(0)			; random string will not surpass 34 char

.code

push esi						; esi will be pushed to stack
push ecx						; ecx will be pushed to stack
mov ecx, eax					; move ecx with eax

Loop1 :							; Loop 1
call Alpha						; procedure that generates a capital letter
mov[esi], eax					; store this letter to[si]
inc esi							; esi is incremented by + 1
loop Loop1						; end of loop1

pop ecx							; ecx into register
pop esi							; esi into register
ret								; return address to stack

Strings ENDP					; end of Strings main

UserEnter PROC USES  esi		; procedure of UserEnter for an unsigned integer
push edx						; edx will be pushed to stack
mov edx, esi					; move edx to esi
;// irvine library
call WriteString				; call print string line
;// irvine library
call ReadDec					; call user inputs
pop edx							; edx into register
ret								; return address to register
UserEnter endp					; end of user enter procedure

;Procedure HowMany
;Arguments:Nothing
;Return number in AX

HowMany PROC					; HowMany procedure
push esi						; esi into register
mov esi, OFFSET User_Input		; move esi to the offset address
call UserEnter					; call print User Enter 

pop esi							; esi into register
ret								; return address to register

HowMany endp					; end of How Many procedure


Alpha PROC						; Alpha procedure to generate a capital letter

mov eax, 25						; max alphabetical of eax into offset address
call RandomRange				; call print 
add eax, 'A'					; eax = generated random number in eax + 'A'
ret								; return address to register

Alpha endp						; end of alpha procedure


ClrString PROC					; procedure to clear temp string after using it

push ebx						; ebx into register
push ecx						; ecx into register
push esi						; esi into register

mov esi, OFFSET randStr			; esi = offset address of array randomstr
mov ecx,1000						; ecx into 34 address

Loop2:
mov ebx,0						; ebx into 0 offset address
mov [esi],ebx					; move esi contents of memory to ebx
inc esi							; increment esi + 1
loop Loop2						; end of loop 2

pop esi							; esi into register
pop ecx							; ecx into register
pop ebx							; ebx into regiter
ret								; return address to register

ClrString endp					; end of clrstring procedure


exit
END main