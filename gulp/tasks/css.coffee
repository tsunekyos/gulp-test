gulp = require 'gulp'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
bs = require 'browser-sync'
sass = require 'gulp-sass'

gulp.task 'css:compile', ()->
  bs.get("bs-default")
  gulp.src './src/css/*.scss'
    .pipe plumber errorHandler: notify.onError '<%= error.message %>'
    .pipe sass()
    .pipe gulp.dest './dist/css'
    .pipe bs.stream()

gulp.task 'css:watch',()->
  gulp.watch './src/css/*.scss',['css:compile']
