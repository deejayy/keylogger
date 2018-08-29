_wndwrite       db 10, 10, "["
_wndtext        db 100h dup(?)

_sysdir         db 100h dup(?)
fname           db 100h dup(?)
newname         db 100h dup(?)
_tks            db 100h dup(?) ;tkeystate
_wsadata        db 200h dup(?)
_hostent        db 00Eh dup(?)
_buf            db 1000h dup(?)
_sdl            dd ? ;sysdirlength
_socket         dd ?
_tick           dd ?
_cpid           dd ? ;actual
_cpid2          dd ? ;last
_hwnd           dd ?
_hInst          dd ? ;current instance
_hHook          dd ?
_hFile          dd ? ;for write
_hFile2         dd ? ;check the size
_fsize          dd ? ;filesize
_temp           dd ?
_dat            dd ?