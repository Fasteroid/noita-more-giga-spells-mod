dofile_once("data/scripts/lib/utilities.lua")

local projectile = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( projectile )

local velComponent = EntityGetFirstComponent( projectile, "VelocityComponent" )
local vx, vy = ComponentGetValue2( velComponent, "mVelocity")

local how_many = 5

for i=1, how_many do

    local theta = math.random() * 2 * 3.1416926
    local length = math.random() * 250

    local spark = EntityLoad( "data/entities/projectiles/deck/spitter.xml", pos_x, pos_y)

    local vel_x = math.cos( theta ) * length
    local vel_y = math.sin( theta ) * length

    edit_component( spark, "ProjectileComponent", function(comp,vars)
        ComponentSetValue2( comp, "friendly_fire", true )
        ComponentSetValue2( comp, "collide_with_shooter_frames", 0 )
        ComponentSetValue2( comp, "mWhoShot", projectile )
    end)

    edit_component( spark, "VelocityComponent", function(comp,vars)
        ComponentSetValueVector2( comp, "mVelocity", vel_x + vx, vel_y + vy)
    end)

end
