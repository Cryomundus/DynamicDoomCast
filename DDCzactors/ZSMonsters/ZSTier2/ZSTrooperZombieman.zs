Class TrooperZombieman : ZombieManModStatesinheritor
	{
		Default
	{
	Health 45;
	Radius 20;
	Height 56;
	Speed 10;
	PainChance 200;
	Painchance "Fire", 20;
	Painchance "Terror", 255;
	MONSTER ;
	DamageFactor "Exorcist", 3.0;
	Damagefactor "MonsterBeatEmUp", 7.4;
	-THRUSPECIES;
	+FLOORCLIP;
	+NOINFIGHTING; // the bullet spreads tend to easily cause infighting.;
    DropItem "ZombiemanItemDropper";
	DropItem "ZombiemanModItemDropper";
	DropItem "ZombiemanItemDropper", 128;//"PBZombiemanStuffChanceDropper",128//"clip",128;
	SeeSound "grunt/sight";
    AttackSound "grunt/attack";
    PainSound "grunt/pain";
    DeathSound "grunt/death";
    ActiveSound "grunt/active";
    Obituary "%o was surprised by the zombie's weaponry." ;
    //Decal BulletChip;
	}
    States
	{ 
	Spawn: 
		TNT1 A 0 A_CheckFlag("AMBUSH", "CanAmbush", AAPTR_MASTER);
		goto SpawnContinued;
	CanAmbush:
		TNT1 A 0 A_ChangeFlag("AMBUSH", TRUE);
	SpawnContinued:
		RFTR AB 10 A_Look;
		Loop;
	ZombSee:
	See: 
		RFTR AABBCCDD 4 A_Chase;
		Loop ;
	Missile:
		TNT1 A 0 A_JumpIfCloser(750, "LowSpeedChoice");
		TNT1 A 0 A_JumpIfCloser(2500, "MidSpeedChoice");
		TNT1 A 0 A_JumpIfCloser(4500, "HighSpeedChoice");
	LowSpeedChoice:
		POSS E 0 A_Jump(256,"LowSpeed5Shot","LowSpeedTheWave","LowSpeedBurstShot");
	MidSpeedChoice:
		POSS E 0 A_Jump(256,"MidSpeed5Shot","MidSpeedTheWave","MidSpeedBurstShot");
	HighSpeedChoice:
		POSS E 0 A_Jump(256,"HighSpeed5Shot","HighSpeedTheWave","HighSpeedBurstShot");
	LowSpeed5Shot:
		RFTR E 2 A_FaceTarget ;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
		RFTR E 2 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
		RFTR E 1 A_FaceTarget ;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
		RFTR E 2 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
		RFTR E 2 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
		goto see;
   LowSpeedTheWave:
		RFTR E 10 A_FaceTarget ;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
		RFTR E 0 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
		RFTR E 0 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
		RFTR E 0 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
		RFTR E 0 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
		RFTR E 0 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
		RFTR E 0 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
		RFTR E 0 A_FaceTarget ;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
		RFTR E 2 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
		RFTR E 0 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
		goto see;
    LowSpeedBurstShot:
		RFTR E 10 A_FaceTarget ;
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,2);
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,5);
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,7);
		RFTR FE 1 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,-2);
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,-5);
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,-7);
		Goto See ;
	MidSpeed5Shot:
	  RFTR E 2 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 1 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  goto see;
   MidSpeedTheWave:
	  RFTR E 10 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  goto see;
    MidSpeedBurstShot:
		RFTR E 10 A_FaceTarget ;
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,2);
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,5);
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,7);
		RFTR FE 1 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,-2);
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,-5);
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,-7);
		Goto See;
	HighSpeed5Shot:
		RFTR E 2 A_FaceTarget ;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
		RFTR E 2 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
		RFTR E 1 A_FaceTarget ;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
		RFTR E 2 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
		RFTR E 2 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
		goto see;
	HighSpeedTheWave:
		RFTR E 10 A_FaceTarget ;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
		RFTR E 0 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
		RFTR E 0 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
		RFTR E 0 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
		RFTR E 0 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
		RFTR E 0 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
		RFTR E 0 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
		RFTR E 0 A_FaceTarget ;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
		RFTR E 2 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
		RFTR E 0 A_FaceTarget;
		RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
		RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
		goto see;
		HighSpeedBurstShot:
		RFTR E 10 A_FaceTarget ;
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,2);
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,5);
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,7);
		RFTR FE 1 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,-2);
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,-5);
		RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
		TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,-7);
		Goto See;
   ZombPain:
   Pain:
		RFTR G 3 ;
		RFTR G 3 A_Pain ;
		TNT1 A 0 a_playsound ("monsters/weakhurt",0);
		Goto See ;
   Death:
		RFTR H 5 ;
		RFTR I 5 A_Scream ;
		RFTR J 5 A_Fall ;
		RFTR K 5 ;
		RFTR L -1 ;
		Stop;
    XDeath:
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 A 0 A_PlaySound("MainGore/MonGoBoom",CHAN_AUTO);
		TNT1 A 0 A_Scream;
		TNT1 A 0 A_PlaySound("MainGore/MonGoBoom2",CHAN_AUTO);
		TNT1 AAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		RFTR M 5;
		RFTR N 5 ;
		RFTR N 5;
		RFTR P 5 A_Fall;
		RFTR QRST 5 ;
		RFTR U -1;
		Stop;
	  Crush:
		POL5 EEEEE 1;
		POL5 E -1;
   Raise:
		RFTR KJ 5 ;
		RFTR IH 5 ;
		Goto See ;
   } 
}

