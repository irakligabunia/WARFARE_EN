ITEM.name = "Flesh meat"
ITEM.desc = "A fairly popular product in the area, flesh meat has good taste and great food value. Scientists have already spent quite a lot of depletions over the samples brought by stalkers, so the demand for such pieces of meat fell. \n\nWARNING:\n\nStalkers are advised to refrain from eating this kind of meat of animals and mutants in the zone in raw form, as it is probably infected with trichinellosis or brucellosis. \n\nATTRIBUTETES: \n-Cookable \n-Poisonous \n-Radiation expsoure 17 mSv\n\nSaturation 17 Kcal"
ITEM.price = 319
ITEM.exRender = false
ITEM.weight = 0.41
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
	name = "use"
}
