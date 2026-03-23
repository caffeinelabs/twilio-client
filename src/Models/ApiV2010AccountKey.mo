
// ApiV2010AccountKey.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountKey = {
        /// The unique string that that we created to identify the Key resource.
        sid : ?Text;
        /// The string that you assigned to describe the resource.
        friendly_name : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountKey type
        public type JSON = {
            sid : ?Text;
            friendly_name : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountKey) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountKey = ?json;
    }
}
