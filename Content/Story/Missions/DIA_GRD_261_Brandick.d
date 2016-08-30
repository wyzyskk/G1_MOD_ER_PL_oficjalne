//poprawione i sprawdzone - Nocturn

// ************************ EXIT **************************

instance  GRD_261_Brandick_Exit (C_INFO)
{
	npc			=  GRD_261_Brandick;
	nr			= 999;
	condition	=  GRD_261_Brandick_Exit_Condition;
	information	=  GRD_261_Brandick_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  GRD_261_Brandick_Exit_Condition()
{
	return 1;
};

FUNC VOID  GRD_261_Brandick_Exit_Info()
{
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  GRD_261_Brandick_ALEPH (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_ALEPH_Condition;
	information		= GRD_261_Brandick_ALEPH_Info;
	important		= 0;
	permanent		= 0;
	description		= "(Wydaj Alepha)"; 
};

FUNC int  GRD_261_Brandick_ALEPH_Condition()
{	
	if ( Npc_KnowsInfo ( hero, VLK_585_Aleph_GUARDS) )
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_ALEPH_Info()
{
	AI_Output			(other, self,"GRD_261_Brandick_ALEPH_Info_15_01"); //S³uchaj, za ka¿dym razem, kiedy siê odwracasz, Aleph siedzi bezczynnie i zbija b¹ki.
	AI_Output			(self, other,"GRD_261_Brandick_ALEPH_Info_06_02"); //Czy¿by?
	AI_Output			(self, other,"GRD_261_Brandick_ALEPH_Info_06_03"); //Wiesz jakich ludzi nienawidzê jeszcze bardziej od obiboków? Donosicieli! ZejdŸ mi z oczu!
	
	AI_StopProcessInfos	(self);
};  

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_brandick_HELLO1 (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 1;
   condition    = DIA_brandick_HELLO1_Condition;
   information  = DIA_brandick_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_brandick_HELLO1_Condition()
{
//po co?
   // if (Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH))
   //{
    //return TRUE;
    //};]
	if (kapitel < 4) 
	{
    return TRUE; 
	};
};



FUNC VOID DIA_brandick_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_brandick_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_02"); //Brandick. Pilnujê porz¹dku w Kopalni i dbam o to, ¿eby nasi ludzie siê nie obijali. Masz jakiœ problem?
	AI_Output (other, self ,"DIA_brandick_HELLO1_15_03"); //Nie, a ty?
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_04"); //Ca³¹ masê problemów. W bocznych szybach roi siê od pe³zaczy i trolli ziemnych. Te skurwiele potrafi¹ napsuæ nerwów. 
    AI_Output (other, self ,"DIA_brandick_HELLO1_15_05"); //Trolle ziemne? Myœla³em, ¿e trolle nie ¿yj¹ pod ziemi¹, tylko w górach.
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_06"); //Zwyk³e i czarne trolle jak najbardziej. Jednak ziemne trolle nieco siê ró¿ni¹ od swych pobratymców.
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_07"); //S¹ mniejszej postury i lubi¹ ciemnoœci. Jak bêdziesz mia³ pecha, to spotkasz jakiegoœ w jaskini na powierzchni. 
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_08"); //To, ¿e s¹ mniejsze, nie czyni ich jednak mniej niebezpiecznymi.
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_09"); //Jakiœ czas temu grupa Œwi¹tynnych Stra¿ników wybra³a siê, ¿eby trochê zredukowaæ liczbê tego ta³atajstwa. 
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_10"); //To, co z nich zosta³o nie nadawa³o siê nawet na nawóz, he he. Chyba przecenili swoje si³y.
};

//========================================
//-----------------> OldTownsman
//========================================

INSTANCE DIA_Brandick_OldTownsman (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 1;
   condition    = DIA_Brandick_OldTownsman_Condition;
   information  = DIA_Brandick_OldTownsman_Info;
   permanent	= FALSE;
   description	= "Podobno kiedyœ do Kopalni trafi³ pewien zamo¿ny mieszczanin.";
};

FUNC INT DIA_Brandick_OldTownsman_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Fingers_FingersStayAlive))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Brandick_OldTownsman_Info()
{
    AI_Output (other, self ,"DIA_Brandick_OldTownsman_15_01"); //Podobno kiedyœ do Kopalni trafi³ pewien zamo¿ny mieszczanin.
    AI_Output (self, other ,"DIA_Brandick_OldTownsman_03_02"); //Trafi³o tu naprawdê wielu, od gwa³cicieli, przez z³odziei, a¿ po kleryka³ów, którym nagle siê coœ odwidzia³o.
    AI_Output (self, other ,"DIA_Brandick_OldTownsman_03_03"); //Nie sposób wszystkich spamiêtaæ. O kogo konkretnie ci chodzi? 
    AI_Output (other, self ,"DIA_Brandick_OldTownsman_15_04"); //Ponoæ goœæ sfinansowa³ zakup pewnego okrêtu, a póŸniej okaza³o siê, ¿e jego fortuna to jeden wielki przekrêt.
    AI_Output (self, other ,"DIA_Brandick_OldTownsman_03_05"); //Ha ha ha. Chodzi ci pewnie o Hrabiego Robena. Kawa³ gnoja z niego, ale nie widzia³em go ju¿ jakiœ czas.
    AI_Output (self, other ,"DIA_Brandick_OldTownsman_03_06"); //Nie wiem nawet czy ¿yje. Kilka razy próbowa³ uciekaæ, nie chcia³ pracowaæ, podburza³ za³ogê... 
    AI_Output (self, other ,"DIA_Brandick_OldTownsman_03_07"); //Jak chcesz poznaæ jakieœ szczegó³y to zapytaj lepiej Asghana. On jest tu wystarczaj¹co d³ugo.
    AI_Output (self, other ,"DIA_Brandick_OldTownsman_03_08"); //Gdy zrzucali tu Robena ja dopiero zaczyna³em s³u¿bê i mia³em wa¿niejsze sprawy na g³owie.
};



//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_brandick_HELLO2 (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 2;
   condition    = DIA_brandick_HELLO2_Condition;
   information  = DIA_brandick_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_brandick_HELLO2_Condition()
{
if (kapitel < 4) {
    return TRUE; };
};

FUNC VOID DIA_brandick_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_brandick_HELLO2_15_01"); //Jak leci?
    if (!Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH))
    {
        AI_Output (self, other ,"DIA_brandick_HELLO2_03_02"); //S³yszysz? Tam na dole, w dziurze czaj¹ siê pe³zacze. Mam nadziejê, ¿e nie towarzysz¹ im ziemne trolle...
    }
    else
    {
        AI_Output (self, other ,"DIA_brandick_HELLO2_03_03"); //Gówno ciê to obchodzi. Powiedzia³em, ¿e nie tolerujê donosicieli! Spadaj st¹d darmozjadzie!
    
    AI_StopProcessInfos	(self);
};
};

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Brandick_DIE (C_INFO)
{
	npc			= GRD_261_Brandick;
	condition	= Info_Brandick_DIE_Condition;
	information	= Info_Brandick_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Brandick_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Brandick_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Zdrajco! I pomyœleæ, ¿e uwa¿aliœmy ciê za jednego z nas!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //To jeden z tych zdradzieckich Magów Ognia!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Witaj, ZDRAJCO! Teraz nie pomog¹ ci nawet znajomoœci wœród Cieni!
		};			

		AI_Output		(hero,self,"Info_Brandick_DIE_15_04"); //O czym ty do diab³a mówisz, Brandick?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Zadajesz siê z tymi bandziorami z Nowego Obozu! A mo¿e nie?!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Zaczekaj...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //Myœla³eœ, ¿e siê nie domyœlimy, co? CO?!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //Hej... Postrada³eœ zmys³y?!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Ja? Ale¿ sk¹d. Za to TY za chwilê stracisz G£OWÊ, kolego.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //GIÑ, ZDRAJCO!!!

		if	Npc_KnowsInfo(hero, Info_aaron_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,	"Aaron okopa³ siê przy tylnej bramie. Na mój widok zareagowa³ podobnie jak Brandick. Mam wra¿enie, ¿e ma to coœ wspólnego z moimi poszukiwaniami kamienia ogniskuj¹cego dla Nowego Obozu.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,	"Brandick, który strze¿e teraz g³ównej bramy Starego Obozu, nazwa³ mnie zdrajc¹. Nie chcia³ mnie nawet wys³uchaæ - od razu rzuci³ siê do ataku!");
			B_LogEntry			(CH4_BannedFromOC,	"Wygl¹da na to, ¿e zosta³em wygnany ze Starego Obozu!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //No proszê. To goœæ z Nowego Obozu!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Patrzcie no. To goœæ z Sekty!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //I co z tego? Masz z tym jakiœ problem?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //Mieæ, to ja bêdê wasz¹ ma³¹ kopalniê!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Czy¿by? Chyba œnisz!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Przykro mi, ale nie mo¿emy pozwoliæ, ¿ebyœ o tym komuœ powiedzia³!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Zaczekaj, nie szukam k³opotów.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Trzeba by³o o tym pomyœleæ zanim tutaj przyszed³eœ!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Hej, co u...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Dalej ch³opcy! Na niego!
	};

	Npc_ExchangeRoutine	(self,	"FMTAKEN2");				// Verstärkung vor das Haupttor (Anführer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor

	B_SetPermAttitude	(GRD_261_Brandick,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_aaron_DIE)
	{
		B_LogEntry		(CH4_Firemages,	"Bramy do Starego Obozu zosta³y zamkniête i pozostaj¹ pilnie strze¿one. Stra¿nicy atakuj¹ ka¿dego, kto podejdzie w pobli¿e Obozu.");
	};
	
	AI_StopProcessInfos	(self);
};