GLOBALS = require("globals")
Class = require("lib.30log")
Lurker = require('lib.lurker')
Bump = require('lib.bump')
Timer = require('lib.cron')
Ripple = require('lib.ripple')

--sajat lib
StateMachine = require('classes.StateMachine')



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
Pub = require('classes.pois.Pub')
FriendlyHouse = require('classes.pois.FriendlyHouse')
Casino = require('classes.pois.Casino')
Busstop = require('classes.pois.Busstop')
Cafe = require('classes.pois.Cafe')
Cinema = require('classes.pois.Cinema')
Church = require('classes.pois.Church')
FastFood = require('classes.pois.FastFood')

Character = require('classes.characters.Character')
Player = require('classes.characters.Player')

Button = require('classes.buttons.Button')
GoOut = require('classes.buttons.GoOut')
Explore = require('classes.buttons.Explore')
Work = require('classes.buttons.Work')
Sleep = require('classes.buttons.Sleep')
Cocaine = require('classes.buttons.Cocaine')
Weed = require('classes.buttons.Weed')
Whiskey = require('classes.buttons.Whiskey')
Date = require('classes.buttons.Date')
Gamble = require('classes.buttons.Gamble')
Talk = require('classes.buttons.Talk')
Ticket = require('classes.buttons.Ticket')
Suicide = require('classes.buttons.Suicide')
Coffee = require('classes.buttons.Coffee')
ActionMovie = require('classes.buttons.ActionMovie')
Drama = require('classes.buttons.Drama')
Pray = require('classes.buttons.Pray')
Burger = require('classes.buttons.Burger')
ShitBurger = require('classes.buttons.ShitBurger')
Beer = require('classes.buttons.Beer')
Barista = require('classes.buttons.Barista')

cityMap = {}

GameWorld = Bump.newWorld(64)
PoiWorld = Bump.newWorld(64)
MenuWorld = Bump.newWorld(64)


playerState = StateMachine({
    city = {
        name = "city",
        transitions = {"poiresolution", "city", "progressing"} 
    },

    poiresolution = {
        name = "poiresolution",
        transitions = {"city", "poiresolution", "progressing"}
    },

    progressing = {
        name = "progressing",
        transitions = {"city", "poiresolution", "progressing"}
    }

    },
    "city"
)


gameState = StateMachine({
    starting = {
        name = "starting",
        transitions = {"starting", "game"},
    },
    game = {
        name = "game",
        transitions = {"game", "winscreen", "gameover", "settings"}
    },
    winscreen = {
        name = "winscreen",
        transitions = {"starting", "winscreen"}
    },
    gameover = {
        name = "gameover",
        transitions = {"gameover", "starting"}
    },
    settings = {
        name = "settings",
        transitions = {"settings", "game"}
    }
    
},

"starting")




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
           
    local rs = love.math.random(3, GLOBALS.maxtiles-3)
                      
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

   


end 


