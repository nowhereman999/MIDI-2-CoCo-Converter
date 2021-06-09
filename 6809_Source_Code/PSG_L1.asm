BANK0REG    EQU $FF5A       * Register for Memory Bank A Range $C000 to $DFFF
BANK1REG    EQU $FF5B       * Register for memory Bank B range $E000 to $FEFF
CONTROL_REG EQU $FF5D       * Setup feature of the CoCo PSG
                            * BIT FUNCTION
                            * 0 YM2149 MASTER CLOCK; 0=2MHz, 1=1MHz
                            * 1 Gameport A SEL signal (pin 7 of controller port A)
                            * 2 Gameport B SEL signal (pin 7 of controller port B)
                            * 3 Write Enable (for FLASH/SRAM); 0=disabled, 1=enabled
                            * 4 Autostart enable; 0=enabled, 1=disabled
                            * 5 FLASH programming enable; 0=disabled, 1=enabled
                            * 6 not used
                            * 7 not used
YM_SEL      EQU     $FF5E
YM_DATA     EQU     $FF5F
MPI_Reg EQU $FF7F           * Address for Multi Pak Interface Slot selector Register

FixClose EQU     $0E00      * Bytes BASIC copied the original CLOSE routine address to
UserCoCoPSGSlot EQU $E02    * BASIC program will as the user what slot the CoCo PSG is in and store the value here.  This value
                            * will be in the range 0 to 3
* Store the length of the PSG Song Data Could be upto 512k (actually what will fit on a disk 150kish)
* 24 bit value:
* 3 byte value first byte is Int(Value/65536)
*              second byte   Int((Value/65536 - Int(Value/65536)) / 256)
*              third byte is (((Value/65536 - Int(Value/65536)) / 256) - Int((Value/65536 - Int(Value/65536)) / 256) * 256)
        ORG     $0E03
LOF     FCB     $00             * Size of PSG Song data MSB
        FDB     $0A77           * Second most sigificant Byte and the LSB
