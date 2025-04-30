define trigger_toku_dma	$0250
define toku_vram					$0252
define toku_size					$0254
define toku_adr						$0256
define toku_bank					$0258
define	keep_x						$0140
define	name_pos				$0142

org $E08000
redraw_title:
	PHP
	LDA #$7F
	PHA
	PLB
	REP #$30
	LDX #$0000
-
	LDA title_map,x
	STA $0000,x
	INX #$2
	CPX #$0800
	BCC -	

	LDX #$0000
-
	LDA title_set,x
	STA $2000,x
	INX #2
	CPX #$3E00
	BCC -	
	PLP
	JML $80D0C5
	
rewrite_title_col:
	PHP
	REP #$30
	LDA #$0030
	STA $30
	LDA #$0000
	STA $BC
	LDX #$0000
-
	LDA title_col,x
	STA $7E0800,x
	INX #2
	CPX #$0020
	BCC -
	PLP
	JML $80D12F
	
new_init_opn_map:
	JSR convertmap
	JML $819FE4
convertmap:	
	LDX $04
	JMP (convert,x)
convert:
	dw convert_seiyu
	dw convert_ending
	dw convert_intro
	dw convert_yusho
	
convert_seiyu:
		LDX #$0000
		TXY
		LDA #$0010
		STA $E0
		LDA #$000C
		STA $E2
load:
		LDA opn_map,x
		ORA #$2000
	-
		STA $E800,y
		INY #2
		INC
		DEC $E0
		BNE -
		LDA #$0010
		STA $E0
		INX #2
		TYA
		CLC
		ADC #$0020
		TAY
		DEC $E2
		BNE load
		LDA #$000C
		STA $E2
		LDA #$0010
		STA $E0
		LDY #$0020
load2:
		LDA opn_map,x
		ORA #$2000
	-
		STA $E800,y
		INY #2
		INC
		DEC $E0
		BNE -
		LDA #$0010
		STA $E0
		INX #2
		TYA
		CLC
		ADC #$0020
		TAY
		DEC $E2
		BNE load2
+		
		RTS

convert_yusho:		
	LDX #$0000
-
	LDA end1_map,x
	STA $E800,x
	INX #2
	CPX #$0300
	BNE -
	RTS
		
opn_map:
	dw $0080, $0090, $00A0, $00B0, $00C0, $00D0, $00E0, $00F0
	dw $0100, $0110, $0120, $0130, $0140, $0150, $0160, $0170
	dw $0180, $0190, $01A0, $01B0, $01C0, $01D0, $01E0, $01F0
	

convert_intro:
	LDX #$0000
-
	LDA intro_bg2_map,x
	STA $E800,x
	INX #2
	CPX #$0300
	BCC -
	RTS
	
convert_ending:
	LDX #$0000
-
	LDA ending_map,x
	STA $E800,x
	INX #2
	CPX #$0300
	BNE -
	RTS
	
	
define	opn_counter		$1E0C
new_opening:
	PHB
	SEP #$20
	LDA #$81
	PHA 
	PLB
	REP #$20
	PHX
	LDA.w {opn_counter}
	AND #$00FF
	ASL
	TAX
	LDA #$1800
	STA $4300
	LDA #$0C00
	STA $4305
	LDA #$7400
	STA $D0
	SEP #$20
	LDA #$01
	ORA $86
	STA $86
	STZ $0110
	REP #$20
	JSR (opn_dma,x)
	PLX
	PLB
	JML end_opening
	
opn_dma:
	dw opn0
	dw opn1
	dw opn2
	dw opn3
	dw opn4
	dw opn5
	dw opn6
	dw opn7
	dw opn8
	dw opn9
	dw opn10
	dw opn11
	dw opn12
	dw opn13
	
opn0:
	STZ $BC
	LDA #$FFFF
	STA $0842
	LDA #(opn_text_12)
	STA $4302
	SEP #$20
	LDA.b #(opn_text_12)>>16
	STA $4304
	RTS
opn1:
	STZ $BC	//pal shitei
	LDA #$7B13
	STA $0842		//pal
	LDA #(opn_text_11)
	STA $4302
	SEP #$20
	LDA.b #(opn_text_11)>>16
	STA $4304
	RTS
opn2:
	LDA #(opn_text_10)
	STA $4302
	SEP #$20
	LDA.b #(opn_text_10)>>16
	STA $4304
	RTS
opn3:
	LDA #(opn_text_9)
	STA $4302
	SEP #$20
	LDA.b #(opn_text_9)>>16
	STA $4304
	RTS
opn4:
	LDA #(opn_text_8)
	STA $4302
	SEP #$20
	LDA.b #(opn_text_8)>>16
	STA $4304
	RTS
opn5:
	LDA #(opn_text_7)
	STA $4302
	SEP #$20
	LDA.b #(opn_text_7)>>16
	STA $4304
	RTS
opn6:
	LDA #(opn_text_6)
	STA $4302
	SEP #$20
	LDA.b #(opn_text_6)>>16
	STA $4304
	RTS
opn7:
	LDA #(opn_text_5)
	STA $4302
	SEP #$20
	LDA.b #(opn_text_5)>>16
	STA $4304
	RTS
opn8:
	LDA #(opn_text_4)
	STA $4302
	SEP #$20
	LDA.b #(opn_text_4)>>16
	STA $4304
	RTS
opn9:
	LDA #(opn_text_3)
	STA $4302
	SEP #$20
	LDA.b #(opn_text_3)>>16
	STA $4304
	RTS
opn10:
	LDA #(opn_text_2)
	STA $4302
	SEP #$20
	LDA.b #(opn_text_2)>>16
	STA $4304
	RTS
opn11:
	LDA #(opn_text_1)
	STA $4302
	SEP #$20
	LDA.b #(opn_text_1)>>16
	STA $4304
	RTS
opn12:
	LDA #(blank)
	STA $4302
	SEP #$20
	LDA.b #(blank)>>16
	STA $4304
	RTS
opn13:
	LDA #(opn_text_0)
	STA $4302
	SEP #$20
	LDA.b #(opn_text_0)>>16
	STA $4304
	RTS
	
check_dma_intro_bg1:
	LDA $04
	BEQ +
	JSL dma_intro_bg1
	JML $81A055
+
	JSL $809ECA
	JML $81A055
	
dma_intro_bg1:
	PHP
	PHB
	SEP #$20
	REP #$10
	LDA #$80
	PHA
	PLB
	LDA.b #(intro_bg1_set)>>16
	STA $4304
	LDA #$80
	STA $2115
	LDX #(intro_bg1_set)
	STX $4302
	LDX #$1801
	STX $4300
	LDX #$3C00
	STX $2116
	LDX #$0400
	STX $4305
	LDA #$01
	STA $420B	
	JSR write_intro_bg1_map
	PLB
	PLP
	RTL
	
write_intro_bg1_col:
	LDX #$0000
-
	LDA intro_bg1_col,x
	STA $0800,x
	INX #2
	CPX #$0070
	BNE -
	RTL
	
write_intro_bg1_map:
	PHP
	PHB
	LDA #$7F
	PHA
	PLB
	REP #$30
	LDX #$0000
-
	LDA intro_bg1_map,x
	STA $0000,x
	INX #2
	CPX #$0300
	BCC -
	PLB
	PLP
	RTS

dma_intro_bg2_set:
	JSL wait_vblank
	LDX #$1801
	STX $4300
	LDX #$1800
	STX $4305
	LDX #$7400
	STX $2116	
	LDX $0E1A
	JSR (dma_bg2_set,x)
	LDX #$0000
-
	LDA intro_bg2_map,x
	STA $7F8000,x
	INX #2
	CPX #$0300
	BCC -
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $2115
	LDX #$1801
	STX $4300
	LDX #$8000
	STX $4302
	LDX #$0300
	STX $4305
	LDX #$1E00
	STX $2116
	LDA #$01
	STA $420B
	REP #$20
	LDA #$008A
	JML $81A3B2
dma_bg2_set:
	dw bg2_yusuke
	dw bg2_kuwabara
	dw bg2_kurama
	dw bg2_hiei
	dw bg2_genkai
	dw bg2_rinku
	dw bg2_toya
	dw bg2_jin
	dw bg2_shishiwakamaru
	dw bg2_karasu
	dw bg2_bui
	dw bg2_toguro1
	dw bg2_toguro2
	dw bg2_kamiya
	dw bg2_kaname
	dw bg2_itsuki
	dw bg2_sensui
	dw bg2_youko
	dw bg2_genkai2
	dw bg2_toguro3

bg2_yusuke:
	PHP
	SEP #$20
	LDA.b #(demo00)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo00)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS

bg2_kuwabara:
	PHP
	SEP #$20
	LDA.b #(demo01)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo01)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS

bg2_kurama:
	PHP
	SEP #$20
	LDA.b #(demo02)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo02)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_hiei:
	PHP
	SEP #$20
	LDA.b #(demo03)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo03)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_genkai:
	PHP
	SEP #$20
	LDA.b #(demo04)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo04)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_rinku:
	PHP
	SEP #$20
	LDA.b #(demo05)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo05)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_toya:
	PHP
	SEP #$20
	LDA.b #(demo06)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo06)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_jin:
	PHP
	SEP #$20
	LDA.b #(demo07)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo07)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_shishiwakamaru:
	PHP
	SEP #$20
	LDA.b #(demo08)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo08)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_karasu:
	PHP
	SEP #$20
	LDA.b #(demo09)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo09)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_bui:
	PHP
	SEP #$20
	LDA.b #(demo10)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo10)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_toguro1:
	PHP
	SEP #$20
	LDA.b #(demo11)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo11)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_toguro2:
	PHP
	SEP #$20
	LDA.b #(demo12)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo12)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_kamiya:
	PHP
	SEP #$20
	LDA.b #(demo13)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo13)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_kaname:
	PHP
	SEP #$20
	LDA.b #(demo14)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo14)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_itsuki:
	PHP
	SEP #$20
	LDA.b #(demo15)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo15)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_sensui:
	PHP
	SEP #$20
	LDA.b #(demo16)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo16)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_youko:
	PHP
	SEP #$20
	LDA.b #(demo17)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo17)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_genkai2:
	PHP
	SEP #$20
	LDA.b #(demo18)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo18)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
bg2_toguro3:
	PHP
	SEP #$20
	LDA.b #(demo19)>>16
	STA $4304
	LDA #$80
	STA $2115
	STA $2100
	LDX #(demo19)
	STX $4302
	LDA #$01
	STA $420B
	PLP
	RTS
	
intro_color:
	LDA #$FFFF
	STA $0E68
	LDY #$0013
	LDX $1E0A
-
	LDA $7FE800,x
	AND #$E3FF
	STA $7FE800,x
	LDA $7FE840,x
	AND #$E3FF
	STA $7FE840,x

	LDA $7FE880,x
	ORA #$0800
	STA $7FE880,x
	LDA $7FE8C0,x
	ORA #$0800
	STA $7FE8C0,x
	INX #2
	DEY
	BNE -
	LDX #$0000
	LDY #$0016
-
	LDA $7FE880,x
	ORA #$2400
	STA $7FE880,x
	LDA $7FE8C0,x
	ORA #$2400
	STA $7FE8C0,x	
	INX #2
	DEY
	BNE -
	
	LDA $1E0A
	CLC
	ADC #$0080
	STA $1E0A
	JML $81A425

wait_vblank:
	PHP
	SEP #$20
-
	LDA $4212
	BIT #$80
	BEQ -
	PLP
	RTL
	
wait_end_vblank:
	PHP
	SEP #$20
-
	LDA $4212
	BIT #$80
	BNE -
	PLP
	RTL
	
rewrite_intro_jun:
	LDX $012E
	LDA $7EFFF8
	BEQ +
	JMP baby_jun
+
	LDA $A38D,x
	AND #$00FF
	STA $0E1A
	LSR
	TAX
	LDA $81A955,x
	AND #$00FF
	STA $0E18
	LDX $0E1A
	LDA $81ACEB,x
	STA $1E02
	LDX #$0011
	CPX $012E
	BEQ +
	INC $012E
	BRA _A37E
+
	STZ $012E
_A37E:
	LDX $04
	JML $81A380
	
baby_jun:
	LDA new_jun,x
	AND #$00FF
	STA $0E1A
	LSR
	TAX
	LDA $81A955,x
	AND #$00FF
	STA $0E18
	LDX $0E1A
	LDA $81ACEB,x
	STA $1E02
	LDX #$0014
	CPX $012E
	BEQ +
	INC $012E
	BRA _81A37E
+
	STZ $012E
_81A37E:
	LDX $04
	JML $81A380
	
new_jun:
	db $00, $02, $06
	db $04, $22, $0A
	db $08, $24, $0C
	db $0E, $10, $12
	db $16, $18, $26
	db $14, $1A, $1C
	db $1E, $20
	
define	txt_pos	$0D0E	
define	tile_num	$0D08
define	line				$E4
define	tile_vram_size	$E6
define	txt_id	$E4
define	save_x	$E8
define	buffer1	$EA
define	buffer2	$EC
define	letter_tile_vram	$EE
define	font_ptr	$F0
define	save_a	$F3
define	shift		$F5
define	width		$F7
define	left_byte	$F9
define	right_byte	$FB
define	width_adr	$FD

narrator_text:
	LDA $01,s
	STA $00,s
	SEP #$20
	LDA #$80
	STA $02,s
	REP #$20
	TSC
	DEC
	TCS
	LDX {txt_pos}
-
	LDA narrator,x
	AND #$00FF
	CMP #$00FF
	BEQ end_narrator
	CMP #$00AB
	BEQ end_narrator
	CMP #$00F0
	BCC +
	JSR control_code
	INX
	BRA -
+
	STA {save_a}
	INX
	STX {txt_pos}
	LDA #(font0)
	STA.b {font_ptr}
	SEP #$20
	LDA.b #(font0)>>16
	STA.b {font_ptr}+2
	REP #$20	
	JSR draw_tile
	LDA #$1801
	STA $4300
	LDA #$0040
	STA $4305
	LDA #$0300
	STA $4302
	LDA {letter_tile_vram}
	CLC
	ADC #$6000
	STA $D0
	SEP #$20
	LDA #$7E
	STA $4304
	LDA #$01
	ORA $86
	STA $86
	LDA #$80
	STA $0110
	REP #$20
