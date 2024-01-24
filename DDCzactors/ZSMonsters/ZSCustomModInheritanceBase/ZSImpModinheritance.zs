Class ZSDDCDoomImpRef : DoomImp
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

Class DoomImpModStatesinheritor : ZSDDCDoomImpRef  
{
	Default 
	{
	//MDN Stuff;
	DamageFactor "NoDamage", 0.0;
    DamageFactor "SpeedBooster", 2.0;
    PainChance "IceCombo", 64;
	PainChance "Stun", 256;
	PainChance "Stun2", 256;
	PainChance "Stun3", 256;
	PainChance "Stun4", 256;
	PainChance "Stun5", 256;
	PainChance "SuperStun",256;
	PainChance "EarthStun",256;
	PainChance "GroundStun",256;
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
        TROO H 140;
        TNT1 A 0 A_ChangeFlag("NOPAIN",0);
        goto Super::Pain;
    Death.IceBeam:
    Death.IceCharged:
    Death.IceBeamExplode:
    Death.IceChargedExplode:
    Death.IceCombo:
        TROO H 1;
        TNT1 A 0 A_NoBlocking;
        TNT1 A 0 A_PlaySound("misc/freeze");
        TNT1 A 0 A_PlaySoundEx("ibeam/freeze","soundslot6");
        TNT1 A 0 A_SpawnItemEx("ImpguyFrozen",0,0,0,0,0,0,0,32);
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
  //   TNT1 AAA 0 A_SpawnItemEx("BlueCoin", 0, 0,8,-7,Random(-3,3),11,0);
    goto Super::Death;
   
   Death.Tackle:
 // TNT1 AAA 0 A_SpawnItemEx("BlueCoin", 0, 0,8,-7,Random(-3,3),11,0);
	TNT1 A 0 A_Scream;
	 TNT1 A 0 A_SpawnItemEx("ImpBody", 0, 0, 40, -20, 0, 20, 0, 128);
     TNT1 A 0 ThrustThingZ(0,50,0,0);
	 TNT1 A 0 A_Noblocking;
     DIGS A -1;
     stop;
	 	 
	Pain.Stun:
		"####" H 0 A_Jumpifinventory("ImpStun",1,"Death.Mid");
		"####" H 0 A_Jump(130,"Stunned");
		Goto Super::Pain;
	
	Pain.Stun2:
		"####" H 0 A_Jumpifinventory("ImpStun",1,"Death.Mid");
		"####" H 0 A_Jump(150,"Stunned");
		Goto Super::Pain;
	
	Pain.Stun3:
		"####" H 0 A_Jumpifinventory("ImpStun",1,"Death.Mid");
		"####" H 0 A_Jump(200,"Stunned");
		Goto Super::Pain;
	
	Pain.Stun4:
		"####" H 0 A_Jumpifinventory("ImpStun",1,"Death.Mid");
		"####" H 0 A_Jump(256,"Stunned");
		Goto Super::Pain;
	
	Pain.Stun5:
		"####" H 0 A_Jumpifinventory("ImpStun",1,"Death.Mid");
		"####" H 0 A_Jump(256,"Stunned");
		Goto Super::Pain;
	
	Death.Mid:
	TNT1 A 0 A_die("Picked");
	stop;
	
	Death.Picked:
	//TNT1 AAA 0 A_SpawnItemEx("BlueCoin", 0, 0,8,-7,Random(-3,3),11,0);
	TNT1 A 0 A_GiveInventory("ThrowImp",1,AAPTR_TARGET);
	TNT1 A 0 ThrustThingZ(0,50,0,0);
	TNT1 A 0 A_Scream;
	TNT1 A 0 A_Noblocking;
	 stop;

	Pain.GroundStun:
		"####" H 0;
		goto GroundStunner;
	
	GroundStunner:
		TNT1 A 0 A_recoil(6);
		TNT1 A 0 thrustthingz(0,10,0,1);
		Goto Super::See;
	
	Stunned:
		"####" H 0 bright  A_GiveInventory("ImpStun",1);
		"####" H 2 bright  A_SetSpriteRotation(45);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(90);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(135);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 0 bright  A_Playsound("sound/stunned",CHAN_5);
		"####" H 2 bright  A_SetSpriteRotation(180);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(225);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(270);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 0 bright  A_Playsound("sound/stunned",CHAN_5);
		"####" H 2 bright  A_SetSpriteRotation(315);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(225);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(360);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 0 bright  A_Playsound("sound/stunned",CHAN_5);
		"####" H 2 bright  A_SetSpriteRotation(45);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(90);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(135);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 0 bright  A_Playsound("sound/stunned",CHAN_5);
		"####" H 2 bright  A_SetSpriteRotation(180);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(225);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(270);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 0 bright  A_Playsound("sound/stunned",CHAN_5);
		"####" H 2 bright  A_SetSpriteRotation(315);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(225);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(360);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 0 bright  A_Playsound("sound/stunned",CHAN_5);
		"####" H 2 bright  A_SetSpriteRotation(45);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(90);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(135);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 0 bright  A_Playsound("sound/stunned",CHAN_5);
		"####" H 2 bright  A_SetSpriteRotation(180);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(225);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 2 bright  A_SetSpriteRotation(270);
		"####" H 0 bright  A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" H 0 bright  A_SetSpriteRotation(0);
		"####" H 0 bright  A_TakeInventory("ImpStun",1);
		Goto Super::See;
	
	
	
	Death.Stun:
	TNT1 A 1 A_Jumpifinventory("ImpStun",1,"Death.Picked");
	goto Death.Picked;
	
	Death.Stun2:
	TNT1 A 1 A_Jumpifinventory("ImpStun",1,"Death.Picked");
	goto Death.Picked;
	
	Death.Stun3:
	TNT1 A 1 A_Jumpifinventory("ImpStun",1,"Death.Picked");
	goto Death.Picked;
	
	Death.Stun4:
	TNT1 A 1 A_Jumpifinventory("ImpStun",1,"Death.Picked");
	goto Death.Picked;
	
	Death.Stun5:
	TNT1 A 1 A_Jumpifinventory("ImpStun",1,"Death.Picked");
	goto Death.Picked;

	XDeath:
		goto Death.Tackle;

   }
    override int DamageMobj(Actor inflictor, Actor source, int damage, Name mod, int flags, double angle)
    {
        if(source!=null && mod=="Stun" && CountInv("ImpStun"))
        {
            super.DamageMobj(source, source, health, "Stun", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun2" && CountInv("ImpStun"))
        {
            super.DamageMobj(source, source, health, "Stun2", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun3" && CountInv("ImpStun"))
        {
            super.DamageMobj(source, source, health, "Stun3", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun4" && CountInv("ImpStun"))
        {
            super.DamageMobj(source, source, health, "Stun4", DMG_FORCED);
        }
			 if(source!=null && mod=="Stun5" && CountInv("ImpStun"))
        {
            super.DamageMobj(source, source, health, "Stun5", DMG_FORCED);
        }
        return super.DamageMobj(inflictor,source,damage,mod,flags,angle);
	}
}