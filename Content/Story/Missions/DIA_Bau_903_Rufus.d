//poprawione i sprawdzone - Nocturn

// ************************************************************
// 			  				   EXIT 
// ************************************************************
//sprawdzone przez gothic1210
INSTANCE DIA_Rufus_EXIT (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 999;
	condition	= DIA_Rufus_EXIT_Condition;
	information	= DIA_Rufus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Rufus_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Rufus_Wasser(C_INFO) // E1
{
	npc			= Bau_903_Rufus;
	nr			= 800;
	condition	= Info_Rufus_Wasser_Condition;
	information	= Info_Rufus_Wasser_Info;
	permanent	= 1;
	description = "Przysy³a mnie Lewus. Przynoszê ci wodê.";
};                       

FUNC INT Info_Rufus_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	&& 	(MIS_BuntZbieraczy != LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID Info_Rufus_Wasser_Info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Przysy³a mnie Lewus. Przynoszê ci wodê.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Dziêki, stary. W gêbie mi ju¿ zasch³o.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Woda?! Hej, kolego! Nic ci ju¿ nie zosta³o. Tylko mi nie mów, ¿e znowu wszyscy zd¹¿yli siê napiæ oprócz mnie!
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Rufus_Hello (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Hello_Condition;
	information	= DIA_Rufus_Hello_Info;
	permanent	= 0;
	description	= "Czeœæ! Jestem tu nowy. Chcia³bym siê dowiedzieæ, co siê tu dzieje.";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //Czeœæ! Jestem tu nowy. Chcia³bym siê dowiedzieæ, co siê tu dzieje.
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Zapytaj kogoœ innego, dobra? Ja tu tylko uprawiam ry¿. Na innych rzeczach siê nie znam.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //Najchêtniej powiedzia³bym Ry¿owemu Ksiêciuniowi, ¿eby sam odwala³ swoj¹ brudn¹ robotê!
};

// ************************************************************
// 						Warum arbeitest du
// ************************************************************

INSTANCE DIA_Rufus_Why (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Why_Condition;
	information	= DIA_Rufus_Why_Info;
	permanent	= 0;
	description	= "Skoro tak ci to nie odpowiada, dlaczego tu pracujesz? ";
};                       

FUNC INT DIA_Rufus_Why_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Why_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Why_15_00"); //Skoro tak ci to nie odpowiada, dlaczego tu pracujesz?
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //To siê zdarzy³o pierwszego dnia po moim przybyciu. Lewus, jeden z oprychów pracuj¹cych dla Ry¿owego Ksiêcia, podszed³ do mnie i spyta³ czy nie móg³bym im pomóc na polu.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //Powiedzia³em "jasne". W koñcu by³em tu nowy i zale¿a³o mi na znalezieniu sobie przyjació³.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //Nastêpnego dnia, kiedy ucina³em sobie drzemkê, facet znowu siê zjawi³.
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //Powiedzia³: "Chyba nie chcesz, ¿eby twoi koledzy odwalali za ciebie ca³¹ robotê, co?".
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //Powiedzia³em mu, ¿e jestem wyczerpany wczorajsz¹ prac¹, i ¿e potrzebujê odpoczynku. Ale on mia³ to gdzieœ.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //Z³apa³ mnie za ko³nierz i ZACI¥GN¥£ z powrotem na pole.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //Od tamtej pory codziennie czeka³ na mnie na progu mojej chaty - dopóki nie nauczy³em siê sam wychodziæ w pole. Nie chcia³em, ¿eby mnie poturbowali.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //To banda morderców. Lepiej trzymaj siê od nich z daleka.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// ************************************************************
// 						Wer ist Ricelord?
// ************************************************************

INSTANCE DIA_Rufus_Ricelord (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 2;
	condition	= DIA_Rufus_Ricelord_Condition;
	information	= DIA_Rufus_Ricelord_Info;
	permanent	= 0;
	description	= "Kim jest Ry¿owy Ksi¹¿ê?";
};                       

FUNC INT DIA_Rufus_Ricelord_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello)) && (MIS_BuntZbieraczy != LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Ricelord_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Ricelord_15_00"); //Kim jest Ry¿owy Ksi¹¿ê?
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //By³ jednym z pierwszych ludzi, którzy tutaj trafili. Pomaga³ w zak³adaniu Obozu i rozpocz¹³ uprawê ry¿u.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //Dziœ jedyne, co robi, to obnosi swoje brzuszysko po magazynie. T³usty wieprz!
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};


