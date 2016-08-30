//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_BandytaBriam_EXIT(C_INFO)
{
	npc             = NON_4051_Bandyta;
	nr              = 999;
	condition	= DIA_BandytaBriam_EXIT_Condition;
	information	= DIA_BandytaBriam_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_BandytaBriam_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BandytaBriam_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia³ -
// Dialogi ogólne, handel
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> WhoYou
//========================================

INSTANCE DIA_Bandyta_WhoYou (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_WhoYou_Condition;
   information  = DIA_Bandyta_WhoYou_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Bandyta_WhoYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bandyta_WhoYou_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_WhoYou_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Bandyta_WhoYou_03_02"); //Nazywam siê Briam, jestem alchemikiem.
    AI_Output (self, other ,"DIA_Bandyta_WhoYou_03_03"); //Przyrz¹dzam mikstury, eksperymentujê z zielem.
    AI_Output (self, other ,"DIA_Bandyta_WhoYou_03_04"); //No i oczywiœcie skrêcam ³odygi i destylujê gorza³kê.
    AI_Output (self, other ,"DIA_Bandyta_WhoYou_03_05"); //To chyba najwa¿niejsza robota w Obozie. Bandyci lubi¹ piæ i paliæ.
    //AI_Output (self, other ,"DIA_Bandyta_WhoYou_03_06"); //Wszystkim siê dzielimy.
    AI_Output (other, self ,"DIA_Bandyta_WhoYou_15_07"); //Móg³byœ nauczyæ mnie alchemii?
	AI_Output (self, other ,"DIA_Bandyta_WhoYou_03_08"); //Myœlê, ¿e za odpowiedni¹ op³at¹... czemu nie?
	//log
	Log_CreateTopic   	(GE_TeacherBAN,LOG_NOTE);
	B_LogEntry			(GE_TeacherBAN,"Briam nauczy mnie alchemii. Znajdê go w jaskini w Obozie Bandytów.");
};

//========================================
//-----------------> LifeInCamp
//========================================

INSTANCE DIA_Bandyta_LifeInCamp (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 2;
   condition    = DIA_Bandyta_LifeInCamp_Condition;
   information  = DIA_Bandyta_LifeInCamp_Info;
   permanent	= FALSE;
   description	= "Jak ci siê tu ¿yje?";
};

FUNC INT DIA_Bandyta_LifeInCamp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Bandyta_WhoYou))
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Bandyta_LifeInCamp_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_LifeInCamp_15_01"); //Jak ci siê tu ¿yje?
    AI_Output (self, other ,"DIA_Bandyta_LifeInCamp_03_02"); //Nie jest Ÿle. Ka¿dy zajmuje siê swoj¹ robot¹ i nie wchodzi innym w drogê.
    AI_Output (self, other ,"DIA_Bandyta_LifeInCamp_03_03"); //Quentin dobrze zarz¹dza Obozem i sprawiedliwie dzieli rudê.
    AI_Output (self, other ,"DIA_Bandyta_LifeInCamp_03_04"); //Zobaczysz, wkrótce siê st¹d wyrwiemy i sprzedamy rudê za z³oto.
};

//========================================
//-----------------> WorkInCamp
//========================================

INSTANCE DIA_Bandyta_WorkInCamp (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 3;
   condition    = DIA_Bandyta_WorkInCamp_Condition;
   information  = DIA_Bandyta_WorkInCamp_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o waszej organizacji pracy.";
};

FUNC INT DIA_Bandyta_WorkInCamp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Bandyta_WhoYou))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bandyta_WorkInCamp_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_WorkInCamp_15_01"); //Opowiedz mi o waszej organizacji pracy.
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_03"); //To proste. Ka¿dy ma wyznaczone jakieœ zadanie.
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_04"); //Wiêkszoœæ Bandytów pracuje na rzecz Obozu, a czêœæ wykonuje swoj¹ robotê na zewn¹trz.
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_05"); //Dziêki temu mamy jedzenie, wódkê i przedmioty potrzebne do przetrwania
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_06"); //Od czasu do czasu przychodzi tu jakiœ wys³annik z innego obozu.
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_07"); //Zazwyczaj prosz¹ nas o wykonanie jakiegoœ zadania, na które szkoda im w³asnych ludzi.
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_08"); //Po prostu najmujemy siê do trudnych zadañ.
    AI_Output (other, self ,"DIA_Bandyta_WorkInCamp_15_09"); //Czy inne obozy wami gardz¹? Tak mam to rozumieæ?
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_10"); //Niby tak, ale czasem zarabiamy po kilka tysiêcy bry³ek. Szczególnie dobrze p³ac¹ Guru.
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_11"); //Oczywiœcie, je¿eli uda nam siê prze¿yæ.
    AI_Output (self, other ,"DIA_Bandyta_WorkInCamp_03_12"); //Najczêœciej jednak wysy³amy doœwiadczonych ludzi takich jak Rocky, Doyle czy Martin.
};

