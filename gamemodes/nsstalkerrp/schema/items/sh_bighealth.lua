ITEM.name = "Army medkit"
ITEM.desc = "Specialized medical kit for first aid for injuries on the battlefield. The kit includes means to accelerate blood clotting based on Menadion, painkillers, antibiotics and immune stimulants. Restores 73 health. \n\nATTRIBUTES: \n-military grade \n-long term"
ITEM.category = "Medicine"
ITEM.price = 1836
ITEM.exRender = false
ITEM.weight = 0.20

ITEM.model = "models/kek1ch/dev_aptechka_high.mdl"
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
		client:ScreenFade(SCREENFADE.OUT, Color(0, 0, 0), 1, 3)
		timer.Simple(1, function()
			client:ScreenFade(SCREENFADE.IN, Color(0, 0, 0), 1, 3)
		end)
		client:setNetVar("bleeding",false)
		client:SetHealth(math.min(client:Health() + 73, 100))
		client:EmitSound("interface/inv_bandage_3p7.ogg", 50, 100)
	end
}

