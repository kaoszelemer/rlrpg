local Player = Poi:extend("Player")

function Player:init()
    Character.init(
        self, 
        RANDOMNAMES[1][love.math.random(1,#RANDOMNAMES[1])].." "..RANDOMNAMES[2][love.math.random(1,#RANDOMNAMES[2])],
        10,
        0,
        10

    )
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
        love.graphics.print("not enough energy or aliveness\n                    or money", 700, 600)
    end
    
end

function Player:showCant()
    player.showCantdo = true
    player.cantdotimer = Timer.after(0.5, function ()
        player.showCantdo = false
    end)
end


return Player