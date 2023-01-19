local Explore = Button:extend("Explore")

function Explore:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Explore",
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

    Button:progressBar(0.05)
    
  

    gameWorldTimeAdjust(2)

    if cityMap.explorationlevel < 100 and player.energy ~= 0 then
        cityMap.explorationlevel = cityMap.explorationlevel + 3
        player.energy = player.energy - 1
    end

    if cityMap.explorationlevel == 3 then
        local pos = love.math.random(#HOUSES)
        table.insert(POIs, Factory(HOUSES[pos].x * 32, HOUSES[pos].y * 32))
    end
    if cityMap.explorationlevel == 9 then
        local pos = love.math.random(#HOUSES)
        table.insert(POIs, Dealer(HOUSES[pos].x * 32, HOUSES[pos].y * 32))  
    end
    if cityMap.explorationlevel == 18 then
        local pos = love.math.random(#HOUSES)
        table.insert(POIs, Pub(HOUSES[pos].x * 32, HOUSES[pos].y * 32))  
    end

   

    

end

return Explore