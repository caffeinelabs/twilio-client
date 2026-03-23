
// ApiV2010AccountCallCallEvent.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountCallCallEvent = {
        /// Contains a dictionary representing the request of the call.
        request : ?Text;
        /// Contains a dictionary representing the call response, including a list of the call events.
        response : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountCallCallEvent type
        public type JSON = {
            request : ?Text;
            response : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountCallCallEvent) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountCallCallEvent = ?json;
    }
}
