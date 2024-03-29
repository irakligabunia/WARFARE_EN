ITEM.name = "Bloodsucker meat"
ITEM.desc = "Bloodsucker meat is very viscous and tough, so it is unsuitable for food. Although bloodsuckers are deadly monsters, the price of their meat is not particularly high due to limited use. \n\nWARNING: \n\nСталкерам рекомендуется воздержаться от употребления такого рода мяса. \n\nATTRIBUTES: \n-Rare \n-Cookable \n-Poisonous \n-Radiation exposure +31 mSv \n\nSaturation 41"
ITEM.price = 542
ITEM.exRender = false
ITEM.weight = 0.42
ITEM.hunger = 10
ITEM.thirst = 2

ITEM.model = "models/kek1ch/raw_flesh.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(90, 76.264152526855, 56.137489318848),
	ang = Angle(25, 220, 0),
	fov = 4.3485409317371
}

ITEM.functions.use = {
	onRun = function(item)
	local client = item.player
	if item.hunger > 0 then client:restoreHunger(item.hunger) end
	if item.thirst > 0 then client:restoreThirst(item.thirst) end
	client:EmitSound( "interface/inv_eat_paperwrap.ogg", 75, 200 )
	client:setNetVar("radioactive", client:getNetVar("radioactive", 0) + 40)
		item.player:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 1, 3 )
		timer.Simple(1,function()
		client:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0 ), 1, 3 )
		end)
		return true
	end,
	onCanRun = function(item)
		return (!item.empty)
	end,
	icon = "icon16/cup.png",
	name = "Use"
}