local function createHomePoi()

    local pos = love.math.random(#HOUSES)

    POIs[1] = Home(HOUSES[pos].x * 32, HOUSES[pos].y * 32)
    table.remove(HOUSES, pos)

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

function gameWorldTimeAdjust(time)
    if GLOBALS.gameworldtime < 24 then
        GLOBALS.gameworldtime = GLOBALS.gameworldtime + time
    end

    if GLOBALS.gameworldtime == 24 then
        GLOBALS.gameworldtime = 0
        GLOBALS.gameworlddays = GLOBALS.gameworlddays + 1
    end

    if GLOBALS.gameworldtime > 24 then
        local mod = (GLOBALS.gameworldtime + time) - 24
        GLOBALS.gameworldtime = mod
        GLOBALS.gameworlddays = GLOBALS.gameworlddays + 1
    end
end

local function initPlayerExperience()

    player.explorer = 0
    player.friendliness = 0
    player.moviewatcher = 0
    player.coffeedrinker = 0
    player.gambler = 0
    player.worshipper = 0
    player.junkie = 0
    player.worker = 0
    player.fat = 0
    player.drunkie = 0
    player.sexlife = 0
    player.sleeper = 0




end

function love.mousemoved(x,y)
    GLOBALS.mX = x
    GLOBALS.mY = y
end

function love.mousereleased()

    if gameState.state == gameState.states.starting then
        gameState:changeState(gameState.states.game)
    end

    if gameState.state == gameState.states.game then
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
end

function love.load()
 
  --  love.window.setMode(GLOBALS.scrw, GLOBALS.scrh)
    love.window.setTitle("real life rpg")
    local mtsource = love.audio.newSource('assets/music/maintheme.ogg', 'static')
    local mt2source = love.audio.newSource('assets/music/maintheme2.ogg', 'static')
    local sound
    if love.math.random() >= 0.5 then
         sound = Ripple.newSound(mtsource)
    else
        sound = Ripple.newSound(mt2source)
    end

    sound.loop = true
    local instance = sound:play()
    createMap()
    POIs = {}
    BUTTONS = {}
    
    Button:add("Explore")
    createHomePoi()
    cityMap.explorationlevel = 0

    player = Player()
    initPlayerExperience()


    player.isInCity = true
    

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
    Button:add("Explore")
    player.isInCity = true
  end

  player:updatePlayer(dt)

 
   



  
end

function love.draw()

    if gameState.state == gameState.states.gameover then
 
        love.graphics.setColor = {1,1,1}
        love.graphics.setFont(GLOBALS.fonts.header)
        love.graphics.print("You have died.\nFirstly it was because of life itself.\nBut the real cause was:\n"..GLOBALS.deathscreeninfos.cause, 50, 100)
        love.graphics.print("You had this massive ammount of money: "..GLOBALS.deathscreeninfos.money.."$", 50, 350)
        if GLOBALS.deathscreeninfos.day == 1 then
            love.graphics.print("You tried to live long enough. Your suffering ended on the "..GLOBALS.deathscreeninfos.day.."st day.", 50, 400)
        elseif GLOBALS.deathscreeninfos.day == 2 then
            love.graphics.print("You tried to live long enough. Your suffering ended on the "..GLOBALS.deathscreeninfos.day.."nd day.", 50, 400)
        elseif GLOBALS.deathscreeninfos.day == 3 then
            love.graphics.print("You tried to live long enough. Your suffering ended on the "..GLOBALS.deathscreeninfos.day.."rd day.", 50, 400)
        else
            love.graphics.print("You tried to live long enough. Your suffering ended on the "..GLOBALS.deathscreeninfos.day.."th day.", 50, 400)
        end

        love.graphics.print("You explored this shithole city for "..cityMap.explorationlevel.."%")
        love.graphics.print("Your name was: "..player.name, 50, 600)

        if player.lvls.Friendliness < 2 then
            love.graphics.print("No one will remember you.", 50, 650)
        else
            love.graphics.print("Your friend will remember you.", 50, 650)
        end



    else
            if gameState.state == gameState.states.starting then
                love.graphics.draw(GLOBALS.fullscreenimages.title, 0,0)
            end
        
            if gameState.state == gameState.states.game then
        
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

                
                if GLOBALS.gameworldtime >= 19 and GLOBALS.gameworldtime < 23 then
                    love.graphics.setBlendMode("darken", "premultiplied")
                    love.graphics.draw(GLOBALS.fullscreenimages.afternoonblend, 32,32)
                    love.graphics.setBlendMode("alpha")
                end
          
                if GLOBALS.gameworldtime >= 23 or GLOBALS.gameworldtime < 6 then
                    
                    love.graphics.setBlendMode("subtract", "premultiplied")
                    love.graphics.draw(GLOBALS.fullscreenimages.nightblend, 32,32)
                    love.graphics.setBlendMode("alpha")
                    love.graphics.setBlendMode("subtract", "premultiplied")
                    love.graphics.draw(GLOBALS.fullscreenimages.nightblend, 32,32)
                    love.graphics.setBlendMode("alpha")
                end

        
                for k, v in ipairs(POIs) do
                    love.graphics.setColor(1,1,1)
                    v:draw()
                end
        
                love.graphics.setFont(GLOBALS.fonts.header)
                love.graphics.print(player.name, 32, 0)
        
                player:draw()
        
        
        
                for k, v in ipairs(BUTTONS) do
                    v:draw()
                end
        
                Button:draw()
        
                if playerState.state == playerState.states.city then
                    love.graphics.setFont(GLOBALS.fonts.header)
                    love.graphics.print("City", GLOBALS.scrw - 570, 10)
                    love.graphics.setFont(GLOBALS.fonts.stats)
                    love.graphics.print("Its your neigborhood.\nCrackhouses all around.\nKinda depressive.", GLOBALS.scrw - 570, 150)
                    love.graphics.print("Exploration level:"..cityMap.explorationlevel.."%", GLOBALS.scrw - 570, 50)
                end
        
        
                love.graphics.print("Time\n"..GLOBALS.gameworldtime..":00",GLOBALS.scrw-100, 10)
                love.graphics.print("Days: "..GLOBALS.gameworlddays, GLOBALS.scrw-100, 52)
                
                if player.energy <= 4 then
                    love.graphics.setColor(1,0,0)
                    love.graphics.print("LOW ENERGY, find a place to sleep!", GLOBALS.scrw - 570, 100)
                    love.graphics.setColor(1,1,0)
                    love.graphics.print("LOW ENERGY, find a place to sleep!", GLOBALS.scrw - 569, 99)
                    love.graphics.setColor(1,1,1)
                end

                



            end

            if gameState.state == gameState.states.winscreen then
                
                love.graphics.draw(GLOBALS.fullscreenimages.winscreen, 0,0)

            end
        
        
    end

  

end