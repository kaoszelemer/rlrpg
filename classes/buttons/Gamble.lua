local Gamble = Button:extend("Gamble")

function Gamble:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Gamble - 10$-",
        love.graphics.newImage('assets/pic/button.png')
    )

   
end

function Gamble:draw()
   
    if playerState.state == playerState.states.poiresolution  then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x + 30, self.y + 30)
        
    end


end

function Gamble:action()
 

    print("tryn to win a Gamble..")

    local rnd = love.math.random()
    gameWorldTimeAdjust(1)
    Button:progressBar(0.1)
    if player.money >= 10 then
        local rnd = love.math.random()
        if rnd > 0.9 then
            player:showResolution(1)
            player.money = player.money - 10
            player.money = player.money * 2
        else
            player.money = player.money - 10
            player:showResolution(0)
        end
    else
        player:showCant()
    end
 
   
    




    

end

return Gamble