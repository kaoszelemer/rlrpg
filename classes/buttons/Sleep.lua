local Sleep = Button:extend("Sleep")

function Sleep:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Sleep",
        love.graphics.newImage('assets/pic/button.png')
    )

   
end

function Sleep:draw()
    if playerState.state ~= playerState.states.city then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x + 30, self.y + 30)
    end
end

function Sleep:action()
    print("sleep buttonaction")
  
    Button:removeall()
    Button:add("GoOut")
   
    Button:progressBar(0.1)
    
    GLOBALS.gameworldtime = 8
    player.energy = player.energy + 7
    player.aliveness = player.aliveness + 6
    player.todo = nil

    

end

return Sleep