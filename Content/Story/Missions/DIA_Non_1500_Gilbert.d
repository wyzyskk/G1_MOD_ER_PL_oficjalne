//poprawione i sprawdzone - Nocturn

// ********************************
// 				EXIT
// ********************************

instance DIA_Gilbert_EXIT (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 999;
	condition	= DIA_Gilbert_EXIT_Condition;
	information	= DIA_Gilbert_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Gilbert_First (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_First_Condition;
	information	= DIA_Gilbert_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Gilbert_First_Condition()
{
	if (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_First_Info()
{
	AI_Output (self, other,"DIA_Gilbert_First_04_00"); //Co tu robisz? Nie miewam tu zbyt czêsto goœci, he he!
	AI_Output (self, other,"DIA_Gilbert_First_04_01"); //Widzê, ¿e niez³y cwaniak z ciebie. Tak znaleŸæ moj¹ kryjówkê, no no!
	
	B_GiveXP(XP_GilbertFound);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Gilbert_Hallo (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_Hallo_Condition;
	information	= DIA_Gilbert_Hallo_Info;
	permanent	= 0;
	description = "Co tu robisz?";
};                       

FUNC int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Hallo_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_01"); //Mia³em ju¿ doœæ Starego Obozu. Podpad³em paru ludziom Gomeza. To by³o dawno temu.
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_02"); //Teraz pewnie nikt ju¿ o mnie nie pamiêta, ale ja siê st¹d nie ruszam. Jak na mój gust - w Starym Obozie wci¹¿ jest za du¿o têpych osi³ków.
};


//========================================
//-----------------> GoToTondral
//========================================

INSTANCE DIA_Gilbert_GoToTondral (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_GoToTondral_Condition;
   information  = DIA_Gilbert_GoToTondral_Info;
   permanent	= FALSE;
   description	= "Mo¿e chcesz pójœæ ze mn¹ do Bractwa?";
};

FUNC INT DIA_Gilbert_GoToTondral_Condition()
{
    if (BaalTondral_GetNewGuy == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Gilbert_Hallo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_GoToTondral_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_GoToTondral_15_01"); //Mo¿e chcesz pójœæ ze mn¹ do Bractwa?
    AI_Output (self, other ,"DIA_Gilbert_GoToTondral_03_02"); //Czemu nie? Chyba czas ju¿ coœ zmieniæ w swoim ¿yciu.
    AI_Output (self, other ,"DIA_Gilbert_GoToTondral_03_03"); //Rozumiem, ¿e mnie tam zaprowadzisz.
    AI_Output (other, self ,"DIA_Gilbert_GoToTondral_15_04"); //Jasne. Dam ci znak, gdy bêdê gotowy.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Gilbert_HELLO2 (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 2;
   condition    = DIA_Gilbert_HELLO2_Condition;
   information  = DIA_Gilbert_HELLO2_Info;
   permanent	= FALSE;
   description	= "Ruszajmy.";
};

FUNC INT DIA_Gilbert_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_GoToTondral))
    && (BaalTondral_GetNewGuy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_HELLO2_15_01"); //Ruszajmy.
    AI_Output (self, other ,"DIA_Gilbert_HELLO2_03_02"); //Dobrze. Tylko uwa¿aj na ska³y.
    	self.flags = NPC_FLAG_IMMORTAL;
self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self, "FOLLOW");
    B_LogEntry                     (CH1_RecruitDusty,"Postanowi³em, ¿e zaprowadzê Gilberta do Bractwa.");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Kobieta
//========================================

INSTANCE DIA_Gilbert_Kobieta (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_Kobieta_Condition;
   information  = DIA_Gilbert_Kobieta_Info;
   permanent	= FALSE;
   description	= "Co robi kobieta w twojej jaskini?";
};

FUNC INT DIA_Gilbert_Kobieta_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gilbert_Kobieta_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_Kobieta_15_01"); //Co robi kobieta w twojej jaskini?
    AI_Output (self, other ,"DIA_Gilbert_Kobieta_03_02"); //Uciek³a ze Starego Obozu. Spotka³em j¹ w okolicy. B³¹ka³a siê, szukaj¹c schronienia.
    AI_Output (other, self ,"DIA_Gilbert_Kobieta_15_03"); //Chyba nie jest zbyt rozmowna. 
    AI_Output (self, other ,"DIA_Gilbert_Kobieta_03_04"); //To tylko pozory. Jest dosyæ pyskata, jak siê oswoi. 
};

//========================================
//-----------------> Halasy
//========================================

INSTANCE DIA_Gilbert_Halasy (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 2;
   condition    = DIA_Gilbert_Halasy_Condition;
   information  = DIA_Gilbert_Halasy_Info;
   permanent	= FALSE;
   description	= "Byliœcie ostatnio strasznie g³oœno.";
};

FUNC INT DIA_Gilbert_Halasy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_ThiefInCamp))
    && (!Npc_KnowsInfo (hero, DIA_Gilbert_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_Halasy_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_Halasy_15_01"); //Byliœcie ostatnio strasznie g³oœno.
    AI_Output (self, other ,"DIA_Gilbert_Halasy_03_02"); //Co? O co ci chodzi? 
    AI_Output (other, self ,"DIA_Gilbert_Halasy_15_03"); //O nic. Po prostu widzê, ¿e dobrze siê trzymasz, staruszku.
    AI_Output (self, other ,"DIA_Gilbert_Halasy_03_04"); //Nie rozumiem.
	B_giveXP (100);
};

//========================================
//-----------------> BANG
//========================================

INSTANCE DIA_Gilbert_BANG (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_BANG_Condition;
   information  = DIA_Gilbert_BANG_Info;
   permanent	= FALSE;
   description	= "Podobno zrêczny z ciebie goœæ.";
};

FUNC INT DIA_Gilbert_BANG_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_osko_WhoJu))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_BANG_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_01"); //Podobno zrêczny z ciebie goœæ.
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_02"); //Hmm? Szukasz nauczyciela z³odziejskich sztuczek? Nie pomogê ci. Nie znam siê na tym.
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_03"); //Nie o to mi chodzi. Jeden z ³owców orków stwierdzi³, ¿e potrafisz sprawnie poruszaæ siê po ska³ach.
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_04"); //Nie ukrywam, ¿e to ciekawa umeijêtnoœæ.
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_05"); //O to chodzi. Tak, znam siê trochê na tych sprawach. Potrafiê sprawnie balansowaæ cia³em.
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_06"); //Mogê ciê tego nauczyæ, jednak bêdziesz musia³ mi coœ przynieœæ.
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_07"); //Czego potrzebujesz? 
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_08"); //Marzê o zjedzeniu solidnego kawa³ka szynki. Móg³byœ podwêdziæ dla mnie co nieco ze Starego Obozu?
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_09"); //Mogê spróbowaæ. 
};

