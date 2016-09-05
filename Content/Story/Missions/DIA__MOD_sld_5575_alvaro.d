//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_alvaro_EXIT(C_INFO)
{
	npc             = sld_5575_alvaro;
	nr              = 999;
	condition	= DIA_alvaro_EXIT_Condition;
	information	= DIA_alvaro_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_alvaro_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_alvaro_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_alvaro_Hello (C_INFO)
{
   npc          = sld_5575_alvaro ;
   nr           = 1;
   condition    = DIA_alvaro_Hello_Condition;
   information  = DIA_alvaro_Hello_Info;
   permanent	= FALSE;
   description	= "Wszystko w porz¹dku? ";
};

FUNC INT DIA_alvaro_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_alvaro_Hello_Info()
{
    AI_Output (other, self ,"DIA_alvaro_Hello_15_01"); //Wszystko w porz¹dku? 
    AI_Output (self, other ,"DIA_alvaro_Hello_03_02"); //A ty coœ za jeden?
    AI_Output (other, self ,"DIA_alvaro_Hello_15_03"); //Trafi³em tu niedawno. 
    AI_Output (self, other ,"DIA_alvaro_Hello_03_04"); //No to mnie nie wkurzaj. Nie mam nic do palenia i jestem cholernie nerwowy. 
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HowAreyou
//========================================

INSTANCE DIA_alvaro_HowAreyou (C_INFO)
{
   npc          = sld_5575_alvaro ;
   nr           = 2;
   condition    = DIA_alvaro_HowAreyou_Condition;
   information  = DIA_alvaro_HowAreyou_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_alvaro_HowAreyou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_alvaro_HowAreyou_Info()
{
    AI_Output (other, self ,"DIA_alvaro_HowAreyou_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_alvaro_HowAreyou_03_02"); //Nie chce mi siê z tob¹ gadaæ. 
};