//========================================
//-----------------> BuntKurwa
//========================================

INSTANCE DIA_Rufus_BuntKurwa (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_BuntKurwa_Condition;
   information  = DIA_Rufus_BuntKurwa_Info;
   permanent	= FALSE;
   description	= "Planujecie bunt?";
};

FUNC INT DIA_Rufus_BuntKurwa_Condition()
{
    if (MIS_BuntZbieraczy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_BuntKurwa_Info()
{
    AI_Output (other, self ,"DIA_Rufus_BuntKurwa_15_01"); //Planujecie bunt?
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_02"); //Cicho! Sk¹d o tym wiesz?
    AI_Output (other, self ,"DIA_Rufus_BuntKurwa_15_03"); //Horacy mi mówi³.
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_04"); //No wiêc by³ taki plan. Chcieliœmy w koñcu siê im sprzeciwiæ.
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_05"); //Pracujemy tu po 14 godzin dziennie. Jesteœmy bici, a czasem niektórzy z nas gin¹.
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_06"); //Pamiêtam, gdy Lewus zabi³ mojego przyjaciela, Dereka.
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_07"); //To by³o trzy lata temu...
    AI_Output (other, self ,"DIA_Rufus_BuntKurwa_15_08"); //Muszê wam pomóc. Niewa¿ne w jaki sposób. 
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_09"); //Chcesz ich zabiæ?
    AI_Output (other, self ,"DIA_Rufus_BuntKurwa_15_10"); //Jeœli to konieczne.
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_11"); //Zaczekaj. Muszê to wszystko przemyœleæ.
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_12"); //PrzyjdŸ do mnie o pó³nocy.
    B_LogEntry                     (CH1_BuntZbieraczy,"Rufus faktycznie odpowiada za zaplanowanie rewolucji. Gdy tylko powiedzia³em mu, ¿e rozmawia³em z Horacym, natychmiast mi zaufa³. Mam zg³osiæ siê do niego o pó³nocy, aby dowiedzieæ siê czegoœ wiêcej o buncie zbieraczy.");
	DIA_Rufus_Nasi_OFF = false; // 
};

//========================================
//-----------------> Jestem
//========================================

INSTANCE DIA_Rufus_Jestem (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 2;
   condition    = DIA_Rufus_Jestem_Condition;
   information  = DIA_Rufus_Jestem_Info;
   permanent	= FALSE;
   description	= "Jestem.";
};

FUNC INT DIA_Rufus_Jestem_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_BuntKurwa))
    &&      (Wld_IsTime     (00,00,02,59))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_Jestem_Info()
{
    AI_Output (other, self ,"DIA_Rufus_Jestem_15_01"); //Jestem.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_02"); //Œwietnie! Obmyœli³em plan.
    AI_Output (other, self ,"DIA_Rufus_Jestem_15_03"); //Co zrobimy?
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_04"); //Wszystko po cichu, noc¹.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_05"); //Ty zajmiesz siê Ry¿owym Ksiêciem. Jest najsilniejszy.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_06"); //Zajdziesz go od ty³u, a do magazynu wejdziesz przez chatê.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_07"); //My zajmiemy siê Lewusem.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_08"); //Gdy zabijesz tego wieprza, przybêdziesz nam na pomoc.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_09"); //Z pewnoœci¹ z góry przylec¹ pupilki Lewusa.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_10"); //Musimy siê dobrze przygotowaæ do walki.
    AI_Output (other, self ,"DIA_Rufus_Jestem_15_11"); //Co teraz mam robiæ?
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_12"); //Najpierw musimy wybadaæ, którzy zbieracze s¹ z nami.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_13"); //Nie mo¿emy dopuœciæ do zdrady. Wypytaj Horacego, Pocka i Homera. Wprawdzie Horacy nie powinien nam wchodziæ w drogê, ale lepiej siê upewniæ. 
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_14"); //Gdy bêdziesz wiedzia³, kto jest po naszej stronie, przyjdŸ do mnie.
	Homer_Rozpracowany = false; //na razie nie jest rozpracowany
	Horatio_KnowsBunt = false;
	Homer_KnowsBunt = false;
    B_LogEntry                     (CH1_BuntZbieraczy,"Po nocnej rozmowie otrzyma³em zadanie sprawdzenia lojalnoœci Pocka, Homera i Horacego.");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};
