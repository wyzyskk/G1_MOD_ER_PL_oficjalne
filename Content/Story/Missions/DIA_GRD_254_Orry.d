//poprawione i sprawdzone - Nocturn

// **************************************************
// 						 PRE EXIT 
// **************************************************

INSTANCE DIA_Orry_PreExit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_PreExit_Condition;
	information	= DIA_Orry_PreExit_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_PreExit_Condition()
	
	{
		return 1;
	};

FUNC VOID DIA_Orry_PreExit_Info()
{
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //Postaraj siê dotrzeæ do Starego Obozu w jednym kawa³ku!
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orry_Exit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_Exit_Condition;
	information	= DIA_Orry_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_Exit_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orry_PreExit))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Orry_GuardGate (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_GuardGate_Condition;
	information		= DIA_Orry_GuardGate_Info;
	permanent		= 0;
	description		= "Czym siê tutaj zajmujesz?"; 
};

FUNC INT DIA_Orry_GuardGate_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_GuardGate_Info()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //Czym siê tutaj zajmujesz?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Dbam o to, by nikt niepowo³any nie dosta³ siê w pobli¿e miejsca wymiany. Zw³aszcza ci bandyci z Nowego Obozu.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Hej, to ciebie dziœ zrzucili tutaj, co?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //Zgadza siê.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //W takim razie uwa¿aj na ludzi z Nowego Obozu!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Ja jestem ze Starego Obozu, tak jak wszyscy, których widzia³eœ na miejscu wymiany.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //Zak³adam, ¿e rozmawia³eœ ju¿ z Diego?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"Nie."	,DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Tak."	,DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //Nie.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //Wiêc zrób to! On zajmuje siê wszystkimi nowoprzyby³ymi.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Od niego dowiesz siê wszystkiego co ¿ó³todziób wiedzieæ powinien.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Tak, rozmawia³em.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //To dobrze. Zatem wiesz ju¿ mniej wiêcej co i jak.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

// **************************************************
// 					New Camp
// **************************************************

INSTANCE DIA_Orry_NewCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 1;
	condition		= DIA_Orry_NewCamp_Condition;
	information		= DIA_Orry_NewCamp_Info;
	permanent		= 0;
	description		= "Dlaczego mam uwa¿aæ na ludzi z Nowego Obozu?"; 
};

FUNC INT DIA_Orry_NewCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_NewCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Dlaczego mam uwa¿aæ na ludzi z Nowego Obozu?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //W porównaniu z Nowym Obozem, Stary Obóz to ciche i przytulne miejsce!
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //Nowy Obóz nie otrzymuje ¿adnych przesy³ek z zewn¹trz. Te szkodniki po prostu kradn¹ wszystko, czego potrzebuj¹.
};

// **************************************************
// 					Old Camp
// **************************************************

INSTANCE DIA_Orry_OldCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_OldCamp_Condition;
	information		= DIA_Orry_OldCamp_Info;
	permanent		= 0;
	description		= "A Stary Obóz?"; 
};

FUNC INT DIA_Orry_OldCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_OldCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //A Stary Obóz?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Tutaj wszystkim rz¹dz¹ Magnaci, handluj¹cy rud¹. Pod nimi s¹ Stra¿nicy, a nastêpnie Cienie. Najni¿sz¹ kastê stanowi¹ Kopacze.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Ka¿dy, kto tu trafi, zaczyna jako Kopacz. Jeœli masz wiêksze ambicje, musisz zostaæ przyjêty do Cieni.
};

// **************************************************
// 					Shore
// **************************************************

INSTANCE DIA_Orry_Shore (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Shore_Condition;
	information		= DIA_Orry_Shore_Info;
	permanent		= 0;
	description		= "Kiedy tutaj wyl¹dowa³em, jeden z waszych uderzy³ mnie w twarz."; 
};

FUNC INT DIA_Orry_Shore_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Shore_Info()
{
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Kiedy tutaj wyl¹dowa³em, jeden z waszych uderzy³ mnie w twarz.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //Robi¹ tak z wszystkimi nowymi. Mówi¹ na to "Chrzest Wody".
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Rozumiem. Czy w Starym Obozie jest wielu takich zawadiaków?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Jest kilka czarnych owiec. Ale nie zrobi¹ ci krzywdy, jeœli zap³acisz im za ochronê.
};

