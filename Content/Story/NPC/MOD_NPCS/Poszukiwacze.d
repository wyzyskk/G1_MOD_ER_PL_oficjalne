/*
Poszukiwacze - Gothic:Edycja rozszerzona
Skrypty NPC Ambient
Rozdzia� 4
26 lipiec 2012
*/

instance NON_3075_Poszukiwacz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Poszukiwacz;
Npctype = Npctype_Main;
guild = GIL_NONE;
level = 30;
voice = 14;
id = 3075;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 100;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 300;
attribute[ATR_MANA] = 300;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Psionic",19, 0,PoszukiwaczArmor);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_MAGE,6);

//----------Ekwipunek----------
CreateInvItems  (self,ItArRuneFirebolt,1);
CreateInvItems  (self,ItArRuneStormFist,1);
CreateInvItems  (self,ItFo_Potion_Mana_01,3);
CreateInvItems  (self,ItArScrollfirerain,1);
CreateInvItems  (self,ItMi_Alchemy_Quicksilver_01,2);
CreateInvItems  (self,ItFo_Plants_mountainmoos_01,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Mage;
daily_routine = Rtn_start_3075;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3075 ()
{
TA_Stay (06,00,18,00,"BUC2");
TA_Stay (18,00,06,00,"BUC2");
};

instance NON_3074_Poszukiwacz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Poszukiwacz;
Npctype = Npctype_Main;
guild = GIL_NONE;
level = 30;
voice = 15;
id = 3074;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 100;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 300;
attribute[ATR_MANA] = 300;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Psionic",19, 0,PoszukiwaczArmor);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_MAGE,6);

//----------Ekwipunek----------
EquipItem (self, ItMw_2H_Staff_01); 
CreateInvItems  (self,ItArRuneFirebolt,1);
CreateInvItems  (self,ItArRuneStormFist,1);
CreateInvItems  (self,ItFo_Potion_Mana_01,3);
CreateInvItems  (self,ItArScrollfirerain,1);
CreateInvItems  (self,ItMi_Alchemy_Quicksilver_01,2);
CreateInvItems  (self,ItFo_Plants_mountainmoos_01,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_COWARD; 
daily_routine = Rtn_start_3074;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3074 ()
{
TA_Stay (18,00,06,00,"BUC1");
TA_Stay (06,00,18,00,"BUC1");
};
instance NON_3076_Poszukiwacz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Poszukiwacz;
Npctype = Npctype_Main;
guild = GIL_NONE;
level = 30;
voice = 14;
id = 3076;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 100;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 300;
attribute[ATR_MANA] = 300;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Psionic",19, 0,PoszukiwaczArmor);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_MAGE,6);

//----------Ekwipunek----------
EquipItem (self, ItMw_2H_Staff_01); 
CreateInvItems  (self,ItArRuneFirebolt,1);
CreateInvItems  (self,ItArRuneStormFist,1);
CreateInvItems  (self,ItFo_Potion_Mana_01,3);
CreateInvItems  (self,ItArScrollfirerain,1);
CreateInvItems  (self,ItMi_Alchemy_Quicksilver_01,2);
CreateInvItems  (self,ItFo_Plants_mountainmoos_01,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_COWARD;
daily_routine = Rtn_start_3076;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3076 ()
{
TA_Stay (18,00,06,00,"BUC5");
TA_Stay (06,00,18,00,"BUC5");
};

//---------------------------------------
// Poszukiwacze z miejsca kultu
// Misja z Ashtonem 
//---------------------------------------

instance NON_7067_Poszukiwacz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Stra�nik bestii";
Npctype = Npctype_Main;
guild = GIL_NONE;
level = 30;
voice = 14;
id = 7067;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 100;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 300;
attribute[ATR_MANA] = 300;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Psionic",19, 0,PoszukiwaczArmor);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_MAGE,6);

//----------Ekwipunek----------
EquipItem		(self, ItArRuneFirebolt);
EquipItem		(self, ItArRuneStormFist);
//CreateInvItems  (self,ItArRunePyrokinesis,1);
//CreateInvItems  (self,ItArRuneStormFist,1);
CreateInvItems  (self,ItFo_Potion_Mana_01,3);
CreateInvItems  (self,ItArScrollfirerain,1);
CreateInvItems  (self,ItMi_Alchemy_Quicksilver_01,2);
CreateInvItems  (self,ItFo_Plants_mountainmoos_01,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Mage;
daily_routine = Rtn_start_7067;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_7067 ()
{
TA_PracticeMagic (18,00,06,00,"CULT5");
TA_PracticeMagic (06,00,18,00,"CULT5");
};

instance NON_3084_Poszukiwacz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Poszukiwacz;
Npctype = Npctype_Main;
guild = GIL_NONE;
level = 30;
voice = 14;
id = 3084;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 100;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 300;
attribute[ATR_MANA] = 300;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Psionic",19, 0,PoszukiwaczArmor);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_MAGE,6);

//----------Ekwipunek----------
EquipItem		(self, ItArRunePyrokinesis);
EquipItem		(self, ItArRuneStormFist);
//CreateInvItems  (self,ItArRunePyrokinesis,1);
//CreateInvItems  (self,ItArRuneStormFist,1);
CreateInvItems  (self,ItFo_Potion_Mana_01,3);
CreateInvItems  (self,ItArScrollfirerain,1);
CreateInvItems  (self,ItMi_Alchemy_Quicksilver_01,2);
CreateInvItems  (self,ItFo_Plants_mountainmoos_01,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Mage;
daily_routine = Rtn_start_3084;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3084 ()
{
TA_PracticeMagic (18,00,06,00,"CULT4");
TA_PracticeMagic (06,00,18,00,"CULT4");
};

instance NON_3083_Poszukiwacz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Poszukiwacz;
Npctype = Npctype_Main;
guild = GIL_NONE;
level = 30;
voice = 14;
id = 3083;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 100;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 300;
attribute[ATR_MANA] = 300;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Psionic",19, 0,PoszukiwaczArmor);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_MAGE,6);

//----------Ekwipunek----------
EquipItem		(self, ItArRuneFirebolt);
EquipItem		(self, ItArRuneStormFist);
//CreateInvItems  (self,ItArRunePyrokinesis,1);
//CreateInvItems  (self,ItArRuneStormFist,1);
CreateInvItems  (self,ItFo_Potion_Mana_01,3);
CreateInvItems  (self,ItArScrollfirerain,1);
CreateInvItems  (self,ItMi_Alchemy_Quicksilver_01,2);
CreateInvItems  (self,ItFo_Plants_mountainmoos_01,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Mage;
daily_routine = Rtn_start_3083;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3083 ()
{
TA_PracticeMagic (18,00,06,00,"CULT3");
TA_PracticeMagic (06,00,18,00,"CULT3");
};

instance NON_3082_Poszukiwacz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Poszukiwacz;
Npctype = Npctype_Main;
guild = GIL_NONE;
level = 30;
voice = 14;
id = 3082;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 100;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 300;
attribute[ATR_MANA] = 300;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Psionic",19, 0,PoszukiwaczArmor);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_MAGE,6);

//----------Ekwipunek----------
EquipItem		(self, ItArRunePyrokinesis);
EquipItem		(self, ItArRuneStormFist);
//CreateInvItems  (self,ItArRunePyrokinesis,1);
//CreateInvItems  (self,ItArRuneStormFist,1);
CreateInvItems  (self,ItFo_Potion_Mana_01,3);
CreateInvItems  (self,ItArScrollfirerain,1);
CreateInvItems  (self,ItMi_Alchemy_Quicksilver_01,2);
CreateInvItems  (self,ItFo_Plants_mountainmoos_01,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Mage;
daily_routine = Rtn_start_3082;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3082 ()
{
TA_PracticeMagic (18,00,06,00,"CULT2");
TA_PracticeMagic (06,00,18,00,"CULT2");
};

instance NON_3081_Poszukiwacz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Poszukiwacz;
Npctype = Npctype_Main;
guild = GIL_NONE;
level = 30;
voice = 14;
id = 3081;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 100;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 300;
attribute[ATR_MANA] = 300;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Psionic",19, 0,PoszukiwaczArmor);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_MAGE,6);

//----------Ekwipunek----------
EquipItem		(self, ItArRunePyrokinesis);
EquipItem		(self, ItArRuneStormFist);
//CreateInvItems  (self,ItArRunePyrokinesis,1);
//CreateInvItems  (self,ItArRuneStormFist,1);
CreateInvItems  (self,ItFo_Potion_Mana_01,3);
CreateInvItems  (self,ItArScrollfirerain,1);
CreateInvItems  (self,ItMi_Alchemy_Quicksilver_01,2);
CreateInvItems  (self,ItFo_Plants_mountainmoos_01,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Mage;
daily_routine = Rtn_start_3081;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3081 ()
{
TA_Stay (18,00,06,00,"CULT1");
TA_Stay (06,00,18,00,"CULT1");
};

//-----------------------------
//Poszukiwacz z g�r
//-----------------------------
instance NON_3080_Poszukiwacz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Poszukiwacz z g�r";
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 30;
voice = 14;
id = 3080;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 100;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 300;
attribute[ATR_MANA] = 300;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Psionic",19, 0,PoszukiwaczArmor);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_MAGE,6);

//----------Ekwipunek----------
EquipItem		(self, ItArRuneFirebolt);
EquipItem		(self, ItArRuneStormFist);
//CreateInvItems  (self,ItArRunePyrokinesis,1);
//CreateInvItems  (self,ItArRuneStormFist,1);
CreateInvItems  (self,ItFo_Potion_Mana_01,3);
CreateInvItems  (self,ItArScrollfirerain,1);
CreateInvItems  (self,ItMi_Alchemy_Quicksilver_01,2);
CreateInvItems  (self,ItFo_Plants_mountainmoos_01,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Mage;
daily_routine = Rtn_start_3080;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3080 ()
{
TA_Stay (18,00,06,00,"LOCATION_12_02");
TA_Stay (06,00,18,00,"LOCATION_12_02");
};


instance NON_3091_Poszukiwacz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Mroczny Mag Przywo�ania";
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 30;
voice = 14;
id = 3091;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 100;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 300;
attribute[ATR_MANA] = 300;
attribute[ATR_HITPOINTS_MAX] = 200;
attribute[ATR_HITPOINTS] = 200;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Psionic",19, 0,PoszukiwaczArmor);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_MAGE,6);

//----------Ekwipunek----------
CreateInvItems		(self, ItArScrollArmyOfDarkness,5);
CreateInvItems  (self,ItMi_Alchemy_Quicksilver_01,2);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Mage;
daily_routine = Rtn_start_3091;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3091 ()
{
TA_PracticeMagic (18,00,06,00,"BM_SKE1");
TA_PracticeMagic (06,00,18,00,"BM_SKE1");
};

instance NON_3090_Poszukiwacz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Mroczny Mag Przywo�ania";
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 30;
voice = 14;
id = 3090;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 100;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 300;
attribute[ATR_MANA] = 300;
attribute[ATR_HITPOINTS_MAX] = 200;
attribute[ATR_HITPOINTS] = 200;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Psionic",19, 0,PoszukiwaczArmor);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_MAGE,6);

//----------Ekwipunek----------
CreateInvItems		(self, ItArScrollArmyOfDarkness,5);
CreateInvItems  (self,ItFo_Potion_Mana_02,2);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Mage;
daily_routine = Rtn_start_3090;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3090 ()
{
TA_PracticeMagic (18,00,06,00,"BM_SKE2");
TA_PracticeMagic (06,00,18,00,"BM_SKE2");
};


instance NON_3092_ImportantWyslannik (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Mroczny Wys�annik";
Npctype = Npctype_Main;
guild = GIL_ZOMBIE;
level = 15;
voice = 12;
id = 3092;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 80;
attribute[ATR_DEXTERITY] = 80;
attribute[ATR_MANA_MAX] = 100;
attribute[ATR_MANA] = 100;
attribute[ATR_HITPOINTS_MAX] = 200;
attribute[ATR_HITPOINTS] = 200;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Psionic",19, 0,PoszukiwaczArmor);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_MAGE,6);

//----------Ekwipunek----------
CreateInvItems  (self,ItArRunePyrokinesis,2);
CreateInvItems  (self,ItFo_Potion_Mana_02,1);
CreateInvItems  (self,ItWrWorldmapBlackMage,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Mage;
daily_routine = Rtn_start_3092;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3092 ()
{
TA_Stay (18,00,06,00,"OW_PATH_1_15");
TA_Stay (06,00,18,00,"OW_PATH_1_15");
};