end_narrator:
	CLC
	RTL

control_code:
	PHX
	SEC
	SBC #$00F0
	ASL
	TAX
	JMP (code,x)	
code:
	dw code_line
	dw code_wait
	dw code_clear
	dw code_text_speed
	dw code_name
	dw code_clear2
	dw code_pause
	
code_line:
	PHP
	SEP #$20
	LDA {line}
	INC
	STA {line}
	REP #$20
	LDA.b {line}
	AND #$00FF
	ASL #6
	STA {tile_num}
	STZ {shift}
	PLP
	PLX
	RTS
	
code_wait:
	LDA #$0040
	STA $0D02
	PLX
	INX
	STX {txt_pos}
	LDA #(end_narrator)-1
	STA $00,s
	SEP #$20
	LDA.b #(end_narrator)>>16
	STA $02,s
	REP #$20
	TSC
	DEC
	TCS
	RTL
	
init_narrator_txt:
	LDA #(blank)
	STA $4302
	LDA #$1801
	STA $4300
	LDA #$0C00
	STA $4305
	LDA #$6000
	STA $D0
	SEP #$20
	LDA.b #(blank)>>16
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	ORA $86
	STA $86
	REP #$20
	STZ {shift}
	STZ {width}
	STZ {line}
	STZ {tile_num}
	RTS
code_clear:
	JSR init_narrator_txt
	PLX
	INX
	STX {txt_pos}
	LDA #(end_narrator)-1
	STA $00,s
	SEP #$20
	LDA.b #(end_narrator)>>16
	STA $02,s
	REP #$20
	TSC
	DEC
	TCS
	RTL
		
code_text_speed:
	SEP #$20
	PLX
	INX
	LDA narrator,x
	STA $0D02
	STA $0D04
	INX
	STX {txt_pos}
	LDA.b #(end_narrator)>>16
	STA $02,s
	REP #$20
	LDA #(end_narrator)-1
	STA $00,s
	TSC
	DEC
	TCS
	RTL
	
code_name:
	PLX
	STX {keep_x}
	LDA $0D18
	TAX
	JSR (read_name_ptr,x)
	INX
	STX {name_pos}
	CMP #$00FF
	BNE +
	LDX {keep_x}
	INX
	STX {txt_pos}
	LDX #$0000
	STX {name_pos}
	LDA #(end_narrator)-1
	STA $00,s
	SEP #$20
	LDA.b #(end_narrator)>>16
	STA $02,s
	REP #$20
	TSC
	DEC
	TCS
	RTL
+
	STA {save_a}
	LDA #(font0)
	STA.b {font_ptr}
	SEP #$20
	LDA.b #(font0)>>16
	STA.b {font_ptr}+2
	REP #$20	
	JSR draw_tile
	LDA #$1801
	STA $4300
	LDA #$0040
	STA $4305
	LDA #$0300
	STA $4302
	LDA {letter_tile_vram}
	CLC
	ADC #$6000
	STA $D0
	SEP #$20
	LDA #$7E
	STA $4304
	LDA #$01
	ORA $86
	STA $86
	LDA #$80
	STA $0110
	REP #$20
	LDA #(end_narrator)-1
	STA $00,s
	SEP #$20
	LDA.b #(end_narrator)>>16
	STA $02,s
	REP #$20
	TSC
	DEC
	TCS
	RTL
	
read_name_ptr:
	dw read_yusuke
	dw read_kuwabara
	dw read_kurama
	dw read_hiei
	dw read_genkai
	dw read_rinku
	dw read_touya
	dw read_jin
	dw read_shishi
	dw read_karasu
	dw read_bui
	dw read_toguro1
	dw read_toguro2
	dw read_kamiya
	dw read_hagiri
	dw read_itsuki
	dw read_sensui
	dw read_youko
	dw read_genkai_wakai
	dw read_toguro3
	
read_yusuke:
	LDX {name_pos}
	LDA name00,x
	AND #$00FF
	RTS
read_kuwabara:
	LDX {name_pos}
	LDA name01,x
	AND #$00FF
	RTS
read_kurama:
	LDX {name_pos}
	LDA name02,x
	AND #$00FF
	RTS
read_hiei:
	LDX {name_pos}
	LDA name03,x
	AND #$00FF
	RTS
read_genkai:
	LDX {name_pos}
	LDA name04,x
	AND #$00FF
	RTS
read_rinku:
	LDX {name_pos}
	LDA name05,x
	AND #$00FF
	RTS
read_touya:
	LDX {name_pos}
	LDA name06,x
	AND #$00FF
	RTS
read_jin:
	LDX {name_pos}
	LDA name07,x
	AND #$00FF
	RTS
read_shishi:
	LDX {name_pos}
	LDA name08,x
	AND #$00FF
	RTS
read_karasu:
	LDX {name_pos}
	LDA name09,x
	AND #$00FF
	RTS
read_bui:
	LDX {name_pos}
	LDA name10,x
	AND #$00FF
	RTS
read_toguro1:
	LDX {name_pos}
	LDA name11,x
	AND #$00FF
	RTS
read_toguro2:
	LDX {name_pos}
	LDA name12,x
	AND #$00FF
	RTS
read_kamiya:
	LDX {name_pos}
	LDA name13,x
	AND #$00FF
	RTS
read_hagiri:
	LDX {name_pos}
	LDA name14,x
	AND #$00FF
	RTS
read_itsuki:
	LDX {name_pos}
	LDA name15,x
	AND #$00FF
	RTS
read_sensui:
	LDX {name_pos}
	LDA name16,x
	AND #$00FF
	RTS
read_youko:
	LDX {name_pos}
	LDA name17,x
	AND #$00FF
	RTS
read_genkai_wakai:
	LDX {name_pos}
	LDA name18,x
	AND #$00FF
	RTS
read_toguro3:
	LDX {name_pos}
	LDA name19,x
	AND #$00FF
	RTS
	
draw_tile:
	PHY
	PHX
	PHP
	LDA.b {shift}
	BEQ new_tile
	CMP #$0008
	BCC draw
	TAX
	AND #$0007
	STA.b {shift}
	TXA
	LSR
	LSR
	LSR
	TAY
	TXA
	AND #$00F8
	ASL
	ASL
	TAX
	DEX
	DEX
here:	
	PHY
	LDY #$0010
-	
	LDA $7E0320,x
	STA $7E0300,x
	DEX
	DEX
	DEY
	BNE -
	JSR update_tile_num
	PLY
	DEY
	BNE here
	LDX #$0000
	LDY #$0010
-	
	STZ $0320,x
	STZ $0340,x
	STZ $0360,x
	STZ $0380,x
	STZ $03A0,x
	INX #2
	DEY
	BNE -
	BRA draw
	
new_tile:
	LDX #$0000
	LDY #$0010
-
	STZ $0300,x
	STZ $0320,x
	STZ $0340,x
	STZ $0360,x
	STZ $0380,x
	STZ $03A0,x
	INX
	INX
	DEY
	BNE -
draw:
	LDA {save_a}
	ASL #6
	CLC
	ADC {font_ptr}
	STA {font_ptr}
	LDA {shift}
	AND #$00F8
	ASL
	ASL
	STA {save_x}
	TAX
	LDY #$0000
-
	LDA [{font_ptr}],y
	BEQ +
	JSR shift_pixel
	LDA $7E0300,x
	ORA {left_byte}
	STA $7E0300,x
	LDA $7E0320,x
	ORA {right_byte}
	STA $7E0320,x
+
	INX #2
	INY #2
	CPY #$0010
	BNE -
	LDX {save_x}
-
	LDA [{font_ptr}],y
	BEQ +
	JSR shift_pixel
	LDA $7E0310,x
	ORA {left_byte}
	STA $7E0310,x
	LDA $7E0330,x
	ORA {right_byte}
	STA $7E0330,x
+
	INX #2
	INY #2
	CPY #$0020
	BNE -	
	LDX {save_x}
-
	LDA [{font_ptr}],y
	JSR shift_pixel
	LDA $7E0320,x
	ORA {left_byte}
	STA $7E0320,x
	LDA $7E0340,x
	ORA {right_byte}
	STA $7E0340,x
	INX
	INX
	INY
	INY
	CPY #$0030
	BNE -	
	LDX {save_x}
-
	LDA [{font_ptr}],y
	JSR shift_pixel
	LDA $7E0330,x
	ORA {left_byte}
	STA $7E0330,x
	LDA $7E0350,x
	ORA {right_byte}
	STA $7E0350,x
	INX
	INX
	INY
	INY
	CPY #$0040
	BNE -	
	LDY.b {save_a}
	LDA [{width_adr}],y
	AND #$00FF
	STA {width}
	CLC
	ADC.b {shift}
	STA.b {shift}
	DEC
	AND #$00F8
	ASL
	ASL
	CLC
	ADC #$0020
	STA {tile_vram_size}
	LDA {tile_num}
	ASL
	ASL
	ASL
	CLC
	STA {letter_tile_vram}
+	
	PLP
	PLX
	PLY
	RTS	
	
update_tile_num:
	LDA {tile_num}
	INC #2
	STA {tile_num}
	RTS
	
shift_pixel:
	PHX
	PHA
	XBA
	AND #$FF00
	STA {buffer1}
	PLA
	AND #$FF00
	STA {buffer2}
	LDA {shift}
	AND #$0007
	TAX
	BEQ +
-
	LSR {buffer1}
	LSR {buffer2}
	DEX
	BNE -
+
	LDA {buffer1}
	XBA
	AND #$00FF
	STA {left_byte}
	LDA {buffer2}
	AND #$FF00
	ORA {left_byte}
	STA {left_byte}
	LDA {buffer1}
	AND #$00FF
	STA {right_byte}
	LDA {buffer2}
	XBA
	AND #$FF00
	ORA {right_byte}
	STA {right_byte}
	PLX
	RTS	

narrator_00:
	LDA #$0001
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89E839
	
narrator_01:
	LDA #(narrator01)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89C437
narrator_02:
	LDA #(narrator02)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89C4B6
narrator_03:
	LDA #(narrator03)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89C6E0
narrator_04:
	LDA #(narrator04)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89C5EF
narrator_05:
	LDA #(narrator05)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89EB0F
narrator_06:
	LDA #(narrator06)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89B2CF
narrator_07:
	LDA #(narrator07)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89E877
narrator_08:
	LDA #(narrator08)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89B360
narrator_09:
	LDA $0236
	CMP #$0002
	BEQ +
	LDA #(narrator09)
-
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89B4AE
+
	LDA #(narrator09b)
	BRA -
narrator_10:
	LDA #(narrator10)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89B5C0
narrator_11:
	LDA #(narrator11)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89C260
narrator_12:
	LDA #(narrator12)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89E925
narrator_12a:
	LDA #(narrator12)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89EAF8
	
narrator_13:
	LDA #(narrator13)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89B6F0
narrator_14:
	LDA #(narrator14)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89E936
narrator_15:
	LDA #(narrator15)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89EA0D
narrator_16:
	LDA #(narrator16)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	LDX #$0540
-
	STZ $0000,x
	INX #2
	CPX #$0800
	BNE -
	JML $89E84F
narrator_17:
	LDA #(narrator17)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89EA20

	
init_narrator_tile:
	LDA #(bg3_map)
	STA $4302
	LDA #$1801
	STA $4300
	LDA #$01C4
	STA $4305
	LDA #$5C00
	STA $D0
	SEP #$20
	LDA.b #(bg3_map)>>16
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	ORA $86
	STA $86

	LDA.b #(font0_width)>>16
	STA {width_adr}+2
	REP #$20
	LDA #(font0_width)
	STA {width_adr}
	STZ {shift}
	STZ {width}
	STZ {line}
	STZ {tile_num}
	
	LDA #(blank)
	STA $4312
	LDA #$1801
	STA $4310
	LDA #$0C00
	STA $4315
	LDA #$6000
	STA $D2
	SEP #$20
	LDA.b #(blank)>>16
	STA $4314
	LDA #$80
	STA $0112
	LDA #$02
	ORA $86
	STA $86	
	REP #$20
	RTS
	
load_frame00:
	PHB
	LDX #$0000
	LDA #$7F7F
	PHA
	PLB #2
-
	LDA square00_set,x
	STA $5000,x
	INX #2
	CPX #$1000
	BNE -
	PLB
	LDX #$0000
-
	LDA square00_col,x
	STA $0920,x
	INX #2
	CPX #$0020
	BNE -
	
	LDA #$1801
	STA $4300
	LDA #$5000
	STA $4302
	LDA #$2800
	STA $D0
	LDA #$1000
	STA $4305
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C737
	
load_frame01:
	PHB
	LDX #$0000
	LDA #$7F7F
	PHA
	PLB #2
-
	LDA square01_set,x
	STA $5000,x
	INX #2
	CPX #$1000
	BNE -
	PLB
	LDX #$0000
-
	LDA square01_col,x
	STA $0900,x
	INX #2
	CPX #$0020
	BNE -
	
	LDA #$1801
	STA $4300
	LDA #$5000
	STA $4302
	LDA #$2000
	STA $D0
	LDA #$1000
	STA $4305
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C725
load_frame02:
	PHB
	LDX #$0000
	LDA #$7F7F
	PHA
	PLB #2
-
	LDA square02_set,x
	STA $5000,x
	INX #2
	CPX #$0800
	BNE -
	PLB
	LDX #$0000
-
	LDA square02_col,x
	STA $0900,x
	INX #2
	CPX #$0020
	BNE -
	
	LDA #$1801
	STA $4300
	LDA #$5000
	STA $4302
	LDA #$2000
	STA $D0
	LDA #$0800
	STA $4305
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C7B2
	
load_frame03:
	PHB
	LDX #$0000
	LDA #$7F7F
	PHA
	PLB #2
-
	LDA square03_set,x
	STA $5000,x
	INX #2
	CPX #$1000
	BNE -
	PLB
	LDX #$0000
