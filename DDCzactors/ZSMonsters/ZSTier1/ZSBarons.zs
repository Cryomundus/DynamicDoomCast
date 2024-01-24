Class EarlyMapDynDoomBaronSpawner : RandomSpawner replaces BaronOfHell
{
	Default
	{
	Dropitem "BaronOfHellAlt";
	}
}
Class BaronOfHellAlt : BaronOfHellModStatesinheritor
{
	Default
	{
	Health 1000;
	Radius 24;
	Height 64;
	Mass 1000;
	Speed 25;
	PainChance 50;
	Monster;
	Species "HellRoyal";
	-THRUSPECIES;
	+NOBLOCKMONST;
	+DONTHARMSPECIES;
	+FLOORCLIP;
	+MISSILEMORE;
	+BOSSDEATH;
	translation "16:47=32:47";
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	DamageFactor "Blessed", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	SeeSound "baron/sight";
	PainSound "baron/pain";
	DeathSound "baron/death";
	ActiveSound "baron/active";
	Obituary "$OB_BARON";
	HitObituary "$OB_BARONHIT";
	bloodcolor "0 C8 0";
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MiniStimpackSphereDropChecker", 128;
	DropItem "MicroMedPackDropChecker", 128;
	DropItem "MicroMedPackDropChecker", 128;
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
		//TNT1 A 0 A_SpawnItemEx("HeadshotTargetNoble", 0,0,53, 0,0,0, 0, SXF_SETMASTER)  ;
	SpawnContinue:
		CBOS AB 10 A_Look;
		Loop;
	See:
		CBOS AABBCCDD 3 A_Chase;
		Loop;
	Melee:
		CBOS EF 8 A_FaceTarget;
		CBOS G 8 A_BruisAttack;
		Goto See;
	Missile:
		TNT1 A 0 A_Jump(256,"BaronStandard","BaronTriple","BaronBOOMBlaster","BaronAlternate","BaronAltStandardAndBoom","BaronTripleBounce");
	BaronTriple:
		//TNT1 A 0 A_Log("BaronTriple");
		CBOS PQ 8 A_FaceTarget;
		TNT1 A 0 A_SpawnProjectile("BaronShotV2",32,0,10);
		CBOS Q 0 Bright A_FaceTarget ;
		TNT1 A 0 A_SpawnProjectile("BaronShotV2",32,0,0);
		CBOS R 0 Bright A_FaceTarget;
		TNT1 A 0 A_SpawnProjectile("BaronShotV2",32,0,-10);
        CBOS R 5;
        Goto See;
	BaronAlternate:
		//TNT1 A 0 A_Log("BaronAlternate");
		CBOS PQ 8 A_FaceTarget;
		CBOS R 6 A_SpawnProjectile("BaronShotV2", 27, 0, -3, 0, 0);
		CBOS PQ 4 A_FaceTarget;
		CBOS R 1 A_SpawnProjectile("BaronShotV2", 27, 0, 0, 0, 0);
		CBOS PQ 4 A_FaceTarget;
		CBOS R 1 A_SpawnProjectile("BaronShotV2", 27, 0, 3, 0, 0);
		Goto See;
	BaronAltStandardAndBoom:
		//TNT1 A 0 A_Log("BaronAltStandardAndBoom");
		CBOS PQ 8 A_FaceTarget;
		CBOS R 6 A_SpawnProjectile("BaronShotV2", 27, 0, -3, 0, 0);
		CBOS PQ 4 A_FaceTarget;
		CBOS R 1 A_SpawnProjectile("BaronShotV2", 27, 0, 3, 0, 0);
		CBOS EF 4 A_FaceTarget;
		CBOS F 1 A_SpawnProjectile("BaronballBOOM", 27, 0, 0, 0, 0);
		Goto See;
	BaronBOOMBlaster:
		//TNT1 A 0 A_Log("BaronBOOMBlaster");
		CBOS EF 8 A_FaceTarget;
		CBOS F 6 A_SpawnProjectile("BaronballBOOM", 27, 0, -3, 0, 0);
		CBOS EF 4 A_FaceTarget;
		CBOS F 1 A_SpawnProjectile("BaronballBOOM", 27, 0, 3, 0, 0);
		CBOS EF 4 A_FaceTarget;
		CBOS F 1 A_SpawnProjectile("BaronballBOOM", 27, 0, 0, 0, 0);
		Goto See;
	BaronTripleBounce:
		//TNT1 A 0 A_Log("BaronBOOMBlaster");
		CBOS PQ 8 A_FaceTarget;
		TNT1 A 0 A_SpawnProjectile("BaronballBounce",32,0,10);
		CBOS R 0 Bright A_FaceTarget ;
		TNT1 A 0 A_SpawnProjectile("BaronballBounce",32,0,0);
		CBOS R 0 Bright A_FaceTarget;
		TNT1 A 0 A_SpawnProjectile("BaronballBounce",32,0,-10);
        CBOS R 5;
        Goto See;
	BaronStandard:
		//TNT1 A 0 A_Log("BaronStandard");
		CBOS PQ 8 A_FaceTarget;
		CBOS R 6 A_SpawnProjectile("BaronShotV2", 27, 0, -3, 0, 0);
		Goto See;
	Pain:
		CBOS H 2;
		CBOS H 2 A_Pain;
		"####" A 0 a_playsound ("monsters/bighurt",0);
		Goto See;
	Death:
		TNT1 A 0 a_spawnitemex ("BaronOfHellModItemDropper",0,0,35);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		CBOS H  0 A_BossDeath ;
		CBOS I  8 ;
		CBOS J  8 A_Scream;
		CBOS K  8;
		CBOS L  8 A_NoBlocking;
		CBOS MN 8 ;
		CBOS O -1   ;
		Stop;
	XDeath:
		TNT1 A 0 a_spawnitemex ("BaronOfHellModItemDropper",0,0,35);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 A 0 A_PlaySound("MainGore/MonGoBoom",CHAN_AUTO);
		TNT1 A 0 A_Scream;
		TNT1 AAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		XMED A 5 A_Stop;
		XMED B 5 ;
		XMED C 5 A_BossDeath;
		XMED D 5 A_NoBlocking;
		XMED E 5;
		XMED E -1;
		Stop;
	Crush:
		POL5 EEEEE 1 ;
		POL5 E -1;
		Stop		;
	Raise:
		CBOS O 8;
		CBOS NMLKJI  8;
		Goto See;
	}
}