/*
//========================================
//-----------------> Nasi
//========================================

INSTANCE DIA_Rufus_Nasi (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_Nasi_Condition;
   information  = DIA_Rufus_Nasi_Info;
   permanent	= false;
   description	= "Co do naszych ludzi...";
};

FUNC INT DIA_Rufus_Nasi_Condition()
{
 if (Npc_KnowsInfo (hero, DIA_Rufus_Jestem))
 && (MIS_BuntZbieraczy == LOG_RUNNING)      
 //&& (DIA_Rufus_Nasi_OFF == false) 
{
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_Nasi_Info()
{
    AI_Output (other, self ,"DIA_Rufus_Nasi_15_01"); //Co do naszych ludzi...
    AI_Output (self, other ,"DIA_Rufus_Nasi_03_02"); //Wiêkszoœæ jest z nami, a co z pozosta³ymi?

    Info_ClearChoices		(DIA_Rufus_Nasi);
	if (Npc_KnowsInfo (hero, DIA_Horatio_Bunt))
	{
    Info_AddChoice		(DIA_Rufus_Nasi, "Horacy nam nie pomo¿e.", DIA_Rufus_Nasi_Horatio);
	};
	if (Npc_KnowsInfo (hero, DIA_Homer_PopieraszBunt)) 
	&& (Homer_Rozpracowany == false)
	{
    Info_AddChoice		(DIA_Rufus_Nasi, "Homer nam pomo¿e.", DIA_Rufus_Nasi_Homer);
	};
	if (Npc_KnowsInfo (hero, DIA_Homer_PopieraszBunt)) 
	&& (Homer_Rozpracowany == true)
	{
	Info_AddChoice		(DIA_Rufus_Nasi, "Homer to zdrajca.", DIA_Rufus_Nasi_HomerCipa);
	};
	if (Npc_KnowsInfo (hero, DIA_Pock_BuntujeszSie))
	{
    Info_AddChoice		(DIA_Rufus_Nasi, "Pock jest podejrzany.", DIA_Rufus_Nasi_Pock);
	};
    Info_AddChoice		(DIA_Rufus_Nasi, DIALOG_BACK, DIA_Rufus_Nasi_BACK);
};

func void DIA_Rufus_Nasi_Horatio ()
{
AI_Output (other, self ,"DIA_Rufus_Nasi_Horatio_15_01"); //Horacy nam nie pomo¿e, ale te¿ nic nie powie.
AI_Output (self, other ,"DIA_Rufus_Nasi_Horatio_03_02"); //Tego siê spodziewa³em.
Horatio_KnowsBunt = true;
};

func void DIA_Rufus_Nasi_Homer ()
{
AI_Output (other, self ,"DIA_Rufus_Nasi_Homer_15_01"); //Homer jest po naszej stronie.
AI_Output (self, other ,"DIA_Rufus_Nasi_Homer_03_02"); //To œwietnie.
Homer_KnowsBunt = true;
};

func void DIA_Rufus_Nasi_HomerCipa ()
{
AI_Output (other, self ,"DIA_Rufus_Nasi_HomerCipa_15_01"); //Homer to pupilek Ry¿owego Ksiêcia. Najlepiej nic mu nie mówiæ.
AI_Output (self, other ,"DIA_Rufus_Nasi_HomerCipa_03_02"); //Dobrze, ¿e nas ostrzeg³eœ.
B_GiveXP (100);
Homer_KnowsBunt = true;
};

func void DIA_Rufus_Nasi_Pock ()
{
AI_Output (other, self ,"DIA_Rufus_Nasi_Pock_15_01"); //Pock jest podejrzany. Nic nie wiedzia³ o buncie. Chcia³ wyci¹gn¹æ ode mnie jak najwiêcej informacji.
AI_Output (self, other ,"DIA_Rufus_Nasi_Pock_03_02"); //Dobrze, ¿e nas ostrzeg³eœ.
B_GiveXP (100);
Pock_KnowsBunt = true;
};
func void DIA_Rufus_Nasi_BACK ()
{
 Info_ClearChoices	(DIA_Rufus_Nasi);
 DIA_Rufus_Nasi.permanent = true;
};



//========================================
//-----------------> Next
//========================================

INSTANCE DIA_Rufus_Next (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_Next_Condition;
   information  = DIA_Rufus_Next_Info;
   permanent	= FALSE;
   description	= "Co dalej?";
};

FUNC INT DIA_Rufus_Next_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_Nasi))
   // &&  (DIA_Rufus_Nasi_OFF == false)    
{
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_Next_Info()
{
    AI_Output (other, self ,"DIA_Rufus_Next_15_01"); //Co dalej?
    if (Homer_KnowsBunt == true)
    || (Horatio_KnowsBunt == true)
    || (Pock_KnowsBunt == true)
    {
  
        AI_Output (self, other ,"DIA_Rufus_Next_03_02"); //Teraz potrzebujemy nieco broni i alkoholu.
        AI_Output (other, self ,"DIA_Rufus_Next_15_03"); //Alkoholu?
        AI_Output (self, other ,"DIA_Rufus_Next_03_04"); //Tak. Pomyœleliœmy, ¿e zast¹pimy ry¿ówkê czystym alkoholem.
        AI_Output (self, other ,"DIA_Rufus_Next_03_05"); //Bêdziemy mieli przewagê nad przeciwnikami.
        AI_Output (self, other ,"DIA_Rufus_Next_03_06"); //Upici nie bêd¹ w stanie tak dobrze walczyæ.
        AI_Output (other, self ,"DIA_Rufus_Next_15_07"); //Dobry pomys³! Pójdê do karczmy i postaram siê coœ przynieœæ.
        AI_Output (self, other ,"DIA_Rufus_Next_03_08"); //Jeœli chodzi o broñ, to idŸ do Swineya, do Wolnej Kopalni.
        AI_Output (self, other ,"DIA_Rufus_Next_03_09"); //To mój bliski znajomy. Z pewnoœci¹ coœ ci da.
        B_LogEntry                     (CH1_BuntZbieraczy,"Pora przygotowaæ broñ. Mam przynieœæ kilka mieczy od Swineya. Po alkohol mam udaæ siê do karczmy.");
        DIA_Rufus_Nasi_OFF = true;
        If_BuyAlco_Jer = true;
    }
    else
    {
        AI_Output (self, other ,"DIA_Rufus_Next_03_10"); //Nie masz jeszcze ¿adnych informacji. Pogadaj ze zbieraczami.
        DIA_Rufus_Nasi_OFF = false;
    };
};
*/