//========================================
//-----------------> TRADE
//========================================
var int know_briam_sell;
INSTANCE DIA_Bandyta_TRADE (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 4;
   condition    = DIA_Bandyta_TRADE_Condition;
   information  = DIA_Bandyta_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chcê coœ kupiæ.";
};

FUNC INT DIA_Bandyta_TRADE_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Bandyta_WhoYou))
	{
    return TRUE; };
};

FUNC VOID DIA_Bandyta_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_TRADE_15_01"); //Chcê coœ kupiæ.
    AI_Output (self, other ,"DIA_Bandyta_TRADE_03_02"); //Wybierz sobie.
	if know_briam_sell == false
	{
	know_briam_sell = true;
	Log_CreateTopic	(GE_Bandit,	LOG_NOTE);//fix
	B_LogEntry		(GE_Bandit,	"Briam handluje ró¿nymi przedmiotami zwi¹zanymi z alchemi¹.");
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia³ 1
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> RAYAN
//========================================

INSTANCE DIA_Bandyta_RAYAN (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 3;
   condition    = DIA_Bandyta_RAYAN_Condition;
   information  = DIA_Bandyta_RAYAN_Info;
   permanent	= FALSE;
   description	= "Wiesz coœ o œmierci Rayana?";
};

FUNC INT DIA_Bandyta_RAYAN_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jens_TalkWithSmith))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bandyta_RAYAN_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_RAYAN_15_01"); //Wiesz coœ o œmierci Rayana?
    AI_Output (self, other ,"DIA_Bandyta_RAYAN_03_02"); //W³aœnie mia³em iœæ pogadaæ na ten temat z Jensem. To prawda, ¿e Kereth coœ kombinuje? 
	AI_Output (other, self ,"DIA_Bandyta_RAYAN_15_03"); //Tak. Masz jakieœ u¿ytecznie informacje.
    AI_Output (self, other ,"DIA_Bandyta_RAYAN_03_04"); //Chyba mam. Wczeœniej wydawa³y mi siê niewa¿ne, ale w œwietle tego co siê dzieje mog¹ byæ kluczowe.
	AI_Output (other, self ,"DIA_Bandyta_RAYAN_15_05"); //Zamieniam siê w s³uch.
    AI_Output (self, other ,"DIA_Bandyta_RAYAN_03_06"); //Widzia³em jak Kereth chowa³ do skrzyni miecz Jensa. To by³o póŸnym wieczorem. Wraca³ sk¹dœ. Na pocz¹tku myœla³em, ¿e po prostu odkupi³ tê broñ. 
    AI_Output (self, other ,"DIA_Bandyta_RAYAN_03_07"); //No, ale skoro s¹ skonfliktowani...
    AI_Output (other, self ,"DIA_Bandyta_RAYAN_15_08"); //Wychodzi³oby na to, ¿e Kereth sam rujnuje grób swojego brata, ¿eby wykurzyæ Jensa z Obozu. 
	AI_Output (self, other ,"DIA_Bandyta_RAYAN_03_09"); //Kawa³ sukinsyna z niego. Lepiej szybko naprostujcie tê sprawê. 
	
	B_LogEntry     (CH1_DestroyedGrave,"Briam przedstawi³ doœæ wa¿n¹ sprawê. Twierdzi, ¿e widzia³ jak Kereth póŸn¹ noc¹ chowa do swojej skrzyni miecz Jensa.");
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia³ 2
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> Dostwy
//========================================

