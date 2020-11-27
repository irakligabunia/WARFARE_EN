ITEM.name = "Battery"
ITEM.desc = "A source of electricity for autonomous power. Work voltage: 1.5V. Running time: 300 seconds.  \n\nATTRIBUTES: \n-Electronical device \n-Usages: powering a flashlight"
ITEM.price = 1040
ITEM.permit = "Misc"
ITEM.weight = 0.17

ITEM.model = "models/kek1ch/battery.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(52.070404052734, 43.692253112793, 32.759872436523),
	ang = Angle(25, 220, 0),
	fov = 2.6
}

--[[ITEM.functions.Use = {
	onRun = function(item)
		local character = item.player:getChar()
		character:setData("flashlightzarad", 300)
	end
}]]

