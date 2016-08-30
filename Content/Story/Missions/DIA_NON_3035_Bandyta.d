// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Bandyta3_EXIT(C_INFO)
{
	npc             = NON_3035_Bandyta;
	nr              = 999;
	condition	= DIA_Bandyta35_EXIT_Condition;
	information	= DIA_Bandyta35_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Bandyta35_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bandyta35_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Bandyta35_HELLO1 (C_INFO)
{
   npc          = NON_3035_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta35_HELLO1_Condition;
   information  = DIA_Bandyta35_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bandyta35_HELLO1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_MineIsClean))
      {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta35_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_01"); //Widzê, ¿e wróci³eœ do kopalni. 
    if  (MIS_MineChlopy == LOG_RUNNING)
    {
        AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_02"); //Wci¹¿, ¿e nie mamy nikogo, kto zaprowadzi³by tutaj porz¹dek. Teoretycznie dowodzê t¹ grup¹, ale nie znam siê na kopalniach.
        AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_03"); //Nie wiem jak to zorganizowaæ.
        AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_04"); //Pospiesz siê z tym szukaniem pomocy. To musi byæ ktoœ doœwiadczony. Jakiœ stary Kopacz.
    }
    else if (MIS_MineChlopy == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_05"); //Dobrze, ¿e sprowadzi³eœ tutaj Guya. Ten goœæ ma jaja i wie co robiæ. 
        AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_06"); //Ja niezbyt znam siê na kopalniach.
		AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_07"); //Aha, mam dla ciebie ma³¹ robótkê. Tu, w kopalni. 
		AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_08"); //Jak bêdziesz mia³ chwilê, to daj znaæ. 
    };
    
    AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_09"); //Jeszcze jedno... Uwa¿aj na jednego Bandytê. Wo³aj¹ na niego Bicz. 
    AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_10"); //Jest na ciebie nieŸle wkurzony. Nie pasuje mu praca w kopalni. 
    AI_Output (self, other ,"DIA_BANDYTA35_HELLO1_03_11"); //Podobno goœæ ma ciê¿k¹ rêkê.
};

//========================================
//-----------------> WORK
//========================================

INSTANCE DIA_Bandyta_WORK (C_INFO)
{
   npc          = NON_3035_Bandyta;
   nr           = 2;
   condition    = DIA_Bandyta_WORK_Condition;
   information  = DIA_Bandyta_WORK_Info;
   permanent	= FALSE;
   description	= "Jaka robota?";
};

FUNC INT DIA_Bandyta_WORK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BANDYTA35_HELLO1)) && (MIS_MineChlopy == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_WORK_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_WORK_15_01"); //Jaka robota?
    AI_Output (self, other ,"DIA_Bandyta_WORK_03_02"); //W jednej z chat znajduje siê nieŸle zabezpieczona skrzynia. Myœlê, ¿e nale¿y do przywódcy kopalni.
    AI_Output (self, other ,"DIA_Bandyta_WORK_03_03"); //Próbowa³em, j¹ otworzyæ, ale z³ama³em piêæ wytrychów. 
    AI_Output (self, other ,"DIA_Bandyta_WORK_03_04"); //Dam ci kilka wytrychów i powiem jak zacz¹æ otwieranie, a ty spróbujesz z³amaæ szyfr.
    AI_Output (self, other ,"DIA_Bandyta_WORK_03_05"); //Co ty na to?
    AI_Output (self, other ,"DIA_Bandyta_WORK_03_06"); //Znaleziskami podzielimy siê po po³owie.
    AI_Output (other, self ,"DIA_Bandyta_WORK_15_07"); //Dobra. Pomogê ci.
    AI_Output (self, other ,"DIA_Bandyta_WORK_03_08"); //ChodŸ za mn¹. Zaprowadzê ciê.
    Npc_ExchangeRoutine (self, "guide");
    MIS_SzyfrWKopalni = LOG_RUNNING;

    Log_CreateTopic            (CH1_SzyfrWKopalni, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SzyfrWKopalni, LOG_RUNNING);
    B_LogEntry                     (CH1_SzyfrWKopalni,"Luis chce, ¿ebym pomóg³ mu z³amaæ szyfr w jednej ze skrzyñ w Opuszczonej Kopalni. Otrzymam wytrychy i pocz¹tek szyfru.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NAMIEJSCU
//========================================

INSTANCE DIA_Bandyta_NAMIEJSCU (C_INFO)
{
   npc          = NON_3035_Bandyta;
   nr           = 3;
   condition    = DIA_Bandyta_NAMIEJSCU_Condition;
   information  = DIA_Bandyta_NAMIEJSCU_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bandyta_NAMIEJSCU_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_WORK))
    && (Npc_GetDistToWP (self, "SKRZYNIA_SZEFA_KOPALNI") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_NAMIEJSCU_Info()
{
    AI_Output (self, other ,"DIA_Bandyta_NAMIEJSCU_03_01"); //Dobra. To tutaj. Teraz tak... masz te wytrychy.
    AI_Output (self, other ,"DIA_Bandyta_NAMIEJSCU_03_02"); //Szyfr zaczyna siê tak: lewo, lewo, prawo, lewo... dalej próbuj sam.
    CreateInvItems (self, ItKeLockpick, 10);
    B_GiveInvItems (self, other, ItKeLockpick, 10);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> ZAKONCZONE
//========================================

INSTANCE DIA_Bandyta_ZAKONCZONE (C_INFO)
{
   npc          = NON_3035_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_ZAKONCZONE_Condition;
   information  = DIA_Bandyta_ZAKONCZONE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bandyta_ZAKONCZONE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_NAMIEJSCU))
    && (Npc_GetDistToWP (self, "SKRZYNIA_SZEFA_KOPALNI") < 1000)
    && (Npc_HasItems (other, ItWr_RejestrWydobycia) >=1)
    && (Npc_HasItems (other, ItMis_PamietnikGrimesa4) >=1)
    && (Npc_HasItems (other, ItMw_2H_Sword_Light_02) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_ZAKONCZONE_Info()
{
    AI_Output (self, other ,"DIA_Bandyta_ZAKONCZONE_03_01"); //Dobra robota!
    AI_Output (self, other ,"DIA_Bandyta_ZAKONCZONE_03_02"); //Co my tu mamy? Hmm. Widzê jakiœ pamiêtnik i notatki. 
    AI_Output (self, other ,"DIA_Bandyta_ZAKONCZONE_03_03"); //Zanieœ je do Guya. Mog¹ mu siê przydaæ. Mi daj ten miecz. Wygl¹da fajnie, przypomina broñ Stra¿ników ze Starego Obozu. 
    AI_Output (self, other ,"DIA_Bandyta_ZAKONCZONE_03_04"); //Resztê mo¿esz zachowaæ.
    B_LogEntry                     (CH1_SzyfrWKopalni,"Otworzy³em zamek. W skrzyni znalaz³em stare notatki, miecz nadzorcy i trochê rudy. Luis zabra³ miecz, pamiêtniki mam przekazaæ Guyowi, a dla mnie zostaje ruda.");
    Log_SetTopicStatus       (CH1_SzyfrWKopalni, LOG_SUCCESS);
    MIS_SzyfrWKopalni = LOG_SUCCESS;

    B_GiveXP (500);
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
};


