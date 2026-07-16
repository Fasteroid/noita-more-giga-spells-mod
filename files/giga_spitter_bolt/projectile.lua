dofile_once("data/scripts/lib/utilities.lua")

local projectile = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( projectile )

local velComponent = EntityGetFirstComponent( projectile, "VelocityComponent" )
local vx, vy = ComponentGetValue2( velComponent, "mVelocity")

-- appear somewhere "behind" where it spawned
local theta = math.atan2(-vy, -vx) + (math.random() - 0.5) * 3.1416926 * 0.5;
local length = math.random() * 50 + 20

EntitySetTransform(projectile, pos_x + math.cos(theta) * length, pos_y + math.sin(theta) * length)
