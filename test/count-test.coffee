chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'count', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../src/count')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/count today$/)
    expect(@robot.respond).to.have.been.calledWith(/count week$/)
    expect(@robot.respond).to.have.been.calledWith(/count total$/)
    expect(@robot.respond).to.have.been.calledWith(/count day (\d{4}\/\d{2}\/\d{2})$/)
    expect(@robot.respond).to.have.been.calledWith(/count month (\d{4}\/\d{2})$/)
    expect(@robot.respond).to.have.been.calledWith(/count year (\d{4})$/)

