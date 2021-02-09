ITEM.name = "Master Medal"
ITEM.desc = "Award for achieving the Master rank. Issued if the current rank is more than 1000. To convert to capital, use \n\nATTRIBUTES: \n-value"
ITEM.price = 20000
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
		item.player:getChar():giveMoney(20000)
	end
}
