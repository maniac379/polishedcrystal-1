const_value set 2
	const FUCHSIABILLSPEECHHOUSE_POKEFAN_F
	const FUCHSIABILLSPEECHHOUSE_YOUNGSTER

FuchsiaBillSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanFScript_0x1963bd:
	jumptextfaceplayer UnknownText_0x1963c3

YoungsterScript_0x1963c0:
	jumptextfaceplayer UnknownText_0x1963f9

UnknownText_0x1963c3:
	text "My grandpa is at "
	line "my brother Bill's"
	cont "in Goldenrod City."
	done

UnknownText_0x1963f9:
	text "I saw these weird,"
	line "slow #mon on"
	cont "Cycling Road."
	done

FuchsiaBillSpeechHouse_MapEventHeader:
.Warps:
	db 2
	warp_def $7, $2, 3, FUCHSIA_CITY
	warp_def $7, $3, 3, FUCHSIA_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_POKEFAN_F, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x1963bd, -1
	person_event SPRITE_YOUNGSTER, 4, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x1963c0, -1
