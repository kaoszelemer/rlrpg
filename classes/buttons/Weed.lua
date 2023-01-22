local Weed = Button:extend("Weed")

function Weed:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Weed",
        love.graphics.newImage('assets/pic/button.png'),
        {e = 2, a = 2, c = 5},
        "Ordered by the doctor\nGives 2 aliveness on success.\nTakes 2 energy on fail\nCosts 5$"
    )

   
end

function Weed:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.setColor(1,1,1)
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.setColor(GLOBALS.colors.darkgrey)
        love.graphics.rectangle("fill", GLOBALS.mX + 10, GLOBALS.mY - 60, 250,80)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(self.hovertext, GLOBALS.mX + 15, GLOBALS.mY- 55)
        if player.energy - self.prices.e <= 0 then
            love.graphics.setColor(1,1,0)
            love.graphics.print("You may die", self.x + 15, self.y + 38)
            love.graphics.setColor(GLOBALS.colors.white)
        end
    end
end

function Weed:action()
 

    print("smoking pot..")

    if player.money >= 5 then
        gameWorldTimeAdjust(1)
        Button:progressBar(1)
        local s = Sounds.weed:play()
        player.junkie = player.junkie + 1
        
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

        player.money = player.money - self.prices.c

        if love.math.random() > 0.5 then
            player:showResolution(1)
            player.aliveness = player.aliveness + self.prices.a
        else
            player:showResolution(0)
            player.energy = player.energy - self.prices.e
            if player.aliveness <= 0 or player.energy <= 0 then
                player:die("You smoked so much that you slipped on a banana peel \nand fell on a sword that stabbed you in the forehead")
            end
        end
    else
        player:showCant()
    end
 
   
    




    

end

return Weed