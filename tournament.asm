org $80EA93
	JML narrator_text
	
org $89E832
	JML narrator_00
	
org $89B13B
	LDX #$0000
	
org $89B12A
	LDA #$0000
	NOP #2		//text color
	
org $B2C610
	dw $60E4		//navy blue
	
org $89C430
	JML narrator_01	
org $89C4AF
	JML narrator_02
org $89C6D9
	JML narrator_03
org $89C5E8
	JML narrator_04
org $89EB08
	JML narrator_05
org $89B2C8
	JML narrator_06
org $89E870
	JML narrator_07
org $89B359
	JML narrator_08
org $89B49C
	JML narrator_09
org $89B5B9
	JML narrator_10
org $89C259
	JML narrator_11
org $89E91E
	JML narrator_12
org $89B6E9
	JML narrator_13
org $89E92F
	JML narrator_14
org $89EA06
	JML narrator_15
org $89E848
	JML narrator_16
org $89EA19
	JML narrator_17
org $89F03A
	JML tournament_text
org $89EA7B
	JML narrator_27
org $89F700
	JML narrator_31
org $89F736
	JML haya_okuri
org $89EABB
	JML narrator_36
org $89EACC
	JML narrator_37
org $89C0B5
	JML finish_souatari
org $89EADD
	JML narrator_38
org $89EAF1
	JML narrator_12a
	
org $89C72F
	JML load_frame00
org $89C71D
	JML load_frame01
org $89C7AA
	JML load_frame02
org $89C7BC
	JML load_frame03
org $89C7CE
	JML load_frame04
org $89C7E0
	JML load_frame05
org $89C58E
	JML draw_keyconfig
org $89C886
	JML load_rank
org $89C741
	JML load_frame07
org $89C774
	JML load_frame06
org $89C762
	JML load_frame08
org $89C753
	JML load_frame09
org $89C7F2
	JML load_frame10
org $89C8B0
	JML load_frame11
org $89C8C2
	JML load_frame12
org $89C859
	JML load_frame13
org $89C826
	JML load_frame14
org $89C868
	JML load_frame15
	
org $89E3B4
	JML load_name1
org $89E380
	JML load_name2
org $89E621
	JML write_mark
org $89E2F9
	JML load_name3
org $89E321
	JML load_name4
org $89E3E9
	JML load_name5
	
org $89D7E7
	JML rewrite_waku_pointer
org $89D03D
	JML patch_waku
org $89B822
	JML load_team_name

org $89DAAF
	dw key_type	//key config type1,2
org $89C59B
	JML key_map

	
org $89D730
//onsei text pos
	db $02
	dw $F8E0, $0000
	dw $F8F0, $0002
	db $03
	dw $F8D0, $000C
	dw $F8E0, $000E
	dw $F8F0, $0020
	db $03
	dw $F8D8, $0022
	dw $F8E8, $0024
	dw $F8F8, $0026
	
org $B2C591
config_col:
	incbin "Narrator/config_col.bin"
	
org $89D9FF
	dl (char_sentaku_waku1)
org $89DA04
	dl (char_sentaku_waku2)
org $89DA0A
	dl (char_sentaku_waku3)
	dw $3F80
	dl (char_sentaku_waku4)
	
org $89F850
key_type:
	db $06
	dw $B0E8, $1000
	dw $B0F8, $1002
	dw $B008, $1004
	dw $30E8, $1006
	dw $30F8, $1008
	dw $3008, $100A
char_sentaku_waku1:
	db $0E
	dw $F0D0, $100C
	dw $F0E0, $100E
	dw $F0F0, $100E
	dw $F000, $100E
	dw $F010, $100E
	dw $F020, $100E
	dw $F030, $500C
	
	dw $00D0, $100C
	dw $00E0, $100E
	dw $00F0, $100E
	dw $0000, $100E
	dw $0010, $100E
	dw $0020, $100E
	dw $0030, $500C
	
char_sentaku_waku1a:
	db $01
	dw $F0D0, $1080

	
char_sentaku_waku2:
	db $0E
	dw $F0C0, $100C
	dw $F0D0, $100E
	dw $F0E0, $100E
	dw $F0F0, $100E
	dw $F000, $100E
	dw $F010, $100E
	dw $F020, $500C
	
	dw $00C0, $100C
	dw $00D0, $100E
	dw $00E0, $100E
	dw $00F0, $100E
	dw $0000, $100E
	dw $0010, $100E
	dw $0020, $500C
	
char_sentaku_waku3:	
	db $08
	dw $F8C8, $100C
	dw $F8D8, $100E
	dw $F8E8, $100E
	dw $F8F8, $100E
	dw $F808, $100E
	dw $F818, $100E
	dw $F828, $100E
	dw $F838, $500C
	
char_sentaku_waku4:
	db $08
	dw $F8B8, $100C
	dw $F8C8, $100E
	dw $F8D8, $100E
	dw $F8E8, $100E
	dw $F8F8, $100E
	dw $F808, $100E
	dw $F818, $100E
	dw $F828, $500C
	
org $89D6A1
config_waku:
	db $14
	dw $A080, $120C
	dw $A090, $120E
	dw $A0A0, $120E
	dw $A0B0, $120E
	dw $A0C0, $120E
	dw $A0D0, $520C
	dw $B080, $1226
	dw $B0D0, $5226
	dw $C080, $1226
	dw $C0D0, $5226
	dw $D080, $1226
	dw $D0D0, $5226
	dw $E080, $1226
	dw $E0D0, $5226
	dw $F080, $1228
	dw $F490, $920E
	dw $F4A0, $920E
	dw $F4B0, $920E
	dw $F4C0, $920E
	dw $F0D0, $5228
	
org $81A1BF
	JML dma_end_tournament_set
	
org $81A4AC
	JML dma_end2
	
org $81A51F
	JML dma_end3
	
org $81A4E6
	JML dma_eisuji
	
org $81A57D
	JML recolor_ending
	
org $80EA02
	LDA #$0000
	
org $89E5FD
	LDX #$20E0
	STX $12
	LDA #$7E
	STA $14
	LDX #$0640
	STX $15
	PEA $0000
	PLD
	LDA #$80
	STA $0112
	LDA #$02
	TSB $86
	REP #$20
	LDA #$5CE0
	STA $00D2
	RTS
	
org $89D47D
avatar_table_pos:

org $89D493
waku_table_pos:

org $89D5A0		//1p waku pos
	db $02
	dw $EEF0, $1000
	dw $EE00, $1002
	db $02
	dw $EEF0, $1004
	dw $EE00, $1006
	db $02
	dw $EEF0, $1008
	dw $EE00, $100A

org $89B4FA
	JML clear_sentaku_map

org $89E5E3
	LDX #$265E		//init mark pos ram
	
org $89B960
	JML clear_dantaisen_txtmap
	
org $89BA85
	JML clear_dantaisen_txtmap_finish
	
org $89D35D
	JML tensuhyouji