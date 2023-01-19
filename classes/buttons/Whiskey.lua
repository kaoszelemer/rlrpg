local Whiskey = Button:extend("Whiskey")

function Whiskey:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Whiskey",
        love.graphics.newImage('assets/pic/button.png')
    )

   
end

function Whiskey:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x + 30, self.y + 30)
    end
end

function Whiskey:action()
 

    print("drinking whiskey..")

    if player.money >= 5 then
        gameWorldTimeAdjust(1)
        if player.aliveness < 9 then
            player.aliveness = player.aliveness + 1
        else
            player.aliveness = 10
        end
        if player.energy > 0 then
            player.energy = player.energy + 1
        else
            player:showCant()
        end
        player.money = player.money - 5
    else
        player:showCant()
    end
 
   
    




    

end

return Whiskey