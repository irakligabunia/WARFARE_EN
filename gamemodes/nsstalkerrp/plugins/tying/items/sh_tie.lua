ITEM.name = "Elastic Zipties"
ITEM.desc = "A pair of elastic zipties, often used to tie a person's hands and incapicate them. "
ITEM.price = 759
ITEM.exRender = false

ITEM.model = "models/kek1ch/rope.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 3.7
}

local relations_allies_f = {}
relations_allies_f["Loners"] = {allies = {"Loners", "Duty", "Freedom", "Clear Sky", "Ecologists", "Traders"}}
relations_allies_f["Bandits"] = {allies = {"Bandits", "Freedom", "Mercenaries"}}
relations_allies_f["Duty"] = {allies = {"Duty", "Freedom", "Ecologists", "Military", "Clear Sky", "Traders"}}
relations_allies_f["Freedom"] = {allies = {"Freedom", "Loners", "Ecologists", "Bandits", "Mercenaries", "Traders", "Clear Sky"}}
relations_allies_f["Monolith"] = {allies = {"Monolith", "Zombified"}}
relations_allies_f["Zombified"] = {allies = {"Monolith", "Zombified"}}
relations_allies_f["Military"] = {allies = {"Ecologists", "Military", "Duty"}}
relations_allies_f["Mercenaries"] = {allies = {"Mercenaries", "Freedom", "Bandits"}}
relations_allies_f["Ecologists"] = {allies = {"Ecologists", "Military", "Loners", "Duty", "Clear Sky"}}
relations_allies_f["Clear Sky"] = {allies = {"Clear Sky", "Loners", "Duty", "Freedom", "Traders","Ecologists"}}
relations_allies_f["Traders"] = {allies = {"Traders", "Loners", "Duty", "Freedom", "Clear Sky", "Ecologists"}}
relations_allies_f["Администратор"] = {allies = {"Администратор"}}

--[[ITEM.functions.Use = {
	onRun = function(item)
		if (item.beingUsed) then
			return false
		end

		local client = item.player
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector()*96
			data.filter = client
		local target = util.TraceLine(data).Entity

		if table.HasValue(relations_allies_f[team.GetName(client:Team())].allies, team.GetName(target:Team())) then
			client:getChar():setData("rep", client:getChar():getData("rep") - 20)
		end

		if (IsValid(target) and target:IsPlayer() and target:getChar() and !target:getNetVar("tying") and !target:getNetVar("restricted")) then
			item.beingUsed = true

			client:EmitSound("physics/plastic/plastic_barrel_strain"..math.random(1, 3)..".wav")
			client:setAction("@tying", 5)
			client:doStaredAction(target, function()
				item:remove()

				target:setRestricted(true)
				target:setNetVar("tying")

				client:EmitSound("npc/barnacle/neck_snap1.wav", 100, 140)
			end, 5, function()
				client:setAction()

				target:setAction()
				target:setNetVar("tying")

				item.beingUsed = false
			end)

			target:setNetVar("tying", true)
			target:setAction("@beingTied", 5)
		else
			item.player:notifyLocalized("plyNotValid")
		end

		return false
	end,
	onCanRun = function(item)
		return !IsValid(item.entity)
	end
}]]

function ITEM:onCanBeTransfered(inventory, newInventory)
	return !self.beingUsed
end
