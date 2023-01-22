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
        love.graphics.newImage('assets/pic/pub.png'),
        love.graphics.newImage('assets/pic/pubinterior.png'),
        10
    )
end

function Pub:draw()
    if player.isInCity then
        love.graphics.draw(self.img, self.x, self.y)
    end
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 32)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("Smell of booze and liquor\nBut it only opens at night", GLOBALS.scrw - 570, 182)
        end

    end

    if player.isInPub then
        love.graphics.draw(self.interiorimg, 32, 32)
        for i = 1, self.levelup do
            love.graphics.rectangle("line", (GLOBALS.scrw - 330) + i * 10, 222, 10, 10)
        end
        if player.drunkie >= 1 then
            for i = 1, player.drunkie do
                love.graphics.rectangle("fill", (GLOBALS.scrw - 330) + i * 10, 222, 10, 10)
            end
        end
    
        love.graphics.print("Alcoholism", GLOBALS.scrw-320, 202)
    end


end

function Pub:action()

    Button:removeall()
    player.isInCity = false
    player.isInPub = true
    local s = Sounds.pub:play()
    print("Pub action")
    playerState:changeState(playerState.states.poiresolution)
    
    if GLOBALS.gameworldtime < 19 then
        
        Button:add("GoOut")
    else
        Button:add("Whiskey")
        Button:add("Beer")
        Button:add("Date")
        Button:add("GoOut")
    end

    
  
    self.nothingpanel = true


    self.panelvisible = true


end


return Pub