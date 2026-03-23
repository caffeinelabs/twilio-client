
// MessageEnumContentRetention.mo
/// Determines if the message content can be stored or redacted based on privacy settings
/// Enum values: #retain, #discard

module {
    // User-facing type: type-safe variants for application code
    public type MessageEnumContentRetention = {
        #retain;
        #discard;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessageEnumContentRetention type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessageEnumContentRetention) : JSON =
            switch (value) {
                case (#retain) "retain";
                case (#discard) "discard";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessageEnumContentRetention =
            switch (json) {
                case "retain" ?#retain;
                case "discard" ?#discard;
                case _ null;
            };
    }
}
