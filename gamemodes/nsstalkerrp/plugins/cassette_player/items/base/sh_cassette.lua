﻿ITEM.name = "Cassette case"
ITEM.desc = "A regular cassette tape."
ITEM.category = "Cassette"
ITEM.price = 10000
ITEM.model = "models/kek1ch/cassette_backkek.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0.40000000596046, 0, 200),
	ang = Angle(90, 0, -174.26751708984),
	fov = 2.3
}
ITEM.weight = 0.14
ITEM.isCassette = true

function ITEM:getDesc()
	local description = self.desc
	description = description.."\n\nATTRIBUTES:\n-Rare item\n-Widespread use\n\nWhen activating, look at the cassette player."
	return description
end

ITEM.functions.View = {
	name = "play",
	onRun = function(item)
		local client = item.player
		local Hit = client:GetEyeTraceNoCursor()
		local entity = Hit.Entity
		local dist = client:GetPos():Distance(entity:GetPos())

		item.options = {}
		for k, v in pairs(item.cassette_options) do
			item.options[#item.options + 1] = k
		end

		if (entity:GetClass() == "nut_cassette_player") and (dist < 200) then
			if not (entity.PutCassette) then
				entity.sound = CreateSound( entity, table.Random(item.options))
				entity.sound:Play()
				entity.sound:SetSoundLevel(0)
				entity.PutCassette = item.uniqueID

				entity:Repeat(item.cassette_options)
			else
				return false
			end
		else
			return false
		end
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

