local randomnames = require('randomnametable')
local firstname = randomnames[1][love.math.random(1,#randomnames[1])]
local lastname = randomnames[2][love.math.random(1,#randomnames[2])]


local Player = Character:extend("Player")

function Player:init()
    Character.init(
        self, 
        firstname.." "..lastname,
        10,
        0,
        10

    )
end

function Player:updatePlayer(dt)
    if self.showCantdo then
        self.cantdotimer:update(dt)
     
      end
    
      if self.energy > 10 then
        self.energy = 10
      end
      if self.aliveness > 10 then
        self.aliveness = 10
      end

      if self.showSuccess then
        self.successtimer:update(dt)
      end
end

function Player:draw()
    --energy
    love.graphics.setFont(GLOBALS.fonts.stats)
    love.graphics.print("Energy:", 20, GLOBALS.scrh - 40)

    for i = 1, self.energy do
        love.graphics.rectangle("fill", (16 * i)+ 72, GLOBALS.scrh - 40, 12, 12)
        love.graphics.setColor(0,1,0)
        love.graphics.rectangle("line", (16 * i)+ 72, GLOBALS.scrh - 40, 13, 13)
        love.graphics.setColor(1,1,1)
    end

    love.graphics.setFont(GLOBALS.fonts.stats)
    love.graphics.print("Aliveness:", 300, GLOBALS.scrh - 40)

    for i = 1, self.aliveness do
        love.graphics.rectangle("fill", (16 * i)+ 372, GLOBALS.scrh - 40, 12, 12)
        love.graphics.setColor(1,1,0)
        love.graphics.rectangle("line", (16 * i)+ 372, GLOBALS.scrh - 40, 13, 13)
        love.graphics.setColor(1,1,1)
    end

    love.graphics.print("Cash  "..player.money.."$", 580, GLOBALS.scrh - 40)

    if player.showCantdo then
        love.graphics.print("not enough energy or aliveness\n                    or money", 700, 400)
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
        player.successtimer = Timer.after(1, function()
            player.showSuccess = false
        end)
    else
        player.showFail = true
        player.successtimer = Timer.after(1, function()
            player.showFail = false
        end)
    end

end


return Player