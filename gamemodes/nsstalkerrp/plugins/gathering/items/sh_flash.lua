ITEM.name = "Flash"
ITEM.desc = "A flash is an artefact formed in places saturated with an electromagnetic field. Not so rare, but not so common. It has an amazing property to absorb electric current, redirecting discharges from the body to itself. 'Charged' flashes in everyday life are used as 'small power plants.'  \n\nATTRIBUTES: \n-Artefact \nRadiation +2 / sec"
ITEM.price = 8964
ITEM.isAnomaly = true
ITEM.weight = 0.82

ITEM.model = "models/kek1ch/electra_flash.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(478.31607055664, 401.55526733398, 291.64785766602),
	ang = Angle(25, 220, 0),
	fov = 1.7197452229299
}

ITEM.functions.Use = {
	name = "put in case",
	onRun = function(item)
		local client = item.player
		if (IsValid(item.player) && client:Alive()) then
			if not client:getChar():getInv():hasItem("simkemp") then
				client:notify("You need an empty artefact case.")
				return false
			end
			client:EmitSound( Sound( "interface/inv_iam_close.ogg" ), Entity( 1 ):GetPos(), 1, CHAN_AUTO, 1, 20, 0, 100 )
			client:getChar():getInv():add("simk_flash")
			client:getChar():getInv():remove(client:getChar():getInv():hasItem("simkemp"):getID()) 
			client:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 1, 3 )
			timer.Simple(1,function()
				client:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0 ), 1, 3 )
			end)
		end
	end,

	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
