package js.node;

import js.Node;

import js.node.MongoDbConnection;
/**
 * Externs for mongodb natives
 * ...
 * @author sledorze
 */
typedef Document = Dynamic;
typedef Error = Null<Dynamic>;
typedef Admin = Dynamic;
typedef Cursor = Dynamic;
typedef Collection = Dynamic;
typedef DBRef = Dynamic;


@:native("Db")
extern
class Db {

  public function open(callBack : Dynamic -> Db -> Void) : Void;
  public function close() : Void;
  public function admin(callBack : Error -> Admin -> Void) : Void;


  @:overload(function () : Cursor {})
  @:overload(function (callBack : Error -> Cursor -> Void) : Void {})
  public function collectionsInfo(collection_name : String, callBack : Error -> Cursor -> Void) : Void;

  @:overload(function (callBack : Error -> Array<Document> -> Void) : Void {})
  public function collectionNames(collection_name : String, callBack : Error -> Array<Document> -> Void) : Void;

  public function collection(collectionName : String, callBack : Error -> Collection -> Void) : Void;
  public function collections(callBack : Error -> Array<Collection> -> Void) : Void;

  @:overload(function (code : Dynamic, callBack : Error -> String -> Void) : Void {})
  public function eval(code : Dynamic, parameters : Dynamic, callBack : Error -> String -> Void) : Void;

  public function dereference (dbRef : DBRef, callBack : Error -> Dynamic -> Void) : Void;

  public function authenticate (username : String, password : String, callBack : Error -> Bool -> Void) : Void;

  public function addUser (username : String, password : String, callBack : Error -> Dynamic -> Void) : Void;

  public function removeUser (username : String, callBack : Error -> Bool -> Void) : Void;

  public function logout (callBack : Error -> Dynamic -> Void) : Void;

  public function createCollection (collectionName : String, options : Dynamic, callBack : Error -> Collection -> Void) : Void;

  public function command (selector : String /*?*/, callBack : Error -> Dynamic -> Void /*?*/) : Void;

  public function dropCollection (collectionName : String, callBack : Error -> Bool -> Void) : Void;

  public function renameCollection (fromCollection : String, toCollection : String, callBack : Error -> Dynamic /*?*/ -> Void) : Void;

  public function lastError (callBack : Error -> Dynamic /*?*/ -> Void) : Void;
  public function error (callBack : Error -> Dynamic /*?*/ -> Void) : Void;

  public function lastStatus(callBack : Error -> Dynamic -> Void) : Void;

  public function previousErrors(callBack : Error -> Dynamic -> Void) : Void;

  public function executeDbCommand(command_hash : Dynamic, callBack : Error -> Dynamic -> Void) : Void;

  /**
    Resets the error history of the mongo instance
  **/
  public function resetErrorHistory(callBack : Error -> Dynamic -> Void) : Void;

  /**
    Create an index on a collection
  **/
  @:overload(function (collectionName : String, fieldOrSpec : Dynamic, callBack : Error -> String -> Void) {})
  public function createIndex (collectionName : String, fieldOrSpec : Dynamic, unique : Bool, callBack : Error -> String -> Void) : Void;

  /**
    Ensure index, create an index if it does not exist
  **/
  @:overload(function (collectionName : String, fieldOrSpec : Dynamic, callBack : Error -> String -> Void) {})
  public function ensureIndex (collectionName : String, fieldOrSpec : Dynamic, unique : Bool, callBack : Error -> String -> Void) : Void;

  /**
    Fetch the cursor information
  **/
  public function cursorInfo (callBack : Error -> Document -> Void) : Void;

  /**
    Drop Index on a collection
  **/
  public function dropIndex (collectionName : String, indexName : String, callBack : Error -> Bool -> Void) : Void;

  /**
    Index Information
  **/
  @:overload(function (callBack : Error -> Dynamic -> Void) {})
  public function indexInformation(collectionName : String, callBack : Error -> Dynamic -> Void) : Void;

  /**
    Database Drop Command
  **/
  public function dropDatabase (callBack : Error -> Bool -> Void) : Void;

  /**
    Execute db command
  **/
  public function executeCommand (db_command : Dynamic, callBack : Error -> Dynamic -> Void) : Void;

  public static function connect(?url : String, callBack : Error -> Db -> Void) : Void;


  /**
  * Checks for latest master by calling isMasterCommand on each server
  * of serverConfig
  * @param dbcopy{instance of db}
  *
  **/
  public function checkMaster_(dbcopy : Db, returnback : Error -> String -> Db) : Void;

	public function new(databaseName : String, serverConfig : Server, options : Dynamic):Void;

	private static function __init__() : Void untyped {
    var req = Node.require('mongodb');
	  Db = req.Db;
    connect = req.connect;
	}

  // from js.Node.NodeEventEmitter
  public function addListener(event:String,fn: NodeListener):Dynamic;
  public function on(event:String,fn:NodeListener):Dynamic;
  public function once(event:String,fn:NodeListener):Void;
  public function removeListener(event:String,listener:NodeListener):Void;
  public function removeAllListeners(event:String):Void;
  public function listeners(event:String):Array<NodeListener>;
  public function setMaxListeners(m:Int):Void;
  public function emit(event:String,?arg1:Dynamic,?arg2:Dynamic,?arg3:Dynamic):Void;
}
