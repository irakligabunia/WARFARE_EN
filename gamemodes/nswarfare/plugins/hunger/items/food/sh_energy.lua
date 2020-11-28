ITEM.name = "Clean water (Zone product, 1 liter)" --Название предмета
ITEM.desc = "Military flasks are designed to drink water in small sips. Produced and cleaned by medics and scientists. \n\nATTRIBUTES: \n-Beverage \n-Healthy \n\nRadiation -12 \nThirst -70" --Его описание
ITEM.category = "Food"
ITEM.price = 987
ITEM.hunger = 0
ITEM.thirst = 10
ITEM.quantity = 3
ITEM.weight = 0.45
ITEM.empty = true
ITEM.exRender = false

ITEM.model = "models/kek1ch/drink_flask.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0, 22, 3.4000000953674),
	ang = Angle(0, 270, -9.1719741821289),
	fov = 24
}

ITEM.functions.use = {
	name = "use",
	icon = "icon16/cup.png",
	onRun = function(item)
		local client = item.player
		client:EmitSound( "interface/inv_drink_can2.ogg", 75, 200 )
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
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

