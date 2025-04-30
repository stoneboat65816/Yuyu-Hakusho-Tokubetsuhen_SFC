org $80D0A3
	JML redraw_title
org $80D125
	JML rewrite_title_col
	
org $80D5CE
	incbin "Opening/star.bin"

	
//####PRESS START###########
org $80D3B4
	LDX #$0100		//opening title press start size
	STX $4305
org $80D3D3
	LDX #$6220	//vram
org $80D3C2
	LDX #(blank)
	STX $4302
	LDA.b #(blank)>>16
	STA $4304
	LDX #$0100
	STX $4305
org $80D403
	LDX #(blank)
	STX $4302
	LDA.b #(blank)>>16
	STA $4304
	LDX #$0100
	STX $4305
	LDX #$6220	//vram
	STX $D0

org $80D550
	LDA #$0038
	STA $40
	LDA #$0030
	STA $42		//star1 pos
	
org $80D561
	LDA #$00C8
	STA $40
	LDA #$0030
	STA $42  //star2 pos
	
