//this is a test line;

////////////////;
// Pinkie     //;
////////////////;

Class Pinkie : DemonModStatesinheritor
{
	
	Default 
	{	 
	Health 150;
	PainChance 180;
	Speed 15;
	Radius 30;
	Height 56;
	Mass 400;
	Monster;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	DamageFactor "Wrangler", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	-THRUSPECIES;
	+NOBLOCKMONST;
	+FLOORCLIP ;
	+FASTER ;
	+FASTMELEE;
	//+MissileMore;
	SeeSound "demon/sight";
	AttackSound "demon/melee";
	PainSound "demon/pain";
	DeathSound "demon/death";
	ActiveSound "demon/active";
	Obituary "$OB_DEMONHIT";
	Dropitem "DemonModItemDropper";
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
			MAUD BA 10 A_Look;
			Loop;
		See:
			MAUD A 0 A_PlaySoundEx("demonstep/demonwalk1", "SoundSlot7", 0);
			MAUD A 0 A_CheckBlock("WeakLeapAttack");
			MAUD AABBCCDD 2 A_Chase;
			Loop;
		Missile:
			TNT1 A 0 A_JumpIfCloser(750, "MissileDecider");
			goto see;
		MissileDecider:
			TNT1 A 0 A_Jump(256, "see", "WeakLeapAttack");
		Melee:
			TNT1 A 0 A_Jump(256,  "Standard", "QuickBite", "WeakLeapAttack", "WeakLeapAttack");
		QuickBite:
			MAUD EF 3 A_FaceTarget;
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			Goto See;
		Standard:
			MAUD EF 8 A_FaceTarget;
			MAUD G 8 A_SargAttack;
			Goto See;
		WeakLeapAttack:
			MAUD A 6 A_FaceTarget;
			MAUD A 0 A_PlaySound("demon/sight");
			MAUD E 3 A_ChangeVelocity(14,0,8,CVF_RELATIVE);
			MAUD E 0 ThrustThing(angle*256/360, 3, 1, 0);
			MAUD E 0 ThrustThingZ(0,2,0,1);
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			Goto See;
		Pain:
			TNT1 A 0 ;
			MAUD H 2;
			MAUD H 2 A_Pain;
			TNT1 A 0 a_playsound ("monsters/midhurt",0);
			TNT1 A 0 A_Jump(60, "WeakLeapAttack");
			Goto See;
		Death:
			TNT1 A 0 a_spawnitemex ("DemonModItemDropper",0,0,35);
			TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			MAUD H 0 ;
			MAUD I 8 ;
			MAUD J 8 A_Scream;
			MAUD K 4;
			MAUD L 4 A_NoBlocking;
			MAUD M 4 ;
			MAUD N -1;
			Stop;
		XDeath:
			TNT1 A 0 a_spawnitemex ("DemonModItemDropper",0,0,35);
			TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 A 0 A_PlaySound("MainGore/MonGoBoom",CHAN_AUTO);
			TNT1 A 0 A_PlaySound("MainGore/MonGoBoom2",CHAN_AUTO);
			TNT1 A 0 A_Scream;
			TNT1 AAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			XMED A 0 A_NoBlocking;
			XMED B 5;
			XMED C 5 A_XScream;
			XMED D 5 ;
			XMED E -1;
			stop;
		Crush:
			POL5 EEEEE 1 ;
			POL5 E -1;
			Stop;
	
		Raise:
			MAUD N 5;
			MAUD MLKJI 5;
			Goto See;
	}
}

