table.insert( actions, {
	id          = "GIGA_SPARK_BOLT",
	name 		= "$action_giga_spark_bolt",
	description = "$actiondesc_giga_spark_bolt",
	sprite 		= "mods/more_giga_spells/files/giga_spark_bolt/spell.png",
	related_projectiles	= {"mods/more_giga_spells/files/giga_spark_bolt/projectile.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,2,4", -- DISC_BULLET_BIG
	spawn_probability                 = "0.6,0.6,0.7", -- DISC_BULLET_BIG
	price = 150,
	mana = 17,
	--max_uses = 40,
	action 		= function()
		add_projectile("mods/more_giga_spells/files/giga_spark_bolt/projectile.xml")
		-- damage = 0.3
        c.fire_rate_wait = c.fire_rate_wait + 20
        c.spread_degrees = c.spread_degrees + 3
		c.screenshake    = c.screenshake    + 2
		c.damage_critical_chance = c.damage_critical_chance + 50
        shot_effects.recoil_knockback = shot_effects.recoil_knockback + 80.0
	end,
})