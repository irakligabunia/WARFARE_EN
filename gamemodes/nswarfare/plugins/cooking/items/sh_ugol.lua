ITEM.name = "Charcoal (3 kg)"
ITEM.desc = "Charcoal derived from hardwood used to cook meat, fish, vegetables in roasters and barbecues. \n\nATTRIBUTES: \n-Technological device\n-Fuel for cooking"
ITEM.category = "Fuel"
ITEM.price = 585
ITEM.weight = 3.10
ITEM.kerosinAmount = 3
ITEM.weight = 5.11

ITEM.model = "models/kek1ch/charcoal.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 3.6
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
