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
    
    ; reset ebx for stack population
    mov     ebx, 1
    
; populate stack
forLoop:
    cmp     ebx, eax
    jg      cont
    push    ebx
    inc     ebx
    jmp     forLoop
    
cont:    
    dec     ebx
    mov     esi, eax
    mov     eax, 0
    mov     ecx, ebx

; pop int's and add to eax  
forLoop2:
    cmp     ebx, 1
    je      cont2
    pop     ebx
    add     eax, ebx
    jmp     forLoop2

; compute avg
cont2:
    nop
    
    ; div
    div     ecx
    mov     edi, eax
    mov     eax, esi
    mov     ecx, 0

; round 3, check if 20-30 
forLoop3:
    cmp     ebx, eax
    jg      cont3
    cmp     ebx, 20
    je      skip
    push    ebx
    inc     ebx
    inc     ecx
    jmp     forLoop3

; skip from 20 to 30   
skip:
    add     ebx, 10
    jmp     forLoop3
    
cont3:    
    dec     ebx
    mov     esi, eax
    mov     eax, 0
    mov     esi, ebx

; pop vals from stack to ebx and add to eax   
forLoop4:
    cmp     ebx, 1
    je      cont4
    pop     ebx
    add     eax, ebx
    jmp     forLoop4

cont4:        
    div     ecx
    
    ; calculate range
    mov     ebx, eax
    mov     eax, esi
    sub     eax, ebx
    
    ; exit
    nop
    mov     ebx, 0
    mov     ecx, 0
    mov     edx, 0
    leave
    ret
    ; whoop