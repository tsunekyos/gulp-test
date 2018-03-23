gulp = require 'gulp'
webpack = require 'webpack'
bs = require 'browser-sync'
concat = require 'gulp-concat'
webpack = require 'webpack'
webpackStream = require 'webpack-stream'
webpackConfig = require '../webpack.config.js'


gulp.task 'js:compile', ()->
  bs.get 'bs-default'
  webpackStream webpackConfig, webpack
    .pipe gulp.dest './dist/js'
    .pipe bs.stream()

gulp.task 'js:watch',()->
  gulp.watch './src/js/*.coffee',['js:compile']

gulp.task 'js:plugins:compile', ()->
  gulp.src './src/js/plugins/*.js'
    .pipe concat 'plugins.js'
    .pipe gulp.dest './dist/js'
