// ************************ EXIT **************************

instance  Info_Riordian_EXIT (C_INFO)
{
	npc			= KDW_605_Riordian;
	nr			= 999;
	condition	= Info_Riordian_EXIT_Condition;
	information	= Info_Riordian_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Riordian_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Riordian_EXIT_Info()
{
	AI_StopProcessInfos	(self);
	
	if (!Npc_HasItems (self,ItArRuneThunderball))
	{
		CreateInvItem (self,ItArRuneThunderball);
	};

};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************//Bist du der Wassermagier, der die Tränke braut?
instance Info_Riordian_NEWS (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_NEWS_Condition;
	information	= Info_Riordian_NEWS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Przysy³a mnie Saturas.";
};

FUNC INT Info_Riordian_NEWS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_OFFER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_NEWS_Info()
{
	AI_Output (other, self,"Info_Riordian_NEWS_15_01"); //Przysy³a mnie Saturas.
	AI_Output (self, other,"Info_Riordian_NEWS_14_02"); //Ach, chodŸ bli¿ej. Ju¿ mi o wszystkim doniesiono.
	AI_Output (self, other,"Info_Riordian_NEWS_14_03"); //Proszê, weŸ to. Znajdziesz tu najró¿niejsze wywary.
	AI_Output (self, other,"Info_Riordian_NEWS_14_04"); //Teraz mo¿esz ju¿ ruszaæ na poszukiwanie kamieni ogniskuj¹cych. Jesteœ nasz¹ jedyn¹ nadziej¹.

	CreateInvItems (self, ItFo_Potion_Health_01,	20); 
	B_GiveInvItems (self,hero, ItFo_Potion_Health_01,	20); //Notwendig für die Ausschrift "20 Items übergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems(hero, ItFo_Potion_Health_01,	15);

	CreateInvItems (hero, ItFo_Potion_Mana_01,		5);
	CreateInvItems (hero, ItFo_Potion_Health_02,	2);
	CreateInvItems (hero, ItFo_Potion_Mana_02,		2);
	CreateInvItems (hero, ItFo_Potion_Health_03,	1);
	CreateInvItems (hero, ItFo_Potion_Mana_03,		1);
	CreateInvItems (hero, ItFo_Potion_Haste_02,		2);
	//balans
	//CreateInvItems (hero, ItFo_Potion_Strength_01,	1);
	//CreateInvItems (hero, ItFo_Potion_Dex_01,		1);
};

//***************************************************************************
//	Info REWARD
//***************************************************************************
instance Info_Riordian_REWARD (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_REWARD_Condition;
	information	= Info_Riordian_REWARD_Info;
	permanent	= 0;
	important 	= 0;
	description = "Saturas powiedzia³, ¿e masz dla mnie nagrodê.";
};

FUNC INT Info_Riordian_REWARD_Condition()
{	
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_REWARD_Info()
{
	AI_Output			(other, self,"Info_Riordian_REWARD_15_01"); //Saturas powiedzia³, ¿e masz dla mnie nagrodê.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_02"); //Ach, chodŸ, chodŸ!
	AI_Output			(self, other,"Info_Riordian_REWARD_14_03"); //Nasz przywódca opowiedzia³ mi o twoich bohaterskich czynach.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_04"); //Ca³y nasz Obóz... Ach, co ja mówiê - ca³a KOLONIA powinna ci byæ dozgonnie wdziêczna.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_05"); //Przyjmij tê skromn¹ nagrodê w uznaniu twoich zas³ug.

	CreateInvItems		(self, ItFo_Potion_Health_02,		20);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_02, 20);//Notwenidg für Ausschrift "20 Items übergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems  (hero, ItFo_Potion_Health_02, 		15);

	CreateInvItems		(hero, ItFo_Potion_Mana_02,			5);
	CreateInvItems		(hero, ItFo_Potion_Health_03,		2);
	CreateInvItems		(hero, ItFo_Potion_Mana_03,			2);
	CreateInvItems		(hero, ItFo_Potion_Haste_02,		3);
	CreateInvItems		(hero, ItFo_Potion_Master_01,		1);
	CreateInvItems		(hero, ItFo_Potion_Health_Perma_02,	1);
	CreateInvItems		(hero, ItFo_Potion_Mana_Perma_02,	1);

	B_LogEntry			(CH3_BringFoci,	"Riordian by³ jak zwykle uprzejmy. Otrzyma³em od niego zapas magicznych wywarów. To niezwykle cenny i przydatny dar.");
	if	Npc_KnowsInfo(hero, Info_Cronos_REWARD)
	{
		Log_SetTopicStatus(CH3_BringFoci,	LOG_SUCCESS);
	};
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info MESSAGE
//---------------------------------------------------------------------
instance Info_Riordian_MESSAGE (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_MESSAGE_Condition;
	information	= Info_Riordian_MESSAGE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Riordian_MESSAGE_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredFreeMine
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_MESSAGE_Info()
{
	AI_Output (self, hero,"Info_Riordian_MESSAGE_14_01"); //Cieszê siê, ¿e ju¿ jesteœ. Czeka³em na ciebie!
};
/*
//========================================
//-----------------> Geshenke
//========================================

INSTANCE DIA_Riordian_Geshenke (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 1;
   condition    = DIA_Riordian_Geshenke_Condition;
   information  = DIA_Riordian_Geshenke_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Riordian_Geshenke_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Saturas_KillCzarnyDebil))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Riordian_Geshenke_Info()
{
    AI_Output (self, other ,"DIA_Riordian_Geshenke_03_01"); //Podobno pozby³eœ siê Czarnego Maga.
    AI_Output (self, other ,"DIA_Riordian_Geshenke_03_02"); //Twoja odwaga i si³a budz¹ we mnie podziw.
    AI_Output (self, other ,"DIA_Riordian_Geshenke_03_03"); //WeŸ te eliksiry. Z pewnoœci¹ pomog¹ ci wyleczyæ rany.
    AI_Output (other, self ,"DIA_Riordian_Geshenke_15_04"); //Dziêki.
    CreateInvItems (self, ItFo_Potion_Mana_03, 10);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_03, 10);
    CreateInvItems (self, ItFo_Potion_Health_03, 10);
    B_GiveInvItems (self, other, ItFo_Potion_Health_03, 10);
    CreateInvItems (self, ItFo_Potion_Haste_01, 15);
    B_GiveInvItems (self, other, ItFo_Potion_Haste_01, 15);
    CreateInvItems (self, ItFo_Potion_Mana_Perma_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_Perma_01, 1);
    AI_StopProcessInfos	(self);
};

*/
//---------------------------------------------------------------------
//	Info MESSAGEWHY
//---------------------------------------------------------------------
instance Info_Riordian_MESSAGEWHY (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_MESSAGEWHY_Condition;
	information	= Info_Riordian_MESSAGEWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Czeka³eœ? Jak to?";
};

FUNC INT Info_Riordian_MESSAGEWHY_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Riordian_MESSAGE))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_MESSAGEWHY_Info()
{
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_01"); //Czeka³eœ? Jak to?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_02"); //Gorn prosi³ mnie, ¿ebym ciê do niego przys³a³, gdy tylko siê zjawisz.
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_03"); //O co chodzi?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_04"); //Ma plan, jak odzyskaæ zajêt¹ kopalniê.
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_05"); //Czy wci¹¿ pilnuje wejœcia do kopalni?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_06"); //Tak! Proszê, zajrzyj do niego mo¿liwie jak najszybciej!
};
/*------------------------------------------------------------------------
//							WELCOME							//
------------------------------------------------------------------------*/
instance KDW_605_Riordian_WELCOME (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_WELCOME_Condition;
	information		= KDW_605_Riordian_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_605_Riordian_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW )
	
	{
		return TRUE;
	};
};
func void  KDW_605_Riordian_WELCOME_Info()
{
	AI_Output (self, other,"KDW_605_Riordian_WELCOME_Info_14_01"); //Cieszê siê, ¿e do nas do³¹czy³eœ.
};
//-----------------------------------------------------------
instance KDW_605_Riordian_HEAL (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_HEAL_Condition;
	information		= KDW_605_Riordian_HEAL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_605_Riordian_HEAL_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	&& (Npc_KnowsInfo(hero,KDW_605_Riordian_WELCOME))
	{
		return TRUE;
	};
};
func void  KDW_605_Riordian_HEAL_Info()
{
	AI_Output (self, other,"KDW_605_Riordian_HEAL_Info_14_01"); //Jeœli jesteœ ranny, mogê ci pomóc.
};
// ***************************** INFOS ****************************************//

