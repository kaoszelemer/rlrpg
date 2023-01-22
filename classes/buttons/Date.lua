local Date = Button:extend("Date")

function Date:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Date",
        love.graphics.newImage('assets/pic/button.png'),
        {},
        "You look for some love.\nResets Aliveness and Energy on success\nSets Aliveness and Energy to 2 on Fail"
        
    )

   
end

function Date:draw()
   
    if playerState.state == playerState.states.poiresolution  then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x + 25, self.y + 25)
        
    end
    if self.hovered then
        love.graphics.print(self.hovertext, GLOBALS.mX + 100, GLOBALS.mY)
    end
end

function Date:action()
 

    print("tryn to find a Date..")

    local rnd = love.math.random()
    gameWorldTimeAdjust(3)
    Button:progressBar(3)
    local s = Sounds.date:play()
   
        if rnd < 0.18 then
            player.energy = 10
            player.aliveness = 10
            player:showResolution(1)
            player.sexlife = player.sexlife + 1
        else
            player.energy = 1
            player.aliveness = 2
            player:showResolution(0)
        end
 
 
   
    




    

end

return Date