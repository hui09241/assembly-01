INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	 out1		 BYTE    "Enter the number of StudetnID：", 0
	 out2		  BYTE    "Answer：", 0
	 divisor     DWORD   10
	 Sum         DWORD    ?
	 All         DWORD    ?
.code
main PROC
	call Clrscr ;清除螢幕
	mov edx , OFFSET out1 ;提醒使用者輸入數字
	call WriteString
	call Crlf
	call ReadInt 

	mov edx,0   ;倒數第一碼處理過程
	div divisor ;第五個數字放在ebx
	mov All,eax
	mov eax,edx ;將其移到eax
	mov ebx,2   ;將2放入ebx
    imul ebx
	add eax,5;加5
	mov Sum,eax

	mov edx,0   ;倒數第二碼處理過程
	mov eax,All
	div divisor ;第四個數字放在ebx
	mov All,eax
	mov eax,edx ;將其移到eax
	mov ebx,3   ;將3放入ebx
	imul ebx
	sub eax,1
	add Sum,eax 

	mov edx,0   ;倒數第三碼處理過程
	mov eax,All
	div divisor ;第三個數字放在ebx
	mov All,eax
	mov eax,edx ;將其移到eax
	mov ebx,5   ;將5放入ebx
	imul ebx
	add eax,6
	add Sum,eax 

	mov edx,0   ;倒數第二碼處理過程
	mov eax,All
	div divisor ;第二個數字放在ebx
	mov All,eax
	mov eax,edx ;將其移到eax
	mov ebx,2   ;將2放入ebx
	imul ebx
	add eax,5
	add Sum,eax 

	mov edx,0   ;倒數第一碼處理過程
	mov eax,All
	div divisor ;第二個數字放在ebx
	mov All,eax
	mov eax,edx ;將其移到eax
	mov ebx,2   ;將2放入ebx
	imul ebx
	add eax,6
	add Sum,eax
	
	mov edx , OFFSET out2 ;輸出Ans
	call WriteString
	call Crlf
	mov eax,Sum
	call    WriteInt

	call    crlf 

	call WaitMsg
	INVOKE ExitProcess , 0
main ENDP
END main