instance  KDW_605_Riordian_HEALINFO (C_INFO)
{
	npc				= KDW_605_Riordian;
	nr				= 100;
	condition		= KDW_605_Riordian_HEALINFO_Condition;
	information		= KDW_605_Riordian_HEALINFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jestem ranny. Mo¿esz coœ na to poradziæ?"; 
};

FUNC int  KDW_605_Riordian_HEALINFO_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]))
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_605_Riordian_HEALINFO_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_HEALINFO_Info_15_01"); //Jestem ranny. Mo¿esz coœ na to poradziæ?
	AI_Output (self, other,"KDW_605_Riordian_HEALINFO_Info_14_02"); //Tymi s³owy przywo³ujê uzdrawiaj¹c¹ si³ê! Niech twe cia³o i duch znów zaznaj¹ spokoju!
	 
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];
	Snd_Play  ("MFX_Heal_Cast");
};  
/*------------------------------------------------------------------------
							GREET									
------------------------------------------------------------------------*/

instance  KDW_605_Riordian_GREET (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_GREET_Condition;
	information		= KDW_605_Riordian_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Witaj, magu!"; 
};

FUNC int  KDW_605_Riordian_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_605_Riordian_GREET_Info()
{
	AI_Output 		(other, self,"KDW_605_Riordian_GREET_Info_15_01"); //Witaj, magu!
	AI_Output 		(self, other,"KDW_605_Riordian_GREET_Info_14_02"); //Jestem Riordian, alchemik. Zgadujê, ¿e szukasz magicznego napoju?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry 		(GE_TraderNC,"Riordian, jeden z Magów Wody, sprzedaje magiczne wywary. Znajdê go w laboratorium alchemicznym, na górnym poziomie.");
	
};  
/*------------------------------------------------------------------------
							TRADE								
------------------------------------------------------------------------*/

