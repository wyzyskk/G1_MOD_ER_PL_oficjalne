Func void TurnOffFrameLimit() {
	MemoryProtectionOverride (6088082,7);
	MEM_WriteInt(6088082,2425393296);
	MEM_WriteInt(6088085,2425393296);
};
Func void TurnOnFrameLimit() {
   	MemoryProtectionOverride (6088082,8);
	MEM_WriteInt(6088082,-266993839);
	MEM_WriteInt(6088086,-352289536);	
};