-
	LDA square03_col,x
	STA $0920,x
	INX #2
	CPX #$0020
	BNE -
	
	LDA #$1801
	STA $4300
	LDA #$5000
	STA $4302
	LDA #$2800
	STA $D0
	LDA #$1000
	STA $4305
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C7C4
load_frame04:
	PHB
	LDX #$0000
	LDA #$7F7F
	PHA
	PLB #2
-
	LDA square04_set,x
	STA $5000,x
	INX #2
	CPX #$0800
	BNE -
	PLB
	LDX #$0000
-
	LDA square04_col,x
	STA $0940,x
	INX #2
	CPX #$0020
	BNE -
	
	LDA #$1801
	STA $4300
	LDA #$5000
	STA $4302
	LDA #$3000
	STA $D0
	LDA #$0800
	STA $4305
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C7D6
load_frame05:
	PHB
	LDX #$0000
	LDA #$7F7F
	PHA
	PLB #2
-
	LDA square05_set,x
	STA $5000,x
	INX #2
	CPX #$0800
	BNE -
	PLB
	LDX #$0000
-
	LDA square05_col,x
	STA $0900,x
	INX #2
	CPX #$0020
	BNE -
	LDX #$0000
-
	LDA waku_col,x
	STA $0920,x
	INX #2
	CPX #$0020
	BNE -
	LDA #$1801
	STA $4300
	LDA #$5000
	STA $4302
	LDA #$2000
	STA $D0
	LDA #$0800
	STA $4305
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C7E8
	
draw_keyconfig:
	LDA #(config_set)
	STA {toku_adr}
	LDA #$2200
	STA {toku_size}
	LDA #$0000
	STA {toku_vram}
	SEP #$20
	LDA.b #(config_set)>>16
	STA {toku_bank}
	REP #$20
	LDA #$FFFF
	STA {trigger_toku_dma}
	JML $89C594
	
dma_special:
	REP #$20
	LDA {trigger_toku_dma}
	CMP #$FFFF
	BEQ +
	PLA
	PLY
	PLX
	PLD
	PLB
	RTI
+
	LDA {toku_vram}
	STA $2116
	LDA #$1801
	STA $4300
	LDA {toku_adr}
	STA $4302
	LDA {toku_size}
	CMP #$0400
	BCC +
	SEC
	SBC #$0400
	STA {toku_size}
	LDA {toku_adr}
	CLC
	ADC #$0400
	STA {toku_adr}
	LDA #$0200
	CLC
	ADC {toku_vram}
	STA {toku_vram}
	LDA #$0400
	BRA toku_common
+
	STZ {trigger_toku_dma}
	STZ {toku_size}
toku_common:
	STA $4305
	SEP #$20
	LDA {toku_bank}
	STA $4304
	LDA #$80
	STA $2115
	LDA #$01
	STA $420B
	REP #$20
	PLA
	PLY
	PLX
	PLD
	PLB
	RTI
	
load_rank:
	LDA #$1801
	STA $4300
	LDA #(rank_set)
	STA $4302
	LDA #$3000
	STA $D0
	LDA #$0800
	STA $4305
	SEP #$20
	LDA.b #(rank_set)>>16
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C88E
	
load_frame07:
	PHB
	LDX #$0000
	LDA #$7F7F
	PHA
	PLB #2
-
	LDA square07_set,x
	STA $5000,x
	INX #2
	CPX #$0C00
	BNE -
	PLB
	LDX #$0000
	LDA #$1801
	STA $4300
	LDA #$5000
	STA $4302
	LDA #$2000
	STA $D0
	LDA #$0C00
	STA $4305
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	LDX #$0000
-
	LDA square07_col,x
	STA $0900,x
	INX #2
	CPX #$0020
	BNE -
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C749
load_frame06:
	PHB
	LDX #$0000
	LDA #$7F7F
	PHA
	PLB #2
-
	LDA square06_set,x
	STA $5000,x
	INX #2
	CPX #$0C00
	BNE -
	PLB
	LDX #$0000
	LDA #$1801
	STA $4300
	LDA #$5000
	STA $4302
	LDA #$3200
	STA $D0
	LDA #$0C00
	STA $4305
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	LDX #$0000
-
	LDA square06_col,x
	STA $0960,x
	INX #2
	CPX #$0020
	BNE -
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C77C
load_frame08:
	PHB
	LDX #$0000
	LDA #$7F7F
	PHA
	PLB #2
-
	LDA square08_set,x
	STA $5000,x
	INX #2
	CPX #$0C00
	BNE -
	PLB
	LDX #$0000
	LDA #$1801
	STA $4300
	LDA #$5000
	STA $4302
	LDA #$2C00
	STA $D0
	LDA #$0C00
	STA $4305
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	LDX #$0000
-
	LDA square08_col,x
	STA $0940,x
	INX #2
	CPX #$0020
	BNE -
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C76A
load_frame09:
	PHB
	LDX #$0000
	LDA #$7F7F
	PHA
	PLB #2
-
	LDA square09_set,x
	STA $5000,x
	INX #2
	CPX #$0C00
	BNE -
	PLB
	LDX #$0000
	LDA #$1801
	STA $4300
	LDA #$5000
	STA $4302
	LDA #$2600
	STA $D0
	LDA #$0C00
	STA $4305
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	LDX #$0000
-
	LDA square09_col,x
	STA $0920,x
	INX #2
	CPX #$0020
	BNE -
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C75B
load_frame10:
	PHB
	LDX #$0000
	LDA #$7F7F
	PHA
	PLB #2
-
	LDA square10_set,x
	STA $5000,x
	INX #2
	CPX #$0C00
	BNE -
	PLB
	LDX #$0000
	LDA #$1801
	STA $4300
	LDA #$5000
	STA $4302
	LDA #$2000
	STA $D0
	LDA #$0C00
	STA $4305
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C7FA
load_frame11:
	PHB
	LDX #$0000
	PEA $7F7F
	PLB #2
-
	LDA square11_set,x
	STA $5000,x
	INX #2
	CPX #$1000
	BNE -
	PLB
	LDX #$0000
-
	LDA square11_col,x
	STA $0900,x
	INX #2
	CPX #$0080
	BNE -
	LDA #$1801
	STA $4300
	LDA #$5000
	STA $4302
	LDA #$2000
	STA $D0
	LDA #$1000
	STA $4305
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C8B8
load_frame12:
	PHB
	LDX #$0000
	PEA $7F7F
	PLB #2
-
	LDA square12_set,x
	STA $5000,x
	INX #2
	CPX #$1000
	BNE -
	PLB
	LDA #$1801
	STA $4300
	LDA #$5000
	STA $4302
	LDA #$3000
	STA $D0
	LDA #$1000
	STA $4305
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	JML $89C8CA
	
load_frame13:
	PHB
	LDX #$0000
	PEA $7F7F
	PLB #2
-
	LDA square13_set,x
	STA $5000,x
	INX #2
	CPX #$0C00
	BNE -
	PLB
	LDA #$1801
	STA $4300
	LDA #$5000
	STA $4302
	LDA #$3000
	STA $D0
	LDA #$0C00
	STA $4305
	SEP #$20
	LDA #$7F
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C861
load_frame14:
	LDX #$0000
-
	LDA square14_col,x
	STA $7E0920,x
	INX #2
	CPX #$0020
	BNE -
	LDA #$1801
	STA $4300
	LDA #(square14_set)
	STA $4302
	LDA #$2800
	STA $D0
	LDA #$1000
	STA $4305
	SEP #$20
	LDA.b #(square14_set)>>16
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C82E
load_frame15:
	LDX #$0000
-
	LDA square15_col,x
	STA $09C0,x
	INX #2
	CPX #$0020
	BNE -
	LDA #$1801
	STA $4300
	LDA #(square15_set)
	STA $4302
	LDA #$3000
	STA $D0
	LDA #$0800
	STA $4305
	SEP #$20
	LDA.b #(square15_set)>>16
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	TSB $86
	REP #$20
	STZ $BC
	LDA #$01FE
	STA $BE
	JML $89C870

	
dma_preset:
	LDA #(preset)
	STA $4302
	LDA #$1801
	STA $4300
	LDA #$2600
	STA $4305
	LDA #$6600
	STA $2116
	SEP #$20
	LDA #$80
	STA $2115
	LDA.b #(preset)>>16
	STA $4304
	LDA #$01
	STA $420B
	REP #$20
	LDA #$0800
	STA $4305
	LDA #(blank)
	STA $4302
	LDA #$5C00
	STA $2116
	SEP #$20
	LDA.b #(blank)>>16
	STA $4304
	LDA #$01
	STA $420B
	REP #$20		
	STZ $80
	LDX $02
	INX #2
	JML $89B1E2
	
dma_preset2:
	LDA #(preset2)
	STA $4302
	LDA #$1801
	STA $4300
	LDA #$0C00
	STA $4305
	LDA #$3800
	STA $2116
	SEP #$20
	LDA #$80
	STA $2115
	LDA.b #(preset2)>>16
	STA $4304
	LDA #$01
	STA $420B
	REP #$20
	JML $89B1C3
	
dma_onsei_settei:
	LDX #$02F4
	LDY #$0002
	LDA #$20C0
-
	STA $7E2000,x
	STA $7E2100,x
	INC
	STA $7E2040,x
	STA $7E2140,x
	INC
	INX #2
	DEY
	BNE -
	LDA $1C
	JSR write_bgm
	LDX #$04E2
	LDA $1A
	JSR write_voice
	
	LDY #$0406
	LDA $0180
	PHA
	LDX #$0026
-
	LDA voice_table,x
	CMP $1A
	BEQ +
	BCC +
	DEX #2
	BRA -
+
	TXA
	ASL
	TAX
	LDA name_table1,x
	STA $0180
	LDA name_table1+2,x
-
	TYX
	STA $7E2000,x
	INC
	STA $7E2040,x
	INC
	INY #2
	DEC $0180
	BNE -	
	PLA
	STA $0180
	JML $89F5FF
	
	
	
name_table1:
	dw $0005, $20D8
	dw $0007, $20E2
	dw $0005, $20F0
	dw $0005, $20FC
	dw $0003, $2106
	dw $0005, $210C
	dw $0009, $2116
	dw $0004, $2128
	dw $0004, $2130
	dw $0003, $2138
	dw $000C, $213E
	dw $0003, $2156
	dw $0005, $215C
	dw $0008, $2166
	dw $0008, $2176
	dw $0005, $2186
	dw $0005, $2190
	dw $0005, $219A
	dw $0005, $21A4
	dw $0005, $21A4
	
	
voice_table:
	dw $0000, $0006, $000E, $0013		//yusuke, kuwabara, kurama, youko
	dw $0016, $001E, $0023, $002A	//hiei, genkai, genkai wakai, rinku
	dw $0031, $0033, $0039, $003C		//touya, jin, shishiwakamaru, bui
	dw $003D, $0040, $0044, $0048	//karasu, toguro ani, toguro otouto, kamiya
	dw $004C, $004E, $0055, $005E		//hagiri, itsuki, sensui


write_voice:
	LDY #$02F8
	CMP #$005F
	BCC +
	LDA #$0000
+
	JSR hex2dec
	LDA $4214
	ASL
	TAX
	LDA number,x
	TYX
	STA $7E2100,x
	INC
	STA $7E2140,x
	INY #2
	LDA $4216
	ASL
	TAX
	LDA number,x
	TYX
	STA $7E2100,x
	INC
	STA $7E2140,x
	RTS
	
write_bgm:
	LDY #$02F8
	CMP #$000A
	BCC +
	LDA #$0000
+
	JSR hex2dec
	LDA $4214
	ASL
	TAX
	LDA number,x
	TYX
	STA $7E2000,x
	INC
	STA $7E2040,x
	INY #2
	LDA $4216
	ASL
	TAX
	LDA number,x
	TYX
	STA $7E2000,x
	INC
	STA $7E2040,x	
	RTS

hex2dec:	
	STA $4204
	SEP #$20
	LDA #$0A
	STA $4206
	REP #$20
	NOP #3
	RTS


number:
	dw $20C4, $20C6, $20C8, $20CA, $20CC, $20CE
	dw $20D0, $20D2, $20D4, $20D6, $20D8

load_name1:
	PHB
	LDA #$7E7E
	PHA
	PLB #2
	LDY #$0120
	LDA $0248
	ASL #6
	TAX
-
	LDA name_table2,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$0140
	BNE -	
	LDY #$0160
-
	LDA name_table2,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$0180
	BNE -				
	LDY #$01A0
-
	LDA name_table2,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$01C0
	BNE -		
	LDY #$01E0
-
	LDA name_table2,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$0200
	BNE -	
	PLB
	JML $89E3BD
	
load_name2:
	PHB
	LDA #$7E7E
	PHA
	PLB #2
	LDY #$0140
	LDA $0248
	ASL #6
	TAX
-
	LDA name_table3,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$0160
	BNE -	
	LDY #$0180
-
	LDA name_table3,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$01A0
	BNE -				
	LDY #$01C0
-
	LDA name_table3,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$01E0
	BNE -		
	LDY #$0200
-
	LDA name_table3,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$0220
	BNE -	
	PLB
	JML $89E389
	
load_name3:
	PHB
	LDA #$7E7E
	PHA
	PLB #2
	LDY #$0120
	LDA $0248
	ASL #6
	TAX
-
	LDA name_table2,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$0140
	BNE -	
	LDY #$0160
-
	LDA name_table2,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$0180
	BNE -				
	LDY #$01A0
-
	LDA name_table2,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$01C0
	BNE -		
	LDY #$01E0
-
	LDA name_table2,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$0200
	BNE -	
	PLB
	JML $89E302
	
load_name4:
	PHB
	LDA #$7E7E
	PHA
	PLB #2
	LDY #$0140
	LDA $024A
	ASL #6
	TAX
-
	LDA name_table3,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$0160
	BNE -	
	LDY #$0180
-
	LDA name_table3,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$01A0
	BNE -				
	LDY #$01C0
-
	LDA name_table3,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$01E0
	BNE -		
	LDY #$0200
-
	LDA name_table3,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$0220
	BNE -	
	PLB
	JML $89E32A
	
load_name5:
	PHB
	LDA #$7E7E
	PHA
	PLB #2
	LDY #$0120
	LDA $0248
	ASL #6
	TAX
