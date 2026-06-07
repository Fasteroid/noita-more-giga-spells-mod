table.insert( actions, {
	id                  = "GIGA_SPITTER_BOLT",
	name 		        = "$action_giga_spitter_bolt",
	description         = "$actiondesc_giga_spitter_bolt",
	sprite 		        = "mods/more_giga_spells/files/giga_spitter_bolt/spell.png",
	related_projectiles	= {"mods/more_giga_spells/files/giga_spitter_bolt/projectile.xml"},
	type 				= ACTION_TYPE_PROJECTILE,
	spawn_level         = "0,2,4,5,6", -- DISC_BULLET_BIG
	spawn_probability   = "0.6,0.6,0.7,0.8,0.9", -- DISC_BULLET_BIG
	price               = 150,
	mana                = 50,
	--max_uses = 40,
	action 		= function()
		add_projectile("mods/more_giga_spells/files/giga_spitter_bolt/projectile.xml")
		c.fire_rate_wait = c.fire_rate_wait + 20
		c.screenshake = c.screenshake + 0.3
		c.spread_degrees = c.spread_degrees + 6.0
        shot_effects.recoil_knockback = shot_effects.recoil_knockback + 20.0
	end,
})