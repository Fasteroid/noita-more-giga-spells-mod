dofile_once("data/scripts/lib/utilities.lua")

local projectile = GetUpdatedEntityID()

local comp = EntityAddComponent( projectile, "LuaComponent", {
    script_source_file    = "mods/more_giga_spells/files/giga_bouncing_burst/damage.lua",
    execute_every_n_frame = "1"
} )

EntitySetComponentIsEnabled(projectile, comp, true)