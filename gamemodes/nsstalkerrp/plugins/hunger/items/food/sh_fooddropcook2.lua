ITEM.name = "Boar steak (Zone product)"
ITEM.desc = "A small portion of the steak, cooked on the grill and richly seasoned with salt and pepper. The most popular dish among stalkers. Wrapped in parchment paper. \n\nATTRIBUTES: \n-Unhealthy \n-Radiation exposure: 19 mSv\n\nSaturation 55 Kcal"
ITEM.price = 1227
ITEM.exRender = false
ITEM.hunger = 55
ITEM.weight = 0.2
ITEM.thirst = 5
ITEM.empty = false

ITEM.model = "models/kek1ch/meat_boar.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(72.090431213379, 60.431461334229, 44.377960205078),
	ang = Angle(25, 220, 0),
	fov = 4.2767826237866
}

ITEM.functions.use = {
	onRun = function(item)
		local client = item.player
		if item.hunger > 0 then client:restoreHunger(item.hunger) end
		if item.thirst > 0 then client:restoreThirst(item.thirst) end
		client:EmitSound( "interface/inv_eat_paperwrap.ogg", 75, 200 )
		client:setNetVar("radioactive", client:getNetVar("radioactive", 0) + 14)
		item.player:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 1, 3 )
		timer.Simple(1,function()
			client:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0 ), 1, 3 )
		end)
		return true
	end,
	onCanRun = function(item)
		return (!item.empty)
	end,
	name = "Use"
}
