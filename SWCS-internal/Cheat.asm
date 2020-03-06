include C:\masm32_x86\include\masm32rt.inc

include Memory.inc
include Utils.inc
include Offsets.inc
include Console.inc
include Engine.inc

.data
szWelcomeText db 'Ready to use - have fun!', 0
szWelcomeCaption db 'LEGO: Star Wars Complete Saga - Cheat by calb', 0

extern off_BrickScore		  : dword
extern off_IsGameLoaded		  : dword
extern off_GameTimeInSeconds  : dword
extern off_IsIngameMenuOpen   : dword
extern off_LevelScore		  : dword

.data?

public dwImageBase
dwImageBase dd ?

.code

SetupCheat proc

	pushad

Get_Image_Base:

	push 100
	call Sleep

	push 0
	call GetImageBase

	cmp eax, 0

	je Get_Image_Base

	mov dword ptr ds:[ dwImageBase ], eax

	push offset szWelcomeCaption
	call SetupConsole
	
	printf("\n[+] Offsets (relative) [+]\n")

	mov eax, dword ptr ds:[ dwImageBase ]
	printf("\n\t%s%s\n", "Imagebase: 0x", uhex$( eax ) )
	
	mov eax, off_BrickScore
	push eax
	call GetAbsoluteAddress
	printf("\t%s%s\n", "BrickScore: 0x", uhex$( eax ) )

	mov eax, off_GameTimeInSeconds
	push eax
	call GetAbsoluteAddress
	printf("\t%s%s\n", "GameTimeInSeconds: 0x", uhex$( eax ) )

	mov eax, off_IsGameLoaded
	push eax
	call GetAbsoluteAddress
	printf("\t%s%s\n", "IsGameLoaded: 0x", uhex$( eax ) )

	mov eax, off_IsIngameMenuOpen
	push eax
	call GetAbsoluteAddress
	printf("\t%s%s\n", "IsIngameMenuOpen: 0x", uhex$( eax ) )

	mov eax, off_LevelScore
	push eax
	call GetAbsoluteAddress
	printf("\t%s%s\n", "LevelScore: 0x", uhex$( eax ) )

	popad

sleep_again:

	push 450
	call Sleep
	
	push VK_NUMPAD0
	call UTIL_IsKeyPressed

	cmp eax, 1

	je AddSomeBricks

	jmp sleep_again

AddSomeBricks:

	push 1000h
	call AddBrickScore

	push 1000h
	call AddLevelScore

	jmp sleep_again

	ret

SetupCheat endp

end