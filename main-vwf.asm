arch snes.cpu
lorom


define	battle_width	$7E0150
define	battle_shift	$7E0152
define	battle_tile		$7E0154
define	small_x	$7E0156
define	battle_counter	$7E0158
define	fnt_dat	$7E015A


org $82D97E
	JML bank
	
org $82D995
	JML furigana
	
org $82D9F5
//	JML end


org $82D9B3
	JML $C090A0
	




org $C090A0
	PHA
	TAX
	LDA $C08F00,x
	AND #$00FF
	STA {battle_width}
	PLA
	ASL
	ASL
	ASL
	ASL
	TAX


	LDA {small_x}
	STA $20
here:
	PHX
	LDA {battle_shift}
	TAY


	LDA $C08000,x	//fnt data
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
	LDA $C08001,x
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
	INX
	INX
	INC $20
	INC $20
	LDA {battle_counter}
	INC
	INC
	STA {battle_counter}
	CMP #$0010
	BNE here


	PLX
	PLB
	INX
	INX
	LDA #$0000
	STA {battle_counter}
	LDA {battle_tile}
	ASL
	ASL
	ASL
	CLC
	ADC {battle_shift}
	CLC
	ADC {battle_width}
	PHA
	AND #$0007
	STA {battle_shift}
	PLA
	LSR
	LSR
	LSR
	CMP {battle_tile}
	BEQ old_battle_tile
	STA {battle_tile}
	LDA {small_x}
	CLC
	ADC #$0010
	STA {small_x}
old_battle_tile:


	JML $82D9B1
	


	
bank:
	LDA $E08000,x
	CMP #$FFFF
	BNE emu_D989
	LDA #$0000
	STA {battle_tile}
	STA {battle_shift}
	STA {small_x}
	JML $82D986
	
emu_D989:
	JML $82D989
	


	
furigana:
	AND #$00FF
	ASL
	ASL
	ASL
	ASL
	ASL
	ADC #$8000
	TAX
	LDA $20
	LSR
	CLC
	ADC #$2BC0
	TAY
	LDA #$001F
	MVN $E1, $7E
	JML $82D9AD
	
	
org $81A805
	// pointer
	
org $809E08
	JML newcode
	
org $C38000	
newcode:
	CPY #$A615
	BNE +
	CPX #$A000
	BNE +	
	LDX #$8000
	STX $30
	LDA #$C0
	STA $32
	LDY #$0000
	LDX #$A000
-	
	LDA [$30],y
	STA $0000,x
	INX
	INY
	CPY #$1000
	BNE -
	RTL
	
	
+
	LDA [$30],y
	INY
	STA $0000,x
	JML $809E0E
