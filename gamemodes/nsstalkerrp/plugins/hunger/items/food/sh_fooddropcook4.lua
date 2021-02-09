ITEM.name = "Tushanko meat (Zone product)"
ITEM.desc = "Two small roasted tushankos, grilled, seasoned with salt and chilli. Very cheap and practical food that is cooked in the zone. Wrapped in thick brown paper so that the fat does not drain. \n\nATTRIBUTES: \n-Unhealthy \n-Radiation exposure: 6 mSv \n-Saturation 18 Kcal"
ITEM.price = 1014
ITEM.exRender = false
ITEM.weight = 0.1
ITEM.hunger = 18
ITEM.thirst = 2

ITEM.model = "models/kek1ch/meat_tushkano.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 18.343948364258),
	fov = 2.8662420382166
}

ITEM.functions.use = {
	onRun = function(item)
		local client = item.player
		if item.hunger > 0 then client:restoreHunger(item.hunger) end
		if item.thirst > 0 then client:restoreThirst(item.thirst) end
		client:EmitSound( "interface/inv_eat_paperwrap.ogg", 75, 200 )
		client:setNetVar("radioactive", client:getNetVar("radioactive", 0) + 14)
		client:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 1, 3 )
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
