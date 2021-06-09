' MIDI file to CoCo MOD converter V 1.00 by Glen Hewlett
' Do whatever you want with it   :)
'--------------------------------------------------------

'Key Signature data
DATA "C","D","E","F","G","A","B"
'Note Data
DATA "C","C#","D","D#","E","F","F#","G","G#","A","A#","B"
'Event names
DATA "Header","Start_track","Note_off_c","Note_on_c","Poly_aftertouch_c","Control_c","Program_c","Channel_aftertouch_c","Pitch_bend_c"
DATA "System_exclusive","Sequence_number","Text_t","Copyright_t","Title_t","Instrument_name_t","Lyric_t","Marker_t","Cue_point_t","Channel_prefix"
DATA "MIDI_port","End_track","Tempo","SMPTE_offset","Time_signature","Key_signature","Sequencer_specific","Unknown_event"


'General MIDI Instrument Patch Map
DATA "Acoustic Grand Piano","Bright Acoustic Piano","Electric Grand Piano","Honky-tonk Piano","Electric Piano 1 (Rhodes Piano)","Electric Piano 2 (Chorused Piano)"
DATA "Harpsichord","Clavinet","Celesta","Glockenspiel","Music Box","Vibraphone","Marimba","Xylophone","Tubular Bells","Dulcimer (Santur)","Drawbar Organ (Hammond)"
DATA "Percussive Organ","Rock Organ","Church Organ","Reed Organ","Accordion (French)","Harmonica","Tango Accordion (Band neon)","Acoustic Guitar (nylon)"
DATA "Acoustic Guitar (steel)","Electric Guitar (jazz)","Electric Guitar (clean)","Electric Guitar (muted)","Overdriven Guitar","Distortion Guitar"
DATA "Guitar harmonics","Acoustic Bass","Electric Bass (fingered)","Electric Bass (picked)","Fretless Bass","Slap Bass 1","Slap Bass 2","Synth Bass 1","Synth Bass 2"
DATA "Violin","Viola","Cello","Contrabass","Tremolo Strings","Pizzicato Strings","Orchestral Harp","Timpani","String Ensemble 1 (strings)","String Ensemble 2 (slow strings)"
DATA "SynthStrings 1","SynthStrings 2","Choir Aahs","Voice Oohs","Synth Voice","Orchestra Hit","Trumpet","Trombone","Tuba","Muted Trumpet","French Horn","Brass Section"
DATA "SynthBrass 1","SynthBrass 2","Soprano Sax","Alto Sax","Tenor Sax","Baritone Sax","Oboe","English Horn","Bassoon","Clarinet","Piccolo","Flute","Recorder"
DATA "Pan Flute","Blown Bottle","Shakuhachi","Whistle","Ocarina","Lead 1 (square wave)","Lead 2 (sawtooth wave)","Lead 3 (calliope)","Lead 4 (chiffer)","Lead 5 (charang)"
DATA "Lead 6 (voice solo)","Lead 7 (fifths)","Lead 8 (bass + lead)","Pad 1 (new age Fantasia)","Pad 2 (warm)","Pad 3 (polysynth)","Pad 4 (choir space voice)"
DATA "Pad 5 (bowed glass)","Pad 6 (metallic pro)","Pad 7 (halo)","Pad 8 (sweep)","FX 1 (rain)","FX 2 (soundtrack)","FX 3 (crystal)","FX 4 (atmosphere)","FX 5 (brightness)"
DATA "FX 6 (goblins)","FX 7 (echoes, drops)","FX 8 (sci-fi, star theme)","Sitar","Banjo","Shamisen","Koto","Kalimba","Bag pipe","Fiddle","Shanai","Tinkle Bell","Agogo"
DATA "Steel Drums","Woodblock","Taiko Drum","Melodic Tom","Synth Drum","Reverse Cymbal","Guitar Fret Noise","Breath Noise","Seashore","Bird Tweet","Telephone Ring"
DATA "Helicopter","Applause","Gunshot"

'Game Master Cartridge Frequency values Can't play notes below B2
'                   Frequency
DATA EE,F: 'C-1            0
DATA EE,F: 'C#-1/Db-1
DATA EE,F: 'D-1
DATA EE,F: 'D#-1/Eb-1
DATA EE,F: 'E-1
DATA EE,F: 'F-1
DATA EE,F: 'F#-1/Gb-1
DATA EE,F: 'G-1
DATA EE,F: 'G#-1/Ab-1
DATA EE,F: 'A-1
DATA EE,F: 'A#-1/Bb-1
DATA EE,F: 'B-1
DATA EE,F: 'C0      16.35   12
DATA EE,F: 'C#0/Db0 17.32
DATA EE,F: 'D0      18.35
DATA EE,F: 'D#0/Eb0 19.45
DATA EE,F: 'E0      20.6
DATA EE,F: 'F0      21.83
DATA EE,F: 'F#0/Gb0 23.12
DATA EE,F: 'G0      24.5
DATA EE,F: 'G#0/Ab0 25.96
DATA EE,F: 'A0      27.5
DATA EE,F: 'A#0/Bb0 29.14
DATA EE,F: 'B0      30.87
DATA EE,F: 'C1      32.7    24
DATA E1,8: 'C#1/Db1 34.65
DATA D4,D: 'D1      36.71
DATA C8,E: 'D#1/Eb1 38.89
DATA BD,A: 'E1      41.2
DATA B3,0: 'F1      43.65
DATA A8,F: 'F#1/Gb1 46.25
DATA 9F,7: 'G1      49
DATA 96,8: 'G#1/Ab1 51.91
DATA 8E,1: 'A1      55
DATA 86,1: 'A#1/Bb1 58.27
DATA 7E,9: 'B1      61.74
DATA 77,7: 'C2      65.41   36
DATA 70,C: 'C#2/Db2 69.3
DATA 6A,7: 'D2      73.42
DATA 64,7: 'D#2/Eb2 77.78
DATA 5E,D: 'E2      82.41
DATA 59,8: 'F2      87.31
DATA 54,7: 'F#2/Gb2 92.5
DATA 4F,C: 'G2      98
DATA 4B,4: 'G#2/Ab2 103.83
DATA 47,0: 'A2      110
DATA 43,1: 'A#2/Bb2 116.54
DATA 3F,4: 'B2      123.47      *** Lowest Note GMC can play unless you use a different clock chip in the cartridge
DATA 3B,C: 'C3      130.81  48
DATA 38,6: 'C#3/Db3 138.59
DATA 35,3: 'D3      146.83
DATA 32,4: 'D#3/Eb3 155.56
DATA 2F,6: 'E3      164.81
DATA 2C,C: 'F3      174.61
DATA 2A,4: 'F#3/Gb3 185
DATA 27,E: 'G3      196
DATA 25,A: 'G#3/Ab3 207.65
DATA 23,8: 'A3      220
DATA 21,8: 'A#3/Bb3 233.08
DATA 1F,A: 'B3      246.94
DATA 1D,E: 'C4      261.63  60  - MIDI programs use C4=72
DATA 1C,3: 'C#4/Db4 277.18
DATA 1A,A: 'D4      293.66
DATA 19,2: 'D#4/Eb4 311.13
DATA 17,B: 'E4      329.63
DATA 16,6: 'F4      349.23
DATA 15,2: 'F#4/Gb4 369.99
DATA 13,F: 'G4      392
DATA 12,D: 'G#4/Ab4 415.3
DATA 11,C: 'A4      440
DATA 10,C: 'A#4/Bb4 466.16
DATA F,D: 'B4       493.88
DATA E,F: 'C5       523.25  72
DATA E,1: 'C#5/Db5  554.37
DATA D,5: 'D5       587.33
DATA C,9: 'D#5/Eb5  622.25
DATA B,E: 'E5       659.25
DATA B,3: 'F5       698.46
DATA A,9: 'F#5/Gb5  739.99
DATA 9,F: 'G5       783.99
DATA 9,6: 'G#5/Ab5  830.61
DATA 8,E: 'A5       880
DATA 8,6: 'A#5/Bb5  932.33
DATA 7,F: 'B5       987.77
DATA 7,7: 'C6       1046.5  84
DATA 7,1: 'C#6/Db6  1108.73
DATA 6,A: 'D6       1174.66
DATA 6,4: 'D#6/Eb6  1244.51
DATA 5,F: 'E6       1318.51
DATA 5,9: 'F6       1396.91
DATA 5,4: 'F#6/Gb6  1479.98
DATA 5,0: 'G6       1567.98
DATA 4,B: 'G#6/Ab6  1661.22
DATA 4,7: 'A6       1760
DATA 4,3: 'A#6/Bb6  1864.66
DATA 3,F: 'B6       1975.53
DATA 3,C: 'C7       2093     96
DATA 3,8: 'C#7/Db7  2217.46
DATA 3,5: 'D7       2349.32
DATA 3,2: 'D#7/Eb7  2489.02
DATA 2,F: 'E7       2637.02
DATA 2,D: 'F7       2793.83
DATA 2,A: 'F#7/Gb7  2959.96
DATA 2,8: 'G7       3135.96
DATA 2,6: 'G#7/Ab7  3322.44
DATA 2,4: 'A7       3520
DATA 2,2: 'A#7/Bb7  3729.31
DATA 2,0: 'B7       3951.07
DATA 1,E: 'C8       4186.01  108
DATA 1,C: 'C#8/Db8  4434.92
DATA 1,B: 'D8       4698.63
DATA 1,9: 'D#8/Eb8  4978.03
DATA 1,8: 'E8       5274.04
DATA 1,6: 'F8       5587.65
DATA 1,5: 'F#8/Gb8  5919.91
DATA 1,4: 'G8       6271.93
DATA 1,3: 'G#8/Ab8  6644.88
DATA 1,2: 'A8       7040
DATA 1,1: 'A#8/Bb8  7458.62
DATA 1,0: 'B8       7902.13
DATA 0,E: 'C9       8,372.02   120
DATA 0,E: 'C#9/Db9  8,869.84
DATA 0,D: 'D9       9,397.27
DATA 0,C: 'D#9/Eb9  9,956.06
DATA 0,B: 'E9       10,548.08
DATA 0,B: 'F9       11,175.30
DATA 0,A: 'F#9/Gb9  11,839.82
DATA 0,9: 'G9       12,543.85

'CoCo PSG Frequency values Can't play notes below B0 value  with clock at 2Mhz
'                       Frequency
DATA F,D1: 'C-1                   0
DATA F,D1: 'C#-1/Db-1
DATA F,D1: 'D-1
DATA F,D1: 'D#-1/Eb-1
DATA F,D1: 'E-1
DATA F,D1: 'F-1
DATA F,D1: 'F#-1/Gb-1
DATA F,D1: 'G-1
DATA F,D1: 'G#-1/Ab-1
DATA F,D1: 'A-1
DATA F,D1: 'A#-1/Bb-1
DATA F,D1: 'B-1
DATA F,D1: 'C0            16.35    12
DATA F,D1: 'C#0/Db0       17.32
DATA F,D1: 'D0            18.35
DATA F,D1: 'D#0/Eb0       19.45
DATA F,D1: 'E0            20.6
DATA F,D1: 'F0            21.83
DATA F,D1: 'F#0/Gb0       23.12
DATA F,D1: 'G0            24.5
DATA F,D1: 'G#0/Ab0       25.96
DATA F,D1: 'A0            27.5
DATA F,D1: 'A#0/Bb0       29.14
DATA F,D1: 'B0            30.87    ***  Lowest note @ 2Mhz
DATA E,EE: 'C1            32.7     24
DATA E,17: 'C#1/Db1       34.65
DATA D,4D: 'D1            36.71
DATA C,8E: 'D#1/Eb1       38.89
DATA B,D9: 'E1            41.2
DATA B,2F: 'F1            43.65
DATA A,8E: 'F#1/Gb1       46.25
DATA 9,F7: 'G1            49
DATA 9,67: 'G#1/Ab1       51.91
DATA 8,E0: 'A1            55
DATA 8,61: 'A#1/Bb1       58.27
DATA 7,E8: 'B1            61.74
DATA 7,77: 'C2            65.41    36
DATA 7,0B: 'C#2/Db2       69.3
DATA 6,A6: 'D2            73.42
DATA 6,47: 'D#2/Eb2       77.78
DATA 5,EC: 'E2            82.41
DATA 5,97: 'F2            87.31
DATA 5,47: 'F#2/Gb2       92.5
DATA 4,FB: 'G2            98
DATA 4,B3: 'G#2/Ab2      103.83
DATA 4,70: 'A2           110
DATA 4,30: 'A#2/Bb2      116.54
DATA 3,F4: 'B2           123.47
DATA 3,BB: 'C3           130.81    48
DATA 3,85: 'C#3/Db3      138.59
DATA 3,53: 'D3           146.83
DATA 3,23: 'D#3/Eb3      155.56
DATA 2,F6: 'E3           164.81
DATA 2,CB: 'F3           174.61
DATA 2,A3: 'F#3/Gb3      185
DATA 2,7D: 'G3           196
DATA 2,59: 'G#3/Ab3      207.65
DATA 2,38: 'A3           220
DATA 2,18: 'A#3/Bb3      233.08
DATA 1,FA: 'B3           246.94
DATA 1,DD: 'C4           261.63    60
DATA 1,C2: 'C#4/Db4      277.18
DATA 1,A9: 'D4           293.66
DATA 1,91: 'D#4/Eb4      311.13
DATA 1,7B: 'E4           329.63
DATA 1,65: 'F4           349.23
DATA 1,51: 'F#4/Gb4      369.99
DATA 1,3E: 'G4           392
DATA 1,2C: 'G#4/Ab4      415.3
DATA 1,1C: 'A4           440
DATA 1,0C: 'A#4/Bb4      466.16
DATA 0,FD: 'B4           493.88
DATA 0,EE: 'C5           523.25    72
DATA 0,E1: 'C#5/Db5      554.37
DATA 0,D4: 'D5           587.33
DATA 0,C8: 'D#5/Eb5      622.25
DATA 0,BD: 'E5           659.25
DATA 0,B2: 'F5           698.46
DATA 0,A8: 'F#5/Gb5      739.99
DATA 0,9F: 'G5           783.99
DATA 0,96: 'G#5/Ab5      830.61
DATA 0,8E: 'A5           880
DATA 0,86: 'A#5/Bb5      932.33
DATA 0,7E: 'B5           987.77
DATA 0,77: 'C6          1046.5     84
DATA 0,70: 'C#6/Db6     1108.73
DATA 0,6A: 'D6          1174.66
DATA 0,64: 'D#6/Eb6     1244.51
DATA 0,5E: 'E6          1318.51
DATA 0,59: 'F6          1396.91
DATA 0,54: 'F#6/Gb6     1479.98
DATA 0,4F: 'G6          1567.98
DATA 0,4B: 'G#6/Ab6     1661.22
DATA 0,47: 'A6          1760
DATA 0,43: 'A#6/Bb6     1864.66
DATA 0,3F: 'B6          1975.53
DATA 0,3B: 'C7          2093       96
DATA 0,38: 'C#7/Db7     2217.46
DATA 0,35: 'D7          2349.32
DATA 0,32: 'D#7/Eb7     2489.02
DATA 0,2F: 'E7          2637.02
DATA 0,2C: 'F7          2793.83
DATA 0,2A: 'F#7/Gb7     2959.96
DATA 0,27: 'G7          3135.96
DATA 0,25: 'G#7/Ab7     3322.44
DATA 0,23: 'A7          3520
DATA 0,21: 'A#7/Bb7     3729.31
DATA 0,1F: 'B7          3951.07
DATA 0,1D: 'C8          4186.01    108
DATA 0,1C: 'C#8/Db8     4434.92
DATA 0,1A: 'D8          4698.63
DATA 0,19: 'D#8/Eb8     4978.03
DATA 0,17: 'E8          5274.04
DATA 0,16: 'F8          5587.65
DATA 0,15: 'F#8/Gb8     5919.91
DATA 0,13: 'G8          6271.93
DATA 0,12: 'G#8/Ab8     6644.88
DATA 0,11: 'A8          7040
DATA 0,10: 'A#8/Bb8     7458.62
DATA 0,F: 'B8           7902.13
DATA 0,E: 'C9           8,372.02   120
DATA 0,E: 'C#9/Db9      8,869.84
DATA 0,D: 'D9           9,397.27
DATA 0,C: 'D#9/Eb9      9,956.06
DATA 0,B: 'E9           10,548.08
DATA 0,B: 'F9           11,175.30
DATA 0,A: 'F#9/Gb9      11,839.82
DATA 0,9: 'G9           12,543.85

