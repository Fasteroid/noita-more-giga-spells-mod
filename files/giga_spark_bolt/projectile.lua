dofile_once("data/scripts/lib/utilities.lua")

local entity_id    = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

SetRandomSeed( GameGetFrameNum(), pos_x + pos_y + entity_id )

local velComponent = EntityGetFirstComponent( entity_id, "VelocityComponent" )
local vx, vy = ComponentGetValue2( velComponent, "mVelocity")

local theta = math.atan2(vy, vx) + math.rad( Random(-30, 30) + 180 ) -- towards caster with some random spread
local speed = Random(70, 80)

local particle_vx = math.cos(theta) * speed
local particle_vy = math.sin(theta) * speed

local projectile = shoot_projectile_from_projectile( entity_id, "mods/more_giga_spells/files/giga_spark_bolt/hazard.xml", pos_x, pos_y, particle_vx, particle_vy )

edit_component( projectile, "ProjectileComponent", function(comp,vars)
    ComponentSetValue2( comp, "friendly_fire", true )
    ComponentSetValue2( comp, "collide_with_shooter_frames", 0 )
end)
 