local mapGenerator = require 'utils.mapGenerator'

local game = {}

local TESTING = true

function game:enter()
  self.world = Concord.world()
  self.world:addSystems(
    ECS.s.input,
    ECS.s.playerControlled,
    ECS.s.aiControlled,
    ECS.s.movement,
    ECS.s.camera,
    ECS.s.sprite,
    ECS.s.mapDraw,
    ECS.s.draw
  )

  self.world:emit('systemsLoaded')

  self.world:emit('mapChange', mapGenerator.generateTestMap())

  if TESTING then
    self.world:emit('initTest')

    -- Make a couple test entities.
    local entity = Concord.entity(self.world):assemble(ECS.a.getBySelector('characters.player'))
    local entity2 = Concord.entity(self.world):assemble(ECS.a.getBySelector('characters.monsterA'))
  end
end

function game:leave()
  self.world:clear()
end

function game:update(dt)
  self.world:emit("clearMovementIntent", dt)
  self.world:emit("update", dt)
end

function game:resize(width, height)
  self.world:emit('windowResize', width, height)
end

function game:draw()
  self.world:emit("attachCamera")
  self.world:emit("draw")
  self.world:emit("detachCamera")
end

return game
