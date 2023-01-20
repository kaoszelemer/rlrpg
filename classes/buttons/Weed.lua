local Weed = Button:extend("Weed")

function Weed:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Weed 5$-",
        love.graphics.newImage('assets/pic/button.png')
    )

   
end

function Weed:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
end

function Weed:action()
 

    print("smoking pot..")

    if player.money >= 5 then
        gameWorldTimeAdjust(1)
        Button:progressBar(0.1)
        player:showResolution(1)
        if player.aliveness < 9 then
            player.aliveness = player.aliveness + 2
        else
            player.aliveness = 10
        end
        if player.energy > 0 then
            player.energy = player.energy - 1
        else
            player:showCant()
        end
        player.money = player.money - 5
    else
        player:showCant()
    end
 
   
    




    

end

return Weed