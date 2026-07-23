dofile_once("data/scripts/lib/utilities.lua")

local projectile = GetUpdatedEntityID()


local pos_x, pos_y = EntityGetTransform( projectile )
local velComponent = EntityGetFirstComponent( projectile, "VelocityComponent" )
local vx, vy = ComponentGetValue2( velComponent, "mVelocity")

pos_x = pos_x + vx / 60
pos_y = pos_y + vy / 60

local victims = EntityGetInRadiusWithTag(pos_x, pos_y, 64, "player_unit")

for _, ply in ipairs(victims) do 
    local damage = EntityGetFirstComponent( ply, "DamageModelComponent" )

    if( damage == nil ) then goto continue_0 end

    -- it should always be 0, but if for some reason it's something else, don't fw it.
    if( ComponentGetValue2(damage, "physics_objects_damage") ) then goto continue_0 end

    ComponentSetValue2(damage, "physics_objects_damage", true)
    -- print("activated physics vulnerability")

    undamage = EntityAddComponent(ply, "LuaComponent", {
		script_source_file="mods/more_giga_spells/files/giga_bouncing_burst/undamage.lua",
		execute_every_n_frame = 3,
		remove_after_executed = true,
    })
    EntitySetComponentIsEnabled(ply, undamage, true)


    ::continue_0::
end

