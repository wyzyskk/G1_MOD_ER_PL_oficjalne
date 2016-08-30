// ************************ EXIT **************************

instance  Info_Myxir_EXIT (C_INFO)
{
	npc			= KDW_601_Myxir;
	nr			= 999;
	condition	= Info_Myxir_EXIT_Condition;
	information	= Info_Myxir_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Myxir_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Myxir_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Myxir_HELLO1 (C_INFO)
{
   npc          = KDW_601_Myxir;
   nr           = 1;
   condition    = DIA_Myxir_HELLO1_Condition;
   information  = DIA_Myxir_HELLO1_Info;
   permanent	= FALSE;
   description	= "Witaj, magu!";
};

FUNC INT DIA_Myxir_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Myxir_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Myxir_HELLO1_15_01"); //Witaj, magu!
    AI_Output (self, other ,"DIA_Myxir_HELLO1_03_02"); //Adanos z tob¹, jestem Myxir, Mag Krêgu Wody. Co ciê do mnie sprowadza?
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Myxir_HELLO2 (C_INFO)
{
   npc          = KDW_601_Myxir;
   nr           = 2;
   condition    = DIA_Myxir_HELLO2_Condition;
   information  = DIA_Myxir_HELLO2_Info;
   permanent	= FALSE;
   description	= "Chcia³bym siê czegoœ dowiedzieæ o Magach Wody.";
};

FUNC INT DIA_Myxir_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Myxir_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Myxir_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Myxir_HELLO2_15_01"); //Chcia³bym siê czegoœ dowiedzieæ o Magach Wody.
    AI_Output (self, other ,"DIA_Myxir_HELLO2_03_02"); //Rozumiem. Có¿, Kr¹g Magów Wody czerpie sw¹ si³ê z bezgranicznych wód Adanosa. 
	AI_Output (self, other ,"DIA_Myxir_HELLO2_03_03"); //Jesteœmy Stra¿nikami Równowagi tego œwiata i staramy siê, aby konflikt Innosa z Beliarem nie zosta³ przewa¿ony przez któr¹œ ze stron.
    AI_Output (self, other ,"DIA_Myxir_HELLO2_03_04"); //Jakby któryœ z nich zatryumfowa³, oznacza³oby to pocz¹tki rz¹du chaosu. Na œwiecie istnieje nas oczywiœcie wiêcej, jednak nie tak du¿o jak Magów Ognia.
    AI_Output (self, other ,"DIA_Myxir_HELLO2_03_05"); //Niektórzy g³osz¹ nauki o bogach w miastach, jak choæby Vatras, drugi najpotê¿niejszy Mag Wody po Saturasie. Z tego co wiem od lat mieszka w Khorinis. 
};


