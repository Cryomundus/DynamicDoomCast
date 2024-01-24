Class Spidermind  : SpiderMastermindModStatesinheritor
{
	Default
	{
	Health 2500;
	Radius 100;
	Height 100;
	Mass 1000;
	Speed 12;
	PainChance 40;
	Monster;
	Translation "112:127=160:167";
	DamageFactor "Heroic", 3.0;
	DamageFactor "MonsterBeatEmUp", 10.4;
	DamageFactor "ArgPlayerRocket", 0.66;
	DamageFactor "ArgCyberRocket" , 0.5;
	MinMissileChance 160;
	-THRUSPECIES;
	+NOBLOCKMONST;
	+BOSS;
	+MISSILEMORE;
	+FLOORCLIP;
	//+NORADIUSDMG;
	+DONTMORPH;
	+BOSSDEATH;
	+DOHARMSPECIES;
	+MISSILEMORE;
	+MISSILEEVENMORE;
	SeeSound "BFGDer/sight";
	AttackSound "BFGDer/attack";
	PainSound "BFGDer/pain";
	DeathSound "BFGDer/death";
	ActiveSound "BFGDer/active";
	Obituary "$OB_BFGDer";
	}
	States
	{
	Spawn:
		TNT1 A 0 A_CheckFlag("AMBUSH", "CanAmbush", AAPTR_MASTER);
		goto SpawnContinued;
	CanAmbush:
		 TNT1 A 0 A_ChangeFlag("AMBUSH", TRUE);
	SpawnContinued:
		BFGD AB 10 A_Look;
		Loop;
	See:
		BFGD A 3 A_Metal;
		BFGD ABB 3 A_Chase;
		BFGD C 3 A_Metal;
		BFGD CDD 3 A_Chase;
		BFGD E 3 A_Metal;
		BFGD EFF 3 A_Chase;
		Loop;
	Missile:
		TNT1 A 0 A_Jump(256, "StandardFire", "StandardFire", "StandardFire", "ARoundOfSplitsForYou", "DeathLaserGalore");
	ARoundOfSplitsForYou:
		BFGD A 2 BRIGHT A_FaceTarget  ;
		BFGD H 2 BRIGHT  A_PlaySound("Zom/Shot",1,0.8);
		BFGD F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0,  7, 0, 0);
		BFGD F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0,  0, 0, 0);
		BFGD F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0, -7, 0, 0);
		BFGD F 0 A_SpawnProjectile("AracknightMissileSplitter5x", 15,  5, -3, 0, 0);
		BFGD F 0 A_SpawnProjectile("AracknightMissileSplitter5x", 15, -5,  3, 0, 0);
		BFGD F 0 A_SpawnProjectile("ScatterShotSplitter2x", 50,  5,  3, 0, 0);
		BFGD F 0 A_SpawnProjectile("ScatterShotSplitter2x", 50, -5, -3, 0, 0);
		BFGD A 0 BRIGHT A_FaceTarget;
		BFGD F 2 BRIGHT  A_PlaySound("Zom/Shot",1,0.8);
		BFGD F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0,  27, 0, 0);
		BFGD F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0,  20, 0, 0);
		BFGD F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0, -27, 0, 0);
		BFGD F 0 A_SpawnProjectile("AracknightMissileSplitter5x", 15,  5, -23, 0, 0);
		BFGD F 0 A_SpawnProjectile("AracknightMissileSplitter5x", 15, -5,  23, 0, 0);
		BFGD F 0 A_SpawnProjectile("ScatterShotSplitter2x", 50,  5,  23, 0, 0);
		BFGD F 0 A_SpawnProjectile("ScatterShotSplitter2x", 50, -5, -23, 0, 0);
		Goto Missile;
	DeathLaserGalore:
		BFGD A 2 BRIGHT A_FaceTarget  ;
		BFGD H 2 BRIGHT  A_PlaySound("weapons/bfgf", CHAN_AUTO);
		BFGD F 0 Bright A_recoil(15);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  0,  7, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  0,  0, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  0, -7, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 15,  5, -3, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 15, -5,  3, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 50,  5,  3, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 50, -5, -3, 0, 0);
		BFGD A 0 BRIGHT A_FaceTarget;
		BFGD F 2 BRIGHT  A_PlaySound("weapons/bfgf", CHAN_AUTO);
		BFGD F 0 Bright A_recoil(15)	;
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  40,  7, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  40,  0, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  40, -7, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 15,  5, -3, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 15, -5,  3, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 50,  45,  3, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 50, -45, -3, 0, 0);
		BFGD A 0 BRIGHT A_FaceTarget;
		BFGD H 2 BRIGHT  A_PlaySound("weapons/bfgf", CHAN_AUTO);
		BFGD F 0 Bright A_recoil(15);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  0,  7, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  0,  0, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  0, -7, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 15,  5, -3, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 15, -5,  3, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 50,  5,  3, 0, 0);
		BFGD F 0 A_SpawnProjectile("MasterLaserBlaster", 50, -5, -3, 0, 0);
		Goto Missile;
	StandardFire:
		//TNT1 A 0 A_Jump(110, "Burstshot", "Lineofshots","HomingRefire");
		BFGD A 2 BRIGHT A_FaceTarget  ;
		BFGD H 2 BRIGHT  A_PlaySound("Zom/Shot",1,0.8);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  0,  7, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  0,  0, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  0, -7, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 15,  5, -3, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 15, -5,  3, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 50,  5,  3, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 50, -5, -3, 0, 0);
		BFGD A 0 BRIGHT A_FaceTarget ;
		BFGD F 2 BRIGHT  A_PlaySound("Zom/Shot",1,0.8);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  0,  27, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  0,  20, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  0, -27, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 15,  5, -23, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 15, -5,  23, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 50,  5,  23, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 50, -5, -23, 0, 0);
		BFGD A 0 BRIGHT A_FaceTarget;
		BFGD F 2 BRIGHT  A_PlaySound("Zom/Shot",1,0.8);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  0,  7, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  0,  0, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  0, -7, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 15,  5, -3, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 15, -5,  3, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 50,  5,  3, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 50, -5, -3, 0, 0);
		BFGD A 0 BRIGHT A_FaceTarget;
		BFGD F 2 BRIGHT  A_PlaySound("Zom/Shot",1,0.8);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  20,  27, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  20,  20, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  20, -27, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 15,  25, -23, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 15, -25,  23, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 50,  5,   23, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 50, -5,  -23, 0, 0);
		BFGD A 0 BRIGHT A_FaceTarget;
		BFGD F 2 BRIGHT  A_PlaySound("Zom/Shot",1,0.8);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  0,  7, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  0,  0, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 33,  0, -7, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 15,  5, -3, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 15, -5,  3, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 50,  5,  3, 0, 0);
		BFGD F 0 A_SpawnProjectile("CZomBullet", 50, -5, -3, 0, 0);
		TNT1 A 0 A_CheckSight("See");
		Goto StandardFire+2;
	Pain:
		BFGD I 3;
		BFGD I 3 A_Pain;
		TNT1 A 0 a_playsound ("monsters/bosshurt",0);
		Goto See;
	Death:
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		BFGD J 10 A_Scream;
		BFGD J 10 A_NoBlocking;
		BFGD K 5 ;
		BFGD K 5 ;
		BFGD L 5;
		BFGD L 5 A_BossDeath;  //A_SpawnItem;
		TNT1 A 1 Bright A_Spawnitemex("FlyingSpiderMind",5,-10,6,0,0,0,0, SXF_NOPOINTERS|SXF_NOCHECKPOSITION);
		BFGD M 5 A_Fadeout(0.9);
		BFGD M 5 A_Fadeout(0.8);
		BFGD N 5 A_Fadeout(0.7);
		BFGD O 5 A_Fadeout(0.6);
		BFGD P 5 A_Fadeout(0.5);
		BFGD Q 5 A_Fadeout(0.4);
		BFGD R 5 A_Fadeout(0.3);
		BFGD R 5 A_Fadeout(0.2);
		BFGD S 10 A_Fadeout(0.1) ;
		BFGD S 10 A_Fadeout(0);
		BFGD S -1 ;
		stop;
	Crush:
		POL5 EEEEE 1 ;
		POL5 E -1;
		Stop;
  }
}
Class FlyingSpiderMind : Actor
{
	Default
	{
    Health 3500;
    Radius 40;
    Height 95;
    Speed 8;
    PainChance 10;
    Mass 1000;
    MONSTER;
	DamageFactor "Heroic", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	DropItem "ArgChaingun";
	DamageFactor "ArgPlayerRocket", 0.66;
	DamageFactor "ArgCyberRocket" , 0.5;
	DropItem "MiniAmmoPackDropChecker" ;
    DropItem "MiniAmmoPackDropChecker", 128;
	DropItem "MiniHealthSphereDropChecker", 128;
    DropItem "MiniArmorSphereDropChecker", 128;
    DropItem "BossBonusBackpackDropChecker", 128;
	DropItem "MediumMedPackDropChecker", 128 ;
	+NOBLOCKMONST;
    +BOSS;
    +NOGRAVITY;
    +FLOAT;
    +FLOATBOB;
    //+NORADIUSDMG;
    +DONTMORPH;
    +MISSILEMORE;
	PainSound "monsters/bosshurt";
    SeeSound "fiend/see";
    DeathSound "BFGDer/death";
    Obituary "%o was mangled by the Supreme Fiend.";
    }
	States
    {
    Spawn:
		SUPR A 4 A_Look;
		Loop;
    See:
		SUPR H 0 A_ChangeFlag("shootable",1);
		SUPR A 0 A_PlaySound("fiend/hover");
		SUPR AAAA 2 A_Chase;
		Loop;
    Missile:
		SUPR B 0 A_Jump(256, "StandardFire", "StandardFire", "StandardFire", "DeathLaserGalore", "ARoundOfSplitsForYou","BOMBSAHOY","BOMBERAHOY");
	StandardFire:
		SUPR B 0 A_PlaySound("fiend/hover"); //Plasma;
		SUPR B 8 bright A_FaceTarget;
		SUPR B 0 A_PlaySound("fiend/hover");
		SUPR F 2 BRIGHT  ;
		SUPR F 1 BRIGHT A_PlaySound("Zom/Shot",1,0.8);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  0,  7, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  0,  0, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  0, -7, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 15,  5, -3, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 15, -5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 50,  5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 50, -5, -3, 0, 0);
		SUPR F 0 BRIGHT A_FaceTarget;
		SUPR F 1 BRIGHT A_PlaySound("Zom/Shot",1,0.8);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  0,  27, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  0,  20, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  0, -27, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 15,  5, -23, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 15, -5,  23, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 50,  5,  23, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 50, -5, -23, 0, 0);
		SUPR F 0 BRIGHT A_FaceTarget  ;
		SUPR F 1 BRIGHT A_PlaySound("Zom/Shot",1,0.8);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  0,  7, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  0,  0, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  0, -7, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 15,  5, -3, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 15, -5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 50,  5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 50, -5, -3, 0, 0);
		SUPR F 0 BRIGHT A_FaceTarget;
		SUPR F 1 bright A_PlaySound("Zom/Shot",1,0.8);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  20,  27, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  20,  20, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  20, -27, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 15,  25, -23, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 15, -25,  23, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 50,  5,   23, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 50, -5,  -23, 0, 0);
		SUPR F 0 BRIGHT A_FaceTarget  ;
		SUPR F 1 BRIGHT A_PlaySound("Zom/Shot",1,0.8);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  0,  7, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  0,  0, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 33,  0, -7, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 15,  5, -3, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 15, -5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 50,  5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("CZomBullet", 50, -5, -3, 0, 0);
		TNT1 A 0 A_CheckSight("See");
		Goto StandardFire;
	DeathLaserGalore:
		SUPR A 2 BRIGHT A_FaceTarget  ;
		SUPR H 2 BRIGHT  A_PlaySound("weapons/bfgf", CHAN_AUTO);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  0,  7, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  0,  0, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  0, -7, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 15,  5, -3, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 15, -5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 50,  5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 50, -5, -3, 0, 0);
		SUPR F 0 BRIGHT A_FaceTarget;
		SUPR F 2 BRIGHT  A_PlaySound("weapons/bfgf", CHAN_AUTO)	;
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  40,  7, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  40,  0, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  40, -7, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 15,  5, -3, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 15, -5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 50,  45,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 50, -45, -3, 0, 0);
		SUPR F 0 BRIGHT A_FaceTarget;
		SUPR F 2 BRIGHT  A_PlaySound("weapons/bfgf", CHAN_AUTO);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  0,  7, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  0,  0, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 33,  0, -7, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 15,  5, -3, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 15, -5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 50,  5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("MasterLaserBlaster", 50, -5, -3, 0, 0);
		Goto Missile;
	ARoundOfSplitsForYou:
		SUPR A 2 BRIGHT A_FaceTarget  ;
		SUPR H 2 BRIGHT  A_PlaySound("Zom/Shot",1,0.8);
		SUPR F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0,  7, 0, 0);
		SUPR F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0,  0, 0, 0);
		SUPR F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0, -7, 0, 0);
		SUPR F 0 A_SpawnProjectile("AracknightMissileSplitter5x", 15,  5, -3, 0, 0);
		SUPR F 0 A_SpawnProjectile("AracknightMissileSplitter5x", 15, -5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("ScatterShotSplitter2x", 50,  5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("ScatterShotSplitter2x", 50, -5, -3, 0, 0);
		SUPR F 0 BRIGHT A_FaceTarget;
		SUPR F 2 BRIGHT  A_PlaySound("Zom/Shot",1,0.8);
		SUPR F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0,  27, 0, 0);
		SUPR F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0,  20, 0, 0);
		SUPR F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0, -27, 0, 0);
		SUPR F 0 A_SpawnProjectile("AracknightMissileSplitter5x", 15,  5, -23, 0, 0);
		SUPR F 0 A_SpawnProjectile("AracknightMissileSplitter5x", 15, -5,  23, 0, 0);
		SUPR F 0 A_SpawnProjectile("ScatterShotSplitter2x", 50,  5,  23, 0, 0);
		SUPR F 0 A_SpawnProjectile("ScatterShotSplitter2x", 50, -5, -23, 0, 0);
		SUPR F 0 BRIGHT A_FaceTarget;
		SUPR H 2 BRIGHT  A_PlaySound("Zom/Shot",1,0.8);
		SUPR F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0,  7, 0, 0);
		SUPR F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0,  0, 0, 0);
		SUPR F 0 A_SpawnProjectile("ArachnoPlasmaSplitter2x", 33,  0, -7, 0, 0);
		SUPR F 0 A_SpawnProjectile("AracknightMissileSplitter5x", 15,  5, -3, 0, 0);
		SUPR F 0 A_SpawnProjectile("AracknightMissileSplitter5x", 15, -5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("ScatterShotSplitter2x", 50,  5,  3, 0, 0);
		SUPR F 0 A_SpawnProjectile("ScatterShotSplitter2x", 50, -5, -3, 0, 0);
		Goto Missile;
	BOMBERAHOY:
		SUPR B 8 bright A_FaceTarget;
		SUPR F 2 bright A_SpawnProjectile ("ImpFireBallBOOM", 30, 0, 0);
		SUPR E 2 bright;
		SUPR B 1 bright A_SpidRefire;
		SUPR F 2 bright A_SpawnProjectile ("ImpFireBallBOOM", 30, 0, 0);
		SUPR E 2 bright;
		SUPR B 1 bright A_SpidRefire;
		SUPR F 2 bright A_SpawnProjectile ("ImpFireBallBOOM", 30, 0, 0);
		SUPR E 2 bright;
		SUPR B 1 bright A_SpidRefire;
		SUPR F 2 bright A_SpawnProjectile ("ImpFireBallBOOM", 30, 0, 0);
		SUPR E 2 bright;
		SUPR B 1 bright A_SpidRefire;
		SUPR F 2 bright A_SpawnProjectile ("ImpFireBallBOOM", 30, 0, 0);
		SUPR E 2 bright;
		SUPR B 1 bright A_SpidRefire;
		SUPR F 2 bright A_SpawnProjectile ("ImpFireBallBOOM", 30, 0, 0);
		goto Missile;
	//yeah no never ever ever gonna give an enemy a bfg.;
		/*SUPR B 0 A_PlaySound("fiend/hover") //BFG;
		SUPR B 8 bright A_FaceTarget;
		SUPR B 0 A_PlaySound("fiend/hover");
		SUPR B 5 bright A_FaceTarget;
		SUPR B 10 bright A_PlayWeaponSound ("fiend/bfg");
		SUPR E 10 bright A_FaceTarget;
		SUPR F 10 bright A_SpawnProjectile ("BFGBall", 30, 0, 0);
		goto See*/
	BOMBSAHOY:
		SUPR B 10 bright A_FaceTarget;
		SUPR B 0 A_PlayWeaponSound("fiend/bomb");
		SUPR O 20 bright A_FaceTarget;
		SUPR P 20 bright A_FaceTarget;
		SUPR Q 20 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 10 bright A_FaceTarget;
		SUPR Q 0 A_DualPainAttack ("RemoteBomb");
		SUPR Q 0 A_PlayWeaponSound("fiend/bomb");
		SUPR Q 20 bright A_FaceTarget;
		SUPR P 20 bright A_FaceTarget;
		SUPR O 20 bright A_FaceTarget;
		goto See;
	Death:
		TNT1 A 0 A_JumpIfInTargetInventory("SuperMissileAcquired",1,"DeathSuperMissile");
		TNT1 A 0 A_JumpIfInTargetInventory("PowerBombAcquired",1,"DeathPowerBomb");
		TNT1 A 0 A_Spawnitemex("SetASpiderMasterMindModItemDropper",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		goto ContinueDeath;
	DeathSuperMissile:
		TNT1 A 0 A_JumpIfInTargetInventory("PowerBombAcquired",1,"DeathBoth");
		TNT1 A 0 A_SpawnItemEx("SetBSpiderMasterMindModItemDropper",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		goto ContinueDeath;
	DeathPowerBomb:
		TNT1 A 0 A_SpawnItemEx("SetCSpiderMasterMindModItemDropper",random(-100,100),random(-100,100),random(10,100),0,0,0,0,32,32);
		goto ContinueDeath;
	DeathBoth:
		TNT1 A 0 A_SpawnItemEx("SetDSpiderMasterMindModItemDropper",random(-100,100),random(-100,100),random(10,100),0,0,0,0,32,32);
		goto ContinueDeath;
	ContinueDeath:
		TNT1 A 0 A_ChangeFlag("shootable",0);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("GenericExplosionTosser",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("GenericExplosionTosser",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("GenericExplosionTosser",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		SUPR G 0 A_ChangeFlag ("FLOATBOB",0);
		SUPR G 10 A_Scream;
		SUPR H 4;
		SUPR H 6;
		SUPR I 10 A_Fall;
		SUPR JKLM 10;
		SUPR N -1 A_BossDeath;
		Stop;
    }
}
Class SpidermindLand : Spidermind
{
	Default
	{
	health 6000;
	}
	States
    {
		Death:
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		BFGD J 10 A_Scream;
		BFGD J 10 A_NoBlocking;
		BFGD K 5 ;
		BFGD K 5 ;
		BFGD L 5;
		BFGD L 5 A_BossDeath  ;
		BFGD M 5 ;
		BFGD M 5 ;
		BFGD N 5 ;
		BFGD O 5 ;
		BFGD P 5 ;
		BFGD Q 5;
		BFGD R 5 ;
		BFGD R 5 ;
		BFGD S 5 ;
	DeathSuperMissile:
		TNT1 A 0 A_JumpIfInTargetInventory("PowerBombAcquired",1,"DeathBoth");
		TNT1 A 0 A_SpawnItemEx("SetBSpiderMasterMindModItemDropper",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		goto ContinueDeath;
	DeathPowerBomb:
		TNT1 A 0 A_SpawnItemEx("SetCSpiderMasterMindModItemDropper",random(-100,100),random(-100,100),random(10,100),0,0,0,0,32,32);
		goto ContinueDeath;
	DeathBoth:
		TNT1 A 0 A_SpawnItemEx("SetDSpiderMasterMindModItemDropper",random(-100,100),random(-100,100),random(10,100),0,0,0,0,32,32);
		goto ContinueDeath;
	ContinueDeath:
		TNT1 A 0 A_ChangeFlag("shootable",0);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		
		TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		
		TNT1 AAAAA 0 A_Spawnitemex("GenericExplosionTosser",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("GenericExplosionTosser",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("GenericExplosionTosser",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		
		BFGD S -1 ;
		stop;
		}
	}