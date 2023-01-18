GLOBALS = require("globals")
Class = require("lib.30log")
Lurker = require('lib.lurker')
Bump = require('lib.bump')
Timer = require('lib.cron')

--sajat lib
StateMachine = require('classes.StateMachine')

RANDOMNAMES = require('randomnametable')


--offset




--class require
Tile = require('classes.tiles.Tile')
Roadhor = require('classes.tiles.Roadhor')
Roadver = require('classes.tiles.Roadver')
District = require('classes.tiles.District')
House = require('classes.tiles.House')
Field = require('classes.tiles.Field')

Poi = require('classes.pois.Poi')
Home = require('classes.pois.Home')
Factory = require('classes.pois.Factory')
Dealer = require('classes.pois.Dealer')

Character = require('classes.characters.Character')
Player = require('classes.characters.Player')

Button = require('classes.buttons.Button')
GoOut = require('classes.buttons.GoOut')
Explore = require('classes.buttons.Explore')
Work = require('classes.buttons.Work')
Sleep = require('classes.buttons.Sleep')
Cocaine = require('classes.buttons.Cocaine')
Weed = require('classes.buttons.Weed')

cityMap = {}

GameWorld = Bump.newWorld(64)
PoiWorld = Bump.newWorld(64)
MenuWorld = Bump.newWorld(64)


playerState = StateMachine({
    city = {
        name = "city",
        transitions = {"poiresolution", "city"} 
    },

    poiresolution = {
        name = "poiresolution",
        transitions = {"city", "poiresolution"}
    },

    },
    "city"
)




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
        cityMap[x][rs] = Roadver(x,rs) 
    end

    for y = 1, GLOBALS.maxtiles do 
        cityMap[rs][y] = Roadhor(rs, y) 
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

    table.remove(HOUSES, 1)


end 




local function createHomePoi()

    local pos = love.math.random(#HOUSES)

    POIs[1] = Home(HOUSES[pos].x * 32, HOUSES[pos].y * 32)

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
     --  print(objects[i].name)
        objects[i].hovered = true
    end
end

function love.mousemoved(x,y)
    GLOBALS.mX = x
    GLOBALS.mY = y
end

function love.mousereleased()
    if playerState.state == playerState.states.city then
        for k,v in ipairs(POIs) do
            if v.hovered then
                playerState:changeState(playerState.states.poiresolution)
                v:action()
            end
        end
    end
    for k,v in ipairs(BUTTONS) do
        if v.hovered then
            print(v.name, "action")
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
    table.insert(BUTTONS, Explore(GLOBALS.scrw-280, 250))
    createHomePoi()
    cityMap.explorationlevel = 0

    player = Player()
    
    

end

function love.update(dt)
    Lurker:scan()
  
    for x = 1, GLOBALS.maxtiles do
        for y= 1, GLOBALS.maxtiles do
            cityMap[x][y].hovered = false
        end
    end

   

 --   if playerState.state == playerState.states.poiresolution then

        for k, v in ipairs(POIs) do
            v.hovered = false
        end

        for k, v in ipairs(BUTTONS) do
            v.hovered = false
        end


        updateGameWorld()
        updatePoiWorld()
        updateButtonWorld()
       

        Button:update(dt)

  --  end

  if playerState.state == playerState.states.city and #BUTTONS == 0 then
    table.insert(BUTTONS, Explore(GLOBALS.scrw-280, 250))
  end

  if player.showCantdo then
    player.cantdotimer:update(dt)
 
  end

  if player.energy > 10 then
    player.energy = 10
  end
  if player.aliveness > 10 then
    player.aliveness = 10
  end
   



  
end

function love.draw()

    for x = 1, GLOBALS.maxtiles do
        for y = 1, GLOBALS.maxtiles do

            love.graphics.draw(cityMap[x][y].img, cityMap[x][y].x * cityMap[x][y].w, cityMap[x][y].y * cityMap[x][y].h)

            if cityMap[x][y].hovered then
                love.graphics.setColor(1,0,0)
                love.graphics.rectangle("line", (cityMap[x][y].x * cityMap[x][y].w), (cityMap[x][y].y * cityMap[x][y].h), cityMap[x][y].w, cityMap[x][y].h)
                love.graphics.setColor(1,1,1)
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
    end

    Button:draw()

    if playerState.state == playerState.states.city then
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print("City", GLOBALS.scrw - 350, 10)
        love.graphics.setFont(GLOBALS.fonts.stats)
        love.graphics.print("Its your neigborhood.\nCrackhouses all around.\nKinda depressive.", GLOBALS.scrw - 300, 150)
        love.graphics.print("Exploration level:"..cityMap.explorationlevel.."%", GLOBALS.scrw - 350, 50)
    end


    love.graphics.print("Time\n"..GLOBALS.gameworldtime..":00",GLOBALS.scrw-100, 10)
 
  


end