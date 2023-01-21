local Church = Poi:extend("Church")

function Church:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Church",
        "Church",
        love.graphics.newImage('assets/pic/church.png'),
        love.graphics.newImage('assets/pic/churchinterior.png'),
        30
    )
end

function Church:draw()
    if player.isInCity then
        love.graphics.draw(self.img, self.x, self.y)
    end
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("It's the church for the carpheadman.\nPreying to this deity\nwill make you feel better.", GLOBALS.scrw - 570, 150)
        end

    end
    
    if player.isInChurch then
        love.graphics.draw(self.interiorimg, 32, 32)
        for i = 1, self.levelup do
            love.graphics.rectangle("line", (GLOBALS.scrw - 450) + i * 10, 20, 10, 10)
        end
        if player.worshipper >= 1 then
            for i = 1, player.worshipper do
                love.graphics.rectangle("fill", (GLOBALS.scrw - 450) + i * 10, 20, 10, 10)
            end
        end
    end


end

function Church:action()

    Button:removeall()
    player.isInCity = false
    player.isInChurch = true
    print("Church action")
    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Pray")
    Button:add("GoOut")
  
    self.nothingpanel = true


    self.panelvisible = true


end


return Church