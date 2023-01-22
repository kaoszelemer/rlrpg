local globals = {

    scrw = 1280,
    scrh = 800,
    mX = 0,
    mY = 0,

    maxtiles = 20,
    tilewidth = 32,
    fonts = {
        header = love.graphics.newFont('assets/typewriterhand.ttf', 32),
        stats  = love.graphics.newFont('assets/typewriterhand.ttf', 16)
    },

    gameworldtime = 8,
    gameworlddays = 1,


    fullscreenimages = {
        title = love.graphics.newImage('assets/pic/titlescreen.png'),
        winscreen = love.graphics.newImage('assets/pic/winscreen.png'),
        afternoonblend = love.graphics.newImage('assets/pic/afternoonblend.png'),
        nightblend = love.graphics.newImage('assets/pic/nightblend.png')
    },

    uielements = {
        chbg = love.graphics.newImage('assets/pic/chbg.png'),
        poibg = love.graphics.newImage('assets/pic/poibg.png'),
        actionbg = love.graphics.newImage('assets/pic/actionbg.png'),
        levelupbg = love.graphics.newImage('assets/pic/levelupbg.png'),
        tdwcbg = love.graphics.newImage('assets/pic/tdwcbg.png'),
    },

    colors = {

        white = {203 / 255,209/255,190/255},
        darkgrey = {82 / 255, 83 / 255, 76 / 255},
        yellow = {224 / 255,164 / 255,110 / 255},
        red = {169/255, 49/255,48/255},
        green = {93/255,118/255,64/255}
    }
    

}

return globals