'PSG loader CoCo 6809 machine code which loads the PSG music into the 512k of RAM in the PSG, I think this might even work on a 4k CoCo with CoCo PSG and cassette  :)
'See the source code "PSG_L1.ASM" which explains how it works
DATA "00","00","34","13","1A","50","B6","FF","7F","34","02","C6","FC","F7","FF","7F","34","04","CC","06","FF","FD","FF","5E","4A","2A","FA","86","06","8E","00","00","B7"
DATA "FF","5E","F6","FF","5F","3A","4A","2A","F6","35","04","8C","03","49","27","07","C1","FF","27","05","5C","20","D5","C4","03","35","02","B7","FF","7F","35","93","34"
DATA "56","8D","BD","C1","FF","26","2C","CE","04","00","8D","1A","45","52","52","4F","52","7A","4E","4F","60","43","4F","43","4F","50","53","47","60","46","4F","55","4E"
DATA "44","00","35","56","39","AE","E4","20","02","A7","C0","A6","80","26","FA","AF","E4","39","BE","FF","FE","8C","8C","1B","27","08","86","DE","B7","0E","CD","B7","0E"
DATA "F3","F7","0E","02","B6","FF","7F","B7","0E","06","84","FC","BA","0E","02","B7","FF","7F","B6","FF","5D","8A","10","B7","FF","5D","B6","FF","7F","58","58","58","58"
DATA "FA","0E","02","F7","0E","02","84","CC","BA","0E","02","B7","0E","07","B7","FF","7F","86","80","B7","FF","5A","F6","0E","03","5C","F7","0E","03","BE","0E","04","7F"
DATA "FF","DF","CE","C0","00","86","10","B7","FF","5D","B6","0E","06","B7","FF","7F","BD","A1","76","1A","50","7F","FF","DE","F6","0E","07","F7","FF","7F","C6","18","F7"
DATA "FF","5D","A7","C0","7F","FF","DF","1C","57","30","1F","26","05","7A","0E","03","27","0B","11","83","E0","00","25","CC","7C","FF","5A","20","C4","86","10","B7","FF"
DATA "5D","B6","0E","06","B7","FF","7F","FC","0E","00","FD","01","77","35","56","7E","01","76","00","00","02","01","77","0E","47","FF","00","00","0E","47"

SCREEN _NEWIMAGE(1280, 752, 256)

DIM array(5000000) AS _UNSIGNED _BYTE, TrackTitle$(100), InstrumentName$(100), EventName$(30), UsedTrack(100)
DIM Track(500000) AS _BYTE, Tick(500000), Event(500000) AS _BYTE, Channel(500000) AS _BYTE, Keynum(500000) AS _BYTE, Velocity(500000) AS _BYTE
DIM Track2(500000) AS _BYTE, Tick2(500000), Event2(500000) AS _BYTE, Channel2(500000) AS _BYTE, Keynum2(500000) AS _BYTE, Velocity2(500000) AS _BYTE
DIM BPM(10000), BPMChange(10000), tname$(16)
DIM note$(7), NoteName$(132), MIDIDev$(128)
DIM TrackInfo(100000, 128), noteTime(500000), noteOnOff(500000), note1(100000), note2(100000), note3(100000), note4(100000)
DIM vel1(100000) AS _UNSIGNED _BYTE, vel2(100000) AS _UNSIGNED _BYTE, vel3(100000) AS _UNSIGNED _BYTE, vel4(100000) AS _UNSIGNED _BYTE
DIM FI(200), GoodStart(200), ST(200), GoodEnd(200)
DIM CombineTracks(200) AS _BYTE, TempTrack(100000) AS _BYTE, TempTrackVel(100000) AS _BYTE
DIM GMC$(127, 1), PSG$(127, 1), TempOut(100000, 10) AS _UNSIGNED _BYTE, ramsize AS LONG
DIM DrumTrack(128) AS _UNSIGNED _BYTE, A AS _UNSIGNED _BYTE, velcon(15) AS _UNSIGNED _BYTE

'Read in Array data
FOR x = 1 TO 7: READ note$(x): NEXT x
FOR x = 0 TO 11: READ NoteName$(x): NEXT x
FOR x = 1 TO 27: READ EventName$(x): NEXT x
FOR y = 12 TO 120 STEP 12
    FOR x = 0 TO 11
        NoteName$(y + x) = NoteName$(x)
    NEXT x
NEXT y
FOR x = 1 TO 128: READ MIDIDev$(x): NEXT x

'Read in Game Master Controller Frequency values
FOR x = 0 TO 127
    FOR y = 1 TO 0 STEP -1
        READ GMC$(x, y)
    NEXT y
NEXT x
'Read in CoCo PSG Frequency values
FOR x = 0 TO 127
    FOR y = 0 TO 1
        READ PSG$(x, y)
    NEXT y
NEXT x
' Fix values for velocity for PSG as it is logarithmic
velcon(0) = 0
velcon(1) = 4
velcon(2) = 9
velcon(3) = 11
velcon(4) = 11
velcon(5) = 12
velcon(6) = 12
velcon(7) = 13
velcon(8) = 13
velcon(9) = 13
velcon(10) = 14
velcon(11) = 14
velcon(12) = 14
velcon(13) = 15
velcon(14) = 15
velcon(15) = 15

'MIDI Events
' 1=Header
' 2=Start_track
' 3=Note_off_c
' 4=Note_on_c
' 5=Poly_aftertouch_c
' 6=Control_c
' 7=Program_c
' 8=Channel_aftertouch_c
' 9=Pitch_bend_c
'10=System_exclusive=
'11=Sequence_number
'12=Text_t
'13=Copyright_t
'14=Title_t
'15=Instrument_name_t
'16=Lyric_t
'17=Marker_t
'18=Cue_point_t
'19=Channel_prefix
'20=MIDI_port
'21=End_track
'22=Tempo
'23=SMPTE_offset
'24=Time_signature
'25=Key_signature
'26=Sequencer_specific
'27=Unknown_event

GOTO 11
10 Track(L) = Trk: Tick(L) = Tik: Event(L) = Evnt: Channel(L) = Chan: Keynum(L) = Keyn: Velocity(L) = Vel: L = L + 1: RETURN
11
PRINT "MIDI format to CoCo converter V 1.0:"
PRINT "By: Glen Hewlett"
PRINT
PRINT "Converts MIDI files to a CoCo audio file format"
PRINT
'GOTO 12
count = _COMMANDCOUNT
IF count < 1 THEN
    PRINT "Usage: mid2cc MIDIfile"
    PRINT "Where: MIDIfile is the source MIDI file."
    PRINT
    PRINT "The program will allow the user to convert MIDI files into a format that can be played back in the background"
    PRINT "On a TRS-80 Color Computer.  It can output the music in one of three formats"
    PRINT "- Simon Jonassen's Dipole - two voice software player"
    PRINT "- John Linveille's Game Master Cartridge - three voice plus one noise channel, hardware player"
    PRINT "- Ed Snider's CoCo Programable Sound Generator - three voice, any voice could also play noise, hardware player"
    END
END IF
FI = 0: nt = 0: newp = 0: endp = 0
FOR check = 1 TO count
    N$ = COMMAND$(check)
    ' check if we have a file name yet if so then the next filename will be output
    IF FI > 0 THEN Fname$ = N$: GOTO 100
    FI = 1
    Fname$ = N$
    OPEN Fname$ FOR APPEND AS #1
    length = LOF(1)
    CLOSE #1
    IF length < 1 THEN PRINT "Error file: "; Fname$; " is 0 bytes. Or doesn't exits.": KILL Fname$: END
    PRINT "Length of Input file "; Fname$; " is:"; length
    OPEN Fname$ FOR BINARY AS #1
    GET #1, , array()
    CLOSE #1
100 NEXT check

GOTO 12
'12
'N$ = "MISSION.MID"
'N$ = "Dreams.mid"
N$ = "fod.mid"
N$ = "FOD_Half.mid"
'N$ = "FOD_Full.mid"
'N$ = "HALLOWEE.MID"
'N$ = "Halloween2.mid"
N$ = "The_Doors_-_Riders_on_the_Storm.mid"
'N$ = "PEANUTS.MID"
'N$ = "C_Scale_C4_to_C8.mid"
'N$ = "ChromaticScale_C2_to_B7.mid"
'N$ = "X_FILES4.MID"
'N$ = "BLADERUN.MID"
'N$ = "DRWHO.MID"
'N$ = "LLDOB.MID"
'N$ = "Axelf.mid"
'N$ = "FOD_Fav.mid"
'N$ = "ESCAPENY.MID"
'N$ = "Shine_On_You_Crazy_Diamond.mid"
'N$ = "Sheep.mid"
'N$ = "CLOUDBUS.MID"
'N$ = "PETERGUN.MID"
'N$ = "FollowYouFollowMe.mid"
'N$ = "GaryJules_-_MadWorld.mid"
'N$ = "Tears_For_Fears_-_Head_Over_Heels.mid"
'N$ = "Yodas_Theme.mid"
'N$ = "Requiem_For_A_Dream.mid"
'N$ = "Bass_Drum_Hit.mid"
'N$ = "Bass_Hi-Hat.mid"
'N$ = "Hi-Hat.mid"
'N$ = "snare.mid"
'N$ = "VolumeTest.mid"
12
Fname$ = N$: OPEN Fname$ FOR BINARY AS #1: GET #1, , array(): CLOSE #1

t$ = "": cp = 0: L = 0: 't$=temp text, cp=current pointer to MIDI file array, L is the MIDI instruction described as a row
'read the header chunk of the MIDI file
FOR x = 0 TO 3
    t$ = t$ + CHR$(array(cp)): cp = cp + 1
NEXT x
'load mv with a 4 byte value
GOSUB 340
IF t$ <> "MThd" OR mv <> 6 THEN PRINT "File "; Fname$; " is not a valid MIDI file": END
PRINT " Input file: "; Fname$
outname$ = Fname$ + ".asm"
OPEN outname$ FOR OUTPUT AS #2
'OPEN "test.asm" FOR OUTPUT AS #2
PRINT "Output file: "; outname$
'load mv with a 2 byte value to get the MIDI Type #
GOSUB 320: MF = mv
PRINT "MIDI Format is Type"; MF
'load mv with a 2 byte value to get the # of tracks in this MIDI file
'Type 0 MIDI file will only have one Track Chunk, Type 1 and Type 2 can have many...
GOSUB 320: TrackChunks = mv
PRINT "Number of MIDI Track Chunks"; TrackChunks
'get the Delta Time Info and figure out the TimeDivision
DT = array(cp)
IF DT AND 128 THEN ' DT = SMPTE standards
    DT = 255 - DT + 1 ' convert from 2's compliment
    IF DT = 29 THEN DT = 29.97
    DTU = array(cp + 1) ' delta time units
    PRINT "MIDI uses SMPTE time"; DT; "Frames per second and"; DTU; "'divisions per frame - Untested time format!!!"
    PRINT "Code to handle this MIDI time format has been added as per the spec but it"
    PRINT "hasn't been tested."
    TimeDivision = DT * DTU
ELSE
    TimeDivision = DT * 256 + array(cp + 1)
END IF
PRINT "MIDI delta-time increments (TimeDivision)"; TimeDivision; "each millisecond."

cp = cp + 2
Trk = 0: Tik = 0: Evnt = 1: Chan = MF: Keyn = TrackChunks: Vel = TimeDivision: GOSUB 10

'Initialize settings
BPM(0) = 120: 'default for MIDI if no BMP info given in the MIDI file
BPMCount = 0: BeatCount = 0: BPM = BPM(0)
'Main track input loop starts here
200
Trk = Trk + 1: Tik = 0: Evnt = 2: Chan = 0: Keyn = 0: Vel = 0: GOSUB 10: Event = 1 = Start_track
'Initialize the Total time for this track and the message/name of the track
Total = 0: mess$ = ""
t$ = "": RealTime = 0
FOR x = 1 TO 4
    t$ = t$ + CHR$(array(cp)): cp = cp + 1
NEXT x
'Make sure the start of the new Track header is correct
IF t$ <> "MTrk" THEN 230: 'got to the end of the file (read all the tracks)
'Get 4 byte value in mv to get the size of the Trac kChunk
GOSUB 340: cs = mv
'PRINT #2, "Size of this track Chunk is"; cs
checksize = cp + cs
'Track Reading Loop
210
'Always get the time from last event in ticks, mv is a Variable Length Quantity
GOSUB 300: ticks = mv: Total = Total + ticks: Tik = Total
'Handle Tempo change, at the BPMChange() point add a note on and note off with 0 time difference
'This should ensure all Tempo changes are made on each channel at the same point in the score
tempoflag = 0
Event = array(cp): cp = cp + 1
'Check for System Exclusive Event
IF Event = &HF0 OR Event = &HF7 THEN
    Evnt = 10: GOSUB 10
    'Load mv with the Variable Length Quantity where cp is pointing in the array
    GOSUB 300:
    'ignore the Sys Exclusive info...
    cp = cp + mv
    GOTO 220
END IF
'Check for a Meta Event
IF Event = &HFF THEN
    'PRINT #2, "Meta Event"
    GOSUB 500: GOTO 220
END IF
IF Event < &H80 THEN
    'Running status is used, same event as last time, so this event is actually data for the same type of event as last time
    'PRINT #2, "Midi uses Running Status"
    Event = lastevent
    cp = cp - 1: ' move pointer back so it points to the data for this same event type as the last one
    ' PRINT HEX$(event), HEX$(array(cp)), HEX$(array(cp + 1)): SLEEP: END
END IF
'MIDI Messages
'turn event into lnibble,rnibble
GOSUB 350:
'PRINT #2, HEX$(lnibble), HEX$(rnibble), HEX$(array(cp - 1)), HEX$(array(cp)), HEX$(array(cp + 1))
'Remember the event so we can handle running status MIDI file event data
lastevent = Event
'Check for a Mode Message
IF lnibble = &HB AND array(cp) > &H77 THEN
    'PRINT #2, "Channel Mode Messages"
    GOSUB 700: GOTO 220
END IF
'If we get here then it is a Channel Voice Message
'PRINT #2, "Channel Voice Messages ";
GOSUB 600
220
'See if we are at the end of this track yet, loop if not
IF cp < checksize THEN 210
'Try to get name of track from MIDI message or device number
tname$(Midichan) = tname$(Midichan) + " - " + mess$: 'trackname$
IF LEN(tname$(Midichan)) > 72 THEN tname$(Midichan) = LEFT$(tname$(Midichan), 72)
'Loop to get another Track's data
GOTO 200
'We now have all the note info from the MIDI file
230
'Skip if MIDI format is Type 1, otherwise arange it so it's similar to a Type 1 MIDI file
IF MF = 1 THEN 239
x = 1
232
IF Channel(x) = 0 THEN
    Track2(x) = Track(x)
    Tick2(x) = Tick(x)
    Event2(x) = Event(x)
    Channel2(x) = Channel(x)
    Keynum2(x) = Keynum(x)
    Velocity2(x) = Velocity(x)
    x = x + 1: GOTO 232
END IF
x = x + 1
Track2(x) = Track(x - 1)
Tick2(x) = Tick(x - 1)
Event2(x) = 21
Channel2(x) = Channel(x - 1)
Keynum2(x) = Keynum(x - 1)
Velocity2(x) = Velocity(x - 1)
x = x + 1
Track2(x) = Track(x - 2)
Tick2(x) = Tick(x - 2)
Event2(x) = 2
Channel2(x) = Channel(x - 2)
Keynum2(x) = Keynum(x - 2)
Velocity2(x) = Velocity(x - 2)
Chan = 0: st = x - 2: moveto = x + 1: movefrom = st: ad = 2

234
IF Channel(movefrom) = Chan THEN
    Track2(moveto) = Track(movefrom)
    Tick2(moveto) = Tick(movefrom)
    Event2(moveto) = Event(movefrom)
    Channel2(moveto) = Channel(movefrom)
    Keynum2(moveto) = Keynum(movefrom)
    Velocity2(moveto) = Velocity(movefrom)
    moveto = moveto + 1
    movefromLast = movefrom
END IF
movefrom = movefrom + 1
IF movefrom <= L THEN 234
Chan = Chan + 1
IF moveto <> movetoLast THEN
    Track2(moveto) = Track(movefromLast)
    Tick2(moveto) = Tick(movefromLast)
    Event2(moveto) = 21
    Channel2(moveto) = Channel(movefromLast)
    Keynum2(moveto) = Keynum(movefromLast)
    Velocity2(moveto) = Velocity(movefromLast)
    moveto = moveto + 1
    Track2(moveto) = Track(movefromLast)
    Tick2(moveto) = 0
    Event2(moveto) = 2
    Channel2(moveto) = 0
    Keynum2(moveto) = 0
    Velocity2(moveto) = 0
    moveto = moveto + 1
    ad = ad + 2
    movetoLast = moveto
END IF
movefrom = st
IF Chan < 16 THEN 234
238
L = L + ad - 2

