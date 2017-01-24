osmosis = require "osmosis"
conf = require "./config.json"

console.log "Starting parser for " + conf.user

parse = (user,pass) ->
	osmosis
        .get('https://www.facebook.com')
		.submit("#login_form", { "email":user, "pass": pass })
		.fail("#login_form")
		.get('https://www.facebook.com/groups/352110954925626/')
		.find("#fbProfileCover")
		.data(console.log)
		# .then((cont,data)=>console.log cont)
		.error(console.log)
		.log(console.log)

parse(conf.user,conf.pass)
