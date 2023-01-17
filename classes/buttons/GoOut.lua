local GoOut = Button:extend("GoOut")

function GoOut:init(x, y)
    Button.init(
        self, 
        x, 
        y, 
        168,
        64,
        "Go Out",
        love.graphics.newImage('assets/pic/button.png')
    )

   
end

function GoOut:draw()
    love.graphics.draw(self.img, self.x, self.y)
end

function GoOut:action()
    print("buttonaction")
    for k,v in ipairs(POIs) do
        if v.panelvisible then
            v.panelvisible = false
        end
    end
    
    for i = 1, #BUTTONS do
        table.remove(BUTTONS, i)
    end

end

return GoOut