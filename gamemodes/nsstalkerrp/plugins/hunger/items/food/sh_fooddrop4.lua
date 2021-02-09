ITEM.name = "Tushanko meat"
ITEM.desc = "A small piece of meat from the body of a mutated rodent. Cheap and often met food, which, per stalkers saying, can strengthen your heart muscles if cooked. Maybe scientists are interested. \n\nWARNING: \n\nStalkers are advised to refrain from eating this kind of meat. \n\nATTRIBUTES: \n-Cookable \n-Poisonous \n-Radiation exposure: +17 mSv \n\nSaturation 14 Kcal"
ITEM.price = 69
ITEM.exRender = false
ITEM.weight = 0.1
ITEM.hunger = 10
ITEM.thirst = 2

ITEM.model = "models/kek1ch/raw_tushkano.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(53.877891540527, 45.455871582031, 33.413673400879),
	ang = Angle(25, 220, 0),
	fov = 4.2079302680872
}

ITEM.functions.use = {
	onRun = function(item)
		local client = item.player
		if item.hunger > 0 then client:restoreHunger(item.hunger) end
		if item.thirst > 0 then client:restoreThirst(item.thirst) end
		client:EmitSound( "interface/inv_eat_paperwrap.ogg", 75, 200 )
		client:setNetVar("radioactive", client:getNetVar("radioactive", 0) + 40)
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