-
	LDA name_table2,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$0140
	BNE -	
	LDY #$0160
-
	LDA name_table2,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$0180
	BNE -				
	LDY #$01A0
-
	LDA name_table2,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$01C0
	BNE -		
	LDY #$01E0
-
	LDA name_table2,x
	STA $2000,y
	INY #2
	INX #2
	CPY #$0200
	BNE -	
	PLB
	JML $89E3F2
	
name_table2:
	dw $0000, $0000, $0000, $0000, $0000, $21AE, $21B0, $21B2		//nazo
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $21AF, $21B1, $21B3
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $22D0, $22D2, $22D4, $22D6, $22D8, $22DA, $22DC		
	dw $22DE, $22E0, $22E2, $22E4, $0000, $0000, $0000, $0000
	dw $0000, $22D1, $22D3, $22D5, $22D7, $22D9, $22DB, $22DD		
	dw $22DF, $22E1, $22E3, $22E5, $0000, $0000, $0000, $0000

	dw $0000, $22A4, $22A6, $22A8, $22AA, $22AC, $22AE, $22B0		//yusuke
	dw $22B2, $22B4, $22B6, $22B8, $22BA, $0000, $0000, $0000
	dw $0000, $22A5, $22A7, $22A9, $22AB, $22AD, $22AF, $22B1
	dw $22B3, $22B5, $22B7, $22B9, $22BB, $0000, $0000, $0000

	dw $0000, $21B4, $21B6, $21B8, $21BA, $21BC, $21BE, $21C0		
	dw $21C2, $21C4, $21C6, $21C8, $21CA, $0000, $0000, $0000
	dw $0000, $21B5, $21B7, $21B9, $21BB, $21BD, $21BF, $21C1	
	dw $21C3, $21C5, $21C7, $21C9, $21CB, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $20E2, $20E4, $20E6, $20E8, $20EA		//kuwabara
	dw $20EC, $20EE, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $20E3, $20E5, $20E7, $20E9, $20EB
	dw $20ED, $20EF, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $21CC, $21CE, $21D0, $21D2, $21D4, $21D6		
	dw $21D8, $21DA, $21DC, $21DE, $0000, $0000, $0000, $0000
	dw $0000, $0000, $21CD, $21CF, $21D1, $21D3, $21D5, $21D7	
	dw $21D9, $21DB, $21DD, $21DF, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $20F0, $20F2, $20F4, $20F6		//kurama
	dw $20F8, $20FA, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $20F1, $20F3, $20F5, $20F7
	dw $20F9, $20FB, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $21E0, $21E2, $21E4, $21E6		
	dw $21E8, $21EA, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $21E1, $21E3, $21E5, $21E7		
	dw $21E9, $21EB, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $2106, $2108, $210A		//hiei
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $2107, $2109, $210B
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $21EC, $21EE, $21F0, $21F2		
	dw $21F4, $21F6, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $21ED, $21EF, $21F1, $21F3		
	dw $21F5, $21F7, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $210C, $210E, $2110, $2112		//Genkai
	dw $2114, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $210D, $210F, $2111, $2113
	dw $2115, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $21F8, $21FA, $21FC, $21FE, $2200		
	dw $2202, $2204, $2206, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $21F9, $21FB, $21FD, $21FF, $2201		
	dw $2203, $2205, $2207, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $2128, $212A, $212C		//rinku
	dw $212E, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $2129, $212B, $212D
	dw $212F, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $220E, $2210, $2212, $2214		
	dw $2216, $2218, $221A, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $220F, $2211, $2213, $2215		
	dw $2217, $2219, $221B, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $2130, $2132, $2134		//Toya
	dw $2136, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $2131, $2133, $2135
	dw $2137, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $221C, $221E, $2220, $2222, $2224		
	dw $2226, $2228, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $221D, $221F, $2221, $2223, $2225		
	dw $2227, $2229, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $2138, $213A, $213C		//Jin
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $2139, $213B, $213D
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $229C, $229E, $22A0	
	dw $22A2, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $229D, $229F, $22A1	
	dw $22A3, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $213E, $2140, $2142, $2144, $2146, $2148, $214A		//Shishiwakamaru
	dw $214C, $214E, $2150, $2152, $2154, $0000, $0000, $0000
	dw $0000, $213F, $2141, $2143, $2145, $2147, $2149, $214B
	dw $214D, $214F, $2151, $2153, $2155, $0000, $0000, $0000
	
	dw $222A, $222C, $222E, $2230, $2232, $2234, $2236, $2238
	dw $223A, $223C, $223E, $2240, $2242, $2244, $0000, $0000
	dw $222B, $222D, $222F, $2231, $2233, $2235, $2237, $2239
	dw $223B, $223D, $223F, $2241, $2243, $2245, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $215C, $215E, $2160, $2162		//Karasu
	dw $2164, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $215D, $215F, $2161, $2163
	dw $2165, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $00000, $0000, $22C4, $22C6, $22C8, $22CA
	dw $22CC, $22CE, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $00000, $0000, $22C5, $22C7, $22C9, $22CB
	dw $22CD, $22CF, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $2156, $2158, $215A		//bui
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $2157, $2159, $215B
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $2246, $2248, $224A
	dw $224C, $224E, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $2247, $2249, $224B
	dw $224D, $224F, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $2166, $2168, $216A, $216C, $216E		//toguro ani
	dw $2170, $2172, $2174, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $2167, $2169, $216B, $216D, $216F
	dw $2171, $2173, $2175, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $2250, $2252, $2254, $2256, $2258, $225A, $225C
	dw $225E, $22E6, $22E8, $22EA, $22EC, $22EE, $0000, $0000
	dw $0000, $2251, $2253, $2255, $2257, $2259, $225B, $225D
	dw $225F, $22E7, $22E9, $22EB, $22ED, $22EF, $0000, $0000
	
	dw $0000, $0000, $0000, $2176, $2178, $217A, $217C, $217E		//toguro otouto
	dw $2180, $2182, $2184, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $2177, $2179, $217B, $217D, $217F
	dw $2181, $2183, $2185, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $2250, $2252, $2254, $2256, $2258, $225A
	dw $225C, $225E, $22F0, $22F2, $0000, $0000, $0000, $0000
	dw $0000, $0000, $2251, $2253, $2255, $2257, $2259, $225B
	dw $225D, $225F, $22F1, $22F3, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $2186, $2188, $218A, $218C		//kamiya
	dw $218E, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $2187, $2189, $218B, $218D
	dw $218F, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $2260, $2262, $2264, $2266, $2268
	dw $226A, $226C, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $2261, $2263, $2265, $2267, $2269
	dw $226B, $226D, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $2190, $2192, $2194		//hagiri
	dw $2196, $2198, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $2191, $2193, $2195
	dw $2197, $2199, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $226E, $2270, $2272, $2274
	dw $2276, $2278, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $226F, $2271, $2273, $2275
	dw $2277, $2279, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $219A, $219C, $219E		//itsuki
	dw $21A0, $21A2, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $219B, $219D, $219F
	dw $21A1, $21A3, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $227A, $227C
	dw $227E, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $227B, $227D
	dw $227F, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $21A4, $21A6, $21A8, $21AA		//sensui
	dw $21AC, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $21A5, $21A7, $21A9, $21AB
	dw $21AD, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $2280, $2282, $2284, $2286, $2288
	dw $228A, $228C, $228E, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $2281, $2283, $2285, $2287, $2289
	dw $228B, $228D, $228F, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $22BC, $22BE, $22C0		//youko
	dw $22C2, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $22BD, $22BF, $22C1
	dw $22C3, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $2290, $2292, $2294, $2296
	dw $2298, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $2291, $2293, $2295, $2297
	dw $2299, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $2116, $2118, $211A, $211C, $211E, $2120		//Genkai wakai
	dw $2122, $2124, $2126, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $2117, $2119, $211B, $211D, $211F, $2121
	dw $2123, $2125, $2127, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $21F8, $21FA, $21FC, $21FE, $2200, $2202, $2204		
	dw $2206, $2208, $220A, $220C, $0000, $0000, $0000, $0000
	dw $0000, $21F9, $21FB, $21FD, $21FF, $2201, $2203, $2205		
	dw $2207, $2209, $220B, $220D, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $2176, $2178, $217A, $217C, $217E		//toguro otouto 100%
	dw $2180, $2182, $2184, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $2177, $2179, $217B, $217D, $217F
	dw $2181, $2183, $2185, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $2250, $2252, $2254, $2256, $2258, $225A, $225C
	dw $225E, $22F4, $22F6, $22F8, $22FA, $0000, $0000, $0000
	dw $0000, $2251, $2253, $2255, $2257, $2259, $225B, $225D
	dw $225F, $22F5, $22F7, $22F9, $22FB, $0000, $0000, $0000
	
name_table3:
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $21AE		//nazo
	dw $21B0, $21B2, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $21AF
	dw $21B1, $21B3, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $22D0, $22D2, $22D4, $22D6, $22D8		
	dw $22DA, $22DC, $22DE, $22E0, $22E2, $22E4, $0000, $0000
	dw $0000, $0000, $0000, $22D1, $22D3, $22D5, $22D7, $22D9		
	dw $22DB, $22DD, $22DF, $22E1, $22E3, $22E5, $0000, $0000

	dw $0000, $0000, $0000, $22A4, $22A6, $22A8, $22AA, $22AC		//yusuke
	dw $22AE, $22B0, $22B2, $22B4, $22B6, $22B8, $22BA, $0000
	dw $0000, $0000, $0000, $22A5, $22A7, $22A9, $22AB, $22AD
	dw $22AF, $22B1, $22B3, $22B5, $22B7, $22B9, $22BB, $0000

	dw $0000, $0000, $0000, $21B4, $21B6, $21B8, $21BA, $21BC		
	dw $21BE, $21C0, $21C2, $21C4, $21C6, $21C8, $21CA, $0000
	dw $0000, $0000, $0000, $21B5, $21B7, $21B9, $21BB, $21BD	
	dw $21BF, $21C1, $21C3, $21C5, $21C7, $21C9, $21CB, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $20E2, $20E4, $20E6		//kuwabara
	dw $20E8, $20EA, $20EC, $20EE, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $20E3, $20E5, $20E7	
	dw $20E9, $20EB, $20ED, $20EF, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $21CC, $21CE, $21D0, $21D2
	dw $21D4, $21D6, $21D8, $21DA, $21DC, $21DE, $0000, $0000
	dw $0000, $0000, $0000, $0000, $21CD, $21CF, $21D1, $21D3
	dw $21D5, $21D7, $21D9, $21DB, $21DD, $21DF, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $20F0, $20F2		//kurama
	dw $20F4, $20F6, $20F8, $20FA, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $20F1, $20F3
	dw $20F5, $20F7, $20F9, $20FB, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $21E0, $21E2	
	dw $21E4, $21E6,	$21E8, $21EA, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $21E1, $21E3
	dw $21E5, $21E7, $21E9, $21EB, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $2106		//hiei
	dw $2108, $210A, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $2107
	dw $2109, $210B, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $21EC, $21EE	
	dw $21F0, $21F2,	$21F4, $21F6, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $21ED, $21EF	
	dw $21F1, $21F3,	$21F5, $21F7, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $210C, $210E		//Genkai
	dw $2110, $2112, $2114, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $210D, $210F
	dw $2111, $2113, $2115, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $21F8, $21FA, $21FC	
	dw $21FE, $2200,	$2202, $2204, $2206, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $21F9, $21FB, $21FD		
	dw $21FF, $2201, $2203, $2205, $2207, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $2128		//rinku
	dw $212A, $212C, $212E, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $2129
	dw $212B, $212D, $212F, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $220E, $2210	
	dw $2212, $2214, $2216, $2218, $221A, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $220F, $2211	
	dw $2213, $2215, $2217, $2219, $221B, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $2130		//Toya
	dw $2132, $2134, $2136, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $2131
	dw $2133, $2135, $2137, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $221C, $221E, $2220		
	dw $2222, $2224, $2226, $2228, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $221D, $221F, $2221		
	dw $2223, $2225, $2227, $2229, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $2138		//Jin
	dw $213A, $213C, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $2139
	dw $213B, $213D, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $229C	
	dw $229E, $22A0, $22A2, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $229D	
	dw $229F, $22A1, $22A3, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $213E, $2140, $2142, $2144, $2146		//Shishiwakamaru
	dw $2148, $214A, $214C, $214E, $2150, $2152, $2154, $0000
	dw $0000, $0000, $0000, $213F, $2141, $2143, $2145, $2147
	dw $2149, $214B, $214D, $214F, $2151, $2153, $2155, $0000
	
	dw $0000, $0000, $222A, $222C, $222E, $2230, $2232, $2234
	dw $2236, $2238, $223A, $223C, $223E, $2240, $2242, $2244
	dw $0000, $0000, $222B, $222D, $222F, $2231, $2233, $2235
	dw $2237, $2239, $223B, $223D, $223F, $2241, $2243, $2245
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $215C, $215E		//Karasu
	dw $2160, $2162, $2164, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $215D, $215F
	dw $2161, $2163, $2165, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $00000, $0000, $22C4, $22C6
	dw $22C8, $22CA, $22CC, $22CE, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $00000, $0000, $22C5, $22C7
	dw $22C9, $22CB, $22CD, $22CF, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $2156		//bui
	dw $2158, $215A, $0000, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $2157
	dw $2159, $215B, $0000, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $2246
	dw $2248, $224A, $224C, $224E, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $2247
	dw $2249, $224B, $224D, $224F, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $2166, $2168, $216A		//toguro ani
	dw $216C, $216E, $2170, $2172, $2174, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $2167, $2169, $216B
	dw $216D, $216F, $2171, $2173, $2175, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $2250, $2252, $2254, $2256, $2258
	dw $225A, $225C, $225E, $22E6, $22E8, $22EA, $22EC, $22EE
	dw $0000, $0000, $0000, $2251, $2253, $2255, $2257, $2259
	dw $225B, $225D, $225F, $22E7, $22E9, $22EB, $22ED, $22EF
	
	dw $0000, $0000, $0000, $0000, $0000, $2176, $2178, $217A		//toguro otouto
	dw $217C, $217E, $2180, $2182, $2184, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $2177, $2179, $217B
	dw $217D, $217F, $2181, $2183, $2185, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $2250, $2252, $2254, $2256
	dw $2258, $225A, $225C, $225E, $22F0, $22F2, $0000, $0000
	dw $0000, $0000, $0000, $0000, $2251, $2253, $2255, $2257
	dw $2259, $225B, $225D, $225F, $22F1, $22F3, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $2186, $2188		//kamiya
	dw $218A, $218C, $218E, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $2187, $2189
	dw $218B, $218D, $218F, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $2260, $2262, $2264
	dw $2266, $2268, $226A, $226C, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $2261, $2263, $2265
	dw $2267, $2269, $226B, $226D, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $2190		//hagiri
	dw $2192, $2194, $2196, $2198, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $2191
	dw $2193, $2195, $2197, $2199, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $226E, $2270
	dw $2272, $2274, $2276, $2278, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $226F, $2271
	dw $2273, $2275, $2277, $2279, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $219A		//itsuki
	dw $219C, $219E, $21A0, $21A2, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $219B
	dw $219D, $219F, $21A1, $21A3, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $227A, $227C, $227E, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dw $227B, $227D, $227F, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $21A4, $21A6		//sensui
	dw $21A8, $21AA, $21AC, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $21A5, $21A7
	dw $21A9, $21AB, $21AD, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $2280, $2282, $2284
	dw $2286, $2288, $228A, $228C, $228E, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $2281, $2283, $2285
	dw $2287, $2289, $228B, $228D, $228F, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $22BC		//youko
	dw $22BE, $22C0, $22C2, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $22BD
	dw $22BF, $22C1, $22C3, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $0000, $2290, $2292
	dw $2294, $2296, $2298, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $0000, $2291, $2293
	dw $2295, $2297, $2299, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $2116, $2118, $211A, $211C		//Genkai wakai
	dw $211E, $2120, $2122, $2124, $2126, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $2117, $2119, $211B, $211D
	dw $211F, $2121, $2123, $2125, $2127, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $21F8, $21FA, $21FC, $21FE, $2200	
	dw $2202, $2204, $2206, $2208, $220A, $220C, $0000, $0000
	dw $0000, $0000, $0000, $21F9, $21FB, $21FD, $21FF, $2201		
	dw $2203, $2205, $2207, $2209, $220B, $220D, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $2176, $2178, $217A		//toguro otouto 100%
	dw $217C, $217E, $2180, $2182, $2184, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $2177, $2179, $217B
	dw $217D, $217F, $2181, $2183, $2185, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $2250, $2252, $2254, $2256, $2258
	dw $225A, $225C, $225E, $22F4, $22F6, $22F8, $22FA, $0000
	dw $0000, $0000, $0000, $2251, $2253, $2255, $2257, $2259
	dw $225B, $225D, $225F, $22F5, $22F7, $22F9, $22FB, $0000
	
