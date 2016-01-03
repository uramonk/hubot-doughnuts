chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'
expect = chai.expect

describe 'clear', ->
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
    require('../src/clear')(@robot)
    
  describe 'clear today', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/clear today$/)
    
    it 'msg.send', ->
      @robot.respond.getCall(0).args[1](@msg)
      expect(@msg.send).to.have.been.calledWith('Clear doughnuts count today')
      
  describe 'clear all', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/clear all/)
      
    it 'msg.send', ->
      dateString = "1970/01/01"
      @robot.respond.getCall(1).args[1](@msg)
      expect(@msg.send).to.have.been.calledWith("Clear all doughnuts count from #{dateString}")

  describe 'clear day', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/clear day (\d{4}\/\d{2}\/\d{2})$/)
    ###  
    it 'msg.send', ->
      dateString = "1970/01/01"
      @robot.respond.getCall(2).args[1](@msg)
      expect(@msg.send).to.have.been.calledWith("Clear doughnuts count #{dateString}")###
      
  describe 'clear month', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/clear month (\d{4}\/\d{2})$/)
    ###  
    it 'msg.send', ->
      dateString = "1970/01/01"
      @robot.respond.getCall(3).args[1](@msg)
      expect(@msg.send).to.have.been.calledWith("Clear doughnuts count #{dateString}")###
      
  describe 'clear year', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/clear year (\d{4})$/)
    ### 
    it 'msg.send', ->
      dateString = "1970/01/01"
      @robot.respond.getCall(4).args[1](@msg)
      expect(@msg.send).to.have.been.calledWith("Clear doughnuts count #{dateString}")###
