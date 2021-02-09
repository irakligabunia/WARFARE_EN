ITEM.name = "RPG-7"
ITEM.desc = "The simplicity, durability, low cost and efficiency of the RPG-7 has made it the most popular trouble-free anti-tank gun in the world. It is currently produced in various modifictions by nine countries and is in service with more than 40 countries. \n\nAmmunition OG-7B"
ITEM.price = 60364
ITEM.class = "weapon_cop_rpg7"
ITEM.weaponCategory = "1"
ITEM.category = "Weapon"
ITEM.width = 6
ITEM.height = 1
ITEM.weight = 8.26
ITEM.exRender = false

ITEM.model = "models/wick/weapons/stalker/stcopwep/w_rpg_model_stcop.mdl"
ITEM.width = 5
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(3, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 18.917197452229
}

ITEM:hook("drop", function(item)
	return false
end)

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory) then
		return true
	end
end

