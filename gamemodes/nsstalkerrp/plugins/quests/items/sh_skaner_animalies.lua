ITEM.name = "Anomalous activity scanner"
ITEM.desc = "A prototype anomaly scanner that measures the enviroment for any anomalous activity."
ITEM.price = 0
ITEM.weight = 0.01

ITEM.model = "models/kek1ch/scanner_anomaly.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(-500, 229.29936218262, 203.94595336914),
	ang = Angle(19, -24.60000038147, 0),
	fov = 2
}

ITEM.functions.use = { 
	name = "use",
	tip = "useTip",
	icon = "icon16/drive.png",
	onRun = function(item)
		local ply = item.player
		local data = {}
		data.start = ply:GetShootPos()
		data.endpos = data.start + ply:GetAimVector()*200
		data.filter = ply
		local trace = util.TraceLine(data)

		if (ply:getChar():getData("quest_boroda_scaner") == ply:GetQuest( "quest_boroda_scaner" )) then ply:notify("The quest has already been completed.") return false end

		if ply:HasQuest( "quest_boroda_scaner" ) then
			for k, v in pairs(ents.FindInSphere( ply:GetPos(), 300 )) do
				if (v:GetClass() == ply:HasQuest( "quest_boroda_scaner" )) then
					local skaner = ents.Create("skaner_animalies")
					skaner:SetPos(trace.HitPos + trace.HitNormal * 10)
					skaner:Spawn()
					ply:Freeze(true)
					timer.Create("frizitem"..ply:UniqueID(),5,1,function()
						ply:Freeze(false)
					end)
					ply:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 1, 3 )
					timer.Simple(1,function()
						ply:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0 ), 1, 3 )
					end)
					ply:getChar():setData("quest_boroda_scaner", ply:GetQuest( "quest_boroda_scaner" ))
					ply:getChar():getInv():remove(ply:getChar():getInv():hasItem("skaner_animalies"):getID()) 
				end
			end
		else
			ply:notify("The item can only be installed if you have the quest activated.")
		end
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
