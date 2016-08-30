// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Velaya_EXIT(C_INFO)
{
	npc             = EBR_108_Velaya;
	nr              = 999;
	condition	= DIA_Velaya_EXIT_Condition;
	information	= DIA_Velaya_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Velaya_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Velaya_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Velaya_HELLO1 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 1;
   condition    = DIA_Velaya_HELLO1_Condition;
   information  = DIA_Velaya_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Velaya_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Velaya_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Velaya_HELLO1_03_01"); //Hej, co ty tu robisz? Nie s¹dzi³am, ¿e po magnackich komnatach mog¹ siê pa³êtaæ inni skazañcy.
    AI_Output (self, other ,"DIA_Velaya_HELLO1_03_02"); //Jestem Velaya, niewolnica Gomeza.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Velaya_HELLO2 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 2;
   condition    = DIA_Velaya_HELLO2_Condition;
   information  = DIA_Velaya_HELLO2_Info;
   permanent	= FALSE;
   description	= "Szuka³em ciê. Gdy zrzucali mnie do Kolonii, widzia³em jak spuszczono ciê za Barierê wraz z ³adunkiem. ";
};

FUNC INT DIA_Velaya_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Velaya_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO2_15_01"); //Szuka³em ciê. Gdy zrzucali mnie do Kolonii, widzia³em jak spuszczono ciê za Barierê wraz z ³adunkiem. 
    AI_Output (other, self ,"DIA_Velaya_HELLO2_03_02"); //Zastanawia³em siê, co siê z tob¹ sta³o. Stra¿nicy mówili, ¿e kobiety w Kolonii zostaj¹ niewolnicami.
    AI_Output (self, other ,"DIA_Velaya_HELLO2_03_03"); //Tak, niestety. To przeklête miejsce a¿ siê roi od przestêpców, którzy nie wiedz¹ jak traktowaæ damy. Cieszê siê, ¿e przynajmniej póki co mogê zostaæ tu, na górze.
    AI_Output (self, other ,"DIA_Velaya_HELLO2_03_04"); //Sira i Serafia, gdy znudzi³y siê Gomezowi, zosta³y wys³ane do szorowania pod³óg.
    AI_Output (self, other ,"DIA_Velaya_HELLO2_03_05"); //Jednak ja nie zamierzam pozwalaæ siê wykorzystywaæ facetom. Przyjdzie dzieñ, gdy wszyscy zap³ac¹ mi za takie traktowanie.
    AI_Output (self, other ,"DIA_Velaya_HELLO2_03_06"); //Bardzo mi mi³o, ¿e siê mn¹ zainteresowa³eœ. Od razu widaæ, ¿e nie jesteœ taki jak ci obleœni skazañcy.
	
	if MIS_Women == LOG_RUNNING
	{
	MIS_Women = LOG_SUCCESS;
	//Log_CreateTopic(CH1_Women, LOG_MISSION); //fix
	Log_SetTopicStatus   (CH1_Women, LOG_SUCCESS);
    B_LogEntry               (CH1_Women,"Pozna³em w koñcu tê tajemnicz¹ kobietê - nazywa siê Velaya. Opowiedzia³a mi swoj¹ historiê, o tym jak zosta³a nies³usznie oskar¿ona przez Sêdziego z Khorinis. Myœlê, ¿e Velaya ma potencja³, o którym kiedyœ dowie siê ca³y œwiat. Cieszê siê, ¿e jest ca³a i zdrowa.");
	b_givexp (100);
	};
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Velaya_HELLO3 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 3;
   condition    = DIA_Velaya_HELLO3_Condition;
   information  = DIA_Velaya_HELLO3_Info;
   permanent	= FALSE;
   description	= "Mam wra¿enie, ¿e nies³usznie wrzucili ciê do Kolonii...";
};

