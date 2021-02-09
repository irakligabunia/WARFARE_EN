ITEM.name = "Gas cylinder (7 litres)"
ITEM.desc = "A heavy metal gas cylinder soaked from the inside with special polymers to store inside CO2/O2 times, and on the outside is covered with hypalon to protect against weather conditions and ultraviolet light. This gas cylinder is suitable for storage inside any industrial gas under pressure. \n\nATTRIBUTES: \n-Technological device \n-Fuel for cooking"
ITEM.category = "Fuel"
ITEM.price = 1736
ITEM.exRender = false
ITEM.weight = 8
ITEM.kerosinAmount = 8

ITEM.model = "models/kek1ch/decor_janov_32.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(224.84808349609, 187.87902832031, 147.58396911621),
	ang = Angle(25, 220, 0),
	fov = 4.8615716244981
}

function ITEM:getDesc()
	local str
	str = self.desc.."%s litre(s) left"
	return Format(str, self:getData("kerosinAmount"))
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		local kerosinAmount = item:getData("kerosinAmount", item.kerosinAmount or 1)
		draw.SimpleText(kerosinAmount, "nutIconFont", 4, y, Color(255, 255, 255, 255))
	end
end

function ITEM:onInstanced()
	if not self:getData("kerosinAmount") then
		self:setData("kerosinAmount", self.kerosinAmount)
	end
end
