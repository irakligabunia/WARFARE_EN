ITEM.name = "Fireball"
ITEM.desc = "'Fireball' is an artefact often used by stalkers because of its ability to maintain an acceptable temperature within a five-metre radius. However, traders can not boast of demand. It is formed in high-temperature environments, but how - no one has yet found out. It is formed in anomalies such as Heat. \n\nATTRIBUTES: \n-Artefact \n\nRadiation +3 / sec"
ITEM.price = 14900
ITEM.isAnomaly = true
ITEM.weight = 0.82

ITEM.model = "models/kek1ch/fireball.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(146.4425201416, 123.03157806396, 95.019195556641),
	ang = Angle(25, 220, 0),
	fov = 4.5627383011566
}


ITEM.functions.Use = {
	name = "put in case",
	onRun = function(item)
		local client = item.player
		if (IsValid(item.player) && client:Alive()) then
			if not client:getChar():getInv():hasItem("simkemp") then
				client:notify("You need an empty artefact case.")
				return false
			end
			
			client:EmitSound( Sound( "interface/inv_iam_close.ogg" ), Entity( 1 ):GetPos(), 1, CHAN_AUTO, 1, 20, 0, 100 )
			client:getChar():getInv():add("simk_fireball")
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
