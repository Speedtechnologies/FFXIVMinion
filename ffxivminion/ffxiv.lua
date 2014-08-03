ml_global_information = {}
--ml_global_information.path = GetStartupPath()
ml_global_information.Now = 0
ml_global_information.lastrun = 0
ml_global_information.MainWindow = { Name = GetString("settings"), x=50, y=50 , width=250, height=450 }
ml_global_information.BtnStart = { Name=strings[gCurrentLanguage].startStop,Event = "GUI_REQUEST_RUN_TOGGLE" }
ml_global_information.BtnPulse = { Name=strings[gCurrentLanguage].doPulse,Event = "Debug.Pulse" }
ml_global_information.CurrentClass = nil
ml_global_information.CurrentClassID = 0
ml_global_information.AttackRange = 2
ml_global_information.TaskUIInit = false
ml_global_information.MarkerMinLevel = 1
ml_global_information.MarkerMaxLevel = 50
ml_global_information.BlacklistContentID = ""
ml_global_information.WhitelistContentID = ""
ml_global_information.MarkerTime = 0
ml_global_information.afkTimer = 0
ml_global_information.IsWaiting = false
ml_global_information.UnstuckTimer = 0
ml_global_information.stanceTimer = 0
ml_global_information.summonTimer = 0
ml_global_information.repairTimer = 0
ml_global_information.windowTimer = 0
ml_global_information.updateFoodTimer = 0
ml_global_information.foodCheckTimer = 0
ml_global_information.lastMode = ""

ml_global_information.chocoStance = {
	[strings[gCurrentLanguage].stFollow] = 3,
	[strings[gCurrentLanguage].stFree] = 4,
	[strings[gCurrentLanguage].stDefender] = 5,
	[strings[gCurrentLanguage].stAttacker] = 6,
	[strings[gCurrentLanguage].stHealer] = 7,
}


FFXIVMINION = {}
FFXIVMINION.SKILLS = {}

ffxivminion = {}
ffxivminion.modes =	{
		[strings[gCurrentLanguage].grindMode] 	= ffxiv_task_grind, 
		[strings[gCurrentLanguage].fishMode] 	= ffxiv_task_fish,
		[strings[gCurrentLanguage].gatherMode] 	= ffxiv_task_gather,
		[strings[gCurrentLanguage].craftMode] 	= ffxiv_task_craft,
		[strings[gCurrentLanguage].assistMode]	= ffxiv_task_assist,
		[strings[gCurrentLanguage].partyMode]	= ffxiv_task_party,
		[strings[gCurrentLanguage].pvpMode]	    = ffxiv_task_pvp,
		[strings[gCurrentLanguage].dutyMode] 	= ffxiv_task_duty,
		[strings[gCurrentLanguage].questMode]	= ffxiv_task_quest,
		[strings[gCurrentLanguage].huntMode]	= ffxiv_task_hunt,
		--["NavTest"]								= ffxiv_task_test,
}

ffxivminion.foods = {}
ffxivminion.foodsHQ = {}

ffxivminion.Strings = {
	BotModes = 
		function ()
			local botModes = "None"
			if ( TableSize(ffxivminion.modes) > 0) then
				local i,entry = next (ffxivminion.modes)
				while i and entry do
					botModes = botModes..","..i
					i,entry = next (ffxivminion.modes,i)
				end
			end
			return botModes
		end,
	SKMProfiles = 
		function () return SkillMgr.UpdateProfiles() end,
	Mounts = 
		function ()
			local MountsList = "None"
			local eq = ActionList("type=13")
			for k,v in pairs(eq) do
				MountsList = MountsList..","..v.name
			end
			return MountsList
		end,
	Meshes = 
		function ()
			local count = 0
			local meshlist = "none"
			local meshfilelist = dirlist(mm.navmeshfilepath,".*obj")
			if ( ValidTable(meshfilelist)) then
				for i, meshname in pairs(meshfilelist) do
					meshname = string.gsub(meshname, ".obj", "")
					meshlist = meshlist..","..meshname
				end
			end
			
			return meshlist
		end,
}

ffxivminion.settingsVisible = false

