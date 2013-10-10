'use strict'

module.exports = (grunt) ->

    # Project configuration.
    grunt.initConfig(
        coffee:
            options: { bare: true }
            compile:
                expand: true
                cwd: 'src'
                src: ['**/*.coffee']
                dest: 'lib'
                ext: '.js'

        watch:
            src:
                files: 'src/**/*.coffee'
                tasks: [ 'coffee' ]
    )

    # These plugins provide necessary tasks.
    grunt.loadNpmTasks 'grunt-contrib-nodeunit'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-coffee'

    # Default task.
    grunt.registerTask 'default', [
        'watch'
    ]
