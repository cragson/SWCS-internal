include C:\masm32_x86\include\masm32rt.inc

include Cheat.inc

include Utils.inc

.data

.code

EntryPoint proc hInstDll : dword, ul_reason_for_call : dword , lpReserved : dword

	mov eax, ul_reason_for_call

	cmp eax, DLL_PROCESS_ATTACH

	je process_attach

	mov eax, ul_reason_for_call

	cmp eax, DLL_PROCESS_DETACH

	je process_detach

	mov eax, 0

	ret 12

process_attach:
	
	push 0
	push 0
	push 0
	push SetupCheat
	push 0
	push 0
	call CreateThread

	mov eax, 1
	ret 12

process_detach:

	push 1
	push hInstDll
	call FreeLibraryAndExitThread

EntryPoint endp

end EntryPoint