Class PinkieAltBrown : Pinkie
{
	Default 
	{
	Health 150;
	PainChance 180;
	Speed 16;
	Radius 30;
	Height 56;
	Mass 400;
	Monster;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	DamageFactor "Wrangler", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	translation "32:47=74:79", "168:191=64:79";
	+NOBLOCKMONST;
	+FLOORCLIP ;
	+FASTER ;
	+FASTMELEE;
	+MissileMore;
	SeeSound "demon/sight";
	AttackSound "demon/melee";
	PainSound "demon/pain";
	DeathSound "demon/death";
	ActiveSound "demon/active";
	Obituary "$OB_DEMONHIT";
	Dropitem "DemonModItemDropper";
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
			MAUD BA 10 A_Look;
			Loop;
		See:
			MAUD A 0 A_PlaySoundEx("demonstep/demonwalk1", "SoundSlot7", 0);
			MAUD A 0 A_CheckBlock("WeakLeapAttack");
			MAUD AABBCCDD 2 A_Chase;
			Loop;
		Missile:
			TNT1 A 0 A_JumpIfCloser(2500, "MissileDecider");
			goto see;
		MissileDecider:
			TNT1 A 0 A_Jump(256, "see", "WeakLeapAttack", "WeakHighLeapAttack");
		Melee:
			TNT1 A 0 A_Jump(256, "Standard", "QuickBite", "WeakLeapAttack", "WeakLeapAttack", "WeakHighLeapAttack");
		QuickBite:
			MAUD EF 3 A_FaceTarget;
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			Goto See;
		Standard:
			MAUD EF 8 A_FaceTarget;
			MAUD G 8 A_SargAttack;
			Goto See;
		WeakHighLeapAttack:
			MAUD A 6 A_FaceTarget;
			MAUD A 0 A_PlaySound("demon/sight");
			MAUD E 3 A_ChangeVelocity(14,0,16,CVF_RELATIVE);
			MAUD E 0 ThrustThing(angle*256/360, 3, 1, 0);
			MAUD E 0 ThrustThingZ(0,2,0,1);
			MAUD F 0 A_Recoil(-2);
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			Goto See;
		WeakLeapAttack:
			MAUD A 6 A_FaceTarget;
			MAUD A 0 A_PlaySound("demon/sight");
			MAUD E 3 A_ChangeVelocity(14,0,8,CVF_RELATIVE);
			MAUD E 0 ThrustThing(angle*256/360, 3, 1, 0);
			MAUD E 0 ThrustThingZ(0,2,0,1);
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			Goto See;
		Pain:
			MAUD H 2;
			MAUD H 2 A_Pain;
			TNT1 A 0 a_playsound ("monsters/midhurt",0);
			TNT1 A 0 A_Jump(60, "WeakLeapAttack");
			Goto See;
	}
}

