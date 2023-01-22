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
        {e = 0, a = 2, c = 13},
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
        if player.energy - self.prices.e <= 0 or player.aliveness - self.prices.a <= 0 then
            love.graphics.setColor(1,1,0)
            love.graphics.print("You may die", self.x + 15, self.y + 38)
            love.graphics.setColor(1,1,1)
        end
    end
end

function Drama:action()
 

    print("watching a shitty drama..")

    if player.money >= 13 then
        gameWorldTimeAdjust(3)
        player.moviewatcher = player.moviewatcher + 5
        Button:progressBar(3)
        local s = Sounds.drama:play()
        
        for k,v in ipairs(POIs) do
            if v.name == "Cinema" then
                if player.moviewatcher == v.levelup then
                    player.moviewatcher = 0
                    player.lvls.Moviewatcher = player.lvls.Moviewatcher + 1
                    if player.maxaliveness > 12 then
                        player.maxaliveness = player.maxaliveness + 1
                    end
                    player.aliveness = player.aliveness + 1
                end
            end
        end
        
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