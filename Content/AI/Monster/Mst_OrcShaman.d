/*************************************************************************
**	Orc SHAMAN Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_OrcShaman(C_Npc)			
{
	name							=	"Ork-szaman";
	guild							=	GIL_ORCSHAMAN;
	npctype							=	NPCTYPE_GUARD;
	level							=	30;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	120;
	attribute	[ATR_DEXTERITY]		=	120;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;

	attribute	[ATR_MANA_MAX] 		=	70;
	attribute	[ATR_MANA] 			=	70;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	70;
	protection	[PROT_EDGE]			=	70;
	protection	[PROT_POINT]		=	30;
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	110;
//----------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
//---------------------------------------------------------
	fight_tactic 				=	FAI_HUMAN_MAGE;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1200;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_Orc_Pray;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
func void Set_OrcShaman_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	Mdl_ApplyOverlayMds 	(self,	"Orc_Shaman.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyShaman",DEFAULT,	DEFAULT,	"Orc_HeadShaman",	DEFAULT,  	DEFAULT,	-1);
};

func void Set_OrcShaman_VisualsBoss()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	Mdl_ApplyOverlayMds 	(self,	"Orc_Shaman.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyWarrior",1,	DEFAULT,	"Orc_HeadWarrior",	1,  	DEFAULT,	-1);
};


/*************************************************************************
**	Orc Shaman    														**
*************************************************************************/

INSTANCE OrcShaman (Mst_Default_OrcShaman)
{
	Set_OrcShaman_Visuals();
	CreateInvItem			(self,	ItArRuneFireball);
	EquipItem				(self,	ItRwOrcstaff);		// für Magiemodus
};

INSTANCE Varrag_Harosh  (Mst_Default_OrcShaman)
{
	name  =	"Szaman Varrag-Harosh Potê¿ny";
	level = Level_Varrag;
	guild = GIL_ORCSHAMAN;
	//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1200;
	attribute	[ATR_HITPOINTS]		=	1200;

	attribute	[ATR_MANA_MAX] 		=	130;
	attribute	[ATR_MANA] 			=	130;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	55;
	protection	[PROT_EDGE]			=	55;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	40;
	protection	[PROT_MAGIC]		=	80;
	Set_OrcShaman_Visuals();
	fight_tactic 			=	FAI_HUMAN_MAGE;
	CreateInvItems			(self,	ItArRuneFirebolt,1);
	CreateInvItems			(self,	ItFo_PotionTime_Mana_01,2);
	EquipItem				(self,	ItRwOrcstaff);		// für Magiemodus
};

INSTANCE Orc_Guslarz_1  (Mst_Default_OrcShaman)
{
	name  =	"Szaman Nahen-Harrag";
	level = Level_Nehen;
	guild = GIL_ORCSHAMAN;
	//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]				=	150;
	attribute	[ATR_DEXTERITY]				=	130;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1500;
	attribute	[ATR_HITPOINTS]				=	1500;

	attribute	[ATR_MANA_MAX] 			=	130;
	attribute	[ATR_MANA] 					=	130;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]				=	60;
	protection	[PROT_EDGE]				=	70;
	protection	[PROT_POINT]				=	50;
	protection	[PROT_FIRE]					=	50;
	protection	[PROT_FLY]					=	40;
	protection	[PROT_MAGIC]				=	90;
	Set_OrcShaman_Visuals();
	fight_tactic 			=	FAI_HUMAN_MASTER;
	//CreateInvItems			(self,	ItArRuneFirebolt,1);
	CreateInvItems			(self,	ItFo_PotionTime_Mana_01,2);
	EquipItem				(self,	ItRwOrcstaff);		// für Magiemodus
};
