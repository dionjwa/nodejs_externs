package js.node;

import js.node.Connect;
import js.Node;
import js.node.EveryAuth;

/**
 * ...
 * @author sledorze
 */

typedef ExpressHttpServerReq = { > NodeHttpServerReq,
	var session : Session;
}

typedef ExpressHttpServerResp = { > NodeHttpServerResp,
	function render(name : String, params : Dynamic) : Void;
	function redirect(url : String) : Void;
}
 
 
typedef ExpressServer = {
	function use (?middlewareMountPoint :Dynamic, middleware :Dynamic) :ConnectServer;
	function get(path : String, f : ExpressHttpServerReq ->  ExpressHttpServerResp -> Void) : Void;

	@:overload(function(port :Int, ready : Void -> Void):Void { } )
	function listen (port :Int, ?address :String) :Void;
}


typedef Express = {

	function createServer (a1 :Dynamic, ?a2 :Dynamic, ?a3 :Dynamic, ?a4 :Dynamic, ?a5 :Dynamic, ?a6 :Dynamic, ?a7 :Dynamic, ?a8 :Dynamic, ?a9 :Dynamic) :ExpressServer;

	function cookieParser() :MiddleWare;
	function bodyParser() :MiddleWare;
	function session(params :Dynamic) :Void;
	function router(routes :Dynamic->Void) :Void;
	function Static (path :String, ?options :Dynamic) :MiddleWare; 
	function errorHandler (options :Dynamic) :MiddleWare;	

	function logger() : MiddleWare;
}

class ExpressExtensions {
	public static function static_(exp : Express, path : String, ?option : Dynamic) : MiddleWare {
		var x = exp;
		var p = path;
		var o = option;
		return untyped __js__("x.static(p, o)");
	}
}
