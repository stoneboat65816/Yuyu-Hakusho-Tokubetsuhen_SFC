org $C08000
battle_font:
	incbin "Font/font01.bin"

battle_font_width:
	db $04, $06, $08, $07, $08, $08, $06, $08, $08, $06, $07, $05, $08, $08, $08, $08
	db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $06, $07
	db $07, $07, $08, $07, $08, $07, $08, $07, $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $06, $08, $08, $08, $08, $08, $08, $08, $08, $08, $04, $04, $04, $03, $04
	db $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $07, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06, $06, $05, $05, $02, $07, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $08, $07, $06, $06, $06, $06, $06, $06, $06, $08, $05, $05, $06, $07
	db $05, $06, $06, $06, $08, $06, $07, $07, $06, $06, $08, $08, $08, $07, $06, $04
	db $08, $05, $07, $07, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $04, $06, $06, $08, $06, $06, $08, $08, $08, $08, $08, $08
	
furigana:
	incbin "Font/furigana.bin"


org $C18000
opn_text_0:
	incbin "Opening/0.bin"
opn_text_1:
	incbin "Opening/1.bin"	
opn_text_2:
	incbin "Opening/2.bin"	
opn_text_3:
	incbin "Opening/3.bin"	
opn_text_4:
	incbin "Opening/4.bin"	
opn_text_5:
	incbin "Opening/5.bin"	
opn_text_6:
	incbin "Opening/6.bin"	
opn_text_7:
	incbin "Opening/7.bin"	
opn_text_8:
	incbin "Opening/8.bin"	
opn_text_9:
	incbin "Opening/9.bin"	
	
org $C28000
opn_text_10:
	incbin "Opening/10.bin"	
opn_text_11:
	incbin "Opening/11.bin"
opn_text_12:
	incbin "Opening/12.bin"
intro_bg1_set:
	incbin "Opening/intro_bg1_set.bin"
intro_bg1_col:
	incbin "Opening/intro_bg1_col.bin"
intro_bg1_map:
	incbin "Opening/intro_bg1_map.bin"
	
org $C38000
demo00:
	incbin "Opening/demo00_set.bin"
intro_bg2_map:
	incbin "Opening/intro_bg2_map.bin"
demo01:
	incbin "Opening/demo01_set.bin"
demo02:
	incbin "Opening/demo02_set.bin"
demo03:
	incbin "Opening/demo03_set.bin"
demo04:
	incbin "Opening/demo04_set.bin"
	
org $C48000
demo05:
	incbin "Opening/demo05_set.bin"
demo06:
	incbin "Opening/demo06_set.bin"
demo07:
	incbin "Opening/demo07_set.bin"
demo08:
	incbin "Opening/demo08_set.bin"
demo09:
	incbin "Opening/demo09_set.bin"
	
org $C58000	
demo10:
	incbin "Opening/demo10_set.bin"
demo11:
	incbin "Opening/demo11_set.bin"
demo12:
	incbin "Opening/demo12_set.bin"
demo13:
	incbin "Opening/demo13_set.bin"
demo14:
	incbin "Opening/demo14_set.bin"
	
org $C68000		
demo15:
	incbin "Opening/demo15_set.bin"
demo16:
	incbin "Opening/demo16_set.bin"
demo17:
	incbin "Opening/demo17_set.bin"
demo18:
	incbin "Opening/demo18_set.bin"
demo19:
	incbin "Opening/demo19_set.bin"
	
org $C78000
font0:
	incbin "Font/font0.bin"
