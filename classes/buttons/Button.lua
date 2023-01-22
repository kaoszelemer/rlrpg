
local Button = Class("Button")

function Button:init(x, y, w, h, name, img, prices, hovertext)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.name = name
    self.img = img
    self.prices = prices
    self.hovertext = hovertext
    
    MenuWorld:add(self, self.x, self.y, self.w, self.h)
    self.cadd = true
end

function Button:draw()

    if self.showprogress then
        
        love.graphics.setColor(1,1,1)
        love.graphics.print("Doing selected action", 720, 560)
        love.graphics.rectangle("fill", 700, 600, self.progress, 20)
       
    end


    


end

function Button:action()
    print("something")

end

function Button:removeall()
    if #BUTTONS >= 1 then
        for k,v in ipairs(BUTTONS) do
            if v.cadd ~= false then
                v.cadd = false
                MenuWorld:remove(v)
                print("removed "..v.name.." button")
            end
        end
        BUTTONS = {}
    end

end


function Button:add(item)
    local x = GLOBALS.scrw-580
    local y

    if #BUTTONS > 0 then
        y = BUTTONS[#BUTTONS].y + 80
    else
        
        y = 250
    end


    if item == "Sleep" then
        table.insert(BUTTONS, Sleep(x, y))
    elseif item == "GoOut" then
        table.insert(BUTTONS, GoOut(x, y))
    elseif item == "Work" then
        table.insert(BUTTONS, Work(x, y))
    elseif item == "Cocaine" then
        table.insert(BUTTONS, Cocaine(x, y))
    elseif item == "Weed" then
        table.insert(BUTTONS, Weed(x, y))
    elseif item == "Explore" then
        table.insert(BUTTONS, Explore(x, y))
    elseif item == "Whiskey" then
        table.insert(BUTTONS, Whiskey(x, y))
    elseif item == "Date" then
        table.insert(BUTTONS, Date(x, y))
    elseif item == "Gamble" then
        table.insert(BUTTONS, Gamble(x, y))
    elseif item == "Talk" then
        table.insert(BUTTONS, Talk(x, y))
    elseif item == "Ticket" then
        table.insert(BUTTONS, Ticket(x, y))
    elseif item == "Suicide" then
        table.insert(BUTTONS, Suicide(x, y))
    elseif item == "Coffee" then
        table.insert(BUTTONS, Coffee(x, y))
    elseif item == "Drama" then
        table.insert(BUTTONS, Drama(x, y))
    elseif item == "ActionMovie" then
        table.insert(BUTTONS, ActionMovie(x, y))
    elseif item == "Pray" then
        table.insert(BUTTONS, Pray(x, y))
    elseif item == "Burger" then
        table.insert(BUTTONS, Burger(x, y))
    elseif item == "ShitBurger" then
        table.insert(BUTTONS, ShitBurger(x, y))
    elseif item == "Beer" then
        table.insert(BUTTONS, Beer(x, y))
    elseif item == "Barista" then
        table.insert(BUTTONS, Barista(x, y))
    elseif item == "Train" then
        table.insert(BUTTONS, Train(x, y))
    end
    print("added "..item.." button")
end

function Button:update(dt)
    if self.showprogress then
        self.progress = self.progress + self.progresslength / dt
        self.progresstime:update(dt)
        
    end

    if self.idleprogress ~= nil then
        self.idleprogress:update(dt)
    end

end

function Button:progressBar(length)

    self.progress = 0

    playerState:changeState(playerState.states.progressing)

    self.showprogress = true
    self.progresslength = length
    self.progresstime = Timer.after(1, function ()  
      self.showprogress = false
        if player.isInCity then
            playerState:changeState(playerState.states.city)
        else
            playerState:changeState(playerState.states.poiresolution)
        end
    
    end)


end


return Button