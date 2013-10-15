'use strict'

module.exports = (grunt) ->

    # Project configuration.
    grunt.initConfig(
        coffee:
            options: { bare: true }
            compile:
                expand: true
                cwd: 'src'
                src: ['**/*.coffee', '!**/*_spec.coffee']
                dest: 'lib'
                ext: '.js'

        watch:
            src:
                files: 'src/**/*.coffee'
                tasks: [ 'coffee' ]

        mochaTest:
            test:
                options:
                    reporter: 'spec'
                src: [ 'src/**/*_spec.coffee' ]
    )

    # These plugins provide necessary tasks.
    grunt.loadNpmTasks 'grunt-contrib-nodeunit'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-mocha-test'

    # Default task.
    grunt.registerTask 'default', [
        # 'mochaTest'
        'coffee'
        'watch'
    ]
