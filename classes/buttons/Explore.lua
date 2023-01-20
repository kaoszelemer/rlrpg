local Explore = Button:extend("Explore")

function Explore:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Explore - E1-",
        love.graphics.newImage('assets/pic/button.png')
    )

   
end

function Explore:draw()
    if playerState.state == playerState.states.city and playerState.state ~= playerState.states.progressing then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x + 30, self.y + 30)
    end
end

function Explore:action()
    print("exploring..")

    Button:progressBar(0.1)
    

    gameWorldTimeAdjust(2)

    if cityMap.explorationlevel < 100 and player.energy ~= 0 then
        cityMap.explorationlevel = cityMap.explorationlevel + 3
        player.energy = player.energy - 1
    end

    if cityMap.explorationlevel == 3 then
        local pos = love.math.random(#HOUSES)
        table.insert(POIs, Factory(HOUSES[pos].x * 32, HOUSES[pos].y * 32))
        table.remove(HOUSES, pos)
        player:showResolution(1)
    end
    if cityMap.explorationlevel == 9 then
        local pos = love.math.random(#HOUSES)
        table.insert(POIs, Dealer(HOUSES[pos].x * 32, HOUSES[pos].y * 32))  
        table.remove(HOUSES, pos)
        player:showResolution(1)
    end
    if cityMap.explorationlevel == 18 then
        local pos = love.math.random(#HOUSES)
        table.insert(POIs, Pub(HOUSES[pos].x * 32, HOUSES[pos].y * 32))  
        table.remove(HOUSES, pos)
        player:showResolution(1)
    end
    if cityMap.explorationlevel > 21 then
        
        local rnd = love.math.random(1,5)
        if rnd == 1 and not player.foundfriendlyhome then
            local pos = love.math.random(#HOUSES)
            table.insert(POIs, FriendlyHouse(HOUSES[pos].x * 32, HOUSES[pos].y * 32))
            player.foundfriendlyhome = true
            table.remove(HOUSES, pos)
            player:showResolution(1)
        elseif rnd == 2 and not player.foundcasino then
            local pos = love.math.random(#HOUSES)
            table.insert(POIs, Casino(HOUSES[pos].x * 32, HOUSES[pos].y * 32))
            player.foundcasino = true
            table.remove(HOUSES, pos)
            player:showResolution(1)
        end



    end

   

    

end

return Explore