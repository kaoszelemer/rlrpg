local Field = Tile:extend("Field")

function Field:init(x, y)
    Tile.init(
        self, 
        x, 
        y, 
        love.graphics.newImage('assets/pic/grass.png'),
        32,
        32,
        "Field",
        "tile"
    )
end

return Field