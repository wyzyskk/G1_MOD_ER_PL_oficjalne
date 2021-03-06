// **************************************************
VAR INT MordragKO_PlayerChoseOreBarons;
VAR INT MordragKO_PlayerChoseThorus;
VAR INT MordragKO_HauAb;
var int MordragKO_StayAtNC;
// **************************************************

// **************************************************
//						 EXIT 
// **************************************************

instance  Org_826_Mordrag_Exit (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 999;
	condition	= Org_826_Mordrag_Exit_Condition;
	information	= Org_826_Mordrag_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_826_Mordrag_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  Org_826_Mordrag_Greet (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 1;
	condition	= Org_826_Mordrag_Greet_Condition;
	information	= Org_826_Mordrag_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Greet_Info()
{
	AI_Output (self, other,"Org_826_Mordrag_Greet_11_00"); //Hej, nowa twarz! Jestem Mordrag. Zapami�taj sobie to imi� - u mnie kupisz wszystko, czego potrzebujesz za niewielk� cen�!
};

// **************************************************
//					Handeln
// **************************************************
var int Mordrag_Traded;
// **************************************************

instance  Org_826_Mordrag_Trade (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 800;
	condition	= Org_826_Mordrag_Trade_Condition;
	information	= Org_826_Mordrag_Trade_Info;
	permanent	= 1;
	description = "Poka� mi co masz do zaoferowania.";
	trade		= 1;
};                       

func int  Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Trade_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Trade_15_00"); //Poka� mi co masz do zaoferowania.
	AI_Output (self, other,"Org_826_Mordrag_Trade_11_01"); //Wybierz co�...
	if	(Mordrag_Traded==0)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,	"Mordrag handluje kradzionymi dobrami na targowisku.");
		Mordrag_Traded=1;
	};
};

// **************************************************
//					KURIER F�R MAGIER
// **************************************************

instance  Org_826_Mordrag_Courier (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Courier_Condition;
	information	= Org_826_Mordrag_Courier_Info;
	permanent	= 0;
	description = "Naprawd� jeste� kurierem Mag�w?";
};                       

FUNC int  Org_826_Mordrag_Courier_Condition()
{
	if	Thorus_MordragMageMessenger 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Courier_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_00"); //Naprawd� jeste� kurierem Mag�w?
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_01"); //A je�li jestem?
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_02"); //Chcia�bym porozmawia� z kt�rym� z mag�w. Musz� dosta� si� do zamku.
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_03"); //Ka�dy kurier mag�w ma przy sobie magiczn� piecz��, dzi�ki kt�rej mo�e wej�� do zamku. Gdyby� by� jednym z nas, m�g�by� tak� zdoby�.
	if MIS_Massage == LOG_RUNNING
	{
    B_LogEntry               (CH1_Massage,"Mordrag jest kurierem mag�w i powiedzia� mi, �e je�li tak�e nim zostan� otrzymam piecz��, kt�ra pozwoli mi wej�� do zamku. Chyba rozejrz� si� nieco w Nowym Obozie...");
	};
};

// **************************************************
//					DU HAST EIN PROBLEM
// **************************************************

instance  Org_826_Mordrag_Problem (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Problem_Condition;
	information	= Org_826_Mordrag_Problem_Info;
	permanent	= 0;
	description = "Masz problem.";
};                       

FUNC int  Org_826_Mordrag_Problem_Condition()
{
	if Thorus_MordragKo == LOG_RUNNING  && !Npc_KnowsInfo(hero,Org_826_Mordrag_AtNewcamp) && !Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp) 
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Problem_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_00"); //Masz problem.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_01"); //Czy�by? A jaki?
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_02"); //S� w tym Obozie osoby, kt�re maj� ci� ju� serdecznie dosy�.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_03"); //Tak? To powiedz im, �eby przys�a�y tutaj kogo�, kto spr�buje mnie st�d przep�dzi�!
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_04"); //Sk�d pewno��, �e nie przys�a�y w�a�nie mnie?
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_05"); //Bo my�l�, �e jeste� na to zbyt m�dry. Wkr�tce przekonasz si�, �e s� w tej Kolonii ciekawsze rzeczy do roboty ni� us�ugiwanie Gomezowi.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_06"); //Nowy Ob�z potrzebuje zdolnych ludzi. Tam przynajmniej nikt nam nie m�wi co mamy robi�.
};

