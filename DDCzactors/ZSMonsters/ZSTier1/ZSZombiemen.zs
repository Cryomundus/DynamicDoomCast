Class  BasicZombieman : ZombieManModStatesinheritor
{
	Default
	{
	//Game Doom
//	SpawnID 4
	Health 30;
	//Gibhealth 15;
	Radius 16; //20
	Height 56;
	Speed 14;
	PainChance 200;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	Monster;
	DamageFactor "Exorcist", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	DamageFactor "NoDamage", 0.0;
    DamageFactor "SpeedBooster", 2.0;
	-THRUSPECIES;
	+NOBLOCKMONST;
	+DOHARMSPECIES;
	+FLOORCLIP;
	+NOINFIGHTING; // the bullet spreads tend to easily cause infighting.
	translation "71:79=5:8", "2:7=7:8";
	DropItem "ZombiemanItemDropper";
	DropItem "ZombiemanModItemDropper";
	SeeSound "grunt/sight";
	PainSound "grunt/pain";
	DeathSound "grunt/death";
	ActiveSound "grunt/active";
	Obituary "$OB_ZOMBIE";
	 }
	States
	{
	Spawn:
		TNT1 A 0 A_CheckFlag("AMBUSH", "CanAmbush", AAPTR_MASTER);
		goto SpawnContinued;
	CanAmbush:
		 TNT1 A 0 A_ChangeFlag("AMBUSH", TRUE);
	SpawnContinued:
		MGPO AB 10 A_Look;
		Loop;
	Zombsee:
	See:
		MGPO AABBCCDD 4 A_Chase;
		Loop;
	Missile:
		TNT1 A 0 A_JumpIfCloser(750, "LowSpeedChoice");
		TNT1 A 0 A_JumpIfCloser(2500, "MidSpeedChoice");
		TNT1 A 0 A_JumpIfCloser(4500, "HighSpeedChoice");
	LowSpeedChoice:
		MGPO E 0 A_Jump(256,"LowSpeedZombStandardFire","LowSpeedZombAlternatingFire");
	MidSpeedChoice:
		MGPO E 0 A_Jump(256,"MidSpeedZombStandardFire","MidSpeedZombAlternatingFire");
	HighSpeedChoice:
		MGPO E 0 A_Jump(256,"HighSpeedZombStandardFire","HighSpeedZombAlternatingFire");
	LowSpeedZombStandardFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	LowSpeedZombAlternatingFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, -3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	MidSpeedZombStandardFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	MidSpeedZombAlternatingFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, -3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	HighSpeedZombStandardFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	HighSpeedZombAlternatingFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, -3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	ZombPain:
	Pain:
		MGPO G 3 ;
		MGPO G 3 A_Pain;
		TNT1 A 0 a_playsound ("monsters/weakhurt",0);
		Goto See;
	Death:
		MGPO H 5;
		MGPO I 5 A_Scream;
		MGPO J 5 A_NoBlocking;
		MGPO L -1;
		Stop;
		/*
	XDeath:
		TNT1 A 0 A_PlaySound("MainGore/MonGoBoom2",CHAN_AUTO);
		TNT1 A 0 A_Scream;
		TNT1 A 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 A 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		XMED A 5;
        XMED B 5;
        XMED C 5 A_NoBlocking;
		XMED D 5;
		XMED E -1;
        stop;
		*/
	Crush:
		POL5 EEEEE 1;
		POL5 E -1;
	Raise:
		MGPO K 5;
		MGPO JIH 5;
		Goto See;
	}
}


