//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_GorBoba_EXIT(C_INFO)
{
	npc             = TPL_3927_GorBoba;
	nr              = 999;
	condition	= DIA_GorBoba_EXIT_Condition;
	information	= DIA_GorBoba_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_GorBoba_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GorBoba_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> 3927_HELLO_01
//========================================

INSTANCE DIA_GorBoba_3927_HELLO_01 (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 1;
   condition    = DIA_GorBoba_3927_HELLO_01_Condition;
   information  = DIA_GorBoba_3927_HELLO_01_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_GorBoba_3927_HELLO_01_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GorBoba_3927_HELLO_01_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_3927_HELLO_01_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_GorBoba_3927_HELLO_01_03_02"); //Mówi¹ na mnie Gor Boba. Jestem Stra¿nikiem Œwi¹tynnym i wiernym s³ug¹ Œni¹cego.
};

//========================================
//-----------------> 3927_HELLO_02
//========================================

INSTANCE DIA_GorBoba_3927_HELLO_02 (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 2;
   condition    = DIA_GorBoba_3927_HELLO_02_Condition;
   information  = DIA_GorBoba_3927_HELLO_02_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_GorBoba_3927_HELLO_02_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorBoba_3927_HELLO_01))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorBoba_3927_HELLO_02_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_3927_HELLO_02_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_GorBoba_3927_HELLO_02_03_02"); //Trenujê, by pewnego dnia zdobyæ tytu³ mistrza areny.
};

//========================================
//-----------------> 3927_TEACH_01
//========================================

INSTANCE DIA_GorBoba_3927_TEACH_01 (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 3;
   condition    = DIA_GorBoba_3927_TEACH_01_Condition;
   information  = DIA_GorBoba_3927_TEACH_01_Info;
   permanent	= FALSE;
   description	= "Mo¿esz podszkoliæ mnie w walce?";
};

FUNC INT DIA_GorBoba_3927_TEACH_01_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorBoba_3927_HELLO_01))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorBoba_3927_TEACH_01_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_3927_TEACH_01_15_01"); //Mo¿esz podszkoliæ mnie w walce?
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_01_03_02"); //Niestety, nie mam na to czasu.
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_01_03_03"); //Chocia¿... Mogê daæ ci pewn¹ wskazówkê, dziêki której bêdziesz zadawa³ nieco mocniejsze uderzenia. Powiedz, gdy bêdziesz gotów.
};

//========================================
//-----------------> 3927_TEACH_02
//========================================

INSTANCE DIA_GorBoba_3927_TEACH_02 (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 4;
   condition    = DIA_GorBoba_3927_TEACH_02_Condition;
   information  = DIA_GorBoba_3927_TEACH_02_Info;
   permanent	= FALSE;
   description	= "Jestem gotów.";
};

FUNC INT DIA_GorBoba_3927_TEACH_02_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_GorBoba_3927_TEACH_01))
{
    return TRUE;   
};
};

FUNC VOID DIA_GorBoba_3927_TEACH_02_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_3927_TEACH_02_15_01"); //Jestem gotów.
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_02_15_02"); //Przed wyprowadzeniem uderzenia skup siê i weŸ g³êboki wdech. Wyprowadzaj¹c atak, wypuœæ powietrze z p³uc i pozwól broni na swobodny ruch w kierunku przeciwnika.
    AI_Output (other, self ,"DIA_GorBoba_3927_TEACH_02_03_03"); //Dziêkujê.
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_02_03_04"); //Ta wiedza mo¿e uratowaæ ci ¿ycie. Korzystaj z niej m¹drze.
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si³a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};