Class TrooperZombiemanAltGreen : TrooperZombieman
{
		Default
	{
    Health 55;
    Radius 20;
    Height 56;
	Speed 10;
	PainChance 200;
	MONSTER ;
	DamageFactor "Exorcist", 3.0;
	Damagefactor "MonsterBeatEmUp", 7.4;
	translation "80:111=112:127", "3:3=126:126";
	+FLOORCLIP;
	+NOINFIGHTING // the bullet spreads tend to easily cause infighting.;
	DropItem "ZombiemanItemDropper";
	DropItem "ZombiemanModItemDropper";
    DropItem "ZombiemanItemDropper",128;//"PBZombiemanStuffChanceDropper",128//"clip",128;
    DropItem "MicroMedPackDropChecker",128;
    SeeSound "grunt/sight";
    AttackSound "grunt/attack";
    PainSound "grunt/pain";
    DeathSound "grunt/death";
    ActiveSound "grunt/active";
    Obituary "%o was surprised by the zombie's weaponry." ;
    //Decal BulletChip;
	}
    States 
    { 

	LowSpeedChoice:
		POSS E 0 A_Jump(256,"LowSpeed5Shot","LowSpeedTheWave","LowSpeedBurstShot","LowSpeedNadeBurstShot");
	MidSpeedChoice:
		POSS E 0 A_Jump(256,"MidSpeed5Shot","MidSpeedTheWave","MidSpeedBurstShot");
	HighSpeedChoice:
		POSS E 0 A_Jump(256,"HighSpeed5Shot","HighSpeedTheWave","HighSpeedBurstShot");
   LowSpeed5Shot:
	  RFTR E 2 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 1 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  goto see;
   LowSpeedTheWave:
	  RFTR E 10 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  goto see;
    LowSpeedBurstShot:
	  RFTR E 10 A_FaceTarget ;
      RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,2);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,5);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,7);
	  RFTR FE 1 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,-2);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,-5);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,-7);
      Goto See ;
	LowSpeedNadeBurstShot:
	  RFTR E 10 A_FaceTarget ;
      RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,2);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,5);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,7);
	  RFTR FE 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,-2);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,-5);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,-7);
	  RFTR E 10 A_FaceTarget ;
      RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("ZombGrenade",32,0,2);
      Goto See;
	MidSpeed5Shot:
	  RFTR E 2 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 1 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  goto see;
   MidSpeedTheWave:
	  RFTR E 10 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  goto see;
    MidSpeedBurstShot:
	  RFTR E 10 A_FaceTarget ;
      RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,2);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,5);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,7);
	  RFTR FE 1 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,-2);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,-5);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,-7);
      Goto See;
	HighSpeed5Shot:
	  RFTR E 2 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 1 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  goto see;
   HighSpeedTheWave:
	  RFTR E 10 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  goto see;
    HighSpeedBurstShot:
	  RFTR E 10 A_FaceTarget ;
      RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,2);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,5);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,7);
	  RFTR FE 1 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,-2);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,-5);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,-7);
      Goto See ;
   Pain:
      RFTR G 3 ;
      RFTR G 3 A_Pain ;
	  Goto See ;
   }
}

