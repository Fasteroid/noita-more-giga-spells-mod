dofile_once("data/scripts/lib/utilities.lua")

local projectile = GetUpdatedEntityID()

edit_component( projectile, "VelocityComponent", function(comp, vars)
    local vx, vy = ComponentGetValueVector2( comp, "mVelocity")
    vx, vy = vec_normalize(vx, vy)
    vx, vy = vec_mult(vx, vy, 700)
    ComponentSetValueVector2( comp, "mVelocity", vx, vy )
end)

