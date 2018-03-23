console.log "console!!!!"

$(->

  $ "h1"
    .on "click",()->
      alert "alerrrrrrt"

  TweenLite.to $("h1"), 1, {x:100}

)
