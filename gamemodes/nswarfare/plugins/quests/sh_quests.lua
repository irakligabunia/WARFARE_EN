local PLUGIN = PLUGIN

local QUEST = {}
QUEST.uniqueID = "quest_mnash1"
QUEST.name = "Cleanup"
QUEST.desc = "The commander is concerned about the increasing number of illegal infiltrations through the protected perimeter. He wants you to clear the area of strangers. Bring me %s."
PLUGIN:RegisterQuest( QUEST.uniqueID, QUEST )

QUEST.uniqueID = "quest_medicamenti"
QUEST.name = "Medication for a medic, what else can I say?"
--QUEST.desc = "Командир обеспокоен ростом числа незаконных проникновений через охраняемый периметр. Он хочет, чтобы ты зачистил территорию от посторонних лиц. Принеси мне %s."
PLUGIN:RegisterQuest( QUEST.uniqueID, QUEST )

QUEST.uniqueID = "quest_killer_rep"
QUEST.name = "Restoring balance in the zone"
QUEST.desc = "Some bastards thought they could destroy the balance of the zone with impunity, it's time to kill them."
PLUGIN:RegisterQuest( QUEST.uniqueID, QUEST )

QUEST.uniqueID = "quest_syltan_sobake"
QUEST.name = "Working for the Sultan: Tail of Dogs"
QUEST.desc = "There's a lot of pseudo-dogs that've been raging, and one of them bit one of our guys. I have to kill them and bring their tails as evidence."
PLUGIN:RegisterQuest( QUEST.uniqueID, QUEST )

QUEST.uniqueID = "quest_boroda_scaner"
QUEST.name = "Working on for Beard: Scanning anomalies"
QUEST.desc = "It is necessary to install an anomalous activity scanner near the anomaly."
PLUGIN:RegisterQuest( QUEST.uniqueID, QUEST )

QUEST.uniqueID = "bandit_informator1"
QUEST.name = "Joining the bandits through an informant."
PLUGIN:RegisterQuest( QUEST.uniqueID, QUEST )

QUEST.uniqueID = "bandit_informator2"
QUEST.name = "Joining the military through an informant."
PLUGIN:RegisterQuest( QUEST.uniqueID, QUEST )

QUEST.uniqueID = "quest_ribak_first"
QUEST.name = "We should bring to the Fisherman the best suit in the world - Gorka 3."
PLUGIN:RegisterQuest( QUEST.uniqueID, QUEST )

QUEST.uniqueID = "quest_ribak_second"
QUEST.name = "We should bring Rybak a bulletproof vest, 6B4-23-1"
PLUGIN:RegisterQuest( QUEST.uniqueID, QUEST )

QUEST.uniqueID = "quest_bartihan4ik"
QUEST.name = "Find a mouse named Bartihanchik, to a stalker"
PLUGIN:RegisterQuest( QUEST.uniqueID, QUEST )
