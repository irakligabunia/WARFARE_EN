ENT.Type 		= "anim"
ENT.Base 		= "wick_base" 
ENT.Category 		= "Warfare ENT" 
 
ENT.PrintName	= "The Wish Granter"
ENT.Author		= "WickedRabbit" 
ENT.Contact		= "" 
 
ENT.Spawnable		= true --Spawnable?
ENT.AdminSpawnable	= false --If spawnable, is it admin only?
   
 
function ENT:Draw() 
	self:DrawModel()  
end
