Class ReveNAHHHHHHHHHH : RevenantModStatesinheritor
{
	Default
	{
	Health 350;
	Radius 20;
	Height 56;
	Mass 500;
	Speed 12;
	PainChance 100;
	Monster;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	DamageFactor "Scrapper", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	+NOBLOCKMONST;
	+MISSILEMORE ;
	+FLOORCLIP;
	+NOINFIGHTING;
	-THRUSPECIES;
	SeeSound "skeleton/sight";
	PainSound "skeleton/pain";
	DeathSound "skeleton/death";
	ActiveSound "skeleton/active";
	MeleeSound "skeleton/melee";
	HitObituary "$OB_UNDEADHIT";
	Obituary "$OB_UNDEAD";
	DropItem "RevenantModItemDropper";
	DropItem "PBHellishMissileLauncherChanceDropper", 96 ;
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
		//TNT1 A 0 A_SpawnItemEx("HeadshotTargetRevenant", 0,0,64, 0,0,0, 0, SXF_SETMASTER)  ;
	SpawnContinue:
		GHUL AB 10 A_Look;
		Loop;
	See:
		GHUL AABBCCDDEEFF 2 A_Chase;
		Loop;
	Melee:
		TNT1 A 0 A_Jump(256, "StandardPunch", "StandardPunch", "StandardPunch", "AOneATwoADeckForYou");//  StandardPunch  AOneATwoADeckForYou;
	StandardPunch:
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 3 A_FaceTarget;
		GHUL I 3 A_CustomMeleeAttack((8),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		Goto See;
	AOneATwoADeckForYou:
		GHUL G 5 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL G 6 A_FaceTarget;
		GHUL H 4 A_Recoil(-4);
		GHUL I 4 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",True);
			}
		GHUL G 6 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 3 A_ChangeVelocity(14,0,4,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL I 2 
			{
			A_CustomMeleeAttack((7),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL G 3 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 3 A_ChangeVelocity(14,0,8,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL I 2 
			{
			A_CustomMeleeAttack((10),"Explode/Basic","skeleton/swing","MonsterBeatEmUp");
			A_radiusthrust (7000,30,RTF_NOIMPACTDAMAGE);
			A_ChangeFlag("SPRITEFLIP",True);
			}
		GHUL I 7 A_FaceTarget;
		GHUL H 6 A_PlaySound("skeleton/active");
		GHUL G 6 A_FaceTarget;
		GHUL F 6 A_Recoil(4);
		Goto See;
	Missile: //Homing;
		TNT1 A 0 A_Jump(256, "StandardShot", "StandardShot", "StandardShot","HomingShot");
	HomingShot:
		GHUL J 0 A_Jump(128,"StandardShot");
		GHUL J 1 BRIGHT A_FaceTarget ;
		GHUL J 9 BRIGHT A_FaceTarget;
		GHUL K 1 A_SpawnProjectile("RevRocketHoming",50,20,0,0);
		GHUL K 1; //A_SpawnProjectile("RevenantTracer2B",50,-20,0,0);
		GHUL K 14 A_FaceTarget;
		GHUL K 10 A_FaceTarget;
		Goto See;
	StandardShot:
		GHUL J 9 BRIGHT A_FaceTarget		;
		GHUL K 1 A_SpawnProjectile("RevRocketStandard",50,20,0,0);
		//yeah no too cheap in already projectile heavy enviroment.;
		//GHUL K 1 A_SpawnProjectile("RevenantTracer1B",50,-20,0,0);
		GHUL K 12 A_FaceTarget;
		Goto See;
	Pain:
		GHUL L 5;
		GHUL L 5 A_Pain;
		TNT1 A 0 a_playsound ("monsters/midhurt",0);
		Goto See;
	Death:
		TNT1 A 0 a_spawnitemex ("RevenantModItemDropper",0,0,35);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		GHUL LM 7 ;
		GHUL N 7 A_Scream;
		GHUL O 7 A_NoBlocking;
		GHUL P 7;
		GHUL Q -1;
		Stop;
	XDeath:
		TNT1 A 0 a_spawnitemex ("RevenantModItemDropper",0,0,35);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 A 0 A_PlaySound("MainGore/MonGoBoom",CHAN_AUTO);
		TNT1 A 0 A_Scream;
		TNT1 AAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		XMED A 5 A_Stop;
		XMED B 5 ;
		XMED C 5 A_BossDeath  ;
		XMED D 5 A_NoBlocking;
		XMED E 5;
		TNT1 A 0 ;
		XMED E -1;
		Stop;
	Crush:
		XMED EEEEE 1;
		XMED E -1;
		Stop		;
	Raise:
		GHUL Q 5;
		GHUL PONML 5;
		Goto See;
	}
}
Class ReveNREEEEN : ReveNAHHHHHHHHHH
{
	Default
	{
	Health 350;
	Radius 20;
	Height 56;
	Mass 500;
	Speed 15;
	PainChance 100;
	Monster;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	DamageFactor "Scrapper", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	+NOBLOCKMONST;
	+MISSILEMORE ;
	+FLOORCLIP;
	+NOINFIGHTING ;
	SeeSound "skeleton/sight";
	PainSound "skeleton/pain";
	DeathSound "skeleton/death";
	ActiveSound "skeleton/active";
	MeleeSound "skeleton/melee";
	HitObituary "$OB_UNDEADHIT";
	Obituary "$OB_UNDEAD";
	translation "16:47=152:159", "2:2=127:127", "255:255=152:152", "184:185=157:157", "164:167=157:157";
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "RevenantModItemDropper";
	DropItem "PBHellishMissileLauncherChanceDropper", 96 ;
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
		//TNT1 A 0 A_SpawnItemEx("HeadshotTargetRevenant", 0,0,64, 0,0,0, 0, SXF_SETMASTER)  ;
	SpawnContinue:
		GHUL AB 10 A_Look;
		Loop;
	See:
		GHUL AABBCCDDEEFF 2 A_Chase;
		Loop;
	Melee:
		TNT1 A 0 A_Jump(256, "StandardPunch", "StandardPunch", "ATATATYouGetThePunch", "AOneATwoADeckForYou");//  StandardPunch  AOneATwoADeckForYou;
	AOneATwoADeckForYou:
		GHUL G 5 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL G 6 A_FaceTarget;
		GHUL H 4 A_Recoil(-4);
		GHUL I 4 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",True);
			}
		GHUL G 6 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 3 A_ChangeVelocity(14,0,4,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL I 2 
			{
			A_CustomMeleeAttack((7),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL G 3 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 3 A_ChangeVelocity(14,0,8,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL I 2 
			{
			A_CustomMeleeAttack((10),"Explode/Basic","skeleton/swing","MonsterBeatEmUp");
			A_radiusthrust (7000,30,RTF_NOIMPACTDAMAGE);
			A_ChangeFlag("SPRITEFLIP",True);
			}
		GHUL I 7 A_FaceTarget;
		GHUL H 6 A_PlaySound("skeleton/active");
		GHUL G 6 A_FaceTarget;
		GHUL F 6 A_Recoil(4);
		Goto See;
	ATATATYouGetThePunch:
		GHUL F 3 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/active");
		GHUL GHI 6 
			{
			A_FaceTarget();
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL GHI 6 
			{
			A_FaceTarget();
			A_ChangeFlag("SPRITEFLIP",True);
			}
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL GHI 5
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 4 A_Recoil(-4);
		GHUL I 4 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 3 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 4 A_Recoil(-4);
		GHUL I 4 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",TRUE);
			}
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 4 A_Recoil(-4);
		GHUL I 3 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 4 A_Recoil(-4);
		GHUL I 3 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 2 A_Recoil(-4);
		GHUL I 2 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 2 A_Recoil(-4);
		GHUL I 2 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",TRUE);
			}
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",TRUE);
			}
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",TRUE);
			}
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL J 0 A_Jump(70,"BigAngySkellyJumpsAtYou");
		Goto See;
	StandardPunch:
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 3 A_FaceTarget;
		GHUL I 3 A_CustomMeleeAttack((8),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		Goto See;
	Missile: //Homing;
		TNT1 A 0 A_Jump(256, "StandardShot", "StandardShot", "StandardShot","HomingShot");
	HomingShot:
		GHUL J 0 A_Jump(128,"StandardShot");
		GHUL J 1 BRIGHT A_FaceTarget ;
		GHUL J 9 BRIGHT A_FaceTarget;
		GHUL K 1 A_SpawnProjectile("RevRocketHoming",50,20,0,0);
		GHUL K 1 ;
		GHUL K 18 A_FaceTarget;
		GHUL K 10 A_FaceTarget;
		Goto See;
	StandardShot:
		GHUL J 0 A_Jump(35,"ClusterShot","ClusterShot","BigAngySkellyJumpsAtYou");
		GHUL J 9 BRIGHT A_FaceTarget		;
		GHUL K 1 A_SpawnProjectile("RevRocketStandard",50,20,0,0);
		GHUL K 18 A_FaceTarget;
		Goto See;
	ClusterShot:
		GHUL J 9 BRIGHT A_FaceTarget		;
		GHUL K 1 A_SpawnProjectile("MidSpeedShottyZombGrenadeCluster",50,20,0,0);
		GHUL K 18 A_FaceTarget;
		Goto See;
	Pain:
		GHUL L 5;
		GHUL L 5 A_Pain;
		TNT1 A 0 a_playsound ("monsters/midhurt",0);
		Goto See;
	Death:
		GHUL LM 7;
		GHUL N 7 A_Scream;
		GHUL O 7 A_NoBlocking;
		GHUL P 7;
		GHUL Q -1;
		Stop;
	Raise:
		GHUL Q 5;
		GHUL PONML 5;
		Goto See;
	}
}
Class ReveNLUEEEE : ReveNAHHHHHHHHHH
{
	Default
	{
	Health 350;
	Radius 20;
	Height 56;
	Mass 500;
	Speed 20;
	PainChance 100;
	Monster;
	DamageFactor "Scrapper", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	+NOBLOCKMONST;
	+MISSILEMORE ;
	+FLOORCLIP;
	+NOINFIGHTING ;
	translation "16:47=194:199", "2:2=199:199", "255:255=195:195", "184:185=195:202", "164:167=195:195";
	SeeSound "skeleton/sight";
	PainSound "skeleton/pain";
	DeathSound "skeleton/death";
	ActiveSound "skeleton/active";
	MeleeSound "skeleton/melee";
	HitObituary "$OB_UNDEADHIT";
	Obituary "$OB_UNDEAD";
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "RevenantModItemDropper";
	DropItem "PBHellishMissileLauncherChanceDropper", 96 ;
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
		//TNT1 A 0 A_SpawnItemEx("HeadshotTargetRevenant", 0,0,64, 0,0,0, 0, SXF_SETMASTER)  ;
	SpawnContinue:
		GHUL AB 10 A_Look;
		Loop;
	See:
		GHUL AABBCCDDEEFF 2 A_Chase;
		Loop;
	Melee:
		TNT1 A 0 A_Jump(256, "StandardPunch", "AOneATwoADeckForYou", "ATATATYouGetThePunch", "BigAngySkellyJumpsAtYou");//  StandardPunch  AOneATwoADeckForYou;
	BigAngySkellyJumpsAtYou:
		GHUL D 6 A_FaceTarget;
		GHUL E 0 A_PlaySound("skeleton/sight");
		GHUL E 3 A_ChangeVelocity(14,0,8,CVF_RELATIVE);
		GHUL E 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL E 0 ThrustThingZ(0,2,0,1);
		GHUL F 0 A_Recoil(-2);
		GHUL GHI 2 A_CustomMeleeAttack((4),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL GHI 2 
			{
			A_CustomMeleeAttack((4),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL GHI 2 
			{
			A_CustomMeleeAttack((4),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",True);
			}
		Goto See;
	AOneATwoADeckForYou:
		GHUL G 5 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL G 6 A_FaceTarget;
		GHUL H 4 A_Recoil(-4);
		GHUL I 4 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",True);
			}
		GHUL G 6 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 3 A_ChangeVelocity(14,0,4,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL I 2 
			{
			A_CustomMeleeAttack((7),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL G 3 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 3 A_ChangeVelocity(14,0,8,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL I 2 
			{
			A_CustomMeleeAttack((10),"Explode/Basic","skeleton/swing","MonsterBeatEmUp");
			A_radiusthrust (7000,30,RTF_NOIMPACTDAMAGE);
			A_ChangeFlag("SPRITEFLIP",True);
			}
		GHUL I 7 A_FaceTarget;
		GHUL H 6 A_PlaySound("skeleton/active");
		GHUL G 6 A_FaceTarget;
		GHUL F 6 A_Recoil(4);
		Goto See;
	ATATATYouGetThePunch:
		GHUL F 3 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/active");
		GHUL GHI 6 
			{
			A_FaceTarget();
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL GHI 6 
			{
			A_FaceTarget();
			A_ChangeFlag("SPRITEFLIP",True);
			}
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL GHI 5
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 4 A_Recoil(-4);
		GHUL I 4 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 3 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 4 A_Recoil(-4);
		GHUL I 4 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",TRUE);
			}
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 4 A_Recoil(-4);
		GHUL I 3 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 4 A_Recoil(-4);
		GHUL I 3 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 2 A_Recoil(-4);
		GHUL I 2 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 2 A_Recoil(-4);
		GHUL I 2 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",TRUE);
			}
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",TRUE);
			}
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",FALSE);
			}
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",TRUE);
			}
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 1 A_ChangeVelocity(3,0,2,CVF_RELATIVE);
		GHUL H 0 ThrustThing(angle*256/360, 3, 1, 0);
		GHUL H 0 ThrustThingZ(0,2,0,1);
		GHUL H 1 A_Recoil(-4);
		GHUL I 1 
			{
			A_CustomMeleeAttack((3),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
			A_ChangeFlag("SPRITEFLIP",FALSE);	
			}
		GHUL J 0 A_Jump(70,"BigAngySkellyJumpsAtYou");
		Goto See;
	StandardPunch:
		GHUL G 1 A_FaceTarget;
		TNT1 A 0 A_PlaySound("skeleton/sight");
		GHUL H 3 A_FaceTarget;
		GHUL I 3 A_CustomMeleeAttack((8),"skeleton/melee","skeleton/swing","MonsterBeatEmUp");
		Goto See;
	Missile: //Homing;
		TNT1 A 0 A_Jump(256, "StandardShot", "StandardShot", "HomingShot", "ClusterShot");
	HomingShot:
		GHUL J 1 BRIGHT A_FaceTarget ;
		GHUL J 9 BRIGHT A_FaceTarget;
		GHUL K 1 A_SpawnProjectile("RevRocketHoming",50,20,0,0);
		GHUL K 1 ;
		GHUL K 18 A_FaceTarget;
		GHUL K 10 A_FaceTarget;
		Goto See;
	StandardShot:
		GHUL J 0 A_Jump(35,"ClusterShot");
		GHUL J 9 BRIGHT A_FaceTarget		;
		GHUL K 1 A_SpawnProjectile("RevRocketStandard",50,20,0,0);
		GHUL K 18 A_FaceTarget;
		Goto See;
	ClusterShot:
		GHUL J 9 BRIGHT A_FaceTarget		;
		GHUL K 1 A_SpawnProjectile("MidSpeedShottyZombGrenadeCluster",50,20,0,0);
		GHUL K 1 A_SpawnProjectile("MidSpeedShottyZombGrenadeCluster",50,20,-10,0);
		GHUL K 1 A_SpawnProjectile("MidSpeedShottyZombGrenadeCluster",50,20,10,0);
		GHUL K 18 A_FaceTarget;
		Goto See;
	Pain:
		GHUL L 5;
		GHUL L 5 A_Pain;
		TNT1 A 0 a_playsound ("monsters/midhurt",0);
		Goto See;
	Death:
		GHUL LM 7;
		GHUL N 7 A_Scream;
		GHUL O 7 A_NoBlocking;
		GHUL P 7;
		GHUL Q -1;
		Stop;
	Raise:
		GHUL Q 5;
		GHUL PONML 5;
		Goto See;
	}
}
// translation (blue) "16:47=247:240", "186:186=204:204" / (Green) "16:47=120:127", "186:186=9:9"