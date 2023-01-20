local Drama = Button:extend("Drama")

function Drama:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Watch Drama",
        love.graphics.newImage('assets/pic/button.png'),
        {e = 2, a = 2, c = 13},
        "A shitty movie about a nurse\nfalling in love with a soldier\nTakes 1 aliveness\nCosts 13$"
    )

   
end

function Drama:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.print(self.hovertext, GLOBALS.mX + 100, GLOBALS.mY)
    end
end

function Drama:action()
 

    print("watching a shitty drama..")

    if player.money >= 13 then
        gameWorldTimeAdjust(3)
        Button:progressBar(0.1)
        
        player.money = player.money - self.prices.c

        player.aliveness = player.aliveness - self.prices.a
     
            if player.aliveness <= 0 or player.energy <= 0 then
                player:die("You died of boredom while watching a shitty movie")
            end
        
    else
        player:showCant()
    end
 
   
    




    

end

return Drama