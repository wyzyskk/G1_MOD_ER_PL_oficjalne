instance NON_3071_Vart (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Vart";
Npctype = Npctype_Main;
guild = GIL_NONE;
level = 30;
voice = 5;
id = 3071;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 70;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 380;
attribute[ATR_HITPOINTS] = 380;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 1,"Hum_Head_Bald",107, 1,STT_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek---------- //edit by Nocturn
EquipItem		(self, VartSword);
EquipItem		(self, ItRw_Bow_Long_04);
CreateInvItems  (self,ItAmArrow,200);
CreateInvItems  (self,ItFo_wineberrys_01,2);
CreateInvItems  (self,ItFoMuttonRaw,3);
CreateInvItems  (self,ItFo_Potion_Water_01,5);
CreateInvItems  (self,ItFo_Potion_Health_01,2);
CreateInvItems  (self,Schutzamulett_Waffen,1);
CreateInvItems  (self,Schutzring_Geschosse1,1);
CreateInvItems  (self,ItKeLockpick,3);
CreateInvItems  (self,ItMiScoop,1);
CreateInvItems  (self,ItMi_Stuff_Pan_01,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3071;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3071 ()
{
TA_Stand (06,00,13,45,"OW_SAWHUT_MOLERAT_MOVEMENT6");
TA_PracticeSword (13,45,17,00,"OW_SAWHUT_MOLERAT_MOVEMENT4");
TA_Smoke (17,00,18,22,"OW_SAWHUT_MOLERAT_MOVEMENT6");
TA_Smoke (18,22,06,00,"OW_SAWHUT_MOLERAT_MOVEMENT4");
};
FUNC VOID Rtn_ded_3071 ()
{
TA_Smoke (06,00,22,00,"VART");
TA_Smoke (22,00,06,00,"VART");
};
FUNC VOID Rtn_follow_3071 ()
{
TA_FollowPC (06,00,22,00,"OW_SAWHUT_MOLERAT_MOVEMENT6");
TA_FollowPC (22,00,06,00,"OW_SAWHUT_MOLERAT_MOVEMENT6");
};