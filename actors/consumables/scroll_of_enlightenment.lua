local Actor = require "actor"
local Action = require "action"
local Tiles = require "tiles"

local Read = actions.Read:extend()
Read.name = "read"
Read.targets = {targets.Item}

function Read:perform(level)
  actions.Read:perform(level)
  self.owner:applyCondition(conditions.Scrying())
end

local Scroll = Actor:extend()
Scroll.name = "Scroll of Enlightenment"
Scroll.color = {0.8, 0.8, 0.8, 1}
Scroll.char = Tiles["scroll"]

Scroll.components = {
  components.Item(),
  components.Usable(),
  components.Readable{read = Read},
  components.Cost()
}

return Scroll