MPI     FCB     $00             * Original MPI Program Register value
MPIPSG  FCB     $00             * CoCo PSG MPI Program Register value

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
        BEQ     ExitPSGCheck    * If so then no CoCo PSG is not detected exit with B=$FF :(
        INCB                    * Else, load next slot value
        BRA     CheckSlot       * Go check next slot
FoundCoCoPSG:
        ANDB    #%00000011      * B now has the slot # (0 to 3) value
ExitPSGCheck:
        PULS    A               * Get the original MPI_Register value
        STA     $FF7F           * Restore the original value (MPI Register)
        PULS    A,X,CC,PC       * B = slot # -1 or $FF if not found
**************************************************************************************************************
START   PSHS    D,X,U           * Save our registers
        BSR     FindCoCoPSG     * Go find the slot the CoCo PSG is plugged into in the MPI
        CMPB    #$FF            * If B=$FF then no CoCoPSG was detected
        BNE     >
NoCOCOPSG:
        LDU     #$400
        BSR     PrintString     * Go print the text in the next line on screen
        FCC     'ERROR'
        FCB     $7A
        FCC     'NO'
        FCB     $60             * Space character code
        FCC     'COCOPSG'
        FCB     $60
        FCN     'FOUND'
        PULS    D,X,U           * Should let BASIC know that no CoCo PSG was detected
        RTS
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

!       LDX     $FFFE           * Check if we are running on a CoCo 3
        CMPX    #$8C1B
        BEQ     >
        LDA     #$DE            * Change location in the program (self modify code) so they don't go into RAM mode
        STA     ROMRAM+2        * CoCo 1 or 2 should stay in ROM mode
        STA     ROMRAM1+2        * CoCo 1 or 2 should stay in ROM mode

!       STB     UserCoCoPSGSlot * Save the slot # (0 to 3) where the CoCo PSG is
        LDA     MPI_Reg         * GET Original MPI REG
        STA     MPI             * Save the Original MPI value so we can swap back to the Disk controller to continue loading
        ANDA    #%11111100      * SCS TO CoCo PSG SLOT (user selected) - LEAVE *CART/CTS ON ORIGINAL SLOT
        ORA     UserCoCoPSGSlot * Add the user slot value (0 to 3 at this point)
        STA     MPI_Reg         * SWITCH SCS Only
        LDA     $FF5D           * GET PSG CONTROL REG
        ORA     #%00010000      * DISABLE AUTOSTART
        STA     $FF5D           * WRITE PSG CONTROL REG
        LDA     MPI_Reg         * GET MPI REG
        LSLB                    * Setup B with the CART/CTS and SCS selection based on the user input #
        LSLB
        LSLB
        LSLB                    * Shift value (0 to 3) left 4 so that it is for the CART/CTS value
        ORB     UserCoCoPSGSlot * B now has the proper values for the users CoCo PSG slot for the Cart/CTS and SCS
        STB     UserCoCoPSGSlot * Save the new value so we can OR the value into it
        ANDA    #%11001100      * CTS and SCS TO SLOT User selected slot
        ORA     UserCoCoPSGSlot * Add the user slot value (0 to 3 at this point)
        STA     MPIPSG          * Save the CoCo PSG MPI selection
        STA     MPI_Reg         * Update MPI with new value

        LDA     #128            * Set PSG RAM pointer to 0
        STA     BANK0REG
        LDB     LOF             * B is the MSB of the PSG music data size
        INCB                    * Add one so the check EOF loop below is a little more efficient
        STB     LOF
        LDX     LOF+1           * X is the second most significant and the LSB of the PSG music data size
ROMRAM:
        CLR     $FFDF           * Go to RAM mode If CoCo 3 is detected, otherwise this will be changed to $FFDE (self mod code above)
Loop0:
        LDU     #$C000          * Start of PSG Bank 0 RAM
Loop1:
        LDA     #%00010000      * Disable writing to the PSG 512k RAM
        STA     CONTROL_REG     * Update PSG Disable writing to the PSG 512k RAM
        LDA     MPI             * Change MPI to Disk Controller Slot
        STA     MPI_Reg         * Update MPI with new value
        JSR     $A176           * Read a byte from the file into A (CONSOLE IN)
        ORCC    #$50            * Disable the interrupts
        CLR     $FFDE           * Go to ROM mode
        LDB     MPIPSG          * Change MPI to CoCo PSG Slot
        STB     MPI_Reg         * Update MPI with new value
        LDB     #%00011000      * Enable writing to the PSG 512k RAM
        STB     CONTROL_REG     * Update PSG Enable writing to the PSG 512k RAM
        STA     ,U+
ROMRAM1:
        CLR     $FFDF           * Go to RAM mode If CoCo 3 is detected, otherwise this will be changed to $FFDE (self mod code above)
        ANDCC   #%1010111       * Enable the interrupts
        LEAX    -1,X            * Decrement the PSG Music data size counter
        BNE     >               * If not zero jump to check if we have reached the end of the PSG Bank A
        DEC     LOF
        BEQ     CleanUp         * IF PSG Music data has all been loaded then jump to clean up routine
!       CMPU    #$E000
        BLO     Loop1
        INC     BANK0REG        * set to the next PSG Bank A block of RAM
        BRA     Loop0
CleanUp:
        LDA     #%00010000      * Disable writing to the PSG 512k RAM
        STA     CONTROL_REG     * Update PSG
        LDA     MPI             * Change MPI to Disk Controller Slot
        STA     MPI_Reg         * Update MPI with new value
        LDD     FixClose        * restore close file pointer address
        STD     $0177
        PULS    D,X,U           * Restore our registers
        JMP     $0176           * Jump back to the Close file routine that we intercepted

        ORG     $0177
        FDB     START           * Change the Close File jump address to point to this program

        END     START
