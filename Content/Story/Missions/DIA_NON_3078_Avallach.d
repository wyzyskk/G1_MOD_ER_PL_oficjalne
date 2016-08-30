// *Script was make in Easy Dialog Maker (EDM)
/*
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Avallach_EXIT(C_INFO)
{
	npc             = NON_3078_Avallach;
	nr              = 999;
	condition	= DIA_Avallach_EXIT_Condition;
	information	= DIA_Avallach_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Avallach_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Avallach_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Igetinfos
//========================================

INSTANCE DIA_Avallach_Igetinfos (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 1;
   condition    = DIA_Avallach_Igetinfos_Condition;
   information  = DIA_Avallach_Igetinfos_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie informacje.";
};

FUNC INT DIA_Avallach_Igetinfos_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jefrey_Spotkanie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_Igetinfos_Info()
{
    AI_Output (other, self ,"DIA_Avallach_Igetinfos_15_01"); //Mam dla ciebie informacje.
    AI_Output (self, other ,"DIA_Avallach_Igetinfos_03_02"); //Co konkretnie?
    AI_Output (other, self ,"DIA_Avallach_Igetinfos_15_03"); //Za pojawieniem siê Poszukiwaczy w Kolonii stoi niejaki Czarny Mag.
    AI_Output (other, self ,"DIA_Avallach_Igetinfos_15_04"); //Jest wys³annikiem Beliara. Ca³a ta afera ma na celu przygotowanie tego œwiata na przyjœcie s³ugi Beliara.
    AI_Output (self, other ,"DIA_Avallach_Igetinfos_03_05"); //Jakiego s³ugi Beliara?
    AI_Output (other, self ,"DIA_Avallach_Igetinfos_15_06"); //Tego nie wiem.
    AI_Output (self, other ,"DIA_Avallach_Igetinfos_03_07"); //Przypuszczam, ¿e to jakiœ demon.
    AI_Output (self, other ,"DIA_Avallach_Igetinfos_03_08"); //W ka¿dym razie wielkie dziêki.
    B_LogEntry                     (CH1_LowcyPoszukiwaczy,"Avallach by³ zadowolony z informacji, które mu przynios³em. Nie jest wprawdzie tego zbyt wiele, ale zawsze jesteœmy o krok bli¿ej celu.");

    B_GiveXP (500);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Avallach_HELLO2 (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 2;
   condition    = DIA_Avallach_HELLO2_Condition;
   information  = DIA_Avallach_HELLO2_Info;
   permanent	= FALSE;
   description	= "Mo¿esz mi coœ powiedzieæ o walce?";
};

FUNC INT DIA_Avallach_HELLO2_Condition()
{
    if (Wld_IsTime     (00,00,04,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Avallach_HELLO2_15_01"); //Mo¿esz mi coœ powiedzieæ o walce?
    AI_Output (self, other ,"DIA_Avallach_HELLO2_03_02"); //Niestety nie mam czasu.
    AI_Output (self, other ,"DIA_Avallach_HELLO2_03_03"); //Ca³y czas analizujê mapy Kolonii. W koñcu ustalê gdzie znajduje siê Czarny Mag.
    AI_Output (self, other ,"DIA_Avallach_HELLO2_03_04"); //Pamiêtaj, ¿e mamy coraz mniej czasu.
};

//========================================
//-----------------> LikeIt
//========================================

INSTANCE DIA_Avallach_LikeIt (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 3;
   condition    = DIA_Avallach_LikeIt_Condition;
   information  = DIA_Avallach_LikeIt_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Avallach_LikeIt_Condition()
{
    if (Wld_IsTime     (04,00,00,00)) && (Er_StoryBM_Run == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_LikeIt_Info()
{
    AI_Output (self, other ,"DIA_Avallach_LikeIt_03_01"); //Œwietnie, ¿e ciê widzê.
    AI_Output (self, other ,"DIA_Avallach_LikeIt_03_02"); //Jestem prawie pewien, ¿e Czarny Mag zaja³ tê twierdzê.
    AI_Output (other, self ,"DIA_Avallach_LikeIt_15_03"); //W takim razie chodŸmy tam.
    AI_Output (self, other ,"DIA_Avallach_LikeIt_03_04"); //To nie bedzie ³atwa walka. Lepiej siê przygotuj.
    B_LogEntry                     (CH1_WlakaZczarym,"Avallach jest pewien, ¿e Czarny Mag znajduje siê w Górskiej Fortecy. Muszê przygotowaæ siê do walki. £owca Poszukiwaczy z pewnoœci¹ bêdzie mi towarzyszy³.");

    B_GiveXP (150);
};

// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> LetsgonnahatexD
//========================================

INSTANCE DIA_Avallach_LetsgonnahatexD (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 1;
   condition    = DIA_Avallach_LetsgonnahatexD_Condition;
   information  = DIA_Avallach_LetsgonnahatexD_Info;
   permanent	= FALSE;
   description	= "Jestem gotowy!";
};

FUNC INT DIA_Avallach_LetsgonnahatexD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Avallach_LikeIt))
    && (Wld_IsTime     (04,00,00,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_LetsgonnahatexD_Info()
{
    AI_Output (other, self ,"DIA_Avallach_LetsgonnahatexD_15_01"); //Jestem gotowy!
    AI_Output (self, other ,"DIA_Avallach_LetsgonnahatexD_03_02"); //Zatem chodŸmy.
    

    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"castle");
    B_LogEntry                     (CH1_WlakaZczarym,"Wyruszyliœmy. Z oddali widzê, ¿e z tym miejscem jest coœ nie tak...");
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> INFOS_LESTER
//========================================

INSTANCE DIA_Avallach_INFOS_LESTER (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 1;
   condition    = DIA_Avallach_INFOS_LESTER_Condition;
   information  = DIA_Avallach_INFOS_LESTER_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Avallach_INFOS_LESTER_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_Psionic_BLACK_MAGE_START))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_INFOS_LESTER_Info()
{
    AI_Output (self, other ,"DIA_Avallach_INFOS_LESTER_03_01"); //Dobrze, ¿e spotka³eœ swego przyjaciela. Mo¿e nie wygl¹da masywnie, ale z pewnoœci¹ oka¿e siê pomocny.
    AI_Output (self, other ,"DIA_Avallach_INFOS_LESTER_03_02"); //Ruszajmy dalej.
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Zabity
//========================================

INSTANCE DIA_Avallach_Zabity (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 2;
   condition    = DIA_Avallach_Zabity_Condition;
   information  = DIA_Avallach_Zabity_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Avallach_Zabity_Condition()
{
    if (Npc_GetDistToWP (self, "LOCATION_19_03_PATH_RUIN7") < 1000)
    && (Npc_KnowsInfo (hero, DIA_Avallach_LetsgonnahatexD)) && (Er_StoryBM_Run == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_Zabity_Info()
{
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_01"); //Aagh!
    AI_Output (other, self ,"DIA_Avallach_Zabity_15_02"); //Co siê sta³o?
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_03"); //Dosta³em!
    AI_Output (other, self ,"DIA_Avallach_Zabity_15_04"); //Co? Gdzie? 
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_05"); //Te potwory widocznie s¹ w stanie zatruwaæ przeciwników.
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_07"); //Nie prze¿yjê bez lekarstwa!
  //  AI_Output (self, other ,"DIA_Avallach_Zabity_03_08"); //Pomó¿ mi!
    AI_Output (other, self ,"DIA_Avallach_Zabity_15_09"); //Co mam zrobiæ?
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_10"); //Nic. Zanim odnajdziesz lekarstwo minie sporo czasu.
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_11"); //A przecie¿ Czarny Mag wie, ¿e tu jesteœmy.
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_12"); //Z pewmoœci¹ przyspieszy swoje plugawe obrzêdy.
    AI_Output (self, other ,"DIA_Avallach_Zabity_03_13"); //IdŸ! Pokonaj go. Mn¹ siê nie przejmuj.
    MIS_lekiDlaAva = LOG_RUNNING;
	uplyw_czasu = 10 * 60; // 8 min //10 -1.3 wer
    Log_CreateTopic            (CH1_lekiDlaAva, LOG_MISSION);
    Log_SetTopicStatus       (CH1_lekiDlaAva, LOG_RUNNING);
    B_LogEntry                     (CH1_lekiDlaAva,"Stan¹³em przed bardzo trudn¹ decyzj¹. Avallach zosta³ postrzelony przez Poszukiwacza truj¹cym be³tem. D³ugo nie po¿yje bez lekarstwa. Muszê udaæ siê do jakiegoœ maga lub alchemika, który przygotuje miksturê. Z drugiej jednak strony Czarny Mag w³aœnie odprawia swe obrzêdy. Strach pomysleæ co siê stanie, gdy dobiegn¹ koñca.");
   // czasoumilacz ();
   Npc_ExchangeRoutine (self, "castle2");
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Lekikurwa
//========================================

INSTANCE DIA_Avallach_Lekikurwa (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 1;
   condition    = DIA_Avallach_Lekikurwa_Condition;
   information  = DIA_Avallach_Lekikurwa_Info;
   permanent	= FALSE;
   description	= "Mam lek!";
};

FUNC INT DIA_Avallach_Lekikurwa_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Avallach_Zabity))
    && (Npc_HasItems (other, LekAva) >=1) && (Er_StoryBM_Run == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_Lekikurwa_Info()
{
    AI_Output (other, self ,"DIA_Avallach_Lekikurwa_15_01"); //Mam lek!
    AI_Output (self, other ,"DIA_Avallach_Lekikurwa_03_02"); //Wielkie dziêki, ch³opcze!
    if (Npc_IsDead(NON_3073_Czarny_Mag))
    {
        AI_Output (self, other ,"DIA_Avallach_Lekikurwa_03_03"); //Naprawdê zabi³eœ Czarnego Maga?
        AI_Output (self, other ,"DIA_Avallach_Lekikurwa_03_04"); //Do tego zd¹¿y³eœ przynieœæ mi lek?
        AI_Output (self, other ,"DIA_Avallach_Lekikurwa_03_05"); //Jestem pe³en podziwu dla twych umiejêtnoœci.
        B_LogEntry                     (CH1_lekiDlaAva,"Zd¹¿y³em pokonaæ Czarnego Maga oraz przynieœæ leki dla Avallacha.");
        Log_SetTopicStatus       (CH1_lekiDlaAva, LOG_SUCCESS);
        MIS_lekiDlaAva = LOG_SUCCESS;

        B_GiveXP (1500);
        CreateInvItems (self, ItMiNugget, 350);
        B_GiveInvItems (self, other, ItMiNugget, 350);
        CreateInvItems (self, ItFo_Potion_Strength_01, 1);
        B_GiveInvItems (self, other, ItFo_Potion_Strength_01, 1);
    }
    else
    {
		AI_Output (self, other ,"DIA_Avallach_Lekikurwa_03_06"); //Przynios³eœ mi lek, ale Czarny Mag wci¹¿ ¿yje. Nie wiem, czy zd¹¿ysz na czas.
   
		B_LogEntry                     (CH1_lekiDlaAva,"Przynios³em lek Avallachowi. Z Czarnym Magiem jakoœ sobiê poradzê.");
		/*Log_SetTopicStatus       (CH1_lekiDlaAva, LOG_SUCCESS);
		MIS_lekiDlaAva = LOG_SUCCESS;
		CreateInvItems (self, ItFo_Potion_Dex_01, 1);
		B_GiveInvItems (self, other, ItFo_Potion_Dex_01, 1);

		B_GiveXP (800);
 };   */
 /*
        Log_SetTopicStatus       (CH1_lekiDlaAva, LOG_SUCCESS);
        MIS_lekiDlaAva = LOG_SUCCESS;
		uplyw_czasu = 0;
        B_GiveXP (1500);
        CreateInvItems (self, ItMiNugget, 350);
        B_GiveInvItems (self, other, ItMiNugget, 350);
        CreateInvItems (self, ItFo_Potion_Strength_01, 1);
        B_GiveInvItems (self, other, ItFo_Potion_Strength_01, 1);
 };
};

//========================================
//-----------------> SUKCES
//========================================

INSTANCE DIA_Avallach_SUKCES (C_INFO)
{
   npc          = NON_3078_Avallach;
   nr           = 1;
   condition    = DIA_Avallach_SUKCES_Condition;
   information  = DIA_Avallach_SUKCES_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Avallach_SUKCES_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(NON_3073_Czarny_Mag);
    if (Npc_IsDead(NON_3073_Czarny_Mag)) && (Er_StoryBM_Run == true)
    && (MIS_lekiDlaAva == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Avallach_SUKCES_Info()
{
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_01"); //A wiêc wracasz ca³y. Uda³o ci siê pokonaæ Czarnego Maga. 
    AI_Output (other, self ,"DIA_Avallach_SUKCES_15_02"); //Gdyby nie ty, pewnie nigdy bym nie pomyœla³ ¿eby wróciæ do starej Górskiej Fortecy.
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_03"); //Chcesz powiedzieæ, ¿e ju¿ tu wczeœniej by³eœ?
    AI_Output (other, self ,"DIA_Avallach_SUKCES_15_04"); //Tak. Razem z Lesterem szukaliœmy kamienia ogniskuj¹cego.
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_05"); //Kamienia ogniskuj¹cego powiadasz... Myœlê, ¿e Czarny Mag chcia³ go wykorzystaæ do swojego rytua³u.
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_06"); //Chcia³ zogniskowaæ moc bêd¹c¹ w duszach, które zbierali Poszukiwacze.
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_07"); //Przypuszczam, ¿e Poszukiwacze nie mogli znaleŸæ kamienia, Mag planowa³ co dlaej zrobiæ. 
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_08"); //Zaskoczyliœmy go.
    AI_Output (other, self ,"DIA_Avallach_SUKCES_15_09"); //Co teraz z sob¹ zrobisz?
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_10"); //Razem z pozosta³ymi ³owcami powinnismy znaleŸæ sobie jakieœ bezpieczne miejsce. Sytuacja w Kolonii jest dosyæ nieciekawa.
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_11"); //Mo¿esz mi coœ zaproponowaæ?
    AI_Output (other, self ,"DIA_Avallach_SUKCES_15_12"); //W dolinie za Starym Obozem jest chata samotnego mysliwego. Poza tym jest jeszcze Nowy Obóz.
    AI_Output (self, other ,"DIA_Avallach_SUKCES_03_13"); //Dziêki. Coœ sobiê wybiorê.
    Npc_ExchangeRoutine (self, "karczma");
    B_givexp (250);
};


*/