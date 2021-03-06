return function(entity)
  --entity:give("particle", { "small_damage_hit" })
  entity:give('sprite', 'decals.littlebooms', "onGround")
  entity:give('selfDestroy', 10)
  entity:give('origin', 0.5, 0.5)

  local anim = love.math.random() > 0.5 and "boom1" or "boom2"
  entity:give("animation", {
    currentAnimations = { anim },
    animations = {
      boom1 = {
        properties = {
          {
            componentName = "sprite",
            propertyName = "currentQuadIndex",
            runOnce = true,
            durations = {0.05, 0.05, 0.05},
            values = { 1, 2, 3 },
          }
        }
      },
      boom2 = {
        properties = {
          {
            componentName = "sprite",
            propertyName = "currentQuadIndex",
            runOnce = true,
            durations = { 0.1, 0.05, 0.1 },
            values = { 4, 5, 6 },
          }
        }
      }
    }
  })
end

