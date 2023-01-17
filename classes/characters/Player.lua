local Player = Poi:extend("Player")

function Player:init()
    Character.init(
        self, 
        "Jonathan Kolbas",
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
    
end


return Player