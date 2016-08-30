

var int CSColor;
var int CSAlpha;

func string oCInfo__OnGetText() {
	return MEM_ReadString (ECX + 48);
};

func void SetChoicesPos() {
	var int manager; manager = MEM_ReadInt (MEMINT_oCInformationManager_Address + 28);
	var zCArray arr; arr = _^ (manager + 172);
	
	Print_GetScreenSize();
	
	var int i; i = 0;
	var int loop; loop = MEM_StackPos.position;
	
	if (arr.array)
	&& (i < arr.numInArray) {
																		// Change if other
		var int len; len = Print_GetStringWidth (oCInfo__OnGetText(), "font_old_10_white.tga");
		MEM_WriteInt (manager + 56, len);
		
		i += 1;
		MEM_StackPos.position = loop;
	};
};

func void CSEnable()
{/*
	var int View_ptr;
View_ptr=MEM_InstGetOffset(MEM_GAME)+52;
View_ptr=MEM_ReadInt(View_ptr);
View_ptr=View_ptr+60;
MEM_WriteInt(View_ptr,0);
View_ptr=View_ptr+8;
MEM_WriteInt(View_ptr,1);
		//disable zoom effect
	View_ptr=MEM_InstGetOffset(MEM_GAME)+60;
	View_ptr=MEM_ReadInt(View_ptr);
	View_ptr=View_ptr+4;
	MEM_WriteInt(View_ptr,0);

	//remove tex - conversation
	View_ptr=MEM_InstGetOffset(MEM_GAME)+52;
	View_ptr=MEM_ReadInt(View_ptr);
	View_ptr=View_ptr+60;
	MEM_WriteInt(View_ptr,0);
	//change ypos of conversation window
		View_ptr=View_ptr+8;
	MEM_WriteInt(View_ptr,1);
		//choicebox move
	View_ptr = MEM_ReadInt(MEMINT_oCInformationManager_Address+28);
	var int screen_y_size;
	var int tmp;
	screen_y_size=MEM_ReadInt(View_ptr+76); //4c
	screen_y_size=MEM_ReadInt(screen_y_size+68); //44
	view_ptr = view_ptr+60;//
	if(screen_y_size<=768)
	{
	tmp=screen_y_size*21/24 - ((screen_y_size*21/24)%1);
	MEM_WriteInt(View_ptr,tmp);//3C /nothing /0 - y moved		
	view_ptr = view_ptr+8;
	MEM_WriteInt(View_ptr,screen_y_size-tmp);//44 //rest of screen for box			
	}
	else
	{
		tmp=screen_y_size*113/128; tmp = tmp - (tmp%1);
		if(screen_y_size-tmp>120)//if there is more than 120 px at the cinema bar - center box
		{
		tmp = tmp + (screen_y_size-tmp-120)/2;
		tmp = tmp - (tmp%1);
		MEM_WriteInt(View_ptr,tmp);//3C  - y moved		
		view_ptr = view_ptr+8;
		MEM_WriteInt(View_ptr,120);//44 //120 px for box				
		}
		else
		{
		MEM_WriteInt(View_ptr,tmp);//3C  - y moved			view_ptr = view_ptr+8;
		view_ptr = view_ptr+8;		
		MEM_WriteInt(View_ptr,screen_y_size-tmp);//44 //rest of screen for box			
		};
	};
	view_ptr = view_ptr+28;
	MEM_WriteInt(View_ptr,0); //60 tex*/

	MEM_Game.array_view_visible[3] = 1;
	MEM_Game.array_view_enabled[3] = 1;
	
	var int CSptr; CSptr = MEM_InstGetOffset (MEM_Game) + 12;	
				   CSptr = MEM_ReadInt (CSptr);
				   CSptr += 2248;
	MEM_WriteInt (CSptr, 1);
				   CSptr += 4;	CSColor = CSptr;
	MEM_WriteInt (CSptr, 0);

	var int CSViewptr; CSViewptr = MEM_InstGetOffset (MEM_Game) + 60;
					   CSViewptr = MEM_ReadInt (CSViewptr);
					   CSViewptr += 4;
	MEM_WriteInt (CSViewptr, 0);
	
	//SetChoicesPos();
	
	var int info; info = MEM_ReadInt (MEMINT_oCInformationManager_Address + 28);
	MEM_WriteInt (info + 104, RGBA (0, 0, 0, 0));
	MEM_WriteInt (info + 52, 8192);
	
	var int box; box = MEM_InstGetOffset (MEM_GAME) + 52;
				 box = MEM_ReadInt(box);
				 box += 60;
	MEM_WriteInt (box, 0);
	
	var int View_ptr;
View_ptr=MEM_InstGetOffset(MEM_GAME)+52;
View_ptr=MEM_ReadInt(View_ptr);
View_ptr=View_ptr+60;
MEM_WriteInt(View_ptr,0);
View_ptr=View_ptr+8;
MEM_WriteInt(View_ptr,1);
};

