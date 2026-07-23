table.insert( actions, {
	id                  = "GIGA_BOUNCING_BURST",
	name 		        = "$action_giga_bouncing_burst",
	description         = "$actiondesc_giga_bouncing_burst",
	sprite 		        = "mods/more_giga_spells/files/giga_bouncing_burst/spell.png",
	related_projectiles	= {"mods/more_giga_spells/files/giga_bouncing_burst/projectile.xml"},
	type 				= ACTION_TYPE_PROJECTILE,
	spawn_level         = "0,1,2,3,4,5,6,10", -- SUMMON_ROCK
	spawn_probability   = "0.7,0.5,0.4,0.8,0.4,0.5,0.6,0.5", -- SUMMON_ROCK
	price               = 180,
	mana                = 100,
	max_uses            = 15,
	action = function()
		add_projectile("mods/more_giga_spells/files/giga_bouncing_burst/projectile.xml")
		c.fire_rate_wait = c.fire_rate_wait + 16
		c.screenshake = c.screenshake + 0.5
        shot_effects.recoil_knockback = shot_effects.recoil_knockback + 150.0
	end,
})