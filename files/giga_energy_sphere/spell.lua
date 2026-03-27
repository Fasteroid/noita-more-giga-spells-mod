table.insert( actions, {
	id          = "GIGA_ENERGY_SPHERE",
	name 		= "$action_giga_energy_sphere",
	description = "$actiondesc_giga_energy_sphere",
	sprite 		= "mods/more_giga_spells/files/giga_energy_sphere/spell.png",
	related_projectiles	= {"mods/more_giga_spells/files/giga_energy_sphere/projectile.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,2,4", -- DISC_BULLET_BIG
	spawn_probability                 = "0.6,0.7,0.8", -- DISC_BULLET_BIG
	price = 180,
	mana = 38,
	--max_uses = 40,
	action 		= function()
		add_projectile("mods/more_giga_spells/files/giga_energy_sphere/projectile.xml")
		-- damage = 0.3
        c.fire_rate_wait = c.fire_rate_wait + 40
        c.spread_degrees = c.spread_degrees + 6
		c.screenshake    = c.screenshake    + 1
		c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_disintegrated.xml,"
        shot_effects.recoil_knockback = shot_effects.recoil_knockback + 140.0
	end,
})