INSTANCE DIA_Bandyta_Dostwy (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_Dostwy_Condition;
   information  = DIA_Bandyta_Dostwy_Info;
   permanent	= FALSE;
   description	= "Przyszed³em po dostawy.";
};

FUNC INT DIA_Bandyta_Dostwy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_UkonczonoSellAlco)) && (devmode_dostawyalkoholu == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Dostwy_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Dostwy_15_01"); //Przyszed³em po dostawy.
    AI_Output (self, other ,"DIA_Bandyta_Dostwy_03_02"); //Roznieœ to osobom, z którymi siê dogada³eœ.
    MIS_Dostawy = LOG_RUNNING;

    Log_CreateTopic          (CH1_Dostawy, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Dostawy, LOG_RUNNING);
    B_LogEntry                     (CH1_Dostawy,"Briam kaza³ mi roznieœæ dostawy alkoholu do obozów. Alkohol ma trafiæ do karczmarzy, z którymi wczeœniej nawi¹za³em wspó³pracê. ");
    if (Npc_KnowsInfo (hero, DIA_Karczmarz_Wpierdol))
    {
    CreateInvItems (self, ItMi_Alchemy_Alcohol_01, 30);
    B_GiveInvItems (self, other, ItMi_Alchemy_Alcohol_01, 30);
	}
	else
	{
	CreateInvItems (self, ItMi_Alchemy_Alcohol_01, 20);
    B_GiveInvItems (self, other, ItMi_Alchemy_Alcohol_01, 20);
	};
    AI_Output (self, other ,"DIA_Bandyta_Dostwy_03_03"); //Po dziesiêæ flaszek dla ka¿dego karczmarza. 
    AI_StopProcessInfos	(self);
};

var int dostawa1;//NO
var int dostawa2;//PSI
var int dostawa3;//SO

//========================================
//-----------------> DostawaNO
//========================================

INSTANCE DIA_Bandyta_DostawaNO (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_DostawaNO_Condition;
   information  = DIA_Bandyta_DostawaNO_Info;
   permanent	= FALSE;
   description	= "Dostarczy³em towar Mazinowi.";
};

FUNC INT DIA_Bandyta_DostawaNO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mazin_Dostawczak)) && (MIS_Dostawy = LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_DostawaNO_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_DostawaNO_15_01"); //Dostarczy³em towar Mazinowi.
    AI_Output (self, other ,"DIA_Bandyta_DostawaNO_03_02"); //Dobra robota.
	dostawa1 = 1;
};

//========================================
//-----------------> DostawaPSI
//========================================

INSTANCE DIA_Bandyta_DostawaPSI (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_DostawaPSI_Condition;
   information  = DIA_Bandyta_DostawaPSI_Info;
   permanent	= FALSE;
   description	= "Ghoran otrzyma³ alkohol.";
};

FUNC INT DIA_Bandyta_DostawaPSI_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_FirstDostawa)) && (MIS_Dostawy = LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_DostawaPSI_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_DostawaPSI_15_01"); //Ghoran otrzyma³ alkohol.
    AI_Output (self, other ,"DIA_Bandyta_DostawaNO_03_02"); //Dobra robota.
	dostawa2 = 1;
};

//========================================
//-----------------> DostawaSO
//========================================

INSTANCE DIA_Bandyta_DostawaSO (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_DostawaSO_Condition;
   information  = DIA_Bandyta_DostawaSO_Info;
   permanent	= FALSE;
   description	= "Karczmarz ze Starego Obozu otrzyma³ dostawê.";
};

FUNC INT DIA_Bandyta_DostawaSO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Karczmarz_DostwaOC)) && (MIS_Dostawy = LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_DostawaSO_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_DostawaSO_15_01"); //Karczmarz ze Starego Obozu otrzyma³ dostawê.
    AI_Output (self, other ,"DIA_Bandyta_DostawaNO_03_02"); //Dobra robota.
	dostawa3 = 1;
};

//========================================
//-----------------> DostawaALL
//========================================

INSTANCE DIA_Bandyta_DostawaALL (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_DostawaALL_Condition;
   information  = DIA_Bandyta_DostawaALL_Info;
   permanent	= FALSE;
   description	= "Uda³o mi siê zanieœæ wszystkim karczmarzom alkohol.";
};

