
// ApiV2010AccountTokenIceServersInner.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountTokenIceServersInner = {
        credential : ?Text;
        username : ?Text;
        url : ?Text;
        urls : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountTokenIceServersInner type
        public type JSON = {
            credential : ?Text;
            username : ?Text;
            url : ?Text;
            urls : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountTokenIceServersInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountTokenIceServersInner = ?json;
    }
}
