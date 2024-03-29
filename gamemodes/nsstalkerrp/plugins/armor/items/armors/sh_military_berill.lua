﻿ITEM.name = "'BERIL-5M' Suit"
ITEM.desc = "A Combat Suit for the Spetsnaz fighters of Ukraine's soldiers in the Zone, a very expensive yet one of the best suits in the Zone"
ITEM.price = 27012
ITEM.ric = 30
ITEM.dmgsteal = 40
ITEM.exRender = false
ITEM.addition = 12
ITEM.weight = 7.84

ITEM.model = "models/kek1ch/spec_sold_outfit.mdl"
ITEM.width = 2
ITEM.height = 3
ITEM.iconCam = {
	pos = Vector(-2, -0.10000000149012, 200),
	ang = Angle(90, 0, 180),
	fov = 8.6
}

ITEM.ArmorFade = {}
ITEM.ArmorFade[FACTION_MILITARY] = {Models = {
"models/spenser/kek1ch/stalker_militari_1_new.mdl",
"models/spenser/kek1ch/soldier_mask_donbass.mdl"
}}
ITEM.ArmorFade[FACTION_RAIDERS] = {Models = {
"models/spenser/kek1ch/stalker_bandita1.mdl",
"models/spenser/kek1ch/stalker_bandit_a.mdl",
"models/spenser/kek1ch/stalker_bandit_1_gas.mdl",
"models/spenser/kek1ch/stalker_bandit_1.mdl"
}}
ITEM.ArmorFade[FACTION_LONER] = {Models = {
"models/spenser/kek1ch/stalker_neutrala6.mdl",
"models/spenser/kek1ch/stalker_neutrala1.mdl",
"models/spenser/kek1ch/stalker_neutral_a.mdl"
}}
ITEM.ArmorFade[FACTION_MERCHANTS] = {Models = {
"models/spenser/kek1ch/stalker_neutrala6.mdl",
"models/spenser/kek1ch/stalker_neutrala1.mdl",
"models/spenser/kek1ch/stalker_neutral_a.mdl"
}}
ITEM.ArmorFade[FACTION_CLEARSKY] = {Models = {
"models/spenser/kek1ch/stalker_nebo_3.mdl"
}}
ITEM.ArmorFade[FACTION_FREEDOM] = {Models = {
"models/spenser/kek1ch/stalker_freedom2b_mask.mdl",
"models/spenser/kek1ch/stalker_freedom_2_old.mdl"
}}
ITEM.ArmorFade[FACTION_DUTY] = {Models = {
"models/spenser/kek1ch/stalker_dolg2a_mas2.mdl",
"models/spenser/kek1ch/stalker_dolg2a_mas4.mdl",
"models/spenser/kek1ch/stalker_dolg2a_mask.mdl",
"models/spenser/kek1ch/stalker_dolg2a_old.mdl",
"models/spenser/kek1ch/stalker_dolg_2.mdl",
"models/spenser/kek1ch/stalker_dolg_2_old.mdl"
}}
ITEM.ArmorFade[FACTION_SCIENTISTS] = {Models = {
"models/spenser/kek1ch/stalker_neutrala6.mdl",
"models/spenser/kek1ch/stalker_neutrala1.mdl",
"models/spenser/kek1ch/stalker_neutral_a.mdl"
}}
ITEM.ArmorFade[FACTION_MONOLIT] = {Models = {
"models/spenser/kek1ch/stalker_monolith_0.mdl"
}}
ITEM.ArmorFade[FACTION_MERCENARIES] = {Models = {
"models/spenser/kek1ch/stalker_mercen2a_mask.mdl",
"models/spenser/kek1ch/stalker_mercen2b_mask.mdl",
"models/spenser/kek1ch/stalker_mercen_2_mask.mdl"
}}
ITEM.ArmorFade[FACTION_RENEGAT] = {Models = {
"models/spenser/kek1ch/renegat_kek1ch_kurtka.mdl"
}}
ITEM.ArmorFade[FACTION_NATO] = {Models = {
"models/spenser/kek1ch/nato_soldier_obichniy_vadim.mdl"
}}

local DuseArmor = {
	"armbr",
	"trapk",
	"dlarmor"
}

ITEM.functions.duse = {
	name = "dissasemble",
	onRun = function(item)
		if (IsValid(item.player) && item.player:Alive()) then
			if not item.player:getChar():getInv():hasItem("crowboar") then
				item.player:notify("You don't have a crowbar!")
				return false
			end
			
			item.player:EmitSound("interface/crowbreak.ogg", 50, 100)

			for i = 1, 2 do
				item.player:getChar():getInv():add(table.Random(DuseArmor))
			end
		end
	end,
	
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}


