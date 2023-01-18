local Work = Button:extend("Work")

function Work:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Work",
        love.graphics.newImage('assets/pic/button.png')
    )

   
end

function Work:draw()
   
    if playerState.state == playerState.states.poiresolution then
        love.graphics.draw(self.img, self.x, self.y)
    end
end

function Work:action()
 

    Button:progressBar(0.05)
    
    --[[ for i = 1, #BUTTONS do
        table.remove(BUTTONS, i)
    end ]]

   --[[  if GLOBALS.gameworldtime < 24 then
        GLOBALS.gameworldtime = GLOBALS.gameworldtime + 1
    else
        GLOBALS.gameworldtime = 8
    end

    if cityMap.explorationlevel < 100 and player.energy ~= 0 then
        cityMap.explorationlevel = cityMap.explorationlevel + 3
        player.energy = player.energy - 1
    end

    if cityMap.explorationlevel == 3 then
        local pos = love.math.random(#HOUSES)

        table.insert(POIs, Factory(HOUSES[pos].x * 32, HOUSES[pos].y * 32))
    
       -- PoiWorld:add(POIs[1], POIs[1].x, POIs[1].y, POIs[1].w, POIs[1].h)
      
    end ]]

  --  table.insert(BUTTONS, Work(GLOBALS.scrw-280, 312))

    

end

return Work