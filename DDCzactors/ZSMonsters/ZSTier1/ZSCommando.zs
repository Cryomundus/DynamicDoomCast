//this is a test line;
//#include decorate/Decoratives.dec;
//Note: This guy and all other chaingunners are gonna need inventory ;
//shenanigans to work properly;
///////////////////////;
//    Chaingunner    //;
///////////////////////;
Class ChainGunner : ChaingunGuyModStatesinheritor
{
	Default 
	{
	Health 70;
	Gibhealth 35;
	Radius 16;//20;
	Height 56;
	Mass 100;
	Speed 8;
	PainChance 170;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	Monster;
	DamageFactor "Exorcist", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	-THRUSPECIES;
	+NOBLOCKMONST;
	+DOHARMSPECIES;
	+FLOORCLIP;

	+NOINFIGHTING; // the bullet spreads tend to easily cause infighting.; 
	translation "16:47=80:111", "167:167=107:107", "112:127=5:8", "16:47=80:111", "167:167=107:107";
	SeeSound "chainguy/sight";
	PainSound "chainguy/pain";
	DeathSound "chainguy/death";
	ActiveSound "chainguy/active";
	AttackSound "chainguy/attack";
	Obituary "$OB_CHAINGUY";
	Dropitem "ChainGunGuyItemDropper";
	Dropitem "ChaingunGuyModItemDropper";
	DropItem "MicroMedPackDropChecker", 128;
	}
	States
	{
	Spawn:
		TNT1 A 0 A_CheckFlag("AMBUSH", "CanAmbush", AAPTR_MASTER);
		 goto SpawnContinued;
	CanAmbush:
		 TNT1 A 0 A_ChangeFlag("AMBUSH", TRUE) ;
	SpawnContinued:
		MINZ AB 10 A_Look;
		Loop;
	See:
		MINZ AABBCCDD 3 A_Chase;
		Loop;
	Missile:
		TNT1 A 0 A_JumpIfCloser(750, "LowSpeedShots");
		TNT1 A 0 A_JumpIfCloser(2500, "MidSpeedShots");
		TNT1 A 0 A_JumpIfCloser(4500, "HighSpeedShots");
	LowSpeedShots:
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 8 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 7 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 6 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 4 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50, -5, -3, 0, 0);
	Return1:
		MINZ E 5 bright A_FaceTarget; //return point should here, roughly;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ F 0 A_CheckSight("See"); //I was gonna do inv shenanigens till I remembered this thing exists;
		Goto Return1;
	MidSpeedShots:
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 8 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 7 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 6 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 4 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 50, -5, -3, 0, 0);
	Return2:
		MINZ E 5 bright A_FaceTarget; //return point should here, roughly;
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ F 0 A_CheckSight("See"); //I was gonna do inv shenanigens till I remembered this thing exists;
		Goto Return2;
	HighSpeedShots:
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 8 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 7 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 6 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 4 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 50, -5, -3, 0, 0);
	Return3:
		MINZ E 5 bright A_FaceTarget; //return point should here, roughly;
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ F 0 A_CheckSight("See"); //I was gonna do inv shenanigens till I remembered this thing exists;
		Goto Return3;
	Pain: 
		MINZ G 3;
		MINZ G 3 A_Pain;
		TNT1 A 0 a_playsound ("monsters/weakhurt",0);
		Goto See;
	Death:
		MINZ G 0 ;
		MINZ H 5 ;
		MINZ I 5 A_Scream;
		MINZ J 5 A_NoBlocking;
		MINZ KLM 5	;
		MINZ N -1;
		Stop;
	XDeath:
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 A 0 A_PlaySound("MainGore/MonGoBoom2",CHAN_AUTO);
		TNT1 A 0 A_Scream;
		TNT1 AAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
	   	XMED A 5;
		XMED B 5 ;
        XMED C 5 A_NoBlocking;
        XMED D 5 ;
		XMED E -1;
        stop;
	Crush:
		POL5 EEEEE 1 ;
		POL5 E -1;
		Stop;
	Raise:
		MINZ N 5;
		MINZ MLKJIH 5;
		Goto See;
	}
}
Class ChainGunnerAltBlue : ChainGunner
{
	Default 
	{
	Health 70;
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
	translation "16:47=80:111", "167:167=107:107", "31:47=195:205";
	+NOBLOCKMONST;
	+DOHARMSPECIES;
	+FLOORCLIP;
	+NOINFIGHTING; // the bullet spreads tend to easily cause infighting.;
	translation "112:127=200:207";
	SeeSound "chainguy/sight";
	PainSound "chainguy/pain";
	DeathSound "chainguy/death";
	ActiveSound "chainguy/active";
	AttackSound "chainguy/attack";
	Obituary "$OB_CHAINGUY";
	Dropitem "ChainGunGuyItemDropper";
	Dropitem "ChaingunGuyModItemDropper";
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
		MINZ AB 10 A_Look;
		Loop;
	See:
		MINZ AABBCCDD 3 A_Chase;
		Loop;
	Missile:
		TNT1 A 0 A_JumpIfCloser(750, "LowSpeedShots");
		TNT1 A 0 A_JumpIfCloser(2500, "MidSpeedShots");
		TNT1 A 0 A_JumpIfCloser(4500, "HighSpeedShots");
	LowSpeedShots:
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 8 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 7 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 6 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 4 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50, -5, -3, 0, 0);
	Return1:
		MINZ E 5 bright A_FaceTarget; //return point should here, roughly;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ F 0 A_CheckSight("See"); //I was gonna do inv shenanigens till I remembered this thing exists;
		Goto Return1;
	LowSpeedShotsWithDoubleGrenades:
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 8 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 7 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 6 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 4 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50, -5, -3, 0, 0);
	Return2:
		MINZ E 5 bright A_FaceTarget; //return point should here, roughly;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Weapons/NailBomb",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("ZombGrenade", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Weapons/NailBomb",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("ZombGrenade", 33,  0,  -7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ F 0 A_CheckSight("See"); //I was gonna do inv shenanigens till I remembered this thing exists;
		Goto Return2;
	MidSpeedShots:
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 8 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 7 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 6 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 4 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 50, -5, -3, 0, 0);
	Return3:
		MINZ E 5 bright A_FaceTarget; //return point should here, roughly;
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ F 0 A_CheckSight("See"); //I was gonna do inv shenanigens till I remembered this thing exists;
		Goto Return3;
	HighSpeedShots:
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 8 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 7 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 6 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 4 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 50, -5, -3, 0, 0);
	Return4:
		MINZ E 5 bright A_FaceTarget; //return point should here, roughly;
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ F 0 A_CheckSight("See"); //I was gonna do inv shenanigens till I remembered this thing exists;
		Goto Return4;
	Pain:
		MINZ G 3;
		MINZ G 3 A_Pain;
		TNT1 A 0 a_playsound ("monsters/weakhurt",0);
		Goto See;
	Death:
		MINZ G 0 ;
		MINZ H 5 ;
		MINZ I 5 A_Scream;
		MINZ J 5 A_NoBlocking;
		MINZ KLM 5;
		MINZ N -1;
		Stop;
	XDeath:
	   	MINZ O 5;
		MINZ P 5 A_XScream;
        MINZ Q 5 A_NoBlocking;
        MINZ RS 5 ;
        MINZ T -1;
        stop;
	Crush:
		POL5 EEEEE 1 ;
		POL5 E -1;
		Stop	;
	Raise:
		MINZ N 5;
		MINZ MLKJIH 5;
		Goto See;
	}
}