' move data back
FOR x = 1 TO moveto - 1
    Track(x) = Track2(x)
    Tick(x) = Tick2(x)
    Event(x) = Event2(x)
    Channel(x) = Channel2(x)
    Keynum(x) = Keynum2(x)
    Velocity(x) = Velocity2(x)
NEXT x
239

'figure out the tracks that are empty and where the good ones start
C = 0
FOR x = 0 TO L
    IF Event(x) = 7 OR Event(x) = 2 THEN 'Event 7 = Instrument change, Event 2 = Start track
        'PRINT "Start Track or New Instrument"
        ST(C) = x: C = C + 1
    END IF
NEXT x
ST(C) = L

BC = 0: LT = 0: RTBPMC = 1: TickDiff = 0: RealTime = 0: UT = 1
FOR x = 0 TO L
    noteOnOff(x) = 0
    PRINT #2, Track(x); ","; Tick(x); ",Event #"; Event(x); EventName$(Event(x)); ","; Channel(x); ","; Keynum(x); ","; Velocity(x);
    IF Event(x) = 7 THEN UT = UT + 1: 'Event 7 = Instrument Change
    IF Event(x) = 22 THEN ' Event 22 = Tempo Change
        PRINT #2, "="; INT(BPM(BC) + .5); "BPM": BC = BC + 1
    ELSE
        ' track start
        IF Event(x) = 2 THEN ' Event 2 = Start New Track
            UT = UT + 1
            flag = 1
            RTBPMC = 1
            TickDiff = 0
            RealTime = 0
            noteTime(x) = 0
            PRINT #2,
        ELSE
            IF x > 0 AND Event(x) <> 21 THEN ' Event 21 = End Track
                IF RTBPMC <= BPMCount AND Tick(x) >= BPMChange(RTBPMC) THEN
                    LastTick = Tick(x - 1)
                    WHILE RTBPMC <= BPMCount AND Tick(x) > BPMChange(RTBPMC)
                        'PRINT "found Time to update tempo and time."
                        TickDiff = BPMChange(RTBPMC) - LastTick
                        RealTime = RealTime + (TickDiff / TimeDivision) * (60000 / BPM(RTBPMC - 1))
                        TickDiff = Tick(x) - BPMChange(RTBPMC)
                        LastTick = BPMChange(RTBPMC)
                        RTBPMC = RTBPMC + 1
                    WEND
                ELSE
                    TickDiff = Tick(x) - Tick(x - 1)
                END IF
                RealTime = RealTime + (TickDiff / TimeDivision) * (60000 / BPM(RTBPMC - 1))
                tminutes = INT(RealTime / 60000)
                tseconds = (RealTime / 60000 - tminutes) * 60
                tps = (tseconds - INT(tseconds)) * 25: 'TScc
                tps = INT(tps * 100) / 100
                tps2 = (tps - INT(tps)) * 80: 'TScc
                tps2 = INT(tps2 + .5)
                tps = INT(tps)
                Ti$ = STR$(tminutes) + ":" + STR$(INT(tseconds)) + ":" + STR$(tps) + "." + STR$(tps2)
                PRINT #2, Ti$, RealTime, RTBPMC; BPMChange(RTBPMC); BPM(RTBPMC - 1); BPMCount;

                IF Event(x) = 4 THEN ' Event 4 = Note On
                    IF Velocity(x) < 128 THEN
                        IF Velocity(x) > 0 THEN noteOnOff(x) = 1: 'If velocity = 0 then it is the same as a note off (usually used with running status)
                    END IF
                END IF
                PRINT #2, x, noteOnOff(x)
                noteTime(x) = RealTime
            ELSE
                PRINT #2,
            END IF
        END IF
    END IF
    'figure out the longest track
    IF RealTime > LT THEN LT = RealTime
NEXT x

FOR y = 0 TO C - 1
    FI(y) = 0
    FOR x = ST(y) TO ST(y + 1)
        IF Event(x) = 3 OR Event(x) = 4 THEN FI(y) = 1: EXIT FOR
    NEXT x
NEXT y
C = 0: T = 0
FOR x = 0 TO L
    IF x = ST(C) THEN
        C = C + 1
        IF FI(C - 1) = 1 THEN
            GoodStart(T) = ST(C - 1): GoodEnd(T) = ST(C) - 1
            T = T + 1
        END IF
    END IF
NEXT x
OctaveAdd = 0
13
PRINT "Number of Tracks/Channels with note data is: "; T
PRINT
PRINT "In the next screen you will be able to select the tracks to be used with the converter."
PRINT "You can select multiple tracks for each voice.  Keep in mind each voice can only play one note at a time."
PRINT
PRINT "What output format do you want to create:"
PRINT "Simon's dipole.asm format can playback 1 or 2 channels"
PRINT "1) - Simon Jonasson's dipole.asm software music player - FCB data format with Simon Jonesson's dipole.asm player ready for your own ML program"
PRINT "2) - Simon Jonasson's dipole.asm software music player - RAW FCB data format to be used with Simon Jonesson's dipole.asm player"
PRINT
PRINT "John Linville's Game Master Cartridge can play 1, 2 or 3 channels and a 4th noise channel can be used for a drum track"
PRINT "3) - John Linville's GMC - FCB data format with Glen Hewlett's GMC player - ready to be assembled and tested using MAME"
PRINT "4) - John Linville's GMC - RAW FCB data format for Glen Hewlett's GMC player"
PRINT
PRINT "Ed Snider's CoCo Programable Sound Generator can play 1,2 or 3 channels, channel 3 will play noise if it is used for a drum track"
PRINT "5) - Ed Snider's CoCo PSG - Converts to a PSGLOADR file ready to be played with Glen Hewlett's PSG Player used from BASIC with a CoCo PSG"
PRINT "6) - Ed Snider's CoCo PSG - Converts to a PSGLOADR file and FCB data and used with Glen Hewlett's PSGPLAYER.ASM and your own ML program"
PRINT
PRINT "If you want to playback the music on a PAL CoCo put the letter p after the number 1-6 below, or the program will default to NTSC timing"
INPUT "Format"; q$
OutputFormat = VAL(LEFT$(q$, 1))
IF OutputFormat < 1 OR OutputFormat > 6 THEN CLS: GOTO 13
IF OutputFormat = 1 OR OutputFormat = 2 THEN TimeInc = 0.03250794
IF OutputFormat = 3 OR OutputFormat = 4 THEN TimeInc = 0.033333333333
IF OutputFormat = 5 OR OutputFormat = 6 THEN TimeInc = 0.033333333333
IF RIGHT$(q$, 1) = "p" OR RIGHT$(q$, 1) = "P" THEN TimeInc = TimeInc * 60 / 50: PRINT "Using PAL timing, this will playback faster then normal on an NTSC CoCo"
PRINT
INPUT "Some older MIDI files are an octave too low - Convert the song an octave higher (y or [n])"; q$
IF q$ = "Y" OR q$ = "y" THEN OctaveAdd = 1
20
CLS
'If 2,4 or 6 then we don't need to ask the user more questions
IF OutputFormat = 1 OR OutputFormat = 3 OR OutputFormat = 5 THEN
    PRINT "Going to output the Music data and player so that it can be used in the background of a BASIC program on the CoCo"
    PRINT
    PRINT "How much RAM does the target CoCo have:"
    PRINT "1) - CoCo 1 or 2 with 16k"
    PRINT "2) - CoCo 1 or 2 with 32k"
    PRINT "3) - CoCo 1 or 2 with 64k"
    PRINT "4) - CoCo 3 with 128k or more RAM"
    INPUT "1,2,3,[4]"; RAM
    IF RAM = 0 THEN RAM = 4
    IF RAM > 4 THEN 20
    IF RAM = 1 THEN ramsize = 16384 ' &H4000
    IF RAM > 1 THEN ramsize = 32768 ' &H8000
END IF
CLS
ScaleX = 1080 / LT
ScaleY = 700 / T
ScaleY2 = -ScaleY / 128
LINE (200, 0)-(1280, 700), 2, BF
FOR x = 0 TO T - 1
    LINE (200, x * ScaleY)-(1280, (x + 1) * ScaleY), 0, B
NEXT x

FOR C = 1 TO T
    InstrCount = 0: InstrFlag = 0: BC = 0: LT = 0: RTBPMC = 1: TickDiff = 0: RealTime = 0
    InstrumentFlag = 0
    FOR x = GoodStart(C - 1) TO GoodEnd(C - 1)

        IF Event(x) = 7 THEN
            InstrumentFlag = 1
            IF Channel(x) = 10 THEN
                _PRINTSTRING (0, (C - 1) * ScaleY), "Drums"
                IF OutputFormat > 2 THEN
                    _PRINTSTRING (125, (C - 1) * ScaleY + 13), "4"
                    LINE (135, (C - 1) * ScaleY + 14)-(160, (C - 1) * ScaleY + 25), 15, B
                END IF
                DrumTrack(C) = 1
            ELSE
                _PRINTSTRING (0, (C - 1) * ScaleY), LEFT$(MIDIDev$(Keynum(x)), 25)
                _PRINTSTRING (5, (C - 1) * ScaleY + 13), "1"
                LINE (15, (C - 1) * ScaleY + 14)-(40, (C - 1) * ScaleY + 25), 15, B
                _PRINTSTRING (45, (C - 1) * ScaleY + 13), "2"
                LINE (55, (C - 1) * ScaleY + 14)-(80, (C - 1) * ScaleY + 25), 15, B
                IF OutputFormat > 2 THEN
                    _PRINTSTRING (85, (C - 1) * ScaleY + 13), "3"
                    LINE (95, (C - 1) * ScaleY + 14)-(120, (C - 1) * ScaleY + 25), 15, B
                END IF
            END IF
        END IF

        IF Event(x) <> 22 THEN
            ' track start
            IF Event(x) = 2 OR Event(x) = 1 THEN
                flag = 1
                RTBPMC = 1
                TickDiff = 0
                RealTime = 0
            ELSE
                IF Tick(x) > 0 AND Event(x) <> 21 THEN ' Event 21 = End Track
                    IF RTBPMC <= BPMCount AND Tick(x) > BPMChange(RTBPMC) THEN
                        LastTick = Tick(x - 1)
                        WHILE RTBPMC <= BPMCount AND Tick(x) >= BPMChange(RTBPMC)
                            TickDiff = BPMChange(RTBPMC) - LastTick
                            RealTime = RealTime + (TickDiff / TimeDivision) * (60000 / BPM(RTBPMC - 1))
                            TickDiff = Tick(x) - BPMChange(RTBPMC)
                            LastTick = BPMChange(RTBPMC)
                            RTBPMC = RTBPMC + 1
                        WEND
                    ELSE
                        TickDiff = Tick(x) - Tick(x - 1)
                    END IF

                    RealTime = RealTime + (TickDiff / TimeDivision) * (60000 / BPM(RTBPMC - 1))
                END IF
            END IF
        END IF
        IF Event(x) = 4 AND Velocity(x) > 0 THEN
            StartX = 200 + RealTime * ScaleX
            tRealtime = RealTime
            tRTBPMC = RTBPMC
            tTickDiff = TickDiff
            FOR R = x + 1 TO L
                IF Tick(R) > 0 AND Event(R) <> 21 THEN
                    IF tRTBPMC <= BPMCount AND Tick(R) > BPMChange(tRTBPMC) THEN
                        tTickDiff = BPMChange(tRTBPMC) - Tick(R - 1)
                        tRealtime = tRealtime + (tTickDiff / TimeDivision) * (60000 / BPM(tRTBPMC - 1))
                        tTickDiff = Tick(R) - BPMChange(tRTBPMC)
                        tRTBPMC = tRTBPMC + 1
                    ELSE
                        tTickDiff = Tick(R) - Tick(R - 1)
                    END IF
                    tRealtime = tRealtime + (tTickDiff / TimeDivision) * (60000 / BPM(tRTBPMC - 1))
                END IF
                IF Event(R) = 7 THEN GOTO 290
                IF Keynum(x) = Keynum(R) THEN
                    IF Event(R) = 4 AND Velocity(R) = 0 THEN GOTO 290: 'PRINT "trealtime"; tRealtime, RealTime: GOTO 290
                    IF Event(R) = 3 THEN GOTO 290
                END IF
            NEXT R
            PRINT "didn't find an off key, for "; Channel(x), x: SLEEP: SYSTEM
            290
            EndX = 200 + tRealtime * ScaleX
            StartY = C * ScaleY + Keynum(x) * ScaleY2
            EndY = StartY
            LINE (StartX, StartY)-(EndX, EndY), 14
        END IF
    NEXT x
    IF InstrumentFlag = 0 THEN
        _PRINTSTRING (0, (C - 1) * ScaleY), "??? Instrument or Drums"
        _PRINTSTRING (5, (C - 1) * ScaleY + 13), "1"
        LINE (15, (C - 1) * ScaleY + 14)-(40, (C - 1) * ScaleY + 25), 15, B
        _PRINTSTRING (45, (C - 1) * ScaleY + 13), "2"
        LINE (55, (C - 1) * ScaleY + 14)-(80, (C - 1) * ScaleY + 25), 15, B
        IF OutputFormat > 2 THEN
            _PRINTSTRING (85, (C - 1) * ScaleY + 13), "3"
            LINE (95, (C - 1) * ScaleY + 14)-(120, (C - 1) * ScaleY + 25), 15, B
        END IF
        IF OutputFormat = 3 OR OutputFormat = 4 THEN
            _PRINTSTRING (125, (C - 1) * ScaleY + 13), "4"
            LINE (135, (C - 1) * ScaleY + 14)-(160, (C - 1) * ScaleY + 25), 15, B
        END IF
    END IF
NEXT C
_PRINTSTRING (0, 700), "   Left Click on the Voice you want to add, Right Click to remove a selection.  Press <Space Bar> or <Enter> when you have finished selecting the tracks"
_PRINTSTRING (0, 724), "- If Voice 1 and 2 are selected for the same track Voice 1 will be the high note and voice 2 will be the low note of a chord"
_PRINTSTRING (0, 737), "- If Voice 1,2 and 3 are used in the same track Voice 1 will be the high note, voice 2 will be the low note, voice 3 will be 2nd highest note of the chord"
DO: k$ = INKEY$
    DO WHILE _MOUSEINPUT
        x = _MOUSEX: y = _MOUSEY
        IF _MOUSEBUTTON(1) = -1 THEN
            PT = INT(y / ScaleY) + 1
            IF x < 41 THEN
                IF (CombineTracks(PT) AND 1) = 0 THEN
                    LINE (15, (PT - 1) * ScaleY + 14)-(40, (PT - 1) * ScaleY + 25), 12, BF
                    CombineTracks(PT) = CombineTracks(PT) + 1
                END IF
            END IF
            IF x > 40 AND x < 81 THEN
                IF (CombineTracks(PT) AND 2) = 0 THEN
                    LINE (55, (PT - 1) * ScaleY + 14)-(80, (PT - 1) * ScaleY + 25), 10, BF
                    CombineTracks(PT) = CombineTracks(PT) + 2
                END IF
            END IF
            IF x > 80 AND x < 121 THEN
                IF (CombineTracks(PT) AND 4) = 0 THEN
                    LINE (95, (PT - 1) * ScaleY + 14)-(120, (PT - 1) * ScaleY + 25), 14, BF
                    CombineTracks(PT) = CombineTracks(PT) + 4
                END IF
            END IF
            IF x > 120 AND x < 161 THEN
                IF (CombineTracks(PT) AND 8) = 0 THEN
                    LINE (135, (PT - 1) * ScaleY + 14)-(160, (PT - 1) * ScaleY + 25), 15, BF
                    CombineTracks(PT) = CombineTracks(PT) + 8
                END IF
            END IF
        END IF
        IF _MOUSEBUTTON(2) = -1 THEN
            PT = INT(y / ScaleY) + 1
            IF x < 41 THEN
                IF (CombineTracks(PT) AND 1) = 1 THEN
                    LINE (15, (PT - 1) * ScaleY + 14)-(40, (PT - 1) * ScaleY + 25), 0, BF
                    LINE (15, (PT - 1) * ScaleY + 14)-(40, (PT - 1) * ScaleY + 25), 15, B
                    CombineTracks(PT) = CombineTracks(PT) - 1
                END IF
            END IF
            IF x > 40 AND x < 81 THEN
                IF (CombineTracks(PT) AND 2) = 2 THEN
                    LINE (55, (PT - 1) * ScaleY + 14)-(80, (PT - 1) * ScaleY + 25), 0, BF
                    LINE (55, (PT - 1) * ScaleY + 14)-(80, (PT - 1) * ScaleY + 25), 15, B
                    CombineTracks(PT) = CombineTracks(PT) - 2
                END IF
            END IF
            IF x > 80 AND x < 121 THEN
                IF (CombineTracks(PT) AND 4) = 4 THEN
                    LINE (95, (PT - 1) * ScaleY + 14)-(120, (PT - 1) * ScaleY + 25), 0, BF
                    LINE (95, (PT - 1) * ScaleY + 14)-(120, (PT - 1) * ScaleY + 25), 15, B
                    CombineTracks(PT) = CombineTracks(PT) - 4
                END IF
            END IF
            IF x > 120 AND x < 161 THEN
                IF (CombineTracks(PT) AND 8) = 8 THEN
                    LINE (135, (PT - 1) * ScaleY + 14)-(160, (PT - 1) * ScaleY + 25), 0, BF
                    LINE (135, (PT - 1) * ScaleY + 14)-(160, (PT - 1) * ScaleY + 25), 15, B
                    CombineTracks(PT) = CombineTracks(PT) - 8
                END IF
            END IF
        END IF
    LOOP
