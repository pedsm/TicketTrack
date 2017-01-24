osmosis = require "osmosis"
conf = require "./config.json"

console.log "Starting parser for " + conf.user

parse = (user,pass) ->
	osmosis
		.get('https://www.facebook.com/groups/352110954925626/')
		.filter("div","/mall_post/")
		.data(console.log)
		.error(console.log)
		.log(console.log)

parse(conf.user,conf.pass)