clear_sentaku_map:
	DEC $10
	BNE +
	JSR clear_map
	LDX $04
	INX #2
	STX $04
+
	JML $89B507
	
clear_map:
	LDY #$025F
	PHB
	PEA $7E7E
	PLB #2
	LDA #$0000
	LDX #$26BE
-
	STA $0000,x
	DEX #2
	DEY
	BPL -
	LDX #$2120
-
	STA $0000,x
	INX #2
	CPX #$2224
	BNE -
	PLB
	SEP #$20
	PEA $4300
	PLD
	LDA #$01
	STA $10
	LDA #$18
	STA $11
	LDX #$2000
	STX $12
	LDA #$7E
	STA $14
	LDX #$0800
	STX $15
	PEA $0000
	PLD
	LDA #$80
	STA $0112
	LDA #$02
	TSB $86
	REP #$20
	LDA #$5C00
	STA $D2
	RTS
	
write_mark:
	LDA $024C
	BEQ +
	DEC
	ASL #2
	TAY
-
	LDA $0250,y
	AND #$00FF
	TAX
	LDA mark_pos,x
	TAX
	LDA #$2301
	STA $7E0000,x
	INC
	STA $7E0002,x
	INC
	STA $7E0040,x
	INC
	STA $7E0042,x
	DEY #4
	BPL -
+
	LDA $024E
	BEQ +
	DEC
	ASL #2
	TAY
-
	LDA $0252,y
	AND #$00FF
	TAX
	LDA mark_pos,x
	TAX
	LDA $1010
	BNE _3
	LDA #$2305
	BRA _4
_3:
	LDA #$2B09
_4:
	STA $7E0004,x
	INC
	STA $7E0006,x
	INC
	STA $7E0044,x
	INC
	STA $7E0046,x
	DEY #4
	BPL -
+
	JML $89E693
	
	
mark_pos:
	dw $2316, $22E2, $22EC, $22F6, $2302, $230C
	dw $2422, $242C, $2436, $2442, $244C, $2456
	dw $2562, $256C, $2576, $2582, $258C, $2596
	
rewrite_waku_pointer:
	PHX
	PHY
	CPX #$D9FC
	BEQ +
	LDA $0000,x
	AND #$00FF
	PHA
	STA $50
	INX
-
	LDA $0000,x
	STA $0011,y
	INX #2
	LDA $0000,x
	STA $0013,y
	INX
	LDA $0000,x
	STA $0014,y
	INX #2
	LDA #$FFFF
	STA $001A,y
	TYA
	CLC
	ADC #$0020
	TAY
	DEC $50
	BNE -
	JML $89D81A
+
	LDA $1010
	BEQ +
	LDA $0000,x
	AND #$00FF
	PHA
	STA $50
	INX
-
	LDA $0000,x
	STA $0011,y
	INX #2
	LDA $0000,x
	STA $0013,y
	INX
	LDA $0000,x
	STA $0014,y
	INX #2
	LDA #$FFFF
	STA $001A,y
	TYA
	CLC
	ADC #$0020
	TAY
	DEC $50
	BNE -
	JML $89D81A
+
	LDA #$0002
	PHA
	STA $50
-
	LDA #$3F80
	STA $0011,y
	LDA #(char_sentaku_waku1a)
	STA $0013,y
	SEP #$20
	LDA #$89
	STA $0015,y
	REP #$20
	LDA #$FFFF
	STA $001A,y
	TYA
	CLC
	ADC #$0020
	TAY
	DEC $50
	BNE -
	JML $89D81A
	
key_map:
	LDA #(config_map)
	STA $4302
	LDA #$0800
	STA $4305
	LDA #$1C00
	STA $D0
	LDA #$1801
	STA $4300
	SEP #$20
	LDA.b #(config_map)>>16
	STA $4304
	LDA #$80
	STA $0110
	REP #$20
	LDA #$0001
	TSB $86
	JML $89C5A1
	
load_team_name:
	PHB
	PEA $7E7E
	PLB #2
	LDY #$0160
	LDA $0258
	ASL #5
	TAX
-
	LDA name_table4,x
	STA $2000,y
	INX #2
	INY #2
	CPY #$0180
	BNE -
	LDY #$01A0
-
	LDA name_table4,x
	STA $2000,y
	INX #2
	INY #2
	CPY #$01C0
	BNE -
	
	LDY #$0180
	LDA $025A
	ASL #5
	TAX
-
	LDA name_table4,x
	STA $2000,y
	INX #2
	INY #2
	CPY #$01A0
	BNE -
	LDY #$01C0
-
	LDA name_table4,x
	STA $2000,y
	INX #2
	INY #2
	CPY #$01E0
	BNE -		
	PLB
	JML $89B846
	
name_table4:
	dw $0000, $0000, $0000, $0000, $0000, $230E, $2310, $2312		//nazo
	dw $21AE, $21B0, $21B2, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $230F, $2311, $2313
	dw $21AF, $21B1, $21B3, $0000, $0000, $0000, $0000, $0000

	dw $230E, $2310, $2312, $22A4, $22A6, $22A8, $22AA, $22AC		//yusuke
	dw $22AE, $22B0, $22B2, $22B4, $22B6, $22B8, $22BA, $0000
	dw $230F, $2311, $2313, $22A5, $22A7, $22A9, $22AB, $22AD
	dw $22AF, $22B1, $22B3, $22B5, $22B7, $22B9, $22BB, $0000
	
	dw $0000, $0000, $0000, $230E, $2310, $2312, $20E2, $20E4		//kuwabara
	dw $20E6, $20E8, $20EA, $20EC, $20EE, $0000, $0000, $0000
	dw $0000, $0000, $0000, $230F, $2311, $2313, $20E3, $20E5
	dw $20E7, $20E9, $20EB, $20ED, $20EF, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $230E, $2310, $2312, $20F0, $20F2		//kurama
	dw $20F4, $20F6, $20F8, $20FA, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $230F, $2311, $2313, $20F1, $20F3
	dw $20F5, $20F7, $20F9, $20FB, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $230E, $2310, $2312		//hiei
	dw $2106, $2108, $210A, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $230F, $2311, $2313
	dw $2107, $2109, $210B, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $230E, $2310, $2312, $210C		//Genkai
	dw $210E, $2110, $2112, $2114, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $230F, $2311, $2313, $210D
	dw $210F, $2111, $2113, $2115, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $230E, $2310, $2312, $2128		//rinku
	dw $212A, $212C, $212E, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $230F, $2311, $2313, $2129
	dw $212B, $212D, $212F, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $230E, $2310, $2312, $2130		//Toya
	dw $2132, $2134, $2136, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $230F, $2311, $2313, $2131
	dw $2133, $2135, $2137, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $230E, $2310, $2312		//Jin
	dw $2138, $213A, $213C, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $230F, $2311, $2313
	dw $2139, $213B, $213D, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $230E, $2310, $2312, $213E, $2140, $2142, $2144		//Shishiwakamaru
	dw $2146, $2148, $214A, $214C, $214E, $2150, $2152, $2154
	dw $0000, $230F, $2311, $2313, $213F, $2141, $2143, $2145
	dw $2147, $2149, $214B, $214D, $214F, $2151, $2153, $2155
	
	dw $0000, $0000, $0000, $0000, $230E, $2310, $2312, $215C		//Karasu
	dw $215E, $2160, $2162, $2164, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $230F, $2311, $2313, $215D
	dw $215F, $2161, $2163, $2165, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $0000, $230E, $2310, $2312 		//bui
	dw $2156, $2158, $215A, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $0000, $230F, $2311, $2313
	dw $2157, $2159, $215B, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $230E, $2310, $2312, $2166, $2168, $216A		//toguro ani
	dw $216C, $216E, $2170, $2172, $2174, $0000, $0000, $0000
	dw $0000, $0000, $230F, $2311, $2313, $2167, $2169, $216B
	dw $216D, $216F, $2171, $2173, $2175, $0000, $0000, $0000
	
	dw $0000, $0000, $230E, $2310, $2312, $2176, $2178, $217A		//toguro otouto
	dw $217C, $217E, $2180, $2182, $2184, $0000, $0000, $0000
	dw $0000, $0000, $230F, $2311, $2313, $2177, $2179, $217B
	dw $217D, $217F, $2181, $2183, $2185, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $230E, $2310, $2312, $2186		//kamiya
	dw $2188, $218A, $218C, $218E, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $230F, $2311, $2313, $2187
	dw $2189, $218B, $218D, $218F, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $230E, $2310, $2312, $2190		//hagiri
	dw $2192, $2194, $2196, $2198, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $230F, $2311, $2313, $2191
	dw $2193, $2195, $2197, $2199, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $230E, $2310, $2312, $219A		//itsuki
	dw $219C, $219E, $21A0, $21A2, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $230F, $2311, $2313, $219B
	dw $219D, $219F, $21A1, $21A3, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $230E, $2310, $2312, $21A4		//sensui
	dw $21A6, $21A8, $21AA, $21AC, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $230F, $2311, $2313, $21A5
	dw $21A7, $21A9, $21AB, $21AD, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $0000, $0000, $230E, $2310, $2312, $22BC		//youko
	dw $22BE, $22C0, $22C2, $0000, $0000, $0000, $0000, $0000
	dw $0000, $0000, $0000, $0000, $230F, $2311, $2313, $22BD
	dw $22BF, $22C1, $22C3, $0000, $0000, $0000, $0000, $0000
	
	dw $0000, $0000, $230E, $2310, $2312, $2116, $2118, $211A		//Genkai wakai
	dw $211C, $211E, $2120, $2122, $2124, $2126, $0000, $0000
	dw $0000, $0000, $230F, $2311, $2313, $2117, $2119, $211B
	dw $211D, $211F, $2121, $2123, $2125, $2127, $0000, $0000
	
	dw $0000, $0000, $230E, $2310, $2312, $2176, $2178, $217A		//toguro otouto 100%
	dw $217C, $217E, $2180, $2182, $2184, $0000, $0000, $0000
	dw $0000, $0000, $230F, $2311, $2313, $2177, $2179, $217B
	dw $217D, $217F, $2181, $2183, $2185, $0000, $0000, $0000

clear_dantaisen_txtmap:
	LDX $04
	INX #2
	STX $04
	PHB
	PEA $7E7E
	PLB #2
	LDY #$025F
	LDX #$26BE
	LDA #$0000
-
	STA $0000,x
	DEX #2
	DEY
	BPL -
	
	LDX #$2160
-
	STA $0000,x
	INX #2
	CPX #$21E0
	BNE -
	PLB
	SEP #$20
	PEA $4300
	PLD
	LDA #$01
	STA $10
	LDA #$18
	STA $11
	LDX #$2000
	STX $12
	LDA #$7E
	STA $14
	LDX #$0800
	STX $15
	PEA $0000
	PLD
	LDA #$80
	STA $0112
	LDA #$02
	TSB $86
	REP #$20
	LDA #$5C00
	STA $00D2
	JML $89B969
	
clear_dantaisen_txtmap_finish:
	PHB
	PEA $7E7E
	PLB #2
	LDY #$025F
	LDX #$26BE
	LDA #$0000
-
	STA $0000,x
	DEX #2
	DEY
	BPL -
	
	LDX #$2160
