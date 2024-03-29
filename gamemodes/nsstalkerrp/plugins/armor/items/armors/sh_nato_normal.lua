﻿ITEM.name = "'Peacekeepers' Suit"
ITEM.desc = "A suit rarely used, although sometimes used by the members of the mercenary faction. Offering light protection from everything."
ITEM.price = 21006
ITEM.ric = 25
ITEM.dmgsteal = 45
ITEM.exRender = false
ITEM.addition = 12
ITEM.weight = 4

ITEM.model = "models/kek1ch/merc_outfit.mdl"
ITEM.width = 2
ITEM.height = 3
ITEM.iconCam = {
	pos = Vector(4, 2.5, 200),
	ang = Angle(90, 0, 180),
	fov = 8
}

ITEM.ArmorFade = {}
ITEM.ArmorFade[FACTION_MILITARY] = {Models = {
"models/spenser/kek1ch/soldier_mask_donbass.mdl",
"models/spenser/kek1ch/stalker_soldier1b.mdl",
"models/spenser/kek1ch/stalker_soldier1c.mdl",
"models/spenser/kek1ch/stalker_soldier1g.mdl",
"models/spenser/kek1ch/stalker_militari_1_new.mdl",
"models/spenser/kek1ch/soldier_obichniy_urkain_warrior.mdl"
}}
ITEM.ArmorFade[FACTION_RAIDERS] = {Models = {
"models/spenser/kek1ch/stalker_bandit_2a.mdl", 
"models/spenser/kek1ch/stalker_bandit_2a_gp5.mdl", 
"models/spenser/kek1ch/stalker_bandit_2a_merc.mdl", 
"models/spenser/kek1ch/stalker_band_2_mask.mdl", 
"models/spenser/kek1ch/stalker_bandit2a_old.mdl", 
"models/spenser/kek1ch/stalker_band2a_mask.mdl"
}}
ITEM.ArmorFade[FACTION_LONER] = {Models = {
"models/spenser/kek1ch/stalker_neutral_2.mdl", 
"models/spenser/kek1ch/stalker_neutral_2_gp5.mdl", 
"models/spenser/kek1ch/stalker_neutral_2_mas2.mdl", 
"models/spenser/kek1ch/stalker_neutral_2_mask.mdl", 
"models/spenser/kek1ch/stalker_neutral_2_merc.mdl", 
"models/spenser/kek1ch/stalker_neutral_2_old.mdl", 
"models/spenser/kek1ch/stalker_neutral0a.mdl",
"models/spenser/kek1ch/stalker_neutral0c.mdl",
"models/spenser/kek1ch/stalker_neutral2c.mdl",
"models/spenser/kek1ch/stalker_neutral2gmask2.mdl"
}}
ITEM.ArmorFade[FACTION_MERCHANTS] = {Models = {
"models/spenser/kek1ch/stalker_neutral_2.mdl", 
"models/spenser/kek1ch/stalker_neutral_2_gp5.mdl", 
"models/spenser/kek1ch/stalker_neutral_2_mas2.mdl", 
"models/spenser/kek1ch/stalker_neutral_2_mask.mdl", 
"models/spenser/kek1ch/stalker_neutral_2_merc.mdl", 
"models/spenser/kek1ch/stalker_neutral_2_old.mdl", 
"models/spenser/kek1ch/stalker_neutral0a.mdl",
"models/spenser/kek1ch/stalker_neutral0c.mdl",
"models/spenser/kek1ch/stalker_neutral2c.mdl",
"models/spenser/kek1ch/stalker_neutral2gmask2.mdl"
}}
ITEM.ArmorFade[FACTION_CLEARSKY] = {Models = {
"models/spenser/kek1ch/stalker_nebo_3.mdl"
}}
ITEM.ArmorFade[FACTION_FREEDOM] = {Models = {
"models/spenser/kek1ch/stalker_freedom_2_mas4.mdl", 
"models/spenser/kek1ch/stalker_freedom2b_mas3.mdl", 
"models/spenser/kek1ch/stalker_freedom2b.mdl", 
"models/spenser/kek1ch/stalker_freedom2b_old.mdl", 
"models/spenser/kek1ch/stalker_freedom3a.mdl", 
"models/spenser/kek1ch/stalker_freedom_1.mdl", 
"models/spenser/kek1ch/stalker_freedom_2.mdl", 
"models/spenser/kek1ch/stalker_freedom1a.mdl", 
"models/spenser/kek1ch/stalker_freedom2a_mas2.mdl", 
"models/spenser/kek1ch/stalker_freedom2a_mas3.mdl", 
"models/spenser/kek1ch/stalker_freedom2a_mas3.mdl", 
"models/spenser/kek1ch/stalker_freedom2a_mas4.mdl"
}}
ITEM.ArmorFade[FACTION_DUTY] = {Models = {
"models/spenser/kek1ch/stalker_dolg_2_mas2.mdl", 
"models/spenser/kek1ch/stalker_dolg_2_mas4.mdl", 
"models/spenser/kek1ch/stalker_dolggas2a.mdl", 
"models/spenser/kek1ch/stalker_dolggas_2.mdl", 
"models/spenser/kek1ch/stalker_dolg2a.mdl"
}}
ITEM.ArmorFade[FACTION_SCIENTISTS] = {Models = {
"models/spenser/kek1ch/stalker_ecolog_guard.mdl"
}}
ITEM.ArmorFade[FACTION_MONOLIT] = {Models = {
"models/spenser/kek1ch/stalker_monolith1_gp5.mdl", 
"models/spenser/kek1ch/stalker_monolith1b.mdl", 
"models/spenser/kek1ch/stalker_monolith2a_old.mdl"
}}
ITEM.ArmorFade[FACTION_MERCENARIES] = {Models = {
"models/spenser/kek1ch/stalker_merc_2.mdl", 
"models/spenser/kek1ch/stalker_merc_sun1.mdl", 
"models/spenser/kek1ch/stalker_merc_sun1_old.mdl",
"models/spenser/kek1ch/stalker_merc2b.mdl",
"models/spenser/kek1ch/stalker_merc2a.mdl"
}}
ITEM.ArmorFade[FACTION_RENEGAT] = {Models = {
"models/spenser/kek1ch/renegat_normal_kek1ch.mdl"
}}
ITEM.ArmorFade[FACTION_NATO] = {Models = {
"models/spenser/kek1ch/nato_soldier_spetsnaz_vadim.mdl"
}}

local DuseArmor = {
	"kevlar",
	"armbr",
	"trapk",
	"kevlar",
	"dlarmor"
}

ITEM.functions.duse = {
	name = "disassemble",
	onRun = function(item)
		if (IsValid(item.player) && item.player:Alive()) then
			if not item.player:getChar():getInv():hasItem("crowboar") then
				item.player:notify("You don't have a crowbar!")
				return false
			end
			
			item.player:EmitSound("interface/crowbreak.ogg", 50, 100)
			for i = 6, 7 do
				item.player:getChar():getInv():add(table.Random(DuseArmor))
			end
		end
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