function ml_global_information.OnUpdate( event, tickcount )
    ml_global_information.Now = tickcount
    
    if (ml_global_information.UnstuckTimer ~= 0 and TimeSince(ml_global_information.UnstuckTimer) > 15000) then
        ml_task_hub:ToggleRun()
        ml_global_information.UnstuckTimer = 0
    end
	
	if ( TimeSince(ml_global_information.repairTimer) > 30000 and gBotRunning == "1" ) then
		ml_global_information.repairTimer = tickcount
		Repair()
	end
	
	if (TimeSince(ml_global_information.windowTimer) > 10000) then
		ml_global_information.windowTimer = tickcount
		ffxivminion.SaveWindows()
	end
	
	if (TimeSince(ml_global_information.updateFoodTimer) > 15000) then
		ml_global_information.updateFoodTimer = tickcount
		ffxivminion.UpdateFoodOptions()
	end
	
	if (gBotRunning == "1") then
		if ( gFood ~= "None" or gFoodHQ ~= "None" ) then
			if ( TimeSince(ml_global_information.foodCheckTimer) > 10000 and not Player.ismounted and not Player:IsMoving()) then
				ml_global_information.foodCheckTimer = tickcount
				Eat()
			end
		end
    end
	
    -- Mesher.lua
    mm.OnUpdate( event, tickcount )
    
    -- skillmgr.lua
    SkillMgr.OnUpdate( event, tickcount )
    
    -- ffxiv_task_fate.lua
    ffxiv_task_grind.UpdateBlacklistUI(tickcount)
    
    -- ml_blacklist.lua
    ml_blacklist.ClearBlacklists()
    
    -- ml_blacklist_mgr.lua
    ml_blacklist_mgr.UpdateEntryTime()
    ml_blacklist_mgr.UpdateEntries(tickcount)
    
    --ffxiv_unstuck.lua
    ffxiv_unstuck.HandleUpdate(tickcount)
    
    gFFXIVMiniondeltaT = tostring(tickcount - ml_global_information.lastrun)
    if (tickcount - ml_global_information.lastrun > tonumber(gFFXIVMINIONPulseTime)) then
        ml_global_information.lastrun = tickcount
        if( ml_task_hub:CurrentTask() ~= nil) then
            gFFXIVMINIONTask = ml_task_hub:CurrentTask().name
        end
		--update marker status
		if (	gBotMode == strings[gCurrentLanguage].grindMode or
				gBotMode == strings[gCurrentLanguage].gatherMode or
				gBotMode == strings[gCurrentLanguage].fishMode or
				gBotMode == strings[gCurrentLanguage].questMode or
				gBotMode == strings[gCurrentLanguage].huntMode) and (
				ValidTable(GetCurrentMarker())) and
				ml_task_hub.shouldRun
		then
			local timesince = TimeSince(ml_global_information.MarkerTime)
			local timeleft = ((GetCurrentMarker():GetTime() * 1000) - timesince) / 1000
			gStatusMarkerTime = tostring(round(timeleft, 1))
		else
			gStatusMarkerName = ""
			gStatusMarkerTime = ""
		end
		
		ffxivminion.CheckClass()
        
        if (not ml_task_hub:Update() and ml_task_hub.shouldRun) then
            ml_error("No task queued, please select a valid bot mode in the Settings drop-down menu")
        end
    end
end

