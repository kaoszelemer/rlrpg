local Talk = Button:extend("Talk")

function Talk:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Talk",
        love.graphics.newImage('assets/pic/button.png'),
        {e = 1, a = 1},
        "Try to chit-chat.\nGives 1 energy on success.\nGives 1 aliveness on success.\nTakes 1 energy or aliveness on fail"
    )

   
end

function Talk:draw()
   
    if playerState.state == playerState.states.poiresolution  then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x+25, self.y + 25)
    end
    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.print(self.hovertext, GLOBALS.mX + 100, GLOBALS.mY)
    end

end

function Talk:action()
 

    print("talking with friend..")

  
    gameWorldTimeAdjust(1)
    Button:progressBar(0.1)


    if love.math.random() > 0.5 then
        player:showResolution(1)
        player.energy = player.energy + self.prices.e
        player.aliveness = player.aliveness + self.prices.a
    else
        player:showResolution(0)
        if love.math.random() > 0.4 then
            player.energy = player.energy - self.prices.e
        else
            player.aliveness = player.aliveness - self.prices.a
        end
    end
 
   
    




    

end

return Talk