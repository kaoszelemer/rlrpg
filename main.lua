GLOBALS = require("globals")
Class = require("lib.30log")
Lurker = require('lib.lurker')
Bump = require('lib.bump')


function generateRoad()

    local spx = 0
    local epx = 1024

    local spy = math.random(0, GLOBALS.scrh)
    local epy = math.random(0, GLOBALS.scrh)
    local road = {spx, spy, epx, epy}
    
    return road

end

function love.load()
 
    love.window.setMode(GLOBALS.scrw, GLOBALS.scrh)
    love.window.setTitle("real life rpg")
    road = generateRoad()

end

function love.update()
    Lurker:scan()
end

function love.draw()

  love.graphics.line(road[1],road[2],road[3],road[4])

end