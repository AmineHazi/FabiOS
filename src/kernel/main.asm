org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A

start:
    jmp main



;
; Prints a string to the screen
; Parameters:
;     - ds:si - pointer to the string
; 
puts:
    ; save registers we will modify
    push si
    push ax
    push bx

.loop:
    lodsb               ; load next character in al
    or al, al           ; check if al is 0 (end of string)
    jz .done            ; if al is 0, we are done

    mov ah, 0x0E        ; teletype output
    mov bh, 0x00        ; page number
    int 0x10            ; call BIOS interrupt

    jmp .loop

.done:
    ; restore registers
    pop bx
    pop ax
    pop si
    ret


main:
    
    ; setup data segment
    mov ax, 0           ; can't write to ds/es directly
    mov ds, ax
    mov es, ax

    ; setup stack
    mov ss, ax
    mov sp, 0x7C00

    ; print message
    mov si, msg_hello
    call puts

    hlt


.halt:
    jmp .halt


msg_hello: db 'Hello, World!', ENDL, 0


times 510-($-$$) db 0
dw 0xAA55