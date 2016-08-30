//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Gamal_EXIT(C_INFO)
{
	npc             = GRD_7004_Gamal;
	nr              = 999;
	condition	= DIA_Gamal_EXIT_Condition;
	information	= DIA_Gamal_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Gamal_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gamal_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoYou
//========================================

INSTANCE DIA_Gamal_WhoYou (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 4;
   condition    = DIA_Gamal_WhoYou_Condition;
   information  = DIA_Gamal_WhoYou_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Gamal_WhoYou_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Gamal_WhoYou_Info()
{
    AI_Output (other, self ,"DIA_Gamal_WhoYou_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Gamal_WhoYou_03_02"); //Odpoczywam od obozowych ha³asów. Czego chcesz?
    AI_Output (other, self ,"DIA_Gamal_WhoYou_15_03"); //Jestem tu nowy.
    AI_Output (self, other ,"DIA_Gamal_WhoYou_03_04"); //Jak chcesz znaleŸæ jakaœ robotê, to idŸ do Starego Obozu. Tak, to ta wielka kupa syfu otoczona palisad¹, która znajduje siê za moimi plecami.
	AI_Output (self, other ,"DIA_Gamal_WhoYou_03_05"); //Lorenzo to wp³ywowy goœæ, który za³atwi ci uczciw¹ pracê w Kopalni. Ja dla niego pracujê i nie mam czego ¿a³owaæ.
	AI_Output (other, self ,"DIA_Gamal_WhoYou_15_06"); //Nie wygl¹dasz mi na górnika.
	AI_Output (self, other ,"DIA_Gamal_WhoYou_03_07"); //Bo nim nie jestem, oœle. Pomagam w innych rzeczach, takich jak chocia¿by eskortowanie robotników do Kopalni.
};

//========================================
//-----------------> GoToMine
//========================================

INSTANCE DIA_Gamal_GoToMine (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 4;
   condition    = DIA_Gamal_GoToMine_Condition;
   information  = DIA_Gamal_GoToMine_Info;
   permanent	= FALSE;
   description	= "Mamy iœæ do Kopalni.";
};

FUNC INT DIA_Gamal_GoToMine_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_VLK)
	{
    return TRUE;
	};
};


FUNC VOID DIA_Gamal_GoToMine_Info()
{
    AI_Output (other, self ,"DIA_Gamal_GoToMine_15_01"); //Mamy iœæ do Kopalni.
    AI_Output (self, other ,"DIA_Gamal_GoToMine_03_02"); //Wiem, nie jestem g³uchy. No, za mn¹, ofermy! Pora wzi¹æ siê za machanie kilofem. 
	AI_Output (self, other ,"DIA_Gamal_GoToMine_03_03"); //Jak dojdziemy w jednym kawa³ku to powiem ci co i jak, bo nie wiem czy masz taki g³upi wyraz twarzy od urodzenia czy po prostu nie wiesz, co siê tu dzieje. 
	
    MIS_ToOldMine = LOG_RUNNING; 
    Log_CreateTopic          	(CH1_ToOldMine, LOG_MISSION);
    Log_SetTopicStatus      	(CH1_ToOldMine, LOG_RUNNING);
    B_LogEntry               		(CH1_ToOldMine,"Razem z Petro i trzema Kopaczami mam siê udaæ do Starej Kopalni. Tam dostanê dalsze instrukcje od Stra¿nika.");
	
	//dzielenie xp
    self.aivar[AIV_PARTYMEMBER] = TRUE;
	//przyjazne nastawienie
	self.Npctype = NPCTYPE_FRIEND;
	B_SetPermAttitude	(self,	ATT_FRIENDLY);
	//rutyna
    Npc_ExchangeRoutine (self,"went");
	//wyjœcie
    AI_StopProcessInfos	(self);
	
	//kopacze
	Npc_ExchangeRoutine (VLK_501_Buddler,"tomine");
	VLK_501_Buddler.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (VLK_517_Buddler,"tomine");
	VLK_517_Buddler.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (VLK_565_Buddler,"tomine");
	VLK_565_Buddler.aivar[AIV_PARTYMEMBER] = TRUE;
};

//========================================
//-----------------> DOTARLISMY
//========================================

