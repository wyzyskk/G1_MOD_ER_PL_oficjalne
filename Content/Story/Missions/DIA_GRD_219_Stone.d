//poprawione i sprawdzone - Nocturn

//*****************************************
//				EXIT UNTEN
//*****************************************

// ************************ EXIT **************************

INSTANCE DIA_GRD_219_Stone_Exit (C_INFO)
{
	npc			= GRD_219_Stone;
	nr			= 999;
	condition	= DIA_GRD_219_Stone_Exit_Condition;
	information	= DIA_GRD_219_Stone_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GRD_219_Stone_Exit_Condition()
{
	return 1;
};

func VOID DIA_GRD_219_Stone_Exit_Info()
{
	if ( Npc_KnowsInfo ( hero,  DIA_GRD_219_Stone4  ))
	{
		AI_StopProcessInfos	( self );
		
		var C_NPC Stone;	Stone = Hlp_GetNpc ( GRD_219_Stone );

		TA_BeginOverlay (Stone);
			TA_Min (Stone, 00, 00, 00, 05, ZS_Position,"OCC_MERCS_HALLWAY_BACK"	);
			TA_Min (Stone, 00, 05, 00, 10, ZS_Position,"OCC_MERCS_ENTRANCE"		);
			TA_Min (Stone, 00, 10, 00, 15, ZS_Position,"OCC_SHADOWS_CORNER"		);	
			TA_Min (Stone, 00, 15, 00, 20, ZS_Position,"OCC_STABLE_ENTRANCE"	);
			TA_Min (Stone, 00, 20, 72, 00, ZS_Position,"OCC_STABLE_LEFT_FRONT"	);	
		TA_EndOverlay (Stone);
		
		AI_Output (self, other,"Info_EXIT_06_02"); //Do zobaczenia.

		AI_StopProcessInfos	( self );
	}
	else {
		AI_Output (self, other,"Info_EXIT_06_03"); //Do zobaczenia.
					
		AI_StopProcessInfos	( self );
	};	
};
// ************************************************************
//							Hello					
// ************************************************************

instance DIA_Stone_Hello (C_INFO)
{
	npc				= Grd_219_Stone;
	nr 				= 1;
	condition		= DIA_Stone_Hello_Condition;
	information		= DIA_Stone_Hello_Info;
	permanent		= 0;
	description		= "Jesteœ kowalem, czy¿ nie?";
};

FUNC int  DIA_Stone_Hello_Condition()
{	
	if	(Kapitel < 4)
	{	
		return TRUE;
	};
};

func void  DIA_Stone_Hello_Info()
{
	AI_Output (other, self,"DIA_Stone_Hello_15_00"); //Jesteœ kowalem, czy¿ nie?
	AI_Output (self, other,"DIA_Stone_Hello_06_01"); //Racja.
};

//========================================
//-----------------> CanYouForgeWeapon
//========================================

INSTANCE DIA_Stone_CanYouForgeWeapon (C_INFO)
{
   npc          = Grd_219_Stone;
   nr           = 1;
   condition    = DIA_Stone_CanYouForgeWeapon_Condition;
   information  = DIA_Stone_CanYouForgeWeapon_Info;
   permanent	= FALSE;
   description	= "Móg³byœ coœ dla mnie wykuæ?";
};

FUNC INT DIA_Stone_CanYouForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stone_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stone_CanYouForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Stone_CanYouForgeWeapon_15_01"); //Móg³byœ coœ dla mnie wykuæ?
    AI_Output (self, other ,"DIA_Stone_CanYouForgeWeapon_03_02"); //Móg³bym, ale nie za darmo. Poza zap³at¹ potrzebujê rzecz jasna planu i sk³adników.

	Log_CreateTopic   	(GE_Smitch,LOG_NOTE);
    B_LogEntry			(GE_Smitch, "Stone mo¿e wykuæ dla mnie broñ, jeœli mu zap³acê i przyniosê plan oraz sk³adniki.");
};

