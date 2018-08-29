PUBLIC int2str
int2str proc

        mov     ecx, edi
        mov     esi, 10
        mov     ebx, edx
@@1:    xor     edx, edx
        xchg    eax, ebx
        div     esi
        xchg    eax, ebx
        div     esi
        add     dl,'0'
        cmp     dl,'0'+10
        jb      @@2
        add     dl,'a'-'0'-10
@@2:    dec     edi
        mov     byte ptr [edi], dl
        mov     edx, eax
        or      edx, ebx
        jne     @@1
        sub     ecx, edi
        ret

int2str endp