Class ChainGunnerAltGreen : ChainGunner
{
	Default
	{
	Health 70;
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
	translation "16:47=80:111", "167:167=107:107","31:47=119:127";
	+NOBLOCKMONST;
	+DOHARMSPECIES;
	+FLOORCLIP;
	+NOINFIGHTING; // the bullet spreads tend to easily cause infighting.;
	SeeSound "chainguy/sight";
	PainSound "chainguy/pain";
	DeathSound "chainguy/death";
	ActiveSound "chainguy/active";
	AttackSound "chainguy/attack";
	Obituary "$OB_CHAINGUY";
	Dropitem "ChainGunGuyItemDropper";
	Dropitem "ChaingunGuyModItemDropper";
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
		MINZ AB 10 A_Look;
		Loop;
	See:
		MINZ AABBCCDD 3 A_Chase;
		Loop;
	Missile:
		TNT1 A 0 A_JumpIfCloser(750, "CloseRangeChoice");
		TNT1 A 0 A_JumpIfCloser(2500, "MidSpeedShots");
		TNT1 A 0 A_JumpIfCloser(4500, "HighSpeedShots");
	CloseRangeChoice:
		TNT1 A 0 A_Jump(256, "LowSpeedShots","LowSpeedShotsWithTripleGrenades");
	LowSpeedShotsWithTripleGrenades:
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 8 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 7 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 6 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 4 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget; //return point should here, roughly;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 3 bright A_FaceTarget;//ZombGrenade;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ F 0 bright A_PlaySound("Weapons/NailBomb",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("ZombGrenade", 33,  0,  0, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Weapons/NailBomb",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("ZombGrenade", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Weapons/NailBomb",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("ZombGrenade", 33,  0,  -7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ F 0 A_CheckSight("See"); //I was gonna do inv shenanigens till I remembered this thing exists;
		Goto LowSpeedShotsWithTripleGrenades+25;
	LowSpeedShots:
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 8 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 7 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 6 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 4 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget; //return point should here, roughly;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("LowSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ F 0 A_CheckSight("See"); //I was gonna do inv shenanigens till I remembered this thing exists;
		Goto LowSpeedShots+25;
	MidSpeedShots:
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 8 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 7 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 6 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 4 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget; //return point should here, roughly;
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("MidSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ F 0 A_CheckSight("See"); //I was gonna do inv shenanigens till I remembered this thing exists;
		Goto MidSpeedShots+25;
	HighSpeedShots:
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 8 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 7 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 6 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 4 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ E 5 bright A_FaceTarget; //return point should here, roughly;
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  0, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  -22, 0, 0);
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 33,  0,  -7, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 15,  5, -3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 15, -5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 50,  5,  3, 0, 0);
		MINZ E 3 bright A_FaceTarget;
		MINZ F 0 bright A_PlaySound("Zom/Shot",1,0.8);
		MINZ F 0 bright A_SpawnProjectile("HighSpeedShottyBullet", 50, -5, -3, 0, 0);
		MINZ F 0 A_CheckSight("See"); //I was gonna do inv shenanigens till I remembered this thing exists;
		Goto HighSpeedShots+25;
	Pain:
		MINZ G 3;
		MINZ G 3 A_Pain;
		TNT1 A 0 a_playsound ("monsters/weakhurt",0);
		Goto See;
	Death:
		MINZ G 0 ;
		MINZ H 5 ;
		MINZ I 5 A_Scream;
		MINZ J 5 A_NoBlocking;
		MINZ KLM 5;
		MINZ N -1;
		Stop;
	XDeath:
	   	MINZ O 5;
		MINZ P 5 A_XScream;
        MINZ Q 5 A_NoBlocking;
        MINZ RS 5 ;
        MINZ T -1;
        stop;
	Crush:
		POL5 EEEEE 1 ;
		POL5 E -1;
		Stop;
	Raise:
		MINZ N 5;
		MINZ MLKJIH 5;
		Goto See;
	}
}