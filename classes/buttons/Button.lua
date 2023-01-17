
local Button = Class("Button")

function Button:init(x, y, w, h, name, img)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.name = name
    self.img = img

    
    MenuWorld:add(self, self.x, self.y, self.w, self.h)
end

function Button:draw()

  


end

function Button:action()


end


return Button