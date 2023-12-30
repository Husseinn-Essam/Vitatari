	
	AREA IMAGESDATA, DATA, READONLY
	
;lable DCD Xsize*Ysize, PixelsperBit
;      DCW Xsize-1, Ysize-1, Color0, Color1

ZERO	DCD 315, 3
		DCW 20, 14, 0x0000, 0xFFFF
		DCD 0x739D18C6, 0x739D6B5C, 0xE7318C5C, 0xE7000000									
												
                                      
ONE		DCD 315, 3
		DCW 20, 14, 0x0000, 0xFFFF
		DCD 0x2108C630, 0x84210842, 0x1084213F, 0xFF800000


TWO		DCD 315, 3
		DCW 20, 14, 0x0000, 0xFFFF
		DCD 0x739D18C4, 0x21098C64, 0x2110843F, 0xFF800000


THREE	DCD 315, 3
		DCW 20, 19, 0x0000, 0xFFFF
		DCD 0x739D18C4, 0x21098C60, 0x84318C5C, 0xE7000000


FOUR	DCD 315, 3
		DCW 20, 14, 0x0000, 0xFFFF
		DCD 0x18C65295, 0x294C631F, 0xFFE10842, 0x10800000


FIVE	DCD 315, 3
		DCW 20, 14, 0x0000, 0xFFFF
		DCD 0xFFFF0843, 0xDEF04210, 0x84318C5C, 0xE7000000


SIX 	DCD 315, 3
		DCW 20, 14, 0x0000, 0xFFFF
		DCD 0xFFFF0843, 0xDEF04210, 0x84318C5C, 0xE7000000


SEVEN	DCD 315, 3
		DCW 20, 14, 0x0000, 0xFFFF
		DCD 0xFFFF18C4, 0x42110842, 0x10842108, 0x42000000


EIGHT	DCD 315, 3
		DCW 20, 14, 0x0000, 0xFFFF
		DCD 0x739D18C6, 0x318B9CE8, 0xC6318C5C, 0xE7000000


NINE	DCD 315, 3
		DCW 20, 14, 0x0000, 0xFFFF
		DCD 0x739D18C6, 0x318BDEF0, 0x84221098, 0xC6000000


SKILL_ISSUE DCD 6325, 5
		DCW 114, 54, 0x0000, 0xF800
		DCD 0x74BA10E9, 0x7421D2E8, 0x43A5D087, 0x4BA110A2, 0x42214484, 0x42890885, 0x12110A24, 0x21984843, 0x30908661, 0x210CC242
		DCD 0x1984840A, 0x89081512, 0x102A2420, 0x544840A8, 0x908E4BBD, 0xFC977BF9, 0x2EF7F25D, 0xEFE4BBDE, 0x00000000, 0x00000000
		DCD 0x00000000, 0x000039CE, 0x97F39D2F, 0xE73A5FCE, 0x74BF9CE9, 0x7A421284, 0x84250908, 0x4A121094, 0x24212846, 0x325C8C64
		DCD 0xB918C972, 0x3192E463, 0x25C8214A, 0x10429420, 0x8528410A, 0x508214A3, 0xB9C67F73, 0x8CFEE719, 0xFDCE33FB, 0x9C678000
                                                                                                                                                                           


GAME_OVER	DCD 5500, 5
		DCW 99, 54, 0x0000, 0xFFFF
		DCD 0x6322F632, 0x2F6322F6, 0x322F6322, 0xF84B6884, 0xB6884B68, 0x84B6884B, 0x68B7AAEB, 0x7AAEB7AA, 0xEB7AAEB7, 0xAAE94A28
		DCD 0x94A2894A, 0x2894A289, 0x4A2864A2, 0xF64A2F64, 0xA2F64A2F, 0x64A2F000, 0x00000000, 0x00000000, 0x00000064, 0x5EE645EE
		DCD 0x645EE645, 0xEE645EE9, 0x45099450, 0x99450994, 0x50994509, 0x929CE929, 0xCE929CE9, 0x29CE929C, 0xE9290A92, 0x90A9290A
		DCD 0x9290A929, 0x0A611E96, 0x11E9611E, 0x9611E961, 0x1E900000



