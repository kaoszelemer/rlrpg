
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

    if self.showprogress then
        love.graphics.setColor(1,1,1)
        love.graphics.print("Doing selected action", 720, 360)
        love.graphics.rectangle("fill", 700, 400, self.progress, 20)
       
    end


end

function Button:action()
    print("something")

end

function Button:update(dt)
    if self.showprogress then
        self.progress = self.progress + self.progresslength / dt
        self.progresstime:update(dt)
        
    end

    if self.idleprogress ~= nil then
        self.idleprogress:update(dt)
    end

    if self.quitpoi then
            self.quitpoi = false
            playerState:changeState(playerState.states.city)
    end
end

function Button:progressBar(length)

    self.progress = 0
    self.showprogress = true
    self.progresslength = length
    self.progresstime = Timer.after(1, function ()
      
        self.showprogress = false
        self.quitpoi = true
    end)


end


return Button