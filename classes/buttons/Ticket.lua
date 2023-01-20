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
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x + 25, self.y + 25)
        
    end
    if self.hovered then
        love.graphics.print(self.hovertext, GLOBALS.mX + 100, GLOBALS.mY)
    end
end

function Ticket:action()
 

    print("tryn to buy a ticket..")

    if player.money > 1000 then
        player.isInCity = false
        gameState:changeState(gameState.states.winscreen)
      
    else
        player:showCant()
    end
 
   
    




    

end

return Ticket