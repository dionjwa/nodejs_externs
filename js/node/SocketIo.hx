package js.node;

/**
 * ...
 * @author sledorze
 */

typedef SocketIo = {
	function listen(?server : Dynamic, ?options : Dynamic, ?fn : Dynamic) : SocketIoManager;
}

typedef SocketNameSpace = {	
}

typedef SocketIoManager = {

	var store(default, null) : Dynamic;
	var log(default, null) : Dynamic;
	@:native("static") var static_(default, null) : Dynamic;

	function get(key : Dynamic) : Dynamic;
	function set(key : Dynamic, value : Dynamic) : SocketIoManager;
	function enable(key : Dynamic) : SocketIoManager;
	function disable(key : Dynamic) : SocketIoManager;

	function enabled(key : Dynamic) : Bool;
	function disabled(key : Dynamic) : Bool;

	@:overload(function(fn : Void -> Void):SocketIoManager {})
	@:overload(function(fn : SocketIoManager -> Void):SocketIoManager {})
	function configure(env : Dynamic, fn : SocketIoManager -> Void) : SocketIoManager;

	function of(nsp : Dynamic) : SocketNameSpace;
	
}


