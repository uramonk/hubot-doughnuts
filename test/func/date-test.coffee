chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'
expect = chai.expect

require 'date-utils'

describe 'date', ->
  beforeEach ->
    @dateFunc = require('../../src/func/date')

  it 'getDaysInMonth', ->
    expect(@dateFunc.getDaysInMonth 2016, 1).to.be.equal(31)
    expect(@dateFunc.getDaysInMonth 2016, 2).to.be.equal(29)
    expect(@dateFunc.getDaysInMonth 2016, 3).to.be.equal(31)
    expect(@dateFunc.getDaysInMonth 2016, 4).to.be.equal(30)
    expect(@dateFunc.getDaysInMonth 2016, 5).to.be.equal(31)
    expect(@dateFunc.getDaysInMonth 2016, 6).to.be.equal(30)
    expect(@dateFunc.getDaysInMonth 2016, 7).to.be.equal(31)
    expect(@dateFunc.getDaysInMonth 2016, 8).to.be.equal(31)
    expect(@dateFunc.getDaysInMonth 2016, 9).to.be.equal(30)
    expect(@dateFunc.getDaysInMonth 2016, 10).to.be.equal(31)
    expect(@dateFunc.getDaysInMonth 2016, 11).to.be.equal(30)
    expect(@dateFunc.getDaysInMonth 2016, 12).to.be.equal(31)
    expect(@dateFunc.getDaysInMonth 2017, 2).to.be.equal(28)
