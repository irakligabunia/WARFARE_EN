ITEM.name = "Empty"
ITEM.desc = "The 'Empty' consists of two discs of bluish color, connected by a translucent material of unknown nature. This strange artifact was considered devoid of any useful properties for a long time. Only recently has it been discovered that it provides a very high level of protection against psi-influences, partially absorbing them. \n\nATTRIBUTES: \n-Artefact \n\nRadiation +2 / sec"
ITEM.price = 13752
ITEM.isAnomaly = true
ITEM.weight = 0.89

ITEM.model = "models/kek1ch/dummy_dummy.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 5.1592356687898
}

ITEM.functions.Use = {
	name = "put in case",
	onRun = function(item)
		local client = item.player
		if (IsValid(client) && client:Alive()) then
			if not client:getChar():getInv():hasItem("simkemp") then
				client:notify("You need an empty artefact case.")
				return false
			end
			
			client:EmitSound( Sound( "interface/inv_iam_close.ogg" ), Entity( 1 ):GetPos(), 1, CHAN_AUTO, 1, 20, 0, 100 )
			client:getChar():getInv():add("simk_empty")
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
