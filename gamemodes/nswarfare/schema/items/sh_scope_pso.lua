ITEM.name = "PSO-01 Scope"
ITEM.price = 50170
ITEM.desc = "The widespread optical sight of Soviet-made fixed multiples (5). Equipped with a scale to determine the range to the target. A swallow-tail mount is used to install the scope on a Warsaw-Pact weapon"
ITEM.weight = 0.01
ITEM.exRender = false

ITEM.model = "models/weapons/wick/stcopwep/ak_pso.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(1, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 4.6
}

ITEM.functions.Equip = {
	name = "attach",
	onCanRun = function(item)				
		return (!IsValid(item.entity))
	end,

	onRun = function(item)
		item.player:notify("Attachment attached!")
		item.player:EmitSound(Sound("weapons/stalker_cop/addon_attach.wav"))
		item:setData("equip", true)
		return false
	end
}

ITEM.functions.EquipUn = {
	name = "remove",
	onCanRun = function(item)				
		return (!IsValid(item.entity))
	end,

	onRun = function(item)
		item.player:notify("Attachment removed!")
		item.player:EmitSound(Sound("weapons/stalker_cop/addon_detach.wav"))
		item:setData("equip", false)
		return false
	end
}

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("equip")) then
			surface.SetDrawColor(110, 255, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

