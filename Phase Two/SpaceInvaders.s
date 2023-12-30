	INCLUDE Breakout.s

	AREA SPACE_INVADERS, CODE, READONLY

main_Space FUNCTION
		
	BL INITIALIZE_VARIABLES_space
	; BLACK BG
	LDR R10, =BLACK
	MOV R1, R2	; X1 
	MOV R0, R5	; Y1
	ADD R4, R1, #320	; X2
	ADD R3, R0, #240	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; GREEN GOBLIN LEGION
	BL DRAW_LEGION
	
	; SPACESHIP COORDNIATES

	ldr R1, =SPACE_X  	;Space_X = Starting x
	ldr R7, =SPACE_Y	;Space_Y = Starting y
	ldrh r2,[r1]
	ldrh r5 , [r7]
	BL DRAW_SPACESHIP

SpaceGLoop
		LDR R0, =GPIOA_ODR
		ldrh r2, [r0]
		ORR r2, #0x0F00
		STRH R2, [R0]
		;buttons def
		mov r0, #0
		mov r1, #0
		mov r2, #0x0B00	; PA10 input
		mov r3, #0x0D00 ; PA9 input
		mov r4, #0x0E00 ; PA8 input
		; get input
		ldr r0, =GPIOA_IDR
		ldr r1, [r0]
		AND r1, r1, #0x0F00
		CMP r1, r2			;See if Button PA7 is pressed then moves left
		beq Spaceleft
		cmp r1 , r3			;See if Button PA9 is pressed then moves right
		beq Spaceright		
		cmp r1 , r4			;See if Button PA8 is pressed then shoot
		beq Shoot
		MOV R11, #0			;if we don't shoot (PA8 not pressed) reset R11 to 0
		
		
		B BULLET_ANIMATE
Spaceleft
			bl MOVE_SPACE_LEFT
			b BULLET_ANIMATE
Spaceright	
			bl MOVE_SPACE_RIGHT
			b BULLET_ANIMATE
Shoot
;R11 = 1 if PA8 was pressed last loop (for debounce)
			CMP R11, #1
			BEQ BULLET_ANIMATE
			MOV R11, #1
			bl SHOOT_SBULLET
BULLET_ANIMATE
			BL MOVE_BULLET_UP
			bl delay_100_MILLIsecond
			bl delay_100_MILLIsecond
			bl delay_100_MILLIsecond
			bl delay_100_MILLIsecond
			b SpaceGLoop

STOP
	B STOP
    POP {R0-R12, PC}
    ENDFUNC
	
	B DUMMY4	
	LTORG
DUMMY4

DRAW_G_BULLET FUNCTION
	PUSH {r0 - r5, r10, LR}
	; GOBLIN BULLETS
	; R2, R5: (X, Y) TOP LEFT CORNER
	; R10: BULLET COLOR
	MOV R2, #180
	MOV R5, #150
	LDR R10, =GREEN
	
	; HORIZONTAL UPPER RECT
	ADD R1, R2, #0	; X1 
	ADD R0, R5, #0	; Y1
	ADD R4, R1, #5	; X2
	ADD R3, R0, #1	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; HORIZONTAL LOWER RECT
	ADD R1, R2, #1	; X1 
	ADD R0, R5, #2	; Y1
	ADD R4, R1, #3	; X2
	ADD R3, R0, #1	; Y2
	BL DRAW_RECTANGLE_FILLED
	POP {r0 - r5, r10, PC}

DRAW_S_BULLET FUNCTION
	PUSH {r0-r5, r10, LR}
	; R2, R5: (X, Y) TOP LEFT CORNER
	; R10: BULLET COLOR
	
	; CENTRAL SQUARE
	ADD R1, R2, #1	; X1 
	ADD R0, R5, #2	; Y1
	ADD R4, R1, #3	; X2
	ADD R3, R0, #2	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; VERTICAL RECT
	ADD R1, R2, #2	; X1 
	ADD R0, R5, #0	; Y1
	ADD R4, R1, #1	; X2
	ADD R3, R0, #5	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; HORIZONTAL RECT
	ADD R1, R2, #0	; X1 
	ADD R0, R5, #3	; Y1
	ADD R4, R1, #5	; X2
	ADD R3, R0, #0	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	POP {r0-r5, r10, PC}
	ENDFUNC

