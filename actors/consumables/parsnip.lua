local Actor = require "actor"
local Condition = require "condition"
local Tiles = require "tiles"

local Parsnip = Actor:extend()
Parsnip.name = "Parsnip"
Parsnip.description = "A bland root vegetable."
Parsnip.color = {0.97, 0.93, 0.55, 1}
Parsnip.char = Tiles["parsnip"]

Parsnip.components = {
  components.Item({stackable = true}),
  components.Usable(),
  components.Edible{ nutrition = 2 }
}

return Parsnip