/*
//========================================
//-----------------> HomerHelp
//========================================

INSTANCE DIA_Rufus_HomerHelp (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_HomerHelp_Condition;
   information  = DIA_Rufus_HomerHelp_Info;
   permanent	= FALSE;
   description	= "Homer nam pomo¿e!";
};

FUNC INT DIA_Rufus_HomerHelp_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Homer_PopieraszBunt)) 
	&& (Homer_Rozpracowany == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_HomerHelp_Info()
{
    AI_Output (other, self ,"DIA_Rufus_HomerHelp_15_01"); //Homer nam pomo¿e!
    AI_Output (other, self ,"DIA_Rufus_HomerHelp_15_02"); //Rozmawia³em z nim. Zdradzi³em mu te¿ nasz plan.
    AI_Output (self, other ,"DIA_Rufus_HomerHelp_03_03"); //Dobrze. Mamy kolejnego zbieracza po naszej stronie.
};
*/

//========================================
//-----------------> HomerPrzydupas
//========================================

INSTANCE DIA_Rufus_HomerPrzydupas (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 2;
   condition    = DIA_Rufus_HomerPrzydupas_Condition;
   information  = DIA_Rufus_HomerPrzydupas_Info;
   permanent	= FALSE;
   description	= "Homer to przydupas Lewusa!";
};