-- Module Event Handler
function ffxivminion.HandleInit()	
    GUI_SetStatusBar("Initalizing FFXIV Module...")
	
	if ( not ffxivminion.Windows) then
		ffxivminion.Windows = {}
	end
	
	ffxivminion.Windows.Main = { Name = GetString("settings"), x=50, y=50, width=210, height=300 }
	ffxivminion.CreateWindow(ffxivminion.Windows.Main)

	if (Settings.FFXIVMINION.version == nil ) then
        Settings.FFXIVMINION.version = 1.0
        Settings.FFXIVMINION.gEnableLog = "0"
    end
    if ( Settings.FFXIVMINION.gFFXIVMINIONPulseTime == nil ) then
        Settings.FFXIVMINION.gFFXIVMINIONPulseTime = "150"
    end
    if ( Settings.FFXIVMINION.gEnableLog == nil ) then
        Settings.FFXIVMINION.gEnableLog = "0"
    end
    if ( Settings.FFXIVMINION.gLogCNE == nil ) then
        Settings.FFXIVMINION.gLogCNE = "0"
    end
    if ( Settings.FFXIVMINION.gBotMode == nil ) then
        Settings.FFXIVMINION.gBotMode = strings[gCurrentLanguage].grindMode
    end
    if ( Settings.FFXIVMINION.gUseMount == nil ) then
        Settings.FFXIVMINION.gUseMount = "0"
    end
    if ( Settings.FFXIVMINION.gUseSprint == nil ) then
        Settings.FFXIVMINION.gUseSprint = "0"
    end
    if ( Settings.FFXIVMINION.gMountDist == nil ) then
        Settings.FFXIVMINION.gMountDist = "75"
    end
    if ( Settings.FFXIVMINION.gSprintDist == nil ) then
        Settings.FFXIVMINION.gSprintDist = "50"
    end
    if ( Settings.FFXIVMINION.gRandomPaths == nil ) then
        Settings.FFXIVMINION.gRandomPaths = "0"
	end	
	if ( Settings.FFXIVMINION.gDisableDrawing == nil ) then
		Settings.FFXIVMINION.gDisableDrawing = "0"
	end
	if ( Settings.FFXIVMINION.gAutoStart == nil ) then
		Settings.FFXIVMINION.gAutoStart = "0"
	end	
	if (Settings.FFXIVMINION.gTeleport == nil) then
        Settings.FFXIVMINION.gTeleport = "0"
    end
    if (Settings.FFXIVMINION.gSkipCutscene == nil) then
        Settings.FFXIVMINION.gSkipCutscene = "0"
    end
    if (Settings.FFXIVMINION.gSkipDialogue == nil) then
        Settings.FFXIVMINION.gSkipDialogue = "0"
    end
    if (Settings.FFXIVMINION.gDoUnstuck == nil) then
        Settings.FFXIVMINION.gDoUnstuck = "0"
    end
	if (Settings.FFXIVMINION.gUseHQMats == nil) then
		Settings.FFXIVMINION.gUseHQMats = "0"
	end
    if (Settings.FFXIVMINION.gClickToTeleport == nil) then
		Settings.FFXIVMINION.gClickToTeleport = "0"
	end
    if (Settings.FFXIVMINION.gClickToTravel == nil) then
		Settings.FFXIVMINION.gClickToTravel = "0"
	end
	if (Settings.FFXIVMINION.gUseAetherytes == nil) then
		Settings.FFXIVMINION.gUseAetherytes = "0"
	end
	if (Settings.FFXIVMINION.gChoco == nil) then
		Settings.FFXIVMINION.gChoco = strings[gCurrentLanguage].none
	end
	if (Settings.FFXIVMINION.gMount == nil) then
		Settings.FFXIVMINION.gMount = strings[gCurrentLanguage].none
	end
    if (Settings.FFXIVMINION.gChocoStance == nil) then
		Settings.FFXIVMINION.gChocoStance = strings[gCurrentLanguage].stFree
	end
	if (Settings.FFXIVMINION.gRepair == nil) then
		Settings.FFXIVMINION.gRepair = "1"
	end
	if (Settings.FFXIVMINION.gGatherPS == nil) then
		Settings.FFXIVMINION.gGatherPS = "0" 
	end
	if (Settings.FFXIVMINION.gFoodHQ == nil) then
		Settings.FFXIVMINION.gFoodHQ = "None" 
	end
	if (Settings.FFXIVMINION.gFood == nil) then
		Settings.FFXIVMINION.gFood = "None" 
	end
	
	local winName = ffxivminion.Windows.Main.Name
	--GUI_NewButton(ffxivminion.Windows.Main.Name, GetString("advancedSettings"), "ToggleAdvancedSettings")
	GUI_NewButton(winName, strings[gCurrentLanguage].skillManager, "SkillManager.toggle")
    GUI_NewButton(winName, strings[gCurrentLanguage].meshManager, "ToggleMeshmgr")
    GUI_NewButton(winName, strings[gCurrentLanguage].blacklistManager, "ToggleBlacklistMgr")
	GUI_NewButton(winName, strings[gCurrentLanguage].markerManager, "ToggleMarkerMgr")
	GUI_NewButton(winName,strings[gCurrentLanguage].profileManager,"QMToggleMain")
	
	local group = GetString("botStatus")
	GUI_NewField(winName,strings[gCurrentLanguage].pulseTime,"gFFXIVMINIONPulseTime",group )
    GUI_NewCheckbox(winName,strings[gCurrentLanguage].enableLog,"gEnableLog",group )
    GUI_NewCheckbox(winName,strings[gCurrentLanguage].logCNE,"gLogCNE",group )
    GUI_NewField(winName,strings[gCurrentLanguage].task,"gFFXIVMINIONTask",group )
	GUI_NewField(winName,strings[gCurrentLanguage].markerName,"gStatusMarkerName",group )
	GUI_NewField(winName,strings[gCurrentLanguage].markerTime,"gStatusMarkerTime",group )
	
	local group = GetString("generalSettings")
    GUI_NewCheckbox(winName,strings[gCurrentLanguage].autoStartBot,"gAutoStart",group)
	GUI_NewCheckbox(winName,strings[gCurrentLanguage].useAetherytes,"gUseAetherytes",group )
	GUI_NewCheckbox(winName,strings[gCurrentLanguage].useMount,"gUseMount",group )
	GUI_NewComboBox(winName,strings[gCurrentLanguage].mount, "gMount",group,GetMounts())
    GUI_NewNumeric(winName,strings[gCurrentLanguage].mountDist,"gMountDist",group )
    GUI_NewCheckbox(winName,strings[gCurrentLanguage].useSprint,"gUseSprint",group )
    GUI_NewNumeric(winName,strings[gCurrentLanguage].sprintDist,"gSprintDist",group )
	GUI_NewComboBox(winName,strings[gCurrentLanguage].companion, "gChoco",group,"")
	gChoco_listitems = strings[gCurrentLanguage].none..","..strings[gCurrentLanguage].grindMode..","..strings[gCurrentLanguage].assistMode..","..strings[gCurrentLanguage].any
	GUI_NewComboBox(winName,strings[gCurrentLanguage].stance,"gChocoStance",group,"")
	gChocoStance_listitems = strings[gCurrentLanguage].stFree..","..strings[gCurrentLanguage].stDefender..","..strings[gCurrentLanguage].stAttacker..","..strings[gCurrentLanguage].stHealer..","..strings[gCurrentLanguage].stFollow
	GUI_NewComboBox(winName,"Food", 	"gFood", group, "None")
	GUI_NewComboBox(winName,"HQ Food", 	"gFoodHQ", group, "None")
	GUI_NewCheckbox(winName,strings[gCurrentLanguage].randomPaths,"gRandomPaths",group )
	GUI_NewCheckbox(winName,strings[gCurrentLanguage].doUnstuck,"gDoUnstuck",group )
	GUI_NewCheckbox(winName,strings[gCurrentLanguage].useHQMats,"gUseHQMats",group )
	GUI_NewButton(winName, GetString("multiManager"), "MultiBotManager.toggle", group)
	GUI_NewButton(winName,"Cast Prevention","CastPrevention.toggle",group)
	GUI_NewButton(winName,"Shortcut Manager","ShortcutManager.toggle",group)
	
	local group = GetString("hacks")
	GUI_NewCheckbox(winName,strings[gCurrentLanguage].repair,"gRepair",group)
	GUI_NewCheckbox(winName,strings[gCurrentLanguage].disabledrawing,"gDisableDrawing",group)
	GUI_NewCheckbox(winName,strings[gCurrentLanguage].teleport,"gTeleport",group)
	GUI_NewCheckbox(winName, strings[gCurrentLanguage].permaSprint, "gGatherPS",group)
    GUI_NewCheckbox(winName,strings[gCurrentLanguage].skipCutscene,"gSkipCutscene",group )
	GUI_NewCheckbox(winName,strings[gCurrentLanguage].skipDialogue,"gSkipDialogue",group )
	GUI_NewCheckbox(winName,strings[gCurrentLanguage].clickToTeleport,"gClickToTeleport",group)
	GUI_NewCheckbox(winName,strings[gCurrentLanguage].clickToTravel,"gClickToTravel",group)
	
	ffxivminion.SizeWindow(winName)
	GUI_WindowVisible(winName, false)
	
	gEnableLog = Settings.FFXIVMINION.gEnableLog
    gFFXIVMINIONPulseTime = Settings.FFXIVMINION.gFFXIVMINIONPulseTime
    gUseMount = Settings.FFXIVMINION.gUseMount
    gUseSprint = Settings.FFXIVMINION.gUseSprint
    gMountDist = Settings.FFXIVMINION.gMountDist
    gSprintDist = Settings.FFXIVMINION.gSprintDist
    gRandomPaths = Settings.FFXIVMINION.gRandomPaths
	gDisableDrawing = Settings.FFXIVMINION.gDisableDrawing
    gAutoStart = Settings.FFXIVMINION.gAutoStart
    gSkipCutscene = Settings.FFXIVMINION.gSkipCutscene
    gSkipDialogue = Settings.FFXIVMINION.gSkipDialogue
    gDoUnstuck = Settings.FFXIVMINION.gDoUnstuck
    gUseHQMats = Settings.FFXIVMINION.gUseHQMats	
    gClickToTeleport = Settings.FFXIVMINION.gClickToTeleport
    gClickToTravel = Settings.FFXIVMINION.gClickToTravel
	gUseAetherytes = Settings.FFXIVMINION.gUseAetherytes
	gChoco = Settings.FFXIVMINION.gChoco
	gChocoStance = Settings.FFXIVMINION.gChocoStance
	gMount = Settings.FFXIVMINION.gMount
	gRepair = Settings.FFXIVMINION.gRepair
	gTeleport = Settings.FFXIVMINION.gTeleport
	gGatherPS = Settings.FFXIVMINION.gGatherPS
	gFoodHQ = Settings.FFXIVMINION.gFoodHQ
	gFood = Settings.FFXIVMINION.gFood
	
	if (not ml_global_information.TaskUIInit) then
		-- load task UIs
		for i, task in pairs(ffxivminion.modes) do
			task.UIInit()
		end
		ml_global_information.TaskUIInit = true
	end
	
	local botModes = ffxivminion.Strings.BotModes()
	gBotMode_listitems = botModes
	gBotMode = Settings.FFXIVMINION.gBotMode
	ffxivminion.SetMode(gBotMode)
	
	gFFXIVMINIONTask = ""
    gBotRunning = "0"
	ml_global_information.lastMode = gBotMode
    
    -- setup parent window for minionlib modules
    ml_marker_mgr.parentWindow = ml_global_information.MainWindow
    ml_blacklist_mgr.parentWindow = ml_global_information.MainWindow
    
    -- setup/load blacklist tables
    ml_blacklist_mgr.path = GetStartupPath() .. [[\LuaMods\ffxivminion\blacklist.info]]
    ml_blacklist_mgr.ReadBlacklistFile(ml_blacklist_mgr.path)
    
    if not ml_blacklist.BlacklistExists(strings[gCurrentLanguage].fates) then
        ml_blacklist.CreateBlacklist(strings[gCurrentLanguage].fates)
    end
    
    if not ml_blacklist.BlacklistExists(strings[gCurrentLanguage].monsters) then
        ml_blacklist.CreateBlacklist(strings[gCurrentLanguage].monsters)
    end
    
    if not ml_blacklist.BlacklistExists(strings[gCurrentLanguage].gatherMode) then
        ml_blacklist.CreateBlacklist(strings[gCurrentLanguage].gatherMode)
    end
	
	if not ml_blacklist.BlacklistExists(strings[gCurrentLanguage].huntMonsters) then
		ml_blacklist.CreateBlacklist(strings[gCurrentLanguage].huntMonsters)
	end
	

	-- setup marker manager callbacks and vars
	ml_marker_mgr.GetPosition = 	function () return Player.pos end
	ml_marker_mgr.GetLevel = 		function () return Player.level end
	ml_marker_mgr.DrawMarker =		mm.DrawMarker	
    
	-- gAutoStart
	if ( gAutoStart == "1" ) then
		ml_task_hub.ToggleRun()		
	end
    if (gSkipCutscene == "1" ) then
        GameHacks:SkipCutscene(true)
    end
    if (gSkipDialogue == "1" ) then
        GameHacks:SkipDialogue(true)
    end
	if (gUseHQMats == "1") then
		Crafting:UseHQMats(true)
	end
	if (gClickToTeleport == "1") then
		GameHacks:SetClickToTeleport(true)
	end
	if (gClickToTravel == "1") then
		GameHacks:SetClickToTravel(true)
	end
	if (gGatherPS == "1") then
        GameHacks:SetPermaSprint(true)
    end
    
    ml_debug("GUI Setup done")
    GUI_SetStatusBar("Ready...")
