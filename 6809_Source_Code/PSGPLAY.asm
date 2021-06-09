**************************************
* This is a music player for Ed Snider's CoCo PSG Cartridge for the Tandy Color Computer
* The YM2149 sound chip is a clone of the AY-3-8910 Sound chip with a few differences
*
**************************************
* CoCoPSG background Player for BASIC Version 1.00 - By Glen Hewlett
* Do whatever you want with this code...  Have fun!
*
* Playback of notes and velocity info on the CoCoPSG is done by sending the note and velocity data to the CoCo PSG.
* The data file includes a counter that is the number of every two vsync's which is 30 times a second in NTSC
* The player then counts down until the number reaches zero then the new notes or velocity info is sent to the CoCo PSG, etc.
* This means the player uses very little CPU cycles as a background process since it only reads the data and sends it to the
* CoCo PSG when the note or velocity change is needed and this countdown is done every 2nd vsync.
*
* 5 Byte header:
* Byte  Value
* 00-02 'PSG' - Header Identifier
* 03    $xx - File version # currently only supprts a value of $01 for version 1.00
* 04    $xx - Number of times to loop this song where xx is:
*       $00 - Don't change the number of loops value
*       $01 to $FE - loop this number of times
*       $FF - loop forever
* All bytes at this point are data bytes that are encoded as per the info below.
*
* First the descriptor byte
*  Left nibble  = # of vsyncs/2 to count until next change in tone or velocity is done
*  $0x to $Fx   = 0 to 15 delay count before next note or velocity change, add one to get real value of 1 to 16
*
*  Right nibble = # of bytes to copy (1-11) count of bytes to copy max needed in current format is 3x3 = 9 bytes = (2 tone values, 1 velocity value for each of the 3 voices)
* or if the value of the right nibble is higher then 11 or $0B then do the following
*  $x0          = 00 unused
*  $xC          = 12 signals the repeat count is larger then 16 so use the next byte as the repeat count (left nibble = bytes to copy)
*  $xD          = 13 signals the repeat count is larger then 256 so use the next 2 bytes as the repeat count (left nibble = bytes to copy)
*  $xE          = 14 Header start identifier, which also includes info of the version #, loop counter and if Channel C is a noise/drum track
*  $xF          = 15 signals End of Music data
*
* Next process the data bytes
*
* My PSG playback format uses the following format for the data bytes
*
*          ,------------- 0=Note, 1=Volume or channel C Noise/Drum frequency
*          |      ,,----- Channel  00=chan A, 01=chan B, 10=chan C, 11=chan C - Drum/Noise info
*          |      ||
*          |Xxx xx||  x=volume or msb of 12 bit tone info or Xxxxx = 5 bit noise/drum frequency for channel C
*          1000 0001
* If it is a Note then it has the 4 msb of the 12 bit tone and the next byte has the 8 lsb's of the 12 bit tone value (so two bytes are always needed for tone data)
* Done, the next byte is the next encoded byte...
*
**************************************
BANK0REG    EQU $FF5A       	* Register for Memory Bank A Range $C000 to $DFFF
BANK1REG    EQU $FF5B       	* Register for memory Bank B range $E000 to $FEFF (not used in this program)
CONTROL_REG EQU $FF5D       	* Setup feature of the CoCo PSG
								* BIT FUNCTION
								* 7 not used
								* 6 not used
								* 5 FLASH programming enable; 0=disabled, 1=enabled
								* 4 Autostart enable; 0=enabled, 1=disabled
								* 3 Write Enable (for FLASH/SRAM); 0=disabled, 1=enabled
								* 2 Gameport B SEL signal (pin 7 of controller port B)
								* 1 Gameport A SEL signal (pin 7 of controller port A)
								* 0 YM2149 MASTER CLOCK; 0=2MHz, 1=1MHz
							
YM_RegSel   EQU $FF5E           * Address for the YM2149 Register Select Port
YM_Data     EQU $FF5F           * Address for the YM Data Port

MPI_Reg     EQU $FF7F           * Address for Multi Pak Interface Slot selector Register

        opt     cd
        ORG     $7B7A           * 16k CoCo change ORG Value to $3B7A
                                * 32k CoCo, 64k CoCo or a CoCo 3 change ORG Value to $7B7A

LoopSong FCB	$FF				* How many times do you want to loop the song (1 to 254), $FF=255 = continuous loop

		LBRA	StopPlayback	* EXEC jump point to Stop playback from BASIC
		LBRA	Continue		* EXEC jump point to Continue playback after stopping playback from BASIC
START
		PSHS	D,X,U,CC    	* Save the registers
        ORCC    #$50            * If you are going to use real IRQ's instead of polling VWAIT then change this section to enable the IRQs
* Test if we are running on a CoCo 3, if so we need to go back to RAM mode when exiting our code
		LDD		$FFFE			* Get the Reset Interrupt address
		CMPD	#$8C1B			* If it's $8C1B then it is a CoCo 3
		BNE		>
		LDA		#$DF			* Since it's a CoCo 3 then we need to self modify the code below, so that we jump back to RAM mode when we exit our code
								* We use $DF to change the CLR $FFDE (ROM mode) to CLR $FFDF (RAM mode) in the 3 locations
		STA		RomRam1+2		* Initial Setup of IRQ and BASIC hook is setup
        STA     RomRam2+2       * Done playing the notes and setting up the repeat value
        STA     RomRam3+2       * Done playing the song, reset buffer pointer and check repeat value

