gulp = require 'gulp'
bs = require 'browser-sync'

gulp.task 'server:start',()->
  bs.get 'bs-default'
  bs.init
    #startPath: ""
    server:
      baseDir: "./dist"
