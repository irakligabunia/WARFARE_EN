ITEM.name = "Pathfinder Medal"
ITEM.desc = "The award for achieving the Pathfinder rank. Issued if the current rank is more than 100. To convert to capital, use \n\nATTRIBUTES: \n-value"
ITEM.price = 2000
ITEM.exRender = false
ITEM.weight = 0.02

ITEM.model = "models/kek1ch/dev_money.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(-0.050000000745058, 0, 200),
	ang = Angle(90, 0, -90),
	fov = 0.8
}

ITEM.functions.Use = {
	onRun = function(item)
		item.player:getChar():giveMoney(2000)
	end
}
