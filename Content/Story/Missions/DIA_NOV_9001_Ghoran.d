//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Ghoran_EXIT(C_INFO)
{
	npc             = NOV_9001_Ghoran;
	nr              = 999;
	condition		= DIA_Ghoran_EXIT_Condition;
	information		= DIA_Ghoran_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Ghoran_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ghoran_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoYou2
//========================================

INSTANCE DIA_Ghoran_WhoYou2 (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_WhoYou2_Condition;
   information  = DIA_Ghoran_WhoYou2_Info;
   permanent	= FALSE;
   description	= "Widzê, ¿e robicie wino.";
};

FUNC INT DIA_Ghoran_WhoYou2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ghoran_WhoYou2_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_WhoYou2_15_01"); //Widzê, ¿e robicie wino.
    AI_Output (self, other ,"DIA_Ghoran_WhoYou2_03_02"); //Dobrze widzisz. Ja i ci Nowicjusze zajmujemy siê upraw¹ winogron i produkcj¹ wina. 
	AI_Output (other, self ,"DIA_Ghoran_WhoYou2_15_03"); //Zajmujesz siê te¿ handlem? 
	AI_Output (self, other ,"DIA_Ghoran_WhoYou2_03_04"); //W sensie, czy sprzedajê wino? Oczywiœcie! Ca³kiem sporo Nowicjuszy siê u mnie zaopatruje. No i oczywiœcie Gor Boba. 
	AI_Output (self, other ,"DIA_Ghoran_WhoYou2_03_05"); //Najlepszy margunios robiony w Kolonii Karnej tylko u mnie, rzecz jasna mo¿esz te¿ kupiæ owoce. Zawsze mamy jakiœ zapas na produkcjê wina. 

	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);//fix
	B_LogEntry		(GE_TraderPSI,	"U Ghorana kupiê wino i owoce. Handluje w okolicach placu œwi¹tynnego. Trudno go przeoczyæ.");
};

//========================================
//-----------------> Handel
//========================================

INSTANCE DIA_Ghoran_Handel (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 3;
   condition    = DIA_Ghoran_Handel_Condition;
   information  = DIA_Ghoran_Handel_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chcê coœ kupiæ.";
};

FUNC INT DIA_Ghoran_Handel_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_WhoYou2))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Ghoran_Handel_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_Handel_15_01"); //Chcê coœ kupiæ.
    AI_Output (self, other ,"DIA_Ghoran_Handel_03_02"); //Wybieraj.
};

//========================================
//-----------------> AboutYou
//========================================

INSTANCE DIA_Ghoran_AboutYou (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_AboutYou_Condition;
   information  = DIA_Ghoran_AboutYou_Info;
   permanent	= FALSE;
   description	= "Jak trafi³eœ do Kolonii Karnej?";
};

FUNC INT DIA_Ghoran_AboutYou_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_WhoYou2))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Ghoran_AboutYou_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_AboutYou_15_01"); //Jak trafi³eœ do Kolonii Karnej? 
    AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_02"); //To proste. By³em ch³opem przypisanym do ziemi, która od pokoleñ nale¿a³a do szlachcica Zandora i jego rodziny. Gdy zbieg³em z jego maj¹tku, rozes³a³ za mn¹ list goñczy. 
	AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_03"); //Gdy stra¿nicy królewscy mnie schwytali, zosta³em wys³any do Kolonii Karnej. 
	AI_Output (other, self ,"DIA_Ghoran_AboutYou_15_04"); //Przecie¿ Zandor na tym nic nie zyska³. 
	AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_05"); //Nie znasz królewskiego prawa? Pojmanego zbiega mo¿na albo odes³aæ do miejsca jego przypisania, albo w zamian za kilka z³otych monet zrzec siê do niego praw. 
	AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_06"); //W tym drugim przypadku, zbieg nie jest ju¿ traktowany jako podleg³y panu, lecz jako przestêpca, wiêc zostaje zes³any tutaj.
	AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_07"); //Widocznie moja praca by³a dla niego mniej warta ni¿ kilka z³otych monet. 
};

//========================================
//-----------------> Plants
//========================================

INSTANCE DIA_Ghoran_Plants (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_Plants_Condition;
   information  = DIA_Ghoran_Plants_Info;
   permanent	= FALSE;
   description	= "Sk¹d pozyskujecie winogrona?";
};

