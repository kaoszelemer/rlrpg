local Gamble = Button:extend("Gamble")

function Gamble:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Gamble",
        love.graphics.newImage('assets/pic/button.png'),
        {a = -2, c = 10},
        "Gamble on low bets.\nTakes 2 aliveness on every try\nGives double money on success\nCosts 10$"
    )

   
end

function Gamble:draw()
   
    if playerState.state == playerState.states.poiresolution  then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x + 25, self.y + 25)
    end

    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.print(self.hovertext, GLOBALS.mX + 100, GLOBALS.mY)
    end
end

function Gamble:action()
 

    print("tryn to win a Gamble..")

    
    if player.money >= 10 then
        gameWorldTimeAdjust(1)
        Button:progressBar(0.1)
        player.gambler = player.gambler + 1

        for k,v in ipairs(POIs) do
            if v.name == "Ca$ino" then
                if player.gambler == v.levelup then
                    player.gambler = 0
                    player.lvls.Gambler = player.lvls.Gambler + 1
                end
            end
        end

        local rnd = love.math.random()

        if rnd > 0.9 - (player.lvls.Gambler / 10) then
            player:showResolution(1)
            player.money = player.money - self.prices.c
            player.money = player.money * 2
            player.aliveness = player.aliveness - self.prices.a
            if player.aliveness <= 0 or player.energy <= 0 then
                player:die("You've won so much money \nthat you're completely out of the loop\n and there's no point in living any longer")
            end
        else
            player.money = player.money - self.prices.c
            player.aliveness = player.aliveness - self.prices.a
            player:showResolution(0)
        end
    else
        player:showCant()
    end
 
   
    




    

end

return Gamble