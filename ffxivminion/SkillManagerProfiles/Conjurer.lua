-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["skills"] = {
		[1] = {
			["alias"] = "";
			["cbreak"] = "0";
			["charge"] = "0";
			["combat"] = "In Combat";
			["dobuff"] = "1";
			["doprev"] = "0";
			["filterfive"] = "Ignore";
			["filterfour"] = "Ignore";
			["filterone"] = "Ignore";
			["filterthree"] = "Ignore";
			["filtertwo"] = "Off";
			["hprio1"] = "None";
			["hprio2"] = "None";
			["hprio3"] = "None";
			["hprio4"] = "None";
			["hpriohp"] = 0;
			["id"] = 122;
			["lastcast"] = 0;
			["levelmax"] = 0;
			["levelmin"] = 0;
			["minRange"] = 0;
			["mplock"] = "0";
			["mplocked"] = "0";
			["mplockper"] = 0;
			["name"] = "Cleric Stance";
			["ncurrentaction"] = "";
			["npc"] = "0";
			["npcskill"] = "";
			["npskill"] = "";
			["nskill"] = "";
			["nskillprio"] = "";
			["offgcd"] = "0";
			["onlyparty"] = "0";
			["onlysolo"] = "0";
			["pbuff"] = "";
			["pbuffdura"] = 0;
			["pcskill"] = "";
			["petbuff"] = "";
			["petbuffdura"] = 0;
			["petnbuff"] = "";
			["petnbuffdura"] = 0;
			["pgtrg"] = "Direct";
			["phpb"] = 0;
			["phpl"] = 0;
			["pmppb"] = 0;
			["pmppl"] = 30;
			["pnbuff"] = "145";
			["pnbuffdura"] = 0;
			["ppos"] = "None";
			["ppowb"] = 0;
			["ppowl"] = 0;
			["prio"] = 1;
			["pskill"] = "";
			["ptbuff"] = "";
			["ptcount"] = 0;
			["pthpb"] = 0;
			["pthpl"] = 80;
			["ptmpb"] = 0;
			["ptmpl"] = 0;
			["ptnbuff"] = "";
			["ptpb"] = 0;
			["ptpl"] = 0;
			["ptrg"] = "Any";
			["pttpb"] = 0;
			["pttpl"] = 0;
			["punderattack"] = "0";
			["pvepvp"] = "Both";
			["secspassed"] = 0;
			["skncdtimemax"] = "";
			["skncdtimemin"] = "";
			["sknoffcd"] = "";
			["sknready"] = "";
			["skoffcd"] = "";
			["skready"] = "";
			["sktype"] = "Action";
			["stype"] = "Action";
			["tacount"] = 0;
			["tahpl"] = 0;
			["tarange"] = 0;
			["tbuff"] = "";
			["tbuffowner"] = "Player";
			["tcastids"] = "";
			["tcastonme"] = "0";
			["tcasttime"] = "0.0";
			["tcontids"] = "";
			["tecount"] = 0;
			["tecount2"] = 0;
			["televel"] = "Any";
			["terange"] = 0;
			["thpadv"] = 0;
			["thpb"] = 0;
			["thpcb"] = 0;
			["thpcl"] = 0;
			["thpl"] = 0;
			["tmpl"] = 0;
			["tnbuff"] = "";
			["tnbuffdura"] = 0;
			["tncontids"] = "";
			["trg"] = "Player";
			["trgtype"] = "Any";
			["ttpl"] = 0;
			["type"] = 1;
			["used"] = "1";
		};
		[2] = {
			["alias"] = "";
			["cbreak"] = "0";
			["charge"] = "0";
			["combat"] = "Any";
			["dobuff"] = "1";
			["doprev"] = "0";
			["filterfive"] = "Ignore";
			["filterfour"] = "Ignore";
			["filterone"] = "Ignore";
			["filterthree"] = "Ignore";
			["filtertwo"] = "Off";
			["hprio1"] = "None";
			["hprio2"] = "None";
			["hprio3"] = "None";
			["hprio4"] = "None";
			["hpriohp"] = 0;
			["id"] = 122;
			["lastcast"] = 0;
			["levelmax"] = 0;
			["levelmin"] = 0;
			["minRange"] = 0;
			["mplock"] = "0";
			["mplocked"] = "0";
			["mplockper"] = 0;
			["name"] = "Cleric Stance";
			["ncurrentaction"] = "";
			["npc"] = "0";
			["npcskill"] = "";
			["npskill"] = "";
			["nskill"] = "";
			["nskillprio"] = "";
			["offgcd"] = "0";
			["onlyparty"] = "0";
			["onlysolo"] = "0";
			["pbuff"] = "145";
			["pbuffdura"] = 0;
			["pcskill"] = "";
			["petbuff"] = "";
			["petbuffdura"] = 0;
			["petnbuff"] = "";
			["petnbuffdura"] = 0;
			["pgtrg"] = "Direct";
			["phpb"] = 0;
			["phpl"] = 0;
			["pmppb"] = 0;
			["pmppl"] = 0;
			["pnbuff"] = "";
			["pnbuffdura"] = 0;
			["ppos"] = "None";
			["ppowb"] = 0;
			["ppowl"] = 0;
			["prio"] = 2;
			["pskill"] = "";
			["ptbuff"] = "";
			["ptcount"] = 0;
			["pthpb"] = 70;
			["pthpl"] = 0;
			["ptmpb"] = 0;
			["ptmpl"] = 0;
			["ptnbuff"] = "";
			["ptpb"] = 0;
			["ptpl"] = 0;
			["ptrg"] = "Any";
			["pttpb"] = 0;
			["pttpl"] = 0;
			["punderattack"] = "0";
			["pvepvp"] = "Both";
			["secspassed"] = 0;
			["skncdtimemax"] = "";
			["skncdtimemin"] = "";
			["sknoffcd"] = "";
			["sknready"] = "";
			["skoffcd"] = "";
			["skready"] = "";
			["sktype"] = "Action";
			["stype"] = "Action";
			["tacount"] = 0;
			["tahpl"] = 0;
			["tarange"] = 0;
			["tbuff"] = "";
			["tbuffowner"] = "Player";
			["tcastids"] = "";
			["tcastonme"] = "0";
			["tcasttime"] = "0.0";
			["tcontids"] = "";
			["tecount"] = 0;
			["tecount2"] = 0;
			["televel"] = "Any";
			["terange"] = 0;
			["thpadv"] = 0;
			["thpb"] = 0;
			["thpcb"] = 0;
			["thpcl"] = 0;
			["thpl"] = 0;
			["tmpl"] = 0;
			["tnbuff"] = "";
			["tnbuffdura"] = 0;
			["tncontids"] = "";
			["trg"] = "Player";
			["trgtype"] = "Any";
			["ttpl"] = 0;
			["type"] = 1;
			["used"] = "1";
		};
		[3] = {
			["alias"] = "";
			["cbreak"] = "0";
			["charge"] = "0";
			["combat"] = "In Combat";
			["dobuff"] = "0";
			["doprev"] = "0";
			["filterfive"] = "Ignore";
			["filterfour"] = "Ignore";
			["filterone"] = "Ignore";
			["filterthree"] = "Ignore";
			["filtertwo"] = "Ignore";
			["hprio1"] = "None";
			["hprio2"] = "None";
			["hprio3"] = "None";
			["hprio4"] = "None";
			["hpriohp"] = 0;
			["id"] = 134;
			["lastcast"] = 0;
			["levelmax"] = 0;
			["levelmin"] = 0;
			["minRange"] = 0;
			["mplock"] = "0";
			["mplocked"] = "0";
			["mplockper"] = 0;
			["name"] = "Fluid Aura";
			["ncurrentaction"] = "";
			["npc"] = "0";
			["npcskill"] = "";
			["npskill"] = "";
			["nskill"] = "";
			["nskillprio"] = "";
			["offgcd"] = "0";
			["onlyparty"] = "0";
			["onlysolo"] = "0";
			["pbuff"] = "";
			["pbuffdura"] = 0;
			["pcskill"] = "";
			["petbuff"] = "";
			["petbuffdura"] = 0;
			["petnbuff"] = "";
			["petnbuffdura"] = 0;
			["pgtrg"] = "Direct";
			["phpb"] = 0;
			["phpl"] = 0;
			["pmppb"] = 0;
			["pmppl"] = 0;
			["pnbuff"] = "";
			["pnbuffdura"] = 0;
			["ppos"] = "None";
			["ppowb"] = 0;
			["ppowl"] = 0;
			["prio"] = 3;
			["pskill"] = "";
			["ptbuff"] = "";
			["ptcount"] = 0;
			["pthpb"] = 0;
			["pthpl"] = 0;
			["ptmpb"] = 0;
			["ptmpl"] = 0;
			["ptnbuff"] = "";
			["ptpb"] = 0;
			["ptpl"] = 0;
			["ptrg"] = "Any";
			["pttpb"] = 0;
			["pttpl"] = 0;
			["punderattack"] = "0";
			["pvepvp"] = "Both";
			["secspassed"] = 0;
			["skncdtimemax"] = "";
			["skncdtimemin"] = "";
			["sknoffcd"] = "";
			["sknready"] = "";
			["skoffcd"] = "";
			["skready"] = "";
			["sktype"] = "Action";
			["stype"] = "Action";
			["tacount"] = 0;
			["tahpl"] = 0;
			["tarange"] = 0;
			["tbuff"] = "";
			["tbuffowner"] = "Player";
			["tcastids"] = "";
			["tcastonme"] = "0";
			["tcasttime"] = "0.0";
			["tcontids"] = "";
			["tecount"] = 0;
			["tecount2"] = 0;
			["televel"] = "Any";
			["terange"] = 0;
			["thpadv"] = 0;
			["thpb"] = 0;
			["thpcb"] = 0;
			["thpcl"] = 0;
			["thpl"] = 0;
			["tmpl"] = 0;
			["tnbuff"] = "";
			["tnbuffdura"] = 0;
			["tncontids"] = "";
			["trg"] = "Target";
			["trgtype"] = "Any";
			["ttpl"] = 0;
			["type"] = 1;
			["used"] = "0";
		};
		[4] = {
			["alias"] = "";
			["cbreak"] = "0";
			["charge"] = "0";
			["combat"] = "In Combat";
			["dobuff"] = "0";
			["doprev"] = "0";
			["filterfive"] = "Ignore";
			["filterfour"] = "Ignore";
			["filterone"] = "Ignore";
			["filterthree"] = "Ignore";
			["filtertwo"] = "Ignore";
			["hprio1"] = "None";
			["hprio2"] = "None";
			["hprio3"] = "None";
			["hprio4"] = "None";
			["hpriohp"] = 0;
			["id"] = 126;
			["lastcast"] = 0;
			["levelmax"] = 0;
			["levelmin"] = 0;
			["minRange"] = 0;
			["mplock"] = "0";
			["mplocked"] = "0";
			["mplockper"] = 0;
			["name"] = "Esuna";
			["ncurrentaction"] = "";
			["npc"] = "0";
			["npcskill"] = "";
			["npskill"] = "";
			["nskill"] = "";
			["nskillprio"] = "";
			["offgcd"] = "0";
			["onlyparty"] = "0";
			["onlysolo"] = "0";
			["pbuff"] = "";
			["pbuffdura"] = 0;
			["pcskill"] = "";
			["petbuff"] = "";
			["petbuffdura"] = 0;
			["petnbuff"] = "";
			["petnbuffdura"] = 0;
			["pgtrg"] = "Direct";
			["phpb"] = 0;
			["phpl"] = 0;
			["pmppb"] = 0;
			["pmppl"] = 0;
			["pnbuff"] = "167";
			["pnbuffdura"] = 0;
			["ppos"] = "None";
			["ppowb"] = 0;
			["ppowl"] = 0;
			["prio"] = 4;
			["pskill"] = "";
			["ptbuff"] = "62,215,268,18,17,269,250,6,14,267";
			["ptcount"] = 0;
			["pthpb"] = 0;
			["pthpl"] = 0;
			["ptmpb"] = 0;
			["ptmpl"] = 0;
			["ptnbuff"] = "";
			["ptpb"] = 0;
			["ptpl"] = 0;
			["ptrg"] = "Any";
			["pttpb"] = 0;
			["pttpl"] = 0;
			["punderattack"] = "0";
			["pvepvp"] = "Both";
			["secspassed"] = 0;
			["skncdtimemax"] = "";
			["skncdtimemin"] = "";
			["sknoffcd"] = "";
			["sknready"] = "";
			["skoffcd"] = "";
			["skready"] = "";
			["sktype"] = "Action";
			["stype"] = "Action";
			["tacount"] = 0;
			["tahpl"] = 0;
			["tarange"] = 0;
			["tbuff"] = "";
			["tbuffowner"] = "Any";
			["tcastids"] = "";
			["tcastonme"] = "0";
			["tcasttime"] = "0.0";
			["tcontids"] = "";
			["tecount"] = 0;
			["tecount2"] = 0;
			["televel"] = "Any";
			["terange"] = 0;
			["thpadv"] = 0;
			["thpb"] = 0;
			["thpcb"] = 0;
			["thpcl"] = 0;
			["thpl"] = 0;
			["tmpl"] = 0;
			["tnbuff"] = "292";
			["tnbuffdura"] = 0;
			["tncontids"] = "";
			["trg"] = "PartyS";
			["trgtype"] = "Any";
			["ttpl"] = 0;
			["type"] = 1;
			["used"] = "0";
		};
		[5] = {
			["alias"] = "";
			["cbreak"] = "0";
			["charge"] = "0";
			["combat"] = "In Combat";
			["dobuff"] = "0";
			["doprev"] = "0";
			["filterfive"] = "Ignore";
			["filterfour"] = "Ignore";
			["filterone"] = "Ignore";
			["filterthree"] = "Ignore";
			["filtertwo"] = "Ignore";
			["hprio1"] = "None";
			["hprio2"] = "None";
			["hprio3"] = "None";
			["hprio4"] = "None";
			["hpriohp"] = 0;
			["id"] = 124;
			["lastcast"] = 0;
			["levelmax"] = 0;
			["levelmin"] = 0;
			["minRange"] = 0;
			["mplock"] = "0";
			["mplocked"] = "0";
			["mplockper"] = 0;
			["name"] = "Medica";
			["ncurrentaction"] = "";
			["npc"] = "0";
			["npcskill"] = "";
			["npskill"] = "";
			["nskill"] = "";
			["nskillprio"] = "";
			["offgcd"] = "0";
			["onlyparty"] = "0";
			["onlysolo"] = "0";
			["pbuff"] = "";
			["pbuffdura"] = 0;
			["pcskill"] = "";
			["petbuff"] = "";
			["petbuffdura"] = 0;
			["petnbuff"] = "";
			["petnbuffdura"] = 0;
			["pgtrg"] = "Direct";
			["phpb"] = 0;
			["phpl"] = 0;
			["pmppb"] = 0;
			["pmppl"] = 0;
			["pnbuff"] = "";
			["pnbuffdura"] = 0;
			["ppos"] = "None";
			["ppowb"] = 0;
			["ppowl"] = 0;
			["prio"] = 5;
			["pskill"] = "";
			["ptbuff"] = "";
			["ptcount"] = 0;
			["pthpb"] = 0;
			["pthpl"] = 0;
			["ptmpb"] = 0;
			["ptmpl"] = 0;
			["ptnbuff"] = "";
			["ptpb"] = 0;
			["ptpl"] = 0;
			["ptrg"] = "Any";
			["pttpb"] = 0;
			["pttpl"] = 0;
			["punderattack"] = "0";
			["pvepvp"] = "Both";
			["secspassed"] = 0;
			["skncdtimemax"] = "";
			["skncdtimemin"] = "";
			["sknoffcd"] = "";
			["sknready"] = "";
			["skoffcd"] = "";
			["skready"] = "";
			["sktype"] = "Action";
			["stype"] = "Action";
			["tacount"] = 3;
			["tahpl"] = 50;
			["tarange"] = 15;
			["tbuff"] = "";
			["tbuffowner"] = "Player";
			["tcastids"] = "";
			["tcastonme"] = "0";
			["tcasttime"] = "0.0";
			["tcontids"] = "";
			["tecount"] = 0;
			["tecount2"] = 0;
			["televel"] = "Any";
			["terange"] = 0;
			["thpadv"] = 0;
			["thpb"] = 0;
			["thpcb"] = 0;
			["thpcl"] = 0;
			["thpl"] = 0;
			["tmpl"] = 0;
			["tnbuff"] = "";
			["tnbuffdura"] = 0;
			["tncontids"] = "";
			["trg"] = "Player";
			["trgtype"] = "Any";
			["ttpl"] = 0;
			["type"] = 1;
			["used"] = "1";
		};
		[6] = {
			["alias"] = "";
			["cbreak"] = "0";
			["charge"] = "0";
			["combat"] = "Any";
			["dobuff"] = "0";
			["doprev"] = "0";
			["filterfive"] = "Ignore";
			["filterfour"] = "Ignore";
			["filterone"] = "Ignore";
			["filterthree"] = "Ignore";
			["filtertwo"] = "Ignore";
			["hprio1"] = "Tank";
			["hprio2"] = "Self";
			["hprio3"] = "Party";
			["hprio4"] = "None";
			["hpriohp"] = 75;
			["id"] = 120;
			["lastcast"] = 0;
			["levelmax"] = 0;
			["levelmin"] = 0;
			["minRange"] = 0;
			["mplock"] = "0";
			["mplocked"] = "0";
			["mplockper"] = 0;
			["name"] = "Cure";
			["ncurrentaction"] = "";
			["npc"] = "0";
			["npcskill"] = "";
			["npskill"] = "";
			["nskill"] = "";
			["nskillprio"] = "";
			["offgcd"] = "0";
			["onlyparty"] = "0";
			["onlysolo"] = "0";
			["pbuff"] = "";
			["pbuffdura"] = 0;
			["pcskill"] = "";
			["petbuff"] = "";
			["petbuffdura"] = 0;
			["petnbuff"] = "";
			["petnbuffdura"] = 0;
			["pgtrg"] = "Direct";
			["phpb"] = 0;
			["phpl"] = 0;
			["pmppb"] = 0;
			["pmppl"] = 0;
			["pnbuff"] = "";
			["pnbuffdura"] = 0;
			["ppos"] = "None";
			["ppowb"] = 0;
			["ppowl"] = 0;
			["prio"] = 6;
			["pskill"] = "";
			["ptbuff"] = "";
			["ptcount"] = 0;
			["pthpb"] = 0;
			["pthpl"] = 0;
			["ptmpb"] = 0;
			["ptmpl"] = 0;
			["ptnbuff"] = "";
			["ptpb"] = 0;
			["ptpl"] = 0;
			["ptrg"] = "Any";
			["pttpb"] = 0;
			["pttpl"] = 0;
			["punderattack"] = "0";
			["pvepvp"] = "Both";
			["secspassed"] = 1;
			["skncdtimemax"] = "";
			["skncdtimemin"] = "";
			["sknoffcd"] = "";
			["sknready"] = "";
			["skoffcd"] = "";
			["skready"] = "";
			["sktype"] = "Action";
			["stype"] = "Action";
			["tacount"] = 0;
			["tahpl"] = 0;
			["tarange"] = 0;
			["tbuff"] = "";
			["tbuffowner"] = "Player";
			["tcastids"] = "";
			["tcastonme"] = "0";
			["tcasttime"] = "0.0";
			["tcontids"] = "";
			["tecount"] = 0;
			["tecount2"] = 0;
			["televel"] = "Any";
			["terange"] = 0;
			["thpadv"] = 0;
			["thpb"] = 0;
			["thpcb"] = 0;
			["thpcl"] = 0;
			["thpl"] = 0;
			["tmpl"] = 0;
			["tnbuff"] = "";
			["tnbuffdura"] = 0;
			["tncontids"] = "";
			["trg"] = "Heal Priority";
			["trgtype"] = "Any";
			["ttpl"] = 0;
			["type"] = 1;
			["used"] = "1";
		};
		[7] = {
			["alias"] = "";
			["cbreak"] = "0";
			["charge"] = "0";
			["combat"] = "In Combat";
			["dobuff"] = "0";
			["doprev"] = "0";
			["filterfive"] = "Ignore";
			["filterfour"] = "Ignore";
			["filterone"] = "Ignore";
			["filterthree"] = "Ignore";
			["filtertwo"] = "Ignore";
			["hprio1"] = "Tank";
			["hprio2"] = "Self";
			["hprio3"] = "Party";
			["hprio4"] = "Any";
			["hpriohp"] = 75;
			["id"] = 120;
			["lastcast"] = 0;
			["levelmax"] = 0;
			["levelmin"] = 0;
			["minRange"] = 0;
			["mplock"] = "0";
			["mplocked"] = "0";
			["mplockper"] = 0;
			["name"] = "Cure";
			["ncurrentaction"] = "";
			["npc"] = "0";
			["npcskill"] = "";
			["npskill"] = "";
			["nskill"] = "";
			["nskillprio"] = "";
			["offgcd"] = "0";
			["onlyparty"] = "0";
			["onlysolo"] = "0";
			["pbuff"] = "";
			["pbuffdura"] = 0;
			["pcskill"] = "";
			["petbuff"] = "";
			["petbuffdura"] = 0;
			["petnbuff"] = "";
			["petnbuffdura"] = 0;
			["pgtrg"] = "Direct";
			["phpb"] = 0;
			["phpl"] = 0;
			["pmppb"] = 0;
			["pmppl"] = 0;
			["pnbuff"] = "";
			["pnbuffdura"] = 0;
			["ppos"] = "None";
			["ppowb"] = 0;
			["ppowl"] = 0;
			["prio"] = 7;
			["pskill"] = "";
			["ptbuff"] = "";
			["ptcount"] = 0;
			["pthpb"] = 0;
			["pthpl"] = 0;
			["ptmpb"] = 0;
			["ptmpl"] = 0;
			["ptnbuff"] = "";
			["ptpb"] = 0;
			["ptpl"] = 0;
			["ptrg"] = "Enemy";
			["pttpb"] = 0;
			["pttpl"] = 0;
			["punderattack"] = "0";
			["pvepvp"] = "Both";
			["secspassed"] = 1;
			["skncdtimemax"] = "";
			["skncdtimemin"] = "";
			["sknoffcd"] = "";
			["sknready"] = "";
			["skoffcd"] = "";
			["skready"] = "";
			["sktype"] = "Action";
			["stype"] = "Action";
			["tacount"] = 0;
			["tahpl"] = 0;
			["tarange"] = 0;
			["tbuff"] = "";
			["tbuffowner"] = "Player";
			["tcastids"] = "";
			["tcastonme"] = "0";
			["tcasttime"] = "0.0";
			["tcontids"] = "";
			["tecount"] = 0;
			["tecount2"] = 0;
			["televel"] = "Any";
			["terange"] = 0;
			["thpadv"] = 0;
			["thpb"] = 0;
			["thpcb"] = 0;
			["thpcl"] = 0;
			["thpl"] = 0;
			["tmpl"] = 0;
			["tnbuff"] = "";
			["tnbuffdura"] = 0;
			["tncontids"] = "";
			["trg"] = "Heal Priority";
			["trgtype"] = "Any";
			["ttpl"] = 0;
			["type"] = 1;
			["used"] = "1";
		};
		[8] = {
			["alias"] = "";
			["cbreak"] = "0";
			["charge"] = "0";
			["combat"] = "Any";
			["dobuff"] = "1";
			["doprev"] = "0";
			["filterfive"] = "Ignore";
			["filterfour"] = "Ignore";
			["filterone"] = "Ignore";
			["filterthree"] = "Ignore";
			["filtertwo"] = "Ignore";
			["hprio1"] = "None";
			["hprio2"] = "None";
			["hprio3"] = "None";
			["hprio4"] = "None";
			["hpriohp"] = 0;
			["id"] = 123;
			["lastcast"] = 0;
			["levelmax"] = 0;
			["levelmin"] = 0;
			["minRange"] = 0;
			["mplock"] = "0";
			["mplocked"] = "0";
			["mplockper"] = 0;
			["name"] = "Protect";
			["ncurrentaction"] = "";
			["npc"] = "0";
			["npcskill"] = "";
			["npskill"] = "";
			["nskill"] = "";
			["nskillprio"] = "";
			["offgcd"] = "0";
			["onlyparty"] = "0";
			["onlysolo"] = "0";
			["pbuff"] = "";
			["pbuffdura"] = 0;
			["pcskill"] = "";
			["petbuff"] = "";
			["petbuffdura"] = 0;
			["petnbuff"] = "";
			["petnbuffdura"] = 0;
			["pgtrg"] = "Direct";
			["phpb"] = 0;
			["phpl"] = 0;
			["pmppb"] = 0;
			["pmppl"] = 0;
			["pnbuff"] = "146+147";
			["pnbuffdura"] = 0;
			["ppos"] = "None";
			["ppowb"] = 0;
			["ppowl"] = 0;
			["prio"] = 8;
			["pskill"] = "";
			["ptbuff"] = "";
			["ptcount"] = 0;
			["pthpb"] = 0;
			["pthpl"] = 0;
			["ptmpb"] = 0;
			["ptmpl"] = 0;
			["ptnbuff"] = "";
			["ptpb"] = 0;
			["ptpl"] = 0;
			["ptrg"] = "Any";
			["pttpb"] = 0;
			["pttpl"] = 0;
			["punderattack"] = "0";
			["pvepvp"] = "Both";
			["secspassed"] = 1;
			["skncdtimemax"] = "";
			["skncdtimemin"] = "";
			["sknoffcd"] = "";
			["sknready"] = "";
			["skoffcd"] = "";
			["skready"] = "";
			["sktype"] = "Action";
			["stype"] = "Action";
			["tacount"] = 0;
			["tahpl"] = 0;
			["tarange"] = 0;
			["tbuff"] = "";
			["tbuffowner"] = "Any";
			["tcastids"] = "";
			["tcastonme"] = "0";
			["tcasttime"] = "0.0";
			["tcontids"] = "";
			["tecount"] = 0;
			["tecount2"] = 0;
			["televel"] = "Any";
			["terange"] = 0;
			["thpadv"] = 0;
			["thpb"] = 0;
			["thpcb"] = 0;
			["thpcl"] = 0;
			["thpl"] = 0;
			["tmpl"] = 0;
			["tnbuff"] = "";
			["tnbuffdura"] = 0;
			["tncontids"] = "";
			["trg"] = "Player";
			["trgtype"] = "Any";
			["ttpl"] = 0;
			["type"] = 1;
			["used"] = "1";
		};
		[9] = {
			["alias"] = "";
			["cbreak"] = "0";
			["charge"] = "0";
			["combat"] = "Any";
			["dobuff"] = "0";
			["doprev"] = "0";
			["filterfive"] = "Ignore";
			["filterfour"] = "Ignore";
			["filterone"] = "Ignore";
			["filterthree"] = "Ignore";
			["filtertwo"] = "Ignore";
			["hprio1"] = "None";
			["hprio2"] = "None";
			["hprio3"] = "None";
			["hprio4"] = "None";
			["hpriohp"] = 0;
			["id"] = 126;
			["lastcast"] = 0;
			["levelmax"] = 0;
			["levelmin"] = 0;
			["minRange"] = 0;
			["mplock"] = "0";
			["mplocked"] = "0";
			["mplockper"] = 0;
			["name"] = "Esuna";
			["ncurrentaction"] = "";
			["npc"] = "0";
			["npcskill"] = "";
			["npskill"] = "";
			["nskill"] = "";
			["nskillprio"] = "";
			["offgcd"] = "0";
			["onlyparty"] = "0";
			["onlysolo"] = "0";
			["pbuff"] = "";
			["pbuffdura"] = 0;
			["pcskill"] = "";
			["petbuff"] = "";
			["petbuffdura"] = 0;
			["petnbuff"] = "";
			["petnbuffdura"] = 0;
			["pgtrg"] = "Direct";
			["phpb"] = 0;
			["phpl"] = 0;
			["pmppb"] = 0;
			["pmppl"] = 0;
			["pnbuff"] = "";
			["pnbuffdura"] = 0;
			["ppos"] = "None";
			["ppowb"] = 0;
			["ppowl"] = 0;
			["prio"] = 9;
			["pskill"] = "";
			["ptbuff"] = "17,18";
			["ptcount"] = 0;
			["pthpb"] = 0;
			["pthpl"] = 0;
			["ptmpb"] = 0;
			["ptmpl"] = 0;
			["ptnbuff"] = "";
			["ptpb"] = 0;
			["ptpl"] = 0;
			["ptrg"] = "Any";
			["pttpb"] = 0;
			["pttpl"] = 0;
			["punderattack"] = "0";
			["pvepvp"] = "Both";
			["secspassed"] = 0;
			["skncdtimemax"] = "";
			["skncdtimemin"] = "";
			["sknoffcd"] = "";
			["sknready"] = "";
			["skoffcd"] = "";
			["skready"] = "";
			["sktype"] = "Action";
			["stype"] = "Action";
			["tacount"] = 0;
			["tahpl"] = 0;
			["tarange"] = 0;
			["tbuff"] = "";
			["tbuffowner"] = "Player";
			["tcastids"] = "";
			["tcastonme"] = "0";
			["tcasttime"] = "0.0";
			["tcontids"] = "";
			["tecount"] = 0;
			["tecount2"] = 0;
			["televel"] = "Any";
			["terange"] = 0;
			["thpadv"] = 0;
			["thpb"] = 0;
			["thpcb"] = 0;
			["thpcl"] = 0;
			["thpl"] = 0;
			["tmpl"] = 0;
			["tnbuff"] = "";
			["tnbuffdura"] = 0;
			["tncontids"] = "";
			["trg"] = "Party";
			["trgtype"] = "Any";
			["ttpl"] = 0;
			["type"] = 1;
			["used"] = "1";
		};
		[10] = {
			["alias"] = "";
			["cbreak"] = "0";
			["charge"] = "0";
			["combat"] = "In Combat";
			["dobuff"] = "0";
			["doprev"] = "0";
			["filterfive"] = "Ignore";
			["filterfour"] = "Ignore";
			["filterone"] = "Ignore";
			["filterthree"] = "Ignore";
			["filtertwo"] = "Ignore";
			["hprio1"] = "None";
			["hprio2"] = "None";
			["hprio3"] = "None";
			["hprio4"] = "None";
			["hpriohp"] = 0;
			["id"] = 121;
			["lastcast"] = 0;
			["levelmax"] = 0;
			["levelmin"] = 0;
			["minRange"] = 0;
			["mplock"] = "0";
			["mplocked"] = "0";
			["mplockper"] = 0;
			["name"] = "Aero";
			["ncurrentaction"] = "";
			["npc"] = "0";
			["npcskill"] = "";
			["npskill"] = "";
			["nskill"] = "";
			["nskillprio"] = "";
			["offgcd"] = "0";
			["onlyparty"] = "0";
			["onlysolo"] = "0";
			["pbuff"] = "";
			["pbuffdura"] = 0;
			["pcskill"] = "";
			["petbuff"] = "";
			["petbuffdura"] = 0;
			["petnbuff"] = "";
			["petnbuffdura"] = 0;
			["pgtrg"] = "Direct";
			["phpb"] = 0;
			["phpl"] = 0;
			["pmppb"] = 0;
			["pmppl"] = 0;
			["pnbuff"] = "";
			["pnbuffdura"] = 0;
			["ppos"] = "None";
			["ppowb"] = 0;
			["ppowl"] = 0;
			["prio"] = 10;
			["pskill"] = "";
			["ptbuff"] = "";
			["ptcount"] = 0;
			["pthpb"] = 0;
			["pthpl"] = 0;
			["ptmpb"] = 0;
			["ptmpl"] = 0;
			["ptnbuff"] = "";
			["ptpb"] = 0;
			["ptpl"] = 0;
			["ptrg"] = "Enemy";
			["pttpb"] = 0;
			["pttpl"] = 0;
			["punderattack"] = "0";
			["pvepvp"] = "Both";
			["secspassed"] = 0;
			["skncdtimemax"] = "";
			["skncdtimemin"] = "";
			["sknoffcd"] = "";
			["sknready"] = "";
			["skoffcd"] = "";
			["skready"] = "";
			["sktype"] = "Action";
			["stype"] = "Action";
			["tacount"] = 0;
			["tahpl"] = 0;
			["tarange"] = 0;
			["tbuff"] = "";
			["tbuffowner"] = "Player";
			["tcastids"] = "";
			["tcastonme"] = "0";
			["tcasttime"] = "0.0";
			["tcontids"] = "";
			["tecount"] = 0;
			["tecount2"] = 0;
			["televel"] = "Any";
			["terange"] = 0;
			["thpadv"] = 0;
			["thpb"] = 0;
			["thpcb"] = 0;
			["thpcl"] = 0;
			["thpl"] = 0;
			["tmpl"] = 0;
			["tnbuff"] = "143";
			["tnbuffdura"] = 3;
			["tncontids"] = "";
			["trg"] = "Target";
			["trgtype"] = "Any";
			["ttpl"] = 0;
			["type"] = 1;
			["used"] = "1";
		};
		[11] = {
			["alias"] = "";
			["cbreak"] = "0";
			["charge"] = "0";
			["combat"] = "In Combat";
			["dobuff"] = "0";
			["doprev"] = "0";
			["filterfive"] = "Ignore";
			["filterfour"] = "Ignore";
			["filterone"] = "Ignore";
			["filterthree"] = "Ignore";
			["filtertwo"] = "Ignore";
			["hprio1"] = "None";
			["hprio2"] = "None";
			["hprio3"] = "None";
			["hprio4"] = "None";
			["hpriohp"] = 0;
			["id"] = 127;
			["lastcast"] = 0;
			["levelmax"] = 0;
			["levelmin"] = 21;
			["minRange"] = 0;
			["mplock"] = "1";
			["mplocked"] = "1";
			["mplockper"] = 20;
			["name"] = "Stone II";
			["ncurrentaction"] = "";
			["npc"] = "0";
			["npcskill"] = "";
			["npskill"] = "";
			["nskill"] = "";
			["nskillprio"] = "";
			["offgcd"] = "0";
			["onlyparty"] = "0";
			["onlysolo"] = "0";
			["pbuff"] = "";
			["pbuffdura"] = 0;
			["pcskill"] = "";
			["petbuff"] = "";
			["petbuffdura"] = 0;
			["petnbuff"] = "";
			["petnbuffdura"] = 0;
			["pgtrg"] = "Direct";
			["phpb"] = 0;
			["phpl"] = 0;
			["pmppb"] = 0;
			["pmppl"] = 20;
			["pnbuff"] = "";
			["pnbuffdura"] = 0;
			["ppos"] = "None";
			["ppowb"] = 0;
			["ppowl"] = 0;
			["prio"] = 11;
			["pskill"] = "";
			["ptbuff"] = "";
			["ptcount"] = 0;
			["pthpb"] = 0;
			["pthpl"] = 0;
			["ptmpb"] = 0;
			["ptmpl"] = 0;
			["ptnbuff"] = "";
			["ptpb"] = 0;
			["ptpl"] = 0;
			["ptrg"] = "Enemy";
			["pttpb"] = 0;
			["pttpl"] = 0;
			["punderattack"] = "0";
			["pvepvp"] = "Both";
			["secspassed"] = 0;
			["skncdtimemax"] = "";
			["skncdtimemin"] = "";
			["sknoffcd"] = "";
			["sknready"] = "";
			["skoffcd"] = "";
			["skready"] = "";
			["sktype"] = "Action";
			["stype"] = "Action";
			["tacount"] = 0;
			["tahpl"] = 0;
			["tarange"] = 0;
			["tbuff"] = "";
			["tbuffowner"] = "Player";
			["tcastids"] = "";
			["tcastonme"] = "0";
			["tcasttime"] = "0.0";
			["tcontids"] = "";
			["tecount"] = 0;
			["tecount2"] = 0;
			["televel"] = "Any";
			["terange"] = 0;
			["thpadv"] = 0;
			["thpb"] = 0;
			["thpcb"] = 0;
			["thpcl"] = 0;
			["thpl"] = 0;
			["tmpl"] = 0;
			["tnbuff"] = "";
			["tnbuffdura"] = 0;
			["tncontids"] = "";
			["trg"] = "Target";
			["trgtype"] = "Any";
			["ttpl"] = 0;
			["type"] = 1;
			["used"] = "1";
		};
		[12] = {
			["alias"] = "";
			["cbreak"] = "0";
			["charge"] = "0";
			["combat"] = "In Combat";
			["dobuff"] = "0";
			["doprev"] = "0";
			["filterfive"] = "Ignore";
			["filterfour"] = "Ignore";
			["filterone"] = "Ignore";
			["filterthree"] = "Ignore";
			["filtertwo"] = "Ignore";
			["hprio1"] = "None";
			["hprio2"] = "None";
			["hprio3"] = "None";
			["hprio4"] = "None";
			["hpriohp"] = 0;
			["id"] = 119;
			["lastcast"] = 0;
			["levelmax"] = 0;
			["levelmin"] = 0;
			["minRange"] = 0;
			["mplock"] = "0";
			["mplocked"] = "0";
			["mplockper"] = 0;
			["name"] = "Stone";
			["ncurrentaction"] = "";
			["npc"] = "0";
			["npcskill"] = "";
			["npskill"] = "";
			["nskill"] = "";
			["nskillprio"] = "";
			["offgcd"] = "0";
			["onlyparty"] = "0";
			["onlysolo"] = "1";
			["pbuff"] = "";
			["pbuffdura"] = 0;
			["pcskill"] = "";
			["petbuff"] = "";
			["petbuffdura"] = 0;
			["petnbuff"] = "";
			["petnbuffdura"] = 0;
			["pgtrg"] = "Direct";
			["phpb"] = 0;
			["phpl"] = 0;
			["pmppb"] = 0;
			["pmppl"] = 0;
			["pnbuff"] = "";
			["pnbuffdura"] = 0;
			["ppos"] = "None";
			["ppowb"] = 0;
			["ppowl"] = 0;
			["prio"] = 12;
			["pskill"] = "";
			["ptbuff"] = "";
			["ptcount"] = 0;
			["pthpb"] = 0;
			["pthpl"] = 0;
			["ptmpb"] = 0;
			["ptmpl"] = 0;
			["ptnbuff"] = "";
			["ptpb"] = 0;
			["ptpl"] = 0;
			["ptrg"] = "Enemy";
			["pttpb"] = 0;
			["pttpl"] = 0;
			["punderattack"] = "0";
			["pvepvp"] = "Both";
			["secspassed"] = 0;
			["skncdtimemax"] = "";
			["skncdtimemin"] = "";
			["sknoffcd"] = "";
			["sknready"] = "";
			["skoffcd"] = "";
			["skready"] = "";
			["sktype"] = "Action";
			["stype"] = "Action";
			["tacount"] = 0;
			["tahpl"] = 0;
			["tarange"] = 0;
			["tbuff"] = "";
			["tbuffowner"] = "Player";
			["tcastids"] = "";
			["tcastonme"] = "0";
			["tcasttime"] = "0.0";
			["tcontids"] = "";
			["tecount"] = 0;
			["tecount2"] = 0;
			["televel"] = "Any";
			["terange"] = 0;
			["thpadv"] = 0;
			["thpb"] = 0;
			["thpcb"] = 0;
			["thpcl"] = 0;
			["thpl"] = 0;
			["tmpl"] = 0;
			["tnbuff"] = "";
			["tnbuffdura"] = 0;
			["tncontids"] = "";
			["trg"] = "Target";
			["trgtype"] = "Any";
			["ttpl"] = 0;
			["type"] = 1;
			["used"] = "1";
		};
		[13] = {
			["alias"] = "";
			["cbreak"] = "0";
			["charge"] = "0";
			["combat"] = "Any";
			["dobuff"] = "0";
			["doprev"] = "0";
			["filterfive"] = "Ignore";
			["filterfour"] = "Ignore";
			["filterone"] = "Ignore";
			["filterthree"] = "Ignore";
			["filtertwo"] = "Ignore";
			["hprio1"] = "None";
			["hprio2"] = "None";
			["hprio3"] = "None";
			["hprio4"] = "None";
			["hpriohp"] = 0;
			["id"] = 129;
			["lastcast"] = 0;
			["levelmax"] = 0;
			["levelmin"] = 0;
			["minRange"] = 0;
			["mplock"] = "0";
			["mplocked"] = "0";
			["mplockper"] = 0;
			["name"] = "Stoneskin";
			["ncurrentaction"] = "";
			["npc"] = "0";
			["npcskill"] = "";
			["npskill"] = "";
			["nskill"] = "";
			["nskillprio"] = "";
			["offgcd"] = "0";
			["onlyparty"] = "0";
			["onlysolo"] = "0";
			["pbuff"] = "";
			["pbuffdura"] = 0;
			["pcskill"] = "";
			["petbuff"] = "";
			["petbuffdura"] = 0;
			["petnbuff"] = "";
			["petnbuffdura"] = 0;
			["pgtrg"] = "Direct";
			["phpb"] = 0;
			["phpl"] = 0;
			["pmppb"] = 0;
			["pmppl"] = 0;
			["pnbuff"] = "";
			["pnbuffdura"] = 0;
			["ppos"] = "None";
			["ppowb"] = 0;
			["ppowl"] = 0;
			["prio"] = 13;
			["pskill"] = "";
			["ptbuff"] = "";
			["ptcount"] = 0;
			["pthpb"] = 0;
			["pthpl"] = 0;
			["ptmpb"] = 0;
			["ptmpl"] = 0;
			["ptnbuff"] = "151";
			["ptpb"] = 0;
			["ptpl"] = 0;
			["ptrg"] = "Any";
			["pttpb"] = 0;
			["pttpl"] = 0;
			["punderattack"] = "0";
			["pvepvp"] = "Both";
			["secspassed"] = 0;
			["skncdtimemax"] = "";
			["skncdtimemin"] = "";
			["sknoffcd"] = "";
			["sknready"] = "";
			["skoffcd"] = "";
			["skready"] = "";
			["sktype"] = "Action";
			["stype"] = "Action";
			["tacount"] = 0;
			["tahpl"] = 0;
			["tarange"] = 0;
			["tbuff"] = "";
			["tbuffowner"] = "Player";
			["tcastids"] = "";
			["tcastonme"] = "0";
			["tcasttime"] = "0.0";
			["tcontids"] = "";
			["tecount"] = 0;
			["tecount2"] = 0;
			["televel"] = "Any";
			["terange"] = 0;
			["thpadv"] = 0;
			["thpb"] = 0;
			["thpcb"] = 0;
			["thpcl"] = 0;
			["thpl"] = 0;
			["tmpl"] = 0;
			["tnbuff"] = "";
			["tnbuffdura"] = 0;
			["tncontids"] = "";
			["trg"] = "PartyS";
			["trgtype"] = "Any";
			["ttpl"] = 0;
			["type"] = 1;
			["used"] = "1";
		};
	};
	["version"] = 2;
}
return obj1
