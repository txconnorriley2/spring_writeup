global _main

section .text
_main:
    mov ebp, esp; for correct debugging
    push    ebp                
    mov     ebp, esp
    mov     eax, 0
    mov     ebx, 0
    mov     ecx, 0
    
; push vals to stack    
forLoop:
    cmp     eax, 100
    jg      cont
    push    eax
    inc     eax
    cmp     eax, 43
    je      meaningOfLife
    inc     ecx
    jmp     forLoop
    
; push 42, 9 more times to stack  
meaningOfLife:
    cmp     ebx, 9
    je      forLoop
    push    42
    inc     ebx
    inc     ecx
    jmp     meaningOfLife
    
cont:
    ; num iterations
    mov     eax, ecx
    
    ; reset reg's
    mov     eax, 1
    mov     ebx, 0
    mov     ecx, 0
    mov     edx, 0
 
; pop vals off stack to edx, check if under 30, save sum to ebx
forLoop2:
    pop     edx
    add     ebx, edx
    cmp     edx, 0
    je      EXIT
    cmp     edx, 30
    jl      multiply
    jmp     forLoop2
    

; multiply any vals < 30, store in eax
multiply:   
    mul     edx    
    jmp     forLoop2
    
; exit pgm
EXIT:
    nop
    mov     eax, 0
    mov     ebx, 0
    mov     ecx, 0
    mov     edx, 0
    mov     esi, 0
    mov     edi, 0
    leave
    ret