ITEM.name = "Anti-rad pills"
ITEM.category = "Medicine"
ITEM.desc = "The drug radio-protective action Mexamine, widespread in the area. When used causes narrowing of peripheral blood vessels and oxygen starvation, in this case is a means of prevention and treatment of radiation sickness. \n\nATTRIBUTES: \n-Medication \n-Quick injection (syringe) \n-Strong side effects \n\nRadiation - 34"
ITEM.price = 1560
ITEM.weight = 0.02
ITEM.exRender = false

ITEM.model = "models/kek1ch/dev_antirad.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
  pos = Vector(55.049072265625, 46.191646575928, 34.036888122559),
  ang = Angle(25, 220, 0),
  fov = 5
}

ITEM.functions.use = {
    name = "use",
    onRun = function(item)
       local client = item.player
       client:setNetVar("radioactive", client:getNetVar("radioactive", 0) - 74)
       return true
    end,
    onCanRun = function(item)
        return !IsValid(item.entity)
    end
}


