
local Tile = Class("Tile")

function Tile:init(x, y, img, w, h, name, type)
    self.x = x
    self.y = y
    self.img = img
    self.w = w
    self.h = h
    self.name = name
    self.type = type
   
    
end


return Tile