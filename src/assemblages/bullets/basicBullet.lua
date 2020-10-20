return function(entity, x, y)
  entity:give("position", x, y)
  entity:give("size", 10, 10) -- TODO: do not hard code this
  entity:give("speed", 100)
  entity:give("velocity")
  entity:give("directionIntent")
  entity:give("physicsBody", 3, { "bullet" })
  entity:give("sprite", "bullets.basicBullet")
end