//========================================
//-----------------> MEAT
//========================================

INSTANCE DIA_Gilbert_MEAT (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 2;
   condition    = DIA_Gilbert_MEAT_Condition;
   information  = DIA_Gilbert_MEAT_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie kawa³ek szynki.";
};

FUNC INT DIA_Gilbert_MEAT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_BANG))
    && (Npc_HasItems (other, ItFo_mutton_01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_MEAT_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_MEAT_15_01"); //Mam dla ciebie kawa³ek szynki.
    B_GiveInvItems (other, self, ItFo_mutton_01, 1);
    AI_Output (self, other ,"DIA_Gilbert_MEAT_03_02"); //Dziêkujê. Ach... cudowny zapach. Teraz mogê ciê uczyæ.
    B_LogEntry		(GE_TeacherOW,"Gilbert mo¿e mnie uczyæ akrobatyki, poniewa¿ przynios³em mu kawa³ek szynki, o który mnie prosi³.");
	B_GiveXP (50);
};

//========================================
//-----------------> TEACH
//========================================

INSTANCE DIA_Gilbert_TEACH (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 3;
   condition    = DIA_Gilbert_TEACH_Condition;
   information  = DIA_Gilbert_TEACH_Info;
   permanent	= 1;
   description	= B_BuildLearnString(NAME_LearnAcrobat, LPCOST_TALENT_ACROBAT,0);
};

FUNC INT DIA_Gilbert_TEACH_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_MEAT))
    && (Npc_GetTalentSkill(other, NPC_TALENT_ACROBAT) == 0)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_TEACH_Info()
{
	if (B_GiveSkill(other,NPC_TALENT_ACROBAT , 1, LPCOST_TALENT_ACROBAT))
	{
    AI_Output (other, self ,"DIA_Gilbert_TEACH_15_01"); //Naucz mnie akrobatyki. 
    AI_Output (self, other ,"DIA_Gilbert_TEACH_03_02"); //Jeœli bêdziesz odpowiednio balansowa³ cia³em, unikniesz upadku podczas wspinaczki.
    AI_Output (self, other ,"DIA_Gilbert_TEACH_03_03"); //Pamiêtaj, ¿eby dok³adnie obserwowaæ drogê po której chcesz siê wspinaæ. Zwracaj uwagê na s³absze fragmenty ska³, które mog¹ odpaœæ.
    AI_Output (self, other ,"DIA_Gilbert_TEACH_03_04"); //Nie ka¿dy fragment skalny jest w stanie wytrzymaæ twój ciê¿ar. 
	};		
};