instance  KDW_605_Riordian_TRADE (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_TRADE_Condition;
	information		= KDW_605_Riordian_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Poka¿ mi co masz do zaoferowania."; 
	trade			= 1;
};

FUNC int  KDW_605_Riordian_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};

};
FUNC void  KDW_605_Riordian_TRADE_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_TRADE_Info_15_01"); //Poka¿ mi co masz do zaoferowania.
	
};  
//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_riordian_KnowsAlchemy2 (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 4;
   condition    = DIA_riordian_KnowsAlchemy2_Condition;
   information  = DIA_riordian_KnowsAlchemy2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_1, LPCOST_TALENT_ALCHEMY_1,150);
};

FUNC INT DIA_riordian_KnowsAlchemy2_Condition()
{
    if (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 0) && (Npc_GetTrueGuild    (hero) == GIL_KDW)
    {
    return TRUE;
    };
};


FUNC VOID DIA_riordian_KnowsAlchemy2_Info()
{
    AI_Output (other, self ,"DIA_riordian_KnowsAlchemy2_15_01"); //Naucz mnie podstaw alchemii.
    if  (hero.lp >= 10) && (Npc_HasItems (hero, ItMiNugget)>=150)
    {
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_02"); //No dobrze. Nauczê ciê warzyæ proste mikstury i alkohole, oraz przygotowywaæ tytoñ.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_03"); //To wcale nie jest takie trudne.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_04"); //Przede wszystkim potrzebujesz przepisu.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_05"); //Szczególnie dla trudniejszych mikstur.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_06"); //Podstawowe mo¿esz próbowaæ uwarzyæ sam.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_07"); //Kieruj siê zdrowym rozs¹dkiem i b¹dŸ spokojny.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_08"); //Ostro¿nie dawkuj sk³adniki. 
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
		PrintScreen	("Nowa umiejêtnoœæ: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 10;
		DIA_riordian_KnowsAlchemy2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_09"); //Nie mogê ciê tego nauczyæ.
	DIA_riordian_KnowsAlchemy2.permanent = true;
	if (!hero.lp >= 10)
	{
	PrintScreen (HAVENT_LP,-1, 18, "Font_New_10_Red.TGA", 2);
	};
	if (!Npc_HasItems (other, ItMiNugget) >=150)
	{
	PrintScreen (HAVENT_ORE,-1, 21, "Font_New_10_Red.TGA", 2);
	};
    AI_StopProcessInfos	(self);
    };

};
//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_riordian_KnowsAlchemy2_L2 (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 4;
   condition    = DIA_riordian_KnowsAlchemy2_L2_Condition;
   information  = DIA_riordian_KnowsAlchemy2_L2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_2, LPCOST_TALENT_ALCHEMY_2,360);
};

