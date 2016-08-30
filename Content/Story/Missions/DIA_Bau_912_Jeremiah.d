//poprawione i sprawdzone - Nocturn

// ********************************
// 				EXIT
// ********************************

instance DIA_Jeremiah_EXIT (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 999;
	condition	= DIA_Jeremiah_EXIT_Condition;
	information	= DIA_Jeremiah_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Jeremiah_Hallo (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_Hallo_Condition;
	information	= DIA_Jeremiah_Hallo_Info;
	permanent	= 0;
	description = "Co robisz?";
};                       

FUNC int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Hallo_15_00"); //Co robisz?
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //Przygotowujê ry¿ówkê, ch³opcze.
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //Proszê - weŸ sobie jedn¹ butelkê. Tylko nie mów Silasowi.
	
	CreateInvItems	(self, ItFoBooze, 1);
	B_GiveInvItems	(self, other, ItFoBooze, 1);
};

// ********************************
// 				PERM
// ********************************
	var int Jeremiah_Bauer; //NUR lokal benutzt - wegen perm-info-condition Umgehung
// ********************************

instance DIA_Jeremiah_PERM (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_PERM_Condition;
	information	= DIA_Jeremiah_PERM_Info;
	permanent	= 1;
	description = "Jak idzie destylacja?";
};                       

FUNC int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_PERM_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_PERM_15_00"); //Jak idzie destylacja?
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //Przy tych facetach ledwie nad¹¿am z zamówieniami. Ci to potrafi¹ wypiæ!
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //I nawet mi to na rêkê. Przynajmniej psy Ry¿owego Ksiêcia zostawiaj¹ mnie w spokoju.
	
	Jeremiah_Bauer = TRUE;
};

// ********************************
// 				Horatio
// ********************************

instance DIA_Jeremiah_Horatio (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 2;
	condition	= DIA_Jeremiah_Horatio_Condition;
	information	= DIA_Jeremiah_Horatio_Info;
	permanent	= 0;
	description = "Co mo¿esz mi powiedzieæ o Ry¿owym Ksiêciu?";
};                       

FUNC int DIA_Jeremiah_Horatio_Condition()
{
	if (Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Jeremiah_Horatio_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //Co mo¿esz mi powiedzieæ o Ry¿owym Ksiêciu?
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //To zapchlony wieprz! Jego siepacze zmuszaj¹ s³abszych do pracy na polach.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //Jedyna osoba, która mog³aby siê mu przeciwstawiæ to Horacy. Ale on nie lubi przemocy.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //S³ysza³em, jak kiedyœ powiedzia³, ¿e ma ochotê pogruchotaæ Ksiêciu koœci, ale tak naprawdê nigdy by tego nie zrobi³.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //To by by³o wbrew jego zasadom.
};

//========================================
//-----------------> HelpMe
//========================================

INSTANCE DIA_Jeremiah_HelpMe (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 1;
   condition    = DIA_Jeremiah_HelpMe_Condition;
   information  = DIA_Jeremiah_HelpMe_Info;
   permanent	= FALSE;
   description	= "Potrzebujê alkoholu.";
};

FUNC INT DIA_Jeremiah_HelpMe_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_HELLO6))
	&& (MIS_BuntZbieraczy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_HelpMe_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_01"); //Potrzebujê alkoholu.
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_02"); //To sobie kup!
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_03"); //Nie, nie dla siebie.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_04"); //Zbieracze planuj¹ bunt. Chcemy potajemnie w nocy zabiæ Lewusa i Ry¿owego Ksiêcia.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_05"); //Potrzebujemy alkoholu, aby uprzednio ich upiæ.
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_06"); //Chêtnie bym pomóg³, ale Najemnicy regularnie sprawdzaj¹, czy nie da³em nikomu nic za darmo.
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_07"); //Podliczaj¹ ka¿d¹ bry³kê zysku. Licz¹ butelki...
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_08"); //Nie mogê wam pomóc, inaczej zostanê ukarany!
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_09"); //Którzy Najemnicy ciê rewiduj¹?
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_10"); //Torlof, z polecenia Lee.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_11"); //Spróbujê z nim porozmawiaæ.
	Jeremiah_AlcoGiv = false;
    B_LogEntry                     (CH1_BuntZbieraczy,"Jeremiasz nie wyda mi alkoholu, dopóki nie za³atwiê problemu z Najemnikami, którzy licz¹ wszystkie jego dochody. Jeœli odda mi wódkê za darmo, zostanie ukarany. W tym celu muszê pogadaæ z Torlofem.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GiveMeSomeAlco
//========================================

INSTANCE DIA_Jeremiah_GiveMeSomeAlco (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 1;
   condition    = DIA_Jeremiah_GiveMeSomeAlco_Condition;
   information  = DIA_Jeremiah_GiveMeSomeAlco_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z Torlofem. Mo¿esz mi daæ kilka butelek.";
};

FUNC INT DIA_Jeremiah_GiveMeSomeAlco_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jeremiah_HelpMe))
    && (Jeremiah_AlcoGiv == true)
	&& (MIS_BuntZbieraczy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_GiveMeSomeAlco_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_GiveMeSomeAlco_15_01"); //Rozmawia³em z Torlofem. Mo¿esz mi daæ kilka butelek.
    AI_Output (self, other ,"DIA_Jeremiah_GiveMeSomeAlco_03_02"); //Trzymaj. Ju¿ je uwarzy³em.
    AI_Output (self, other ,"DIA_Jeremiah_GiveMeSomeAlco_03_03"); //Tylko uwa¿aj z tym. He he...
    AI_Output (other, self ,"DIA_Jeremiah_GiveMeSomeAlco_15_04"); //Spokojna g³owa.
	//log
    B_LogEntry                     (CH1_BuntZbieraczy,"Dosta³em od Jeremiasza kilka butelek czystego alkoholu. Lewusa i jego ludzi mamy ju¿ w garœci.");
	//items
    CreateInvItems (self, ItMi_Alchemy_Alcohol_01, 12);
    B_GiveInvItems (self, other, ItMi_Alchemy_Alcohol_01, 12);
};

