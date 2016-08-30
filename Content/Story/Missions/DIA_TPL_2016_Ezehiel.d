//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Ezehiel_EXIT(C_INFO)
{
	npc             = TPL_3054_Ezehiel;
	nr              = 999;
	condition	= DIA_Ezehiel_EXIT_Condition;
	information	= DIA_Ezehiel_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Ezehiel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ezehiel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> VERY_IMPORTANT
//========================================

INSTANCE DIA_Ezehiel_VERY_IMPORTANT (C_INFO)
{
   npc          = TPL_3054_Ezehiel;
   nr           = 1;
   condition    = DIA_Ezehiel_VERY_IMPORTANT_Condition;
   information  = DIA_Ezehiel_VERY_IMPORTANT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ezehiel_VERY_IMPORTANT_Condition()
{
    if (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ezehiel_VERY_IMPORTANT_Info()
{
    AI_Output (self, other ,"DIA_Ezehiel_VERY_IMPORTANT_03_01"); //Zaczekaj. Mam wa¿n¹ wiadomoœæ z Bractwa.
    AI_Output (other, self ,"DIA_Ezehiel_VERY_IMPORTANT_15_02"); //Co jest?
    AI_Output (self, other ,"DIA_Ezehiel_VERY_IMPORTANT_03_03"); //Shawn chce ciê pilnie widzieæ. Ma dla ciebie zadanie.
    MIS_Watek_Bandytow_BRACTWO = LOG_RUNNING;

    Log_CreateTopic            (CH1_Watek_Bandytow_BRACTWO, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Watek_Bandytow_BRACTWO, LOG_RUNNING);
    B_LogEntry                     (CH1_Watek_Bandytow_BRACTWO,"Mam jak najszybciej udaæ siê do Shawna. Mogê skorzystaæ z mojej runy teleportacji do Bractwa.");
    AI_StopProcessInfos	(self);
};