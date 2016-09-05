// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Ur_Gran_EXIT(C_INFO)
{
	npc             = Ur_Gran;
	nr              = 999;
	condition	= DIA_Ur_Gran_EXIT_Condition;
	information	= DIA_Ur_Gran_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Ur_Gran_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ur_Gran_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Ur_Gran_HELLO1 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 1;
   condition    = DIA_Ur_Gran_HELLO1_Condition;
   information  = DIA_Ur_Gran_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ur_Gran_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ur_Gran_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_01"); //KHROTOK JABARTH!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_02"); //Czego tu szukasz cz³owiek?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_03"); //Nie wolno ci siê tu pa³êtaæ. Tu byæ sala tronowa miasta orków.
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO1_15_04"); //No, no. Widzê, ¿e nawet lepiej w³adasz jêzykiem ludzi ni¿ reszta twoich pobratymców.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_05"); //Ja byæ doœwiadczony wojownik, stoczyæ wiele bitew przeciwko czerwonym ¿o³nierzom.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_06"); //Te przeklête szubrawcy zniewalaæ moich ludzi i zmuszaæ do niewolniczej pracy w kopalniach.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO1_03_07"); //Ale ju¿ wkrótce nadejœæ dzieñ zap³aty i œmierdz¹cy Gomez utonie we w³asnej krwi!
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO1_15_08"); //Tu siê zgadzamy.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Ur_Gran_HELLO2 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 2;
   condition    = DIA_Ur_Gran_HELLO2_Condition;
   information  = DIA_Ur_Gran_HELLO2_Info;
   permanent	= FALSE;
   description	= "Czy wiesz jak mogê dostaæ siê do Œwi¹tyni Œni¹cego?";
};

FUNC INT DIA_Ur_Gran_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ur_Gran_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ur_Gran_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO2_15_01"); //Czy wiesz jak mogê dostaæ siê do Œwi¹tyni Œni¹cego?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_02"); //RUSHTASOK Cz³owiek byæ g³upi, czy jak?!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_03"); //Œwi¹tynia KRUSHAK jest zamkniêta, nie dostanie siê tam nikt - ani cz³owiek ani ork.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_04"); //Tylko syn ducha znaæ sposób na dostanie siê do œwi¹tyni KRUSHAK.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO2_03_05"); //I z pewnoœci¹ nie podziel¹ siê wiedz¹ z Obcym, takim jak ty!
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Ur_Gran_HELLO3 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 3;
   condition    = DIA_Ur_Gran_HELLO3_Condition;
   information  = DIA_Ur_Gran_HELLO3_Info;
   permanent	= FALSE;
   description	= "Czy znasz szamana imieniem Ur-Shak?";
};

FUNC INT DIA_Ur_Gran_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ur_Gran_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ur_Gran_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO3_15_01"); //Czy znasz szamana imieniem Ur-Shak?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_02"); //Czy Ur-Gran znaæ? Oczywiœcie, ¿e tak!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_03"); //Za kogo ty mnie masz cz³owiek?!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_04"); //Ur-Shak byæ zdrajca! On siê wyprzeæ KRUSHAK i mówiæ o nim bluŸnierstwa.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_05"); //Gdy Ur-Gran spotkaæ Ur-Shak, polaæ siê krew!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO3_03_06"); //Nasz bóg nie tolerowaæ takiej zdrady!
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Ur_Gran_HELLO4 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 4;
   condition    = DIA_Ur_Gran_HELLO4_Condition;
   information  = DIA_Ur_Gran_HELLO4_Info;
   permanent	= FALSE;
   description	= "Co mo¿esz mi powiedzieæ o Œni¹cym?";
};

FUNC INT DIA_Ur_Gran_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ur_Gran_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ur_Gran_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO4_15_01"); //Co mo¿esz mi powiedzieæ o Œni¹cym?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_02"); //On byæ naszym bogiem od wieków. Œwi¹tynia powsta³a w czasach Pradawnych.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_03"); //My ofiarowaæ mu podarki i oddawaæ czeœæ. My d¹¿yæ do wielkie przebudzenie KRUSHAK!
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO4_15_04"); //Wielkie przebudzenie?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_05"); //Cz³owiek sam siê przekona ju¿ nied³ugo!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_06"); //Gdy KRUSHAK siê przebudziæ, zniszczyæ wszystkie siedliska Morr na œwiecie. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_07"); //Jeszcze po¿a³ujecie tego, ¿e nie poddaliœcie siê w tej wojnie!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_08"); //Pierwsi za grzechy zap³ac¹ wstrêtne ludzie z bagien. Oni byæ zdrajcy i przestaæ wierzyæ w KRUSHAK.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO4_03_09"); //Ich Obóz ju¿ wkrótce bêdzie nasz!
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Ur_Gran_HELLO5 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 5;
   condition    = DIA_Ur_Gran_HELLO5_Condition;
   information  = DIA_Ur_Gran_HELLO5_Info;
   permanent	= FALSE;
   description	= "Sk¹d wiesz, ¿e Bractwo przesta³o wyznawaæ Œni¹cego?";
};

