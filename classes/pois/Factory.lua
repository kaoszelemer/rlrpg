local Factory = Poi:extend("Factory")

function Factory:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Cheese Factory",
        "Factory",
        love.graphics.newImage('assets/pic/factory.png')
    )
end

function Factory:draw()

    love.graphics.draw(self.img, self.x, self.y)
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 350, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("It's a cheesefactory.\nThey are also known as slavers\nSmells like heaven", GLOBALS.scrw - 300, 150)
        end

    end


end

function Factory:action()

    print("action")
    for i = 1, #BUTTONS do
        table.remove(BUTTONS, i)
    end
   
    self.nothingpanel = true

    playerState:changeState(playerState.states.poiresolution)
    
    local exit = GoOut(GLOBALS.scrw-280, 312)
    local work = Work(GLOBALS.scrw-280, 500)
    table.insert(BUTTONS, work)
    table.insert(BUTTONS, exit)


  

    
    self.panelvisible = true


end


return Factory