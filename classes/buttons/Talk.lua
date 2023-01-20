local Talk = Button:extend("Talk")

function Talk:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Talk",
        love.graphics.newImage('assets/pic/button.png')
    )

   
end

function Talk:draw()
   
    if playerState.state == playerState.states.poiresolution  then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x+25, self.y + 25)
    end


end

function Talk:action()
 

    print("talking with friend..")

  
    gameWorldTimeAdjust(1)
    Button:progressBar(0.1)
    player:showResolution(1)


    player.energy = player.energy + 1
    player.aliveness = player.aliveness + 1
 
   
    




    

end

return Talk