FUNC INT DIA_Bandyta_DostawaALL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_DostawaNO)) && (Npc_KnowsInfo (hero, DIA_Bandyta_DostawaSO)) && (Npc_KnowsInfo (hero, DIA_Bandyta_DostawaPSI))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_DostawaALL_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_DostawaALL_15_01"); //Uda³o mi siê zanieœæ wszystkim karczmarzom alkohol.
    AI_Output (self, other ,"DIA_Bandyta_DostawaALL_15_02"); //No, to teraz masz trochê wolnego. WeŸ te piwka w nagrodê.
		
	B_LogEntry    (CH1_Dostawy,"Zanios³em wszystkim dostawy alkoholu. Moja robota dobieg³a koñca.");
	Log_SetTopicStatus       (CH1_Dostawy, LOG_SUCCESS);
	MIS_Dostawy = LOG_SUCCESS;
	B_GiveXP (150);
	CreateInvItems		(self, ItFo_OM_Beer_01,6);
	B_GiveInvItems      (self, hero, ItFo_OM_Beer_01,6);
};

//========================================
//-----------------> Przepisek
//========================================

INSTANCE DIA_Bandyta_Przepisek (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_Przepisek_Condition;
   information  = DIA_Bandyta_Przepisek_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie przepis.";
};

FUNC INT DIA_Bandyta_Przepisek_Condition()
{
    if (Npc_HasItems (other, ReceptaNowicjuszy) >=1)
    && (Npc_KnowsInfo (hero, DIA_Jens_DobraRobota))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Przepisek_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Przepisek_15_01"); //Mam dla ciebie przepis.
    AI_Output (self, other ,"DIA_Bandyta_Przepisek_03_02"); //Ten od Jensa?
    AI_Output (other, self ,"DIA_Bandyta_Przepisek_15_03"); //Tak. Rozmawia³eœ ju¿ z nim?
    AI_Output (self, other ,"DIA_Bandyta_Przepisek_03_04"); //Taa... Ju¿ siê pochwali³. 
    AI_Output (self, other ,"DIA_Bandyta_Przepisek_03_05"); //Daj mi ten przepis. Zobaczymy co z tego bêdzie.
    B_GiveInvItems (other, self, ReceptaNowicjuszy, 1);
    B_LogEntry               (CH1_NoweZiele2BAU,"Odnios³em recepturê Briamowi zgodnie z poleceniem. Pora czekaæ na efekty.");
    Log_SetTopicStatus       (CH1_NoweZiele2BAU, LOG_SUCCESS);
    MIS_NoweZiele2BAU = LOG_SUCCESS;

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Pensja
//========================================

INSTANCE DIA_Bandyta_Pensja (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 2;
   condition    = DIA_Bandyta_Pensja_Condition;
   information  = DIA_Bandyta_Pensja_Info;
   permanent	= FALSE;
   description	= "Kiedy mam siê zg³aszaæ po swoj¹ dzia³kê?";
};

FUNC INT DIA_Bandyta_Pensja_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_Przepisek))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Pensja_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Pensja_15_01"); //Kiedy mam siê zg³aszaæ po swoj¹ dzia³kê?
    AI_Output (self, other ,"DIA_Bandyta_Pensja_03_02"); //Chwila, chwila. Najpierw musisz znaleŸæ kupca na ziele. Dopiero wtedy bêdziemy mogli myœleæ o zyskach.
    AI_Output (self, other ,"DIA_Bandyta_Pensja_03_03"); //To musi byæ ktoœ, kto ma du¿y utarg. Popytaj handlarzy, a mo¿e ktoœ ci wpadnie w rêce. 
    AI_Output (self, other ,"DIA_Bandyta_Pensja_03_04"); //Daruj sobie wycieczkê do Sekty. To z góry skazane na pora¿kê.
    MIS_NoweZiele3BAU = LOG_RUNNING;

    Log_CreateTopic          (CH1_NoweZiele3BAU, LOG_MISSION);
    Log_SetTopicStatus       (CH1_NoweZiele3BAU, LOG_RUNNING);
    B_LogEntry               (CH1_NoweZiele3BAU,"Okazuje siê, ¿e receptura, któr¹ przynios³em nie wystarczy do osi¹gniêcia zysków. Aby zarabiaæ na zielu, musimy mieæ je komu sprzedaæ. Mam znaleŸæ jakiegoœ kupca na nasz towar. Briam od razu odradzi³ mi udanie siê do obozu Bractwa Œni¹cego. Powinienem zapytaæ w Nowym lub Starym Obozie. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KupiecSS
//========================================

INSTANCE DIA_Bandyta_KupiecSS (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_KupiecSS_Condition;
   information  = DIA_Bandyta_KupiecSS_Info;
   permanent	= FALSE;
   description	= "Za³atwi³em kupca.";
};

FUNC INT DIA_Bandyta_KupiecSS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Dexter_MocneZiele2))
    && (MIS_NoweZiele3BAU == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_KupiecSS_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_KupiecSS_15_01"); //Za³atwi³em kupca. To handlarz Dexter ze Starego Obozu.
    AI_Output (other, self ,"DIA_Bandyta_KupiecSS_15_02"); //Du¿o handluje z Nowicjuszami. Zna siê na zielu.
    AI_Output (self, other ,"DIA_Bandyta_KupiecSS_03_03"); //Dobra robota. Zabieram siê za produkcjê.
    AI_Output (self, other ,"DIA_Bandyta_KupiecSS_03_04"); //Kwestie wyp³aty reguluj z Jensem. To nie moja sprawa.
    B_LogEntry                     (CH1_NoweZiele3BAU,"Zg³osi³em Braimowi, ¿e bêdziemy teraz wspó³pracowaæ z Dexterem. Po wyp³atê mogê zg³aszaæ siê do Jensa.");
    Log_SetTopicStatus       (CH1_NoweZiele3BAU, LOG_SUCCESS);
    MIS_NoweZiele3BAU = LOG_SUCCESS;
	//experience
    B_GiveXP (200);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia³ 4
// W¹tek g³ówny
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> FreePotions
//========================================

INSTANCE DIA_Bandyta_FreePotions (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_FreePotions_Condition;
   information  = DIA_Bandyta_FreePotions_Info;
   permanent	= FALSE;
   description	= "Quentin przys³a³ mnie po eliksiry.";
};

FUNC INT DIA_Bandyta_FreePotions_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_nextWork22))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_FreePotions_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_FreePotions_15_01"); //Quentin przys³a³ mnie po eliksiry.
    AI_Output (self, other ,"DIA_Bandyta_FreePotions_03_02"); //Mam tu coœ dla ciebie. Powodzenia.
	//log
	B_LogEntry     (CH1_RozwalaUBnadytow,"Wzi¹³em od Briama eliksiry.");
	//items
	B_GiveInvItems (self,hero, ItFo_Potion_Health_02, 5);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia³ -