// **************************************************
//					  NCInfo
// **************************************************

instance  Org_826_Mordrag_NCInfo(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_NCInfo_Condition;
	information	= Org_826_Mordrag_NCInfo_Info;
	permanent	= 0;
	description = "Opowiedz mi o Nowym Obozie.";
};                       

FUNC int  Org_826_Mordrag_NCInfo_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_NCInfo_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_00"); //Opowiedz mi o Nowym Obozie.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_01"); //Tylko tam znajdziesz prawdziw� wolno��... jak na Koloni� Karn�, oczywi�cie. Nie ma tam �adnych Magnat�w ani Guru, kt�rzy mogliby tob� pomiata�.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_02"); //Mamy w�asn� kopalni�, ale nie sprzedajemy ani grama rudy temu zramola�emu kr�lowi!
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_03"); //Wi�c do czego j� wykorzystujecie?
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_04"); //Nasi magowie opracowuj� plan ucieczki z Kolonii. Zbieranie rudy jest cz�ci� tego planu.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_05"); //Gomez i jego ludzie p�awi� si� w luksusie, a my ci�ko pracujemy, �eby si� st�d wydosta�. Tak to wygl�da!
};

// **************************************************
//					JoinNewcamp
// **************************************************

instance  Org_826_Mordrag_JoinNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_JoinNewcamp_Condition;
	information	= Org_826_Mordrag_JoinNewcamp_Info;
	permanent	= 0;
	description = "A gdybym chcia� do��czy� do Nowego Obozu... m�g�by� mi pom�c?";//k�nntest du mir dabei helfen... ZU LANG
};                       

FUNC int  Org_826_Mordrag_JoinNewcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_JoinNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_JoinNewcamp_15_00"); //A gdybym chcia� do��czy� do Nowego Obozu... m�g�by� mi pom�c?
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_01"); //Je�li my�lisz o tym powa�nie, mo�emy wyruszy� od razu. Zaprowadz� ci� do Laresa. To szef naszej bandy.
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_02"); //Ale gdyby� chcia� wyrzuci� mnie z Obozu si�� - mo�esz spr�bowa�.
};


instance  Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_GotoNewcamp_Condition;
	information	= Org_826_Mordrag_GotoNewcamp_Info;
	permanent	= 0;
	description = "Chod�my do Nowego Obozu!";
};                       

FUNC int  Org_826_Mordrag_GotoNewcamp_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_JoinNewcamp))
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoNewcamp_15_00"); //Chod�my do Nowego Obozu!
	AI_Output (self, other,"Org_826_Mordrag_GotoNewcamp_11_01"); //Dobra! Chod� za mn�!
	// TU 123
	/*if (Problem_ZLY == LOG_RUNNING) 
	{
	Problem_ZLY = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Problem ze Z�ym! ", 1,-1,"font_new_10_red.tga",2);	
 	 B_LogEntry                     (CH1_Problem_ZLY,"Wybra�em si� z Mordragiem do Nowego Obozu porzucaj�c jego problemy z Cieniami.");
	Log_SetTopicStatus       (CH1_Problem_ZLY, LOG_FAILED);
	};*/
	/*if MordragProblemOC == LOG_RUNNING
	{
	 MordragProblemOC= LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Problemy Mordraga! ", 1,48,"font_new_10_red.tga",2);	
	 B_LogEntry                     (CH1_MordragProblemOC,"Wybra�em si� z Mordragiem do Nowego Obozu porzucaj�c jego problemy z Cieniami.");
	Log_SetTopicStatus       (CH1_MordragProblemOC, LOG_FAILED);
	};*/
	Mordrag_GotoNC_Day = Wld_GetDay();
	
	AI_StopProcessInfos	(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);	// damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE) || (Npc_GetTrueGuild(hero) == GIL_VLK)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC, "Mordrag zgodzi� si� zaprowadzi� mnie do Nowego Obozu. Mam tylko nadziej�, �e to nie jaka� pu�apka!");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine		(self,"GUIDE");
};

