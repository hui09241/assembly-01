INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	 out1		 BYTE    "�п�J�}�C�����ƥ�N�G", 0
	 out2		 BYTE    "�п�J�d��K�G", 0
	 N           SDWORD    0  ;�}�C����
	 ArrayC      SDWORD    ?  ;�ҨD�}�C
	 temp        SDWORD    ?  ;N��2
.code
main PROC
	call Clrscr ;�M���ù�
	mov edx , OFFSET out1 ;�����ϥΪ̿�J�}�C����
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
	mov ecx,N                    ;Loop�]�X��

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