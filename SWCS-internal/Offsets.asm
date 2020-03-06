
include C:\masm32_x86\include\masm32rt.inc

.data

public off_IsGameLoaded
public off_BrickScore
public off_IsIngameMenuOpen
public off_GameTimeInSeconds
public off_LevelScore

off_IsGameLoaded		 dd 0046E4C0h ; size: byte
off_BrickScore			 dd 0046E4DCh ; size: dword
off_IsIngameMenuOpen	 dd 00521568h ; size: byte
off_GameTimeInSeconds    dd 0046E4E8h ; size: float/dword
off_LevelScore			 dd 00455F38h ; size: dword

end