LOOP UNTIL k$ = CHR$(32) OR k$ = CHR$(13)

240
notecount = L
CLOSE #2
OPEN "temp.asm" FOR OUTPUT AS #2

PRINT #2, "********************************************"
PRINT #2, "* Music data for song: "; Fname$
PRINT #2, "* Voice 1 tracks are:"
FOR p = 0 TO T
    IF CombineTracks(p) AND 1 THEN
        PRINT #2, "* Track #"; p
    END IF
NEXT p
PRINT #2, "* Voice 2 tracks are:"
FOR p = 0 TO T
    IF CombineTracks(p) AND 2 THEN
        PRINT #2, "* Track #"; p
    END IF
NEXT p
IF OutputFormat > 2 THEN
    PRINT #2, "* Voice 3 tracks are:"
    FOR p = 0 TO T
        IF CombineTracks(p) AND 4 THEN
            PRINT #2, "* Track #"; p
        END IF
    NEXT p
    IF OutputFormat = 3 OR OutputFormat = 4 THEN
        PRINT #2, "* Voice 4 tracks are:"
        FOR p = 0 TO T
            IF CombineTracks(p) AND 8 THEN
                PRINT #2, "* Track #"; p
            END IF
        NEXT p
    END IF
END IF
' Playback will be updated every 1/30th of a second = 0.033333333
' This means it can playback 1/64th notes at 112.5 bpm max speed or 1/32 note at 225 bpm
' I don't think anyone will notice if 1/32 note is missed playing back at 225 bpm!
' This value could be changed so that slower songs would be even less CPU intensive, the the playback code would need to be tweaked based on this info

' two channels to convert to John Lynville's Game Master Cartridge format (Texas Instruments SN76489 sound chip)

' Use CombineTracks(200) and TempTrack(500000) to combine all the selected ch1 tracks and selected ch2 tracks together
' Build an entire track for ch1
CLS
bigcount = 0
FOR x = 0 TO 100000
    note1(x) = 0: note2(x) = 0: note3(x) = 0: note4(x) = 0
    TempTrack(x) = 0
NEXT x
FOR p = 0 TO T
    IF CombineTracks(p) AND 1 THEN
        PRINT "Chan 1 - Working on track"; p
        Time = 0
        ' make 129 a non note (clear the track)
        FOR x = 0 TO 100000
            FOR y = 0 TO 127
                TrackInfo(x, y) = 129
            NEXT y
        NEXT x
        count = 0
        ch1 = p - 1
        x = GoodStart(ch1)
        Chan = ch1: GOSUB 900
        'Fill in the gaps of the track
        GOSUB 910
        FOR x = 0 TO count
            y = 127: 'keep the highest note if a chord is being played
            242
            IF y < 0 THEN y = 0: note1(x) = y: vel1(x) = 0: GOTO 243
            IF TrackInfo(x, y) = 129 THEN y = y - 1: GOTO 242
            note1(x) = y: vel1(x) = TrackInfo(x, y)
            IF vel1(x) = 128 THEN y = y - 1: GOTO 242
            243
        NEXT x
        FOR x = 0 TO count
            IF note1(x) > 0 THEN
                IF TempTrack(x) < note1(x) THEN TempTrack(x) = note1(x): TempTrackVel(x) = vel1(x)
            END IF
            note1(x) = 0
        NEXT x
        IF count > bigcount THEN bigcount = count
    END IF
NEXT p
FOR x = 0 TO bigcount
    note1(x) = TempTrack(x)
    IF note1(x) = 0 OR note1(x) > 127 THEN
        vel1(x) = 0
    ELSE
        vel1(x) = TempTrackVel(x)
    END IF
    TempTrack(x) = 0
NEXT x

'Build an entire track for ch2
bigcount2 = 0
FOR p = 0 TO T
    IF CombineTracks(p) AND 2 THEN
        PRINT "Chan 2 - Working on track"; p
        Time = 0
        ' make 129 a non note
        FOR x = 0 TO 100000
            FOR y = 0 TO 127
                TrackInfo(x, y) = 129
            NEXT y
        NEXT x
        count = 0
        ch2 = p - 1
        x = GoodStart(ch2)
        Chan = ch2: GOSUB 900
        ' Fill in the gaps of the track
        GOSUB 910
        'keep the highest note if a chord is being played unless both voices use the same channel, then channel 2 will be the low note
        IF CombineTracks(p) = 3 OR CombineTracks(p) = 7 THEN
            'user selected the same track for both voices so use the low notes for this voice
            FOR x = 0 TO count
                y = 0
                244
                IF y >= 128 THEN y = 0: note2(x) = y: vel2(x) = 0: GOTO 245
                IF TrackInfo(x, y) = 129 THEN y = y + 1: GOTO 244
                note2(x) = y: vel2(x) = TrackInfo(x, y)
                IF vel2(x) = 128 THEN y = y + 1: GOTO 244
                245
            NEXT x
        ELSE
            FOR x = 0 TO count
                y = 127
                246
                IF y < 0 THEN y = 0: note2(x) = y: vel2(x) = 0: GOTO 247
                IF TrackInfo(x, y) = 129 THEN y = y - 1: GOTO 246
                note2(x) = y: vel2(x) = TrackInfo(x, y)
                IF vel2(x) = 128 THEN y = y - 1: GOTO 246
                247
            NEXT x
        END IF
        FOR x = 0 TO count
            IF note2(x) > 0 THEN
                IF TempTrack(x) < note2(x) THEN TempTrack(x) = note2(x): TempTrackVel(x) = vel2(x)
            END IF
            note2(x) = 0
        NEXT x
        IF count > bigcount2 THEN bigcount2 = count
    END IF
NEXT p
FOR x = 0 TO bigcount2
    note2(x) = TempTrack(x)
    IF note2(x) = 0 OR note2(x) > 127 THEN
        vel2(x) = 0
    ELSE
        vel2(x) = TempTrackVel(x)
    END IF
    TempTrack(x) = 0
NEXT x

'Build an entire track for ch3
bigcount3 = 0
FOR p = 0 TO T
    IF CombineTracks(p) AND 4 THEN
        PRINT "Chan 3 - Working on track"; p
        IF DrumTrack(p) = 1 THEN drum3 = 1
        Time = 0
        ' make 129 a non note
        FOR x = 0 TO 100000
            FOR y = 0 TO 127
                TrackInfo(x, y) = 129
            NEXT y
        NEXT x
        count = 0
        ch3 = p - 1
        x = GoodStart(ch3)
        Chan = ch3: GOSUB 900
        ' Fill in the gaps of the track
        GOSUB 910
        ' if voice 1,2 & 3 are all playing the same channel then play the second highest note
        IF CombineTracks(p) = 7 THEN
            C = 0
            FOR x = 0 TO count
                y = 127
                248
                IF y < 0 THEN y = 0: note3(x) = y: vel3(x) = 0: GOTO 249
                IF TrackInfo(x, y) = 129 THEN y = y - 1: GOTO 248
                C = C + 1: y = y - 1
                IF C = 1 THEN 248
                note3(x) = y: vel3(x) = TrackInfo(x, y)
                IF vel3(x) = 128 THEN y = y - 1: GOTO 248
                249
            NEXT x
        ELSE 'keep the highest note if a chord is being played in this channel
            FOR x = 0 TO count
                y = 127
                250
                IF y < 0 THEN y = 0: note3(x) = y: vel3(x) = 0: GOTO 251
                IF TrackInfo(x, y) = 129 THEN y = y - 1: GOTO 250
                note3(x) = y: vel3(x) = TrackInfo(x, y)
                IF vel3(x) = 128 THEN y = y - 1: GOTO 250
                251
            NEXT x
        END IF
        FOR x = 0 TO count
            IF note3(x) > 0 THEN
                IF TempTrack(x) < note3(x) THEN TempTrack(x) = note3(x): TempTrackVel(x) = vel3(x)
            END IF
            note3(x) = 0
        NEXT x
        IF count > bigcount3 THEN bigcount3 = count
    END IF
NEXT p
FOR x = 0 TO bigcount3
    note3(x) = TempTrack(x)
    IF note3(x) = 0 OR note3(x) > 127 THEN
        vel3(x) = 0
    ELSE
        vel3(x) = TempTrackVel(x)
    END IF
    TempTrack(x) = 0
NEXT x

'Build an entire track for ch4
drums = 0
bigcount4 = 0
FOR p = 0 TO T
    IF CombineTracks(p) AND 8 THEN
        drums = 1
        PRINT "Noise Chan 4 - Working on track"; p
        Time = 0
        ' make 129 a non note
        FOR x = 0 TO 100000
            FOR y = 0 TO 127
                TrackInfo(x, y) = 129
            NEXT y
        NEXT x
        count = 0
        ch4 = p - 1
        x = GoodStart(ch4)
        Chan = ch4: GOSUB 900
        ' Fill in the gaps of the track
        GOSUB 910
        'keep the highest note if a chord is being played in this channel
        FOR x = 0 TO count
            y = 127
            252
            IF y < 0 THEN y = 0: note4(x) = y: vel4(x) = 0: GOTO 253
            IF TrackInfo(x, y) = 129 THEN y = y - 1: GOTO 252
            note4(x) = y: vel4(x) = TrackInfo(x, y)
            IF vel4(x) = 128 THEN y = y - 1: GOTO 252
            253
        NEXT x
        FOR x = 0 TO count
            IF note4(x) > 0 THEN
                IF TempTrack(x) < note4(x) THEN TempTrack(x) = note4(x): TempTrackVel(x) = vel4(x)
            END IF
            note4(x) = 0
        NEXT x
        IF count > bigcount4 THEN bigcount4 = count
    END IF
NEXT p
FOR x = 0 TO bigcount4
    note4(x) = TempTrack(x)
    IF note4(x) = 0 THEN
        vel4(x) = 0
    ELSE
        vel4(x) = TempTrackVel(x)
    END IF
    TempTrack(x) = 0
NEXT x

IF bigcount2 > bigcount THEN bigcount = bigcount2
IF bigcount3 > bigcount THEN bigcount = bigcount3
IF bigcount4 > bigcount THEN bigcount = bigcount4
IF bigcount = 0 THEN CLOSE #2: SYSTEM

'Find the first note of the song (skip any empty space) starting point=st
st = 0
WHILE note1(st) + note2(st) + note3(st) + note4(st) = 0
    'PRINT st
    st = st + 1
WEND
'Add the user octave jump if it was selected
IF OctaveAdd = 1 THEN
    FOR x = st TO bigcount - 1
        IF note1(x) <> 0 THEN note1(x) = note1(x) + 12
        IF note2(x) <> 0 THEN note2(x) = note2(x) + 12
        IF note3(x) <> 0 THEN note3(x) = note3(x) + 12
    NEXT x
END IF

'Save MIDI data

C = 1
'OPEN "midinotes_61b.asm" FOR OUTPUT AS #1:
'FOR x = st TO bigcount - 1
'    PRINT #1, "1 $"; HEX$(note1(x)); ",$"; HEX$(vel1(x)); " 2 $"; HEX$(note2(x)); ",$"; HEX$(vel2(x)); " 3 $"; HEX$(note3(x)); ",$"; HEX$(vel3(x)); " 4 $"; HEX$(note4(x)); ",$"; HEX$(vel4(x))
'NEXT x
'CLOSE #1

'Check for dipole outputformat selected = 1 or 2
IF OutputFormat = 1 OR OutputFormat = 2 THEN
    PRINT #2, "* Song data will use"; (bigcount - st) * 2; "bytes of RAM in your program"
    PRINT #2, "********************************************"
    PRINT #2, "*       Note Data            Time note will be played (Minutes:Seconds)"
    'midi C4=72 therefore C3=60,C2=48,B2=59,b1=47,C2=48,C#2=49
    'Fix low notes that are below C#2 which is the lowest note dipole.asm can play
    'So jump up an octave at a time until we are clear of low notes
    test1 = 128: test2 = test1
    FOR x = st TO bigcount - 1
        IF note1(x) < test1 AND note1(x) <> 0 THEN test1 = note1(x)
        IF note2(x) < test2 AND note2(x) <> 0 THEN test2 = note2(x)
    NEXT x
    Fix1 = 0: Fix2 = 0
    WHILE test1 + Fix1 < 49
        Fix1 = Fix1 + 12 ' move up an octave if we are too low
    WEND
    WHILE test2 + Fix2 < 49
        Fix2 = Fix2 + 12 ' move up an octave if we are too low
    WEND
    'Simon's c4 is $18 = decimal 24, midi C4 is $48=dec 72
    'So we need to subtract 48 for our note values to set it to the correct octave for Simon's player
    Time = 0
    FOR x = st TO bigcount - 1
        IF note1(x) = 0 THEN
            v1 = 0
        ELSE
            v1 = note1(x) + Fix1 - 48
        END IF
        IF note2(x) = 0 THEN
            v2 = 0
        ELSE
            v2 = note2(x) + Fix2 - 48
        END IF
        m = INT(Time / 60): S = Time - 60 * m: S = INT(S * 100) / 100
        m$ = RIGHT$(STR$(m), LEN(STR$(m)) - 1): s$ = RIGHT$(STR$(S), LEN(STR$(S)) - 1)
        v1$ = HEX$(v1): v2$ = HEX$(v2)
        IF v1 < 10 THEN v1$ = "0" + v1$
        IF v2 < 10 THEN v2$ = "0" + v2$
        PRINT #2, "        FCB   $"; v1$; ",$"; v2$; "        * ";: PRINT #2, USING "##:##.##"; VAL(m$); VAL(s$)
        Time = Time + TimeInc
    NEXT x
    PRINT #2, "* End of Music data"
    CLOSE #2
    S = INT(S + .5): s$ = RIGHT$(STR$(S), LEN(STR$(S)) - 1)
    CLS
    PRINT "Song length is "; m$; " minutes and "; s$; " seconds"
    PRINT "Song data will use"; (bigcount - st) * 2; "bytes of RAM in your program"

    FS = (bigcount - st) * 2
    outname$ = Fname$ + ".asm"
    IF OutputFormat = 1 THEN
        PRINT "Creating a .asm file with Simon Jonassen's player and the music data combined and ready to go."
        PRINT "The output file "; outname$; " is ready to assemble and test."
        PRINT "You can assemble the program using LWASM with the following commandline:"
        PRINT "lwasm -9bl -p cd -o GO.BIN "; outname$; " > listing.txt"
        PRINT
        PRINT "Copy the GO.BIN file to a .dsk image called Disk1.DSK with these or similar commands (delete will fail if the file isn't already on the Disk1.DSK):"
        PRINT "imgtool del coco_jvc_rsdos Disk1.DSK GO.BIN"
        PRINT "imgtool put coco_jvc_rsdos Disk1.DSK GO.BIN GO.BIN"
        PRINT
        PRINT "Test it with MAME using this command:"
        PRINT "mame -window coco2 -flop1 Disk1.DSK -ui_active -skip_gameinfo"
        PRINT " or"
        PRINT "mame64 -window coco2 -flop1 Disk1.DSK -ui_active -skip_gameinfo"
        PRINT
        PRINT "To test on the CoCo type:"
        PRINT "LOADM"; CHR$(34); "GO"; CHR$(34)
        PRINT "EXEC"
        PRINT "When you are happy with the audio replace the demo code at the end of the "; outname$; " file and add"
        PRINT "your own assembly code to have your program working while background music is playing."

        IF _FILEEXISTS(outname$) THEN
            KILL outname$
        END IF
        C = 1
        OPEN outname$ FOR BINARY AS #2
        PRINT "Output file: "; outname$
        OPEN "Dipole_Part1.asm" FOR BINARY AS #1
        GET #1, , array()
        FOR x = 0 TO LOF(1) - 1: PUT #2, C, array(x): C = C + 1 ' output Dipole Player Part 1 code into new file
        NEXT x
        CLOSE #1

        OPEN "temp.asm" FOR BINARY AS #1
        GET #1, , array()
        FOR x = 0 TO LOF(1) - 1: PUT #2, C, array(x): C = C + 1 ' output Music Data into new file
        NEXT x
        CLOSE #1

        OPEN "Dipole_Part2.asm" FOR BINARY AS #1
        GET #1, , array()
        FOR x = 0 TO LOF(1) - 1: PUT #2, C, array(x): C = C + 1 ' output Dipole Player Part 2 code into new file
        NEXT x
        CLOSE #1
        CLOSE #2
    END IF
    IF OutputFormat = 2 THEN
        PRINT "Creating a .asm file with the music data converted from the MIDI file for use with Simon Jonassen's player."
        PRINT "The output file "; outname$; " is ready to be included in your assembly program with Simon's dipole.asm player."

        IF _FILEEXISTS(outname$) THEN
            KILL outname$
        END IF
        OPEN outname$ FOR BINARY AS #2
        PRINT "Output file: "; outname$
        OPEN "temp.asm" FOR BINARY AS #1: GET #1, , array(): CLOSE #1
        PUT #2, , array() ' output Music Data into new file
        CLOSE #2
    END IF
