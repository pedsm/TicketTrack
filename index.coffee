osmosis = require "osmosis"
conf = require "./config.json"
chalk = require 'chalk'
rainbow = require 'chalk-rainbow'
state = [{name:"you what fam", text:"you what"}]

console.log chalk.blue "Starting tracker for "
for word in conf.keywords
	console.log word

parse = (user,pass) ->
	tmp = []
	osmosis
		.get('https://m.facebook.com/groups/352110954925626/?view=group')
		.find('._55wo:last(9):first(8)')
		.config("concurrency","1")
		.set({name:"div>", desc:"span:skip(1)"})
		.data((data)->tmp.push data)
		.error(console.log)
		.log(console.log)
		.done((=>console.log tmp))
		# .done((=>checkState(tmp)))
checkState = (tmp) ->
	console.log tmp
	if tmp[1].name != state[1].name
		console.log "New post"
		state = tmp
		console.log state[0]
	# for post in state
	# 	words = post.desc.split " "
	# 	for word in words
	# 		for key in conf.keywords
	# 			if word == key
	# 				console.log chalk.rainbow('Found '+ key +" in post by: " + post.name)

# parse()
setInterval (-> parse()), 5000
