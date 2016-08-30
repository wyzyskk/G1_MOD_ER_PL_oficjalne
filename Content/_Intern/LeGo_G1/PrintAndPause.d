var int PrintCounterList;
func void oCGame_Pause(var int val) {

	const int oCGame__Pause = 6545232;
	const int oCGame__UnPause = 6545872;
	
	if (val) {
		// game paused
		CALL__thisCall (MEM_InstToPtr (MEM_Game), oCGame__Pause);
	}
	else {
		// game unpaused
		CALL__thisCall (MEM_InstToPtr (MEM_Game), oCGame__UnPause);
	};
};
var int myText;
func void PrintAndPause(var string text, var int keyToUnpause, var string font) {
	if (!FF_Active (WaitForUser)) { 
		FF_ApplyExtData (WaitForUser, 0, -1, keyToUnpause);
		oCGame_Pause (1); // pause game
		PrintCounterList = new (zCList@);
	};
	
	var int x; x = (PS_VMax - Print_ToVirtual (Print_GetStringWidth (text, font), PS_X)) / 2;
    var int y; y = (PS_VMax - Print_ToVirtual (Print_GetFontHeight (font), PS_Y)) / 2;
	
	var int pos; pos = 0;
	var int ch; var int ch2;
	var string str;
	
	var int i; i = 0;
	var int loop; loop = MEM_StackPos.position;
	
	if (i != STR_Len (text)) {
	
		
		ch = STR_GetCharAt (text, i);
		if (i + 1 <= STR_Len (text)) {
			ch2 = STR_GetCharAt (text, i + 1);
		};
		// if (ch + ch2 == '\n'), new line
		if (ch == 92 && (ch2 == 110 || ch2 == 78)) {
			str = STR_SubStr (text, pos, i);
			pos = i;
			
			myText = Print_Ext (x, y, STR_Unescape (str), font, COL_White, -1);
			var zCList l; l = get (PrintCounterList);
			if (l.data) {
				List_InsertSorted(getPtr (PrintCounterList), myText, Print_Comparator);
			} 
			else {
				l.data = myText;
			};

			y += Print_ToVirtual (Print_GetFontHeight (font), PS_Y);
			
		};
		i += 1;
		
		MEM_StackPos.position = loop;
	};
};
func void WaitForUser(var int param) {
	var int state; state = MEM_KeyState (param);
	
	if (state == KEY_Pressed) {
		
		oCGame_Pause (0); // Unpause game

		List_For (getPtr (PrintCounterList), "Print_DeleteCounter");
		List_Destroy (getPtr (PrintCounterList));
		PrintCounterList = 0;
		
		Print_DeleteText (myText); // Delete text
		
		FF_Remove (WaitForUser); // stop waiting 
	};
};
func void Print_DeleteCounter (var int data) {

	var zCList l; l = _^(data);
	if (l.data) {
		Print_DeleteText (l.data);
	};
};
func int Print_Comparator(var int data1, var int data2) {
	var zCViewText t; t = get (data1);
	var zCViewText t2; t2 = get (data2);

	return (STR_Len (t.text) > STR_Len (t2.text));
};










