#define INTRCTL 0e000h

.text


_kernelsp:
	.word 0
        
	.globl _switch_to_task
_switch_to_task:
	; Save our context
        im _memreg
        load

	loadsp 8 ; Task pointer
        loadsp 0
        im 4
        add
        load	; PC
        loadsp 0
        loadsp 8
	im 8
        add
        load	 ; Load SP
        im 4 
        add	 ; Move 1-word up
        loadsp 0 ; Duplicate
        loadsp 8 ; Load PC
        loadsp 8 ; Load SP again
        store    ; Store PC to SP
        pushsp
        im _kernelsp
	store    ; save kernel SP before switching
        popsp
        poppc


	.globl _save_task
_save_task:
	im thistask
        load
        loadsp 44 ; This is caller address.
        pushsp 
        im 52
        add       ; And this is Stack Pointer
        loadsp 8  ; This task
        im 8 
        add	     
        store     ; Save SP address
        loadsp 4  ; caller
        im 4
        add
        store	  ; Store PC address
        im _kernelsp
        load
        popsp	  ; restore kernel SP
        im schedule
        poppc
        
        breakpoint
        