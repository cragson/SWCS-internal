include C:\masm32_x86\include\masm32rt.inc

.code
UTIL_MsgBox proc dwCaption : DWORD, dwText : DWORD

	push MB_OK
	push dwCaption
	push dwText
	push 0
	call MessageBoxA

	ret 8

UTIL_MsgBox endp

end