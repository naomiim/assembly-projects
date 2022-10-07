TITLE HWK_2_MartinezWilson.asm
;// Description: Homework 2
;// Name: Naomi Martinez Wilson
;// Authored: 1 February 2022

INCLUDE irvine32.inc

move EQU <mov>
clearEAX TEXTEQU <mov eax, 0d>
clearEBX TEXTEQU <mov ebx, 0d>
clearECX TEXTEQU <mov ecx, 0d>
clearEDX TEXTEQU <mov edx, 0d>

Product EQU A = (A-B)+(C+D) ;// computes the formula

SECONDS_IN_DAY EQU <24*60*60> ;// part 3

.data
;//{ your variables are be defined here}

VarA db 038d
VarB db 00101001b
VarC db 0A5h
VarD db 085d
Var1 dword 0000h ; operation resulted in zero
CF dword 1h	; carry source 

.code
main PROC

;//{executable code here}
mov EAX, Var1
call DumpRegs ;// you may use this line of code as necessary to show the contents of the
			  ;// registers and flags.

mov ECX, Var1 ;// part 2b ECX carry flag
mov EAX, 0f1h
mov EDX, 0fh
mov ECX, EDX
mov ECX, EAX
add ECX, CF
call DumpRegs

mov EBX, Var1
mov EAX, CF ;// part 2 EBX overflow
mov EDX, 7fffh
mov EBX, EDX
ADD EBX, EAX
call DumpRegs

ClearEAX
mov ECX, Var1 ;// part 3
mov EDX, SECONDS_IN_DAY
call DumpRegs

ClearEAX
mov EAX, 038d ;/ part 4. a
sub EAX, CF ;/ b
call WriteInt

clearEAX
mov EAX, 0A5h ;/ c
sub EAX, 085d ;/ d
call WriteInt

clearEAX
mov EAX, 038d ;/ a
sub EAX, CF;/b
mov EAX, 0A5h ;/ c
sub EAX, 085d ;/ d
call WriteInt

exit
main ENDP	;// end of main procedure
END main	;// end of source code