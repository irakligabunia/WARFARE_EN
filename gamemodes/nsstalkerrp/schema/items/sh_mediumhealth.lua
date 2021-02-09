ITEM.name = "First Aid Kit"
ITEM.category = "A one-time general medical kit. It is convenient for first aid for injuries, small wounds, chemical and thermal burns, as well as various types of poisoning. Restores 43 health \n\nATTRIBUTES: \n-Widespread use \n-Long term"
ITEM.price = 1140
ITEM.exRender = false
ITEM.weight = 0.24

ITEM.model = "models/kek1ch/dev_aptechka_low.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 2.3
}

ITEM.functions.Use = {
	onRun = function(item)
		local client = item.player
		client:Freeze(true)
		timer.Simple(5, function()
			client:Freeze(false)
		end)
		client:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 1, 3 )
		timer.Simple(1,function()
			client:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0 ), 1, 3 )
		end)
		client:setNetVar("bleeding",false)
		client:SetHealth(math.min(client:Health() + 43, 100))
	end
}

--sound = "interface/inv_bandage_3p7.ogg",
