require "config"
require "util"

local bots = {}
for _, e in pairs(data.raw["construction-robot"]) do
  bots[e.name] = true

  if config.mine_bot_materials then
    if data.raw["recipe"][e.name] and data.raw["recipe"][e.name].result == e.name then
      e.minable.results = util.table.deepcopy(data.raw["recipe"][e.name].ingredients)
      e.minable.result = nil
    else
      for _, r in pairs(data.raw["recipe"]) do
        if r.result == e.name then
          e.minable.results = util.table.deepcopy(r.ingredients)
          e.minable.result = nil
          break
        end
      end
    end
  end

  if config.unminable_bots then
    e.minable = nil
  end
end

if config.fix_bots then
  for _, e in pairs(data.raw["item"]) do
    if e.place_result and bots[e.place_result] then
      local r = false
      for i,f in pairs(e.flags) do
        if f == "goes-to-quickbar" then
          r = i
          break
        end
      end
      if r then
        table.remove(e.flags, r)
      end
    end
  end
end

if config.fix_default_request_amount then
  for name,list in pairs(data.raw) do
    for index,item in pairs(list) do
      if item.stack_size ~= nil then
        item.default_request_amount = config.default_request_amount
      end
    end
  end
end

if config.fix_requester_paste_multiplier then
  for _, r in pairs(data.raw["recipe"]) do
    r.requester_paste_multiplier = config.requester_paste_multiplier
  end
end