Class  BasicZombiemanAltGreen : BasicZombieman
{
	Default
	{
	//	Game Doom;
	//SpawnID 4;
	Health 40;
	Radius 16;
	Height 56;
	Speed 15;
	PainChance 200;
	Monster;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	DamageFactor "Exorcist", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	DamageFactor "NoDamage", 0.0;
    DamageFactor "SpeedBooster", 2.0;
	+NOBLOCKMONST;
	+DOHARMSPECIES;
	+FLOORCLIP;
	+NOINFIGHTING; // the bullet spreads tend to easily cause infighting.;
	translation "71:79=121:127", "2:7=11:12";
	SeeSound "grunt/sight";
	PainSound "grunt/pain";
	DeathSound "grunt/death";
	ActiveSound "grunt/active";
	Obituary "$OB_ZOMBIE";
	DropItem "ZombiemanItemDropper";
	DropItem "ZombiemanModItemDropper";
	DropItem "MicroMedPackDropChecker", 128;
	}
	States
	{
	LowSpeedChoice:
		MGPO E 0 A_Jump(256,"LowSpeedZombStandardFire","LowSpeedZombAlternatingFire","LowSpeedZombSingleNadeFire");
	MidSpeedChoice:
		MGPO E 0 A_Jump(256,"MidSpeedZombStandardFire","MidSpeedZombAlternatingFire");
	HighSpeedChoice:
		MGPO E 0 A_Jump(256,"HighSpeedZombStandardFire","HighSpeedZombAlternatingFire");
	LowSpeedZombStandardFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See	;
	LowSpeedZombAlternatingFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, -3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, -3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	LowSpeedZombSingleNadeFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Weapons/NailBomb");
		MGPO F 2 bright A_SpawnProjectile("ZombGrenade", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	MidSpeedZombStandardFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	MidSpeedZombAlternatingFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, -3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	HighSpeedZombStandardFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	HighSpeedZombAlternatingFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, -3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	}
}

Class  BasicZombiemanAltBlue : BasicZombieman
{
	Default
	{
	//	Game Doom;
	//SpawnID 4;
	Health 50;
	Radius 16;
	Height 56;
	Speed 15;
	PainChance 200;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	Painchance "Fire", 20;
	Painchance "Terror", 255;
	DamageFactor "NoDamage", 0.0;
    DamageFactor "SpeedBooster", 2.0;
	Monster;
	DamageFactor "Exorcist", 3.0;
	+NOBLOCKMONST;
	+DOHARMSPECIES;
	+FLOORCLIP;
	+NOINFIGHTING; // the bullet spreads tend to easily cause infighting.;
	translation "71:79=197:207", "2:7=240:242";
	SeeSound "grunt/sight";
	PainSound "grunt/pain";
	DeathSound "grunt/death";
	ActiveSound "grunt/active";
	Obituary "$OB_ZOMBIE";
	DropItem "ZombiemanItemDropper";
	DropItem "ZombiemanModItemDropper";
	DropItem "MicroMedPackDropChecker", 28;
	}
	States
	{
	See:
	    MGPO A 0 A_JUMP(50, "Fastly");
		MGPO AABBCCDD 4 A_Chase;
		Loop;
	Fastly:
		MGPO A 0 A_JUMP(50, "See");
		MGPO AABBCCDD 2 A_Chase;
		MGPO AABBCCDD 4 A_FastChase;
		Loop;
	Missile:
		TNT1 A 0 A_JumpIfCloser(750, "LowSpeedChoice");
		TNT1 A 0 A_JumpIfCloser(2500, "MidSpeedChoice");
		TNT1 A 0 A_JumpIfCloser(4500, "HighSpeedChoice");
	LowSpeedChoice:
		MGPO E 0 A_Jump(256,"LowSpeedZombStandardFire","LowSpeedZombAlternatingFire","LowSpeedZombSingleNadeFire","LowSpeedZombDualNade");
	MidSpeedChoice:
		MGPO E 0 A_Jump(256,"MidSpeedZombStandardFire","MidSpeedZombAlternatingFire");
	HighSpeedChoice:
		MGPO E 0 A_Jump(256,"HighSpeedZombStandardFire","HighSpeedZombAlternatingFire");
	LowSpeedZombStandardFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	LowSpeedZombAlternatingFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, -3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, -3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	LowSpeedZombSingleNadeFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("LowSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Weapons/NailBomb");
		MGPO F 2 bright A_SpawnProjectile("ZombGrenade", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	LowSpeedZombDualNade:
		MGPO E 10 A_FaceTarget;
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Weapons/NailBomb");
		MGPO F 2 bright A_SpawnProjectile("ZombGrenade", 27, 0, -5, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Weapons/NailBomb");
		MGPO F 2 bright A_SpawnProjectile("ZombGrenade", 27, 0, 5, 0, 0);
		MGPO E 4;
		Goto See;
	MidSpeedZombStandardFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	MidSpeedZombAlternatingFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, -3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("MidSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	HighSpeedZombStandardFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	HighSpeedZombAlternatingFire:
		MGPO E 10 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, -3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 3, 0, 0);
		MGPO E 2 A_FaceTarget;
		MGPO F 0 bright A_PlaySound("Zom/Shot");
		MGPO F 2 bright A_SpawnProjectile("HighSpeedZomBullet", 27, 0, 0, 0, 0);
		MGPO E 4;
		Goto See;
	}
}