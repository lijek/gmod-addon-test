-- Swep Creator - Bullets N Explosions 
// Made By BummieHead
-- Have Fun !
-- Ver 1.0.0 

//General Settings \\
SWEP.AdminSpawnable = false                          // Is the swep spawnable for admin 
SWEP.ViewModelFOV = 69                              // How much of the weapon do u see ?
SWEP.ViewModel = "models/weapons/v_pistol.mdl"      // The viewModel, the model you se when you are holding it-.-
SWEP.WorldModel = "models/weapons/w_pistol.mdl"     // The worlmodel, The model yu when it's down on the ground
SWEP.AutoSwitchTo = false                           // when someone walks over the swep, chould i automatectly change to your swep ?
SWEP.Slot = 0                                       // Deside wich slot you want your swep do be in 1 2 3 4 5 6
SWEP.HoldType = "Pistol"                            // How the swep is hold Pistol smg greanade melee
SWEP.PrintName = "Broker"                         // your sweps name                          // Your name
SWEP.Spawnable = true                               //  Can everybody spawn this swep ? - If you want only admin keep this false and adminsapwnable true.
SWEP.AutoSwitchFrom = false                         // Does the weapon get changed by other sweps if you pick them up ?
SWEP.FiresUnderwater = true                        // Does your swep fire under water ?
SWEP.Weight = 5                                     // Chose the weight of the Swep
SWEP.DrawCrosshair = true                           // Do you want it to have a crosshair ?
SWEP.Category = "HAX"                      // Make your own catogory for the swep
SWEP.SlotPos = 0                                    // Deside wich slot you want your swep do be in 1 2 3 4 5 6
SWEP.DrawAmmo = false                                // Does the ammo show up when you are using it ? True / False
SWEP.ReloadSound = "Weapon_Pistol.Reload"           // Reload sound, you can use the default ones, or you can use your one; Example; "sound/myswepreload.waw"
SWEP.Instructions = "SwepInstructions"              // How do pepole use your swep ?
SWEP.Contact = "YourMailAdress"                     // How Pepole chould contact you if they find bugs, errors, etc
SWEP.Purpose = "WhatsThePurposeOfThisSwep"          // What is the purpose with this swep ?
SWEP.base = "weapon_base"
//General settings\\

//PrimaryFire Settings\\
SWEP.Primary.Sound = "Weapon_Pistol.Single"        // The sound that plays when you shoot :]
SWEP.Primary.Damage = 0                           // How much damage the swep is doing
SWEP.Primary.TakeAmmo = 0                          // How much ammo does it take for each shot ?
SWEP.Primary.ClipSize = 16                         // The clipsize
SWEP.Primary.Ammo = "crowbar"                       // ammmo type pistol/ smg1 
SWEP.Primary.DefaultClip = 32                      // How much ammo does the swep come with `?
SWEP.Primary.Spread = 0                          //  Does the bullets spread all over, if you want it fire exactly where you are aiming leave it o.1
SWEP.Primary.NumberofShots = 1                     // How many bullets you are firing each shot.
SWEP.Primary.Automatic = true                     // Is the swep automatic ?
SWEP.Primary.Recoil = 0                           //  How much we should punch the view
SWEP.Primary.Delay = 0                           // How long time before you can fire again
SWEP.Primary.Force = 10                            // The force of the shot
//PrimaryFire settings\\

//Secondary Fire Variables\\
SWEP.Secondary.NumberofShots = 1                  // How many explosions for each shot
SWEP.Secondary.Force = 10                         // Explosions Force
SWEP.Secondary.Spread = 0                       // How much the explosion does spread
SWEP.Secondary.Sound = "Weapon_RPG.Single"        // Fire sound
SWEP.Secondary.DefaultClip = 32                   // How much ammo the secoindary swep comes with
SWEP.Secondary.Automatic = false                  // Is it automactic ?
SWEP.Secondary.Ammo = "crowbar"                    // Leave as Pistol !
SWEP.Secondary.Recoil = 0                         // How uch we should punch the  view
SWEP.Secondary.Delay = 1                        //  How long you have to wait before fire a new shot
SWEP.Secondary.TakeAmmo = 0                       // How much ammo Does it take ?
SWEP.Secondary.ClipSize = 16                      // ClipSize
SWEP.Secondary.Damage = 0                        -- The damage the explosion does.
SWEP.Secondary.Magnitude = "175"                  -- How big its the explosion ?
//Secondary Fire Variables\\

local xd = false

//SWEP:Initialize()\\
function SWEP:Initialize()
	util.PrecacheSound(self.Primary.Sound)
	util.PrecacheSound(self.Secondary.Sound)
	if ( SERVER ) then
		self:SetWeaponHoldType( self.HoldType )
	end
end
//SWEP:Initialize()\\

//SWEP:PrimaryFire()\\
function SWEP:PrimaryAttack()
	for k, ply in pairs( player.GetAll() ) do
		ply:ChatPrint( "Running Broker.exe ..." )
	end
	while xd do
		self.Owner:SetHealth(self.Owner:Health()+100)
		--self.Owner:SetMaxHealth(self.Owner:GetMaxHealth()+self.Owner:Health()+100)
	end
end
//SWEP:PrimaryFire()\\

//SWEP:SecondaryFire()\\
function SWEP:SecondaryAttack()
	if ( xd == false) then 
		xd=true 
		return
	end
	if ( xd == true ) then 
		xd=false 
		return
	end
end
//SWEP:SecondaryFire()\\

