local Cocaine = Button:extend("Cocaine")

function Cocaine:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Cocaine",
        love.graphics.newImage('assets/pic/button.png')
    )

   
end

function Cocaine:draw()
   
    if playerState.state == playerState.states.poiresolution then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x + 30, self.y + 30)
    end
end

function Cocaine:action()
 

    print("snorting coke..")
 
    if player.money >= 25 then
    
        if player.aliveness - 4 > 0 then
            player.aliveness = player.aliveness - 4
        else
            player:showCant()
        end
      
        player.energy = player.energy + 5
      
        player.money = player.money - 25
    else
        player:showCant()
    end
    




    

end

return Cocaine