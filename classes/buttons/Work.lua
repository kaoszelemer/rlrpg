local Work = Button:extend("Work")

function Work:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Work",
        love.graphics.newImage('assets/pic/button.png')
    )

   
end

function Work:draw()
   
    if playerState.state == playerState.states.poiresolution then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x + 30, self.y + 30)
    end
end

function Work:action()
 

    if player.energy - 5 > 1 and player.aliveness - 4 > 1  then
        
        if GLOBALS.gameworldtime <= 24 then
            GLOBALS.gameworldtime = GLOBALS.gameworldtime + 9
        else
            GLOBALS.gameworldtime = 8
        end
        Button:progressBar(0.05)
        player.energy = player.energy - 5
        player.money = player.money + 18
    else
        player:showCant()
    end
 
   
    




    

end

return Work