local ShitBurger = Button:extend("ShitBurger")

function ShitBurger:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "ShitBurger",
        love.graphics.newImage('assets/pic/button.png'),
        {e = 1, a = 1, c = 10},
        "Smells like your armpit\nGives 1 energy on success.\nTakes 1 aliveness on fail\nCosts 10$"
    )

   
end

function ShitBurger:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.print(self.hovertext, GLOBALS.mX + 100, GLOBALS.mY)
    end
end

function ShitBurger:action()
 

    print("eating ShitBurger.")

    if player.money >= 10 then
        gameWorldTimeAdjust(1)
        Button:progressBar(0.1)
        player.fat = player.fat + 1
        for k,v in ipairs(POIs) do
            if v.type == "FastFood" then
                if player.fat == v.levelup then
                    player.fat = 0
                    player.lvls.Fat = player.lvls.Fat + 1
                    if not player.maxenergy < 1 then
                        player.maxenergy = player.maxenergy - player.lvls.Fat
                    end
                    player.maxenergy = player.maxenergy - player.lvls.Fat
                end
            end
        end
        player.money = player.money - self.prices.c

        if love.math.random() > 0.5 then
            player:showResolution(1)
            player.energy = player.energy + self.prices.e
        else
            player:showResolution(0)
            player.aliveness = player.aliveness - self.prices.a
            if player.aliveness <= 0 or player.energy <= 0 then
                player:die("The rotten meat really hit you hard\nYou had diarrhea so explosive that your head exploded")
            end
        end
    else
        player:showCant()
    end
 
   
    




    

end

return ShitBurger