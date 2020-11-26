ITEM.name = "Bulldog 6"
ITEM.desc = "This weapon type is used to increase infantry firepower in urban combat. It has been used in some local conflicts, such as Chechnya. The front-charging drum cameras are formed by six rifled barrels identical to those used in sub-barrel grenade launchers. \n\nAmmunition VOG-25"
ITEM.price = 71072
ITEM.class = "weapon_cop_rg6"
ITEM.weaponCategory = "1"
ITEM.category = "Weapon"
ITEM.model = "models/wick/weapons/stalker/stcopwep/w_rg6_model_stcop.mdl"
ITEM.width = 4
ITEM.height = 2
ITEM.weight = 7.76
ITEM.exRender = false
ITEM.iconCam = {
	pos = Vector(-4, 200, -1),
	ang = Angle(0, 270, 0),
	fov = 9
}

ITEM:hook("drop", function(item)
	return false
end)

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory) then
		return true
	end
end

