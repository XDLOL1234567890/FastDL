
-- default settings
local defaultSoundTable = {
	channel = CHAN_AUTO, 
	volume = 1,
	level = 60, 
	pitchstart = 100,
	pitchend = 100,
	name = "noName",
	sound = "path/to/sound"
}

local fireSoundTable = {
	channel = CHAN_AUTO, 
	volume = 1,
	level = 97, 
	pitchstart = 92,
	pitchend = 112,
	name = "noName",
	sound = "path/to/sound"
}

local muteSoundTable = {
	channel = CHAN_AUTO, 
	volume = 0.001,
	level = 60, 
	pitchstart = 100,
	pitchend = 100,
	name = "noName",
	sound = "hl1/fvox/_comma.wav"
}

-- "<" makes the sound directional, refer to https://developer.valvesoftware.com/wiki/Soundscripts#Sound_Characters
local function makeSoundDirectional(snd)
	if type(snd) == "table" then
		for key, sound in ipairs(snd) do
			snd[key] = "<" .. sound
		end
	else
		snd = "<" .. snd
	end
	
	return snd
end

local function addDefaultSound(name, snd)
	snd = makeSoundDirectional(snd)
	
	defaultSoundTable.name = name
	defaultSoundTable.sound = snd

	sound.Add(defaultSoundTable)
	
	-- precache the registered sounds
	if type(defaultSoundTable.sound) == "table" then
		for k, v in pairs(defaultSoundTable.sound) do
			util.PrecacheSound(v)
		end
	else
		util.PrecacheSound(snd)
	end
end

local function addFireSound(name, snd, volume, soundLevel, channel, pitchStart, pitchEnd, noDirection)
	-- use defaults if no args are provided
	volume = volume or 1
	soundLevel = soundLevel or 97
	channel = channel or CHAN_AUTO
	pitchStart = pitchStart or 92
	pitchEnd = pitchEnd or 112
	
	if not noDirection then
		snd = makeSoundDirectional(snd)
	end
	
	fireSoundTable.name = name
	fireSoundTable.sound = snd
	
	fireSoundTable.channel = channel
	fireSoundTable.volume = volume
	fireSoundTable.level = soundLevel
	fireSoundTable.pitchstart = pitchStart
	fireSoundTable.pitchend = pitchEnd
	
	sound.Add(fireSoundTable)
	
	-- precache the registered sounds
	
	if type(fireSoundTable.sound) == "table" then
		for k, v in pairs(fireSoundTable.sound) do
			util.PrecacheSound(v)
		end
	else
		util.PrecacheSound(snd)
	end
end

local function muteSound(name)	
	muteSoundTable.name = name
	sound.Add(muteSoundTable)
end

-- Sound Entropy: Zero 2

-- Admire Hands
addDefaultSound("Weapon_Hands.Knuckle_Crack", "weapons/hands/knuckle_crack.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)

-- Weapons
addFireSound("Weapon_Pistol.Single", "weapons/pistol/pistol_fire3.wav", 0.55, SNDLVL_GUNFIRE, CHAN_WEAPON, 98, 102)
addDefaultSound("Weapon_Pistol.Slideforward", "weapons/pistol/pistol_slideforward.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_Pistol.Clipout", "weapons/pistol/pistol_clipout.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_Pistol.Clipin", "weapons/pistol/pistol_clipin.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_Pistol.Slideback", "weapons/pistol/pistol_slideback.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_Pistol.Reload1", "weapons/pistol/pistol_reload.wav", 0.7, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)

addDefaultSound("Weapon_357.Cock", "weapons/357/357_hammer_prepare.wav")
addDefaultSound("Weapon_357.Draw", "weapons/357/357_draw.wav", 0.7, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_357.Holster", "weapons/357/357_holster.wav", 0.7, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)

muteSound("Weapon_SMG1.Reload")
addDefaultSound("Weapon_SMG1.Draw", "weapons/smg1/smg1_draw.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_SMG1.Reload1", "weapons/smg1/smg1_reload1.wav", 0.7, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_SMG1.Reload2", "weapons/smg1/smg1_reload2.wav", 0.7, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_SMG1.Reload3", "weapons/smg1/smg1_reload3.wav", 0.7, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_SMG1.Reload4", "weapons/smg1/smg1_reload4.wav", 0.7, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)

addDefaultSound("Weapon_AR2.Draw", "weapons/ar2/ar2_draw.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)

addDefaultSound("Weapon_Shotgun.Draw", "weapons/shotgun/shotgun_draw.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addFireSound("Weapon_Shotgun.Double", "weapons/shotgun/shotgun_dbl_fire7.wav", 1, SNDLVL_GUNFIRE, CHAN_WEAPON, 90, 95)


addDefaultSound("WeaponFrag.Draw", "weapons/grenade/grenade_draw.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("WeaponFrag.Roll", "weapons/grenade/grenade_throw2.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("WeaponFrag.Throw", "weapons/grenade/grenade_throw.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("WeaponFrag.Pin", "weapons/grenade/pin.wav", 0.7, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)

addDefaultSound("Weapon_SLAM.TripMineMode", "weapons/slam/c_slam_tripminemode.wav", 0.8, SNDLVL_80DB, CHAN_WEAPON, 95, 105, true)
addDefaultSound("Weapon_SLAM.ThrowMode", "weapons/slam/c_slam_throwmode.wav", 0.8, SNDLVL_80DB, CHAN_WEAPON, 95, 105, true)

-- Movement Sound Entropy: Zero 2

-- Weapons
addDefaultSound("Weapon_SMG1.Movement1", "weapons/smg1/smg1_movement1.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_SMG1.Movement2", "weapons/smg1/smg1_movement2.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_SMG1.Movement3", "weapons/smg1/smg1_movement3.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)

addDefaultSound("Weapon_AR2.Movement1", "weapons/ar2/ar2_movement1.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_AR2.Movement2", "weapons/ar2/ar2_movement2.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_AR2.Movement3", "weapons/ar2/ar2_movement3.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)

addDefaultSound("Weapon_Shotgun.Movement1", "weapons/shotgun/shotgun_movement1.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_Shotgun.Movement2", "weapons/shotgun/shotgun_movement2.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)
addDefaultSound("Weapon_Shotgun.Movement3", "weapons/shotgun/shotgun_movement3.wav", 0.9, SNDLVL_NORM, CHAN_AUTO, 100, 100, true)