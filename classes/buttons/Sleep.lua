local Sleep = Button:extend("Sleep")

function Sleep:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Sleep",
        love.graphics.newImage('assets/pic/button.png'),
        {},
        "ZZZzzzZZZ.\nGives 7 energy on success.\nGives 6 aliveness on success.\nGives 3 energy on fail\nGives 3 aliveness on fail"
    )

   
end

function Sleep:draw()
    if playerState.state == playerState.states.poiresolution and playerState.state ~= playerState.states.progressing  then
        love.graphics.draw(self.img, self.x, self.y)
        love.graphics.print(self.name, self.x +25, self.y + 25)
    end
end

function Sleep:action()
    print("sleep buttonaction")
  
    Button:removeall()
    Button:add("GoOut")
   
    Button:progressBar(0.1)
    player.sleeper = player.sleeper + 1

    for k,v in ipairs(POIs) do
        if v.type == "FriendlyHome" then
            if player.sleeper == v.levelup then
                player.sleeper = 0
                player.lvls.Sleeper = player.lvls.Sleeper + 1
            end
        end
    end

    if love.math.random() > 0.3 then
    player:showResolution(1)
    
    GLOBALS.gameworldtime = 8
    GLOBALS.gameworlddays = GLOBALS.gameworlddays + 1
    player.energy = player.energy + 7 + player.lvls.Sleeper
    player.aliveness = player.aliveness + 6 + player.lvls.Sleeper
    player.todo = nil
    else
    player:showResolution(0)
    GLOBALS.gameworldtime = 8
    GLOBALS.gameworlddays = GLOBALS.gameworlddays + 1
    player.energy = player.energy + 3 + player.lvls.Sleeper
    player.aliveness = player.aliveness + 3 + player.lvls.Sleeper
    player.todo = nil 
    end

    

end

return Sleep