--MOD_NAME = ""
--
--local function init_global()
--  global = {}
--  global.version = "0.0.1"
--  -- set up stuff
--end
--
--local function init_player(player)
--  --setup player specific stuff (gui settings etc.) 
--end
--
--local function init_players()
--  for i,player in pairs(game.players) do
--    init_player(player)
--  end
--end
--
--local function init_force(force)
--  --force specific
--end
--
--local function init_forces()
--  for i, force in pairs(game.forces) do
--    init_force(force)
--  end
--end
--
--local function on_init()
--  init_global()
--  init_forces()
--end
--
--local function on_load()
-- -- set metatables, register conditional event handlers, local references to global
--end
--
---- run once
--local function on_configuration_changed(data)
--  if not data or not data.mod_changes then
--    return
--  end
--  if data.mod_changes[MOD_NAME] then
--    local newVersion = data.mod_changes[MOD_NAME].new_version
--    local oldVersion = data.mod_changes[MOD_NAME].old_version
--    -- mod was added to existing save
--    if not oldVersion then
--      init_global()
--      init_forces()
--      init_players()
--    else
--      --mod was updated
--      -- update/change gui for all players via game.players.gui ?  
--    end
--    global.version = newVersion
--  end
--  --check for other mods
--end
--
--local function on_player_created(event)
--  init_player(game.players[event.player_index])
--end
--
--local function on_force_created(event)
--  init_force(event.force)
--end
--local function on_forces_merging(event)
--
--end
--
--script.on_init(on_init)
--script.on_load(on_load)
--script.on_configuration_changed(on_configuration_changed)
--script.on_event(defines.events.on_player_created, on_player_created)
--script.on_event(defines.events.on_force_created, on_force_created)
--script.on_event(defines.events.on_forces_merging, on_forces_merging)