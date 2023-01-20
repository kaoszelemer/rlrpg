local Date = Button:extend("Date")

function Date:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Date E3- A2-",
        love.graphics.newImage('assets/pic/button.png')
    )

   
end

function Date:draw()
   
    if playerState.state == playerState.states.poiresolution  then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x + 30, self.y + 30)
        
    end

   --[[  if self.success then
        love.graphics.print("SUCCESS", 700,700)
        self.success = false
    else
        love.graphics.print("FAIL", 700,700)
    end ]]

end

function Date:action()
 

    print("tryn to find a Date..")

    local rnd = love.math.random()
    gameWorldTimeAdjust(3)
    Button:progressBar(0.1)
  
    if player.energy > 3 and player.aliveness > 2 then
        if rnd < 0.18 then
            self.success = true
            player.energy = 10
            player.aliveness = 10
            player:showResolution(1)
        else
            self.success = false
            player.energy = 1
            player.aliveness = 2
            player:showResolution(0)
        end
    else
        player:showCant()
    end
 
   
    




    

end

return Date