end

function ffxivminion.GUIVarUpdate(Event, NewVals, OldVals)	
    for k,v in pairs(NewVals) do
        if ( k == "gBotMode" ) then
            ffxivminion.CheckMode()
			Settings.FFXIVMINION[tostring(k)] = v
        end
        if (k == "gEnableLog") then
            if ( v == "1" ) then
                gFFXIVMINIONPulseTime = 1000
            else
                gFFXIVMINIONPulseTime = Settings.FFXIVMINION.gFFXIVMINIONPulseTime
            end
			Settings.FFXIVMINION[tostring(k)] = v
        elseif (
            k == "gLogCNE" or
            k == "gFFXIVMINIONPulseTime" or
            k == "gBotMode" or 
            k == "gUseMount" or
            k == "gUseSprint" or
            k == "gMountDist" or
            k == "gAssistMode" or
            k == "gAssistPriority" or
            k == "gSprintDist" or
			k == "gAutoStart" or
			k == "gStartCombat" or
			k == "gConfirmDuty" or
            k == "gDoUnstuck" or
            k == "gRandomPaths" or
			k == "gChoco" or
			k == "gChocoStance" or
			k == "gMount" or
			k == "gTeleport" or
			k == "gQuestHelpers" or
			k == "gRepair" or 
			k == "gUseAetherytes" or
			k == "gFood" or
			k == "gFoodHQ" )				
        then
            Settings.FFXIVMINION[tostring(k)] = v
		end
		
        if ( k == "gBotRunning" ) then
            ml_task_hub.ToggleRun()
			if (v == "0") then
				Player:Stop()
			end
		end
		
		if ( k == "gDisableDrawing" ) then
			if ( v == "1" ) then
				GameHacks:Disable3DRendering(true)
			else
				GameHacks:Disable3DRendering(false)
			end
		end
		
		if ( k == "gSkipCutscene" ) then
			d("skipDialogue was changed. new value = "..tostring(v))
			if ( v == "1" ) then
				GameHacks:SkipCutscene(true)
			else
				GameHacks:SkipCutscene(false)
			end
            Settings.FFXIVMINION[tostring(k)] = v
		end
		
		if ( k == "gSkipDialogue" ) then
			d("skipDialogue was changed. new value = "..tostring(v))
			if ( v == "1" ) then
				GameHacks:SkipDialogue(true)
			else
				GameHacks:SkipDialogue(false)
			end
            Settings.FFXIVMINION[tostring(k)] = v
		end
		
        if ( k == "gClickToTeleport" ) then
			if ( v == "1" ) then
				GameHacks:SetClickToTeleport(true)
			else
				GameHacks:SetClickToTeleport(false)
			end
            Settings.FFXIVMINION[tostring(k)] = v
		end
		
        if ( k == "gClickToTravel" ) then
			if ( v == "1" ) then
				GameHacks:SetClickToTravel(true)
			else
				GameHacks:SetClickToTravel(false)
			end
            Settings.FFXIVMINION[tostring(k)] = v
		end
		
		if ( k == "gUseHQMats" ) then
			if ( v == "1" ) then
				Crafting:UseHQMats(true)
			else
				Crafting:UseHQMats(false)
			end
            Settings.FFXIVMINION[tostring(k)] = v
		end
		
		if ( k == "gGatherPS" ) then
            if ( v == "1") then
                GameHacks:SetPermaSprint(true)
            else
                GameHacks:SetPermaSprint(false)
            end
			Settings.FFXIVMINION[tostring(k)] = v
        end
    end
    GUI_RefreshWindow(ffxivminion.Windows.Main.Name)