END IF

'Check if the GMC format was selected
IF OutputFormat = 3 OR OutputFormat = 4 THEN
    'Notes for the GMC cannot be lower then B2 = 123.474 Hz = note 47, so jump up an octave at a time until we are clear of low notes
    'Fix low notes that are below B2 = 123.474 Hz
    test1 = 128: test2 = test1: test3 = test1
    FOR x = st TO bigcount - 1
        IF note1(x) < test1 AND note1(x) <> 0 THEN test1 = note1(x)
        IF note2(x) < test2 AND note2(x) <> 0 THEN test2 = note2(x)
        IF note3(x) < test3 AND note3(x) <> 0 THEN test3 = note3(x)
    NEXT x
    Fix1 = 0: Fix2 = 0: Fix3 = 0
    WHILE test1 + Fix1 - 12 < 47
        Fix1 = Fix1 + 12 ' move up an octave if we are too low
    WEND
    WHILE test2 + Fix2 - 12 < 47
        Fix2 = Fix2 + 12 ' move up an octave if we are too low
    WEND
    WHILE test3 + Fix3 - 12 < 47
        Fix3 = Fix3 + 12 ' move up an octave if we are too low
    WEND
    'Get the notes & Veloocity into TempOut()
    Time = 0: p = 0
    FOR x = st TO bigcount - 1
        v1 = note1(x): IF v1 <> 0 THEN v1 = v1 + Fix1 - 12
        IF v1 > 127 THEN v1 = 127
        v2 = note2(x): IF v2 <> 0 THEN v2 = v2 + Fix2 - 12
        IF v2 > 127 THEN v2 = 127
        v3 = note3(x): IF v3 <> 0 THEN v3 = v3 + Fix3 - 12
        IF v3 > 127 THEN v3 = 127
        v4 = note4(x)
        IF v4 > 127 THEN v4 = 127
        m = INT(Time / 60): S = Time - 60 * m: S = INT(S * 100) / 100
        m$ = RIGHT$(STR$(m), LEN(STR$(m)) - 1): s$ = RIGHT$(STR$(S), LEN(STR$(S)) - 1)
        IF v1 > 0 THEN
            v1a$ = "8" + GMC$(v1, 0): v1b$ = GMC$(v1, 1) 'Play Note
        ELSE
            v1a$ = "9F": v1b$ = v1a$ 'Silence note
        END IF
        IF v2 > 0 THEN
            v2a$ = "A" + GMC$(v2, 0): v2b$ = GMC$(v2, 1) 'Play Note
        ELSE
            v2a$ = "BF": v2b$ = v2a$ 'Silence note
        END IF
        IF v3 > 0 THEN
            v3a$ = "C" + GMC$(v3, 0): v3b$ = GMC$(v3, 1) 'Play Note
        ELSE
            v3a$ = "DF": v3b$ = v3a$ 'Silence note
        END IF
        IF v4 > 0 THEN
            IF v4 = 38 OR v4 = 40 THEN ' Snare drum
                v4a$ = HEX$(38)
            ELSE
                IF v4 = 35 OR v4 = 36 OR v4 = 41 THEN
                    v4a$ = HEX$(35)
                ELSE
                    IF v4 = 42 OR v4 = 44 OR v4 = 56 OR v4 = 39 OR v4 = 76 THEN
                        v4a$ = HEX$(42)
                    ELSE
                        v4a$ = "FF": vel4(x) = 255: 'Silence note
                    END IF
                END IF
            END IF
        ELSE
            v4a$ = "FF": v4b$ = v4a$: vel4(x) = 255: 'Silence note
        END IF
        TempOut(p, 0) = VAL("&H" + v1a$): TempOut(p, 1) = VAL("&H" + v1b$)
        TempOut(p, 2) = vel1(x)
        TempOut(p, 3) = VAL("&H" + v2a$): TempOut(p, 4) = VAL("&H" + v2b$)
        TempOut(p, 5) = vel2(x)
        TempOut(p, 6) = VAL("&H" + v3a$): TempOut(p, 7) = VAL("&H" + v3b$)
        IF vel3(x) = 129 THEN vel3(x) = 0
        TempOut(p, 8) = vel3(x)
        TempOut(p, 9) = VAL("&H" + v4a$)
        TempOut(p, 10) = vel4(x)
        Time = Time + TimeInc
        p = p + 1
    NEXT x

    'If the output turns off the sound for only one cycle this tends to make a clicking sound.
    'It's better if we just extend the note 1 cycle and remove the 1 cycle of silence
    'This will also help the compression...
    '  FOR C = 1 TO p - 1
    '      IF TempOut(C, 0) = 159 THEN '9F
    '      IF TempOut(C - 1, 0) <> 159 AND TempOut(C + 1, 0) <> 159 THEN
    '          TempOut(C, 0) = TempOut(C - 1, 0): TempOut(C, 1) = TempOut(C - 1, 1): TempOut(C, 2) = TempOut(C - 1, 2)
    '      END IF
    '  END IF
    '  IF TempOut(C, 3) = 191 THEN 'BF
    '      IF TempOut(C - 1, 3) <> 191 AND TempOut(C + 1, 3) <> 191 THEN
    '          TempOut(C, 3) = TempOut(C - 1, 3): TempOut(C, 4) = TempOut(C - 1, 4): TempOut(C, 5) = TempOut(C - 1, 5)
    '          END IF
    '      END IF
    '      IF TempOut(C, 6) = 223 THEN 'DF
    '          IF TempOut(C - 1, 6) <> 223 AND TempOut(C + 1, 6) <> 223 THEN
    '              TempOut(C, 6) = TempOut(C - 1, 6): TempOut(C, 7) = TempOut(C - 1, 7): TempOut(C, 8) = TempOut(C - 1, 8)
    '          END IF
    '      END IF
    '      IF TempOut(C, 9) = 255 THEN 'FF
    '          IF TempOut(C - 1, 9) <> 255 AND TempOut(C + 1, 9) <> 255 THEN
    '              TempOut(C, 9) = TempOut(C - 1, 9): TempOut(C, 10) = TempOut(C - 1, 10)
    '          END IF
    '      END IF
    '  NEXT C

    'Process the noise channel of the GMC
    'E0 - hi tone
    'E1 - mid tone
    'E2 - Medium Buzz
    'E3 - Low Buzz
    'E4 - white noise - could be a snare
    'E5 - white noise - little weird more machine like
    'E6 - Low white noise buzz
    'E7 - Very low  - could be base drum
    FOR C = 0 TO p - 1
        IF TempOut(C, 9) = 42 THEN ' Hi Hat Closed or Open, Cowbell, Clap, Hi Wood Block
            y = 2
            FOR x = C TO C + y: TempOut(x, 9) = VAL("&HE5"): NEXT x
            WHILE TempOut(C + y + 1, 9) = 42
                TempOut(C + y + 1, 9) = 255: TempOut(C + y + 1, 10) = 255: y = y + 1
            WEND
        END IF
        IF TempOut(C, 9) = 38 THEN ' Acoustic Snare or Electric Snare
            y = 2
            FOR x = C TO C + y: TempOut(x, 9) = VAL("&HE4"): NEXT x
            WHILE TempOut(C + y + 1, 9) = 38
                TempOut(C + y + 1, 9) = 255: TempOut(C + y + 1, 10) = 255: y = y + 1
            WEND
        END IF
        IF TempOut(C, 9) = 35 THEN ' Acoustic Bass Drum or Bass Drum 1
            y = 2
            FOR x = C TO C + y: TempOut(x, 9) = VAL("&HE6"): NEXT x
            WHILE TempOut(C + y + 1, 9) = 35
                TempOut(C + y + 1, 9) = 255: TempOut(C + y + 1, 10) = 255: y = y + 1
            WEND
        END IF
    NEXT C
    PRINT
    PRINT "Do you want to soften the volume changes from off to on and on to off?"
    PRINT "This could help to make the notes sound a little more natural."
    PRINT "For a song with fast notes it might make them too quiet."
    PRINT "Selecting No will make the note data size smaller"
    PRINT
    INPUT "(Y)es to soften notes or (N)o leave them as the MIDI file indicates (y or [n])"; q$
    IF q$ = "Y" OR q$ = "y" THEN
        PRINT: PRINT "Softening the notes..."
        'Process notes so there is a slight volume change from off to on and from on to off so they sound a little more natural
        v0 = 0: v1 = 0: v2 = 0: v3 = 0
        FOR C = 0 TO p
            IF v0 = 1 AND TempOut(C, 2) = 0 THEN TempOut(C - 1, 2) = TempOut(C - 1, 2) / 2: v0 = 0
            IF v0 = 0 AND TempOut(C, 2) > 15 THEN ' Found a new note
                TempOut(C, 2) = TempOut(C, 2) / 2 ' Set velocity of first note to half
                v0 = 1
            END IF
            IF v1 = 1 AND TempOut(C, 5) = 0 THEN TempOut(C - 1, 5) = TempOut(C - 1, 5) / 2: v1 = 0
            IF v1 = 0 AND TempOut(C, 5) > 15 THEN ' Found a new note
                TempOut(C, 5) = TempOut(C, 5) / 2 ' Set velocity of first note to half
                v1 = 1
            END IF
            IF v2 = 1 AND TempOut(C, 8) = 0 THEN TempOut(C - 1, 8) = TempOut(C - 1, 8) / 2: v2 = 0
            IF v2 = 0 AND TempOut(C, 8) > 15 THEN ' Found a new note
                TempOut(C, 8) = TempOut(C, 8) / 2 ' Set velocity of first note to half
                v2 = 1
            END IF
            IF v3 + 1 AND TempOut(C, 10) = 0 THEN TempOut(C - 1, 10) = TempOut(C - 1, 10) / 2: v3 = 0
            IF v3 = 0 AND TempOut(C, 10) > 15 THEN ' Found a new note
                ' TempOut(C, 10) = TempOut(C, 10) / 2 ' Skip this for percussion sounds... Set velocity of first note to half
                v3 = 1
            END IF
        NEXT C
    ELSE
        PRINT: PRINT "Leaving notes as per the MIDI file..."
    END IF

    'Different compression format  - All voices muxed together Should be less CPU usage to playback
    'Setup initial values to be sent
    'Method similar to VGM format
    'bit 7 set means count 1 to 126 until next change
    '00 - next two bytes are a counter (128 to 65534) until next change  ($FF,$FF - End of File)
    '01 - means next byte should be sent to the SN chip
    '02 - means next 2 bytes should be sent to the SN chip (noise channel 4 data)
    '03 - means next 3 bytes should be sent to the SN chip (channel 0,1,2 data)
    '00,$FF,$FE - Jump to next Bank of memory in the GMC (for long songs, use the next 16k bank of space in the GMC ROM
    '00,$FF,$FF - End of file

    ' New Encoding:
    ' Encoding byte
    '                left nibble = # of times to repeat          0 to 15 repeat count
    '
    '                right nibble = # of bytes to copy (1-11)    count of bytes to copy
    '                                                            12 signals the repeat count is larger then 15 so use the next byte as the repeat count (left nibble = bytes to copy)
    '                                                            13 signals the repeat count is larger then 255 so use the next 2 bytes as the repeat count (left nibble = bytes to copy)
    '                                                            14 signals jump to the next Bank of the GMC (reached the 16k length of the current bank) (ignore left nibble)
    '                                                            15 signals End of File

    f0 = 0: f1 = 0: f2 = 0: f3 = 0: f4 = 0: f5 = 0: f6 = 0: f7 = 0: f8 = 0: f9 = 0: f10 = 0
    ap = 0: array(ap) = &H0B: ap = ap + 1
    b0 = TempOut(0, 0): array(ap) = b0: ap = ap + 1
    b1 = TempOut(0, 1): array(ap) = b1: ap = ap + 1
    b2 = INT(TempOut(0, 2) / 8)
    Temp = 15 - b2: Temp = Temp + 128 + 16: array(ap) = Temp: ap = ap + 1
    b3 = TempOut(0, 3): array(ap) = b3: ap = ap + 1
    b4 = TempOut(0, 4): array(ap) = b4: ap = ap + 1
    b5 = INT(TempOut(0, 5) / 8)
    Temp = 15 - b5: Temp = Temp + 128 + 32 + 16: array(ap) = Temp: ap = ap + 1
    b6 = TempOut(0, 6): array(ap) = b6: ap = ap + 1
    b7 = TempOut(0, 7): array(ap) = b7: ap = ap + 1
    b8 = INT(TempOut(0, 8) / 8)
    Temp = 15 - b8: Temp = Temp + 128 + 64 + 16: array(ap) = Temp: ap = ap + 1
    b9 = TempOut(0, 9): array(ap) = b9: ap = ap + 1
    b10 = INT(TempOut(0, 10) / 8)
    Temp = 15 - b10: Temp = Temp + 128 + 64 + 32 + 16: array(ap) = Temp: ap = ap + 1
    C = 0: TimeCount = 0
    WHILE C < p
        S = 0
        WHILE f0 + f1 + f2 + f3 + f4 + f5 + f6 + f7 + f8 + f9 + f10 = 0
            S = S + 1
            IF C + S >= p THEN S = S - 1: GOTO 255
            IF b0 <> TempOut(C + S, 0) THEN f0 = 1
            IF b1 <> TempOut(C + S, 1) THEN f1 = 1
            IF b2 <> INT(TempOut(C + S, 2) / 8) THEN f2 = 1
            IF b3 <> TempOut(C + S, 3) THEN f3 = 1
            IF b4 <> TempOut(C + S, 4) THEN f4 = 1
            IF b5 <> INT(TempOut(C + S, 5) / 8) THEN f5 = 1
            IF b6 <> TempOut(C + S, 6) THEN f6 = 1
            IF b7 <> TempOut(C + S, 7) THEN f7 = 1
            IF b8 <> INT(TempOut(C + S, 8) / 8) THEN f8 = 1
            IF b9 <> TempOut(C + S, 9) THEN f9 = 1
            IF b10 <> INT(TempOut(C + S, 10) / 8) THEN f10 = 1
            TimeCount = TimeCount + 1
        WEND
        ' New Encoding:
        ' Encoding byte
        '                left nibble = # of times to repeat          0 to 15 repeat count
        '
        '                right nibble = # of bytes to copy (1-11)    count of bytes to copy
        '                                                            12 signals the repeat count is larger then 15 so use the next byte as the repeat count (left nibble = bytes to copy)
        '                                                            13 signals the repeat count is larger then 255 so use the next 2 bytes as the repeat count (left nibble = bytes to copy)
        '                                                            14 signals jump to the next Bank of the GMC (reached the 16k length of the current bank) (ignore left nibble)
        '                                                            15 signals End of File
        IF S < 255 THEN
            array(ap) = S + 1: ap = ap + 1
        ELSE
            array(ap) = 0: ap = ap + 1: array(ap) = INT((S + 1) / 256): ap = ap + 1: array(ap) = INT(((S + 1) / 256 - INT((S + 1) / 256)) * 256): ap = ap + 1
        END IF
        'If MSB of note changes we must change latch and LSB of note
        IF f1 = 1 THEN f0 = 1
        IF f4 = 1 THEN f3 = 1
        IF f7 = 1 THEN f6 = 1
        array(ap) = f0 + f1 + f2 + f3 + f4 + f5 + f6 + f7 + f8 + f9 + f10: ap = ap + 1
        IF f0 = 1 THEN b0 = TempOut(C + S, 0): array(ap) = b0: ap = ap + 1: f0 = 0
        IF f1 = 1 THEN b1 = TempOut(C + S, 1): array(ap) = b1: ap = ap + 1: f1 = 0
        IF f2 = 1 THEN
            b2 = INT(TempOut(C + S, 2) / 8)
            Temp = 15 - b2: Temp = Temp + 128 + 16
            array(ap) = Temp: ap = ap + 1: f2 = 0
        END IF
        IF f3 = 1 THEN b3 = TempOut(C + S, 3): array(ap) = b3: ap = ap + 1: f3 = 0
        IF f4 = 1 THEN b4 = TempOut(C + S, 4): array(ap) = b4: ap = ap + 1: f4 = 0
        IF f5 = 1 THEN
            b5 = INT(TempOut(C + S, 5) / 8)
            Temp = 15 - b5: Temp = Temp + 128 + 32 + 16
            array(ap) = Temp: ap = ap + 1: f5 = 0
        END IF
        IF f6 = 1 THEN b6 = TempOut(C + S, 6): array(ap) = b6: ap = ap + 1: f6 = 0
        IF f7 = 1 THEN b7 = TempOut(C + S, 7): array(ap) = b7: ap = ap + 1: f7 = 0
        IF f8 = 1 THEN
            b8 = INT(TempOut(C + S, 8) / 8)
            Temp = 15 - b8: Temp = Temp + 128 + 64 + 16
            array(ap) = Temp: ap = ap + 1: f8 = 0
        END IF
        IF f9 = 1 THEN b9 = TempOut(C + S, 9): array(ap) = b9: ap = ap + 1: f9 = 0
        IF f10 = 1 THEN
            b10 = INT(TempOut(C + S, 10) / 8)
            Temp = 15 - b10: Temp = Temp + 128 + 64 + 32 + 16
            array(ap) = Temp: ap = ap + 1: f10 = 0
        END IF
        C = C + S
        S = 0
    WEND
    255
    IF S > 0 THEN
        IF S < 255 THEN
            array(ap) = S + 1: ap = ap + 1
        ELSE
            array(ap) = 0: ap = ap + 1: array(ap) = INT((S + 1) / 256): ap = ap + 1: array(ap) = INT(((S + 1) / 256 - INT((S + 1) / 256)) * 256): ap = ap + 1
        END IF
    END IF
    'Output array data to file

    ' New Encoding:
    ' Encoding byte
    '                left nibble = # of times to repeat          0 to 15 repeat count
    '
    '                right nibble = # of bytes to copy (1-11)    count of bytes to copy
    '                                                       $C   12 signals the repeat count is larger then 15 so use the next byte as the repeat count (left nibble = bytes to copy)
    '                                                       $D   13 signals the repeat count is larger then 255 so use the next 2 bytes as the repeat count (left nibble = bytes to copy)
    '                                                       $E   14 signals jump to the next Bank of the GMC (reached the 16k length of the current bank) (ignore left nibble)
    '                                                       $F   15 signals End of Music data

    PRINT #2, "        ALIGN   $10000"
    ' PRINT #2, "        FCB   $0B,";

    pe = 0: TimeCount = 0: FS = 0: BK = 0
    WHILE pe < ap
        copy = array(pe): pe = pe + 1
        rep = array(pe + copy)
        IF rep = 0 THEN
            RN = 13
            LN = copy * 16
            EB = LN + RN: PRINT #2, "        FCB   $"; HEX$(EB); ",$"; HEX$(array(pe + copy + 1)); ",$"; HEX$(array(pe + copy + 2)); ",";: FS = FS + 3
            TimeCount = TimeCount + array(pe + copy + 1) * 256 + array(pe + copy + 2)
        ELSE
            IF rep < 17 THEN
                LN = rep - 1
                RN = copy
                EB = LN * 16 + RN: PRINT #2, "        FCB   $"; HEX$(EB); ",";: FS = FS + 1
                TimeCount = TimeCount + rep
            ELSE
                RN = 12
                LN = copy
                EB = LN * 16 + RN: PRINT #2, "        FCB   $"; HEX$(EB); ",$"; HEX$(rep); ",";: FS = FS + 2
                TimeCount = TimeCount + rep
            END IF
        END IF
        FOR x = 1 TO copy - 1
            PRINT #2, "$"; HEX$(array(pe)); ",";: FS = FS + 1
            pe = pe + 1
        NEXT x
        PRINT #2, "$"; HEX$(array(pe));: FS = FS + 1
        pe = pe + 2
        IF rep = 0 THEN pe = pe + 2
        Time = TimeCount * TimeInc
        m = INT(Time / 60): Sec = Time - 60 * m: Sec = INT(Sec * 100) / 100
        m$ = RIGHT$(STR$(m), LEN(STR$(m)) - 1): s$ = RIGHT$(STR$(Sec), LEN(STR$(Sec)) - 1)
        PRINT #2, "    * ";: PRINT #2, USING "##:##.##"; VAL(m$); VAL(s$)
        IF FS > 15850 THEN
            BK = BK + 1: FS = 0
            IF BK = 4 THEN CLS: PRINT "Error: Music data is larger then 47550 bytes, too big for a GMC.  Stopping.": END
            PRINT #2, "        FCB   $0E    * End of current Bank - Flag new Bank"
            PRINT #2, "        ALIGN   $4000"
        END IF
    WEND
    PRINT #2, "        FCB   $0F    * End of Music Data": FS = FS + 1
    FS = FS + BK * 15850

    PRINT #2, "* Filesize is $"; HEX$(FS); " ="; FS; "bytes"
    CLOSE #2

    CLS
    PRINT "Song data will use"; FS; "bytes of ROM space in your program"

    FS = (bigcount - st) * 2
    outname$ = Fname$ + ".asm"
    IF OutputFormat = 3 THEN
        PRINT "Creating a .asm file with Glen Hewlett's player and the music data combined and ready to go for testing on the GMC"
        PRINT "The output file "; outname$; " is ready to assemble and test."
        PRINT "You can assemble the program using LWASM with the following commandline:"
        PRINT "lwasm -9rl -p cd -o test.rom "; outname$; " > listing.txt"
        PRINT
        PRINT "Test it with MAME using this command:"
        PRINT "mame coco2b -ext games_master -cart test.rom -skip_gameinfo -window -ui_active"
        PRINT " or"
        PRINT "mame64 coco2b -ext games_master -cart test.rom -skip_gameinfo -window -ui_active"
        PRINT
        PRINT "When you are happy with the audio replace the demo code in the middle of the "; outname$; " file (before the music data) and add"
        PRINT "your own assembly code to have your program working while background music is playing."
        IF _FILEEXISTS(outname$) THEN
            KILL outname$
        END IF
        C = 1
        OPEN outname$ FOR BINARY AS #2
        PRINT "Output file: "; outname$
        OPEN "GMC_Play.asm" FOR BINARY AS #1:
        GET #1, , array()
        FOR x = 0 TO LOF(1) - 1: PUT #2, C, array(x): C = C + 1 ' output GMC Player code into new file
        NEXT x
        CLOSE #1

        OPEN "temp.asm" FOR BINARY AS #1
        GET #1, , array()
        FOR x = 0 TO LOF(1) - 1: PUT #2, C, array(x): C = C + 1 ' output Music Data into new file
        NEXT x
        CLOSE #1

        OPEN "temp.asm" FOR OUTPUT AS #1
        PRINT #1, "SongEnd:": PRINT #1, "        END  START": CLOSE #1

        OPEN "temp.asm" FOR BINARY AS #1
        GET #1, , array()
        FOR x = 0 TO LOF(1) - 1: PUT #2, C, array(x): C = C + 1 ' output Music Data into new file
        NEXT x
        CLOSE #1: CLOSE #2
    END IF
    IF OutputFormat = 4 THEN
        PRINT "Creating a .asm file with the music data converted from the MIDI file for use with Glen Hewlett's player for the GMC"
        PRINT "The output file "; outname$; " is ready to be included in your assembly program with Glen Hewlett's GMC_Play.asm player."
        IF _FILEEXISTS(outname$) THEN
            KILL outname$
        END IF
        OPEN outname$ FOR BINARY AS #2
        PRINT "Output file: "; outname$
        OPEN "temp.asm" FOR BINARY AS #1: GET #1, , array(): CLOSE #1
        PUT #2, , array() ' output Music Data into new file
        CLOSE #2
    END IF
