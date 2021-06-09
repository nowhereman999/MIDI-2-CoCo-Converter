**************************************
* Test program for the Texas Instruments SN76489 sound chip
* Used inside John Lynville's Game Master Cartridge for the Tandy Color Computer
*
* The SN76489 has 3 music channels selected as 00, 01, and 10 and one noise channel which is channel 11
* 
* To send a note you need two bytes the first is called the latch and bit 7 must be set to signify it is a latch byte
*    7654 3210
*   %1cct dddd
*     ||| ````-- Data, For Tone Data these are the least significant bits
*     ||`------ Type 0 = tone data, 1=volume level
*     ``------- Channel
*
* for tone data a second byte is required and is a data byte where bit 7 must be low
*       987654
*    %0xdddddd These are the most significant bits of the register that represnets the frequency of the tone
*
* The 10 bit value (0-9) that represents the Frequency of the tone to play
*
* Example to send a note
*
*                       Input clock (Hz) (4000000)
*   Frequency (Hz) = ----------------------------------
*                     2 x register value x divider (16)
*
* Example values for an NTSC-clocked chip are given and are generally assumed throughout. Thus, for example, 0x0fe gives 440.4Hz.
*
*                              4000000                             125000
*     Register Value =      ------------      also equals       ------------  
*                        2 x Freq (Hz) x 16                       Freq (Hz)
*
*   Volume control is set when bit 4 is high, the volume level is a value between 0 to 15 (value of the right nibble) with 15 being silence and 0 being the loudest, backwards to normal
*    7654 3210 
*   %1011 1111      Latch, channel 1, volume control, data 1111   Set channel 1 volume to 0xf (silent)
*     ||| ````- Data  - Volume level 0000 = loudest - 1111 silence 
*     ||`------ Type  - Volume setting
*     ``------- Channel
*  Good info on the SN76489 here:
*  http://www.smspower.org/Development/SN76489
*
**************************************
		opt		cd

Sound   EQU 	$FF41  			* Address for the Texas Instruments SN76489 - Game Master Cartridge sound chip

								* Location player code will be copied to and used in RAM once the cartridge is started
Destination EQU $7000   		* This can be anywhere in RAM but needs about 255 bytes of free space after this location

* These values can be moved to anywhere in RAM, they are currently shown on screen to show things are working OK
RepeatCount EQU $0E00           * Pointer to RAM location for keeping track of music playback
Every2nd    EQU RepeatCount+2	* byte to keep track of every 2nd vsync
PointerM	EQU RepeatCount+3

;* Timer related pointers, Can be removed as you probably don't require a timer to be shown on screen in your game
;Timer       EQU RepeatCount+5	* used for the Clock counter counts down from 30 every time play loop is entered.  When it hit's zero a second has passed
;Minutes1    EQU $420-5			* Location to display timer on screen (minutes and seconds)
;Minutes2    EQU Minutes1+1
;Seconds1    EQU Minutes1+3
;Seconds2    EQU Minutes1+4

        ORG     $C000
START:
        ORCC    #$50            * If you are going to use real IRQ's instead of polling VWAIT then change this section to enable the IRQs
        LDA     $FF01			* PIA 0 side A control reg - PIA0AC
        ANDA    #$FC            * Clear bits 0 & 1 - HSYNC IRQ Disabled. IRQ Polarity set on falling edge
        STA     $FF01           * Save settings
        LDA     $FF00           * PIA 0 side A data register - PIA0AD
        LDA     $FF03           * PIA 0 side B control reg - PIA0BC
        ORA     #$01            * VSync IRQ enabled
        STA     $FF03           * Save Settings
        LDA     $FF02           * PIA 0 side B data register - PIA0BD
		
* Move player loop from ROM cartridge to RAM so it can flip through ROM banks for music data
        LDX     #PlayStart		* point to the start of the playback code
        LDU     #Destination	* point to the destination location in RAM
!       LDD     ,X++			* Move code from ROM cartridge to RAM
        STD     ,U++			* Keep copying
        CMPX    #EndPlayerCode	* Are we at the end of the player code yet
        BLO     <				* keep copying if not

