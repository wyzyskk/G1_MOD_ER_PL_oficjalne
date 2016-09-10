//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Patrick_EXIT(C_INFO)
{
	npc             = NON_2056_Patrick;
	nr              = 999;
	condition	= DIA_Patrick_EXIT_Condition;
	information	= DIA_Patrick_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Patrick_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Patrick_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Patrick_HELLO1 (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_HELLO1_Condition;
   information  = DIA_Patrick_HELLO1_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Patrick_HELLO1_Condition()
{
	if (kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Patrick_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO1_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_02"); //Czekam na wejocie do kopalni. Artegor nie chce nas wpuocia.
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_03"); //Ja ju? tu kiedyo by3em, ale tych dwóch jest nowych.
    AI_Output (other, self ,"DIA_Patrick_HELLO1_15_04"); //Trudno jest sie dostaa do kopalni?
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_05"); //Nie, trzeba pogadaa z miejscowymi, ?eby cie poparli.
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_06"); //Artegor, mimo swojej powierzchownooci, nie jest zbyt wymagaj1cy.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Patrick_HELLO2 (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 2;
   condition    = DIA_Patrick_HELLO2_Condition;
   information  = DIA_Patrick_HELLO2_Info;
   permanent	= FALSE;
   description	= "D3ugo ju? tu czekasz?";
};

FUNC INT DIA_Patrick_HELLO2_Condition()
{
	if (kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Patrick_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO2_15_01"); //D3ugo ju? tu czekasz?
    AI_Output (self, other ,"DIA_Patrick_HELLO2_03_02"); //Kilka dni. 
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Patrick_HELLO3 (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 3;
   condition    = DIA_Patrick_HELLO3_Condition;
   information  = DIA_Patrick_HELLO3_Info;
   permanent	= TRUE;
   description	= "Opowiedz mi o...";
};

FUNC INT DIA_Patrick_HELLO3_Condition()
{
	if (kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Patrick_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_15_01"); //Opowiedz mi o...

    Info_ClearChoices		(DIA_Patrick_HELLO3);
	Info_Addchoice 		(DIA_Patrick_HELLO3, DIALOG_BACK, DIA_Patrick_HELLO3_back);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Artegorze", DIA_Patrick_HELLO3_Artegor);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Macie", DIA_Patrick_HELLO3_Matt);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Petro", DIA_Patrick_HELLO3_Gamal);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Spike", DIA_Patrick_HELLO3_Spike);
};

FUNC VOID DIA_Patrick_HELLO3_Artegor()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Artegor_15_01"); //...Artegorze.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_02"); //Pilnuje wejocia do kopalni. To trudny cz3owiek. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_03"); //Nie jednego Kopacza ju? powiesi3.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_04"); //Pewnego dnia dwóch robotników postanowi3o wleYa na palisade i szybko pobiec do kopalni.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_05"); //Gdy zeskakiwali, dorwa3 ich i zmia?d?y3 im czaszki. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_06"); //To by3 straszny widok. 
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Artegor_15_07"); //Lepiej z nim nie zadzieraa.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_08"); //Dok3adnie. Choa teraz jest spokojniejszy.
};

FUNC VOID DIA_Patrick_HELLO3_Matt()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Matt_15_01"); //...Macie.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_02"); //Matt to nasz kucharz.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_03"); //Mo?na u niego kupia coo ciep3ego.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_04"); //Jest mi3y dla nowych.
};

FUNC VOID DIA_Patrick_HELLO3_Gamal()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Gamal_15_01"); //...Petro.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_02"); //Petro? To pupilek Lorenzo. Wykonuje dla niego ró?ne omieciowe zlecenia.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_03"); //Ale jego g3ównym zadaniem jest pilnowanie, aby nowi Kopacze dotarli do Kopalni w jednym kawa3ku. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_04"); //Zarozumia3y typ. Nie przepadam za nim. 
};

FUNC VOID DIA_Patrick_HELLO3_Spike()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Spike_15_01"); //...Spike'u.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Spike_03_02"); //Nie znam go za dobrze.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Spike_03_03"); //Wiem tylko, ?e czegoo tam pilnuje.
};
FUNC VOID DIA_Patrick_HELLO3_back()
{
Info_ClearChoices		(DIA_Patrick_HELLO3);
};

//========================================
//-----------------> IanQuest
//========================================

INSTANCE DIA_Patrick_IanQuest (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_IanQuest_Condition;
   information  = DIA_Patrick_IanQuest_Info;
   permanent	= FALSE;
   description	= "Co mo?esz mi powiedziea o Artchu i Mirzo?";
};

