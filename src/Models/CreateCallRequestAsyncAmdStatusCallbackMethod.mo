
// CreateCallRequestAsyncAmdStatusCallbackMethod.mo
/// The HTTP method we should use when calling the `async_amd_status_callback` URL. Can be: `GET` or `POST` and the default is `POST`.
/// Enum values: #get, #post

module {
    // User-facing type: type-safe variants for application code
    public type CreateCallRequestAsyncAmdStatusCallbackMethod = {
        #get;
        #post;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateCallRequestAsyncAmdStatusCallbackMethod type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateCallRequestAsyncAmdStatusCallbackMethod) : JSON =
            switch (value) {
                case (#get) "GET";
                case (#post) "POST";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateCallRequestAsyncAmdStatusCallbackMethod =
            switch (json) {
                case "GET" ?#get;
                case "POST" ?#post;
                case _ null;
            };
    }
}
