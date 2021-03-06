instance NON_4050_Chris (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Chris";
Npctype = npctype_main;
guild = GIL_BAU;
level = 60;
voice = 6;
id = 4050;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 120;
attribute[ATR_DEXTERITY] = 120;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 600;
attribute[ATR_HITPOINTS] = 600;

//----------Wyglad----------

	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_naked0",1, 1,"Hum_Head_Bald",57, 1,BAU_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);	

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_03);
EquipItem		(self, ItRw_Bow_Long_01);

	//----------Handlarz_aivar------
	self.aivar[AIV_NPCISTRADER] = true;
	
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_4050;
//Generated by Gothic NPC Maker
};

FUNC VOID Rtn_start_4050 ()
{
	TA_SitAround 		(08,00,21,00,"BN_SIAT_CHRIS");
	TA_Smoke 			(21,00,23,00,"BN_PALENIE_CHRIS");
	TA_Sleep 				(23,00,08,00,"BN_SEN_CHRIS");
};
FUNC VOID Rtn_follow_4050 ()
{
	TA_FollowPC 		(08,00,21,00,"BN_SIAT_CHRIS");
	TA_FollowPC 		(21,00,23,00,"BN_SIAT_CHRIS");
	TA_FollowPC 		(23,00,08,00,"BN_SIAT_CHRIS");
};
FUNC VOID Rtn_kopalnia_4050 ()
{
	TA_Stand 		(08,00,21,00,"CAMP01");
	TA_Boss 		(21,00,23,00,"CAMP01");
	TA_Stand 		(23,00,08,00,"CAMP01");
};