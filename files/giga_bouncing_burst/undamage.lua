-- print("(de)activated physics vulnerability")

local ply = GetUpdatedEntityID()
local damage = EntityGetFirstComponent( ply, "DamageModelComponent" )
ComponentSetValue2(damage, "physics_objects_damage", false)