FUNC INT DIA_Ghoran_Plants_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_WhoYou2))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Ghoran_Plants_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_Plants_15_01"); //Sk¹d pozyskujecie winogrona?
    AI_Output (self, other ,"DIA_Ghoran_Plants_03_02"); //Rozejrzyj siê. 
	AI_PlayAni (hero, "T_SEARCH");
	AI_Output (self, other ,"DIA_Ghoran_Plants_03_03"); //Widzisz te zielone pn¹cza? No w³aœnie. Kilka lat temu uda³o nam siê sprowadziæ kilka sadzonek. Wiêkszoœæ z nich siê przyjê³a i chwaliæ los, dot¹d wspaniale owocuj¹. 
	AI_Output (other, self ,"DIA_Ghoran_Plants_15_04"); //Przyznasz chyba, ¿e to doœæ nowatorski pomys³, by zak³adaæ winnicê na bagnie i to jeszcze w Kolonii Karnej. 
	AI_Output (self, other ,"DIA_Ghoran_Plants_03_05"); //Fakt, pocz¹tkowo wiêkszoœæ moich wspó³braci by³a doœæ sceptyczna co do pomys³u, by rozpocz¹æ na bagnach produkcjê wina. 
	AI_Output (self, other ,"DIA_Ghoran_Plants_03_06"); //Nawet mój kompan, Severio nie dowierza³ w to, ¿e to mo¿e siê udaæ siê uda. A tu proszê - wszystko wysz³o nawet lepiej, ni¿ sam siê spodziewa³em.	
};

//========================================
//-----------------> Margunios
//========================================

INSTANCE DIA_Ghoran_Margunios (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_Margunios_Condition;
   information  = DIA_Ghoran_Margunios_Info;
   permanent	= FALSE;
   description	= "Co to jest margunios?";
};

FUNC INT DIA_Ghoran_Margunios_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_WhoYou2))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Ghoran_Margunios_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_Margunios_15_01"); //Co to jest margunios?
    AI_Output (self, other ,"DIA_Ghoran_Margunios_03_02"); //Nie wiesz, co to jest margunios? To jest bia³e wino z okolic Ardei i Cape Dun. 
	AI_Output (self, other ,"DIA_Ghoran_Margunios_03_03"); //Dawniej jego produkcja znajdowa³a siê w rêkach rodu Margunios, ale gdy ród zubo¿a³, to odsprzeda³ swe winnice radzie wioski Ardei. 
	AI_Output (self, other ,"DIA_Ghoran_Margunios_03_04"); //Niegdyœ rywalizowa³o z winem vengardzkim o arystokratyczne sto³y, ale teraz obni¿y³o nieco swe loty i jako trunek króluje w domach kupców oraz drobnego rycerstwa. 
	AI_Output (other, self ,"DIA_Ghoran_Margunios_15_05"); //A ty je teraz tu produkujesz!?
	AI_Output (self, other ,"DIA_Ghoran_Margunios_03_06"); //Tak, ale jego obozow¹ wersjê na miarê miejsca i warunków. 
};

///////////////////////////////////////////////
// ZADANIE Z ALKOHOLEM OD BANDYTÓW
///////////////////////////////////////////////

//========================================
//-----------------> AlcoSell
//========================================

INSTANCE DIA_Ghoran_AlcoSell (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 2;
   condition    = DIA_Ghoran_AlcoSell_Condition;
   information  = DIA_Ghoran_AlcoSell_Info;
   permanent	= FALSE;
   description	= "Kupicie alkohol od Bandytów?";
};

FUNC INT DIA_Ghoran_AlcoSell_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_Sprawa))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ghoran_AlcoSell_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_AlcoSell_15_01"); //Kupicie alkohol od Bandytów?
    AI_Output (self, other ,"DIA_Ghoran_AlcoSell_03_02"); //Za ile?
    AI_Output (other, self ,"DIA_Ghoran_AlcoSell_15_03"); //No nie wiem. 15 bry³ek rudy za butelkê? Naprawdê warto!
    AI_Output (self, other ,"DIA_Ghoran_AlcoSell_03_04"); //Szkodnicy chc¹ od nas 20 bry³ek rudy.
    AI_Output (self, other ,"DIA_Ghoran_AlcoSell_03_05"); //Teoretycznie op³aca nam siê to, jednak nie jestem pewien waszych intencji.
    AI_Output (self, other ,"DIA_Ghoran_AlcoSell_03_06"); //Przypuszczam, ¿e chcecie sprzedaæ nam jakieœ œwiñstwo.
    AI_Output (other, self ,"DIA_Ghoran_AlcoSell_15_07"); //Ten alkohol jest taki sam, jak ten oferowany przez Szkodników. Powiedzia³bym nawet, ¿e jest lepszy.
    AI_Output (self, other ,"DIA_Ghoran_AlcoSell_03_08"); //No nie wiem. Udowodnij mi, ¿e wasz jest lepszy.
    AI_Output (self, other ,"DIA_Ghoran_AlcoSell_03_09"); //Wtedy siê zastanowiê.
    B_LogEntry                     (CH1_SellAlco,"Ghoran nie jest przekonany do naszego produktu. Mam udowodniæ, ¿e jest lepszy od tego oferowanego przez Szkodników. Muszê z nim pokombinowaæ na stole alchemicznym. ");
	GhoranTalk = true;
};



