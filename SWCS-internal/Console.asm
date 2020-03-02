
include C:\masm32_x86\include\masm32rt.inc

.data 

szFilename db 'CONOUT$', 0
szMode	   db 'w', 0

_iobuf STRUCT
    _ptr        DWORD ?
    _cnt        DWORD ?
    _base       DWORD ?
    _flag       DWORD ?
    _file       DWORD ?
    _charbuf    DWORD ?
    _bufsiz     DWORD ?
    _tmpfname   DWORD ?
_iobuf ENDS

stdout MACRO
    call crt___p__iob
    add eax, SIZEOF _iobuf
    EXITM <eax>
ENDM

.code

SetupConsole proc szTitle : dword

	invoke AllocConsole

	invoke crt_freopen, offset szFilename, offset szMode, stdout()

    push szTitle
    call SetConsoleTitleA

	ret 4

SetupConsole endp

end