END IF


' Check for Ed Snider's CoCo PSG format
IF OutputFormat = 5 OR OutputFormat = 6 THEN
    'Notes for the PSG cannot be lower then B0 = 30.87 Hz = note 23, so jump up an octave at a time until we are clear of low notes
    'Fix low notes that are below B0 = 30.87 Hz
    test1 = 128: test2 = test1: test3 = test1
    FOR x = st TO bigcount - 1
        IF note1(x) < test1 AND note1(x) <> 0 THEN test1 = note1(x)
        IF note2(x) < test2 AND note2(x) <> 0 THEN test2 = note2(x)
        IF note3(x) < test3 AND note3(x) <> 0 THEN test3 = note3(x)
    NEXT x
    Fix1 = 0: Fix2 = 0: Fix3 = 0
    WHILE test1 + Fix1 - 12 < 23
        Fix1 = Fix1 + 12 ' move up an octave if we are too low
    WEND
    WHILE test2 + Fix2 - 12 < 23
        Fix2 = Fix2 + 12 ' move up an octave if we are too low
    WEND
    IF drum3 = 1 THEN
        WHILE test3 + Fix3 < 23
            Fix3 = Fix3 + 12 ' move up an octave if we are too low
        WEND
    ELSE
        WHILE test3 + Fix3 - 12 < 23
            Fix3 = Fix3 + 12 ' move up an octave if we are too low
        WEND
    END IF

    'Get the notes & Veloocity into TempOut()
    Time = 0: p = 0
    FOR x = st TO bigcount - 1
        '    IF x = 6710 THEN PRINT note1(x), vel1(x): SLEEP
        v1 = note1(x): IF v1 <> 0 THEN v1 = v1 + Fix1 - 12
        IF v1 > 127 THEN v1 = 127
        v2 = note2(x): IF v2 <> 0 THEN v2 = v2 + Fix2 - 12
        IF v2 > 127 THEN v2 = 127
        v3 = note3(x):
        IF drum3 = 1 THEN IF v3 <> 0 THEN v3 = v3 + Fix3 ELSE v3 = v3 + Fix3 - 12
        IF v3 > 127 THEN v3 = 127
        m = INT(Time / 60): S = Time - 60 * m: S = INT(S * 100) / 100
        m$ = RIGHT$(STR$(m), LEN(STR$(m)) - 1): s$ = RIGHT$(STR$(S), LEN(STR$(S)) - 1)

        '  ,--------- Note=0, volume=1 or channel 2 or C noise/drum frequency
        '  |      ,,------Channel  00=chan 0, 01=chan 1, 10=chan 2, 11=chan 2 - Drum/noise info
        '  |      ||
        '  |Xxx xx||  x=volume or msb of 12 bit tone info or Xxxxx = noise/drum frequency for channel
        '  1000 0001

        'YM Channel A or channel 0
        IF v1 > 0 THEN
            TempOut(p, 0) = VAL("&H" + PSG$(v1, 0)) * 4: TempOut(p, 1) = VAL("&H" + PSG$(v1, 1)): TempOut(p, 2) = velcon(INT(vel1(x) / 8)) * 4 + 128 'Play Note, set volume
        ELSE
            TempOut(p, 0) = 0: TempOut(p, 1) = 0
            TempOut(p, 2) = 128 'Silence note
        END IF
        'YM Channel B or channel 1
        ' Because the decoding shifts bits 0 and 1 into the B accumulator through the carry bit
        ' the bits will be reversed, so a value of 1 = bits 01 this will
        ' be turned into 10 = 4, the YM chip only has 3 channels so we have to encode the value for channel 1 as 2 = bits 10 so it will turn into bits 01
        IF v2 > 0 THEN
            TempOut(p, 3) = VAL("&H" + PSG$(v2, 0)) * 4 + 2: TempOut(p, 4) = VAL("&H" + PSG$(v2, 1)): TempOut(p, 5) = velcon(INT(vel2(x) / 8)) * 4 + 128 + 2 'Play Note, set volume
        ELSE
            TempOut(p, 3) = 0 + 2: TempOut(p, 4) = 0 + 2
            TempOut(p, 5) = 128 + 2 'Silence note
        END IF
        IF drums = 0 THEN
            'YM Channel C or channel 2
            ' Because the decoding shifts bits 0 and 1 into the B accumulator through the carry bit
            ' the bits will be reversed, so a value of 2 = bits 10 this will
            ' be turned into 01= 1, so we have to encode the value for channel 2 as 1 = bits 01 so it will turn into bits 10
            IF v3 > 0 AND vel3(x) < 129 THEN
                TempOut(p, 6) = VAL("&H" + PSG$(v3, 0)) * 4 + 1: TempOut(p, 7) = VAL("&H" + PSG$(v3, 1)): TempOut(p, 8) = velcon(INT(vel3(x) / 8)) * 4 + 128 + 1 'Play Note, set volume
            ELSE
                TempOut(p, 6) = 0 + 1: TempOut(p, 7) = 0 + 1
                TempOut(p, 8) = 128 + 1 'Silence note
            END IF
        ELSE 'Use Channel 4 drum data for channel C
            TempOut(p, 6) = 0 + 1: TempOut(p, 7) = 0 + 1: TempOut(p, 8) = 0 + 128 + 1
            v4 = note4(x)
            IF v4 > 127 THEN v4 = 127
            IF v4 > 0 THEN
                IF v4 = 38 OR v4 = 40 THEN ' Acoustic Snare or Electric Snare
                    TempOut(p, 6) = velcon(INT(vel4(x) / 8)) * 4 + 128 + 1
                    TempOut(p, 7) = 32 + 16 + 8 + 4 + 128 + 3 'medium noise frequency
                ELSE
                    IF v4 = 35 OR v4 = 36 OR v4 = 41 THEN ' Acoustic Bass Drum or Bass Drum 1
                        TempOut(p, 6) = velcon(INT(vel4(x) / 8)) * 4 + 128 + 1
                        TempOut(p, 7) = 8 + 4 + 128 + 3 'low noise frequency
                    ELSE
                        IF v4 = 42 OR v4 = 44 OR v4 = 56 OR v4 = 39 OR v4 = 76 THEN ' Hi Hat Closed or Open, Cowbell, Clap, Hi Wood Block
                            TempOut(p, 6) = velcon(INT(vel4(x) / 8)) * 4 + 128 + 1
                            TempOut(p, 7) = 64 + 32 + 16 + 8 + 4 + 128 + 3 'high frequency
                        ELSE
                            TempOut(p, 6) = 128 + 1: TempOut(p, 7) = 128 + 1 'Silence noise
                        END IF
                    END IF
                END IF
            ELSE
                TempOut(p, 6) = 128 + 1: TempOut(p, 7) = 128 + 1 'Silence noise
            END IF
        END IF
        Time = Time + TimeInc
        p = p + 1
    NEXT x

    'If the output turns off the sound for only one cycle this tends to make a clicking sound.
    'It's better if we just extend the note 1 cycle and remove the 1 cycle of silence
    'This will also help the compression...
    '   FOR C = 1 TO p - 1
    '       IF TempOut(C, 0) = 159 THEN '9F
    '           IF TempOut(C - 1, 0) <> 159 AND TempOut(C + 1, 0) <> 159 THEN
    '               TempOut(C, 0) = TempOut(C - 1, 0): TempOut(C, 1) = TempOut(C - 1, 1): TempOut(C, 2) = TempOut(C - 1, 2)
    '           END IF
    '       END IF
    '       IF TempOut(C, 3) = 191 THEN 'BF
    '           IF TempOut(C - 1, 3) <> 191 AND TempOut(C + 1, 3) <> 191 THEN
    '               TempOut(C, 3) = TempOut(C - 1, 3): TempOut(C, 4) = TempOut(C - 1, 4): TempOut(C, 5) = TempOut(C - 1, 5)
    '           END IF
    '       END IF
    '       IF TempOut(C, 6) = 223 THEN 'DF
    '           IF TempOut(C - 1, 6) <> 223 AND TempOut(C + 1, 6) <> 223 THEN
    '               TempOut(C, 6) = TempOut(C - 1, 6): TempOut(C, 7) = TempOut(C - 1, 7): TempOut(C, 8) = TempOut(C - 1, 8)
    '           END IF
    '       END IF
    '       IF TempOut(C, 9) = 255 THEN 'FF
    '           IF TempOut(C - 1, 9) <> 255 AND TempOut(C + 1, 9) <> 255 THEN
    '               TempOut(C, 9) = TempOut(C - 1, 9): TempOut(C, 10) = TempOut(C - 1, 10)
    '           END IF
    '       END IF
    '   NEXT C


    ' New Encoding:
    ' Encoding byte
    '                left nibble = # of times to repeat          0 to 15 repeat count
    '
    '                right nibble = # of bytes to copy (1-11)    count of bytes to copy
    '                                                       $C   12 signals the repeat count is larger then 15 so use the next byte as the repeat count (left nibble = bytes to copy)
    '                                                       $D   13 signals the repeat count is larger then 255 so use the next 2 bytes as the repeat count (left nibble = bytes to copy)
    '                                                       $E   14 channel C or 2 is used for drums/noise
    '                                                       $F   15 signals End of Music data

    f0 = 0: f1 = 0: f2 = 0: f3 = 0: f4 = 0: f5 = 0: f6 = 0: f7 = 0: f8 = 0
    ap = 0: array(ap) = 9: ap = ap + 1
    b0 = TempOut(0, 0): array(ap) = b0: ap = ap + 1
    b1 = TempOut(0, 1): array(ap) = b1: ap = ap + 1
    b2 = TempOut(0, 2): array(ap) = b2: ap = ap + 1
    b3 = TempOut(0, 3): array(ap) = b3: ap = ap + 1
    b4 = TempOut(0, 4): array(ap) = b4: ap = ap + 1
    b5 = TempOut(0, 5): array(ap) = b5: ap = ap + 1
    b6 = TempOut(0, 6): array(ap) = b6: ap = ap + 1
    b7 = TempOut(0, 7): array(ap) = b7: ap = ap + 1
    b8 = TempOut(0, 8): array(ap) = b8: ap = ap + 1
    C = 0: TimeCount = 0
    WHILE C < p
        S = 0
        WHILE f0 + f1 + f2 + f3 + f4 + f5 + f6 + f7 + f8 = 0
            S = S + 1
            IF C + S >= p THEN S = S - 1: GOTO 555
            IF b0 <> TempOut(C + S, 0) THEN f0 = 1
            IF b1 <> TempOut(C + S, 1) THEN f1 = 1
            IF b2 <> TempOut(C + S, 2) THEN f2 = 1
            IF b3 <> TempOut(C + S, 3) THEN f3 = 1
            IF b4 <> TempOut(C + S, 4) THEN f4 = 1
            IF b5 <> TempOut(C + S, 5) THEN f5 = 1
            IF b6 <> TempOut(C + S, 6) THEN f6 = 1
            IF b7 <> TempOut(C + S, 7) THEN f7 = 1
            IF b8 <> TempOut(C + S, 8) THEN f8 = 1
            TimeCount = TimeCount + 1
        WEND

        ' How many repeats before it changed for the above Tones/Volume
        IF S < 256 THEN
            array(ap) = S: ap = ap + 1
        ELSE
            array(ap) = 0: ap = ap + 1: array(ap) = INT((S) / 256): ap = ap + 1: array(ap) = INT(((S) / 256 - INT((S) / 256)) * 256): ap = ap + 1
        END IF

        ' New Encoding:
        ' Encoding byte
        '                left nibble = # of times to repeat          0 to 15 repeat count
        '
        '                right nibble = # of bytes to copy (1-11)    count of bytes to copy
        '                                                       $C   12 signals the repeat count is larger then 15 so use the next byte as the repeat count (left nibble = bytes to copy)
        '                                                       $D   13 signals the repeat count is larger then 255 so use the next 2 bytes as the repeat count (left nibble = bytes to copy)
        '                                                       $E   14 channel C or 2 is used for drums/noise
        '                                                       $F   15 signals End of Music data

        'If MSB or LSB of note changes we must change update both MSB and LSB
        IF f0 = 1 THEN f1 = 1
        IF f1 = 1 THEN f0 = 1
        IF f3 = 1 THEN f4 = 1
        IF f4 = 1 THEN f3 = 1
        IF drums = 0 THEN
            IF f6 = 1 THEN f7 = 1
            IF f7 = 1 THEN f6 = 1
        END IF
        array(ap) = f0 + f1 + f2 + f3 + f4 + f5 + f6 + f7 + f8: ap = ap + 1

        IF f0 = 1 THEN
            b0 = TempOut(C + S, 0): array(ap) = b0: ap = ap + 1: f0 = 0
            b1 = TempOut(C + S, 1): array(ap) = b1: ap = ap + 1: f1 = 0
        END IF
        IF f2 = 1 THEN
            b2 = TempOut(C + S, 2): array(ap) = b2: ap = ap + 1: f2 = 0
        END IF
        IF f3 = 1 THEN
            b3 = TempOut(C + S, 3): array(ap) = b3: ap = ap + 1: f3 = 0
            b4 = TempOut(C + S, 4): array(ap) = b4: ap = ap + 1: f4 = 0
        END IF
        IF f5 = 1 THEN
            b5 = TempOut(C + S, 5): array(ap) = b5: ap = ap + 1: f5 = 0
        END IF
        IF f6 = 1 THEN
            b6 = TempOut(C + S, 6): array(ap) = b6: ap = ap + 1: f6 = 0
        END IF
        IF f7 = 1 THEN
            b7 = TempOut(C + S, 7): array(ap) = b7: ap = ap + 1: f7 = 0
        END IF
        IF f8 = 1 THEN
            b8 = TempOut(C + S, 8): array(ap) = b8: ap = ap + 1: f8 = 0
        END IF

        C = C + S
        S = 0
    WEND
    555
    IF S > 0 THEN
        IF S < 256 THEN
            array(ap) = S: ap = ap + 1
        ELSE
            array(ap) = 0: ap = ap + 1: array(ap) = INT((S) / 256): ap = ap + 1: array(ap) = INT(((S) / 256 - INT((S) / 256)) * 256): ap = ap + 1
        END IF
    END IF

    'Output array data to file

    ' New Encoding:
    ' Encoding byte
    '                left nibble = # of times to repeat          0 to 15 repeat count
    '
    '                right nibble = # of bytes to copy (1-11)    count of bytes to copy
    '                                                       $C   12 signals the repeat count is larger then 15 so use the next byte as the repeat count (left nibble = bytes to copy)
    '                                                       $D   13 signals the repeat count is larger then 255 so use the next 2 bytes as the repeat count (left nibble = bytes to copy)
    '                                                       $E   14 channel C or 2 is used for drums/noise
    '                                                       $F   15 signals End of Music data

    ' array = Repeat Count,#bytes to send to YM,Data Bytes...
    IF drums = 1 THEN
        PRINT #2, "        FCB   $0E        * This song uses channel C as noise/drums"
    END IF
    pe = 0: TimeCount = 0: FS = 0: BK = 0
    WHILE pe < ap
        copy = array(pe): pe = pe + 1
        rep = array(pe + copy)
        IF rep = 0 THEN
            RN = 13
            LN = copy * 16
            EB = LN + RN: PRINT #2, "        FCB   $"; HEX$(EB); ",$"; HEX$(array(pe + copy + 1)); ",$"; HEX$(array(pe + copy + 2)); ",";: FS = FS + 3
            TimeCount = TimeCount + array(pe + copy + 1) * 256 + array(pe + copy + 2)
        ELSE
            IF rep < 16 THEN
                LN = rep
                RN = copy
                EB = LN * 16 + RN: PRINT #2, "        FCB   $"; HEX$(EB); ",";: FS = FS + 1
                TimeCount = TimeCount + rep
            ELSE
                RN = 12
                LN = copy
                EB = LN * 16 + RN: PRINT #2, "        FCB   $"; HEX$(EB); ",$"; HEX$(rep); ",";: FS = FS + 2
                TimeCount = TimeCount + rep
            END IF
        END IF
        FOR x = 1 TO copy - 1
            PRINT #2, "$"; HEX$(array(pe)); ",";: FS = FS + 1
            pe = pe + 1
        NEXT x
        PRINT #2, "$"; HEX$(array(pe));: FS = FS + 1
        pe = pe + 2
        IF rep = 0 THEN pe = pe + 2
        Time = TimeCount * TimeInc
        m = INT(Time / 60): Sec = Time - 60 * m: Sec = INT(Sec * 100) / 100
        m$ = RIGHT$(STR$(m), LEN(STR$(m)) - 1): s$ = RIGHT$(STR$(Sec), LEN(STR$(Sec)) - 1)
        PRINT #2, "    * ";: PRINT #2, USING "##:##.##"; VAL(m$); VAL(s$)
    WEND
    PRINT #2, "        FCB   $0F    * End of Music Data": FS = FS + 1
    PRINT #2, "* Filesize = is $"; HEX$(FS); " ="; FS; "bytes"
    CLOSE #2

    ' Write loader machine code to the beginning of the PSG music data
    ' Loader auto loads the music data into the 512k RAM space on the PSG, this should even work on a 4k CoCo with a cassette
    IF _FILEEXISTS("PSGLOADR.BIN") THEN
        KILL "PSGLOADR.BIN"
    END IF

    OPEN "PSGLOADR.BIN" FOR BINARY AS #1
    C = 1
    A = 0: PUT #1, C, A: C = C + 1
    A = 1: PUT #1, C, A: C = C + 1
    A = VAL("&H1D"): PUT #1, C, A: C = C + 1
    A = VAL("&H0E"): PUT #1, C, A: C = C + 1
    A = VAL("&H03"): PUT #1, C, A: C = C + 1
    ' Next 3 bytes are the 24 bit value of the length of the Music Data
    FS = FS + 6: ' Add 5 for header bytes and Add one to Mus data size because we add the $0F end of song to the end of the data
    v1 = INT(FS / 65536): A = v1
    PUT #1, C, A: C = C + 1
    v2 = INT((FS / 65536 - v1) * 256): A = v2
    PUT #1, C, A: C = C + 1
    v3 = FS - v1 * 65536 - v2 * 256: A = v3
    PUT #1, C, A: C = C + 1
    ' Add Loader 6809 machine code
    FOR x = 1 TO 294
        READ A$
        A = VAL("&H" + A$): PUT #1, C, A: C = C + 1
    NEXT x
    'Do it again now that we have our FileSize, write out binary this time
    '************
    '* 5 Byte header:
    '* Byte  Value
    '* 00-02 'PSG' - Header Identifier
    '* 03    $xx - File version # currently only supprts a value of 01 for version 1.00
    '* 04    $xx - Number of times to loop this song where xx is:
    '*       $00 - Don't change the number of loops value
    '*       $01 to $FE - loop this number of times
    '*       $FF - loop forever
    '************

    'First add the PSG1 header to signify what kind of file this is and the version # of 1
    A = ASC("P"): PUT #1, C, A: C = C + 1: 'P
    A = ASC("S"): PUT #1, C, A: C = C + 1: 'S
    A = ASC("G"): PUT #1, C, A: C = C + 1: 'G
    A = 1: PUT #1, C, A: C = C + 1: '       1 signifies format version 1
    A = 255: PUT #1, C, A: C = C + 1: '     255 signifies loop forever
    IF drums = 1 THEN
        A = 14: PUT #1, C, A: C = C + 1 ' This song uses channel C as noise/drums so send byte 14 ($0E) = noise/tone channel flip
    END IF
    pe = 0: TimeCount = 0: FS = 0: BK = 0
    WHILE pe < ap
        copy = array(pe): pe = pe + 1
        rep = array(pe + copy)
        IF rep = 0 THEN
            RN = 13
            LN = copy * 16
            EB = LN + RN: A = EB: PUT #1, C, A: C = C + 1: A = array(pe + copy + 1): PUT #1, C, A: C = C + 1: A = array(pe + copy + 2): PUT #1, C, A: C = C + 1
        ELSE
            IF rep < 16 THEN
                LN = rep
                RN = copy
                EB = LN * 16 + RN: A = EB: PUT #1, C, A: C = C + 1
            ELSE
                RN = 12
                LN = copy
                EB = LN * 16 + RN: A = EB: PUT #1, C, A: C = C + 1: A = rep: PUT #1, C, A: C = C + 1
            END IF
        END IF
        FOR x = 1 TO copy - 1
            A = array(pe): PUT #1, C, A: C = C + 1
            pe = pe + 1
        NEXT x
        A = array(pe): PUT #1, C, A: C = C + 1
        pe = pe + 2
        IF rep = 0 THEN pe = pe + 2
    WEND
    A = 15: PUT #1, C, A: C = C + 1: ' $0f end of music data
    CLOSE #1

    PRINT
    prosize = &H7FFF - &H7B7A + 1
    IF OutputFormat = 5 THEN
        PRINT "Player program size is $"; HEX$(prosize); " ="; prosize; "bytes"
        PRINT "For a CoCo with RAM size $"; HEX$(ramsize); " ="; ramsize; "bytes"
        PRINT
        PRINT "Instructions:"
        PRINT "Copy the file PSGLOADR.BIN program that was just created to a diskette or disk.img file"
        PRINT "Make sure this same disk also has the file ";
        IF ramsize = 16384 THEN
            psgplay$ = "PSGPLY16.BAS"
        ELSE
            psgplay$ = "PSGPLY32.BAS"
        END IF
        PRINT psgplay$; " copied on it."
        PRINT
        PRINT "Add these lines to the start of your BASIC program"
        PRINT "1 CLEAR 200,"; ramsize - prosize
        PRINT "2 POKE 3584,PEEK(375)"
        PRINT "3 POKE 3585,PEEK(376)"
        PRINT "4 LOADM"; CHR$(34); "PSGLOADR.BIN"; CHR$(34)
        PRINT "5 LOADM";
        IF ramsize = 16384 THEN
            psgplay$ = "PSGPLY16.BIN"
        ELSE
            psgplay$ = "PSGPLY32.BIN"
        END IF
        PRINT CHR$(34); psgplay$; CHR$(34)
        PRINT
        PRINT "To Start the music in your program use the command EXEC"; ramsize - prosize + 7
        PRINT "If you want to Stop the music use the command EXEC"; ramsize - prosize + 1
        PRINT "If you want to Continue the music use the command EXEC"; ramsize - prosize + 4
        PRINT "You can set the number of times the song will loop by poking the required number (1-254) at address"; ramsize - prosize
        PRINT "For example to have the player loop the song 3 times use:"
        PRINT "POKE"; ramsize - prosize; ",3"
        PRINT "If you use a value of 255 it will loop forever, this is the default if you don't add the POKE command to your program."
    END IF
