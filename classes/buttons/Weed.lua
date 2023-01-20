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
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.print(self.hovertext, GLOBALS.mX + 100, GLOBALS.mY)
    end
end

function Weed:action()
 

    print("smoking pot..")

    if player.money >= 5 then
        gameWorldTimeAdjust(1)
        Button:progressBar(0.1)
        
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