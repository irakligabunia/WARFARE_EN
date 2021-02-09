ITEM.name = "Boar meat"
ITEM.desc = "The most popular meat in the Exclusion Area. Very nutritious and not heavily contaminated. Scientists have already done quite a lot of research on the samples brought by stalkers, so the demand as such for such pieces of meat has fallen. \n\nATTRIBUTES: \n\nStalkers are advised to refrain from eating this kind of meat. \n-Cookable \n-Poisonous  \n-Radiation exposure: 35 \n\nSaturation 17"
ITEM.price = 387
ITEM.weight = 0.51
ITEM.exRender = false
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
