const_value set 2
	const SAFFRONRICHSPEECHHOUSE_RICH_BOY

SaffronRichSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SaffronRichSpeechHouseRichBoyScript:
	jumptextfaceplayer SaffronRichSpeechHouseRichBoyText

SaffronRichSpeechHouseRichBoyText:
	text "Houses are expen-"
	line "sive in Saffron."

	para "If you want to"
	line "live here, you've"

	para "got to have a lot"
	line "of money, or find"
	cont "a roommate."
	done

SaffronRichSpeechHouse_MapEventHeader:
.Warps:
	db 2
	warp_def $7, $2, 20, SAFFRON_CITY
	warp_def $7, $3, 20, SAFFRON_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_RICH_BOY, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SaffronRichSpeechHouseRichBoyScript, -1
