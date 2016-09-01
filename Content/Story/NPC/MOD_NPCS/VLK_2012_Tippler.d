instance VLK_3999_Tippler (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Tippler";
Npctype = Npctype_Main;
guild = GIL_VLK;
level = 3;
voice = 4;
id = 3999;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 12;
attribute[ATR_DEXTERITY] = 10;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 40;
attribute[ATR_HITPOINTS] = 40;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Pony", 2,  2,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Poker_01);
CreateInvItems  (self,ItFoLoaf,1);
CreateInvItems  (self,ItFoBooze,1);

//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Coward;
daily_routine = Rtn_start_3999;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3999 ()
{
TA_Stand (06,00,12,00,"TIPPLER");
TA_PickRice (12,00,15,45,"TIPPLER");
TA_Smoke (15,45,18,22,"TIPPLER");
TA_SitCampfire (18,22,22,00,"TIPPLER");
TA_PlayTune (22,00,01,00,"TIPPLER"); //fp dodany
TA_SitCampfire (01,00,06,00,"TIPPLER");
};