
// MessagingV1Deactivation.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1Deactivation = {
        /// Returns an authenticated url that redirects to a file containing the deactivated numbers for the requested day. This url is valid for up to two minutes.
        redirect_to : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1Deactivation type
        public type JSON = {
            redirect_to : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1Deactivation) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1Deactivation = ?json;
    }
}