//========================================
//-----------------> ForgeWeapon
//========================================

INSTANCE DIA_Stone_ForgeWeapon (C_INFO)
{
   npc          = Grd_219_Stone;
   nr           = 1;
   condition    = DIA_Stone_ForgeWeapon_Condition;
   information  = DIA_Stone_ForgeWeapon_Info;
   permanent	= TRUE;
   description	= "Wykuj dla mnie broñ.";
};

FUNC INT DIA_Stone_ForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stone_CanYouForgeWeapon)) && ((kapitel >= 5 && (Npc_KnowsInfo (hero, DIA_GRD_219_Stone3))) || kapitel < 5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stone_ForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Stone_ForgeWeapon_15_01"); //Wykuj dla mnie broñ.
    AI_Output (self, other ,"DIA_Stone_ForgeWeapon_03_02"); //Czego potrzebujesz?
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};

FUNC VOID DIA_Stone_ForgeWeapon_back ()
{
Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
};
//////////////////////////////////////////////////
// MIECZE TANIE
//////////////////////////////////////////////////
//MIECZ BOJOWY
FUNC VOID DIA_Stone_ForgeWeapon_Plan1b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 40)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_Wegiel) >= 2) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
//give sword
CreateInvItem (self, ItMw_1H_Sword_04);
B_GiveInvItems (self,other,ItMw_1H_Sword_04,1);
//pay
B_GiveInvItems (other,self,itminugget,40);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end 
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//MIECZ KOWALA
FUNC VOID DIA_Stone_ForgeWeapon_Miecz1h6 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,ItAt_Wolf_01) >= 1) 
 &&(Npc_HasItems (hero,ItMi_Wood_02) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, ItAt_Wolf_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
//give sword
CreateInvItem (self, Miecz1H6);
B_GiveInvItems (self,other,Miecz1H6,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//PORZ¥DNY MIECZ JEDNORÊCZNY
FUNC VOID DIA_Stone_ForgeWeapon_Miecz1h11 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItMi_Wood_02) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 2) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
//give sword
CreateInvItem (self, Miecz1H11);
B_GiveInvItems (self,other,Miecz1H11,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//B£YSK NOCY
FUNC VOID DIA_Stone_ForgeWeapon_Miecz1h15 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItMi_Wood_02) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
//give sword
CreateInvItem (self, Miecz1H15);
B_GiveInvItems (self,other,Miecz1H15,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//SZEROKI MIECZ
FUNC VOID DIA_Stone_ForgeWeapon_Miecz1h7 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItAt_Lurker_02) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) 
&&(Npc_HasItems (hero,Gold01) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 2) &&(Npc_HasItems (hero,ItAt_Teeth_01) >= 1) 
&&(Npc_HasItems (hero,ItMi_Wood_02) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Lurker_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
//give sword
CreateInvItem (self, Miecz1H7);
B_GiveInvItems (self,other,Miecz1H7,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//D£UGI MIECZ
FUNC VOID DIA_Stone_ForgeWeapon_Plan1c ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItAt_Lurker_02) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) 
&&(Npc_HasItems (hero,Gold01) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 2) &&(Npc_HasItems (hero,ItAt_Teeth_01) >= 1) 
&&(Npc_HasItems (hero,ItMi_Wood_02) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Lurker_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
//give sword
CreateInvItem (self, Miecz1H7);
B_GiveInvItems (self,other,Miecz1H7,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//SZTYLET ZABÓJCY
FUNC VOID DIA_Stone_ForgeWeapon_DaggerOfMurder ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 1) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,1);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
//give sword
CreateInvItem (self, ItMw_DaggerOfMurder);
B_GiveInvItems (self,other,ItMw_DaggerOfMurder,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//RAPIER
FUNC VOID DIA_Stone_ForgeWeapon_Rapier ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 2) &&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 1)   &&(Npc_HasItems (hero,Gold01) >= 1) &&(Npc_HasItems (hero,ItAt_Lurker_01) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,2);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, ItAt_Lurker_01,1);
//give sword
CreateInvItem (self, ItMw_Rapier);
B_GiveInvItems (self,other,ItMw_Rapier,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//PA£ASZ
FUNC VOID DIA_Stone_ForgeWeapon_BanditTrader ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 1)   &&(Npc_HasItems (hero,Pr_Wegiel) >= 1) &&(Npc_HasItems (hero,ItAt_Dzik_01) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,1);
Npc_RemoveInvItems (hero, ItAt_Dzik_01,1);
//give sword
CreateInvItem (self, ItMw_Addon_BanditTrader);
B_GiveInvItems (self,other,ItMw_Addon_BanditTrader,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//MIECZ ROZPACZY
FUNC VOID DIA_Stone_ForgeWeapon_Miecz1H9 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 4) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 3) &&(Npc_HasItems (hero,ItAt_Wolf_02) >= 2)   &&(Npc_HasItems (hero,Gold01) >= 2) &&(Npc_HasItems (hero,Pr_Wegiel) >= 3) &&(Npc_HasItems (hero,ItAt_Teeth_01) >= 4) &&(Npc_HasItems (hero,ItAt_Claws_02) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,4);
Npc_RemoveInvItems (hero, ItAt_Wolf_02,2);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,3);
Npc_RemoveInvItems (hero, Gold01,2);
Npc_RemoveInvItems (hero, Pr_Wegiel,3);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,4);
Npc_RemoveInvItems (hero, ItAt_Claws_02,1);
//give sword
CreateInvItem (self, Miecz1H9);
B_GiveInvItems (self,other,Miecz1H9,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
/////////////////////////////////////////
// DRO¯SZE BRONIE
/////////////////////////////////////////
//LEKKI MIECZ DWURÊCZNY
FUNC VOID DIA_Stone_ForgeWeapon_Plan3b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 150)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 6) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 4) &&(Npc_HasItems (hero,ItAt_Wolf_02) >= 1)   
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 3) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,6);
Npc_RemoveInvItems (hero, ItAt_Wolf_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,4);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,3);
//give sword
CreateInvItem (self, ItMw_2H_Sword_Light_01);
B_GiveInvItems (self,other,ItMw_2H_Sword_Light_01,1);
//pay
B_GiveInvItems (other,self,itminugget,150);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//ŒWIÊTY MŒCICIEL
FUNC VOID DIA_Stone_ForgeWeapon_Miecz1h8 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 200)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 3) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 1)   
&&(Npc_HasItems (hero,ItAt_Teeth_01) >= 1) &&(Npc_HasItems (hero,ItMi_Wood_02) >= 1)  &&(Npc_HasItems (hero,Gold01) >= 1)  &&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,3);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,2);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,1);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,1);
//give sword
CreateInvItem (self, ItMw_2H_Sword_Light_01);
B_GiveInvItems (self,other,ItMw_2H_Sword_Light_01,1);
//pay
B_GiveInvItems (other,self,itminugget,200);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//////////////////////////////////////////
// NAJDRO¯SZE MIECZE
//////////////////////////////////////////
//MIECZ KRÓLEWSKI 
FUNC VOID DIA_Stone_ForgeWeapon_Plan3 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 7) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 3)   
&&(Npc_HasItems (hero,Pr_Wegiel) >= 4) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 1)  
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,7);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,3);
Npc_RemoveInvItems (hero, pr_Wegiel,4);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,1);
//give sword
CreateInvItem (self, ItMw_2H_Sword_Light_04);
B_GiveInvItems (self,other,ItMw_2H_Sword_Light_04,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//LEKKI TOPÓR BOJOWY
FUNC VOID DIA_Stone_ForgeWeapon_Plan5c ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 6) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 3)   
&&(Npc_HasItems (hero,Pr_Wegiel) >= 3) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 2)  
&&(Npc_HasItems (hero,ItAt_Teeth_01) >= 10)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,6);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,3);
Npc_RemoveInvItems (hero, pr_Wegiel,3);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,10);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,2);
//give sword
CreateInvItem (self, ItMw_2H_Axe_light_01);
B_GiveInvItems (self,other,ItMw_2H_Axe_light_01,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//OSTRZE BOHATERA
FUNC VOID DIA_Stone_ForgeWeapon_Plan4b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 6) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 2)   
&&(Npc_HasItems (hero,Pr_SztabkaZlota) >= 2) 
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)  
&&(Npc_HasItems (hero,ItAt_Troll_02) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,6);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,2);
Npc_RemoveInvItems (hero, Pr_SztabkaZlota,2);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItAt_Troll_02,1);
//give sword
CreateInvItem (self, ItMw_2H_Sword_02);
B_GiveInvItems (self,other,ItMw_2H_Sword_02,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//TOPÓR WOJENNY
FUNC VOID DIA_Stone_ForgeWeapon_Plan7b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 8) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 4)   
&&(Npc_HasItems (hero,Pr_SztabkaZlota) >= 2) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 3)  
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)
&&(Npc_HasItems (hero,ItAt_Swampshark_02) >= 2)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,8);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,4);
Npc_RemoveInvItems (hero, Pr_SztabkaZlota,2);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,3);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItAt_Swampshark_02,2);
//give sword
CreateInvItem (self, ItMw_2H_Axe_Heavy_01);
B_GiveInvItems (self,other,ItMw_2H_Axe_Heavy_01,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//POGROMCA ORKÓW
FUNC VOID DIA_Stone_ForgeWeapon_Miecz2H5 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 4) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 3) 
&&(Npc_HasItems (hero,Pr_SztabkaStali) >= 5)   
&&(Npc_HasItems (hero,ItAt_Wolf_02) >= 2) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 2)  
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)
&&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 5)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,4);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,3);
Npc_RemoveInvItems (hero, Pr_SztabkaStali,5);
Npc_RemoveInvItems (hero, ItAt_Wolf_02,2);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,2);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,5);
//give sword
CreateInvItem (self, Miecz2H5);
B_GiveInvItems (self,other,Miecz2H5,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};

