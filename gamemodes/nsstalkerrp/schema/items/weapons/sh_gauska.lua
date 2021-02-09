ITEM.name = "Experiment 62 'Gaus Rifle'"
ITEM.desc = "The ultra-precision high-thnological weapon, known as 'Experiment 62,' was developed by the designers of the secret laboratory inside the zone. The principle of its action is based on the acceleration of the bullet system electromagnets; The bullet is able to develop superch accuracy, which provides a colossal punching ability with almost no recoil. Some artifacts are used to ensure sufficient battery power. \n\nAmmunition Gaus batteries"
ITEM.price = 459504
ITEM.class = "weapon_cop_gauss"
ITEM.weaponCategory = "1"
ITEM.category = "Weapon"
ITEM.exRender = false
ITEM.weight = 8.15

ITEM.model = "models/weapons/wick/stcopwep/w_gaus_model_stcop.mdl"
ITEM.width = 4
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(-8, 200, 1.7000000476837),
	ang = Angle(0, 270, 0),
	fov = 13
}

ITEM:hook("drop", function(item)
	return false
end)

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory) then
		return true
	end
end
