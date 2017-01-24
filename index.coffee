osmosis = require "osmosis"
conf = require "./config.json"
state = [{name:"you what fam"}]

console.log "Starting parser for " + conf.user

parse = (user,pass) ->
	tmp = []
	osmosis
		.get('https://m.facebook.com/groups/352110954925626/')
		.find('._55wo:last(9):first(8)')
		.set({name:"div>", text:"span:skip(1)"})
		.data((data)->tmp.push data)
		# .error(console.log)
		# .log(console.log)
		# .done((=>console.log tmp))
		.done((=>checkState(tmp)))
checkState = (tmp) ->
	if tmp[0].name != state[0].name
		console.log "Something Changed"
		state = tmp
		console.log state[0]

# parse()
setInterval (-> parse()), 3000
