func void PrintI(var int integer) {
	Print(IntToString(integer));
};

func void MultiText_EndA8_3 (var int param) {
	if (!Hlp_IsValidHandle (param)) { return; };
	Anim8_Delete (param);
};
func void MultiText_EndA8_4 (var int param) {
	if (!Hlp_IsValidHandle (param)) { return; };
	Anim8_Delete (param);
};
func void MultiText_EndbTex (var int param) {
	if (!Hlp_IsValidHandle (param)) { return; };
	View_Close (param);
	FF_ApplyExtData (View_Delete, 500, 1, param);
};
func void MultiText_ShiftBTexX(var int hndl, var int val) {
	if (!Hlp_IsValidHandle (hndl)) { return; };
	var zCView v; v = get(hndl);
	
	v.vposx = val;
};
func void MultiText_ShiftBTexY(var int hndl, var int val) {
	if (!Hlp_IsValidHandle (hndl)) { return; };
	var zCView v; v = get(hndl);
	
	v.vposy = val;
};
func void _View_SetTextPtr(var int hndl, var int x, var int y, var string text, var string font) {
    if(!Hlp_IsValidHandle(hndl)) { return; };
    var zCView v; v = get(hndl);	
	var int ptr; ptr = Print_CreateTextPtr (text, font);
	
	var int list; list = List_Create (ptr);
    v.textLines_next = list;
	
	var zCViewText t; t = _^ (List_Get (list, 1));
	
	t.posx = x;
	t.posy = y;
};
func void MultiText(var string text, var string font, var int x, var int y, var int color, 
					var int slideXaxis, var int slideYaxis, var int slideSpeed, 
					var string backTex, var int margX, var int margY, var int A8_Type, var int fadeMS) {
	var int A8_1; // handler to the Anim8 (text.posx)
	var int A8_2; // handler to the Anim8 (text.posy)
	var int A8_3; // handler to the Anim8 (backTex.posx)
	var int A8_4; // handler to the Anim8 (backTex.posy)
	var int _x; _x = x;
	var int _y; _y = y;
	var int A8_bTex; // handler to the backGround texture 
	/*var int A8_text; // text ptr
	
	// Create text
	A8_text = Print_Ext (x, y, text, font, color, -1);*/
	
	if (x == -1) {
        x = (PS_VMax - Print_ToVirtual (Print_GetStringWidth (text, font), PS_X)) / 2;
    };
    if (y == -1) {
        y = (PS_VMax - Print_ToVirtual (Print_GetFontHeight(font), PS_Y)) / 2;
    };

	// Size of the backGround texture
	A8_bTex = View_Create (x,
						   y, 
						   x + Print_ToVirtual (Print_GetStringWidth (text, font), PS_X), 
						   y + Print_ToVirtual (Print_GetFontHeight(font), PS_Y));
	// Set backGround texture and show it
	View_SetTexture (A8_bTex, backTex);
	View_Open (A8_bTex);
	
	var zCView v; v = get (A8_bTex);
	
	_View_SetTextPtr (A8_bTex, _x, _y, text, font);
	
	v.fxOpen = 1;
	v.fxClose = 1;
	
	if (slideXaxis >= 1) {
		
		// slide backGround texture ( X axis )
		A8_3 = Anim8_NewExt (x, MultiText_ShiftBTexX, A8_bTex, false); 
		Anim8 (A8_3, x + slideXaxis, slideSpeed, A8_Type);
		
	}; if (slideYaxis >= 1) {
		
		// slide backGround texture ( Y axis )
		A8_4 = Anim8_NewExt (y, MultiText_ShiftBTexY, A8_bTex, false); 
		Anim8 (A8_4, y + slideYaxis, slideSpeed, A8_Type);
	};
	// I know, it looks terrible :/
	if (fadeMS >= 0) {
		/*FF_ApplyExtData (MultiText_EndText, fadeMS, 1, A8_text);
		FF_ApplyExtData (MultiText_EndA8_1, fadeMS, 1, A8_1);
		FF_ApplyExtData (MultiText_EndA8_2, fadeMS, 1, A8_2);*/
		FF_ApplyExtData (MultiText_EndbTex, fadeMS, 1, A8_bTex);
		FF_ApplyExtData (MultiText_EndA8_3, fadeMS, 1, A8_3);
		FF_ApplyExtData (MultiText_EndA8_4, fadeMS, 1, A8_4);
	};
	
	// Sample:
				// 											Slide							 	 Margines
				//	text     font     x   y   color     X   Y    Speed     backGround tex          X   Y    A8_Type     MS
	// MultiText ("MyText", PF_Font, -1, -1, COL_White, 0, 2000, 1000, "MyBackGroundTexture.TGA", 100, 50, A8_SlowEnd, 5000);
	// A8 Types:
	/*
		const int A8_Constant  = 1;  - constant velocity
		const int A8_SlowEnd   = 2;  - slower end
		const int A8_SlowStart = 3;  - slower start
		const int A8_Wait      = 4;  - idle
	*/
};