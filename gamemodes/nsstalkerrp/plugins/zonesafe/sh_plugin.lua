local PLUGIN = PLUGIN
PLUGIN.name = "SafeZone+"
PLUGIN.author = "Kek1ch"
PLUGIN.desc = "..........."
PLUGIN.areaTable = PLUGIN.areaTable or {} --зоны не сохраняются, надо менять areaTable на AreaTable

nut.util.include("sv_plugin.lua")

nut.command.add("setpoint", {
	superAdminOnly = true,
	onRun = function(client, arguments)
		if arguments[1] == "first" then
			PLUGIN.areaTable.FirstPoint = client:GetPos()
			client:PrintMessage(HUD_PRINTTALK, "First point - ("..string.format("%s", PLUGIN.areaTable.FirstPoint)..")")
		elseif arguments[1] == "second" then
			PLUGIN.areaTable.SecondPoint = client:GetPos()
			client:PrintMessage(HUD_PRINTTALK, "Second point - ("..string.format("%s", PLUGIN.areaTable.SecondPoint)..")")
		else
			client:PrintMessage(HUD_PRINTTALK, "You have to specify the first and second point. «/setpoint first» & «/setpoint second»")
		end
	end
})

nut.command.add("activatezone", {
	superAdminOnly = true,
	onRun = function(client, arguments)
		PLUGIN.areaTable.NameZone = arguments[1]
		if not PLUGIN.areaTable.FirstPoint then client:PrintMessage(HUD_PRINTTALK, "You have to specify the first point.") return false end
		if not PLUGIN.areaTable.SecondPoint then client:PrintMessage(HUD_PRINTTALK, "You have to specify the second point.") return false end
		if not PLUGIN.areaTable.NameZone then client:PrintMessage(HUD_PRINTTALK, "You have to enter the name of the territory.") return false end
		AreaAdd(PLUGIN.areaTable.NameZone, PLUGIN.areaTable.FirstPoint, PLUGIN.areaTable.SecondPoint)
		client:PrintMessage(HUD_PRINTTALK, "You created a territory called Base "..PLUGIN.areaTable.NameZone..". first point - ("..string.format("%s", PLUGIN.areaTable.FirstPoint).."), second point - ("..string.format("%s", PLUGIN.areaTable.SecondPoint).."). Good luck, username!")
		PLUGIN.areaTable.NameZone, PLUGIN.areaTable.FirstPoint, PLUGIN.areaTable.SecondPoint = nil
		collectgarbage()
	end
})

function GetAllArea()
	return PLUGIN.areaTable
end

local SaveZonesTable = { --Список сейф зон
	"Loner",
}

if (CLIENT) then
	function PLUGIN:Think()
		if (!LocalPlayer().ZoneDelay or LocalPlayer().ZoneDelay < CurTime()) then
			if (LocalPlayer():getChar() and LocalPlayer():Alive()) then
				for id, areaData in pairs(GetAllArea()) do
					local clientPos = LocalPlayer():GetPos() + LocalPlayer():OBBCenter()
					if (clientPos:WithinAABox(areaData.MinVector, areaData.MaxVector)) then
						if table.HasValue(SaveZonesTable, areaData.NameZone) then
							netstream.Start("SafeMe", true)
						end
					else 
						netstream.Start("SafeMe", nil)
					end
				end
			end
			LocalPlayer().ZoneDelay = CurTime() + 1.6
		end
	end
end

nut.command.add("managerzone", {
	superAdminOnly = true,
	onRun = function(client, arguments)
		if (client:Alive()) then
			netstream.Start(client, "ZoneManager", GetAllArea())
		end
	end
})

local PaintsAreas = {
	["Bandits"] = "kek1ch/icons/bandit_info_icon.png",
	["Clear Sky"] = "kek1ch/icons/clearsky_info_icon.png",
	["Duty"] = "kek1ch/icons/duty_info_icon.png",
	["Freedom"] = "kek1ch/icons/freedom_info_icon.png",
	["Loners"] = "kek1ch/icons/loner_info_icon.png",
	["Mercenaries"] = "kek1ch/icons/merc_info_icon.png",
	["Monolith"] = "kek1ch/icons/monolit_info_icon.png",
	["Ecologists"] = "kek1ch/icons/scientitst_info_icon.png"
}

function PLUGIN:PostDrawHUD()
	for id, areaData in pairs(GetAllArea()) do
		local clientPos = LocalPlayer():GetPos() + LocalPlayer():OBBCenter()
		if (clientPos:WithinAABox(areaData.MinVector, areaData.MaxVector)) then
			if table.HasValue(SaveZonesTable, areaData.NameZone) then
				draw.DrawText("Safezone", "Roh_Low", ScrW() * 0.46, ScrH() * 0.185, Color(255, 255, 255), TEXT_ALIGN_LEFT)
			end

			if (!IsValid(ZoneInfoPanel)) then
				ZoneInfoPanel = vgui.Create("DPanel")
				ZoneInfoPanel:SetPos(ScrW()*0.46, ScrH()*0.2)
				ZoneInfoPanel:SetSize(ScrW()*0.09, ScrH()*0.03)

				function ZoneInfoPanel:Paint( w, h )
					nut.util.drawBlur(self, 10)
					surface.SetDrawColor(Color( 30, 30, 30, 245))
					surface.DrawRect( 0, 0, w, h )
					surface.DrawOutlinedRect(0, 0, w, h)

					draw.DrawText("Base\n"..areaData.NameZone, "Roh_Low", ScrW() * 0.025, ScrH() * 0.001, Color(255, 255, 255, 210), TEXT_ALIGN_LEFT)

					surface.SetDrawColor(Color(255, 255, 255, 255))
					surface.SetMaterial(Material(PaintsAreas[areaData.NameZone]))
					surface.DrawTexturedRect(ScrW()*0.0045, ScrH()*0.0043, ScrW()*0.0155, ScrH()*0.024)

					surface.SetDrawColor(Color(128, 128, 128, 210))
					surface.DrawOutlinedRect(ScrW()*0.0045, ScrH()*0.0043, ScrW()*0.0155, ScrH()*0.024)
				end
			end
		else
			if (IsValid(ZoneInfoPanel)) then
				ZoneInfoPanel:Remove()
			end
		end
	end
end

