
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
   
    PoiWorld:add(self, self.x, self.y, self.w, self.h)
    
end

function Poi:draw()




end

function Poi:action()
 
end


return Poi