package js.node;

/**
 * ...
 * @author sledorze
 */

typedef FacebookClient = {
	function getSessionByAccessToken(access_token : Dynamic) : (FacebookSession -> Void) -> Void;
}

typedef FacebookSession = {
	function graphCall(path : String, ?params : Dynamic, ?method : String) : Dynamic -> Void;
	
	function restCall (method : String, ?params : Dynamic) : Dynamic -> Void;
	
	function getId() : Dynamic -> Void;
	
	function isValid() : Bool -> Void;
	
	function getMeta() : Dynamic -> Void;
	
	function retrieveAccessToken(code : String, redirect_uri : String) : Void -> Void;
	
	function injectAccessToken(access_token : String) : Void -> Void;
}