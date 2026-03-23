
// AuthorizedConnectAppEnumPermission.mo
/// The set of permissions that you authorized for the Connect App.  Can be: `get-all` or `post-all`.
/// Enum values: #get_all, #post_all

module {
    // User-facing type: type-safe variants for application code
    public type AuthorizedConnectAppEnumPermission = {
        #get_all;
        #post_all;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer AuthorizedConnectAppEnumPermission type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : AuthorizedConnectAppEnumPermission) : JSON =
            switch (value) {
                case (#get_all) "get-all";
                case (#post_all) "post-all";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?AuthorizedConnectAppEnumPermission =
            switch (json) {
                case "get-all" ?#get_all;
                case "post-all" ?#post_all;
                case _ null;
            };
    }
}
