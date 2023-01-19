local Suicide = Button:extend("Suicide")

function Suicide:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Suicide",
        love.graphics.newImage('assets/pic/button.png')
    )

   
end

function Suicide:draw()
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing  then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x + 30, self.y + 30)
    end
end

function Suicide:action()
    

    print("you win")

    

end

return Suicide