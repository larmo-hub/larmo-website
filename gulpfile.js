var gulp = require('gulp'),
    sass = require('gulp-ruby-sass'),
    notify = require("gulp-notify"),
    bower = require('gulp-bower');

var config = {
  sassPath: './resources/sass',
  bowerDir: './bower_components'
}

gulp.task('bower', function() {
  return bower().pipe(gulp.dest(config.bowerDir));
});

gulp.task('css', function() {
  return gulp.src(config.sassPath + '/style.scss')
    .pipe(sass({
      style: 'compressed',
        loadPath: [
          './resources/sass',
            config.bowerDir + '/bootstrap-sass-official/assets/stylesheets',
            config.bowerDir + '/font-awesome/scss',
        ]
    }).on("error", notify.onError(function (error) {
      return "Error: " + error.message;
    }))).pipe(gulp.dest('./resources/css'));
});

// Rerun the task when a file changes
gulp.task('watch', function() {
  gulp.watch(config.sassPath + '/**/*.scss', ['css']);
});

gulp.task('default', ['bower', 'css']);
