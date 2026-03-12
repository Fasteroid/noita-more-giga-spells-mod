

function OnModPreInit()
	

end

function OnModInit()
  local translations = ModTextFileGetContent("data/translations/common.csv")
  local new_translations = ModTextFileGetContent("mods/more_giga_spells/files/translations.csv")
  translations = translations .. "\n" .. new_translations .. "\n"
  translations = translations:gsub("\r", ""):gsub("\n\n+", "\n")
  ModTextFileSetContent("data/translations/common.csv", translations)
end

-- This code runs when all mods' filesystems are registered
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/more_giga_spells/files/actions.lua" ) -- Basically dofile("mods/example/files/actions.lua") will appear at the end of gun_actions.lua