FUNC INT DIA_riordian_KnowsAlchemy2_L2_Condition()
{
    if (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 1) && (Npc_GetTrueGuild    (hero) == GIL_KDW)
    {
    return TRUE;
    };
};


FUNC VOID DIA_riordian_KnowsAlchemy2_L2_Info()
{
    AI_Output (other, self ,"DIA_riordian_KnowsAlchemy2_L2_15_01"); //Naucz mnie z³o¿onej alchemii.
    if  (hero.lp >= 20) && (Npc_HasItems (hero, ItMiNugget)>=360)
    {
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_02"); //Aby przyrz¹dziæ trudniejsze mikstury, bêdziesz potrzebowa³ przepisu.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_03"); //Nigdy nie próbuj sam wytwarzaæ silnych mikstur. Wielu alchemików przyp³aci³o to ¿yciem.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_04"); //Wa¿ne s¹ tutaj sk³adniki. To z czym bêdziesz mia³ do czynienia to nie byle ziele - to swoiste pok³ady magicznej energii drzemi¹cej w liœciach i ³odygach.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_05"); //Bogowie obdarzyli nas umiejêtnoœci¹ syntezy tej energii.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_06"); //Gotowe mikstury bêdziesz móg³ ulepszyæ.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_07"); //Podstawowym czynnikiem wzmacniaj¹cym jest czysty alkohol. 
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_08"); //To tyle. B¹dŸ ostro¿ny.
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 2);
		PrintScreen	("Postêp w umiejêtnoœci: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 360);
		hero.lp = hero.lp - 20;
		DIA_riordian_KnowsAlchemy2_l2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_09"); //Nie mogê ciê tego nauczyæ.
	DIA_riordian_KnowsAlchemy2_l2.permanent = true;
	if (!hero.lp >= 20)
	{
	PrintScreen (HAVENT_LP,-1, 18, "Font_New_10_Red.TGA", 2);
	};
	if (!Npc_HasItems (other, ItMiNugget) >=360)
	{
	PrintScreen (HAVENT_ORE,-1, 21, "Font_New_10_Red.TGA", 2);
	};
    AI_StopProcessInfos	(self);
    };

};

