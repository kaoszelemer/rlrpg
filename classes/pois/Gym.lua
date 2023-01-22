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
        love.graphics.print(self.name, GLOBALS.scrw - 570, 32)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("Loose some fat.", GLOBALS.scrw - 570, 182)
        end

    end
 


end

function Gym:action()

    print("in Gym action")
    --buttons> gamble, exit

    Button:removeall()
    player.isInCity = false
    player.isInGym = true
    local s = Sounds.gym:play()
    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Train")
    Button:add("GoOut")

  
    self.nothingpanel = true


    self.panelvisible = true



end


return Gym