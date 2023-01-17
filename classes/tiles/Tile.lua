
local Tile = Class("Tile")

function Tile:init(x, y, c, w, h, name, type)
    self.x = x
    self.y = y
    self.c = c
    self.w = w
    self.h = h
    self.name = name
    self.type = type
   
    
end


return Tile