// ************************************************************
//							Kaufen					
// ************************************************************

instance DIA_Stone_NotSelling (C_INFO)
{
	npc				= Grd_219_Stone;
	nr 				= 1;
	condition		= DIA_Stone_NotSelling_Condition;
	information		= DIA_Stone_NotSelling_Info;
	permanent		= 1;
	description		= "Sprzedajesz orê¿ i zbroje?";
};

FUNC int  DIA_Stone_NotSelling_Condition()
{	
	if	(Npc_GetTrueGuild (hero) != GIL_GRD)
	&&	(Kapitel < 4)
	{
		return TRUE;
	};
};

func void  DIA_Stone_NotSelling_Info()
{
	AI_Output (other, self,"DIA_Stone_NotSelling_15_00"); //Sprzedajesz orê¿ i zbroje?
	AI_Output (self, other,"DIA_Stone_NotSelling_06_01"); //Handlem broni¹ para siê Skip. Ja zajmujê siê tylko pancerzami.
	AI_Output (other, self,"DIA_Stone_NotSelling_15_02"); //Masz mo¿e coœ ciekawego na sprzeda¿?
	AI_Output (self, other,"DIA_Stone_NotSelling_06_03"); //Tylko pancerze dla Stra¿ników, a ty nie jesteœ jednym z nich. Dlatego bêdziesz musia³ poszukaæ gdzie indziej.
	AI_StopProcessInfos	( self );
};

