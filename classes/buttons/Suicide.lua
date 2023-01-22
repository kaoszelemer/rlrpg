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
        love.graphics.setColor(1,1,1)
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.setColor(GLOBALS.colors.darkgrey)
        love.graphics.rectangle("fill", GLOBALS.mX + 10, GLOBALS.mY - 60, 150,50)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(self.hovertext, GLOBALS.mX + 15, GLOBALS.mY- 55)
        love.graphics.setColor(1,1,0)
        love.graphics.print("You may die", self.x + 15, self.y + 38)
        love.graphics.setColor(GLOBALS.colors.white)
    end
end

function Suicide:action()
    
    
    gameState:changeState(gameState.states.winscreen)
    

end

return Suicide