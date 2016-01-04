chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'
expect = chai.expect

describe 'counter', ->
	beforeEach ->
		@msg = require('../../src/func/message')
		
	it 'addDoughnutToMessage', ->
		message = "test: "
		expect(@msg.addDoughnutToMessage message, 0).to.be.equal("test: ")
		expect(@msg.addDoughnutToMessage message, 1).to.be.equal("test: x1")
		expect(@msg.addDoughnutToMessage message, 9).to.be.equal("test: x9")
		expect(@msg.addDoughnutToMessage message, 10).to.be.equal("test: x10")
		
	it 'addDoughnutToMessageWithPrefixAndSuffix', ->
		message = "test: "
		expect(@msg.addDoughnutToMessageWithPrefixAndSuffix message, 1, "prefix ", " suffix").to.be.equal("test: prefix x1 suffix")
		