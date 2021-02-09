ITEM.name = "Multi-fuel oven"
ITEM.desc = "The furnace has been thoroughly tested in the field and has been used in countless expeditions over the years. It is incredibly strong, reliable and powerful. Works in the most difficult and harsh conditions: both at huge altitudes and at extreme temperatures. \n\nATTRIBUTES: \n-Technological device \n-High quality \n-Usages: to cook mutant parts \n-Required to use: lighter, kerosene, or a canister"
ITEM.price = 9385
ITEM.exRender = false
ITEM.weight = 0.36

ITEM.model = "models/kek1ch/multi_fuel_stove.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(166.95794677734, 136.87271118164, 102.66918182373),
	ang = Angle(25, 220, 6.8789811134338),
	fov = 4.6389929926663
}

ITEM.functions.use = { 
	name = "Use",
	tip = "useTip",
	icon = "icon16/drive.png",
	onRun = function(item)
		local ply = item.player
		local data = {}
			data.start = ply:GetShootPos()
			data.endpos = data.start + ply:GetAimVector()*200
			data.filter = ply
		local trace = util.TraceLine(data)
		
		local pechka = ents.Create("multipechka")
		pechka:SetPos(trace.HitPos + trace.HitNormal * 10)
		pechka:Spawn()
		ply:EmitSound(Sound( "interface/inv_put_up_tent.ogg" ))
		ply:Freeze(true)
		timer.Simple(5, function()
			ply:Freeze(false)
		end)
		ply:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 1, 3 )
		timer.Simple(1,function()
			ply:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0 ), 1, 3 )
		end)
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
