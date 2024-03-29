local PANEL = {}

function PANEL:Init(uniqueID)

	self:SetSize(ScrW() * 0.3059, ScrH() * 0.202)
	self:MakePopup()
	self:SetTitle("")
	self:ShowCloseButton(false)
	self:SetDraggable(false)

	self.icon = self:Add("nutModelPanel")
	self.icon:SetSize(ScrW() * 0.085, ScrH() * 0.121)
	self.icon:SetPos(ScrW() * 0.0115, ScrH() * 0.06)

	local Hit = LocalPlayer():GetEyeTraceNoCursor()
	local entity = Hit.Entity

	if (entity:getNetVar("name") == "Safe") then
		self.icon:SetModel(entity:GetModel())
		self.icon:SetFOV(40)
		self.icon:SetCamPos(Vector( -30, 80, 23 ))
	elseif (entity:getNetVar("name") == "Backpack") then
		self.icon:SetModel(entity:GetModel())
		self.icon:SetFOV(40)
		self.icon:SetCamPos(Vector( -30, 80, 23 ))
	end

	function self:Think()
		if ((self.updateurmodel4kek or 0) < CurTime()) then
			if (entity:getNetVar("plyName")) then
				self.icon:SetModel(entity:GetModel())
				function self.icon:LayoutEntity( Entity ) return end
				if self.icon.Entity:LookupBone("bip01_head") then
					local headpos = self.icon.Entity:GetBonePosition( self.icon.Entity:LookupBone("bip01_head"))

					self.icon:SetLookAt(headpos)
					self.icon:SetCamPos(headpos-Vector( -18, 2.5, 4 ))
					self.icon:SetFOV(70)
				end
				self.updateurmodel4kek = CurTime() + 0.4
			end
		end
	end	
end

function PANEL:OnRemove()
	urmodel = nil
	urname = nil
	urfaction = nil
	urrank = nil
	urrep = nil
	collectgarbage()
end

function PANEL:setup()
	local Hit = LocalPlayer():GetEyeTraceNoCursor()
	local entity = Hit.Entity
	local name = entity:getNetVar("plyName")

	for k, v in pairs(player.GetAll(name)) do 
		local ranktext = v:getChar():getData("rank")
		local reptext = v:getChar():getData("rep")

		if v:getChar() then
			urmodel = v:getChar():getModel()
			urname = v:Name()
			urfaction = team.GetName(v:Team())
			isvisim = 1

			if (ranktext) then
				if (ranktext >= 12000) then
					urrank = "Legend"
				elseif (ranktext >= 5200 and ranktext <= 11999) then
					urrank = "Master"
				elseif (ranktext >= 3200 and ranktext <= 5199) then
					urrank = "Expert"
				elseif (ranktext >= 2000 and ranktext <= 3199) then
					urrank = "Veteran"
				elseif (ranktext >= 1000 and ranktext <= 1999) then
					urrank = "Professional"
				elseif (ranktext >= 600 and ranktext <= 999) then
					urrank = "Experienced"
				elseif (ranktext >= 200 and ranktext <= 599) then
					urrank = "Rookie"
				elseif (ranktext <= 199) then
					urrank = "Trainee"
				end
			end
			if (reptext) then
				if (reptext >= 2000) then 
					urrep = "Excellent"
				elseif (reptext >= 1000 and reptext <= 1999) then
					urrep = "Great"
				elseif (reptext >= 500 and reptext <= 999) then
					urrep = "V.Good"
				elseif (reptext >= 100 and reptext <= 499) then
					urrep = "Good"
				elseif (reptext >= -29 and reptext <= 99) then
					urrep = "Neutral"
				elseif (reptext >= -79 and reptext <= -30) then
					urrep = "Bad"
				elseif (reptext >= -299 and reptext <= -80) then
					urrep = "V.Bad"
				elseif (reptext >= -599 and reptext <= -300) then
					urrep = "Terrible"
				elseif (reptext <= -600) then
					urrep = "Worst of all"
				end
			end
		end
	end
end

