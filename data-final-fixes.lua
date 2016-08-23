require "config"
require "util"

local types = {"construction-robot", "logistic-robot"}
local bots = {}
for _, bot in pairs(types) do
  for _, e in pairs(data.raw[bot]) do
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

    if bot == "construction-robot" and config.unminable_bots then
      e.minable = nil
    end
    
    if bot == "logistic-robot" and config.unminable_logistic_bots then
      e.minable = nil
    end
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

if config.fix_requester_paste_multiplier then
  for _, r in pairs(data.raw["recipe"]) do
    r.requester_paste_multiplier = config.requester_paste_multiplier
  end
end
