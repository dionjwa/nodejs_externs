package js.node;

/**
 * Externs for mongodb natives
 * ...
 * @author sledorze
 */
typedef Document = Dynamic;

typedef Error = Null<Dynamic>;

@:native("Db")
extern
class Db {

  public function open(callBack : Dynamic -> Db -> Void) : Void;
  public function close() : Void;
  public function admin(callback : Error -> Admin -> Void) : Void;


  @:overload(function () : Cursor {});
  @:overload(function (callback : Error -> Cursor -> Void) : Void {});
  public function collectionsInfo(collection_name : String, callback : Error -> Cursor -> Void) : Void;

  @:overload(function (callback : Error -> Array<Document> -> Void) : Void {});
  public function collectionNames(collection_name : String, callback : Error -> Array<Document> -> Void) : Void;

  public function collection(collectionName : String, callback : Error -> Collection -> Void) : Void;
  public function collections(callback : Error -> Array<Collection> -> Void) : Void;

  @:overload(function (code : Dynamic, callback : Error -> String -> Void) : Void {});
  public function eval(code : Dynamic, parameters : Dynamic, callback : Error -> String -> Void) : Void;

  public function dereference (dbRef : DBRef, callback : Error -> Dynamic -> Void) : Void;

  public function authenticate (username : String, password : String, callback : Error -> Bool -> Void) : Void;

  public function addUser (username : String, password : String, callback : Error -> Dynamic -> Void) : Void;

  public function removeUser (username : String, callback : Error -> Bool -> Void) : Void;

  public function logout (callback : Error -> Dynamic -> Void) : Void;

  public function createCollection (collectionName : String, options : Dynamic, callback : Error -> Collection -> Void) : Void;

  public function command (selector : String /*?*/, callback : Error -> Dynamic -> Void /*?*/) : Void;

  public function dropCollection (collectionName : String, callback : Error -> Bool -> Void) : Void;

  public function renameCollection (fromCollection : String, toCollection : String, callback : Error -> Dynamic /*?*/ -> Void) : Void;

  public function lastError (callback : Error -> Dynamic /*?*/ -> Void) : Void;
  public function error (callback : Error -> Dynamic /*?*/ -> Void) : Void;

  public function lastStatus(callback : Error -> Dynamic -> Void) : Void;

  public function previousErrors(callback : Error -> Dynamic -> Void) : Void;

  public function executeDbCommand(command_hash : Dynamic, callback : Error -> Dynamic -> Void) : Void;

  /**
    Resets the error history of the mongo instance
  **/
  public function resetErrorHistory(callback : Error -> Dynamic -> Void) : Void;

  /**
    Create an index on a collection
  **/
  @:overload(function (collectionName : String, fieldOrSpec : Dynamic, callback : Error -> String -> Void) {});
  public function createIndex (collectionName : String, fieldOrSpec : Dynamic, unique : Bool, callback : Error -> String -> Void) : Void;

  /**
    Ensure index, create an index if it does not exist
  **/
  @:overload(function (collectionName : String, fieldOrSpec : Dynamic, callback : Error -> String -> Void) {});
  public function ensureIndex (collectionName : String, fieldOrSpec : Dynamic, unique : Bool, callback : Error -> String -> Void) : Void;

  /**
    Fetch the cursor information
  **/
  public function cursorInfo (callback : Error -> Document -> Void) : Void;

  /**
    Drop Index on a collection
  **/
  public function dropIndex (collectionName : String, indexName : String, callback : Error -> Bool -> Void) : Void;

  /**
    Index Information
  **/
  @:overload(function (callback : Error -> Dynamic -> Void) {});
  public function indexInformation(collectionName : String, callback : Error -> Dynamic -> Void) : Void;

  /**
    Database Drop Command
  **/
  public function dropDatabase (callback : Error -> Bool -> Void) : Void;

  /**
    Execute db command
  **/
  public function executeCommand (db_command : Dynamic, callback : Error -> Dynamic -> Void) : Void;

  public static function connect(?url : String, callback : Error -> Db -> Void) : Void;


  /**
  * Checks for latest master by calling isMasterCommand on each server
  * of serverConfig
  * @param dbcopy{instance of db}
  *
  **/
  public function checkMaster_(dbcopy : Db, returnback : Error -> String -> Db) : Void;

	public function new(databaseName : String, serverConfig : Server, options : Dynamic):Void;

	private static function __init__() : Void untyped {
	  Db = Node.require('mongodb').Db;
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
