ITEM.name = "Flesh fat (Zone product)"
ITEM.desc = "Two slices of bacon and fat bacon from mutated pigs, better known as flesh. Wrapped in thick brown paper so that the fat does not drain. \n\nATTRIBUTES: \n-Unhealthy \n-Radiation exposure: 15 mSv \n-Saturation 48 Kcal"
ITEM.price = 997
ITEM.exRender = false
ITEM.weight = 0.41
ITEM.hunger = 48
ITEM.thirst = 5

ITEM.model = "models/kek1ch/meat_flesh.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(58.272296905518, 48.844135284424, 35.863288879395),
	ang = Angle(25, 220, 0),
	fov = 4
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
	name = "use"
}
