ITEM.name = "Bandit Patch"
ITEM.desc = "A patch of the Bandit faction"
ITEM.category = "Patch"
ITEM.price = 2202
ITEM.exRender = false
ITEM.weight = 0.02

ITEM.model = "models/kek1ch/tfw_badge_bandit.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0, 0.050000000745058, 200),
	ang = Angle(90, 0, 0),
	fov = 1.3
}

ITEM:hook("drop", function(item)
	return false
end)

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory) then
		return true
	end
end

