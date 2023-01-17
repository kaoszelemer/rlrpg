
local Poi = Class("Poi")

function Poi:init(x, y, c, w, h, name, type, img)
    self.x = x
    self.y = y
    self.c = c
    self.w = w
    self.h = h
    self.name = name
    self.type = type
    self.img = img
   
    
end

function Poi:draw()




end


return Poi