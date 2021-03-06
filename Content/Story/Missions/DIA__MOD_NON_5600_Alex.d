// *Script was make in Easy Dialog Maker (EDM)
//sprawdzone, poprawione g1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Alex_EXIT(C_INFO)
{
	npc             = NON_5600_Alex;
	nr              = 999;
	condition	= DIA_Alex_EXIT_Condition;
	information	= DIA_Alex_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Alex_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Alex_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Alex_HELLO1 (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_HELLO1_Condition;
   information  = DIA_Alex_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Alex_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Alex_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Alex_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Alex_HELLO1_03_02"); //Nazywam si� Alex. Dbam o to, by w obozie panowa� spok�j. 
    AI_Output (other, self ,"DIA_Alex_HELLO1_15_03"); //Jeste� tu szefem?
    AI_Output (self, other ,"DIA_Alex_HELLO1_03_04"); //Szef to za mocne s�owo. Po prostu ogarniam co si� tu dzieje.
};

//========================================
//-----------------> Skup
//========================================

INSTANCE DIA_Alex_Skup (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Skup_Condition;
   information  = DIA_Alex_Skup_Info;
   permanent	= FALSE;
   description	= "Skupujecie trofea?";
};

FUNC INT DIA_Alex_Skup_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Alex_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Alex_Skup_Info()
{
    AI_Output (other, self ,"DIA_Alex_Skup_15_01"); //Skupujecie trofea?
    AI_Output (self, other ,"DIA_Alex_Skup_03_02"); //Jasne! Je�eli masz na sprzeda� sk�ry wilk�w lub mi�so, mo�esz je tutaj przynie��.
    AI_Output (self, other ,"DIA_Alex_Skup_03_03"); //Mi�so skupujemy tylko w wi�kszych ilo�ciach.
    AI_Output (self, other ,"DIA_Alex_Skup_03_04"); //50 sztuk mi�sa za 100 bry�ek rudy.
	AI_Output (self, other ,"DIA_Alex_Skup_03_05"); //Je�li chodzi o sk�ry, to p�ac� 200 bry�ek za 30 sztuk.
	Log_CreateTopic 	(GE_Skup,LOG_NOTE);
	B_LogEntry			(GE_Skup,"Alex skupuje futra (200 bry�ek za 30 sztuk) i mi�so (100 bry�ek za 50 sztuk. Mo�na go znale�� w obozie my�liwych.");
    
};

//========================================
//-----------------> SellSkins
//========================================

INSTANCE DIA_Alex_SellSkins (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 2;
   condition    = DIA_Alex_SellSkins_Condition;
   information  = DIA_Alex_SellSkins_Info;
   permanent	= TRUE;
   description	= "Chc� sprzeda� sk�ry.";
};

FUNC INT DIA_Alex_SellSkins_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_Skup))
    && (Npc_HasItems (other, ItAt_Wolf_01) >=30)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_SellSkins_Info()
{
    AI_Output (other, self ,"DIA_Alex_SellSkins_15_01"); //Chc� sprzeda� sk�ry.
    AI_Output (self, other ,"DIA_Alex_SellSkins_03_02"); //Jasne. Oto twoja zap�ata.
    B_GiveInvItems (other, self, ItAt_Wolf_01, 30);
	Npc_RemoveInvItems (self, ItAt_Wolf_01, 30);
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    B_giveXP (150);
};

//========================================
//-----------------> SellMeat
//========================================

INSTANCE DIA_Alex_SellMeat (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 3;
   condition    = DIA_Alex_SellMeat_Condition;
   information  = DIA_Alex_SellMeat_Info;
   permanent	= TRUE;
   description	= "Chc� sprzeda� mi�so.";
};

