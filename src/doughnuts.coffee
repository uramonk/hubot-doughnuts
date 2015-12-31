# Description
#   The doughnuts management bot.
#
# Dependencies:
#   "date-utils": "^1.2.17"
#
# Configuration:
#   NONE
#
# Commands:
#	hubot-doughnuts :doughnut: - add a doughnut
#	hubot-doughnuts add day YYYY/MM/DD NUM - add NUM doughnuts YYYY/MM/DD 
#	hubot-doughnuts clear today - clear doughnuts today
#	hubot-doughnuts clear all - clear all doughnuts
#	hubot-doughnuts clear day YYYY/MM/DD - clear doughnuts YYYY/MM/DD
#	hubot-doughnuts clear month YYYY/MM - clear doughnuts YYYY/MM
#	hubot-doughnuts clear year YYYY	- clear doughnuts YYYY
#	hubot-doughnuts count today - show doughnuts today
#	hubot-doughnuts count week - show doughnuts this week (from last Sunday to Today) 
#	hubot-doughnuts count total - show total doughnuts
#	hubot-doughnuts count day YYYY/MM/DD - show doughnuts YYYY/MM/DD
#	hubot-doughnuts count month YYYY/MM - show doughnuts YYYY/MM
#	hubot-doughnuts count year YYYY	- show doughnuts YYYY
#	hubot-doughnuts list - list all doughnuts
#	hubot-doughnuts list month YYYY/MM - list doughnuts YYYY/MM
#	hubot-doughnuts list year YYYY - list doughnuts YYYY
#
# Notes:
#	This bot's message is optimized for Slack.
#	For example:
#	user1>> hubot-doughnuts list
#	hubot>> ```
#	hubot>> 2014: :doughnut:x25
#	hubot>> 2015: :doughnut::doughnut:
#	hubot>> ```
#
# Author:
#   uramonk <https://github.com/uramonk>

require('date-utils');
counter = require('./func/counter')

module.exports = (robot) ->		
	robot.respond /:doughnut:/, (msg) ->
		counter.setFirstDay robot
		dc = msg.message.text.split(/:doughnut:/).length - 1;
		count = counter.addCountToday robot, dc
		msg.send 'Added doughnuts today: ' + dc
	
	robot.respond /add day (\d{4}\/\d{2}\/\d{2}) (\d+)$/, (msg) ->
		counter.setFirstSpecificDay robot, msg.match[1]
		date = new Date(msg.match[1])
		key = counter.getKey date
		addnum = Number(msg.match[2])
		count = counter.addCount robot, key, addnum
		dateString = date.toFormat 'YYYY/MM/DD'
		if addnum <= 0
			return
		else 
			msg.send 'Added doughnuts ' + dateString + ': ' + count