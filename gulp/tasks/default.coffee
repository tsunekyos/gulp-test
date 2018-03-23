gulp = require 'gulp'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
bs = require('browser-sync').create("bs-default")
runSequence = require 'run-sequence'

gulp.task 'default', () ->
  runSequence(
    ['del:del']
    [
      'html:compile'
      'css:compile'
      'js:compile'
      'js:plugins:compile'
      'img:sprite'
      'img:copy'
    ]
    [
      'html:watch'
      'css:watch'
      'js:watch'
      'img:watch'
    ]
    ['server:start']
  )
