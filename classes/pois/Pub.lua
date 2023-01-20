local Pub = Poi:extend("Pub")

function Pub:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "PubicPub",
        "Pub",
        love.graphics.newImage('assets/pic/pub.png')
    )
end

function Pub:draw()

    love.graphics.draw(self.img, self.x, self.y)
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("Smell of booze and liquor\nBut it only opens at night", GLOBALS.scrw - 570, 150)
        end

    end


end

function Pub:action()

    Button:removeall()
    player.isInCity = false
    print("Pub action")
    playerState:changeState(playerState.states.poiresolution)
    
    if GLOBALS.gameworldtime < 19 then
        
        Button:add("GoOut")
    else
        Button:add("Whiskey")
        Button:add("Date")
        Button:add("GoOut")
    end

    
  
    self.nothingpanel = true


    self.panelvisible = true


end


return Pub