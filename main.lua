GLOBALS = require("globals")
Class = require("lib.30log")
Lurker = require('lib.lurker')
Bump = require('lib.bump')
Timer = require('lib.cron')

--offset




--class require
Tile = require('classes.tiles.Tile')
Road = require('classes.tiles.Road')
District = require('classes.tiles.District')
House = require('classes.tiles.House')
Field = require('classes.tiles.Field')

Poi = require('classes.pois.Poi')
Home = require('classes.pois.Home')

Character = require('classes.characters.Character')
Player = require('classes.characters.Player')

Button = require('classes.buttons.Button')
GoOut = require('classes.buttons.GoOut')


cityMap = {}
GameWorld = Bump.newWorld(64)
PoiWorld = Bump.newWorld(64)
MenuWorld = Bump.newWorld(64)




local function createMap()

    for x = 1, GLOBALS.maxtiles do
        cityMap[x] = {}
        for y = 1, GLOBALS.maxtiles do
            cityMap[x][y] = {}
        end 
    end
          
    for i = 1, 3 do
        local fx = love.math.random(1, GLOBALS.maxtiles)
        local fy = love.math.random(1, GLOBALS.maxtiles)

        cityMap[fx][fy] = Field(fx, fy)

        for a = -4,4 do
            for b = -4,4  do
                if fx+a > 0 and fx+a < GLOBALS.maxtiles and fy+b > 0 and fy+b < GLOBALS.maxtiles then
                    cityMap[fx+a][fy+b] = Field(fx+a, fy+b)
                end
            end
        end
    end

    for x = 1, GLOBALS.maxtiles do
        for y = 1, GLOBALS.maxtiles do
            if cityMap[x][y].name ~= "Field" then
                local rng = love.math.random()
                if rng > 0.8 then
                    cityMap[x][y] = House(x,y)
                else
                    cityMap[x][y] = District(x, y)
                end
            end
        end
    end
           
    local rs = love.math.random(1, GLOBALS.maxtiles)
                      
    for x =1, GLOBALS.maxtiles do 
        cityMap[x][rs] = Road(x,rs) 
    end

    for y = 1, GLOBALS.maxtiles do 
        cityMap[rs][y] = Road(rs, y) 
    end


    HOUSES = {}

    for x = 1, GLOBALS.maxtiles do
        for y = 1, GLOBALS.maxtiles do
        
            if cityMap[x][y].name == "House" then
                table.insert(HOUSES, cityMap[x][y])
                GameWorld:add(cityMap[x][y], cityMap[x][y].x * 32, cityMap[x][y].y * 32, cityMap[x][y].w, cityMap[x][y].h)
            end
        end
    end

    
    --
    
    




    



end 



local function createHomePoi()

    local pos = love.math.random(#HOUSES)

    POIs[1] = Home(HOUSES[pos].x * 32, HOUSES[pos].y * 32)

    PoiWorld:add(POIs[1], POIs[1].x, POIs[1].y, POIs[1].w, POIs[1].h)
    

end

local function updateGameWorld()
    local objects, len = GameWorld:queryRect(GLOBALS.mX, GLOBALS.mY, 1,1)
        
    for i = 1, len do
        objects[i].hovered = true
    end
end

local function updatePoiWorld()
    local objects, len = PoiWorld:queryRect(GLOBALS.mX, GLOBALS.mY, 1,1)
        
    for i = 1, len do
        objects[i].hovered = true
    end
end

local function updateButtonWorld()
    local objects, len = MenuWorld:queryRect(GLOBALS.mX, GLOBALS.mY, 1,1)
        
    for i = 1, len do
        objects[i].hovered = true
    end
end

function love.mousemoved(x,y)
    GLOBALS.mX = x
    GLOBALS.mY = y
end

function love.mousereleased()
    for k,v in ipairs(POIs) do
        if v.hovered then
            v:action()
        end
    end
    for k,v in ipairs(BUTTONS) do
        if v.hovered then
            v:action()
        end
    end
end


function love.load()
 
    love.window.setMode(GLOBALS.scrw, GLOBALS.scrh)
    love.window.setTitle("real life rpg")
    createMap()
    POIs = {}
    BUTTONS = {}
    createHomePoi()

    player = Player()
    STARTING = true

end

function love.update()
    Lurker:scan()

    for x = 1, GLOBALS.maxtiles do
        for y= 1, GLOBALS.maxtiles do
            cityMap[x][y].hovered = false
        end
    end

    for k, v in ipairs(POIs) do
        v.hovered = false
    end

    for k, v in ipairs(BUTTONS) do
        v.hovered = false
    end

    updateGameWorld()
    updatePoiWorld()
    updateButtonWorld()
   



  
end

function love.draw()

  for x = 1, GLOBALS.maxtiles do
    for y = 1, GLOBALS.maxtiles do
      
        if cityMap[x][y].c ~= nil then
        love.graphics.setColor(cityMap[x][y].c)
        love.graphics.rectangle("fill", cityMap[x][y].x * cityMap[x][y].w, cityMap[x][y].y * cityMap[x][y].h, cityMap[x][y].w, cityMap[x][y].h)
        end

        if cityMap[x][y].hovered then
            love.graphics.setColor(1,0,0)
        --    print(x..y, cityMap[x][y].x * cityMap[x][y].w, cityMap[x][y].y * cityMap[x][y].h)
            love.graphics.rectangle("line", (cityMap[x][y].x * cityMap[x][y].w), (cityMap[x][y].y * cityMap[x][y].h), cityMap[x][y].w, cityMap[x][y].h)
        end

    end
  end

  for k, v in ipairs(POIs) do
    love.graphics.setColor(1,1,1)
    v:draw()
  end

  love.graphics.setFont(GLOBALS.fonts.header)
  love.graphics.print(player.name, 10, 0)

  player:draw()

  for k, v in ipairs(BUTTONS) do
    v:draw()
    love.graphics.print(v.name, v.x + 30, v.y + 30)
  end

  


end