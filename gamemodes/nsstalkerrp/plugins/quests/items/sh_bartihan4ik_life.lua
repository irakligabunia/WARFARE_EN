ITEM.name = "Bartihanchik (Alive)"
ITEM.desc = "It is so cold, but still alive, it would be worth warming it ...\n\nATTRIBUTES: \n-Quest item"
ITEM.price = 510
ITEM.exRender = false
ITEM.weight = 0.12

ITEM.model = "models/wick/rat/wick_rat.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0, 200, 5),
	ang = Angle(0, 270, -32.101909637451),
	fov = 8.5987261146497
}


ITEM.functions.use = { 
	name = "twist neck",
	tip = "useTip",
	icon = "icon16/drive.png",
	onRun = function(item)
		local client = item.player
		client:getChar():getInv():add(table.Random("bartihan4ik_dead"))
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
