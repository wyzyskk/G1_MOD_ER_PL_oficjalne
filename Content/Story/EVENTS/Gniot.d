// *Script was make in Easy Dialog Maker (EDM)
func void Gniot_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	monolog = Gniot;
		self.aivar[AIV_INVINCIBLE]=TRUE;
		Ai_ProcessInfos (her);
	};
};
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_Hero_Ucieranie_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition	= DIA_PC_Hero_Ucieranie_EXIT_Condition;
	information	= DIA_PC_Hero_Ucieranie_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_Ucieranie_EXIT_Condition()
{
if (monolog == Gniot)
{
	return TRUE;
	};
};

FUNC VOID DIA_PC_Hero_Ucieranie_EXIT_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Ucieranie
//========================================

INSTANCE DIA_PC_Hero_Ucieranie (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_Ucieranie_Condition;
   information  = DIA_PC_Hero_Ucieranie_Info;
   permanent	= true;
   description	= "(Utrzyj nasiona lub owoce)";
};

FUNC INT DIA_PC_Hero_Ucieranie_Condition()
{
    if (monolog == Gniot)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_Ucieranie_Info()
{
    Info_ClearChoices		(DIA_PC_Hero_Ucieranie);
	Info_AddChoice		(DIA_PC_Hero_Ucieranie, DIALOG_BACK, DIA_PC_Hero_Ucieranie_BACK);
    Info_AddChoice		(DIA_PC_Hero_Ucieranie, "Rozetrzyj nasiona ogniociernia", DIA_PC_Hero_Ucieranie_Ogniociern);
    Info_AddChoice		(DIA_PC_Hero_Ucieranie, "Rozetrzyj bagienne ziele", DIA_PC_Hero_Ucieranie_Ziele);
    //Info_AddChoice		(DIA_PC_Hero_Ucieranie, "Tytoñ zio³owy", DIA_PC_Hero_Ucieranie_Tyton3);
  //  Info_AddChoice		(DIA_PC_Hero_Ucieranie, "Tytoñ grzybowy", DIA_PC_Hero_Ucieranie_Tyton4);
//Info_AddChoice		(DIA_PC_Hero_Ucieranie, "Tytoñ zwyczajny", DIA_PC_Hero_Ucieranie_Tyton);
};
func void DIA_PC_Hero_Ucieranie_BACK ()
{
Info_ClearChoices		(DIA_PC_Hero_Ucieranie);
};
FUNC VOID DIA_PC_Hero_Ucieranie_Ogniociern()
{
    if (Npc_HasItems (hero, ItFo_Plants_Flameberry_01) >=1) 
    {
	Npc_RemoveInvItems (hero, ItFo_Plants_Flameberry_01, 1);
	CreateInvItem (hero,ItFo_Plants_utarteJagody_01);
	 Info_ClearChoices		(DIA_PC_Hero_Ucieranie);
	Info_AddChoice		(DIA_PC_Hero_Ucieranie, DIALOG_BACK, DIA_PC_Hero_Ucieranie_BACK);
    Info_AddChoice		(DIA_PC_Hero_Ucieranie, "Rozetrzyj nasiona ogniociernia", DIA_PC_Hero_Ucieranie_Ogniociern);
    Info_AddChoice		(DIA_PC_Hero_Ucieranie, "Rozetrzyj bagienne ziele", DIA_PC_Hero_Ucieranie_Ziele);
    }
    else
    {
	PrintS_Ext("Nie masz takiego sk³adnika!", COL_RED);
    AI_StopProcessInfos	(self);
    };
};
FUNC VOID DIA_PC_Hero_Ucieranie_Ziele()
{
    if (Npc_HasItems (hero, ItMi_Plants_Swampherb_01) >=1) 
    {
	Npc_RemoveInvItems (hero, ItMi_Plants_Swampherb_01, 1);
	CreateInvItem (hero,ItFo_Plants_PapkaZziela);
	    Info_ClearChoices		(DIA_PC_Hero_Ucieranie);
	Info_AddChoice		(DIA_PC_Hero_Ucieranie, DIALOG_BACK, DIA_PC_Hero_Ucieranie_BACK);
    Info_AddChoice		(DIA_PC_Hero_Ucieranie, "Rozetrzyj nasiona ogniociernia", DIA_PC_Hero_Ucieranie_Ogniociern);
    Info_AddChoice		(DIA_PC_Hero_Ucieranie, "Rozetrzyj bagienne ziele", DIA_PC_Hero_Ucieranie_Ziele);
    }
    else
    {
	
	PrintS_Ext("Nie masz takiego sk³adnika!", COL_RED);
    AI_StopProcessInfos	(self);
    };
};
