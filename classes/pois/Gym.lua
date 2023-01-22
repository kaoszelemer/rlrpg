local Gym = Poi:extend("Gym")

function Gym:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Gym",
        "Gym",
        love.graphics.newImage('assets/pic/gym.png'),
        love.graphics.newImage('assets/pic/gyminterior.png'),
        20
    )
end

function Gym:draw()
    if player.isInCity then
        love.graphics.draw(self.img, self.x, self.y)
    end
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("Loose some fat.", GLOBALS.scrw - 570, 150)
        end

    end
    
--[[     if player.isInGym then
        love.graphics.draw(self.interiorimg, 32, 32)
        for i = 1, self.levelup do
            love.graphics.rectangle("line", (GLOBALS.scrw - 300) + i * 10, 20, 10, 10)
        end
        if player.coffeedrinker >= 1 then
            for i = 1, player.coffeedrinker do
                love.graphics.rectangle("fill", (GLOBALS.scrw - 300) + i * 10, 20, 10, 10)
            end
        end
    end ]]

 


end

function Gym:action()

    print("in Gym action")
    --buttons> gamble, exit

    Button:removeall()
    player.isInCity = false
    player.isInGym = true
    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Train")
    Button:add("GoOut")

  
    self.nothingpanel = true


    self.panelvisible = true



end


return Gym