DRAW_SPACESHIP FUNCTION
	PUSH {R0-R5, R10, LR}
	; SPACESHIP
	; R2, R5: (X, Y) TOP LEFT CORNER
	
	; BOTTOM HORIZONTAL WHITE RECT
	LDR R10, =WHITE
	ADD R1, R2, #3	; X1 
	ADD R0, R5, #21	; Y1
	ADD R4, R1, #15	; X2
	ADD R3, R0, #1	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; MIDDLE HORIZONTAL WHITE RECT
	LDR R10, =WHITE
	ADD R1, R2, #0	; X1 
	ADD R0, R5, #18	; Y1
	ADD R4, R1, #21	; X2
	ADD R3, R0, #2	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; MIDDLE HORIZONTAL BLUE RECT
	LDR R10, =BLUE
	ADD R1, R2, #0	; X1 
	ADD R0, R5, #16	; Y1
	ADD R4, R1, #21	; X2
	ADD R3, R0, #1	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; MIDDLE VERTICAL BLUE OUTLINE
	LDR R10, =BLUE
	ADD R1, R2, #6	; X1 
	ADD R0, R5, #11	; Y1
	ADD R4, R1, #9	; X2
	ADD R3, R0, #4	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; INNER VERTICAL BLUE OUTLINE
	LDR R10, =BLUE
	ADD R1, R2, #8	; X1 
	ADD R0, R5, #4	; Y1
	ADD R4, R1, #5	; X2
	ADD R3, R0, #6	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; POINTY RED HEAD
	LDR R10, =RED
	ADD R1, R2, #9	; X1 
	ADD R0, R5, #0	; Y1
	ADD R4, R1, #3	; X2
	ADD R3, R0, #2	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; LEFT WING RED BLASTERS
	LDR R10, =RED
	ADD R1, R2, #0	; X1 
	ADD R0, R5, #10	; Y1
	ADD R4, R1, #3	; X2
	ADD R3, R0, #5	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; RIGHT WING RED BLASTERS
	LDR R10, =RED
	ADD R1, R2, #18	; X1 
	ADD R0, R5, #10	; Y1
	ADD R4, R1, #3	; X2
	ADD R3, R0, #5	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; LEFT WING WHITE
	LDR R10, =WHITE
	ADD R1, R2, #0	; X1 
	ADD R0, R5, #13	; Y1
	ADD R4, R1, #2	; X2
	ADD R3, R0, #2	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; RIGHT WING WHITE
	LDR R10, =WHITE
	ADD R1, R2, #19	; X1 
	ADD R0, R5, #13	; Y1
	ADD R4, R1, #2	; X2
	ADD R3, R0, #2	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; BOTTOM RED BOOSTERS
	LDR R10, =RED
	ADD R1, R2, #8	; X1 
	ADD R0, R5, #23	; Y1
	ADD R4, R1, #5	; X2
	ADD R3, R0, #1	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; LEFT BLUE BOOSTER
	LDR R10, =BLUE
	ADD R1, R2, #6	; X1 
	ADD R0, R5, #23	; Y1
	ADD R4, R1, #3	; X2
	ADD R3, R0, #0	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; RIGHT BLUE BOOSTER
	LDR R10, =BLUE
	ADD R1, R2, #12	; X1 
	ADD R0, R5, #23	; Y1
	ADD R4, R1, #3	; X2
	ADD R3, R0, #0	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; UPPER WHITE VERTICAL BODY
	LDR R10, =WHITE
	ADD R1, R2, #9	; X1 
	ADD R0, R5, #5	; Y1
	ADD R4, R1, #3	; X2
	ADD R3, R0, #6	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; MIDDLE WHITE VERTICAL BODY
	LDR R10, =WHITE
	ADD R1, R2, #7	; X1 
	ADD R0, R5, #12	; Y1
	ADD R4, R1, #7	; X2
	ADD R3, R0, #5	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; MIDDLE RED DOT
	LDR R10, =RED
	ADD R1, R2, #9	; X1 
	ADD R0, R5, #13	; Y1
	ADD R4, R1, #3	; X2
	ADD R3, R0, #3	; Y2
	BL DRAW_RECTANGLE_FILLED
	POP {R0-R5, R10, PC}
	ENDFUNC
	