FUNC INT DIA_Velaya_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Velaya_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Velaya_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO3_15_01"); //Mam wra¿enie, ¿e nies³usznie wrzucili ciê do Kolonii...
    AI_Output (self, other ,"DIA_Velaya_HELLO3_03_02"); //Ech... nie chcê o tym gadaæ. Powiem ci tylko, ¿e mia³am kiedyœ tendencje do ratowania œwiata. Chcia³am dobrze, ale kilku osobom siê to nie spodoba³o. 
    AI_Output (self, other ,"DIA_Velaya_HELLO3_03_03"); //Wrobili mnie w pewne przestêpstwo, a ja stawia³am opór.
    AI_Output (self, other ,"DIA_Velaya_HELLO3_03_04"); //Sêdzia z Khorinis nie chcia³ mnie w ogóle s³uchaæ. To kawa³ drania! Od razu wys³a³ mnie za Barierê. 
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Velaya_HELLO4 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 4;
   condition    = DIA_Velaya_HELLO4_Condition;
   information  = DIA_Velaya_HELLO4_Info;
   permanent	= FALSE;
   description	= "Co mo¿esz mi powiedzieæ o swoich kole¿ankach?";
};

FUNC INT DIA_Velaya_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Velaya_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Velaya_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO4_15_01"); //Co mo¿esz mi powiedzieæ o swoich kole¿ankach?
    AI_Output (self, other ,"DIA_Velaya_HELLO4_03_02"); //W³aœciwie za dobrze ich nie znam. S¹ strasznie zapracowane i nie maj¹ czasu na pogawêdki.
    AI_Output (self, other ,"DIA_Velaya_HELLO4_03_03"); //Serafia powiedzia³a mi jednak, ¿e gdy w zamku jest zbyt wiele kobiet, Magnaci wysy³aj¹ czêœæ z nich do Obozu Bractwa jako prezent dla tamtejszego przywódcy. 
    AI_Output (self, other ,"DIA_Velaya_HELLO4_03_04"); //Pewnie ka¿d¹ z nas to spotka, gdy znudzimy siê Gomezowi...
    AI_Output (self, other ,"DIA_Velaya_HELLO4_03_05"); //Co do moich kole¿anek z do³u, to staraj siê ich nie zaczepiaæ. Nie mog¹ z nikim rozmawiaæ bez pozwolenia Gomeza.
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Velaya_HELLO5 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 5;
   condition    = DIA_Velaya_HELLO5_Condition;
   information  = DIA_Velaya_HELLO5_Info;
   permanent	= FALSE;
   description	= "Ruszam w dalsz¹ drogê. Mam nadziejê, ¿e jeszcze siê spotykamy.";
};

FUNC INT DIA_Velaya_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Velaya_HELLO2))
    && (Npc_KnowsInfo (hero, DIA_Velaya_HELLO3))
    && (Npc_KnowsInfo (hero, DIA_Velaya_HELLO4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Velaya_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO5_15_01"); //Ruszam w dalsz¹ drogê. Mam nadziejê, ¿e jeszcze siê spotykamy.
    AI_Output (self, other ,"DIA_Velaya_HELLO5_03_02"); //Te¿ mam tak¹ nadzieje. Mi³o siê z tob¹ rozmawia³o. Powodzenia na szlaku!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_Velaya_HELLO6 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 6;
   condition    = DIA_Velaya_HELLO6_Condition;
   information  = DIA_Velaya_HELLO6_Info;
   permanent	= FALSE;
   description	= "Zabi³em Gomeza. Teraz jesteœcie wolne!";
};

FUNC INT DIA_Velaya_HELLO6_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(ebr_100_gomez);
    if (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Velaya_HELLO6_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO6_15_01"); //Zabi³em Gomeza. Teraz jesteœcie wolne!
    AI_Output (self, other ,"DIA_Velaya_HELLO6_03_02"); //Dziêki Innosowi! Widzê, ¿e œwietny z ciebie wojownik. Jeszcze nikomu nie uda³o siê obaliæ Magnatów.
    AI_Output (self, other ,"DIA_Velaya_HELLO6_03_03"); //W koñcu zakoñcz¹ siê rz¹dy terroru.
    AI_StopProcessInfos	(self);
};

