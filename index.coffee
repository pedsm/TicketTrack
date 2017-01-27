conf = require "./config.json"
chalk = require 'chalk'
rainbow = require 'chalk-rainbow'
request = require 'request'
state = data:[{from:{name:"you what fam", text:"you what"}}]

console.log chalk.blue "Starting tracker for "
for word in conf.keywords
	console.log word

parse = ->
	tmp = []
	xml = ""
	request('https://graph.facebook.com/352110954925626/feed?access_token=' + conf.token + "&fields=created_time, from, message",((error,response,body)-> checkState (JSON.parse body)))

checkState = (tmp) ->
	if tmp.data[0].from.name != state.data[0].from.name
		state = tmp
		console.log "New post by " + state.data[0].from.name
		post = state.data[0]
		words = post.message.split " "
		for word in words
			for key in conf.keywords
				if key == word
					console.log(rainbow('Found ' + word + ' in post by: '+post.from.name))
					console.log('Post: '+ post.message)

# parse()
setInterval (-> parse()), 3000
