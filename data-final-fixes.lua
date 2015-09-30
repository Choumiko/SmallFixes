require "config"

if config.fix_bots then
  local bots = {}
  for _, e in pairs(data.raw["construction-robot"]) do
    bots[e.name] = true
  end

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