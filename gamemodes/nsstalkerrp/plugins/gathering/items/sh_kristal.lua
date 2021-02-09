ITEM.name = "Crystal"
ITEM.desc = "It forms when a heavy metal gets into the 'Heat'.This artifact is wonderful for displaying radiation. Such an artifact is highly valued by stalkers, and there is little where it can be obtained. \n\nATTRIBUTES: \n-Artefact \n-Radiation +2 / sec"
ITEM.model = "models/kek1ch/crystal.mdl"
ITEM.price = 16728
ITEM.width = 1
ITEM.height = 1
ITEM.isAnomaly = true
ITEM.iconCam = {
pos = Vector(175, 147, 113),
ang = Angle(25, 220, 0),
fov = 4.6703654082599
}
ITEM.weight = 1.65

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
			client:getChar():getInv():add("simk_kristal")
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
