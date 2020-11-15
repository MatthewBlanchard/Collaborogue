local Actor = require "actor"
local Vector2 = require "vector"
local Tiles = require "tiles"
local Condition = require "condition"

local Snip = Actor:extend()

Snip.char = Tiles["snip"]
Snip.name = "snip"
Snip.color = {0.97, 0.93, 0.55, 1}

Snip.components = {
  components.Sight{ range = 6, fov = true, explored = false },
  components.Move{speed = 120, passable = true},
  components.Stats{
    ATK = 0,
    MGK = 0,
    PR = 0,
    MR = 0,
    maxHP = 1,
    AC = 0
  },
  components.Item{stackable = true},
  components.Edible{nutrion = 2},
  components.Aicontroller()
}

local actUtil = components.Aicontroller
function Snip:act(level)
  local snip = actUtil.closestSeenActorByType(self, Snip)
  local player = actUtil.closestSeenActorByType(self, actors.Player)
  local target = player or snip

  if target then
    if target:getRange(self) < 3 then
      level:addEffect(effects.CharacterDynamic(self, 0, -1, Tiles["bubble_lines"], {1, 1, 1}, .5))
    end
    return actUtil.moveToward(self, target)
  end

  return actUtil.move(self, self._meanderDirection)
end

return Snip
