function GetDutyTarget( maxHP )
	maxHP = maxHP or nil
	local el = nil
	
	if (gBotMode ~= GetString("dutyMode") or not IsDutyLeader() or ml_task_hub:CurrentTask().encounterData.bossIDs == nil) then
        return nil
    end
	
	local radius = ml_task_hub:CurrentTask().encounterData.radius or 25
	local bossIDs = ml_task_hub:CurrentTask().encounterData.bossIDs or ""
	if (bossIDs == "") then
		if Player.incombat then
			el = EntityList("lowesthealth,attackable,alive,maxdistance="..tostring(radius))
		else
			el = EntityList("nearest,attackable,alive,maxdistance="..tostring(radius))
		end
		if (ValidTable(el)) then
			local id, target = next(el)
			if (ValidTable(target)) then
				if (not maxHP or target.hp.percent > maxHP) then
					return target
				end
			end
		end		
	else
		if (ml_task_hub:CurrentTask().encounterData.prioritize ~= nil) then
			if (ml_task_hub:CurrentTask().encounterData.prioritize) then
				for uniqueid in StringSplit(bossIDs,";") do
					local el = nil
					if Player.incombat then
						el = EntityList("lowesthealth,attackable,alive,contentid="..uniqueid..",maxdistance="..tostring(radius))
					else
						el = EntityList("nearest,attackable,alive,contentid="..uniqueid..",maxdistance="..tostring(radius))
					end
					if (ValidTable(el)) then
						local id, target = next(el)
						if (ValidTable(target)) then
							if (not maxHP or target.hp.percent > maxHP) then
								return target
							end
						end
					end		
				end
			end
		end
		
		if (ml_task_hub:CurrentTask().encounterData["doKill"] == false) then
			el = EntityList("nearest,alive,attackable,targeting=0,contentid="..bossIDs..",maxdistance="..tostring(radius))		
			if (ValidTable(el)) then
				for id, target in pairs(el) do
					if (not maxHP or target.hp.percent > maxHP) then
						return target
					end
				end
			end	
		else
			--First, try to get the best AOE target if we are killing the mobs.
			if (Player.incombat and ml_task_hub:CurrentTask().encounterData["doKill"] == true) then
				el = EntityList("alive,attackable,los,clustered=4,contentid="..bossIDs..",maxdistance="..tostring(radius))	
				if (ValidTable(el)) then
					local highestHP = 1
					local bestAOE = nil
					for id, target in pairs(el) do
						if (target.hp.current > highestHP) then
							if (not maxHP or target.hp.percent > maxHP) then
								bestAOE = target
							end
						end			
					end
					
					if (ValidTable(bestAOE)) then
						return bestAOE
					end
				end	
			end
			
			--Second, try to get the lowesthealth, if we are killing the mobs.
			if (Player.incombat and ml_task_hub:CurrentTask().encounterData["doKill"] == true) then
				el = EntityList("lowesthealth,alive,attackable,los,contentid="..bossIDs..",maxdistance="..tostring(radius))	
				if (ValidTable(el)) then
					local id, target = next(el)
					if (ValidTable(target)) then
						if (not maxHP or target.hp.percent > maxHP) then
							return target
						end
					end
				end	
			end
			
			--Third, try to get the best AOE target if we are killing the mobs, los ignored.
			if (Player.incombat and ml_task_hub:CurrentTask().encounterData["doKill"] == true) then
				el = EntityList("alive,attackable,clustered=4,contentid="..bossIDs..",maxdistance="..tostring(radius))	
				if (ValidTable(el)) then
					highestHP = 1
					bestAOE = nil
					for id, target in pairs(el) do
						if (target.hp.current > highestHP) then
							if (not maxHP or target.hp.percent > maxHP) then
								bestAOE = target
							end
						end			
					end
					
					if (ValidTable(bestAOE)) then
						return bestAOE
					end
				end	
			end
			
			--Fourth, try to get the lowesthealth, if we are killing the mobs, los ignored.
			if (Player.incombat and ml_task_hub:CurrentTask().encounterData["doKill"] == true) then
				el = EntityList("lowesthealth,alive,attackable,contentid="..bossIDs..",maxdistance="..tostring(radius))	
				if (ValidTable(el)) then
					local id, target = next(el)
					if (ValidTable(target)) then
						if (not maxHP or target.hp.percent > maxHP) then
							return target
						end
					end
				end	
			end

			--Lastly, fall back and just get what we can.
			el = EntityList("alive,attackable,contentid="..bossIDs..",maxdistance="..tostring(radius))	
			if (ValidTable(el)) then
				for id, target in pairs(el) do
					if (not maxHP or target.hp.percent > maxHP) then
						return target
					end
				end
			end	
		end
	end
	
    return nil
end

function GetDutyFromID(dutyID)
	local dutyID = tonumber(dutyID)
	local dutyList = Duty:GetDutyList()
	if (ValidTable(dutyList)) then
		for _, duty in pairs(dutyList) do
			if (duty.id == dutyID) then
				return duty
			end
		end
	end
	
	return nil