-
	STA $0000,x
	INX #2
	CPX #$21E0
	BNE -
	PLB
	SEP #$20
	PEA $4300
	PLD
	LDA #$01
	STA $10
	LDA #$18
	STA $11
	LDX #$2000
	STX $12
	LDA #$7E
	STA $14
	LDX #$0800
	STX $15
	PEA $0000
	PLD
	LDA #$80
	STA $0112
	LDA #$02
	TSB $86
	REP #$20
	LDA #$5C00
	STA $00D2
	LDA #$0080
	JML $89BA8B
	
patch_waku:
	LDA $000D,x
	STA $0003,x
	LDA $000F,x
	STA $0005,x
	DEC $0238
	LDA $0238
	CMP #$FFFF
	BEQ +
	JML $89D04C
+
	LDA #$0000
	STA $0238
	JML $89D04C
	
tournament_text:
	LDX $0228
	LDA tournament_text_ptr,x
	CLC
	ADC $022A
	TAX
	JMP ($0000,x)
	
tournament_text_ptr:
	dw kaisen1
	dw kaisen2
	dw kaisen3
	dw kaisen4
tournament:
kaisen1:
	dw narrator_18
	dw narrator_19
	dw narrator_20
	dw narrator_21
	dw narrator_22
	dw narrator_23
	dw narrator_24
	dw narrator_25
kaisen2:
	dw narrator_29
	dw narrator_30
	dw narrator_32
	dw narrator_26
kaisen3:
	dw narrator_33
	dw narrator_34
kaisen4:
	dw narrator_35
	
narrator_18:
	LDA #(narrator18)
+
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F04D
narrator_19:
	LDA #(narrator19)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F04D
narrator_20:
	LDA #(narrator20)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F04D
narrator_21:
	LDA #(narrator21)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F04D
narrator_22:
	LDA #(narrator22)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F04D
narrator_23:
	LDA #(narrator23)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F04D
narrator_24:
	LDA #(narrator24)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F04D
narrator_25:
	LDA #(narrator25)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F04D
narrator_26:
	LDA #(narrator26)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F04D
narrator_27:
	LDA $0228
	CMP #$0006
	BEQ +
	LDA #(narrator27)
-
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89EA8D
+
	LDA #(narrator28)
	BRA -
narrator_29:
	LDA #(narrator29)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile	
	JML $89F04D
narrator_30:
	LDA #(narrator30)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F04D
narrator_31:
	LDA #(narrator31)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F707
haya_okuri:
	LDA #(narrator31)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F73D
narrator_32:
	LDA #(narrator32)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F04D
narrator_33:
	LDA #(narrator33)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F04D
narrator_34:
	LDA #(narrator34)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F04D
narrator_35:
	LDA #(narrator35)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89F04D
narrator_36:
	LDA #(narrator36)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89EAC2
narrator_37:
	LDA $0212
	STA $0D18
	LDA #(narrator37)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89EAD9
narrator_38:
	LDA #(narrator38)
	SEC
	SBC #(narrator)
	STA {txt_pos}
	LDA #$0005
	STA $0D04
	LDA #$0001
	STA $0D02
	JSR init_narrator_tile
	JML $89EAE4
	
	
dma_end2:
	STZ $0434
	LDA #$1801
	STA $4300
	LDA #$7400
	STA $D0
	LDA #(end2_set)
	STA $4302
	LDA #$1200
	STA $4305
	SEP #$20
	STZ $0110
	LDA.b #(end2_set)>>16
	STA $4304
	LDA #$01
	ORA $86
	STA $86
	REP #$20
	LDA #$FFFF
	STA $7FFFE0
	JML $81A4B2
	
dma_end_tournament_set:
	LDA #$1801
	STA $4300
	LDA #$7400
	STA $D0
	LDA #$1200
	STA $4305
	LDA #(end1_set)
	STA $4302	
	SEP #$20
	LDA.b #(end1_set)>>16
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	ORA $86
	STA $86
	REP #$20
	JML $81A1C8
	
dma_end3:
	LDA $0142
	ASL
	TAX
	JSR (dma_ending,x)
	LDA #$7400
	STA $D0
	LDA #$1801
	STA $4300
	SEP #$20
	LDA.b #(ending0_set)>>16
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	ORA $86
	STA $86
	REP #$20
	LDA $0144
	CMP #$000A
	BCS +
	JSR hex2dec
	LDA $4216
	CLC
	ADC #$25E0
	STA $7FE828
	CLC
	ADC #$0010
	STA $7FE868
	JML $81A534
+	
	CMP #$0064
	BCS +
	JSR hex2dec
	LDA $4214
	CLC
	ADC #$25E0
	STA $7FE828
	CLC
	ADC #$0010
	STA $7FE868
	LDA $4216
	CLC
	ADC #$25E0
	STA $7FE82A
	CLC
	ADC #$0010
	STA $7FE86A
	JML $81A534
+
	CMP #$03E8
	BCS +
-
	JSR hex2dec
	LDA $4216
	CLC
	ADC #$25E0
	STA $7FE82C
	CLC
	ADC #$0010
	STA $7FE86C
	LDA $4214
	JSR hex2dec
	LDA $4214
	CLC
	ADC #$25E0
	STA $7FE828
	CLC
	ADC #$0010
	STA $7FE868
	LDA $4216
	CLC
	ADC #$25E0
	STA $7FE82A
	CLC
	ADC #$0010
	STA $7FE86A
	JML $81A534
+
	LDA #$03E7
	BRA -
	
dma_ending:
	dw ending0
	dw ending1
	dw ending2
	dw ending3
	dw ending4
	
ending0:
	LDA #(ending0_set)
	STA $4302
	LDA #$1200
	STA $4305
	RTS
ending1:
	LDA #(ending1_set)
	STA $4302
	LDA #$1200
	STA $4305
	RTS
ending2:
	LDA #(ending2_set)
	STA $4302
	LDA #$1200
	STA $4305
	RTS
ending3:
	LDA #(ending3_set)
	STA $4302
	LDA #$1200
	STA $4305
	RTS
ending4:
	LDA #(ending4_set)
	STA $4302
	LDA #$1200
	STA $4305
	RTS
	
dma_eisuji:
	LDA $7FFFE0
	CMP #$FFFF
	BNE +
	LDA #$0000
	STA $7FFFE0
	LDA #(eisuji)
	STA $4302
	LDA #$1801
	STA $4300
	LDA #$0200
	STA $4305
	LDA #$7F00
	STA $D0
	SEP #$20
	LDA #$80
	STA $0110
	LDA.b #(eisuji)>>16
	STA $4304
	LDA #$01
	ORA $86
	STA $86
	REP #$20	
+
	LDX $04
	INX #2
	STX $04
	JML $81A4EC
	
recolor_ending:
	LDX #$0000
-
	LDA $7FE812,x
	ORA #$0C00
	STA $7FE812,x
	LDA $7FE852,x
	ORA #$0C00
	STA $7FE852,x
	INX #2
	CPX #$000A
	BNE -
	JML $81A5B0
	
finish_souatari:
	JSR check_end_pad
	BCC +
	LDA #$0090
	JSL $80FA65
	LDX $04
	INX #2
	STX $04
+
	JML $89C0CC
	
check_end_pad:
	LDA $68
	CMP #$3000
	BEQ +
	CLC
	RTS
+
	SEC
	RTS
	
define ending_jun $1E10
	
dma_ending_set:
	LDA $1E04
	BEQ dma_clear
	CMP #$0001
	BEQ dma_end
	CMP #$FFFF
	BEQ dma_first
	TAY
	LDA #$00C0
	LDX #$0060
	JSL $8091F2
	LDA $1E02
	CMP #$AA53
	BNE +
	LDA #$0000
	STA {ending_jun}
	BRA char_ippan
+
	LDA {ending_jun}
char_ippan:
	ASL
	TAX
	JSR (dma_gekishu,x)
	LDA #$80
	STA $0110
	LDA #$01
	ORA $86
	STA $86
	REP #$20
	LDA #$1801
	STA $4300
	LDA #$0C00
	STA $4305
	LDA #$7400
	STA $D0
	INC {ending_jun}
	JML $81A2B6
	
dma_clear:
	TAY
	JML $81A2C4
dma_end:
	TAY
	JML $81A2CD
dma_first:
	LDA $1E10
	BNE +
	LDA #$1801
	STA $4300
	LDA #$0C00
	STA $4305
	LDA #$7400
	STA $D0
	LDA #(gekishu00_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu00_set)>>16
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	ORA $86
	STA $86
	REP #$20
	JML $81A2B6
+
	LDA #$1801
	STA $4300
	LDA #$0C00
	STA $4305
	LDA #$7400
	STA $D0
	LDA #(gekishu20_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu20_set)>>16
	STA $4304
	LDA #$80
	STA $0110
	LDA #$01
	ORA $86
	STA $86
	REP #$20
	JML $81A2B6
	
dma_gekishu:
	dw gekishu01
	dw gekishu02
	dw gekishu03
	dw gekishu04
	dw gekishu05
	dw gekishu06
	dw gekishu07
	dw gekishu08
	dw gekishu09
	dw gekishu10
	dw gekishu11
	dw gekishu12
	dw gekishu13
	dw gekishu14
	dw gekishu15
	dw gekishu16
	dw gekishu17
	dw gekishu18
	dw gekishu19
	dw gekishu21
	dw gekishu22
	dw gekishu23
	dw gekishu24
	dw gekishu25
	dw gekishu26
	dw gekishu27
	dw gekishu28
	dw gekishu29
	dw gekishu30
	dw gekishu31
	dw gekishu32
	dw gekishu33
	dw gekishu34
	dw gekishu35
	dw gekishu36
	dw gekishu37
	dw gekishu38
	dw gekishu39
	dw gekishu40
	dw gekishu41
	dw gekishu42
	
	
gekishu01:
	LDA #(gekishu01_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu01_set)>>16
	STA $4304
	RTS
gekishu02:
	LDA #(gekishu02_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu02_set)>>16
	STA $4304
	RTS
gekishu03:
	LDA #(gekishu03_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu03_set)>>16
	STA $4304
	RTS
gekishu04:
	LDA #(gekishu04_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu04_set)>>16
	STA $4304
	RTS
gekishu05:
	LDA #(gekishu05_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu05_set)>>16
	STA $4304
	RTS
gekishu06:
	LDA #(gekishu06_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu06_set)>>16
	STA $4304
	RTS
gekishu07:
	LDA #(gekishu07_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu07_set)>>16
	STA $4304
	RTS
gekishu08:
	LDA #(gekishu08_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu08_set)>>16
	STA $4304
	RTS
gekishu09:
	LDA #(gekishu09_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu09_set)>>16
	STA $4304
	RTS
gekishu10:
	LDA #(gekishu10_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu10_set)>>16
	STA $4304
	RTS
gekishu11:
	LDA #(gekishu11_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu11_set)>>16
	STA $4304
	RTS
gekishu12:
	LDA #(gekishu12_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu12_set)>>16
	STA $4304
	RTS
gekishu13:
	LDA #(gekishu13_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu13_set)>>16
	STA $4304
	RTS
gekishu14:
	LDA #(gekishu14_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu14_set)>>16
	STA $4304
	RTS
gekishu15:
	LDA #(gekishu15_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu15_set)>>16
	STA $4304
	RTS
gekishu16:
	LDA #(gekishu16_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu16_set)>>16
	STA $4304
	RTS
gekishu17:
	LDA #(gekishu17_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu17_set)>>16
	STA $4304
	RTS
gekishu18:
	LDA #(gekishu18_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu18_set)>>16
	STA $4304
	RTS
gekishu19:
	LDA #(gekishu19_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu19_set)>>16
	STA $4304
	RTS
gekishu20:
	LDA #(gekishu20_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu20_set)>>16
	STA $4304
	RTS
gekishu21:
	LDA #(gekishu21_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu21_set)>>16
	STA $4304
	RTS
gekishu22:
	LDA #(gekishu22_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu22_set)>>16
	STA $4304
	RTS
gekishu23:
	LDA #(gekishu23_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu23_set)>>16
	STA $4304
	RTS
gekishu24:
	LDA #(gekishu24_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu24_set)>>16
	STA $4304
	RTS
gekishu25:
	LDA #(gekishu25_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu25_set)>>16
	STA $4304
	RTS
gekishu26:
	LDA #(gekishu26_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu26_set)>>16
	STA $4304
	RTS
gekishu27:
	LDA #(gekishu27_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu27_set)>>16
	STA $4304
	RTS
gekishu28:
	LDA #(gekishu28_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu28_set)>>16
	STA $4304
	RTS
gekishu29:
	LDA #(gekishu29_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu29_set)>>16
	STA $4304
	RTS
gekishu30:
	LDA #(gekishu30_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu30_set)>>16
	STA $4304
	RTS
gekishu31:
	LDA #(gekishu31_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu31_set)>>16
	STA $4304
	RTS
gekishu32:
	LDA #(gekishu32_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu32_set)>>16
	STA $4304
	RTS
gekishu33:
	LDA #(gekishu33_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu33_set)>>16
	STA $4304
	RTS
gekishu34:
	LDA #(gekishu34_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu34_set)>>16
	STA $4304
	RTS
gekishu35:
	LDA #(gekishu35_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu35_set)>>16
	STA $4304
	RTS
gekishu36:
	LDA #(gekishu36_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu36_set)>>16
	STA $4304
	RTS
gekishu37:
	LDA #(gekishu37_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu37_set)>>16
	STA $4304
	RTS
gekishu38:
	LDA #(gekishu38_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu38_set)>>16
	STA $4304
	RTS
gekishu39:
	LDA #(gekishu39_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu39_set)>>16
	STA $4304
	RTS
gekishu40:
	LDA #(gekishu40_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu40_set)>>16
	STA $4304
	RTS
gekishu41:
	LDA #(gekishu41_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu41_set)>>16
	STA $4304
	RTS
gekishu42:
	LDA #(gekishu42_set)
	STA $4302
	SEP #$20
	LDA.b #(gekishu42_set)>>16
	STA $4304
	RTS
	
dma_owari:
	REP #$20
	LDA $1E10
	CMP #$0029
	BNE +
	LDX #$0000