end

function ffxivminion.SetMode(mode)	
	local wnd = nil
	if (ml_global_information.lastMode ~= mode) then
		wnd = GUI_GetWindowInfo(ml_global_information.lastMode)
		GUI_WindowVisible(ml_global_information.lastMode, false)
	end
	
	if (wnd) then
		GUI_MoveWindow(mode, wnd.x, wnd.y)
	end
	ffxivminion.SizeWindow(mode)
	GUI_WindowVisible(mode, true)
	ml_global_information.lastMode = mode
	
    local task = ffxivminion.modes[mode]
    if (task ~= nil) then
        ml_task_hub:Add(task.Create(), LONG_TERM_GOAL, TP_ASAP)
		gBotMode = mode
        if (gBotMode == strings[gCurrentLanguage].pvpMode) then
            Player:EnableUnstuckJump(false)
        else
            Player:EnableUnstuckJump(true)
        end
		
		if (gBotMode == GetString("dutyMode")) then
			ffxiv_task_duty.UpdateProfiles()
			gSkipCutscene = "1"
			GameHacks:SkipCutscene(true)
			gSkipDialogue = "1"
			GameHacks:SkipDialogue(true)
		elseif (gBotMode == GetString("questMode")) then
			ffxiv_task_quest.UpdateProfiles()
			gSkipCutscene = "1"
			GameHacks:SkipCutscene(true)
			gSkipDialogue = "1"
			GameHacks:SkipDialogue(true)
		else
			gProfile_listitems = "NA"
			gProfile = "NA"
		end
    end
