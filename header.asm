SECTION "Initalizer",ROM0[$F5]
Initalize_WRAM:
	cpl ; ld a,$FF
	ld hl,_RAM
	.write_FF
	ld [hli],a
	bit 5,h ; cp h,$E0
	jr z,.write_FF
	halt

SECTION "Start",ROM0[$100]
	di
	xor a
	jr Initalize_WRAM

	; $0104-$0133 Nintendo logo !DONT MODIFY!
	DB  $CE,$ED,$66,$66,$CC,$0D,$00,$0B,$03,$73,$00,$83,$00,$0C,$00,$0D
	DB  $00,$08,$11,$1F,$88,$89,$00,$0E,$DC,$CC,$6E,$E6,$DD,$DD,$D9,$99
	DB  $BB,$BB,$67,$63,$6E,$0E,$EC,$CC,$DD,$DC,$99,$9F,$BB,$B9,$33,$3E

	; $0134-$013E Game title
	DB	"           "

	; $013F-$0142 Product code, leave blank
	DB	"    "
		;0123

	; $0143 compatibility mode
	DB	$80	; $00 - DMG 
			; $80 - DMG/GBC
			; $C0 - GBC Only cartridge

	; $0144 (High-nibble of license code - normally $00 if $014B != $33)
	DB	$00

	; $0145 (Low-nibble of license code - normally $00 if $014B != $33)
	DB	$00

	; $0146 (GameBoy/Super GameBoy indicator)
	DB	$00	; $00 - GameBoy

	; $0147 (Cartridge type)
	DB	$00	; $00 - No MBC

	; $0148 (ROM size)
	DB	$00	; $00 - 32 KB = 2 banks

	; $0149 (RAM size)
	DB	$00	; No SRAM

	; $014A (Destination code)
	DB	$01	; $01 - All others
			; $00 - Japan

	; $014B (Licensee code - this _must_ be $33)
	DB	$33	; $33 - Check $0144/$0145 for Licensee code.

	; $014C (Mask ROM version - handled by RGBFIX)
	DB	$00

	; $014D (Complement check - handled by RGBFIX)
	DB	$00

	; $014E-$014F (Cartridge checksum - handled by RGBFIX)
	DW	$00
