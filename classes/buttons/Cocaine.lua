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
        {e=5,a=5,c=25},
        "Costs 5$\nGives 5 energy on success\nTakes 5 aliveness on fail"
    )

   
end

function Cocaine:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.setColor(1,1,1)
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(self.name, self.x + 25, self.y + 25)
        
    end

    
    if self.hovered then
        love.graphics.setColor(GLOBALS.colors.darkgrey)
        love.graphics.rectangle("fill", GLOBALS.mX + 10, GLOBALS.mY - 60, 250,80)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(self.hovertext, GLOBALS.mX + 15, GLOBALS.mY- 55)
        if player.aliveness - self.prices.a <= 0 then
            love.graphics.setColor(1,1,0)
            love.graphics.print("You may die", self.x + 15, self.y + 38)
            love.graphics.setColor(1,1,1)
        end
    end

end

function Cocaine:action()
 

    print("snorting coke..")
 
    if player.money >= 25 then
        gameWorldTimeAdjust(1)
        player.junkie = player.junkie + 3
        Button:progressBar(1)
        local s = Sounds.cocaine:play()
        for k,v in ipairs(POIs) do
            if v.type == "Dealer" then
                if player.junkie == v.levelup then
                    player.junkie = 0
                    player.lvls.Junkie = player.lvls.Junkie + 1
                    if not player.maxaliveness < 1 then
                        player.maxaliveness = player.maxaliveness - player.lvls.Junkie
                    end
                    player.aliveness = player.aliveness - player.lvls.Junkie
                end
            end
        end

            if love.math.random() > 0.5 then
                player:showResolution(1)
                player.energy = player.energy + self.prices.e
      
                player.money = player.money - self.prices.c
            else
                player:showResolution(0)
                player.money = player.money - self.prices.c
                player.aliveness = player.aliveness - self.prices.a
                if player.aliveness <= 0 or player.energy <= 0 then
                    player:die("You have been given bad cocaine.\n If it doesnt work, why would life?")
                end
            end

   
    else
        player:showCant()
    end
    




    

end

return Cocaine