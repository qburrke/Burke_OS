print_hex:
	pusha
	mov cx, 0

hex_loop:
	cmp cx, 4
	je end_hex_print

	mov ax, dx
	and ax, 0x000f
	add al, 0x30
	cmp al, 0x39
	jle step2
	add al, 7

step2:
	mov bx, hex_string + 5
	sub bx, cx
	mov [bx], al
	ror dx, 4
	inc cx
	jmp hex_loop

end_hex_print:
	mov bx, hex_string
	call print_string
	popa
	ret

hex_string: db "0x0000", 0