//========================================
//-----------------> Sprobuj
//========================================
//edit by Nocturn

INSTANCE DIA_Ghoran_Sprobuj (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_Sprobuj_Condition;
   information  = DIA_Ghoran_Sprobuj_Info;
   permanent	= FALSE;
   description	= "Sam spróbuj.";
};

FUNC INT DIA_Ghoran_Sprobuj_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_AlcoSell)) && (Npc_HasItems (other, ItMi_Alchemy_Alcohol_02) >=1)
    && (MIS_SellAlco == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ghoran_Sprobuj_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_Sprobuj_15_01"); //Sam spróbuj.
	B_GiveInvItems (hero,self,ItMi_Alchemy_Alcohol_02,1);
	CreateInvItem (self,itfowine);
	AI_UseItem	(self,ItFoWine);
    AI_Output (self, other ,"DIA_Ghoran_Sprobuj_03_02"); //Hmmm. Ten alkohol jest naprawdê dobry. Lepszy od tego, który do tej pory kupowaliœmy.
    AI_Output (self, other ,"DIA_Ghoran_Sprobuj_03_03"); //Myœlê, ¿e mo¿emy go wykorzystaæ do produkcji specjalnych nalewek.
    AI_Output (self, other ,"DIA_Ghoran_Sprobuj_03_04"); //Nowicjusze i Guru z pewnoœci¹ skusz¹ siê na nasz nowy towar. 
    AI_Output (self, other ,"DIA_Ghoran_Sprobuj_03_05"); //Chcê tego wiêcej.
    AI_Output (other, self ,"DIA_Ghoran_Sprobuj_15_06"); //Wiedzia³em, ¿e ci siê spodoba.
    B_LogEntry                     (CH1_SellAlco,"Ghoram by³ bardzo zadowolony z naszego alkoholu. Myœlê, ¿e przekona³em go t¹ ma³¹ przeróbk¹.");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FirstDostawa
//========================================

INSTANCE DIA_Ghoran_FirstDostawa (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_FirstDostawa_Condition;
   information  = DIA_Ghoran_FirstDostawa_Info;
   permanent	= FALSE;
   description	= "Przynios³em pierwsz¹ dostawê.";
};

FUNC INT DIA_Ghoran_FirstDostawa_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_Dostwy))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ghoran_FirstDostawa_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_FirstDostawa_15_01"); //Przynios³em pierwsz¹ dostawê.
    AI_Output (self, other ,"DIA_Ghoran_FirstDostawa_03_02"); //Dobra, dawaj.
    B_LogEntry                     (CH1_Dostawy,"Bractwo - alkohol dostarczony.");

    B_GiveXP (50);
    B_GiveInvItems (other, self, ItMi_Alchemy_Alcohol_01, 10);
    AI_StopProcessInfos	(self);
};

////////////////////////////////////////////
// ZADANIE Z POSZUKIWANIEM WSPÓLNIKA
////////////////////////////////////////////

//========================================
//-----------------> VineQuest
//========================================

