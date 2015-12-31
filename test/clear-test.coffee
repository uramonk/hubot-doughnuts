chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'clear', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../src/clear')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/clear today$/)
    expect(@robot.respond).to.have.been.calledWith(/clear all/)
    expect(@robot.respond).to.have.been.calledWith(/clear day (\d{4}\/\d{2}\/\d{2})$/)
    expect(@robot.respond).to.have.been.calledWith(/clear month (\d{4}\/\d{2})$/)
    expect(@robot.respond).to.have.been.calledWith(/clear year (\d{4})$/)