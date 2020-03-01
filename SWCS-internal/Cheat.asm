include C:\masm32_x86\include\masm32rt.inc

include Memory.inc
include Utils.inc
include Offsets.inc

.data
szWelcomeText db 'Ready to use - have fun!', 0
szWelcomeCaption db 'LEGO: Star Wars Complete Saga - Cheat by calb', 0

extern off_BrickScore : dword

.data?

public dwImageBase
dwImageBase dd ?

.code

SetupCheat proc

Get_Image_Base:

	push 100
	call Sleep

	push 0
	call GetImageBase

	cmp eax, 0

	je Get_Image_Base

	mov dword ptr ds:[ dwImageBase ], eax

	push offset szWelcomeText
	push offset szWelcomeCaption
	call UTIL_MsgBox

more_fucking_money:

	mov eax, dword ptr ds:[ dwImageBase ]
	add eax, dword ptr ds:[ off_BrickScore ]

	add dword ptr [ eax ], 0539h

	push 1000
	call Sleep

	jmp more_fucking_money

SetupCheat endp

end