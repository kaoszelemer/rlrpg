local Coffee = Button:extend("Coffee")

function Coffee:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Coffee",
        love.graphics.newImage('assets/pic/button.png'),
        {e=2,ef=2,c=10},
        "Costs 10$\nGives 2 energy"
    )

   
end

function Coffee:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.setColor(1,1,1)
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(self.name, self.x + 25, self.y + 25)
    end

    
    if self.hovered then
        love.graphics.setColor(GLOBALS.colors.darkgrey)
        love.graphics.rectangle("fill", GLOBALS.mX + 10, GLOBALS.mY - 60, 150,60)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(self.hovertext, GLOBALS.mX + 15, GLOBALS.mY- 55)
    end

end

function Coffee:action()
 

    print("drinking coffee..")
 
    if player.money >= 5 then
        player.coffeedrinker = player.coffeedrinker + 1

        for k,v in ipairs(POIs) do
            if v.name == "Energy Cafe" then
                if player.coffeedrinker == v.levelup then
                    player.coffeedrinker = 0
                    player.lvls.Barista = player.lvls.Barista + 1
                end
            end
        end

        gameWorldTimeAdjust(1)
        Button:progressBar(1)
        local s = Sounds.coffee:play()
           
                player:showResolution(1)
                player.energy = player.energy + self.prices.e
      
                player.money = player.money - self.prices.c

   
    else
        player:showCant()
    end
    




    

end

return Coffee