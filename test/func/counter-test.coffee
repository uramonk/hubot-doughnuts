chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'
expect = chai.expect

require 'date-utils'
FIRST_DAY = "hubot-doughnuts-firstday"

describe 'counter', ->
  beforeEach ->
    @robot = 
      brain:
        get: sinon.stub().returns(null)
        set: sinon.stub().returns(null)
        save: sinon.stub().returns(null)
        remove: sinon.stub().returns(null)
    @counter = require('../../src/func/counter')

  it 'getKey', ->
    date = new Date
    expect(@counter.getKey date).to.be.equal('hubot-doughnuts-' + date.toFormat 'YYYYMMDD')
  
  it 'getFirstDay', ->
    @robot.brain.get = sinon.stub().returns(null)
    expect(@counter.getFirstDay @robot).to.be.equal(null)
    @robot.brain.get = sinon.stub().returns("2016/01/01")
    expect(@counter.getFirstDay @robot).to.be.equal("2016/01/01")
    
  it 'setFirstDay', ->
    date = new Date()
    formatted = date.toFormat 'YYYY/MM/DD'
    @counter.getFirstDay = sinon.stub().returns(null)
    expect(@counter.setFirstDay @robot).to.be.equal(@robot.brain.save)
    expect(@robot.brain.set).to.have.been.calledWith FIRST_DAY, formatted
    
  it 'setFirstDay not called', ->
    @counter.getFirstDay = sinon.stub().returns("2016/01/01")
    @counter.setFirstDay @robot
    expect(@robot.brain.set).to.not.have.been.called
    expect(@robot.brain.save).to.not.have.been.called
    
  it 'setFirstSpecificDay', ->
    date = new Date("2016/01/01")
    formatted = date.toFormat 'YYYY/MM/DD'
    @counter.getFirstDay = sinon.stub().returns(null)
    expect(@counter.setFirstSpecificDay @robot, "2016/01/01").to.be.equal(@robot.brain.save)
    expect(@robot.brain.set).to.have.been.calledWith FIRST_DAY, formatted
  
  it 'setFirstSpecificDay 2', ->
    date = new Date("2016/01/01")
    formatted = date.toFormat 'YYYY/MM/DD'
    @counter.getFirstDay = sinon.stub().returns("2016/02/01")
    expect(@counter.setFirstSpecificDay @robot, "2016/01/01").to.be.equal(@robot.brain.save)
    expect(@robot.brain.set).to.have.been.calledWith FIRST_DAY, formatted

  it 'getCount', ->
    date = new Date
    key = @counter.getKey date
    @robot.brain.get = sinon.stub().returns(null)
    expect(@counter.getCount @robot, key).to.be.equal(0)
    @robot.brain.get = sinon.stub().returns(10)
    expect(@counter.getCount @robot, key).to.be.equal(10)
  
  it 'getCountToday', ->
    @counter.getCount = sinon.stub().returns(0)
    expect(@counter.getCountToday @robot).to.be.equal(0)
    @counter.getCount = sinon.stub().returns(10)
    expect(@counter.getCountToday @robot).to.be.equal(10)
  
  it 'getCountYesterday', ->
    @counter.getCount = sinon.stub().returns(0)
    expect(@counter.getCountYesterday @robot).to.be.equal(0)
    @counter.getCount = sinon.stub().returns(10)
    expect(@counter.getCountYesterday @robot).to.be.equal(10)
  
  it 'getCountMonth', ->
    year = 2015
    month = 12
    @counter.getCount = sinon.stub().returns(0)
    expect(@counter.getCountMonth @robot, year, month).to.be.equal(0)
    @counter.getCount = sinon.stub().returns(1)
    expect(@counter.getCountMonth @robot, year, month).to.be.equal(31)
    month = 11
    expect(@counter.getCountMonth @robot, year, month).to.be.equal(30)
  
  it 'getCountYear', ->
    year = 2015
    @counter.getCountMonth = sinon.stub().returns(0)
    expect(@counter.getCountYear @robot, year).to.be.equal(0)
    @counter.getCountMonth = sinon.stub().returns(1)
    expect(@counter.getCountYear @robot, year).to.be.equal(12)
  
  it 'getCountTotal', ->
    @counter.getFirstDay = sinon.stub().returns(null)
    expect(@counter.getCountTotal @robot).to.be.equal(0)
    @counter.getFirstDay = sinon.stub().returns('2015/12/01')
    @counter.getCount = sinon.stub().returns(1)
    firstDay = new Date('2015/12/01')
    num = firstDay.getDaysBetween(new Date)
    expect(@counter.getCountTotal @robot).to.be.equal(num + 1)
    
  it 'getCountWeek', ->
    date = new Date
    @counter.getCount = sinon.stub().returns(0)
    expect(@counter.getCountWeek @robot, date).to.be.equal(0)
    date = new Date
    num = date.getDay() + 1
    @counter.getCount = sinon.stub().returns(1)
    expect(@counter.getCountWeek @robot, date).to.be.equal(num)
    
  it 'getCountWeekFromToday', ->
    @counter.getCountWeek = sinon.stub().returns(0)
    expect(@counter.getCountWeekFromToday @robot).to.be.equal(0)
    @counter.getCountWeek = sinon.stub().returns(10)
    expect(@counter.getCountWeekFromToday @robot).to.be.equal(10)
    
  it 'clearCount', ->
    date = new Date
    key = @counter.getKey date
    @robot.brain.get = sinon.stub().returns(null)
    expect(@counter.clearCount @robot, key).to.be.equal(null)
    @robot.brain.get = sinon.stub().returns(10)
    @counter.getCount = sinon.stub().returns(0)
    expect(@counter.clearCount @robot, key).to.be.equal(0)
    
  it 'clearCountToday', ->
    @counter.clearCount = sinon.stub().returns(null)
    expect(@counter.clearCountToday @robot).to.be.equal(null)
    @counter.clearCount = sinon.stub().returns(0)
    expect(@counter.clearCountToday @robot).to.be.equal(0)
    
  it 'clearCountMonth', ->
    year = 2015
    month = 12
    @counter.clearCount = sinon.stub().returns(0)
    expect(@counter.clearCountMonth @robot, year, month).to.be.equal(0)
    
  it 'clearCountYear', ->
    year = 2015
    @counter.clearCountMonth = sinon.stub().returns(0)
    expect(@counter.clearCountYear @robot, year).to.be.equal(0)
    
  it 'clearCountAll', ->
    @counter.getFirstDay = sinon.stub().returns(null)
    expect(@counter.clearCountAll @robot).to.be.equal(0)
    @counter.clearCount = sinon.stub().returns(0)
    @counter.getFirstDay = sinon.stub().returns('2015/12/01')
    expect(@counter.clearCountAll @robot).to.be.equal(0)
    
  it 'addCount', ->
    date = new Date
    key = @counter.getKey date
    addCount = 0
    @robot.brain.get = sinon.stub().returns(0)
    expect(@counter.addCount @robot, key, addCount).to.be.equal(0)
    addCount = -1
    expect(@counter.addCount @robot, key, addCount).to.be.equal(0)
    
  it 'addCountToday', ->
    @counter.addCount = sinon.stub().returns(10)
    addCount = 10
    expect(@counter.addCountToday @robot, addCount).to.be.equal(10)
  
  
  

    
  
    
    
    
    
    
    

    

    

    
    
    