ITEM.name = "Psi helmet"
ITEM.desc = "A prototype developed by scientists to protect against psi radiation. It is headphones are filled with mesh, that continues to cover the entire head. Dimensions allow you to wear it under the hood, helmet, helmet and other equipment. \n\nATTRIBUTES: \n-Important item \n-Equipment \n-Povides reliable protection against psi-radiation sources"
ITEM.price = 38900
ITEM.exRender = false

ITEM.model = "models/kek1ch/item_psi_helmet.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(-203.82165527344, 106, 111),
	ang = Angle(25, -27.515924453735, 0),
	fov = 3.4
}

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("equip")) then
			surface.SetDrawColor(110, 255, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	return !self:getData("equip")
end
