instance NOV_5077_Nowicjusz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Pomocnik Ghorana";
Npctype = Npctype_Ambient;
guild = GIL_NOV;
level = 7;
voice = 2;
id = 5077;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 20;
attribute[ATR_DEXTERITY] = 20;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 70;
attribute[ATR_HITPOINTS] = 70;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 1,"Hum_Head_Psionic",59, 1,NOV_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Hatchet_01);
CreateInvItems  (self,ItFoWine,3);
CreateInvItems  (self,ItFo_wineberrys_01,8);
CreateInvItems  (self,ItFoLoaf,2);
CreateInvItems  (self,ItFo_Potion_Water_01,7);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Coward;
daily_routine = Rtn_start_5077;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_5077 ()
{
TA_HerbAlchemy 	 (08,00,11,35,"WINNICA_STANOWISKO1");
TA_SitAround	 (11,35,13,40,"WINNICA_BENCH1");
TA_HerbAlchemy 	 (13,40,17,20,"WINNICA_STANOWISKO1");
TA_Pickrice 	 (17,20,18,35,"WINNICA2");
TA_SitAround	 (18,35,08,00,"WINNICA_BENCH1");
};