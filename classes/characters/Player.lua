local randomnames = require('randomnametable')
local firstname = randomnames[1][love.math.random(1,#randomnames[1])]
local lastname = randomnames[2][love.math.random(1,#randomnames[2])]


local Player = Character:extend("Player")

function Player:init()
    Character.init(
        self, 
        firstname.." "..lastname,
        10,
        2,
        10,
        10,
        10
      

    )

    self.lvls = {
        Explorer = 0,
        Barista = 0,
        Gambler = 0,
        Worshipper = 0,
        Moviewatcher = 0,
        Junkie = 0,
        Worker = 0,
        Fat = love.math.random(79,82),
        Friendliness = 0,
        Sleeper = 0,
        Drunkie = 0
    }

    self.age = love.math.random(18,62)
    local rnd = love.math.random(1,3)
    if rnd == 1 then
        self.sex = "He/Him"
    elseif rnd == 2 then
        self.sex = "She/Her"
    elseif rnd == 3 then
        self.sex = "They/Them"
    end

end

function Player:updatePlayer(dt)
    if self.showCantdo then
        self.cantdotimer:update(dt)
     
      end
    
      if self.energy > self.maxenergy then
        self.energy = self.maxenergy
      end
      if self.aliveness > self.maxaliveness then
        self.aliveness = self.maxaliveness
      end

      if self.showSuccess then
        self.successtimer:update(dt)
      end
      if self.showFail then
        self.failtimer:update(dt)
      end

      
      


end

function Player:draw()
    --energy
    love.graphics.setColor(GLOBALS.colors.white)
    love.graphics.setFont(GLOBALS.fonts.header)

    love.graphics.print("Energy:", 222, GLOBALS.scrh - 100)

    for i = 1, self.energy do
        love.graphics.setColor(GLOBALS.colors.red)
        love.graphics.rectangle("fill", (42 * i), GLOBALS.scrh - 60, 38, 38)
        love.graphics.setColor(GLOBALS.colors.white)
    end


    love.graphics.print("Aliveness:", 860, GLOBALS.scrh - 100)

    for i = 1, self.aliveness do
   
        love.graphics.setColor(GLOBALS.colors.green)
        love.graphics.rectangle("fill", (42 * i)+ 652, GLOBALS.scrh - 60, 38, 38)
        love.graphics.setColor(GLOBALS.colors.white)
    end

    love.graphics.setFont(GLOBALS.fonts.stats)
 

    if player.showCantdo then
        love.graphics.print("not enough money", GLOBALS.scrw - 570, 600)
    end

    if player.showSuccess then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print("SUCCESS", GLOBALS.scrw - 550,250)
        love.graphics.setFont(GLOBALS.fonts.stats)
    elseif player.showFail then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print("FAIL", GLOBALS.scrw - 550,250)
        love.graphics.setFont(GLOBALS.fonts.stats)
    end

    for k,v in pairs(self.lvls) do
      if v >= 1 and k ~= "Fat" then
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print(k.." lvl "..v, GLOBALS.scrw - 310, 360 + #k * 14)
        love.graphics.setColor(1,1,1)
    end
      if k == "Fat" then
        love.graphics.setColor(GLOBALS.colors.white)
        love.graphics.print("Weight: "..v.."kg", GLOBALS.scrw - 310, 360 + #k * 14)
        love.graphics.setColor(1,1,1)
      end
    end
    
end

function Player:showCant()
    player.showCantdo = true
    player.cantdotimer = Timer.after(1, function ()
        player.showCantdo = false
    end)
end

function Player:showResolution(s)
    
    if s == 1 then
        player.showSuccess = true
        local instance = Sounds.applause:play()
        player.successtimer = Timer.after(1, function()
            player.showSuccess = false
        end)
    else
        player.showFail = true
        local instance = Sounds.boo:play()
        player.failtimer = Timer.after(1, function()
            player.showFail = false
        end)
    end

end

function Player:die(cause)

    if love.math.random() > 0.6 then
        player.energy = 3
        player.aliveness = 3
        GLOBALS.gameworldtime = 8
        GLOBALS.gameworlddays = GLOBALS.gameworlddays + 2
        gameState:changeState(gameState.states.passout)

    else
        gameState:changeState(gameState.states.gameover)
        GLOBALS.deathscreeninfos = {
            cause = cause,
            time = GLOBALS.gameworldtime,
            day = GLOBALS.gameworlddays,
            money = player.money,
    
        }
    end


   

end


return Player