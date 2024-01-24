// TNT1 A 0 A_Log("If you're seeing this, it means inheritence worked!")
Class ZSDDCZombiemanRef : ZombieMan
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

Class ZombieManModStatesinheritor : ZSDDCZombiemanRef 
{
	Default
	{
	//MDN stuff
	DamageFactor "NoDamage", 0.0;
    DamageFactor "SpeedBooster", 2.0;
    PainChance "IceCombo", 64;
	DropItem "BlankPuff";
	
	//Guncaster stuff
	PainChance 200;

	//Guaranteed Effects
	PainChance "ZSDDCZombiemanRefCloseCombat", 256;
	PainChance "ZSDDCZombiemanRefShoelaces", 256;
	PainChance "ZSDDCZombiemanRefMidasCloseCombat", 256;
	PainChance "ZSDDCZombiemanRefMidasShoelaces", 256;
	PainChance "Acid", 256;
	PainChance "Meteorfist", 256;
	;
	//Chance Effects
	PainChance "Lightning", 192;
	PainChance "LightningBlue", 24;
	PainChance "Manuel", 200;
	PainChance "Fire", 200;
	
	//Treasure Tech Stuff
	PainChance "Stun", 256;
	PainChance "Stun2", 256;
	PainChance "Stun3", 256;
	PainChance "Stun4", 256;
	PainChance "Stun5", 256;
	PainChance "ZSDDCZombiemanRefStun",256;
	PainChance "EarthStun",256;
	PainChance "GroundStun",256;
	
	//int User_DeathByFire;
	//int User_DeathByTiberium;
	//int User_DeathByBlueTiberium;
	//int User_LightningLock;
	/*
	var int User_DeathByFire;
	var int User_DeathByTiberium;
	var int User_DeathByBlueTiberium;
	var int User_LightningLock;
	*/
	}
	States
	{
	// Start MetroidDreadNought
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
        POSS G 140;
        TNT1 A 0 A_ChangeFlag("NOPAIN",0);
        goto ZSDDCZombiemanRef::Pain;
    MissileChilled:
        POSS E 15 A_FaceTarget;
        POSS F 12 A_PosAttack;
        POSS E 12;
        goto ZSDDCZombiemanRef::See;
    Death.IceBeam:
    Death.IceCharged:
    Death.IceBeamExplode:
    Death.IceChargedExplode:
    Death.IceCombo:
        POSS G 1;
        TNT1 A 0 A_NoBlocking;
        TNT1 A 0 A_PlaySound("misc/freeze");
        TNT1 A 0 A_PlaySoundEx("ibeam/freeze","soundslot6");
        TNT1 A 0 A_SpawnItemEx("ZombieguyFrozen",0,0,0,0,0,0,0,32);
        TNT1 A 0 A_JumpIf(ACS_ExecuteWithResult(594,10,0,0) == 1, "FrozenNope");
        TNT1 A 0 ACS_ExecuteAlways(594,0,31);
        NOPE A 5;
        Stop;
    FrozenNope:
        TNT1 A 0;
        stop;
	// End MetroidDreadNought
	Death:
		//TNT1 A 0 A_SpawnItemEx("BlueCoin", 0, 0,8,-7,Random(-3,3),11,0);
		goto Death.Picked;

	Death.Tackle:
		//TNT1 A 0 A_SpawnItemEx("BlueCoin", 0, 0,8,-7,Random(-3,3),11,0);
		TNT1 A 0 A_Scream;
		TNT1 A 0 A_SpawnItemEx("ZomBody", 0, 0, 40, -20, 0, 20, 0, 128);
		TNT1 A 0 ThrustThingZ(0,50,0,0);
		TNT1 A 0 A_Noblocking;
		ZIDG A -1;
		stop;
	 	 
	Pain.Stun:
		"####" G 0 A_Jumpifinventory("ZomStun",1,"Death.Mid");
		"####" G 0 A_Jump(130,"Stunned");
		Goto ZSDDCZombiemanRef::Pain;
	
	Pain.Stun2:
		"####" G 0 A_Jumpifinventory("ZomStun",1,"Death.Mid");
		"####" G 0 A_Jump(150,"Stunned");
		Goto ZSDDCZombiemanRef::Pain;
	
	Pain.Stun3:
		"####" G 0 A_Jumpifinventory("ZomStun",1,"Death.Mid");
		"####" G 0 A_Jump(200,"Stunned");
		Goto ZSDDCZombiemanRef::Pain;
	
	Pain.Stun4:
		"####" G 0 A_Jumpifinventory("ZomStun",1,"Death.Mid");
		"####" G 0 A_Jump(256,"Stunned");
		Goto ZSDDCZombiemanRef::Pain;
	
	Pain.Stun5:
		"####" G 0 A_Jumpifinventory("ZomStun",1,"Death.Mid");
		"####" G 0 A_Jump(256,"Stunned");
		Goto ZSDDCZombiemanRef::Pain;
	
	Death.Mid:
		TNT1 A 0 A_die("Picked");
		stop;
	
	Death.Picked:
		//TNT1 A 0 A_SpawnItemEx("BlueCoin", 0, 0,8,-7,Random(-3,3),11,0);
		TNT1 A 0 A_GiveInventory("ThrowZom",1,AAPTR_TARGET);
		TNT1 A 0 ThrustThingZ(0,50,0,0);
		TNT1 A 0 A_Scream;
		TNT1 A 0 A_Noblocking;
		stop;
	
	Pain.GroundStun:
		"####" G 0;
		goto GroundStunner;
	
	GroundStunner:
		TNT1 A 0 A_recoil(3);
		TNT1 A 0 thrustthingz(0,10,0,1);
		Goto ZSDDCZombiemanRef::See;
	
	Stunned:
		"####" G 0 bright A_GiveInventory("ZomStun",1);
		"####" G 2 bright A_SetSpriteRotation(45);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(90);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(135);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" G 2 bright A_SetSpriteRotation(180);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(225);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(270);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" G 2 bright A_SetSpriteRotation(315);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(225);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(360);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" G 2 bright A_SetSpriteRotation(45);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(90);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(135);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" G 2 bright A_SetSpriteRotation(180);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(225);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(270);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" G 2 bright A_SetSpriteRotation(315);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(225);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(360);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" G 2 bright A_SetSpriteRotation(45);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(90);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(135);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 0 bright A_Playsound("sound/stunned",CHAN_5);
		"####" G 2 bright A_SetSpriteRotation(180);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(225);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 2 bright A_SetSpriteRotation(270);
		"####" G 0 bright A_spawnitemex ("StarSprite",-3,0,60,0,random(-5,5),random(-5,5));
		"####" G 0 bright A_SetSpriteRotation(0);
		"####" G 0 bright A_TakeInventory("ZomStun",1);
		Goto ZSDDCZombiemanRef::See;
	
	
	
	Death.Stun:
	TNT1 A 1 A_Jumpifinventory("ZomStun",1,"Death.Picked");
	goto Death.Picked;
	
	Death.Stun2:
	TNT1 A 1 A_Jumpifinventory("ZomStun",1,"Death.Picked");
	goto Death.Picked;
	
	Death.Stun3:
	TNT1 A 1 A_Jumpifinventory("ZomStun",1,"Death.Picked");
	goto Death.Picked;
	
	Death.Stun4:
	TNT1 A 1 A_Jumpifinventory("ZomStun",1,"Death.Picked");
	goto Death.Picked;
	
	Death.Stun5:
	TNT1 A 1 A_Jumpifinventory("ZomStun",1,"Death.Picked");
	goto Death.Picked;
	
	XDeath:
		goto Death.Tackle;
	
   }
    override int DamageMobj(Actor inflictor, Actor source, int damage, Name mod, int flags, double angle)
    {
        if(source!=null && mod=="Stun" && CountInv("ZomStun"))
        {
            super.DamageMobj(source, source, health, "Stun", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun2" && CountInv("ZomStun"))
        {
            super.DamageMobj(source, source, health, "Stun2", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun3" && CountInv("ZomStun"))
        {
            super.DamageMobj(source, source, health, "Stun3", DMG_FORCED);
        }
		 if(source!=null && mod=="Stun4" && CountInv("ZomStun"))
        {
            super.DamageMobj(source, source, health, "Stun4", DMG_FORCED);
        }
			 if(source!=null && mod=="Stun5" && CountInv("ZomStun"))
        {
            super.DamageMobj(source, source, health, "Stun5", DMG_FORCED);
        }
        return super.DamageMobj(inflictor,source,damage,mod,flags,angle);


	
	// Start
	// End
	}
}