***************************************
* Setup Vectored IRQ using VSYNC
***************************************
		LDA		#$7E			* Jump instruction Opcode
		STA		$10C
		LDX		#IRQ_Start-PlayStart+Destination
		STX		$10D			* Store the new IRQ address location
		
        LBRA    Destination		* Jump to the player code now in RAM
		
PlayStart:
* clear channel repeat note counters
        LDD     #$00		* Clear counter
        STD     RepeatCount	* Clear the counter for how many times the current notes will play until they need to be changed
* Set pointer for Music Data
        LDD     #$C000		* Set Music data to point to Bank 1 and address $C000
        STD     PointerM	* Save it
        CLR     Every2nd    * Process sound every 2nd Vsync IRQ hit
;* This is more Timer display related code that can be removed along with the other Timer section below
;        LDD     #$3030      * ascii '00'
;        STD     Minutes1	* Start showing 00 minutes
;        STD     Seconds1	* Start showing 00 seconds
;        CLR     Every2nd    * Process sound every 2nd Vsync IRQ hit
;        LDB     #30			* Vsync is triggered 60 times a second, since we only process every second vsync we count down 1/30th of a second
;        STB     Timer		* store it
;        LDB     #':			* Draw the colon on screen between the minutes and the seconds
;        STB     Minutes2+1	* store it
;* End of Time display related code that can be removed if you don't want to see a timer on the screen.

		LDS		#Destination
		JMP		EndPlayerCode  * Jump back to User code in the ROM cartridge 

IRQ_Start:
        COM     Every2nd	* We only process sound events every 2nd vsync (save more CPU time)
        BEQ     ExitIRQ		* Loop back every 2nd vsync
		
