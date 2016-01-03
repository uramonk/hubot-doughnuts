chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'count', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      brain:
        get: sinon.stub().returns(null)
        set: sinon.stub().returns(null)
        save: sinon.stub().returns(null)
        remove: sinon.stub().returns(null)
    @msg =
      send: sinon.spy()
    require('../src/count')(@robot)

  describe 'count today', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/count today$/)
    
    it 'msg.send', ->
      @robot.respond.getCall(0).args[1](@msg)
      count = 0
      expect(@msg.send).to.have.been.calledWith("Count doughnuts today: #{count}")
      
  describe 'count week', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/count week$/)
    
    it 'msg.send', ->
      @robot.respond.getCall(1).args[1](@msg)
      count = 0
      expect(@msg.send).to.have.been.calledWith("Count doughnuts this week: #{count}")
      
  describe 'count total', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/count total$/)
    
    it 'msg.send', ->
      @robot.respond.getCall(2).args[1](@msg)
      count = 0
      expect(@msg.send).to.have.been.calledWith("Count total doughnuts: #{count}")
      
  describe 'count day', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/count day (\d{4}\/\d{2}\/\d{2})$/)
      
  describe 'count month', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/count month (\d{4}\/\d{2})$/)
      
  describe 'count year', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/count year (\d{4})$/)

    
    
    

