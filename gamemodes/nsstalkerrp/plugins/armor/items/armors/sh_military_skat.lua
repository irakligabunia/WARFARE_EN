﻿ITEM.name = "'SKAT-9M' Suit"
ITEM.desc = "A combat suit mostly used by the Ukrainian Military primarily. Fitted with kevlar and ceramic plates to protect the user. "
ITEM.price = 255240
ITEM.ric = 30
ITEM.dmgsteal = 60
ITEM.exRender = false
ITEM.addition = 8
ITEM.weight = 14

ITEM.model = "models/kek1ch/stalker_comander_suit.mdl"
ITEM.width = 2
ITEM.height = 3
ITEM.iconCam = {
	pos = Vector(2, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 8.3
}

ITEM.ArmorFade = {}
ITEM.ArmorFade[FACTION_MILITARY] = {Models = {
"models/spenser/kek1ch/stalker_soldier3c_beret.mdl",
"models/spenser/kek1ch/stalker_soldier_2.mdl"
}}
ITEM.ArmorFade[FACTION_RAIDERS] = {Models = {
"models/spenser/kek1ch/stalker_band_2_mask.mdl"
}}
ITEM.ArmorFade[FACTION_LONER] = {Models = {
"models/spenser/kek1ch/stalker_neytral_exoskeleton.mdl"
}}
ITEM.ArmorFade[FACTION_MERCHANTS] = {Models = {
"models/spenser/kek1ch/stalker_neytral_exoskeleton.mdl"
}}
ITEM.ArmorFade[FACTION_CLEARSKY] = {Models = {
"models/spenser/kek1ch/stalker_neytral_exoskeleton.mdl"
}}
ITEM.ArmorFade[FACTION_FREEDOM] = {Models = {
"models/spenser/kek1ch/stalker_sv_exoskeleton.mdl"
}}
ITEM.ArmorFade[FACTION_DUTY] = {Models = {
"models/spenser/kek1ch/stalker_dolg_exoskeleton.mdl"
}}
ITEM.ArmorFade[FACTION_SCIENTISTS] = {Models = {
"models/spenser/kek1ch/stalker_neytral_exoskeleton.mdl"
}}
ITEM.ArmorFade[FACTION_MONOLIT] = {Models = {
"models/spenser/kek1ch/stalker_mo_exo.mdl"
}}
ITEM.ArmorFade[FACTION_MERCENARIES] = {Models = {
"models/spenser/kek1ch/stalker_ki_exoskeleton.mdl"
}}
ITEM.ArmorFade[FACTION_RENEGAT] = {Models = {

}}
ITEM.ArmorFade[FACTION_NATO] = {Models = {
"models/spenser/kek1ch/nato_exo_vadim.mdl"
}}

local DuseArmor = {
	"plate",
	"armbr",
	"trapk",
	"kevlar",
	"dharmor"
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

			for i = 9, 11 do 
				item.player:getChar():getInv():add(table.Random(DuseArmor)) 
			end
		end
	end,
	
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