FUNC INT DIA_Rufus_HomerPrzydupas_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Homer_PopieraszBunt)) 
	//&& (Homer_Rozpracowany == true) nieu¿ywane od 1.4.6
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_HomerPrzydupas_Info()
{
    AI_Output (other, self ,"DIA_Rufus_HomerPrzydupas_15_01"); //Homer darzy szacunkiem Ry¿owego Ksiêcia. Lepiej mu o niczym nie mówiæ. 
    AI_Output (self, other ,"DIA_Rufus_HomerPrzydupas_03_02"); //W sumie nigdy nie ukrywa³ swojej sympatii do niego. 
	
    //AI_Output (self, other ,"DIA_Rufus_HomerPrzydupas_03_05"); //WeŸ tê nagrodê.
   // CreateInvItems (self, ItMiNugget, 15);
   // B_GiveInvItems (self, other, ItMiNugget, 15);
};

//========================================
//-----------------> HoracyMaWDupie
//========================================

INSTANCE DIA_Rufus_HoracyMaWDupie (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 3;
   condition    = DIA_Rufus_HoracyMaWDupie_Condition;
   information  = DIA_Rufus_HoracyMaWDupie_Info;
   permanent	= FALSE;
   description	= "Horacy nie popiera buntu.";
};

FUNC INT DIA_Rufus_HoracyMaWDupie_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Horatio_Bunt))
	    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_HoracyMaWDupie_Info()
{
    AI_Output (other, self ,"DIA_Rufus_HoracyMaWDupie_15_01"); //Horacy nie popiera buntu, ale nie bêdzie nam wchodzi³ w drogê.
    AI_Output (self, other ,"DIA_Rufus_HoracyMaWDupie_03_02"); //To by³o do przewidzenia. Szkoda, bo jest ponoæ bardzo silny.
    //AI_Output (self, other ,"DIA_Rufus_HoracyMaWDupie_03_03"); //
};

//========================================
//-----------------> PockOszust
//========================================

INSTANCE DIA_Rufus_PockOszust (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 4;
   condition    = DIA_Rufus_PockOszust_Condition;
   information  = DIA_Rufus_PockOszust_Info;
   permanent	= FALSE;
   description	= "Pock jest konfidentem!";
};

FUNC INT DIA_Rufus_PockOszust_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Pock_BuntujeszSie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_PockOszust_Info()
{
    AI_Output (other, self ,"DIA_Rufus_PockOszust_15_01"); //Pock jest konfidentem! Donosi na innych zbieraczy. Do tego wêszy wokó³ twojej osoby. 
    AI_Output (self, other ,"DIA_Rufus_PockOszust_03_02"); //Musimy mieæ siê na bacznoœci. Nie mo¿e siê niczego dowiedzieæ.
};

//========================================
//-----------------> ZbieraczeAll
//========================================

INSTANCE DIA_Rufus_ZbieraczeAll (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 5;
   condition    = DIA_Rufus_ZbieraczeAll_Condition;
   information  = DIA_Rufus_ZbieraczeAll_Info;
   permanent	= FALSE;
   description	= "Co do wiêkszoœci zbieraczy...";
};

