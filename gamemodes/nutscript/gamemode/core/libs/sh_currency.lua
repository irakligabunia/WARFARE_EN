nut.currency = nut.currency or {}
nut.currency.symbol = nut.currency.symbol or "$"
nut.currency.singular = nut.currency.singular or "dollar"
nut.currency.plural = nut.currency.plural or "dollars"

function nut.currency.set(symbol, singular, plural)
	nut.currency.symbol = symbol
	nut.currency.singular = singular
	nut.currency.plural = plural
end
nut.currency.Set = nut.currency.set

function nut.currency.get(amount)
	if (amount == 1) then
		return nut.currency.symbol.."1 "..nut.currency.singular
	else
		return nut.currency.symbol..amount.." "..nut.currency.plural
	end
end
nut.currency.Get = nut.currency.get

function nut.currency.spawn(pos, amount, angle)
	if (!pos) then
		print("[Nutscript] Can't create currency entity: Invalid Position")
	elseif (!amount or amount < 0) then
		print("[Nutscript] Can't create currency entity: Invalid Amount of money")
	end

	local money = ents.Create("nut_money")
	money:SetPos(pos)
	-- double check for negative.
	money:setNetVar("amount", math.Round(math.abs(amount)))
	money:SetAngles(angle or Angle(0, 0, 0))
	money:Spawn()
	money:Activate()

	return money
end
nut.currency.Spawn = nut.currency.spawn

function GM:OnPickupMoney(client, moneyEntity)
	if (moneyEntity and moneyEntity:IsValid()) then
		local amount = moneyEntity:getAmount()

		client:getChar():giveMoney(amount)
		client:notifyLocalized("moneyTaken", nut.currency.get(amount))
	end
end

do
	local character = nut.meta.character

	function character:hasMoney(amount)
		if (amount < 0) then
			print("Negative Money Check Received.")	
		end

		return self:getMoney() >= amount
	end
	character.HasMoney = character.hasMoney

	function character:giveMoney(amount, kek)
		if (!kek) then
			nut.log.add(self:getPlayer(), "money", amount)
		end
		
		self:setMoney(self:getMoney() + amount)

		return true
	end
	character.GiveMoney = character.giveMoney

	function character:takeMoney(amount)
		nut.log.add(self:getPlayer(), "money", -amount)
		amount = math.abs(amount)
		self:giveMoney(-amount, true)

		return true
	end
	character.TakeMoney = character.takeMoney
end
