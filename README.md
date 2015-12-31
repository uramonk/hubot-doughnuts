# hubot-doughnuts

A hubot script that does doughnuts management.

See [`src/doughnuts.coffee`](src/doughnuts.coffee) for full documentation.

## Installation

In hubot project repo (Github), run:

`npm install --save uramonk/hubot-doughnuts`

Then add **hubot-doughnuts** to your `external-scripts.json`:

```json
[
  "hubot-doughnuts"
]
```

If you want to save all data, you should add **redis-brain.coffee** to your `hubot-scripts.json`

```json
[
  "redis-brain.coffee"
]
```

See also: https://github.com/github/hubot-scripts

## Sample Interaction

```
user1>> hubot-doughnuts :doughnut:
hubot>> Added doughnuts today: 1
```

## Notes

This bot's message is optimized for Slack.
For example:
```
user1>> hubot-doughnuts list
hubot>> ```
hubot>> 2014: :doughnut:x25
hubot>> 2015: :doughnut::doughnut:
hubot>> ```
```