FUNC INT DIA_Rufus_ZbieraczeAll_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_Jestem))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_ZbieraczeAll_Info()
{
    AI_Output (other, self ,"DIA_Rufus_ZbieraczeAll_15_01"); //Co do wiêkszoœci zbieraczy...
    AI_Output (self, other ,"DIA_Rufus_ZbieraczeAll_03_02"); //Ju¿ z nimi rozmawia³em. Wiêkszoœæ jest po naszej stronie.
    AI_Output (self, other ,"DIA_Rufus_ZbieraczeAll_03_03"); //Ty porozmawiaj Horacym, Pockiem i Homerem. 
    AI_Output (other, self ,"DIA_Rufus_ZbieraczeAll_15_04"); //Dobrze.
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_Rufus_HELLO6 (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 6;
   condition    = DIA_Rufus_HELLO6_Condition;
   information  = DIA_Rufus_HELLO6_Info;
   permanent	= FALSE;
   description	= "Co dalej?";
};

FUNC INT DIA_Rufus_HELLO6_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_HomerPrzydupas))
    && (Npc_KnowsInfo (hero, DIA_Rufus_HoracyMaWDupie))
    && (Npc_KnowsInfo (hero, DIA_Rufus_PockOszust))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_HELLO6_Info()
{
    AI_Output (other, self ,"DIA_Rufus_HELLO6_15_01"); //Co dalej?
    AI_Output (self, other ,"DIA_Rufus_HELLO6_03_02"); //Teraz potrzebujemy nieco broni i alkoholu.
    AI_Output (other, self ,"DIA_Rufus_HELLO6_15_03"); //Alkoholu?
    AI_Output (self, other ,"DIA_Rufus_HELLO6_03_04"); //Tak. Pomyœleliœmy, ¿e zast¹pimy ry¿ówkê czystym alkoholem.
    AI_Output (self, other ,"DIA_Rufus_HELLO6_03_05"); //Bêdziemy mieli przewagê nad przeciwnikami.
    AI_Output (self, other ,"DIA_Rufus_HELLO6_03_06"); //Upici nie bêd¹ w stanie tak dobrze walczyæ.
    AI_Output (other, self ,"DIA_Rufus_HELLO6_15_07"); //Dobry pomys³! Pójdê do karczmy i postaram siê coœ przynieœæ.
    AI_Output (self, other ,"DIA_Rufus_HELLO6_03_08"); //Jeœli chodzi o broñ, idŸ do Swineya, do Wolnej Kopalni.
    AI_Output (self, other ,"DIA_Rufus_HELLO6_03_09"); //To mój bliski znajomy. Z pewnoœci¹ coœ ci da.
	
    B_LogEntry        (CH1_BuntZbieraczy,"Po sprawdzeniu lojalnoœci wszystkich zbieraczy przysz³a kolej na zdobycie broni. Mam siê zg³osiæ po dostawê do Swineya z Wolnej Kopalni. Ponadto Rufus chce, abym zdoby³ czysty alkohol od Jeremiasza.");
	If_BuyAlco_Jer = true;
};



//========================================
//-----------------> GivePaczki
//========================================

INSTANCE DIA_Rufus_GivePaczki (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_GivePaczki_Condition;
   information  = DIA_Rufus_GivePaczki_Info;
   permanent	= FALSE;
   description	= "Mam paczki z broni¹.";
};

FUNC INT DIA_Rufus_GivePaczki_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Swiney_Bron))
    && (Npc_HasItems (other, ItMi_PaczkaMiecze1) >=2) && (Npc_KnowsInfo (hero, DIA_Rufus_HELLO6)) //1.24 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_GivePaczki_Info()
{
    AI_Output (other, self ,"DIA_Rufus_GivePaczki_15_01"); //Mam paczki z broni¹.
    AI_Output (self, other ,"DIA_Rufus_GivePaczki_03_02"); //To œwietnie. Zaraz je rozdam naszym ludziom.
    B_GiveInvItems (other, self, ItMi_PaczkaMiecze1, 2);
};

//========================================
//-----------------> Vodka
//========================================

INSTANCE DIA_Rufus_Vodka (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 2;
   condition    = DIA_Rufus_Vodka_Condition;
   information  = DIA_Rufus_Vodka_Info;
   permanent	= FALSE;
   description	= "Mam alkohol.";
};

