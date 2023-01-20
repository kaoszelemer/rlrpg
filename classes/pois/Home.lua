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
        love.graphics.print(self.name, GLOBALS.scrw - 570, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("there's nothing to do now.\nYou can go out and\nexplore your surrondings.", GLOBALS.scrw - 300, 150)
        end

    end


end

function Home:action()

    print("in home action")
    print(player.todo) 
    player.isInCity = false
    Button:removeall()

  
    playerState:changeState(playerState.states.poiresolution)

    if GLOBALS.gameworldtime >= 19 or player.energy <= 4 then
        player.todo = 1
        Button:add("Sleep")
    end

    if player.aliveness < 2 then
        player.todo =1
        Button:add("Suicide")
    end

    if player.todo == nil then
        self.nothingpanel = true
        Button:add("GoOut")
    end
    
    self.panelvisible = true




end


return Home