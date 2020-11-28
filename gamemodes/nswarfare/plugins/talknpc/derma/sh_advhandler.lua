local PLUGIN = PLUGIN
nut.plugin = nut.plugin or {}
nut.plugin.list = nut.plugin.list or {}
local questPLUGIN = nut.plugin.list.quests
if not questPLUGIN then
    print( 'quest_honeya example will not work properly without "quest" plugin.' )
end

PLUGIN.SpecialCall =
{
		--[[["quest_mnash"] = {
            sv = function( client, data )
                if client:HasQuest( "quest_mnash" ) then
                	for k, v in pairs(client:GetQuest( "quest_mnash" )) do
						if client:getChar():getInv():hasItem( k ) then
							if client:getChar():getInv():getItemCount( k ) >= v then
								local nagrada = {
                				"pm",
                				"aksu"
                				}
								client:getChar():getInv():add(table.Random(nagrada))
    							for i = 1, v do client:getChar():getInv():remove(client:getChar():getInv():hasItem( k ):getID()) end
								client:RemoveQuest( "quest_mnash" )
								data.done = true
							end
						else
							data.done = false
						end
					end
                else
                    data.gotquest = true
               		local rkek = {
               			kek1 = {
							["pdolg"] = 2
               			},

               			kek2 = {
							["pmerc"] = 2
               			}
              	 	}
                    client:AddQuest( "quest_mnash", table.Random(rkek) )
                    for k, v in pairs(client:GetQuest( "quest_mnash" )) do
						client:ConCommand("say Задание: принести сталкеру предмет - "..nut.item.list[k].name.." в количестве "..v.." шт.")
					end
                end
                return data
            end,
            cl = function( client, panel, data )
               if data.gotquest then
					for k, v in pairs(LocalPlayer():GetQuest( "quest_mnash" )) do
						panel:AddChat( data.name, "Принеси мне предмет "..nut.item.list[k].name.." в количестве "..v.." шт.")
                        panel:AddChat( LocalPlayer():Name(), "Я берусь.")
					end
					panel.talking = false
                    return
                end
                if data.done then
                    panel:AddChat( data.name, "Сегодня видишь, ты мне помог, а завра и я тебе.")
                else
                    for k, v in pairs( LocalPlayer():GetQuest( "quest_mnash" ) ) do
                        panel:AddChat( data.name, "Принес предмет "..nut.item.list[k].name.." в количестве "..v.." шт.?" )
                    end
                end
                panel.talking = false
            end,
        },]]

        ["quest_medicamenti"] = {
            sv = function( client, data )
                if client:HasQuest( "quest_medicamenti" ) then
                    for k, v in pairs(client:GetQuest( "quest_medicamenti" )) do
                        if client:getChar():getInv():hasItem( v ) then
                            local Medicamenti = {
                                [1] = "medkit",
                                [2] = "pm"
                            }
                            client:getChar():getInv():add(Medicamenti[math.random(1,2)])
                            client:getChar():getInv():remove(client:getChar():getInv():hasItem( v ):getID())
                            client:getChar():setData("quest_medicamenti", nil)
                            client:RemoveQuest( "quest_medicamenti" )
                            data.done = true
                            collectgarbage()
                            break
                        else
                            data.done = false
                        end
                    end
                else
                    data.gotquest = true
                    local rkek = {
                        kek1 = {
                            ["в пещере рядом с заправкой"] = "medic_container" --на местоположении находится gathering
                        },
                        --контейнер можно будет вскрыть, но тогда репутация уменьшится и квест провалится
                        kek2 = {
                            ["на сгоревшем хуторе"] = "medic_container"
                        },
                        
                        kek3 = {
                            ["на лесопилке"] = "medic_container"
                        },
                    }
                    client:AddQuest( "quest_medicamenti", table.Random(rkek) )
                    for k, v in pairs(client:GetQuest( "quest_medicamenti" )) do
                        client:ConCommand("say Job: bring the medic a "..nut.item.list[v].name..".")
                    end
                end
                return data
            end,
            cl = function( client, panel, data )
               if data.gotquest then --Вы слышите бормотание, а после взгляд медика устремился на вас. - Чего хотел? Дырка какая, или ожог. Может рану зашить? Только ты учти, у меня сейчас туговато с медикаментами.
                    for k, v in pairs(LocalPlayer():GetQuest( "quest_medicamenti" )) do --Может, помочь с чем смогу? 
                        panel:AddChat( data.name, "With a heavy sigh, looked at you, apparently appreciating your experience, and said, 'Well, I can give you a mark on one stash of mine, "..k..". If you bring me its contents, namely "..nut.item.list[v].name.." - Your conscience is clear. Just remember how many lives you're going to kill.")
                        panel:AddChat( LocalPlayer():Name(), "I'm taking it.")
                    end
                    panel.talking = false
                    return
                end
                if data.done then
                    panel:AddChat( data.name, "You saved a few lives. Here, this is for you.")
                else
                    for k, v in pairs( LocalPlayer():GetQuest( "quest_medicamenti" ) ) do
                        panel:AddChat( data.name, "How's our case going? Let me remind you that the stash is located "..k..", where you'll find a "..nut.item.list[v].name.."." )
                    end
                end
                panel.talking = false
            end,
        },

        ["quest_syltan_sobake"] = {
            sv = function( client, data )
                if client:HasQuest( "quest_syltan_sobake" ) then
                    for k, v in pairs(client:GetQuest( "quest_syltan_sobake" )) do
                        if client:getChar():getInv():hasItem( k ) then
                            if client:getChar():getInv():getItemCount( k ) >= v then
                                local Sobake = {
                                [1] = "12x70",
                                [2] = "pm",
                                [3] = "9x18"
                                }
                                client:getChar():giveMoney(math.random(2000, 4000))
                                client:getChar():getInv():add(Sobake[math.random(1,3)], 3)
                                for i = 1, v do client:getChar():getInv():remove(client:getChar():getInv():hasItem( k ):getID()) end
                                client:RemoveQuest( "quest_syltan_sobake" )
                                data.done = true
                                break
                            end
                        else
                            data.done = false
                        end
                    end
                else
                    data.gotquest = true
                    local kek1 = {
                        ["food_ruchkasamodrochka4"] = math.random(3, 12)
                    },
                    client:AddQuest( "quest_syltan_sobake", kek1 )
                    for k, v in pairs(client:GetQuest( "quest_syltan_sobake" )) do
                        client:ConCommand("say Mission: bring the Sultan - "..v.." tails of pseudo-dogs.")
                    end
                end
                return data
            end,
            cl = function( client, panel, data )
               if data.gotquest then
                    for k, v in pairs(LocalPlayer():GetQuest( "quest_syltan_sobake" )) do
                        panel:AddChat( data.name, "In short, that ointment has not yet proved. You're not a sucker, you're responsible for words, but this is just the beginning. There were dogs raging here recently, our kid was bitten. You're going to shoot some and bring some tails... Around "..v.." pieces." )
                        panel:AddChat( LocalPlayer():Name(), "Мля, да ты шо думаешь, я чепушила какой? Ща сделаю все в лучшем виде.")
                    end
                    panel.talking = false
                    return
                end
                if data.done then
                    panel:AddChat( data.name, "Holy shit! You're still alive. Here you go, you earned it.")
                else
                    for k, v in pairs( LocalPlayer():GetQuest( "quest_syltan_sobake" ) ) do
                        panel:AddChat( data.name, "Did you forget already? Bring "..v.." pseudo dog tails.")
                    end
                end
                panel.talking = false
            end,
        },

        ["quest_boroda_scaner"] = {
            sv = function( client, data )
                if client:HasQuest( "quest_boroda_scaner" ) then
                    if (client:getChar():getData("quest_boroda_scaner") == client:GetQuest( "quest_boroda_scaner" )) then  
                        local BorodaScaner = {
                        [1] = "tea",
                        [2] = "vodka",
                        [3] = "konservi",
                        [4] = "water",
                        [5] = "gorka_3",
                        [6] = "kolbasa"
                        }
                        client:getChar():getInv():add(BorodaScaner[math.random(1,6)], 1) 
                        client:getChar():giveMoney(math.random(6000, 9000))
                        client:getChar():setData("quest_boroda_scaner", nil)
                        client:RemoveQuest( "quest_boroda_scaner" )
                        data.done = true
                    else
                        data.done = false
                    end
                else
                    data.gotquest = true

                    local anomalies = {
                    "jarka",
                    "kisel_anomaly",
                    "gazirovka_anomaly",
                    "kometa",
                    "electra_anomaly"
                    }

                    client:AddQuest( "quest_boroda_scaner", table.Random(anomalies) )
                    client:ConCommand("say Quest: Install an anomalous activity scanner near the anomaly.")
                    client:getChar():getInv():add("skaner_animalies")
                    timer.Simple(1, function()
                        client:ConCommand("say Received object: Anomalous activity scanner")
                    end)
                end
                return data
            end,
            cl = function( client, panel, data )
                if data.gotquest then
                    panel:AddChat( data.name, "Greetings, young man. There's a lot of work to do, but there's no one to send. Everybody's drinking. You go to and do something for me, and get money and experience in return. You have to go there, at the «"..L(LocalPlayer():GetQuest( "quest_boroda_scaner" )).."» anomaly, put a scanner and come back back. Don't worry, the reward is good." )
                    panel:AddChat( LocalPlayer():Name(), "Alright... Prepare the money.")
                    panel:AddChat( data.name, "That's the way. Come on, I'm always here.")
                    panel.talking = false
                    return
                end
                if data.done then
                    panel:AddChat( data.name, "Well done! I didn't doubt you, except a little bit. Okay, here's your payment for your hard work.")
                else
                    panel:AddChat( data.name, "At the anomaly «"..L(LocalPlayer():GetQuest( "quest_boroda_scaner" )).."» go there and put the anomalous activity scanner I gave you near it.")
                end
                panel.talking = false
            end,
        },

        ["quest_killer_rep"] = {
            sv = function( client, data )
                if client:HasQuest( "quest_killer_rep" ) then
                    if client:getChar():getData("repkiller") == client:GetQuest( "quest_killer_rep" ) then
                        local RepKiller = {
                        [1] = "lr300",
                        [2] = "spas",
                        [3] = "sg550",
                        [4] = "fnfs2000",
                        }
                        client:getChar():getInv():add(RepKiller[math.random(1,4)])
                        client:RemoveQuest( "quest_killer_rep" )
                        client:getChar():setData("repkiller", nil)
                        collectgarbage()
                        data.done = true
                    else
                        data.done = false
                    end
                else
                    for k,v in RandomPairs(player.GetAll()) do
                        if (!v:Team() == FACTION_ADMIN) and (!client:Name() == v:Name()) and (v:getChar():getData("rep") < -40) then
                            print(v:getChar():getData("rep"))
                            client:AddQuest( "quest_killer_rep", v:Name() )
                            --[[timer.Simple(1, function()
                                client:ConCommand("say Задание: Найти и уничтожить сталкера: ".. client:HasQuest( "quest_killer_rep" ))
                            end)]]
                            data.gotquest = true
                        else
                            data.gotquest = false
                        end
                    end
                end
                return data
            end,
            cl = function( client, panel, data )
               if data.gotquest == true then
                    panel:AddChat( data.name, "Lately, there have been too many scumbags who have decided that someone has allowed them to destroy the balance of the zone. There is a whole list of such individuals. Start with "..LocalPlayer():GetQuest( "quest_killer_rep" )..". There is no information about his stay, so you will have to find out the information yourself. Payment is good.")
                    panel:AddChat( LocalPlayer():Name(), "Consider him already dead.")
                    panel.talking = false
                    return
                elseif data.gotquest == false then
                    panel:AddChat( data.name, "There's nothing.")
                    panel.talking = false
                    return
                end
                if data.done then
                    panel:AddChat( data.name, "Well, I think the invisible observers will be happy. Your reward.")
                else
                    if LocalPlayer():GetQuest( "quest_killer_rep" ) then
                        panel:AddChat( data.name, LocalPlayer():GetQuest( "quest_killer_rep" ).." still alive?" )
                    end
                end
                panel.talking = false
            end,
        },

        ["quest_medic"] = {
            sv = function( client, data )
                if client:getChar():getMoney() >= 2100 then
                    client:EmitSound( "interface/inv_bandage_2p9.ogg" )
                    client:SetHealth( 105 )
                    client:getChar():takeMoney(2100)
                    data.done = 1
                elseif client:Health() >= 100 then
                    data.done = 2
                else
                    data.done = 0
                end
                return data
            end,
            cl = function( client, panel, data )
                if data.done == 1 then
                    panel:AddChat( data.name, "So, that's all... You can go. By the way, it costs you 2100..." )
                    panel.talking = false
                    return
                elseif data.done == 0 then
                    panel:AddChat( data.name, "I'm sorry, but you don't have enough money." )
                    panel.talking = false
                    return
                elseif data.done == 2 then
                    panel:AddChat( data.name, "Let me adjust your skirt a little bit... That's it, you can go." )
                    panel.talking = false
                    return
                end
            end,
        },

         ["quest_21o4ko"] = {
            sv = function( client, data )
                return data
            end,
            cl = function( client, panel, data )
                vgui.Create("21o4ko")
                panel:AddChat( data.name, "Hand it out." )
                panel.talking = false
            end,
        },

        ["quest_fixarmor"] = {
            sv = function( client, data )
                return data
            end,
            cl = function( client, panel, data )
                vgui.Create("fixmygearplz_tehnik")
                panel:AddChat( data.name, "Let's see what you've got in there." )
                panel.talking = false
            end,
        },

		["quest_bandit_informator1"] = {
            sv = function( client, data )
                if client:HasQuest( "bandit_informator1" ) then
                    local pqst_dat = client:GetQuest( "bandit_informator1" )
					if (client:getChar():hasMoney(5000)) then
                    if client:CanCompleteQuest( "bandit_informator1", pqst_dat ) then
                        client:RemoveQuest( "bandit_informator1" )
						client:getChar():takeMoney(5000)
							local faction = nut.faction.indices[FACTION_RAIDERS]
							if (faction) then
								local faction = nut.faction.indices[FACTION_RAIDERS]
							    local character = client:getChar()
							
							    character.vars.faction = faction.uniqueID
							    character:setFaction(faction.index)
							end
							local character = client:getChar() 
							if !character then return end 
							local faction = nut.faction.indices[character:getFaction()] 
							client:ConCommand("say /zfracquestc"..faction.name.."")
							timer.Simple(0.7, function()
							client:ConCommand("say /zlostmoney 5000")
							end)
                        data.done = true
                    else
                        data.done = false
                    end
				end
                else
                    data.gotquest = true 
                    local d_qst = questPLUGIN:GetQuest( "bandit_informator1" )
                    client:AddQuest( "bandit_informator1" ) 
                end
                return data 
            end,
            cl = function( client, panel, data )
                if data.gotquest then
                    local d_qst = questPLUGIN:GetQuest( "bandit_informator1" )
                    local pqst_dat = LocalPlayer():GetQuest( "bandit_informator1" )
                    panel:AddChat( data.name, "Why didn't you go straight to the ploughman Sultan... Oh, I forgot, you wouldn't be allowed to see him a metre, why did you forget those hoodrats? Okay, it's none of my business, we'll do it for 5,000 rubles." )
                    panel.talking = false 
                    return
                end
                if data.done then
                    panel:AddChat( data.name, "Okay, I'm starting to update your data. Right... Now we will update your profile in the global stalker network... Old data is being erased... That's it, now you're a Bandit! Good luck gop-stopping in the zone, haha! Oh, and take the Bandit jacket with you.")
                else
                    panel:AddChat( data.name, "No, man, it's not going to work, you don't have any money, come back when you have 5,000 rubles.")
                    local d_qst = questPLUGIN:GetQuest( "bandit_informator1" )
                    local pqst_dat = LocalPlayer():GetQuest( "bandit_informator1" )
                end
                panel.talking = false
            end,
        },

		["quest_bandit_informator3"] = {
            sv = function( client, data )
                if client:HasQuest( "bandit_informator3" ) then
                    local pqst_dat = client:GetQuest( "bandit_informator3" )
					if (client:getChar():hasMoney(200000)) then
                    if client:CanCompleteQuest( "bandit_informator3", pqst_dat ) then
                        client:RemoveQuest( "bandit_informator3" )
						client:getChar():takeMoney(200000)
						client:getChar():getInv():add("military_skat") 
						client:getChar():getInv():add("groza")
                        client:getChar():getInv():add("gorka_3")
							local faction = nut.faction.indices[FACTION_MERCENARIES]
							if (faction) then
								local faction = nut.faction.indices[FACTION_MERCENARIES]
							    local character = client:getChar()
							
							    character.vars.faction = faction.uniqueID
							    character:setFaction(faction.index)
							end
							local character = client:getChar() 
							if !character then return end 
							local faction = nut.faction.indices[character:getFaction()] 
							client:ConCommand("say /zfracquestc"..faction.name.."")
							timer.Simple(0.8, function()
							client:ConCommand("say /zlostmoney 200000")
							end)
							timer.Simple(1.6, function()
							client:ConCommand("say /ztakeitem «SKAT-9M» Suit")
							end)
							timer.Simple(2.3, function()
							client:ConCommand("say /ztakeitem OTs-14 Groza")
							end)
						
                        data.done = true
                    else
                        data.done = false
                    end
				end
                else
                    data.gotquest = true 
                    local d_qst = questPLUGIN:GetQuest( "bandit_informator3" )
                    client:AddQuest( "bandit_informator3" ) 
                end
                return data 
            end,
            cl = function( client, panel, data )
                if data.gotquest then
                    local d_qst = questPLUGIN:GetQuest( "bandit_informator3" )
                    local pqst_dat = LocalPlayer():GetQuest( "bandit_informator3" )
                    panel:AddChat( data.name, "It's easy... Just let me explain something. To begin with, I will tell you one thing: it will cost money: 40,000 rubles, otherwise there will be no conversation at all, here is another thing: if you leave the group, there will be no way out. There will be no refunds, so think very well, whether you need it." )
                    panel.talking = false 
                    return
                end
                if data.done then
                    panel:AddChat( data.name, "Okay, I'm starting to update your data. Right... Now we will update your profile in the global stalker network... Old data is being erased... That's it, now you're in the Syndicate. Profitable contracts, and yes, take the equipment")
                else
                    panel:AddChat( data.name, "No, man, it's not going to work, you don't have any money, come back when you have 40,000 rubles.")
                    local d_qst = questPLUGIN:GetQuest( "bandit_informator3" )
                    local pqst_dat = LocalPlayer():GetQuest( "bandit_informator3" )
                end
                panel.talking = false
            end,
        },

        ["quest_ribak_first"] = {
            sv = function( client, data )
                if client:HasQuest( "quest_ribak_first" ) then
                    local RibakFirst = {
                    [1] = "aksu",
                    [2] = "aks74",
                    [3] = "akms",
                    [4] = "aek",
                    }
                    if client:getChar():getInv():hasItem("gorka_3") then
                        client:getChar():getInv():add(RibakFirst[math.random(1,4)])
                        client:getChar():getInv():remove(client:getChar():getInv():hasItem("gorka_3"):getID())
                        client:RemoveQuest( "quest_ribak_first" )
                        data.done = true
                    else
                        data.done = false
                    end
                else
                    data.gotquest = true
                    client:AddQuest( "quest_ribak_first", "gorka_3" )
                    client:ConCommand("say Quest: Bring the Stalker an item - Gorka 3")
                end
                return data
            end,
            cl = function( client, panel, data )
               if data.gotquest then
                    panel:AddChat( data.name, "A suit, namely Gorka. In secret, I want to be like a commando. Well, they are there cool, shoot so piu-pau, strong ... You get it. They also have a quick reaction! ' The stalker painted a picutre of epithets of law enforcement fighters. You zoned out and missed tons of meaningless information, and when you returned to the real world you had time to hear only a snippet of the rambling...")
                    panel:AddChat( LocalPlayer():Name(), "I'll see what I can do.")
                    panel.talking = false
                    return
                end
                if data.done then
                    panel:AddChat( LocalPlayer():Name(), "I brought you a suit. It's a little dented. To be honest, I doubt it's going to make you a strong, hardy, and unruly commando.")
                    panel:AddChat( data.name, "How thrilling! As for the unruly and strong commando, we'll see about that. You'll see, soon the legends will write and sing ballads of me.")
                else
                    panel:AddChat( data.name, "What's going on? Did you bring the Gorka")
                end
                panel.talking = false
            end,
        },

        ["quest_ribak_second"] = {
            sv = function( client, data )
                local RibakSecond = {
                [1] = "aksu",
                [2] = "blackbox",
                [3] = "chzo",
                [4] = "pkm",
                [5] = "deagle",
                }

                if client:HasQuest( "quest_ribak_second" ) then
                    if client:getChar():getInv():hasItem("6b_armor") then
                        client:getChar():getInv():add(RibakSecond[math.random(1,5)])
                        client:getChar():getInv():remove(client:getChar():getInv():hasItem("6b_armor"):getID())
                        client:RemoveQuest( "quest_ribak_second" )
                        data.done = true
                    else
                        data.done = false
                    end
                else
                    data.gotquest = true
                    client:AddQuest( "quest_ribak_second", "6b_armor" )
                    client:ConCommand("say Quest: Bring the Stalker an item - 6b Armored vest")
                end
                return data
            end,
            cl = function( client, panel, data )
               if data.gotquest then
                    panel:AddChat( data.name, "Oh, another one. What are you looking at, asshole? Funny? Yeah, it's pretty funny that you aren't the one wearing these rags...")
                    panel:AddChat( LocalPlayer():Name(), "Why so angry? I'm not a therapist, but I can help in other ways. Of course, if you don't be rude to me.")
                    panel:AddChat( data.name, " Well, if that's the case... Okay, I'm sorry, I'm just on my nerves, and even this suit ...  In short, listen: I wanted to buy myself a set of clothes, well camouflage such, all business. Picked on these internet websites, paid everything through the card and waited. Well, the suit's here, I'm unpacking, and there's this creature. I didn't have time to scandal, so I ran away. My friend who I came with to this place with told me that people won't laugh at me, and that stalkers have a specific sense of humor... Sorry, I'm off topic. At first everything was harmless, but then these jokes took on the scale and eventually I was called Rybak. But it's not that bad, is it? I saw a military soldier recently, and they have such trendy vests, a kind of 6B vest. Please bring me one, it is big and covers the entire body... I'll be finally able to put those monkeys in their place, and no one will laugh at me anymore!")
                    panel.talking = false
                    return
                end
                if data.done then
                    panel:AddChat( LocalPlayer():Name(), "The 6B is a heavy vest... Watch out, and don't put in your boat, unless you want to swim back ashore!")
                    panel:AddChat( data.name, "Very funny. I knew you wouldn't have a problem finding it, the military here are glorified stalkers in reality. But I'm not that squeamish. The Rybak slings a backpack from his back, puts it on the ground and crouches down, rustling and turning everything inside. After groping the desired object, he still on his knees handed you a small, old bag, consisting entirely of tarpaulin patches. Here, that's for your hard work, and now let me retire to try on a new accessory.")
                else
                    panel:AddChat( data.name, "What's going on? Did you bring the vest?" )
                end
                panel.talking = false
            end,
        },

         ["quest_bartihan4ik"] = {
            sv = function( client, data )
                if client:HasQuest( "quest_bartihan4ik" ) then
                    if client:getChar():getInv():hasItem("bartihan4ik_life") then
                        local Bartihan = {
                        [1] = "6b_armor",
                        [2] = "medic_container",
                        [3] = "chzo",
                        [4] = "pkm",
                        [5] = "psihelem",
                        }
                        client:getChar():getInv():add(Bartihan[math.random(1,5)])
                        client:getChar():getInv():remove(client:getChar():getInv():hasItem("bartihan4ik_life"):getID())
                        client:RemoveQuest( "quest_bartihan4ik" )
                        data.done = true
                    elseif client:getChar():getInv():hasItem("bartihan4ik_dead") then
                        client:getChar():getInv():add("pm")
                        client:RemoveQuest( "quest_bartihan4ik" )
                        data.done = "pizdec"
                    else
                        data.done = false
                    end
                else
                    data.gotquest = true
                    client:AddQuest( "quest_bartihan4ik", "bartihan4ik_life" )
                    client:ConCommand("say Quest: Bring the Stalker an item: Bartihanchik")
                end
                return data
            end,
            cl = function( client, panel, data )
               if data.gotquest then
                    panel:AddChat( LocalPlayer():Name(), "Hey, why are you sad? Need help?")
                    panel:AddChat( data.name, "'What can you even do for me? She was small, dark... I've got a rat, his name was Bartyhanchik. . . . Are you really ready to help?' Not waiting for your answer, the stalker continued. 'Bartyihanchik loved caves, the damp and dark ones and big, endless holes. I left him in my backpack, turned away for a second and he was gone, there is no Bartihanchik... Look for him in these burrows under the burnt-out farm, I'll give you a cage to carry. Just be careful not to scare him off, he's already stressed.")
                    panel.talking = false
                    return
                end
                if (LocalPlayer():getChar():getInv():hasItem("bartihan4ik_life")) then
                    panel:AddChat( LocalPlayer():Name(), "I brought your rat, she was really deep in those caves . How did she get through the anomalies?")
                    panel:AddChat( data.name, "Thank you, thank you from the bottom of my heart! As for the caves, she is small, and has a good instinct of danger. Maybe she dug holes, or something. The main thing is that Bartihanchik is alive and well, thank you. Here, hold on, I didn't think you'd help.")
                elseif (LocalPlayer():getChar():getInv():hasItem("bartihan4ik_dead")) then
                    panel:AddChat( LocalPlayer():Name(), "I found your rat... Except she's dead, I found her that way.")
                    panel:AddChat( data.name, "Eh... Thank you anyway, stalker, take your reward and leave, please.")
                else
                    panel:AddChat( data.name, "Where's Bartihankchik?" )
                end
                panel.talking = false
            end,
        },

        ["quest_zero_rep"] = {
           sv = function( client, data )
                if (client:getChar():hasMoney((-client:getChar():getData("rep") * 1000))) and (client:getChar():getData("rep") < -50) then
                    client:getChar():takeMoney((-client:getChar():getData("rep") * 1000))
                    client:getChar():setData("rep", 1)
                end
                return data 
            end,
            cl = function( client, panel, data )
                if LocalPlayer():getChar():getData("rep") < -50 then
                    panel:AddChat( LocalPlayer():Name(), "I know you fix problematic stalkers like me... I crossed some wrong bridges at the wrong times, and now everyone wants me dead! I have the money, tell me how much.")
                    panel:AddChat( data.name, "*Looked at you and reached out in a smile: Oh, so those rumors were about you. Yes, there's already tales of your misfortunes ravaging the area, though it still can be fixed. You better take care of this now, because rumors spread like wildfire... I can fix the archives, your photos and stuff, but you know, it's going to cost a round sum. It's going to be considered for you. "..(-LocalPlayer():getChar():getData("rep") * 1000).."Rubles. Well, are you ready to start a new life?")
                    if LocalPlayer():getChar():hasMoney((-LocalPlayer():getChar():getData("rep") * 1000)) then
                        panel:AddChat( LocalPlayer():Name(), "*Transferred the necessary amount to the informant.")
                    else
                        panel:AddChat( LocalPlayer():Name(), "I don't have that kind of money yet.")
                    end
                    panel.talking = false 
                else
                    panel:AddChat( LocalPlayer():Name(), "I know you fix problematic stalkers like me... I crossed some wrong bridges at the wrong times, and now everyone wants me dead! I have the money, tell me how much.")
                    panel:AddChat( data.name, "No dude, you're fine... However very naive... Scramble and grow a head, will you?")
                    panel.talking = false
                end
            end,
        },
}

if SERVER then
    netstream.Hook( "nut_DialogueMessage", function( client, data )
        if string.Left( data.request, 1 ) == "!" then
            data.request = string.sub( data.request, 2 )
            if PLUGIN.SpecialCall[ data.request ] then
                data = PLUGIN.SpecialCall[ data.request ].sv( client, data )
                netstream.Start( client, "nut_DialoguePingpong", data )
            else
                print( Format( "%s( %s ) tried to call invalid dialouge request( %s ) from %s.", client:Name(), client:Nick(), data.request, data.name ) )
                print( "Please check PLUGIN.SpecialCall or NPC's dialouge unique id." )
                client:EmitSound( "HL1/fvox/hev_general_fail.wav" )
            end
        end
    end)
else
    netstream.Hook( "nut_DialoguePingpong", function( data )
        if IsValid( nut.gui.dialogue ) then
            if PLUGIN.SpecialCall[ data.request ] then
                PLUGIN.SpecialCall[ data.request ].cl( client, nut.gui.dialogue, data )
            end
        end
    end)
end