//-----------------------------------------------------
// RÜSTUNG UND SCHWERT ABHOLEN WENN DER SPIELER GARDIST IST
//-----------------------------------------------------
instance  GRD_219_Stone_GETSTUFF (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= GRD_219_Stone_GETSTUFF_Condition;
	information		= GRD_219_Stone_GETSTUFF_Info;
	important		= 0;
	permanent		= 0;
	description		= "Potrzebujê zbroi."; 
};

FUNC int  GRD_219_Stone_GETSTUFF_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};

};
FUNC void  GRD_219_Stone_GETSTUFF_Info()
{
	AI_Output (other, self,"GRD_219_Stone_GETSTUFF_Info_15_01"); //Potrzebujê zbroi.
	AI_Output (self, other,"GRD_219_Stone_GETSTUFF_Info_06_02"); //A wiêc Thorus jednak ciê przyj¹³, co? Gratulujê!
	AI_Output (self, other,"GRD_219_Stone_GETSTUFF_Info_06_03"); //Jeszcze jeden, któremu spieszno przelaæ krew za Gomeza. A zreszt¹ - co mnie to obchodzi?
	AI_Output (self, other,"GRD_219_Stone_GETSTUFF_Info_06_04"); //Masz - weŸ tê zbrojê i miecz. Witamy w stra¿y.

	CreateInvItems		(self,ItMw_1H_Sword_03,2);
	B_GiveInvItems      (self,other,ItMw_1H_Sword_03,2);
	Npc_RemoveInvItem   (other,ItMw_1H_Sword_03);
    CreateInvItem		(other,GRD_ARMOR_L);
	AI_EquipBestArmor	(hero);
	AI_EquipBestMeleeWeapon	(hero);

	B_LogEntry		(GE_BecomeGuard,	"Odebra³em z kuŸni moj¹ pierwsz¹ zbrojê Stra¿nika. Lepsze pancerze s¹ niestety du¿o dro¿sze.");

	AI_StopProcessInfos	( self );
};  

