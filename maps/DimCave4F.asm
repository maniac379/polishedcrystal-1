const_value set 2
	const DIMCAVE4F_BOULDER
	const DIMCAVE4F_FALLEN_BOULDER
	const DIMCAVE4F_SCIENTIST1
	const DIMCAVE4F_SCIENTIST2
	const DIMCAVE4F_SUPER_NERD
	const DIMCAVE4F_POKE_BALL1
	const DIMCAVE4F_POKE_BALL2
	const DIMCAVE4F_POKE_BALL3

DimCave4F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 2
	dbw MAPCALLBACK_TILES, .BouldersLand
	dbw MAPCALLBACK_CMDQUEUE, .SetUpStoneTable

.BouldersLand:
	checkevent EVENT_BOULDER_FELL_IN_DIM_CAVE_4F
	iftrue .skip
	changeblock $1a, $18, $c9
	changeblock $4, $18, $b9
.skip
	return

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	dbw CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp
	dw 0 ; filler

.StoneTable:
	stonetable 6, DIMCAVE4F_BOULDER, .Boulder
	db -1

.Boulder:
	disappear DIMCAVE4F_BOULDER
	clearevent EVENT_BOULDER_FELL_IN_DIM_CAVE_3F
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	opentext
	writetext .Text
	waitbutton
	closetext
	end

.Text:
	text "The boulder fell"
	line "through."
	done

TrainerScientistJoseph:
	trainer EVENT_BEAT_SCIENTIST_JOSEPH, SCIENTIST, JOSEPH, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "I'm studying the"
	line "ancient microbes"

	para "preserved in these"
	line "rocks."
	done

.BeatenText:
	text "It feels good to"
	line "get out of the lab"
	cont "and do some field"
	cont "work."
	done

.AfterText:
	text "Water underground"
	line "leaves behind"
	cont "mineral deposits."

	para "Humans mine for"
	line "them, and microbes"
	cont "feed on them."
	done

TrainerScientistNigel:
	trainer EVENT_BEAT_SCIENTIST_NIGEL, SCIENTIST, NIGEL, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "How do we get pow-"
	line "er out of water?"

	para "I'll tell you if"
	line "you can beat me."
	done

.BeatenText:
	text "Yikes! OK, I'll"
	line "tell you."
	done

.AfterText:
	text "The flowing water"
	line "pushes through a"
	cont "water wheel to"

	para "energize a series"
	line "of generators,"

	para "turning kinetic"
	line "energy into elec-"
	cont "trical energy."

	para "Fascinating,"
	line "right?"
	done

DimCave4FSuper_nerdScript:
	jumptextfaceplayer .Text

.Text:
	text "I'm walking along"
	line "the tracks, just"

	para "like in that"
	line "movie!"

	para "…Except I'm in a"
	line "cave… all alone…"

	para "…This isn't fun"
	line "anymore."
	done

DimCave4FFallenBoulderScript:
	jumptext .Text

.Text:
	text "It's stuck on the"
	line "button."
	done

DimCave4FBoulder:
	jumpstd strengthboulder

DimCave4FMaxEther:
	itemball MAX_ETHER

DimCave4FNugget:
	itemball NUGGET

DimCave4FFullRestore:
	itemball FULL_RESTORE

DimCave4FHiddenCalcium:
	dwb EVENT_DIM_CAVE_4F_HIDDEN_CALCIUM, CALCIUM

DimCave4FHiddenXAttack:
	dwb EVENT_DIM_CAVE_4F_HIDDEN_X_ATTACK, X_ATTACK

DimCave4F_MapEventHeader:
.Warps:
	db 6
	warp_def $10, $2, 2, DIM_CAVE_5F
	warp_def $1d, $1b, 3, DIM_CAVE_5F
	warp_def $18, $1b, 4, DIM_CAVE_5F ; hole
	warp_def $5, $5, 1, DIM_CAVE_3F
	warp_def $16, $1c, 2, DIM_CAVE_3F
	warp_def $7, $e, 3, DIM_CAVE_3F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 23, 25, SIGNPOST_ITEM, DimCave4FHiddenCalcium
	signpost 27, 27, SIGNPOST_ITEM, DimCave4FHiddenXAttack

.PersonEvents:
	db 8
	person_event SPRITE_ROCK_BOULDER_FOSSIL, 15, 14, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DimCave4FBoulder, EVENT_BOULDER_IN_DIM_CAVE_4F
	person_event SPRITE_ROCK_BOULDER_FOSSIL, 25, 27, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DimCave4FFallenBoulderScript, EVENT_BOULDER_FELL_IN_DIM_CAVE_4F
	person_event SPRITE_SCIENTIST, 14, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, TrainerScientistJoseph, -1
	person_event SPRITE_SCIENTIST, 2, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerScientistNigel, -1
	person_event SPRITE_SUPER_NERD, 17, 22, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, DimCave4FSuper_nerdScript, -1
	person_event SPRITE_BALL_CUT_FRUIT, 2, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_ITEMBALL, 0, DimCave4FMaxEther, EVENT_DIM_CAVE_4F_MAX_ETHER
	person_event SPRITE_BALL_CUT_FRUIT, 8, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_ITEMBALL, 0, DimCave4FNugget, EVENT_DIM_CAVE_4F_NUGGET
	person_event SPRITE_BALL_CUT_FRUIT, 23, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_ITEMBALL, 0, DimCave4FFullRestore, EVENT_DIM_CAVE_4F_FULL_RESTORE
