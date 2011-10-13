package js.node;
import js.Node;

/**
 * ...
 * @author sledorze
 */

class JsHelper {

//	public static function requireAs<T>(name : String, cl : Class<T>) : T return
//		untyped js.Node.require(name)
		
	inline public static function ifNull<T>(alt : T, v : T) : T return
		v == null?alt:v
}