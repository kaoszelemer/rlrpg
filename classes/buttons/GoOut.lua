local GoOut = Button:extend("GoOut")

function GoOut:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Go Out",
        love.graphics.newImage('assets/pic/button.png'),
        {},
        "Exit from this POI.\nThe only thing whats free"
    )

   
end

function GoOut:draw()
    if playerState.state == playerState.states.poiresolution and player.isInCity == false and playerState.state ~= playerState.states.progressing then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
    if self.hovered and playerState.state ~= playerState.states.progressing then
        love.graphics.print(self.hovertext, GLOBALS.mX + 100, GLOBALS.mY)
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

    player.isInCafe = false
    player.isInBusStop = false
    player.isInCasino = false
    player.isInCity = true
    player.isInDealer = false
    player.isInFactory = false
    player.isInFh = false
    player.isInMovie = false
    player.isInPub = false
    player.isInHome = false
    player.isInChurch = false

    

end

return GoOut