* Setup the CoCoPSG so it doesn't autostart and get the MPI Slot of the CoCoPSG so we can switch back and forth using it and the Disk drive
!       LBSR    FindCoCoPSG
        STB     CoCoPSGSlot     * B now has the slot # (0 to 3) value
        LDA     MPI_Reg         * GET Original MPI REG
        STA     MPI             * Save the Original MPI value so we can swap back to the Disk controller to continue loading
        ANDA    #%11111100      * SCS TO CoCo PSG SLOT (user selected) - LEAVE *CART/CTS ON ORIGINAL SLOT
        ORA     CoCoPSGSlot     * Add the user slot value (0 to 3 at this point)
        STA     MPI_Reg         * SWITCH SCS Only
        LDA     #%00010000      * DISABLE AUTOSTART
        STA     CONTROL_REG     * WRITE PSG CONTROL REG
        LDA     MPI_Reg         * GET MPI REG
        LSLB                    * Setup B with the CART/CTS and SCS selection based on the user input #
        LSLB
        LSLB
        LSLB                    * Shift value (0 to 3) left 4 so that it is for the CART/CTS value
        ORB     CoCoPSGSlot     * B now has the proper values for the users CoCo PSG slot for the Cart/CTS and SCS
        STB     CoCoPSGSlot     * Save the new value so we can OR the value into it
        ANDA    #%11001100      * CTS and SCS TO SLOT User selected slot
        ORA     CoCoPSGSlot     * Add the user slot value (0 to 3 at this point)
        STA     MPIPSG          * Save the CoCo PSG MPI selection
        STA     MPI_Reg         * Update MPI with new value

        CLR     $FFDE           * Go to ROM mode - Must be in ROM mode to read/write the CoCo PSG's 512k RAM
* Setup pointer to music data to the start of the song
        LDA     #128            * Set PSG Bank0 to the first 8k Block of it's RAM
        STA     BANK0REG
        LDX     #$C000
        STX     RAMPointer
        LDU     #Buffer         * Set Music data to point to the start of the music data
        STU     PointerM        * Save it
!       LDD     ,X++			* Fill the playback buffer
        STD     ,U++
        CMPX    #$C000+$110
        BNE     <
RomRam1:
        CLR     $FFDE           * Go to ROM mode (self modified to CLR $FFDF) if we are using a CoCo 3
        LDA     MPI             * Change MPI Back to previous (original) slot value
        STA     MPI_Reg         * Update MPI with new value
************
* 5 Byte header:
* Byte  Value
* 00-02 'PSG' - Header Identifier
* 03    $xx - File version # currently only supprts a value of 01 for version 1.00
* 04    $xx - Number of times to loop this song where xx is:
*       $00 - Don't change the number of loops value
*       $01 to $FE - loop this number of times
*       $FF - loop forever
************
        LDU     #$400           * Top of screen
        LDX     PointerM		* Load X with the current music data pointer in the Buffer space
        LDD     ,X++            *
		CMPD	#$5053			* Start of song data must be "PS"
		BNE		NotPSGFile  	* Print not a PSG file and Exit if not
        LDD     ,X++            * A='G', B=File version #
        CMPA    #$47			* Start of song file must be "G"
        BEQ     >               * If it's equal then it is a PSG file, go check the version #
NotPSGFile:
        BSR     PrintERROR      * File is not a PSG file, Print ERROR: to the screen
        BSR     PrintString     * Go print the text in the next line on screen
        FCC     'NOT'
        FCB     $60             * Space character code
        FCC     'A'
        FCB     $60
        FCC     'PSG'
        FCB     $60
        FCN     'FILE'
        JMP     Exit0           * Exit before we setup IRQ
!
        CMPB    #1              * See if the version # is a 1
        BEQ     >       		* This player can only handle version 1 files.  If it's a 1 then go play the song :)
UnknownVersion:
        BSR     PrintERROR      * File is not a version 1 PSG format file, Print ERROR: to the screen
        BSR     PrintString     * Go print the text in the next line on screen
        FCC     'CAN'
        FCB     $60
        FCC     'ONLY'
        FCB     $60
        FCC     'PLAY'
        FCB     $60
        FCC     'VERSION'
        FCB     $60
        FCB     $71             * '1' - Black foreground and green background to match the CoCo screen #1
        FCB     $60
        FCC     'PSG'
        FCB     $60
        FCN     'FILE'
		JMP		Exit0			* File is a PSG file but can't play this version # don't try to play this song, Exit before we setup IRQ
PrintERROR:
        JSR     PrintString     * Go print the text in the next line on screen
        FCC     'ERROR'
        FDB     $7A00           * Colon and zero (null) terminater
        RTS                     * Return
PrintString:
        LDX     ,S              * Get address of the Text to print off the stack
        BRA     PS_Skip1
PS_Print1:
        STA     ,U+
