ITEM.name = "American MRE"
ITEM.desc = "Dry rations ready for use is an individual diet of the United States military in the field, in combat operations or in other difficult conditions where there are no sources of normal food nearby. \n\nATTRIBUTES: \n-Combat ration \n-High quality \n-Healthy \n-Saturation 100 \n-Thrist -100" --Его описание
ITEM.price = 6435
ITEM.hunger = 100
ITEM.quantity = 3
ITEM.thirst = 100
ITEM.weight = 0.70
ITEM.empty = false
ITEM.exRender = false

ITEM.model = "models/kek1ch/ration_mre.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, -2.2929935455322),
	fov = 3
}

ITEM.functions.use = {
	name = "Use",
	icon = "icon16/cup.png",
	onRun = function(item)
		local client = item.player
		client:EmitSound( "ration_using/us_ration.wav", 75, 200 )
		if item.hunger > 0 then client:restoreHunger(item.hunger) end
		if item.thirst > 0 then client:restoreThirst(item.thirst) end
		item:setData("quantity", item:getData("quantity", item.quantity or 0) - 1)
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