end

function ffxivminion.CheckClass()
    local classes = 
    {
        [FFXIV.JOBS.ARCANIST] 		= ffxiv_combat_arcanist,
        [FFXIV.JOBS.ARCHER]			= ffxiv_combat_archer,
        [FFXIV.JOBS.BARD]			= ffxiv_combat_bard,
        [FFXIV.JOBS.BLACKMAGE]		= ffxiv_combat_blackmage,
        [FFXIV.JOBS.CONJURER]		= ffxiv_combat_conjurer,
        [FFXIV.JOBS.DRAGOON]		= ffxiv_combat_dragoon,
        [FFXIV.JOBS.GLADIATOR] 		= ffxiv_combat_gladiator,
        [FFXIV.JOBS.LANCER]			= ffxiv_combat_lancer,
        [FFXIV.JOBS.MARAUDER] 		= ffxiv_combat_marauder,
        [FFXIV.JOBS.MONK] 			= ffxiv_combat_monk,
        [FFXIV.JOBS.PALADIN] 		= ffxiv_combat_paladin,
        [FFXIV.JOBS.PUGILIST] 		= ffxiv_combat_pugilist,
        [FFXIV.JOBS.SCHOLAR] 		= ffxiv_combat_scholar,
        [FFXIV.JOBS.SUMMONER] 		= ffxiv_combat_summoner,
        [FFXIV.JOBS.THAUMATURGE] 	= ffxiv_combat_thaumaturge,
        [FFXIV.JOBS.WARRIOR] 	 	= ffxiv_combat_warrior,
        [FFXIV.JOBS.WHITEMAGE] 	 	= ffxiv_combat_whitemage,
        [FFXIV.JOBS.BOTANIST] 		= ffxiv_gather_botanist,
        [FFXIV.JOBS.FISHER] 		= ffxiv_gather_fisher,
        [FFXIV.JOBS.MINER] 			= ffxiv_gather_miner,
		
		[FFXIV.JOBS.CARPENTER] 		= ffxiv_crafting_carpenter,
        [FFXIV.JOBS.BLACKSMITH] 	= ffxiv_crafting_blacksmith,
		[FFXIV.JOBS.ARMORER] 		= ffxiv_crafting_armorer,
		[FFXIV.JOBS.GOLDSMITH] 		= ffxiv_crafting_goldsmith,
		[FFXIV.JOBS.LEATHERWORKER] 	= ffxiv_crafting_leatherworker,
		[FFXIV.JOBS.WEAVER] 		= ffxiv_crafting_weaver,
		[FFXIV.JOBS.ALCHEMIST] 		= ffxiv_crafting_alchemist,
		[FFXIV.JOBS.CULINARIAN] 	= ffxiv_crafting_culinarian,
    }
	
	if (ml_global_information.CurrentClass == nil) then
		ml_global_information.CurrentClass = classes[Player.job]
		ml_global_information.CurrentClassID = Player.job
		ml_global_information.AttackRange = ml_global_information.CurrentClass.range
		SkillMgr.SetDefaultProfile()
		return
	end
    
    --TODO check which class we are currently using and modify globals appropriately
    if (ml_global_information.CurrentClass == nil or ml_global_information.CurrentClassID ~= Player.job) then
        ml_global_information.CurrentClass = classes[Player.job]
        ml_global_information.CurrentClassID = Player.job
        if ml_global_information.CurrentClass ~= nil then
            ml_global_information.AttackRange = ml_global_information.CurrentClass.range
			
			-- autosetting the correct botmode
			if ( ml_global_information.CurrentClass == ffxiv_gather_botanist ) then
				ffxivminion.SetMode(strings[gCurrentLanguage].gatherMode)
			elseif ( ml_global_information.CurrentClass == ffxiv_gather_miner ) then
				ffxivminion.SetMode(strings[gCurrentLanguage].gatherMode)
			elseif ( ml_global_information.CurrentClass == ffxiv_gather_fisher ) then
				ffxivminion.SetMode(strings[gCurrentLanguage].fishMode)
			elseif ( ml_global_information.CurrentClass == ffxiv_crafting_carpenter or ml_global_information.CurrentClass == ffxiv_crafting_blacksmith 
					or ml_global_information.CurrentClass == ffxiv_crafting_armorer or ml_global_information.CurrentClass == ffxiv_crafting_goldsmith
					or ml_global_information.CurrentClass == ffxiv_crafting_leatherworker or ml_global_information.CurrentClass == ffxiv_crafting_weaver
					or ml_global_information.CurrentClass == ffxiv_crafting_alchemist or ml_global_information.CurrentClass == ffxiv_crafting_culinarian) then
				ffxivminion.SetMode(strings[gCurrentLanguage].craftMode)
			--default it to Grind if crafting/gathering/fishing mode was selected but we are not in that class
			elseif ( gBotMode == strings[gCurrentLanguage].gatherMode or gBotMode == strings[gCurrentLanguage].fishMode or gBotMode == strings[gCurrentLanguage].craftMode) then
				ffxivminion.SetMode(strings[gCurrentLanguage].grindMode)				
			end
            
            SkillMgr.SetDefaultProfile()
        else
            ml_global_information.AttackRange = 3
        end
    end
