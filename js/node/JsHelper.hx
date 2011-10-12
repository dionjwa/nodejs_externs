package js.node;
import js.Node;

/**
 * ...
 * @author sledorze
 */

class JsHelper {

	inline public static function new_ < T > (_x : T) : T {
		var x = _x;
		return untyped __js__("new x()");
	}
	
	public static function requireAs<T>(name : String, cl : Class<T>) : T return
		untyped js.Node.require(name)

	inline public static function ifNull<T>(alt : T, v : T) : T return
		v == null?alt:v
}