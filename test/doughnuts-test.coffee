chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'doughnuts', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../src/doughnuts')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/:doughnut:/)
    expect(@robot.respond).to.have.been.calledWith(/add day (\d{4}\/\d{2}\/\d{2}) (\d+)$/)

