local Movie = Poi:extend("Movie")

function Movie:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Moooovie",
        "Movie",
        love.graphics.newImage('assets/pic/movie.png')
    )
end

function Movie:draw()

    love.graphics.draw(self.img, self.x, self.y)
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("It's the local movie.\nThey play two shitty movies 24/7\nA drama and an action flick", GLOBALS.scrw - 570, 150)
        end

    end


end

function Movie:action()

    Button:removeall()
    player.isInCity = false
    print("Movie action")
    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Drama")
    Button:add("ActionMovie")
    Button:add("GoOut")
  
    self.nothingpanel = true


    self.panelvisible = true


end


return Movie