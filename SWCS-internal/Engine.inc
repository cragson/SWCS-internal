

; Helper functions
GetAbsoluteAddress proto rel_offset : dword

; Main functions
; return value passend in eax

; bools
IsGameLoaded proto
IsIngameMenuOpen proto

; int32_t
GetBrickScore proto

; float as dword
GetGameTimeInSeconds proto

; void
SetBrickScore proto brick_amount : dword