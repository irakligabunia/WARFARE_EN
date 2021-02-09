ITEM.name = "Moonlight"
ITEM.desc = "A unique artifact of electrostatic nature. Demonstrates the ability to resonance under the influence of psi waves. Over time, stalkers learned to adjust the artifact in such a way that it resonated in the opposite phase, thereby completely or to a large extent neutralizing psi radiation. Radioactive. \n\nATTRIBUTES: \n-Artefact \n\nRadiation +2 / sec"
ITEM.model = "models/kek1ch/electra_moonlight.mdl"
ITEM.price = 13536
ITEM.width = 1
ITEM.height = 1
ITEM.isAnomaly = true
ITEM.iconCam = {
pos = Vector(193.10929870605, 161.98397827148, 123.09382629395),
ang = Angle(25, 220, 0),
fov = 3
}
ITEM.weight = 0.82

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
			client:getChar():getInv():add("simk_moonlight")
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
