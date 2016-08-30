//poprawione i sprawdzone - Nocturn

// ************************ EXIT **************************

instance  STT_300_Alberto_Exit (C_INFO)
{
	npc			=  STT_300_Alberto;
	nr			= 999;
	condition	=  STT_300_Alberto_Exit_Condition;
	information	=  STT_300_Alberto_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_300_Alberto_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_300_Alberto_Exit_Info()
{
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  STT_300_Alberto_BUY (C_INFO)
{
	npc				= STT_300_Alberto;
	condition		= STT_300_Alberto_BUY_Condition;
	information		= STT_300_Alberto_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	Trade			= 1;
};

FUNC int  STT_300_Alberto_BUY_Condition()
{
	return 1;
};


FUNC void  STT_300_Alberto_BUY_Info()
{
	AI_Output (other, self,"STT_300_Alberto_BUY_Info_15_01"); //Mo¿e masz coœ, co chcia³byœ sprzedaæ?
	AI_Output (self, other,"STT_300_Alberto_BUY_Info_12_02"); //Jasne. Co tylko zechcesz... Jeœli masz doœæ rudy.
	var int log_tradealberto;
	if log_tradealberto == false
	{
	log_tradealberto = true;
	Log_CreateTopic (GE_TraderOM,LOG_NOTE);
    B_LogEntry      (GE_TraderOM,"Kupiec Alberto handluje przedmiotami, które mog¹ mi siê przydaæ w kopalni. Znajdê go w pobli¿u Iana."); 
	};
	
};

//========================================
//-----------------> STORY_OF_TRADER
//========================================

INSTANCE DIA_Alberto_STORY_OF_TRADER (C_INFO)
{
   npc          = STT_300_Alberto;
   nr           = 1;
   condition    = DIA_Alberto_STORY_OF_TRADER_Condition;
   information  = DIA_Alberto_STORY_OF_TRADER_Info;
   permanent	= FALSE;
   description	= "Widzê, ¿e znasz siê na handlu. Sk¹d pochodzisz?";
};

FUNC INT DIA_Alberto_STORY_OF_TRADER_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Alberto_STORY_OF_TRADER_Info()
{
    AI_Output (other, self ,"DIA_Alberto_STORY_OF_TRADER_15_01"); //Widzê, ¿e znasz siê na handlu. Sk¹d pochodzisz?
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_02"); //To prawda, mam ¿y³kê do interesów. 
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_03"); //Pochodzê z Khorinis. Mia³em kiedyœ stragan w Górnym Mieœcie. 
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_04"); //Handlowa³em najlepsz¹ ¿ywnoœci¹ sprowadzan¹ z kontynentu. Liczne statki handlowe specjalnie j¹ dostarcza³y na moje ¿yczenie.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_05"); //Niestety, pewnego dnia przez pomy³kê sprzeda³em ¿onie gubernatora Lariusa nieœwie¿e owoce.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_06"); //Kobieta siê zatru³a i po kilku tygodniach zmar³a.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_07"); //Gubernator oskar¿y³ mnie, ¿e sprzeda³em to z premedytacj¹, chc¹c pozbawiæ go pozycji.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_08"); //Odda³ mnie w rêce Wulfgara, dowódcy stra¿y miejskiej, a po krótkim czasie Sêdzia skaza³ mnie na odsiadkê w Kolonii.
    AI_Output (other, self ,"DIA_Alberto_STORY_OF_TRADER_15_09"); //Ech... Te¿ mia³em "przyjemnoœæ" poznaæ Sêdziego.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_10"); //No w³aœnie. Ten sukinsyn nigdy nie postêpowa³ zgodnie ze s³owem Innosa. Zawsze miesza³ siê w ciemne interesy.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_11"); //Gdyby nie on, by³bym w stanie wybrn¹æ z tej sytuacji. Zw³aszcza bior¹c pod uwagê to, ¿e nawalili moi dostawcy, a nie ja. 
    AI_Output (other, self ,"DIA_Alberto_STORY_OF_TRADER_15_12"); //Rozumiem.
};