FUNC INT DIA_Rufus_Vodka_Condition()
{
    if (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=12) && (Npc_KnowsInfo (hero, DIA_Rufus_HELLO6)) //1.24 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_Vodka_Info()
{
    AI_Output (other, self ,"DIA_Rufus_Vodka_15_01"); //Mam alkohol.
    AI_Output (self, other ,"DIA_Rufus_Vodka_03_02"); //Œwietnie, ja w miêdzyczasie opracowa³em plan.
    AI_Output (self, other ,"DIA_Rufus_Vodka_03_03"); //Musimy w jakiœ sposób podrzuciæ ludziom Ksiêcia alkohol tak, aby myœleli ¿e to ry¿ówka.
	AI_Output (self, other ,"DIA_Rufus_Vodka_03_04"); //Homer, jeden z przydupasów dostarcza alkohol od Jeremiasza na pola ry¿owe.
	AI_Output (self, other ,"DIA_Rufus_Vodka_03_05"); //Z tego co wiem, robi to codziennie.
	AI_Output (self, other ,"DIA_Rufus_Vodka_03_06"); //IdŸ wieczorem na pola i powiedz ludziom Ksiêcia, ¿e przysy³a ciê Homer. Jestem pewien, ¿e na to pójd¹.
    AI_Output (other, self ,"DIA_Rufus_Vodka_15_07"); //Jasne. Ju¿ idê.
	//1.4
	  B_LogEntry                     (CH1_BuntZbieraczy,"Po zdobyciu alkoholu Rufus poprosi³ mnie, bym rozniós³ czysty alkohol ludziom Ry¿owego Ksiêcia. Mam mówiæ, ¿e przychodzê z polecenia Homera.");
};

//========================================
//-----------------> 1.4 chest
//========================================

INSTANCE DIA_Rufus_ChestFull (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 2;
   condition    = DIA_Rufus_ChestFull_Condition;
   information  = DIA_Rufus_ChestFull_Info;
   permanent	= FALSE;
   description	= "Rozda³em czysty alkohol Ry¿owemu Ksiêciu i jego oprychom.";
};

FUNC INT DIA_Rufus_ChestFull_Condition()
{
    if(Npc_KnowsInfo (hero, DIA_Rufus_Vodka)) && (Npc_KnowsInfo (hero, DIA_Schlaeger_VODKA)) && (Npc_KnowsInfo (hero, DIA_Schlaeger_ALCO)) && (Npc_KnowsInfo (hero, DIA_Ricelord_ALCO_BUNT)) && (Npc_KnowsInfo (hero, DIA_Lefty_ALCO_BUNT)) //1.4
	//((Mob_HasItems	("SKRZYNIA_GRUBASA", ItMi_Alchemy_Alcohol_01)) == true)//1.24 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_ChestFull_Info()
{
    AI_Output (other, self ,"DIA_Rufus_ChestFull_15_01"); //Rozda³em czysty alkohol Ry¿owemu Ksiêciu i jego oprychom.
    AI_Output (self, other ,"DIA_Rufus_ChestFull_03_02"); //Doskonale! Czas wtajemniczyæ ciê w dalsz¹ czêœæ planu.
	//1.4
	  B_LogEntry                     (CH1_BuntZbieraczy,"Podarowanie alkoholu bandziorom to pestka. Jesteœmy ju¿ prawie gotowi. Wkrótce Rufus da mi kolejne instrukcje. ");
};

//========================================
//-----------------> ActionGoWhat
//========================================

INSTANCE DIA_Rufus_ActionGoWhat (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 3;
   condition    = DIA_Rufus_ActionGoWhat_Condition;
   information  = DIA_Rufus_ActionGoWhat_Info;
   permanent	= FALSE;
   description	= "Co teraz? Zaczynamy?";
};

FUNC INT DIA_Rufus_ActionGoWhat_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_ChestFull)) //1.4 edited by g1210
    && (Npc_KnowsInfo (hero, DIA_Rufus_GivePaczki))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_ActionGoWhat_Info()
{
    AI_Output (other, self ,"DIA_Rufus_ActionGoWhat_15_01"); //Co teraz? Zaczynamy?
   // AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_02"); //Poczekaj. Nie tak prêdko.
   // AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_03"); //Wyœlê najpierw kogoœ, by podmieni³ ry¿ówkê na nasz przysmak.
    AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_04"); //Ty wkraczasz o pó³nocy.
    AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_05"); //Wchodzisz do magazynu, potem zabijasz wieprza i pêdzisz do nas.
    AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_06"); //Tylko masz biec, do cholery.
    AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_07"); //Nastêpnie razem wykañczamy Lewusa i jego siepaczy.
    AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_08"); //Rankiem Najemnicy bêd¹ musieli znaleŸæ kogoœ na ich miejsce. He he.
	AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_09"); //Razem z moimi ludŸmi bêdê siê krêci³ w okolicy. A i jeszcze jedno! 
	AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_10"); //Uwa¿aj na Najemników ze stra¿nicy. Gdy nas zobacz¹, zaczn¹ strzelaæ. Po prostu siê wtedy wycofaj.
	AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_11"); //W ciemnoœci na pewno nie rozpoznaj¹ twarzy. Nikt nie powinien ciê potem œcigaæ.
	Npc_ExchangeRoutine (Bau_900_Ricelord,"bunt");
	Npc_ExchangeRoutine (BAU_928_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_916_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_923_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_907_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_904_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_903_rufus,"goto");
	BAU_903_rufus.flags = 2;
	Npc_ExchangeRoutine (BAU_902_pock,"goto");
	Npc_ExchangeRoutine (BAU_914_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_915_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_930_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_919_Bauer,"goto");
	var C_NPC Ricelord	; Ricelord 	= Hlp_GetNpc (Bau_900_Ricelord	);
	Npc_ChangeAttribute	(Ricelord,	ATR_HITPOINTS,	275);
	
	var C_NPC Lewus	; Lewus 	= Hlp_GetNpc (ORG_844_Lefty	);
	Npc_ChangeAttribute	(Lewus,	ATR_HITPOINTS,	200);

	
	// dwóch goœci przy bramie to bd przyjaciele Lewusa, przybiegn¹ na pomoc DOPISAÆ
    B_LogEntry                     (CH1_BuntZbieraczy,"Dziœ w nocy zaczynamy. O pó³nocy mam wejœæ przez chatê do magazynu i pozbyæ siê Ry¿owego Ksiêcia raz na zawsze. Potem pora na Lewusa. Podczas walki powinienem uwa¿aæ na ³uczników obsadzaj¹cych górn¹ bramê. S¹ bardzo niebezpieczni. Najlepiej, jeœli bêdê siê trzyma³ blisko magazynu.");
};

