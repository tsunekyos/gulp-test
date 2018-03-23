gulp = require 'gulp'
spritesmith = require 'gulp.spritesmith'
replace = require 'gulp-replace'
bs = require 'browser-sync'

gulp.task 'img:sprite',() =>
  bs.get 'bs-default'
  originalImages = 'src/img/sprite/*.png'
  spritesmithParam =
    imgName: 'sprite.png'
    cssName: 'sprite.css'
    imgPath: '../img/sprite.png'

  data = gulp.src originalImages
    .pipe spritesmith spritesmithParam
  data.img.pipe gulp.dest 'dist/img'
  data.css
    .pipe replace /^\.icon-/gm,'.sprite-'
    .pipe gulp.dest 'dist/css'
    .pipe bs.stream()

gulp.task 'img:copy',()->
  bs.get 'bs-default'
  gulp.src ['src/img/**/*.+(png|jpg|jpeg|svg)','!./src/img/sprite/*']
    .pipe gulp.dest 'dist/img'
    .pipe bs.stream()

gulp.task 'img:watch',()->
  gulp.watch ['./src/img/**/*.+(png|jpg|jpeg|svg)','!./src/img/sprite/*'],['img:copy']
  gulp.watch './src/img/sprite/*.+(png|jpg|jpeg|svg)',['img:sprite']