// **************************************************
//				AM NEWCMAP ANGEKOMMEN
// **************************************************

instance  Org_826_Mordrag_AtNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_AtNewcamp_Condition;
	information	= Org_826_Mordrag_AtNewcamp_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_AtNewcamp_Condition()
{
	if 	( Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21") ) 
	{
		self.flags	= 0;
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_AtNewcamp_Info()
{
	if (Mordrag_GotoNC_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_00"); //No to jeste�my.
	}
	else
	{
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //My�la�em, �e ju� tu nie dotrzesz! Zreszt� niewa�ne - jeste�my na miejscu!
	};
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_01"); //Za t� bram� rozci�ga si� Nowy Ob�z. Porozmawiaj z Laresem, on ci pomo�e. Daj mu ten cenny pier�cie�.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_02"); //To twoja przepustka do Laresa. Trzeba mie� nie lada pow�d, �eby si� z nim spotka�.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_03"); //Wiesz co? Po zastanowieniu - chyba posiedz� tu par� dni. Zarobi�em ju� niez�� sumk�, a w Starym Obozie zaczyna robi� si� troch� za gor�co.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_04"); //Jak by� czego� potrzebowa� - znajdziesz mnie w karczmie na �rodku jeziora. Uwa�aj na siebie!
	AI_Output (other, self,"Org_826_Mordrag_AtNewcamp_15_05"); //Do zobaczenia.
	
	CreateInvItems  (self, MordragsRing, 1);
	B_GiveInvItems	(self, other, MordragsRing, 1);

	B_GiveXP		(XP_ArrivedWithMordrag);	
	B_LogEntry		(CH1_JoinNC, "Stoimy przed g��wn� bram� Nowego Obozu. Mordrag da� mi pier�cie�, kt�ry mam przekaza� Laresowi, przyw�dcy Szkodnik�w. Ma mi to pom�c w zostaniu cz�onkiem Nowego Obozu. Mordrag przez jaki� czas zostanie w karczmie na jeziorze.");
	var C_NPC lares; lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar [AIV_FINDABLE]=TRUE;
	
	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
//					AUFS MAUL
// **************************************************

instance  Org_826_Mordrag_Fight (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Fight_Condition;
	information	= Org_826_Mordrag_Fight_Info;
	permanent	= 0;
	description = "W tym Obozie nie ma miejsca dla ludzi takich jak ty!";
};                       

FUNC int  Org_826_Mordrag_Fight_Condition()
{
	if ( (Thorus_MordragKo == LOG_RUNNING) && (!Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp)) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Fight_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Fight_15_00"); //W tym Obozie nie ma miejsca dla ludzi takich jak ty!
	AI_Output (self, other,"Org_826_Mordrag_Fight_11_01"); //S�ucham?
	
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice   (Org_826_Mordrag_Fight, "Wyno� si� st�d i nigdy nie wracaj!" 					,Info_Mordrag_Fight_GetAway);
	if (zlecil_Thorus == true)
	{
	Info_AddChoice	 (Org_826_Mordrag_Fight, "Nie tolerujemy tu ludzi, kt�rzy okradaj� Magnat�w!" 	,Info_Mordrag_Fight_OreBarons);
	Info_AddChoice	 (Org_826_Mordrag_Fight, "Przysy�a mnie Thorus. Mam si� ciebie pozby� raz na zawsze." 		,Info_Mordrag_Fight_Thorus);
	};
};

FUNC VOID Info_Mordrag_Fight_GetAway()
{
	AI_Output (other, self,"Info_Mordrag_Fight_GetAway_15_00"); //Wyno� si� st�d i nigdy nie wracaj!
	AI_Output (self, other,"Info_Mordrag_Fight_GetAway_11_01"); //Wielkie s�owa ma�ego cz�owieczka...
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_OreBarons()
{
	AI_Output (other, self,"Info_Mordrag_Fight_OreBarons_15_00"); //Nie tolerujemy tu ludzi, kt�rzy okradaj� Magnat�w!
	AI_Output (self, other,"Info_Mordrag_Fight_OreBarons_11_01"); //Ach, wi�c o to ci chodzi! Dlaczego nie powiedzia�e� tak od razu...
	
	MordragKO_PlayerChoseOreBarons = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_Thorus()
{
	AI_Output (other, self,"Info_Mordrag_Fight_Thorus_15_00"); //Przysy�a mnie Thorus. Mam si� ciebie pozby� raz na zawsze.
	AI_Output (self, other,"Info_Mordrag_Fight_Thorus_11_01"); //Thorus? Naprawd�? C�, to wszystko co chcia�em wiedzie�...
	
	MordragKO_PlayerChoseThorus = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

// **************************************************
//					HauAb
// **************************************************

instance  Org_826_Mordrag_HauAb(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_HauAb_Condition;
	information	= Org_826_Mordrag_HauAb_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_HauAb_Condition()
{
	VAR C_NPC Mordrag;
	Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	
	if (Mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_HauAb_Info()
{
	AI_Output (other, self,"Org_826_HauAb_GotoNewcamp_15_00"); //Wyno� si� st�d...
	
	AI_StopProcessInfos	(self);
	
	MordragKO_HauAb = TRUE;
	
	B_LogEntry    (CH1_MordragKO,"Pokona�em Mordraga i kaza�em mu nigdy wi�cej nie pokazywa� si� w Starym Obozie.");

	Npc_ExchangeRoutine	(self, "Start");
};
		
// **************************************************
//					GotoKalom
// **************************************************

instance  Org_826_Mordrag_GotoKalom(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalom_Condition;
	information	= Org_826_Mordrag_GotoKalom_Info;
	permanent	= 0;
	description = "Lares ma dla ciebie wiadomo��.";
};                       

FUNC int  Org_826_Mordrag_GotoKalom_Condition()
{
	if 	(Npc_GetTrueGuild(other)!=GIL_ORG)
	&&	(Lares_InformMordrag == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalom_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_00"); //Lares ma dla ciebie wiadomo��.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_01"); //Czego chce?
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_02"); //Interesuj� go ostatnie wydarzenia w obozie Sekty. Mam ci przekaza�, �e to twoje zadanie.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_03"); //Mam wra�enie, �e ten problem sam si� wkr�tce rozwi��e...

	B_LogEntry	(CH1_JoinNC,	"Przekaza�em Mordragowi polecenie Laresa. Mamrota� troch� o sprawach, kt�re same si� wyja�ni�. Nie bardzo wiem, co mia� na my�li!");
};

// **************************************************
//					GotoKalom - NOW
// **************************************************
	var int Mordrag_GotoKalom;
// **************************************************

instance  Org_826_Mordrag_GotoKalomNOW(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalomNOW_Condition;
	information	= Org_826_Mordrag_GotoKalomNOW_Info;
	permanent	= 0;
	description = "Lares powiedzia�, �e mam ci pom�c w tej sprawie.";
};                       

FUNC int  Org_826_Mordrag_GotoKalomNOW_Condition()
{
	if 	(Npc_GetTrueGuild(other)==GIL_ORG)
	&&	Npc_KnowsInfo(hero,ORG_801_Lares_GotoKalom)
	{
		return TRUE;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalomNOW_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Lares powiedzia�, �e mam ci pom�c w tej sprawie.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //Widzisz! Wiedzia�em, �e nie b�d� musia� sam si� z tym m�czy�!
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //Chcesz �ebym zaj�� si� tym w pojedynk�?
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //Na pewno jako� sobie poradzisz. S�uchaj: musisz koniecznie wyw�szy�, co si� kryje za t� ca�� histori� z przywo�aniem.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //Wiem, �e te �wiry z Sekty przygotowuj� si� do wielkiego przywo�ania, i cho� sam nie wierz� w �ni�cego powiem ci jedno:
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //Guru dysponuj� pot�n� magi�, dlatego tak uwa�nie musimy im patrze� na palce. Nad��asz?

	B_LogEntry			(CH1_GotoPsiCamp,	"Mordrag sprytnie zrzuci� na mnie obowi�zek szpiegowania w Obozie Bractwa. Guru zdaj� si� przygotowywa� do wielkiego przyzwania �ni�cego. Moim zadaniem jest poznanie szczeg��w.");
	B_GiveXP			(XP_AssistMordrag);	
	
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Nie masz dla mnie �adnych dok�adniejszych wskaz�wek?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Zobacz� co si� da zrobi�.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //Nie masz dla mnie �adnych dok�adniejszych wskaz�wek?
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Porozmawiaj z Lesterem. Sp�dzi�em kiedy� sporo czasu w obozie Sekty, a on mi pom�g�. Go�� jest w porz�dku.
	B_LogEntry(CH1_GotoPsiCamp,	"W Obozie Bractwa mam porozmawia� z Nowicjuszem imieniem Lester. Pono� mo�na mu zaufa� - ju� wcze�niej pomaga� Mordragowi.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //Zobacz� co si� da zrobi�.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //Jak tylko dowiesz si� czego� o ich zamiarach, zg�o� si� do mnie.
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	AI_StopProcessInfos	(self);
};

// **************************************************
//					RUNNING
// **************************************************

instance  Org_826_Mordrag_RUNNING (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_RUNNING_Condition;
	information	= Org_826_Mordrag_RUNNING_Info;
	permanent	= 1;
	description = "Je�li chodzi o t� spraw� z Sekt�...";
};                       

FUNC int  Org_826_Mordrag_RUNNING_Condition()
{
	if (Mordrag_GotoKalom == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_RUNNING_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_RUNNING_15_00"); //Je�li chodzi o t� spraw� z Sekt�...
	AI_Output			(self, other,"Org_826_Mordrag_RUNNING_11_01"); //Tak?

	if	(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_04"); //Odby�o si� wielkie przywo�anie.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_09"); //Niemo�liwe! Chcesz powiedzie�, �e bra�e� w tym udzia�?
		}
		else
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_06"); //Bractwo zamierza wzmocni� swoje si�y duchowe przy pomocy pot�nego eliksiru wytwarzanego z jaj pe�zaczy. Dzi�ki temu maj� nadziej� nawi�za� kontakt ze �ni�cym.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_07"); //Banda idiot�w! Te �wiry naprawd� wierz� w te brednie, co?
		};
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_10"); //Jestem ciekaw co z tego wszystkiego wyjdzie.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_11"); //Ja te�. Daj mi zna�, gdy Guru zb�a�ni� si� ju� ca�kowicie.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP			(XP_ReportToMordrag);
		Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_SUCCESS);
		B_LogEntry			(CH1_GotoPsiCamp,	"Mordrag prawie umar� ze �miechu, gdy opowiedzia�em mu o jajach pe�zaczy. Jednak chyba straci� zainteresowanie dalszym szpiegowaniem Guru. To znaczy, �e moja robota sko�czona.");
	}
	else
	{
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_02"); //Niczego si� jeszcze nie dowiedzia�em.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_03"); //Wi�c bierz si� do roboty!
	};

/*	
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.
		
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der T�r, um sich ihr Erz abzuholen...
*/
};
/*	
//========================================
//-----------------> TOWARY
//========================================

INSTANCE DIA_Mordrag_TOWARY (C_INFO)
{
   npc          = Org_826_Mordrag;
   nr           = 6;
   condition    = DIA_Mordrag_TOWARY_Condition;
   information  = DIA_Mordrag_TOWARY_Info;
   permanent	= FALSE;
   description	= "A ty, sk�d bierzesz swoje towary?";
};

FUNC INT DIA_Mordrag_TOWARY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Skaza_RAPORT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mordrag_TOWARY_Info()
{
    AI_Output (other, self ,"DIA_Mordrag_TOWARY_15_01"); //A ty, sk�d bierzesz swoje towary?
    AI_Output (self, other ,"DIA_Mordrag_TOWARY_03_02"); //Ja? Po�yczam od Magnat�w.
    AI_Output (other, self ,"DIA_Mordrag_TOWARY_15_03"); //Dlaczego wi�c pot�piasz �wistaka?
    AI_Output (self, other ,"DIA_Mordrag_TOWARY_03_04"); //�api�c mnie za s�owa daleko nie zajdziesz. Ja robi� to, co uwa�am za w�a�ciwe.
    AI_Output (self, other ,"DIA_Mordrag_TOWARY_03_05"); //Thorus jest g�upcem skoro nie widzi jak jego najlepsi ludzie kradn� jego rzeczy za jego plecami.
    AI_Output (self, other ,"DIA_Mordrag_TOWARY_03_06"); //Poza tym relacje mi�dzy Starym, a Nowym Obozem nigdy nie by�y najlepsze. 
    AI_Output (self, other ,"DIA_Mordrag_TOWARY_03_07"); //Lares p�aci mi za takie rzeczy...
    AI_Output (other, self ,"DIA_Mordrag_TOWARY_15_08"); //Rozumiem. 
};
//========================================
//-----------------> GOOOO
//========================================

INSTANCE DIA_Mordrag_GOOOO (C_INFO)
{
   npc          = Org_826_Mordrag;
   nr           = 7;
   condition    = DIA_Mordrag_GOOOO_Condition;
   information  = DIA_Mordrag_GOOOO_Info;
   permanent	= FALSE;
   description	= "Od czego mam zacz��?";
};

FUNC INT DIA_Mordrag_GOOOO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Skaza_RAPORT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mordrag_GOOOO_Info()
{
    
    B_LogEntry                     (CH1_MordragProblemOC,"Na pocz�tek powinienem pogada� z Bartholo. Tylko jak ja si� dostan� do zamku...");
};
*/
/*
//========================================
//-----------------> POPSUTE_DO_RESZTY
//========================================

INSTANCE DIA_Mordrag_POPSUTE_DO_RESZTY (C_INFO)
{
   npc          = Org_826_Mordrag;
   nr           = 1;
   condition    = DIA_Mordrag_POPSUTE_DO_RESZTY_Condition;
   information  = DIA_Mordrag_POPSUTE_DO_RESZTY_Info;
   permanent	= FALSE;
   description	= "Pos�uchaj. Chc� cie zabi�!";
};

FUNC INT DIA_Mordrag_POPSUTE_DO_RESZTY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Sly_FAIL_SIPACZE))
    && (BANMordragRaport == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mordrag_POPSUTE_DO_RESZTY_Info()
{
    AI_Output (other, self ,"DIA_Mordrag_POPSUTE_DO_RESZTY_15_01"); //Pos�uchaj. Chc� cie zabi�!
    AI_Output (self, other ,"DIA_Mordrag_POPSUTE_DO_RESZTY_03_02"); //Cholera! Wiedzia�em, �e co� spierdolisz. Zawsze tak jest. Musz� si� zmywa�.
    AI_Output (other, self ,"DIA_Mordrag_POPSUTE_DO_RESZTY_15_03"); //A co z moim przyj�ciem?
    AI_Output (self, other ,"DIA_Mordrag_POPSUTE_DO_RESZTY_03_04"); //Mam to w dupie. Ja na pewno ci ju� nie pomog�.
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
	MordragProblemOC = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Problemy Mordraga! ", 1,-1,"font_new_10_red.tga",2);	
    Log_SetTopicStatus       (CH1_MordragProblemOC, LOG_FAILED);
    B_LogEntry  	(CH1_MordragProblemOC,"Niestety nie uda�o mi si� rozwi�za� problem�w Mordraga. Doprowadzi�em do tego, �e musia� ucieka� z Obozu.");
	
	BANMordragRaport = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Raport od Mordraga! ", 1,-1,"font_new_10_red.tga",2);	
	Log_SetTopicStatus       (CH1_BANMordragRaport, LOG_FAILED);
	B_LogEntry      	(CH1_BANMordragRaport,"Mordrag uciek�. Quentin nie dostanie raportu. Wszystko przepad�o.");
	
	BANDITOS_CAMP = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Przyj�cie do Obozu Bandyt�w! ", 1,-1,"font_new_10_red.tga",2);	
	Log_SetTopicStatus       (CH1_BANDITOS_CAMP, LOG_FAILED);
	B_LogEntry                     (CH1_BANDITOS_CAMP,"Popsu�em zadanie od Mordraga. Musz� szuka� innego, �atwiejszego sposobu przyj�cia lub rozejrze� si� za inn� frakcj�.");
};
*/