-
	LDA owari_set,x
	STA $7FA000,x
	INX #2
	CPX #$0C00
	BNE -	
	LDA #$FFFE
	STA $1E10
+
	SEP #$20
	LDX #$A000
	STX $0C82
	LDA #$7F
	STA $0C84
	JML $82A224
	
hitormiss:
	LDA $68
	CMP #$2020		//sel l
	BNE check2P
	LDA #$0004		//1P kaihi
	STA $046E
	LDX $046C		//1P
	CPY $0414
	BEQ +
	LDX $046E		//2P
+
	JML $82B103
check2P:
	CMP #$2010		//sel r
	BNE +
	LDA #$0000		//1P meichu
	STA $046C
+
	LDX $046C		//1P
	CPY $0414
	BEQ +
	LDX $046E		//2P
+
	JML $82B103		
	
//##################################
// MAIN TEXT
//##################################
define	battle_width		$7E0150
define	battle_shift			$7E0152
define	battle_tile			$7E0154
define	small_x					$7E0156
define	battle_counter	$7E0158
define	fnt_dat					$7E015A
define	name_pos			$7E015C
define	battle_text_pos	$7E015E
define	kasuri_flag			$1E0C
define	battle_save_a		$1E0E

text_shori:
	STY {battle_save_a}
	LDA $D542,y
	STA {battle_text_pos}
read_text:
	LDA {battle_text_pos}
	TAX
	LDA battle_text,x
	CMP #$FFFF
	BNE +
	LDA #$0000
	STA {battle_tile}
	STA {battle_shift}
	STA {small_x}
	STA {battle_save_a}
	JML $82D9F5
+
	PHB
	CMP #$1000
	BCC vwf_routine
	CMP #$2000
	BCS load_furigana
	JML $82D9D2
load_furigana:
	AND #$00FF
	ASL #5
	ADC #(furigana)
	TAX
	LDA $20
	LSR
	CLC
	ADC #$2BC0
	TAY
	LDA #$001F
	MVN $C0, $7E
	PLB
	LDA {battle_text_pos}
	INC #2
	STA {battle_text_pos}
	BRA read_text
vwf_routine:
	CMP #$00AF
	BNE +
	JMP char_name
+
	CMP #$00B0
	BNE +
	JMP char_name2
+
	JSR shift_font
	PLB
	LDA {battle_text_pos}
	INC #2
	STA {battle_text_pos}
	LDA #$0000
	STA {battle_counter}
	LDA {battle_tile}
	ASL #3
	CLC
	ADC {battle_shift}
	CLC
	ADC {battle_width}
	PHA
	AND #$0007
	STA {battle_shift}
	PLA
	LSR #3
	CMP {battle_tile}
	BEQ old_battle_tile
	STA {battle_tile}
	LDA {small_x}
	CLC
	ADC #$0010
	STA {small_x}
old_battle_tile:
	JMP read_text
	
shift_font:
	PHA
	TAX
	LDA battle_font_width,x
	AND #$00FF
	STA {battle_width}
	PLA
	ASL #4
	TAX
	LDA {small_x}
	STA $20
loop:
	PHX
	LDA {battle_shift}
	TAY
	LDA battle_font,x	//fnt data
	AND #$00FF
	XBA
check1:
	CPY #$0000
	BEQ next1
	LSR
	DEY
	BRA check1
next1:
	SEP #$20
	XBA
	LDX $20
	ORA $7E2A00,x
	STA $7E2A00,x
	XBA
	ORA $7E2A10,x
	STA $7E2A10,x		
	REP #$20
	PLX
	LDA {battle_shift}
	TAY
	LDA battle_font+1,x
	AND #$00FF
	XBA
check2:
	CPY #$0000
	BEQ next2
	LSR
	DEY
	BRA check2
next2:
	SEP #$20
	XBA
	PHX
	LDX $20
	ORA $7E2A01,x
	STA $7E2A01,x
	XBA
	STA $7E2A11,x
	REP #$20
	PLX
	INX #2
	INC $20
	INC $20
	LDA {battle_counter}
	INC #2
	STA {battle_counter}
	CMP #$0010
	BNE loop
	RTS
	
define kyouhanshou_flag	$7FFFC0
	
char_name2:
	LDA $0416
	CMP $0400
	BNE +
	LDA #$0000
	STA {kyouhanshou_flag}
+
	LDA {kyouhanshou_flag}
	CMP #$FFFF
	BNE +
	LDY $0400
	LDA #$0000
	STA {kyouhanshou_flag}
	BRA kyouhanshou
+
	LDY $0402
kyouhanshou:
	LDA $0E18,y
	JMP write_name
	
char_name:
	LDY {battle_save_a}
	CPY #$0002
	BNE +
	LDY $0402
	LDA $0E18,y
	JMP write_name
+
	CPY #$0004
	BNE +
	LDY $0402
	LDA $0E18,y
	JMP write_name
+
	CPY #$0008
	BNE +
	LDY $0402
	LDA $0E18,y
	JMP write_name
+
	CPY #$000A
	BNE +
	LDY $0402
	LDA $0E18,y
	JMP write_name
+
	CPY #$000C
	BNE +
	LDY $0402
	LDA $0E18,y
	JMP write_name
+
	CPY #$000E
	BNE +
	LDY $0402
	LDA $0E18,y
	JMP write_name
+
	CPY #$0010
	BNE +
	LDY $0402
	LDA $0E18,y
	JMP write_name
+
	CPY #$002A	//闘気がうすれていく!
	BNE +
	LDY $0402
	LDA $0E18,y
	JMP write_name
+
	CPY #$002C	//命中率が ダウ～ン!!
	BNE +
	LDY $0402
	LDA $0E18,y
	JMP write_name
+
	CPY #$002E	//全身から力がぬけていく!
	BNE +
	LDY $0402
	LDA $0E18,y
	JMP write_name
+
	CPY #$0032	//技が封じられた!
	BNE +
	LDY $0402
	LDA $0E18,y
	JMP write_name
+
	CPY #$0034	//霊撃が封じられた!
	BNE +
	LDY $0402
	LDA $0E18,y
	JMP write_name
+
	CPY #$008A	//体から シマネキ
	BNE +
	LDY $0402
	LDA $0E18,y
	JMP write_name
+
	CPY #$004C
	BNE +
	LDA $0416
	CMP #$0200
	BNE _1
	LDA {kasuri_flag}
	BNE _2
_1:
	LDY $0402
	LDA $0E18,y
	JMP write_name
_2:
	LDA #$0000
	STA {kasuri_flag}	
+
	LDY $0400
	LDA $0E18,y
write_name:
	TAX
	LDA battle_name_ptr,x
	STA {name_pos}
-
	LDA {name_pos}
	TAX
	LDA $E30000,x
	CMP #$FFFF
	BNE +
	PLB
	LDA {battle_text_pos}
	INC #2
	STA {battle_text_pos}
	LDA #$0000
	STA {battle_counter}
	STA {name_pos}
	LDA {battle_tile}
	ASL #3
	CLC
	ADC {battle_shift}
	CLC
	ADC {battle_width}
	PHA
	AND #$0007
	STA {battle_shift}
	PLA
	LSR #3
	CMP {battle_tile}
	BEQ old_battle_tile2
	STA {battle_tile}
	LDA {small_x}
	CLC
	ADC #$0010
	STA {small_x}
old_battle_tile2:
	JMP read_text	
+
	JSR shift_font
	LDA {name_pos}
	INC #2
	STA {name_pos}
	LDA #$0000
	STA {battle_counter}
	LDA {battle_tile}
	ASL #3
	CLC
	ADC {battle_shift}
	CLC
	ADC {battle_width}
	PHA
	AND #$0007
	STA {battle_shift}
	PLA
	LSR #3
	CMP {battle_tile}
	BEQ old_battle_tile3
	STA {battle_tile}
	LDA {small_x}
	CLC
	ADC #$0010
	STA {small_x}
old_battle_tile3:
	JMP -
	
waza_flag:
	LDX $0EA2,y
	STX $0410
	CPX #$D3CA
	BNE +
-
	LDA #$FFFF
	STA {kyouhanshou_flag}
	JML $82A0BE
+
	CPX #$E1E8		//rinku
	BNE +
	BRA -
+
	CPX #$B966		//bui
	BNE +
	BRA -
+
	CPX #$8598
	BNE +
	BRA -
+
	JML $82A0BE
	
reset_waza_flag:
	REP #$20
	LDY $0402
	BNE +
	LDA $0416
	CMP $0400
	BNE +
	LDA #$0000
	STA {kyouhanshou_flag}
+
	JML $8292DF
	
yoko_idou:
	CPY #$0200
	BNE +
	PHA
	LDA $0E2F,y
	JML $828CBF
+
	PHA
	LDA $68
	CMP #$0620
	BNE +
	LDA $0E2F,y
	DEC
	STA $0E2F,y
	JML $828CBF
+
	CMP #$0520
	BNE +
	LDA $0E2F,y
	INC
	STA $0E2F,y
+
	LDA $0E2F,y
	JML $828CBF
	
write_kasuri_flag:
	LDA #$FFFF
	STA {kasuri_flag}
	LDA #$A42F
	STA $0424
	JML $82AD42
	
dma_preset3:
	PHP
	SEP #$20
	REP #$10
	LDX #$1801
	STX $4300
	LDX #(preset3)
	STX $4302
	LDA.b #(preset3)>>16
	STA $4304
	LDX #$0800
	STX $4305
	LDX #$3800
	STX $2116
	LDA #$80
	STA $2115
	LDA #$01
	STA $420B	
	PLP
	RTL
	
kaifuku:
	LDA $0E14
	CMP #$0210	//r hidari
	BNE +
	LDA #$0004	//BP
-
	STA $0E26
return_kaifuku:
	LDA $0448
	BNE _816F
	TYX
	JML $828163
_816F:
	JML $82816F
+
	CMP #$0110	//r migi
	BNE +
	LDA #$0006		//reiki
	BRA -
+
	CMP #$0810	//r ue
	BNE +
	LDA #$0002	//hp
	BRA -
+
	BRA return_kaifuku
	
define color_table $1000
define oam_table $1200
	
kioku:
	LDX #(preset4_set)
	STX $4302
	LDX #$1600
	STX $4305
	LDX #$1801
	STX $4300
	LDX #$0000
	STX $2116
	LDA.b #(preset4_set)>>16
	STA $4304
	LDA #$80
	STA $2115
	LDA #$01
	STA $420B
	
	LDX #$1801
	STX $4300
	LDX #(preset4_map)
	STX $4302
	LDX #$0800
	STX $4305
	LDX #$2000
	STX $2116
	LDA.b #(preset4_map)>>16
	STA $4304
	LDA #$80
	STA $2115
	LDA #$01
	STA $420B	
	
	STZ $210B
	LDA #$09
	STA $2105
	LDA #$20
	STA $2107
	
	LDA #$01
	STA $212C
	
	REP #$20
	LDX #$001E
-
	STZ $00,x
	DEX #2
	BPL -
	JSR initpad
	LDX #$0000
-
	STZ $210D,x
	INX
	CPX #$0009
	BNE -	
	SEP #$20
	LDA #$01
	STA $4200
	LDX #$0000
-
	LDA preset4_col,x
	STA {color_table},x
	INX
	CPX #$0020
	BNE -
	JSR dma_clr
	BRA new_loop
hajimari:
	LDX #$0000
-
	STZ $1FE0,x
	INX #2
	CPX #$0020
	BNE -
	LDX #$1FFF
	TXS
	LDX #$0000
-
	STZ $00,x
	INX #2
	CPX #$1C00
	BNE -
	LDX #$0000
	SEP #$20
	LDA #$80
	STA $2100
	LDX #$81A2
	JSL $808F5C
	JML $0080CC
new_loop:
	JSL wait_end_vblank
	REP #$20
	LDX $00
	JSR (kiokunokanata,x)
	BRA new_loop
	
kiokunokanata:
	dw kioku00
	dw kioku01
	dw kioku02
	dw kioku03
	dw kioku04
	dw kioku05
	dw kioku06
	dw kioku07
	dw kioku08
	dw kioku09
	dw kioku10
	
kioku00:
	SEP #$20
	LDA #$00
	STA $2100
	STA $80
	REP #$20
	LDA #$0008
	STA $02
	STA $04
	INX #2
	STX $00
	RTS
kioku01:
	JSL wait_vblank
	JSR fadein
	LDA $80
	AND #$00FF
	CMP #$000F
	BCS pre_kioku02
	STA $80
	STA $2100
	BRA +
pre_kioku02:
	STA $80
	INX #2
	STX $00
	LDY #$0080
	STY $02
	STY $04
+
	REP #$20
	RTS
kioku02:
	JSL wait_vblank
	DEC $02
	BNE +
	INX #2
	STX $00
	LDA #$0008
	STA $02
	STA $04
+
	RTS

kioku03:
	JSL wait_vblank
	JSR fadeout
	SEP #$20
	LDA $80
	BNE +
	LDA #$80
	STA $80
	STA $2100
	INX #2
	STX $00
+
	REP #$20
	RTS
	
kioku04:
	SEP #$20
	STZ $210D
	STZ $210D
	LDX #$1801
	STX $4300
	LDX #(controller_set)
	STX $4302
	LDX #$3E00
	STX $4305
	LDX #$0000
	STX $2116
	LDA.b #(controller_set)>>16
	STA $4304
	LDA #$80
	STA $2115
	LDA #$01
	STA $420B
	
	LDX #(controller_map)
	STX $4302
	LDX #$0800
	STX $4305
	LDX #$2000
	STX $2116
	LDA.b #(controller_map)>>16
	STA $4304
	LDA #$01
	STA $420B
	
	LDX #$0000
-
	LDA controller_col,x
	STA {color_table},x
	INX
	CPX #$0020
	BNE -
	JSR dma_clr
	LDY #$0008
	STY $02
	STY $04
	STZ $80
	STZ $2100
	REP #$20
	LDA $00
	INC #2
	STA $00
	RTS
	
kioku05:
	JSL wait_vblank
	JSR fadein
	SEP #$20
	LDA $80
	CMP #$0F
	BNE +
	INX #2
	STX $00
	LDX #$00C0
	STX $02	
