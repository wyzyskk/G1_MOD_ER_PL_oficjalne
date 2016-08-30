// *Script was make in Easy Dialog Maker (EDM)
// *Script was make in Easy Dialog Maker (EDM)
func void Beliar_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	monolog = Beliar;
		self.aivar[AIV_INVINCIBLE]=TRUE;
		Ai_ProcessInfos (her);
	};
};
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_HERO_EXIT_Beliar(C_INFO)
{
	npc             = PC_HERO;
	nr              = 999;
	condition	= DIA_PC_HERO_EXIT_Beliar_Condition;
	information	= DIA_PC_HERO_EXIT_Beliar_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HERO_EXIT_Beliar_Condition()
{
if (monolog == Beliar)
{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_EXIT_Beliar_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HIT_POINTS_BEL
//========================================
//edit by Nocturn

INSTANCE DIA_PC_HERO_HIT_POINTS_BEL (C_INFO)
{
   npc          = PC_HERO;
   nr           = 1;
   condition    = DIA_PC_HERO_HIT_POINTS_BEL_Condition;
   information  = DIA_PC_HERO_HIT_POINTS_BEL_Info;
   permanent	= TRUE;
   description	= "Daj mi punkty ¿ycia!";
};

FUNC INT DIA_PC_HERO_HIT_POINTS_BEL_Condition()
{
if (monolog == Beliar)
{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_BEL_Info()
{
    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS_BEL);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BEL_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(40 punkty ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_BEL_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(20 punkty ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_BEL_20HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_BEL_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_BEL_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_BEL_BACK()
{
    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS_BEL);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_BEL_2HP_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 100)
{
if (hero.lp >= 1)
{
hero.lp = hero.lp - 1;
    hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 2;
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 100);
	} else {
	PrintS_Ext("Brakuje ci doœwiadczenia!", COL_White);
	};
	} 
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS_BEL);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BEL_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(40 punkty ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_BEL_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(20 punkty ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_BEL_20HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_BEL_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_BEL_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_BEL_10HP_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 500)
{
if (hero.lp >= 5)
{
hero.lp = hero.lp - 1;
    hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 10;
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 500);
	} else {
	PrintS_Ext("Brakuje ci doœwiadczenia!", COL_White);
	};
	} 
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS_BEL);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BEL_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(40 punkty ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_BEL_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(20 punkty ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_BEL_20HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_BEL_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_BEL_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_BEL_20HP_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 1000)
	{
	if (hero.lp >= 10)
{
hero.lp = hero.lp - 10;
    hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 20;
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 1000);
		} else {
	PrintS_Ext("Brakuje ci doœwiadczenia!", COL_White);
	};
	} 
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS_BEL);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BEL_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(40 punkty ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_BEL_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(20 punkty ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_BEL_20HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_BEL_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_BEL_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_BEL_40HP_ADD()
	{
	if (Npc_HasItems (hero,ItMiNugget) >= 2000)
	{
	if (hero.lp >= 20)
{
hero.lp = hero.lp - 20;
    hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 40;
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 2000);
		} else {
	PrintS_Ext("Brakuje ci doœwiadczenia!", COL_White);
	};
	} 
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS_BEL);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BEL_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(40 punkty ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_BEL_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(20 punkty ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_BEL_20HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_BEL_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS_BEL, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_BEL_2HP_ADD);
};

//========================================
//-----------------> ADD_MANA_BEL
//========================================
//edit by Nocturn

INSTANCE DIA_PC_HERO_ADD_MANA_BEL (C_INFO)
{
   npc          = PC_HERO;
   nr           = 1;
   condition    = DIA_PC_HERO_ADD_MANA_BEL_Condition;
   information  = DIA_PC_HERO_ADD_MANA_BEL_Info;
   permanent	= true;
   description	= "Daj mi manê!";
};

FUNC INT DIA_PC_HERO_ADD_MANA_BEL_Condition()
{
if (monolog == Beliar)
{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_ADD_MANA_BEL_Info()
{
    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA_BEL);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BEL_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_BEL_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_BEL_10MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "5 punktów many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_BEL_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_BEL_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_BEL_BACK()
{
    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA_BEL);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_BEL_1MANA_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 100)
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 1);
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 100);
	}
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA_BEL);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BEL_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_BEL_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_BEL_10MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "5 punktów many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_BEL_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_BEL_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_BEL_5MANA_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 500)
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5);
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 500);
	}
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA_BEL);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BEL_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_BEL_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_BEL_10MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "5 punktów many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_BEL_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_BEL_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_BEL_10MANA_ADD()
{
	if (Npc_HasItems (hero,ItMiNugget) >= 1000)
	{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 10*LPCOST_ATTRIBUTE_MANA);
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 1000);
	}
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA_BEL);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BEL_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_BEL_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_BEL_10MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "5 punktów many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_BEL_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_BEL_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_BEL_20MANA_ADD()
{
	if (Npc_HasItems (hero,ItMiNugget) >= 2000)
	{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 20*LPCOST_ATTRIBUTE_MANA);
    B_GiveInvItems (hero,PC_THIEF, ItMiNugget, 2000);
	}
	else 
	{
	PrintS_Ext("Brakuje ci rudy!", COL_White);
	};
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA_BEL);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BEL_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_BEL_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_BEL_10MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "5 punktów many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_BEL_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA_BEL, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_BEL_1MANA_ADD);
};

//========================================
//-----------------> MAGIC_SWORD_2
//========================================
//edit by Nocturn

INSTANCE DIA_PC_HERO_MAGIC_SWORD_2 (C_INFO)
{
   npc          = PC_HERO;
   nr           = 2;
   condition    = DIA_PC_HERO_MAGIC_SWORD_2_Condition;
   information  = DIA_PC_HERO_MAGIC_SWORD_2_Info;
   permanent	= FALSE;
   description	= "Ulepsz: Miecz Rozpacz (250 z?tych monet)";
};

FUNC INT DIA_PC_HERO_MAGIC_SWORD_2_Condition()
{
    if (Npc_HasItems (hero, Miecz1H9) >=1)
    && (Npc_HasItems (hero, ItMi_Stuff_OldCoin_01) >=250)
	&& (monolog == Beliar)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_HERO_MAGIC_SWORD_2_Info()
{
    B_GiveInvItems (hero,PC_THIEF, Miecz1H9, 1);
    CreateInvItems (hero, Miecz1H10, 1);
    B_GiveInvItems (hero, PC_THIEF, ItMi_Stuff_OldCoin_01, 250);
	PrintScreen	("Miecz Rozpaczy zosta³ ulepszony!", -1,70,"FONT_OLD_20_WHITE.TGA",2);	
};
