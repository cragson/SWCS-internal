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

UTIL_IsKeyPressed proc vk_key : dword

	push vk_key
	call GetAsyncKeyState

	test eax, 8000h
	
	jne is_pressed

	mov eax, 0

	ret 4

is_pressed:

	mov eax, 1

	ret 4

UTIL_IsKeyPressed endp

end