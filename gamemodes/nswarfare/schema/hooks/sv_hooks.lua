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

local RandomRenegatModel = {
	"models/spenser/kek1ch/renegat_kek1ch_kurtka.mdl",
	"models/spenser/kek1ch/renegat_kek1ch_plash.mdl",
	"models/spenser/kek1ch/renegat_normal_kek1ch.mdl"
}

function SCHEMA:PlayerDeath(victim, weapon, attacker)
	if (attacker:IsPlayer()) and (victim != attacker) then
		if table.HasValue(relations_allies_f[team.GetName(attacker:Team())].allies, team.GetName(victim:Team())) then
			attacker:getChar():setData("rep", attacker:getChar():getData("rep", 0) - 5)
		else
			if serverguard.player:GetRank(attacker) == 'vip' then
				attacker:getChar():setData("rep", attacker:getChar():getData("rep", 0) + 2)
			else
				attacker:getChar():setData("rep", attacker:getChar():getData("rep", 0) + 1)
			end
		end

		if serverguard.player:GetRank(attacker) == 'vip' then
			attacker:getChar():setData("rank", attacker:getChar():getData("rank", 0) + 2)
		else
			attacker:getChar():setData("rank", attacker:getChar():getData("rank", 0) + 1)
		end

		if attacker:HasQuest( "quest_killer_rep" ) == victim:Name() then
			if not (attacker:getChar():getData("repkiller") == victim:Name()) then
				attacker:getChar():setData("repkiller", victim:Name())
				attacker:ConCommand("say Quest: Kill the stalker complete")
			end
		end

		if (attacker:getChar():getData("rep") < -100) and not (attacker:Team() == FACTION_RENEGAT) then
			local faction = nut.faction.indices[FACTION_RENEGAT]
			if (faction) then
				attacker:getChar().vars.faction = faction.uniqueID
				attacker:getChar():setFaction(faction.index)
				attacker:SetModel(string.gsub(table.Random(RandomRenegatModel), "spenser", "hdmodels"))
			end
		end
	end
end

function SCHEMA:OnPlayerHitGround( ply, inWater, onFloater, speed )
    ply:ViewPunch(Angle(8, 0, 0))
end

function SCHEMA:PostPlayerLoadout(client)
	client:Give("weapon_cop_bolt")
end

function SCHEMA:PlayerDisconnected(ply)

	for k,v in pairs(player.GetAll()) do
		if v:HasQuest("quest_killer_rep") == ply:Name() then
			v:ConCommand("say Quest failed "..v:HasQuest("quest_killer_rep").." dissapeared.")
			v:RemoveQuest("quest_killer_rep")
		end
	end
end

function SCHEMA:OnNPCKilled( npc, attacker, inflictor )
	if (attacker:IsPlayer()) then
		attacker:getChar():setData("rep", attacker:getChar():getData("rep", 0) + 1)
		attacker:getChar():setData("rank", attacker:getChar():getData("rank", 0) + 1)
	end
end	

function SCHEMA:OnCharCreated(client, character)
	character:setData("rank", 1)
	character:setData("rep", 1)
	client:setNetVar("rank", character:getData("rank", 0))
	client:setNetVar("rep", character:getData("rep", 0))

	if character:getInv() then		
		character:getInv():add("pda", 1, {})
		character:getInv():add("knife", 1, {})
		character:getInv():add("pm", 1, {})
		character:getInv():add("tinderbox", 1, {})
		character:getInv():add("tinderboxfuel", 1, {})
		character:getInv():add("blow", 1, {})
		character:getInv():add("9x18", 3, {})
		character:getInv():add("kowelek", 1, {})
		character:getInv():add("bint", 2, {})
		character:getInv():add("1000r", 1, {})
		character:getInv():add("bread", 1, {})
		character:getInv():add("konservi", 1, {})
		character:getInv():add("water", 1, {})]]
	end

	character:setData("act_table", {"Sitting on ground #1", "Sitting on ground #2", "Stand with arms crossed",
	"Squat", "Lean against the wall", "Scan anomaly #1", "Weapons' on shoulder", "Push up", 
	"Hostage", "Crouch", "Sit", "Lean against the table #1", "Lean against the wall #1", 
	"Lean against the table #2", "Attention", "Salute", "Gop stop", "Surrender", "Wave", 
	"Ask to lower weapon"})

	if (client:Team() == FACTION_MONOLIT) then
		table.Add(client:getChar():getData("act_table"), {"Trance"})
		character:setData("act_table", character:getData("act_table"))
	end

	--[[nut.item.newInv(character:getID(), "safe."..character:getID(), function(inventory)
		character:setData("safebox", inventory:getID())
	end)

	nut.item.inventories[character:getData("safebox")]:getID():add("water", 1, {})]]
