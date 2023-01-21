local Cinema = Poi:extend("Cinema")

function Cinema:init(x, y)
    Poi.init(
        self, 
        x, 
        y, 
        {0,1,0}, 
        32,
        32,
        "Moooovie",
        "Cinema",
        love.graphics.newImage('assets/pic/movie.png'),
        love.graphics.newImage('assets/pic/cinemainterior.png')
    )
end

function Cinema:draw()
    if player.isInCity then
        love.graphics.draw(self.img, self.x, self.y)
    end
    if self.panelvisible then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print(self.name, GLOBALS.scrw - 570, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)

        if self.nothingpanel then
            love.graphics.print("It's the local Cinema.\nThey play two shitty movies 24/7\nA drama and an action flick", GLOBALS.scrw - 570, 150)
        end

    end

    if player.isInMovie then
        love.graphics.draw(self.interiorimg, 32, 32)
    end

end

function Cinema:action()

    Button:removeall()
    player.isInCity = false
    player.isInMovie = true
    print("Cinema action")
    playerState:changeState(playerState.states.poiresolution)
    
    Button:add("Drama")
    Button:add("Action movie")
    Button:add("GoOut")
  
    self.nothingpanel = true


    self.panelvisible = true


end


return Cinema