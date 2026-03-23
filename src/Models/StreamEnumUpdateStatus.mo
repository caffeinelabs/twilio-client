
// StreamEnumUpdateStatus.mo
/// Enum values: #stopped

module {
    // User-facing type: type-safe variants for application code
    public type StreamEnumUpdateStatus = {
        #stopped;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer StreamEnumUpdateStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : StreamEnumUpdateStatus) : JSON =
            switch (value) {
                case (#stopped) "stopped";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?StreamEnumUpdateStatus =
            switch (json) {
                case "stopped" ?#stopped;
                case _ null;
            };
    }
}