+
	REP #$20
	RTS
	
kioku06:
	JSL wait_vblank
	DEC $02
	BNE +
	LDA #$0008
	STA $02
	STA $04
	INX #2
	STX $00
+
	RTS
	
kioku07:
	JSL wait_vblank
	JSR fadeout
	SEP #$20
	LDA $80
	BNE +
	LDA #$80
	STA $2100
	STA $80
	LDA #$10
	STA $2107
	JSL init_vram_clr	
	LDA #$14
	STA $212C
	LDX #$0000
-
	LDA shinobu_col,x
	STA {color_table}+0x100,x
	INX 
	CPX #$0020
	BNE -	
	JSR dma_shinobu
	LDA.b #(font0_width)>>16
	STA {width_adr}+2
	REP #$20
	LDA #(font0_width)
	STA {width_adr}
	JSR write_shinobu_col
	JSR clear_set_buffer
	JSR dma_clr
	JSR init_oam
	JSR write_shinobu_haichi
	JSR set_bg3
	LDA #$0008
	STA $02
	STA $04
	LDA #$0000
	STA $80
	LDX $00
	INX #2
	STX $00
+
	REP #$20
	RTS
	
kioku08:
	JSL wait_vblank
	JSR dma_oam_table
	JSR fadein
	SEP #$20
	LDA $80
	CMP #$0F
	BNE +
	LDX $00
	INX #2
	STX $00
	LDX #$0000
	TXY
	STX {txt_pos}
	STX {tile_num}
	STX {tile_vram_size}
	STX $06
	STX {shift}
	STX {width}
	STX {line}
	LDX #$0008
	STX $02
	STX $04
	LDX #$0003
	STX $10
	STX $12
	LDX #$0050
	STX $20
	STX $22
	LDX #$0007
	STX $24
	STX $26
+
	REP #$20
	RTS
	
define serifu_trigger	$08
define serifu_bank		$09
define serifu_adr			$0A
define serifu_size			$0C
define serifu_vram		$0E
	
kioku09:
	JSR check_skip
	JSL serifu_shori
	JSR kuchipaku
	JSR matataki
	JSR matataki2
	JSR change_clr
	JSL wait_vblank
	JSR dma_clr
	JSR dma_oam_table
	JSR dma_serifu
	JSR fetch_pad
	LDA $06
	BEQ +
	LDX $00
	INX #2
	STX $00
	LDA #$0004
	STA $02
	STA $04
+
	RTS
	
kioku10:
	JSL wait_vblank
	JSR dma_oam_table
	JSR fadeout
	SEP #$20
	LDA $80
	BEQ +
	REP #$20
	RTS
+
	JMP hajimari
	
fadein:
	DEC $02
	BNE +
	LDA $04
	STA $02
	SEP #$20
	LDA $80
	INC
	STA $80
	STA $2100
+
	REP #$20
	RTS
	
fadeout:
	DEC $02
	BNE +
	LDA $04
	STA $02
	SEP #$20
	LDA $80
	DEC
	STA $80
	STA $2100
+
	REP #$20
	RTS
	
dma_oam_table:
	PHP
	SEP #$10
	REP #$20
	LDA #$0400
	STA $4300
	LDA #{oam_table}
	STA $4302
	LDX #$7E
	STX $4304
	LDA #$0220
	STA $4305
	STZ $2102
	LDX #$80
	STX $2115
	LDX #$01
	STX $420B
	PLP
	RTS
	
dma_shinobu:
	LDX #$1801
	STX $4300
	LDX #(shinobu_set)
	STX $4302
	LDX #$0000
	STX $2116
	LDX #$1000
	STX $4305
	LDA.b #(shinobu_set)>>16
	STA $4304
	LDA #$80
	STA $2115
	LDA #$01
	STA $420B
	RTS
	
write_shinobu_col:
	LDX #$0000
-
	STZ {color_table},x
	INX #2
	CPX #$0200
	BNE -
	LDX #$0000
-
	LDA shinobu_col,x
	STA {color_table}+0x100,x
	INX #2
	CPX #$0020
	BNE -
	
	SEP #$20
	LDX #$0000
-
	LDA serifu_col,x
	STA {color_table},x
	INX
	CPX #$0020
	BNE -
	REP #$20
	RTS
	
init_oam:
	LDX #$0000
-
	STZ {oam_table},x
	INX #2
	CPX #$0200
	BNE -
	LDA #$0000
-
	STA {oam_table},x
	INX #2
	CPX #$0220
	BNE -
	LDX #$0000
	LDA #$F000
-
	STA {oam_table},x
	INX #4
	CPX #$0200
	BNE -
	RTS
	
write_shinobu_haichi:
	LDX #$0000
-
	LDA shinobu_haichi,x
	STA {oam_table}+0x10,x
	INX #2
	CPX #$0054
	BNE -
	LDX #$0000
	LDA #$AAAA
-
	STA {oam_table}+0x0200,x
	INX #2
	CPX #$0008
	BNE -
	RTS
	

serifu_shori:
	DEC $10
	BEQ +
	RTL
+
	LDA $12
	STA $10
	LDX {txt_pos}
-
	LDA shinobu_serifu,x
	AND #$00FF
	CMP #$00FF
	BEQ end_serifu
	CMP #$00F0
	BCC +
	JSR control_code
	INX
	BRA -
+
	STA {save_a}
	INX
	STX {txt_pos}
	LDA #(font0)
	STA.b {font_ptr}
	SEP #$20
	LDA.b #(font0)>>16
	STA.b {font_ptr}+2
	REP #$20	
	JSR draw_tile
	LDA #$0040
	STA {serifu_size}
	LDA #$0300
	STA {serifu_adr}
	LDA {letter_tile_vram}
	CLC
	ADC #$3010
	STA {serifu_vram}
	SEP #$20
	LDA #$7E
	STA {serifu_bank}
	STA {serifu_trigger}
	REP #$20
	RTL
end_serifu:
	LDA #$FFFF
	STA $06
	LDA #$F000
	STA {oam_table}
	RTL
	
set_bg3:
	SEP #$20
	LDA #$20
	STA $2109
	LDA #$03
	STA $210C
	
	LDX #$1801
	STX $4300
	STX $4310
	LDX #(serifu_map)
	STX $4302
	LDX #(blank)
	STX $4312
	LDX #$0800
	STX $4305
	LDX #$1000
	STX $4315
	LDX #$2000
	STX $2116
	LDA #$80
	STA $2115
	LDA.b #(serifu_map)>>16
	STA $4304
	LDA #$01
	STA $420B
	LDX #$3000
	STX $2116
	LDA.b #(blank)>>16
	STA $4314
	LDA #$02
	STA $420B
	REP #$20
	RTS
	
dma_serifu:
	LDA {serifu_trigger}
	AND #$00FF
	BEQ +
	LDA #$1801
	STA $4300
	LDA {serifu_adr}
	STA $4302
	LDA {serifu_size}
	STA $4305
	LDA {serifu_vram}
	STA $2116
	SEP #$20
	LDA {serifu_bank}
	STA $4304
	LDA #$80
	STA $2115
	LDA #$01
	STA $420B
	STZ {serifu_trigger}
+
	REP #$20
	RTS
	
kuchipaku:
	LDA $06
	CMP #$FFFF
	BEQ end_kuchipaku
	LDA $14
	BNE end_kuchipaku
	DEC $02
	BNE end_kuchipaku
	LDA $04
	STA $02
	LDA {oam_table}
	AND #$FF00
	CMP #$F000
	BNE +
	LDA #$5588
	STA {oam_table}
	LDA #$204E
	STA {oam_table}+2
end_kuchipaku:
	RTS
+
	LDA {oam_table}+2
	CMP #$204E
	BNE +
	LDA #$5588
	STA {oam_table}
	LDA #$2060
	STA {oam_table}+2
	RTS
+
	LDA {oam_table}+2
	CMP #$2060
	BNE +	
	LDA #$5588
	STA {oam_table}
	LDA #$204E
	STA {oam_table}+2
+
	RTS
	
code_clear2:
	LDA #(blank)
	STA {serifu_adr}
	LDA #$1000
	STA {serifu_size}
	LDA #$3000
	STA {serifu_vram}
	STZ {width}
	STZ {line}
	STZ {tile_num}
	STZ {shift}
	PLX
	INX
	STX {txt_pos}
	LDA #(end_narrator)-1
	STA $00,s
	SEP #$20
	LDA.b #(blank)>>16
	STA {serifu_bank}
	STA {serifu_trigger}
	LDA.b #(end_narrator)>>16
	STA $02,s
	REP #$20
	TSC
	DEC
	TCS
	RTL
	
fetch_pad:
	PHP
	SEP #$20
-
	LDA $4212
	AND #$01
	BNE -
	REP #$20
	LDA $4218
	STA $0124
	AND #$000F
	BEQ +
	LDA $0130
	STA $0124
+
	LDA $0124
	EOR $0130
	AND $0124
	STA $0128
	STA $012C
	LDA $0124
	BEQ +
	CMP $0130
	BNE +
	DEC $0136
	BNE _8040
	LDA $0124
	STA $012C
	LDA $0122
	STA $0136
	BRA _8040
+
	LDA $0120
	STA $0136
_8040:
	LDA $0124
	STA $0130
	PLP
	RTS
	
initpad:
	LDX #$0000
-
	STZ $0120,x
	INX #2
	CPX #$0020
	BNE -
	RTS
	
code_pause:
	LDA $0130
	AND #$00FF
	CMP #$0080
	BEQ +
	PLX
	LDA #(end_narrator)-1
	STA $00,s
	SEP #$20
	LDA.b #(end_narrator)>>16
	STA $02,s
	REP #$20
	LDA #$F000
	STA {oam_table}
	STA $14
	TSC
	DEC
	TCS
	RTL
+
	PLX
	INX
	STX {txt_pos}
	LDA #(end_narrator)-1
	STA $00,s
	SEP #$20
	LDA.b #(end_narrator)>>16
	STA $02,s
	REP #$20
	STZ $14
	TSC
	DEC
	TCS
	RTL	
	
check_skip:
	LDA $0130
	CMP #$1000
	BEQ +
	RTS
+
	JMP hajimari
	
matataki:
	DEC $20
	BNE +
	LDA $22
	STA $20
	LDA #$4080
	STA {oam_table}+0x04
	LDA #$2062
	STA {oam_table}+0x06
	LDA #$4090
	STA {oam_table}+0x08
	LDA #$2064
	STA {oam_table}+0x0A
+
	RTS
	
matataki2:
	DEC $24
	BNE +
	LDA $26
	STA $24
	LDA #$F000
	CMP {oam_table}+0x04
	BEQ +
	STA {oam_table}+0x04
	STA {oam_table}+0x08
+
	RTS
	
init_vram_clr:
	LDX #$1801
	STX $4310
	LDX #(blank)
	STX $4312
	LDX #$0000
	STX $2116
	LDX #$8000
	STX $4315
	LDA.b #(blank)>>16
	STA $4314
	LDA #$80
	STA $2115
	LDA #$02
	STA $420B
	
	LDX #$1801
	STX $4310
	LDX #(blank)
	STX $4312
	LDX #$4000
	STX $2116
	LDX #$8000
	STX $4315
	LDA.b #(blank)>>16
	STA $4314
	LDA #$80
	STA $2115
	LDA #$02
	STA $420B
	RTL
	
dma_clr:
	PHP
	SEP #$20
	STZ $2121
	LDX #$2200
	STX $4310
	LDX #{color_table}
	STX $4312
	LDX #$0200
	STX $4315
	LDA #$00
	STA $4314
	LDA #$80
	STA $2115
	LDA #$02
	STA $420B
	PLP
	RTS
	
change_clr:
	LDA $0130
	CMP #$0040
	BNE +
	LDA #$0000
	JMP write_clr
+
	CMP #$4000
	BNE +
	LDA #$0001
	JMP write_clr
+
	CMP #$8000
	BNE +
	LDA #$0002
	JMP write_clr
+
	CMP #$0010
	BNE +
	LDA #$0003
	JMP write_clr	
+
	CMP #$0020
	BNE +
	LDA #$0004
	JMP write_clr		
+
	CMP #$2000
	BNE +
	LDA #$0005
	JMP write_clr
+
	RTS
	
serifu_color:
	dw $FFFF, $001F
	dw $1F7C, $001F
	dw $FF00, $8888
	dw $6EFA, $7C2F
	dw $1F7C, $0000
	dw $FF12, $CC11
	
write_clr:
	ASL #2
	TAX
	LDA serifu_color,x
	STA {color_table}+2
	LDA serifu_color+2,x
	STA {color_table}+4
	RTS
	
tensuhyouji:
	LDX #$04A6
kurikae:
	LDA #$0006
	STA $32
	LDA #$2314
-
	STA $7E2000,x
	STA $7E2024,x
	INC
	STA $7E2040,x
	STA $7E2064,x
	INC
	INX #2
	DEC $32
	BNE -
	LDA $021A
	LDX #$0526
	JSR convert_hex2dec
	LDA $021C
	LDX #$054A
	JSR convert_hex2dec
	JML $89D3A0
	
convert_hex2dec:
	LDY #$0008
	CMP #$0000
	BPL _D0D6
	PHA
	TXA
	SEC
	SBC #$0002
	TAX
	LDA #$22FC
	STA $7E2000,x
	INC
	STA $7E2040,x
	TXA
	CLC
	ADC #$0002
	TAX
	PLA
	EOR #$FFFF
	INC
_D0D6:
	STZ $30
_D0D8:
	CMP $D10F,y
	BCC _D0E5
	SEC
	SBC $D10F,y
	INC $30
	BRA _D0D8
_D0E5:
	PHA
	LDA $30
	ASL
	CLC
	ADC #$20C4
	STA $7E2000,x
	INC
	STA $7E2040,x
	TXA
	CLC
	ADC #$0002
	TAX
	PLA
	DEY #2
	BMI +
	BRA _D0D6
+
	RTS
	
clear_set_buffer:
	LDX #$0000
-
	STZ $0300,x
	INX #2
	CPX #$00C0
	BNE -	
	RTS