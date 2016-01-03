chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'
expect = chai.expect

describe 'counter', ->
	beforeEach ->
		@msg = require('../../src/func/message')
		
	it 'addDoughnutToMessage', ->
		message = "test: "
		expect(@msg.addDoughnutToMessage message, 0).to.be.equal("test: \n")
		expect(@msg.addDoughnutToMessage message, 1).to.be.equal("test: :doughnut:\n")
		expect(@msg.addDoughnutToMessage message, 9).to.be.equal("test: :doughnut::doughnut::doughnut::doughnut::doughnut::doughnut::doughnut::doughnut::doughnut:\n")
		expect(@msg.addDoughnutToMessage message, 10).to.be.equal("test: :doughnut:x10\n")
		
	it 'addDoughnutToMessageWithPrefixAndSuffix', ->
		message = "test: "
		expect(@msg.addDoughnutToMessageWithPrefixAndSuffix message, 1, "prefix", "suffix").to.be.equal("test: prefix:doughnut:\nsuffix")
		