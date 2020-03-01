include C:\masm32_x86\include\masm32rt.inc

include Offsets.inc

include Cheat.inc

extern off_IsGameLoaded		 : dword
extern off_BrickScore		 : dword
extern off_IsIngameMenuOpen  : dword
extern off_GameTimeInSeconds : dword

extern dwImageBase : dword

.code

IsGameLoaded proto

	push ebx
	xor ebx, ebx

	mov ebx, dword ptr [ dwImageBase ]
	add ebx, dword ptr [ off_IsGameLoaded ]

	xor eax, eax

	mov eax, byte ptr [ ebx ]

	pop ebx

	ret

IsGameLoaded endp

GetBrickScore proc
	
	xor eax, eax

	mov eax, dword ptr [ dwImageBase ]
	add eax, dword ptr [ off_IsGameLoaded ]

	mov eax, dword ptr [ eax ]

	ret

GetBrickScore endp

IsIngameMenuOpen proc

	push ebx
	xor ebx, ebx

	mov ebx, dword ptr [ dwImageBase ]
	add ebx, dword ptr [ off_IsIngameMenuOpen ]

	xor eax, eax

	mov eax, byte ptr [ ebx ]

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

end