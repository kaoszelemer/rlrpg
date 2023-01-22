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


    actionmoviesource = love.audio.newSource('assets/sounds/actionmovie.wav', 'static'),
    baristasource = love.audio.newSource('assets/sounds/barista.wav', 'static'),
    beersource = love.audio.newSource('assets/sounds/beer.wav', 'static'),
    burgerssource = love.audio.newSource('assets/sounds/burgers.wav', 'static'),
    cocainesource = love.audio.newSource('assets/sounds/cocaine.wav', 'static'),
    coffeesource = love.audio.newSource('assets/sounds/coffee.wav', 'static'),
    datesource = love.audio.newSource('assets/sounds/date.wav', 'static'),
    dramasource = love.audio.newSource('assets/sounds/drama.wav', 'static'),
    exploresource = love.audio.newSource('assets/sounds/explore.wav', 'static'),
    gamblesource = love.audio.newSource('assets/sounds/gamble.wav', 'static'),
    gooutsource = love.audio.newSource('assets/sounds/goout.wav', 'static'),
    praysource = love.audio.newSource('assets/sounds/pray.wav', 'static'),
    sleepsource = love.audio.newSource('assets/sounds/sleep.wav', 'static'),
    talksource = love.audio.newSource('assets/sounds/talk.wav', 'static'),
    trainsource = love.audio.newSource('assets/sounds/train.wav', 'static'),
    weedsource = love.audio.newSource('assets/sounds/weed.wav', 'static'),
    whiskeysource = love.audio.newSource('assets/sounds/whiskey.wav', 'static'),
    worksource = love.audio.newSource('assets/sounds/work.wav', 'static'),
    
    
  
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
    pub = Ripple.newSound(sources.pubsource),

    actionmovie = Ripple.newSound(sources.actionmoviesource),
    barista = Ripple.newSound(sources.baristasource),
    beer = Ripple.newSound(sources.beersource),
    burger = Ripple.newSound(sources.burgerssource),
    cocaine = Ripple.newSound(sources.cocainesource),
    coffee = Ripple.newSound(sources.coffeesource),
    date = Ripple.newSound(sources.datesource),
    drama = Ripple.newSound(sources.dramasource),
    explore = Ripple.newSound(sources.exploresource),
    gamble = Ripple.newSound(sources.gamblesource),
    goout = Ripple.newSound(sources.gooutsource),
    pray = Ripple.newSound(sources.praysource),
    sleep = Ripple.newSound(sources.sleepsource),
    talk = Ripple.newSound(sources.talksource),
    train = Ripple.newSound(sources.trainsource),
    weed = Ripple.newSound(sources.weedsource),
    whiskey = Ripple.newSound(sources.whiskeysource),
    work = Ripple.newSound(sources.worksource),



}

return sounds