local sources = {
    clicksource = love.audio.newSource('assets/sounds/click.ogg', 'static'),
    applausesource = love.audio.newSource('assets/sounds/applause.ogg', 'static'),
    boosource = love.audio.newSource('assets/sounds/boo.ogg', 'static'),

    busstopsource = love.audio.newSource('assets/sounds/busstop.ogg', 'static'),
    cafesource = love.audio.newSource('assets/sounds/cafe.ogg', 'static'),
    casinosource = love.audio.newSource('assets/sounds/casino.ogg', 'static'),
    churchsource = love.audio.newSource('assets/sounds/church.ogg', 'static'),
    cinemasource = love.audio.newSource('assets/sounds/cinema.ogg', 'static'),
    dealersource = love.audio.newSource('assets/sounds/dealer.ogg', 'static'),
    factorysource = love.audio.newSource('assets/sounds/factory.ogg', 'static'),
    fastfoodsource = love.audio.newSource('assets/sounds/fastfood.ogg', 'static'),
    friendlyhomesource = love.audio.newSource('assets/sounds/friendlyhome.ogg', 'static'),
    gymsource = love.audio.newSource('assets/sounds/gym.ogg', 'static'),
    homesource = love.audio.newSource('assets/sounds/home.ogg', 'static'),
    pubsource = love.audio.newSource('assets/sounds/pub.ogg', 'static'),


    actionmoviesource = love.audio.newSource('assets/sounds/actionmovie.ogg', 'static'),
    baristasource = love.audio.newSource('assets/sounds/barista.ogg', 'static'),
    beersource = love.audio.newSource('assets/sounds/beer.ogg', 'static'),
    burgerssource = love.audio.newSource('assets/sounds/burgers.ogg', 'static'),
    cocainesource = love.audio.newSource('assets/sounds/cocaine.ogg', 'static'),
    coffeesource = love.audio.newSource('assets/sounds/coffee.ogg', 'static'),
    datesource = love.audio.newSource('assets/sounds/date.ogg', 'static'),
    dramasource = love.audio.newSource('assets/sounds/drama.ogg', 'static'),
    exploresource = love.audio.newSource('assets/sounds/explore.ogg', 'static'),
    gamblesource = love.audio.newSource('assets/sounds/gamble.ogg', 'static'),
    gooutsource = love.audio.newSource('assets/sounds/goout.ogg', 'static'),
    praysource = love.audio.newSource('assets/sounds/pray.ogg', 'static'),
    sleepsource = love.audio.newSource('assets/sounds/sleep.ogg', 'static'),
    talksource = love.audio.newSource('assets/sounds/talk.ogg', 'static'),
    trainsource = love.audio.newSource('assets/sounds/train.ogg', 'static'),
    weedsource = love.audio.newSource('assets/sounds/weed.ogg', 'static'),
    whiskeysource = love.audio.newSource('assets/sounds/whiskey.ogg', 'static'),
    worksource = love.audio.newSource('assets/sounds/work.ogg', 'static'),
    
    
  
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