// Nauka alchemii
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_Bandyta_KnowsAlchemy2 (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 4;
   condition    = DIA_Bandyta_KnowsAlchemy2_Condition;
   information  = DIA_Bandyta_KnowsAlchemy2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_1, LPCOST_TALENT_ALCHEMY_1,150);
};

FUNC INT DIA_Bandyta_KnowsAlchemy2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_WhoYou))
    && (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 0)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_KnowsAlchemy2_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_KnowsAlchemy2_15_01"); //Naucz mnie podstaw alchemii.
    if  (hero.lp >= 10) && (Npc_HasItems (hero, ItMiNugget)>=150)
    {
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_02"); //No dobrze. Nauczê ciê warzyæ proste mikstury i alkohole, oraz przygotowywaæ tytoñ.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_03"); //To wcale nie jest takie trudne.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_04"); //Przede wszystkim potrzebujesz przepisu.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_05"); //Szczególnie dla trudniejszych mikstur.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_06"); //Podstawowe mo¿esz próbowaæ uwarzyæ sam.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_07"); //Kieruj siê zdrowym rozs¹dkiem i b¹dŸ spokojny.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_08"); //Ostro¿nie dawkuj sk³adniki. 
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
		PrintScreen	("Nowa umiejêtnoœæ: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 10;
		DIA_Bandyta_KnowsAlchemy2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_09"); //Nie mogê ciê tego nauczyæ.
	DIA_Bandyta_KnowsAlchemy2.permanent = true;
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

INSTANCE DIA_Bandyta_KnowsAlchemy2_L2 (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 4;
   condition    = DIA_Bandyta_KnowsAlchemy2_L2_Condition;
   information  = DIA_Bandyta_KnowsAlchemy2_L2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_2, LPCOST_TALENT_ALCHEMY_2,360);
};

