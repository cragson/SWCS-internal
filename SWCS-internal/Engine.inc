

; Helper functions
GetAbsoluteAddress proto rel_offset : dword

; Main functions
; return value passend in eax

; BOOL
IsGameLoaded proto
IsIngameMenuOpen proto
IsPlayerAlive proto

; int32_t
GetBrickScore proto
GetSessionTable proto

; float as dword
GetGameTimeInSeconds proto

; void
SetBrickScore proto brick_amount : dword
AddBrickScore proto additional_bricks : dword
AddLevelScore proto additional_bricks : dword