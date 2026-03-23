
// UpdateCallRecording408Response.mo

module {
    // User-facing type: what application code uses
    public type UpdateCallRecording408Response = {
        /// Twilio-specific error code
        code : ?Int;
        /// Error message
        message : ?Text;
        /// Link to Error Code References
        more_info : ?Text;
        /// HTTP response status code
        status : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UpdateCallRecording408Response type
        public type JSON = {
            code : ?Int;
            message : ?Text;
            more_info : ?Text;
            status : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UpdateCallRecording408Response) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UpdateCallRecording408Response = ?json;
    }
}
