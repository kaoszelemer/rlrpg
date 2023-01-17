local Home = Poi:extend("Home")

function Home:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Your Home",
        "home",
        love.graphics.newImage('assets/pic/home.png')
    )
end

function Home:draw()

    love.graphics.draw(self.img, self.x, self.y)
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 200, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("there's nothing to do now.\nYou can go out and\nexplore your surrondings.", GLOBALS.scrw - 300, 150)
        end

    end


end

function Home:action()

    print("action")
    if self.todo == nil then
        self.nothingpanel = true
        local action = GoOut(GLOBALS.scrw-280, 250)
        table.insert(BUTTONS, action)

    end
    
    self.panelvisible = true


end


return Home