// **************************************************
// 					Frau
// **************************************************

INSTANCE DIA_Orry_Woman (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Woman_Condition;
	information		= DIA_Orry_Woman_Info;
	permanent		= 0;
	description		= "Widzia³em, jak spuszczano tutaj jak¹œ kobietê."; 
};

FUNC INT DIA_Orry_Woman_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Woman_Info()
{
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Widzia³em, jak spuszczano tutaj jak¹œ kobietê.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //Có¿, Magnaci dostaj¹ wszystko, czego zapragn¹.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Chcesz powiedzieæ, ¿e król wymienia kobiety na rudê?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Naturalnie one te¿ trafiaj¹ tutaj prosto z wiêzienia. Gdyby Gomez nie œci¹gn¹³ ich tutaj, dalej gni³yby w jakimœ lochu.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //Sam ju¿ nie wiem, co jest dla nich gorsze...
	
	MIS_Women = LOG_RUNNING;
	Log_CreateTopic		(CH1_Women, LOG_MISSION); //fix
	Log_SetTopicStatus    (CH1_Women, LOG_RUNNING);
    B_LogEntry                (CH1_Women,"Gdy zosta³em zrzucony za Barierê, widzia³em kobietê spuszczan¹ na dó³ wraz z ³adunkiem. Jestem ciekaw jaki los j¹ spotka³ w Kolonii. Stra¿nik Orry powiedzia³, ¿e kobiety s¹ w³asnoœci¹ Magnatów i s¹ zsy³ane do Kolonii z ich polecenia. Powinienem rozejrzeæ siê w Starym Obozie.");
};

// **************************************************
// 					Waffe
// **************************************************

INSTANCE DIA_Orry_Waffe (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Waffe_Condition;
	information		= DIA_Orry_Waffe_Info;
	permanent		= 0;
	description		= "Potrzebujê broni..."; 
};

