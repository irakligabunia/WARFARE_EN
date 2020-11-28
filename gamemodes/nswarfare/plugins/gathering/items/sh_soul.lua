ITEM.name = "Soul"
ITEM.desc = "A unique organic artefact with no less unique properties. Increases the overall rate of recovery of the body. Due to the features of the influence on the body and pleasant appearance is of particular interest to collectors. \n\nATTRIBUTES: \n-Artefact \n\nRadiation +4 / sec"
ITEM.price = 25662
ITEM.isAnomaly = true
ITEM.weight = 0.82

ITEM.model = "models/kek1ch/soul.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(187.89283752441, 157.68478393555, 121.12998199463),
	ang = Angle(25, 220, 0),
	fov = 4
}

ITEM.functions.Use = {
	name = "put in case",
	onRun = function(item)
		local client = item.player
		if (IsValid(client) and client:Alive()) then
			if not client:getChar():getInv():hasItem("simkemp") then
				client:notify("You need an empty artefact case.")
				return false
			end
			
			client:EmitSound( Sound( "interface/inv_iam_close.ogg" ), Entity( 1 ):GetPos(), 1, CHAN_AUTO, 1, 20, 0, 100 )
			client:getChar():getInv():add("simk_soul")
			client:getChar():getInv():remove(client:getChar():getInv():hasItem("simkemp"):getID()) 
			client:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 1, 3 )
			timer.Simple(1,function()
				client:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0 ), 1, 3 )
			end)
		end
	end,

	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
