chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'list', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      brain:
        get: sinon.stub().returns(null)
        set: sinon.stub().returns(null)
        save: sinon.stub().returns(null)
        remove: sinon.stub().returns(null)
    require('../src/list')(@robot)

  describe 'list', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/list$/)

  describe 'list month', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/list month (\d{4}\/\d{2})$/)
  
  describe 'list year', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/list year (\d{4})$/)