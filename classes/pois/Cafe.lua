local Cafe = Poi:extend("Cafe")

function Cafe:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Energy Cafe",
        "Cafe",
        love.graphics.newImage('assets/pic/cafe.png'),
        love.graphics.newImage('assets/pic/cafeinterior.png')
    )
end

function Cafe:draw()
    if player.isInCity then
        love.graphics.draw(self.img, self.x, self.y)
    end
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("A good coffee will give you energy.", GLOBALS.scrw - 570, 150)
        end

    end
    
    if player.isInCafe then
        love.graphics.draw(self.interiorimg, 32, 32)
    end


end

function Cafe:action()

    print("in Cafe action")
    --buttons> gamble, exit

     Button:removeall()
    player.isInCity = false
    player.isInCafe = true
    print("dealer action")
    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Coffee")
    Button:add("GoOut")
  
    self.nothingpanel = true


    self.panelvisible = true



end


return Cafe