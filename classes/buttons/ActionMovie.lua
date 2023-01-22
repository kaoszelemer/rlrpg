local ActionMovie = Button:extend("ActionMovie")

function ActionMovie:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Watch Action",
        love.graphics.newImage('assets/pic/button.png'),
        {e = 0, a = 2, c = 9},
        "A shitty movie about a soldier\nkilling a robotic killer nurse\nTakes 3 aliveness\nGives 2 energy\nCosts 9$"
    )

   
end

function ActionMovie:draw()
   
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing then
        love.graphics.setColor(1,1,1)
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.setColor(GLOBALS.colors.darkgrey)
        love.graphics.rectangle("fill", GLOBALS.mX + 10, GLOBALS.mY - 60, 300,100)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(self.hovertext, GLOBALS.mX + 15, GLOBALS.mY- 55)
     


        if player.energy - self.prices.e <= 0 or player.aliveness - self.prices.a <= 0 then
            love.graphics.setColor(1,1,0)
            love.graphics.print("You may die", self.x + 15, self.y + 38)
            love.graphics.setColor(1,1,1)
        end
    end
end

function ActionMovie:action()
 

    print("watching a shitty ActionMovie..")

    if player.money >= 13 then
        gameWorldTimeAdjust(3)
        Button:progressBar(3)
        local s = Sounds.actionmovie:play()
        player.moviewatcher = player.moviewatcher + 1

        for k,v in ipairs(POIs) do
            if v.name == "Cinema" then
                if player.moviewatcher == v.levelup then
                    player.moviewatcher = 0
                    player.lvls.Moviewatcher = player.lvls.Moviewatcher + 1
                    if player.maxaliveness > 12 then
                        player.maxaliveness = player.maxaliveness + 1
                    end
                    player.aliveness = player.aliveness + 1
                end
            end
        end

        player.money = player.money - self.prices.c

        player.aliveness = player.aliveness - self.prices.a
     
            if player.aliveness <= 0 or player.energy <= 0 then
                player:die("You died of a heart attack because the film\nYou watched was too exciting")
            end
        
    else
        player:showCant()
    end

    
 
   
    




    

end

return ActionMovie