instance SLD_737_Torlof (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Torlof";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_SLD;       
	level =					19;
	
	voice =					4;
	id =					737;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		95;
	attribute[ATR_DEXTERITY] =		75;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	268;
	attribute[ATR_HITPOINTS] =		268;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Pony", 53,  1,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);

	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------

	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);	

	//-------- inventory --------                                    

	EquipItem (self, Torlofs_Axt);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoLoaf,5);
	CreateInvItems (self, ItFoMutton,4);
	CreateInvItems(self, ItMiNugget, 15);
	CreateInvItems (self, ItFoBooze,5);
	CreateInvItems (self, ItLsTorch,5);
	CreateInvItems (self, ItFo_Potion_Health_02,7);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItMi_Stuff_Mug_01);
	
	
		
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_737;
	
	//-------------Misions-------------------

};

FUNC VOID Rtn_start_737 ()
{
	TA_Smalltalk	(08,00,23,00,"NC_HUT04_OUT");
	TA_Boss			(23,00,01,15,"NC_HUT04_OUT");
	TA_Sleep 		(01,15,08,00,"NC_HUT04_IN");
};
FUNC VOID Rtn_obrona_737 ()
{
	TA_Smalltalk	(08,00,23,00,"TALK2");
	TA_Smalltalk	(23,00,01,15,"TALK2");
	TA_Smalltalk 	(01,15,08,00,"TALK2");
};
FUNC VOID Rtn_atak_737 ()
{
	TA_GuidePC	    (08,00,23,00,"KOX");
	TA_GuidePC		(23,00,01,15,"KOX");
	TA_GuidePC 		(01,15,08,00,"KOX");
};
FUNC VOID Rtn_mine_737 ()
{
	TA_Stand		(08,00,23,00,"CAMP01");
	TA_Stand		(23,00,01,15,"CAMP01");
	TA_Stand 		(01,15,08,00,"CAMP01");
};









