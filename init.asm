PUBLIC init
init proc

        mov     esi, offset _sysdir
        mov     edi, 100h
        call    GetSystemDirectoryA, esi, edi
        call    lstrlen, esi

        mov     _sdl, eax

        call    GetSystemDirectoryA, offset fname, edi
        call    GetSystemDirectoryA, offset newname, edi

        mov     esi, offset _sysfname
        mov     edi, offset fname
        add     edi, _sdl
        mov     ecx, 12
        rep     movsb

        mov     esi, offset _sysnewname
        mov     edi, offset newname
        add     edi, _sdl
        mov     ecx, 12
        rep     movsb

        ret

init endp