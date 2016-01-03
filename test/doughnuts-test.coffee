chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'doughnuts', ->
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
    require('../src/doughnuts')(@robot)
    
    describe 'add doughnut', ->
      it 'registers a respond listener', ->
        expect(@robot.respond).to.have.been.calledWith(/:doughnut:/)
       
      it 'msg.send', ->
        @robot.respond.getCall(0).args[1](@msg)
        dc = @msg.message.text.split(/:doughnut:/).length - 1;
        expect(@msg.send).to.have.been.calledWith("Added doughnuts today: #{dc}")
            
    describe 'add day', ->
      it 'registers a respond listener', ->
        expect(@robot.respond).to.have.been.calledWith(/add day (\d{4}\/\d{2}\/\d{2}) (\d+)$/)


