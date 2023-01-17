local Road = Tile:extend("Road")

function Road:init(x, y)
    Tile.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Field",
        "tile"
    )
end

return Road