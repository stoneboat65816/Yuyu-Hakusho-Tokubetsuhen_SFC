org $82D97B
	JML text_shori
	
org $818132
	LDA #$25DF	//furigana color
	
org $8FFCD6
	dw $7F6E		//mizu iro
	
org $84EE05
	db $5F
	dw $0056		//ブイ　跳ね返した
	
org $84DDAF
	db $1E
	dw $0056		//凍矢　跳ね返した
	
org $82A0B8
	//JML waza_flag
	
org $8292D3
	//JML reset_waza_flag
	
org $82AD3C
	JML write_kasuri_flag