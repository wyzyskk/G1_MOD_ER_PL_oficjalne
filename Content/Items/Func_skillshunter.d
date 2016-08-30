

/*
/******************************************************************************************//*
INSTANCE ItWr_Book_Skillshero(C_Item)
{	
	name 					=	"Moje zdolności lowieckie";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= "Moje zdolności łowieckie";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	on_state[0]				=	Use_LookHeroSkills;
};
func void Knows_GetTeeth1 ()
{

};	
	FUNC VOID Use_LookHeroSkills()
	{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "MENU_INGAME.tga", 	0 		); 
				
					
					//1.Seite
				
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Moje zdolności łowieckie"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "Font_Old_10_White.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
				

					Doc_Show		( nDocID );
	};
	  /// wzór xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx*/
	  
