table.insert( actions, {
	id          = "GIGA_BOUNCY_ORB",
	name 		= "$action_giga_bouncy_orb",
	description = "$actiondesc_giga_bouncy_orb",
	sprite 		= "data/ui_gfx/gun_actions/bouncy_orb.png",
	related_projectiles	= {"mods/more_giga_spells/files/giga_bouncy_orb/projectile.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,2,4", -- BOUNCY_ORB
	spawn_probability                 = "1,1,1", -- BOUNCY_ORB
	price = 180,
	mana = 38,
	--max_uses = 40,
	action 		= function()
		add_projectile("mods/more_giga_spells/files/giga_bouncy_orb/projectile.xml")
		-- damage = 0.3
        c.fire_rate_wait = c.fire_rate_wait + 40
        c.spread_degrees = c.spread_degrees + 6
        shot_effects.recoil_knockback = shot_effects.recoil_knockback + 160.0
	end,
})