//-----------------------------------------------------
// BESSERE RÜSTUNG
//-----------------------------------------------------
instance  GRD_219_Stone_BETTERARMOR (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= GRD_219_Stone_BETTERARMOR_Condition;
	information		= GRD_219_Stone_BETTERARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chcia³bym dostaæ lepszy pancerz."; 
};

FUNC int  GRD_219_Stone_BETTERARMOR_Condition()
{	
	if	(Npc_KnowsInfo (hero,GRD_219_Stone_GETSTUFF))
	&&	(Kapitel < 4)
	{
		return TRUE;
	};
};

FUNC void  GRD_219_Stone_BETTERARMOR_Info()
{
	AI_Output				(other, self,"GRD_219_Stone_BETTERARMOR_Info_15_01"); //Chcia³bym dostaæ lepszy pancerz.
	AI_Output				(self, other,"GRD_219_Stone_BETTERARMOR_Info_06_02"); //Dostaniesz go, jak przyjdzie czas, i bêdziesz mia³ wystarczaj¹c¹ iloœæ rudy...
		
	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
	Info_AddChoice			(GRD_219_Stone_BETTERARMOR,	DIALOG_BACK							,	GRD_219_Stone_BETTERARMOR_BACK);	
	Info_AddChoice			(GRD_219_Stone_BETTERARMOR, B_BuildBuyArmorString(NAME_StoneHeavyGuards,VALUE_GRD_ARMOR_H)	,GRD_219_Stone_BETTERARMOR_H);	
	Info_AddChoice			(GRD_219_Stone_BETTERARMOR,	B_BuildBuyArmorString(NAME_StoneGuards,VALUE_GRD_ARMOR_M)	,	GRD_219_Stone_BETTERARMOR_M);	
};  