func void SetCSColor() {
	CSEnable();
	
	CSAlpha += 5;
	
	if (CSAlpha >= 255) { 
		CSAlpha = 255;
	};
	MEM_WriteInt (CSColor, RGBA (0, 0, 0, CSAlpha));
};

func void _SetCSColor() {
	CSEnable();
	
	CSAlpha -= 5;
	MEM_WriteInt (CSColor, RGBA (0, 0, 0, CSAlpha));
	
	if (CSAlpha <= 4) {
		CSAlpha = 0;
		FF_Remove (_SetCSColor);
	};
};

FUNC VOID B_RefuseTalk()
{
	PrintDebugNpc	(PD_ZS_FRAME,"B_RefuseTalk");
	B_SmartTurnToNpc(self,other);
	B_Say			(self,other,"$NOTNOW");
	C_StopLookAt	(self);
};

// **********************************************************

FUNC void ZS_Talk ()
{

//Trade_ChangeSellMultiplier (1/2);
/*	const int hook = 0;
	if (!hook) {
		const int oCInfo__OnGetText = 6707312;
		HookEngine (oCInfo__OnGetText, 8, "Choices_Hook");
		
		hook = 1;
	};
	FF_ApplyOnce (SetCSColor);*/
	
	//if (Npc_IsInState(self,ZS_Teaching_Joru)) ||  (Npc_IsInState(self,ZS_Teaching_Tondral))  ||  (Npc_IsInState(self,ZS_Teaching_Cadar)) ||  (Npc_IsInState(self,ZS_Teaching_Tyon))  ||  (Npc_IsInState(self,ZS_PracticeSword)) 
	//{
	//AI_Output (self, other,"hymnmm"); //Hmm? 
		//AI_PlayAni		(self,	"T_PLUNDER");
		//AI_PlayAni (self,"T_LGUARD_2_STAND");	
		//AI_RemoveWeapon (self);
	//};
	
/*	if (self == hlp_getnpc(GRD_2003_Stra¿nik))
	{
	AI_Output		(self,hero,"Destroy_practicesword"); //Witaj!
	print ("jsaasass");
	};*/
	
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Talk");
	//Npc_PercEnable		(self,	PERC_NPCCOMMAND			,	B_CheckSheath);
	//-------- Verhindern von Mehrfachansprechen der NSCs --------
	if (other.aivar[AIV_INVINCIBLE]==TRUE)
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...SC spricht schon!");
		AI_ContinueRoutine	(self);
		return;				
	};
	
	C_ZSInit();	
	B_SetFaceExpression(self, other); //Attitüde bestimmt Gesichtsausdruck

	self.aivar[AIV_INVINCIBLE]=TRUE;
	other.aivar[AIV_INVINCIBLE]=TRUE;

	//Npc_PercEnable  (self, PERC_ASSESSDAMAGE 		,ZS_ReactToDamage	);
	//Npc_PercEnable  (self, PERC_ASSESSMAGIC		,B_AssessMagic		);
	//Npc_PercEnable  (self, PERC_ASSESSSURPRISE	,ZS_AssessSurprise	);
	//Npc_PercEnable  (self, PERC_ASSESSENEMY		,B_AssessEnemy		);
	//Npc_PercEnable  (self, PERC_ASSESSFIGHTER		,B_AssessFighter	);
	//Npc_PercEnable  (self, PERC_ASSESSTHREAT		,B_AssessFighter	);
	//Npc_PercEnable  (self, PERC_ASSESSWARN		,B_AssessWarn 		);
	//Npc_PercEnable  (self, PERC_ASSESSMURDER		,ZS_AssessMurder	);
	//Npc_PercEnable  (self, PERC_ASSESSDEFEAT		,ZS_AssessDefeat	);
	//Npc_PercEnable  (self, PERC_ASSESSFIGHTSOUND	,B_AssessFightSound	);
	//Npc_PercEnable  (self, PERC_CATCHTHIEF		,ZS_CatchThief 		);
	//Npc_PercEnable  (self, PERC_ASSESSTHEFT		,B_AssessTheft 		);

	// SC zu nah dran
	if (Npc_GetDistToNpc(other,self) < 80) 
	{
		AI_Dodge 		(other);
	};

	// KEIN DIALOG: NSC ist feindlich
	if	(Npc_GetTempAttitude(self,other) == ATT_HOSTILE)
	&&	(self.aivar[AIV_TALKBEFOREATTACK] == FALSE)
	{
		Npc_SetTarget 	(self,	other);
		B_AssessEnemy	();		
	};
	
	// AMBIENT-INFOS werden nur Ambient-NSCs (Nicht-Main-NSCs) zugeordnet, 
	// die KEINE anderen Infos/Aufträge haben
	//if ( (self.npctype != npctype_main) && (self.npctype != npctype_friend) && (!NPC_CheckInfo(self,0)) && (!Npc_CheckInfo(self,1)) )
	//{
	//	B_AssignAmbientInfos (self);
	//};
	
	// SC labert NSC an
	if ( C_BodystateContains(self,BS_WALK) || C_BodystateContains(self,BS_RUN) )
	{
		B_Say (other,self,"$SC_HEYWAITASECOND");
	}
	else if (!Npc_CanSeeNpc(self, hero))
	{
		B_Say (other,self,"$SC_HEYTURNAROUND");
	}
	else
	{
		// nix sagen
	};
	
	
	// DIALOG geht los, NSC dreht sich zu dir
	if ( (!C_BodystateContains(self, BS_SIT)) || (!Npc_CanSeeNpc(self, hero)) )
	{
		AI_StandUp		(self);
		AI_TurnToNpc	(self,	hero);
	};
	//B_FullStop			(self);
	B_FullStop			(hero);
	AI_TurnToNpc		(hero,	self); // SC dreht sich zum Npc
				
	// NSC begrüßt dich, wenn der Spieler ihn angesprochen hat
	if (!hero.aivar[AIV_IMPORTANT])
	{
		B_GuildGreetings ();
	};
	
	// Equipment gestohlen?
	B_CheckStolenEquipment ();
	
	// KenneSC-Flag auf TRUE setzen, wenn Main-NSC. (SC-Verkleidung dabei EGAL)
	if ( (self.npctype == npctype_main) || (self.npctype == npctype_friend) )
	{
		Npc_SetKnowsPlayer(self,other);
	};
	
	// NEWS checken, wenn der Spieler ihn angesprochen hat
	if (!hero.aivar[AIV_IMPORTANT])
	{
		B_ReactToMemory ();
	};
		
	//AMBIENT INFOS
	B_AssignAmbientInfos(self);
	
	// Kenne SC (wird für FindNSC-Infos gebraucht)
	self.aivar[AIV_FINDABLE] = TRUE; 
	
	// START Multiple Choice Dialog
	AI_ProcessInfos(self);
};

FUNC INT ZS_Talk_Loop ()
{
    PrintDebugNpc(PD_ZS_LOOP,"ZS_Talk_Loop");
    
   	if (C_BodyStateContains(self,BS_SIT))
	{
   		if (self.aivar[AIV_HANGAROUNDSTATUS] <= 1) //sitzt auf Boden, NICHT auf Bank, etc.
   		{
   			AI_LookAtNpc		(self, other);
   		};
   	};
   	
   	if ( InfoManager_HasFinished() )
   	{
		PrintDebugNpc(PD_ZS_CHECK,"...InfoManager beendet!");
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		//AI_StopLookAt(self); // sitzende NSCs glotzen dem SC nach dem Dialog nach.
		B_ResetFaceExpression(self);
		return LOOP_END;
   	};

   	return LOOP_CONTINUE;
};

FUNC VOID ZS_Talk_End ()
{
    PrintDebugNpc(PD_ZS_FRAME,"ZS_Talk_End");
	//FF_Remove (SetCSColor);
	//FF_ApplyOnce (_SetCSColor);
};