PS_Skip1:
        LDA     ,X+
        BNE     PS_Print1       * Did we find the end terminator (which is zero)?  If not go print byte and get another...
        STX     ,S              * Put the return address which is just after the text that was printed, back on the stack
        RTS
!
		LDA		,X+				* Get the value for Loop counter
		BEQ		>				* Skip changing the loop counter if this value is zero
		STA		LoopSong		* Otherwise update the LoopSong value
!
		STX     PointerM		* Update the file pointer to the start of the music data
        CLR     NoiseFlag       * Set the Tone/Noise value for channel C to start setting of 00 = Tone data
        LDA     MPIPSG          * Change MPI to CoCo PSG Slot
        STA     MPI_Reg         * Update MPI with new value
        LBSR    PlaySetup       * Initialize the playback settings

CarryOn:
* Back to normal MPI Slot
        LDA     MPI             * Change MPI Back to previous (original) slot value
        STA     MPI_Reg         * Update MPI with new value

* If we are going to keep basic running and have this player code running in the background we are going to have to intercept BASIC`s IRQ
* and run our code then pass the IRQ control back to BASIC
		LDX		$10D			* BASIC jump pointer for IRQ address we will jump back to this address at the end of our play routine
		STX		Back2+1
		LDX		#IRQEntry		* Get our IRQ Start address
		STX		$10D			* Store it on the IRQ jump address, so it will now jump to our routine everytime an IRQ is triggered
		
* $FF01 (65281) PIA 0 side A control reg - PIA0AC     CoCo 1/2/3
* Bit 7 HSYNC Flag 0=not Sync, 1=Hsync is triggered
* Bit 6 Unused
* Bit 5 1
* Bit 4 1
* Bit 3 Select Line LSB of MUX
* Bit 2 DATA DIRECTION TOGGLE 0 = $FF00 sets data direction 1 = normal
* Bit 1 IRQ POLARITY 0 = flag set on falling edge 1=set on rising edge
* Bit 0 HSYNC IRQ 0 = disabled 1 = enabled
		
* $FF03 (65283) PIA 0 side B control reg - PIA0BC CoCo 1/2/3
* Bit 7 VSYNC FLAG 0=not Sync, 1=Vsync is triggered
* Bit 6 N/A
* Bit 5 1
* Bit 4 1
* Bit 3 SELECT LINE MSB of MUX
* Bit 2 DATA DIRECTION TOGGLE 0 = $FF02 sets data direction 1=normal
* Bit 1 IRQ POLARITY 0=flag set on falling edge 1=set on rising edge
* Bit 0 VSYNC IRQ 0=disabled 1=enabled 

* Setup Cartridge as the sound source
* $FF03 bit 3 $FF01 Bit 3 Sound Source
*     0           0  DAC
*     0           1  Cassette
*     1           0  Cartridge ***
*     1           1  No Sound
* 1 bit audio output is not included here and can be used independantly of the above sources
        LDA     $FF03           * PIA 0 side B control reg - PIA0BC
        ORA     #%00001000      * Bit 3 is the Select Line MSB of MUX set it to 1 for Cartridge source select
        STA     $FF03           * Save settings
        LDA     $FF01           * PIA 0 side A control reg - PIA0AC
        ANDA    #%11110111      * Bit 3 is the Select Line LSB of MUX set it to 0 for Cartridge source select
        STA     $FF01           * Save settings

* Also must enable sound output
        LDA     $FF23           * PIA 1 side B control reg - PIA1BC
        ORA     #%00001000      * Set bit 3 to enable sound output
        STA     $FF23           * Save settings
Exit0:
		PULS	D,X,U,CC,PC	    * Now that our Music playing routine is setup we can return to BASIC

StopPlayback:
		PSHS	D,CC		    * Save registers, we are going to return the IRQ back to normal
		ORCC    #$50    	    * Disable the Interupts
* Select the CoCo PSG in the MPI
        LDB     MPIPSG          * Change MPI to CoCo PSG Slot
        STB     MPI_Reg         * Update MPI with new value
* Turn off audio output of the YM2149
        LDD     #$073F          * Channel 7 = Mixer,  disable Channel A,B and C, 1 = disabled, keep joysticks enabled
        STD     YM_RegSel       * Update the mixer register
* Back to normal MPI Slot
        LDA     MPI             * Change MPI Back to previous (original) slot value
        STA     MPI_Reg         * Update MPI with new value
		LDD		Back2+1			* Get the old IRQ jump pointer
		STD		$10D			* Place it back to normal
		PULS	D,CC,PC 		* Now that our Music playing routine is removed from the IRQ we can return to BASIC
		
Continue:
		PSHS	D,X,U,CC		* Save the registers
		ORCC    #$50    	    * Disable the Interupts
* Select the CoCo PSG in the MPI
        LDB     MPIPSG          * Change MPI to CoCo PSG Slot
        STB     MPI_Reg         * Update MPI with new value
        LDD     #$0738          * Register 7 = mixer Register, #%00111000  * $F8 = Enable Channel A,B and C as Tone data, 0 = selected
        TST     NoiseFlag       * Value to keep track if Channel C is currenlty playing Noise or Not, 00 = playing tones, $FF = playing Noise
        BEQ     >
*     Mixer Channel select
*                 ,,---------I/O
*                 ||,,,------Noise
*                 |||||,,,---Tone
*                 BACBACBA
        LDB     #%00011100      * = $DC Enable Channel C as noise, B and A as Tone data, 0 = selected
!       STD     YM_RegSel
		BRA		CarryOn			* Carry on as if we are starting music playback including setting up the IRQ again, but we don't set the pointer to the music data
***************************
* Main loop starts here, checks to see if the Interrupt is a Vsync, if so handle the music playback otherwise jump back to BASIC
***************************
IRQEntry:
		TST 	$FF03 			* Check for 60HZ (Vsync) Interrupt
		BMI 	PlayMusic		* If IRQ is Vsync (bit 7 of $FF03 is set) then do our play routine

Back2:
  							    * Continue back to BASIC`s own IRQ
		JMP		>$0000			* This address gets setup from a little self modifying code at the start of the setup code
								* Force extended mode (using the > sign) just incase the assembler thinks it's in the Direct Page DP area

