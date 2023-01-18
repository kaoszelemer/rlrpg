local Road = Tile:extend("Road")

function Road:init(x, y)
    Tile.init(
        self, 
        x, 
        y, 
        love.graphics.newImage('assets/pic/roadver.png'),
        32,
        32,
        "Road",
        "tile"
    )
end

return Road