end

function ffxivminion.CheckMode()
    local task = ffxivminion.modes[gBotMode]
    if (task ~= nil) then
        if (not ml_task_hub:CheckForTask(task)) then
            ffxivminion.SetMode(gBotMode)
        end
    elseif (gBotMode == "None") then
        ml_task_hub:ClearQueues()
    end
end

function ffxivminion.CreateWindows()
	for i,window in pairs(ffxivminion.Windows) do
		local winTable = "AutoWindow"..window.Name
		if (Settings.FFXIVMINION[winTable] == nil) then
			Settings.FFXIVMINION[winTable] = {}
		end
		
		settings = {}			
		settings.width = Settings.FFXIVMINION[winTable].width or window.width
		settings.height = Settings.FFXIVMINION[winTable].height or window.height
		settings.y = Settings.FFXIVMINION[winTable].y or window.y
		settings.x = Settings.FFXIVMINION[winTable].x or window.x		

		if (ValidTable(settings)) then Settings.FFXIVMINION[winTable] = settings end
		local wi = Settings.FFXIVMINION[winTable]		
		local wname = window.Name
		
		GUI_NewWindow	(wname,wi.x,wi.y,wi.width,wi.height) 
	end
end

function ffxivminion.CreateWindow(window)
	local winTable = "AutoWindow"..window.Name
	if (Settings.FFXIVMINION[winTable] == nil) then
		Settings.FFXIVMINION[winTable] = {}
	end
	
	--d("windowName="..tostring(window.Name))
	settings = {}
	settings.width = Settings.FFXIVMINION[winTable].width or window.width
	--d("usedWidth="..tostring(settings.width)..",savedWidth="..tostring(Settings.FFXIVMINION[winTable].width)..",windowWidth="..tostring(window.width))
	settings.height = Settings.FFXIVMINION[winTable].height or window.height
	--d("usedHeight="..tostring(settings.height)..",savedHeight="..tostring(Settings.FFXIVMINION[winTable].height)..",windowHeight="..tostring(window.height))
	settings.y = Settings.FFXIVMINION[winTable].y or window.y
	--d("usedY="..tostring(settings.y)..",savedY="..tostring(Settings.FFXIVMINION[winTable].y)..",windowY="..tostring(window.y))
	settings.x = Settings.FFXIVMINION[winTable].x or window.x
	--d("usedX="..tostring(settings.x)..",savedX="..tostring(Settings.FFXIVMINION[winTable].x)..",windowX="..tostring(window.x))	

	if (ValidTable(settings)) then 
		Settings.FFXIVMINION[winTable] = settings 
	end
	
	local wi = Settings.FFXIVMINION[winTable]
	local wname = window.Name
	
	GUI_NewWindow	(wname,wi.x,wi.y,wi.width,wi.height) 
