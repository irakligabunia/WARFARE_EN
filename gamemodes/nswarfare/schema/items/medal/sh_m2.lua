ITEM.name = "Stalker Medal"
ITEM.desc = "Award for achieving the Stalker rank. Issued if the current rank is more than 250. To convert to capital, use \n\nATTRIBUTES: \n-value"
ITEM.price = 5000
ITEM.weight = 0.02
ITEM.exRender = false

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
		item.player:getChar():giveMoney(5000)
	end
}
