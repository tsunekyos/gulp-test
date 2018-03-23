gulp = require 'gulp'
del = require 'del'

gulp.task 'del:del', () ->
  del './dist'
