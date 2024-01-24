Class LSoul : LostSoulModStatesinheritor
{
	Default
	{
	Health 100;
	Radius 16;
	Height 56;
	Mass 50;
	Speed 12;
	Damage 3;
	PainChance 256;
	renderstyle "add";
	Monster;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	DamageFactor "Antiair", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	species "Souls";
	+DONTHARMSPECIES;
	-THRUSPECIES;
	+NOBLOCKMONST;
	+FLOAT ;
	+NOGRAVITY ;
	+MISSILEMORE ;
	+DONTFALL ;
	+NOICEDEATH;
	+MissileMore;
	AttackSound "skull/melee";
	PainSound "skull/pain";
	DeathSound "skull/death";
	ActiveSound "skull/active";
	;
	//AttackSound "FRGOl/melee";
	//PainSound "FRGOl/pain";
	//DeathSound "FRGOl/death";
	//ActiveSound "FRGOl/active";
	RenderStyle "SoulTrans";
	Obituary "$OB_FRGOL";
	DropItem "LostSoulModItemDropper", 128 ;
	}
	States
	{
	Spawn:
		TNT1 A 0 A_CheckFlag("AMBUSH", "CanAmbush", AAPTR_MASTER);
		goto SpawnContinued;
	CanAmbush:
		 TNT1 A 0 A_ChangeFlag("AMBUSH", TRUE);
	SpawnContinued:
		FRGO AB 10 BRIGHT A_Look;
		Loop;
	See:
		FRGO AB 6 BRIGHT A_Chase;
		Loop;
	Missile:
		FRGO AB 0 A_SetSpriteRotation(0);
		TNT1 A 0 A_Jump(256, "SkullDasher","SkullDasher","SkullDasher","IAMONFIREAAAAH","SuperSkullDasher");
	SkullDasher:
		FRGO C 10 BRIGHT A_FaceTarget;
		FRGO D 4 BRIGHT A_SkullAttack;
		FRGO CD 9 BRIGHT;
		Goto Missile;
	IAMONFIREAAAAH:
		FRGO B 2 A_FaceTarget;
		FRGO D 4 BRIGHT A_SkullAttack;
		FRGO C 0 A_ChangeVelocity(0,12,0,CVF_RELATIVE);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,-12,0,CVF_RELATIVE);
		FRGO D 0 A_SpawnProjectile("SpewingImpFireBall", 14, 2, 0);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,12,0,CVF_RELATIVE);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,-12,0,CVF_RELATIVE);
		FRGO D 0 A_SpawnProjectile("SpewingImpFireBall", 14, 2, 40);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,12,0,CVF_RELATIVE);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,-12,0,CVF_RELATIVE);
		FRGO D 0 A_SpawnProjectile("SpewingImpFireBall", 14, 2, 80);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,12,0,CVF_RELATIVE);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,-12,0,CVF_RELATIVE);
		FRGO D 0 A_SpawnProjectile("SpewingImpFireBall", 14, 2, 100);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,12,0,CVF_RELATIVE);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,-12,0,CVF_RELATIVE);
		FRGO D 0 A_SpawnProjectile("SpewingImpFireBall", 14, 2, 140);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,12,0,CVF_RELATIVE);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,-12,0,CVF_RELATIVE);
		FRGO D 0 A_SpawnProjectile("SpewingImpFireBall", 14, 2, 180);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,12,0,CVF_RELATIVE);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,-12,0,CVF_RELATIVE);
		FRGO D 0 A_SpawnProjectile("SpewingImpFireBall", 14, 2, 220);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,12,0,CVF_RELATIVE);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,-12,0,CVF_RELATIVE);
		FRGO D 0 A_SpawnProjectile("SpewingImpFireBall", 14, 2, 260);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,12,0,CVF_RELATIVE);
		FRGO B 2 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,-12,0,CVF_RELATIVE);
		FRGO D 0 A_SpawnProjectile("SpewingImpFireBall", 14, 2, 300);
		Goto See;
	SuperSkullDasher:
			TNT1 A 0 A_PlaySound ("skull/melee", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-2);
			FRGO AAAAA 0 A_Spawnitemex("LSoulTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			FRGO A 1 fast A_Chase;
			FRGO CD 0 A_CustomMeleeAttack((1), "baron/melee","demon/melee");
			FRGO C 0 A_ChangeVelocity(6,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			TNT1 A 0 A_PlaySound ("skull/melee", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-2);
			FRGO AAAAA 0 A_Spawnitemex("LSoulTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			FRGO A 1 fast A_Chase;
			FRGO CD 0 A_CustomMeleeAttack((1));
			FRGO C 0 A_ChangeVelocity(6,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			TNT1 A 0 A_PlaySound ("skull/melee", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-1);
			FRGO AAAAA 0 A_Spawnitemex("LSoulTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			FRGO A 1 fast A_Chase;
			FRGO CD 0 A_CustomMeleeAttack((1));
			FRGO C 0 A_ChangeVelocity(6,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			TNT1 A 0 A_PlaySound ("skull/melee", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-1);
			FRGO AAAA 0 A_Spawnitemex("LSoulTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			FRGO A 1 fast A_Chase;
			FRGO CD 0 A_CustomMeleeAttack((1), "baron/melee","demon/melee");
			FRGO C 0 A_ChangeVelocity(6,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			TNT1 A 0 A_PlaySound ("skull/melee", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-1);
			FRGO AAAA 0 A_Spawnitemex("LSoulTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			FRGO A 1 fast A_Chase;
			FRGO CD 0 A_CustomMeleeAttack((1));
			FRGO C 0 A_ChangeVelocity(6,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			TNT1 A 0 A_PlaySound ("skull/melee", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-1);
			FRGO AAAA 0 A_Spawnitemex("LSoulTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			FRGO A 1 fast A_Chase;
			FRGO CD 0 A_CustomMeleeAttack((1));
			FRGO C 0 A_ChangeVelocity(6,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			TNT1 A 0 A_PlaySound ("skull/melee", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-1);
			FRGO AAAA 0 A_Spawnitemex("LSoulTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			FRGO A 1 fast A_Chase;
			FRGO CD 0 A_CustomMeleeAttack((1), "baron/melee","demon/melee");
			FRGO C 0 A_ChangeVelocity(6,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			TNT1 A 0 A_PlaySound ("skull/melee", 1.0, 1, 0, 2.5);
			TNT1 A 0 ThrustThing(angle*256/360, 4, 0, 0);
			TNT1 A 0 A_Recoil(-1);
			FRGO AAAA 0 A_Spawnitemex("LSoulTrail", 0, 0, 0, 0, 0, 0, 0, 128);
			FRGO A 1 fast A_Chase;
			FRGO CD 0 A_CustomMeleeAttack((1));
			FRGO C 0 A_ChangeVelocity(6,0,0,CVF_RELATIVE);
			TNT1 A 0 A_facetarget;
			Goto See;
	Pain:
		FRGO C 2 A_JumpIfHealthLower(128, "SoulBoomDecider");
	SoulBoomDecider:
		TNT1 A 0 A_Jump(256, "PainContinued","PainContinued","PainContinued","LostGoesBOOM");
	PainContinued:	
		FRGO C 3 BRIGHT;
		FRGO C 3 BRIGHT A_Pain;
		TNT1 A 0 a_playsound ("monsters/weakhurt",0);
		Goto See;
	LostGoesBOOM:
		TNT1 A 0 A_changeflag("NOPAIN",1);
		FRGO B 1 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,12,0,CVF_RELATIVE);
		FRGO B 1 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,-12,0,CVF_RELATIVE);
		FRGO B 1 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,12,0,CVF_RELATIVE);
		FRGO B 1 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,-12,0,CVF_RELATIVE);
		FRGO B 1 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,12,0,CVF_RELATIVE);
		FRGO B 1 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,-12,0,CVF_RELATIVE);
		FRGO B 1 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,12,0,CVF_RELATIVE);
		FRGO B 1 A_FaceTarget;
		FRGO C 0 A_ChangeVelocity(0,-12,0,CVF_RELATIVE);
		FRGO D 0 A_SpawnProjectile("ArchBurningFlame", 14, 2, 40);
		FRGO B 5 A_FaceTarget;
		TNT1 A 0 A_Gravity;
		TNT1 A 0 A_ChangeVelocity(0,0,0,CVF_RELATIVE);
		TNT1 A 0 A_ChangeVelocity(10,0,8,CVF_RELATIVE);
		TNT1 A 0 ThrustThing(angle*256/360, 3, 1, 0);
		TNT1 A 0 ThrustThingZ(0,2,0,1);
		TNT1 A 0 A_SpawnProjectile("SpewingImpFireBall", 14, 2, 0);
		TNT1 A 0 A_SpawnProjectile("SpewingImpFireBall", 14, 2, 90);
		TNT1 A 0 A_SpawnProjectile("SpewingImpFireBall", 14, 2, 270);
		TNT1 A 0 A_SpawnProjectile("SpewingImpFireBall", 14, 2, 360);
		TNT1 A 0 A_PlaySound ("weapons/rocklx",0);
		TNT1 A 0 BRIGHT A_NoBlocking;
		TNT1 A 0 BRIGHT A_Die;
	Death:
		TNT1 A 0 a_spawnitemex ("LostSoulModItemDropper",0,0,35);
		FRGO F 6 BRIGHT;
		FRGO G 6 BRIGHT A_Scream;
		FRGO G 0 BRIGHT A_NoBlocking;
		FRGO H 6 BRIGHT;
		FRGO I 6 BRIGHT ;
		FRGO J 6;
		FRGO K 6;
		Stop;
	}
}
Class FriendlyBomberSoul : Inventory
{
	Default
	{
	Inventory.MaxAmount 1;
	}
}
Class BomberLSoul : LSoul
{
	default
	{
	scale 0.6 ;
	health 10;
	damage (10);
	translation "128:151=223:208", "168:223=191:183";
	species "Cybs";
	+THRUSPECIES;
	}
	States
	{
		Missile:
			FRGO CD 4 BRIGHT A_Jump(25,"MeHelpPlayer");
			FRGO C 10 BRIGHT A_FaceTarget;
			FRGO D 4 BRIGHT A_SkullAttack;
			FRGO CD 4 BRIGHT A_Jump(75,"Death");
			Goto See;
		MeHelpPlayer:
			TNT1 A 0 A_JumpIfInventory("FriendlyBomberSoul", 1, "See");
			TNT1 A 0 A_ChangeFlag("FRIENDLY", TRUE);
			TNT1 A 0 A_GiveInventory ("FriendlyBomberSoul", 1);
			goto see;
		Death:
			FRGO F 0 BRIGHT A_Die;
			TNT1 A 0 A_PlaySound ("weapons/rocklx",0);
			FRGO F 6 BRIGHT A_Explode((5),150);
			FRGO G 6 BRIGHT A_Scream;
			FRGO G 0 BRIGHT A_NoBlocking;
			FRGO H 6 BRIGHT;
			FRGO I 6 BRIGHT ;
			FRGO J 6;
			FRGO K 6;
		Stop;
		}
}