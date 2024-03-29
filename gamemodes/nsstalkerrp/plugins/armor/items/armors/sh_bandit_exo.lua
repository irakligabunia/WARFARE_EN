﻿ITEM.name = "'Bandit' Exoskeleton"
ITEM.desc = "An experimental sample of a military exoskeleton. Was never mass-produced due to extraordinary cost and some design flaws. Despite this, it is in demand due to its ability to take on the weight of all carried equipment, and therefore small batches are made in underground facilities outside Ukraine. This specific suit is made for the Bandit faction. \n\nWARNING! \n\n Before disassembling, it is recommended to empty your invetory! \n\nATTRIBUTES: \n-Heavyweight \n-Cam be disassembled with a crowbar \n-Protects against radiation if fitted with CCR"
ITEM.price = 255240
ITEM.ric = 30
ITEM.dmgsteal = 60
ITEM.exRender = false
ITEM.addition = 70
ITEM.weight = 20

ITEM.model = "models/kek1ch/bandit_exo_outfit.mdl"
ITEM.width = 2
ITEM.height = 3
ITEM.iconCam = {
	pos = Vector(-1, 0, 200),
	ang = Angle(90, 0, 180),
	fov = 11
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
"models/spenser/kek1ch/renegat_test_exo_1.mdl"
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
