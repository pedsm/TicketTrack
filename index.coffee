osmosis = require "osmosis"
conf = require "./config.json"
chalk = require 'chalk'
rainbow = require 'chalk-rainbow'
request = require 'request'
parseString = require 'xml2js'
parseString = parseString.parseString
state = [{author:[{name:["you what fam"], text:"you what"}]}]

console.log chalk.blue "Starting tracker for "
for word in conf.keywords
	console.log word

parse = ->
	tmp = []
	xml = ""
	request('https://graph.facebook.com/352110954925626/feed?access_token=' + conf.token,((error,response,body)-> checkState (JSON.parse body)))

checkState = (tmp) ->
	console.log tmp.data
	# console.log data[0].from.name
	# if tmp[0].author[0].name[0] != state[0].author[0].name[0]
	# 	state = tmp
	# 	console.log "New post by " + state[0].author[0].name[0]
	# for post in state
	# 	words = post.desc.split " "
	# 	for word in words
	# 		for key in conf.keywords
	# 			if word == key
	# 				console.log chalk.rainbow('Found '+ key +" in post by: " + post.name)

parse()
# setInterval (-> parse()), 3000
