Class ZSDDCCacodemonRef : Cacodemon
{
	Default {
	+MissileMore;
	+MissileEvenMore;
	}
	States
	{
	See:
 		"####" AABBCCDD 4 A_Chase;
		Loop;
	Pain:
		"####" G 3;
		"####" G 3 A_Pain;
		Goto See;
	}
}

Class CacodemonModStatesinheritor : ZSDDCCacodemonRef
{
	Default
	{
	PainChance "Stun", 256;
	PainChance "Stun2", 256;
	PainChance "Stun3", 256;
	PainChance "Stun4", 256;
	PainChance "Stun5", 256;
	PainChance "SuperStun",256;
	PainChance "EarthStun",256;
	PainChance "GroundStun",256;
	//MDN Stuff;
	DamageFactor "NoDamage", 0.0;
    DamageFactor "SpeedBooster", 2.0;
    PainChance "IceCombo", 64;
	}
	States
	{
	// Start MDN;
	Pain.IceCharged:
    Pain.IceChargedExplode:
    Pain.IceBeam:
    Pain.IceBeamExplode:
    Pain.IceCombo:
        TNT1 A 0 A_Jump(48,2);
        TNT1 A 0 A_JumpIfInventory("IceBeamChilled",1,"Pain");
        TNT1 A 0;
        TNT1 AAAAAAAAAA 0 A_SpawnItemEx("IceTrailFlicker",random(-1,1),random(-1,1),random(16,46),random(-500,500)/100.00,random(-500,500)/100.00,random(-200,500)/100.00,random(-180,180),161);
        TNT1 AAAAA 0 A_SpawnItemEx("IceTrailFlicker3",random(-1,1),random(-1,1),random(16,46),random(-400,400)/100.00,random(-400,400)/100.00,random(10,500)/100.00,random(-180,180),161);
        TNT1 A 0 ACS_ExecuteAlways(594,0,8,0,0);
        TNT1 A 0 A_GiveInventory("IceBeamChilled",1);
        TNT1 A 0 A_ChangeFlag("NOPAIN",1);
        HEAD E 105;
        TNT1 A 0 A_ChangeFlag("NOPAIN",0);
        goto Super::Pain;
    Death.IceBeam:
    Death.IceCharged:
    Death.IceBeamExplode:
    Death.IceChargedExplode:
    Death.IceCombo:
        HEAD E 1;
        TNT1 A 0 A_NoBlocking;
        TNT1 A 0 A_PlaySound("misc/freeze");
        TNT1 A 0 A_PlaySoundEx("ibeam/freeze","soundslot6");
        TNT1 A 0 A_SpawnItemEx("CacoguyFrozen",0,0,0,0,0,0,0,32);
        TNT1 A 0 A_JumpIf(ACS_ExecuteWithResult(594,10,0,0) == 1, "FrozenNope");
        TNT1 A 0 ACS_ExecuteAlways(594,0,31);
        NOPE A 5;
        Stop;
    FrozenNope:
        TNT1 A 0;
        stop;
	Death:
		//TNT1 A 0 A_SpawnItemEx("SilverCoin", 0, 0,8,-7,Random(-3,3),11,0);
		goto Super::Death;
	
	Death.Tackle:
		//TNT1 A 0 A_SpawnItemEx("SilverCoin", 0, 0,8,-7,Random(-3,3),11,0);
		TNT1 A 0 A_Scream;
		TNT1 A 0 A_SpawnItemEx("CacBody", 0, 0, 40, -20, 0, 20, 0, 128);
		TNT1 A 0 ThrustThingZ(0,50,0,0);
		TNT1 A 0 A_Noblocking;
		CIGS A -1;
		stop;
	 
	xDeath.Tackle:
		//TNT1 A 0 A_SpawnItemEx("SilverCoin", 0, 0,8,-7,Random(-3,3),11,0);
		TNT1 A 0 A_Scream;
		TNT1 A 0 A_SpawnItemEx("CacBody", 0, 0, 40, -20, 0, 20, 0, 128);
		TNT1 A 0 ThrustThingZ(0,50,0,0);
		TNT1 A 0 A_Noblocking;
		CIGS A -1;
		stop;
		
	Pain.Stun:
		"####" E 0 A_Jumpifinventory("CacStun",1,"Death.Mid");
		"####" E 0 A_Jump(0,"Stunned");
		goto Super::Pain;
	
	Pain.Stun2:
		"####" E 0 A_Jumpifinventory("CacStun",1,"Death.Mid");
		"####" E 0 A_Jump(85,"Stunned");
		goto Super::Pain;
	
	Pain.Stun3:
		"####" E 0 A_Jumpifinventory("CacStun",1,"Death.Mid");
		"####" E 0 A_Jump(110,"Stunned");
		goto Super::Pain;
	
	Pain.Stun4:
		"####" E 0 A_Jumpifinventory("CacStun",1,"Death.Mid");
		"####" E 0 A_Jump(145,"Stunned");
		goto Super::Pain;
	
	Pain.Stun5:
		"####" E 0 A_Jumpifinventory("CacStun",1,"Death.Mid");
		"####" E 0 A_Jump(155,"Stunned");
		goto Super::Pain;
		
	XDeath:
		goto Death.Tackle;
		
	Death.Mid:
		TNT1 A 0 A_die("Picked");
		stop;
	
	Death.Picked:
		//TNT1 A 0 A_SpawnItemEx("SilverCoin", 0, 0,8,-7,Random(-3,3),11,0);
		TNT1 A 0 {bNONSHOOTABLE = True;}
		TNT1 A 0 A_GiveInventory("ThrowCac",1,AAPTR_TARGET);
		TNT1 A 0 ThrustThingZ(0,50,0,0);
		TNT1 A 0 A_Noblocking;
		TNT1 A 0 A_Scream;
		stop;
	Death.SuperPicked:
		//TNT1 A 0 A_SpawnItemEx("SilverCoin", 0, 0,8,-7,Random(-3,3),11,0);
		TNT1 A 0 {bNONSHOOTABLE = True;}
		TNT1 A 0 A_GiveInventory("ThrowCacSuper",1,AAPTR_TARGET);
		TNT1 A 0 ThrustThingZ(0,50,0,0);
		TNT1 A 0 A_Noblocking;
		TNT1 A 0 A_Scream;
		stop;
	Pain.GroundStun:
		"####" F 0;
		goto GroundStunner;
	
	GroundStunner:
		"####" E 0 A_recoil(3);
		"####" E 0 thrustthingz(0,10,0,1);
		Goto ZSDDCCacodemonRef::See;
	
	Stunned:
		"####" E 0 bright A_GiveInventory("CacStun",1);
		"####" E 2 bright A_SetSpriteRotation(45);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(90);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(135);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" E 2 bright A_SetSpriteRotation(180);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(225);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(270);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" E 2 bright A_SetSpriteRotation(315);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(225);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(360);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" E 2 bright A_SetSpriteRotation(45);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(90);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(135);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" E 2 bright A_SetSpriteRotation(180);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(225);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(270);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" E 2 bright A_SetSpriteRotation(315);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(225);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(360);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" E 2 bright A_SetSpriteRotation(45);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(90);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(135);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" E 2 bright A_SetSpriteRotation(180);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(225);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 2 bright A_SetSpriteRotation(270);
		"####" E 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" E 0 bright A_SetSpriteRotation(0);
		"####" E 0 bright A_TakeInventory("CacStun",1);
		Goto ZSDDCCacodemonRef::See;
	Death.Stun:
		goto Death.Tackle;
	
	Death.Stun2:
		TNT1 A 1 A_Jumpifinventory("CacStun",1,"Death.Picked");
		goto Death.Picked;
	
	Death.Stun3:
		TNT1 A 1 A_Jumpifinventory("CacStun",1,"Death.Picked");
		goto Death.Picked;
	
	Death.Stun4:
		TNT1 A 1 A_Jumpifinventory("CacStun",1,"Death.Picked");
		goto Death.Picked;
	
	Death.Stun5:
		TNT1 A 1 A_Jumpifinventory("CacStun",1,"Death.Picked");
		goto Death.Picked;
		
	XDeath:
		goto Death.Tackle;
	
  }
    override int DamageMobj(Actor inflictor, Actor source, int damage, Name mod, int flags, double angle)
    {
        if(source!=null && mod=="Stun" && CountInv("CacStun"))
        {
            super.DamageMobj(source, source, health, "Stun", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun2" && CountInv("CacStun"))
        {
            super.DamageMobj(source, source, health, "Stun2", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun3" && CountInv("CacStun"))
        {
            super.DamageMobj(source, source, health, "Stun3", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun4" && CountInv("CacStun"))
        {
            super.DamageMobj(source, source, health, "Stun4", DMG_FORCED);
        }
			 if(source!=null && mod=="Stun5" && CountInv("CacStun"))
        {
            super.DamageMobj(source, source, health, "Stun5", DMG_FORCED);
        }
        return super.DamageMobj(inflictor,source,damage,mod,flags,angle);
	}
}