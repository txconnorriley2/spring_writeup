global _main

section .text
_main:
        push    ebp                
        mov     ebp, esp

        ; pushing int's 4, 77, 18, 57, 9
        push    4
        push    77
        push    18
        push    57
        push    9
        
        ; prep eax, ebx
        mov     eax, 0
        mov     ebx, 0
        
        ; pop int's and add into eax 
        pop     ebx ; 9
        add     eax, ebx
        pop     ebx ; 57
        add     eax, ebx 
        pop     ebx ; 18
        add     eax, ebx     
        pop     ebx ; 77
        add     eax, ebx
        pop     ebx ; 4
        add     eax, ebx

        ; prep for div
        mov     ebx, 5
        mov     ecx, 0
        mov     edx, 0
        
        ; div
        div     ebx
        
        ; exit
        leave
        ret
             
