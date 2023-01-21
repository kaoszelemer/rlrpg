local Beer = Button:extend("Beer")

function Beer:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Beer",
        love.graphics.newImage('assets/pic/button.png'),
        {e = 1, a = 1, c = 1},
        "Thick orange liquid\nGives 1 energy on success.\nTakes 1 aliveness on fail\nCosts 1$"
        )

   
end

function Beer:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x+25, self.y + 25)
    end
    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.print(self.hovertext, GLOBALS.mX + 100, GLOBALS.mY)
    end
end

function Beer:action()
 

    print("drinking Beer..")


    if player.money >= 5 then
        gameWorldTimeAdjust(1)
        Button:progressBar(0.1)
        player.drunkie = player.drunkie + 1
        
        for k,v in ipairs(POIs) do
            if v.type == "Pub" then
                if player.drunkie == v.levelup then
                    player.drunkie = 0
                    player.lvls.Drunkie = player.lvls.Drunkie + 1
                    if not player.maxaliveness < 1 then
                        player.maxaliveness = player.maxaliveness - player.lvls.Drunkie
                    end
                    player.aliveness = player.aliveness - player.lvls.Drunkie
                end
            end
        end

        player.money = player.money - self.prices.c

        if love.math.random() > 0.5 then
            player:showResolution(1)
            player.aliveness = player.energy + self.prices.e
        else
            player:showResolution(0)
            player.energy = player.aliveness - self.prices.a
            if player.aliveness <= 0 or player.energy <= 0 then
                player:die("You had a fight with the bartender. \nYou raised your fists, he shot you with his shotgun.")
            end
        end
    else
        player:showCant()
    end
 
   
    




    

end

return Beer