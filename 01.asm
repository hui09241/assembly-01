INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	 out1		 BYTE    "請輸入陣列元素數目N：", 0
	 out2		 BYTE    "請輸入範圍K：", 0
	 N           SDWORD    0  ;陣列元素
	 ArrayC      SDWORD    ?  ;所求陣列
	 temp        SDWORD    ?  ;N乘2
.code
main PROC
	call Clrscr ;清除螢幕
	mov edx , OFFSET out1 ;提醒使用者輸入陣列元素
	call WriteString
	call Crlf
	call ReadInt 
	mov N,eax

	;mov eax,N
	;mov ebx,2
	;mul ebx
	;mov temp,eax

	mov     esi  , OFFSET ArrayC
	call    Randomize
	mov ecx,N                    ;Loop跑幾次

L1: mov eax,N
	mov ebx,2
	mul ebx
	call    RandomRange
	sub     eax,N
	mov     [esi],eax
	add     esi ,TYPE ArrayC
	loop L1
	call    crlf 

	mov     esi , OFFSET ArrayC
	mov     ecx ,N

L2: mov     eax, [esi]
	call    WriteInt
	add     esi , TYPE ArrayC 
	loop L2



	call    crlf 
	call WaitMsg
	INVOKE ExitProcess , 0
main ENDP
END main