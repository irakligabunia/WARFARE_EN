ITEM.name = "Abakan beef stew (imported)"
ITEM.desc = "The stew is a common name for stew produced in the Soviet Union and other Warsaw Pact countries. The irony is that the idea of such a product came to Russia during World War II in the form of assistance from the United States. \n\nATTRIBUTES: \n-Food \n-Healthy \n-Required to use: Knife \n-Saturation 80 Kcal" --Его описание
ITEM.category = "Food"
ITEM.price = 2769 
ITEM.hunger = 80
ITEM.thirst = 10
ITEM.weight = 0.34
ITEM.exRender = false

ITEM.model = "models/kek1ch/dev_chili.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(52.070404052734, 43.692253112793, 33.886013031006),
	ang = Angle(25, 220, 0),
	fov = 4.9
}

ITEM.functions.use = {
	onRun = function(item)
		local client = item.player
		if not client:getChar():getInv():hasItem("knife") then
			client:notify("You need a knife to open the can.")
			return false
		end
		
		if item.hunger > 0 then client:restoreHunger(item.hunger) end
		if item.thirst > 0 then client:restoreThirst(item.thirst) end
		client:EmitSound( "interface/inv_eat_can.ogg", 75, 200 )
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
ITEM.empty = false
