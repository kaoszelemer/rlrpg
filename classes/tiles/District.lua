local District = Tile:extend("District")

function District:init(x, y)
    Tile.init(
        self, 
        x, 
        y, 
        {130/255,115/255,151/255}, 
        32,
        32,
        "District",
        "tile"
    )
end

return District