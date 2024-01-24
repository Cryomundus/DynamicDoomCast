Class Cybie : CyberdemonModStatesinheritor
	{
		Default
		{
		obituary "%o was splattered by a cyberdemon.";
		health 5250;
		radius 40;
		height 110;
		mass 1000;
		speed 24;
		painchance 20;
		seesound "cyber/sight";
		painsound "cyber/pain";
		deathsound "cyber/death";
		activesound "cyber/active";
		MONSTER;
		DamageFactor "Heroic", 3.0;
		Damagefactor "MonsterBeatEmUp", 10.4;
		DamageFactor "ArgPlayerRocket", 0.66;
		DamageFactor "ArgCyberRocket" , 0.5;
		translation "168:191=192:202", "39:47=198:203";
		species "Cybs";
		-THRUSPECIES;
		+NOBLOCKMONST;
		+DontHarmSpecies;
		+BOSS;
		+FLOORCLIP;
		//+NORADIUSDMG;
		+DONTMORPH;
		+MISSILEMORE;
		+MISSILEEVENMORE;
		}
		states
		{
		Spawn:
			TNT1 A 0 A_CheckFlag("AMBUSH", "CanAmbush", AAPTR_MASTER);
			goto SpawnContinued;
		CanAmbush:
			TNT1 A 0 A_ChangeFlag("AMBUSH", TRUE);
		SpawnContinued:
			ANNI AB 10 A_Look;
			Loop;
		See:
			TNT1 A 0 A_ChangeFlag("shootable",1);
			ANNI A 3 A_Hoof;
			ANNI ABBCC 3 A_Chase;
			ANNI D 3 A_Metal;
			ANNI D 3 A_Chase;
			Loop;
		Missile:
			TNT1 A 0 A_Jump(256,"CybMissileBarrage","TripleShot","DualPowerShot","CybMicroBomberSouls","ANNIapidBlaster","CybMassiveBarrage");
		CybMissileBarrage:
			ANNI F 7 Bright A_FaceTarget;
			ANNI E 0 A_SpawnProjectile ("CybRocket",45,-28,12);
			ANNI E 0 A_SpawnProjectile ("CybRocket",45,-28,0);
			ANNI E 9 Bright A_SpawnProjectile ("CybRocket",45,-28,-12);
			ANNI F 5 Bright A_FaceTarget;
			ANNI E 0 A_SpawnProjectile ("CybRocket",45,-28,12);
			ANNI E 0 A_SpawnProjectile ("CybRocket",45,-28,0);
			ANNI E 9 A_SpawnProjectile ("CybRocket",45,-28,-12);
			ANNI F 5 Bright A_FaceTarget;
			ANNI E 0 A_SpawnProjectile ("CybRocket",45,-28,12);
			ANNI E 0 A_SpawnProjectile ("CybRocket",45,-28,0);
			ANNI E 9 Bright A_SpawnProjectile ("CybRocket",45,-28,-12);
			goto See;
		TripleShot:
			ANNI F 4 Bright A_FaceTarget;
			ANNI F 0 Bright A_FaceTarget;
			ANNI E 0 Bright A_SpawnProjectile("PowerShot", 45, -30, 0);
			ANNI E 0 Bright A_SpawnProjectile ("CybRocket",45,-28,12);
			ANNI E 0 Bright A_SpawnProjectile ("PowerShot",45,-28,0);
			ANNI E 0 Bright A_SpawnProjectile ("CybRocket",45,-28,-12);
			ANNI E 5 Bright A_SpawnProjectile("PowerShot", 45, 30, 0);
			Goto See;
		DualPowerShot:
			ANNI F 4 Bright A_FaceTarget;
			ANNI E 0 Bright A_SpawnProjectile ("CybRocket",45,-28,12);
			ANNI E 0 Bright A_SpawnProjectile ("CybRocket",45,-28,-12);
			ANNI E 5 Bright A_SpawnProjectile("PowerShot", 45, -15, 0);
			ANNI F 0 Bright A_FaceTarget;
			ANNI E 0 Bright A_SpawnProjectile ("CybRocket",45,-28,12);
			ANNI E 0 Bright A_SpawnProjectile ("CybRocket",45,-28,-12);
			ANNI E 5 Bright A_SpawnProjectile("PowerShot", 45, 15, 0);
			Goto See;
		CybMassiveBarrage:
			ANNI F 12 Bright A_FaceTarget;
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 33,  0,  7, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 33,  0,  0, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 33,  0, -7, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 15,  5, -3, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 15, -5,  3, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 50,  5,  3, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 50, -5, -3, 0, 0);
			ANNI F 9 Bright A_FaceTarget;
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 33,  0,  7, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 33,  0,  0, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 33,  0, -7, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 15,  5, -3, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 15, -5,  3, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 50,  5,  3, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 50, -5, -3, 0, 0);
			ANNI F 9 Bright A_FaceTarget;
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 33,  0,  7, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 33,  0,  0, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 33,  0, -7, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 15,  5, -3, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 15, -5,  3, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 50,  5,  3, 0, 0);
			ANNI E 0 Bright A_SpawnProjectile("CybRocket", 50, -5, -3, 0, 0);
			goto See;
		CybMicroBomberSouls:
			ANNI F 25 A_FaceTarget;
			ANNI E 1 Bright A_FaceTarget;
			ANNI E 1 Bright A_DualPainAttack ("MicroRemoteBomb");
			ANNI E 0 A_PlaySound("weapons/rocklf");
			ANNI E 0 A_PlaySound("PulseNail/fire");
			ANNI E 1 Bright A_FaceTarget;
			ANNI E 1 Bright A_DualPainAttack ("MicroRemoteBomb");
			ANNI E 0 A_PlaySound("weapons/rocklf");
			ANNI E 0 A_PlaySound("PulseNail/fire");
			Goto See;
		ANNIapidBlaster:
			ANNI E 0 A_Jump (10, "CybMissileBarrage","TripleShot","DualPowerShot","CybMicroBomberSouls","See");
			ANNI F 15 Bright A_FaceTarget;
			ANNI E 4 Bright A_FaceTarget;
			ANNI E 1 Bright A_SpawnProjectile ("CybRocket", 55,random(-10,10),random(-1,1),0);
			ANNI E 0 A_PlaySound("moloch/nail");
			ANNI E 0 A_PlaySound("PulseNail/fire");
			ANNI E 4 Bright A_FaceTarget;
			ANNI E 1 Bright A_SpawnProjectile ("CybPulseNail", 55,random(-10,10),random(-1,1),0);
			ANNI E 0 A_PlaySound("moloch/nail");
			ANNI E 0 A_PlaySound("PulseNail/fire");
			ANNI E 0 A_Jump (10, "CybMissileBarrage","TripleShot","DualPowerShot","CybMicroBomberSouls","See");
			ANNI E 1 Bright A_SpidRefire;
			Goto ANNIapidBlaster+3;
		Pain:
			ANNI G 10 A_Pain;
			TNT1 A 0 a_playsound ("monsters/bosshurt",0);
			goto See;
		Death:
			TNT1 A 0 A_JumpIfInTargetInventory("SuperMissileAcquired",1,"DeathSuperMissile");
			TNT1 A 0 A_JumpIfInTargetInventory("PowerBombAcquired",1,"DeathPowerBomb");
			TNT1 A 0 A_Spawnitemex("SetACyberDemonModItemDropper",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			goto ContinueDeath;
		DeathSuperMissile:
			TNT1 A 0 A_JumpIfInTargetInventory("PowerBombAcquired",1,"DeathBoth");
			TNT1 A 0 A_SpawnItemEx("SetBCyberDemonModItemDropper",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			goto ContinueDeath;
		DeathPowerBomb:
			TNT1 A 0 A_SpawnItemEx("SetCCyberDemonModItemDropper",random(-100,100),random(-100,100),random(10,100),0,0,0,0,32,32);
			goto ContinueDeath;
		DeathBoth:
			TNT1 A 0 A_SpawnItemEx("SetDCyberDemonModItemDropper",random(-100,100),random(-100,100),random(10,100),0,0,0,0,32,32);
			goto ContinueDeath;
		ContinueDeath:
			TNT1 A 0 A_ChangeFlag("shootable",0);
			TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 AAAAA 0 A_Spawnitemex("GenericExplosionTosser",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 AAAAA 0 A_Spawnitemex("GenericExplosionTosser",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		    ANNI H 7;
			ANNI I 7 A_Scream;
			TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 AAAAA 0 A_Spawnitemex("GenericExplosionTosser",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			ANNI JKL 7;
			ANNI M 7 A_NoBlocking;
			TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			TNT1 AAAAA 0 A_Spawnitemex("GenericExplosionTosser",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			ANNI NO 7;
			TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
			ANNI P 20 A_Die;
			ANNI P -1 A_BossDeath;
			Stop;
  }
}
Class MiniCybie : Cybie
	{
		Default
		{
		obituary "%o was splattered by a Minicyberdemon.";
		health 500;
		radius 24;
		height 24;
		mass 1000;
		speed 30;
		painchance 20;
		Scale 0.5;
		//Species ;
		seesound "cyber/sight";
		painsound "cyber/pain";
		deathsound "cyber/death";
		activesound "cyber/active";
		MONSTER;
		DamageFactor "Heroic", 3.0;
		Damagefactor "MonsterBeatEmUp", 7.4;
		species "Cybs";
		+dontharmspecies;
		+BOSS;
		+FLOORCLIP;
		+NORADIUSDMG;
		+DONTMORPH;
		+MISSILEMORE;
		}
		States
			{
			Death:
				TNT1 A 0 A_ChangeFlag("shootable",0);
				TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
				TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
				TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
				TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
				TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
				TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
				TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
				TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
				TNT1 AAAAA 0 A_Spawnitemex("GenericExplosionTosser",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
				TNT1 AAAAA 0 A_Spawnitemex("GenericExplosionTosser",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
				TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
				TNT1 AAAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
				TNT1 A 0 A_ScreamAndUnblock;
				XMED A 5 A_Stop;
				XMED B 5 A_XScream;
				XMED C 5 A_KillChildren;
				XMED D 5 A_NoBlocking;
				XMED E 5 Radius_Quake(40,60,0,40,0);
				TNT1 A 0 A_PlaySound ("moloch/thud");
				XMED E -1 A_BossDeath;
				Stop;
			}
		}