font0_width:
	db $08, $08, $08, $08, $08, $08, $09, $08
	db $05, $06, $08, $08, $09, $09, $09, $08
	db $09, $08, $07, $07, $08, $07, $09, $07
	db $08, $08, $09, $07, $07, $07, $07, $07
	db $05, $07, $07, $05, $04, $07, $05, $09
	db $07, $07, $07, $07, $06, $06, $05, $07
	db $07, $09, $07, $07, $07, $08, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $05, $05, $05, $05, $05, $07
	db $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $08, $08, $08
	db $08, $08, $08, $07, $07, $07, $07, $08
	db $04, $0B, $0B, $09, $0B, $07, $07, $07
	db $07, $07, $07, $0B, $0A, $0D, $06, $10
	db $06, $06, $0A, $07, $05, $07, $07, $07
	db $07, $07, $07, $07, $07, $0A, $08, $05
	db $08, $09, $09, $06, $08, $0A, $04, $0B
	db $0A, $07, $0A, $0A, $0B, $0C, $0D, $0B
	db $0B, $0B, $10, $10, $10, $10, $10, $10
	db $0E, $0B, $0E, $0E, $0E, $0F, $0D, $0E
	db $0F, $0F, $0F, $0F, $0D, $0C, $0E, $0C
	
narrator:
narrator00:
	incbin "Narrator/narrator00.bin"
narrator01:
	incbin "Narrator/narrator01.bin"
narrator02:
	incbin "Narrator/narrator02.bin"
narrator03:
	incbin "Narrator/narrator03.bin"
narrator04:
	incbin "Narrator/narrator04.bin"
narrator05:
	incbin "Narrator/narrator05.bin"
narrator06:
	incbin "Narrator/narrator06.bin"
narrator07:
	incbin "Narrator/narrator07.bin"
narrator08:
	incbin "Narrator/narrator08.bin"
narrator09:
	incbin "Narrator/narrator09.bin"
narrator09b:
	incbin "Narrator/narrator09b.bin"
narrator10:
	incbin "Narrator/narrator10.bin"
narrator11:
	incbin "Narrator/narrator11.bin"
narrator12:
	incbin "Narrator/narrator12.bin"
narrator13:
	incbin "Narrator/narrator13.bin"
narrator14:
	incbin "Narrator/narrator14.bin"
narrator15:
	incbin "Narrator/narrator15.bin"
narrator16:
	incbin "Narrator/narrator16.bin"
narrator17:
	incbin "Narrator/narrator17.bin"
narrator18:
	incbin "Narrator/narrator18.bin"
narrator19:
	incbin "Narrator/narrator19.bin"
narrator20:
	incbin "Narrator/narrator20.bin"
narrator21:
	incbin "Narrator/narrator21.bin"
narrator22:
	incbin "Narrator/narrator22.bin"
narrator23:
	incbin "Narrator/narrator23.bin"
narrator24:
	incbin "Narrator/narrator24.bin"
narrator25:
	incbin "Narrator/narrator25.bin"
narrator26:
	incbin "Narrator/narrator26.bin"
narrator27:
	incbin "Narrator/narrator27.bin"
narrator28:
	incbin "Narrator/narrator28.bin"
narrator29:
	incbin "Narrator/narrator29.bin"
narrator30:
	incbin "Narrator/narrator30.bin"
narrator31:
	incbin "Narrator/narrator31.bin"
narrator32:
	incbin "Narrator/narrator32.bin"
narrator33:
	incbin "Narrator/narrator33.bin"
narrator34:
	incbin "Narrator/narrator34.bin"
narrator35:
	incbin "Narrator/narrator35.bin"
narrator36:
	incbin "Narrator/narrator36.bin"
narrator37:
	incbin "Narrator/narrator37.bin"
narrator38:
	incbin "Narrator/narrator38.bin"

	
org $C88000
bg3_map:
	incbin "Tournament/bg3_map.bin"
square00_set:
	incbin "Narrator/square00_set.bin"
square00_col:
	incbin "Narrator/square00_col.bin"
square01_set:
	incbin "Narrator/square01_set.bin"
square01_col:
	incbin "Narrator/square01_col.bin"
square02_set:
	incbin "Narrator/square02_set.bin"
square02_col:
	incbin "Narrator/square02_col.bin"
square03_set:
	incbin "Narrator/square03_set.bin"
square03_col:
	incbin "Narrator/square03_col.bin"
square04_set:
	incbin "Narrator/square04_set.bin"
