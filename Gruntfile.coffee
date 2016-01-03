'use strict';

module.exports = (grunt) ->
  grunt.initConfig
    release:
      options:
        tagName: 'v<%= version %>',
        commitMessage: 'Prepared to release <%= version %>.'
    watch:
      files: ['Gruntfile.js', 'src/**/*.coffee', 'test/**/*.coffee'],
      tasks: ['test']
    coffee_jshint:
      gruntfile:
        options:
          jshintOptions: [ 'node' ]
        src: 'Gruntfile.coffee'
      test:
        options:
          jshintOptions: [ 'node' ]
          globals: [ 'after', 'afterEach', 'before', 'beforeEach', 'describe', 'it', 'expect', 'sinon' ]
        src: 'test/**/*.coffee'
    coffee:
      test:
        options:
          bare: true
        expand: true
        cwd: 'test/'
        src: '**/*.coffee'
        dest: 'build/test/'
        rename: (dest, src) ->
          dirname  = src.replace(/[^\/]*$/, '')
          basename = src.replace(/.*\//, '').replace(/\.[^.]*$/, '')
          "#{dest}#{dirname}/#{basename}.js"
      src:
        options:
          bare: true
        expand: true
        cwd: 'src/'
        src: '**/*.coffee'
        dest: 'build/src/'
        rename: (dest, src) ->
          dirname  = src.replace(/[^\/]*$/, '')
          basename = src.replace(/.*\//, '').replace(/\.[^.]*$/, '')
          "#{dest}#{dirname}/#{basename}.js"
    mocha_istanbul:
      test:
        src: 'build/test'
        options:
          mask: '**/*-test.js'
          reportFormats: [ 'lcov' ]
      
  # load all grunt tasks
  require('matchdep').filterDev(['grunt-*', '!grunt-cli']).forEach(grunt.loadNpmTasks);

  #grunt.registerTask('test', ['mochaTest']);
  grunt.registerTask('test:watch', ['watch']);
  grunt.registerTask('default', ['test']);
  grunt.registerTask 'test', 'run test and generate coverage information', [
    'coffee_jshint:test'
    'coffee:test'
    'coffee:src'
    'mocha_istanbul:test'
  ]