//========================================
//-----------------> WINWONWON
//========================================

INSTANCE DIA_Rufus_WINWONWON (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_WINWONWON_Condition;
   information  = DIA_Rufus_WINWONWON_Info;
   permanent	= FALSE;
   description	= "Te sukinsyny nie ¿yj¹!";
};

FUNC INT DIA_Rufus_WINWONWON_Condition()
{
    if (MIS_BuntZbieraczy == LOG_RUNNING)
    && (Npc_IsDead(Bau_900_Ricelord))
    && (Npc_IsDead(ORG_844_Lefty))
	&& (Npc_KnowsInfo (hero, DIA_Rufus_ActionGoWhat))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_WINWONWON_Info()
{
    AI_Output (other, self ,"DIA_Rufus_WINWONWON_15_01"); //Te sukinsyny nie ¿yj¹!
    AI_Output (self, other ,"DIA_Rufus_WINWONWON_03_02"); //Masz racjê! Uda³o siê nam.
    AI_Output (self, other ,"DIA_Rufus_WINWONWON_03_03"); //Dobra robota, stary. Bez ciebie nie dalibyœmy rady.
    AI_Output (other, self ,"DIA_Rufus_WINWONWON_15_04"); //To zas³uga wspólnoty.
	
	BAU_903_rufus.flags = 0;
    B_LogEntry               (CH1_BuntZbieraczy,"Ry¿owy Ksi¹¿ê, Lewus i jego ludzie nie ¿yj¹. Zbieracze nie bêd¹ ju¿ ciemiê¿eni. Wreszcie uda³o im siê wyswobodziæ...");
    Log_SetTopicStatus       (CH1_BuntZbieraczy, LOG_SUCCESS);
    MIS_BuntZbieraczy = LOG_SUCCESS;
	
	Npc_ExchangeRoutine (BAU_928_Bauer,"liba");
	Npc_ExchangeRoutine (BAU_916_Bauer,"liba");
	Npc_ExchangeRoutine (BAU_923_Bauer,"liba");
	Npc_ExchangeRoutine (BAU_907_Bauer,"liba");
	Npc_ExchangeRoutine (BAU_904_Bauer,"liba");
	
	po_buncie = true;
    B_GiveXP (XP_BuntZbieraczy);
	
	if Lefty_Mission == LOG_RUNNING
	{
	Lefty_Mission = LOG_SUCCESS;
	B_LogEntry			(CH1_CarryWater,	"Lewus gryzie piach. Ju¿ nie bêdzie mi rozkazywa³ nosiæ za siebie wodê.");
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
	};
};