square04_col:
	incbin "Narrator/square04_col.bin"
square05_set:
	incbin "Narrator/square05_set.bin"
square05_col:
	incbin "Narrator/square05_col.bin"
waku_col:
	incbin "Narrator/waku_col.bin"
config_set:
	incbin "Narrator/config_set.bin"
config_map:
	incbin "Narrator/config_map.bin"
rank_set:
	incbin "Narrator/rank_set.bin"
square06_col:
	incbin "Narrator/square06_col.bin"
square07_col:
	incbin "Narrator/square07_col.bin"
square08_col:
	incbin "Narrator/square08_col.bin"
square09_col:
	incbin "Narrator/square09_col.bin"
square11_col:
	incbin "Narrator/square11_col.bin"

	
org $C98000
square06_set:
	incbin "Narrator/square06_set.bin"
square07_set:
	incbin "Narrator/square07_set.bin"
square08_set:
	incbin "Narrator/square08_set.bin"
square09_set:
	incbin "Narrator/square09_set.bin"
square10_set:
	incbin "Narrator/square10_set.bin"
preset:
	incbin "Narrator/preset.bin"
square11_set:
	incbin "Narrator/square11_set.bin"
square12_set:
	incbin "Narrator/square12_set.bin"
	
org $CA8000
name:
name00:
	incbin "Narrator/name00.bin"
name01:
	incbin "Narrator/name01.bin"
name02:
	incbin "Narrator/name02.bin"
name03:
	incbin "Narrator/name03.bin"
name04:
	incbin "Narrator/name04.bin"
name05:
	incbin "Narrator/name05.bin"
name06:
	incbin "Narrator/name06.bin"
name07:
	incbin "Narrator/name07.bin"
name08:
	incbin "Narrator/name08.bin"
name09:
	incbin "Narrator/name09.bin"
name10:
	incbin "Narrator/name10.bin"
name11:
	incbin "Narrator/name11.bin"
name12:
	incbin "Narrator/name12.bin"
name13:
	incbin "Narrator/name13.bin"
name14:
	incbin "Narrator/name14.bin"
name15:
	incbin "Narrator/name15.bin"
name16:
	incbin "Narrator/name16.bin"
name17:
	incbin "Narrator/name17.bin"
name18:
	incbin "Narrator/name18.bin"
name19:
	incbin "Narrator/name19.bin"

preset2:
	incbin "Narrator/preset2.bin"
square13_set:
	incbin "Narrator/square13_set.bin"
end1_set:
	incbin "Tournament/end1_set.bin"
end1_map:
	incbin "Tournament/end1_map.bin"
end2_set:
	incbin "Tournament/end2_set.bin"
eisuji:
	incbin "Tournament/eisuji.bin"
ending_map:
	incbin "Ending/ending_map.bin"
	
org $CB8000
ending0_set:
	incbin "Tournament/ending0_set.bin"
ending1_set:
	incbin "Tournament/ending1_set.bin"
ending2_set:
	incbin "Tournament/ending2_set.bin"
ending3_set:
	incbin "Tournament/ending3_set.bin"
ending4_set:
	incbin "Tournament/ending4_set.bin"
square14_set:
	incbin "Narrator/square14_set.bin"
square14_col:
	incbin "Narrator/square14_col.bin"
gekishu00_set:
	incbin "Ending/gekishu00_set.bin"
gekishu01_set:
	incbin "Ending/gekishu01_set.bin"
	
org $CC8000
gekishu02_set:
	incbin "Ending/gekishu02_set.bin"
gekishu03_set:
	incbin "Ending/gekishu03_set.bin"
gekishu04_set:
	incbin "Ending/gekishu04_set.bin"
gekishu05_set:
	incbin "Ending/gekishu05_set.bin"
gekishu06_set:
	incbin "Ending/gekishu06_set.bin"
gekishu07_set:
	incbin "Ending/gekishu07_set.bin"
gekishu08_set:
	incbin "Ending/gekishu08_set.bin"
