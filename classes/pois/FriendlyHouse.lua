local FriendlyHome = Poi:extend("FriendlyHome")

function FriendlyHome:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Your friend lives here",
        "FriendlyHome",
        love.graphics.newImage('assets/pic/FriendlyHouse.png')
    )
end

function FriendlyHome:draw()

    love.graphics.draw(self.img, self.x, self.y)
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 350, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("at least you found a friend.\nHe lives here.\nThe house is the same shit as every other.", GLOBALS.scrw - 300, 150)
        end

    end


end

function FriendlyHome:action()

    print("in FriendlyHome action")
    --buttons> talk, exit

    Button:removeall()
    player.isInCity = false
    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Talk")
    Button:add("GoOut")
  
    self.nothingpanel = true


    self.panelvisible = true


end


return FriendlyHome