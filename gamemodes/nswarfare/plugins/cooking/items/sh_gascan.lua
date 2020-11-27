ITEM.name = "Canister (8 litres)"
ITEM.desc = "A large, half-empty metal canister with gasoline. The canisters were delivered to the zone in large quantities with Ukrainian military equipment. \n\nATTRIBUTES: \n-Technological device \n-Fuel for cooking"
ITEM.category = "Fuel"
ITEM.price = 1609
ITEM.exRender = false
ITEM.weight = 7.52
ITEM.kerosinAmount = 8

ITEM.model = "models/kek1ch/kanistra.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(0, 200, 12),
	ang = Angle(0, 270, 0),
	fov = 8.6
}

ITEM:hook("use", function(item)
	item.player:EmitSound("items/battery_pickup.wav")
end)

ITEM.functions._use = { 
	name = "fill",
	onRun = function(item)
		local client = item.player
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector()*96
			data.filter = client
		local trace = util.TraceLine(data)
		local ent = trace.Entity

		if (ent and IsValid(ent) and ent.spawnedVehicle) then
			local percent
			ent:fillGas(1000)
			percent = (ent:getNetVar("gas") / ent.maxGas)*100
			client:notify("Done filling", client, percent)
			return true
		else
			client:notify(L("vehicleGasLook", client))
		end

		return false
	end,
	onCanRun = function(item)
		return (!item:getData("spawned"))
	end
}

function ITEM:getDesc()
	local str
	str = self.desc.." %s litre(s) left"
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