func void GRD_219_Stone_BETTERARMOR_M ()
{
	AI_Output				(hero, self,"GRD_219_Stone_BETTERARMOR_Info_M_15_01"); //Chcia³bym dostaæ zwyk³y pancerz Stra¿nika.

	if (Kapitel < 3)
	{
		AI_Output			(self, hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_02"); //Thorus powiedzia³, ¿e musisz siê sprawdziæ jako Stra¿nik zanim dostaniesz lepszy pancerz!
	}
	else if (Npc_HasItems(hero, ItMiNugget)<VALUE_GRD_ARMOR_M)
	{
		AI_Output			(self, hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03"); //Mam na sk³adzie odpowiedni¹ zbrojê, ale nie masz doœæ rudy. Wróæ, kiedy bêdzie ciê na ni¹ staæ!
	}
	else
	{
		AI_Output			(self, hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04"); //Dobra, masz tu swoj¹ now¹ zbrojê. Tylko nie pozwól, ¿eby Najemnicy j¹ porysowali. Ha ha ha!
		B_GiveInvItems	    (hero, self, ItMiNugget, VALUE_GRD_ARMOR_M);
		B_GiveInvItems		(self, hero, GRD_ARMOR_M, 1);
		AI_EquipBestArmor	(hero);
	};

	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_H ()
{
	AI_Output				(hero, self,"GRD_219_Stone_BETTERARMOR_Info_H_15_01"); //Chcia³bym dostaæ ciê¿k¹ zbrojê Stra¿nika.
	if (HeroCanBuy_GRDHARMOR == false)
	{
	AI_Output				(self, hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_02"); //Tylko najlepsi Stra¿nicy mog¹ je nosiæ, a obawiam siê, ¿e minie jeszcze trochê czasu zanim zostaniesz jednym z nich.
	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
	}
	else
	{
	if (Npc_HasItems(hero, ItMiNugget)>=VALUE_GRD_ARMOR_H)
	{
		AI_Output				(self, hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_03"); //Wszyscy s³yszeli o twoich ostatnich dokonaniach. Ja równie¿ jestem pod wra¿eniem. Noœ ten pancerz z dum¹. 
		B_GiveInvItems	    (hero, self, ItMiNugget, VALUE_GRD_ARMOR_H);
		B_GiveInvItems		(self, hero, GRD_ARMOR_H, 1);
		AI_EquipBestArmor	(hero);
		}
		else
		{
		AI_Output				(self, hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_04"); //Z chêci¹ podarowa³bym ci ten pancerz, ale masz za ma³o rudy!
		Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
		};
	};
};

func void GRD_219_Stone_BETTERARMOR_BACK ()
{
	AI_Output				(hero, self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01"); //Rozmyœli³em siê.
	AI_Output				(self, hero,"GRD_219_Stone_BETTERARMOR_Info_BACK_06_02"); //Jak uwa¿asz. Wiesz, gdzie mnie znaleŸæ!

	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
};

//#####################################################################
//##
//##
//##							KAPITEL 5/6
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Begrüßung
//---------------------------------------------------------------------
instance DIA_GRD_219_Stone (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone_Condition;
	information		= DIA_GRD_219_Stone_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_GRD_219_Stone_Condition()
{
	if (Kapitel >= 5)
	{
 		return 1;
 	};	
};

func void DIA_GRD_219_Stone_Info()
{
	AI_Output (self, other, "DIA_GRD_219_Stone_06_01"); //Czego chcesz? Nie wygl¹dasz mi na jednego z siepaczy Gomeza.
};

//---------------------------------------------------------------------
//	Info Stone1
//---------------------------------------------------------------------
instance DIA_GRD_219_Stone1 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone1_Condition;
	information		= DIA_GRD_219_Stone1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Masz racjê, nie pracujê dla Gomeza.";
};

FUNC int DIA_GRD_219_Stone1_Condition()
{
	if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone )) 
	{			
		return 1;
	};	
};

func void DIA_GRD_219_Stone1_Info()
{
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_01"); //Masz racjê, nie pracujê dla Gomeza.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_02"); //Wiêc jak siê tutaj dosta³eœ? Tylko Gomez ma klucz do lochów...
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_03"); //Dosta³em go od niego.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_04"); //Chcesz powiedzieæ, ¿e to ty za³atwi³eœ Gomeza?
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_05"); //Dok³adnie.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_06"); //Stary, nie wiedzia³em, ¿e staæ ciê na coœ takiego. Ale cieszê siê, ¿e ten przeklêty bandzior dosta³ wreszcie co mu siê nale¿a³o.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_07"); //Ale dlaczego mnie uwolni³eœ?
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_08"); //Us³ysza³em, ¿e siedzisz tu zamkniêty i pomyœla³em, ¿e móg³bym za³atwiæ Gomeza i zwróciæ ci wolnoœæ.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_09"); //Có¿, wielkie dziêki...
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_10"); //... Jestem ci niezmiernie wdziêczny. Wpadnij kiedyœ do mojej kuŸni, to pogadamy.

	Npc_ExchangeRoutine(self, "OTNEW");
};

//---------------------------------------------------------------------
//	Info Stone3
//---------------------------------------------------------------------
instance DIA_GRD_219_Stone3 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone3_Condition;
	information		= DIA_GRD_219_Stone3_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_GRD_219_Stone3_Condition()
{
	if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone1 )) && ( Hlp_StrCmp ( Npc_GetNearestWP ( self ), "OCC_STABLE_LEFT_FRONT" ))
	{
			return 1;
	};	
};

