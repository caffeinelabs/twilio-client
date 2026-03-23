
// ConferenceEnumUpdateStatus.mo
/// Enum values: #completed

module {
    // User-facing type: type-safe variants for application code
    public type ConferenceEnumUpdateStatus = {
        #completed;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ConferenceEnumUpdateStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ConferenceEnumUpdateStatus) : JSON =
            switch (value) {
                case (#completed) "completed";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ConferenceEnumUpdateStatus =
            switch (json) {
                case "completed" ?#completed;
                case _ null;
            };
    }
}
