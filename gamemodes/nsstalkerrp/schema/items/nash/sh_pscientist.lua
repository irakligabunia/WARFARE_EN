ITEM.name = "Ecologist Patch"
ITEM.desc = "A patch of the Ecologist faction"
ITEM.category = "Patch"
ITEM.price = 2202
ITEM.exRender = false
ITEM.weight = 0.02

ITEM.model = "models/kek1ch/tfw_scientist.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0, 0.050000000745058, 203),
	ang = Angle(90, 0, 0),
	fov = 1.35
}

ITEM:hook("drop", function(item)
	return false
end)

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory) then
		return true
	end
end

