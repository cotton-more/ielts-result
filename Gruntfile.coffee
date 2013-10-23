'use strict'

module.exports = (grunt) ->

    # Project configuration.
    grunt.initConfig(
        coffee:
            options: { bare: true }
            compile:
                files:
                    'lib/index.js': 'src/ielts-result.coffee'

        watch:
            src:
                files: 'src/**/*.coffee'
                tasks: [ 'coffee' ]
    )

    # These plugins provide necessary tasks.
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    # Default task.
    grunt.registerTask 'default', [
        'coffee'
        'watch'
    ]
