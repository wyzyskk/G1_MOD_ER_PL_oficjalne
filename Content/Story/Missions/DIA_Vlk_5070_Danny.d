// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Vlk_5070_Exit (C_INFO)
{
	npc			= Vlk_5070_Danny;
	nr			= 999;
	condition	= DIA_Vlk_5070_Exit_Condition;
	information	= DIA_Vlk_5070_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Vlk_5070_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Vlk_5070_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				THANKS
// **************************************************

INSTANCE DIA_Vlk_5070_THANKS (C_INFO)
{
	npc				= Vlk_5070_Danny;
	nr				= 1;
	condition		= DIA_Vlk_5070_THANKS_Condition;
	information		= DIA_Vlk_5070_THANKS_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Vlk_5070_THANKS_Condition()
{	
	return 1;
};

FUNC VOID DIA_Vlk_5070_THANKS_Info()
{
	AI_Output (self, other,"DIA_Vlk_5070_THANKS_02_01"); //Dziêki za pomoc. Jeszcze trochê i by³oby po mnie. Siedzê tu ju¿ od kilku dni bez wody i jedzenia. 
	AI_Output (other, self,"DIA_Vlk_5070_THANKS_15_02"); //Dlaczego po prostu nie zejdziesz na dó³?
	AI_Output (self, other,"DIA_Vlk_5070_THANKS_02_03"); //Nie widzia³eœ tych pe³zaczy?! Prze¿y³em tylko dlatego, ¿e wszed³em na ten stary podest. Na szczêœcie teraz ju¿ jestem bezpieczny. 
	AI_Output (self, other,"DIA_Vlk_5070_THANKS_02_04"); //Uratowa³eœ mi ¿ycie.
	AI_Output (other, self,"DIA_Vlk_5070_THANKS_15_05"); //(z lekk¹ drwin¹, pewnoœci¹ siebie) Nie ma za co.
	Npc_ExchangeRoutine (self,"find");
	//AI_StopProcessInfos	(self);
};

// **************************************************
// 				I met your friend
// **************************************************

INSTANCE DIA_Vlk_5070_Quest (C_INFO)
{
	npc				= Vlk_5070_Danny;
	nr				= 1;
	condition		= DIA_Vlk_5070_Quest_Condition;
	information		= DIA_Vlk_5070_Quest_Info;
	permanent		= 0;
	description		= "Twój przyjaciel pyta³ o ciebie.";
};

FUNC INT DIA_Vlk_5070_Quest_Condition()
{	
	if MIS_BuddlerDanny == LOG_RUNNING
	{
	return 1;
	};
};

FUNC VOID DIA_Vlk_5070_Quest_Info()
{
	AI_Output (other, self,"DIA_Vlk_5070_Quest_15_00"); //Twój przyjaciel pyta³ o ciebie.
	AI_Output (self, other,"DIA_Vlk_5070_Quest_02_01"); //Jaki przyjaciel?
	AI_Output (other, self,"DIA_Vlk_5070_Quest_15_02"); //Ten, który siedzi przed Starym Obozem i czeka na rudê...
	AI_Output (self, other,"DIA_Vlk_5070_Quest_02_03"); //No tak, obieca³em mu rudê, ale teraz wszystko straci³em. Jakiœ Stra¿nik têdy przechodzi³ i zabra³ moj¹ sakiewkê. Nawet nie pomóg³ mi siê st¹d wydostaæ.
	AI_Output (self, other,"DIA_Vlk_5070_Quest_02_04"); //Wyœmia³ mnie tylko i odszed³. Powiedz mojemu kumplowi, ¿e nieprêdko wrócê. Muszê kopaæ od nowa.

    B_LogEntry               (CH1_BuddlerDanny,"W Kopalni spotka³em Danny'ego. Niestety nieprêdko wróci, poniewa¿ straci³ ca³¹ rudê jak¹ wydoby³.");
};