end

function HasDutyUnlocked(dutyID)
	local dutyID = tonumber(dutyID)
	local dutyList = Duty:GetDutyList()
	if (not dutyList) then
		SendTextCommand("/dutyfinder")
	end
	
	if (dutyList) then
		for _, duty in pairs(dutyList) do
			if (duty.id == dutyID) then
				return true
			end
		end
	end
	
	return false
end

function GetDutyLeaderPos()
	local pos = nil
	
	local leader = GetDutyLeader()
    if (leader) then
		if (leader.pos.x ~= -1000) then
			pos = leader.pos
			local leaderEntity = EntityList:Get(leader.id)
			if (leaderEntity) then
				pos = leaderEntity.pos
			end
		end
	end
	
	return pos
end

function IsDutyLeader()
	if (ffxiv_task_duty.independentMode or gDutySoloQueue == "1") then
		return true
	end
	
	local leader = GetDutyLeader()
	if (leader) then
		return Player.name == leader.name
	end
	return false
end

function IsPartyLeader()
	if (gDutySoloQueue == "1") then
		return true
	end
	
	local partyLeader = GetPartyLeader()
	if (partyLeader) then
		return partyLeader.name == Player.name
	end
	
	return false
end

function IsFullParty()
	if (gDutySoloQueue == "1") then
		return true
	end
	
	local duty = GetDutyFromID(ffxiv_task_duty.mapID)
	if (duty) then
		local partySize = tonumber(duty.partysize)
		local party = EntityList.myparty
		if (party) then
			if (TableSize(party) == partySize) then
				for i,member in pairs(party) do
					if (member.mapid == 0) then
						return false
					end
				end
				return true
			end
		end
	end
	
	return false
end

function NotQueued()
	return Duty:GetQueueStatus() == 0
end

function InQueue()
	return Duty:GetQueueStatus() == 1
end

function IsConfirming()
	return Duty:GetQueueStatus() == 2
end

function IsReadying()
	return Duty:GetQueueStatus() == 3
end

function InInstance()
	return Duty:GetQueueStatus() == 4
end

function OnDutyMap()
	return (Player.localmapid == ffxiv_task_duty.mapID)
end

function PartyInCombat()
	if (gDutySoloQueue == "1") then
		if (Player.incombat) then
			return true
		end
	else
		local party = EntityList.myparty
		if (ValidTable(party)) then
			for i, member in pairs(party) do
				if member.incombat then 
					return true 
				end
				
				local el = EntityList("alive,attackable,targeting="..tostring(member.id))
				if (ValidTable(el)) then
					return true
				end
			end
		end
	end
	
	return false
end

function DutyLeaderLeft()
	if (IsDutyLeader()) then
		return false
	end
	
	local party = EntityList.myparty
	if (party) then
		local leader = GetDutyLeader()
		if (leader) then
			for i, member in pairs(party) do
				if member.name == leader.name then
					return false
				end
			end
		end
    end
	
	return true
end

function GetDutyLeader()
	if (ffxiv_task_duty.leader == "") then
		if c_changeleader:evaluate() then e_changeleader:execute() end
	end
	
	if (gDutySoloQueue == "1") then
		return Player
	else
		local party = EntityList.myparty
		if (ValidTable(party)) then
			if (ffxiv_task_duty.leader ~= "") then
				for i, member in pairs(party) do
					if (member.name == ffxiv_task_duty.leader) then
						return member
					end
				end
			end
		end  
	end
		
	return nil
end

function IsValidCategory(category)
	local category = tonumber(category) or -1
	local categoryOptions = {
		[0] = true, --FILTER_DAILY_ROULETTE,
		[1] = true, --FILTER_DUNGEONS_ARR,
		[2] = true, --FILTER_DUNGEONS_HW,
		[3] = true, --FILTER_GUILDHEST,
		[4] = true, --FILTER_TRIALS_ARR,
		[5] = true, --FILTER_TRIALS_HW,
		[6] = true, --FILTER_RAIDS_ARR,
		[7] = true, --FILTER_RAIDS_HW,
		[8] = true, --FILTER_PVP
	}
	
	if (categoryOptions[category]) then
		return true
	end
	
	local message = {}
	message[1] = "Invalid category value passed in profile."
	message[2] = "Valid values are as follows:"
	message[3] = "0 - FILTER_DAILY_ROULETTE"
	message[4] = "1 - FILTER_DUNGEONS_ARR"
	message[5] = "2 - FILTER_DUNGEONS_HW"
	message[6] = "3 - FILTER_GUILDHEST"
	message[7] = "4 - FILTER_TRIALS_ARR"
	message[8] = "5 - FILTER_TRIALS_HW"
	message[9] = "6 - FILTER_RAIDS_ARR"
	message[10] = "7 - FILTER_RAIDS_HW"
	message[11] = "8 - FILTER_PVP"
	
	ffxiv_dialog_manager.IssueStopNotice("FFXIV_Duty_IsValidCategory", message)
	return false
end