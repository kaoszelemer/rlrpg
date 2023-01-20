local Busstop = Poi:extend("Busstop")

function Busstop:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Travel to Arizome",
        "Busstop",
        love.graphics.newImage('assets/pic/busstop.png'),
        love.graphics.newImage('assets/pic/businterior.png')
    )
end

function Busstop:draw()

    if player.isInCity then
        love.graphics.draw(self.img, self.x, self.y)
    end
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("A cheap ticket to salvation", GLOBALS.scrw - 570, 150)
        end

    end
    
    if player.isInBusStop then
        love.graphics.draw(self.interiorimg, 32, 32)
    end


end

function Busstop:action()

    print("in Busstop action")
    --buttons> gamble, exit

     Button:removeall()
    player.isInCity = false
    player.isInBusStop = true
    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Ticket")
    Button:add("GoOut")
  
    self.nothingpanel = true


    self.panelvisible = true



end


return Busstop