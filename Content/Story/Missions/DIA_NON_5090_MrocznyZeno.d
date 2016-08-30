//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_MrocznyZeno_HELLO1 (C_INFO)
{
   npc          = NON_5091_MrocznyZeno;
   nr           = 1;
   condition    = DIA_MrocznyZeno_HELLO1_Condition;
   information  = DIA_MrocznyZeno_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_MrocznyZeno_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_MrocznyZeno_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO1_03_01"); //A wiêc przepowiednie by³y prawdziwe!
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO1_03_02"); //Œwiêty Nieprzyjaciel to ty!
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO1_15_03"); //O czym ty mówisz?!
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO1_03_04"); //Ukrywasz strach pod mask¹ arogancji i braku szacunku.
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO1_15_05"); //Co tutaj robisz?
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO1_03_06"); //Ta komnata niegdyœ by³a miejscem, w którym kap³ani przygotowywali mikstury.
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO1_03_07"); //Pozwala³y im one kontaktowaæ siê ze Œni¹cym i nie tylko.
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO1_03_08"); //Strzegê tajemnic ksi¹g znajduj¹cych siê tutaj.
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO1_15_09"); //Niech zgadnê. Aby móc poznaæ tajemnice tych ksi¹g, bêdê ciê musia³ pokonaæ?
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO1_03_10"); //Hmm... Mo¿na i tak.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_MrocznyZeno_HELLO2 (C_INFO)
{
   npc          = NON_5091_MrocznyZeno;
   nr           = 2;
   condition    = DIA_MrocznyZeno_HELLO2_Condition;
   information  = DIA_MrocznyZeno_HELLO2_Info;
   permanent	= FALSE;
   description	= "Pokona³em Corristo!";
};

FUNC INT DIA_MrocznyZeno_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_MrocznyZeno_HELLO1))
    && (Npc_IsDead(KDF_8084_CorristoOT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_MrocznyZeno_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO2_15_01"); //Pokona³em Corristo! Teraz kolej na ciebie!
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO2_03_02"); //Nie dziwiê siê, ¿e go pokona³eœ!
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO2_03_03"); //By³ s³aby i naiwny. Œni¹cy go wykorzysta³.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_MrocznyZeno_HELLO3 (C_INFO)
{
   npc          = NON_5091_MrocznyZeno;
   nr           = 3;
   condition    = DIA_MrocznyZeno_HELLO3_Condition;
   information  = DIA_MrocznyZeno_HELLO3_Info;
   permanent	= FALSE;
   description	= "Czy Czarny Mag z wami wspó³pracuje?";
};

FUNC INT DIA_MrocznyZeno_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_MrocznyZeno_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_MrocznyZeno_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO3_15_01"); //Czy Czarny Mag z wami wspó³pracuje?
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO3_03_02"); //Myœla³em, ¿e go zabi³eœ.
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO3_15_03"); //Przestañ ³apaæ mnie za s³owa. Dobrze wiesz, o co mi chodzi!
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO3_03_04"); //Dobrze wiêc. Czarny Mag by³ wys³annikiem Œni¹cego.
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO3_15_05"); //O co chodzi z tym ca³ym "przygotowaniem œwiata"?
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO3_03_06"); //Jak to o co?
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO3_03_07"); //Czarny Mag mia³ tylko uœpiæ wasz¹ czujnoœæ. 
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO3_03_08"); //Nazywacie siê wyznawcami Innosa, a jesteœcie bez³adn¹ zgraj¹.
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO3_03_09"); //Jestem pewien, ¿e ¿aden z Magów Ognia z Klasztoru na Khorinis nawet nie us³yszy o tym, co siê tutaj dzia³o!
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_MrocznyZeno_HELLO4 (C_INFO)
{
   npc          = NON_5091_MrocznyZeno;
   nr           = 99;
   condition    = DIA_MrocznyZeno_HELLO4_Condition;
   information  = DIA_MrocznyZeno_HELLO4_Info;
   permanent	= FALSE;
   description	= "Zginiesz tak samo jak Corristo!";
};

FUNC INT DIA_MrocznyZeno_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_MrocznyZeno_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_MrocznyZeno_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO4_15_01"); //Zginiesz, tak samo jak Corristo!
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO4_03_02"); //Tak œpieszno ci do Innosa? Uwierz mi, ¿e go nie zobaczysz!
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO4_03_03"); //Ju¿ ja siê o to postaram.
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
};