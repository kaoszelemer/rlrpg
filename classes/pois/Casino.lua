local Casino = Poi:extend("Casino")

function Casino:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Ca$ino",
        "Casino",
        love.graphics.newImage('assets/pic/Casino.png')
    )
end

function Casino:draw()

    love.graphics.draw(self.img, self.x, self.y)
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("A place where you can spend\nyour hard earned money.", GLOBALS.scrw - 300, 150)
        end

    end


end

function Casino:action()

    print("in Casino action")
    --buttons> gamble, exit

     Button:removeall()
    player.isInCity = false
    print("dealer action")
    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Gamble")
    Button:add("GoOut")
  
    self.nothingpanel = true


    self.panelvisible = true



end


return Casino