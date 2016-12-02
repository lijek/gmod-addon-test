-- Swep Creator - Bullets N Explosions 
// Made By BummieHead
-- Have Fun !
-- Ver 1.0.0 
local ShootSound = Sound( "Metal.SawbladeStick" )

//General Settings \\
SWEP.AdminSpawnable = false                          --// Is the swep spawnable for admin 
SWEP.AdminOnly = false
SWEP.ViewModelFOV = 360                            --  // How much of the weapon do u see ?
SWEP.ViewModel = "models/weapons/v_pistol.mdl"      --// The viewModel, the model you se when you are holding it-.-
SWEP.WorldModel = "models/weapons/w_pistol.mdl"   --  // The worlmodel, The model yu when it's down on the ground
SWEP.AutoSwitchTo = false                         --  // when someone walks over the swep, chould i automatectly change to your swep ?
SWEP.Slot = 0                                       --// Deside wich slot you want your swep do be in 1 2 3 4 5 6
SWEP.HoldType = "Pistol"                         --   // How the swep is hold Pistol smg greanade melee
SWEP.PrintName = "Haxor gun"                 --       // your sweps name
SWEP.Author = "Lijuminati"                        --     // Your name
SWEP.Spawnable = true                           --    //  Can everybody spawn this swep ? - If you want only admin keep this false and adminsapwnable true.
SWEP.AutoSwitchFrom = false                  --       // Does the weapon get changed by other sweps if you pick them up ?
SWEP.FiresUnderwater = true                  --      // Does your swep fire under water ?
SWEP.Weight = 5                                   --  // Chose the weight of the Swep
SWEP.DrawCrosshair = true                   --        // Do you want it to have a crosshair ?
SWEP.Category = "HAX"                   --   // Make your own catogory for the swep
SWEP.SlotPos = 0                                  --  // Deside wich slot you want your swep do be in 1 2 3 4 5 6
SWEP.DrawAmmo = false                        --       // Does the ammo show up when you are using it ? True / False
SWEP.Instructions = "Left click and HEALTH" --             // How do pepole use your swep ?
SWEP.Contact = "none"                    -- // How Pepole chould contact you if they find bugs, errors, etc
SWEP.Purpose = "super shots"          --// What is the purpose with this swep ?
SWEP.base = "hax"
//General settings\\

SWEP.Primary.Sound = "Weapon_Pistol.Single"        // The sound that plays when you shoot :]
SWEP.Primary.Damage = 1000000000                           // How much damage the swep is doing
SWEP.Primary.TakeAmmo = 0                          // How much ammo does it take for each shot ?
SWEP.Primary.ClipSize = -1                         // The clipsize
SWEP.Primary.Ammo = "none"                       // ammmo type pistol/ smg1 
SWEP.Primary.DefaultClip = -1                      // How much ammo does the swep come with `?
SWEP.Primary.Spread = 0                          //  Does the bullets spread all over, if you want it fire exactly where you are aiming leave it o.1
SWEP.Primary.NumberofShots = 1              // How many bullets you are firing each shot.
SWEP.Primary.Automatic = true                     // Is the swep automatic ?
SWEP.Primary.Recoil = 0                            //  How much we should punch the view
SWEP.Primary.Delay = 0                             // How long time before you can fire again
SWEP.Primary.Force = 10   

SWEP.Secondary.Sound = "Weapon_Pistol.Single"        // The sound that plays when you shoot :]
SWEP.Secondary.Damage = 0                           // How much damage the swep is doing
SWEP.Secondary.TakeAmmo = 0                          // How much ammo does it take for each shot ?
SWEP.Secondary.ClipSize = -1                         // The clipsize
SWEP.Secondary.Ammo = "none"                       // ammmo type pistol/ smg1 
SWEP.Secondary.DefaultClip = -1                      // How much ammo does the swep come with `?
SWEP.Secondary.Spread = 0                          //  Does the bullets spread all over, if you want it fire exactly where you are aiming leave it o.1
SWEP.Secondary.NumberofShots = 1000               // How many bullets you are firing each shot.
SWEP.Secondary.Automatic = true                     // Is the swep automatic ?
SWEP.Secondary.Recoil = 999                            //  How much we should punch the view
SWEP.Secondary.Delay = 0                             // How long time before you can fire again
SWEP.Secondary.Force = 10   

--//SWEP:Initialize()\\
function SWEP:Initialize()
	util.PrecacheSound(self.Primary.Sound)
	util.PrecacheSound(self.Secondary.Sound)
	if ( SERVER ) then
		self:SetWeaponHoldType( self.HoldType )
	end
end
--//SWEP:Initialize()\\

//SWEP:PrimaryFire()\\
function SWEP:PrimaryAttack()
	if ( !self:CanPrimaryAttack() ) then return end
	local bullet = {}
		bullet.Num = self.Primary.NumberofShots
		bullet.Src = self.Owner:GetShootPos()
		bullet.Dir = self.Owner:GetAimVector()
		bullet.Spread = Vector( self.Primary.Spread * 0.1 , self.Primary.Spread * 0.1, 0)
		bullet.Tracer = 0
		bullet.Force = self.Primary.Force
		bullet.Damage = self.Primary.Damage
		bullet.AmmoType = self.Primary.Ammo
	local rnda = self.Primary.Recoil * -1
	local rndb = self.Primary.Recoil * math.random(-1, 1)
	self:ShootEffects()
	self.Owner:FireBullets( bullet )
	self.Weapon:EmitSound(Sound(self.Primary.Sound))
	self.Owner:ViewPunch( Angle( rnda,rndb,rnda ) )
	self:TakePrimaryAmmo(self.Primary.TakeAmmo)
	self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	self.Weapon:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	--self:ThrowChair( "models/props_c17/FurnitureChair001a.mdl" )
end
//SWEP:PrimaryFire()\\

//SWEP:SecondaryFire()\\
function SWEP:SecondaryAttack()
	
	--local medkit = ents.Create("item_healthkit")
	--medkit:SetPos(self.Owner:GetAimVector())
	--medkit:Spawn()
	
	local mHealth = self.Owner:GetMaxHealth()
	
	self.Owner:SetHealth(self.Owner:Health()+100)
	self.Owner:SetMaxHealth(mHealth+100)
	
end