FUNC INT DIA_Bandyta_KnowsAlchemy2_L2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_WhoYou))
    && (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_KnowsAlchemy2_L2_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_KnowsAlchemy2_L2_15_01"); //Naucz mnie z³o¿onej alchemii.
    if  (hero.lp >= 20) && (Npc_HasItems (hero, ItMiNugget)>=360)
    {
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_02"); //Aby przyrz¹dziæ trudniejsze mikstury bêdziesz potrzebowa³ przepisu.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_03"); //Nigdy nie próbuj sam wytwarzaæ silnych mikstur. Wielu alchemików przyp³aci³o to ¿yciem.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_04"); //Wa¿ne s¹ tutaj sk³adniki. To z czym bêdziesz mia³ do czynienia to nie byle ziele - to swoiste pok³ady magicznej energii drzemi¹cej w liœciach i ³odygach.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_05"); //Bogowie obdarzyli nas umiejêtnoœci¹ syntezy tej energii.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_06"); //Gotowe mikstury bêdziesz móg³ ulepszyæ.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_07"); //Podstawowym czynnikiem wzmacniaj¹cym jest czysty alkohol. 
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_08"); //To tyle. B¹dŸ ostro¿ny.
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 2);
		PrintScreen	("Postêp w umiejêtnoœci: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 360);
		hero.lp = hero.lp - 20;
		DIA_Bandyta_KnowsAlchemy2_l2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_09"); //Nie mogê ciê tego nauczyæ.
	DIA_Bandyta_KnowsAlchemy2_l2.permanent = true;
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

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia³ -
// Stuff
///////////////////////////////////////////////////////////////////////////////////////////

/*

//========================================
//-----------------> Zanisione
//========================================

INSTANCE DIA_Bandyta_Zanisione (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_Zanisione_Condition;
   information  = DIA_Bandyta_Zanisione_Info;
   permanent	= true;
   description	= "Co do mojego zadania...";
};

FUNC INT DIA_Bandyta_Zanisione_Condition()
{
    if (MIS_Dostawy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Zanisione_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_01"); //Co do mojego zadania...
    AI_Output (self, other ,"DIA_Bandyta_Zanisione_03_02"); //S³ucham.
		//*******
		if (Npc_KnowsInfo (hero, DIA_Ghoran_FirstDostawa))
		{
        dostawa1 = true;
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_03"); //Zanios³em alkohol do Bractwa.
        AI_Output (self, other ,"DIA_Bandyta_Zanisione_03_04"); //Œwietnie.
		}
		else
		{
		dostawa1 = false;
        AI_Output (self, other ,"DIA_Bandyta_Zanisione_03_09"); //Zanios³eœ do Bractwa?
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_10"); //Jeszcze nie.
        AI_Output (self, other ,"DIA_Bandyta_Zanisione_03_11"); //W takim razie idŸ.
		DIA_Bandyta_Zanisione.permanent = true;
		};
		//*******
    if (Npc_KnowsInfo (hero, DIA_Mazin_Dostawczak))
    {
		dostawa2 = true;
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_05"); //Dostarczy³em towar do Nowego Obozu.
        AI_Output (self, other ,"DIA_Bandyta_Zanisione_03_06"); //Dobra robota.
	}
    else
    {
		dostawa2 = false;
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_13"); //Muszê jeszcze iœæ do Nowego Obozu.
        AI_Output (self, other ,"DIA_Bandyta_Zanisione_03_14"); //W takim razie idŸ.	
		DIA_Bandyta_Zanisione.permanent = true;
    };
		//********
		if (Npc_KnowsInfo (hero, DIA_Karczmarz_Wpierdol)) &&  (Npc_KnowsInfo (hero, DIA_Karczmarz_DostwaOC)) 
		{
		dostawa3 = true;
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_07"); //Zanios³em alkohol do Starego Obozu.
        AI_Output (self, other ,"DIA_Bandyta_Zanisione_15_08"); //Dobrze.
		}
		else
		{
		AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_09"); //Jeszcze nie by³em w Starym Obozie.
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_10"); //IdŸ wiêc szybko.
		DIA_Bandyta_Zanisione.permanent = true;
		dostawa3 = false;
		};
    
	/*
	WTF?????!!!
    if (!Npc_KnowsInfo (hero, DIA_Karczmarz_Wpierdol)) &&  (dostawa1 == true) && (dostawa2 == true)
    {
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_07"); //To ju¿ chyba wszystko.
        AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_08"); //Dobra robota. 
		MIS_Dostawy = LOG_SUCCESS;
		B_GiveXP (300);

    };

*/
/*
	var int alldostawy;
	if (dostawa1 == true) && (dostawa2 == true) 
	{
	alldostawy = true;
	};
	
		if (alldostawy == true)
		{
	    AI_Output (other, self ,"DIA_Bandyta_Zanisione_15_22"); //To ju¿ chyba wszystko.
        AI_Output (self, other ,"DIA_Bandyta_Zanisione_15_23"); //Dobra robota. 
		Log_SetTopicStatus       (CH1_Dostawy, LOG_SUCCESS);
		MIS_Dostawy = LOG_SUCCESS;
		B_GiveXP (150);
		DIA_Bandyta_Zanisione.permanent = false;
		};
};
*/

/*
//========================================
//-----------------> Odtrutka
//========================================

INSTANCE DIA_Bandyta_Odtrutka (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_Odtrutka_Condition;
   information  = DIA_Bandyta_Odtrutka_Info;
   permanent	= FALSE;
   description	= "Potrzebujê odtrutki.";
};

FUNC INT DIA_Bandyta_Odtrutka_Condition()
{
    if (MIS_lekiDlaAva == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Odtrutka_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Odtrutka_15_01"); //Potrzebujê odtrutki.
    AI_Output (self, other ,"DIA_Bandyta_Odtrutka_03_02"); //A co siê sta³o?
    AI_Output (other, self ,"DIA_Bandyta_Odtrutka_15_03"); //Jeden z ³owców Poszukiwaczy zosta³ trafiony truj¹cym be³tem.
    AI_Output (other, self ,"DIA_Bandyta_Odtrutka_15_04"); //Umrze, je¿eli mu nie pomogê.
    AI_Output (self, other ,"DIA_Bandyta_Odtrutka_03_05"); //Móg³bym ci uwarzyæ tê miksturê, ale potrzebujê przepisu.
    B_LogEntry                     (CH1_lekiDlaAva,"Briam uwarzy dla mnie miksturê je¿eli przyniosê mu recepturê.");
};

//========================================
//-----------------> Rezepte
//========================================

INSTANCE DIA_Bandyta_Rezepte (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 2;
   condition    = DIA_Bandyta_Rezepte_Condition;
   information  = DIA_Bandyta_Rezepte_Info;
   permanent	= FALSE;
   description	= "Mam recepturê.";
};

FUNC INT DIA_Bandyta_Rezepte_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_Odtrutka))
    && (Npc_HasItems (other, Receptura_LekAva) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Rezepte_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Rezepte_15_01"); //Mam recepturê.
    AI_Output (self, other ,"DIA_Bandyta_Rezepte_03_02"); //Dobra. Daj mi j¹. Zaraz ci przyrz¹dzê.
    B_LogEntry                     (CH1_lekiDlaAva,"Przynios³em recepturê Briamowi. Zaraz dostanê miksturê.");

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GiveLeki
//========================================

INSTANCE DIA_Bandyta_GiveLeki (C_INFO)
{
   npc          = NON_4051_Bandyta;
   nr           = 3;
   condition    = DIA_Bandyta_GiveLeki_Condition;
   information  = DIA_Bandyta_GiveLeki_Info;
   permanent	= FALSE;
   description	= "Daj mi to lekarstwo.";
};

FUNC INT DIA_Bandyta_GiveLeki_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_Rezepte))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_GiveLeki_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_GiveLeki_15_01"); //Daj mi to lekarstwo.
    AI_Output (self, other ,"DIA_Bandyta_GiveLeki_03_02"); //Oto ono.
    AI_Output (self, other ,"DIA_Bandyta_GiveLeki_03_03"); //Powodzenia.
    CreateInvItems (self, LekAva, 1);
    B_GiveInvItems (self, other, LekAva, 1);
    AI_StopProcessInfos	(self);
};
*/