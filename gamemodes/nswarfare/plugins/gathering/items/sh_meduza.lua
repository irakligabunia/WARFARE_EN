ITEM.name = "Jellyfish"
ITEM.desc = "An artifact of gravitational nature, which has the ability to actively attract and absorb radioactive particles, thereby reducing the irradiation of the body. Widespread in the zone; beyond its borders is widely, though unspoken, used in the treatment of acute radiation sickness. \n\nATTRIBUTES: \n-Artefact \n\nRadiation +2 / sec"
ITEM.price = 12354
ITEM.isAnomaly = true
ITEM.weight = 0.82

ITEM.model = "models/kek1ch/medusa.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(129.83967590332, 109.03283691406, 85.107475280762),
	ang = Angle(25, 220, 0),
	fov = 4.4979937329715
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
			client:getChar():getInv():add("simk_meduza")
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
