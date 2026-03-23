
// ApiV2010AccountShortCodeSmsFallbackMethod.mo
/// The HTTP method we use to call the `sms_fallback_url`. Can be: `GET` or `POST`.
/// Enum values: #get, #post

module {
    // User-facing type: type-safe variants for application code
    public type ApiV2010AccountShortCodeSmsFallbackMethod = {
        #get;
        #post;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountShortCodeSmsFallbackMethod type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountShortCodeSmsFallbackMethod) : JSON =
            switch (value) {
                case (#get) "GET";
                case (#post) "POST";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountShortCodeSmsFallbackMethod =
            switch (json) {
                case "GET" ?#get;
                case "POST" ?#post;
                case _ null;
            };
    }
}
