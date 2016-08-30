// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Nidas_HELLO1 (C_INFO)
{
   npc          = NON_3070_Nidas;
   nr           = 1;
   condition    = DIA_Nidas_HELLO1_Condition;
   information  = DIA_Nidas_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Nidas_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Nidas_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_01"); //Czeka³em tu na ciebie.
    AI_Output (other, self ,"DIA_Nidas_HELLO1_15_02"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_03"); //Jestem Nidas, mroczny s³uga Czarnego Maga.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_04"); //Pewnie zastanawiasz siê, dlaczego ciê tu sprowadzi³em.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_05"); //Mam dla ciebie pewn¹ propozycjê. Przy³¹cz siê do nas.
    AI_Output (other, self ,"DIA_Nidas_HELLO1_15_06"); //Nas? Czyli kogo?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_07"); //Jestem potê¿nym s³ug¹ Czarnego Maga, Czarny Mag jest wys³annikiem mrocznych si³.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_08"); //Stañ po naszej stronie.
    AI_Output (other, self ,"DIA_Nidas_HELLO1_15_09"); //A je¿eli odmówiê?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_10"); //Wtedy czeka ciê œmieræ.
    AI_Output (other, self ,"DIA_Nidas_HELLO1_15_11"); //Nie jesteœ pierwszym, który czyha na moje ¿ycie.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_12"); //Ty g³upcze! Nawet nie wiesz jak¹ moc móg³byœ posiadaæ!
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_13"); //Masz jakieœ ostatnie ¿yczenie przed œmierci¹?
  B_GiveXP (300);
    Info_ClearChoices		(DIA_Nidas_HELLO1);
    Info_AddChoice		(DIA_Nidas_HELLO1, "Walczmy.", DIA_Nidas_HELLO1_Fight);
    Info_AddChoice		(DIA_Nidas_HELLO1, "Kim jest Czarny Mag?", DIA_Nidas_HELLO1_WhoIsBlackMage);
    Info_AddChoice		(DIA_Nidas_HELLO1, "Czy Poszukiwacze s¹ waszymi s³ugami?", DIA_Nidas_HELLO1_WhoIsPoszukiwacze);
};

FUNC VOID DIA_Nidas_HELLO1_Fight()
{
    AI_Output (other, self ,"DIA_Nidas_HELLO1_Fight_15_01"); //Walczmy.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_Fight_03_02"); //Nêdzny g³upiec.
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
    B_LogEntry                     (CH1_WlakaZczarym,"W wyznaczonym miejscu spotka³em Nidasa, mrocznego s³ugê. Chcia³ z³o¿yæ mi propozycjê dotycz¹c¹ przystania do z³ych mocy, które reprezentuje. Podj¹³em siê walki z nim.");

  
    Info_ClearChoices		(DIA_Nidas_HELLO1);

};

FUNC VOID DIA_Nidas_HELLO1_WhoIsBlackMage()
{
    AI_Output (other, self ,"DIA_Nidas_HELLO1_WhoIsBlackMage_15_01"); //Kim jest Czarny Mag?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsBlackMage_03_02"); //Czarny Mag to jeden z najpotê¿niejszych wys³anników Pana.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsBlackMage_03_03"); //Ma potê¿n¹ moc. W³ada lokalnymi si³ami Beliara.
    AI_Output (other, self ,"DIA_Nidas_HELLO1_WhoIsBlackMage_15_04"); //Gdzie znajdê tego Czarnego Maga?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsBlackMage_03_05"); //Marny cz³owieku, naprawdê s¹dzisz, ¿e zdradzê ci miejsce przebywania naszego Pana.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsBlackMage_03_06"); //Myœlisz, ¿e poszed³byœ tak poprostu w TO miejsce i pokona³ Czarnego Maga.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsBlackMage_03_07"); //Zbytnio przeceniasz swoje mo¿liwoœci. S¹ moce, z którymi lepiej nie walczyæ.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsBlackMage_03_08"); //Lepiej siê do nich przy³¹czyæ.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsBlackMage_03_09"); //Jednak ty wybra³eœ inn¹ drogê, dlatego czeka ciê œmieræ.
    B_LogEntry                     (CH1_WlakaZczarym,"Nie uda³o mi siê ustaliæ, gdzie znajduje siê Czarny Mag. Wiem tylko, ¿e walka z nim nie bêdzie ³atwa.");
};

FUNC VOID DIA_Nidas_HELLO1_WhoIsPoszukiwacze()
{
    AI_Output (other, self ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_15_01"); //Czy Poszukiwacze s¹ waszymi s³ugami?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_03_02"); //Oczywiœcie, ¿e tak.
    AI_Output (other, self ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_15_03"); //Jaki jest ich cel?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_03_04"); //Poszukiwacze werbuj¹ s³ugów dla Czarnego Maga.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_03_05"); //A od niewiernych zbieraj¹ dusze.
    AI_Output (other, self ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_15_06"); //Po co Czarnemu Magowi te dusze?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_03_07"); //Jesteœ dociekliwy, cz³owieku. Po co ci ta wiedza, skoro i tak zaraz umrzesz?
    AI_Output (other, self ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_15_08"); //Dlaczego mi tego nie powiesz, skoro i tak zaraz umrê?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_03_09"); //Aarrgg! MILCZ!
    B_LogEntry                     (CH1_WlakaZczarym,"Poszukiwacze podlegaj¹ Czarnemu Magowi.");
    heroKnowsPoszukiwacze = true;
    B_GiveXP (200);
    B_LogEntry                     (CH1_Poszukiwacze,"Poszukiwacze podlegaj¹ Czarnemu Magowi. Wys³a³ ich, aby zabierali duszê od niewiernych. Jednak nie wiem po co im one.");
};

