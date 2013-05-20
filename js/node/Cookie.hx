package js.node;

extern class Cookie {

	public function serialize( obj : Dynamic , ?options : {
		?path : String,
		?expires : Date,
		?maxAge : Int,
		?domain : String,
		?secure : Bool,
		?httpOnly : Bool
	} ) : String;
	
	public function parse( raw : String ) : Dynamic;

	public static inline function require() : Cookie return untyped __js__("require('cookie')")
	

}