Back:
        LDA     MPI             * Change MPI Back to previous (original) slot value
        STA     MPI_Reg         * Update MPI with new value
        PULS    D,X,Y,U,CC
        BRA     Back2

PlayMusic:
        COM     Every2nd		* We only process sound events every 2nd vsync (save more CPU time)
        BEQ     Back2		    * Loop back every 2nd vsync, no need to set the MPI slot, we haven't touched it at this point
		
;* Show the running time on the screen (This section can be removed, it's only here for testing the player)
;        DEC     Timer			* triggered 30 times every second
;        BNE     Playnotes   	* If we haven't reached zero yet then don't update the time
;        LDB     #30				* reset the timer back to 30
;        STB     Timer			* save the value
;        LDA     Seconds2		* check if the ones value of the # of seconds
;        CMPA    #$39			* if it is a nine then make it a zero
;        BEQ     >				* make it a zero and add to the tens value of the # of seconds
;        INCA					* Otherwise update
;        STA     Seconds2		* Save
;        BRA     Playnotes		* Go process music data
;!       LDA     #$30			* set the ones value to zero
;        STA     Seconds2		* Save it
;        LDA     Seconds1		* Get the tens value of the seconds
;        CMPA    #$35			* check if it is a 5
;        BEQ     >				* If so then add one to minute value
;        INCA					* otherwise add 1 to the tens value of the seconds
;        STA     Seconds1		* save it
;        BRA     Playnotes		* Go process music data
;!       LDA     #$30			* Set the tens value of the seconds
;        STA     Seconds1		* to a zero
;        LDA     Minutes2		* Get the ones value of the minutes
;        CMPA    #$39			* check if it is a nine
;        BEQ     >				* if so then go add one to the tens of the minute value
;        INCA					* otherwise increment the ones value of the seconds
;        STA     Minutes2		* update the value
;        BRA     Playnotes		* Go process music data
;!       LDA     #$30    		* Set the ones value of the minutes
;        STA     Minutes2		* to zero
;        INC     Minutes1		* add one the tens value of the minutes
;* End of time on screen display code.  The above can be removed
	
* New Encoding:
* Encoding byte
*                left nibble = # of times to repeat          1 to 15 repeat count
*
*                right nibble = # of bytes to copy (1-11)    count of bytes to copy
*                                                            12 signals the repeat count is larger then 16 so use the next byte as the repeat count     (left nibble = bytes to copy)
*                                                            13 signals the repeat count is larger then 255 so use the next 2 bytes as the repeat count (left nibble = bytes to copy)
*                                                            14 Flip Channel C from/to noise or drum track
*                                                            15 signals End of File

* Play music
Playnotes:
        DEC     RepeatCount+1   * decrement the LSB counter
        BNE     Back2           * if not zero yet then go back
        TST     RepeatCount     * Get the value of the MSB number of repeat counter
        BEQ     >               * If we are now at zero then go get new notes to play
        DEC     RepeatCount     * otherwise decrement the MSB of the counter
GoBack:
        BRA     Back2           * Done go back to wait for the vsync trigger (actually every second vsync), no need to set the MPI slot, we haven't touched it at this point

* We are now loading another set of commands for the YM chip
* Check and Copy data to the buffer so we don't have to keep checking if X>$DFFF to load a new bank of RAM in down below
!       PSHS    D,X,Y,U,CC      * Backup the registers we are going to use
        LDB     MPIPSG          * Change MPI to CoCo PSG Slot
        STB     MPI_Reg         * Update MPI with new value

        LDX     PointerM		* Load X with the current music data pointer in the Buffer space
        CMPX    #Buffer+$100    * See if the pointer is less then $100
        LBLO    GetNext         * skip if less
        ORCC    #$50            * Stop all Interrupts
        CLR     $FFDE           * Go to ROM mode

        LEAX    -$100,X
        STX     RestoreX+1      * Store value down below (little self modifying code)
        LDA     RAMPointer      * Check if our RAM pointer has reached the end of the PSG 8k block at $E000
        INCA
        CMPA    #$DF            *
        BLO     >
        CMPA    #$E0
        BEQ     DoneBlock
* We are going to need to load from $DF00 to $DFFF and switch to the next BANK to fill up the extra bit of the Buffer, if we get to this point
        STA     RAMPointer      *
        LDU     RAMPointer      * Source
        LDY     #Buffer         * Destination
        STS     RestoreS1+2
Loop:
        PULU    D,X,S
        STD     ,Y
        STX     2,Y
        STS     4,Y
        PULU    D,X,S
        STD     6,Y
        STX     8,Y
        STS     10,Y
        PULU    D,X
        STD     12,Y
        STX     14,Y
        LEAY    16,Y
        CMPY    #Buffer+$100
        BNE     Loop
RestoreS1:
        LDS     #$0000

        INC     BANK0REG        * Point to PSG new memory Bank
        LDX     #$C000
Loop1:
        LDD     ,X++
        STD     ,Y++
        LDD     ,X++
        STD     ,Y++
        CMPY    #Buffer+$110
        BNE     Loop1
        DEC     BANK0REG        * Put it back to the last block in PSG memory Bank
        BRA     RestoreX

* Change to next Memory Block
DoneBlock:
        INC     BANK0REG        * Point to PSG new memory Bank
        LDA     #$C0
!       STA     RAMPointer      *
Done2nd:
        LDU     RAMPointer      * Source
        LDY     #Buffer         * Destination
        STS     RestoreS2+2
!       PULU    D,X,S
        STD     ,Y
        STX     2,Y
        STS     4,Y
        PULU    D,X,S
        STD     6,Y
        STX     8,Y
        STS     10,Y
        PULU    D,X
        STD     12,Y
        STX     14,Y
        LEAY    16,Y
        CMPY    #Buffer+$110
        BNE     <
RestoreS2:
        LDS     #$0000
RestoreX:
        LDX     #$0000          * Value gets changed by self modifying code above
RomRam2:
        CLR     $FFDE           * Go to ROM mode (self modified to CLR $FFDF) if we are using a CoCo 3
GetNext:
        LDB     ,X				* Get the first byte which has the repeat and data byte count info
		ANDB	#$0F			* Clear off the left nibble info
		CMPB	#12				* check if the right nibble is
		BLO		Normal			* lower then 12 then the byte is a normal byte where the left nibble is 0 to 15 and the right nibble is the # of music data bytes to copy
		LBEQ	SmallCount		* if the right nibble is equal to 12 then handle an 8 bit value for the count
		CMPB	#13				* Check the right nibble is
		LBEQ	BigCount		* equal to 13 if so go deal with big count (16 bit) value (next byte holds the repeat count value)
		CMPB	#14				* value of 14 flips Channel C Noise/Tone Flag and sets the mixer type accordingly
        LBNE    Exit1           * Must be 15 so EOF, Reached End of file we are done
* If we get here then the value is 14 or $0E
		COM		NoiseFlag		* Value to keep track if Channel C is currenlty playing Noise or Not, 00 = playing tones, $FF = playing Noise
		BEQ		NowTone			* If it's now zero then it was $FF so switch from Noise to normal Tone mode
NowNoise:
*     Mixer Channel select
*                 ,,---------I/O
*                 ||,,,------Noise
*                 |||||,,,---Tone
*                 BACBACBA
        LDB     #%00011100      * = $DC Enable Channel C as noise, B and A as Tone data, 0 = selected
		BRA		>
NowTone:
*     Mixer Channel select
*                 ,,---------I/O
*                 ||,,,------Noise
*                 |||||,,,---Tone
*                 BACBACBA
        LDB     #%00111000      * = $F8 Enable Channel C as normal Tone data, B and A as Tone data, 0 = selected
!
        LDA     #$07            * A = Channel 7 (Mixer Register), B = Tone/Noise for the Channel C
        STD     YM_RegSel       * Update YM Chip with this info
        LEAX    1,X
        BRA     GetNext
Normal:
        LDA     ,X+             * get the # of times to repeat these values, position X to point at the values to be copied
		LSRA					* Shift left nibble to the right nibble
		LSRA                    * ""
		LSRA                    * ""
		LSRA					* A now has the correct # of times to be repeated
		STA		RepeatCount+1	* Save the repeat count
SetByteCount:
        CLRA
        TFR     D,Y             * Y now has the number of bytes to be sent to the YM2149 sound chip
CopyBytes:
        CLRA                    * Clear A, we will use A to identify the channel
        LDB     ,X+   			* Get byte value
        BMI     VolumeChange    * If bit 7 is high then this is a volume change
        RORB
        ROLA
        RORB                    * B now has the most significant value of the tone
        ROLA                    * A now has the Channel 0,1,2
        LSLA                    * A = A * 2 which is 0, 2 or 4 (ready for the lsb of the tone)
        INCA                    * A is channel 1, 3, or 5 = MSB channel register
        STD     YM_RegSel       * Select the A=1,B=3 or C=5 MSB tone register, send msb tone value to the YM2149 sound chip

        DECA                    * A is channel 0, 2, or 4 = LSB chennel register
        LDB     ,X+             * Get the LSB tone value
        STD     YM_RegSel       * Select the A=0,B=2 or C=4 LSB tone register, send lsb tone value to the YM2149 sound chip

        LEAY    -2,Y            * Decrement the counter for bytes sent (we always have two when we change the tone)
        BNE     CopyBytes       * has reached 0, if not then go copy more bytes to the YM2149 sound chip
DoneAll:
        STX     PointerM		* Save the pointer to the music data
GoBack1:
        LBRA    Back			* Done go back to wait for the vsync trigger (actually every second vsync)
VolumeChange:
        RORB
        ROLA
        RORB                    * B now has the volume info, with bit 5 set (which identified the byte was a volume change)
        ROLA                    * A now has the Channel 0,1,2, or 3
        CMPA    #3              * if A is 3 then it's noise/drums for channel C
        BEQ     MakeNoise       * Go play the noise frequency which is in accumulator B bits 4 to 0
        ADDA    #8              * Make A channel point to A=8,B=9,C=10
        ANDB    #%00001111      * Strip off the other bits, keep only the 0-15 value
        STD     YM_RegSel       * Select the A=8,B=9,C=10 volume register, send volume level value to the YM2149 sound chip
        LEAY    -1,Y            * Check if the counter for the number of bytes to send to the sound chip
        BNE     CopyBytes       * has reached 0, if not then go copy more bytes to the YM2149 sound chip
        BRA     DoneAll         * All done copying data to the YM2149
SmallCount:
        LDB     ,X+             * Get # of bytes to copy from the left nibble
		LSRB					* Shift left nibble to the right nibble
		LSRB					* ""
		LSRB					* ""
		LSRB					* B now has the # of bytes to copy
		LDA		,X+				* A now has the # of times to repeat the copied values
		STA		RepeatCount+1	* Save the repeat count, position X to point at the values to be copied
		BRA		SetByteCount
BigCount:
        LDB     ,X+             * Get # of bytes to copy from the left nibble
        LSRB                    * Shift left nibble to the right nibble
        LSRB                    * ""
        LSRB                    * ""
        LSRB                    * B now has the # of bytes to copy
        LDU     ,X++			* Load U with # of repeats count, position X to point at the values to be copied
		STU		RepeatCount		* Save the repeat count
		BRA		SetByteCount
MakeNoise:
        LDA     #6              * YM register 6
        ANDB    #%00011111      * strip off bit 5 which signified it was a Volume/Noise value
        STD     YM_RegSel       * is noise frequency register, save the frequency
* Required each time we make a noise
        LDD     #$0A0B          * A = 10 = Channel C, B = 11 = C volume level
        STD     YM_RegSel

        LEAY    -1,Y            * Check if the counter for the number of bytes to send to the sound chip
        BNE     CopyBytes       * has reached 0, if not then go copy more bytes to the YM2149 sound chip
        BRA     DoneAll         * All done copying data to the YM2149
* Setup pointer to music data to the start of the song
Exit1:
		CLR     $FFDE           * Go to ROM mode
        LDA     #128            * Set PSG Bank0 to the first 8k Block of it's RAM
        STA     BANK0REG
        LDX     #$C000          * Skip the 5 byte header info
        STX     RAMPointer
        LDU     #Buffer+5       * Set Music data to point to the start of the music data, skip 5 byte header
        STU     PointerM        * Save it
        LDU     #Buffer
!       LDD     ,X++
        STD     ,U++
        CMPX    #$C000+$110
        BNE     <
RomRam3:
        CLR     $FFDE           * Go to ROM mode (self modified to CLR $FFDF) if we are using a CoCo 3
        CLR     NoiseFlag       * Set Channel C tone/noise flag to tone
		LDA		LoopSong		
		CMPA	#$FF			* $FF = loop forever
		BEQ		>
		DEC		LoopSong
		BNE		>
   								* If we reached 0 in our loop counter then stop playback
        BSR     PlaySetup

		LDX		Back2+1			* Get the old IRQ jump pointer
		STX		$10D			* Place it back to normal
GoBack2:
        LBRA    Back			* Done go back to wait for the vsync trigger (actually every second vsync)
		
!       BSR     PlaySetup		* Reset everything to start the song again
        BRA     GoBack2
		
PlaySetup:
* Clear channel repeat note counters
        LDD     #$0001		* Clear counter
        STD     RepeatCount	* Clear the counter for how many times the current notes will play until they need to be changed
**************
* Set defaults for the YM2149
*                                                            ,,---------I/O
*                                                            ||,,,------Noise
*                                                            |||||,,,---Tone
*                                                            BACBACBA
        LDD     #$0738      * Register 7 = mixer Register, #%00111000  * $F8 = Enable Channel A,B and C as Tone data, 0 = selected
        STD     YM_RegSel
ZeroVolume:
        LDD     #$0800      * Register 8 = Volume Register for Channel A, Volume Level 0=off to 15=full, logarithmic curve
        STD     YM_RegSel
        INCA		        * Register 9 = Volume Register for Channel B
        STD     YM_RegSel
        INCA         		* Register 10 = Volume Register for Channel C
        STD     YM_RegSel

;* This is more Timer display related code that can be removed along with the other Timer related section of code, above
;        LDD     #$3030      * ascii '00'
;        STD     Minutes1	* Start showing 00 minutes
;        STD     Seconds1	* Start showing 00 seconds
;        CLR     Every2nd    * Process sound every 2nd Vsync IRQ hit
;        LDB     #30			* Vsync is triggered 60 times a second, since we only process every second vsync we count down 1/30th of a second
;        STB     Timer		* store it
;        LDB     #':			* Draw the colon on screen between the minutes and the seconds
;        STB     Minutes2+1	* store it
;* End of Time display related code that can be removed if you don't want to see a timer on the screen.
		RTS

**************************************************************************************************************
* Detect what slot the CoCoPSG is in the Multi-Pak Interface
* Using Ed Snider's idea to detect which slot the CoCoPSG is plugged into in the Multi-Pak Interface
*
* All registers are preserved except B
* Result is in the B accumulator
* If B=$FF then no CoCoPSG is in any slot of the MPI
* otherwise B = the slot where the CoCoPSG is in -1 (0 to 3) where 0 = Slot 1,1 = Slot 2,2 = Slot 3,3 = Slot 4
**************************************************************************************************************
FindCoCoPSG:
        PSHS    A,X,CC
        ORCC    #$50
        LDA     $FF7F           * Get the original MPI_Register value (MPI Register)
        PSHS    A               * Save it for restore later
        LDB     #%11111100      * We will AND this value to select through the different MPI slots SCS selector
CheckSlot:
        STB     $FF7F           * Select Slot (MPI Register)
        PSHS    B               * Save B
        LDD     #$06FF          * Store $FF in registers 6 to 0 of the YM2149
CS1:
        STD     $FF5E           * To see if the sum is 841 since Registers 0,2,4 store 8 bit values, 1,3,5 store 4 bit values (YM_Register Select)(YM_DATA)
        DECA                    * and register 6 stores a 5 bit value
        BPL     CS1             * Keep adding 255 to each byte
        LDA     #06
        LDX     #$0000
CS2:
        STA     $FF5E           * Select the different registers (6 ot 0) (YM_Register Select)
        LDB     $FF5F           * Get the stored value of this register (YM_DATA)
        ABX                     * Add B to X to keep a running total
        DECA                    * Total stored on the CoCoPSG will be 255+15+255+15+255+15+31 = 841
        BPL     CS2             * Count down A from 6 to 0
        PULS    B               * Restore B
        CMPX    #841            * If the sum is 841 then this is the CoCo PSG slot
        BEQ     FoundCoCoPSG    * If X=841 then we found the slot with CoCo PSG :)
        CMPB    #$FF            * Check if we just checked slot 4
        BEQ     ExitPSGCheck    * If so then no CoCo PSG is detected exit with B=$FF :(
        INCB                    * Else, load next slot value
        BRA     CheckSlot       * Go check next slot
FoundCoCoPSG:
        ANDB    #%00000011      * B now has the slot # (0 to 3) value
ExitPSGCheck:
        PULS    A               * Get the original MPI_Register value
        STA     $FF7F           * Restore the original value (MPI Register)
        PULS    A,X,CC,PC       * B = slot # -1 or $FF if not found
**************************************************************************************************************


EndPlayerCode:

* Variable storage
RepeatCount FDB	$0001           * Pointer to RAM location for keeping track of music playback
Every2nd    FCB	$00				* byte to keep track of every 2nd vsync
PointerM    FDB Buffer          * Pointer to Music Data
PSGRAMPtr   FCB 128             * PSG RAM block pointer 128 = first block of 8k bytes
RAMPointer  FDB $C000           * Pointer to CoCo PSG RAM Bank A
Buffer      RMB $110            * Temporary Buffer needed since we are using the PSG and reading bytes might go beyond $DFFF
NoiseFlag	FCB	$00				* Value to keep track if Channel C is currenlty playing Noise or Not
MPI         FCB $00             * Original MPI Program Register value
MPIPSG      FCB $00             * CoCo PSG MPI Program Register value
CoCoPSGSlot RMB 1           	* Memory location where BASIC will store the SLOT location of the CoCoPSG in the MPI
;* Timer related pointers, Can be removed as you probably don't require a timer to be shown on screen in your game
;Timer       FCB	30			* used for the Clock counter counts down from 30 every time play loop is entered.  When it hit's zero a second has passed
;Minutes1    EQU $420-5			* Location to display timer on screen (minutes and seconds)
;Minutes2    EQU Minutes1+1
;Seconds1    EQU Minutes1+3
;Seconds2    EQU Minutes1+4

        END     START

**************************************
* Info about the YM2149 used inside Ed Snider's CoCo PSD Cartridge for the Tandy Color Computer
* The YM2149 sound chip is a clone of the AY-3-8910 Sound chip with a few differences
*
* The YM2149 has three sound channels, A, B & C any of these three channels can output either Tone or Noise which is selectable by the user
*
*  Specs for the YM2149 is here:
*  http://www.ym2149.com/ym2149.pdf
*
*  Info on playing back ym format songs is here:
*  http://leonard.oxg.free.fr/ymformat.html
*
**************************************
* The YM2419 is used inside Ed Snider's CoCo PSG Cartridge for the Tandy Color Computer
*
* Registers
* ---------
*
* The AY-3-8910/8912 contains 16 internal registers as follows:
*
* Register        Function                        Range
*  0              Channel A fine pitch            8-bit (0-255)
*  1              Channel A course pitch          4-bit (0-15)
*  2              Channel B fine pitch            8-bit (0-255)
*  3              Channel B course pitch          4-bit (0-15)
*  4              Channel C fine pitch            8-bit (0-255)
*  5              Channel C course pitch          4-bit (0-15)
*
*  6              Noise pitch                     5-bit (0-31)
*  7              Mixer                           8-bit (see below)
*
*  8              Channel A volume                Bits 0 to 3 = 4-bit (0-15, see below) if bit 4 is set it signals this channel is using the Envelope info for the volume
*  9              Channel B volume                Bits 0 to 3 = 4-bit (0-15, see below) if bit 4 is set it signals this channel is using the Envelope info for the volume
* 10              Channel C volume                Bits 0 to 3 = 4-bit (0-15, see below) if bit 4 is set it signals this channel is using the Envelope info for the volume
*
* 11              Envelope fine duration          8-bit (0-255)
* 12              Envelope course duration        8-bit (0-255)
* 13              Envelope shape                  4-bit (0-15)
*
* 14              I/O port A                      8-bit (0-255)
* 15              I/O port B                      8-bit (0-255)
*
* Note Frequency calculation
*
* The output frequency is equal to the IC's incoming clock frequency divided by 16 and then further divided by the number written to the course and fine pitch registers.
* The higher the number written to these, the lower the pitch.
*
* For example 1Khz is required and the CoCo PSG is using 2Mhz timing (Default) switchable to 1Mhz
* 2Mhz = 2000000 / 16 * Tone (Hz)
*
* Example if you want a tone of 440 Hz then take 440 * 16 = 7040
* Next do 2000000/7040 = 284.09
* Make the result an integer 284.09 is closer to 284 then 285 so use 284.  Transpose the value 284 into a 12 bit number so it would be:
*
*             Course values   Fine Value
* Decimal         1x256     +     28
* Hexidecimal     $01       +    $1C
* Binary          0001      +  00011100
*
* Now that we know our Course (Most Significant) and the Fine (Least Significant) value we select which Channel we want to play back the 440 Hz tone
* we could use A, B or C.  If you select channel B then we will need to send the numbers to Registers 2 & 3 as per the chart above.
* You could change the values of the course value and then the fine value, but I think it's best to change the fine value first, since the change isn't as drastic as changing the
* course value, even though it's done in the microseconds the change might be audible.
*
* This code sets the tone Frequency for audio channel B:
*        LDA        #2
*        STA        $FF5E        * Select register 2 = B Fine value
*        LDA        #28
*        STA        $FF5F        * Store value 28 into B Fine register
*        LDA        #3
*        STA        $FF5E        * Select register 3 = B Course value
*        LDA        #1
*        STA        $FF5F        * Store value 1 into the B Course register
*
* We should also set the volume level desired for the B Channel by doing the following:
*        LDA        #9
*        STA        $FF5E        * Select register 9 = B Volume register
*        LDA        #15
*        STA        $FF5F        * Store value 15 into B volume register, 15 is the loudest level setting, 0=lowest volume level
*
* Lastly we enable or disable the type of output we want from the B Channel using register 7 using the info from the chart below
* - The mixer (register 7) is made up of the following bits (low=enabled) the AY-3-8912 ignores bit 7 of this register.
*     _      _
*     I/O    I/O   Noise    Noise    Noise     Tone     Tone     Tone
*      B      A      C        B        A        C        B        A
* Bit: 7      6      5        4        3        2        1        0
*
* To enable Channel B as Tone output we do the following:
*        LDA        #7
*        STA        $FF5E        * Select register 7 = Mixer register
*        LDA        #$FD         * $FD = 11111101 - Setting a value low (0) enables that option.  We could enable C,B & A with a value of 11111000 or $F8
*        STA        $FF5F        * Store value $FD to register 7
*
* At this point the tone will play continuously until you change the value of the tone or set the volume to 0 or change the Mixer register to turn off Channel B output
*
* Notes:
* - The AY-3-8912 does not contain register 15.
* - The volume registers (8, 9 and 10) contain a 4-bit setting but if bit 4 is set then that channel uses the envelope defined by register 13 and ignores its volume setting.
*
* Envelopes
* ---------
* The AY-3-8910/8912 contains the following preset envelopes or waveforms (set using control register 13). Note that these affect volume only and not the pitch:
*
*  0      \__________     single decay then off
*
*  4      /|_________     single attack then off
*
*  8      \|\|\|\|\|\     repeated decay
*
*  9      \__________     single decay then off
*
* 10      \/\/\/\/\/\     repeated decay-attack
*           _________
* 11      \|              single decay then hold
*
* 12      /|/|/|/|/|/     repeated attack
*          __________
* 13      /               single attack then hold
*
* 14      /\/\/\/\/\/     repeated attack-decay
*
* 15      /|_________     single attack then off
*
***************************************************
