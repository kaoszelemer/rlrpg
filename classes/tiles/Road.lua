local Road = Tile:extend("Road")

function Road:init(x, y)
    Tile.init(
        self, 
        x, 
        y, 
        {174/255,174/255,174/255}, 
        32,
        32,
        "Road",
        "tile"
    )
end

return Road