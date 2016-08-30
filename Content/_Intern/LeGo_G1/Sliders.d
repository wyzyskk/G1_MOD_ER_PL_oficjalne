//======================================================
// [intern] slider class
//======================================================
class _Slider {

	var int steps;
	var int choice;
	
	var int posx;
	var int posy;
	var int posx2;
	var int posy2;
	
	var int sdimx;
	
	var int on_enter;
	var int on_leave;
	var int on_choice;

	// intern
	var int v0; 	// zCView@
	var int v1; 	// zCView@
	var int state; 	

};

const string _SLIDER_STRUCT = "auto|13";

func void _Slider_Delete(var _Slider sld) {
	View_Delete(sld.v0);
	View_Delete(sld.v1);
};

//......................................
const int MAX_SLIDERS = 256;
var int _Sliders[MAX_SLIDERS]; // Static array for all sliders, hopefully 256 slots is enough
var int _Sliders_NextSlot;
instance _Slider@(_Slider);
//......................................

//=======================================================
// Create Slider, posx,posy refers to upper left corner
//=======================================================
func int Slider_Create(var int posx, var int posy, var int width, var int height, var int steps, var func on_enter, var func on_leave, var func on_choice) {
	if (_Sliders_NextSlot == MAX_SLIDERS) {
		return 0;
	};
	
	if (steps < 2 ) { // this is slider, you wanna slider you gotta provide more "options"
		return 0;
	};
	
	var int slider; slider = new(_Slider@);
	var _Slider sld; sld = get(slider);
	
	sld.steps = steps;
	
	sld.posx = posx;
	sld.posy = posy;
	sld.posx2 = posx+width;
	sld.posy2 = posy+height;
	sld.sdimx = height/2;
	
	sld.on_enter = MEM_GetFuncID(on_enter);
	sld.on_leave = MEM_GetFuncID(on_leave);
	sld.on_choice = MEM_GetFuncID(on_choice);
	
	if (MEM_GetFuncID(on_enter) == MEM_GetFuncID(Slider_Default)) {
		sld.on_enter = MEM_GetFuncID(Slider_Highlight);
	};
	
	if (MEM_GetFuncID(on_leave) == MEM_GetFuncID(Slider_Default)) {
		sld.on_leave = MEM_GetFuncID(Slider_unHighlight);
	};

	// intern
	sld.v0 = View_Create(posx, posy, posx+width, posy+height); // posy+height or posy-height???
	// slider is square, x2 = x1 + height , y2 = y1 + height,
	sld.v1 = View_Create(posx, posy, posx+sld.sdimx, posy+height); // posy+height or posy-height???
	
	sld.state = 0; //off
	
	// set default textures from menu
	View_SetTexture(sld.v0, SLIDER_BACK);
	View_SetTexture(sld.v1, SLIDER_POS);
			
				
	MEM_WriteStatArr(_Sliders, _Sliders_NextSlot, slider);
	_Sliders_NextSlot += 1;
	return slider+0;
};

func int Slider_CreatePxl(var int posx, var int posy, var int width, var int height,var int steps, var func on_enter, var func on_leave, var func on_choice) {
	return Slider_Create(Print_ToVirtual(posx, PS_X), Print_ToVirtual(posy, PS_y), Print_ToVirtual(width, PS_X), Print_ToVirtual(height, PS_Y), steps, on_enter, on_leave, on_choice);
};

func void Slider_Null(var int hndl) {};
func void Slider_Default(var int hndl) {};

func void Slider_Highlight(var int hndl) {
	if (!Hlp_IsValidHandle(hndl)) {
		return;
	};
	var _Slider sld; sld = get(hndl);
	
	//View_SetAlpha(sld.v0,255);
	View_SetAlpha(sld.v1,255);
};

func void Slider_unHighlight(var int hndl) {
	if (!Hlp_IsValidHandle(hndl)) {
		return;
	};
	var _Slider sld; sld = get(hndl);
	
	//View_SetAlpha(sld.v0,180);
	View_SetAlpha(sld.v1,180);
};

