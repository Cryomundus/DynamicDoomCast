Class PainElementalAlt : PainElementalModStatesinheritor
{
	Default
	{
	Health 450;
	Radius 31;
	Height 56;
	Mass 400;
	Speed 8;
	PainChance 128;
	Monster;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	DamageFactor "Antiair", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	Species "DEFIed";
	-THRUSPECIES;
	+NOBLOCKMONST;
	+DONTHARMSPECIES;
	+FLOAT ;
	+NOGRAVITY;
	SeeSound "pain/sight";
	PainSound "pain/pain";
	DeathSound "pain/death";
	ActiveSound "pain/active";
	DropItem "PainElementalModItemDropper", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
	}
	States
	{
	Spawn:
		TNT1 A 0 A_CheckFlag("AMBUSH", "CanAmbush", AAPTR_MASTER);
		goto SpawnContinued;
	CanAmbush:
		 TNT1 A 0 A_ChangeFlag("AMBUSH", TRUE);
	SpawnContinued:
		TNT1 A 0;
	//	TNT1 A 0 A_SpawnItemEx("HeadshotTargetDEFIElemental", 0,35,35, 0,0,0, 0, SXF_SETMASTER)  ;
	SpawnContinue:
		DEFI AA 10 A_Look;
		Loop;
	See:
		DEFI AABBCC 3 A_Chase;
		Loop;
	Missile:
		DEFI D 5 A_FaceTarget;
		DEFI E 5 A_FaceTarget;
		DEFI F 4 BRIGHT A_FaceTarget;
		DEFI F 1 BRIGHT A_PainAttack("LSoul");
		Goto See;
	Pain:
		DEFI G 6;
		DEFI G 6 A_Pain;
		TNT1 A 0 a_playsound ("monsters/midhurt",0);
		Goto See;
	Death:
		TNT1 A 0 a_spawnitemex ("PainElementalModItemDropper",0,0,35);
		DEFI H 8 Bright;
		DEFI I 8 Bright A_Scream;
		DEFI JK 8 Bright;
		DEFI L 8 Bright A_PainDie("LSoulSpawner");
		DEFI M 8 Bright;
		Stop;
	}
}