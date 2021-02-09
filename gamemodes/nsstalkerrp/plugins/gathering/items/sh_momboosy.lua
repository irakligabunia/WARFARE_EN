ITEM.name = "Mama's Beads"
ITEM.desc = "'Mama's Beads' in a lead-isolated metal container. The artifact crystallizes in anomalous zones with high thermal activity. Actively absorbs excess heat, while remaining cool to the touch. Much of this artifact remains a complete mystery to scientists. However, it is precisely established that the radiation that occurs during the pulsation of thickening of 'Mother's beads' accelerates the flow of metabolic processes in the body. \n\nATTRIBUTES: \n-Artefact \n\nRadiation +3 / sec"
ITEM.model = "models/kek1ch/dummy_glassbeads.mdl"
ITEM.price = 33048
ITEM.width = 1
ITEM.height = 1
ITEM.isAnomaly = true
ITEM.iconCam = {
pos = Vector(182.3424987793, 152.55667114258, 114.61862945557),
ang = Angle(25, 220, 0),
fov = 4.7003422456651
}
ITEM.weight = 0.82

ITEM.functions.Use = {
	name = "put in case",
	onRun = function(item)
		local client = item.player
		if (IsValid(client) and client:Alive()) then
			if not client:getChar():getInv():hasItem("simkemp") then
				client:notify("You need an empty artefact case")
				return false
			end

			client:EmitSound( Sound( "interface/inv_iam_close.ogg" ), Entity( 1 ):GetPos(), 1, CHAN_AUTO, 1, 20, 0, 100 )
			client:getChar():getInv():add("simk_momboosy")
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
