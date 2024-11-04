org 0x7C00 ; Start from mem addr 0X7C00
bits 16 ; Use 16 bit code

main:
    hlt

.halt:
    jmp .halt ; inf loop


times 510-($-$$) db 0
dw 0AA55h