END IF

IF OutputFormat = 6 THEN
    PRINT "You can use PSGPLAYER.asm as a basis for your own ML program/game to have music in the background"
    PRINT "The source code is fully commented with instructions to load the music into the CoCo PSG 512k RAM and"
    PRINT "to help you to understand how to use the program or parts of it for your own program."
    PRINT
    PRINT "Creating a .asm file with the music data in FCB format converted from the MIDI file."
    PRINT "Useful if you want to include the music and take parts of the player code to use in your own program.  Please note"
    PRINT "the output file "; outname$; " doesn't include the 5 byte header it is just the music data ready to be included"
    PRINT "in your own assembly program since you wont need to check the format of the file data."
    PRINT
    PRINT "You might also want to look at the PSG_L1.asm program in the 6809_Source_Code folder as it shows you how to load"
    PRINT "the music data into the CoCo PSG's own RAM."
    IF _FILEEXISTS(outname$) THEN
        KILL outname$
    END IF
    OPEN outname$ FOR BINARY AS #2
    PRINT "Output file: "; outname$
    C = 1
    OPEN "temp.asm" FOR BINARY AS #1: GET #1, , array()
    FOR x = 0 TO LOF(1) - 1: PUT #2, C, array(x): C = C + 1 ' output PSG Player code into new file
    NEXT x
    CLOSE #1
    CLOSE #2
END IF
IF _FILEEXISTS("temp.asm") THEN
    KILL "temp.asm"
END IF
PRINT
PRINT "Done."
END

'Load mv with the Variable Length Quantity where cp is pointing in the array
300 mc = 0: mv = 0
305 tb = array(cp + mc)
IF tb AND 128 THEN mc = mc + 1: GOTO 305
IF mc = 0 THEN mv = tb: cp = cp + 1
IF mc = 1 THEN
    m1 = array(cp) - 128: m0 = array(cp + 1)
    IF m1 AND 1 THEN m0 = m0 + 128
    m1 = INT(m1 / 2)
    mv = m1 * 256 + m0
    cp = cp + 2
END IF
IF mc = 2 THEN
    m2 = array(cp) - 128: m1 = array(cp + 1) - 128: m0 = array(cp + 2)
    IF m1 AND 1 THEN m0 = m0 + 128
    m1 = INT(m1 / 2)
    IF m2 AND 1 THEN m1 = m1 + 64
    IF m2 AND 2 THEN m1 = m1 + 128
    m2 = INT(m2 / 4)
    mv = m2 * 65536 + m1 * 256 + m0
    cp = cp + 3
END IF
IF mc = 3 THEN
    m3 = array(cp) - 128: m2 = array(cp + 1) - 128: m1 = array(cp + 2) - 128: m0 = array(cp + 3)
    IF m1 AND 1 THEN m0 = m0 + 128
    m1 = INT(m1 / 2)
    IF m2 AND 1 THEN m1 = m1 + 64
    IF m2 AND 2 THEN m1 = m1 + 128
    m2 = INT(m2 / 4)
    IF m3 AND 1 THEN m2 = m2 + 32
    IF m3 AND 2 THEN m2 = m2 + 64
    IF m3 AND 4 THEN m2 = m2 + 128
    m3 = INT(m3 / 8)
    mv$ = HEX$(m3)
    mv$ = mv$ + HEX$(m2)
    mv$ = mv$ + HEX$(m1)
    mv$ = mv$ + HEX$(m0)
    mv = VAL("&H" + mv$)
    'mv = m3 * 16777216 + m2 * 65536 + m1 * 256 + m0
    cp = cp + 4
