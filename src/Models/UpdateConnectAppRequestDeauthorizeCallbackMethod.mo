
// UpdateConnectAppRequestDeauthorizeCallbackMethod.mo
/// The HTTP method to use when calling `deauthorize_callback_url`.
/// Enum values: #get, #post

module {
    // User-facing type: type-safe variants for application code
    public type UpdateConnectAppRequestDeauthorizeCallbackMethod = {
        #get;
        #post;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UpdateConnectAppRequestDeauthorizeCallbackMethod type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UpdateConnectAppRequestDeauthorizeCallbackMethod) : JSON =
            switch (value) {
                case (#get) "GET";
                case (#post) "POST";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UpdateConnectAppRequestDeauthorizeCallbackMethod =
            switch (json) {
                case "GET" ?#get;
                case "POST" ?#post;
                case _ null;
            };
    }
}