INSTANCE DIA_Ghoran_VineQuest (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_VineQuest_Condition;
   information  = DIA_Ghoran_VineQuest_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ghoran_VineQuest_Condition()
{
    if (Npc_GetTrueGuild (hero) == GIL_NOV)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ghoran_VineQuest_Info()
{
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_01"); //Bracie, zaczekaj, zaczekaj!
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_02"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_03"); //Nowicjusze mówi¹, ¿e doœæ czêsto opuszczasz Obóz, wiêc pewnie spotykasz trochê ludzi na swojej drodze. 
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_04"); //Ca³kiem mo¿liwe...
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_05"); //No widzisz. Jest sprawa... i trochê nie wiem od czego zacz¹æ. 
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_06"); //Najlepiej zacznij od pocz¹tku.
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_07"); //Od pocz¹tku, to by za d³ugo siê zesz³o. Powiem wiêc wprost. Wiêkszoœæ moich klientów to Nowicjusze, je¿eli nie liczyæ poczciwego Gor Boby. 
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_08"); //Reszta Stra¿ników woli kupiæ wino pochodz¹ce z handlu ze Starym Obozem, czyli importowane ze Œwiata Zewnêtrznego.
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_09"); //Wiêc mo¿e spróbuj produkowaæ lepsze wino?
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_10"); //Gdyby to wszystko by³o takie proste. To co wiem o produkcji wina... Tego nauczy³em siê w Kolonii od Severio, a i tak mój przyjaciel zdo³a³ mi przekazaæ jedynie cz¹stkê swojej wiedzy. 
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_11"); //Potrzebujê wiêc kogoœ, kto siê dobrze na tym zna.
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_12"); //Czyli mam ci znaleŸæ w Kolonii wspólnika? 
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_13"); //Dok³adnie. I jakbyœ móg³, to nie rozpowiadaj w Bractwie o moich poszukiwaniach. Nie chcê by moi wspó³bracia poczuli siê ura¿eni. 
	
	MIS_GhoransVine = LOG_RUNNING;
		
    Log_CreateTopic		(CH1_GhoransVine, LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhoransVine, LOG_RUNNING);
	B_LogEntry					(CH1_GhoransVine, "Nowicjusz Ghoran wyrabiaj¹cy w Bractwie wino potrzebuje kogoœ, kto zna siê lepiej od niego na produkcji. Powinienem popytaæ o to kogoœ obeznanego. Byæ mo¿e karczmarz ze Starego Obozu bêdzie coœ wiedzia³.");
};

//========================================
//-----------------> AbelIsWorker
//========================================

INSTANCE DIA_Ghoran_AbelIsWorker (C_INFO)
{
   npc          = NOV_9001_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_AbelIsWorker_Condition;
   information  = DIA_Ghoran_AbelIsWorker_Info;
   permanent	= FALSE;
   description	= "W Obozie zjawi³ siê ju¿ Abel?";
};

FUNC INT DIA_Ghoran_AbelIsWorker_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Abel_Win))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ghoran_AbelIsWorker_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_AbelIsWorker_15_01"); //W Obozie zjawi³ siê ju¿ Abel?
    AI_Output (self, other ,"DIA_Ghoran_AbelIsWorker_03_02"); //Tak. Jestem ci naprawdê wdziêczny. Ten goœæ naprawdê ma pojêcie o winie. Myœlê, ¿e bêdzie nam siê dobrze pracowaæ.
	AI_Output (self, other ,"DIA_Ghoran_AbelIsWorker_03_03"); //Da³em mu trochê czasu na wytchnienie i zapoznanie siê z Obozem. Sk¹d¿e tyœ go wzi¹³? Nerwowy jakby uciek³ z królewskiego wiêzienia.
	AI_Output (other, self ,"DIA_Ghoran_AbelIsWorker_15_04"); //To d³uga historia. Mo¿e sam ci kiedyœ opowie...
	AI_Output (self, other ,"DIA_Ghoran_AbelIsWorker_03_05"); //Mam nadziejê. Od³o¿y³em dla ciebie trochê rudy ze sprzeda¿y wina. Myœlê, ¿e to wystarczy na pokrycie kosztów. 
	AI_Output (other, self ,"DIA_Ghoran_AbelIsWorker_15_06"); //Miliony to to nie s¹, ale zadowolê siê.
	
	CreateInvItems (self, itminugget,100);
    B_GiveInvItems (self, hero, itminugget, 100);
	
	MIS_GhoransVine = LOG_SUCCESS;
		
	Log_SetTopicStatus	(CH1_GhoransVine, LOG_SUCCESS);
	B_LogEntry			(CH1_GhoransVine, "Ghoran wynagrodzi³ mnie za sprowadzenie mu pomocnika. Myœlê, ¿e dogadaj¹ siê razem z Ablem.");
	
	B_GiveXP (220);
	
    AI_StopProcessInfos	(self);
	
	B_ChangeGuild    (VLK_7003_Abel,GIL_NOV);  
	B_SetPermAttitude	(VLK_7003_Abel,	ATT_FRIENDLY);
};
