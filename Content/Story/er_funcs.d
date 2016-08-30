//Edycja rozszerzona 1.4 - funkcje
//by gothic1210

func void upojenie_alkoholowe ()
{
print ("Zmniejszono szanse na trafienia krytyczne!");
Mdl_ApplyOverlayMds (hero,"Humans_drunken.mds");
if (Npc_GetTalentSkill (hero,NPC_TALENT_1H)==1)
{
Npc_SetTalentValue(hero, NPC_TALENT_1H, Npc_GetTalentValue(hero, NPC_TALENT_1H)-3);
}
else if (Npc_GetTalentSkill (hero,NPC_TALENT_1H)==2)
{
Npc_SetTalentValue(hero, NPC_TALENT_1H, Npc_GetTalentValue(hero, NPC_TALENT_1H)-7);
};
if (Npc_GetTalentSkill (hero,NPC_TALENT_2H)==1)
{
Npc_SetTalentValue(hero, NPC_TALENT_2H, Npc_GetTalentValue(hero, NPC_TALENT_2H)-3);
}
else if (Npc_GetTalentSkill (hero,NPC_TALENT_2H)==2)
{
Npc_SetTalentValue(hero, NPC_TALENT_2H, Npc_GetTalentValue(hero, NPC_TALENT_2H)-7);
};

if (Npc_GetTalentSkill (hero,NPC_TALENT_BOW)==1)
{
Npc_SetTalentValue(hero, NPC_TALENT_BOW, Npc_GetTalentValue(hero, NPC_TALENT_BOW)-14);
}
else if (Npc_GetTalentSkill (hero,NPC_TALENT_BOW)==2)
{
Npc_SetTalentValue(hero, NPC_TALENT_BOW, Npc_GetTalentValue(hero, NPC_TALENT_BOW)-28);
};
if (Npc_GetTalentSkill (hero,NPC_TALENT_CROSSBOW)==1)
{
Npc_SetTalentValue(hero, NPC_TALENT_CROSSBOW, Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)-18);
}
else if (Npc_GetTalentSkill (hero,NPC_TALENT_CROSSBOW)==2)
{
Npc_SetTalentValue(hero, NPC_TALENT_CROSSBOW, Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)-38);
};

};

func void off_upojenie_alkoholowe ()
{
print ("Przywrócono szanse na trafienia krytyczne!");
Mdl_RemoveOverlayMDS	(hero,"Humans_drunken.mds");
if (Npc_GetTalentSkill (hero,NPC_TALENT_1H)==1)
{
Npc_SetTalentValue(hero, NPC_TALENT_1H, Npc_GetTalentValue(hero, NPC_TALENT_1H)+3);
}
else if (Npc_GetTalentSkill (hero,NPC_TALENT_1H)==2)
{
Npc_SetTalentValue(hero, NPC_TALENT_1H, Npc_GetTalentValue(hero, NPC_TALENT_1H)+7);
};
if (Npc_GetTalentSkill (hero,NPC_TALENT_2H)==1)
{
Npc_SetTalentValue(hero, NPC_TALENT_2H, Npc_GetTalentValue(hero, NPC_TALENT_2H)+3);
}
else if (Npc_GetTalentSkill (hero,NPC_TALENT_2H)==2)
{
Npc_SetTalentValue(hero, NPC_TALENT_2H, Npc_GetTalentValue(hero, NPC_TALENT_2H)+7);
};

if (Npc_GetTalentSkill (hero,NPC_TALENT_BOW)==1)
{
Npc_SetTalentValue(hero, NPC_TALENT_BOW, Npc_GetTalentValue(hero, NPC_TALENT_BOW)+14);
}
else if (Npc_GetTalentSkill (hero,NPC_TALENT_BOW)==2)
{
Npc_SetTalentValue(hero, NPC_TALENT_BOW, Npc_GetTalentValue(hero, NPC_TALENT_BOW)+28);
};
if (Npc_GetTalentSkill (hero,NPC_TALENT_CROSSBOW)==1)
{
Npc_SetTalentValue(hero, NPC_TALENT_CROSSBOW, Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+18);
}
else if (Npc_GetTalentSkill (hero,NPC_TALENT_CROSSBOW)==2)
{
Npc_SetTalentValue(hero, NPC_TALENT_CROSSBOW, Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+38);
};
};

func void Er_pierscien_wykrycia ()
{
print ("test!!");
};

/*
// ************************************************************************************************
// B_RemoveNpc (NPC wird komplett aus der Welt entfernt, wenn er ausserhalb der 40 MeterGlocke ist)
// ************************************************************************************************
func void B_RemoveNpc (var int npcInstance)
{
   var C_NPC npc;   
   npc = Hlp_GetNpc(npcInstance);
   if    (Hlp_IsValidNpc (npc))
      && (!Npc_IsDead (npc))
      {   
         npc.flags = 0;
         AI_Teleport        (npc,"TOT");   //Joly: Fürs removen innerhalb der 40 Meter Glocke!
         Npc_ExchangeRoutine	   (npc,"TOT");
         Npc_ChangeAttribute   (npc, ATR_HITPOINTS, -npc.attribute[ATR_HITPOINTS_MAX]);
         AI_Teleport        (npc,"TOT");   //Joly: Fürs removen innerhalb der 40 Meter Glocke!
      };
};
*/