FUNC INT DIA_Ur_Gran_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ur_Gran_HELLO4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ur_Gran_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO5_15_01"); //Sk¹d wiesz, ¿e Bractwo przesta³o wyznawaæ Œni¹cego?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_02"); //Powiedzieæ nam o tym przyjaciel Kalom.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_03"); //Jakiœ czas temu KRUSHAK zes³aæ nam wizjê, w której powiedzieæ, ¿e nied³ugo do miasta przyjœæ jego najwierniejszy s³uga.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_04"); //My musieæ pomóc s³uga, my wesprzeæ s³uga!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_05"); //Przyjaciel Kalom byæ bardzo potê¿na mag, przyprowadziæ ze sob¹ wielu wojowników i wyznawców.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_06"); //My ugoœciæ Kalom i wpuœciæ go do Œwi¹tynia.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_07"); //KRUSHAK powiedzieæ, ¿e to Kalom go zbudziæ.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_08"); //Podczas wizyty w naszym mieœcie Kalom powiedzieæ o zdradzie ludzi z bagna. On poleciæ nam zniszczyæ ich w pierwszej kolejnoœci.
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO5_15_09"); //Có¿ za ironia, sam nale¿a³ do Bractwa. Zawsze wiedzia³em, ¿e to kawa³ sukinsyna...
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_10"); //Obcy uwa¿aæ co mówi! Kalom byæ wielki Guru i mag. My nie pozwolimy go obra¿aæ.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO5_03_11"); //Jedno z³e s³owo, a mój KRUSH skróciæ cz³owiek o ³eb.
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_Ur_Gran_HELLO6 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 6;
   condition    = DIA_Ur_Gran_HELLO6_Condition;
   information  = DIA_Ur_Gran_HELLO6_Info;
   permanent	= FALSE;
   description	= "Na czym bêdzie polega³ rytua³ Cor Kaloma?";
};

FUNC INT DIA_Ur_Gran_HELLO6_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ur_Gran_HELLO5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ur_Gran_HELLO6_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO6_15_01"); //Na czym bêdzie polega³ rytua³ Cor Kaloma?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO6_03_02"); //On wspólnie z wyznawcami obudziæ KRUSHAK i zostaæ jego arcykap³anem.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO6_03_03"); //On wyzwoliæ potêga orkowych serc. Nasi przodkowie w koñcu przestan¹ byæ ¿ywi i martwi w jednym.
};

//========================================
//-----------------> HELLO7
//========================================

INSTANCE DIA_Ur_Gran_HELLO7 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 7;
   condition    = DIA_Ur_Gran_HELLO7_Condition;
   information  = DIA_Ur_Gran_HELLO7_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o ULU-MULU.";
};

FUNC INT DIA_Ur_Gran_HELLO7_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ur_Gran_HELLO6))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ur_Gran_HELLO7_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO7_15_01"); //Opowiedz mi o ULU-MULU.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_02"); //ULU-MULU byæ symbol przyjaŸni orków i ludzi.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_03"); //Tylko zrêczny orkowy kowal potrafi wykuæ ULU-MULU i mo¿e on przekazaæ go cz³owiek, który jest temu godzien.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_04"); //Sk¹d Obcy zdobyæ ULU-MULU?
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO7_15_05"); //Zrobi³ go dla mnie Tarrok, uwolni³em go z kopalni.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_06"); //To wielki czyn. KRUSHAK z pewnoœci¹ ci to wynagrodziæ.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_07"); //W ka¿dym b¹dŸ razie ULU-MULU to zwyczaj naszego klanu. Nie wszyscy nasi pobratymcy go popieraæ.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_08"); //Berserker we w³asnej osobie zakaza³ stosowania ULU-MULU wœród innych orków.
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO7_15_09"); //Kim jest Berserker?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_10"); //To byæ poprzedni król ork. Cz³owiek go nie spotka, on nie ¿yæ.
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO7_03_11"); //Jego miejsce zaj¹æ Kan, nasz nowy król. On poprowadziæ orki przeciwko ludzie z Myrtany.
};
/*
//========================================
//-----------------> HELLO8
//========================================

INSTANCE DIA_Ur_Gran_HELLO8 (C_INFO)
{
   npc          = Ur_Gran;
   nr           = 8;
   condition    = DIA_Ur_Gran_HELLO8_Condition;
   information  = DIA_Ur_Gran_HELLO8_Info;
   permanent	= FALSE;
   description	= "[SPROWOKUJ] Orkowe œcierwo musi zdechn¹æ!";
};

FUNC INT DIA_Ur_Gran_HELLO8_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ur_Gran_HELLO8_Info()
{
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO8_15_01"); //Orkowe œcierwo musi zdechn¹æ! Niszczycie ludzkie osady, zabijacie i niewolicie! 
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO8_15_02"); //Nie masz prawa do niszczenia w imiê Beliara!
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO8_03_03"); //HA HA HA! Czy cz³owiek wie co mówi?
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO8_03_04"); //Te s³owa zerwaæ przymierze ork - cz³owiek. 
    AI_Output (self, other ,"DIA_Ur_Gran_HELLO8_03_05"); //Skazujesz siê na œmieræ, Obcy.
    AI_Output (other, self ,"DIA_Ur_Gran_HELLO8_15_06"); //Zaraz zbroczysz wasze "œwiête podziemia" krwi¹!
    AI_StopProcessInfos	(self);
	Ur_Gran.guild = GIL_MEATBUG;
	Npc_SetTrueGuild (Ur_Gran,GIL_MEATBUG);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};
*/
