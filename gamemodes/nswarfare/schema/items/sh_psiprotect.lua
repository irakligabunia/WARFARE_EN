ITEM.name = "Anti-psi pills"
ITEM.category = "Medicine"
ITEM.desc = "A drug that blocks avalanche-like nerve impulses. An interesting side effect: after taking the drug there is a short-term disappearance of any emotions. In the zone is used to counteract the abnormal fields of increased psi-activity; theres no use beyond it. It has a long-lasting effect."
ITEM.price = 1550
ITEM.weight = 0.02

ITEM.model = "models/kek1ch/drug_psy_blockade.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
  pos = Vector(87.162963867188, 73.138404846191, 53.306564331055),
  ang = Angle(25, 220, 0),
  fov = 5
}

ITEM.functions.use = {
    name = "use",
    onRun = function(item)
       local client = item.player
       client:setNetVar("psy", client:getNetVar("psy", 0) - 25)
       return true
    end,
    onCanRun = function(item)
        return !IsValid(item.entity)
    end
}
