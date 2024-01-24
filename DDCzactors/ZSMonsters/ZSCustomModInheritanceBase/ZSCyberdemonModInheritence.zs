Class ZSDDCCyberdemonRef : Cyberdemon
{
	Default {
	+MissileMore;
	+MissileEvenMore;
	}
	States
	{
	See:
		"####" AABBCCDD 4 A_Chase;
		Loop;
	Pain:
		"####" G 3;
		"####" G 3 A_Pain;
		Goto See;
	}
}

Class CyberdemonModStatesinheritor : ZSDDCCyberdemonRef
{ 
	Default
	{
	//MDN Stuff;
	DamageFactor "NoDamage", 0.0;
    DamageFactor "SpeedBooster", 0.5;
    DamageFactor "PowerBomb", 0.8;
    DamageFactor "PlasmaCombo", 0.375;
    PainChance "IceBeam", 96;
    PainChance "IceCharged", 128;
    PainChance "IceChargedExplode", 96;
    PainChance "IceBeamExplode", 64;
    PainChance "IceCombo", 64;
	}
	States
	{
		// Start MDN;
		Pain.IceCombo:
        TNT1 A 0 A_Jump(48,2);
        TNT1 A 0 A_JumpIfInventory("IceBeamChilled",1,"Pain");
        TNT1 A 0;
        TNT1 AAAAAAAAAA 0 A_SpawnItemEx("IceTrailFlicker",random(-1,1),random(-1,1),random(16,46),random(-500,500)/100.00,random(-500,500)/100.00,random(-200,500)/100.00,random(-180,180),161);
        TNT1 AAAAA 0 A_SpawnItemEx("IceTrailFlicker3",random(-1,1),random(-1,1),random(16,46),random(-400,400)/100.00,random(-400,400)/100.00,random(10,500)/100.00,random(-180,180),161);
        TNT1 A 0 ACS_ExecuteAlways(594,0,8,0,0);
        TNT1 A 0 A_GiveInventory("IceBeamChilled",1);
        TNT1 A 0 A_ChangeFlag("NOPAIN",1);
        CYBR G 140;
        TNT1 A 0 A_ChangeFlag("NOPAIN",0);
        goto Super::Pain;
		// End MDN;
		// Start ;
		// End ;
	}
}