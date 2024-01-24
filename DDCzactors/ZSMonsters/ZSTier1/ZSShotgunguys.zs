Class ShotGunner : ShotgunGuyModStatesinheritor
{
	Default
	{
	Health 45;
	Gibhealth 22;
	Radius 16;//20;
	Height 56;
	Mass 100;
	Speed 8;
	PainChance 170;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	Monster;
	DamageFactor "Exorcist", 3.0;
	DamageFactor "MonsterBeatEmUp", 2;
	-THRUSPECIES;
	+DOHARMSPECIES;
	+FLOORCLIP;
	+NOINFIGHTING; // the bullet spreads tend to easily cause infighting.;
	translation "152:159=5:8", "96:111=5:8", "9:12=7:8", "112:127=7:7", "6:6=7:7";
	Dropitem "ShotgunGuyItemDropper";
	Dropitem "ShotgunGuyModItemDropper";
	SeeSound "shotguy/sight";
	AttackSound "shotguy/attack";
	PainSound "shotguy/pain";
	DeathSound "shotguy/death";
	ActiveSound "shotguy/active";
	Obituary "$OB_SHOTGUY";
	}
	States
	{
	Spawn:
		TNT1 A 0 A_CheckFlag("AMBUSH", "CanAmbush", AAPTR_MASTER);
		 goto SpawnContinued;
	CanAmbush:
		 TNT1 A 0 A_ChangeFlag("AMBUSH", TRUE) ;
	SpawnContinued:
		ZSDO AB 10 A_Look;
		Loop;
	See:
		ZSDO AABBCCDD 3 A_Chase;
		Loop;
	Missile:
		TNT1 A 0 A_JumpIfCloser(750, "LowSpeedShots");
		TNT1 A 0 A_JumpIfCloser(2500, "MidSpeedShots");
		TNT1 A 0 A_JumpIfCloser(4500, "HighSpeedShots");
	LowSpeedShots:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  0, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 33,  0, -7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 15,  5, -3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 15, -5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 50,  5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 50, -5, -3, 0, 0);
		goto See;
	MidSpeedShots:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  0, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 33,  0, -7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 15,  5, -3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 15, -5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 50,  5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 50, -5, -3, 0, 0);
		goto See;
	HighSpeedShots:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  0, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 33,  0, -7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 15,  5, -3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 15, -5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 50,  5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 50, -5, -3, 0, 0);
		goto See;
	Pain:
		ZSDO G 3;
		ZSDO G 3 A_Pain;
		TNT1 A 0 a_playsound ("monsters/weakhurt",0);
		Goto See;
	Death:
		ZSDO G 0 ;
		ZSDO H 5 ;
		ZSDO I 5 A_Scream;
		ZSDO J 5 A_NoBlocking;
		ZSDO K 5 ;
		ZSDO L -1;
		Stop;
		/*
	XDeath:
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 A 0 A_PlaySound("MainGore/MonGoBoom2",CHAN_AUTO);
		TNT1 A 0 A_Scream;
		TNT1 A 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		XMED A 5;
     	XMED B 5 ;
     	XMED C 5 A_NoBlocking;
		XMED D 5;
		XMED E -1;
    	stop;
		*/
	Crush:
		POL5 E 1;
		POL5 E -1;
		Stop	;
	
	Raise:
		ZSDO L 5;
		ZSDO KJIH 5;
		Goto See;
	}
}

Class ShotGunnerAltGreen : ShotGunner
{
	Default
	{	
	Health 45;
	Radius 16;
	Height 56;
	Mass 100;
	Speed 8;
	PainChance 170;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	Monster;
	DamageFactor "Exorcist", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	+NOBLOCKMONST;
	+DOHARMSPECIES;
	+FLOORCLIP;
	+NOINFIGHTING; // the bullet spreads tend to easily cause infighting.;
	translation "152:159=120:127", "96:111=125:127", "9:12=127:127", "112:127=126:126", "0:0=0:0", "6:6=126:126";
	SeeSound "shotguy/sight";
	AttackSound "shotguy/attack";
	PainSound "shotguy/pain";
	DeathSound "shotguy/death";
	ActiveSound "shotguy/active";
	Obituary "$OB_SHOTGUY";
	Dropitem "ShotgunGuyItemDropper";
	Dropitem "ShotgunGuyModItemDropper";
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
	//DropItem "Shell",128;
	//DropItem "DropedGrenade" 7;
	}
	States
	{
	Spawn:
		TNT1 A 0 A_CheckFlag("AMBUSH", "CanAmbush", AAPTR_MASTER);
		 goto SpawnContinued;
	CanAmbush:
		 TNT1 A 0 A_ChangeFlag("AMBUSH", TRUE);
	SpawnContinued:
		ZSDO AB 10 A_Look;
		Loop;
	See:
		ZSDO AABBCCDD 3 A_Chase;
		Loop;
	Missile:
		TNT1 A 0 A_JumpIfCloser(750, "LowSpeedShots");
		TNT1 A 0 A_JumpIfCloser(2500, "MidSpeedChoice");
		TNT1 A 0 A_JumpIfCloser(4500, "HighSpeedChoice");
	LowSpeedChoice:
		POSS E 0 A_Jump(256,"LowSpeedShots","LowSpeedClusterNade");
	MidSpeedChoice:
		POSS E 0 A_Jump(256,"MidSpeedShots","MidSpeedClusterNade");
	HighSpeedChoice:
		POSS E 0 A_Jump(256,"HighSpeedShots","HighSpeedClusterNade");
	LowSpeedShots:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		ZSDO E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  0, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 33,  0, -7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 15,  5, -3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 15, -5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 50,  5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 50, -5, -3, 0, 0);
		goto See;
	LowSpeedClusterNade:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		GPOS E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyZombGrenadeCluster", 33,  0,  0, 0, 0);
		goto See;
	MidSpeedShots:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		ZSDO E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  0, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 33,  0, -7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 15,  5, -3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 15, -5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 50,  5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 50, -5, -3, 0, 0);
		goto See;
	MidSpeedClusterNade:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		GPOS E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyZombGrenadeCluster", 33,  0,  0, 0, 0);
		goto See;
	HighSpeedShots:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		ZSDO E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  0, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 33,  0, -7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 15,  5, -3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 15, -5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 50,  5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 50, -5, -3, 0, 0);
		goto See;
	HighSpeedClusterNade:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		GPOS E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyZombGrenadeCluster", 33,  0,  0, 0, 0);
		goto See;
	Pain:
		ZSDO G 3;
		ZSDO G 3 A_Pain;
		TNT1 A 0 a_playsound ("monsters/weakhurt",0);
		Goto See;
	}
}

