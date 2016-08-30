//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Bofur_EXIT(C_INFO)
{
	npc             = ORG_956_Bofur;
	nr              = 999;
	condition	= DIA_Bofur_EXIT_Condition;
	information	= DIA_Bofur_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Bofur_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bofur_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> THIEFF
//========================================

INSTANCE DIA_Bofur_THIEFF (C_INFO)
{
   npc          = ORG_956_Bofur;
   nr           = 1;
   condition    = DIA_Bofur_THIEFF_Condition;
   information  = DIA_Bofur_THIEFF_Info;
   permanent	= FALSE;
   description	= "No proszê, co za wspania³a kryjówka.";
};

FUNC INT DIA_Bofur_THIEFF_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_KRADZIEZ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bofur_THIEFF_Info()
{
    AI_Output (other, self ,"DIA_Bofur_THIEFF_15_01"); //No proszê, co za wspania³a kryjówka. Myœla³eœ, ¿e jak wejdziesz za wodospad, to znikniesz w tajemniczych okolicznoœciach?
    AI_Output (self, other ,"DIA_Bofur_THIEFF_03_02"); //Nie, mam od tego zwoje koleœ. Mogê siê przenieœæ, gdzie mi siê podoba.
    AI_Output (other, self ,"DIA_Bofur_THIEFF_15_03"); //Hmm, a mo¿e ukrywasz siê przed Cronosem?
    AI_Output (self, other ,"DIA_Bofur_THIEFF_03_04"); //Wiêc on ciê tu przys³a³? W takim razie giñ!
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};