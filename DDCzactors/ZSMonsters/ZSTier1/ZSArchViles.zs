//this is a test line;
//#include decorate/Decoratives.dec;
Class MrArch : ArchVileModStatesinheritor
{
	Default
	{
	Health 750;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	radius 20;
	Species "ReViled";
	-THRUSPECIES;
    +DONTHARMSPECIES;
	+NOBLOCKMONST;
	//translation "168:191=128:143", "32:47=128:143", "208:231=9:12";
	SeeSound "vile/sight";
	PainSound "vile/pain";
	DeathSound "vile/death";
	ActiveSound "vile/active";
	MeleeSound "vile/stop";
	DamageFactor "Extinguishing", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	DamageFactor "NoHurtArch", 0.0;
	DropItem "MicroMedPackDropChecker", 128;
	DropItem "MicroMedPackDropChecker", 128;
	DropItem "MicroMedPackDropChecker", 128;
	DropItem "MiniMedPackDropChecker", 128;
	DropItem "MiniArmorSphereDropChecker", 128; 
	DropItem "MiniAmmoPackDropChecker", 128;
	DropItem "ArchvileModItemDropper";
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
		//TNT1 A 0 A_SpawnItemEx("HeadshotTargetArchDIAB", 0,0,53, 0,0,0, 0, SXF_SETMASTER) ;
	See:
	DiabloSee:
		//TNT1 A 0 A_PlaySound("vile/active",CHAN_AUTO);
		DIAB AABBCCDDEEFF 2 A_VileChase;
		Loop;
	SpawnContinue:
		DIAB AB 10 A_Look;
		Loop;
	Missile:
		DIAB G 0 A_Jump(256, "StandardVileAttack","StandardVileAttack","MrArchBomb","ISetFreeTheManyGhosts");
	StandardVileAttack:
		DIAB G 0 Bright A_VileStart;
		DIAB G 10 Bright A_FaceTarget;
		DIAB H 8 Bright A_VileTarget;
		DIAB IJKLMN 8 Bright A_FaceTarget;
		DIAB O 8 Bright A_VileAttack("vile/stop",(25),(25));
		DIAB P 20 Bright;
		Goto DiabloSee;
	ISetFreeTheManyGhosts:
		DIAB G 0 Bright A_FaceTarget;
		DIAB G 5 Bright A_FaceTarget;
		DIAB H 4 Bright A_FaceTarget;
		DIAB IJKLMN 4 Bright A_FaceTarget;
		DIAB OO 4 Bright A_DualPainAttack("ArchVileSpawnsWhispyGhostContainer");
		DIAB P 10 Bright;
		TNT1 A 0 A_Jump(10,"StandardVileAttack");
		Goto DiabloSee;
	MrArchBomb:
		DIAB G 0 Bright A_FaceTarget;
		DIAB G 5 Bright A_FaceTarget;
		DIAB H 4 Bright A_FaceTarget;
		TNT1 A 0 A_PlaySound("vile/sight",CHAN_AUTO);
		DIAB IJKLMN 4 Bright A_FaceTarget;
		DIAB O 0 Bright A_SpawnProjectile("ArchFlameBomb", (random(25,45)),  0, 20, 0, 0);
		DIAB O 0 Bright A_SpawnProjectile("ArchFlameBomb", (random(25,45)),  0, 10, 0, 0);
		DIAB O 0 Bright A_SpawnProjectile("ArchFlameBomb", (random(25,45)),  0, 0, 0, 0);
		DIAB O 0 Bright A_SpawnProjectile("ArchFlameBomb", (random(25,45)),  0, -10, 0, 0);
		DIAB O 4 Bright A_SpawnProjectile("ArchFlameBomb", (random(25,45)),  0, -20, 0, 0);
		DIAB P 10 Bright;
		TNT1 A 0 A_Jump(10,"StandardVileAttack");
		Goto DiabloSee;
	Heal:
		DIA2 A 10 Bright;
		Goto See;
	Pain:
		DIAB Q 5   ;
		DIAB Q 5 A_Pain;
		Goto DiabloSee;
	XDeath:
		TNT1 A 0 a_spawnitemex ("ZombiemanModItemDropper",0,0,35);
		XMED A 5 A_Stop;
		XMED B 5 A_XScream;
		XMED C 5 A_BossDeath;
		XMED D 5 A_NoBlocking;
		XMED E 5;
		XMED E -1;
		Stop;
	Death:
		TNT1 A 0 a_spawnitemex ("ArchVileModItemDropper",0,0,35);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 A 0 A_PlaySound("MainGore/MonGoBoom",CHAN_AUTO);
		TNT1 A 0 A_Scream;
		TNT1 AAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		DIAB Q 7;
		DIAB R 7 A_Scream;
		DIAB S 7 A_NoBlocking;
		DIAB TUVWXY 7;
		TNT1 A 0 ;
		DIAB Z -1;
		Stop;
	Crush:
		POL5 EEEEE 1 ;
		POL5 E -1;
		Stop	;
	}
}
Class ArchFlameBomb : Actor
{
	Default
	{
	Radius 3;
    Height 8;
    Speed 25;
    Scale 0.7;
	DamageType "MonsterBeatEmUp";
	DamageType "NoHurtArch";
	PROJECTILE;
	Species "ReViled";
    +DONTHARMSPECIES;
	+THRUGHOST;
	+DONTSPLASH;
	+GRENADETRAIL;
	-NOGRAVITY;
	+DEHEXPLOSION;
	+DoomBOUNCE;
	-SHOOTABLE;
	+CANBOUNCEWATER;
	+BOUNCEONACTORS;
	+USEBOUNCESTATE;
	+FORCERADIUSDMG;
	+ALLOWBOUNCEONACTORS;
    BounceCount 5;
    Bouncefactor 1;
	reactiontime 170;
	BounceSound "Vile/firecrkl";
	SeeSound "Meteor/Swoosh";
    DeathSound "Meteor/Hit";
	}
	States
	{
	Spawn:
	BombActive:
		ASMT ABC 0 Bright A_SpawnItemEx("ArchFlameBombTrailSpiral", 0, 0, 0, 0, 0, 0, 0, 128, 0);
		ASMT ABC 1 Bright A_SpawnItemEx("ArchFlameBombTrailNormal", 0, 0, 0, 0, 0, 0, 0, 128, 0);
		ASMT ABC 0 Bright A_SpawnItemEx("ArchFlameBombTrailSpiral",0,0,0,0,0,0,0,128);
		ASMT ABC 0 Bright A_CountDown;
		Loop;
	Bounce.Floor:
		ASMT ABC 0 Bright A_Explode((1),240,-XF_HURTSOURCE);
		ASMT ABC 0 Bright A_SpawnItemEx("ArchFlameBombTrailSpiral", 0, 0, 0, 0, 0, 0, 0, 128, 0);
		ASMT ABC 1 Bright A_SpawnItemEx("ArchFlameBombTrailNormal", 0, 0, 0, 0, 0, 0, 0, 128, 0);
		ASMT ABC 0 Bright A_SpawnItemEx("ArchFlameBombTrailSpiral",0,0,0,0,0,0,0,128);
		ASMT ABC 0 Bright A_CountDown;
		goto BombActive;
	Bounce.Ceiling:
		ASMT ABC 0 Bright A_Explode((1),240,-XF_HURTSOURCE);
		ASMT ABC 0 Bright A_SpawnItemEx("ArchFlameBombTrailSpiral", 0, 0, 0, 0, 0, 0, 0, 128, 0);
		ASMT ABC 1 Bright A_SpawnItemEx("ArchFlameBombTrailNormal", 0, 0, 0, 0, 0, 0, 0, 128, 0);
		ASMT ABC 0 Bright A_SpawnItemEx("ArchFlameBombTrailSpiral",0,0,0,0,0,0,0,128);
		ASMT ABC 0 Bright A_CountDown;
		goto BombActive;
	Bounce.Wall:
		ASMT ABC 0 Bright A_Explode((1),240,-XF_HURTSOURCE);
		ASMT ABC 0 Bright A_SpawnItemEx("ArchFlameBombTrailSpiral", 0, 0, 0, 0, 0, 0, 0, 128, 0);
		ASMT ABC 1 Bright A_SpawnItemEx("ArchFlameBombTrailNormal", 0, 0, 0, 0, 0, 0, 0, 128, 0);
		ASMT ABC 0 Bright A_SpawnItemEx("ArchFlameBombTrailSpiral",0,0,0,0,0,0,0,128);
		ASMT ABC 0 Bright A_CountDown;
		goto BombActive;
	Bounce.Class:
		ASMT ABC 0 Bright A_Explode((1),240,-XF_HURTSOURCE);
		ASMT ABC 0 Bright A_SpawnItemEx("ArchFlameBombTrailSpiral", 0, 0, 0, 0, 0, 0, 0, 128, 0);
		ASMT ABC 1 Bright A_SpawnItemEx("ArchFlameBombTrailNormal", 0, 0, 0, 0, 0, 0, 0, 128, 0);
		ASMT ABC 0 Bright A_SpawnItemEx("ArchFlameBombTrailSpiral",0,0,0,0,0,0,0,128);
		ASMT ABC 0 Bright A_CountDown;
		goto BombActive;
    Death:
		XPL1 D 0 bright A_PlaySound("weapons/hellex");
		XPL1 DDDDDDD 0 Bright A_SpawnItemEx("ArchBurningFlame", 0, 2, 0, (random(-50,50)), (random(-50,50)), (random(-50,50)), 30, 128, 0);
		XPL1 D 4 Bright A_Explode((8),240);
		XPL1 E 4 Bright;
		XPL1 F 4 Bright;
		Stop;
	}
}
Class ArchFlameBombTrailSpiral : Actor
{
	Default
	{
    Radius 1;
    Height 1;
    Speed 0 ;
    PROJECTILE;
    RENDERSTYLE "ADD";
    ALPHA 0.6;
	Scale 0.5;
    +NOCLIP;
	+ROLLSPRITE;
	reactiontime 5;
	}
    States
    {
    Spawn:
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		BFAS A 2 Bright A_SetRoll((roll + 20));
		BFAS A 0 Bright A_SetRoll((roll + 20));
		Stop       ;
    }
}
Class ArchFlameBombTrailNormal : Actor
{
	Default
	{
    Radius 1;
    Height 1;
    Speed 0 ;
    PROJECTILE;
    RENDERSTYLE "ADD";
    ALPHA 0.6;
	Scale 0.5;
    +NOCLIP;
	}
    States
    {
    Spawn:
     ASCF QRSTUVWXYZ 7 Bright;
     Stop       ;
    }
}
Class ArchBurningFlame : Actor
{
	Default
	{
	Health 0x7FFFFFFF;
    Radius 16;
	Height 56;
    Speed 0 ;
    ALPHA 0.6;
	Scale 0.7;
	Monster;
	DamageType "MonsterBeatEmUp";
	DamageType "NoHurtArch";
	SeeSound "Vile/firecrkl";
	reactiontime 120;
	Species "ReViled";
    +DONTHARMSPECIES;
	-COUNTKILL;
	+NOCLIP;
	-NOGRAVITY;
	}
    States
    {
    Spawn:
		FIRE A 2 Bright A_Explode((2),240, XF_NOTMISSILE);
		FIRE BAB 2 Bright A_Explode((2),240, XF_NOTMISSILE);
		FIRE C 2 Bright A_Explode((2),240, XF_NOTMISSILE);
		FIRE BCBCDCDCDEDED 2 Bright A_CountDown;
		loop;
	Death:
		FIRE BCBCDCDCDEDED 2 Bright ;
		FIRE E 2 Bright ;
		FIRE FEFEFGHGHGH 2 Bright ;
		Stop;
    }
}