END IF
RETURN
'load mv with the value of 1 byte pointed to by cp
310 mv = array(cp): cp = cp + 1: RETURN
'load mv with the value of 2 bytes pointed to by cp
320 mv = array(cp) * 256 + array(cp + 1): cp = cp + 2: RETURN
'load mv with the value of 3 bytes pointed to by cp
330 mv = array(cp) * 65536 + array(cp + 1) * 256 + array(cp + 2): cp = cp + 3: RETURN
'load mv with the value of 4 bytes pointed to by cp
340 mv = array(cp) * 16777216 + array(cp + 1) * 65536 + array(cp + 2) * 256 + array(cp + 3): cp = cp + 4: RETURN
'convert event in lnibble and rnibble values
350 nibble = Event: lnibble = INT(nibble / 16):
rnibble = 0: IF nibble AND 1 THEN rnibble = 1
IF nibble AND 2 THEN rnibble = rnibble + 2
IF nibble AND 4 THEN rnibble = rnibble + 4
IF nibble AND 8 THEN rnibble = rnibble + 8
RETURN

'Meta Events
500
'IF MF = 0 THEN
'notecount = notecount + 1
'PRINT notecount
'noteTime(notecount) = ticks
'Channel(notecount) = 0: 'Midichan
'END IF
etype = array(cp): cp = cp + 1
IF etype = 0 THEN
    'PRINT #2, "Sequence Number"
    'PRINT #2, array(cp): cp = cp + 1
    'PRINT #2, array(cp): cp = cp + 1
    Evnt = 11: GOSUB 10
    cp = cp + 2
END IF
IF etype = 1 THEN
    'PRINT #2, "Text Event: Message is:"
    Evnt = 12: GOSUB 10
    GOSUB 300
    FOR x = 1 TO mv
        mess$ = mess$ + CHR$(array(cp)): cp = cp + 1
    NEXT x
    'PRINT #2, mess$
    'PRINT #2,
END IF
IF etype = 2 THEN
    'PRINT #2, "Copyright Notice:"
    Evnt = 13: GOSUB 10
    GOSUB 300
    FOR x = 1 TO mv
        cp = cp + 1: 'PRINT #2, array(cp): cp = cp + 1
    NEXT x
END IF
IF etype = 3 THEN
    'PRINT #2, "Sequence/Track Name:"
    Evnt = 14: GOSUB 10
    GOSUB 300
    trackname$ = ""
    FOR x = 1 TO mv
        Temp = array(cp): cp = cp + 1
        IF Temp < 128 THEN
            'PRINT #2, CHR$(temp);
            trackname$ = trackname$ + CHR$(Temp)
        END IF
    NEXT x
    TrackTitle$(Trk) = trackname$
    'PRINT #2,
END IF
IF etype = 4 THEN
    'PRINT #2, "Instrument Name:"
    Evnt = 15: GOSUB 10
    GOSUB 300
    InsName$ = ""
    FOR x = 1 TO mv
        Temp = array(cp): cp = cp + 1
        IF Temp < 128 THEN
            'PRINT #2, CHR$(temp);
            InsName$ = InsName$ + CHR$(Temp)
        END IF
    NEXT x
    InstrumentName$(Trk) = InsName$
    'PRINT #2,
END IF
IF etype = 5 THEN
    'PRINT #2, "Lyric:"
    Evnt = 16: GOSUB 10
    GOSUB 300
    FOR x = 1 TO mv
        cp = cp + 1: 'PRINT #2, CHR$(array(cp));: cp = cp + 1
    NEXT x
    'PRINT #2,
END IF
IF etype = 6 THEN
    'PRINT #2, "Marker:"
    Evnt = 17: GOSUB 10
    GOSUB 300
    FOR x = 1 TO mv
        cp = cp + 1: 'PRINT #2, CHR$(array(cp));: cp = cp + 1
    NEXT x
    'PRINT #2,
END IF
IF etype = 7 THEN
    'PRINT #2, "Cue Point:"
    Evnt = 18: GOSUB 10
    GOSUB 300
    FOR x = 1 TO mv
        cp = cp + 1: ' PRINT #2, array(cp): cp = cp + 1
    NEXT x
END IF
IF etype = &H20 THEN
    'PRINT #2, "Midi Channel Prefix:"
    Evnt = 19: GOSUB 10
    Temp = array(cp): cp = cp + 1
    IF Temp <> 1 THEN PRINT "Error with Channel Prefix command!": END
    pc = array(cp) + 1: cp = cp + 1
    'PRINT #2, "Channel:"; pc
END IF
IF etype = &H21 THEN
    'PRINT #2, "Midi Port:"
    Evnt = 20: GOSUB 10
    Temp = array(cp): cp = cp + 1
    IF Temp <> 1 THEN PRINT , "Error with MIDI Port command!": END
    MIDIPort = array(cp) + 1: cp = cp + 1
    'PRINT #2, "Port:"; MIDIPort
END IF
IF etype = &H2F THEN
    'PRINT #2, "End of Track:"
    Evnt = 21: GOSUB 10
    Temp = array(cp): cp = cp + 1
    IF Temp <> 0 THEN PRINT "Error with End of Track command!": END
END IF
IF etype = &H51 THEN
    'PRINT #2, "Set Tempo:"
    Temp = array(cp): cp = cp + 1
    IF Temp <> 3 THEN PRINT "Error with Set Tempo command!": END
    GOSUB 330
    mqn = mv: BPMCount = BPMCount + 1: BPM(BPMCount) = 60000000 / mqn: BPMChange(BPMCount) = Tik
    'PRINT #2, "Each quarter note should be"; mqn; "microseconds long = "; BPM(BPMCount - 1); "Beats per minute (BPM)"
    Evnt = 22: GOSUB 10
END IF
IF etype = &H54 THEN
    'PRINT #2, "SMTPE Offset:"
    Evnt = 23: GOSUB 10
    Temp = array(cp): cp = cp + 1
    IF Temp <> 5 THEN PRINT "Error with SMPTE OFFset command!": END
    SMTPEOhh = array(cp): cp = cp + 1
    SMTPEOmm = array(cp): cp = cp + 1
    SMTPEOss = array(cp): cp = cp + 1
    SMTPEOfr = array(cp): cp = cp + 1
    SMTPEOff = array(cp): cp = cp + 1
    'PRINT SMTPEOhh; ":"; SMTPEOmm; ":"; SMTPEOss; ":"; SMTPEOfr; ":"; SMTPEOff
END IF
IF etype = &H58 THEN
    'PRINT #2, "Time Signature:"
    Evnt = 24: GOSUB 10
    Temp = array(cp): cp = cp + 1
    IF Temp <> 4 THEN PRINT "Error with Time Signature command!": END
    TSnn = array(cp): cp = cp + 1
    TSdd = array(cp): cp = cp + 1
    TScc = array(cp): cp = cp + 1
    TSbb = array(cp): cp = cp + 1
    'PRINT #2, TSnn; "/"; INT(2 ^ TSdd)
    'PRINT #2, "# of MIDI clocks in a metronome click ="; TScc
    'PRINT #2, TSbb; "32nd-notes per quarter-note"
END IF
IF etype = &H59 THEN
    'PRINT #2, "Key Signature:"
    Evnt = 25: GOSUB 10
    Temp = array(cp): cp = cp + 1
    IF Temp <> 2 THEN PRINT "Error with Key Signature command!": END
    KSsf = array(cp): cp = cp + 1
    IF KSsf = 0 THEN
        'PRINT #2, "C";
    ELSE
        IF KSsf < 0 THEN
            KSsf = KSsf * -1
            'PRINT #2, note$(KSsf); " Flat";
        ELSE
            'PRINT #2, note$(KSsf); " Sharp";
        END IF
    END IF
    KSmi = array(cp): cp = cp + 1
    'IF KSmi = 0 THEN PRINT #2, " Major"
    'IF KSmi = 1 THEN PRINT #2, " Minor"
END IF
IF etype = &H7F THEN
    'PRINT #2, "Sequencer-Specific Meta-event:"
    'PRINT #2, "Other Sys-Ex Command"
    Evnt = 26: GOSUB 10
    GOSUB 300
    cp = cp + mv
END IF
RETURN
'Channel Voice Messages
600
'notecount = notecount + 1
'noteTime(notecount) = ticks
' if Vel > 127 then not a not on or off
Velocity(notecount) = 128
Midichan = rnibble + 1
IF lnibble = &H8 THEN
    MidiKey = array(cp): cp = cp + 1
    MidiVel = array(cp): cp = cp + 1
    'PRINT #2, "Note Off, Channel:"; Midichan; ",Key:"; MidiKey; "="; NoteName$(MidiKey); ",Velocity:"; MidiVel
    Evnt = 3: Chan = Midichan: Keyn = MidiKey: Vel = MidiVel: GOSUB 10
END IF
IF lnibble = &H9 THEN
    MidiKey = array(cp): cp = cp + 1
    MidiVel = array(cp): cp = cp + 1
    'PRINT #2, "Note On, Channel:"; Midichan; ",Key:"; MidiKey; "="; NoteName$(MidiKey); ",Velocity:"; MidiVel
    Evnt = 4: Chan = Midichan: Keyn = MidiKey: Vel = MidiVel: GOSUB 10
END IF
IF lnibble = &HA THEN
    MidiKey = array(cp): cp = cp + 1
    MidiVel = array(cp): cp = cp + 1
    'PRINT #2, "Polyphonic Key (Aftertouch), Channel:"; Midichan; ",Key:"; MidiKey; ",Pressure:"; MidiVel
    Evnt = 5: Chan = Midichan: Keyn = MidiKey: Vel = MidiVel: GOSUB 10
END IF
IF lnibble = &HB THEN
    MidiCont = array(cp): cp = cp + 1
    MidiContVal = array(cp): cp = cp + 1
    'PRINT #2, "Controller Change (expression pedal/slider), Channel:"; Midichan; ",Controller number:"; MidiCont; ",Controller Value:"; MidiContVal
    Evnt = 6: Chan = Midichan: Keyn = MidiCont: Vel = MidiContVal: GOSUB 10
END IF
IF lnibble = &HC THEN
    MidiProg = array(cp): cp = cp + 1
    'PRINT #2,
    'PRINT #2, "Program (Instrument) Change, Channel:"; Midichan; ",New Program Number:"; MidiProg; "="; MIDIDev$(MidiProg)
    IF MidiProg = 0 THEN MidiProg = 1
    pad$ = ""
    IF MidiProg < 100 THEN pad$ = " "
    IF MidiProg < 10 THEN pad$ = "  "
    tname$(Midichan) = RIGHT$(STR$(MidiProg), LEN(STR$(MidiProg)) - 1) + pad$ + " - " + MIDIDev$(MidiProg)
    Evnt = 7: Chan = Midichan: Keyn = MidiProg: GOSUB 10
END IF
IF lnibble = &HD THEN
    MidiPress = array(cp): cp = cp + 1
    'PRINT #2, "Channel Pressure (Aftertouch), Channel:"; Midichan; ",Pressure Value:"; MidiPress; "For the entire channel, not key specific"
    Evnt = 8: Chan = Midichan: Keyn = MidiPress: GOSUB 10
END IF
IF lnibble = &HE THEN
    MidiPBend = array(cp) + array(cp + 1) * 128: cp = cp + 2
    'PRINT #2, "Pitch Bend, Channel:"; Midichan; ",Pitch-Bend amount:"; MidiPBend
    Evnt = 9: Chan = Midichan: Keyn = MidiPBend: GOSUB 10
END IF
RETURN

'Channel Mode Messages
700
MidiData1 = array(cp): cp = cp + 1
MidiData2 = array(cp): cp = cp + 1
IF MidiData1 = &H78 THEN
    Midichan = rnibble
    'PRINT #2, "All Sound off Including envelopes and reverb-effects for channel:"; Midichan
    Evnt = 27: Chan = Midichan: GOSUB 10
END IF
IF MidiData1 = &H79 THEN
    Midichan = rnibble
    'PRINT #2, "Reset all controllers to defaults for channel:"; Midichan
    Evnt = 27: Chan = Midichan: GOSUB 10
END IF
IF MidiData1 = &H7A THEN
    Midichan = rnibble
    'PRINT #2, "Local Control (Disconnect/Connect) keyboard to sound generator"
    IF MidiData2 = 0 THEN
        'PRINT #2, "Disconnect the local Keyboard from the sound generator for channel:"; Midichan
    END IF
    IF MidiData2 = &H7F THEN
        'PRINT #2, "Reconnect the local Keyboard to the sound generator for channel:"; Midichan
    END IF
    Evnt = 27: Chan = Midichan: GOSUB 10
END IF
IF MidiData1 = &H7B THEN
    Midichan = rnibble
    'PRINT #2, "Turn all Notes off from incoming MIDI note local keyboard for channel:"; Midichan
    Evnt = 27: Chan = Midichan: GOSUB 10
END IF
IF MidiData1 = &H7C THEN
    Midichan = rnibble
    'PRINT #2, "Omni Mode Off puts MIDI device into Channel Mode 3 or 4 for channel:"; Midichan
    Evnt = 27: Chan = Midichan: GOSUB 10
END IF
IF MidiData1 = &H7D THEN
    Midichan = rnibble
    'PRINT #2, "Omni Mode On puts MIDI device into Channel Mode 1 or 2 for channel:"; Midichan
    Evnt = 27: Chan = Midichan: GOSUB 10
END IF
IF MidiData1 = &H7E THEN
    Midichan = rnibble
    'PRINT #2, "Mono Mode On channel:"; Midichan
    Evnt = 27: Chan = Midichan: GOSUB 10
END IF
IF MidiData1 = &H7F THEN
    Midichan = rnibble
    'PRINT #2, "Poly Mode On channel:"; Midichan
    Evnt = 27: Chan = Midichan: GOSUB 10
END IF
RETURN

900
WHILE x < GoodEnd(Chan)
    ' PRINT x, Event(x), Velocity(x)
    IF Event(x) = 3 OR Event(x) = 4 AND Velocity(x) < 128 THEN
        'IF X > 270 THEN PRINT "x="; X, "T="; T, "notetime(x)="; noteTime(X) / 1000, "count="; count
        IF Time >= noteTime(x) / 1000 THEN
            '  IF X > 270 THEN PRINT X, "noteonoff="; noteOnOff(X)
            IF noteOnOff(x) = 0 THEN
                'PRINT x, Time, "Got note off": SLEEP
                '     IF X > 270 THEN PRINT X, "noteonoff=0"
                TrackInfo(count, Keynum(x)) = 128
                '    IF count = 10299 THEN PRINT "Changed it to 128 here", count, Keynum(x), 128: PRINT TrackInfo(count, Keynum(x)): SLEEP
            ELSE
                'PRINT x, Time, "Got note on", Velocity(x): SLEEP
                '    IF X > 270 THEN PRINT X, "noteonoff=1"
                TrackInfo(count, Keynum(x)) = Velocity(x)
                '   IF count = 10299 THEN PRINT "Changed it to velocity count=", count, Keynum(x), Velocity(x): PRINT TrackInfo(count, Keynum(x)): SLEEP
            END IF
            x = x + 1
        ELSE
            Time = Time + TimeInc
            count = count + 1
        END IF
        'IF X > 270 THEN SLEEP
    ELSE
        x = x + 1
    END IF
WEND
RETURN

' Fill in the gaps of the track that was just read in
910
'FOR i = 10290 TO 10310: PRINT i, TrackInfo(i, 98): NEXT i: SLEEP
FOR y = 0 TO 127
    x = 0
    WHILE x <= count
        'IF x > 10280 AND x < 10320 AND y = 98 THEN PRINT "got it!", x, y: SLEEP
        IF TrackInfo(x, y) < 128 THEN
            note = TrackInfo(x, y)
            920
            x = x + 1
            IF TrackInfo(x, y) = 129 AND x <= count THEN TrackInfo(x, y) = note: GOTO 920
            IF TrackInfo(x, y) = 128 OR x > count THEN
                TrackInfo(x, y) = 129
            END IF
            x = x - 1
        END IF
        x = x + 1
    WEND
NEXT y
'PRINT
'FOR i = 10290 TO 10310: PRINT i, TrackInfo(i, 98): NEXT i: SLEEP
RETURN

'                                             http://valentin.dasdeck.com/midi/midifile.htm
'                                                        https://www.csie.ntu.edu.tw/~r92092/ref/midi/#midi_event
'                                            http://faydoc.tripod.com/formats/mid.htm
'        http://www.music.mcgill.ca/~ich/classes/mumt306/StandardMIDIfileformat.html
' http://www.shikadi.net/moddingwiki/MID_Format

