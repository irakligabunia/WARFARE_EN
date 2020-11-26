ITEM.name = "Veteran Medal"
ITEM.desc = "Award for achieving the Veteran rank. Issued if the current rank is more than 750. To convert to capital, use \n\nATTRIBUTES: \n-value"
ITEM.price = 15000
ITEM.exRender = false
ITEM.weight = 0.02

ITEM.model = "models/kek1ch/dev_money2.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(-0.050000000745058, 0, 200),
	ang = Angle(90, 0, -90),
	fov = 0.8
}

ITEM.functions.Use = {
	onRun = function(item)
		item.player:getChar():giveMoney(15000)
	end
}