func void DIA_GRD_219_Stone3_Info()
{
		AI_Output (self, other, "DIA_GRD_219_Stone3_06_01"); //Ach, jesteœ. Mam u ciebie d³ug wdziêcznoœci za wypuszczenie mnie z lochu!
		AI_Output (self, other, "DIA_GRD_219_Stone3_06_02"); //Wiesz, tak sobie myœlê: nie mam nic cennego, co móg³bym ci daæ, wiêc mo¿e zamiast tego wykujê dla ciebie coœ specjalnego.
		AI_Output (self, other, "DIA_GRD_219_Stone3_06_03"); //Mo¿e jakiœ pierœcieñ, albo coœ w tym stylu...
};

//---------------------------------------------------------------------
//	Info Stone2
//---------------------------------------------------------------------
// Warum ist Stone im Kerker
instance DIA_GRD_219_Stone2 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone2_Condition;
	information		= DIA_GRD_219_Stone2_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Dlaczego Gomez kaza³ zamkn¹æ ciê w lochu?";
};

FUNC int DIA_GRD_219_Stone2_Condition()
{
	if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 ))
	{			
		return 1;
	};	
};

func void DIA_GRD_219_Stone2_Info()
{
	AI_Output (other, self, "DIA_GRD_219_Stone2_15_01"); //Dlaczego Gomez kaza³ zamkn¹æ ciê w lochu?
	AI_Output (self, other, "DIA_GRD_219_Stone2_06_02"); //Ten sukinsyn ubzdura³ sobie, ¿e spiskujê potajemnie z Magami Ognia. Nie zabi³ mnie tylko dlatego, ¿e jestem najlepszym kowalem w ca³ym Starym Obozie.
	AI_Output (self, other, "DIA_GRD_219_Stone2_06_03"); //No i wrzuci³ mnie do tej zapluskwionej celi i wypuszcza³ tylko wtedy, gdy by³a dla mnie jakaœ robota.
};

//---------------------------------------------------------------------
//	Info Stone4
//---------------------------------------------------------------------
// Rüstung verbessern lassen
instance DIA_GRD_219_Stone4 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone4_Condition;
	information		= DIA_GRD_219_Stone4_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Mo¿esz dla mnie wzmocniæ tê magiczn¹ zbrojê?";
};

FUNC int DIA_GRD_219_Stone4_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( Npc_HasItems ( hero, ORE_ARMOR_M)) && ( KnowStone == 0 )  {
			return 1;
	 };	
};

