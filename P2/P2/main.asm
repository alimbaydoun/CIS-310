;Program 2
;Program Discription: Finds the mean and variance for a list of Data
;Author: Ali Baydoun
;Date: 6/18/2020


INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib
.data
raw WORD 10, 12, 8, 17, 9, 22, 18, 11, 23, 7, 30, 22, 19, 6, 7
meanis BYTE "Mean: ", 0
varianceis BYTE "Variance: ", 0

.code
main PROC
mov edi, OFFSET raw
mov ecx, LENGTHOF raw
mov  eax, 0

LOOP1ST:
add ax, [edi]
add edi, TYPE raw

loop LOOP1ST
mov edx, OFFSET meanis

call WriteString

mov ecx, (LENGTHOF raw)

cdq

idiv ecx

call WriteDec; 

call Crlf; 

mov edx, eax

mov cl, (LENGTHOF raw)

mov esi, OFFSET raw

mov ebx, 0

LOOP2ND:

movzx eax, byte ptr[esi]

sub eax, edx

imul eax, eax

add ebx, eax

mov eax, ebx

add esi, 2

loop LOOP2ND

mov edx, OFFSET varianceis; Calculate the value of the variance

call WriteString

mov ecx, (LENGTHOF raw)

cdq

idiv ecx

call WriteDec

call Crlf

call Waitmsg

invoke ExitProcess, 0

main ENDP

END main