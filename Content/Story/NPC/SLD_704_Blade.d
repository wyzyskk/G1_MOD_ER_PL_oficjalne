instance SLD_704_Blade (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Kosa";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_SLD;       
	level =					18;
	
	voice =					11;
	id =					704;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		70;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	256;
	attribute[ATR_HITPOINTS] =		256;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Pony", 47, 2,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------

	Npc_SetTalentSkill (self, NPC_TALENT_1H,8);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,6);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);	

	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 22);
	CreateInvItems (self, ItFoRice,9);
	CreateInvItems (self, ItFoLoaf,5);
	CreateInvItems (self, ItFoMutton,4);
	CreateInvItems(self, ItMiNugget, 18);
	CreateInvItems (self, ItFoBooze,7);
	CreateInvItems (self, ItLsTorch,5);
	CreateInvItems (self, ItFo_Potion_Health_02,11);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItMi_Stuff_Mug_01);
	CreateInvItem (self, ItMi_Stuff_Amphore_01);
	
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_prestart_704;

};

FUNC VOID Rtn_prestart_704 ()
{
	TA_SitAround	(23,00,07,30,"NEW_BLADE_START");
	TA_SitAround	(07,30,23,00,"NEW_BLADE_START");
};

FUNC VOID Rtn_guide_704 ()
{
	TA_GuidePC	(23,00,07,30,"OW_PATH_07_21");
	TA_GuidePC	(07,30,23,00,"OW_PATH_07_21");
};

FUNC VOID Rtn_guide2_704 ()
{
	TA_GuidePC	(23,00,07,30,"OW_PATH_3006");
	TA_GuidePC	(07,30,23,00,"OW_PATH_3006");
};
FUNC VOID Rtn_start_704 ()
{
	TA_Sleep	    (23,00,07,30,"NC_HUT10_IN");
	TA_Smalltalk	(07,30,23,00,"NC_HUT09_OUT");
};
FUNC VOID Rtn_toOC_704 ()
{
	TA_Stand	    (23,00,07,30,"OC_ROUND_2");
	TA_Stand		(07,30,23,00,"OC_ROUND_2");
};
FUNC VOID Rtn_kaplica_704 ()
{
	TA_SitAround	    (23,00,07,30,"INNOS_BENCH2_OC");
	TA_SitAround		(07,30,23,00,"INNOS_BENCH2_OC");
};


