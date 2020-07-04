INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
str_prompt BYTE "Score = ", 0

str_A BYTE "Grade = A", 0
str_B BYTE "Grade = B", 0
str_C BYTE "Grade = C", 0
str_D BYTE "Grade = D", 0
str_E BYTE "Grade = E", 0

str_Score BYTE "Score = ", 0
str_Grade BYTE "Grade = ", 0


.code
main proc

mov edx, offset str_Prompt
call WriteString
call ReadDec
mov edx, offset str_Score
call WriteString
call WriteDec

.IF eax >= 90
mov edx, offset str_A
.ELSEIF eax >= 80
mov edx, offset str_B
.ELSEIF eax >= 70
mov edx, offset str_C
.ELSEIF eax >= 60
mov edx, offset str_D
.ELSE
mov edx, offset str_E
.ENDIF

call Crlf
call WriteString

invoke ExitProcess,0

main endp
end main