table.insert( actions, {
	id                  = "GIGA_HEALING_BOLT",
	name 		        = "$action_giga_healing_bolt",
	description         = "$actiondesc_giga_healing_bolt",
	sprite 		        = "mods/more_giga_spells/files/giga_healing_bolt/spell.png",
	related_projectiles	= {"mods/more_giga_spells/files/giga_healing_bolt/projectile.xml"},
	type 		        = ACTION_TYPE_PROJECTILE,
	spawn_level         = "5,6,7,10",
	spawn_probability   = "0.2,0.2,0.2,0.3",
	price = 450,
	mana = 200,
	max_uses = 5,
	never_unlimited		= true,
	action 		= function()
		add_projectile("mods/more_giga_spells/files/giga_healing_bolt/projectile.xml")
		-- damage = 0.3
        c.fire_rate_wait = c.fire_rate_wait + 60
        c.spread_degrees = c.spread_degrees + 5
        shot_effects.recoil_knockback = shot_effects.recoil_knockback + 20.0
	end,
})