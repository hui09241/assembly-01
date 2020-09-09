INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	 out1		  BYTE    "Enter the number of Start：", 0
	 out2		  BYTE    "Enter the number of End：", 0
	 out3		  BYTE    "Answer：", 0
	 Start        SDWORD   ?
	 Times        DWORD    ?
	 Sum          DWORD    0
.code
main PROC
	call Clrscr ;清除螢幕
	mov edx , OFFSET out1 ;提醒使用者輸入Start
	call WriteString
	call Crlf
	call ReadInt ;輸入Start為何
	mov  Start,eax
	mov edx , OFFSET out2 ;提醒使用者輸入End
	call WriteString
	call Crlf
	call ReadInt ;輸入End為何

	mov Times,eax
	mov ebx,Start
	sub Times,ebx
	mov ecx,Times ;Loop跑幾次

 L1: 
    mov eax,Start
	mov ebx,Start
	add ebx,1
	imul ebx
	add Start,1
	add Sum,eax
	loop L1

	mov edx , OFFSET out3 ;輸出ans
	call WriteString
	call Crlf
	mov eax,Sum
	call    WriteInt

	call    crlf 

	call WaitMsg
	INVOKE ExitProcess , 0
main ENDP
END main