end

local tabe_patch = {
[FACTION_LONER] = "ploner",
[FACTION_MERCENARIES] = "pmerc",
[FACTION_MILITARY] = "pmilitary",
[FACTION_RAIDERS] = "pbandit",
[FACTION_FREEDOM] = "pfreedom",
[FACTION_NATO] = "pnato",
[FACTION_DUTY] = "pdolg",
[FACTION_CLEARSKY] = "pclearsky",
[FACTION_MONOLIT] = "ploner"
}

function SCHEMA:PlayerSpawn(client)
	if (client:getChar()) then 
		client:Flashlight(false)
		client:setNetVar("rank", client:getChar():getData("rank", 0))
		client:setNetVar("rep", client:getChar():getData("rep", 0))
		client:setNetVar("drunk", false)
		client:Freeze(false)
		client:GodDisable()

		table.Add(client:getChar():getData("act_table"), {"Sitting on ground #1", "Sitting on ground #2"})
		client:getChar():setData("act_table", client:getChar():getData("act_table"))
		client:getChar():setData("act_table", client:getChar():getData("act_table"))
		--table.Add(client:getChar():getData("act_table"), {"first_sit"})
		--[[table.RemoveByValue( client:getChar():getData("act_table"), "first_sit" )
		--PrintTable(client:getChar():getData("act_table"))]]

		if not client:getChar():getInv():hasItem(tabe_patch[client:Team()]) then
			if client:getChar():getData("safebox") then
				if not nut.item.inventories[client:getChar():getData("safebox")]:hasItem(tabe_patch[client:Team()]) then 
					client:getChar():getInv():add(tabe_patch[client:Team()], 1)
				end
			end
		end
	end

	--------------------------------------------
	--Спавн зомби при низком онлайне
	--------------------------------------------
	if (#player.GetAll() < 6) then
		timer.Create("GamemodeSurvival", 1000, 0, function()
			if table.Count(ents.FindByClass("ssk_zombie")) < (4 * #player.GetAll()) then
				local Zombie = ents.Create("ssk_zombie")
				local PlayerVector = table.Random(player.GetAll()):GetPos()
				Zombie:SetPos(PlayerVector + Vector(math.random(600,900), math.random(600,900), 1000))
				Zombie:Spawn()
			end
		end)
	else
		timer.Remove("GamemodeSurvival")
	end
end

local deathsounds = {
"pain/die1.ogg",
"pain/die2.ogg",
"pain/die3.ogg",
"pain/die4.ogg"
}

function SCHEMA:GetPlayerDeathSound(client)
	return table.Random(deathsounds)
end

local sounds = {
"pain/pain1.ogg",
"pain/pain2.ogg",
"pain/pain3.ogg",
"pain/pain4.ogg",
"pain/pain5.ogg",
"pain/pain6.ogg",
"pain/pain7.ogg",
"pain/pain8.ogg"
}

function SCHEMA:GetPlayerPainSound(client)
	return table.Random(sounds)
end

function SCHEMA:PlayerHurt(client, attacker, health, damage)
	if client:getChar():getInv():hasItem("svistok") and not (attacker == client) then
		for k,v in pairs(ents.GetAll()) do
			if client:getChar():getInv():hasItem("svistok"):getData("DOG_ID") == v.uniqueid then
				v:SetEnemy( attacker )
			end
		end
	end
end

local artefacts_rad = {
"momboosy",
"colobok",
"cvetok",
"fireball",
"glas",
"goldfish",
"gravy",
"kristal",
"krovkamna",
"meduza",
"nightstar",
"snefinka",
"pyzir",
"soul",
"vyvert",
"batary"
}

concommand.Add("givekek1chflag", function(client,_,_,name)
	for k,v in pairs(player.GetAll()) do
		if v:Name() == name then
			v:getChar():giveFlags("O")
			print("Чтож.. Ты выдал "..v:Name().."'у флаг.")
		end
	end 
end)

