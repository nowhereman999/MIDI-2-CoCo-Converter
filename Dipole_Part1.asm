;**************************************
; DIPOLE (2 VOICE) IRQ PLAYER FOR COCO 
; (C) SIMON JONASSEN 2017
;**************************************
		opt	    6809
		opt	    cd

		ORG     $0E00

        align    $100       * Make sure the code starts at a 256 byte block since we use the Direct Page
DirectPage:
;**************************************
;equal tempered 12 note per
;octave frequency table (7.875 Khz)
;
;NOTES ARE AS FOLLOWS
;THE LOWEST C HERE IS NOT PLAYED
;IT'S USED FOR SILENCE
;
;notes    C,C#,D,Eb,E,F,F#,G,G#,A,Bb,B
;**************************************
freqtab
;c1    fdb    0,141,149,158,167,177,188,199,211,223,237,251

c2    fdb    0,282,298,316,335,355,376,398,422,447,474,502
c3    fdb    532,563,597,632,670,710,752,796,844,894,947,1003
c4    fdb    1063,1126,1193,1264,1339,1419,1503,1593,1688,1788,1894,2007
c5    fdb    2126,2253,2387,2529,2679,2838,3007,3186,3375,3576,3789,4014
c6    fdb    4252,4505,4773,5057,5358,5676,6014,6371,6750,7152,7577,8028
c7    fdb    8505,9011,9546,10114,10716,11353,12028,12743,13501,14303,15154,16055
c8    fdb    17010,18021,19093,20228,21431,22705,24056,25486,27001,28607,30308,32110

;**************************************
; 2 VOICE NOTE ROUTINE
;**************************************
		opt		cc
		opt		ct
note
		
sum		ldd 	#$0000		;CH1 OSCILLATOR
freq	addd 	#$0000 
		std		<sum+1
sum2	ldd 	#$0000		;CH2 OSCILLATOR
freq2	addd 	#$0000 
		std 	<sum2+1		;we have c2 in A - so add chan1
bb		adda	<sum+1		;carry just incase
		rora				;ch1+ch2/2
		sta		$ff20		;OUT ON DAC

		dec		<syncount	
		bne		outzix
;**************************************
; SEQUENCER
;**************************************
		opt		cc
		opt		ct
play2

oldx	ldx		#SongData	;save pattern position
curnote	ldd		,x++		;load 2 notes from pattern
		cmpa	#$ff
		bne		plnote		;pattern ends with $ff 
		ldx		#SongData	;we looped
		ldd		,x++
plnote	stx		<oldx+1		;restore pattern position to start
		sta		<frq1+2
		stb		<frq2+2
frq1	ldx		#freqtab	;get the right freq
		ldx		,x
		stx		<freq+1		;store
frq2	ldx		#freqtab
		ldx		,x
		stx		<freq2+1
outzix	lda		$ff00		;ack irq
		rti

;**************************************
; IRQ COUNTER
;**************************************
syncount	fcb	0	

;**************************************
; DA ZIX (ONE LONG PATTERN) 
; END WITH $FF
;**************************************

**********************************************************************************************
* Below is the music data that was output by the mid2cc program
**********************************************************************************************
SongData:

