ITEM.name = "Goldfish"
ITEM.desc = "All its properties were discovered by Sakharov scientists on Yantar after a massive emission. After careful research, it was determined that this artifact was formed after the merger of the three 'Gravi' at the level of interaction of singular fields. \n\nATTRIBUTES: \n-Artefact \n-Radiation +3 / sec"
ITEM.price = 19752
ITEM.isAnomaly = true
ITEM.weight = 0.82

ITEM.model = "models/kek1ch/gold_fish.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 89.426750183105),
	fov = 5.1592356687898
}

ITEM.functions.Use = {
	name = "put in artefact case",
	onRun = function(item)
		local client = item.player
		if (IsValid(client) && client:Alive()) then
			if not client:getChar():getInv():hasItem("simkemp") then
				client:notify("You need an empty artefact case.")
				return false
			end

			client:EmitSound( Sound( "interface/inv_iam_close.ogg" ), Entity( 1 ):GetPos(), 1, CHAN_AUTO, 1, 20, 0, 100 )
			client:getChar():getInv():add("simk_goldfish")
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