DRAW_LEGION FUNCTION
	PUSH {R0-R12, LR}
	; CREATE LEGION OF GOBLINS
	; R2, R5: STARTING X, Y
	LDR R3, =GREEN_GOBLIN_X
	LDR R4, =GREEN_GOBLIN_Y
	MOV R6,#0
	MOV R5, #66		;Y
	MOV R0, #2  ;MOVE VERTICALLY
LEGION_COLUMN
	MOV R2,#24	;X
	MOV R1, #5	;MOVE HORIZONTALLY
LEGION_ROW
	; DRAW GREEN GOBLIN SPRITE
	BL DRAW_GREEN_GOBLIN
	strh R2,[R3,R6]
	strh R5,[R4,R6]
	ldrh R12,[R3,R6]
	add R6,R6,#2
	ADD R2, R2, #49
	SUBS R1,R1,#1
	CMP R1, #0
	BGE LEGION_ROW
	ADD R5, R5, #31
	SUBS R0,R0,#1
	CMP R0, #0
	BGE LEGION_COLUMN
	POP {R0-R12, PC}
	
DEL_GREEN_GOBLIN FUNCTION
	PUSH {R0-R4, R10, LR}
	
	; DELETE GREEN GOBLIN
	; R2, R5: STARTING X, Y OF SPRITE
	
	LDR R10, =BLACK
	MOV R1, R2	; X1 
	MOV R0, R5	; Y1
	ADD R4, R1, #34	; X2
	ADD R3, R0, #21	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R4, R10, PC}
	ENDFUNC

