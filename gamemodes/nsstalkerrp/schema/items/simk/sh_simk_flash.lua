﻿ITEM.name = "Artefact Case (Flash)"
ITEM.desc = "'Flash' is an artifact formed in places saturated with an electromagnetic field. Not so rare, but not so common. It has an amazing property to absorb electric current, redirecting discharges from the body to itself. 'Charged' flashes in everyday life are used as 'small power plants.' \n\nATTRIBUTES: \n-Technological device \n-High value \n-Doesn't require recharging \n-Maximum capacity - 1 \n-Status: Full (Contains Artefact 'Flash')"
ITEM.category = "SIMK"
ITEM.price = 11964
ITEM.exRender = false
ITEM.weight = 3.65

ITEM.model = "models/kek1ch/lead_box_closed.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(216.7789001464,8, 181.60939025879, 142.37495422363),
	ang = Angle(25, 220, 0),
	fov = 3.7
}

ITEM.functions.Use = {
	name = "use",
	icon = "icon16/cup.png",
	onRun = function(item)
		local client = item.player
		if (IsValid(client) && client:Alive()) then
			client:EmitSound( Sound( "interface/inv_iam_open.ogg" ), Entity( 1 ):GetPos(), 1, CHAN_AUTO, 1, 20, 0, 100 )
			client:getChar():getInv():add("flash")
			client:getChar():getInv():add("simkemp")
			client:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 1, 3 )
			timer.Simple(1,function()
				client:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0 ), 1, 3 )
			end)
		end
	end,
	
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
