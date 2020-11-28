ITEM.name = "Smoked sausage (imported)"
ITEM.desc = "Sausage made from beef and pork. Sooty and packed in vacum packaging, they can be stored for a long time. This sausage stick is imported from Russia. Such are usually in demand among the Russian mafia for their exceptional aroma and taste. \n\nATTRIBUTES: \n-Food \n-Healthy \n-Satuartion 50 Kcal" --Его описание
ITEM.category = "Food" 
ITEM.price = 1971 
ITEM.hunger = 50
ITEM.thirst = 0
ITEM.weight = 0.40
ITEM.exRender = false
ITEM.empty = false

ITEM.model = "models/kek1ch/dev_kolbasa.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(99.05802154541, 81.936004638672, 60.716087341309),
	ang = Angle(25, 220, 0),
	fov = 4.3749786370389
}

ITEM.functions.use = {
	onRun = function(item)
		local client = item.player
		if item.hunger > 0 then client:restoreHunger(item.hunger) end
		if item.thirst > 0 then client:restoreThirst(item.thirst) end
		client:EmitSound( "interface/inv_eat_paperwrap.ogg", 75, 200 )
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
