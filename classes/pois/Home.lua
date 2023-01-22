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

    if playerState.state ~= playerState.states.progressing then
        love.graphics.draw(GLOBALS.uielements.poibg, GLOBALS.scrw - 580, 24)

        love.graphics.draw(GLOBALS.uielements.actionbg, GLOBALS.scrw - 580, 292)
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print("CHOOSE ACTION:", GLOBALS.scrw - 525, 300)
        love.graphics.setColor(1,1,1)

        
    end
    
        love.graphics.draw(GLOBALS.uielements.levelupbg, GLOBALS.scrw - 330, 164)
        love.graphics.draw(GLOBALS.uielements.tdwcbg, GLOBALS.scrw - 330, 24)

    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 32)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("there's nothing to do\nYou can go out and\nexplore.", GLOBALS.scrw - 570, 182)
        else
            love.graphics.print("Its your home. You can\ndo all kinds of\nfun in here", GLOBALS.scrw - 570, 182)
        end

    end
    
    if player.isInHome then
        love.graphics.draw(self.interiorimg, 32, 32)
        for i = 1, self.levelup do
            love.graphics.rectangle("line", (GLOBALS.scrw - 330) + i * 10, 222, 10, 10)
        end
        if player.sleeper >= 1 then
            for i = 1, player.sleeper do
                love.graphics.rectangle("fill", (GLOBALS.scrw - 330) + i * 10, 222, 10, 10)
            end
        end
    
        love.graphics.print("Sleeping well", GLOBALS.scrw-320, 202)
    end

    
    


end

function Home:action()

    print("in home action")
    print(player.todo) 
    player.isInCity = false
    player.isInHome = true
    local s = Sounds.home:play()
    Button:removeall()

  
    playerState:changeState(playerState.states.poiresolution)

    if GLOBALS.gameworldtime >= 19 or player.energy <= 4  or GLOBALS.gameworldtime <= 6 then
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