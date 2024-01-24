Class ZSDDCArachnotronRef : Arachnotron
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
		"####" I 3;
		"####" I 3 A_Pain;
		Goto See;
	}
}
Class ArachnotronModStatesinheritor : ZSDDCArachnotronRef  
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
        BSPI I 70;
        TNT1 A 0 A_ChangeFlag("NOPAIN",0);
        goto Super::Pain;
    Death.IceBeam:
    Death.IceCharged:
    Death.IceBeamExplode:
    Death.IceChargedExplode:
    Death.IceCombo:
        BSPI I 1;
        TNT1 A 0 A_NoBlocking;
        TNT1 A 0 A_BossDeath;
        TNT1 A 0 A_PlaySound("misc/freeze");
        TNT1 A 0 A_PlaySoundEx("ibeam/freeze","soundslot6");
        TNT1 A 0 A_SpawnItemEx("SpiderguyFrozen",0,0,0,0,0,0,0,32);
        TNT1 A 0 A_JumpIf(ACS_ExecuteWithResult(594,10,0,0) == 1, "FrozenNope");
        TNT1 A 0 ACS_ExecuteAlways(594,0,31);
        NOPE A 5;
        Stop;
    FrozenNope:
        TNT1 A 0;
        stop;
		// End MDN;
		// Start ;
		// End ;
		
	Death:
		//TNT1 A 0 A_SpawnItemEx("GoldCoin", 0, 0,8,-7,Random(-3,3),11,0);
		goto Super::Death;
    
	Death.Tackle:
		//TNT1 A 0 A_SpawnItemEx("GoldCoin", 0, 0,8,-7,Random(-3,3),11,0);
		TNT1 A 0 A_Scream;
		TNT1 A 0 A_SpawnItemEx("TronBody", 0, 0, 40, -20, 0, 20, 0, 128);
		TNT1 A 0 ThrustThingZ(0,50,0,0);
		TNT1 A 0 A_Noblocking;
		TNT1 A 0 A_bossdeath;
		ATGS A -1 A_bossdeath;
		stop;
		
	Pain.Stun:
		"####" I 0 bright A_SetSpriteRotation(0);
		"####" I 0 A_Jumpifinventory("TronStun",1,"Death.Mid");
		"####" I 0 A_Jump(0,"Stunned");
		goto Super::Pain;
	
	Pain.Stun2:
		"####" I 0 bright A_SetSpriteRotation(0);
		"####" I 0 A_Jumpifinventory("TronStun",1,"Death.Mid");
		"####" I 0 A_Jump(0,"Stunned");
		goto Super::Pain;
	
	Pain.Stun3:
		"####" I 0 bright A_SetSpriteRotation(0);
		"####" I 0 A_Jumpifinventory("TronStun",1,"Death.Mid");
		"####" I 0 A_Jump(75,"Stunned");
		goto Super::Pain;
	
	Pain.Stun4:
		"####" I 0 bright A_SetSpriteRotation(0);
		"####" I 0 A_Jumpifinventory("TronStun",1,"Death.Mid");
		"####" I 0 A_Jump(110,"Stunned");
		goto Super::Pain;
	
	Pain.Stun5:
		"####" I 0 bright A_SetSpriteRotation(0);
		"####" I 0 A_Jumpifinventory("TronStun",1,"Death.Mid");
		"####" I 0 A_Jump(120,"Stunned");
		goto Super::Pain;
	
	Death.Mid:
		TNT1 A 0 A_die("Picked");
		stop;
	
	Death.Picked:
		//TNT1 A 0 A_SpawnItemEx("GoldCoin", 0, 0,8,-7,Random(-3,3),11,0);
		TNT1 A 0 A_GiveInventory("ThrowTron",1,AAPTR_TARGET);
		TNT1 A 0 ThrustThingZ(0,50,0,0);
		TNT1 A 0 A_Scream;
		TNT1 A 0 A_Noblocking;
		TNT1 A 0 A_bossdeath;
		stop;
	
	Stunned:
		"####" I 0 bright A_GiveInventory("TronStun",1);
		"####" I 2 bright A_SetSpriteRotation(45);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(90);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(135);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" I 2 bright A_SetSpriteRotation(180);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(225);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(270);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" I 2 bright A_SetSpriteRotation(315);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(225);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(360);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" I 2 bright A_SetSpriteRotation(45);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(90);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(135);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" I 2 bright A_SetSpriteRotation(180);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(225);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(270);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" I 2 bright A_SetSpriteRotation(315);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(225);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(360);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" I 2 bright A_SetSpriteRotation(45);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(90);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(135);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" I 2 bright A_SetSpriteRotation(180);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(225);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 2 bright A_SetSpriteRotation(270);
		"####" I 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" I 0 bright A_SetSpriteRotation(0);
		"####" I 0 bright A_TakeInventory("TronStun",1);
		Goto Super::See;
	
	Death.Mid:
		TNT1 A 0 A_die("Picked");
		stop;
	
	Death.Picked:
		//TNT1 A 0 A_SpawnItemEx("GoldCoin", 0, 0,8,-7,Random(-3,3),11,0);
		TNT1 A 0 A_GiveInventory("ThrowTron",1,AAPTR_TARGET);
		TNT1 A 0 ThrustThingZ(0,50,0,0);
		TNT1 A 0 A_Scream;
		TNT1 A 0 A_Noblocking;
		TNT1 A 0 A_bossdeath;
		stop;
	
	Pain.GroundStun:
		"####" I 0 bright A_SetSpriteRotation(0);
		"####" I 0;
		goto GroundStunner;
		
	GroundStunner:
		TNT1 A 0 A_recoil(6);
		TNT1 A 0 thrustthingz(0,10,0,1);
		goto See;
	
	Death.Stun:
		goto Death.Tackle;
	
	Death.Stun2:
		goto Death.Tackle;
	
	Death.Stun3:
		TNT1 A 1 A_Jumpifinventory("TronStun",1,"Death.Picked");
		goto Death.Picked;
	
	Death.Stun4:
		TNT1 A 1 A_Jumpifinventory("TronStun",1,"Death.Picked");
		goto Death.Picked;
	
	Death.Stun5:
		TNT1 A 1 A_Jumpifinventory("TronStun",1,"Death.Picked");
		goto Death.Picked;
	XDeath:
		goto Death.Tackle;
	
	}
    override int DamageMobj(Actor inflictor, Actor source, int damage, Name mod, int flags, double angle)
    {
        if(source!=null && mod=="Stun" && CountInv("TronStun"))
        {
            super.DamageMobj(source, source, health, "Stun", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun2" && CountInv("TronStun"))
        {
            super.DamageMobj(source, source, health, "Stun2", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun3" && CountInv("TronStun"))
        {
            super.DamageMobj(source, source, health, "Stun3", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun4" && CountInv("TronStun"))
        {
            super.DamageMobj(source, source, health, "Stun4", DMG_FORCED);
        }
			 if(source!=null && mod=="Stun5" && CountInv("TronStun"))
        {
            super.DamageMobj(source, source, health, "Stun5", DMG_FORCED);
        }
        return super.DamageMobj(inflictor,source,damage,mod,flags,angle);
	
	}
}