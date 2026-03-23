
// UpdateIncomingPhoneNumberRequestSmsFallbackMethod.mo
/// The HTTP method that we should use to call `sms_fallback_url`. Can be: `GET` or `POST` and defaults to `POST`.
/// Enum values: #get, #post

module {
    // User-facing type: type-safe variants for application code
    public type UpdateIncomingPhoneNumberRequestSmsFallbackMethod = {
        #get;
        #post;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UpdateIncomingPhoneNumberRequestSmsFallbackMethod type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UpdateIncomingPhoneNumberRequestSmsFallbackMethod) : JSON =
            switch (value) {
                case (#get) "GET";
                case (#post) "POST";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UpdateIncomingPhoneNumberRequestSmsFallbackMethod =
            switch (json) {
                case "GET" ?#get;
                case "POST" ?#post;
                case _ null;
            };
    }
}
