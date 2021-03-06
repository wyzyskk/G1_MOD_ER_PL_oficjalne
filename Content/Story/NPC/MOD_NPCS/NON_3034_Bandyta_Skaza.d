instance NON_3034_Bandyta (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Skaza";
Npctype = npctype_main;
guild = GIL_NONE;
level = 30;
voice = 7;
id = 3034;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 60;
attribute[ATR_DEXTERITY] = 60;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 100;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 2,"Hum_Head_Fighter",10, 2,ORG_ARMOR_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_03);
EquipItem		(self, ItRw_Bow_Long_01);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3034;
//Generated by Gothic NPC Maker
};
func void Rtn_start_3034 ()
{
TA_SitAround (07,00,21,00,"OCR_HUT_Z5_SIT");
TA_SitAround (21,00,07,00,"OCR_KARCZMA_LAWKA");
};

func void Rtn_guide_3034 ()
{
TA_GuidePC (07,00,21,00,"OC_ROUND_27");
TA_GuidePC (21,00,07,00,"OC_ROUND_27");
};
