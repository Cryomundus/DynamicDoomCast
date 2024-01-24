//this is a test line;
//#include decorate/Decoratives.dec;
///////////////;
//   Imp     //;
///////////////;
/*
Class EarlyMapDynDoomImpSpawner : RandomSpawner replaces doomimp
{
	dropitem "TheDoomImp";
	dropitem "TheDoomImpAltGreen";
	dropitem "TheDoomImpAltBlue";
	dropitem "SpireImp";
}
*/
Class TheDoomImp : DoomImpModStatesinheritor
{
	Default 
	{
	Health 60;
	Radius 16;
	Height 56;
	Mass 100;
	Speed 13;
	PainChance 200;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	DamageFactor "Extinguishing", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	Monster;
	Species "Impling";
	-THRUSPECIES;
	+Ambush;
	+NOBLOCKMONST;
	+DontHarmSpecies;
	+FLOORCLIP;
	+MissileMore;
	SeeSound "imp/sight";
	PainSound "imp/pain";
	DeathSound "imp/death";
	ActiveSound "imp/active";
	HitObituary "$OB_IMPHIT";
	Obituary "$OB_IMP";
	DropItem "ImpModItemDropper";
	}
	States
	{
	Spawn:
		TNT1 A 0;
		TNT1 A 0 A_CheckFlag("AMBUSH", "CanAmbush", AAPTR_MASTER);
		 goto SpawnContinued;
	CanAmbush:
		 TNT1 A 0 A_ChangeFlag("AMBUSH", TRUE)  ;
	SpawnContinued:
		TROO AB 10 A_Look;
		Loop;
	See:
		TROO AABBCCDD 3 A_Chase;
		Loop;
	Melee:
		TROO EF 8 A_FaceTarget;
		TROO G 6  A_CustomMeleeAttack((6), "imp/melee");
		Goto See;
	Missile:
		TNT1 A 0 A_Jump(256, "StandardFireball","AlternatingFireball");
	StandardFireball:
		TROO EF 8 A_FaceTarget;
		TROO G 6 A_SpawnProjectile("ImpFireball", 27, 0, 0, 0, 0);
		Goto See;
	AlternatingFireball:
		TROO EF 8 A_FaceTarget;
		TROO G 6 A_SpawnProjectile("ImpFireball", 27, 0, -3, 0, 0);
		TROO EF 4 A_FaceTarget;
		TROO G 1 A_SpawnProjectile("ImpFireball", 27, 0, 0, 0, 0);
		TROO EF 4 A_FaceTarget;
		TROO G 1 A_SpawnProjectile("ImpFireball", 27, 0, 3, 0, 0);
		Goto See;
	Pain:
		TROO H 2;
		TROO H 2 A_Pain;
		TNT1 A 0 a_playsound ("monsters/weakhurt",0);
		Goto See;
	Death:
		TNT1 A 0 a_spawnitemex ("ImpModItemDropper",0,0,35);
		TROO H 0 ;
		TROO I 8 ;
		TROO J 8 A_Scream;
		TROO K 6;
		TROO L 6 A_NoBlocking;
		TNT1 A 0 ;
		TROO M -1;
		Stop;
	Crush:
		POL5 EEEEE 1 ;
		POL5 E -1;
		Stop	;
	Raise:
		TROO MLKJI 8;
		Goto See;
	}
}

