local Ticket = Button:extend("Ticket")

function Ticket:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Ticket",
        love.graphics.newImage('assets/pic/button.png'),
        {},
        "You're way out from this miserable town.\nCosts 1000$\nIts almost free."
        
    )

   
end

function Ticket:draw()
   
    if playerState.state == playerState.states.poiresolution  then
        love.graphics.setColor(1,1,1)
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(self.name, self.x + 25, self.y + 25)
        
    end
    if self.hovered then
        love.graphics.setColor(GLOBALS.colors.darkgrey)
        love.graphics.rectangle("fill", GLOBALS.mX + 10, GLOBALS.mY - 60, 250,80)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(self.hovertext, GLOBALS.mX + 15, GLOBALS.mY- 55)
    end
end

function Ticket:action()
 

    print("tryn to buy a ticket..")
    player.isInCity = false

    if player.money > 1000 then
        gameState:changeState(gameState.states.winscreen)
      
    else
        player:showCant()
    end
 
   
    




    

end

return Ticket