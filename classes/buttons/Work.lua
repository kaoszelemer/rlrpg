local Work = Button:extend("Work")

function Work:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Work",
        love.graphics.newImage('assets/pic/button.png'),
        {e = 5, c = 18, a = 6, cf = 15},
        "A place to get money.\nTakes 5 energy.\nTakes 6 aliveness\nGives 18$ on success\nGives 15$ on FAIL"
    )

   
end

function Work:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x+25, self.y + 25)
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

function Work:action()
    print("working hard..")

        
      
        gameWorldTimeAdjust(9)
        Button:progressBar(0.05)
        player.worker = player.worker + 1

        for k,v in ipairs(POIs) do
            if v.type == "Factory" then
                if player.worker == v.levelup then
                    player.worker = 0
                    player.lvls.Worker = player.lvls.Worker + 1
                end
            end
        end

        if love.math.random () < 0.7 then
            player:showResolution(1)
            player.money = player.money + self.prices.c + (player.lvls.Worker * 10)
        else
            player:showResolution(0)
            player.money = player.money + self.prices.cf + (player.lvls.Worker * 10)
        end

        player.energy = player.energy - self.prices.e
        player.aliveness = player.aliveness - self.prices.a
        if player.aliveness <= 0 or player.energy <= 0 then
            player:die("You made much more cheese than the others\n so on the way home your colleagues lynched you")
        end
 


 
   
    




    

end

return Work