;* Show the running time on the screen (This section can be removed, it's only here for testing the player)
;        DEC     Timer		* triggered 30 times every second
;        BNE     Playnotes   * If we haven't reached zero yet then don't update the time
;        LDB     #30			* reset the timer back to 30
;        STB     Timer		* save the value
;        LDA     Seconds2	* check if the ones value of the # of seconds
;        CMPA    #$39		* if it is a nine then make it a zero
;        BEQ     >			* make it a zero and add to the tens value of the # of seconds
;        INCA				* Otherwise update
;        STA     Seconds2	* Save
;        BRA     Playnotes	* Go process music data
;!       LDA     #$30		* set the ones value to zero
;        STA     Seconds2	* Save it
;        LDA     Seconds1	* Get the tens value of the seconds
;        CMPA    #$35		* check if it is a 5
;        BEQ     >			* If so then add one to minute value
;        INCA				* otherwise add 1 to the tens value of the seconds
;        STA     Seconds1	* save it
;        BRA     Playnotes	* Go process music data
;!       LDA     #$30		* Set the tens value of the seconds
;        STA     Seconds1	* to a zero
;        LDA     Minutes2	* Get the ones value of the minutes
;        CMPA    #$39		* check if it is a nine
;        BEQ     >			* if so then go add one to the tens of the minute value
;        INCA				* otherwise increment the ones value of the seconds
;        STA     Minutes2	* update the value
;        BRA     Playnotes	* Go process music data
;!       LDA     #$30    	* Set the ones value of the minutes
;        STA     Minutes2	* to zero
;        INC     Minutes1	* add one the tens value of the minutes
;* End of time on screen display code.  The above can be removed
	
* New Encoding:
* Encoding byte
*                left nibble = # of times to repeat          0 to 15 repeat count
*
*                right nibble = # of bytes to copy (1-11)    count of bytes to copy
*                                                            12 signals the repeat count is larger then 15 so use the next byte as the repeat count     (left nibble = bytes to copy)
*                                                            13 signals the repeat count is larger then 255 so use the next 2 bytes as the repeat count (left nibble = bytes to copy)
*                                                            14 signals jump to the next Bank of the GMC (reached the 16k length of the current bank)   (ignore left nibble)
*                                                            15 signals End of File

* Play music
Playnotes:
        TST     RepeatCount+1
        BEQ     ChangeBank
        DEC     RepeatCount+1
        BNE     ExitIRQ
        TST     RepeatCount
        BEQ     ChangeBank
        DEC     RepeatCount
ExitIRQ:
        LDA     $FF02           * Acknowledge the Vsync IRQ
        RTI
ChangeBank:
        LDA     #1          	* GMC Bank 1 value will be incremented with a little self modifying code
        STA     $FF40			* set the Bank in the GMC
        LDX     PointerM		* Load X with the current music data pointer
GetNext:
        LDB     ,X				* Get the first byte which has the repeat and copy notes info
		ANDB	#$0F			* Clear off the left nibble info
		CMPB	#12				* check if the right nibble is
		BLO		Normal			* lower then 12 then the byte is a normal byte where the left nibble is 0 to 15 and the right nibble is the # of music data bytes to copy
		BEQ		SmallCount		* if the right nibble is equal to 12 then
		CMPB	#13				* Check the right nibble is
		BEQ		BigCount		* equal to 13 if so go deal with big count value (next byte holds the repeat count value)
		CMPB	#14				* Check the right nibble is
		BEQ		SetNextBank		* equal to 14 if so this flags that the data pointer should jump to the next Bank and deal then get the next value
		BRA		Exit1			* Must be 15 so EOF, Reached End of file we are done
Normal:
        LDA     ,X+             * get the # of times to repeat these values, position X to point at the values to be copied
		LSRA					* Shift left nibble to the right nibble
		LSRA                    * ""
		LSRA                    * ""
		LSRA					* A now has the correct # of times to be repeated
		STA		RepeatCount+1	* Save the repeat count
CopyBytes:
        LDA     ,X+ 			* Copy bytes
        STA     Sound			* send them to the SN76489 sound chip
        DECB					* Check if the counter for the number of bytes to send to the sound chip
        BNE     CopyBytes		* has reached 0, if not then go copy more bytes to the SN76489 sound chip
DoneAll:
        STX     PointerM		* Save the pointer to the music data
        CLR     $FF40       	* GMC Bank 0
        BRA     ExitIRQ
SmallCount:
        LDB     ,X+             * Get # of bytes to copy from the left nibble
		LSRB					* Shift left nibble to the right nibble
		LSRB					* ""
		LSRB					* ""
		LSRB					* B now has the # of bytes to copy
		LDA		,X+				* A now has the # of times to repeat the copied values
		STA		RepeatCount+1	* Save the repeat count, position X to point at the values to be copied
		BRA		CopyBytes
BigCount:
        LDB     ,X+             * Get # of bytes to copy from the left nibble
        LSRB                    * Shift left nibble to the right nibble
        LSRB                    * ""
        LSRB                    * ""
        LSRB                    * B now has the # of bytes to copy
        LDU     ,X++			* Load U with # of repeats count, position X to point at the values to be copied
		STU		RepeatCount		* Save the repeat count
		BRA		CopyBytes
SetNextBank:
		INC		ChangeBank+1,PCR	* A little self modifying code to increment the Bank # selected when getting the music data
		LDX		#$C000				* Set to the start address of the next bank
		STX		PointerM			* update the music data pointer
		BRA		GetNext				* Go get the next set of music data
Exit1:
        CLR     $FF40       	* GMC Bank 0
        LDB     #$9F            * Volume Chan 0 Off
        STB     Sound
        NOP
        NOP
        NOP
        NOP
        LDB     #$BF            * Volume Chan 1 Off
        STB     Sound
        NOP
        NOP
        NOP
        NOP
        LDB     #$DF            * Volume Chan 2 Off
        STB     Sound
        NOP
        NOP
        NOP
        NOP
        LDB     #$FF            * Volume Chan 3 Off
        STB     Sound
        NOP
        NOP
        NOP
        NOP
* Loop the song
* clear channel repeat note counters
        LDD     #$00		* Clear counter
        STD     RepeatCount	* Clear the counter for how many times the current notes will play until they need to be changed
* Find pointer for Channel 0,1,2,3
        LDD     #$C000		* Set Music data to point to Bank 1 and address $C000
        STD     PointerM	* Save it	
        LBRA    ExitIRQ

EndPlayerCode:

		ANDCC	#$EF		* Enable the IRQ which the background music player uses
		LDA		$FF02		* Ackknowledge the Vsync IRQ
****************************************************************
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
		
* Put your program above this line
****************************************************************
Song:
