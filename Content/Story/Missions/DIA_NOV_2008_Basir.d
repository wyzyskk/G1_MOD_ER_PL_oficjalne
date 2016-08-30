//*****************************************
// SPRAWDZONE - GOTHIC1210
//*****************************************
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Basir_EXIT(C_INFO)
{
	npc             = NOV_2008_Basir;
	nr              = 999;
	condition	= DIA_Basir_EXIT_Condition;
	information	= DIA_Basir_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Basir_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Basir_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Basir_HELLO5 (C_INFO)
{
   npc          = NOV_2008_Basir;
   nr           = 5;
   condition    = DIA_Basir_HELLO5_Condition;
   information  = DIA_Basir_HELLO5_Info;
   permanent	= FALSE;
   description	= "Czym siê zajmujesz?";
};

FUNC INT DIA_Basir_HELLO5_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Basir_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Basir_HELLO5_15_01"); //Czym siê zajmujesz?
    AI_Output (self, other ,"DIA_Basir_HELLO5_03_02"); //Jestem kucharzem. Trochê gotujê, trochê palê. Jak ka¿dy.
    AI_Output (other, self ,"DIA_Basir_HELLO5_15_03"); //Mo¿esz mi sprzedaæ przepisy?
    AI_Output (self, other ,"DIA_Basir_HELLO5_03_04"); //Jasne. Jeœli zap³acisz.
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,	"Basir z Obozu Bractwa sprzeda mi przepisy.");//fix
};
//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Basir_TRADE (C_INFO)
{
   npc          = NOV_2008_Basir;
   nr           = 5;
   condition    = DIA_Basir_TRADE_Condition;
   information  = DIA_Basir_TRADE_Info;
   permanent	= true;
   trade 		= true;
   description	= "Co oferujesz?";
};

FUNC INT DIA_Basir_TRADE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Basir_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Basir_TRADE_15_01"); //Co oferujesz?
    AI_Output (self, other ,"DIA_Basir_TRADE_03_02"); //Sam zobacz.
};
//========================================
//-----------------> LIFE
//========================================
//edit by Nocturn
INSTANCE DIA_Basir_LIFE (C_INFO)
{
   npc          = NOV_2008_Basir;
   nr           = 3;
   condition    = DIA_Basir_LIFE_Condition;
   information  = DIA_Basir_LIFE_Info;
   permanent	= FALSE;
   description	= "Jak wygl¹da ¿ycie tutaj?";
};

FUNC INT DIA_Basir_LIFE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Basir_LIFE_Info()
{
    AI_Output (other, self ,"DIA_Basir_LIFE_15_01"); //Jak wygl¹da ¿ycie tutaj?
    AI_Output (self, other ,"DIA_Basir_LIFE_03_02"); //Nie jest Ÿle. Mamy co jeœæ i paliæ. 
    AI_Output (self, other ,"DIA_Basir_LIFE_03_03"); //Bractwo jest nieŸle zorganizowane.
    AI_Output (self, other ,"DIA_Basir_LIFE_03_04"); //Ka¿dy ma swoj¹ sta³¹ pracê. Przyk³adowo ja gotujê.
    AI_Output (self, other ,"DIA_Basir_LIFE_03_05"); //Inni handluj¹, odbieraj¹ dostawy lub po prostu zbieraj¹ ziele.
    AI_Output (self, other ,"DIA_Basir_LIFE_03_06"); //Z tym jest najwiêcej k³opotów.
    AI_Output (other, self ,"DIA_Basir_LIFE_15_07"); //Dlaczego?
    AI_Output (self, other ,"DIA_Basir_LIFE_03_08"); //Gdy przepracujesz ca³y dzieñ, masz prawo odpoczywaæ drugi dzieñ. 
    AI_Output (self, other ,"DIA_Basir_LIFE_03_09"); //Jednak stanowisko pracy mo¿na opuœciæ wy³¹cznie, je¿eli ktoœ przyjdzie ciê zmieniæ. 
    AI_Output (self, other ,"DIA_Basir_LIFE_03_10"); //Czêsto ktoœ po prostu nie przychodzi...
    AI_Output (other, self ,"DIA_Basir_LIFE_15_11"); //Baalowie nie reaguj¹?
    AI_Output (self, other ,"DIA_Basir_LIFE_03_12"); //Nie. Wol¹ nie wtr¹caæ siê w sprawy Nowicjuszy.
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Basir_HELLO4 (C_INFO)
{
   npc          = NOV_2008_Basir;
   nr           = 4;
   condition    = DIA_Basir_HELLO4_Condition;
   information  = DIA_Basir_HELLO4_Info;
   permanent	= FALSE;
   description	= "Czy ka¿dy w Bractwie wierzy w Œni¹cego?";
};

FUNC INT DIA_Basir_HELLO4_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Basir_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Basir_HELLO4_15_01"); //Czy ka¿dy w Bractwie wierzy w Œni¹cego?
    AI_Output (self, other ,"DIA_Basir_HELLO4_03_02"); //Tak w³aœciwie to nie. Wielu przybywa do Obozu, szukaj¹c ³atwego ¿ycia.
    AI_Output (self, other ,"DIA_Basir_HELLO4_03_03"); //Nienawidzê takich wyzyskiwaczy. My pracujemy, a oni licz¹, ¿e dostan¹ coœ za darmo. 
    AI_Output (self, other ,"DIA_Basir_HELLO4_03_04"); //Uwa¿am, ¿e ka¿dy Nowicjusz powinien przejœæ próbê wiary, ot co.
    AI_Output (self, other ,"DIA_Basir_HELLO4_03_05"); //Z pewnoœci¹ by³oby mniej chêtnych. 
    AI_Output (other, self ,"DIA_Basir_HELLO4_15_06"); //Rozumiem, ¿e aby do³¹czyæ do Obozu nie trzeba siê zbytnio wysilaæ.
    AI_Output (self, other ,"DIA_Basir_HELLO4_03_07"); //W sumie to wystarczy dobrze k³amaæ. Baalowie praktycznie ca³y czas s¹ odurzeni zielem.
    AI_Output (self, other ,"DIA_Basir_HELLO4_03_08"); //Nie potrafi¹ oceniæ, jakie kto ma intencje. 
};

