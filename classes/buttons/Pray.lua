local Pray = Button:extend("Pray")

function Pray:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Pray",
        love.graphics.newImage('assets/pic/button.png'),
        {e = 2, a = 2, c = 1},
        "Sell your soul to the carpheadman\nGives 1$\nGives 2 aliveness on success\nTakes 2 aliveness on fail"
    )

   
end

function Pray:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.print(self.hovertext, GLOBALS.mX + 100, GLOBALS.mY)
    end
end

function Pray:action()
 

    print("praying to carpheadman..")

  
        gameWorldTimeAdjust(3)
        Button:progressBar(0.1)
        
        player.money = player.money + self.prices.c

        if love.math.random() > 0.5 then
            player.aliveness = player.aliveness - self.prices.a
        else
            player.aliveness = player.aliveness + self.prices.a
        end
     
        if player.aliveness <= 0 or player.energy <= 0 then
            player:die("You summoned the carpheadman\nAnd it chewed your head off")
        end
    
   
    




    

end

return Pray