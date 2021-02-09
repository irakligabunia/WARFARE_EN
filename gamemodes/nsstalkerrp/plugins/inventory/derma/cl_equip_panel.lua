local PANEL = {}

function PANEL:Init(uniqueID)

	self:SetSize(ScrW() * 0.3, ScrH() * 0.682)
	self:SetTitle("")
	self:ShowCloseButton(false)
	self:SetDraggable(false)
    self:SetVisible(false)

end


vgui.Register("equipment_panel", PANEL, "DFrame")
netstream.Hook("equipment_panel", function()
	equipment_panel = vgui.Create("equipment_panel")
end)
