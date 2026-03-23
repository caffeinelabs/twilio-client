
// CreateUserDefinedMessageSubscriptionRequestMethod.mo
/// The HTTP method Twilio will use when requesting the above `Url`. Either `GET` or `POST`. Default is `POST`.
/// Enum values: #get, #post

module {
    // User-facing type: type-safe variants for application code
    public type CreateUserDefinedMessageSubscriptionRequestMethod = {
        #get;
        #post;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateUserDefinedMessageSubscriptionRequestMethod type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateUserDefinedMessageSubscriptionRequestMethod) : JSON =
            switch (value) {
                case (#get) "GET";
                case (#post) "POST";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateUserDefinedMessageSubscriptionRequestMethod =
            switch (json) {
                case "GET" ?#get;
                case "POST" ?#post;
                case _ null;
            };
    }
}
