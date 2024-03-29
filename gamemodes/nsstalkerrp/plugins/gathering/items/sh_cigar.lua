﻿ITEM.name = "'Marlboro' cigarette"
ITEM.desc = "Cigarettes imported from the West. Someone must have smoked most of them, there's only a few left. \n\nATTRIBUTES: \n-Weak poisoning effect \n-Required to use: lighter \n-Smokable"
ITEM.price = 2424
ITEM.cigarettesAmount = 4
ITEM.weight = 0.02
ITEM.exRender = false

ITEM.model = "models/kek1ch/drink_cigar0.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 174.26751708984),
	fov = 1.6
}

function ITEM:getDesc()
	local str
	str = self.desc.."\n\n%s. cigarettes left"
	return Format(str, self:getData("cigarettesAmount"))
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		local cigarettesAmount = item:getData("cigarettesAmount", item.cigarettesAmount or 1)
		draw.SimpleText(cigarettesAmount, "NameFactionFont", 4, y, Color(210, 180, 140, 180))
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
			
			local s = EffectData()
			s:SetOrigin(client:EyePos())
			util.Effect("cw_effect_smoke_cig", s)

			client:EmitSound("interface/inv_smoke.ogg", 50, 100)
			client:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 1, 3 )
			timer.Simple(1,function()
				client:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0 ), 1, 3 )
			end)
			item:setData("cigarettesAmount", item:getData("cigarettesAmount") - 1)

			if item:getData("cigarettesAmount") < 1 then
				client:notify("The box is empty!")
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
	if not self:getData("cigarettesAmount") then
		self:setData("cigarettesAmount", self.cigarettesAmount)
	end
end

