ITEM.name = "Vodka 'Stolichnaya' (Imported, 0.75 litres)" --Название предмета
ITEM.desc = "Drink adored by Russians, and many other people around the world. This Russian vodka is of quite high quality. \nATTRIBUTES: \n-Strong alcohol \n-High quality \n-Thrist +60" --Его описание
ITEM.category = "Food" 
ITEM.price = 3994 
ITEM.thirst = 60
ITEM.hunger = 0
ITEM.quantity = 3
ITEM.exRender = false
ITEM.weight = 1.13
ITEM.empty = true

ITEM.model = "models/kek1ch/drink_vodka.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(81.177459716797, 68.11597442627, 50.191101074219),
	ang = Angle(25, 220, 0),
	fov = 5
}

ITEM.functions.use = {
	name = "Use",
	tip = "useTip",
	icon = "icon16/cup.png",
	onRun = function(item)
		local client = item.player
		client:EmitSound( "interface/inv_drink_flask.ogg", 75, 200 )
		if item.hunger > 0 then client:restoreHunger(item.hunger) end
		if item.thirst > 0 then client:restoreThirst(item.thirst) end
		item:setData("quantity", item:getData("quantity", item.quantity or 0) - 1)
		client:setNetVar("radioactive", client:getNetVar("radioactive", 0) - 9)
		
		if item:getData("quantity") < 1 then
			return true
		end
		return false;
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

