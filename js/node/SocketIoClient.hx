package js.node;

typedef NodeListener = Dynamic;

@:native("io")
extern
class Io {


  // details : Boolean 'force new connection'
  public static function connect(?host : String, ?details : Dynamic) : SocketNamespace;
  public static var version : String;
  public static var protocol : Int;
  public static var transports : Array<Dynamic>;


// en NODE à ajouter:
/*
     * Expose Transport
     *
     * @api public

    io.Transport = require('./transport').Transport;

     * Expose all transports
     *
     * @api public

    io.Transport.XHR = require('./transports/xhr').XHR;

     * Expose Socket
     *
     * @api public

    io.Socket = require('./socket').Socket;
*/
}

extern
class Socket {
  public static function Socket(options : Dynamic) : Void;

  public var connected : Bool;
  public var open : Bool;
  public var connecting : Bool;
  public var reconnecting : Bool;
  public var namespaces : Dynamic;
  public var buffer : Array<Dynamic>;
  public var doBuffer : Bool;


  public function of(name : String) : SocketNamespace;
  public function connect(?fn : Void -> Void) : Socket;
  public function packet(data : Dynamic) : Socket;
  public function disconnect() : Socket;

  // from js.Node.NodeEventEmitter
  function addListener(event:String,fn: NodeListener):Dynamic;
  function on(event:String,fn:NodeListener):Dynamic;
  function once(event:String,fn:NodeListener):Void;
  function removeListener(event:String,listener:NodeListener):Void;
  function removeAllListeners(event:String):Void;
  function listeners(event:String):Array<NodeListener>;
  function setMaxListeners(m:Int):Void;
  function emit(event:String,?arg1:Dynamic,?arg2:Dynamic,?arg3:Dynamic):Void;
}

extern
class SocketNamespace {

//  public static function SocketNamespace (socket : Dynamic, name : String) : Void;
  public function send(data : Dynamic, fn : Dynamic) : SocketNamespace;
  public function disconnect () : SocketNamespace;

  // from js.Node.NodeEventEmitter
  function addListener(event:String,fn:NodeListener):Dynamic;
  function on(event:String,fn:NodeListener):Dynamic;
  function once(event:String,fn:NodeListener):Void;
  function removeListener(event:String,listener:NodeListener):Void;
  function removeAllListeners(event:String):Void;
  function listeners(event:String):Array<NodeListener>;
  function setMaxListeners(m:Int):Void;

	@:overload(function(name : String) : SocketNamespace{ } )
  function emit(event:String,?arg1:Dynamic,?arg2:Dynamic,?arg3:Dynamic):Void;
}

extern
class Flag {
  public function send() : Void;
  public function emit() : Void;
}
