# Description
#   This file defines count commands.
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
	robot.respond /count today$/, (msg) ->
		count = counter.getCountToday robot
		msg.send "Count doughnuts today: #{count}"
	
	robot.respond /count week$/, (msg) ->
		count = counter.getCountWeekFromToday robot
		msg.send "Count doughnuts this week: #{count}"
		
	robot.respond /count total$/, (msg) ->
		count = counter.getCountTotal robot
		msg.send "Count total doughnuts: #{count}"
		
	robot.respond /count day (\d{4}\/\d{2}\/\d{2})$/, (msg) ->
		date = new Date(msg.match[1])
		key = counter.getKey date
		count = counter.getCount robot, key
		msg.send "Count doughnuts #{msg.match[1]}: #{count}"
	
	robot.respond /count month (\d{4}\/\d{2})$/, (msg) ->
		yearMonthString = msg.match[1].split '/'
		count = counter.getCountMonth robot, Number(yearMonthString[0]), Number(yearMonthString[1])
		msg.send "Count doughnuts #{msg.match[1]}: #{count}"
		
	robot.respond /count year (\d{4})$/, (msg) ->
		count = counter.getCountYear robot, Number(msg.match[1])
		msg.send "Count doughnuts #{msg.match[1]}: #{count}"
