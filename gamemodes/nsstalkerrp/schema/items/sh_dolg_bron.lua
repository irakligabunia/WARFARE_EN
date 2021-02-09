ITEM.name = "PZD-9d 'Duty Suit'"
ITEM.desc = "The early model of the 'Duty' jumpsuit is a special forces body armor of the PZD-9 series, adapted for use in the zone. It is able to protect against automatic bullets, but is very bulky and almost does not provide protection from abnormal influences. \n\nWARNING! \n\n When disassembling, it is recommended to empty the inventory! \n\nATTRIBUTES: \n-Uparmored \n-Can be disassembled with a crowbar \n-Provides radiation protection if fitted with a CCR"
ITEM.price = 114254
ITEM.ric = 22
ITEM.dmgsteal = 45
ITEM.exRender = false
ITEM.addition = 8
ITEM.weight = 14

ITEM.model = "models/kek1ch/dolg_heavy_outfit.mdl"
ITEM.width = 2
ITEM.height = 3
ITEM.iconCam = {
	pos = Vector(1.6000000238419, -0.40000000596046, 200),
	ang = Angle(90, 0, 180),
	fov = 8.5987261146497
}


ITEM.functions.Use = {
	onRun = function(item)
		local client = item.player
		client:ScreenFade(SCREENFADE.OUT, Color(0, 0, 0), 1, 3)
		timer.Simple(1, function()
			client:ScreenFade(SCREENFADE.IN, Color(0, 0, 0), 1, 3)
		end)
		client:getChar():setModel("models/hdmodels/kek1ch/stalker_dolg2a_mas3.mdl")
		client:EmitSound("interface/inv_bandage_3p7.ogg", 50, 100)
		return false
	end
}

