ITEM.name = "Nightstar"
ITEM.desc = "A night star is an artefact that occasionally forms in the Trumplin anomaly. Beautiful formation with a mirrored surface and colored phosphorescizing inlays. At night, it illuminates everything around him in a radius of one or two meters, for which the stalkers got such a name. It is a compressed and bizarrely curved by strong gravity remains of plants, soil and in general everything that falls into the immediate proximity of the anomaly. \n\nATTRIBUTES: \n-Artefact \n\nRadiation +2 / sec"
ITEM.price = 12356
ITEM.isAnomaly = true
ITEM.weight = 0.82

ITEM.model = "models/kek1ch/nightstar.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(276.04568481445, 231.64785766602, 176.0782623291),
	ang = Angle(25, 220, 0),
	fov = 4
}

ITEM.functions.Use = {
	name = "put in case",
	onRun = function(item)
		local client = item.player
		if (IsValid(item.player) and item.player:Alive()) then
			if not client:getChar():getInv():hasItem("simkemp") then
				client:notify("You need an empty artefact case")
				return false
			end

			client:EmitSound( Sound( "interface/inv_iam_close.ogg" ), Entity( 1 ):GetPos(), 1, CHAN_AUTO, 1, 20, 0, 100 )
			client:getChar():getInv():add("simk_nightstar")
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
