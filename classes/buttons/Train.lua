local Train = Button:extend("Train")

function Train:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Train",
        love.graphics.newImage('assets/pic/button.png'),
        {f = 3, cf = 1, c = 30, a= 0, e = 3},
        "Sweat and blood\nTakes 3 fat on success.\nTakes 1 fat on fail\nCosts 30$\nTakes 3 Energy"
    )

   
end

function Train:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.setColor(1,1,1)
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.setColor(GLOBALS.colors.darkgrey)
        love.graphics.rectangle("fill", GLOBALS.mX + 10, GLOBALS.mY - 60, 300,120)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(self.hovertext, GLOBALS.mX + 15, GLOBALS.mY- 55)
        if player.energy - self.prices.e <= 0 or player.aliveness - self.prices.a <= 0 then
            love.graphics.setColor(1,1,0)
            love.graphics.print("You may die", self.x + 15, self.y + 38)
            love.graphics.setColor(GLOBALS.colors.white)
        end
    end
end

function Train:action()
 

    print("Training muscles..")

    if player.money >= self.prices.c then     

        player.fat = player.fat + 3
        gameWorldTimeAdjust(2)
        Button:progressBar(2)
        local s = Sounds.train:play()
        player.energy = player.energy - self.prices.e

        if player.energy <= 0 then
            player:die("You trained so hard\nthe 100kg weight fell down on your neck while brenchpressing.")
        end

        player.money = player.money - self.prices.c

        if love.math.random() > 0.5 then
            player:showResolution(1)
            for k,v in ipairs(POIs) do
                if v.type == "FastFood" then
                    if player.fat == v.levelup then
                        player.fat = 0
                        if player.lvs.Fat - self.prices.f > 0 then
                            player.lvls.Fat = player.lvls.Fat - self.prices.f
                        end
                        if player.lvls.Fat < 88 then
                            if player.maxenergy <= 12 then
                                player.maxenergy = player.maxenergy + player.lvls.Fat
                            end
                        end
                
                    end
                end
            end
        else
            player:showResolution(0)
            for k,v in ipairs(POIs) do
                if v.type == "FastFood" then
                    if player.fat == v.levelup then
                        player.fat = 0
                        if player.lvs.Fat - self.prices.cf > 0 then
                            player.lvls.Fat = player.lvls.Fat - self.prices.cf
                        end
                        if player.lvls.Fat < 88 then
                            if player.maxenergy <= 12 then
                                player.maxenergy = player.maxenergy + 1
                            end
                        end
                    end
                end
            end
        end
    else
        player:showCant()
    end
 
   
    




    

end

return Train