local Dealer = Poi:extend("Dealer")

function Dealer:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Drugs Dealer",
        "Dealer",
        love.graphics.newImage('assets/pic/dealer.png'),
        love.graphics.newImage('assets/pic/dealerinterior.png')
    )
end

function Dealer:draw()

    love.graphics.draw(self.img, self.x, self.y)
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("It's the local drugdealer.\nHe has two kinds of goods\nCocaine or weed", GLOBALS.scrw - 570, 150)
        end

    end
    
    if player.isInDealer then
        love.graphics.draw(self.interiorimg, 32, 32)
    end


end

function Dealer:action()

    Button:removeall()
    player.isInCity = false
    player.isInDealer = true
    print("dealer action")
    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Cocaine")
    Button:add("Weed")
    Button:add("GoOut")
  
    self.nothingpanel = true


    self.panelvisible = true


end


return Dealer