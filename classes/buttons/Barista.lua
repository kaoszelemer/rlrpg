local Barista = Button:extend("Barista")

function Barista:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Barista",
        love.graphics.newImage('assets/pic/button.png'),
        {e = 5, c = 38, a = 3, cf = 35},
        "You can work here as a Barista.\nTakes 5 energy.\nTakes 3 aliveness\nGives 38$ on success\nGives 35$ on FAIL"
    )

   
end

function Barista:draw()
   
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

function Barista:action()
    print("Baristaing hard..")

        
        if love.math.random () < 0.7 then
            player:showResolution(1)
     
            player.money = player.money + self.prices.c
        else
            player:showResolution(0)
            player.money = player.money + self.prices.cf
        end
        gameWorldTimeAdjust(7)
        Button:progressBar(0.05)
        player.worker = player.worker + 1
        player.energy = player.energy - self.prices.e
        player.aliveness = player.aliveness - self.prices.a
        if player.aliveness <= 0 or player.energy <= 0 then
            player:die("You made much more cheese than the others\n so on the way home your colleagues lynched you")
        end
 


 
   
    




    

end

return Barista