ITEM.name = "Invert"
ITEM.desc = "Artifact of bizarre shape, which occurs in places of increased gravitational activity. It is a kind of sponge that absorbs radioactive elements. Equally successfully protects its carrier from the effects of both injected radiation and already exposed radioactive particles.  \n\nATTRIBUTES: \n-Artefact \n\nRadiation +4 / sec"
ITEM.price = 16825
ITEM.isAnomaly = true

ITEM.model = "models/kek1ch/vyvert.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(271.78997802734, 228.13900756836, 172.78308105469),
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
			client:getChar():getInv():add("simk_vyvert")
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
