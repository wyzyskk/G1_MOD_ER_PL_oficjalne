func void B_BuyAttributePoints (var C_NPC typ, var int ATR, var int AtrPlus)
{
	// --------- Umwandeln von var in const
	var int Typ_Atr;
	if 		(ATR == ATR_STRENGTH)	{	Typ_Atr = typ.attribute[ATR_STRENGTH];	}
	else if (ATR == ATR_DEXTERITY)	{	Typ_Atr = typ.attribute[ATR_DEXTERITY];	}
	else if (ATR == ATR_MANA_MAX)	{	Typ_Atr = typ.attribute[ATR_MANA_MAX];	};
	
	// --------- Steigern oder verbieten	
	var string AtrPlusSTRING; AtrPlusSTRING	= IntToString(AtrPlus);
	var string PrintSTRING;  var string PrintSTRING2;   var string PrintSTRING3;  
	var string atrwartosc;
	
	if (!(typ.lp < AtrPlus*2))
	{
		if (Npc_HasItems (hero, ItmiNugget) >=AtrPlus*10) 
		{
		B_GiveInvItems      (hero, self, ItmiNugget, AtrPlus*10);
		if (Typ_Atr + AtrPlus <= 100)
		{	
			typ.lp = typ.lp - AtrPlus*2;
						
			if (ATR == ATR_STRENGTH)
			{
				typ.attribute[ATR_STRENGTH] = typ.attribute[ATR_STRENGTH] + AtrPlus;
				PrintString = ConcatStrings(NAME_BuyAttributeSTR, AtrPlusSTRING);
				PrintSTRING2 = ConcatStrings(PrintString, " = ");
				atrwartosc =  IntToString(hero.attribute[ATR_STRENGTH]);
				PrintSTRING3 = ConcatStrings(PrintSTRING2, atrwartosc);
				PrintS_Ext(PrintSTRING3, COL_Lime);
				//PrintScreen	(PrintSTRING, -1,-1,"FONT_OLD_20_WHITE.TGA",1);
			}
			else if (ATR == ATR_DEXTERITY)
			{
				typ.attribute[ATR_DEXTERITY] = typ.attribute[ATR_DEXTERITY] + AtrPlus;
				PrintString = ConcatStrings(NAME_BuyAttributeDEX, AtrPlusSTRING);
				
				PrintSTRING2 = ConcatStrings(PrintString, " = ");
				atrwartosc =  IntToString(hero.attribute[ATR_DEXTERITY]);
				PrintSTRING3 = ConcatStrings(PrintSTRING2, atrwartosc);
				PrintS_Ext(PrintSTRING3, COL_Lime);
				//PrintScreen	(PrintSTRING, -1,-1,"FONT_OLD_20_WHITE.TGA",1);
			}
			else if (ATR == ATR_MANA_MAX)
			{
				typ.attribute[ATR_MANA_MAX] = typ.attribute[ATR_MANA_MAX] + AtrPlus;
				PrintString = ConcatStrings(NAME_BuyAttributeMAN, AtrPlusSTRING);
				
				PrintSTRING2 = ConcatStrings(PrintString, " = ");
				atrwartosc =  IntToString(hero.attribute[ATR_MANA_MAX]);
				PrintSTRING3 = ConcatStrings(PrintSTRING2, atrwartosc);
				PrintS_Ext(PrintSTRING3, COL_Lime);
				//PrintScreen	(PrintString, -1,-1,"FONT_OLD_20_WHITE.TGA",1);
			};
		}
		else
		{
			PrintScreen	("100 punktów to wartoœæ maksymalna!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
			B_Say (self, other, "$NOLEARNOVERMAX");
		};
		}
		else
		{
		PrintScreen	("Masz za ma³o rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
		};
	}
	else 
	{
	PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
	B_Say (self, other, "$NOLEARNNOPOINTS");
	};
};