FUNC INT DIA_Patrick_IanQuest_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mirzo_QuestIan)) && (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_IanQuest_Info()
{
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_01"); //Co mo?esz mi powiedziea o Artchu i Mirzo?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_02"); //Co nieco moge ci o nich powiedziea.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_03"); //Artch bardzo dok3adnie wykonuje swoj1 prace. Myole, ?e obawia sie Magnatów.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_04"); //Jego poprzednik nie skonczy3 zbyt dobrze.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_05"); //Myole, ?e jest lojalny wzgledem Starego Obozu.
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_06"); //A Mirzo?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_07"); //Hmm... Ten cz3owiek na mile omierdzi brudnymi sprawkami.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_08"); //Kilka nocy temu nie mog3em zasn1a. Postanowi3em wiec przejoa sie po obozie.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_09"); //Widzia3em jak Mirzo obudzi3 sie, rozejrza3 nerwowo i cichaczem opuoci3 obóz.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_10"); //Wiesz, dok1d móg3 sie udaa?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_11"); //Nie, ale jak chcesz sie tego dowiedziea, to lepiej poczekaj a? zapadnie zmrok.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_12"); //Zaczaj sie gdzieo i jak zobaczysz, ?e Mirzo opuszcza obóz, idY za nim.
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_13"); //Dzieki za rade.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_14"); //Nie ma sprawy.
    B_LogEntry                     (CH1_FoodForOldMine,"W koncu jakieo konkrety. Patrick twierdzi, ?e widzia3 jak Mirzo opuszcza3 obóz po zmroku. Lepiej poczekam, a? sie ociemni.");
	Npc_ExchangeRoutine (GRD_7007_Mirzo, "spisek");
};



//========================================
//-----------------> Nieidz
//========================================

INSTANCE DIA_Patrick_Nieidz (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_Nieidz_Condition;
   information  = DIA_Patrick_Nieidz_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Patrick_Nieidz_Condition()
{
    if (kapitel == 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_Nieidz_Info()
{
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_01"); //Nie idY tam.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_02"); //Niby dlaczego?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_03"); //Stra?nicy atakuj1 kogo popadnie.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_04"); //Stara Kopalnia zosta3a zalana przez podziemn1 rzeke.
    if (Npc_KnowsInfo (hero, Info_Diego_OCWARN))
    {
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_05"); //Znam ju? te historie. Powiedz mi lepiej, co dzieje sie w obozie.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_06"); //Co tu du¿o mówiæ, to wszystko to jakiœ ob³êd. W ogóle od jakiegoœ czasu w obozie przed kopalni¹ nie dzia³o siê najlepiej. 
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_07"); //Gdy wysz³o na jaw, ¿e dostawy nie dochodz¹ w ca³oœci Gomez przys³a³ tu Arto by przej¹³ zarz¹d nad obozem i by wszystkiego dopilnowa³.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_08"); //Nasi nie byli zachwyceni, ¿e przydzielono im kogoœ kto mia³ ich nadzorowaæ. Tym bardziej, ¿e by³ z zewn¹trz, a oni dot¹d rz¹dzili siê liczyæ sami. 
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_09"); //Wszystko jednak jakoœ siê trzyma³o i pewnie trzyma³oby siê nadal gdyby nie zawali³a siê kopalnia. Potem ju¿ wszystko potoczy³o siê lawinowo.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_10"); //Artegor korzystaj¹c z zamieszania zebra³ lojalnych mu stra¿ników i zabi³ Arto, samemu przejmuj¹c w³adzê. Chyba d¹¿y do stworzenia w³asnego obozu. 
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_11"); //Gomez ju¿ wie, ¿e straci³ w³adzê w obozie przy kopalni?
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_12"); //Na szczêœcie nie. Gdy siê o tym dowie, rozpêta siê tu piek³o!
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_13"); //Po tym ca³ym buncie zrobi³o siê tu cholernie niebezpiecznie, a ja nie zamierzam gin¹æ ani za Artegora ani tym bardziej za Gomeza. 
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_14"); //Co wiêc teraz zrobisz? 
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_15"); //Nie wiem. Na razie pokrêcê siê tu i tam, a potem zobaczymy. 
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_16"); //Na pewno nie wrócê jednak tam, gdzie mo¿na straciæ ¿ycie. 
    }
    else
    {
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_17"); //Nie s3ysza3em o tym! Mów dalej.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_18"); //Jeden z Kopaczy, któremu uda3o sie uratowaa, powiedzia3, ?e kopi1c na najni?szym poziomie, trafili na podziemn1 rzeke.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_19"); //Kiedy woda wdar3a sie do szybów, popeka3y podpory i rune3a ca3a górna czeoa.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_20"); //Tylko garstce ludzi uda3o sie wydostaa na powierzchnie.
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_21"); //A co dzieje sie w Starym Obozie?
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_22"); //Tego nie wiem. Nie by3em tam. Nie mamy ?adnych wieoci.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_23"); //Co z obozem przy kopalni?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_24"); //Co tu du¿o mówiæ, to wszystko to jakiœ ob³êd. W ogóle od jakiegoœ czasu w obozie przed kopalni¹ nie dzia³o siê najlepiej. 
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_25"); //Gdy wysz³o na jaw, ¿e dostawy nie dochodz¹ w ca³oœci Gomez przys³a³ tu Arto by przej¹³ zarz¹d nad obozem i by wszystkiego dopilnowa³.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_26"); //Nasi nie byli zachwyceni, ¿e przydzielono im kogoœ kto mia³ ich nadzorowaæ. Tym bardziej, ¿e by³ z zewn¹trz, a oni dot¹d rz¹dzili siê liczyæ sami. 
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_27"); //Wszystko jednak jakoœ siê trzyma³o i pewnie trzyma³oby siê nadal gdyby nie zawali³a siê kopalnia. Potem ju¿ wszystko potoczy³o siê lawinowo.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_28"); //Co siê dok³adnie sta³o?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_29"); //Artegor korzystaj¹c z zamieszania zebra³ lojalnych mu stra¿ników i zabi³ Arto, samemu przejmuj¹c w³adzê. Chyba d¹¿y do stworzenia w³asnego obozu. 
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_30"); //Gomez ju? wie, ?e straci3 w3adze w obozie przy kopalni?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_31"); //Na szczêœcie nie. Gdy siê o tym dowie, rozpêta siê tu piek³o! Zreszt¹ i bez tego po ca³ym tym buncie zrobi³o siê tam cholernie niebezpiecznie. 
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_32"); //A ja nie zamierzam gin¹æ ani za Artegora ani tym bardziej za Gomeza. 
    };

    if (MIS_SytucajaWOM == LOG_RUNNING)
    {
        B_LogEntry                     (CH1_SytucajaWOM,"Od Patricka dowiedzia3em sie, ?e Gomez wys3a3 Arto do obozu przy kopalni. Magnat mia3 tam przez jakio czas sprawowaa w3adze i uspokoia ca31 te sytuacje, jednak podstepny szef Stra?ników, Artegor, postanowi3 go zabia i sam obj1a w3adze w obozie. Gdy Gomez dowie sie, ?e utraci3 wp3ywy tak?e w obozie przed Star1 kopalni1, wocieknie sie.");

        B_GiveXP (150);
    };
 //   AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Brothers