Class TheDoomImpAltGreen : TheDoomImp
{
	Default 
	{
	Health 60;
	Radius 16;
	Height 56;
	Mass 100;
	Speed 14;
	PainChance 200;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	DamageFactor "Extinguishing", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	Species "Impling";
	Monster;
	translation "64:72=12:9", "73:79=9:12";
	+Ambush;
	-THRUSPECIES;
	+NOBLOCKMONST;
	+FLOORCLIP;
	+MissileMore;
	+DontHarmSpecies;
	SeeSound "imp/sight";
	PainSound "imp/pain";
	DeathSound "imp/death";
	ActiveSound "imp/active";
	HitObituary "$OB_IMPHIT";
	Obituary "$OB_IMP";
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "ImpModItemDropper";
	}
	States
	{
	Spawn:
		TNT1 A 0 A_CheckFlag("AMBUSH", "CanAmbush", AAPTR_MASTER);
		goto SpawnContinued;
	CanAmbush:
		 TNT1 A 0 A_ChangeFlag("AMBUSH", TRUE);
	SpawnContinued:
		TROO AB 10 A_Look;
		Loop;
	See:
		TROO AABBCCDD 3 A_Chase;
		Loop;
	Melee:
		TROO EF 8 A_FaceTarget;
		TROO G 6  A_CustomMeleeAttack((6), "imp/melee");
		Goto See;
	Missile:
		TNT1 A 0 A_Jump(256, "BouncyFireball","AlternatingFireball");
	BouncyFireball:
		TROO EF 8 A_FaceTarget;
		TROO G 6 A_SpawnProjectile("ImpFireballBounce", 27, 0, 0, 0, 0);
		Goto See;
	AlternatingFireball:
		TROO EF 8 A_FaceTarget;
		TROO G 6 A_SpawnProjectile("ImpFireball", 27, 0, -3, 0, 0);
		TROO EF 4 A_FaceTarget;
		TROO G 1 A_SpawnProjectile("ImpFireball", 27, 0, 0, 0, 0);
		TROO EF 4 A_FaceTarget;
		TROO G 1 A_SpawnProjectile("ImpFireball", 27, 0, 3, 0, 0);
		Goto See;
	Pain:
		TROO H 2;
		TROO H 2 A_Pain;
		TNT1 A 0 a_playsound ("monsters/weakhurt",0);
		Goto See;
	}
}
Class TheDoomImpAltBlue : TheDoomImp
{
	Default 
	{
	Health 60;
	Radius 16;
	Height 56;
	Mass 100;
	Speed 16;
	PainChance 200;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	DamageFactor "Extinguishing", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	Species "Impling";
	Monster;
	translation "64:73=194:199", "74:79=5:8";
	+Ambush;
	-THRUSPECIES;
	+NOBLOCKMONST;
	+FLOORCLIP;
	+MissileMore;
	+MissileEvenMore;
	+DontHarmSpecies;
	SeeSound "imp/sight";
	PainSound "imp/pain";
	DeathSound "imp/death";
	ActiveSound "imp/active";
	HitObituary "$OB_IMPHIT";
	Obituary "$OB_IMP";
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "ImpModItemDropper";
	}
	States
	{
	Spawn:
		TNT1 A 0 A_CheckFlag("AMBUSH", "CanAmbush", AAPTR_MASTER);
		goto SpawnContinued;
	CanAmbush:
		 TNT1 A 0 A_ChangeFlag("AMBUSH", TRUE);
	SpawnContinued:
		TROO AB 10 A_Look;
		Loop;
	See:
		TROO AABBCCDD 3 A_Chase;
		Loop;
	Melee:
	 	TROO EF 8 A_FaceTarget;
		TROO G 6  A_CustomMeleeAttack((6), "imp/melee");
		Goto See;
	Missile:
		TNT1 A 0 A_Jump(256, "TriBouncyFireball","AlternatingFireball", "BOOMFireball");
	TriBouncyFireball:
		TROO EF 12 A_FaceTarget;
		TROO G 6 A_SpawnProjectile("ImpFireballBounce", 27, 0, -5, 0, 0);
		TROO G 0 A_SpawnProjectile("ImpFireball", 27, 0, 0, 0, 0);
		TROO G 0 A_SpawnProjectile("ImpFireballBounce", 27, 0, 5, 0, 0);
		Goto See;
	AlternatingFireball:
		TROO EF 8 A_FaceTarget;
		TROO G 6 A_SpawnProjectile("ImpFireball", 27, 0, -3, 0, 0);
		TROO EF 4 A_FaceTarget;
		TROO G 1 A_SpawnProjectile("ImpFireball", 27, 0, 0, 0, 0);
		TROO EF 4 A_FaceTarget;
		TROO G 1 A_SpawnProjectile("ImpFireball", 27, 0, 3, 0, 0);
		TROO EF 4 A_FaceTarget;
		TROO G 1 A_SpawnProjectile("ImpFireball", 27, 0, -3, 0, 0);
		TROO EF 4 A_FaceTarget;
		TROO G 1 A_SpawnProjectile("ImpFireball", 27, 0, 0, 0, 0);
		Goto See;
	BOOMFireball:
		TROO EF 8 A_FaceTarget;
		TROO G 6 A_SpawnProjectile("ImpFireBallBOOM", 27, 0, 0, 0, 0);
		Goto See;
	Pain:
		TROO H 2;
		TROO H 2 A_Pain;
		TNT1 A 0 a_playsound ("monsters/weakhurt",0);
		Goto See;
	}
}