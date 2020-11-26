ITEM.name = "UKM ID"
ITEM.desc = "The document of the military employees of Ukraine, it contains data, which are entered into the system, and automatically gives the right to enter the environmental disaster zone. \n\nATTRIBUTES: \n-Personal belonging"
ITEM.category = "misc"
ITEM.price = 9535
ITEM.exRender = false
ITEM.weight = 0.02

ITEM.model = "models/kek1ch/identity_card.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(165.60510253906, 191.08280944824, 19.108280181885),
	ang = Angle(4.3000001907349, -130.89999389648, 2.2929935455322),
	fov = 2.8
}

ITEM:hook("drop", function(item)
	return false
end)

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory) then
		return true
	end
end

ITEM.functions.Use = {
	onRun = function(item)
		local client = item.player
		if not item:getData("name") == "Empty" then
			client:getChar():getInv():add("docsbu", 1, {name = client:getChar():getName()})
			return true
		end

		return false
	end
}

function ITEM:getDesc()
	local description = self.desc.."\n\nName: "..self:getData("name", "Empty").."."
	return description
end

