ITEM.name = "Vodka 'Nemiroff' (imported, 0.5 liters)"
ITEM.desc = "Military flags are designed to drink water in small sips. Produced and cleaned by medics and scientists. Water combined with a special type of alcohol is boiled at a very high temperature for cleaning and disinfection. \n\nATTRIBUTES: \n-Beverage \n-Strong alcohol \n-Radiation exposure -24 mSv\nThrist +37" --Его описание
ITEM.category = "Food"
ITEM.price = 1746 
ITEM.thirst = 37
ITEM.exRender = false
ITEM.quantity = 2
ITEM.weight = 0.71
ITEM.empty = true

ITEM.model = "models/kek1ch/drink_water.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0, 200, 3),
	ang = Angle(0, 270, 0),
	fov = 2.8662420382166
}

ITEM.functions.use = { 
	name = "use",
	tip = "useTip",
	icon = "icon16/cup.png",
	onRun = function(item)
		local client = item.player
		client:EmitSound( "interface/inv_drink_flask.ogg", 75, 200 )
		if item.hunger > 0 then client:restoreHunger(item.hunger) end
		if item.thirst > 0 then client:restoreThirst(item.thirst) end
		item:setData("quantity", item:getData("quantity", item.quantity or 0) - 1)
		client:setNetVar("radioactive", client:getNetVar("radioactive", 0) - 6)
		client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)

		if item:getData("quantity") < 1 then
			return true
		end
		return false;
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