Class TrooperZombiemanAltRed : TrooperZombieman
{
		Default
	{
   Health 65;
   Radius 20;
   Height 56;
   Speed 10;
   PainChance 200;
   MONSTER ;
   DamageFactor "Exorcist", 3.0;
   Damagefactor "MonsterBeatEmUp", 7.4;
   translation "80:111=181:191", "3:3=198:198";
   +FLOORCLIP;
   +NOINFIGHTING // the bullet spreads tend to easily cause infighting.;
	DropItem "ZombiemanItemDropper";
	DropItem "ZombiemanModItemDropper";
	DropItem "ZombiemanItemDropper",128;//"PBZombiemanStuffChanceDropper",128//"clip",128;
   	DropItem "MicroMedPackDropChecker",128;
   SeeSound "grunt/sight";
   AttackSound "grunt/attack";
   PainSound "grunt/pain";
   DeathSound "grunt/death";
   ActiveSound "grunt/active";
   Obituary "%o was surprised by the zombie's weaponry." ;
   //Decal BulletChip;
   }
   States
   { 
	LowSpeedChoice:
		POSS E 0 A_Jump(256,"LowSpeed5Shot","LowSpeedTheWave","LowSpeedBurstShot");
	MidSpeedChoice:
		POSS E 0 A_Jump(256,"MidSpeed5Shot","MidSpeedTheWave","MidSpeedBurstShot");
	HighSpeedChoice:
		POSS E 0 A_Jump(256,"HighSpeed5Shot","HighSpeedTheWave","HighSpeedBurstShot");
   LowSpeed5Shot:
	  RFTR E 2 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 1 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  goto see;
   LowSpeedTheWave:
	  RFTR E 10 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  goto see;
    LowSpeedBurstShot:
	  RFTR E 10 A_FaceTarget ;
      RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,2);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,5);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,7);
	  RFTR FE 1 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,-2);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,-5);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("LowSpeedZomBullet",32,0,-7);
      Goto See ;
	MidSpeed5Shot:
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 1 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  goto see;
   MidSpeedTheWave:
	  RFTR E 10 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  goto see;
    MidSpeedBurstShot:
	  RFTR E 10 A_FaceTarget ;
      RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,2);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,5);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,7);
	  RFTR FE 1 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,-2);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,-5);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("MidSpeedZomBullet",32,0,-7);
      Goto See;
	HighSpeed5Shot:
	  RFTR E 2 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 1 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 2 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  goto see;
   HighSpeedTheWave:
	  RFTR E 10 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-12, 12)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget ;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  RFTR E 2 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-15, 15)), 0, 0);
	  RFTR E 0 A_FaceTarget;
	  RFTR F 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  RFTR F 0 Bright bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, (random(-10, 10)), 0, 0);
	  goto see;
    HighSpeedBurstShot:
	  RFTR E 10 A_FaceTarget ;
      RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,2);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,5);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,7);
	  RFTR FE 1 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,-2);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,-5);
	  RFTR EF 0 A_PlaySound("Zom/Shot",1,0.8) ;
	  TNT1 A 0 A_SpawnProjectile("HighSpeedZomBullet",32,0,-7);
      Goto See ;
   Pain:
      RFTR G 3 ;
      RFTR G 3 A_Pain ;
      TNT1 A 0 a_playsound ("monsters/weakhurt",0);
	  Goto See ;
   } 
}