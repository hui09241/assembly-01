INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	 out1		 BYTE    "Enter the number of StudetnID�G", 0
	 out2		  BYTE    "Answer�G", 0
	 divisor     DWORD   10
	 Sum         DWORD    ?
	 All         DWORD    ?
.code
main PROC
	call Clrscr ;�M���ù�
	mov edx , OFFSET out1 ;�����ϥΪ̿�J�Ʀr
	call WriteString
	call Crlf
	call ReadInt 

	mov edx,0   ;�˼ƲĤ@�X�B�z�L�{
	div divisor ;�Ĥ��ӼƦr��bebx
	mov All,eax
	mov eax,edx ;�N�䲾��eax
	mov ebx,2   ;�N2��Jebx
    imul ebx
	add eax,5;�[5
	mov Sum,eax

	mov edx,0   ;�˼ƲĤG�X�B�z�L�{
	mov eax,All
	div divisor ;�ĥ|�ӼƦr��bebx
	mov All,eax
	mov eax,edx ;�N�䲾��eax
	mov ebx,3   ;�N3��Jebx
	imul ebx
	sub eax,1
	add Sum,eax 

	mov edx,0   ;�˼ƲĤT�X�B�z�L�{
	mov eax,All
	div divisor ;�ĤT�ӼƦr��bebx
	mov All,eax
	mov eax,edx ;�N�䲾��eax
	mov ebx,5   ;�N5��Jebx
	imul ebx
	add eax,6
	add Sum,eax 

	mov edx,0   ;�˼ƲĤG�X�B�z�L�{
	mov eax,All
	div divisor ;�ĤG�ӼƦr��bebx
	mov All,eax
	mov eax,edx ;�N�䲾��eax
	mov ebx,2   ;�N2��Jebx
	imul ebx
	add eax,5
	add Sum,eax 

	mov edx,0   ;�˼ƲĤ@�X�B�z�L�{
	mov eax,All
	div divisor ;�ĤG�ӼƦr��bebx
	mov All,eax
	mov eax,edx ;�N�䲾��eax
	mov ebx,2   ;�N2��Jebx
	imul ebx
	add eax,6
	add Sum,eax
	
	mov edx , OFFSET out2 ;��XAns
	call WriteString
	call Crlf
	mov eax,Sum
	call    WriteInt

	call    crlf 

	call WaitMsg
	INVOKE ExitProcess , 0
main ENDP
END main