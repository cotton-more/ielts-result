'use strict'

module.exports = (grunt) ->

    # Project configuration.
    grunt.initConfig(
        nodeunit:
            files: ['test/**/*_test.coffee']

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
            test:
                files: '<%= nodeunit.files %>'
                tasks: [ 'nodeunit' ]
    )

    # These plugins provide necessary tasks.
    grunt.loadNpmTasks 'grunt-contrib-nodeunit'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-coffee'

    # Default task.
    grunt.registerTask 'default', [
        'nodeunit'
        'watch'
    ]
