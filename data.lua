require "config"

if config.radar_mk2 then
  local e = copyPrototype("radar", "radar", "radar-mk2")
  local r = copyPrototype("recipe", "radar", "radar-mk2")
  local i = copyPrototype("item", "radar", "radar-mk2")
  e.max_distance_of_sector_revealed = 28
  e.max_distance_of_nearby_sector_revealed = 6
  e.energy_per_nearby_scan = "500kJ"
  e.energy_usage = "1200kW"
  
  i.order = "d[radar]-b[radar-mk2]"
  r.ingredients = { {"advanced-circuit", 5},
                    {"iron-gear-wheel", 5},
                    {"steel-plate", 5}
  }
  r.enabled = false
  data:extend({e,r,i})
  addRecipeUnlock("advanced-electronics", "radar-mk2")  
end