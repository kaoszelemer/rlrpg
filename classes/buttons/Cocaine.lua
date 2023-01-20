local Cocaine = Button:extend("Cocaine")

function Cocaine:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Cocaine",
        love.graphics.newImage('assets/pic/button.png'),
        "Costs 25$ - gives 5 energy on success\nTakes 5 aliveness on fail"
    )

   
end

function Cocaine:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x + 25, self.y + 25)
    end

    
    if self.hovered then
        love.graphics.print(self.price, GLOBALS.mX + 100, GLOBALS.mY + 50)
    end

end

function Cocaine:action()
 

    print("snorting coke..")
 
    if player.money >= 25 then
        gameWorldTimeAdjust(1)
        if player.aliveness - 4 > 0 then
            player.aliveness = player.aliveness - 4
            player:showResolution(1)
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