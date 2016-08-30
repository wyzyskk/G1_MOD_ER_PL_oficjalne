/*************************************************************************
**	Poszukiwacz Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Poszukiwacz(C_Npc)			
{
	name							=	"Tajemniczy Kultysta";
	guild							=	GIL_GRD;
	npctype							=	NPCTYPE_GUARD;
	level							=	18;
//-----------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;

	attribute	[ATR_MANA_MAX] 		=	40;
	attribute	[ATR_MANA] 			=	40;

	protection	[PROT_BLUNT]		=	45;
	protection	[PROT_EDGE]			=	40;
	protection	[PROT_POINT]		=	15;	
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	40;
//-----------------------------------------------------------
	damagetype 						=	DAM_EDGE;

//-----------------------------------------------------------
	fight_tactic					=	FAI_HUMAN_MAGE;
//-----------------------------------------------------------
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
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
// Zwei Hautfarben mit jeweils zwei Gesichtstexturen
//-------------------------------------------------------------
func void Set_Poszukiwacz_Visuals()
{
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1,1 ,"Hum_Head_Psionic", 24,  2, PoszukiwaczArmor);
};

/*************************************************************************
**	Poszukiwacz    															**
*************************************************************************/

INSTANCE Poszukiwacz	(Mst_Default_Poszukiwacz)
{
	Set_Poszukiwacz_Visuals();
	guild					=	GIL_GRD;
	fight_tactic 			=	FAI_HUMAN_MAGE;
	CreateInvItems			(self,	ItArScrollSummonSkeletons,	3);
	CreateInvItem			(self,	ItArRunePyrokinesis);
};