FUNC INT DIA_Alex_SellMeat_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_Skup))
    && (Npc_HasItems (other, ItFoMuttonRaw) >=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_SellMeat_Info()
{
    AI_Output (other, self ,"DIA_Alex_SellMeat_15_01"); //Chc� sprzeda� mi�so.
    AI_Output (self, other ,"DIA_Alex_SellMeat_03_02"); //Oto obiecana zap�ata.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    B_GiveInvItems (other, self, ItFoMuttonRaw, 50);
	Npc_RemoveInvItems (self, ItFoMuttonRaw, 50);
    B_giveXP (75);
};

var int meat_oddane;
//========================================
//-----------------> Armor
//========================================

INSTANCE DIA_Alex_Armor (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Armor_Condition;
   information  = DIA_Alex_Armor_Info;
   permanent	= FALSE;
   description	= "Sprzedasz mi jaki� pancerz?";
};

FUNC INT DIA_Alex_Armor_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Alex_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Alex_Armor_Info()
{
    AI_Output (other, self ,"DIA_Alex_Armor_15_01"); //Sprzedasz mi jaki� pancerz?
    if (MIS_PorwanieAlexa == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Alex_Armor_03_02"); //Mam na stanie zar�wno ubranie, jak i zbroj�.
        AI_Output (self, other ,"DIA_Alex_Armor_03_03"); //Wybierz sobie, kt�re ci odpowiada.
    }
    else
    {
        AI_Output (self, other ,"DIA_Alex_Armor_03_04"); //Tobie? Ledwo ci� znam.
        AI_Output (other, self ,"DIA_Alex_Armor_15_05"); //A wi�c najwy�szy czas mnie pozna�!
        AI_Output (self, other ,"DIA_Alex_Armor_03_06"); //No dobra, spr�bujmy. Sprzedam ci moje stare ubranie, je�li popracujesz troch� na rzecz obozu.
        AI_Output (other, self ,"DIA_Alex_Armor_15_07"); //Co jest do zrobienia?
        AI_Output (self, other ,"DIA_Alex_Armor_03_08"); //Najpierw we� to mi�so i usma� je porz�dnie na patelni. Ja nie mam na to czasu. Pami�taj, �eby mi je potem odnie��!
        AI_Output (self, other ,"DIA_Alex_Armor_03_09"); //Gdy ju� to zrobisz, pogadaj z Firnem. Trzeba naprawi� palisad� w obozie.
        AI_Output (self, other ,"DIA_Alex_Armor_03_10"); //Na koniec pomo�esz Stanleyowi uzupe�ni� ekwipunek. Z tego co mi wiadomo, potrzebne mu jest 50 strza�. 
        MIS_PracaUMysliwych = LOG_RUNNING;
		meat_oddane = false;
        Log_CreateTopic          (CH1_PracaUMysliwych, LOG_MISSION);
        Log_SetTopicStatus       (CH1_PracaUMysliwych, LOG_RUNNING);
        B_LogEntry               (CH1_PracaUMysliwych,"Je�eli chc� dosta� ubranie my�liwego, b�d� musia� na nie zapracowa�. Mam usma�y� mi�so i odnie�� je do Alexa, naprawi� palisad� razem z Firnem i przynie�� Stanleyowi 50 strza�. ");
        CreateInvItems (self, ItFoMuttonRaw, 30);
        B_GiveInvItems (self, other, ItFoMuttonRaw, 30);
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Mutton
//========================================

INSTANCE DIA_Alex_Mutton (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 2;
   condition    = DIA_Alex_Mutton_Condition;
   information  = DIA_Alex_Mutton_Info;
   permanent	= FALSE;
   description	= "Mam 30 sztuk sma�onego mi�sa. ";
};

FUNC INT DIA_Alex_Mutton_Condition()
{
    if (meat_oddane == false)
    && (MIS_PracaUMysliwych == LOG_RUNNING)
    && (Npc_HasItems (other, ItFoMutton) >=30)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Mutton_Info()
{
    AI_Output (other, self ,"DIA_Alex_Mutton_15_01"); //Mam 30 sztuk sma�onego mi�sa. 
    AI_Output (self, other ,"DIA_Alex_Mutton_03_02"); //Dobra robota. Uwielbiam sma�one mi�so. 
    B_LogEntry                     (CH1_PracaUMysliwych,"Alex otrzyma� swoje mi�so. ");
	meat_oddane = true;
    B_GiveXP (25);
    B_GiveInvItems (other, self, ItFoMutton, 30);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RobotaENDE
//========================================

INSTANCE DIA_Alex_RobotaENDE (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_RobotaENDE_Condition;
   information  = DIA_Alex_RobotaENDE_Info;
   permanent	= FALSE;
   description	= "Zrobi�em co kaza�e�.";
};

FUNC INT DIA_Alex_RobotaENDE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_palisadaSkonczone))
    && (Npc_KnowsInfo (hero, DIA_Stanley_Arrows))
    && (Npc_KnowsInfo (hero, DIA_Alex_Mutton))
    && (MIS_PracaUMysliwych == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_RobotaENDE_Info()
{
    AI_Output (other, self ,"DIA_Alex_RobotaENDE_15_01"); //Zrobi�em co kaza�e�.
    AI_Output (self, other ,"DIA_Alex_RobotaENDE_03_02"); //Dobra robota! Ob�z wreszcie wygl�da jak trzeba. Teraz mog� ci sprzeda� ubranie za 300 bry�ek rudy.
    B_LogEntry                     (CH1_PracaUMysliwych,"Zadania zosta�y wykonane. Wreszcie mog� kupi� nowy pancerz za niewielk� cen�. ");
    Log_SetTopicStatus       (CH1_PracaUMysliwych, LOG_SUCCESS);
    MIS_PracaUMysliwych = LOG_SUCCESS;
    B_GiveXP (200);
};


//========================================
//-----------------> GiveSArmor
//========================================

INSTANCE DIA_Alex_GiveSArmor (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 4;
   condition    = DIA_Alex_GiveSArmor_Condition;
   information  = DIA_Alex_GiveSArmor_Info;
   permanent	= FALSE;
   description	= "Daj mi ubranie my�liwego (300 bry�ek rudy)";
};

FUNC INT DIA_Alex_GiveSArmor_Condition()
{
    if (MIS_PracaUMysliwych == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_GiveSArmor_Info()
{
    AI_Output (other, self ,"DIA_Alex_GiveSArmor_15_01"); //Daj mi ubranie my�liwego.
    if (Npc_HasItems (hero, ItMiNugget)>=300)
    {
        AI_Output (self, other ,"DIA_Alex_GiveSArmor_03_02"); //Jasne. Jest twoje. 
        B_GiveInvItems (other, self, ItMiNugget, 300);
		CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	CreateInvItem		(hero,HUN_ARMOR_L);
	AI_EquipBestArmor	(hero); 
	DIA_Alex_GiveSArmor.permanent = false;
//HUN_ARMOR_L   
 }
    else
    {
        AI_Output (self, other ,"DIA_Alex_GiveSArmor_03_03"); //Nie ma rudy, nie ma pancerza.
        DIA_Alex_GiveSArmor.permanent = true;
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SrongArmor
//========================================

INSTANCE DIA_Alex_SrongArmor (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 3;
   condition    = DIA_Alex_SrongArmor_Condition;
   information  = DIA_Alex_SrongArmor_Info;
   permanent	= FALSE;
   description	= "Co z ci�szym pancerzem?";
};

FUNC INT DIA_Alex_SrongArmor_Condition()
{
    if (MIS_PracaUMysliwych == LOG_SUCCESS) && (kapitel >= 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_SrongArmor_Info()
{
    AI_Output (other, self ,"DIA_Alex_SrongArmor_15_01"); //Co z ci�szym pancerzem?
    AI_Output (self, other ,"DIA_Alex_SrongArmor_03_02"); //Aby go dosta�, b�dziesz musia� rozwi�za� spraw� pewnej kradzie�y.
    AI_Output (other, self ,"DIA_Alex_SrongArmor_15_03"); //Kradzie�y? 
    AI_Output (self, other ,"DIA_Alex_SrongArmor_03_04"); //Ostatnio z obozu zgin�y cenne b�yskotki. M�j puchar i pier�cie� Clawa. 
    AI_Output (self, other ,"DIA_Alex_SrongArmor_03_05"); //Nie podoba mi si� to. Czy�by w obozie by� zdrajca?
    AI_Output (other, self ,"DIA_Alex_SrongArmor_15_06"); //Postaram si� to ustali�.
    MIS_KradziezUMysliwych = LOG_RUNNING;
	
    Log_CreateTopic          (CH1_KradziezUMysliwych, LOG_MISSION);
    Log_SetTopicStatus       (CH1_KradziezUMysliwych, LOG_RUNNING);
    B_LogEntry               (CH1_KradziezUMysliwych,"Ostatniej nocy z obozu my�liwych zagin�y dwa cenne przedmioty: puchar Alexa i pier�cie� my�liwego Clawa. Nie wiadomo kto stoi za kradzie��. ");
};

//========================================
//-----------------> CenneItemy
//========================================

INSTANCE DIA_Alex_CenneItemy (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_CenneItemy_Condition;
   information  = DIA_Alex_CenneItemy_Info;
   permanent	= FALSE;
   description	= "Znalaz�em wasze b�yskotki.";
};

FUNC INT DIA_Alex_CenneItemy_Condition()
{
    if (Npc_HasItems (other, AlexCup) >=1)
   // && (Npc_HasItems (other, ClawsRing) >=1)
    && (MIS_KradziezUMysliwych == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_CenneItemy_Info()
{
    AI_Output (other, self ,"DIA_Alex_CenneItemy_15_01"); //Znalaz�em wasze b�yskotki.
    AI_Output (self, other ,"DIA_Alex_CenneItemy_03_02"); //Naprawd� ci si� to uda�o? Czy to by� jeden z moich ludzi?
    AI_Output (other, self ,"DIA_Alex_CenneItemy_15_03"); //Nie. Zosta�y porwane przez gobliny. Znalaz�em je w skrzyni znajduj�cej si� w jaskini nieopodal obozu. 
    AI_Output (self, other ,"DIA_Alex_CenneItemy_03_04"); //Jak to mo�liwe, �e te bestyjki zakrad�y si� do obozu?
    AI_Output (other, self ,"DIA_Alex_CenneItemy_15_05"); //Firn jest tylko cz�owiekiem. Mo�liwe, �e przysn��. 
    AI_Output (self, other ,"DIA_Alex_CenneItemy_03_06"); //Hmm... No dobrze. W nagrod� sprzedam ci zbroj� my�liwego za 1300 bry�ek rudy. 
    B_LogEntry                     (CH1_KradziezUMysliwych,"Zagadka rozwi�zana. Przedmioty zosta�y skradzione przez gobliny z jaskini przy obozie. ");
    Log_SetTopicStatus       (CH1_KradziezUMysliwych, LOG_SUCCESS);
    MIS_KradziezUMysliwych = LOG_SUCCESS;
	B_GiveInvItems (hero, self, AlexCup, 1);
    B_GiveXP (400);
};

//========================================
//-----------------> GivMeHArmor
//========================================
var int zbroja_mysliwego_buy;
INSTANCE DIA_Alex_GivMeHArmor (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 2;
   condition    = DIA_Alex_GivMeHArmor_Condition;
   information  = DIA_Alex_GivMeHArmor_Info;
   permanent	= true;
   description	= "Daj mi zbroj� my�liwego (1300 bry�ek rudy)";
};

FUNC INT DIA_Alex_GivMeHArmor_Condition()
{
    if (MIS_KradziezUMysliwych == LOG_SUCCESS) && (zbroja_mysliwego_buy == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_GivMeHArmor_Info()
{
    AI_Output (other, self ,"DIA_Alex_GivMeHArmor_15_01"); //Daj mi zbroj� my�liwego.
	if (Kapitel == 1)
	{
	AI_Output (self, other ,"DIA_Alex_GivMeHArmor_03_05"); //Niestety ju� nam si� sko�czy�y. Przyjd� p�niej, gdy uszyjemy jeszcze kilka.
	DIA_Alex_GivMeHArmor.permanent = true;//fix er 1.4
	}
	else 
	{
    if (Npc_HasItems (hero, ItMiNugget)>=1300)
    {
        AI_Output (self, other ,"DIA_Alex_GivMeHArmor_03_02"); //We� j�. Nale�y ci si�.
        AI_Output (other, self ,"DIA_Alex_GivMeHArmor_15_03"); //Za tak� ilo�� rudy, to mi si� wiele rzeczy nale�y...
	B_GiveInvItems (other, self, ItMiNugget, 1300);
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	CreateInvItem		(other,NON_WOLF_ARMOR);
	AI_EquipBestArmor	(other); 
	DIA_Alex_GivMeHArmor.permanent = false;
	zbroja_mysliwego_buy = true;
    }
    else
    {
        AI_Output (self, other ,"DIA_Alex_GivMeHArmor_03_04"); //Nie masz tyle rudy. Zbierz jeszcze troch� bry�ek. 
		DIA_Alex_GivMeHArmor.permanent = true;
    };
	};
};

//========================================
//-----------------> Skargi
//========================================

INSTANCE DIA_Alex_Skargi (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Skargi_Condition;
   information  = DIA_Alex_Skargi_Info;
   permanent	= FALSE;
   description	= "Jonas skar�y si�, �e my�liwi pracuj� powoli.";
};

FUNC INT DIA_Alex_Skargi_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jonas_HELLO3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Skargi_Info()
{
    AI_Output (other, self ,"DIA_Alex_Skargi_15_01"); //Jonas skar�y si�, �e my�liwi pracuj� powoli.
    AI_Output (self, other ,"DIA_Alex_Skargi_03_02"); //Nic mi o tym nie wiadomo. 
    AI_Output (self, other ,"DIA_Alex_Skargi_03_03"); //Mo�e spr�buj z nimi porozmawia�.
};

//========================================
//-----------------> Narzekanie
//========================================

INSTANCE DIA_Alex_Narzekanie (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Narzekanie_Condition;
   information  = DIA_Alex_Narzekanie_Info;
   permanent	= FALSE;
   description	= "Jeden z my�liwych strasznie na ciebie narzeka.";
};

FUNC INT DIA_Alex_Narzekanie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hunter_HELLO1))
    && (MIS_Nieroby == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Narzekanie_Info()
{
    AI_Output (other, self ,"DIA_Alex_Narzekanie_15_01"); //Jeden z my�liwych strasznie na ciebie narzeka.
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_02"); //H�?
    AI_Output (other, self ,"DIA_Alex_Narzekanie_15_03"); //Za��da� z�ota za prac� przy drewnie. Ponadto powiedzia�, �e powinni�my szuka� kopalni z�ota, a nie zajmowa� si� zwierzyn�.
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_04"); //Nie d��� za bogactwem. Powiedz mi ile tutaj jest warte z�oto? Co nam po tym, �e zgromadzimy kufry ze z�otem skoro nawet go nie wykorzystamy.
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_05"); //Zdechniemy broni�c kilku �wiecide�ek przed pazernymi Stra�nikami. Czy to ma sens?
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_06"); //Nie lepiej wykorzysta� to co daje nam natura? Owoc pracy trzech bog�w. 
    if (Npc_KnowsInfo (hero, DIA_Hunter_HELLO3))
    {
        AI_Output (other, self ,"DIA_Alex_Narzekanie_15_07"); //Masz racj�. Nauczy�em ju� tego nieroba szacunku.
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_08"); //Pobi�e� go? �le post�pi�e�.
        AI_Output (other, self ,"DIA_Alex_Narzekanie_15_09"); //Dlaczego? Nale�a�o mu si�.
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_10"); //Zachowujecie si� jak dzieci w paskownicy. Nikt go tu nie trzyma. Je�eli nie chce pracowa� na rzecz obozu, to niech st�d zje�d�a. Mog�e� kaza� mu po prostu odej��.
    }
    else
    {
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_11"); //Nie b�d� ci� zanudza�. Id� do tego cz�owieka i powiedz mu, �e nie ma ju� czego szuka� w obozie.
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_12"); //Niech odejdzie. Nie potrzebujemy tu darmozjad�w.
        AI_Output (other, self ,"DIA_Alex_Narzekanie_15_13"); //Tak zrobi�.

        B_LogEntry                     (CH1_Nieroby,"Mam kaza� odej�� my�liwemu. ");
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NewQuest
//========================================

INSTANCE DIA_Alex_NewQuest (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 9;
   condition    = DIA_Alex_NewQuest_Condition;
   information  = DIA_Alex_NewQuest_Info;
   permanent	= FALSE;
   description	= "Nie jest was tu troch� za ma�o?";
};

FUNC INT DIA_Alex_NewQuest_Condition()
{
    if (Npc_KnowsInfo (hero,DIA_Alex_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_NewQuest_Info()
{
    AI_Output (other, self ,"DIA_Alex_NewQuest_15_01"); //Nie jest was tu troch� za ma�o?
    AI_Output (self, other ,"DIA_Alex_NewQuest_03_02"); //Mieli�my jeszcze jednego cz�owieka, ale przepad�. Zazwyczaj polowa� w okolicach Nowego Obozu.
    AI_Output (other, self ,"DIA_Alex_NewQuest_15_03"); //Jak d�ugo ju� go nie ma?
    AI_Output (self, other ,"DIA_Alex_NewQuest_03_04"); //Nie wiem... Mo�e tydzie�. Nazywa� si� Josep. Jakby� go znalaz�, to daj mi zna�.

    MIS_JosepZniknal = LOG_RUNNING;

    Log_CreateTopic            (CH1_JosepZniknal, LOG_MISSION);
    Log_SetTopicStatus       (CH1_JosepZniknal, LOG_RUNNING);
    B_LogEntry                     (CH1_JosepZniknal,"Z obozu znikn�� jeden z my�liwych. Od Alexa dowiedzia�em si�, �e nazywa� si� Josep i polowa� w okolicach Nowego Obozu.");
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> JosepPowrot
//========================================

INSTANCE DIA_Alex_JosepPowrot (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_JosepPowrot_Condition;
   information  = DIA_Alex_JosepPowrot_Info;
   permanent	= FALSE;
   description	= "Josep wr�ci� do obozu.";
};

FUNC INT DIA_Alex_JosepPowrot_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Josep_Free))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_JosepPowrot_Info()
{
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_01"); //Josep wr�ci� do obozu.
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_02"); //Uda�o ci si� go znale��? Gdzie by�?
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_03"); //Zosta� pojmany przez ludzi Lewusa i zmuszony do pracy na polach ry�owych.
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_04"); //Te sukinsyny z Nowego Obozu! Ju� ja im poka��!
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_05"); //Lewus i Ry�owy Ksi��� nie �yj�. Przy��czyli�my si� do powstania przeciwko ich tyranii.
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_06"); //Jestem pe�en podziwu. We� t� rud� w nagrod�.
    CreateInvItems (self, ItMiNugget, 300);
    B_GiveInvItems (self, other, ItMiNugget, 300);
    B_LogEntry                     (CH1_JosepZniknal,"Josep wr�ci� do obozu. Alex by� bardzo zadowolony z moich dokona�.");

    Log_SetTopicStatus       (CH1_JosepZniknal, LOG_SUCCESS);
    MIS_JosepZniknal = LOG_SUCCESS;

    B_GiveXP (350);
	EquipItem (NON_5614_Josep, ItMw_1H_Scythe_01);
};

//========================================
//-----------------> Podejrzane
//========================================

INSTANCE DIA_Alex_Podejrzane (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 2;
   condition    = DIA_Alex_Podejrzane_Condition;
   information  = DIA_Alex_Podejrzane_Info;
   permanent	= FALSE;
   description	= "Nie uwa�asz, �e Josep zachowuje si� troch� dziwnie?";
};

FUNC INT DIA_Alex_Podejrzane_Condition()
{
    if (MIS_JosepZniknal == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Podejrzane_Info()
{
    AI_Output (other, self ,"DIA_Alex_Podejrzane_15_01"); //Nie uwa�asz, �e Josep zachowuje si� troch� dziwnie?
    AI_Output (self, other ,"DIA_Alex_Podejrzane_03_02"); //Zrobi� si� taki od kiedy wr�ci� z ruin.
    AI_Output (other, self ,"DIA_Alex_Podejrzane_15_03"); //Ruin? Przecie� by� w niewoli?
AI_Output (self, other ,"DIA_Alex_Podejrzane_03_04"); //Tak, ale jaki� miesi�c przed jego znikni�ciem te� przepad� na par� dni. 
    AI_Output (self, other ,"DIA_Alex_Podejrzane_03_05"); //Gdy wr�ci�, powiedzia�, �e zgubi� si� w�r�d jakich� ruin. W sumie, pe�no tego cholerstwa w Kolonii, wi�c nie dopytywa�em, gdzie dok�adnie.
    AI_Output (other, self ,"DIA_Alex_Podejrzane_15_06"); //Kiedy z nim rozmawia�em, powiedzia� mi o pewnym amulecie. Gada�, �e przys�a�e� mnie, �ebym mu go zabra�.
    AI_Output (self, other ,"DIA_Alex_Podejrzane_03_07"); //Obserwuj go, �led�. Mo�e uda ci si� czego� dowiedzie�.
    MIS_DziwnyJosep = LOG_RUNNING;
Npc_ExchangeRoutine (NON_5614_Josep, "beliar");
Npc_SetTalentSkill	(NON_5614_Josep,	NPC_TALENT_MAGE,		6);

 Npc_RemoveInvItems (NON_5614_Josep, ItMw_1H_Scythe_01, 1);
 	CreateInvItem		(NON_5614_Josep,	ItArRuneThunderball);
	NON_5614_Josep.fight_tactic	=	FAI_HUMAN_MAGE; 
	NON_5614_Josep.level 		=	25;
	NON_5614_Josep.attribute[ATR_STRENGTH] 	= 200;
	NON_5614_Josep.attribute[ATR_DEXTERITY]	= 200;
	NON_5614_Josep.attribute[ATR_MANA_MAX] 	= 300;
	NON_5614_Josep.attribute[ATR_MANA] 		= 300;
	NON_5614_Josep.attribute[ATR_HITPOINTS_MAX]= 400;
	NON_5614_Josep.attribute[ATR_HITPOINTS] 	= 400;
    Log_CreateTopic            (CH1_DziwnyJosep, LOG_MISSION);
    Log_SetTopicStatus       (CH1_DziwnyJosep, LOG_RUNNING);
    B_LogEntry                     (CH1_DziwnyJosep,"Josep zachowuje si� bardzo dziwnie. Alex poradzi� mi, abym go �ledzi�.");

    AI_StopProcessInfos	(NON_5600_Alex);
};

//========================================
//-----------------> OpetanyJosep
//========================================

INSTANCE DIA_Alex_OpetanyJosep (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_OpetanyJosep_Condition;
   information  = DIA_Alex_OpetanyJosep_Info;
   permanent	= FALSE;
   description	= "Josep by� opetany!";
};

FUNC INT DIA_Alex_OpetanyJosep_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Josep_Normalny))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_OpetanyJosep_Info()
{
    AI_Output (other, self ,"DIA_Alex_OpetanyJosep_15_01"); //Josep by� op�tany!
    AI_Output (self, other ,"DIA_Alex_OpetanyJosep_03_02"); //Co?!
    AI_Output (other, self ,"DIA_Alex_OpetanyJosep_15_03"); //To przez amulet, kt�ry znalaz� w ruinach. Z jego majacze� mniemam, �e zasz�o tam co� dziwnego.
    AI_Output (self, other ,"DIA_Alex_OpetanyJosep_03_04"); //Co� sugerujesz?
    AI_Output (other, self ,"DIA_Alex_OpetanyJosep_15_05"); //W sumie to nie wiem dok�adnie... Musia�bym poprosi� o pomoc mag�w.
    AI_Output (self, other ,"DIA_Alex_OpetanyJosep_03_06"); //O nie! Odejd�! Nie mieszam si� w sprawy mag�w!
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
	
	EquipItem (NON_5614_Josep, ItMwZ_1H_Sword_01);
	EquipItem (NON_5614_Josep, ItRw_Bow_Small_04);
	CreateInvItem (NON_5614_Josep,NON_WOLF_ARMOR);
	AI_EquipBestArmor (NON_5614_Josep);
};

//========================================
//-----------------> KillJosep
//========================================

INSTANCE DIA_Alex_KillJosep (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_KillJosep_Condition;
   information  = DIA_Alex_KillJosep_Info;
   permanent	= FALSE;
   description	= "Josep nie �yje!";
};

FUNC INT DIA_Alex_KillJosep_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(NON_5614_Josep);
    if (Npc_KnowsInfo (hero, DIA_Josep_NieDales))
    && (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_KillJosep_Info()
{
    AI_Output (other, self ,"DIA_Alex_KillJosep_15_01"); //Josep nie �yje!
    AI_Output (self, other ,"DIA_Alex_KillJosep_03_02"); //Jak to si� sta�o?
    AI_Output (other, self ,"DIA_Alex_KillJosep_15_03"); //Co� mu odbi�o i rzuci� si� na mnie. Znalaz�em przy nim dziwny amulet, kt�ry dawa� mu niezwyk�e moce.
    AI_Output (other, self ,"DIA_Alex_KillJosep_15_04"); //Razi� we mnie piorunami niczym do�wiadczony mag. Musz� pokaza� ten amulet magom.
    AI_Output (self, other ,"DIA_Alex_KillJosep_03_05"); //Cholera, w Kolonii robi si� coraz bardziej niebezpiecznie. Powiem naszym, �eby nie zapuszczali si� w ruiny. 
    B_LogEntry                     (CH1_DziwnyJosep,"Niestety musia�em zabi� Josepa. Jego dusza zosta�a zepsuta przez Beliara. ");

    Log_SetTopicStatus       (CH1_DziwnyJosep, LOG_SUCCESS);
    MIS_DziwnyJosep = LOG_SUCCESS;

    B_GiveXP (250);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NovizeShrat
//========================================

INSTANCE DIA_Alex_NovizeShrat (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_NovizeShrat_Condition;
   information  = DIA_Alex_NovizeShrat_Info;
   permanent	= FALSE;
   description	= "Nowicjusz Shrat szuka sobie nowego miejsca.";
};

FUNC INT DIA_Alex_NovizeShrat_Condition()
{
    if (MIS_UCieczkaShrata == LOG_RUNNING)
    && (ShratHaveWork == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_NovizeShrat_Info()
{
    AI_Output (other, self ,"DIA_Alex_NovizeShrat_15_01"); //Nowicjusz Shrat szuka sobie nowego miejsca.
    AI_Output (self, other ,"DIA_Alex_NovizeShrat_03_02"); //Je�eli chcesz, mo�esz go przyprowadzi� do obozu.
    AI_Output (self, other ,"DIA_Alex_NovizeShrat_03_03"); //Przyda nam si� ka�dy cz�owiek.
    B_LogEntry                     (CH1_UCieczkaShrata,"Alex przyjmie Shrata do obozu my�liwych. Musz� przekaza� Nowicjuszowi dobre wie�ci.");
ShratHaveWork = true;
    B_GiveXP (300);
};

//========================================
//-----------------> Ratunek
//========================================

INSTANCE DIA_Alex_Ratunek (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Ratunek_Condition;
   information  = DIA_Alex_Ratunek_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_Ratunek_Condition()
{
    if (Npc_GetDistToNpc(self, other) < 700)
    && (MIS_PorwanieAlexa == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Ratunek_Info()
{
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_01"); //Wreszcie kto� przyszed� mnie uwolni�.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_02"); //Przybywasz z ratunkiem? Tak?
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_03"); //To tw�j szcz�liwy dzie�.
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_04"); //Ratowanie i piecze� ze �cierwojada w zestawie.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_05"); //Ha! Zjad�bym piecze�.

    AI_Output (other, self ,"DIA_Alex_Ratunek_15_07"); //Ja te�. Znudzi�o mi si� bieganie po Obozie.
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_08"); //Wola�bym wspina� si� po wie�y do jakiej� urodnej niewiasty.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_09"); //A musisz zapieprza� �eby uwolni� jakiego� dziada z celi. He he.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_10"); //Piwko? I zaraz si� zbieramy.
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_11"); //Jasne.
    CreateInvItems (self, ItFoBeer, 2);
    B_GiveInvItems (self, other, ItFoBeer, 1);
    AI_UseItem (self, ItFoBeer);
    AI_UseItem (hero, ItFoBeer);
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_12"); //Chod�my. 
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH1_PorwanieAlexa,"My�liwy Alex zosta� uwolniony. Mo�emy wraca� do obozu. Wszystko dobrze si� sko�czy�o. ");
    Log_SetTopicStatus       (CH1_PorwanieAlexa, LOG_SUCCESS);
    MIS_PorwanieAlexa = LOG_SUCCESS;
 Npc_ExchangeRoutine (self, "start");
    B_GiveXP (1000);
};

//========================================
//-----------------> QUEST_TROLL
//========================================

INSTANCE DIA_Alex_QUEST_TROLL (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_QUEST_TROLL_Condition;
   information  = DIA_Alex_QUEST_TROLL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_QUEST_TROLL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_CHAPTER_5)) && (MIS_PorwanieAlexa == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_QUEST_TROLL_Info()
{
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_01"); //O, dobrze ci� widzie�!
    AI_Output (other, self ,"DIA_Alex_QUEST_TROLL_15_02"); //Co si� sta�o?
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_03"); //Zbieraj si�. Mamy robot�. W okolicach mostu do Nowego Obozu pojawi� si� wielki troll. 
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_04"); //Bestia zabi�a ju� trzech Najemnik�w. Jest szalona i agresywna. 
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_05"); //Pomo�esz mi si� jej pozby�. To zlecenie od Mag�w Wody. Nie�le na tym zarobimy!
    if (Npc_KnowsInfo (hero, Info_Milten_LSNOW))
    {
        AI_Output (other, self ,"DIA_Alex_QUEST_TROLL_15_06"); //Nie mam najlepszych kontakt�w z Magami Wody. 
        AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_07"); //Spokojnie. Ja si� wszystkim zajm�. 
    };
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_08"); //A teraz chod� za mn�!
	self.aivar[AIV_PARTYMEMBER] =	TRUE;
    Npc_ExchangeRoutine (self, "troll");
	B_LogEntry                     (CH1_Wielki_troll,"Mam uda� si� z Alexem na polowanie na wielkiego trolla, kt�remu spodoba�y si� okolice Nowego Obozu.");
    Wld_InsertNpc				(BlackTroll,"OW_PATH_152K");	
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> POKONANY_TROLL
//========================================

INSTANCE DIA_Alex_POKONANY_TROLL (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_POKONANY_TROLL_Condition;
   information  = DIA_Alex_POKONANY_TROLL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_POKONANY_TROLL_Condition()
{
    if (Npc_GetDistToWP (self, "OW_PATH_152K") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_POKONANY_TROLL_Info()
{
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_01"); //Cholera, pierwszy raz widzia�em tak rozw�cieczonego trolla.
    AI_Output (other, self ,"DIA_Alex_POKONANY_TROLL_15_02"); //No, twardy by� sukinsyn. 
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_03"); //Dobrze, �e jako� to prze�yli�my. Magowie obiecali mi 4000 bry�ek rudy, je�eli uda mi si� go zabi�.
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_04"); //Dam ci teraz 2000 bry�ek z mojej kieszeni, a po wyp�at� udam si� sam do Mag�w.
    AI_Output (other, self ,"DIA_Alex_POKONANY_TROLL_15_05"); //Umowa stoi.
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_06"); //�wietnie. We� jeszcze te dwie silne mikstury uzdrawiaj�ce. 
    AI_Output (other, self ,"DIA_Alex_POKONANY_TROLL_15_07"); //Dzi�ki. Trzymaj si� przyjacielu. 
    B_LogEntry                     (CH1_Wielki_troll,"Uda�o nam si� pokona� wielkiego trolla. To by�a naprawd� ci�ka walka.");
    Log_SetTopicStatus       (CH1_Wielki_troll, LOG_SUCCESS);
    MIS_Wielki_troll = LOG_SUCCESS;

    B_GiveXP (250);
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
    CreateInvItems (self, ItMiNugget, 2000);
    B_GiveInvItems (self, other, ItMiNugget, 2000);
    CreateInvItems (self, ItFo_Potion_Health_03, 2);
    B_GiveInvItems (self, other, ItFo_Potion_Health_03, 2);
};