FUNC INT DIA_Orry_Waffe_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Waffe_Info()
{
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Potrzebujê broni...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //Rozejrzyj siê trochê przy zamkniêtej kopalni, w g³êbi kanionu. Na pewno coœ tam znajdziesz.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Tylko nie wdawaj siê w powa¿ne bójki uzbrojony w g³upi kilof. To bardzo ciê¿ka i nieporêczna broñ.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Niedoœwiadczony wojownik powinien pos³ugiwaæ siê nim tylko w ostatecznoœci.
	
};
/*
//========================================
//-----------------> PODSLUCH_ORRY
//========================================

INSTANCE DIA_Orry_PODSLUCH_ORRY (C_INFO)
{
   npc          = GRD_254_Orry;
   nr           = 4;
   condition    = DIA_Orry_PODSLUCH_ORRY_Condition;
   information  = DIA_Orry_PODSLUCH_ORRY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Orry_PODSLUCH_ORRY_Condition()
{
if (Jedzenie_zplacu == LOG_SUCCESS)
{
 return TRUE;
 };
};


FUNC VOID DIA_Orry_PODSLUCH_ORRY_Info()
{
    AI_Output (self, other ,"DIA_Orry_PODSLUCH_ORRY_03_01"); //No, no. NieŸle poradziliœcie sobie ze Stra¿nikami.
    AI_Output (other, self ,"DIA_Orry_PODSLUCH_ORRY_15_02"); //Eee... Nie, to nie tak.
    AI_Output (self, other ,"DIA_Orry_PODSLUCH_ORRY_03_03"); //Kto by pomyœla³, ¿e ten niepozorny Kopacz jest taki sprytny i pomys³owy.
    AI_Output (self, other ,"DIA_Orry_PODSLUCH_ORRY_03_04"); //Wielu m¹drych ludzi siê tu marnuje.
    AI_Output (other, self ,"DIA_Orry_PODSLUCH_ORRY_15_05"); //Ciekawe przez kogo?
    AI_Output (self, other ,"DIA_Orry_PODSLUCH_ORRY_03_06"); //Nie wszyscy Stra¿nicy s¹ tacy. Spójrz na mnie.
    AI_Output (self, other ,"DIA_Orry_PODSLUCH_ORRY_03_07"); //Nie wyda³em was, a przecie¿ wszystko s³ysza³em.
    AI_Output (other, self ,"DIA_Orry_PODSLUCH_ORRY_15_08"); //Dziêkujê ci za to.
    AI_StopProcessInfos	(self);
};



// *Script was make in Easy Dialog Maker (EDM)
var int GravoUfny;
//========================================
//-----------------> INFOS
//========================================

INSTANCE DIA_Orry_INFOS (C_INFO)
{
   npc          = GRD_254_Orry;
   nr           = 5;
   condition    = DIA_Orry_INFOS_Condition;
   information  = DIA_Orry_INFOS_Info;
   permanent	= FALSE;
   description	= "Co mi powiesz o Z³ym?";
};

FUNC INT DIA_Orry_INFOS_Condition()
{
    if (DexterDalej == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Orry_INFOS_Info()
{
    AI_Output (other, self ,"DIA_Orry_INFOS_15_01"); //Co mi powiesz o Z³ym?
    AI_Output (self, other ,"DIA_Orry_INFOS_03_02"); //A co ja mam o nim wiedzieæ? Jestem tylko Stra¿nikiem.
    AI_Output (other, self ,"DIA_Orry_INFOS_15_03"); //Przestañ. Wiem o ca³ym tym zamieszaniu z jaskini¹. Z³y mnie wtajemniczy³.
    AI_Output (other, self ,"DIA_Orry_INFOS_15_04"); //Co robisz wœród zbirów? 
    AI_Output (self, other ,"DIA_Orry_INFOS_03_05"); //To d³uga historia. Wiesz ju¿, ¿e to oni zabili Neka?
    AI_Output (other, self ,"DIA_Orry_INFOS_15_06"); //Poniek¹d.
    AI_Output (self, other ,"DIA_Orry_INFOS_03_07"); //PóŸnym wieczorem wraca³em z polowania. Us³ysza³em g³osy. Zdziwi³o mnie to.
    AI_Output (self, other ,"DIA_Orry_INFOS_03_08"); //Poszed³em do jaskini i zobaczy³em rozmawiaj¹cych.
    AI_Output (self, other ,"DIA_Orry_INFOS_03_09"); //Chcieli mnie zabiæ. Musia³em coœ wymyœliæ.
    AI_Output (self, other ,"DIA_Orry_INFOS_03_10"); //Zaproponowa³em im pomoc. Mia³em, bêd¹c w szeregach stra¿y, odwracaæ uwagê od ich dzia³añ.
    AI_Output (self, other ,"DIA_Orry_INFOS_03_11"); //To dziêki mnie nie zostali przez tyle lat z³apani.
    AI_Output (self, other ,"DIA_Orry_INFOS_03_12"); //Pomóg³ mi te¿ w tym Gravo. W jaskini wstawi³ siê za mn¹.
    B_LogEntry                     (CH1_ZLY_Poplecznicy,"Orry nie nale¿a³ do spisku od pocz¹tku. Do przy³¹czenia siê do zbirów zmusi³ go los. Czujê, ¿e mogê wydobyæ od niego sporo informacji.");

    B_GiveXP (300);

    Info_ClearChoices		(DIA_Orry_INFOS);
    Info_AddChoice		(DIA_Orry_INFOS, "Dlaczego Gravo ci pomóg³?", DIA_Orry_INFOS_GRAVO);
    Info_AddChoice		(DIA_Orry_INFOS, "Sk¹d macie te ³upy?", DIA_Orry_INFOS_SKARBY);
    Info_AddChoice		(DIA_Orry_INFOS, "Muszê ju¿ iœæ.", DIA_Orry_INFOS_IDE);
};

FUNC VOID DIA_Orry_INFOS_GRAVO()
{
    AI_Output (other, self ,"DIA_Orry_INFOS_GRAVO_15_01"); //Dlaczego Gravo ci pomóg³?
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_02"); //Znaliœmy siê jeszcze w Khorinis.
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_03"); //Pomaga³em mu szmuglowaæ towary do miasta.
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_04"); //Od tamtego czasu mogê na nim polegaæ.
    AI_Output (other, self ,"DIA_Orry_INFOS_GRAVO_15_05"); //Ze mn¹ nie chcia³ rozmawiaæ...
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_06"); //Jest niechêtny w stosunku do obcych.
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_07"); //Nie ufa ci. Wiem, jak temu zaradziæ.
    AI_Output (other, self ,"DIA_Orry_INFOS_GRAVO_15_08"); //Co mam zrobiæ?
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_09"); //Powiedz mu, ¿e ciê przysy³am. Jak zapyta o imiê, powiedz: Fraser.
    AI_Output (other, self ,"DIA_Orry_INFOS_GRAVO_15_10"); //Kim jest Fraser?
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_11"); //By³ stra¿nikiem miejskim. Gravo go zabi³.
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_12"); //Do dzisiaj nie mo¿e sobie wybaczyæ...
    AI_Output (other, self ,"DIA_Orry_INFOS_GRAVO_15_13"); //Dziêki.
    B_LogEntry                     (CH1_ZLY_Poplecznicy,"Gravo jest nieufny wobec nowych. Aby zdobyæ jego zaufanie muszê powiedzieæ, ¿e przys³a³ mnie Orry, a potem powiedzieæ imiê stra¿nika zabitego przez Gravo w Khorinis.");
    GravoUfny = true;
    B_GiveXP (50);
};

FUNC VOID DIA_Orry_INFOS_SKARBY()
{
    AI_Output (other, self ,"DIA_Orry_INFOS_SKARBY_15_01"); //Sk¹d macie te ³upy?
    AI_Output (self, other ,"DIA_Orry_INFOS_SKATBY_03_02"); //Nie wiem. Ja dostajê tylko 10 bry³ek tygodniowo.
    AI_Output (self, other ,"DIA_Orry_INFOS_SKARBY_03_03"); //Gravo dzia³a³ w zespole od pocz¹tku. Musisz z nim porozmawiaæ.
    B_LogEntry                     (CH1_ZLY_Poplecznicy,"Gravo wie, jak Z³y zdoby³ ³upy.");
    GravoUfny = true;
    B_GiveXP (50);
};

FUNC VOID DIA_Orry_INFOS_IDE()
{
    AI_Output (other, self ,"DIA_Orry_INFOS_IDE_15_01"); //Muszê ju¿ iœæ.
    AI_Output (self, other ,"DIA_Orry_INFOS_IDE_03_02"); //Tylko nie mów nikomu.
    Info_ClearChoices		(DIA_Orry_INFOS);
    AI_StopProcessInfos	(self);
};

*/

