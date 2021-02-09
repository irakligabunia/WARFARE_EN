ITEM.name = "Snowflake"
ITEM.desc = "The artifact looks like a Kolobok. There is an opinion that this is the Kolobok, whose properties were strengthened after exposure to a powerful electric field. Due to its qualities it is able to dramatically increase the muscle tone of the carrier. \n\nATTRIBUTES: \n-Artefact \n\nRadiation +4 / sec"
ITEM.price = 38904
ITEM.isAnomaly = true
ITEM.weight = 0.82

ITEM.model = "models/kek1ch/ice.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(250.99797058105, 210.95155334473, 161.34284973145),
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
			client:getChar():getInv():add("simk_snejinka")
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
