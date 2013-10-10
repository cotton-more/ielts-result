'use strict'

module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig(
    nodeunit:
      files: ['test/**/*_test.coffee']

    jshint:
      options:
        jshintrc: '.jshintrc'
      gruntfile:
        src: 'Gruntfile.js'
      lib:
        src: ['lib/**/*.js']
      test:
        src: ['test/**/*.js']

    coffee:
      options: { bare: true }
      compile:
        expand: true
        cwd: 'src'
        src: ['**/*.coffee']
        dest: 'lib'
        ext: '.js'

    watch:
      gruntfile:
        files: '<%= jshint.gruntfile.src %>'
        tasks: ['jshint:gruntfile']
      lib:
        files: '<%= jshint.lib.src %>'
        tasks: ['jshint:lib', 'nodeunit']
      src:
        files: 'src/**/*.coffee'
        tasks: [ 'coffee' ]
      test:
        files: '<%= jshint.test.src %>'
        tasks: ['jshint:test', 'nodeunit']
  )

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-nodeunit'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  # Default task.
  grunt.registerTask 'default', [
      'jshint'
      'nodeunit'
  ]
