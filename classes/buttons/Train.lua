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
        {f = 3, cf = 1, c = 30},
        "Sweat and blood smeared over the walls\nTakes 3 fat on success.\nTakes 1 fat on fail\nCosts 30$"
    )

   
end

function Train:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.print(self.hovertext, GLOBALS.mX + 100, GLOBALS.mY)
    end
end

function Train:action()
 

    print("Training muscles..")

    if player.money >= self.prices.c then     

        player.fat = player.fat + 3
        gameWorldTimeAdjust(1)
        Button:progressBar(0.1)

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