/*
//========================================
//-----------------> LekPotrzebny
//========================================

INSTANCE DIA_Riordian_LekPotrzebny (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 1;
   condition    = DIA_Riordian_LekPotrzebny_Condition;
   information  = DIA_Riordian_LekPotrzebny_Info;
   permanent	= FALSE;
   description	= "Potrzebujê leku na zatrucia!";
};

FUNC INT DIA_Riordian_LekPotrzebny_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Saturas_DajMiLek))
    && (MIS_lekiDlaAva == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Riordian_LekPotrzebny_Info()
{
    AI_Output (other, self ,"DIA_Riordian_LekPotrzebny_15_01"); //Potrzebujê leku na zatrucia!
    AI_Output (other, self ,"DIA_Riordian_LekPotrzebny_15_02"); //I to pilnie!
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_03"); //Niedobrze. Nie mam sk³adników.
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_04"); //Ostatni eliksir da³em Najemnikowi pogryzionemu przez wê¿a.
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_05"); //Teraz nie mam ju¿ tej mikstury.
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_06"); //Zale¿y ci na czasie?
    AI_Output (other, self ,"DIA_Riordian_LekPotrzebny_15_07"); //Tak, i to bardzo.
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_08"); //Je¿eli chcesz mo¿esz mi przynieœæ sk³adniki, a ja przyrz¹dzê ci ten wywar.
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_09"); //Mogê te¿ daæ ci przepis i pójdziesz z nim do innego alchemika.
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_10"); //Jak chcesz?
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_11"); //Mi potrzebne s¹: zêbate ziele, 3 du¿e roœliny lecznicze, serafis i nasiona czerwonego buka.
    AI_Output (self, other ,"DIA_Riordian_LekPotrzebny_03_12"); //Cholera, sporo tego.
    B_LogEntry                     (CH1_lekiDlaAva,"Riordian nie ma odpowiednich sk³adników, ¿eby uwarzyæ miksturê. Muszê mu je przynieœæ lub wzi¹æ miksturê i poszukaæ innego alchemika.");

    B_GiveXP (100);
};

//========================================
//-----------------> Skaldniki
//========================================

INSTANCE DIA_Riordian_Skaldniki (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 2;
   condition    = DIA_Riordian_Skaldniki_Condition;
   information  = DIA_Riordian_Skaldniki_Info;
   permanent	= FALSE;
   description	= "Mam ska³dniki.";
};

FUNC INT DIA_Riordian_Skaldniki_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Riordian_LekPotrzebny))
    && (Npc_HasItems (other, ItFo_Plants_Herb_03) >=3)
    && (Npc_HasItems (other, ItFo_Plants_Seraphis_01) >=1)
    && (Npc_HasItems (other, ItFo_Plants_Bloodwood_01) >=1)
    && (Npc_HasItems (other, ItFo_Plants_Speed01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Riordian_Skaldniki_Info()
{
    AI_Output (other, self ,"DIA_Riordian_Skaldniki_15_01"); //Mam ska³dniki.
    AI_Output (self, other ,"DIA_Riordian_Skaldniki_03_02"); //Widaæ, ¿e Adanos jest z tob¹.
    AI_Output (self, other ,"DIA_Riordian_Skaldniki_03_03"); //Daj mi je.
    AI_Output (self, other ,"DIA_Riordian_Skaldniki_03_04"); //PodejdŸ tu za chwilê.
    B_LogEntry                     (CH1_lekiDlaAva,"Przynios³em Riordianowi sk³adniki. Za chwilie uwarzy mi miksturê.");

    B_GiveXP (350);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Mixtura
//========================================

INSTANCE DIA_Riordian_Mixtura (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 3;
   condition    = DIA_Riordian_Mixtura_Condition;
   information  = DIA_Riordian_Mixtura_Info;
   permanent	= FALSE;
   description	= "Mikstura gotowa?";
};

FUNC INT DIA_Riordian_Mixtura_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Riordian_Skaldniki))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Riordian_Mixtura_Info()
{
    AI_Output (other, self ,"DIA_Riordian_Mixtura_15_01"); //Mikstura gotowa?
    AI_Output (self, other ,"DIA_Riordian_Mixtura_03_02"); //Tak. Proszê.
    CreateInvItems (self, LekAva, 1);
    B_GiveInvItems (self, other, LekAva, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GiveRezepte
//========================================

INSTANCE DIA_Riordian_GiveRezepte (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 4;
   condition    = DIA_Riordian_GiveRezepte_Condition;
   information  = DIA_Riordian_GiveRezepte_Info;
   permanent	= FALSE;
   description	= "Daj mi tê recepturê.";
};

FUNC INT DIA_Riordian_GiveRezepte_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Riordian_LekPotrzebny))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Riordian_GiveRezepte_Info()
{
    AI_Output (other, self ,"DIA_Riordian_GiveRezepte_15_01"); //Daj mi tê recepturê.
    AI_Output (self, other ,"DIA_Riordian_GiveRezepte_03_02"); //Oto ona.
    CreateInvItems (self, Receptura_LekAva, 1);
    B_GiveInvItems (self, other, Receptura_LekAva, 1);
    B_LogEntry                     (CH1_lekiDlaAva,"Podj¹³em siê odnalezienia innego alchemika.");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

*/