INSTANCE DIA_Gamal_DOTARLISMY (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 3;
   condition    = DIA_Gamal_DOTARLISMY_Condition;
   information  = DIA_Gamal_DOTARLISMY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gamal_DOTARLISMY_Condition()
{
    if (MIS_ToOldMine == LOG_RUNNING)
    && (Npc_GetDistToWP (self, "OW_OM_ENTRANCE01") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gamal_DOTARLISMY_Info()
{
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_01"); //Jesteœmy na miejscu! 
    AI_Output (other, self ,"DIA_Gamal_DOTARLISMY_15_02"); //Œwietnie. Co teraz mam zrobiæ?
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_03"); //IdŸ prosto do Kopalni. Mo¿esz siê zapoznaæ z tym obozem jednak nie jest ci to do niczego potrzebne. U Andrewa mo¿esz kupiæ przydatne graty. 
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_04"); //Stra¿nicy przy wejœciu nie bêd¹ ci robiæ k³opotów. Kiedy ju¿ bêdziesz w Kopalni idŸ do Iana i z nim siê dalej ugaduj. 
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_05"); //Có¿, pozostaje mi ¿yczyæ ci powodzenia. Spróbuj nie zgin¹æ przy najbli¿szej mo¿liwej okazji. 
	
    B_LogEntry                     (CH1_ToOldMine,"Petro przyprowadzi³ mnie do obozu przed Star¹ Kopalni¹. Pokrêcê siê tu chwilê, a potem schodzê do Kopalni i idê prosto do Iana.");
	MIS_ToOldMine = LOG_SUCCESS; 
    Log_SetTopicStatus      	(CH1_ToOldMine, LOG_SUCCESS);
	
    Npc_ExchangeRoutine (self,"camp");
	self.aivar[AIV_PARTYMEMBER] = false;
	self.Npctype = NPCTYPE_MAIN;
	B_SetPermAttitude	(self,	ATT_NEUTRAL);
    B_GiveXP (25);
	 AI_StopProcessInfos	(self);
		
	//kopacze
	Npc_ExchangeRoutine (VLK_501_Buddler,"camp");
	VLK_501_Buddler.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (VLK_517_Buddler,"camp");
	VLK_517_Buddler.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (VLK_565_Buddler,"camp");
	VLK_565_Buddler.aivar[AIV_PARTYMEMBER] = false;
};

/*
//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Gamal_HELLO (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 1;
   condition    = DIA_Gamal_HELLO_Condition;
   information  = DIA_Gamal_HELLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gamal_HELLO_Condition()
{
	if (MIS_DraxTest != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Gamal_HELLO_Info()
{
    AI_Output (self, other ,"DIA_Gamal_HELLO_03_01"); //Hej, ch³opcze!
    AI_Output (self, other ,"DIA_Gamal_HELLO_03_02"); //Dok¹d zmierzasz? Do Starego Obozu?
    AI_Output (other, self ,"DIA_Gamal_HELLO_15_03"); //Mo¿e...
    AI_Output (self, other ,"DIA_Gamal_HELLO_03_04"); //Widzê b³ysk w twoich oczach.
    AI_Output (self, other ,"DIA_Gamal_HELLO_03_05"); //Chcesz zostaæ cz³onkiem Obozu? Mogê ci pomóc.

    Info_ClearChoices		(DIA_Gamal_HELLO);
    Info_AddChoice		(DIA_Gamal_HELLO, "Nie, dziêki. Dam sobie radê sam.", DIA_Gamal_HELLO_NIE);
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
    Info_AddChoice		(DIA_Gamal_HELLO, "Mów dalej...", DIA_Gamal_HELLO_OK);
	};
};

FUNC VOID DIA_Gamal_HELLO_NIE()
{
    AI_Output (other, self ,"DIA_Gamal_HELLO_NIE_15_01"); //Nie, dziêki. Dam sobie radê sam.
    AI_Output (self, other ,"DIA_Gamal_HELLO_NIE_03_02"); //Stary Obóz to najpotê¿niejszy wœród obozów.
    AI_Output (self, other ,"DIA_Gamal_HELLO_NIE_03_03"); //Kiedyœ zrozumiesz, jaki b³¹d pope³niasz.
    Info_ClearChoices		(DIA_Gamal_HELLO);
	pogadajgamal = false;
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Gamal_HELLO_OK()
{
    AI_Output (other, self ,"DIA_Gamal_HELLO_OK_15_01"); //Mów dalej...
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_02"); //Otó¿ mogê ci pomóc dostaæ siê do Obozu bez przechodzenia g³upich testów.
    AI_Output (other, self ,"DIA_Gamal_HELLO_OK_15_03"); //Ech... Nie rozumiem.
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_04"); //Zapomnia³em, ¿e nie zosta³eœ wtajemniczony.
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_05"); //Zaraz ci wszystko wyjaœniê...
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_06"); //Ka¿dy, kto chce przy³¹czyæ siê do Starego Obozu, musi wykonaæ kilka zadañ.
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_07"); //Zdobycie zaufania w Obozie, specjalny test i tak dalej...
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_08"); //Ja oferujê ci zostanie Kopaczem. Bêdziesz powoli wspina³ siê po drabinie spo³ecznej...
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_09"); //...a¿ któregoœ dnia zostaniesz Cieniem.
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_10"); //Co ty na to?
    AI_Output (other, self ,"DIA_Gamal_HELLO_OK_15_11"); //Musi tu byæ jakiœ haczyk.
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_12"); //Jest jedna ma³a rzecz...
	AI_Output (other, self ,"DIA_Gamal_HELLO_OK_15_13"); //Jaka?
	AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_14"); //Wóz, albo przewóz. JEŒLI ZDECYDUJESZ SIÊ PÓJŒÆ ZE MN¥, ZOSTANÊ TWOIM OPIEKUNEM, A DIEGO JU¯ CI NIE POMO¯E ZOSTAÆ CIENIEM.
	AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_15"); //Równie¿ Cienie nie bêd¹ ci tak chêtnie zlecaæ zadañ. Po prostu nie przepadaj¹ za robotnikami...
	AI_Output (other, self ,"DIA_Gamal_HELLO_OK_15_16"); //Czyli mam tyraæ pod ziemi¹ dzieñ i noc nie maj¹c nic w zamian? Czy jakakolwiek droga awansu bêdzie zablokowana?!
	AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_17"); //Oczywiœcie, ¿e NIE! Po prostu jak ju¿ uda ci siê wyjœæ z Kopalni bêdziesz musia³ sobie inaczej poradziæ. 
	AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_18"); //S³ysza³em, ¿e raz jakiœ Kopacz chcia³ zostaæ Cieniem. Za³atwi³ sobie przepustkê do Obozu, porozmawia³ z Diego, a ten wys³a³ go do Cavalorna. 
	AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_19"); //Nie wiem, co u niego robi³, ale kilka dni póŸniej mia³ ju¿ na sobie strój Cienia. Tak¿e myœlê, ¿e warto spróbowaæ.
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_20"); //Powiedz mi: czy nie lepiej jest pous³ugiwaæ trochê Stra¿nikom i wykopaæ nieco rudy ni¿ chodziæ nie wiadomo gdzie i obrabiaæ dupê starym wygom?
    AI_Output (self, other ,"DIA_Gamal_HELLO_OK_03_21"); //Zadania, które zlec¹ ci Cienie mog¹ byæ œmiertelnie niebezpieczne. Przemyœl to!	
    Info_ClearChoices		(DIA_Gamal_HELLO);
	//GoToOM = true;
	pogadajgamal = true; //do dialogu
};

//========================================
//-----------------> WENT
//========================================

INSTANCE DIA_Gamal_WENT (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 2;
   condition    = DIA_Gamal_WENT_Condition;
   information  = DIA_Gamal_WENT_Info;
   permanent	= FALSE;
   description	= "ZaprowadŸ mnie do Starej Kopalni. (PAMIÊTAJ O KONSEKWENCJACH!)";
};

FUNC INT DIA_Gamal_WENT_Condition()
{
    if (pogadajgamal == true)
    && (Npc_GetTrueGuild (hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gamal_WENT_Info()
{
    AI_Output (other, self ,"DIA_Gamal_WENT_15_01"); //ZaprowadŸ mnie do Starej Kopalni.
    AI_Output (self, other ,"DIA_Gamal_WENT_03_02"); //ChodŸ za mn¹, tylko uwa¿aj na dzikie zwierzêta!
    AI_Output (self, other ,"DIA_Gamal_WENT_03_03"); //Resztê wyjaœniê ci na miejscu.
	//dzielenie xp
    self.aivar[AIV_PARTYMEMBER] = TRUE;
	//przyjazne nastawienie
	self.Npctype = NPCTYPE_FRIEND;
	B_SetPermAttitude	(self,	ATT_FRIENDLY);
	//rutyna
    Npc_ExchangeRoutine (self,"went");
	//wyjœcie
    AI_StopProcessInfos	(self);
	//logi
    MIS_EasyJoinOC = LOG_RUNNING; //uwaga, ta zmienna blokuje wiele dialogów
	//wpisy
    Log_CreateTopic          (CH1_EasyJoinOC, LOG_MISSION);
    Log_SetTopicStatus       (CH1_EasyJoinOC, LOG_RUNNING);
    B_LogEntry               (CH1_EasyJoinOC,"Gamal zaproponowa³ mi, ¿e zaprowadzi mnie do Starej Kopalni. Tam dowiem siê jak zostaæ Kopaczem i do³¹czyæ do Starego Obozu. Zobaczê, co mnie tam czeka.");
};

// ************************************************************
// 							Gamal = Lehrer
// ************************************************************
	var int Gamal_Merke_STR;
	var int Gamal_Merke_DEX;
	var int log_Gamaltrain;
// ************************************************************

INSTANCE Info_Gamal_Teach(C_INFO)
{
	npc			= GRD_7004_Gamal;
	nr			= 100;
	condition	= Info_Gamal_Teach_Condition;
	information	= Info_Gamal_Teach_Info;
	permanent	= 1;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       

FUNC INT Info_Gamal_Teach_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Gamal_DOTARLISMY) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Gamal_Teach_Info()
{	
	if	(log_Gamaltrain == FALSE)
	{	
		Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
		B_LogEntry		(GE_TeacherOW,	"Gamal mo¿e mi pomóc w zwiêkszeniu mojej zwinnoœci i si³y.");
		log_Gamaltrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Gamal_Teach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,hero,"Info_Gamal_Teach_11_01"); //Tak. Mogê ci pokazaæ, jak zwiêkszyæ swoj¹ si³ê lub zrêcznoœæ.
	
	Gamal_Merke_STR = hero.attribute[ATR_STRENGTH];
	Gamal_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Gamal_Teach);
	Info_AddChoice		(Info_Gamal_Teach,DIALOG_BACK									,Info_Gamal_Teach_BACK);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_1);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_1);
	
	
};

func void Info_Gamal_Teach_BACK()
{
	if (Gamal_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Gamal_Teach_BACK_11_00"); //Jesteœ teraz o wiele silniejszy.
	};
	if (Gamal_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Gamal_Teach_BACK_11_01"); //Umiesz teraz sprawniej pos³ugiwaæ siê ³ukiem i kusz¹.
	};
	AI_Output(self,hero,"Info_Gamal_Teach_BACK_11_02"); //Wróæ nied³ugo. Musisz siê jeszcze wiele nauczyæ.
	Info_ClearChoices	(Info_Gamal_Teach);
};

func void Info_Gamal_Teach_STR_1()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(Info_Gamal_Teach);
	Info_AddChoice		(Info_Gamal_Teach,DIALOG_BACK									,Info_Gamal_Teach_BACK);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_1);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_1);
};

func void Info_Gamal_Teach_STR_5()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
	Info_ClearChoices	(Info_Gamal_Teach);
	Info_AddChoice		(Info_Gamal_Teach,DIALOG_BACK									,Info_Gamal_Teach_BACK);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_1);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_1);
};

func void Info_Gamal_Teach_DEX_1()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(Info_Gamal_Teach);
	Info_AddChoice		(Info_Gamal_Teach,DIALOG_BACK									,Info_Gamal_Teach_BACK);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_1);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_1);
};

func void Info_Gamal_Teach_DEX_5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(Info_Gamal_Teach);
	Info_AddChoice		(Info_Gamal_Teach,DIALOG_BACK									,Info_Gamal_Teach_BACK);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Gamal_Teach_STR_1);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_5);
	Info_AddChoice		(Info_Gamal_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Gamal_Teach_DEX_1);
};


//========================================
//-----------------> KOPALNIA
//========================================

INSTANCE DIA_Gamal_KOPALNIA (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 4;
   condition    = DIA_Gamal_KOPALNIA_Condition;
   information  = DIA_Gamal_KOPALNIA_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o Starej Kopalni";
};

FUNC INT DIA_Gamal_KOPALNIA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gamal_DOTARLISMY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gamal_KOPALNIA_Info()
{
    AI_Output (other, self ,"DIA_Gamal_KOPALNIA_15_01"); //Opowiedz mi o Starej Kopalni.
    AI_Output (self, other ,"DIA_Gamal_KOPALNIA_03_02"); //To tutaj wydobywana jest magiczna ruda. Pod w³adz¹ Gomeza znajduj¹ siê najwiêksze jej z³o¿a w Kolonii.
    AI_Output (other, self ,"DIA_Gamal_KOPALNIA_15_03"); //S¹ jakieœ inne?
    AI_Output (self, other ,"DIA_Gamal_KOPALNIA_03_04"); //Tak. Wolna Kopalnia nale¿¹ca do Magów Wody. Rezyduj¹ w Nowym Obozie.
};

//========================================
//-----------------> PAPU
//========================================

INSTANCE DIA_Gamal_PAPU (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 5;
   condition    = DIA_Gamal_PAPU_Condition;
   information  = DIA_Gamal_PAPU_Info;
   permanent	= FALSE;
   description	= "Gdzie dostanê coœ do jedzenia?";
};

FUNC INT DIA_Gamal_PAPU_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gamal_DOTARLISMY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gamal_PAPU_Info()
{
    AI_Output (other, self ,"DIA_Gamal_PAPU_15_01"); //Gdzie dostanê coœ do jedzenia?
    AI_Output (self, other ,"DIA_Gamal_PAPU_03_02"); //Porozmawiaj z naszym obozowym kucharzem.
    AI_Output (self, other ,"DIA_Gamal_PAPU_03_03"); //Stoi tam, przy kotle.
};


*/