const_value set 2
	const BLACKTHORNDRAGONSPEECHHOUSE_GRANNY
	const BLACKTHORNDRAGONSPEECHHOUSE_DRATINI

BlackthornDragonSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GrannyScript_0x195949:
	jumptextfaceplayer UnknownText_0x19595c

Dratini:
	opentext
	writetext DratiniText
	cry DRATINI
	waitbutton
	closetext
	end

BlackthornDragonSpeechHouseBookshelf:
	jumpstd difficultbookshelf

UnknownText_0x19595c:
	text "A clan of trainers"
	line "who can freely"

	para "command dragons"
	line "live right here in"
	cont "Blackthorn."

	para "As a result, there"
	line "are many legends"

	para "about dragons in"
	line "this town."
	done

DratiniText:
	text "Dratini: Draa!"
	done

BlackthornDragonSpeechHouse_MapEventHeader:
.Warps:
	db 2
	warp_def $7, $2, 2, BLACKTHORN_CITY
	warp_def $7, $3, 2, BLACKTHORN_CITY

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 1, 7, SIGNPOST_READ, BlackthornDragonSpeechHouseBookshelf

.PersonEvents:
	db 2
	person_event SPRITE_GRANNY, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrannyScript_0x195949, -1
	person_event SPRITE_DRATINI, 5, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Dratini, -1
