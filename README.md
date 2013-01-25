# Node.js externs for HaXe

Repository for the [haxelib node_externs](http://lib.haxe.org/p/nodejs_externs)

Creating externs to use external modules in Node.js with HaXe often means writing one .hx file with a bunch of typedefs.  I don't think it's worth creating separate haxelibs or repositories for each module extern, so this repository is a collection point.

So far there are externs for:

	connect
	everyauth
	forever
	v8profiler
	node-mime
	node-user-agent
	express
	facebook-client
	node-uuid
	socket-io
	socket-io-client
	mongodb
	pubnub
	websocket
	
Note that none of these externs are complete, in that the typedefs don't necessarily define every single variable and function.  They define enough to be useful.  Feel free to contribute additions and improvements. 
