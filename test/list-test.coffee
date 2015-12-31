chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'list', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../src/list')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/list$/)
    expect(@robot.respond).to.have.been.calledWith(/list month (\d{4}\/\d{2})$/)
    expect(@robot.respond).to.have.been.calledWith(/list year (\d{4})$/)

