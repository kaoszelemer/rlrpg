local Weed = Button:extend("Weed")

function Weed:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Weed",
        love.graphics.newImage('assets/pic/button.png')
    )

   
end

function Weed:draw()
   
    if playerState.state == playerState.states.poiresolution then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x + 30, self.y + 30)
    end
end

function Weed:action()
 

    print("smoking pot..")

    if player.money >= 5 then
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