ITEM.name = "Kersone (5 litres)"
ITEM.desc = "Kerosene is a widespread fuel, used in the aviation as a rocket fuel, as well as in the roasting of glass products, lighting and heating devices. \n\nATTRIBUTES: \n-Technological device \n-Fuel for cooking"
ITEM.category = "Fuel"
ITEM.price = 1579
ITEM.exRender = false
ITEM.kerosinAmount = 5
ITEM.weight = 5.11

ITEM.model = "models/kek1ch/kerosene.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(-200, 0, 8.5),
	ang = Angle(0, -0, 0),
	fov = 3.5
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