func void DIA_GRD_219_Stone4_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone4_15_01"); //Mo¿esz dla mnie wzmocniæ tê magiczn¹ zbrojê?
		AI_Output (self, other, "DIA_GRD_219_Stone4_06_02"); //Jasne! Daj mi j¹ i zaczekaj chwilê.
	
		AI_UnequipArmor	  ( hero );
		B_GiveInvItems   (hero, self, ORE_ARMOR_M, 1);
		Npc_RemoveInvItem   (self, ORE_ARMOR_M);

		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
		
		CreateInvItem (self,ORE_ARMOR_H);
		B_GiveInvItems	  (self, hero, ORE_ARMOR_H, 1);	

		AI_Output (self, other, "DIA_GRD_219_Stone4_06_03"); //Oto twoja wzmocniona zbroja. Teraz jesteœmy kwita.
		
		KnowStone = 1;
};


// Ring des Lebens
instance DIA_GRD_219_Stone5 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone5_Condition;
	information		= DIA_GRD_219_Stone5_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Przyda³by mi siê pierœcieñ wzmacniaj¹cy witalnoœæ.";
};

FUNC int DIA_GRD_219_Stone5_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( KnowStone == 0 ) {
			return 1;
	 };	
};

func void DIA_GRD_219_Stone5_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone5_15_01"); //Przyda³by mi siê pierœcieñ wzmacniaj¹cy witalnoœæ.
		AI_Output (self, other, "DIA_GRD_219_Stone5_06_02"); //To nie powinno byæ zbyt trudne. Zaczekaj.
	
		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
		
		AI_Output (self, other, "DIA_GRD_219_Stone5_06_03"); //Ten pierœcieñ zwiêkszy twoje si³y witalne. Myœlê, ¿e po takim prezencie jesteœmy kwita.

		CreateInvItem	  ( self, Ring_des_Lebens2 );	
		B_GiveInvItems	  ( self, other, Ring_des_Lebens2, 1);	
		
		KnowStone = 1;
};


// Schutzring
instance DIA_GRD_219_Stone6 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone6_Condition;
	information		= DIA_GRD_219_Stone6_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Chcia³bym, ¿ebyœ wyku³ dla mnie pierœcieñ ochronny.";
};

FUNC int DIA_GRD_219_Stone6_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( KnowStone == 0 ){
			return 1;
	 };	
};

func void DIA_GRD_219_Stone6_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone6_15_01"); //Chcia³bym, ¿ebyœ wyku³ dla mnie pierœcieñ ochronny.
		AI_Output (self, other, "DIA_GRD_219_Stone6_06_02"); //Pierœcieñ ochronny? Nie ma sprawy! Od razu wezmê siê do roboty. Zaczekaj chwilê.
		
		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
	
		AI_Output (self, other, "DIA_GRD_219_Stone6_06_03"); //Chcia³eœ pierœcieñ ochronny? Oto on! Teraz jesteœmy kwita.

		CreateInvItem	  ( self, Schutzring_Total2 );
		B_GiveInvItems     (self, other, Schutzring_Total2, 1);
		
		KnowStone = 1;
};


instance DIA_GRD_219_Stone7 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone7_Condition;
	information		= DIA_GRD_219_Stone7_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Potrzebujê czegoœ, co zwiêkszy moje umiejêtnoœci magiczne.";
};

FUNC int DIA_GRD_219_Stone7_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( KnowStone == 0 ) {
			return 1;
	 };	
};

func void DIA_GRD_219_Stone7_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone7_15_01"); //Potrzebujê czegoœ, co zwiêkszy moje umiejêtnoœci magiczne.
		AI_Output (self, other, "DIA_GRD_219_Stone7_06_02"); //...Zwiêkszy umiejêtnoœci magiczne, powiadasz? Mo¿e jakiœ amulet! Tak, zrobiê dla ciebie magiczny amulet. To nie potrwa d³ugo.
	
		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
		
		AI_Output (self, other, "DIA_GRD_219_Stone7_06_03"); //Dobra, amulet gotowy. Muszê przyznaæ, ¿e wyszed³ ca³kiem nieŸle. Proszê, teraz jesteœmy kwita.

		CreateInvItem	  ( self, Amulett_der_Magie );
		B_GiveInvItems     (self, other, Amulett_der_Magie, 1);	
		
		KnowStone = 1;
};