ITEM.name = "Kolobok"
ITEM.desc = "The kolobok is an artifact caused by a chemical anomaly called 'Gas'. A rather rare artifact formed in areas of severe chemical contamination. It is highly valued for the ability to stimulate the body so that in a matter of minutes he recovers from injuries of any degree of severity. Scientists disseminate information about the impact of the artifact on the genetic material of the owner; however, there is no confirmation of this yet. \n\nATTRIBUTES: \n-Artefact \n\nRadiation +3 / sec"
ITEM.price = 32976
ITEM.isAnomaly = true
ITEM.weight = 0.82

ITEM.model = "models/kek1ch/fuzz kolobok.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(250.9533996582, 210.91357421875, 161.35008239746),
	ang = Angle(25, 220, 0),
	fov = 2.5
}

ITEM.functions.Use = {
	name = "put in case",
	onRun = function(item)
		local client = item.player
		if (IsValid(item.player) && item.player:Alive()) then
			if not client:getChar():getInv():hasItem("simkemp") then
				client:notify("You need an empty artefact case.")
				return false
			end

			client:EmitSound( Sound( "interface/inv_iam_close.ogg" ), Entity( 1 ):GetPos(), 1, CHAN_AUTO, 1, 20, 0, 100 )
			client:getChar():getInv():add("simk_colobok")
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
