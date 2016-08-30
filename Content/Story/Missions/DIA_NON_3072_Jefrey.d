// *Script was make in Easy Dialog Maker (EDM)
/*
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Jefrey_EXIT(C_INFO)
{
	npc             = NON_3072_Jefrey;
	nr              = 999;
	condition	= DIA_Jefrey_EXIT_Condition;
	information	= DIA_Jefrey_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Jefrey_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jefrey_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoYou
//========================================

INSTANCE DIA_Jefrey_WhoYou (C_INFO)
{
   npc          = NON_3072_Jefrey;
   nr           = 1;
   condition    = DIA_Jefrey_WhoYou_Condition;
   information  = DIA_Jefrey_WhoYou_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Jefrey_WhoYou_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patros_LifeIDsa))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jefrey_WhoYou_Info()
{
    AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_02"); //Nazywam siê Jefrey. Jestem ³owc¹ Poszukiwaczy.
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_03"); //Œledzê ciê od pewnego czasu. Ty te¿ ich szukasz?
    AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_04"); //Nie ich, lecz tego, kto jest za nich odpowiedzialny.
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_05"); //Kto to taki?
    AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_06"); //Niejaki Czarny Mag. Poszukiwacze pracuj¹ dla niego.
    AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_07"); //Zbieraj¹ dusze niewiernych. 
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_08"); //Wiesz po co im te dusze?
    AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_09"); //Nie mam pojêcia. Staram siê to usatliæ.
    AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_10"); //To ty odstraszy³eœ Poszukiwaczy œcigaj¹cych Patrosa?
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_11"); //Tak, to ja.
    AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_12"); //Potraficie z nimi walczyæ?
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_13"); //S¹ bardzo odporni na ogieñ. Najlepiej stosowaæ inne czary.
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_14"); //Taki jak na przyk³ad bry³a lodu.
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_15"); //Zwyk³¹ broni¹ tak¿e mo¿na ich zabiæ.
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_16"); //Wiesz co, nasza grupa spotyka siê o pó³nocy w starych ruinach. 
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_17"); //Mo¿e pojawisz siê na dzisiejszym spotkaniu?
	AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_18"); //W sumie, to czemu nie. 
	//Npc_ExchangeRoutine (NON_3072_Jefrey , "lowcaPoszukiwaczy");
	//Wld_InsertNpc				(NON_3078_Avallach,"OC1");  
    MIS_LowcyPoszukiwaczy = LOG_RUNNING;
	NPC_ExchangeRoutine (NON_3072_Jefrey,"postart");
    Log_CreateTopic            (CH1_LowcyPoszukiwaczy, LOG_MISSION);
    Log_SetTopicStatus       (CH1_LowcyPoszukiwaczy, LOG_RUNNING);
    B_LogEntry                     (CH1_LowcyPoszukiwaczy,"Jefrey, ³owca Poszukiwaczy zaproponowa³ mi spotkanie z nimi. Mog¹ byæ dla mnie bardzo pomocni. Mo¿liwe, ¿e uda³o im siê coœ ustaliæ na temat Czarnego Maga.");
	//AI_StopProcessInfos	(self);
    B_GiveXP (500);
    B_LogEntry                     (CH1_WlakaZczarym,"To Jefrey stoi za ocaleniem Patrosa z r¹k Poszukiwaczy. Razem ze swoj¹ grup¹ poluj¹ na te plugawe istoty.");
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Spotkanie
//========================================

INSTANCE DIA_Jefrey_Spotkanie (C_INFO)
{
   npc          = NON_3072_Jefrey;
   nr           = 1;
   condition    = DIA_Jefrey_Spotkanie_Condition;
   information  = DIA_Jefrey_Spotkanie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jefrey_Spotkanie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jefrey_WhoYou)) && (Wld_IsTime   (00,00,04,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jefrey_Spotkanie_Info()
{
    AI_Output (self, other ,"DIA_Jefrey_Spotkanie_03_01"); //Mi³o, ¿e wpad³eœ na nasze spotkanie.
    AI_Output (self, other ,"DIA_Jefrey_Spotkanie_03_02"); //Je¿eli chcesz siê dowiedzieæ czegoœ o Poszukiwaczach rozmawiaj z moimi kolegami.
    AI_Output (self, other ,"DIA_Jefrey_Spotkanie_03_03"); //Mo¿esz siê te¿ z nami podzieliæ swoimi informacjami. 
    AI_Output (self, other ,"DIA_Jefrey_Spotkanie_03_04"); //Szczególnie Avallach prosi³ o nowe wieœci.
    AI_Output (other, self ,"DIA_Jefrey_Spotkanie_15_05"); //Dobrze, porozmawiam z nim.
    B_LogEntry                     (CH1_LowcyPoszukiwaczy,"Uda³em siê na spotkanie z ³owcami Poszukiwaczy. Mogê siê od nich sporo dowiedzieæ o walce oraz podzieliæ siê z nimi wiedz¹.");

    B_GiveXP (200);
};


//========================================
//-----------------> Poszukiwacze
//========================================

INSTANCE DIA_Jefrey_Poszukiwacze (C_INFO)
{
   npc          = NON_3072_Jefrey;
   nr           = 1;
   condition    = DIA_Jefrey_Poszukiwacze_Condition;
   information  = DIA_Jefrey_Poszukiwacze_Info;
   permanent	= FALSE;
   description	= "Co wiesz o Poszukiwaczach?";
};

FUNC INT DIA_Jefrey_Poszukiwacze_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jefrey_WhoYou)) && (Wld_IsTime   (00,00,04,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jefrey_Poszukiwacze_Info()
{
    AI_Output (other, self ,"DIA_Jefrey_Poszukiwacze_15_01"); //Co wiesz o Poszukiwaczach?
    AI_Output (self, other ,"DIA_Jefrey_Poszukiwacze_03_02"); //Niezbyt wiele. Polujemy na nie od niedawna. 
    AI_Output (self, other ,"DIA_Jefrey_Poszukiwacze_03_03"); //W walce pos³uguj¹ siê runami pirokinezy, kuli ognia, lub ognistego pocisku.
    AI_Output (self, other ,"DIA_Jefrey_Poszukiwacze_03_04"); //Ciê¿ko ich pokonaæ, je¿eli jest siê nieuwa¿nym lub Ÿle przygotowanym.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Jefrey_HELLO2 (C_INFO)
{
   npc          = NON_3072_Jefrey;
   nr           = 2;
   condition    = DIA_Jefrey_HELLO2_Condition;
   information  = DIA_Jefrey_HELLO2_Info;
   permanent	= FALSE;
   description	= "Gdzie znajdê Poszukiwaczy?";
};

FUNC INT DIA_Jefrey_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jefrey_WhoYou)) && (Wld_IsTime   (00,00,04,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jefrey_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Jefrey_HELLO2_15_01"); //Gdzie znajdê Poszukiwaczy?
    AI_Output (self, other ,"DIA_Jefrey_HELLO2_03_02"); //Wszêdzie. Ostatnio pl¹taj¹ siê po ca³ej Kolonii. Myœlê, ¿e na coœ czekaj¹ lub na kogoœ poluj¹.
    AI_Output (self, other ,"DIA_Jefrey_HELLO2_03_03"); //Szczególnie upodobali sobie przeró¿ne krêgi kamienne lub okolice obozów.
    AI_Output (other, self ,"DIA_Jefrey_HELLO2_15_04"); //Okolice obozów? Czy¿by szukali jakiegoœ cz³owieka?
    AI_Output (self, other ,"DIA_Jefrey_HELLO2_03_05"); //Nie myœla³em tak o tym, ale przypuszczam, ¿e mo¿esz mieæ racjê.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Jefrey_HELLO3 (C_INFO)
{
   npc          = NON_3072_Jefrey;
   nr           = 3;
   condition    = DIA_Jefrey_HELLO3_Condition;
   information  = DIA_Jefrey_HELLO3_Info;
   permanent	= FALSE;
   description	= "Jak to mo¿liwe, ¿e nigdy wczeœniej ciê nie widzia³em?";
};

FUNC INT DIA_Jefrey_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jefrey_WhoYou)) && (Wld_IsTime   (00,00,04,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jefrey_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Jefrey_HELLO3_15_02"); //Jak to mo¿liwe, ¿e nigdy wczeœniej ciê nie widzia³em?
    AI_Output (self, other ,"DIA_Jefrey_HELLO3_03_03"); //To proste: wczeœniej mnie tu po prostu nie by³o. 
    AI_Output (self, other ,"DIA_Jefrey_HELLO3_03_04"); //Przyby³em do Kolonii kilka dni temu. Dodam, ¿e z w³asnej woli.
    AI_Output (other, self ,"DIA_Jefrey_HELLO3_15_05"); //Z w³asnej woli? Dlaczego?
    AI_Output (self, other ,"DIA_Jefrey_HELLO3_03_06"); //Mia³em sen. Koszmarny. Widzia³em te postacie i miejsca z Górniczej Doliny. Uzna³em to za znak.
    AI_Output (other, self ,"DIA_Jefrey_HELLO3_15_07"); //Z powodu snu postanowi³eœ zamkn¹æ siê w klatce na ca³e ¿ycie.
    AI_Output (self, other ,"DIA_Jefrey_HELLO3_03_08"); //Bez przesady. Miejmy nadziejê, ¿e nie na ca³e. Jestem wierny Innosowi i uzna³em, ¿e to znak od niego. Misja...
    AI_Output (self, other ,"DIA_Jefrey_HELLO3_03_09"); //Muszê sam dociec czego Innos ode mnie wymaga. Tak, trzeba jak najprêdzej zbadaæ sprawê Poszukiwaczy.
};
//========================================
//-----------------> END_QUESTss
//========================================

INSTANCE DIA_Jefrey_END_QUESTss (C_INFO)
{
   npc          = NON_3072_Jefrey;
   nr           = 1;
   condition    = DIA_Jefrey_END_QUESTss_Condition;
   information  = DIA_Jefrey_END_QUESTss_Info;
   permanent	= FALSE;
   description	= "Uda³o mi siê! Pokona³em Czarnego Maga!";
};

FUNC INT DIA_Jefrey_END_QUESTss_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(NON_3073_Czarny_Mag);
    if (Npc_IsDead(whodie0))
&& (Er_StoryBM_Run == true)    {
    return TRUE;
    };
};


FUNC VOID DIA_Jefrey_END_QUESTss_Info()
{
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_01"); //Uda³o mi siê! Pokona³em Czarnego Maga!
    AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_02"); //A wiêc nasza praca nie posz³a na marne! Gdyby nie ty, nigdy by nam siê nie uda³o.
    if (MIS_lekiDlaAva == LOG_FAILED)
    {
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_03"); //Niestety Avallach poleg³.
    AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_04"); //Tak. To przykre.
 
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_05"); //Zastanawia mnie jeszcze, dlaczego Czarny Mag wybra³ akurat Górsk¹ Fortecê. Nie móg³ siê ukryæ w podziemiach?
    AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_06"); //Mo¿e szuka³ czegoœ w rotecy? Dowiedzia³eœ siê czegoœ podczas walki z nim?
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_07"); //Powiedzia³ tylko, ¿e dusze potrzebne im by³y do rytua³u. Chcieli przygotowaæ œwiat na przybycie potê¿nego wys³annika Beliara.
    AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_08"); //Energia pochodz¹ca z dusz? S³ysza³em kiedyœ o artefaktach, które s¹ zdolne zogniskowaæ magiczn¹ moc.
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_09"); //No jasne! Kamieñ ogniskuj¹cy! Czarny Mag go szuka³! 
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_10"); //Na szczêœcie zabraliœmy go z Lesterem kilka dni wczeœniej. To dziwne, jak szybko zaroi³o siê tam tyle tych piekielnych stworzeñ.
    AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_11"); //To ju¿ nie jest istotne. Gdzie jest kamieñ ogniskuj¹cy? Trzeba go zabezpieczyæ.
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_12"); //O to mo¿esz byæ spokojny. Jest w rêkach Magów Wody.
};    
	AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_13"); //A wiêc nie mam tu ju¿ nic do roboty. Udam siê do Bractwa. Tamtejsi ludzie potrzebuj¹ pomocy.
    AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_14"); //S³ysza³eœ o Œni¹cym?
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_15"); //Tak, tak. Jestem zamieszany w ca³¹ t¹ historiê.
    AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_16"); //No dobrze. Wiêc do zobaczenia!
    AI_StopProcessInfos	(self);
};
*/
