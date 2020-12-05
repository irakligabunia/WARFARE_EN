ITEM.name = "Snork hand"
ITEM.desc = "According to popular belief, snorks mutated from people, so to eat their meat is considered to be very immoral. However, some groups, such as bandits and mercenaries, incorporate this kind of meat into the diet of their fighters, thereby showing superiority over other groups. \n\nWARNING: \n\nStalkers are advised to refrain from eating this kind of meat of animals and mutants in the zone in raw form, as it is probably infected with trichinellosis or brucellosis. \n\nATTRIBUTES: \n-Cookable \n-Poisonous \n-Radiation expsoure 17 mSv\n\nSaturation 17 Kcal."
ITEM.model = Model("models/kek1ch/raw_dog.mdl")
ITEM.price = 114
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(86.599998474121, 73.197570800781, 53.877902984619),
	ang = Angle(25, 220, 0),
	fov = 4.3345276242623
}
ITEM.exRender = false
ITEM.weight = 0.21
ITEM.hunger = 10
ITEM.thirst = 2

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
	name = "use"
}

ITEM.price = 248
ITEM.model = "models/kek1ch/raw_snork.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0.40000000596046, -0.10000000149012, 200),
	ang = Angle(90, 0, -134.11764526367),
	fov = 2.5
}
ITEM.exRender = false
ITEM.weight = 0.27
ITEM.hunger = 10
ITEM.thirst = 2

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
	name = "use"
}
