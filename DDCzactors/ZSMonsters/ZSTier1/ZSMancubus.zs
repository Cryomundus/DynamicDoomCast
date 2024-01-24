//this is a test line;
//#include decorate/Decoratives.dec;
//for some reason killing this is not lowering the walls on map07;
/*;
Ah man ok so this is kinda dumb. So, in addition to having a script that ;
replaces all the normal monsters you also need a Randomspawner to handle map ;
specials. And becuase of how I have this set-up, having multiple things replace ;
the same monster somehow don't conflict with one another. YAY!;
If you'd rather skip past all the randomspawner nonsense, use CRTL+F to skip;
this to this conveniently placed reference: DynDoomMancubus;
Note: Below is the old test version. It has since been expanded.;
Class EarlyMapDynDoomMancSpawner : RandomSpawner replaces Fatso
{
	Default
	{
	dropitem "Mancubus";
	dropitem "Mancubus";
	dropitem "Mancubus";
	dropitem "ArtilleryFatso";
	}
}
*/
//-------------------------------------;
// reference jump here: DynDoomMancubus;
Class Mancubus : FatsoModStatesinheritor Replaces Fatso //67
{
	Default
	{
	Health 600;
	Radius 48;
	Height 64;
	Mass 1000;
	Speed 8;
	PainChance 80;
	//species "HECTy";
	Monster;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	DamageFactor "Scrapper", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	species "Fats";
	-THRUSPECIES;
	+NOBLOCKMONST;
	+DONTHARMSPECIES;
	+FLOORCLIP;
	+BOSSDEATH;
	+MISSILEMORE //might remove this dunno yet;
	+DONTHURTSPECIES;
	SeeSound "fatso/sight";
	PainSound "monsters/bighurt";
	DeathSound "fatso/death";
	ActiveSound "fatso/active";
	Obituary "$OB_FATSO";
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "PBFlameCannonChanceDropper", 96 ;
	}
	States
	{
	Spawn:
		TNT1 A 0 A_CheckFlag("AMBUSH", "CanAmbush", AAPTR_MASTER);
		goto SpawnContinued;
	CanAmbush:
		 TNT1 A 0 A_ChangeFlag("AMBUSH", TRUE);
	SpawnContinued:
		TNT1 A 0 ;
	//	TNT1 A 0 A_SpawnItemEx("HeadshotTargetMancubus", 0,0,53, 0,0,0, 0, SXF_SETMASTER) ;
	SpawnContinue:
		HECT AB 10 A_Look;
		loop;
	SeeContinued:
	See:
		HECT AABBCCDDEEFF 4 A_Chase;
		Loop;
	Missile:
		TNT1 A 0 A_Jump(256, "StandardFatsoAttack","FatsoBarrageAttack");
	StandardFatsoAttack:
		HECT G 0 A_FaceTarget;
 		HECT G 20 A_FatRaise;
		HECT H 7 BRIGHT A_FatAttack1("BigOleFireball");
		HECT IG 3;
		HECT H 7 BRIGHT A_FatAttack2("BigOleFireball");
		HECT IG 3;
		HECT H 7 BRIGHT A_FatAttack3("BigOleFireball");
		HECT IG 3;
		Goto See;
	FatsoBarrageAttack:
		HECT G 0 A_FaceTarget;
		HECT G 20 A_FatRaise;
		HECT H 5 BRIGHT A_SpawnProjectile("BigOleFireball",20,20,(random(-15,15)),0);
		HECT IG 2 A_FaceTarget;
		HECT H 5 BRIGHT A_SpawnProjectile("BigOleFireball",20,-45,(random(-15,15)),0);
		HECT IG 2 A_FaceTarget;
		HECT H 5 BRIGHT A_SpawnProjectile("BigOleFireball",20,20,(random(-15,15)),0);
		HECT IG 2 A_FaceTarget;
		HECT H 5 BRIGHT A_SpawnProjectile("BigOleFireball",20,-45,(random(-15,15)),0);
		HECT IG 2 A_FaceTarget;
		HECT H 5 BRIGHT A_SpawnProjectile("BigOleFireball",20,20,(random(-15,15)),0);
		HECT IG 2 A_FaceTarget;
		HECT H 5 BRIGHT A_SpawnProjectile("BigOleFireball",20,-45,(random(-15,15)),0);
		HECT IG 5;
		Goto See;
	Pain:
	PainContinued:
		HECT J 3;
		HECT J 3 A_Pain;
		Goto See;
	Death:
		TNT1 A 0 a_spawnitemex ("FatsoModItemDropper",0,0,35);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		HECT K 6 ;
		HECT L 6 A_Scream;
		HECT M 6 A_NoBlocking;
		HECT NOPQRS 6;
		TNT1 A 0 ;
		HECT T -1 A_BossDeath    ;
	     Stop;
	XDeath:
		TNT1 A 0 a_spawnitemex ("FatsoModItemDropper",0,0,35);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 A 0 A_PlaySound("MainGore/MonGoBoom",CHAN_AUTO);
		TNT1 A 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 A 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 A 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 A 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 A 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		XBIG A 5 A_Scream;
		XBIG B 5 A_Stop;
		XBIG C 5 A_BossDeath ;
		XBIG D 5 A_NoBlocking;
		XBIG E 5;
		XBIG E -1;
		Stop;
	Crush:
		POL5 EEEEE 1 ;
		POL5 E -1;
		Stop;
	}
}