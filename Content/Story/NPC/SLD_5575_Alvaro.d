instance SLD_5575_Alvaro (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Alvaro";
	Npctype =				NPCTYPE_main;
	guild =					GIL_SLD;       
	level =					15;
	
	voice =					11;
	id =					5575;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		55;
	attribute[ATR_DEXTERITY] =		55;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	200;
	attribute[ATR_HITPOINTS] =		200;


	//-------- visuals --------
	//edit by Nocturn
	
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	//twarz 10
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 3,"Hum_Head_Pony", 139, 2,SLD_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
			
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_1H,5);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,4);
	

	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
	CreateInvItems (self, ItFoRice,7);
	CreateInvItems (self, ItFoLoaf,5);
	CreateInvItems (self, ItFoMutton,4);
	CreateInvItems(self, ItMiNugget, 15);
	CreateInvItems (self, ItFoBooze,5);
	CreateInvItems (self, ItLsTorch,5);
	CreateInvItems (self, ItFo_Potion_Health_02,7);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItMi_Stuff_Mug_01);
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_5575;

};

FUNC VOID Rtn_start_5575 ()
{
	TA_Stand 	(07,25,11,30,	"NC_ALVAREZ");
	TA_Skrzynka	(11,30,13,25,	"NC_HUT02_IN");
	TA_RepairHut 	(13,25,17,00,	"NC_ALVAREZ_HUT");
	TA_Stand 	(17,00,20,00,	"NC_ALVAREZ");
	TA_Smoke 	(20,00,22,00,	"NC_ALVAREZ");
	TA_Sleep	(22,00,07,25,	"NC_HUT02_IN");
};

FUNC VOID Rtn_przydupas_5575 ()
{
	TA_Stand		(06,00,12,00,"CHUJ1");
	TA_Stand		(12,00,06,00,"CHUJ1");
};
























