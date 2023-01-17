local House = Tile:extend("House")

function House:init(x, y)
    Tile.init(
        self, 
        x, 
        y, 
        love.graphics.newImage('assets/pic/house.png'), 
        32,
        32,
        "House",
        "tile"
    )
end

return House