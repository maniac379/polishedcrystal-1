const_value set 2
	const WARMBEACH_SIGHTSEER_M
	const WARMBEACH_LADY1
	const WARMBEACH_COOLTRAINER_M
	const WARMBEACH_COOLTRAINER_F
	const WARMBEACH_SLOWKING
	const WARMBEACH_LASS
	const WARMBEACH_LADY2

WarmBeach_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerSightseermGareth:
	trainer EVENT_BEAT_SIGHTSEERM_GARETH, SIGHTSEERM, GARETH, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "I just picked up"
	line "some useful items"

	para "from the outdoor"
	line "market!"
	done

.BeatenText:
	text "My items weren't"
	line "enough…"
	done

.AfterText:
	text "Even outside of"
	line "battle, these"

	para "items make memor-"
	line "able souvenirs."
	done

TrainerAromaLadyHolly:
	trainer EVENT_BEAT_AROMA_LADY_HOLLY, AROMA_LADY, HOLLY, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "I am at one with"
	line "the aromas of"
	cont "nature."
	done

.BeatenText:
	text "Defeat has its"
	line "own scent…"
	done

.AfterText:
	text "The sense of smell"
	line "is vital to living"
	cont "in nature."
	done

WarmBeachCooltrainermScript:
	jumptextfaceplayer .Text

.Text:
	text "There's a #mon"
	line "here that talks!"

	para "I would never be-"
	line "lieve it if I"

	para "hadn't seen it for"
	line "myself!"
	done

WarmBeachCooltrainerfScript:
	jumptextfaceplayer .Text

.Text:
	text "I've been selected"
	line "as the festival"
	cont "maiden this year,"

	para "so I have to play"
	line "the melody of the"
	cont "Chosen One."

	para "I'm pretty nervous,"
	line "so I came here to"
	cont "practice."
	done

WarmBeachSlowkingScript:
	jumptext .Text

.Text:
	text "I could use"
	line "pants…"
	done

WarmBeachLassScript:
	faceplayer
	opentext
	checkflag ENGINE_SEASHORE_SHELL_BELL
	iftrue .BoughtShellBell
	writetext .Text1
	special PlaceMoneyTopRight
	yesorno
	iffalse .NoBuy
	checkmoney $0, 4000
	if_equal $2, .NotEnoughMoney
	giveitem SHELL_BELL
	iffalse .NoRoom
	setflag ENGINE_SEASHORE_SHELL_BELL
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 4000
	special PlaceMoneyTopRight
	writetext .Text2
	waitbutton
	closetext
	end

.BoughtShellBell:
	writetext .Text3
	waitbutton
	closetext
	end

.NoBuy:
	writetext .Text4
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext .Text5
	waitbutton
	closetext
	end

.NoRoom:
	writetext .Text6
	waitbutton
	closetext
	end

.Text1:
	text "I collect shells"
	line "off the beach and"

	para "turn them into"
	line "Shell Bells."

	para "People say their"
	line "chime is healing."

	para "They're ¥4000"
	line "each. Want one?"
	done

.Text2:
	text "One Shell Bell,"
	line "just for you!"
	done

.Text3:
	text "I only made one"
	line "Shell Bell today…"
	done

.Text4:
	text "That's OK!"
	done

.Text5:
	text "You don't have"
	line "enough money…"
	done

.Text6:
	text "You don't have"
	line "enough room…"
	done

WarmBeachLadyScript:
	jumptextfaceplayer .Text

.Text:
	text "Those islands"
	line "across the water"

	para "are known as the"
	line "temples of Fire,"

	para "Ice, and Light-"
	line "ning."

	para "That's what this"
	line "brochure says,"

	para "but what are they"
	line "for?"
	done

WarmBeachShackSign:
	jumptext .Text

.Text:
	text "Beach Shack"
	done

WarmBeachShrine:
	jumptext .Text

.Text:
	text "It's a shrine"
	line "dedicated to the"

	para "Guardian of the"
	line "Seas."
	done

WarmBeachHiddenPearl:
	dwb EVENT_WARM_BEACH_HIDDEN_PEARL, PEARL

WarmBeach_MapEventHeader:
.Warps:
	db 3
	warp_def $d, $f, 1, WARM_BEACH_SHACK
	warp_def $5, $8, 2, SHAMOUTI_TUNNEL
	warp_def $8, $3, 1, WARM_BEACH_HOUSE

.XYTriggers:
	db 0

.Signposts:
	db 4
	signpost 14, 17, SIGNPOST_READ, WarmBeachShackSign
	signpost 20, 18, SIGNPOST_READ, WarmBeachShrine
	signpost 20, 19, SIGNPOST_READ, WarmBeachShrine
	signpost 20, 6, SIGNPOST_ITEM, WarmBeachHiddenPearl

.PersonEvents:
	db 7
	person_event SPRITE_SIGHTSEER_M, 8, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSightseermGareth, -1
	person_event SPRITE_LADY, 12, 4, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerAromaLadyHolly, -1
	person_event SPRITE_COOLTRAINER_M, 14, 11, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, WarmBeachCooltrainermScript, -1
	person_event SPRITE_COOLTRAINER_F, 20, 22, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, WarmBeachCooltrainerfScript, -1
	person_event SPRITE_SLOWKING, 21, 17, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, WarmBeachSlowkingScript, -1
	person_event SPRITE_LASS, 20, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, WarmBeachLassScript, -1
	person_event SPRITE_LADY, 23, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, WarmBeachLadyScript, -1
