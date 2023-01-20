local GoOut = Button:extend("GoOut")

function GoOut:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Go Out",
        love.graphics.newImage('assets/pic/button.png')
    )

   
end

function GoOut:draw()
    if playerState.state == playerState.states.poiresolution and player.isInCity == false and playerState.state ~= playerState.states.progressing then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
end

function GoOut:action()
    print("going out")
  

    for k,v in ipairs(POIs) do
        if v.panelvisible then
            v.panelvisible = false
        end
    end

   -- Button:progressBar(0.05)
  
    Button:removeall()
    player.isInCity = true
    playerState:changeState(playerState.states.city)

    if cityMap.explorationlevel <= 100 then
       Button:add("Explore")
    end

    

end

return GoOut