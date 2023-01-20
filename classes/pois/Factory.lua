local Factory = Poi:extend("Factory")

function Factory:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Cheese Factory",
        "Factory",
        love.graphics.newImage('assets/pic/factory.png'),
        love.graphics.newImage('assets/pic/factoryinterior.png')
    )
end

function Factory:draw()

    love.graphics.draw(self.img, self.x, self.y)
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("It's a cheesefactory.\nThey are also known as slavers\nSmells like heaven", GLOBALS.scrw - 570, 150)
        end

    end

    
    if player.isInFactory then
        love.graphics.draw(self.interiorimg, 32, 32)
    end

end

function Factory:action()

    print("action")
    player.isInCity = false
    player.isInFactory = true
    Button:removeall()
    
   
    self.nothingpanel = true

    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Work")
    Button:add("GoOut")

    self.panelvisible = true


end


return Factory