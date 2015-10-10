config =
  {
    -- make construction bots not go to the quickbar
    fix_bots = true,
    -- make bots unminable
    unminable_bots = true,
    -- mining bots returns the materials
    mine_bot_materials = false,
    
    -- change default request amount for requester chests/slots
    fix_default_request_amount = false,
    default_request_amount = 1,

    --add larger radar
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
