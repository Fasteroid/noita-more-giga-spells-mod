dofile_once( "data/scripts/lib/utilities.lua" )

local entity_id    = GetUpdatedEntityID()

local BEAM_LENGTH = 8
local BEAM_WIDTH  = 3
local BEAM_COUNT  = 12

local function AddLaserEmitter(entity_id, angle)
    local laser_comp = EntityAddComponent2(entity_id, "LaserEmitterComponent", {
        is_emitting = true,
        laser_angle_add_rad = angle,
    })

    ComponentObjectSetValue2(laser_comp, "laser", "damage_to_entities",                    0.03           )
    ComponentObjectSetValue2(laser_comp, "laser", "max_cell_durability_to_destroy",        14             )
    ComponentObjectSetValue2(laser_comp, "laser", "damage_to_cells",                       1500           )
    ComponentObjectSetValue2(laser_comp, "laser", "root_entity_is_responsible_for_damage", true           )
    ComponentObjectSetValue2(laser_comp, "laser", "max_length",                            BEAM_LENGTH    )
    ComponentObjectSetValue2(laser_comp, "laser", "beam_radius",                           BEAM_WIDTH     )
    ComponentObjectSetValue2(laser_comp, "laser", "hit_particle_chance",                   40             )
    ComponentObjectSetValue2(laser_comp, "laser", "beam_particle_chance",                  95             )
    ComponentObjectSetValue2(laser_comp, "laser", "beam_particle_type",                    3              )
end

for i=1, BEAM_COUNT do
    local angle = (i - 1) * (360 / BEAM_COUNT)
    AddLaserEmitter(entity_id, math.rad(angle))
end