const_value set 2
	const AZALEAMART_CLERK
	const AZALEAMART_COOLTRAINER_M
	const AZALEAMART_BUG_CATCHER
	const AZALEAMART_LADY

AzaleaMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x18e040:
	opentext
	pokemart MARTTYPE_STANDARD, MART_AZALEA
	closetext
	end

CooltrainerMScript_0x18e047:
	jumptextfaceplayer UnknownText_0x18e04d

BugCatcherScript_0x18e04a:
	jumptextfaceplayer UnknownText_0x18e0b6

AzaleaMartLadyScript:
	jumptextfaceplayer AzaleaMartLadyText

UnknownText_0x18e04d:
	text "There's no Great"
	line "Ball here. #"

	para "Balls will have"
	line "to do."

	para "I wish Kurt would"
	line "make me some of"
	cont "his custom Balls."
	done

UnknownText_0x18e0b6:
	text "A Great Ball is"
	line "better for catch-"
	cont "ing #mon than a"
	cont "# Ball."

	para "But Kurt's might"
	line "be better some-"
	cont "times."
	done

AzaleaMartLadyText:
	text "I can buy many"
	line "items at home in"
	cont "Goldenrod City,"

	para "but for boosting"
	line "Fire-type moves,"

	para "nothing beats"
	line "Azalea's Charcoal!"
	done

AzaleaMart_MapEventHeader:
.Warps:
	db 2
	warp_def $7, $2, 3, AZALEA_TOWN
	warp_def $7, $3, 3, AZALEA_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x18e040, -1
	person_event SPRITE_COOLTRAINER_M, 5, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x18e047, -1
	person_event SPRITE_BUG_CATCHER, 2, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BugCatcherScript_0x18e04a, -1
	person_event SPRITE_LADY, 6, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, AzaleaMartLadyScript, -1
