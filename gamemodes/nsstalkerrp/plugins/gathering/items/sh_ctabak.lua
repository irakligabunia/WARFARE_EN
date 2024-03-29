﻿ITEM.name = "Tobacco sheets (5 packets)"
ITEM.desc = "Expensive tobacco wrapped in packaging appears to have been imported from the West. Without any additional harmful additives, so you can enjoy the original taste of the tobacco sheet itself. \n\nATTRIBUTES: \n-Weak poisoning effect \n-Required to use: lighter \n-Smokeable"
ITEM.price = 7722
ITEM.weight = 0.12
ITEM.tabakAmount = 4

ITEM.model = "models/kek1ch/dev_hand_rolling_tobacco.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 20.63694190979),
	fov = 2.3
}

function ITEM:getDesc()
	local str
	str = self.desc.."%s left."
	return Format(str, self:getData("tabakAmount"))
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		local tabakAmount = item:getData("tabakAmount", item.tabakAmount or 1)
	end
end

ITEM.functions.Smoke = {
	name = "smoke",
	onRun = function(item)
	local client = item.player
		if (IsValid(client) && client:Alive()) then
			if not client:getChar():getInv():hasItem("tinderbox") then
				client:notify("You don't have a lighter!")
				return false
			end
			
			local s = EffectData();
			s:SetOrigin(client:EyePos());
			util.Effect("cw_effect_smoke_cig", s);


			client:EmitSound("interface/inv_smoke.ogg", 50, 100)
			client:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 1, 3 )
			timer.Simple(1,function()
				client:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0 ), 1, 3 )
			end)
			item:setData("tabakAmount", item:getData("tabakAmount") - 1)
			
			if item:getData("tabakAmount") < 1 then
				item.player:notify("The box is empty!")
				return true
			end
		end
		return false;
	end,
	
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

function ITEM:onInstanced()
	if not self:getData("tabakAmount") then
		self:setData("tabakAmount", self.tabakAmount)
	end
end

ITEM.exRender = false
