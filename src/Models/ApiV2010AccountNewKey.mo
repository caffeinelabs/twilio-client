
// ApiV2010AccountNewKey.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountNewKey = {
        /// The unique string that that we created to identify the NewKey resource. You will use this as the basic-auth `user` when authenticating to the API.
        sid : ?Text;
        /// The string that you assigned to describe the resource.
        friendly_name : ?Text;
        /// The date and time in GMT that the API Key was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the new API Key was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The secret your application uses to sign Access Tokens and to authenticate to the REST API (you will use this as the basic-auth `password`).  **Note that for security reasons, this field is ONLY returned when the API Key is first created.**
        secret : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountNewKey type
        public type JSON = {
            sid : ?Text;
            friendly_name : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            secret : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountNewKey) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountNewKey = ?json;
    }
}
