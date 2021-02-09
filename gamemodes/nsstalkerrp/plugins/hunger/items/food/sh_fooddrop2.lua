ITEM.name = "Psuedo dog meat"
ITEM.desc = "Pseudo-dog meat is a very dietary product in the zone. Pretty tasty, with great nutritional value, stalkers often choose it in a roasted form. Maybe scientists are interested. From a piece of meat with simple manipulations you can get some animal fat, suitable for lubrication of weapons. \n\nWARNING: \n\nStalkers are advised to refrain from eating this kind of meat \n\nATTRIBUTES: \n-Cookable \n-Poisonous \n-Radiation exposure: +27 mSv \n\nSaturation 19 Kcal"
ITEM.price = 240
ITEM.exRender = false
ITEM.weight = 0.2
ITEM.hunger = 10
ITEM.thirst = 2

ITEM.model = "models/kek1ch/raw_flesh.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(90, 76.264152526855, 56.137489318848),
	ang = Angle(25, 220, 0),
	fov = 4.3485409317371
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
