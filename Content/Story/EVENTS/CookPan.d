func void COOKPAN_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	monolog = CookPan;
	var int smazone_mieso;
	var int ilosc_miesa;
	if (Npc_HasItems (hero, ItFoMuttonRaw) >=1)
	{
		ilosc_miesa = Npc_hasitems (hero, Itfomuttonraw);
		if (ilosc_miesa >0)
		{
			Npc_RemoveInvItems (hero, itfomuttonraw,ilosc_miesa);
			CreateInvItems (hero, itfomutton,ilosc_miesa);
			var string napis_mieso;
			napis_mieso = ConcatStrings (InttoString (ilosc_miesa)," sztuk miêsa usma¿ono.");
			PrintScreen (napis_mieso,-1,70,"font_old_20_white.tga",3);
		};
	};
	};
};


//========================================
//-----------------> NoCookPan
//========================================

INSTANCE DIA_PC_Hero_NoCookPan (C_INFO)
{
   npc          		= PC_Hero;
   nr           		= 999;
   condition    	= NoCookPan_Condition;
   information  	= DIA_PC_Hero_NoCookPan_Info;
   permanent	= 1;
   description		= DIALOG_ENDE;
};
func int NoCookPan_Condition ()
{
 if (monolog==CookPan)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_NoCookPan_Info()
{
    AI_StopProcessInfos	(self);
    self.aivar[AIV_INVINCIBLE]=FALSE;
};

//========================================
//-----------------> 1MUTTON
//========================================

INSTANCE DIA_PC_Hero_1MUTTON (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_1MUTTON_Condition;
   information  = DIA_PC_Hero_1MUTTON_Info;
   permanent	= 1;
   description	= "Usma¿ 1 sztukê miêsa.";
};

FUNC INT DIA_PC_Hero_1MUTTON_Condition()
{
    if (monolog==CookPan)
    && (Npc_HasItems (other, ItFoMuttonRaw) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_1MUTTON_Info()
{
Npc_RemoveInvItems(hero,ItFoMuttonRaw,1);
CreateInvItems	(hero,ItFoMutton,1);
 self.aivar[AIV_INVINCIBLE]=FALSE;
};

//========================================
//-----------------> 2MUTTON
//========================================

INSTANCE DIA_PC_Hero_2MUTTON (C_INFO)
{
   npc          = PC_Hero;
   nr           = 2;
   condition    = DIA_PC_Hero_2MUTTON_Condition;
   information  = DIA_PC_Hero_2MUTTON_Info;
   permanent	= 1;
   description	= "Usma¿ 2 sztuki miêsa.";
};

FUNC INT DIA_PC_Hero_2MUTTON_Condition()
{
    if (monolog==CookPan)
    && (Npc_HasItems (other, ItFoMuttonRaw) >=2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_2MUTTON_Info()
{
Npc_RemoveInvItems(hero,ItFoMuttonRaw,2);
	CreateInvItems	(hero,ItFoMutton,2);
	 self.aivar[AIV_INVINCIBLE]=FALSE;
};

//========================================
//-----------------> 5MUTTON
//========================================

INSTANCE DIA_PC_Hero_5MUTTON (C_INFO)
{
   npc          = PC_Hero;
   nr           = 3;
   condition    = DIA_PC_Hero_5MUTTON_Condition;
   information  = DIA_PC_Hero_5MUTTON_Info;
   permanent	= 1;
   description	= "Usma¿ 5 sztuk miêsa.";
};

FUNC INT DIA_PC_Hero_5MUTTON_Condition()
{
    if (monolog==CookPan)
    && (Npc_HasItems (other, ItFoMuttonRaw) >=5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_5MUTTON_Info()
{
Npc_RemoveInvItems(hero,ItFoMuttonRaw,5);
	CreateInvItems	(hero,ItFoMutton,5);
	 self.aivar[AIV_INVINCIBLE]=FALSE;
};

//========================================
//-----------------> 10MUTTON
//========================================

INSTANCE DIA_PC_Hero_10MUTTON (C_INFO)
{
   npc          = PC_Hero;
   nr           = 4;
   condition    = DIA_PC_Hero_10MUTTON_Condition;
   information  = DIA_PC_Hero_10MUTTON_Info;
   permanent	= 1;
   description	= "Usma¿ 10 sztuk miêsa.";
};

FUNC INT DIA_PC_Hero_10MUTTON_Condition()
{
    if (monolog==CookPan)
    && (Npc_HasItems (other, ItFoMuttonRaw) >=10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_10MUTTON_Info()
{
Npc_RemoveInvItems(hero,ItFoMuttonRaw,10);
	CreateInvItems	(hero,ItFoMutton,10);
	 self.aivar[AIV_INVINCIBLE]=FALSE;
};

//========================================
//-----------------> 50MUTTON
//========================================

INSTANCE DIA_PC_Hero_50MUTTON (C_INFO)
{
   npc          = PC_Hero;
   nr           = 5;
   condition    = DIA_PC_Hero_50MUTTON_Condition;
   information  = DIA_PC_Hero_50MUTTON_Info;
   permanent	= 1;
   description	= "Usma¿ 50 sztuk miêsa.";
};

FUNC INT DIA_PC_Hero_50MUTTON_Condition()
{
    if (monolog==CookPan)
    && (Npc_HasItems (other, ItFoMuttonRaw) >=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_50MUTTON_Info()
{
Npc_RemoveInvItems(hero,ItFoMuttonRaw,50);
	CreateInvItems	(hero,ItFoMutton,50);
	 self.aivar[AIV_INVINCIBLE]=FALSE;
};

//========================================
//-----------------> 1MUTTON
//========================================

INSTANCE DIA_PC_Hero_MOLW (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_MOLW_Condition;
   information  = DIA_PC_Hero_MOLW_Info;
   permanent	= 1;
   description	= "Usma¿ w¹tróbkê kretoszczura.";
};

FUNC INT DIA_PC_Hero_MOLW_Condition()
{
    if (monolog==CookPan)
    && (Npc_HasItems (other, ItFo_MoleratW) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_MOLW_Info()
{
Npc_RemoveInvItems(hero,ItFo_MoleratW,1);
CreateInvItems	(hero,ItFo_MoleratWS,1);
 self.aivar[AIV_INVINCIBLE]=FALSE;
};
//========================================
//-----------------> 1MUTTON
//========================================

INSTANCE DIA_PC_Hero_MOLW2 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_MOLW2_Condition;
   information  = DIA_PC_Hero_MOLW2_Info;
   permanent	= 1;
   description	= "Usma¿ 10 w¹tróbek kretoszczura.";
};

FUNC INT DIA_PC_Hero_MOLW2_Condition()
{
    if (monolog==CookPan)
    && (Npc_HasItems (other, ItFo_MoleratW) >=10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_MOLW2_Info()
{
Npc_RemoveInvItems(hero,ItFo_MoleratW,10);
CreateInvItems	(hero,ItFo_MoleratWS,10);
 self.aivar[AIV_INVINCIBLE]=FALSE;
};