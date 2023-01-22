local FastFood = Poi:extend("FastFood")

function FastFood:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "MrokkDoralds",
        "FastFood",
        love.graphics.newImage('assets/pic/fastfood.png'),
        love.graphics.newImage('assets/pic/fastfoodinterior.png'),
        10
    )
end

function FastFood:draw()
    if player.isInCity then
        love.graphics.draw(self.img, self.x, self.y)
    end
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("Burgerz and shitburgerz.\nChoose wisely!", GLOBALS.scrw - 570, 150)
        end

    end
    
--[[     if player.isInFastFood then
        love.graphics.draw(self.interiorimg, 32, 32)
        for i = 1, self.levelup do
            love.graphics.rectangle("line", (GLOBALS.scrw - 350) + i * 10, 20, 10, 10)
        end
        if player.fat >= 1 then
            for i = 1, player.fat do
                love.graphics.rectangle("fill", (GLOBALS.scrw - 350) + i * 10, 20, 10, 10)
            end
        end
    end ]]


end

function FastFood:action()

    Button:removeall()
    player.isInCity = false
    player.isInFastFood = true
    local s = Sounds.fastfood:play()
    print("FastFood action")
    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Burger")
    Button:add("ShitBurger")
    Button:add("GoOut")
  
    self.nothingpanel = true


    self.panelvisible = true


end


return FastFood