INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	 out1		  BYTE    "Enter the number of Start�G", 0
	 out2		  BYTE    "Enter the number of End�G", 0
	 out3		  BYTE    "Answer�G", 0
	 Start        SDWORD   ?
	 Times        DWORD    ?
	 Sum          DWORD    0
.code
main PROC
	call Clrscr ;�M���ù�
	mov edx , OFFSET out1 ;�����ϥΪ̿�JStart
	call WriteString
	call Crlf
	call ReadInt ;��JStart����
	mov  Start,eax
	mov edx , OFFSET out2 ;�����ϥΪ̿�JEnd
	call WriteString
	call Crlf
	call ReadInt ;��JEnd����

	mov Times,eax
	mov ebx,Start
	sub Times,ebx
	mov ecx,Times ;Loop�]�X��

 L1: 
    mov eax,Start
	mov ebx,Start
	add ebx,1
	imul ebx
	add Start,1
	add Sum,eax
	loop L1

	mov edx , OFFSET out3 ;��Xans
	call WriteString
	call Crlf
	mov eax,Sum
	call    WriteInt

	call    crlf 

	call WaitMsg
	INVOKE ExitProcess , 0
main ENDP
END main