DRAW_GREEN_GOBLIN FUNCTION
	PUSH {R0-R5, R10, LR}
	; GREEN GOBLIN SPRITE
	
	; R2, R5: (X, Y) TOP LEFT CORNER
	; MIDDLE BG GREEN RECTANGLE
	LDR R10, =GREEN
	ADD R1, R2, #0	; X1 
	ADD R0, R5, #8	; Y1
	ADD R4, R1, #34	; X2
	ADD R3, R0, #7	; Y2
	BL DRAW_RECTANGLE_FILLED
	
	; MIDDLE BG RED RECTANGLE
	LDR R10, =RED
	ADD R1, R2, #1	; X1 
	ADD R0, R5, #9	; Y1
	ADD R4, R1, #32	; X2
	ADD R3, R0, #5	; Y2 
	BL DRAW_RECTANGLE_FILLED
	
	; MIDDLE TOP BG GREEN RECTANGLE
	LDR R10, =GREEN
	ADD R1, R2, #2	; X1 
	ADD R0, R5, #3	; Y1
	ADD R4, R1, #30	; X2
	ADD R3, R0, #8	; Y2 
	BL DRAW_RECTANGLE_FILLED
	
	; TOP BG GREEN RECTANGLE
	LDR R10, =GREEN
	ADD R1, R2, #8	; X1 
	ADD R0, R5, #0	; Y1
	ADD R4, R1, #19	; X2
	ADD R3, R0, #3	; Y2 
	BL DRAW_RECTANGLE_FILLED
	
	; LEFT EYE BG RED RECTANGLE
	LDR R10, =RED
	ADD R1, R2, #10	; X1 
	ADD R0, R5, #5	; Y1
	ADD R4, R1, #2	; X2
	ADD R3, R0, #4	; Y2 
	BL DRAW_RECTANGLE_FILLED
	
	; RIGHT EYE BG RED RECTANGLE
	LDR R10, =RED
	ADD R1, R2, #23	; X1 
	ADD R0, R5, #5	; Y1
	ADD R4, R1, #2	; X2
	ADD R3, R0, #4	; Y2 
	BL DRAW_RECTANGLE_FILLED
	
	; 1ST LEG BG RED RECTANGLE
	LDR R10, =GREEN
	ADD R1, R2, #3	; X1 
	ADD R0, R5, #13	; Y1
	ADD R4, R1, #4	; X2
	ADD R3, R0, #8	; Y2 
	BL DRAW_RECTANGLE_FILLED
	
	; 2ND LEG BG RED RECTANGLE
	LDR R10, =GREEN
	ADD R1, R2, #11	; X1 
	ADD R0, R5, #13	; Y1
	ADD R4, R1, #4	; X2
	ADD R3, R0, #8	; Y2 
	BL DRAW_RECTANGLE_FILLED
	
	; 3RD LEG BG RED RECTANGLE
	LDR R10, =GREEN
	ADD R1, R2, #19	; X1 
	ADD R0, R5, #13	; Y1
	ADD R4, R1, #4	; X2
	ADD R3, R0, #8	; Y2 
	BL DRAW_RECTANGLE_FILLED
	
	; 4TH LEG BG RED RECTANGLE
	LDR R10, =GREEN
	ADD R1, R2, #27	; X1 
	ADD R0, R5, #13	; Y1
	ADD R4, R1, #4	; X2
	ADD R3, R0, #8	; Y2 
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R5, R10, PC}
	ENDFUNC		
;###################
	B DUMMY3	
	LTORG