gekishu09_set:
	incbin "Ending/gekishu09_set.bin"
gekishu10_set:
	incbin "Ending/gekishu10_set.bin"
gekishu11_set:
	incbin "Ending/gekishu11_set.bin"
	
org $CD8000
gekishu12_set:
	incbin "Ending/gekishu12_set.bin"
gekishu13_set:
	incbin "Ending/gekishu13_set.bin"
gekishu14_set:
	incbin "Ending/gekishu14_set.bin"
gekishu15_set:
	incbin "Ending/gekishu15_set.bin"
gekishu16_set:
	incbin "Ending/gekishu16_set.bin"
gekishu17_set:
	incbin "Ending/gekishu17_set.bin"
gekishu18_set:
	incbin "Ending/gekishu18_set.bin"
gekishu19_set:
	incbin "Ending/gekishu19_set.bin"	
gekishu20_set:
	incbin "Ending/gekishu20_set.bin"

org $CE8000
gekishu21_set:
	incbin "Ending/gekishu21_set.bin"
gekishu22_set:
	incbin "Ending/gekishu22_set.bin"
gekishu23_set:
	incbin "Ending/gekishu23_set.bin"
gekishu24_set:
	incbin "Ending/gekishu24_set.bin"
gekishu25_set:
	incbin "Ending/gekishu25_set.bin"
gekishu26_set:
	incbin "Ending/gekishu26_set.bin"
gekishu27_set:
	incbin "Ending/gekishu27_set.bin"
gekishu28_set:
	incbin "Ending/gekishu28_set.bin"
	
org $CF8000	
gekishu29_set:
	incbin "Ending/gekishu29_set.bin"
gekishu30_set:
	incbin "Ending/gekishu30_set.bin"
gekishu31_set:
	incbin "Ending/gekishu31_set.bin"
gekishu32_set:
	incbin "Ending/gekishu32_set.bin"
gekishu33_set:
	incbin "Ending/gekishu33_set.bin"
gekishu34_set:
	incbin "Ending/gekishu34_set.bin"
gekishu35_set:
	incbin "Ending/gekishu35_set.bin"
gekishu36_set:
	incbin "Ending/gekishu36_set.bin"
	
org $D08000	
gekishu37_set:
	incbin "Ending/gekishu37_set.bin"
gekishu38_set:
	incbin "Ending/gekishu38_set.bin"
gekishu39_set:
	incbin "Ending/gekishu39_set.bin"
gekishu40_set:
	incbin "Ending/gekishu40_set.bin"
gekishu41_set:
	incbin "Ending/gekishu41_set.bin"
gekishu42_set:
	incbin "Ending/gekishu42_set.bin"
owari_set:
	incbin "Ending/owari_set.bin"
square15_set:
	incbin "Narrator/square15_set.bin"
square15_col:
	incbin "Narrator/square15_col.bin"
	

org $D28000
preset3:
	incbin "Narrator/preset3.bin"
title_map:
	incbin "Opening/title_map.bin"
title_set:
	incbin "Opening/title_set.bin"
title_col:
	incbin "Opening/title_col.bin"


org $D38000
preset4_set:
	incbin "Opening/preset4_set.bin"
preset4_map:
	incbin "Opening/preset4_map.bin"
preset4_col:
	incbin "Opening/preset4_col.bin"
controller_set:
	incbin "Opening/controller_set.bin"
controller_col:
	incbin "Opening/controller_col.bin"
controller_map:
	incbin "Opening/controller_map.bin"
shinobu_haichi:
	incbin "Opening/shinobu_haichi.bin"
serifu_col:
	incbin "Opening/serifu_col.bin"
	
org $D48000
shinobu_set:
	incbin "Opening/shinobu_set.bin"
shinobu_col:
	incbin "Opening/shinobu_col.bin"
serifu_map:
	incbin "Opening/serifu_map.bin"

org $E28000
battle_text:

org $E38000
battle_name_ptr:

org $E48000
shinobu_serifu:


org $E58000
blank:
