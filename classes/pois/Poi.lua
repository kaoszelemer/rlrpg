
local Poi = Class("Poi")

function Poi:init(x, y, c, w, h, name, type, img, interiorimg)
    self.x = x
    self.y = y
    self.c = c
    self.w = w
    self.h = h
    self.name = name
    self.type = type
    self.img = img
    self.interiorimg = interiorimg
   
    PoiWorld:add(self, self.x, self.y, self.w, self.h)
    self.cadd = true
    
end

function Poi:draw()




end

function Poi:action()
 
end


return Poi