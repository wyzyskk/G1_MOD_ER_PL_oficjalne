instance NOV_1372_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Shine";
	Npctype 	=	npctype_main;
	guild 		=	GIL_NOV;
	level 		=	5;
	flags 		=	0;
	
	voice 		=	3;
	id 			=	1372;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	12;
	attribute[ATR_DEXTERITY] 		=	8;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	60;
	attribute[ATR_HITPOINTS] 		=	1;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 117,  3, NOV_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
		
	//-------- inventory --------

	CreateInvItem (self, ItMw_2H_Staff_01);
	CreateInvItem (self, ItFoSoup);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1372;

};

FUNC VOID Rtn_start_1372 ()
{
	TA_Stay	(24,00,06,00,"ER_WD_QUEST_TRUP_01");
  	TA_Stay	(06,00,24,00,"ER_WD_QUEST_TRUP_01");	 //SPAWN_OW_MOLERAT_06_CAVE_GUARD3 die enemy 
};

instance NOV_1373_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Nowicjusz - rabuœ";
	Npctype 	=	npctype_main;
	guild 		=	GIL_DMB;
	level 		=	7;
	flags 		=	0;
	
	voice 		=	3;
	id 			=	1373;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	30;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	230;
	attribute[ATR_HITPOINTS] 		=	230;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 117,  3, NOV_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	Npc_SetTalentSkill (self, NPC_TALENT_2H,5);
		
	//-------- inventory --------

	EquipItem (self, ItMw_2H_Staff_01);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, RudaEmanuela);       
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1373;

};

FUNC VOID Rtn_start_1373 ()
{
	//Npc_SetPermAttitude (NOV_1374_Novize, ATT_HOSTILE);
	TA_SMOKE	(24,00,06,00,"OC_ROUND_26");
  	TA_SMOKE	(06,00,24,00,"OC_ROUND_26");
};

instance NOV_1374_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Nowicjusz - rabuœ";
	Npctype 	=	npctype_main;
	guild 		=	GIL_DMB;
	level 		=	4;
	flags 		=	0;
	
	voice 		=	3;
	id 			=	1374;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	22;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	180;
	attribute[ATR_HITPOINTS] 		=	180;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 117,  3, NOV_ARMOR_l);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Hatchet_01);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1374;

};

FUNC VOID Rtn_start_1374 ()
{
	//Npc_SetPermAttitude (NOV_1374_Novize, ATT_HOSTILE);
	TA_SMOKE	(24,00,06,00,"ER_WD_QUEST_BANDIT_01");
  	TA_SMOKE	(06,00,24,00,"ER_WD_QUEST_BANDIT_01");
};