DUMMY3
INITIALIZE_VARIABLES_space	FUNCTION
	PUSH{R0-R12,LR}
	;THIS FUNCTION JUST INITIALIZES ANY VARIABLE IN THE DATASECTION TO ITS INITIAL VALUES
	;ALTHOUGH WE SPECIFIED SOME VALUES IN THE DATA AREA, BUT THEIR VALUES MIGHT BE ALTERED DURING BOOT TIME.
	;SO WE NEED TO IMPLEMENT THIS FUNCTION THAT REINITIALIZES ALL VARIABLES
	ldr r0 , =SPACE_X
	ldr r1 , [r0]
	mov r1 , #250	;starting position y
	str r1, [r0]
	ldr r0 , =SPACE_Y
	ldr r1 , [r0]
	mov r1 , #200	;starting position y
	str r1, [r0]
	;######
	ldr r0 ,=BULLET_MEMORY_X
	mov r1,#0
	ldrh R1,[R8]	;X1
	ldrh R2,[R8,#2] ;X2
	ldrh R3,[R8,#4]	;X3
	ldrh R4,[R8,#6]	;Y1
	ldrh R5,[R8,#8]	;Y2
	ldrh R6,[R8,#10];Y3
	
	;LOADING GREEN GOBLIN COORDINATES
;	ldr r0,=GREEN_GOBLIN_X
;	mov r1,#24
;	mov r2,#0
;storingGreenGoblinX1
;	strh r1,[r0,r2]
;	ADD r2,r2,#12
;	CMP r2,#24
;	BLE storingGreenGoblinX1
;	
;	
;	mov r1,#24
;	mov r2,#0
;storingGreenGoblinX2
;	strh r1,[r0,r2]
;	ADD r2,r2,#12
;	CMP r2,#24
;	BLE storingGreenGoblinX2
;	
;	
;storingGreenGoblinY
	
	;TODO: INITIALIZE STARTING_Y TO 170, NOTICE THAT STARTING_Y IS DECLARED AS 16-BITS
	
	
	POP{R0-R12,PC}
	ENDFUNC
;#########################
COVER_SPACESHIP	FUNCTION
	PUSH{R0-R12,LR}
	
	;SPRITE_X: STARTING X
	;SPRITE_Y: STARTING Y
	;BOTH ARGUMENTS ARE INITIALLY STORED INSIDE THE DATASECTION
	
	;COLOR = [] r10
	;R1 SET X1
	;R0 SET Y1
	;R4 SET X2
	;R3 SET Y2
	
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	ldr r5, =SPACE_X
	ldr r6, =SPACE_Y
	ldrh r1, [r5]
	ldrh r0, [r6]
	mov r4, r1
	add r4, r4, #21	;SpaceShip Width
	mov r3, r0
	add r3, r3, #24 ;SpaceShip Height
	
	
	ldr r10, =BLACK
	BL DRAW_RECTANGLE_FILLED
	
	
	POP{R0-R12,PC}
	ENDFUNC
	

;#####################################
MOVE_SPACE_RIGHT	FUNCTION
	PUSH{R0-R12,LR}
	;CHECK FOR SCREEN BOUNDARIES, IF THE SPRITE TOUCHES A WALL, DON'T MOVE
	ldr r7, =SPACE_X
	ldrh r0, [r7]
	ADD r0, r0, #10 ;move in x axis by 10 pixils
	ldr r1 , = 299	;right screen boundries 
	CMP r0,r1		;Check for collisions
	BGE cancelmovRight
	
	;COVER THE SPACESHIP WITH THE BACKGROUND COLOR
	BL COVER_SPACESHIP
	
	;REDRAW THE SPACESHIP IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION

	; R2, R5: (X, Y) TOP LEFT CORNER
	ldr r6, =SPACE_Y
	ldrh r5, [r6]
	mov r2, r0
	BL DRAW_SPACESHIP
	strh r0, [r7] 	;Update SPAXE_X to new position
	
cancelmovRight

	POP{R0-R12,PC}
	ENDFUNC
;#############
MOVE_SPACE_LEFT	FUNCTION
	PUSH{R0-R12,LR}
	;CHECK FOR SCREEN BOUNDARIES, IF THE SPRITE TOUCHES A WALL, DON'T MOVE
	ldr r7, =SPACE_X
	ldrh r0, [r7]
	SUBS r0, r0, #10 ;move left by 10 pixils
	CMP r0,#0		;check for left screen boundry
	BLE cancelmovLeft
	;COVER THE SPACESHIP WITH THE BACKGROUND COLOR
	BL COVER_SPACESHIP
	
	;REDRAW THE SPACESHIP IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION

	; R2, R5: (X, Y) TOP LEFT CORNER

	ldr r6, =SPACE_Y
	ldrh r5, [r6]	
	mov r2, r0
	BL DRAW_SPACESHIP
	strh r0, [r7]

cancelmovLeft

	POP{R0-R12,PC}
	ENDFUNC
;##########################
SHOOT_SBULLET	FUNCTION
	PUSH{R0-R12,LR}
	
	; R2, R5: (X, Y) TOP LEFT CORNER 
	; R10: BULLET COLOR

	;R8 [R8,2] [R8,4] = X1, X2, X3
	;[R8,6] [R8,8] [R8,10] = Y1, Y2, Y3
	
	ldr R8, =BULLET_MEMORY_X
	ldrh R1, [R8]	;X1
	ldrh R2,[R8,#2] ;X2
	ldrh R3,[R8,#4]	;X3
	ldrh R4,[R8,#6]	;Y1
	ldrh R5,[R8,#8]	;Y2
	ldrh R6,[R8,#10];Y3
	LDR R10, =WHITE
	
;If X = 0 then a bullet can be fired

cmpX1	
	cmp R1,#0	
	bne cmpX2 ;if it can't be fired check the next bullet
	PUSH{R2,R5}
	ldr r7, =SPACE_X
	ldrh r2, [r7]
	ADD r2, r2, #8
	MOV r5,#190
	BL DRAW_S_BULLET
	strh r2,[R8]		;Update the coordinates of the bullet 
	strh r5,[R8,#6]
	POP{R2,R5}
	b noShoot
cmpX2
	cmp R2,#0
	bne cmpX3
	PUSH{R2,R5}
	ldr r7, =SPACE_X
	ldrh r2, [r7]
	ADD r2, r2, #10
	MOV r5,#190
	BL DRAW_S_BULLET
	strh r2,[R8,#2]
	strh r5,[R8,#8]
	POP{R2,R5}
	b noShoot
cmpX3
	cmp R3,#0
	bne noShoot
	PUSH{R2,R5}
	ldr r7, =SPACE_X
	ldrh r2, [r7]
	ADD r2, r2, #10
	MOV r5,#190
	BL DRAW_S_BULLET
	strh r2,[R8,#4]
	strh r5,[R8,#10]
	POP{R2,R5}

noShoot
	POP{R0-R12,PC}
	ENDFUNC	
	
;##########################
MOVE_BULLET_UP FUNCTION
	; R2, R5: (X, Y) TOP LEFT CORNER
	; R10: BULLET COLOR

	;R8 [R8,2] [R8,4] = X1, X2, X3
	;[R8,6] [R8,8] [R8,10] = Y1, Y2, Y3
	PUSH{R0-R12,LR}
	
	MOV R0,#0                  ;To check later if the bullet isn't fired
	ldr R8, =BULLET_MEMORY_X
	ldrh R1, [R8]	;X1
	ldrh R2,[R8,#2] ;X2
	ldrh R3,[R8,#4]	;X3
	ldrh R4,[R8,#6]	;Y1
	ldrh R5,[R8,#8]	;Y2
	ldrh R6,[R8,#10];Y3
cmpX11	
	cmp R1,#0                   ;Check bullet 1 is fired or not
	beq cmpX22					;If bullet 1 isn't fired don't move it
	PUSH{R2,R5}
	MOV r2, R1
	MOV r5, R4
	LDR R10, =BLACK
	BL DRAW_S_BULLET			;Remove the bullet from the old location
	SUB r5, r5, #3				;Move the bullet up
CHECK_COLLISION
	CMP R5, #25					;Check if the bullet reaches the top boundary
	BLE set_X1_0				;Set the X of the first bullet to 0 so that it can be fired again
	LDR R10, =WHITE
	BL DRAW_S_BULLET			;Draw the bullet in new location
	strh r5,[R8,#6]				;Update Y1
	POP{R2,R5}
	b cmpX22
set_X1_0
	strh r0,[r8]
	POP{R2,R5}
	
cmpX22
	cmp R2,#0
	beq cmpX33
	LDR R10, =BLACK
	BL DRAW_S_BULLET
	SUB r5, r5, #3
	CMP R5, #25
	BLE set_X2_0
	LDR R10, =WHITE
	BL DRAW_S_BULLET
	strh r5,[R8,#8]
	b cmpX33
set_X2_0
	strh r0,[r8,#2]
cmpX33
	cmp R3,#0
	beq NoMove
	PUSH{R2,R5}
	MOV r2, R3
	MOV r5, R6
	LDR R10, =BLACK
	BL DRAW_S_BULLET
	SUB r5, r5, #3
	CMP R5, #25
	BLE set_X3_0
	LDR R10, =WHITE
	BL DRAW_S_BULLET
	strh r5,[R8,#10]
	POP{R2,R5}
	b NoMove
set_X3_0
	strh r0,[r8,#4]
	POP{R2,R5}

NoMove
	POP{R0-R12,PC}
	ENDFUNC
	
	END