--[[﻿ITEM.name = "Beard's Tea (1 litre, Zone product)" 
ITEM.desc = "Popular among stalkers, infused with edible dried mushrooms in boiled water (they say it is not radioactive) with added sugar. Stalkers usually buy this drink and take it with them in long walks around the zone. It's a pretty good and relatively healthy way to stay on your feet when you're tired or when you're waiting for cold dark nights to end. \n\nATTRIBUTES \n-Beverage \n-Healthy \n-Radiation exposure: -13 mSv \n-Saturation 226 Kcal" --Его описание
ITEM.price = 6709
ITEM.thirst = 90
ITEM.hunger = 10
ITEM.quantity = 3
ITEM.weight = 1.03
ITEM.empty = true
ITEM.exRender = false

ITEM.model = "models/kek1ch/drink_tea.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(101.74163818359, 85.371360778809, 66.62133026123),
	ang = Angle(25, 220, 0),
	fov = 2.7
}

ITEM.functions.use = {
	name = "Use",
	tip = "useTip",
	onRun = function(item)
		local client = item.player
		client:EmitSound( "interface/inv_drink_tea.ogg", 75, 200 )
		if item.hunger > 0 then client:restoreHunger(item.hunger) end
		if item.thirst > 0 then client:restoreThirst(item.thirst) end
		item:setData("quantity", item:getData("quantity", item.quantity or 0) - 1)
		client:setNetVar("radioactive", client:getNetVar("radioactive", 0) - 5)
		client:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 1, 3 )
		timer.Simple(1,function()
			client:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0 ), 1, 3 )
		end)
			
		if item:getData("quantity") < 1 then
			return true
		end
		return false;
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
]]--