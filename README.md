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
user1          >> hubot-doughnuts :doughnut:
hubot-doughnuts>> Added doughnuts today: 1
```
