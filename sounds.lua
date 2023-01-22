local sources = {
    clicksource = love.audio.newSource('assets/sounds/click.wav', 'static'),
    applausesource = love.audio.newSource('assets/sounds/applause.wav', 'static'),
    boosource = love.audio.newSource('assets/sounds/boo.wav', 'static'),

    busstopsource = love.audio.newSource('assets/sounds/busstop.wav', 'static'),
    cafesource = love.audio.newSource('assets/sounds/cafe.wav', 'static'),
    casinosource = love.audio.newSource('assets/sounds/casino.wav', 'static'),
    churchsource = love.audio.newSource('assets/sounds/church.wav', 'static'),
    cinemasource = love.audio.newSource('assets/sounds/cinema.wav', 'static'),
    dealersource = love.audio.newSource('assets/sounds/dealer.wav', 'static'),
    factorysource = love.audio.newSource('assets/sounds/factory.wav', 'static'),
    fastfoodsource = love.audio.newSource('assets/sounds/fastfood.wav', 'static'),
    friendlyhomesource = love.audio.newSource('assets/sounds/friendlyhome.wav', 'static'),
    gymsource = love.audio.newSource('assets/sounds/gym.wav', 'static'),
    homesource = love.audio.newSource('assets/sounds/home.wav', 'static'),
    pubsource = love.audio.newSource('assets/sounds/pub.wav', 'static'),
 
    
  
}

local sounds = {
    click = Ripple.newSound(sources.clicksource),
    applause = Ripple.newSound(sources.applausesource),
    boo = Ripple.newSound(sources.boosource),
    busstop = Ripple.newSound(sources.boosource),
    cafe = Ripple.newSound(sources.cafesource),
    casino = Ripple.newSound(sources.casinosource),
    cinema = Ripple.newSound(sources.cinemasource),
    church = Ripple.newSound(sources.churchsource),
    dealer = Ripple.newSound(sources.dealersource),
    factory = Ripple.newSound(sources.factorysource),
    fastfood = Ripple.newSound(sources.fastfoodsource),
    friendlyhome = Ripple.newSound(sources.friendlyhomesource),
    gym = Ripple.newSound(sources.gymsource),
    home = Ripple.newSound(sources.homesource),
    pub = Ripple.newSound(sources.pubsource)
}

return sounds