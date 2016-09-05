//DIALOGI POPRAWIONE I SPRAWDZONE JÊZYKOWO //g1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Josep_EXIT(C_INFO)
{
	npc             = NON_5614_Josep;
	nr              = 999;
	condition	= DIA_Josep_EXIT_Condition;
	information	= DIA_Josep_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Josep_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Josep_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WODA
//========================================

INSTANCE DIA_Josep_WODA (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_WODA_Condition;
   information  = DIA_Josep_WODA_Info;
   permanent	= TRUE;
   description	= "Przynios³em ci wodê.";
};

FUNC INT DIA_Josep_WODA_Condition()
{
    if ((Lefty_Mission==LOG_RUNNING) || (Lefty_Mission==LOG_SUCCESS)) && Npc_HasItems(other, ItFo_Potion_Water_01) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	&& (!Npc_KnowsInfo (hero, DIA_Josep_Free))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_WODA_Info()
{
    AI_Output (other, self ,"DIA_Josep_WODA_15_01"); //Przynios³em ci wodê.
  if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
    {
    AI_Output (self, other ,"DIA_Josep_WODA_03_02"); //O, dziêki. Umieram z pragnienia!
B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;  
    }
    else
    {
        AI_Output (self, other ,"DIA_Josep_WODA_03_03"); //Przecie¿ nie masz wody! Próbujesz ze mnie ¿artowaæ?!
    };
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Josep_HELLO1 (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_HELLO1_Condition;
   information  = DIA_Josep_HELLO1_Info;
   permanent	= FALSE;
   description	= "Nie wygl¹dasz mi na zbieracza.";
};

FUNC INT DIA_Josep_HELLO1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_NewQuest))
	&& (MIS_BuntZbieraczy != LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Josep_HELLO1_15_01"); //Nie wygl¹dasz mi na zbieracza.
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_02"); //Bo nim nie jestem. Zosta³em z³apany przez ludzi Lewusa.
    AI_Output (other, self ,"DIA_Josep_HELLO1_15_03"); //Alex wspomina³ mi o zaginionym myœliwym... Nazywasz siê Josep?
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_04"); //Tak, to ja. Szkoda, ¿e tak póŸno zorientowali siê, ¿e mnie nie ma. Banda sukinsynów!
    AI_Output (other, self ,"DIA_Josep_HELLO1_15_05"); //Przecie¿ przyby³em ci z pomoc¹.
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_06"); //No i co z tego? Przecie¿ nie jesteœ myœliwym. Ledwo mnie znasz! A czy, któryœ z moich rzekomych przyjació³ siê mn¹ przej¹³? 
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_07"); //Nie! Wys³ali pierwszego lepszego przyb³êdê na poszukiwanie zw³ok. Pewnie Alex liczy³, ¿e znajdziesz przy mnie amulet.
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_08"); //O nie! Ten amulet jest mój!
    AI_Output (other, self ,"DIA_Josep_HELLO1_15_09"); //Uspokój siê! Chcesz siê st¹d wydostaæ czy nie?
    AI_PlayAni (self, "T_SEARCH");
    //AI_StartState (self, ZS_SitCampfire, 1, "");
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_10"); //Och. Moja g³owa... strasznie boli.
    AI_Output (other, self ,"DIA_Josep_HELLO1_15_11"); //Co z tob¹?
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_12"); //O czym to my... A, ju¿ wiem. Wydostaæ siê st¹d.
    AI_Output (other, self ,"DIA_Josep_HELLO1_15_13"); //Jakiœ pomys³? Mo¿e po prostu zacznijmy biec. Wskoczmy do jeziora i pop³yñmy wraz z pr¹dem?
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_14"); //To by by³o zbyt proste. Pos³uchaj: jestem tu od tygodnia, wiem jak wygl¹da ¿ycie ludzi, którzy s¹ wyzyskiwani.
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_15"); //Musimy im pomóc zanim odejdziemy. To nasz cel. 
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_16"); //Jeden ze zbieraczy... nazywa siê Horacy... tak, on, planuje bunt. Krwawe powstanie przeciw siepaczom Lewusa. 
    AI_Output (self, other ,"DIA_Josep_HELLO1_03_17"); //Musisz mu pomóc.

    B_LogEntry                     (CH1_JosepZniknal,"Znalaz³em Josepa w Nowym Obozie. Zosta³ schwytany przez ludzi Lewusa i zmuszony do pracy na polach ry¿owych. Mam porozmawiaæ z Horacym i wypytaæ go o bunt zbieraczy.");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Free
//========================================
//edit by Nocturn
INSTANCE DIA_Josep_Free (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Free_Condition;
   information  = DIA_Josep_Free_Info;
   permanent	= FALSE;
   description	= "Jesteœ wolny!";
};

FUNC INT DIA_Josep_Free_Condition()
{
    if (MIS_BuntZbieraczy == LOG_SUCCESS)
    && (MIS_JosepZniknal == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Free_Info()
{
    AI_Output (other, self ,"DIA_Josep_Free_15_01"); //Jesteœ wolny!
    AI_Output (self, other ,"DIA_Josep_Free_03_02"); //Uda³o nam siê, naprawdê uda³o. Dobra robota. Bez ciebie nie dalibyœmy rady.

    AI_Output (other, self ,"DIA_Josep_Free_15_03"); //Mo¿esz ju¿ wróciæ do obozu.
    AI_Output (self, other ,"DIA_Josep_Free_03_04"); //Wróciæ? Do tych fa³szywych sukinsynów! Do tych darmozjadów?!
    AI_Output (other, self ,"DIA_Josep_Free_15_05"); //Co z tob¹?
    AI_PlayAni (self, "T_SEARCH");
    //AI_StartState (self, ZS_SitCampfire, 1, "");
    AI_Output (self, other ,"DIA_Josep_Free_03_06"); //Eh... Nic. To pewnie zmêczenie...
    AI_Output (other, self ,"DIA_Josep_Free_15_07"); //Pewnie tak. Wracaj ju¿ do obozu i odpocznij.
    Npc_ExchangeRoutine (self, "camp");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Sledztwo
//========================================

INSTANCE DIA_Josep_Sledztwo (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Sledztwo_Condition;
   information  = DIA_Josep_Sledztwo_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Josep_Sledztwo_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_Podejrzane))
    && (Npc_GetDistToNpc(self, other) <= 800)
	&& (Npc_GetDistToWP (self, "JOSEP2") > 1000)
	&& (Npc_GetDistToWP (self, "SPAWN_OW_BLOODFLY_12") > 1800)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Sledztwo_Info()
{
    AI_Output (self, other ,"DIA_Josep_Sledztwo_03_01"); //Cholera, przestañ za mn¹ ³aziæ! 
    AI_Output (self, other ,"DIA_Josep_Sledztwo_03_02"); //Pomog³eœ mi, dziêkujê, ale teraz odejdŸ!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Sledztwo2
//========================================

INSTANCE DIA_Josep_Sledztwo2 (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Sledztwo2_Condition;
   information  = DIA_Josep_Sledztwo2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Josep_Sledztwo2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Josep_Sledztwo))
    && (Npc_GetDistToNpc(self, other) <= 800)
	&& (Npc_GetDistToWP (self, "JOSEP2") > 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Sledztwo2_Info()
{
    AI_Output (self, other ,"DIA_Josep_Sledztwo2_03_01"); //To moje ostatnie ostrze¿enie!
    AI_Output (self, other ,"DIA_Josep_Sledztwo2_03_02"); //Zje¿d¿aj, albo po¿a³ujesz! 
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Sledztwo3
//========================================

INSTANCE DIA_Josep_Sledztwo3 (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Sledztwo3_Condition;
   information  = DIA_Josep_Sledztwo3_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Josep_Sledztwo3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Josep_Sledztwo2))
    && (Npc_GetDistToNpc(self, other) <= 800)
	&& (Npc_GetDistToWP (self, "JOSEP2") > 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Sledztwo3_Info()
{
    AI_Output (self, other ,"DIA_Josep_Sledztwo3_03_01"); //Cholera, daj mi wreszcie spokój! Wracam do obozu!

	Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
	
	B_LogEntry                     (CH1_DziwnyJosep,"Podczas œledzenia Josepa da³em siê trzykrotnie przy³apaæ, wiêc Josep wróci³ do obozu. Od teraz bêdzie mnie obserwowa³ i nie bêdê mia³ ju¿ okazji go œledziæ.");
    Log_SetTopicStatus       (CH1_DziwnyJosep, LOG_FAILED);
    MIS_DziwnyJosep = LOG_FAILED;
};

//========================================
//-----------------> NieDales
//========================================

INSTANCE DIA_Josep_NieDales (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 2;
   condition    = DIA_Josep_NieDales_Condition;
   information  = DIA_Josep_NieDales_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Josep_NieDales_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_Podejrzane))
	 && (Npc_GetDistToWP (self, "JOSEP2") < 600)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_NieDales_Info()
{
    AI_Output (self, other ,"DIA_Josep_NieDales_03_01"); //Nie mog³eœ siê powstrzymaæ... Musia³eœ za mn¹ iœæ. Jesteœ bardzo dociekliwym cz³owiekiem.
    AI_Output (self, other ,"DIA_Josep_NieDales_03_02"); //Pewnie nie raz nieŸle na tym wyszed³eœ, ale teraz... teraz sprowadzi³eœ na siebie zgubê!
    AI_Output (self, other ,"DIA_Josep_NieDales_03_03"); //Pewnie wiesz ju¿ o amulecie, który znalaz³em. Czy¿ nie?
    AI_Output (other, self ,"DIA_Josep_NieDales_15_04"); //Masz racjê. Alex mi powiedzia³.
    AI_Output (self, other ,"DIA_Josep_NieDales_03_05"); //Ten amulet pozwoli³ mi posi¹œæ moc samego Beliara. Dysponujê teraz mocami, które s¹ obce nawet niektórym magom!
    AI_Output (other, self ,"DIA_Josep_NieDales_15_06"); //Nie jesteœ sob¹! Musisz mi oddaæ ten amulet. To nie jest rzecz dla ciebie. 
    AI_Output (self, other ,"DIA_Josep_NieDales_03_07"); //NIGDY!

	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> Normalny
//========================================

INSTANCE DIA_Josep_Normalny (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Normalny_Condition;
   information  = DIA_Josep_Normalny_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Josep_Normalny_Condition()
{
    if (!Npc_HasItems (self, JosepSamulet) >=1)
    && (Npc_KnowsInfo (hero, DIA_Josep_NieDales))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Normalny_Info()
{
	AI_Output (self, other ,"DIA_Josep_Normalny_03_01"); //Och, moja g³owa! Czujê siê dziwnie... Jakbyœ siê czegoœ ze mnie pozby³...
    AI_Output (other, self ,"DIA_Josep_Normalny_15_02"); //To moja specjalnoœæ.
    AI_Output (self, other ,"DIA_Josep_Normalny_03_03"); //Pamiêtam... tak ju¿ pamiêtam co wydarzy³o siê w ruinach. S³ysza³em g³os, g³os przypominaj¹cy modlitwy ludzi z Bractwa...
    AI_Output (self, other ,"DIA_Josep_Normalny_03_04"); //Hipnotyzuj¹cy g³os...
    AI_Output (other, self ,"DIA_Josep_Normalny_15_05"); //Spokojnie. Nie ma go tu.
    AI_Output (self, other ,"DIA_Josep_Normalny_03_06"); //Wreszcie czujê ulgê. WeŸ te rudê. To wszystko co mam. Nie chcê ju¿ widzieæ tego amuletu na oczy! Wyrzuæ go!
	AI_Output (other, self ,"DIA_Josep_Normalny_15_07"); //Nastêpnym razem poluj w bezpieczniejszych miejscach. Stare ruiny nie s¹ najlepszym miejscem na spacerek. 

    CreateInvItems (self, ItMiNugget, 30);
    B_GiveInvItems (self, other, ItMiNugget, 30);
    B_LogEntry                     (CH1_DziwnyJosep,"Zabieraj¹c amulet Josepa oczyœci³em jego umys³ spod w³adzy z³ych mocy. Muszê teraz coœ zrobiæ z tym amuletem. ");
    Log_SetTopicStatus       (CH1_DziwnyJosep, LOG_SUCCESS);
    MIS_DziwnyJosep = LOG_SUCCESS;

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "camp2");
};