//========================================

INSTANCE DIA_Patrick_Brothers (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_Brothers_Condition;
   information  = DIA_Patrick_Brothers_Info;
   permanent	= FALSE;
   description	= "Wiesz coo o Stra?nikach z Bractwa?";
};

FUNC INT DIA_Patrick_Brothers_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Shawn_Questdadasd))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_Brothers_Info()
{
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_01"); //Wiesz coo o Stra?nikach z Bractwa?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_02"); //Chodzi ci o tych podobnych tobie?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_03"); //Zostali uwiezieni za bram1 do kopalni.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_04"); //Widzia3em tylko trzech.   
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_06"); //Masz zamiar ich odbia?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_07"); //Zapomnij o tym! Stra?nicy od razu cie poszatkuj1.
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_08"); //Co wiec mam zrobia?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_09"); //Podobno Bandyci chc1 poinformowaa Gomeza o tym, co sie tutaj sta3o.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_10"); //Je?eli Magnat dowie sie, ?e do reszty straci3 kontrole nad tym miejscem, zaatakuje buntowników.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_11"); //Przy odrobinie szczeocia powybijaj1 sie nawzajem.
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_12"); //Gdzie znajde tych Bandytów?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_13"); //Jeden z nich stoi przy jaskini i bada sytuacje. 
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_14"); //Spróbuj zaoferowaa mu swoj1 pomoc.
    B_LogEntry                     (CH1_HelpBrothersBra,"Kopacz Patrick zdradzi3 mi, ?e moi Bracia z obozu na bagnie ?yj1, jednak s1 uwiezieni przez ludzi Artegora. Jedynym sposobem na dostanie sie do Stra?ników Owi1tynnych jest pozbycie sie Artegora i ca3ej tej jego bandy. Podobno Bandyci maj1 na to jakio sposób.");

    B_GiveXP (50);

};
