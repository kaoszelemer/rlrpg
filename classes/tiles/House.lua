local House = Tile:extend("House")

function House:init(x, y)
    Tile.init(
        self, 
        x, 
        y, 
        {82/255,73/255,97/255}, 
        32,
        32,
        "House",
        "tile"
    )
end

return House