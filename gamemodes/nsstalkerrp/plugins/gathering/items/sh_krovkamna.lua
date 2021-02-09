ITEM.name = "Stoneblood"
ITEM.desc = "It is a reddish formation from compressed polymerized residues of plants, soil and bones. It has the ability to partially neutralize harmful chemicals for humans. \n\nATTRIBUTES: \n-Artefact \n\nRadiation +2 / sec"
ITEM.price = 13992
ITEM.isAnomaly = true
ITEM.weight = 0.71

ITEM.model = "models/kek1ch/blood.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(186.97143554688, 157.96545410156, 119.7611618042),
	ang = Angle(25, 220, 0),
	fov = 4.7187340055094
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
			client:getChar():getInv():add("simk_krovkamna")
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
