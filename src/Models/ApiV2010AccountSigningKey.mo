
// ApiV2010AccountSigningKey.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountSigningKey = {
        sid : ?Text;
        friendly_name : ?Text;
        date_created : ?Text;
        date_updated : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountSigningKey type
        public type JSON = {
            sid : ?Text;
            friendly_name : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountSigningKey) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountSigningKey = ?json;
    }
}
