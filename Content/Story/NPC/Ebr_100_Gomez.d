instance EBR_100_Gomez (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Gomez";
   	npctype  	= 	npctype_main;
   	guild 		=	GIL_EBR;
	level 		=	100;
	voice 		=	11;
	id 			=	100;
	flags		=	NPC_FLAG_IMMORTAL;
	
	//-------- abilities --------
	//edit by Nocturn
	
	attribute[ATR_STRENGTH] 	= 300;
	attribute[ATR_DEXTERITY] 	= 300;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 1000;
	attribute[ATR_HITPOINTS] 	= 1000;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 85,  4, EBR_ARMOR_H);

	B_Scale (self); 
	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	

	//-------- Talente --------
	//edit by Nocturn
	
	Npc_SetTalentSkill (self, NPC_TALENT_2H,10);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);	
	//-------- inventory --------
	//edit by Nocturn         
	
	EquipItem(self,Innos_Zorn);
	EquipItem(self,ItRw_Fury);
	EquipItem (self,Amulett_der_Macht);
	EquipItem (self,Schutzring_Total2);
	CreateInvItem (self,ItKe_Gomez_01);
	CreateInvItems (self,ItAmBolt,100);//s g1210
	//------------- ai -------------
	//edit by Nocturn
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	daily_routine	=	Rtn_Start_100;
};
FUNC VOID Rtn_start_100 ()
{
	TA_Ebr_HangAround	(00,00,07,00,	"OCC_BARONS_UPSTAIRS_BACK_ROOM_RIGHT");
	TA_Ebr_HangAround	(07,00,20,00,	"OCC_BARONS_GREATHALL_THRONE");
	TA_SitAround			(20,00,23,00,	"OCR_ARENA_BARONS_HUT_ROOFTOP");
	TA_StandAround		(23,00,00,00,	"OCC_BARONS_UPSTAIRS_BACK_ROOM_RIGHT");
};

func VOID Rtn_OT_100 ()
{
	TA_Ebr_HangAround	(07,00,20,00,	"OCC_BARONS_GREATHALL_THRONE");
	TA_Ebr_HangAround	(20,00,07,00,	"OCC_BARONS_GREATHALL_THRONE");
};