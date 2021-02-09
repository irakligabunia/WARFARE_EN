ITEM.name = "Anabiotic (Zone grade)"
ITEM.category = "Medicine"
ITEM.desc = "Experimental medical drug, allows you to survive a blowout. \n\nATTRIBUTES: \n-Medication \n-Long term psychological effect \nAllows you to survive a blowout"
ITEM.price = 3498
ITEM.exRender = false
ITEM.weight = 0.12

ITEM.model = "models/kek1ch/drug_anabiotic.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(82.731010437012, 69.455390930176, 51.793571472168),
	ang = Angle(25, 220, 0),
	fov = 5.6
}

ITEM.functions.Use = {
	onRun = function(item)
		local client = item.player
		client:Freeze(true)
		client:GodEnable()
		client:ConCommand("say /actinjured")
		client:notify("This will take 135 seconds.")
		timer.Create(135, function()
			client:Freeze(false)
			client:GodDisable()
		end)
		client:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 2, 440 )
		timer.Simple(68,function()
			client:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0 ), 2, 440 )
		end)
	end
}
