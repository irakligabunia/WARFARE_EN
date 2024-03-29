ITEM.name = "Lighter"
ITEM.desc = "A reliable, waterproof source of fire in the zone is important not only for smoking, but also for cooking. This metal gas lighter is an ineline choice for use in the zone. \n\nATTRIBUTES: \n-Usages: cooking, smoking, burning a campfire \n\nRecharged with: Lighter fuel"
ITEM.price = 1059
ITEM.tinderboxAmount = 8
ITEM.exRender = false
ITEM.weight = 0.08

ITEM.model = "models/kek1ch/dev_lighter.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(52.157264709473, 43.82067489624, 33.007293701172),
	ang = Angle(25, 220, 0),
	fov = 3.1
}

ITEM.functions.use = {
    name = "refuel lighter",
    onRun = function(item)
        local client = item.player
		local items = client:getChar():getInv():hasItem("tinderboxfuel")
		if (items) then
			local inv = client:getChar():getInv() 
			item:setData("tinderboxAmount", item:getData("tinderboxAmount", 0) + 8)
			client:EmitSound(Sound( "interface/inv_lighter_refiller.ogg"))
			client:getChar():getInv():remove(client:getChar():getInv():hasItem("tinderboxfuel"):getID()) 						
		end
		return false
    end,
    onCanRun = function(item)
        return !IsValid(item.entity)
    end
}

function ITEM:getDesc()
	local str
	str = self.desc.."%s left."
	return Format(str, self:getData("tinderboxAmount"))
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		local tinderboxAmount = item:getData("tinderboxAmount", item.tinderboxAmount or 1)
		draw.SimpleText(tinderboxAmount, "nutIconFont", 4, y, Color(255, 255, 255, 255))
	end
end

function ITEM:onInstanced()
	if !self:getData("tinderboxAmount") then
		self:setData("tinderboxAmount", self.tinderboxAmount)
	end
end