//=====================================
// Remove slider
//=====================================
func void Slider_Delete(var int hndl) { 
	if (!Hlp_IsValidHandle(hndl)) {
		return;
	};
	var int i; i = 0;
	var int pos; pos = MEM_StackPos.position;
	if (i >= _Sliders_NextSlot) {
		return;
	};
	if (MEM_ReadStatArr(_Sliders, i) == hndl) {
		delete(hndl);
		var int tmp; tmp = MEM_ReadStatArr(_Sliders, _Sliders_NextSlot-1); // Letztes Element
		MEM_WriteStatArr(_Sliders, i, tmp);
		MEM_WriteStatArr(_Sliders, _Sliders_NextSlot-1, 0);
		_Sliders_NextSlot -= 1; // Array verkleinern
	};
	i += 1;
	MEM_StackPos.position = pos;
};
	
//=====================================
// Show slider
//=====================================
func void Slider_Show(var int hndl) {
	if (!Hlp_IsValidHandle(hndl)) {
		return;
	};
	var _Slider sld; sld = get(hndl);
	if (sld.state & SLIDER_ACTIVE) { // It's already activated
		return;
	};
	
	View_Open(sld.v0);
	View_Open(sld.v1);
	
	sld.state = SLIDER_ACTIVE;
};

//=====================================
// Hide slider
//=====================================
func void Slider_Hide(var int hndl) {
	if (!Hlp_IsValidHandle(hndl)) {
		return;
	};
	var _Slider sld; sld = get(hndl);
	if (!(sld.state & SLIDER_ACTIVE)) { // It's already deactivated
		return;
	};
	
	View_Close(sld.v0);
	View_Close(sld.v1);
	
	sld.state = 0;
};

//=====================================
// Change backround texture
//=====================================
func void Slider_SetBackTexture(var int hndl, var string tex) {
	if (!Hlp_IsValidHandle(hndl)) {
		return;
	};
	var _Slider sld; sld = get(hndl);
	
	View_SetTexture(sld.v0, tex);
};

//=====================================
// Change "slider" texture
//=====================================
func void Slider_SetPosTexture(var int hndl, var string tex) {
	if (!Hlp_IsValidHandle(hndl)) {
		return;
	};
	var _Slider sld; sld = get(hndl);
	
	View_SetTexture(sld.v1, tex);
};

//=====================================
// Activate slider
//=====================================
func void Slider_Activate(var int hndl) {
	if (!Hlp_IsValidHandle(hndl)) {
		return;
	};
	var _Slider sld; sld = get(hndl);
	sld.state = sld.state | SLIDER_ACTIVE;
};

//=====================================
// Deactivate slider
//=====================================
func void Slider_Deactivate(var int hndl) {
		if (!Hlp_IsValidHandle(hndl)) {
		return;
	};
	var _Slider sld; sld = get(hndl);
	if (sld.state & SLIDER_ENTERED) {
		MEM_CallByID(sld.on_leave);
	};
	sld.state = 0; // Purge all data
};

//============================================================
// [intern] Sets the views position acording to slider class
//============================================================
func void Slider_RecalcPos(var int hndl) {
	var _Slider sld; sld = get(hndl);
	// update view position with class
	View_MoveTo(sld.v0,sld.posx,sld.posy);
	// update "slider" position
	if (sld.choice == sld.steps) { // whole numbers might cause little bad results especialy at the last pos	
		View_MoveTo(sld.v1,sld.posx2 - sld.sdimx,-1);
	} else {
		// there it would be nice to use floats or something and then round them but whatever
		var int step; step = ((sld.posx2 - sld.posx  - sld.sdimx)/(sld.steps-1)); 
		View_MoveTo(sld.v1, sld.posx + (step*sld.choice), -1);
	};
};

