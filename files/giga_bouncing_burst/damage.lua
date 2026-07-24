dofile_once("data/scripts/lib/utilities.lua")

local BALL_RADIUS = 8

-- begin clauded code
    -- comment(fasteroid): this isn't exact, but claude says it's the standard for gamedev, so we're going with it.
    local function closestPointOnSegment(ax, ay, bx, by, px, py)
        local abx, aby = bx - ax, by - ay
        local t = ((px - ax) * abx + (py - ay) * aby) / (abx * abx + aby * aby)
        t = math.max(0, math.min(1, t))
        return ax + abx * t, ay + aby * t
    end

    local function checkCollision(boxMinX, boxMinY, boxMaxX, boxMaxY, circleX, circleY, radius)
        local dx = math.max(boxMinX, math.min(circleX, boxMaxX)) - circleX
        local dy = math.max(boxMinY, math.min(circleY, boxMaxY)) - circleY
        return (dx * dx + dy * dy) <= (radius * radius)
    end

    local function checkCapsuleCollision(boxMinX, boxMinY, boxMaxX, boxMaxY, segAX, segAY, segBX, segBY, radius)
        local boxCenterX = (boxMinX + boxMaxX) / 2
        local boxCenterY = (boxMinY + boxMaxY) / 2
        local closestX, closestY = closestPointOnSegment(segAX, segAY, segBX, segBY, boxCenterX, boxCenterY)
        return checkCollision(boxMinX, boxMinY, boxMaxX, boxMaxY, closestX, closestY, radius)
    end
-- end clauded code

local function getMaxAABB(ent)
    local hitboxes = EntityGetComponent( vict, "HitBoxComponent" )
    if( hitboxes == nil ) then return 0,0,0,0 end

    local min_x = 0
    local max_x = 0
    local min_y = 0
    local max_y = 0

    for _, hitbox in ipairs(hitboxes) do
        min_x = math.min( min_x, EntityGetComponentValue2(hitbox, "aabb_min_x") )
        max_x = math.max( max_x, EntityGetComponentValue2(hitbox, "aabb_max_x") )
        min_y = math.min( min_y, EntityGetComponentValue2(hitbox, "aabb_min_y") )
        max_y = math.max( max_y, EntityGetComponentValue2(hitbox, "aabb_max_y") )
    end

    return min_x, min_y, max_x, max_y
end

local ball = GetUpdatedEntityID()


local ball_x, ball_y = EntityGetTransform( ball )
local ball_vel = EntityGetFirstComponent( ball, "VelocityComponent" )
local ball_vx, ball_vy = ComponentGetValue2( ball_vel, "mVelocity")
local ball_speed = vec_length(ball_vx, ball_vy)

local ball_x_prev = ball_x - ball_vx / 60
local ball_y_prev = ball_y - ball_vy / 60

ball_vx, ball_vy = vec_normalize(ball_vx, ball_vy)

local victims = EntityGetInRadiusWithTag(ball_x, ball_y, 250, "player_unit")

for _, vict in ipairs(victims) do 

    if(vict == ball) then goto continue_0 end

    local damage = EntityGetFirstComponent( vict, "DamageModelComponent" )

    if( damage == nil ) then goto continue_0 end

    local vict_x, vict_y = EntityGetTransform( vict )
    local x0, y0, x1, y1 = getMaxAABB( vict )

    x0, y0, x1, y1 = x0 + vict_x, y0 + vict_y, x1 + vict_x, y1 + vict_y

    if( not checkCapsuleCollision(x0, y0, x1, y1, ball_x_prev, ball_y_prev, ball_x, ball_y, BALL_RADIUS) ) then goto continue_0 end

    local towards_x, towards_y = vec_sub(ball_x_prev, ball_y_prev, vict_x, vict_y)
    towards_x, towards_y = vec_normalize(towards_x, towards_y)

    local towardsness = vec_dot(towards_x, towards_y, ball_vx, ball_vy)
    
    if( towardsness < 0 ) then goto continue_0 end -- already hit the player

    -- hacky? yes, but this works much better than trying to get box2d to do it
    ComponentSetValue2(damage, "mPhysicsDamageThisFrame", math.floor(ball_speed * towardsness) * 5 / 25 )
    ComponentSetValue2(damage, "mPhysicsDamageEntity", ball)

    ::continue_0::
end

