local District = Tile:extend("District")

function District:init(x, y)
    Tile.init(
        self, 
        x, 
        y, 
        love.graphics.newImage('assets/pic/asphalt.png'),
        32,
        32,
        "District",
        "tile"
    )
end

return District