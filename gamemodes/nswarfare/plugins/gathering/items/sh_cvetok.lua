ITEM.name = "Stoneflower"
ITEM.desc = "The artifact is a stone close in its characteristics to granites. It occurs inside gravitational fields of great intensity. It is able to fully or partially protect the owner's mind from psi-impact. \n\nATTRIBUTES: \n-Artefact \n\nRadiation +3 / sec"
ITEM.price = 23910
ITEM.isAnomaly = true
ITEM.weight = 0.85

ITEM.model = "models/kek1ch/crystal_flower.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 6.3057324840764
}

ITEM.functions.Use = {
	name = "put in case",
	onRun = function(item)
		local client = item.player
		if (IsValid(client) && client:Alive()) then
			if not client:getChar():getInv():hasItem("simkemp") then
				client:notify("You need an empty arterfact case")
				return false
			end

			client:EmitSound( Sound( "interface/inv_iam_close.ogg" ), Entity( 1 ):GetPos(), 1, CHAN_AUTO, 1, 20, 0, 100 )
			client:getChar():getInv():add("simk_cvetok")
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