//////////////////////////////////////////////////////////////////
// SERIA ZABÓJSTW W Bractwie
///////////////////////////////////////////////////////////////////

//========================================
//-----------------> ABOUT_KILLER
//========================================

INSTANCE DIA_Basir_ABOUT_KILLER (C_INFO)
{
   npc          = NOV_2008_Basir;
   nr           = 4;
   condition    = DIA_Basir_ABOUT_KILLER_Condition;
   information  = DIA_Basir_ABOUT_KILLER_Info;
   permanent	= FALSE;
   description	= "Wiesz coœ o ostatnim morderstwie?";
};

FUNC INT DIA_Basir_ABOUT_KILLER_Condition()
{
    if (MIS_SeryjneZabojstwa == LOG_RUNNING)
    {
    return TRUE;
    };
};

FUNC VOID DIA_Basir_ABOUT_KILLER_Info()
{
    AI_Output (other, self ,"DIA_Basir_ABOUT_KILLER_15_01"); //Wiesz coœ o ostatnim morderstwie?
    AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_02"); //Chyba jako jedyny odwa¿y³em siê pójœæ i obejrzeæ cia³o.
	AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_03"); //Zauwa¿y³em, ¿e w trupa jest coœ wbite. Cholera, ten goœæ to jakiœ szaleniec. 
	AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_04"); //Zabójstwo z zimn¹ krwi¹, krwi¹, która sp³ywa³a mu po rêkach. Coœ okropnego. 
	AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_05"); //Zrozumiem wiele... walkê, wojnê, zemstê, ale to?
	AI_Output (other, self ,"DIA_Basir_ABOUT_KILLER_15_06"); //Masz jakieœ podejrzenia?
	AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_07"); //Nie. Talas ca³y czas bredzi, ¿e to na pewno Harlok. Nie wierzê w to. By³em w jego chacie i nie znalaz³em nic podejrzanego.
	AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_08"); //Zreszt¹ ten goœæ siê trochê uspokoi³. Po tej ca³ej aferze z przywo³aniem spokornia³. 
	AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_09"); //Mówi³ mi, ¿e wiele rzeczy ¿a³uje. Ufam mu. Spróbuj znaleŸæ inny punkt zaczepienia. W koñcu zginê³o trzech ludzi, a nie jeden.
	AI_Output (self, other ,"DIA_Basir_ABOUT_KILLER_03_10"); //Przeszukaj inne miejsca zbrodni i dopiero wtedy wyci¹gnij wnioski. Na razie nie masz nic konkretnego.
	B_LogEntry               (CH1_SeryjneZabojstwa,"Basir powiedzia³ mi, ¿e w cia³o ofiary wbito jakieœ przedmioty. Zdradzi³ te¿, ¿e Talas podejrzewa o zabójstwo Harloka. On siê z tym zdaniem jednak w ogóle nie zgadza. Poradzi³ mi, aby zbada³ inne miejsca zbrodni i dopiero wtedy wyci¹gn¹³ wnioski.");
};