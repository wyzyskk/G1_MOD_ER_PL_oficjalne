var int expBar; // Bar
Instance ExpBarInfos(GothicBar) {
	x = Print_Screen[PS_X] / 2;
    y = Print_Screen[PS_Y] - 20;
    width = 180;
    height = 20;
    backTex = "Bar_Back.tga"; 
    barTex = "Bar_Misc.tga";
};
Func void ExpBarFunc(){
	if (!Hlp_IsValidHandle(expBar)) {
		expBar = Bar_Create(ExpBarInfos);
	};
	Bar_SetValue(expBar, hero.exp); 
	Bar_SetMax(expBar, hero.exp_next);
};