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
        winscreen = love.graphics.newImage('assets/pic/winscreen.png')
    }
    

}

return globals