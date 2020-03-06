include C:\masm32_x86\include\masm32rt.inc

include Offsets.inc

include Cheat.inc

extern off_IsGameLoaded		 : dword
extern off_BrickScore		 : dword
extern off_IsIngameMenuOpen  : dword
extern off_GameTimeInSeconds : dword
extern off_LevelScore		 : dword

extern dwImageBase : dword

.code

GetAbsoluteAddress proc rel_offset : dword

	mov eax, dword ptr [ dwImageBase ]
	add eax, rel_offset

	ret 4

GetAbsoluteAddress endp

GetBrickScore proc
	
	xor eax, eax

	mov eax, dword ptr [ dwImageBase ]
	add eax, dword ptr [ off_BrickScore ]

	mov eax, dword ptr [ eax ]

	ret

GetBrickScore endp

IsGameLoaded proc

	push ebx
	xor ebx, ebx

	mov ebx, dword ptr [ dwImageBase ]
	add ebx, dword ptr [ off_IsGameLoaded ]

	xor eax, eax

	movzx eax, byte ptr [ ebx ]

	pop ebx

	ret

IsGameLoaded endp

IsIngameMenuOpen proc

	push ebx
	xor ebx, ebx

	mov ebx, dword ptr [ dwImageBase ]
	add ebx, dword ptr [ off_IsIngameMenuOpen ]

	xor eax, eax

	movzx eax, byte ptr [ ebx ]

	pop ebx

	ret

IsIngameMenuOpen endp

GetGameTimeInSeconds proc

	xor eax, eax

	mov eax, dword ptr [ dwImageBase ]
	add eax, dword ptr [ off_GameTimeInSeconds ]
	
	mov eax, dword ptr [ eax ]

	ret

GetGameTimeInSeconds endp

SetBrickScore proc brick_amount : dword

	push eax

	mov eax, dword ptr [ dwImageBase ]
	add eax, dword ptr [ off_BrickScore ]

	cmp eax, 0

	je fail

	push ebx
	xor ebx, ebx
	mov ebx, brick_amount

	mov dword ptr [ eax ], ebx

	pop ebx

	pop eax

	ret 4

fail:
	pop eax

	ret 4

SetBrickScore endp

AddBrickScore proc additional_bricks : dword
	push eax

	mov eax, dword ptr [ dwImageBase ]
	add eax, dword ptr [ off_BrickScore ]

	push ebx
	mov ebx, dword ptr [ eax ]
	add ebx, additional_bricks
	mov dword ptr [ eax ], ebx

	pop eax

	ret 4

AddBrickScore endp

AddLevelScore proc additional_bricks : dword
	push eax

	mov eax, dword ptr [ dwImageBase ]
	add eax, dword ptr [ off_LevelScore ]

	push ebx
	mov ebx, dword ptr [ eax ]
	add ebx, additional_bricks
	mov dword ptr [ eax ], ebx

	pop eax

	ret 4

AddLevelScore endp

end