//========================================
//-----------------> BoughtAlco
//========================================

INSTANCE DIA_Jeremiah_BoughtAlco (C_INFO) //#todo: perm check
{
   npc          = Bau_912_Jeremiah;
   nr           = 2;
   condition    = DIA_Jeremiah_BoughtAlco_Condition;
   information  = DIA_Jeremiah_BoughtAlco_Info;
   permanent	= true;
   description	= "[Kup alkohol (100 bry³ek rudy)]";
};

FUNC INT DIA_Jeremiah_BoughtAlco_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_HELLO6))  
    && (If_BuyAlco_Jer == false)
	&& (MIS_BuntZbieraczy == LOG_RUNNING)
	{
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_BoughtAlco_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_BoughtAlco_15_01"); //Kupiê ten alkohol za swoj¹ rudê.
    if (Npc_HasItems (hero, ItMiNugget)>=100)
    {
        AI_Output (self, other ,"DIA_Jeremiah_BoughtAlco_03_02"); //Proszê bardzo.
        CreateInvItems (self, ItMi_Alchemy_Alcohol_01, 12);
        B_GiveInvItems (self, other, ItMi_Alchemy_Alcohol_01, 12);
        B_GiveInvItems (other, self, ItMiNugget, 100);
        If_BuyAlco_Jer = true;
        B_LogEntry                     (CH1_BuntZbieraczy,"Dosta³em od Jeremiasza kilka butelek czystego alkoholu. Lewusa i jego ludzi mamy ju¿ w garœci.");
    }
    else
    {
        AI_Output (self, other ,"DIA_Jeremiah_BoughtAlco_03_03"); //Nie widzê tu stu bry³ek. Próbujesz mnie oszukaæ?
        If_BuyAlco_Jer = false;
    };
};

//========================================
//-----------------> MOCNA_WODA
//========================================

INSTANCE DIA_Jeremiah_MOCNA_WODA (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 1;
   condition    = DIA_Jeremiah_MOCNA_WODA_Condition;
   information  = DIA_Jeremiah_MOCNA_WODA_Info;
   permanent	= FALSE;
   description	= "Potrafisz przyrz¹dziæ jakiœ specjalny trunek?";
};

FUNC INT DIA_Jeremiah_MOCNA_WODA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_HANDEL_ZEW))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_MOCNA_WODA_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_01"); //Potrafisz przyrz¹dziæ jakiœ specjalny trunek?
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_02"); //Specjalny? Mówisz o czymœ znacznie lepszym od ry¿ówki?
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_03"); //Owszem.
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_04"); //Znam pewien przepis, jednak nie posiadam wszystkich sk³adników.
	//klasyg!
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_05"); //Cholera, znowu bêdê musia³ biegaæ po ca³ej Kolonii.
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_06"); //Spokojnie, wszystko mogê kupiæ na miejscu, jednak potrzebujê 50 bry³ek rudy.
	//log
    B_LogEntry                     (CH1_SzponyTopielca,"Jeremiasz mo¿e przygotowaæ specjalny napój alkoholowy, jednak potrzebuje 50 bry³ek rudy na sk³adniki.");
	//exp
    B_GiveXP (50);
};

//========================================
//-----------------> ORE_50
//========================================

INSTANCE DIA_Jeremiah_ORE_50 (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 2;
   condition    = DIA_Jeremiah_ORE_50_Condition;
   information  = DIA_Jeremiah_ORE_50_Info;
   permanent	= FALSE;
   description	= "Oto 50 bry³ek rudy.";
};

FUNC INT DIA_Jeremiah_ORE_50_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jeremiah_MOCNA_WODA))
    && (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_ORE_50_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_ORE_50_15_01"); //Oto 50 bry³ek rudy.
    AI_Output (self, other ,"DIA_Jeremiah_ORE_50_03_02"); //Wróæ jutro, przyrz¹dzenie tego napoju mo¿e zaj¹æ sporo czasu.
    B_LogEntry                     (CH1_SzponyTopielca,"Jeremiasz zajmie siê wszystkim. Napój powinien byæ gotowy na jutro.");
	dzien_Jeremiash =	wld_getday();
	B_GiveInvItems (other, self, ItMiNugget, 50);
};

//========================================
//-----------------> WODA_TROLO
//========================================

INSTANCE DIA_Jeremiah_WODA_TROLO (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 3;
   condition    = DIA_Jeremiah_WODA_TROLO_Condition;
   information  = DIA_Jeremiah_WODA_TROLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jeremiah_WODA_TROLO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jeremiah_ORE_50))
    && (dzien_Jeremiash != wld_getday())
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_WODA_TROLO_Info()
{
    AI_Output (self, other ,"DIA_Jeremiah_WODA_TROLO_03_01"); //Pracowa³em przez wiêkszoœæ nocy, ale przeszed³em samego siebie. Ten trunek to po prostu raj zamkniêty w butelce. Oto napój. Uwa¿aj na niego, jest wart fortunê.
    B_LogEntry                     (CH1_SzponyTopielca,"Ten napój wygl¹da smakowicie... Lepiej udam siê od razu do Bartholo. Mam nadziejê, ¿e przypadnie mu do gustu.");
	CreateInvItems (self, JeremiahMoonshine, 1);
    B_GiveInvItems (self, other, JeremiahMoonshine, 1);
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};