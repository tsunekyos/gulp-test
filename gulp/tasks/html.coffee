gulp = require 'gulp'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
pug = require 'gulp-pug'

bs = require 'browser-sync'

gulp.task 'html:compile', () ->
  bs.get 'bs-default'
  gulp.src './src/html/*.pug'
    .pipe plumber errorHandler: notify.onError '<%= error.message %>'
    .pipe pug pretty:true
    .pipe gulp.dest './dist'
    .pipe bs.stream()

gulp.task 'html:watch',()->
  gulp.watch './src/html/*.pug',['html:compile']
