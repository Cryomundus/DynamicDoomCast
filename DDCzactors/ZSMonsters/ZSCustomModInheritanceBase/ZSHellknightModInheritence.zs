Class ZSDDCHellKnightRef : HellKnight
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

Class HellKnightModStatesinheritor : HellKnight
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
    PainChance "IceBeam", 96;
    PainChance "IceCharged", 128;
    PainChance "IceChargedExplode", 96;
    PainChance "IceBeamExplode", 64;
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
        BOS2 H 70;
        TNT1 A 0 A_ChangeFlag("NOPAIN",0);
        goto Super::Pain;
    Death.IceBeam:
    Death.IceCharged:
    Death.IceBeamExplode:
    Death.IceChargedExplode:
    Death.IceCombo:
        BOS2 H 1;
        TNT1 A 0 A_NoBlocking;
        TNT1 A 0 A_BossDeath;
        TNT1 A 0 A_PlaySound("misc/freeze");
        TNT1 A 0 A_PlaySoundEx("ibeam/freeze","soundslot6");
        TNT1 A 0 A_SpawnItemEx("BaronguyFrozen",0,0,0,0,0,0,0,32);
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
		//TNT1 AA 0 A_SpawnItemEx("SilverCoin", 0, 0,8,-7,Random(-3,3),11,0);
		//TNT1 A 0 A_SpawnItemEx("RedCoin", 0, 0,8,-7,Random(-3,3),11,0);
		goto Super::Death;
      
	Death.Tackle:
		//TNT1 AA 0 A_SpawnItemEx("SilverCoin", 0, 0,8,-7,Random(-3,3),11,0);
		//TNT1 A 0 A_SpawnItemEx("RedCoin", 0, 0,8,-7,Random(-3,3),11,0);
		TNT1 A 0 A_Scream;
		TNT1 A 0 A_SpawnItemEx("KnightBody", 0, 0, 40, -20, 0, 20, 0, 128);
		TNT1 A 0 ThrustThingZ(0,50,0,0);
		TNT1 A 0 A_Noblocking;
		HKGS A -1;
		stop;
	Pain.Stun:
		"####" G 0 bright A_SetSpriteRotation(0);
		"####" G 0 A_Jumpifinventory("KnightStun",1,"Death.Mid");
		"####" G 0 A_Jump(0,"Stunned");
		goto Super::Pain;
	
	Pain.Stun2:
		"####" G 0 bright A_SetSpriteRotation(0);
		"####" G 0 A_Jumpifinventory("KnightStun",1,"Death.Mid");
		"####" G 0 A_Jump(0,"Stunned");
		goto Super::Pain;
	
	Pain.Stun3:
		"####" G 0 bright A_SetSpriteRotation(0);
		"####" G 0 A_Jumpifinventory("KnightStun",1,"Death.Mid");
		"####" G 0 A_Jump(75,"Stunned");
		goto Super::Pain;
	
	Pain.Stun4:
		"####" G 0 bright A_SetSpriteRotation(0);
		"####" G 0 A_Jumpifinventory("KnightStun",1,"Death.Mid");
		"####" G 0 A_Jump(120,"Stunned");
		goto Super::Pain;
	
	Pain.Stun5:
		"####" G 0 bright A_SetSpriteRotation(0);
		"####" G 0 A_Jumpifinventory("KnightStun",1,"Death.Mid");
		"####" G 0 A_Jump(130,"Stunned");
		goto Super::Pain;
	Death.Mid:
		TNT1 A 0 A_die("Picked");
		stop;
	
	Death.Picked:
		//TNT1 AA 0 A_SpawnItemEx("SilverCoin", 0, 0,8,-7,Random(-3,3),11,0);
		//TNT1 A 0 A_SpawnItemEx("RedCoin", 0, 0,8,-7,Random(-3,3),11,0);
		TNT1 A 0 A_GiveInventory("ThrowKnight",1,AAPTR_TARGET);
		TNT1 A 0 ThrustThingZ(0,50,0,0);
		TNT1 A 0 A_Scream;
		TNT1 A 0 A_Noblocking;
		stop;
	Pain.GroundStun:
		"####" E 0 bright A_SetSpriteRotation(0);
		"####" E 0;
		goto GroundStunner;
	GroundStunner:
		TNT1 A 0 A_recoil(6);
		TNT1 A 0 thrustthingz(0,10,0,1);
		goto See;
	Stunned:
		"####" H 0 bright A_GiveInventory("KnightStun",1);
		"####" H 2 bright A_SetSpriteRotation(45);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(90);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(135);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" H 2 bright A_SetSpriteRotation(180);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(225);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(270);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" H 2 bright A_SetSpriteRotation(315);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(225);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(360);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" H 2 bright A_SetSpriteRotation(45);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(90);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(135);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" H 2 bright A_SetSpriteRotation(180);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(225);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(270);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" H 2 bright A_SetSpriteRotation(315);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(225);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(360);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" H 2 bright A_SetSpriteRotation(45);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(90);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(135);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" H 2 bright A_SetSpriteRotation(180);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(225);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 2 bright A_SetSpriteRotation(270);
		"####" H 0 bright A_spawnitemex ("StarSprite",-3,0,75,0,random(-5,5),random(-5,5));
		"####" H 0 bright A_SetSpriteRotation(0);
		"####" H 0 bright A_TakeInventory("KnightStun",1);
		Goto Super::See;
	
	
	Death.Stun:
		goto Death.Tackle;
	
	Death.Stun2:
		goto Death.Tackle;
	
	Death.Stun3:
		TNT1 A 1 A_Jumpifinventory("KnightStun",1,"Death.Picked");
		goto Death.Picked;
	
	Death.Stun4:
		TNT1 A 1 A_Jumpifinventory("KnightStun",1,"Death.Picked");
		goto Death.Picked;
	
	Death.Stun5:
		TNT1 A 1 A_Jumpifinventory("KnightStun",1,"Death.Picked");
		goto Death.Picked;
	XDeath:
		goto Death.Tackle;
	}
    override int DamageMobj(Actor inflictor, Actor source, int damage, Name mod, int flags, double angle)
    {
        if(source!=null && mod=="Stun" && CountInv("KnightStun"))
        {
            super.DamageMobj(source, source, health, "Stun", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun2" && CountInv("KnightStun"))
        {
            super.DamageMobj(source, source, health, "Stun2", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun3" && CountInv("KnightStun"))
        {
            super.DamageMobj(source, source, health, "Stun3", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun4" && CountInv("KnightStun"))
        {
            super.DamageMobj(source, source, health, "Stun4", DMG_FORCED);
        }
			 if(source!=null && mod=="Stun5" && CountInv("KnightStun"))
        {
            super.DamageMobj(source, source, health, "Stun5", DMG_FORCED);
        }
        return super.DamageMobj(inflictor,source,damage,mod,flags,angle);
	
	
	}
}