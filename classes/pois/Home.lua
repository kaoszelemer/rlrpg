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
        love.graphics.newImage('assets/pic/home.png'),
        love.graphics.newImage('assets/pic/homeinterior.png'),
        25
    )
end

function Home:draw()
    if player.isInCity then
        love.graphics.draw(self.img, self.x, self.y)
    end
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("there's nothing to do now.\nYou can go out and\nexplore your surrondings.", GLOBALS.scrw - 570, 150)
        end

    end
    
    if player.isInHome then
        love.graphics.draw(self.interiorimg, 32, 32)
        for i = 1, self.levelup do
            love.graphics.rectangle("line", (GLOBALS.scrw - 300) + i * 10, 20, 10, 10)
        end
        if player.sleeper >= 1 then
            for i = 1, player.sleeper do
                love.graphics.rectangle("fill", (GLOBALS.scrw - 300) + i * 10, 20, 10, 10)
            end
        end
    end


end

function Home:action()

    print("in home action")
    print(player.todo) 
    player.isInCity = false
    player.isInHome = true
    Button:removeall()

  
    playerState:changeState(playerState.states.poiresolution)

    if GLOBALS.gameworldtime >= 19 or player.energy <= 4 then
        player.todo = 1
        Button:add("Sleep")
        Button:add("GoOut")
    end

    if player.aliveness < 2 then
        player.todo =1
        Button:add("Suicide")
        Button:add("GoOut")
    end

    if player.todo == nil then
        self.nothingpanel = true
        Button:add("GoOut")
    end
    
    self.panelvisible = true




end


return Home