Class ShotGunnerAltBlue : ShotGunner
{
	Default
	{	
	Health 45;
	Radius 16;
	Height 56;
	Mass 100;
	Speed 8;
	PainChance 170;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	Monster;
	DamageFactor "MonsterBeatEmUp", 7.4;
	DamageFactor "Exorcist", 3.0;
	+NOBLOCKMONST;
	+DOHARMSPECIES;
	+FLOORCLIP;
	+NOINFIGHTING; // the bullet spreads tend to easily cause infighting.;
	translation "152:159=196:203", "96:111=207:207", "9:12=244:244", "112:127=241:241", "6:6=206:206";
	SeeSound "shotguy/sight";
	AttackSound "shotguy/attack";
	PainSound "shotguy/pain";
	DeathSound "shotguy/death";
	ActiveSound "shotguy/active";
	Obituary "$OB_SHOTGUY";
	Dropitem "ShotgunGuyItemDropper";
	Dropitem "ShotgunGuyModItemDropper";
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
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
		ZSDO AB 10 A_Look;
		Loop;
	See:
		ZSDO AABBCCDD 3 A_Chase;
		Loop;
	Missile:
		TNT1 A 0 A_JumpIfCloser(750, "LowSpeedShots");
		TNT1 A 0 A_JumpIfCloser(2500, "MidSpeedChoice");
		TNT1 A 0 A_JumpIfCloser(4500, "HighSpeedChoice");
	LowSpeedChoice:
		POSS E 0 A_Jump(256,"LowSpeedShots","LowSpeedTriClusterNade");
	MidSpeedChoice:
		POSS E 0 A_Jump(256,"MidSpeedShots","MidSpeedTriClusterNade");
	HighSpeedChoice:
		POSS E 0 A_Jump(256,"HighSpeedShots","HighSpeedTriClusterNade");
	LowSpeedShots:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		ZSDO E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  0, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 33,  0, -7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 15,  5, -3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 15, -5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 50,  5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyBullet", 50, -5, -3, 0, 0);
		goto See;
	LowSpeedTriClusterNade:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		GPOS E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyZombGrenadeCluster", 33,  0,  0, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyZombGrenadeCluster", 33,  0,  -10, 0, 0);
		ZSDO F 0 A_SpawnProjectile("LowSpeedShottyZombGrenadeCluster", 33,  0,  10, 0, 0);
		goto See;
	MidSpeedShots:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		ZSDO E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  0, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 33,  0, -7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 15,  5, -3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 15, -5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 50,  5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyBullet", 50, -5, -3, 0, 0);
		goto See;
	MidSpeedTriClusterNade:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		GPOS E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyZombGrenadeCluster", 33,  0,  0, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyZombGrenadeCluster", 33,  0,  -10, 0, 0);
		ZSDO F 0 A_SpawnProjectile("MidSpeedShottyZombGrenadeCluster", 33,  0,  10, 0, 0);
		goto See;
	HighSpeedShots:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		ZSDO E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  0, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 33,  0, -7, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 15,  5, -3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 15, -5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 50,  5,  3, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyBullet", 50, -5, -3, 0, 0);
		goto See;
	HighSpeedTriClusterNade:
		ZSDO E 8 A_FaceTarget;
		ZSDO E 0 A_PlaySound("Fleshrend/Fire",1,0.9);
		GPOS E 0 A_PlaySound("shotguy/attack",1,0.9);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyZombGrenadeCluster", 33,  0,  0, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyZombGrenadeCluster", 33,  0,  -10, 0, 0);
		ZSDO F 0 A_SpawnProjectile("HighSpeedShottyZombGrenadeCluster", 33,  0,  10, 0, 0);
		goto See;
	Pain:
		ZSDO G 3;
		ZSDO G 3 A_Pain;
		TNT1 A 0 a_playsound ("monsters/weakhurt",0);
		Goto See;
	}
}