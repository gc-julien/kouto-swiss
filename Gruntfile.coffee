"use strict"

module.exports = ( grunt ) ->

    grunt.loadNpmTasks "grunt-contrib-clean"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-contrib-copy"
    grunt.loadNpmTasks "grunt-contrib-jade"
    grunt.loadNpmTasks "grunt-ks-stylus"

    grunt.initConfig
        clean:
            docs: [ "docs" ]
        stylus:
            options:
                compress: yes
            docs:
                files:
                    "docs/styles/styles.css": "_docs/_styles/styles.styl"
        jade:
            options:
                compress: yes
            docs:
                files:
                    "docs/demo.html": "_docs/_pages/demo.jade" # TODO : change this
        copy:
            images:
                expand: yes
                src: [ "_docs/_styles/img/**" ]
                dest: "docs/styles/img/"
            fonts:
                expand: yes
                src: [ "_docs/_styles/fonts/**" ]
                dest: "docs/styles/fonts/"
        watch:
            jade:
                files: "_docs/_pages/*.jade"
                tasks: [ "jade" ]
            styles:
                files: "_docs/_styles/**/*.styl"
                tasks: [ "stylus" ]

    # TODO : change this, default task should build the docs & demo
    grunt.registerTask "default", [
        "clean"
        "jade"
        "stylus"
        "copy"
    ]

    grunt.registerTask "work", [
        "default"
        "watch"
    ]
