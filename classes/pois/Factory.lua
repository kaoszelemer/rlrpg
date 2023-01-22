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
        love.graphics.newImage('assets/pic/factoryinterior.png'),
        10
    )
end

function Factory:draw()
    if player.isInCity then
        love.graphics.draw(self.img, self.x, self.y)
    end
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
        for i = 1, self.levelup do
            love.graphics.rectangle("line", (GLOBALS.scrw - 300) + i * 10, 20, 10, 10)
        end
        if player.worker >= 1 then
            for i = 1, player.worker do
                love.graphics.rectangle("fill", (GLOBALS.scrw - 300) + i * 10, 20, 10, 10)
            end
        end
    end

end

function Factory:action()

    print("action")
    player.isInCity = false
    player.isInFactory = true
    local s = Sounds.factory:play()
    Button:removeall()
    
   
    self.nothingpanel = true

    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Work")
    Button:add("GoOut")

    self.panelvisible = true


end


return Factory