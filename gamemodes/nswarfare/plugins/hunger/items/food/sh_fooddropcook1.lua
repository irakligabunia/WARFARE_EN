ITEM.name = "Pseudo dog meat (Zone product)"
ITEM.desc = "Portion of fried chops from pseudo-dog meat. Good nutritional properties due to the dense muscle tissue of the animal.  \n\nATTRIBUTES:\n-Poisonous \n-Radiation exposure: 17 м3в \n\nSaturation 40"
ITEM.price = 1227
ITEM.hunger = 40
ITEM.thirst = 5
ITEM.weight = 0.51
ITEM.exRender = false
ITEM.empty = false

ITEM.model = "models/kek1ch/meat_pseudodog.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(58.984310150146, 49.493705749512, 37.502128601074),
	ang = Angle(25, 220, 0),
	fov = 5.6
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

