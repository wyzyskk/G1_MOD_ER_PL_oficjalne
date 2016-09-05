//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_prin_EXIT(C_INFO)
{
	npc             = NON_2703_MYSLIWY;
	nr              = 999;
	condition	= DIA_prin_EXIT_Condition;
	information	= DIA_prin_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_prin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_prin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_prin_HELLO (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_HELLO_Condition;
	information  	= DIA_prin_HELLO_Info;
	permanent		= FALSE;
	description     = "Kim jesteœ?";
};

FUNC INT DIA_prin_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_prin_HELLO_Info()
{
	AI_Output (other, self ,"DIA_prin_HELLO_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_prin_HELLO_03_02"); //Nazywam siê Prin. Jestem ³owc¹ orków. 
    AI_Output (other, self ,"DIA_prin_HELLO_15_03"); //Jaka jest twoja specjalizacja? Czym siê zajmujesz w obozie?
    AI_Output (self, other ,"DIA_prin_HELLO_03_04"); //Jestem traperem. Moim zadaniem s¹ zwiady, sprawdzanie terenu i tym podobne sprawy. 
};

//========================================
//-----------------> OrcLands
//========================================

INSTANCE DIA_prin_OrcLands (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_OrcLands_Condition;
	information  	= DIA_prin_OrcLands_Info;
	permanent		= FALSE;
	description   	= "Opowiedz mi o Ziemiach Orków.";
};

FUNC INT DIA_prin_OrcLands_Condition()
{
	if Npc_KnowsInfo (hero, DIA_prin_HELLO)
	{
    return TRUE;
	};
};

FUNC VOID DIA_prin_OrcLands_Info()
{
    AI_Output (other, self ,"DIA_prin_OrcLands_15_01"); //Opowiedz mi o Ziemiach Orków.
    AI_Output (self, other ,"DIA_prin_OrcLands_03_02"); //To dosyæ rozleg³y teren. 
    AI_Output (other, self ,"DIA_prin_OrcLands_15_03"); //Dlaczego jest tam tak niebezpiecznie?
    AI_Output (self, other ,"DIA_prin_OrcLands_03_04"); //Wszêdzie krêc¹ siê orkowe patrole, wypatruj¹ce nie wiadomo czego. 
	AI_Output (self, other ,"DIA_prin_OrcLands_03_05"); //Najwiêcej orków jest w³aœnie tutaj, przy granicy. W g³êbi nie pojawiaj¹ siê ju¿ tak licznie. Poza ich miastem, rzecz jasna.
	AI_Output (self, other ,"DIA_prin_OrcLands_03_06"); //Nie brakuje tam jednak innych bestii - brzytw i k¹saczy. 
	AI_Output (self, other ,"DIA_prin_OrcLands_03_07"); //Je¿eli mamy dobry pancerz, to k¹sacze nie s¹ zbyt wielkim zagro¿eniem. Jednak na brzytwy nale¿y szczególnie uwa¿aæ. 
	AI_Output (self, other ,"DIA_prin_OrcLands_03_08"); //Ich stado mo¿e poszarpaæ dobrego wojownika na kawa³eczki w kilka chwil. 
};

//========================================
//-----------------> SomeoneElse
//========================================

INSTANCE DIA_prin_SomeoneElse (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_SomeoneElse_Condition;
	information  	= DIA_prin_SomeoneElse_Info;
	permanent		= FALSE;
	description   	= "Czy mieszka tu ktoœ inny?";
};

FUNC INT DIA_prin_SomeoneElse_Condition()
{
	if Npc_KnowsInfo (hero, DIA_prin_HELLO)
	{
    return TRUE;
	};
};

FUNC VOID DIA_prin_SomeoneElse_Info()
{
	AI_Output (other, self ,"DIA_prin_SomeoneElse_15_01"); //Czy mieszka tu ktoœ inny?
    AI_Output (self, other ,"DIA_prin_SomeoneElse_03_02"); //Na Ziemiach Orków? Z pewnoœci¹! 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_03"); //Z tego co mi wiadomo nieopodal Miasta Orków nie ma nic ciekawego. Jednak ko³o bagna jest jaskinia, w której mieszka pewien Mag Ognia. 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_04"); //Rozmawia³em z nim kiedyœ. Powiedzia³, ¿e szuka jakichœ kamieni przypominaj¹cych kryszta³y, czy coœ takiego.
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_05"); //Rzekomo prowadzi nad nimi badania. Nie znam siê na tym, wiêc nie mia³em zamiaru mu pomagaæ. Doradzi³em tylko, ¿eby uwa¿a³. 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_06"); //Jest jeszcze wielka wie¿a. Trudno j¹ przeoczyæ. W nocy s³ychaæ stamt¹d okropne dŸwiêki. Lepiej siê tam nie zapuszczaj. 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_07"); //Ciekawym miejscem jest te¿ jezioro w pobli¿u Cytadeli. Na jego œrodku znajduje siê stara, zatopiona wie¿a. Nigdy tam nie by³em, ale czuæ stamt¹d plugaw¹ magi¹ na kilometr.
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_08"); //Tego miejsca równie¿ radzi³bym ci unikaæ.
	B_GiveXP (100);
};

