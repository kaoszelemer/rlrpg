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
        {e=5,a=-5,c=25},
        "Costs 25$ - gives 5 energy on success\nTakes 5 aliveness on fail"
    )

   
end

function Cocaine:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x + 25, self.y + 25)
    end

    
    if self.hovered then
        love.graphics.print(self.hovertext, GLOBALS.mX + 100, GLOBALS.mY)
    end

end

function Cocaine:action()
 

    print("snorting coke..")
 
    if player.money >= 25 then
        gameWorldTimeAdjust(1)
        Button:progressBar(0.1)
      
            if love.math.random() > 0.5 then
                player:showResolution(1)
                player.energy = player.energy + self.prices.e
      
                player.money = player.money - self.prices.c
            else
                player:showResolution(0)
                player.money = player.money - self.prices.c
                player.money = player.aliveness - self.prices.a
                if player.aliveness <= 0 or player.energy <= 0 then
                    player:die("You have been given bad cocaine. If it doesnt work, why would life?")
                end
            end

   
    else
        player:showCant()
    end
    




    

end

return Cocaine