//=====================================
// Set choice of slider
//=====================================
func void Slider_SetChoice(var int hndl, var int choice) {
	if (!Hlp_IsValidHandle(hndl)) {
		return;
	};
	var _Slider sld; sld = get(hndl);
	if (choice > sld.steps)||(choice < 0){ 
		return;
	};
	sld.choice = choice;
	Slider_RecalcPos(hndl);
	// do what must be done
	MEM_PushIntParam(sld.choice); // choice as param
	MEM_CallByID(sld.on_choice);
};

//=====================================
// Get slider choice
//=====================================
func int Slider_GetChoice(var int hndl) {
	if (!Hlp_IsValidHandle(hndl)) {
		return -1;
	};
	var _Slider sld; sld = get(hndl);
	return sld.choice+0;
};

//=====================================
// Get state 
//=====================================
func int Slider_GetState(var int hndl) {
	if (!Hlp_IsValidHandle(hndl)) {
		return 0;
	};
	var _Slider sld; sld = get(hndl);
	return sld.state+0; // Verschachteln
};

//=====================================================
// Move Slider to new position (absolute)(virtual)
//=====================================================
func void Slider_MoveTo(var int hndl, var int posx, var int posy) {
	if (!Hlp_IsValidHandle(hndl)) {
		return;
	};
	var _Slider sld; sld = get(hndl);
	// get original height and width
	var int w; w = sld.posx2 - sld.posx;
	var int h; h = sld.posy2 - sld.posy;
	// set new positions
	sld.posx = posx;
	sld.posy = posy;
	sld.posx2 = posx+w;
	sld.posy2 = posy+h;
	// move views to the new positions
	Slider_RecalcPos(hndl);
};

//============================================================
// [intern] Calculates where user clicked returns int
//============================================================
func void Slider_CalcChoice(var int hndl,var int cursor_x) {
	if (!Hlp_IsValidHandle(hndl)) {
		print("err 1");
		return; // -1 is cannot be selected therefore nothing happens
	};
	
	if (sld.posx >= cursor_x && sld.posx2 <= cursor_x) {
		print("err 2");
		return; // something strange happened, never mind ignore it
	};
	
	var _Slider sld; sld = get(hndl);
	var int step; step = ((sld.posx2-sld.posx)/ sld.steps);
	var int pos; pos = sld.posx + step;
	var int i; i = 0;
	while ((pos < cursor_x)&&(i<sld.steps));
		pos += step;
		i+=1;
	end;
	
	Slider_SetChoice(hndl,i);
};

//===========================================
// {intern] use FF_Apply for sliders to work
//===========================================
func void Sliders_Do() {
	var _Slider sld;
	var int hndl;
	var int i; i = 0;
	var int pos; pos = MEM_StackPos.position;
		if (i >= _Sliders_NextSlot) {
			return;
		};
		hndl = MEM_ReadStatArr(_Sliders, i); 
		sld = get(hndl);
		var int CY; CY = Print_ToVirtual(CURSOR_Y, PS_Y);
		var int CX; CX = Print_ToVirtual(CURSOR_X, PS_X);
		//print(IntToString(CX));
		if (sld.state & BUTTON_ACTIVE) {
			if (sld.posx <= CX && sld.posx2 >= CX && sld.posy <= CY && sld.posy2 >= CY) {
				if (Cursor_Left==KEY_PRESSED) {
					Slider_CalcChoice(hndl,CX);
					//MEM_PushIntParam(hndl);
					//MEM_CallByID(sld.on_click);
				};
				if ((sld.state & BUTTON_ENTERED)==0) {
					MEM_PushIntParam(hndl);
					MEM_CallByID(sld.on_enter);
					sld.state = sld.state | BUTTON_ENTERED;
				};
			} else if (sld.state & BUTTON_ENTERED) {
				MEM_PushIntParam(hndl);
				MEM_CallByID(sld.on_leave);
				sld.state = sld.state & ~BUTTON_ENTERED;
			}; 
		};
				
		i += 1;
		MEM_StackPos.position = pos;
};
