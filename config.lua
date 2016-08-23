config =
  {
    -- make construction bots not go to the quickbar, default on
    fix_bots = true,
    -- make construction bots unminable, default on
    unminable_bots = true,
    
    -- make logistic bots unminable, default off
    unminable_logistic_bots = false,
    
    -- mining bots returns the materials, default off
    mine_bot_materials = false,

    -- Changes how many items are requested when copying from assembler to requester chest
    -- (default is 2 times the amount of the ingredients), default off
    fix_requester_paste_multiplier = false,
    requester_paste_multiplier = 5,

    --add larger radar, default off
    radar_mk2 = false
  }

if config.unminable_bots then
  config.mine_bot_materials = false
end

function copyPrototype(type, name, newName)
  if not data.raw[type][name] then error("type "..type.." "..name.." doesn't exist", 2) end
  local p = table.deepcopy(data.raw[type][name])
  p.name = newName
  if p.minable and p.minable.result then
    p.minable.result = newName
  end
  if p.place_result then
    p.place_result = newName
  end
  if p.result then
    p.result = newName
  end
  return p
end

function addRecipeUnlock(tech, recipe)
  if not data.raw["technology"][tech] then error("technology "..tech.." doesn't exist", 2) end
  if not data.raw["recipe"][recipe] then error("recipe "..recipe.." doesn't exist", 2) end
  if not type(data.raw["technology"][tech].effects) == "table" then
    data.raw["technology"][tech].effects = {}
  end
  table.insert(data.raw["technology"][tech].effects,
    {
      type="unlock-recipe",
      recipe = recipe
    })

end

return config, copyPrototype, addRecipeUnlock
