ITEM.name = "Rookie starter kit"
ITEM.desc = "BEFORE ACTIVATION, YOU NEED TO EMPTY THE INVENTORY!\n\nIncludes:\nAPS\nTie\nLight armor\nThree boxes of 9x18mm\nMRE\nFirst Aid Kit\n50000 rubles\n\nATTRIBUTES:\n-Personal belonging\n-High value\n-Doesn't fall out!\n-Cannot throw out!"
ITEM.price = 28758
ITEM.exRender = false
ITEM.weight = 10.25

ITEM.model = "models/kek1ch/grooming.mdl"
ITEM.width = 3
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(-292.99362182617, 59.400001525879, 112.69999694824),
	ang = Angle(20.63694190979, -11.464967727661, 0),
	fov = 2.4,
	outline = true,
	outlineColor = Color(129, 194, 0)
}

local WpallerTeam = {
	[FACTION_LONER] = "stalker_normal", 
	[FACTION_RAIDERS] = "bandit_normal", 
	[FACTION_MERCENARIES] = "merc_normal", 
	[FACTION_MILITARY] = "military_berill", 
	[FACTION_RENEGAT] = "stalker_normal", 
	[FACTION_SCIENTISTS] = "stalker_normal", 
	[FACTION_FREEDOM] = "freedom_normal", 
	[FACTION_DUTY] = "dolg_normal",
	[FACTION_NATO] = "nato_normal",
	[FACTION_LASTDAY] = "lastday_normal",
	[FACTION_ADMIN] = "stalker_normal",
	[FACTION_GREH] = "stalker_normal",
	[FACTION_CLEARSKY] = "clearsky_normal"
}

ITEM.functions.Use = {
	onRun = function(item)
		local client = item.player
		client:getChar():getInv():add(WpallerTeam[client:Team()], 1)
		client:getChar():getInv():add("mediumhealth")
		client:getChar():getInv():add("aps")
		client:getChar():getInv():add("9x18")
		client:getChar():getInv():add("9x18")
		client:getChar():getInv():add("9x18")
		client:getChar():getInv():add("rusmre")
		client:getChar():getInv():add("pda")
		client:getChar():getInv():add("tie")
		client:getChar():getInv():add("kowelek")
		client:getChar():giveMoney(50000)
	end
}

ITEM:hook("drop", function(item)
	return false
end)

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory) then
		return true
	end
end

