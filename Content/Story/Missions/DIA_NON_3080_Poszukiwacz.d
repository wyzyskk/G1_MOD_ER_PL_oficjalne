//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Poszukiwacz_HELLO (C_INFO)
{
   npc          = NON_3080_Poszukiwacz;
   nr           = 1;
   condition    = DIA_Poszukiwacz_HELLO_Condition;
   information  = DIA_Poszukiwacz_HELLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Poszukiwacz_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Poszukiwacz_HELLO_Info()
{
    AI_Output (self, other ,"DIA_Poszukiwacz_HELLO_03_01"); //Szukasz mego Pana, czy¿ nie?
    AI_Output (other, self ,"DIA_Poszukiwacz_HELLO_15_02"); //Co ci do tego? Gadaj, gdzie on jest!
    AI_Output (self, other ,"DIA_Poszukiwacz_HELLO_03_03"); //Moim celem jest, byœ nie do¿y³ spotkania z nim. Szykuj siê na œmieræ.
    if (MIS_MagWGoorach1 == LOG_RUNNING)
    {
        B_LogEntry                     (CH1_MagWGoorach1,"W górach spotkaliœmy Poszukiwacza. Widocznie nie znajdziemy tam Czarnego Maga.");

        B_GiveXP (200);
};
if (MIS_WlakaZczarym == LOG_RUNNING)
{
    B_LogEntry                     (CH1_WlakaZczarym,"W górach spotkaliœmy Poszukiwacza. Widocznie nie znajdziemy tam Czarnego Maga.");
};
Wld_InsertNpc				(Demon,"LOCATION_12_01");
Wld_InsertNpc				(Skeleton,"PIZDA1");
Wld_InsertNpc				(Skeleton,"PIZDA2");
Wld_InsertNpc				(Skeleton,"PIZDA33");
Wld_InsertNpc				(Skeleton,"PIZDA4");
AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");

};