local FriendlyHome = Poi:extend("FriendlyHome")

function FriendlyHome:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Friend",
        "FriendlyHome",
        love.graphics.newImage('assets/pic/friendlyhouse.png'),
        love.graphics.newImage('assets/pic/friendlyhomeinterior.png'),
        20
    )
end

function FriendlyHome:draw()

    if player.isInCity then
        love.graphics.draw(self.img, self.x, self.y)
    end
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 32)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("at least you found a friend.\nHe lives here.\nThe house is the same shit as every other.", GLOBALS.scrw - 570, 182)
        end

    end
    
    if player.isInFh then
        love.graphics.draw(self.interiorimg, 32, 32)
        for i = 1, self.levelup do
            love.graphics.rectangle("line", (GLOBALS.scrw - 330) + i * 10, 222, 10, 10)
        end
        if player.friendliness >= 1 then
            for i = 1, player.friendliness do
                love.graphics.rectangle("fill", (GLOBALS.scrw - 330) + i * 10, 222, 10, 10)
            end
        end
    
        love.graphics.print("Friendliness", GLOBALS.scrw-320, 202)
    end


end

function FriendlyHome:action()

    print("in FriendlyHome action")
    --buttons> talk, exit

    Button:removeall()
    player.isInCity = false
    player.isInFh = true
    local s = Sounds.friendlyhome:play()
    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Talk")
    Button:add("GoOut")
  
    self.nothingpanel = true


    self.panelvisible = true


end


return FriendlyHome