Class PinkieAltDarkGreen : Pinkie
{
	Default 
	{
	Health 150;
	PainChance 180;
	Speed 20;
	Radius 30;
	Height 56;
	Mass 400;
	Monster;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	DamageFactor "Wrangler", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	translation "168:191=112:127", "32:47=122:127";
	+NOBLOCKMONST;
	+FLOORCLIP ;
	+FASTER ;
	+FASTMELEE;
	+MissileMore;
	SeeSound "demon/sight";
	AttackSound "demon/melee";
	PainSound "demon/pain";
	DeathSound "demon/death";
	ActiveSound "demon/active";
	Obituary "$OB_DEMONHIT";
	Dropitem "DemonModItemDropper";
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
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
		MAUD BA 10 A_Look;
		Loop;
	See:
		TNT1 A 0 A_PlaySound ("demonstep/demonwalk1", 1.0, 1, 0, 2.5);
		MAUD A 0 A_CheckBlock("WeakLeapAttack");
		MAUD AABBCCDD 2 A_Chase;
		Loop;
	Missile:
		TNT1 A 0 A_JumpIfCloser(2500, "MissileDecider");
		goto see;
	MissileDecider:
		TNT1 A 0 A_Jump(256, "QuickBite", "RushNChomp");//"see", "RushNChomp", "WeakHighLeapAttack");
	Melee:
		TNT1 A 0 A_Jump(256,  "Standard", "RushNChomp", "RushNChomp", "WeakLeapAttack", "WeakHighLeapAttack");

		QuickBite:
			MAUD EF 3 A_FaceTarget;
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			TNT1 A 0 A_Jump(256, "See", "See", "RushNChomp");
		Standard:
			MAUD EF 8 A_FaceTarget;
			MAUD G 8 A_SargAttack;
			Goto See;
		RushNChomp:
			TNT1 A 0 A_PlaySound ("demonstep/demonwalk1", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-2);
			MAUD AAAAA 0 A_Spawnitemex("PinkieAltDarkGreenTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			MAUD A 1 fast A_Chase;
			MAUD EFG 0 A_CustomMeleeAttack((2), "baron/melee","demon/melee");
			MAUD E 0 A_ChangeVelocity(10,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			TNT1 A 0 A_PlaySound ("demonstep/demonwalk1", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-2);
			MAUD AAAAA 0 A_Spawnitemex("PinkieAltDarkGreenTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			MAUD A 1 fast A_Chase;
			MAUD EFG 0 A_CustomMeleeAttack((2));
			MAUD E 0 A_ChangeVelocity(10,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			TNT1 A 0 A_PlaySound ("demonstep/demonwalk1", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-1);
			MAUD AAAAA 0 A_Spawnitemex("PinkieAltDarkGreenTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			MAUD A 1 fast A_Chase;
			MAUD EFG 0 A_CustomMeleeAttack((2));
			MAUD E 0 A_ChangeVelocity(10,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			TNT1 A 0 A_PlaySound ("demonstep/demonwalk1", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-1);
			MAUD AAAA 0 A_Spawnitemex("PinkieAltDarkGreenTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			MAUD A 1 fast A_Chase;
			MAUD EFG 0 A_CustomMeleeAttack((2), "baron/melee","demon/melee");
			MAUD E 0 A_ChangeVelocity(10,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			TNT1 A 0 A_PlaySound ("demonstep/demonwalk1", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-1);
			MAUD AAAA 0 A_Spawnitemex("PinkieAltDarkGreenTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			MAUD A 1 fast A_Chase;
			MAUD EFG 0 A_CustomMeleeAttack((2));
			MAUD E 0 A_ChangeVelocity(10,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			TNT1 A 0 A_PlaySound ("demonstep/demonwalk1", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-1);
			MAUD AAAA 0 A_Spawnitemex("PinkieAltDarkGreenTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			MAUD A 1 fast A_Chase;
			MAUD EFG 0 A_CustomMeleeAttack((2));
			MAUD E 0 A_ChangeVelocity(10,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			TNT1 A 0 A_PlaySound ("demonstep/demonwalk1", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-1);
			MAUD AAAA 0 A_Spawnitemex("PinkieAltDarkGreenTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			MAUD A 1 fast A_Chase;
			MAUD EFG 0 A_CustomMeleeAttack((2), "baron/melee","demon/melee");
			MAUD E 0 A_ChangeVelocity(10,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			TNT1 A 0 A_PlaySound ("demonstep/demonwalk1", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-1);
			MAUD AAAA 0 A_Spawnitemex("PinkieAltDarkGreenTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			MAUD A 1 fast A_Chase;
			MAUD EFG 0 A_CustomMeleeAttack((2));
			MAUD E 0 A_ChangeVelocity(10,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			Goto See;
		WeakHighLeapAttack:
			MAUD A 6 A_FaceTarget;
			MAUD A 0 A_PlaySound("demon/sight");
			MAUD E 3 A_ChangeVelocity(14,0,16,CVF_RELATIVE);
			MAUD E 0 ThrustThing(angle*256/360, 3, 1, 0);
			MAUD E 0 ThrustThingZ(0,2,0,1);
			MAUD F 0 A_Recoil(-2);
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			TNT1 A 0 A_Jump(60, "RushNChomp");
			Goto See;
		WeakLeapAttack:
			MAUD A 6 A_FaceTarget;
			MAUD A 0 A_PlaySound("demon/sight");
			MAUD E 3 A_ChangeVelocity(14,0,8,CVF_RELATIVE);
			MAUD E 0 ThrustThing(angle*256/360, 3, 1, 0);
			MAUD E 0 ThrustThingZ(0,2,0,1);
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			MAUD G 2 A_CustomMeleeAttack((6), "baron/melee","demon/melee");
			TNT1 A 0 A_Jump(60, "RushNChomp");
			Goto See;
	Pain:
  		TNT1 A 0 ;
		MAUD H 2;
		MAUD H 2 A_Pain;
		TNT1 A 0 a_playsound ("monsters/midhurt",0);
		TNT1 A 0 A_Jump(60, "WeakHighLeapAttack");
		Goto See;
	}
}