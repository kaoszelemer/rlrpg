local Suicide = Button:extend("Suicide")

function Suicide:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Suicide",
        love.graphics.newImage('assets/pic/button.png'),
        {},
        "Take your own life.\nIt's free."
    )

   
end

function Suicide:draw()
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing  then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.print(self.hovertext, GLOBALS.mX + 100, GLOBALS.mY)
        love.graphics.setColor(1,1,0)
        love.graphics.print("You may die", self.x + 15, self.y + 38)
        love.graphics.setColor(1,1,1)
    end
end

function Suicide:action()
    
    
    gameState:changeState(gameState.states.winscreen)
    

end

return Suicide