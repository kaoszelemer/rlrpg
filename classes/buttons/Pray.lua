local Pray = Button:extend("Pray")

function Pray:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Pray",
        love.graphics.newImage('assets/pic/button.png'),
        {e = 0, a = 2, c = 1},
        "Sell your soul to the carpheadman\nGives 1$\nGives 2 aliveness on success\nTakes 2 aliveness on fail"
    )

   
end

function Pray:draw()
   
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

function Pray:action()
 

    print("praying to carpheadman..")

  
        gameWorldTimeAdjust(3)
        Button:progressBar(0.1)
        player.worshipper = player.worshipper + 1

        for k,v in ipairs(POIs) do
            if v.name == "Church" then
                if player.worshipper == v.levelup then
                    player.worshipper = 0
                    player.lvls.Worshipper = player.lvls.Worshipper + 1
                end
            end
        end

        player.money = player.money + self.prices.c + (player.lvls.Worshipper * 10)

        if love.math.random() > 0.5 then
            player.aliveness = player.aliveness - self.prices.a
        else
            player.aliveness = player.aliveness + self.prices.a
        end
     
        if player.aliveness <= 0 or player.energy <= 0 then
            player:die("You summoned the carpheadman\nAnd it chewed your head off")
        end
    
   
    




    

end

return Pray