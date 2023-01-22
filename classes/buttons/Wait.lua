local Wait = Button:extend("Wait")

function Wait:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Wait",
        love.graphics.newImage('assets/pic/button.png'),
        {e = 0, a = 1, af=2},
        "Pass the time\nTakes 1 aliveness on success\nTakes 2 aliveness on fail"
    )

   
end

function Wait:draw()
   
    if playerState.state == playerState.states.city and playerState.state ~= playerState.states.progressing then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.print(self.hovertext, GLOBALS.mX + 100, GLOBALS.mY)
        if player.aliveness - self.prices.af <= 0 or player.aliveness - self.prices.a <= 0 then
            love.graphics.setColor(1,1,0)
            love.graphics.print("You may die", self.x + 15, self.y + 38)
            love.graphics.setColor(1,1,1)
        end
    end
end

function Wait:action()
 

    print("Waiting for something to happen..")

  
        gameWorldTimeAdjust(1)
        Button:progressBar(1)
   
        if love.math.random() > 0.5 then
            player:showResolution(1)
            player.aliveness = player.aliveness - self.prices.a
        else
            player:showResolution(0)
            player.aliveness = player.aliveness - self.prices.af
        end
     
        if player.aliveness <= 0 or player.energy <= 0 then
            player:die("You died in boredom.")
        end
    
   
    




    

end

return Wait