//========================================
//-----------------> TripNotes
//========================================

INSTANCE DIA_Orry_TripNotes (C_INFO)
{
   npc          = GRD_254_Orry;
   nr           = 1;
   condition    = DIA_Orry_TripNotes_Condition;
   information  = DIA_Orry_TripNotes_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Thorus. Przychodzê po notatki opisuj¹ce kierunki dzia³añ Bandytów.";
};

FUNC INT DIA_Orry_TripNotes_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Graham_Spy_Map_Bandit))
    && (MIS_DraxTest == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Orry_TripNotes_Info()
{
    AI_Output (other, self ,"DIA_Orry_TripNotes_15_01"); //Przysy³a mnie Thorus. Przychodzê po notatki opisuj¹ce kierunki dzia³añ Bandytów.
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_02"); //Ach tak, kojarzê.
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_03"); //Faktycznie, dostarczono mi takie notatki. 
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_04"); //Nie czyta³em ich jeszcze, wiêc postanowi³em je ukryæ, by nikt mi ich nie wykrad³.
    AI_Output (other, self ,"DIA_Orry_TripNotes_15_05"); //Gdzie je znajdê?
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_06"); //Wybacz, ale zanim ci je dam, muszê je przeczytaæ.
    AI_Output (other, self ,"DIA_Orry_TripNotes_15_07"); //To na co czekasz?
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_08"); //Teraz mam to zrobiæ? Nie widzisz, ¿e pilnujê placu przed Szkodnikami i Bandytami?
    B_LogEntry                     (CH1_DraxTest,"Orry ukry³ notatki Tripa. Nie chce mi ich przekazaæ, dopóki ich nie przeczyta. Myœlê, ¿e szkoda na to czasu.");
    AI_StopProcessInfos	(self);
};

