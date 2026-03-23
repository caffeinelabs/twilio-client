
// ApiV2010AccountSipSipDomainVoiceStatusCallbackMethod.mo
/// The HTTP method we use to call `voice_status_callback_url`. Either `GET` or `POST`.
/// Enum values: #get, #post

module {
    // User-facing type: type-safe variants for application code
    public type ApiV2010AccountSipSipDomainVoiceStatusCallbackMethod = {
        #get;
        #post;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountSipSipDomainVoiceStatusCallbackMethod type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountSipSipDomainVoiceStatusCallbackMethod) : JSON =
            switch (value) {
                case (#get) "GET";
                case (#post) "POST";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountSipSipDomainVoiceStatusCallbackMethod =
            switch (json) {
                case "GET" ?#get;
                case "POST" ?#post;
                case _ null;
            };
    }
}
