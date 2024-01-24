//this is a test line;
//#include decorate/Decoratives.dec;
//eventually gonna make these guys walk on the ceiling;
//why? THEY'RE GODDAMN MECHA SPIDERS WHY CAN'T THEY WALK ON THE CEILING!?!;
/*;
Ah man ok so this is kinda dumb. So, in addition to having a script that ;
replaces all the normal monsters you also need a Randomspawner to handle map ;
specials. And becuase of how I have this set-up, having multiple things replace ;
the same monster somehow don't conflict with one another. YAY!;
If you'd rather skip past all the randomspawner nonsense, use CRTL+F to skip;
this to this conveniently placed reference: DynDoomArachnotron;
////////////////////////;
//    Arachnotron     //;
////////////////////////;
Class EarlyMapDynDoomArachSpawner : RandomSpawner //replaces Arachnotron;
{
	dropitem "ArachSpider";
	dropitem "ArachSpider";
	dropitem "ArachSpiderRail";
	dropitem "ArachnoTank";
}
*/
// reference jump here: DynDoomArachnotron;
Class ArachSpider : ArachnotronModStatesinheritor replaces Arachnotron
{
	Default
	{
	Health 500;
	Radius 64;
	Height 64;
	Mass 600;
	Speed 12;
	PainChance 128;
	Monster;
	PainChance "Head", 255;
	DamageFactor "Head", 2;
	DamageFactor "Scrapper", 3.0;
	DamageFactor "MonsterBeatEmUp", 7.4;
	-THRUSPECIES;
	+NOBLOCKMONST;
	+NOBLOCKMONST;
	+FLOORCLIP;
	+BOSSDEATH;
	SeeSound "baby/sight";
	PainSound "baby/pain";
	DeathSound "baby/death";
	ActiveSound "baby/active";
	Obituary "$OB_BABY";
	species "Arach";
	+DontHarmSpecies;
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
		//TNT1 A 0 A_SpawnItemEx("HeadshotTargetCyberdemon", 0,0,100, 0,0,0, 0, SXF_SETMASTER)  ;
	SpawnContinue:
		RSPI AB 10 A_Look;
		Loop;
	See:
		RSPI A 20;
		RSPI A 3 A_BabyMetal;
		RSPI ABBCC 3 A_Chase;
		RSPI D 3 A_BabyMetal;
		RSPI DEEFF 3 A_Chase;
		Goto See+1;
	Missile:
		TNT1 A 0 A_Jump(256,"NormalShot","NormalShot","TwoxSplitterShot");
	TwoxSplitterShot:
		RSPI A 20 BRIGHT A_FaceTarget;
		RSPI G 4 BRIGHT A_SpawnProjectile("ArachnoPlasmaSplitter2x",16,3,0,0);
		RSPI H 4 BRIGHT;
		TNT1 A 0 A_CheckSight("See");
		RSPI H 1 BRIGHT A_SpidRefire;
		Goto TwoxSplitterShot+1;
	NormalShot:	
		RSPI A 20 BRIGHT A_FaceTarget;
		RSPI G 4 BRIGHT A_SpawnProjectile("ArachnotronPlasma",16,3,0,0);
		RSPI H 4 BRIGHT;
		TNT1 A 0 A_CheckSight("See");
		RSPI H 1 BRIGHT A_SpidRefire;
		Goto NormalShot+1;
	Pain:
		RSPI I 3;
		RSPI I 3 A_Pain;
		TNT1 A 0 a_playsound ("monsters/bighurt",0);
		Goto See+1;
	Death:
		TNT1 A 0 a_spawnitemex ("ArachnotronModItemDropper",0,0,35);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		RSPI J 1 A_BossDeath;
		RSPI J 9 A_Scream;
		RSPI K 7 A_NoBlocking;
		RSPI LMNO 7 ;
		RSPI P -1 ;
		Stop;
	XDeath:
		TNT1 A 0 a_spawnitemex ("ArachnotronModItemDropper",0,0,35);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 A 0 A_PlaySound("MainGore/MonGoBoom",CHAN_AUTO);
		TNT1 A 0 A_Scream;
		TNT1 AAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		XBIG A 1 A_BossDeath;
		XBIG A 4 A_Stop;
		XBIG B 5 ;
		XBIG C 5 ;
		XBIG D 5 A_NoBlocking;
		XBIG E 5;
		TNT1 A 0 ;
		XBIG E -1;
		Stop;
	Crush:
		POL5 EEEEE 1 ;
		POL5 E -1;
		Stop	;
    Raise:
		RSPI P 5;
		RSPI ONMLKJ 5;
		Goto See+1;
	}
}
Class ArachSpiderRail : ArachSpider replaces Arachnotron
{
	Default
	{
	Health 550;
	Radius 64;
	Height 64;
	Mass 600;
	Speed 12;
	PainChance 128;
	Monster;
	DamageFactor "MonsterBeatEmUp", 7.4;
	translation "160:167=119:127", "224:231=112:118";
	+NOBLOCKMONST;
	+FLOORCLIP;
	+BOSSDEATH;
	SeeSound "baby/sight";
	PainSound "baby/pain";
	DeathSound "baby/death";
	ActiveSound "baby/active";
	Obituary "$OB_BABY";
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
	DropItem "MicroMedPackDropChecker", 128 ;
	species "Arach";
	+DontHarmSpecies;
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
		//TNT1 A 0 A_SpawnItemEx("HeadshotTargetCyberdemon", 0,0,100, 0,0,0, 0, SXF_SETMASTER)  ;
	SpawnContinue:
		RSPI AB 10 A_Look;
		Loop;
	See:
		RSPI A 20;
		RSPI A 3 A_BabyMetal;
		RSPI ABBCC 3 A_Chase;
		RSPI D 3 A_BabyMetal;
		RSPI DEEFF 3 A_Chase;
		Goto See+1;
	Missile:
		RSPI A 20 BRIGHT A_FaceTarget;
		RSPI G 0 A_PlayweaponSound("weapons/laser");
		RSPI G 0 BRIGHT A_SpawnProjectile("MultiMonsterRailshot", 16, 0, random(-4,4),0);
		RSPI G 4 BRIGHT;
		RSPI H 5 BRIGHT;
		RSPI H 1 BRIGHT A_SpidRefire;
		Goto Missile;
	Pain:
		RSPI I 3;
		RSPI I 3 A_Pain;
		TNT1 A 0 a_playsound ("monsters/bighurt",0);
		Goto See+1;
	Death:
		TNT1 A 0 a_spawnitemex ("ArachnotronModItemDropper",0,0,35);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		RSPI J 1 A_BossDeath;
		RSPI J 9 A_Scream;
		RSPI K 7 A_NoBlocking;
		RSPI LMNO 7 ;
		RSPI P -1 ;
		Stop;
	XDeath:
		TNT1 A 0 a_spawnitemex ("ArachnotronModItemDropper",0,0,35);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 AAAAA 0 A_Spawnitemex("Blood",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		TNT1 A 0 A_PlaySound("MainGore/MonGoBoom",CHAN_AUTO);
		TNT1 A 0 A_Scream;
		TNT1 AAAA 0 A_Spawnitemex("DynDoomGore_GibChucker",0,0,6,0,0,0,0, SXF_NOPOINTERS| SXF_NOCHECKPOSITION);
		XBIG A 1 A_BossDeath;
		XBIG A 4 A_Stop;
		XBIG B 5 ;
		XBIG C 5  ;
		XBIG D 5 A_NoBlocking;
		XBIG E 5;
		TNT1 A 0 ;
		XBIG E -1;
		Stop;
	}
}