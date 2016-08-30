// *Script was make in Easy Dialog Maker (EDM)
// *Script was make in Easy Dialog Maker (EDM)
func void INNOS_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	monolog = Innos;
		self.aivar[AIV_INVINCIBLE]=TRUE;
		Ai_ProcessInfos (her);
	};
};
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_HERO_EXIT_INNOS(C_INFO)
{
	npc             = PC_HERO;
	nr              = 999;
	condition		= DIA_PC_HERO_EXIT_INNOS_Condition;
	information		= DIA_PC_HERO_EXIT_INNOS_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HERO_EXIT_INNOS_Condition()
{
	if (monolog == Innos)
	{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_EXIT_INNOS_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HIT_POINTS
//========================================
//edit by Nocturn

INSTANCE DIA_PC_HERO_HIT_POINTS (C_INFO)
{
   npc          = PC_HERO;
   nr           = 1;
   condition    = DIA_PC_HERO_HIT_POINTS_Condition;
   information  = DIA_PC_HERO_HIT_POINTS_Info;
   permanent	= TRUE;
   description	= "Daj mi punkty ¿ycia!";
};

FUNC INT DIA_PC_HERO_HIT_POINTS_Condition()
{
if (monolog == Innos)
{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_Info()
{
    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(40 punktów ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(20 punktów ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_20HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_BACK()
{
    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_2HP_ADD()
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
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(40 punktów ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(20 punktów ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_20HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_10HP_ADD()
{
if (Npc_HasItems (hero,ItMiNugget) >= 500)
	{
	if (hero.lp >= 5)
{
hero.lp = hero.lp - 5;
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
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(40 punktów ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(20 punktów ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_20HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_20HP_ADD()
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
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(40 punktów ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(20 punktów ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_20HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_2HP_ADD);
};

FUNC VOID DIA_PC_HERO_HIT_POINTS_40HP_ADD()
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
	    Info_ClearChoices		(DIA_PC_HERO_HIT_POINTS);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, DIALOG_BACK, DIA_PC_HERO_HIT_POINTS_BACK);
     Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(40 punktów ¿ycia (2000 bry³ek rudy, 20 PN))", DIA_PC_HERO_HIT_POINTS_40HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(20 punktów ¿ycia (1000 bry³ek rudy, 10 PN))", DIA_PC_HERO_HIT_POINTS_20HP_ADD);
    Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(10 punktów ¿ycia (500 bry³ek rudy, 5 PN))", DIA_PC_HERO_HIT_POINTS_10HP_ADD);
	Info_AddChoice		(DIA_PC_HERO_HIT_POINTS, "(2 punkty ¿ycia (100 bry³ek rudy, 1 PN))", DIA_PC_HERO_HIT_POINTS_2HP_ADD);
};

//========================================
//-----------------> ADD_MANA
//========================================
//edit by Nocturn

INSTANCE DIA_PC_HERO_ADD_MANA (C_INFO)
{
   npc          = PC_HERO;
   nr           = 1;
   condition    = DIA_PC_HERO_ADD_MANA_Condition;
   information  = DIA_PC_HERO_ADD_MANA_Info;
   permanent	= true;
   description	= "Daj mi manê!";
};

FUNC INT DIA_PC_HERO_ADD_MANA_Condition()
{
if (monolog == Innos)
{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_ADD_MANA_Info()
{
    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_10MANA_ADD);
	Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "5 punkt many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_BACK()
{
    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_1MANA_ADD()
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
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_10MANA_ADD);
	Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "5 punkt many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_5MANA_ADD()
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
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_10MANA_ADD);
	Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "5 punkt many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_10MANA_ADD()
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
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_10MANA_ADD);
	Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "5 punkt many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_1MANA_ADD);
};

FUNC VOID DIA_PC_HERO_ADD_MANA_20MANA_ADD()
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
	    Info_ClearChoices		(DIA_PC_HERO_ADD_MANA);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, DIALOG_BACK, DIA_PC_HERO_ADD_MANA_BACK);
    Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "20 punktów many (2000 bry³ek rudy, 20 PN)", DIA_PC_HERO_ADD_MANA_20MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "10 punktów many (1000 bry³ek rudy, 10 PN)", DIA_PC_HERO_ADD_MANA_10MANA_ADD);
	Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "5 punkt many (500 bry³ek rudy, 5 PN)", DIA_PC_HERO_ADD_MANA_5MANA_ADD);
	  Info_AddChoice		(DIA_PC_HERO_ADD_MANA, "1 punkt many (100 bry³ek rudy, 1 PN)", DIA_PC_HERO_ADD_MANA_1MANA_ADD);
};

//========================================
//-----------------> MAGIC_SWORD_1
//========================================
//edit by Nocturn

INSTANCE DIA_PC_HERO_MAGIC_SWORD_1 (C_INFO)
{
   npc          = PC_HERO;
   nr           = 2;
   condition    = DIA_PC_HERO_MAGIC_SWORD_1_Condition;
   information  = DIA_PC_HERO_MAGIC_SWORD_1_Info;
   permanent	= FALSE;
   description	= "Ulepsz: Miecz magicznego deszczu (250 z³otych monet)";
};

FUNC INT DIA_PC_HERO_MAGIC_SWORD_1_Condition()
{
    if (Npc_HasItems (hero, Miecz1H17) >=1)
    && (Npc_HasItems (hero, ItMi_Stuff_OldCoin_01) >=250)
	&& (monolog == Innos)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_HERO_MAGIC_SWORD_1_Info()
{
    B_GiveInvItems (hero,PC_THIEF, Miecz1H17, 1);
    CreateInvItems (hero, Miecz1H18, 1);
    B_GiveInvItems (hero, PC_THIEF, ItMi_Stuff_OldCoin_01, 250);
	//PrintScreen	(" ", -1,70,"FONT_OLD_20_WHITE.TGA",2);	
	PrintS_Ext("Miecz magicznego deszczu zosta³ ulepszony!", COL_White);
};

