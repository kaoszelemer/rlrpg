local Dealer = Poi:extend("Dealer")

function Dealer:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Cheese Dealer",
        "Dealer",
        love.graphics.newImage('assets/pic/dealer.png')
    )
end

function Dealer:draw()

    love.graphics.draw(self.img, self.x, self.y)
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 350, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("It's the local drugdealer.\nHe has two kinds of goods\nCocaine or weed", GLOBALS.scrw - 300, 150)
        end

    end


end

function Dealer:action()

    Button:removeall()
    print("dealer action")
    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Cocaine")
    Button:add("Weed")
    Button:add("GoOut")
  
    self.nothingpanel = true


    self.panelvisible = true


end


return Dealer