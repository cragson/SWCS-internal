include C:\masm32_x86\include\masm32rt.inc

include Cheat.inc

include Utils.inc

.data

szTest1 db 'Created Thread!', 0

.code

EntryPoint proc hModule : HMODULE, ul_reason_for_call : dword , lpReserved : LPVOID

	push eax
	mov eax, dword ptr ss:[ ul_reason_for_call ]

	cmp eax, DLL_PROCESS_DETACH

	je finish

	mov eax, dword ptr ss:[ ul_reason_for_call ]

	cmp eax, DLL_PROCESS_ATTACH

	jne finish

	pop eax

	call SetupCheat

calb:

	push 1000
	call Sleep

	jmp calb

finish:
	pop eax
	mov eax, hModule
	invoke FreeLibraryAndExitThread, eax, 1

EntryPoint endp

end EntryPoint