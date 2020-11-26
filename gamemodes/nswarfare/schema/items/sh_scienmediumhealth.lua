ITEM.name = "Scientific medkit"
ITEM.category = "Medicine"
ITEM.desc = "A medical kit designed specifically for researchers who work in the zone. Contains tools for both the healing of mechanical injuries and the prevention of radiation sickness \n\nХАРАКТЕРИСТИКИ: \n-High value \n-High quality \n-Long term \n\nH +91"
ITEM.price = 3164
ITEM.exRender = false
ITEM.weight = 0.1

ITEM.model = "models/kek1ch/dev_aptechka_mid.mdl"
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
		client:SetHealth(math.min(client:Health() + 100, 100))
	end
}
