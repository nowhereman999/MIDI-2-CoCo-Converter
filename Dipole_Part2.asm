
EndSongData:
        FCB     $FF
OrigIRQ RMB     3
StopAndRestore:
        PSHS    A,X,CC
        ORCC    #$50        * Disable the Interrupts
        LDA     OrigIRQ     * Get the original IRQ vector address
        LDX     OrigIRQ+1   * Get the original IRQ vector address
        STA     $010C       * Restore the original IRQ vector address
        STX     $010D       * Restore the original IRQ vector address
        PULS    A,X,CC,PC
START:
		orcc	#$50
;**************************************
; double note values to save shifts
; on the sequencer
;**************************************
		ldx		#SongData
convert	ldd		,x
		asla
		aslb	
		std		,x++
		cmpx	#EndSongData
		blo		convert
ReStart:
;**************************************
; SOUND ON DAC
;**************************************
		lda		>$ff01			; Select DAC as sound source
		anda	#$f7
		sta		>$ff01
		lda		>$ff03
		anda	#$f7
		sta		>$ff03

		lda		>$ff23
		ora		#8
		sta		>$ff23
;**************************************
; DP for note routine speed
;**************************************
		lda		#DirectPage/256			; note/256
		tfr		a,dp
		setdp	DirectPage/256
;**************************************
; setup vectored IRQ using HSYNC
;**************************************
        LDA     $010C       * Get the original IRQ vector address
        LDX     $010D       * Get the original IRQ vector address
        STA     OrigIRQ     * Save the original IRQ vector address
        STX     OrigIRQ+1   * Save the original IRQ vector address

		LDA		#$0E		* Direct Page Jump instruction Opcode
		LDB		#note-(note/256*256)
		STD		$10C
;**************************************
; NUKE VSYNC IRQ
;**************************************
		lda		$ff03
		anda	#$fe
		sta		$ff03
;**************************************
; ENABLE HSYNC IRQ
;**************************************
		lda		$ff01
		ora		#$3
		sta		$ff01
		lda		$ff00	
;**************************************
; CLEAR IRQ MASK ON THE CPU
;**************************************
		andcc	#$ef
;**************************************
; HANG ABOUT AND DO NUTHIN
; YOUR CODE GOES HERE SPUDZ !!
;**************************************

* To turn off the music and restore the IRQ jump vector add this line to your program
*       JSR     StopAndRestore
*
* Erase the code below and add your own and it will execute with background music
* You can change the ORG statement at the top to start anywhere you want in RAM
* This is just a little demo to show stuff on the screen with music playing in the background

TopScreen:
        LDD     #$0000
        LDX     #$400+32
!       STD     ,X++
        CMPX    #$600-32
        BLO     <
        INC     TopScreen+1
        INC     TopScreen+2
        LDX     #$400
!       LDD     ,U++
        STD     ,X++
        CMPX    #$420
        BLO     <
        LDX     #$600-32
!       LDD     ,U++
        STD     ,X++
        CMPX    #$600
        BNE     <
        BRA     TopScreen
		
		END     START
