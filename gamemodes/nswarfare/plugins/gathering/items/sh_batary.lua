ITEM.name = "Battery"
ITEM.desc = "A rare, rather expensive artifact, formed in electrical anomalies, slightly increases the muscle tone. It is known that this artifact contains electrostatic elements, but in what conditions it is formed, science is not yet known. \n\nATTRIBUTES: \n-Artefact \n\nRadiation+2 / sec"
ITEM.price = 19752
ITEM.isAnomaly = true
ITEM.weight = 0.82

ITEM.model = "models/kek1ch/dummy_battery.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(125, 104.16584777832, 81.444068908691),
	ang = Angle(25, 220, 0),
	fov = 4.4758594506754
}

ITEM.functions.Use = {
	name = "put in case",
	icon = "icon16/cup.png",
	onRun = function(item)
		local client = item.player
		if (IsValid(item.player) && item.player:Alive()) then
			if !item.player:getChar():getInv():hasItem("simkemp") then
				item.player:notify("You need an empty artefact case.")
				return false
			end
			item.player:EmitSound( Sound( "interface/inv_iam_close.ogg" ), Entity( 1 ):GetPos(), 1, CHAN_AUTO, 1, 20, 0, 100 )
			item.player:getChar():getInv():add("simk_batary")
			client:getChar():getInv():remove(client:getChar():getInv():hasItem("simkemp"):getID()) 
		end
	end,

	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
