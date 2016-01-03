# Description
#   This file defines clear commands.
#
# Dependencies:
#   "date-utils": "^1.2.17"
#
# Configuration:
#   NONE
#
# Author:
#   uramonk <https://github.com/uramonk>

require('date-utils');
counter = require('./func/counter')

module.exports = (robot) ->
	robot.respond /clear today$/, (msg) ->
		count = counter.clearCountToday robot
		msg.send 'Clear doughnuts count today'
	
	robot.respond /clear all/, (msg) ->
		firstday = counter.getFirstDay robot
		count = counter.clearCountAll robot
		date = new Date(firstday)
		dateString = date.toFormat 'YYYY/MM/DD'
		msg.send "Clear all doughnuts count from #{dateString}"
		
	robot.respond /clear day (\d{4}\/\d{2}\/\d{2})$/, (msg) ->
		date = new Date(msg.match[1])
		key = counter.getKey date
		count = counter.clearCount robot, key
		dateString = date.toFormat 'YYYY/MM/DD'
		msg.send "Clear doughnuts count #{dateString}"
	
	robot.respond /clear month (\d{4}\/\d{2})$/, (msg) ->
		yearMonthString = msg.match[1].split '/'
		count = counter.clearCountMonth robot, Number(yearMonthString[0]), Number(yearMonthString[1])
		date = new Date(msg.match[1])
		dateString = date.toFormat 'YYYY/MM'
		msg.send "Clear doughnuts count #{dateString}"
	
	robot.respond /clear year (\d{4})$/, (msg) ->
		count = counter.clearCountYear robot, Number(msg.match[1])
		date = new Date(msg.match[1])
		dateString = date.toFormat 'YYYY'
		msg.send "Clear doughnuts count #{dateString}"
	