//========================================
//-----------------> Teleport
//========================================

INSTANCE DIA_prin_Teleport (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_Teleport_Condition;
	information  	= DIA_prin_Teleport_Info;
	permanent		= FALSE;
	description   	= "Czy istnieje jakaœ runa teleportacji do tego miejsca?";
};

FUNC INT DIA_prin_Teleport_Condition()
{
	if Npc_KnowsInfo (hero, DIA_prin_SomeoneElse)
	{
    return TRUE;
	};
};

FUNC VOID DIA_prin_Teleport_Info()
{
	AI_Output (other, self ,"DIA_prin_Teleport_15_01"); //Czy istnieje jakaœ runa teleportacji do tego miejsca?
    AI_Output (self, other ,"DIA_prin_Teleport_03_02"); //Ten Mag Ognia, o którym ci wspomina³em... Kiedyœ wykonywa³em dla niego pewne zlecenie. Mia³em pozbyæ siê stada brzytw, które zapêdzi³y siê w okolice jego jaskini.
	AI_Output (self, other ,"DIA_prin_Teleport_03_03"); //Gdy wykona³em zadanie, powiedzia³, ¿e nie ma dla mnie rudy. Zapyta³em wiêc, czy jest w stanie mi siê odwdziêczyæ w jakiœ inny sposób.
	AI_Output (self, other ,"DIA_prin_Teleport_03_04"); //Poprosi³em go o zbadanie dla mnie tej tajemniczej p³yty znajduj¹cej siê nad naszym obozem. 
	AI_Output (self, other ,"DIA_prin_Teleport_03_05"); //Wiesz, jestem uczulony na sprawy magii... Chcia³em, ¿eby ktoœ obeznany sprawdzi³, czy to staro¿ytne coœ nie stanowi dla nas zagro¿enia. 
	AI_Output (self, other ,"DIA_prin_Teleport_03_06"); //Okaza³o siê, ¿e w tym miejscu kiedyœ zogniskowano moc magiczn¹... Czy jakoœ tak... Nie znam siê na tym!
	AI_Output (self, other ,"DIA_prin_Teleport_03_07"); //W ka¿dym b¹dŸ razie mag stwierdzi³, ¿e nie stanowi to dla nas niebezpieczeñstwa. W ramach zap³aty za zlecenie przygotowa³ dla mnie kamieñ teleportacji. 
	AI_Output (self, other ,"DIA_prin_Teleport_03_08"); //Powiedzia³, ¿e mogê siê dziêki niemu bezpiecznie tu przenieœæ. Nigdy jednak z niego nie skorzysta³em... Ju¿ ci mówi³em, ¿e nie param siê magi¹.
	AI_Output (self, other ,"DIA_prin_Teleport_03_09"); //Jeœli siê nie boisz, to ci go sprzedam za równowartoœæ mojego zlecenia. To bêdzie jakieœ... 300 bry³ek rudy. Kupujesz?
	
	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
	B_LogEntry		(GE_TraderOW,"£owca orków Prin mo¿e mi sprzedaæ runê teleportu do obozu ³owców orków za cenê 300 bry³ek rudy.");
};

var int buy_teleprt_prin;
//========================================
//-----------------> BuyRune
//========================================

INSTANCE DIA_prin_BuyRune (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_BuyRune_Condition;
	information  	= DIA_prin_BuyRune_Info;
	permanent		= TRUE;
	description   	= "Chcê od ciebie kupiæ tê runê teleportacji.";
};

FUNC INT DIA_prin_BuyRune_Condition()
{
	if Npc_KnowsInfo (hero, DIA_prin_Teleport) && (buy_teleprt_prin == false)
	{
    return TRUE;
	};
};

FUNC VOID DIA_prin_BuyRune_Info()
{
	AI_Output (other, self ,"DIA_prin_BuyRune_15_01"); //Chcê od ciebie kupiæ tê runê teleportacji.
	if (Npc_HasItems (hero, ItMiNugget)>=300)
	{
    AI_Output (self, other ,"DIA_prin_BuyRune_03_02"); //Oto ona. Uwa¿aj tylko, ¿eby nie puœciæ obozu z dymem!
	AI_Output (other, self ,"DIA_prin_BuyRune_15_03"); //Runy teleportacji z regu³y nie siej¹ zniszczenia.
	AI_Output (self, other ,"DIA_prin_BuyRune_03_04"); //A co ty tam wiesz! Ostro¿nie z tym!
	AI_Output (other, self ,"DIA_prin_BuyRune_15_05"); //Dobra, dobra. 
	
	CreateInvItems (self, ItArRuneTeleport_OH, 1);
    B_GiveInvItems (self, other, ItArRuneTeleport_OH, 1);
	
	B_GiveInvItems (other, self, itminugget, 300);
	
	buy_teleprt_prin = true;
	DIA_prin_BuyRune.permanent = false;
	}
	else
	{
	AI_Output (self, other ,"DIA_prin_BuyRune_03_06"); //Umawialiœmy siê na TRZYSTA bry³ek. Nie zapominaj.
	};	
};