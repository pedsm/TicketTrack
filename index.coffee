osmosis = require "osmosis"
conf = require "./config.json"
state = []

console.log "Starting parser for " + conf.user

parse = (user,pass) ->
	tmp = []
	osmosis
		.get('https://m.facebook.com/groups/352110954925626/')
		.find('._55wo:last(9):first(8)')
		.set('articles')
		.data((data)->tmp.push data)
		.error(console.log)
		.log(console.log)
		.done((=>checkState(tmp)))
		# .done((=>console.log tmp))
checkState = (tmp) ->
	console.log tmp
	if JSON.stringify tmp != JSON.stringify state
		console.log "Something Changed"
		state = tmp
		console.log state



setInterval (-> parse()), 2000