end

function ffxivminion.SizeWindow(strName)
	local winTableName = "AutoWindow"..strName
	local winTable = Settings.FFXIVMINION[winTableName]
	
	GUI_SizeWindow(strName,winTable.width,winTable.height)
end

function ffxivminion.SaveWindows()
	for i,window in pairs(ffxivminion.Windows) do
		local tableName = "AutoWindow"..window.Name
		local WI = Settings.FFXIVMINION[tableName]
		local W = GUI_GetWindowInfo(window.Name)
		local WindowInfo = {}
		
		if (WI.width ~= W.width) then WindowInfo.width = W.width else WindowInfo.width = WI.width end
		if (WI.height ~= W.height) then WindowInfo.height = W.height else WindowInfo.height = WI.height	end
		if (WI.x ~= W.x) then WindowInfo.x = W.x else WindowInfo.x = WI.x end
		if (WI.y ~= W.y) then WindowInfo.y = W.y else WindowInfo.y = WI.y end
			
		if (TableSize(WindowInfo) > 0 and WindowInfo ~= WI) then Settings.FFXIVMINION[tableName] = WindowInfo end
	end
end

function ffxivminion.OpenSettings()
	local wnd = GUI_GetWindowInfo(gBotMode)
	local winName = ffxivminion.Windows.Main.Name
	
	GUI_MoveWindow(winName, wnd.x,wnd.y+wnd.height)
	local winTableName = "AutoWindow"..winName
	local winTable = Settings.FFXIVMINION[winTableName]
	GUI_SizeWindow(winName,wnd.width,winTable.height)
	GUI_WindowVisible(winName,true)
end

function ffxivminion.UpdateFood(var)
	if (var == "gFood") then
		gFoodHQ = "None"
		Settings.FFXIVMINION.gFoodHQ = gFoodHQ
	elseif (var == "gFoodHQ") then
		gFood = "None"
		Settings.FFXIVMINION.gFood = gFood
	end		
end

function ffxivminion.UpdateFoodOptions()
    
	local foodlistHQ = "None"
    local foodlist = "None"	
	for x = 0, 3 do
		local inv = Inventory("category=5,type="..tostring(x))
		if ( inv ) then
			local i,item = next(inv)
			while (i~=nil and item~=nil) do
				if (item.id > 10000) then
					ffxivminion.foodsHQ[item.name] = item.id  
					foodlistHQ = foodlistHQ..","..item.name
				else
					ffxivminion.foods[item.name] = item.id
					foodlist = foodlist..","..item.name
				end
				i,item = next(inv,i)  
			end  
		end
	end
	
    gFood_listitems = foodlist
	gFoodHQ_listitems = foodlistHQ
	GUI_RefreshWindow(ffxivminion.Windows.Main.Name)
end

function ml_global_information.Reset()
    --TODO: Figure out what state needs to be reset and add calls here
    ml_task_hub:ClearQueues()
    ffxivminion.CheckMode()
end

function ml_global_information.Stop()
    --TODO: Do anything here for bot stopping
    
    if (Player:IsMoving()) then
        Player:Stop()
    end
end

function ffxivminion.ToggleAdvancedSettings()
    if (ffxivminion.settingsVisible) then
        GUI_WindowVisible(GetString("advancedSettings"),false)	
        ffxivminion.settingsVisible = false
    else
        local wnd = GUI_GetWindowInfo(ffxivminion.Windows.Main.Name)	
        GUI_MoveWindow( GetString("advancedSettings"), wnd.x+wnd.width,wnd.y) 
        GUI_WindowVisible(GetString("advancedSettings"),true)	
        ffxivminion.settingsVisible = true
    end
end

function ffxivminion.ResizeWindow()
	GUI_SizeWindow(ffxivminion.Windows.Main.Name,ml_global_information.MainWindow.width,ml_global_information.MainWindow.height)
end


function ffxiv_task_gather.HandleButtons( Event, Button )	
	if ( Event == "GUI.Item" and string.find(Button,"Field)") ~= nil ) then
		if (Button == "Field_Whitelist Target") then
			WhitelistTarget()
		elseif (Button == "Field_Blacklist Target") then
			BlacklistTarget()
		end
	end
end

-- Register Event Handlers
RegisterEventHandler("Module.Initalize",ffxivminion.HandleInit)
RegisterEventHandler("Gameloop.Update",ml_global_information.OnUpdate)
RegisterEventHandler("GUI.Update",ffxivminion.GUIVarUpdate)
RegisterEventHandler("ffxivminion.OpenSettings", ffxivminion.OpenSettings)
RegisterEventHandler("GUI.Item",		ffxiv_task_gather.HandleButtons)