YOU_WIN DCD 4375, 5
		DCW 174, 24, 0x0000, 0xFFFF
		DCD 0x899222E9, 0x3132445D, 0x2626488B, 0xA4C4C911, 0x74989922, 0x2E9314A4, 0x449A6294, 0x88934C52, 0x9112698A, 0x52224D31
		DCD 0x4A4449A5, 0xC948A92C, 0xB9291525, 0x972522A4, 0xB2E4A454, 0x965C948A, 0x92C91291, 0xB2482252, 0x3649044A, 0x46C92089
		DCD 0x48D92411, 0x291B2482, 0x18C22E92, 0x431845D2, 0x486308BA, 0x490C6117, 0x49218C22, 0xE9200000



ARROW	DCD 361, 1
		DCW 18, 18, 0x0000, 0xFFFF
		DCD 0xC0001E00, 0x03F0007F, 0x800FFC01, 0xFFE03FFF, 0x07FFF8FF, 0xFFDFFFFF, 0xFFFF7FFF, 0x8FFFC1FF, 0xE03FF007, 0xF800FC00
		DCD 0x1E000300, 0x00000000



BREAKOUT	DCD 2961, 3
		DCW 140, 20, 0x0000, 0xFFFF
		DCD 0xF3CF9C89, 0xC8BFE79F, 0x3913917F, 0xCF3E7227, 0x22FC5141, 0x14914448, 0xA2822922, 0x88914504, 0x5245113C, 0xF38FB88A
		DCD 0x2279E71F, 0x711444F3, 0xCE3EE228, 0x89145045, 0x24511228, 0xA08A48A2, 0x24514114, 0x914448A2, 0x8228A288, 0x91450451
		DCD 0x4511228A, 0x08A28A22, 0x45141145, 0x14448A28, 0x228A2889, 0x14504514, 0x5113C8BE, 0x8A271C27, 0x917D144E, 0x384F22FA
		DCD 0x289C7080
 


Space_Invaders	DCD 4851, 3
		DCW 230, 20, 0x0000, 0xFFFF
		DCD 0x7BC71CF8, 0xE8A273CF, 0xBC7BDE38, 0xE7C74513, 0x9E7DE3DE, 0xF1C73E3A, 0x289CF3EF, 0x1F045145, 0x00994514, 0x50450822
		DCD 0x8A2804CA, 0x28A28228, 0x41145140, 0x26514514, 0x1141CF3E, 0x83812A8B, 0xE8B8F1CE, 0x79F41C09, 0x545F45C7, 0x8E73CFA0
		DCD 0xE04AA2FA, 0x2E3C7050, 0x4504024D, 0x14514110, 0x42822820, 0x1268A28A, 0x08821411, 0x41009345, 0x14504410, 0xA08A0804
		DCD 0x8948A282, 0x20850450, 0x40244A45, 0x14110428, 0x22820122, 0x5228A088, 0x31411450, 0x09129145, 0x04518A08, 0xA2804894
		DCD 0x8A28228C, 0x50451402, 0x44A45141, 0x145C8227, 0x3E3A2222, 0xF3E89CE4, 0x1139F1D1, 0x11179F44, 0xE72089CF, 0x8E8888BC
		DCD 0xFA270000



CHOOSE_A_GAME	DCD 7375, 5
		DCW 294, 25, 0x0000, 0xFFFF
		DCD 0x6498C778, 0x60C645EC, 0x9318EF0C, 0x18C8BD92, 0x631DE183, 0x1917B24C, 0x63BC3063, 0x22F6498C, 0x77860C64, 0x5F294A50
		DCD 0x812212DA, 0x25294A10, 0x24425B44, 0xA5294204, 0x884B6894, 0xA5284091, 0x096D1294, 0xA5081221, 0x2DA21E94, 0x99C3C5BD
		DCD 0x5743D293, 0x3878B7AA, 0xE87A5267, 0x0F16F55D, 0x0F4A4CE1, 0xE2DEABA1, 0xE9499C3C, 0x5BD574A5, 0x290A0489, 0x4A2894A5
		DCD 0x21409129, 0x451294A4, 0x28122528, 0xA2529485, 0x0244A514, 0x4A5290A0, 0x4894A286, 0x498CE789, 0x0C945EC9, 0x319CF121
		DCD 0x928BD926, 0x339E2432, 0x517B24C6, 0x73C4864A, 0x2F6498CE, 0x7890C945, 0xE0000000


					
	;EXPORT ZERO	
	
	END
