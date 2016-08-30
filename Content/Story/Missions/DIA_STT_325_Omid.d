//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Omid_EXIT(C_INFO)
{
	npc             = STT_325_Omid;
	nr              = 999;
	condition		= DIA_Omid_EXIT_Condition;
	information		= DIA_Omid_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Omid_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Omid_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Omid_HELLO1 (C_INFO)
{
   npc          = STT_325_Omid;
   nr           = 1;
   condition    = DIA_Omid_HELLO1_Condition;
   information  = DIA_Omid_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Omid_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Omid_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Omid_HELLO1_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Omid_HELLO1_03_02"); //Nie chcê byæ niegrzeczny, ale nie mam czasu na pogawêdki. Bartholo mi zagrozi³, ¿e jak nie ugotujê dziœ gulaszu z k¹sacza to wywlecze mnie z zamku i wyrzuci na Terytorium Orków.
    AI_Output (self, other ,"DIA_Omid_HELLO1_03_03"); //Widzia³em co siê sta³o z poprzednimi kucharzami, wiêc wolê nie ryzykowaæ. Jak czegoœ potrzebujesz, to pogadaj z Balamem, jego Magnaci darz¹ wiêkszym szacunkiem.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Omid_HELLO2 (C_INFO)
{
   npc          = STT_325_Omid;
   nr           = 2;
   condition    = DIA_Omid_HELLO2_Condition;
   information  = DIA_Omid_HELLO2_Info;
   permanent	= TRUE;
   description	= "Co tam gotujesz?";
};

FUNC INT DIA_Omid_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Omid_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Omid_HELLO2_15_01"); //Co tam gotujesz?
    AI_Output (self, other ,"DIA_Omid_HELLO2_03_02"); //Nie przeszkadzaj mi!
};

