﻿ITEM.name = "Radio Walkie talkie"
ITEM.desc = "A handheld radio, with a frequency switch."
ITEM.price = 1289
ITEM.weight = 0.42
ITEM.exRender = false

ITEM.model = "models/kek1ch/dev_fmradio.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(0, 200, 5.5),
	ang = Angle(0, 270, -2.2929935455322),
	fov = 2
}

function ITEM:getDesc()
	if (!self.entity or !IsValid(self.entity)) then
		str = "A Pager that allows you to send a signal to other characters in distance.\nPower: %s\nFrequency: %s"
		return Format(str, (self:getData("power") and "On" or "Off"), self:getData("freq", "000.0"))
	else
		local data = self.entity:getData()
		
		str = "A Functional Pager. Power: %s Frequency: %s"
		return Format(str, (self.entity:getData("power") and "On" or "Off"), self.entity:getData("freq", "000.0"))
	end
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("power", false)) then
			surface.SetDrawColor(110, 255, 110, 100)
		else
			surface.SetDrawColor(255, 110, 110, 100)
		end

		surface.DrawRect(w - 14, h - 14, 8, 8)
	end

	local GLOW_MATERIAL = Material("sprites/glow04_noz.vmt")
	local COLOR_ACTIVE = Color(0, 255, 0)
	local COLOR_INACTIVE = Color(255, 0, 0)

	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		local rt = RealTime()*100
		local position = entity:GetPos() + entity:GetForward() * 0 + entity:GetUp() * 2 + entity:GetRight() * 0

		if (entity:getData("power", false) == true) then
			if (math.ceil(rt/14)%10 == 0) then
				render.SetMaterial(GLOW_MATERIAL)
				render.DrawSprite(position, rt % 14, rt % 14, entity:getData("power", false) and COLOR_ACTIVE or COLOR_INACTIVE)
			end
		end
	end
end

ITEM.functions.toggle = {
	name = "toggle",
	tip = "useTip",
	onRun = function(item)
		item:setData("power", !item:getData("power", false), player.GetAll(), false, true)
		item.player:EmitSound("buttons/button14.wav", 70, 150)

		return false
	end,
}

ITEM.functions.use = {
	name = "adjust frequency",
	tip = "useTip",
	onRun = function(item)
		netstream.Start(item.player, "radioAdjust", item:getData("freq", "000,0"), item.id)

		return false
	end,
}
function ITEM:getDesc()
	local str
	
	if (!self.entity or !IsValid(self.entity)) then
		str = "A Pager that allows you to send a signal to other characters in distance.\nPower: %s\nFrequency: %s"
		return Format(str, (self:getData("power") and "On" or "Off"), self:getData("freq", "000.0"))
	else
		local data = self.entity:getData()
		
		str = "A Functional Pager. Power: %s Frequency: %s"
		return Format(str, (self.entity:getData("power") and "On" or "Off"), self.entity:getData("freq", "000.0"))
	end
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("power", false)) then
			surface.SetDrawColor(110, 255, 110, 100)
		else
			surface.SetDrawColor(255, 110, 110, 100)
		end

		surface.DrawRect(w - 14, h - 14, 8, 8)
	end

	local GLOW_MATERIAL = Material("sprites/glow04_noz.vmt")
	local COLOR_ACTIVE = Color(0, 255, 0)
	local COLOR_INACTIVE = Color(255, 0, 0)

	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		local rt = RealTime()*100
		local position = entity:GetPos() + entity:GetForward() * 0 + entity:GetUp() * 2 + entity:GetRight() * 0

		if (entity:getData("power", false) == true) then
			if (math.ceil(rt/14)%10 == 0) then
				render.SetMaterial(GLOW_MATERIAL)
				render.DrawSprite(position, rt % 14, rt % 14, entity:getData("power", false) and COLOR_ACTIVE or COLOR_INACTIVE)
			end
		end
	end
end

// On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.toggle = { -- sorry, for name order.
	name = "Toggle",
	tip = "useTip",
	icon = "icon16/connect.png",
	onRun = function(item)
		item:setData("power", !item:getData("power", false), player.GetAll(), false, true)
		item.player:EmitSound("buttons/button14.wav", 70, 150)

		return false
	end,
}

ITEM.functions.use = { -- sorry, for name order.
	name = "Freq",
	tip = "useTip",
	icon = "icon16/wrench.png",
	onRun = function(item)
		netstream.Start(item.player, "radioAdjust", item:getData("freq", "000,0"), item.id)

		return false
	end,
}
