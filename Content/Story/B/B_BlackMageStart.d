var int Er_StoryBM_Run;
func void BlackMageStart ()
{
// ------------------CZarny Mag i spółka z.o.o ---------------
		
		Er_StoryBM_Run = true;
		Wld_InsertNpc				(SkeletonSH,"LOCATION_19_03_PATH_RUIN6");
		Wld_InsertNpc				(SkeletonSH,"LOCATION_19_03_PATH_RUIN7");
		Wld_InsertNpc				(Demon,"LOCATION_19_03_PATH_RUIN8");
		Wld_InsertNpc				(Demon,"LOCATION_19_03_PATH_RUIN9");
		Wld_InsertNpc				(SkeletonSH,"LOCATION_19_03_PATH_RUIN10");
		Wld_InsertNpc				(SkeletonSH,"LOCATION_19_03_PATH_RUIN11");
		
		Wld_InsertNpc				(NOV_5067_Poszukiwacz,"VART" );
		Wld_InsertNpc				(NOV_5068_Poszukiwacz,"VART" );
		Wld_InsertNpc				(NOV_5069_Poszukiwacz,"VART" );
		Npc_SetPermAttitude (NOV_5067_Poszukiwacz, ATT_HOSTILE);
		Npc_SetPermAttitude (NOV_5068_Poszukiwacz, ATT_HOSTILE);
		Npc_SetPermAttitude (NOV_5069_Poszukiwacz, ATT_HOSTILE);
		Wld_SendTrigger("MAGEGATE"); //brama w zamku
		Wld_InsertNpc				(NON_3073_Czarny_Mag,"MAG");	
		Wld_InsertNpc				(NON_3074_Poszukiwacz,"MAG");	
		Wld_InsertNpc				(NON_3075_Poszukiwacz,"MAG");	
		Wld_InsertNpc				(NON_3076_Poszukiwacz,"MAG");	
		
		Wld_InsertNpc				(NON_3090_Poszukiwacz,"MAG");	
		Wld_InsertNpc				(NON_3091_Poszukiwacz,"MAG");	
		// Łowcy Poszukiwaczy
				Wld_InsertNpc				(NON_3077_Peratur,"OC1");
		Wld_InsertNpc				(NON_3078_Avallach,"OC1");
		Wld_InsertNpc				(NON_3089_Ashton,"OC1");
		if (Npc_GetTrueGuild(hero) == GIL_SLD)
		{
		B_ChangeGuild    (NON_3077_Peratur,GIL_SLD);
		B_ChangeGuild    (NON_3078_Avallach,GIL_SLD);
		B_ChangeGuild    (NON_3089_Ashton,GIL_SLD);
		}
		else if (Npc_GetTrueGuild(hero) == GIL_TPL)
		{
		B_ChangeGuild    (NON_3077_Peratur,GIL_TPL);
		B_ChangeGuild    (NON_3078_Avallach,GIL_TPL);
		B_ChangeGuild    (NON_3089_Ashton,GIL_TPL);
		}
		else if (Npc_GetTrueGuild(hero) == GIL_BAU)
		{
		B_ChangeGuild    (NON_3077_Peratur,GIL_BAU);
		B_ChangeGuild    (NON_3078_Avallach,GIL_BAU);
		B_ChangeGuild    (NON_3089_Ashton,GIL_BAU);		
		};
		

		if (Npc_GetTrueGuild(hero) != GIL_BAU)
		{
		Npc_ExchangeRoutine (NON_2706_osko , "lowcaPoszukiwaczy");
		};
};