function PANEL:Paint(w, h)

	local Hit = LocalPlayer():GetEyeTraceNoCursor()
	local entity = Hit.Entity

	nut.util.drawBlur(self, 10)
	surface.SetDrawColor(Color( 20, 20, 20, 220))
	surface.DrawRect( 0, 0, w, h )
	surface.DrawOutlinedRect(0, 0, w, h)

	surface.SetDrawColor(0, 0, 14, 150)
	surface.DrawRect(ScrW() * 0, ScrH() * 0, ScrW() * 0.41, ScrH() * 0.033)

	surface.SetDrawColor(Color( 30, 30, 30, 90))
	surface.DrawOutlinedRect(ScrW() * 0, ScrH() * 0, ScrW() * 0.41, ScrH() * 0.033) --шапка

	surface.SetDrawColor(Color( 138, 149, 151, 60))
	surface.DrawLine(ScrW() * 0.018, ScrH() * 0.0325, ScrW() * 0.29, ScrH() * 0.0325)

	surface.SetDrawColor(0, 0, 14, 150)
	surface.DrawRect(ScrW() * 0.0115, ScrH() * 0.0575, ScrW() * 0.085, ScrH() * 0.125) --фон модели игрока

	surface.SetDrawColor(Color( 0, 0, 0, 255))
	surface.DrawOutlinedRect(ScrW() * 0.0115, ScrH() * 0.0575, ScrW() * 0.085, ScrH() * 0.125) --обводка модели игрока

	draw.DrawText("Searching", "Roh20", ScrW() * 0.005, ScrH() * 0.003, Color(255, 255, 255, 210), TEXT_ALIGN_LEFT)

	draw.DrawText("Faction:", "Roh10", ScrW() * 0.1, ScrH() * 0.085, Color(255, 255, 255, 210), TEXT_ALIGN_LEFT) --team.GetColor(character:getFaction()) Фракция

	draw.DrawText("Rank:", "Roh10", ScrW() * 0.1, ScrH() * 0.106, Color(255, 255, 255, 210), TEXT_ALIGN_LEFT)

	draw.DrawText("Reputation:", "Roh10", ScrW() * 0.1, ScrH() * 0.127, Color(255, 255, 255, 210), TEXT_ALIGN_LEFT)

	draw.DrawText(entity:getNetVar("rep") or urrep or "---", "Roh10", ScrW() * 0.292, ScrH() * 0.127, Color(255, 255, 255, 210), TEXT_ALIGN_RIGHT)

	surface.SetDrawColor(0, 0, 14, 150)
	surface.DrawRect(ScrW() * 0.1, ScrH() * 0.15, ScrW() * 0.193, ScrH() * 0.0325) --информация о предмете


	if entity:getNetVar("name") == "Stash" then
		draw.DrawText((nut.gui["inv"..entity:getInv():getID()].money or 0).."₽", "Roh20", ScrW() * 0.105, ScrH() * 0.155, Color(255, 255, 255, 210), TEXT_ALIGN_LEFT)
	elseif entity:getNetVar("name") == "Safe" then
		draw.DrawText((LocalPlayer():getChar():getReserve() or 0).."₽", "Roh20", ScrW() * 0.105, ScrH() * 0.155, Color(255, 255, 255, 210), TEXT_ALIGN_LEFT)
	end

	if entity:getNetVar("name") == "Safe" or entity:getNetVar("name") == "Backpack" or entity:getNetVar("name") == "Stash" then
		draw.DrawText(entity:getNetVar("name"), "Roh20", ScrW() * 0.1, ScrH() * 0.06, Color(255, 255, 255, 210), TEXT_ALIGN_LEFT)
		draw.DrawText("---", "Roh10", ScrW() * 0.292, ScrH() * 0.085, Color(255, 255, 255, 210), TEXT_ALIGN_RIGHT)
		draw.DrawText("---", "Roh10", ScrW() * 0.292, ScrH() * 0.106, Color(255, 255, 255, 210), TEXT_ALIGN_RIGHT)
	else
		if entity:getNetVar("plyName") then
			draw.DrawText(entity:getNetVar("plyName"), "Roh20", ScrW() * 0.1, ScrH() * 0.06, Color(255, 255, 255, 210), TEXT_ALIGN_LEFT)
		end
		draw.DrawText(entity:getNetVar("frac") or urfaction or "---", "Roh10", ScrW() * 0.292, ScrH() * 0.085, Color(255, 255, 255, 210), TEXT_ALIGN_RIGHT)
		draw.DrawText(entity:getNetVar("rank") or urrank or "---", "Roh10", ScrW() * 0.292, ScrH() * 0.106, Color(255, 255, 255, 210), TEXT_ALIGN_RIGHT)
		draw.DrawText("--- ₽", "Roh20", ScrW() * 0.105, ScrH() * 0.155, Color(255, 255, 255, 210), TEXT_ALIGN_LEFT)
	end
end

vgui.Register("safe_info_kek", PANEL, "DFrame")
netstream.Hook("safe_info_kek", function()
	safe_info_kek = vgui.Create("safe_info_kek")
end)

